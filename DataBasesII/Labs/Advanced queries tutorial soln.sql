/*         Student joins club             */
/*DROP TABLE JOINED;
DROP TABLE CCLUB;
DROP TABLE SSTUDENT;
CREATE TABLE SSTUDENT (
  SNO CHAR(9) primary key,
  SNAME varchar2(50),
  STUDYLEVEL CHAR(2) CHECK (STUDYLEVEL IN ('UG','PG')));

INSERT INTO SSTUDENT VALUES('J12345678','John Lennon','UG');
INSERT INTO SSTUDENT VALUES('P12345678','Paul McCartney','UG');
INSERT INTO SSTUDENT VALUES('G12345678','George Harrison','UG');
INSERT INTO SSTUDENT VALUES('R12345678','Ringo Starr','UG');
INSERT INTO SSTUDENT VALUES('B12345678','Brian May','PG');
INSERT INTO SSTUDENT VALUES('A12345678','Angela Merkel','PG');
INSERT INTO SSTUDENT VALUES('E12345678','Edgar Codd','PG');


CREATE TABLE CCLUB (
  CLUBID CHAR(8) PRIMARY KEY,
  CNAME VARCHAR2(40),
  CLUBTYPE VARCHAR2(15) CHECK (CLUBTYPE IN ('SPORT','SCIENCE','ARTS','OTHER')),
  CAMPUS VARCHAR2(20) CHECK (CAMPUS IN ('Kevin Street','Aungier Street','Bolton Street','Rathmines')));

INSERT INTO CCLUB VALUES ('JKS01','JUDO','SPORT','Kevin Street');
INSERT INTO CCLUB VALUES ('SKS01','Swimming','SPORT','Kevin Street');
INSERT INTO CCLUB VALUES ('ABS01','Auto','SCIENCE','Bolton Street');
INSERT INTO CCLUB VALUES ('ABS02','Architecture','OTHER','Bolton Street');
INSERT INTO CCLUB VALUES ('PAS01','Photography','ARTS','Aungier Street');
INSERT INTO CCLUB VALUES ('MRM01','Musical','ARTS','Rathmines');
INSERT INTO CCLUB VALUES ('NKS01','NetSoc','SCIENCE','Kevin Street');

CREATE TABLE JOINED (SNO REFERENCES SSTUDENT, CLUBID REFERENCES CCLUB, PRIMARY KEY (SNO, CLUBID));
INSERT INTO JOINED VALUES ('J12345678','JKS01');
INSERT INTO JOINED VALUES ('J12345678','SKS01');
INSERT INTO JOINED VALUES ('J12345678','NKS01');
INSERT INTO JOINED VALUES ('J12345678','MRM01');
INSERT INTO JOINED VALUES ('P12345678','MRM01');
INSERT INTO JOINED VALUES ('G12345678','MRM01');
INSERT INTO JOINED VALUES ('R12345678','MRM01');
INSERT INTO JOINED VALUES ('P12345678','SKS01');
INSERT INTO JOINED VALUES ('A12345678','SKS01');
INSERT INTO JOINED VALUES ('E12345678','NKS01');
COMMIT;*/
/*                  ADVANCED QUERIES               */
--1. Return a list of clubs that all undergraduate students joined (studylevel = 'UG')
/* Approach:  I know the A / G divide algorithm, but what is A and B and x?
I want the club name , so the club can be A
I want all undergraduate students to be B
I want joined to be x.
*/

create or replace view ugstudents as (select * from sstudent where studylevel = 'UG');
select cname from cclub where not exists (
  select * from ugstudents where not exists (
  select * from joined where (cclub.clubid = joined.clubid and ugstudents.sno = joined.sno)));

--2. Return a list of students who only joined clubs based in the Kevin Street campus.

create or replace view stclub as 
select sname, campus, cname from sstudent join joined using (sno) join cclub using (clubid);
select sname from stclub where campus = 'Kevin Street'
minus 
select sname from stclub where campus <> 'Kevin Street';
--3. Return a list of students who joined all SPORTS clubs.
create or replace view sporty as (select * from cclub where clubtype = 'SPORT');
select * from sporty;
select sname from sstudent where not exists (
  select * from sporty where not exists (
  select * from joined where (sporty.clubid = joined.clubid and sstudent.sno = joined.sno)));

--4. Return a list of students who joined NetSoc or Swimming, but not both.
select sname from stclub where cname = 'Swimming'
union
select sname from stclub where cname = 'NetSoc'
minus (
select sname from stclub where cname = 'Swimming'
intersect
select sname from stclub where cname = 'NetSoc');
