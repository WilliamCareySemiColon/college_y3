--part two of the assignment
--done by C16315253

--Setting the output to this session 
SET SERVEROUTPUT ON

--Begining the programme to get a new film and put in into the cinema to be displayed
DECLARE
	--getting the film details
	--getting the film name
	FILMNAME VARCHAR(25) := '&What_is_the_Film_Name';
	--getting the film rating
	FILMRATING VARCHAR(25) := '&What_is_the_film_rating';
	--getting the film durations
	FILMDURATION NUMBER(3) := &what_is_the_film_mins;
	--when does the film start showing
	FILMSTARTSHOW VARCHAR(25) := '&startShowing';
    --when does the film finishes showing
    FILMENDSHOW VARCHAR(25) := '&endShowing';
    --when does the film be released
    FILMRELEASED VARCHAR(25) := '&releasedDate';
    
    --variable to get the information inside the system
    FILMID NUMBER(10);
    FILMPRIORITYRATING NUMBER(3);

BEGIN
    --Getting the max id and rating from the system
    SELECT MAX(FILM_ID) INTO FILMID 
    FROM DT2283GROUP_E.FILM;
    SELECT MAX(Priority_Rating)INTO FILMPRIORITYRATING
    FROM DT2283GROUP_E.FILM;
    
    --Making sure we assigning a value to the id 
    IF(FILMID IS NULL) THEN
        FILMID := 1;
    else
        FILMID := FILMID + 1;
    END IF;
    
    --making sure we assigning a value to the rating
    IF(FILMPRIORITYRATING IS NULL) THEN
        FILMPRIORITYRATING := 1;
    ELSE
        FILMPRIORITYRATING := FILMPRIORITYRATING + 1;
    END IF;
    
    --storing the information inside the system 
    INSERT INTO DT2283GROUP_E.FILM VALUES
    (FILMID, TO_DATE(FILMRELEASED,'DD/MM/YYYY'),FILMNAME,FILMPRIORITYRATING,
    FILMRATING, FILMDURATION, 
    TO_TIMESTAMP(FILMSTARTSHOW,'HH:MI:SS DD/MM/YYYY'), 
    TO_TIMESTAMP(FILMENDSHOW,'HH:MI:SS DD/MM/YYYY'));
    
    --making sure we restore the session to allowing further updates
    commit;
EXCEPTION
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE(SQLCODE||' '||SQLERRM);
        DBMS_OUTPUT.PUT_LINE('Rolling back');
        ROLLBACK;
END;
    