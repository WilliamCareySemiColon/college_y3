DROP TABLE mOrder CASCADE CONSTRAINTS PURGE;
DROP TABLE menu CASCADE CONSTRAINTS PURGE;
DROP TABLE Menu_type CASCADE CONSTRAINTS PURGE;
DROP TABLE Table_Booking CASCADE CONSTRAINTS PURGE;
DROP TABLE RTable CASCADE CONSTRAINTS PURGE;
CREATE TABLE rTable(
	TableNo		  number(2)  PRIMARY KEY,
	tLocation	  varchar2(40)  NULL ,
	Capacity	  number(2)  NULL);
INSERT INTO RTABLE VALUES (1, 'Middle Left',6);
INSERT INTO RTABLE VALUES (2, 'Middle Mid',4);
INSERT INTO RTABLE VALUES (3, 'Middle Right',6);
INSERT INTO RTABLE VALUES (4, 'Front left',6);
INSERT INTO RTABLE VALUES (5, 'Front Mid',4);
INSERT INTO RTABLE VALUES (6, 'Front Right',6);
INSERT INTO RTABLE VALUES (7, 'Back Mid',4);
INSERT INTO RTABLE VALUES (8, 'Back Left',6);
INSERT INTO RTABLE VALUES (9, 'Back Right',6);
INSERT INTO RTABLE VALUES (10, 'Patio left',4);
INSERT INTO RTABLE VALUES (11, 'Patio right',4);

CREATE TABLE Table_Booking
(
	TableNo		  NUMBER(2)  NOT NULL REFERENCES RTABLE,
	Book_date	  TIMESTAMP  NOT NULL ,
	PartySize	  NUMBER(2)  NULL ,
	Status		  CHAR  DEFAULT 'O' CHECK (STATUS IN ('B','O','P')),
	Booking_name	  CHAR(18)  NULL ,
	Booking_contact	  CHAR(18)  NULL ,
CONSTRAINT  XPKTable_Booking PRIMARY KEY (TableNo,Book_date)
);
INSERT INTO TABLE_BOOKING VALUES 
(1,TO_TIMESTAMP ('20-Jun-2012 12:00:00','DD-Mon-YYYY HH24:MI:SS'),
4,'B','Quaverly','Quav@email.com');
INSERT INTO TABLE_BOOKING VALUES 
(1,TO_TIMESTAMP ('20-Jun-2012 14:00:00','DD-Mon-YYYY HH24:MI:SS'),
4,'B','Jackson','0874432111');
INSERT INTO TABLE_BOOKING VALUES 
(5,TO_TIMESTAMP ('20-Jun-2012 18:00:00','DD-Mon-YYYY HH24:MI:SS'),
4,'B','Bryant','BT@email.com');
INSERT INTO TABLE_BOOKING VALUES 
(8,TO_TIMESTAMP ('2-Mar-2012 18:00:00','DD-Mon-YYYY HH24:MI:SS'),
4,'B','Bryant','BT@email.com');
INSERT INTO TABLE_BOOKING VALUES 
(1,TO_TIMESTAMP ('8-Mar-2012 12:00:00','DD-Mon-YYYY HH24:MI:SS'),
4,'B','Quaverly','Quav@email.com');
INSERT INTO TABLE_BOOKING VALUES 
(1,TO_TIMESTAMP ('6-Mar-2012 14:00:00','DD-Mon-YYYY HH24:MI:SS'),
4,'B','Jackson','0874432111');
INSERT INTO TABLE_BOOKING VALUES 
(8,TO_TIMESTAMP ('23-Feb-2012 18:00:00','DD-Mon-YYYY HH24:MI:SS'),
4,'B','Bryant','BT@email.com');
insert into table_booking values
(1,TO_TIMESTAMP ('24-Feb-2012 12:00:00','DD-Mon-YYYY HH24:MI:SS'),
4,'B','Quaverly','Quav@email.com');
INSERT INTO TABLE_BOOKING VALUES 
(1,TO_TIMESTAMP ('28-Feb-2012 14:00:00','DD-Mon-YYYY HH24:MI:SS'),
4,'B','Jackson','0874432111');
INSERT INTO TABLE_BOOKING (TABLENO, BOOK_DATE, PARTYSIZE) VALUES 
(2,CURRENT_TIMESTAMP,4);
INSERT INTO TABLE_BOOKING VALUES 
(1,CURRENT_TIMESTAMP - 2/24,4,'B','Quaverly','Quav@email.com');
INSERT INTO TABLE_BOOKING VALUES 
(3,CURRENT_TIMESTAMP,4,'B','Quaverly','Quav@email.com');

