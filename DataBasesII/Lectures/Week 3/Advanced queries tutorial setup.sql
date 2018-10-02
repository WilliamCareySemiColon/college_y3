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

--2. Return a list of students who only joined clubs based in the Kevin Street campus.

--3. Return a list of students who joined all SPORTS clubs.

--4. Return a list of students who joined NetSoc or Swimming, but not both.
