--SQL code to connect to a schema associated with Cinema systems

--connecting to the schema that is assigned to group e for database
connect dt2283group_e/dt2283group_e@//redwood.ict.ad.dit.ie:1521/pdb12c.ict.ad.dit.ie;

--Dropping pervious versions of the tables in the database
DROP TABLE Ticket;
DROP TABLE Booking;
DROP TABLE Showing;
DROP TABLE Screen;
DROP TABLE Film;


--designing the database tables and their fields in the schema
-- Table Film Is a table that displays the information about every film
CREATE TABLE Film (
	Film_ID Number(10) NOT NULL PRIMARY KEY,
	Release_Date DATE,
	Film_Name Varchar(50),
	Priority_Rating Number(2),
	FIlm_Rating varchar(25),
    Film_Duration NUMBER(3),
	Start_Showing TIMESTAMP,
	End_Showing	TIMESTAMP
);

--TABLE Screen Showing Every detail about each screen inside the cinema systems
CREATE TABLE Screen
(
	Screen_No Number(2) NOT NULL PRIMARY KEY,
	Capacity Number(3) NOT NULL,
	Prem_Capacity Number(2) NOT NULL
);

--Showing Table display every film that the assocaited screen is showing to the audience
CREATE TABLE Showing
(
	Showing_ID Number(10) NOT NULL PRIMARY KEY,
	Screen_No Number(10) NOT NULL,
	Film_ID Number(10) NOT NULL,
	Start_Time TIMESTAMP NOT NULL,
	FOREIGN KEY(Screen_No) REFERENCES Screen(Screen_No),
	FOREIGN KEY(Film_ID) REFERENCES Film(Film_ID)
);

--Booking table for the customers that want to reserve a spot to see a film desired
CREATE TABLE Booking
(
	Booking_ID Number(10) NOT NULL PRIMARY KEY,
	--Ticket_ID Number(10) NOT NULL,
	Amount_ppl Number(2) NOT NULL,
	Card_No Number(16) NOT NULL,
	Name Varchar(25) NOT NULL
);

--Tickets to get access to the showings that are showing a particular film they want to see
CREATE TABLE Ticket (
	Ticket_ID Number(10) NOT NULL PRIMARY KEY,
    Booking_ID Number(10) ,
	Showing_ID Number(10),
	Premium Number(1),
	Sold Number(1),
	Seat_No Number(2),
	FOREIGN KEY(Showing_ID) REFERENCES Showing(Showing_ID),
    FOREIGN KEY(Booking_ID) REFERENCES Booking(Booking_ID),
	CONSTRAINT Bool_Premium CHECK (Premium <= 1 AND Premium >= 0),
	CONSTRAINT Bool_Sold CHECK (Sold <= 1 AND Sold >= 0)
);

--test select statements commented out
--SELECT  TO_CHAR(Start_Showing, 'HH:MI:SS') FROM FILM;

--SELECT  Start_Showing FROM FILM;

--Feeding particular information into the system so we can test the system with vary statements
--Inserting Data Into The Tables:
--Film Table:
INSERT INTO Film VALUES( 1000000000, TO_DATE('25/12/2003','DD/MM/YYYY'), 'Lord of the Two Towers', 1, '12PG',120, TIMESTAMP '2003-12-25 10:30:00',TIMESTAMP  '2004-01-31 18:00:00');
INSERT INTO Film VALUES( 1000000001, TO_DATE('12/12/2003','DD/MM/YYYY'), 'The Importance of being Earnest', 2, 'U',110,TIMESTAMP '2003-12-12 12:15:00',TIMESTAMP '2004-01-31 20:30:00');
INSERT INTO Film VALUES( 1000000002, TO_DATE('15/12/2003','DD/MM/YYYY'), 'Einstein''s big adventure', 3, 'U',90,TIMESTAMP '2003-12-15 09:00:00',TIMESTAMP '2004-01-31 13:15:00');
INSERT INTO Film VALUES( 1000000003, TO_DATE('31/10/2003','DD/MM/YYYY'), 'The House of Horrors', 4, '15PG',120,TIMESTAMP '2003-10-31 20:10:00',TIMESTAMP '2004-01-31 19:20:00');
INSERT INTO Film VALUES( 1000000004, TO_DATE('30/11/2003','DD/MM/YYYY'), 'Beautiful Horizons', 5, '12PG',120,TIMESTAMP '2003-11-30 14:25:00',TIMESTAMP '2004-01-31 18:50:00');
INSERT INTO Film VALUES( 1000000005, TO_DATE('04/12/2003','DD/MM/YYYY'), 'Marion and Michelle', 6, '18only',150,TIMESTAMP '2003-12-04 21:40:00',TIMESTAMP '2004-01-31 23:50:00');

