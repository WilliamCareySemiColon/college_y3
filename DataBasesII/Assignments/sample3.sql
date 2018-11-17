--Part Three of the assignment - writing individual queries

--Selection on the different showings and what information they hold
--in relation to the screens and films associated with it
SELECT showing_id "ShowTime ID", screen_no "Screen Number",
film_id "Film Identifier", TO_CHAR(start_time,'HH:MI:SS') "Times",
TO_CHAR(start_time,'DD/MM/YYYY') "Year of Release" FROM
DT2283GROUP_E.SHOWING;

--Projection to find all the Films for adults only
SELECT TO_CHAR(release_date,'DD/MM/YYYY') "Released Date",
film_name "Film Name", priority_rating "Film Importance",
film_rating "Age bracket", film_duration "Length in minutes",
TO_CHAR(start_showing,'HH:MI:SS DD/MM/YYYY') "Starting Viewable date", 
TO_CHAR(end_showing,'HH:MI:SS DD/MM/YYYY') "Finished Date"
FROM DT2283GROUP_E.FILM WHERE film_rating LIKE '18only';

--Aggregation to display how many seats we have in this branch of the cinemas 
SELECT SUM(Capacity) "Total Capacity",
SUM(Prem_Capacity) "Total Premium Seats" 
FROM DT2283GROUP_E.SCREEN; 

--filters on aggregates
--Union to show all the films appariate for kids 
SELECT TO_CHAR(release_date,'DD/MM/YYYY') "Released Date",
film_name "Film Name", priority_rating "Film Importance",
film_rating "Age bracket", film_duration "Length in minutes",
TO_CHAR(start_showing,'HH:MI:SS DD/MM/YYYY') "Starting Viewable date", 
TO_CHAR(end_showing,'HH:MI:SS DD/MM/YYYY') "Finished Date"
FROM DT2283GROUP_E.FILM WHERE film_rating LIKE 'U'
UNION
SELECT TO_CHAR(release_date,'DD/MM/YYYY') "Released Date",
film_name "Film Name", priority_rating "Film Importance",
film_rating "Age bracket", film_duration "Length in minutes",
TO_CHAR(start_showing,'HH:MI:SS DD/MM/YYYY') "Starting Viewable date", 
TO_CHAR(end_showing,'HH:MI:SS DD/MM/YYYY') "Finished Date"
FROM DT2283GROUP_E.FILM WHERE film_rating LIKE '12PG';

--Minus query to display all the screens that the 
--poential to be the most profitable
SELECT SCREEN_NO "Screen Number", Capacity "Capacity",
Prem_Capacity "Premium Seats" FROM DT2283GROUP_E.SCREEN
Minus
SELECT SCREEN_NO "Screen Number", Capacity "Capacity",
Prem_Capacity "Premium Seats" FROM DT2283GROUP_E.SCREEN
WHERE Capacity < 150;

--Difference query to show tickets that are either not sold or are prebooked
(SELECT ticket_id "Ticket Identifier",
CASE WHEN booking_id  IS NULL THEN 'NOT BOOKED'
ELSE TO_CHAR(booking_id)
END "Booking ID",
showing_id "Showing ID", 
CASE WHEN SOLD = 0 THEN 'No'
ELSE 'Yes'
END "SOLD",seat_no "Seating Number"
FROM DT2283GROUP_E.Ticket
MINUS 
SELECT ticket_id "Ticket Identifier",
CASE WHEN booking_id  IS NULL THEN 'NOT BOOKED'
ELSE TO_CHAR(booking_id)
END "Booking ID",
showing_id "Showing ID", 
CASE WHEN SOLD = 0 THEN 'No'
ELSE 'Yes'
END "SOLD", seat_no "Seating Number"
FROM DT2283GROUP_E.Ticket
WHERE SOLD = 1)
UNION
(SELECT ticket_id "Ticket Identifier",
CASE WHEN booking_id  IS NULL THEN 'NOT BOOKED'
ELSE TO_CHAR(booking_id)
END "Booking ID",
showing_id "Showing ID", 
CASE WHEN SOLD = 0 THEN 'No'
ELSE 'Yes'
END "SOLD", seat_no "Seating Number"
FROM DT2283GROUP_E.Ticket
MINUS 
SELECT ticket_id "Ticket Identifier",
CASE WHEN booking_id  IS NULL THEN 'NOT BOOKED'
ELSE TO_CHAR(booking_id)
END "Booking ID",
showing_id "Showing ID", 
CASE WHEN SOLD = 0 THEN 'No'
ELSE 'Yes'
END "SOLD", seat_no "Seating Number"
FROM DT2283GROUP_E.Ticket
WHERE BOOKING_ID IS NULL)
;

--Inner Join 
SELECT film_id "Film Id", screen_no "Screen Number",
start_time "Start Time", Capacity "Capacity", 
prem_capacity "Prem Capacity" , release_date "Release Date",
film_name "Film Name", priority_rating "Film Importance",
film_rating "Fim rating", film_duration "length",
TO_CHAR(start_showing, 'HH:MI:SS DD/MM/YYYY') "Start",
TO_CHAR(end_showing, 'HH:MI:SS DD/MM/YYYY') "End"
FROM DT2283GROUP_E.SHOWING
INNER JOIN DT2283GROUP_E.SCREEN USING(SCREEN_NO)
INNER JOIN DT2283GROUP_E.FILM USING (FILM_ID);

--Outer Join
SELECT film_id "Film Id", screen_no "Screen Number",
start_time "Start Time", Capacity "Capacity", 
prem_capacity "Prem Capacity" , release_date "Release Date",
film_name "Film Name", priority_rating "Film Importance",
film_rating "Fim rating", film_duration "length",
TO_CHAR(start_showing, 'HH:MI:SS DD/MM/YYYY') "Start",
TO_CHAR(end_showing, 'HH:MI:SS DD/MM/YYYY') "End"
FROM DT2283GROUP_E.SHOWING
FULL OUTER JOIN DT2283GROUP_E.SCREEN USING(SCREEN_NO)
FULL OUTER JOIN DT2283GROUP_E.FILM USING (FILM_ID);

--Semi-join
SELECT * FROM DT2283GROUP_E.SHOWING
WHERE SHOWING_ID IN
    (SELECT showing_id FROM DT2283GROUP_E.TICKET);
--Anti-join
--Correlated sub-query.