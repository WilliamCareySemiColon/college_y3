--Part Three of the assignment - writing individual queries
--done by C16315253

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
SELECT COUNT(screen_no) "Total number of screens",
SUM(Capacity) "Total Capacity",
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

--Inner Join - show all the films that are currrently being showed
SELECT film_id "Film Id", screen_no "Screen Number",
TO_CHAR(start_time,'HH:MI:SS DD/MM/YYYY') "Start Time",
Capacity "Capacity", prem_capacity "Prem Capacity" ,
TO_CHAR(release_date,'DD/MM/YYYY') "Release Date",
film_name "Film Name", priority_rating "Film Importance",
film_rating "Fim rating", film_duration "length",
TO_CHAR(start_showing, 'HH:MI:SS DD/MM/YYYY') "Start",
TO_CHAR(end_showing, 'HH:MI:SS DD/MM/YYYY') "End"
FROM DT2283GROUP_E.SHOWING
INNER JOIN DT2283GROUP_E.SCREEN USING(SCREEN_NO)
INNER JOIN DT2283GROUP_E.FILM USING (FILM_ID);

--Outer Join to show all the films that are either being showed or not
--and to find what screens are been used as well
SELECT nvl(TO_CHAR(film_id),'No Film ID') "Film Id", 
nvl(TO_CHAR(screen_no),'No Screen Allocated') "Screen Number",
nvl(TO_CHAR(start_time,'HH:MI:SS DD/MM/YYYY'),'Showing has no start time') "Start Time",
nvl(TO_CHAR(Capacity),'No screen has been alloacted') "Capacity", 
nvl(TO_CHAR(prem_capacity),'No screen has been alloacted') "Prem Capacity", 
nvl(TO_CHAR(release_date,'DD/MM/YYYY'),'No release date') "Release Date",
nvl(film_name,'No film has been assigned') "Film Name",
nvl(TO_CHAR(priority_rating),'No film has been assigned') "Film Importance",
nvl(film_rating,'No film has been assigned') "Film rating",
nvl(TO_CHAR(film_duration),'No film has been assigned') "length", 
nvl(TO_CHAR(start_showing, 'HH:MI:SS DD/MM/YYYY'),'No film has been assigned')
"Start",
nvl(TO_CHAR(end_showing, 'HH:MI:SS DD/MM/YYYY') ,'No film has been assigned')
"End"
FROM DT2283GROUP_E.SHOWING
FULL OUTER JOIN DT2283GROUP_E.SCREEN USING(SCREEN_NO)
FULL OUTER JOIN DT2283GROUP_E.FILM USING (FILM_ID);

--Semi-join to find all the showings that are connected to a ticket
--regardless of whether it is sold or not
SELECT showing_id "Shows Id",
screen_no "Sceen Number",
film_id "Film ID",
TO_CHAR(start_time,'HH:MI:SS DD/MM/YYYY') "Start Time"
FROM DT2283GROUP_E.SHOWING
WHERE SHOWING_ID IN
    (SELECT showing_id FROM DT2283GROUP_E.TICKET);
    
--Anti-join to display all the films that are not being showed
SELECT film_id "Film Id",
TO_CHAR(release_date,'DD/MM/YYYY') "Release Date",
film_name "Film Name",
film_rating "Film Rating",
film_duration "Film Duration",
TO_CHAR(start_showing,'HH:MI:SS DD/MM/YYYY') "Starts Showing",
TO_CHAR(end_showing,'HH:MI:SS DD/MM/YYYY') "Finishes Showing"
FROM DT2283GROUP_E.FILM
WHERE film_id NOT IN
    (SELECT film_id FROM DT2283GROUP_E.SHOWING);
    
--Correlated sub-query to display all the films that have two 
--or more showings recorded in the system 
SELECT * FROM DT2283GROUP_E.FILM A
WHERE EXISTS
    (SELECT film_id, screen_no FROM DT2283GROUP_E.SHOWING B
    GROUP BY screen_no, film_id
    HAVING COUNT(screen_no) > 1
    AND screen_no IS NOT NULL
    AND A.film_id = B.film_id
    );