CREATE TABLE Menu_type
(
	menu_time	  varchar2(15)  PRIMARY KEY,
	Menu_time_description  VARCHAR2(100)  NULL ,
	ServedFrom	  NUMBER(4)  NULL ,
	ServedTo	  NUMBER(4)  NULL ,
CONSTRAINT  CHKTIMES CHECK (servedfrom < servedto)
);
insert into menu_type values
('BREAK','Breakfast - early til late', 0700,1100);
insert into menu_type values
('BRNCH','Brunch - breakfast and lunch',1000,1400);
insert into menu_type values
('LUNCH','Leisurely lunch',1200,1600);
insert into menu_type values
('EBIRD','Early Bird',1600, 1930);
insert into menu_type values
('DNNER','Dinner - an evening out',1930,2300);
insert into menu_type values
('ALDAY','Whenever you want it',0700,2300);
CREATE TABLE menu
(
	menu_number	  NUMBER(2) primary key ,
	dish		  VARCHAR2(25)  NOT NULL ,
	menu_time	  varchar2(15)  NOT NULL references menu_type,
  food_type varchar2(15)
  CONSTRAINT  Validation_Rule_129_605034039 CHECK (
  food_type IN ('HOT SANDWICHES', 'BASKETS', 'HOT BYTES',
  'HEALTHY CHOICES', 'SMALL BYTES', 'BEVERAGE')),
	food_comment	  VARCHAR2(100)  NULL ,
	price		  NUMBER(5,2)  NOT NULL ,
	cost_price	  number(5,2)  NULL ,
CONSTRAINT  price_check CHECK  (cost_price < price)
);
insert into menu values (
1,'Weetoflakes','BREAK','SMALL BYTES','Full of fibre',2.50,.50);
insert into menu values (
2,'Scrambled Egg','BREAK','HOT BYTES','Go to work on an Egg',2.50,.50);
insert into menu values (
3,'White toast','BREAK','HOT BYTES','Hot buttered',2.00,.40);
insert into menu values (
10,'Large Grill','BRNCH','HOT BYTES','A hearty meal',7.50,2.40);
insert into menu values (
11,'Chicken Biryani','EBIRD','HOT BYTES','A tasty meal',7.50,2.40);
insert into menu (Menu_number, dish, menu_time, food_type, price, cost_price)
values (12,'Spaghetti Bolognese','EBIRD','HOT BYTES',7.00,1.00);
insert into menu values (
35,'Chicken Biryani','DNNER','HOT BYTES','Full of Eastern Promise',12.50,2.40);
insert into menu (Menu_number, dish, menu_time, food_type, price, cost_price)
values (36,'Spaghetti Bolognese','DNNER','HOT BYTES',9.00,1.00);
insert into menu (Menu_number, dish, menu_time, food_type, price, cost_price)
values (45,'Battered Fish','DNNER','HOT BYTES',9.00,1.00);
insert into menu (Menu_number, dish, menu_time, food_type, price, cost_price)
values (46,'Sirloin Steak','DNNER','HOT BYTES',12.00,5.00);
insert into menu (Menu_number, dish, menu_time, food_type, price, cost_price)
values (65,'Breakfast Tea','ALDAY','BEVERAGE',3.00,1.00);
insert into menu (Menu_number, dish, menu_time, food_type, price, cost_price)
values (66,'Americano','ALDAY','BEVERAGE',3.00,1.00);
insert into menu (Menu_number, dish, menu_time, food_type, price, cost_price)
values (67,'Capuccino','ALDAY','BEVERAGE',3.00,1.00);
insert into menu (Menu_number, dish, menu_time, food_type, price, cost_price)
values (68,'Espresso','ALDAY','BEVERAGE',3.00,1.00);
insert into menu (Menu_number, dish, menu_time, food_type, price, cost_price)
values (69,'Rocky Road','ALDAY','SMALL BYTES',5.00,1.00);
insert into menu (Menu_number, dish, menu_time, food_type, price, cost_price)
values (70,'Death by Chocolate','ALDAY','SMALL BYTES',5.00,1.00);

CREATE TABLE mOrder
(
	TableNo		  NUMBER(2)  NOT NULL ,
	Book_date	  timestamp  NOT NULL ,
	menu_number	  NUMBER(2)  references menu,
	Quantity	  number(2) default 1,
CONSTRAINT  XPKOrder PRIMARY KEY (TableNo,Book_date,menu_number),
CONSTRAINT  R_5 FOREIGN KEY (TableNo,Book_date) REFERENCES Table_Booking(TableNo,Book_date)
);
desc morder;
INSERT INTO mOrder VALUES 
(8,TO_TIMESTAMP ('2-Mar-2012 18:00:00','DD-Mon-YYYY HH24:MI:SS'),
11,2);
INSERT INTO mOrder VALUES 
(8,TO_TIMESTAMP ('2-Mar-2012 18:00:00','DD-Mon-YYYY HH24:MI:SS'),
12,2);
INSERT INTO mOrder VALUES 
(8,TO_TIMESTAMP ('2-Mar-2012 18:00:00','DD-Mon-YYYY HH24:MI:SS'),
35,2);
INSERT INTO mOrder VALUES 
(8,TO_TIMESTAMP ('2-Mar-2012 18:00:00','DD-Mon-YYYY HH24:MI:SS'),
45,2);

INSERT INTO mOrder VALUES 
(8,TO_TIMESTAMP ('2-Mar-2012 18:00:00','DD-Mon-YYYY HH24:MI:SS'),
65,4);
INSERT INTO mOrder VALUES 
(8,TO_TIMESTAMP ('2-Mar-2012 18:00:00','DD-Mon-YYYY HH24:MI:SS'),
66,1);
INSERT INTO mOrder VALUES 
(8,TO_TIMESTAMP ('2-Mar-2012 18:00:00','DD-Mon-YYYY HH24:MI:SS'),
67,2);
INSERT INTO mOrder VALUES 
(8,TO_TIMESTAMP ('2-Mar-2012 18:00:00','DD-Mon-YYYY HH24:MI:SS'),
68,1);
INSERT INTO mOrder VALUES 
(8,TO_TIMESTAMP ('2-Mar-2012 18:00:00','DD-Mon-YYYY HH24:MI:SS'),
69,2);
INSERT INTO mOrder VALUES 
(8,TO_TIMESTAMP ('2-Mar-2012 18:00:00','DD-Mon-YYYY HH24:MI:SS'),
70,2);
commit;