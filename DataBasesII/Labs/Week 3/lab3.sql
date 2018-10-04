--1. Finish any queries that you did not complete last week.

--test to get every info nesscary
CREATE OR REPLACE VIEW CLIENTACCOUNT AS
SELECT * FROM HASACCOUNT 
FULL JOIN CLIENT USING (clientid);

CREATE OR REPLACE VIEW ACCOUNTST AS 
SELECT * FROM ACCOUNT
FULL JOIN ACCOUNTTYPE USING (actype)
FULL JOIN TRANSACTION USING (accno);

SELECT * FROM CLIENTACCOUNT
INNER JOIN ACCOUNTST USING (accno);

SELECT ctitle || ' ' || cfname || ' ' || clname CLIENTBIGNAME,
ACCTYPEDESC, txtype
FROM CLIENTACCOUNT
INNER JOIN ACCOUNTST USING (accno);
--2. Write a query to show each client’s name and the total 
--sum of deposits (txtype = ‘D’) that have been made into any 
--of their accounts. (Hint: The first line is Sally Greene 500)
CREATE OR REPLACE VIEW CLIENTDEPOSIT AS
SELECT ctitle || ' ' || cfname || ' ' || clname CLIENTBIGNAME,
--SUM(txamount) 
txamount FROM CLIENTACCOUNT
INNER JOIN ACCOUNTST USING (accno)
WHERE txtype LIKE 'D';

SELECT CLIENTBIGNAME, SUM(txamount) FROM CLIENTDEPOSIT
GROUP BY CLIENTBIGNAME, txamount;

--3. Write a query to return a list of clients into whose 
--account a deposit has been made (i.e. a transaction with 
--txtype = ‘D’).
CREATE OR REPLACE VIEW CLIENTACCDEPOSITED AS
SELECT ctitle || ' ' || cfname || ' ' || clname CLIENTBIGNAME,
clientid , accno FROM CLIENTACCOUNT
INNER JOIN ACCOUNTST USING (accno)
WHERE txtype LIKE 'D';

SELECT CLIENTBIGNAME FROM CLIENTACCDEPOSITED
GROUP BY CLIENTBIGNAME, clientid;
--4. Write a query to return a list of clients from whose 
--account a withdrawal has been made (i.e. a transaction with 
--txtype = ‘W’).
CREATE OR REPLACE VIEW CLIENTACCWITHDRAWN AS
SELECT ctitle || ' ' || cfname || ' ' || clname CLIENTBIGNAME,
clientid , accno FROM CLIENTACCOUNT
INNER JOIN ACCOUNTST USING (accno)
WHERE txtype LIKE 'W';

SELECT CLIENTBIGNAME FROM CLIENTACCWITHDRAWN
GROUP BY CLIENTBIGNAME, clientid;

--5. Write a query to list the clients who have had deposits made,
--but no withdrawals.
CREATE OR REPLACE VIEW CLIENTACCDEPOSITEDONLY AS
SELECT ctitle || ' ' || cfname || ' ' || clname CLIENTBIGNAME,
clientid , accno FROM CLIENTACCOUNT
INNER JOIN ACCOUNTST USING (accno)
WHERE txtype LIKE 'D'
MINUS
SELECT ctitle || ' ' || cfname || ' ' || clname CLIENTBIGNAME,
clientid , accno FROM CLIENTACCOUNT
INNER JOIN ACCOUNTST USING (accno)
WHERE txtype LIKE 'W';

SELECT CLIENTBIGNAME FROM CLIENTACCDEPOSITEDONLY
GROUP BY CLIENTBIGNAME, clientid;

--6. To write a query to return a list of client names who hold 
--every type of deposit account, using the relational divide.

--return the list of the names of the clients who 
--do not have any tyope of non-deposit accounts
create or replace view depositaccount as 
select actype from accounttype where acctypedesc like lower('%deposit%');

select * from depositaccount;

create or replace view hasdefaccount as 
select actype, clientid from hasaccount 
inner join account using (accno);

select * from hasdefaccount;

CREATE OR REPLACE VIEW ACCOUNTHASTYPE AS 
SELECT * FROM ACCOUNTTYPE
INNER JOIN ACCOUNT USING (actype)
WHERE acctypedesc LIKE lower('%deposit%');

SELECT * FROM accounthastype;

CREATE OR REPLACE VIEW CLIENTHASACCOUNT AS
SELECT * FROM HASACCOUNT
INNER JOIN CLIENT USING (clientid);

SELECT * FROM CLIENTHASACCOUNT;

create or replace view depositaccount as 
select actype from accounttype where acctypedesc like lower('%deposit%');

select * from depositaccount;

create or replace view hasdefaccount as 
select actype, clientid from hasaccount 
full join account using (accno);

select * from hasdefaccount;

SELECT ctitle || ' ' || cfname || ' ' || clname CLIENTBIGNAME
FROM CLIENT CL
WHERE NOT EXISTS
(
    SELECT * FROM depositaccount AC
    WHERE NOT EXISTS
    (
        SELECT * FROM hasdefaccount HA
        WHERE CL.clientid = HA.clientid
        AND AC.actype = HA.actype
    )
);

SELECT ctitle || ' ' || cfname || ' ' || clname CLIENTBIGNAME,
ACCTYPEDESC, txtype, actype
FROM CLIENTACCOUNT
FULL JOIN ACCOUNTST USING (accno);       