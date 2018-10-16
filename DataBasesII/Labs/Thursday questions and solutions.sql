/*1.	Finish any queries that you did not complete last week.
*/
/*2.	Write a query to show each client’s name and the total sum of deposits (txtype = ‘D’) that have been made into any of their accounts. (Hint:  The first line is Sally   Greene  500)
*/
select cfname||' '||clname clientname, sum(txamount)
from client
join hasaccount using (clientid)
join transaction using (accno)
where txtype = 'D'
group by cfname, clname;
/*3.	Write a query to return a list of clients into whose account a deposit has been made (i.e. a transaction with txtype = ‘D’).
*/
create or replace view savers as (
select distinct cfname||' '||clname clientname
from client join hasaccount using (clientid)
join transaction using (accno)
where txtype = 'D');
select * from savers;
/*4.	Write a query to return a list of clients from whose account a withdrawal has been made (i.e. a transaction with txtype  = ‘W’).
*/
create or replace view spenders as (
select distinct cfname||' '||clname clientname
from client join hasaccount using (clientid)
join transaction using (accno)
where txtype = 'W');
select * from spenders;
/*5.	Write a query to list the clients who have had deposits made, but no withdrawals.
*/
select * from savers
minus
select * from spenders;
/*6.	To write a query to return a list of client names who hold every type 
of deposit account, using the relational divide.*/

create or replace view depaccounttype as (
select actype from accounttype where lower(acctypedesc) like '%deposit%' );
select * from depaccounttype;

create or replace view accountheld as (
select clientid, actype from hasaccount
join account using (accno));

select * from accountheld;

select ctitle||' '||cfname||' '||clname
from client A where not exists (
select * from depaccounttype B where not exists (
select * from accountheld X where (
X.clientid = A.clientid and
X.actype = B.actype)));

