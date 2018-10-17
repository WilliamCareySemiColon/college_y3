--Q1 Display the number of bookings resulted from walkin, not prebooked
SELECT COUNT(*) FROM TABLE_BOOKING
WHERE STATUS LIKE 'B'
AND Booking_name IS NULL;

--Q2 Display the number of times Quaverly has booked in the last 6 months
SELECT COUNT(*) FROM TABLE_BOOKING
WHERE Booking_name LIKE 'Quaverly'
AND DATEDIFF(CURDATE(), booking_date) < 183;

--Q3 display the names of the clients who booked more than twice how have not walked in