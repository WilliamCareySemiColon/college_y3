--lab work done on the 27/09/18

--Q1 Create a view called Clienthas that will hold the clientid
--clientname and accnum for each client, regardless of whether or 
--not they have an account. 
--The client name should be a concatenation of ctitle, cfname and 
--clname
CREATE OR REPLACE VIEW CLIENTHAS AS
SELECT clientid, 
CONCAT(ctitle,CONCAT(CONCAT(' ',cfname),CONCAT(' ',clname))) AS clientname,
accno
FROM CLIENT
RIGHT OUTER JOIN HASACCOUNT USING(clientid);

--Q2 write a query to return every clients name and the number of 
--accounts they hold
SELECT clientname, COUNT(accno) FROM CLIENTHAS
GROUP BY clientname;

--Q3 write a query to return the clientname of any client with a
--joint account
SELECT clientname FROM CLIENTHAS
WHERE accno =
(
   SELECT accno FROM HASACCOUNT 
   GROUP BY accno HAVING COUNT(*) > 1
);

--Q4 using views to help you write queries to return the 
--names of the clients
--a) who have a deposit account or current account
CREATE OR REPLACE VIEW CLIENTHASACC AS
SELECT 
CONCAT(ctitle,CONCAT(CONCAT(' ',cfname),CONCAT(' ',clname))) AS clientname
FROM HASACCOUNT
INNER JOIN CLIENT USING(clientid)
RIGHT OUTER JOIN (
    SELECT actype, accno FROM ACCOUNT
    INNER JOIN ACCOUNTTYPE USING (actype)
    WHERE acctypedesc LIKE '%deposit%' OR acctypedesc LIKE '%current%'
) ACCOUNTS USING (accno);

SELECT * FROM CLIENTHASACC;

--b) have both deposit AND current account
CREATE OR REPLACE VIEW CLIENTHASTWOACC AS
SELECT 
CONCAT(ctitle,CONCAT(CONCAT(' ',cfname),CONCAT(' ',clname))) AS clientname
FROM HASACCOUNT
INNER JOIN CLIENT USING(clientid)
RIGHT OUTER JOIN (
    SELECT actype, accno FROM ACCOUNT
    INNER JOIN ACCOUNTTYPE USING (actype)
    WHERE acctypedesc LIKE '%deposit%'
) ACCOUNTS USING (accno)
INTERSECT
SELECT 
CONCAT(ctitle,CONCAT(CONCAT(' ',cfname),CONCAT(' ',clname))) AS clientname
FROM HASACCOUNT
INNER JOIN CLIENT USING(clientid)
RIGHT OUTER JOIN (
    SELECT actype, accno FROM ACCOUNT
    INNER JOIN ACCOUNTTYPE USING (actype)
    WHERE acctypedesc LIKE '%Current%'
) ACCOUNTS USING (accno);

SELECT * FROM CLIENTHASTWOACC;

--c have a deposit account but not a current account
CREATE OR REPLACE VIEW CLIENTHASNOCURACC AS
SELECT 
CONCAT(ctitle,CONCAT(CONCAT(' ',cfname),CONCAT(' ',clname))) AS clientname
FROM HASACCOUNT
INNER JOIN CLIENT USING(clientid)
RIGHT OUTER JOIN (
    SELECT actype, accno FROM ACCOUNT
    INNER JOIN ACCOUNTTYPE USING (actype)
    WHERE acctypedesc LIKE '%deposit%'
) ACCOUNTS USING (accno)
INTERSECT
SELECT 
CONCAT(ctitle,CONCAT(CONCAT(' ',cfname),CONCAT(' ',clname))) AS clientname
FROM HASACCOUNT
INNER JOIN CLIENT USING(clientid)
RIGHT OUTER JOIN (
    SELECT actype, accno FROM ACCOUNT
    INNER JOIN ACCOUNTTYPE USING (actype)
    WHERE acctypedesc NOT LIKE '%Current%'
) ACCOUNTS USING (accno);

SELECT * FROM CLIENTHASNOCURACC;

--D) HAVE a current account but no deposit acc
CREATE OR REPLACE VIEW CLIENTHASNODEPACC AS
SELECT 
CONCAT(ctitle,CONCAT(CONCAT(' ',cfname),CONCAT(' ',clname))) AS clientname
FROM HASACCOUNT
INNER JOIN CLIENT USING(clientid)
RIGHT OUTER JOIN (
    SELECT actype, accno FROM ACCOUNT
    INNER JOIN ACCOUNTTYPE USING (actype)
    WHERE acctypedesc NOT LIKE '%deposit%'
) ACCOUNTS USING (accno)
INTERSECT
SELECT 
CONCAT(ctitle,CONCAT(CONCAT(' ',cfname),CONCAT(' ',clname))) AS clientname
FROM HASACCOUNT
INNER JOIN CLIENT USING(clientid)
RIGHT OUTER JOIN (
    SELECT actype, accno FROM ACCOUNT
    INNER JOIN ACCOUNTTYPE USING (actype)
    WHERE acctypedesc LIKE '%Current%'
) ACCOUNTS USING (accno);

SELECT * FROM CLIENTHASNODEPACC;

--e has one or the other but no both


SELECT * from hasaccount
inner join client using (clientid)
inner join (
    select * from account 
    inner join accounttype using (actype)
    )accounts using (accno);