-- set echo on
---- 2.3 (a) Get the names of parts that cost less than 20.00.
-- OK
 select pname 
 from   tennis.parts 
 where  price < 20.00; 
-- 
-- 2.3 (b) Get the names and cities of employees who have taken 
--         orders for parts costing more than 20.00. 
-- OK 
select distinct e.ename,z.city 
from   tennis.zipcodes z 
JOIN tennis.employees e ON e.zip = z.zip
JOIN tennis.orders o USING (eno)
JOIN tennis.odetails od USING (ono)
JOIN tennis.parts p USING (pno)
where p.price > 20.00; 
-- 
-- 2.3 (c) Get the pairs of customer number values of customers who 
--         have the same zip code 
-- OK 
select c1.cno, c2.cno 
from tennis.customers c1 
JOIN tennis.customers c2 using (zip)
where  c1.cno < c2.cno; 
-- 
-- 2.3 (d) Get the names of customers who have ordered parts from 
--         employees living in Wichita. 
-- OK 
select distinct c.cname from   
tennis.customers c
JOIN tennis.orders o USING (cno)
JOIN tennis.employees e USING (eno)
JOIN tennis.zipcodes z ON (e.zip = z.zip)
where z.city = 'Wichita'; 
-- 
-- 2.3 (e) Get the names of customers who have ordered parts ONLY 
--         from employees living in Wichita. 
--MY 2.3(E) 
select distinct c.cname from   
tennis.customers c  
JOIN tennis.orders o USING (CNO) 
JOIN tennis.employees e USING (ENO) 
JOIN tennis.zipcodes z ON e.zip = z.zip
       where  z.city = 'Wichita'
       MINUS  (  
       select distinct c.cname  
       from   tennis.customers c
       JOIN tennis.orders o USING (CNO)
       JOIN tennis.employees e USING (ENO)
       JOIN tennis.zipcodes z ON e.zip = z.zip
       where  z.city <> 'Wichita');
--
-- select distinct cname from
   tennis.customers
JOIN   tennis.orders USING (cno)
where  customers.cno not in
           (select o.cno
            from   tennis.orders o
            JOIN tennis.employees e USING (ENO)
            JOIN TENNIS.zipcodes z ON (E.ZIP = Z.ZIP)
            where z.city <> 'Wichita');
-- 
-- 2.3 (f) Get the names of customers who have ordered ALL parts 
--         costing less than 20.00. 
-- OK 
select c.cname from
   tennis.customers c 
where  not exists (
          select pno
          from   tennis.parts p
          where  p.price < 20.00 and
                 not exists (
                    select *
                    from   tennis.orders o, tennis.odetails od
                    where  o.ono = od.ono and
                           o.cno = c.cno and
                           od.pno = p.pno)); 
-- 
-- 2.3 (g) Get the names of employees along with their total sales 
--         for the year 2095 (consider only orders shipped in 2095). 
-- OK
--
select distinct e.ename, sum(p.price*od.qty) TOTAL_SALES 
from   tennis.employees e
join tennis.orders o using (eno)
join tennis.odetails od using (ono)
join tennis.parts p using (pno)
 where to_char(shipped,'YYYY') = '2095'
 group by e.eno, e.ename; 
-- 
-- 2.3 (h) Get the numbers and names of customers who have never 
--         made a sale to a customer living in the same zipcode  
--         as the employee 
-- OK 
select eno,ename from
   tennis.employees where eno not in (
          select e.eno
          from   tennis.employees e, orders o, customers c
          where  e.zip = c.zip and
                 e.eno = o.eno and
                 c.cno = o.cno); 
-- 
-- 2.3 (i) Get the names of customers who have placed the highest 
--         number of orders
-- 
select cname from
   tennis.customers c
   join  tennis.orders o 
   group by c.cno,cname 
   having count(o.ono) >=all (
		   	select count(ono)
              from   tennis.orders
              group by cno); 
-- 
-- 2.3 (j) Get the names of customers who have placed the most 
--         expensive orders. 
-- OK 
--
select c.cname 
from tennis.customers c
join tennis.orders o using (cno)
join tennis.odetails od using (ono)
join tennis.parts p using (pno)
group by o.ono, c.cno, c.cname 
having sum(p.price*od.qty) >=all (
              select sum(p1.price*od1.qty)
              from   tennis.odetails od1
              join tennis.parts p1 using (pno)
              group by od1.ono); 
-- 
-- 2.3 (k) Get the names of parts that have been ordered 
--         the most (in terms of quantity ordered and not  
--         number of orders). 
-- OK 
select p.pname from
   tennis.parts p, tennis.odetails od 
where  p.pno = od.pno 
group by p.pno, p.pname 
having sum(od.qty) >=all (select sum(od1.qty)
                           from   tennis.parts p1, tennis.odetails od1
                           where  p1.pno = od1.pno
                           group by p1.pno); 
-- 
-- 2.3 (l) Get the names of parts along with the number of orders 
--         they appear in, sorted in decreasing order of the 
--         number of orders 
-- OK 
select p.pname, count(o.ono) total from
   tennis.orders o, tennis.odetails od, tennis.parts p where  o.ono = od.ono and
        od.pno = p.pno group by od.pno, p.pname order by total desc; 
-- 
-- 2.3 (m) Get the average waiting time for all orders in number of 
--         days. The waiting time for an order is defined as the  
--         difference between the shipped date and the received date.  
--         Note: the dates should be truncated to 12:00 AM so that the  
--         difference is always a whole number of days. 
--         DO NOT consider any orders that are not yet shipped. 
--        
-- OK 
select avg(trunc(shipped)-trunc(received)) WAITING_TIME from
   tennis.orders where  shipped is not null; 
-- 
-- 2.3 (n) Get the names of customers who had to wait the longest for 
--         their orders to be shipped. 
--         DO NOT consider any orders that are not yet shipped. 
--         It would be interesting to consider to consider such orders though! 
-- OK 
select cname from
   tennis.customers c, tennis.orders o 
where  c.cno = o.cno and
        shipped is not null and
         trunc(shipped) - trunc(received) >=all
            (select trunc(shipped)-trunc(received)
             from   orders
             where  shipped is not null); 
-- 
-- 2.3 (o) For all orders more than $100.00, get the order number and 
--         the waiting time for the order. 
--         DO NOT consider any orders that are not yet shipped. 
--         It would be interesting to consider to consider such orders though! 
-- OK 

select ono, trunc(shipped)-trunc(received) WAITING_TIME from
   tennis.orders 
where  shipped is not null and
        ono in (select o.ono
                from   tennis.orders o, tennis.odetails od, tennis.parts p
                where  o.ono = od.ono and
                       od.pno = p.pno
                group by o.ono
                having sum(od.qty*p.price) > 100.00); 
--