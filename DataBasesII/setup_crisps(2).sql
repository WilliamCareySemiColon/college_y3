 drop table has_eaten;
 drop table consumer;
 drop table crisp_type;
 CREATE TABLE CRISP_TYPE 
   (CRISPKEY CHAR(10), 
	CP_NAME VARCHAR2(28), 
	 PRIMARY KEY (CRISPKEY)) ;
  Insert into CRISP_TYPE (CRISPKEY,CP_NAME) values ('ChAndOnion','Cheese and Onion');
Insert into CRISP_TYPE (CRISPKEY,CP_NAME) values ('SNVinegar ','Salt and Vinegar');
Insert into CRISP_TYPE (CRISPKEY,CP_NAME) values ('Buffalo   ','Buffalo');
Insert into CRISP_TYPE (CRISPKEY,CP_NAME) values ('SCrAndCh  ','Sour Cream and Chives');

  
 CREATE TABLE CONSUMER 
   (	CONSUMERID CHAR(3), 
	CN_NAME CHAR(18), 
	 PRIMARY KEY (CONSUMERID));
Insert into CONSUMER (CONSUMERID,CN_NAME) values ('J  ','John              ');
Insert into CONSUMER (CONSUMERID,CN_NAME) values ('A  ','Anne              ');
Insert into CONSUMER (CONSUMERID,CN_NAME) values ('K  ','Ken               ');
Insert into CONSUMER (CONSUMERID,CN_NAME) values ('B  ','Barney            ');
  
  
  CREATE TABLE HAS_EATEN 
   (	CONSUMERID CHAR(3) NOT NULL REFERENCES CONSUMER, 
	CRISPKEY CHAR(10) NOT NULL REFERENCES CRISP_TYPE, 
	QUANTITY NUMBER(7), 
	 PRIMARY KEY (CRISPKEY, CONSUMERID));
Insert into HAS_EATEN values ('J  ','ChAndOnion',4);
Insert into HAS_EATEN values ('J  ','SNVinegar ',3);
Insert into HAS_EATEN values ('J  ','Buffalo   ',3);
Insert into HAS_EATEN values ('J  ','SCrAndCh  ',1);
Insert into HAS_EATEN values ('K  ','ChAndOnion',2);
Insert into HAS_EATEN values ('K  ','SNVinegar ',1);
Insert into HAS_EATEN values ('A  ','ChAndOnion',4);
commit;