--Screen Table:
INSERT INTO Screen VALUES(1, 250, 30);
INSERT INTO Screen VALUES(2, 150, 20);
INSERT INTO Screen VALUES(3, 75, 10);
INSERT INTO Screen VALUES(4, 50, 5);
INSERT INTO Screen VALUES(5, 85, 10);
INSERT INTO Screen VALUES(6, 110, 15);
INSERT INTO Screen VALUES(7, 180, 20);
INSERT INTO Screen VALUES(8, 225, 30);
INSERT INTO Screen VALUES(9, 200, 30);
INSERT INTO Screen VALUES(10, 100, 10);

--Showing
INSERT INTO Showing VALUES(100001, 1, 1000000000, TIMESTAMP '2003-12-25 11:30:00');
INSERT INTO Showing VALUES(100002, 2, 1000000001, TIMESTAMP '2003-12-25 13:00:00');
INSERT INTO Showing VALUES(100003, 1, 1000000000, TIMESTAMP '2003-12-25 13:00:00');
INSERT INTO Showing VALUES(100004, 3, 1000000002, TIMESTAMP '2003-12-25 14:00:00');

--Bookings
INSERT INTO Booking VALUES(10,3,1600150918871998,'Sam');

--Ticket
INSERT INTO Ticket VALUES(100,NULL, 100001, 1, 0, 25);
INSERT INTO Ticket VALUES(101,10, 100001, 0, 1, 37);
INSERT INTO Ticket VALUES(102,10, 100001, 0, 1, 38);
INSERT INTO Ticket VALUES(103,10, 100001, 0, 1, 39);
INSERT INTO Ticket VALUES(104,NULL, 100002, 1, 1, 16);
INSERT INTO Ticket VALUES(105,NULL, 100002, 0, 1, 50);

--Bookings
INSERT INTO Booking VALUES(100001,3,1600150918871998,'Sam');

--Assigning the grants for the roles associated with the cinema systems

--amryan is taking on the role for a general peron who wants to book for a film
grant select on dt2283group_e.booking to amryan;
grant insert on dt2283group_e.booking to amryan;
grant select on dt2283group_e.ticket to amryan;
grant select on dt2283group_e.ticket to amryan;
grant select on dt2283group_e.film to amryan;
grant select on dt2283group_e.screen to amryan;
grant select on dt2283group_e.showing to amryan;

--ekeane is taking on the role of a general cashier that have the optoin to take in bookings as well as refund the custmer
grant select on dt2283group_e.booking to ekeane;
grant insert on dt2283group_e.booking to ekeane;
grant update on dt2283group_e.booking to ekeane;
grant select on dt2283group_e.ticket to ekeane;
grant insert on dt2283group_e.ticket to ekeane;
grant update on dt2283group_e.ticket to ekeane;
grant select on dt2283group_e.film to ekeane;
grant select on dt2283group_e.screen to ekeane;
grant select on dt2283group_e.showing to ekeane;

--wcarey is taking on the role on the manager of the cinema, so the decision with the cinema lies with him
grant select on dt2283group_e.booking to wcarey;
grant insert on dt2283group_e.booking to wcarey;
grant update on dt2283group_e.booking to wcarey;
grant delete on dt2283group_e.booking to wcarey;
grant select on dt2283group_e.ticket to wcarey;
grant insert on dt2283group_e.ticket to wcarey;
grant update on dt2283group_e.ticket to wcarey;
grant delete on dt2283group_e.ticket to wcarey;
grant select on dt2283group_e.showing to wcarey;
grant insert on dt2283group_e.showing to wcarey;
grant update on dt2283group_e.showing to wcarey;
grant delete on dt2283group_e.showing to wcarey;
grant select on dt2283group_e.screen to wcarey;
grant insert on dt2283group_e.screen to wcarey;
grant update on dt2283group_e.screen to wcarey;
grant delete on dt2283group_e.screen to wcarey;
grant select on dt2283group_e.film to wcarey;
grant insert on dt2283group_e.film to wcarey;
grant update on dt2283group_e.film to wcarey;
grant delete on dt2283group_e.film to wcarey;

--making sure the session inside the system is up to date with the schema
commit;