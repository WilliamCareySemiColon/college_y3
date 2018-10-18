WHENEVER SQLERROR CONTINUE NONE
drop table loan;
drop table member;
drop table itemforloan;
drop table equipmenttype;

WHENEVER SQLERROR EXIT SQL.SQLCODE

CREATE TABLE EQUIPMENTTYPE 
(
  BRANDNAME VARCHAR2(50 BYTE) NOT NULL 
, EQDESCRIPTION VARCHAR2(255 BYTE) NOT NULL 
, EQCOMPANY VARCHAR2(50 BYTE) NOT NULL 
, COSTPERNIGHT NUMBER(10, 2) NOT NULL 
, PRIMARY KEY   (    BRANDNAME   )
); 

CREATE TABLE ITEMFORLOAN 
(
  SERIALNO NUMBER(*, 0) NOT NULL 
, BRANDNAME VARCHAR2(50 BYTE) NOT NULL 
, ACQUIREDDATE DATE DEFAULT sysdate 
, CONDITION CHAR(1 BYTE) DEFAULT 'C'  constraint checkIFLCondition check( condition in ('C','D','A','L'))
, PRIMARY KEY (SERIALNO)
,FOREIGN KEY(BRANDNAME) REFERENCES EQUIPMENTTYPE(BRANDNAME)  
); 


CREATE TABLE MEMBER 
(
  MEMBERID NUMBER(*, 0) NOT NULL 
, MNAME VARCHAR2(50 BYTE) NOT NULL 
, MEMAIL VARCHAR2(50 BYTE) 
, MPHONE VARCHAR2(15 BYTE) 
, MADDRESS VARCHAR2(80 BYTE) NOT NULL 
, MSTATUS CHAR(1 BYTE) NOT NULL constraint checkmStatus check( mStatus in ('O','G'))
, PRIMARY KEY (MEMBERID )
); 

CREATE TABLE LOAN 
(
  LOANDATE DATE DEFAULT sysdate NOT NULL 
, SERIALNO NUMBER(*, 0) NOT NULL 
, RETURNDATE DATE 
, DUEDATE DATE DEFAULT (SysDate + 30) 
, MEMBERID NUMBER(*, 0) NOT NULL 
, PRIMARY KEY  (LOANDATE, SERIALNO)
, FOREIGN KEY (serialno)	REFERENCES itemforloan(serialNo)
, FOREIGN KEY(memberid) REFERENCES member(memberId)
) ;


