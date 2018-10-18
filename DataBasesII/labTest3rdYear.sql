-- Q1 Write SQL to list the movie_name, movie_rating and review_rating 
--of all movies that have a movie_rating higher than 5 and have a review_rating of 5.

SELECT movie_name, movie_rating, review_rating
FROM REVIEW 
INNER JOIN MOVIE USING (movie_name)
WHERE review_rating = 5
AND movie_rating > 5
GROUP BY movie_name, movie_rating, review_rating;

--Q2 2	Write SQL to list the names of movies (movie_name) that no-one has reviewed
SELECT movie_name
FROM REVIEW 
FULL JOIN MOVIE USING (movie_name)
WHERE review_rating IS NULL;

-- Q3 Write SQL to list the stage_name and role_name where an actor (stage_name)
--has played the same role (role_name) in more than one movie.

SELECT stage_name, role_name FROM ROLE
INNER JOIN MOVIE USING (movie_name)
GROUP BY stage_name, role_name
HAVING COUNT(*) > 1;

--Q4 Write SQL to list the stage name of actors  who have played the same roles 
--as George Clooney (don't include George Clooney).
SELECT stage_name FROM ROLE
WHERE exists (
    SELECT role_name FROM ROLE
    WHERE stage_name LIKE 'George Clooney'
    GROUP BY role_name
    )
GROUP BY stage_name, role_name
HAVING COUNT(*) > 1
MINUS 
SELECT stage_name FROM ROLE
WHERE stage_name LIKE 'George Clooney';

--coming back to the above

--Q5 Write SQL to list the name (movie_name) and length (movie_length)of any movie 
--that has a non-null movie length (movie_length is not null), 
--that has been reviewed by every member.

SELECT movie_name, movie_length
FROM REVIEW 
INNER JOIN MOVIE USING (movie_name)
INNER JOIN mMember USING (member_id)
WHERE movie_length IS NOT NULL
GROUP BY movie_name, movie_length;

