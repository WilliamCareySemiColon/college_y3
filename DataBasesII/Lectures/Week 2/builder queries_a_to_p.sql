/*Query a(a)	Get the stock codes and descriptions of all stock items that are selling at a loss.
a.	Unit price > unitCostPrice*/
Select '(a)	Get the stock codes and descriptions of all stock items that are selling at a loss.' a from dual;
select stock_code, stock_description from stock
where unit_price > unitcostprice;
---
/*(b)	Get the stock codes and descriptions of all stock items that need to be reordered.
*/
--
Select '(b)	Get the stock codes and descriptions of all stock items that need to be reordered.' b from dual;
select stock_code, stock_description from stock
where stock_level < reorder_level;
--
/*(c)	List the names of all customers who have no orders.
*/
Select '(c)	List the names of all customers who have no orders' c from dual;
select customer_name from customer where customer_id not in
(select customer_id from corder);
--or--
select customer_name from customer left join corder using (customer_id)
where corderno is null;
/*(d)	Get the description of any stock item that Mary Martin bought.*/
Select '(d)	Get the description of any stock item that John Flaherty bought.' d from dual;
select distinct stock_description
from stock
join corderline using (stock_code)
join corder using (corderno)
join customer using (customer_id)
where customer_name like 'John Flaherty%';
/*
(e)	Get the Supplier name of any supplier who didn’t supply any stock.*/
Select '(e)	Get the Supplier name of any supplier who didn’t supply any stock.' e from dual;
select supplier_name from supplier
where supplier_id not in
(select supplier_id from stock);
/*
(f)	Get the customer_name for customers who bought stock code A101 or A111.
*/
Select '(f)	Get the customer_name for customers who bought stock code A101 or A111.' f from dual;
select customer_name from customer where customer_id in  
(select customer_id from corder
join corderline using (corderno)
where stock_code in ('A101','A111'));
--select customer_name from customer;
/*(g)	Get the names of all staff members who took payment from Mary Martin.
*/
Select '(g)	Get the names of all staff members who took payment from Mary Martin.' g from dual;
select staff_name from staff where staff_no in
(select staffpaid from corder
join customer using (customer_id)
where customer_name like 'Mary Martin%');
/*(h)	Get the names of all staff members who issued goods supplied by Buckleys.*/
Select '(h)	Get the names of all staff members who issued goods supplied by Buckleys' h from dual;
select staff_name from staff
where staff_no in
(select staffissued
from corder 
join corderline using (corderno)
join stock using (stock_code)
join supplier using (supplier_id)
where supplier_name like 'Buckleys%');
/*
(i)	Get the customer_id for customers who bought A101 and A111.
*/
Select '(i)	Get the customer_id for customers who bought A101 and A111.' i from dual;
SELECT customer_name
FROM customer
WHERE customer_id IN
  (SELECT customer_id
  FROM corder
  JOIN corderline USING (corderno)
  WHERE stock_code = 'A101'
INTERSECT
  SELECT customer_id
  FROM corder
  JOIN corderline USING (corderno)
  WHERE stock_code = 'A111'
  );
/*(j)	List the supplier_id and supplierorderno for all orders that were delivered late (5 days) or not at all.
*/Select '(j)	List the supplier_id and supplierorderno for all orders that were delivered late (5 days) or not at all.' j from dual;

select supplier_id, sorderno from sorder where (delivereddate > sorderdate + 5) or delivereddate is null;
I