SET DEFINE OFF;
REM INSERTING into EQUIPMENTTYPE
Insert into EQUIPMENTTYPE (BRANDNAME,EQDESCRIPTION,EQCOMPANY,COSTPERNIGHT) values ('Apple MacBook Air 11-inch','Fifth-generation Intel Core i5 and i7 processors with Intel HD Graphics. From editing photos to browsing the web, everything happens ultrafast. And all that power is encased in an incredibly thin 0.68-inch unibody design that weighs only 2.38 pounds','Apple',20);
Insert into EQUIPMENTTYPE (BRANDNAME,EQDESCRIPTION,EQCOMPANY,COSTPERNIGHT) values ('Apple Watch','Instantly receive and respond to notifications. Motivation to stay active and healthy. Express your personal style. Apple Watch isan essential part of who you are.','Apple',20);
Insert into EQUIPMENTTYPE (BRANDNAME,EQDESCRIPTION,EQCOMPANY,COSTPERNIGHT) values ('Mac mini','Sleek aluminum design, a removable bottom panel for easy access to memory, built-in power supply, high-performance graphics. Uses less than 6 watts of power when idle.','Apple',20);
Insert into EQUIPMENTTYPE (BRANDNAME,EQDESCRIPTION,EQCOMPANY,COSTPERNIGHT) values ('Apple iPad 12.9 inch','The key to the iPad experience is the display. It''s how you interact using Multi-Touch, and how you view content in spectacular detail. We created our most vivid Retina display ever. The 12.9''‘inch iPad Pro has the highest resolution of any iOS device.','Apple',20);
Insert into EQUIPMENTTYPE (BRANDNAME,EQDESCRIPTION,EQCOMPANY,COSTPERNIGHT) values ('Alienware X51 i7 core','Reengineered gaming desktop with IntelÂ® processors, amplified graphics and optional liquid cooling to enable overclocking for powerful, but quiet performance.','Dell',15);
Insert into EQUIPMENTTYPE (BRANDNAME,EQDESCRIPTION,EQCOMPANY,COSTPERNIGHT) values ('Inspiron 13 5000','13" 2-in-1 in a sleek and portable design with stunning sound and optional features like a backlit keyboard and infrared camera for facial recognition.','Dell',15);
Insert into EQUIPMENTTYPE (BRANDNAME,EQDESCRIPTION,EQCOMPANY,COSTPERNIGHT) values ('Dell 7130cdn Colour Printer','Get brilliant, accurate colour prints with Dell''s  high-performance A3 (11''x17'') colour printer.','Dell',15);
REM INSERTING into MEMBER
Insert into MEMBER (MEMBERID,MNAME,MEMAIL,MPHONE,MADDRESS,MSTATUS) values (500001,'John','john@club.ie','555-999444333','John''s house','O');
Insert into MEMBER (MEMBERID,MNAME,MEMAIL,MPHONE,MADDRESS,MSTATUS) values (500002,'Martin','Martin@club.ie','555-999444333','Martin''s house','O');
Insert into MEMBER (MEMBERID,MNAME,MEMAIL,MPHONE,MADDRESS,MSTATUS) values (500003,'Ann','Ann@club.ie','555-999444333','Ann''s house','O');
Insert into MEMBER (MEMBERID,MNAME,MEMAIL,MPHONE,MADDRESS,MSTATUS) values (500004,'Maria','Maria@club.ie','555-999444333','Maria''s house','G');
Insert into MEMBER (MEMBERID,MNAME,MEMAIL,MPHONE,MADDRESS,MSTATUS) values (500005,'Brendan','Brendan@club.ie','555-999444333','Brendan''s house','G');
Insert into MEMBER (MEMBERID,MNAME,MEMAIL,MPHONE,MADDRESS,MSTATUS) values (500006,'Tom','Tom@club.ie','555-999444333','Tom''s house','G');
--
REM INSERTING into ITEMFORLOAN
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000001,'Apple MacBook Air 11-inch',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000002,'Apple MacBook Air 11-inch',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000003,'Apple MacBook Air 11-inch',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000004,'Apple MacBook Air 11-inch',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000005,'Apple MacBook Air 11-inch',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000006,'Apple Watch',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000007,'Apple Watch',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000008,'Apple Watch',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000009,'Apple Watch',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000010,'Mac mini',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000011,'Mac mini',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000012,'Mac mini',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000013,'Mac mini',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000014,'Apple iPad 12.9 inch',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000015,'Apple iPad 12.9 inch',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000016,'Apple iPad 12.9 inch',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000017,'Apple iPad 12.9 inch',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000018,'Alienware X51 i7 core',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000019,'Alienware X51 i7 core',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000020,'Alienware X51 i7 core',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000021,'Alienware X51 i7 core',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000022,'Inspiron 13 5000',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000023,'Inspiron 13 5000',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000024,'Inspiron 13 5000',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000025,'Inspiron 13 5000',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000026,'Dell 7130cdn Colour Printer',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000027,'Dell 7130cdn Colour Printer',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000028,'Dell 7130cdn Colour Printer',to_date('06-OCT-15','DD-MON-RR'),'C');
Insert into ITEMFORLOAN (SERIALNO,BRANDNAME,ACQUIREDDATE,CONDITION) values (20000029,'Dell 7130cdn Colour Printer',to_date('06-OCT-15','DD-MON-RR'),'C');
--
REM INSERTING into LOAN
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('05-OCT-15','DD-MON-RR'),20000003,to_date('03-NOV-15','DD-MON-RR'),to_date('04-NOV-15','DD-MON-RR'),500001);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('09-NOV-15','DD-MON-RR'),20000005,null,to_date('09-DEC-15','DD-MON-RR'),500001);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('14-DEC-15','DD-MON-RR'),20000006,to_date('12-JAN-16','DD-MON-RR'),to_date('13-JAN-16','DD-MON-RR'),500001);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('18-JAN-16','DD-MON-RR'),20000017,to_date('16-FEB-16','DD-MON-RR'),to_date('17-FEB-16','DD-MON-RR'),500001);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('22-FEB-16','DD-MON-RR'),20000022,to_date('22-MAR-16','DD-MON-RR'),to_date('23-MAR-16','DD-MON-RR'),500001);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('28-MAR-16','DD-MON-RR'),20000023,null,to_date('27-APR-16','DD-MON-RR'),500001);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('02-MAY-16','DD-MON-RR'),20000026,null,to_date('01-JUN-16','DD-MON-RR'),500001);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('05-OCT-15','DD-MON-RR'),20000005,to_date('03-NOV-15','DD-MON-RR'),to_date('04-NOV-15','DD-MON-RR'),500002);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('09-NOV-15','DD-MON-RR'),20000006,to_date('08-DEC-15','DD-MON-RR'),to_date('09-DEC-15','DD-MON-RR'),500002);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('14-DEC-15','DD-MON-RR'),20000017,null,to_date('13-JAN-16','DD-MON-RR'),500002);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('18-JAN-16','DD-MON-RR'),20000022,null,to_date('17-FEB-16','DD-MON-RR'),500002);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('22-FEB-16','DD-MON-RR'),20000023,to_date('22-MAR-16','DD-MON-RR'),to_date('23-MAR-16','DD-MON-RR'),500002);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('28-MAR-16','DD-MON-RR'),20000026,to_date('26-APR-16','DD-MON-RR'),to_date('27-APR-16','DD-MON-RR'),500002);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('05-OCT-15','DD-MON-RR'),20000006,to_date('08-NOV-15','DD-MON-RR'),to_date('04-NOV-15','DD-MON-RR'),500003);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('09-NOV-15','DD-MON-RR'),20000017,to_date('08-DEC-15','DD-MON-RR'),to_date('09-DEC-15','DD-MON-RR'),500003);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('14-DEC-15','DD-MON-RR'),20000022,to_date('17-JAN-16','DD-MON-RR'),to_date('13-JAN-16','DD-MON-RR'),500003);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('18-JAN-16','DD-MON-RR'),20000023,to_date('21-FEB-16','DD-MON-RR'),to_date('17-FEB-16','DD-MON-RR'),500003);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('22-FEB-16','DD-MON-RR'),20000026,to_date('22-MAR-16','DD-MON-RR'),to_date('23-MAR-16','DD-MON-RR'),500003);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('05-OCT-15','DD-MON-RR'),20000017,to_date('08-NOV-15','DD-MON-RR'),to_date('04-NOV-15','DD-MON-RR'),500004);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('09-NOV-15','DD-MON-RR'),20000022,to_date('13-DEC-15','DD-MON-RR'),to_date('09-DEC-15','DD-MON-RR'),500004);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('14-DEC-15','DD-MON-RR'),20000023,to_date('17-JAN-16','DD-MON-RR'),to_date('13-JAN-16','DD-MON-RR'),500004);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('18-JAN-16','DD-MON-RR'),20000026,null,to_date('17-FEB-16','DD-MON-RR'),500004);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('05-OCT-15','DD-MON-RR'),20000007,null,to_date('04-NOV-15','DD-MON-RR'),500005);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('09-NOV-15','DD-MON-RR'),20000013,null,to_date('09-DEC-15','DD-MON-RR'),500005);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('14-DEC-15','DD-MON-RR'),20000014,to_date('12-JAN-16','DD-MON-RR'),to_date('13-JAN-16','DD-MON-RR'),500005);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('18-JAN-16','DD-MON-RR'),20000019,null,to_date('17-FEB-16','DD-MON-RR'),500005);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('22-FEB-16','DD-MON-RR'),20000029,to_date('27-MAR-16','DD-MON-RR'),to_date('23-MAR-16','DD-MON-RR'),500005);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('05-OCT-15','DD-MON-RR'),20000013,null,to_date('04-NOV-15','DD-MON-RR'),500006);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('09-NOV-15','DD-MON-RR'),20000014,to_date('08-DEC-15','DD-MON-RR'),to_date('09-DEC-15','DD-MON-RR'),500006);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('14-DEC-15','DD-MON-RR'),20000019,null,to_date('13-JAN-16','DD-MON-RR'),500006);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('18-JAN-16','DD-MON-RR'),20000029,null,to_date('17-FEB-16','DD-MON-RR'),500006);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('01-SEP-16','DD-MON-RR'),20000026,to_date('10-SEP-16','DD-MON-RR'),to_date('10-SEP-16','DD-MON-RR'),500005);
Insert into LOAN (LOANDATE,SERIALNO,RETURNDATE,DUEDATE,MEMBERID) values (to_date('01-SEP-16','DD-MON-RR'),20000022,to_date('10-SEP-16','DD-MON-RR'),to_date('10-SEP-16','DD-MON-RR'),500005);
