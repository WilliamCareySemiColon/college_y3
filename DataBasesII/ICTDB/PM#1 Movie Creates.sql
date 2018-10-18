DROP TABLE Review;
DROP TABLE mMember; -- renamed to avoid clash
DROP TABLE ROLE;
DROP TABLE MOVIE;
DROP TABLE ACTOR;
PURGE RECYCLEBIN;
--
CREATE TABLE ACTOR
  (
    STAGE_NAME  VARCHAR2(50) PRIMARY KEY,
    A_REAL_NAME VARCHAR2(80),
    A_HOME_TOWN VARCHAR2(255),
    A_DOB       DATE
  );

CREATE TABLE MOVIE
  (
    MOVIE_NAME         VARCHAR2(60) PRIMARY KEY,
    MOVIE_LENGTH       NUMBER(4),
    MOVIE_RELEASE_DATE DATE,
    MOVIE_RATING       NUMBER(4,1)
  );

CREATE TABLE ROLE
  (
    STAGE_NAME REFERENCES ACTOR,
    MOVIE_NAME REFERENCES MOVIE,
    ROLE_NAME VARCHAR2(50),
    PRIMARY KEY (MOVIE_NAME, ROLE_NAME)
  );

CREATE TABLE mMEMBER
  (
    MEMBER_ID   NUMBER(8) PRIMARY KEY,
    MEMBER_NAME VARCHAR2(50),
    MEMBER_BIO  VARCHAR2(255)
  );

CREATE TABLE REVIEW
  (
    MOVIE_NAME REFERENCES MOVIE,
    MEMBER_ID REFERENCES mMEMBER,
    REVIEW_TEXT   VARCHAR2(255),
    REVIEW_RATING NUMBER(2,1)
  );

insert into mmember values (100, 'Reviewer 1', 'Love movies');
insert into mmember values (200, 'Reviewer 2', 'Love movies');
insert into mmember values (300, 'Reviewer 3', 'Love movies');
insert into mmember values (400, 'Reviewer 4', 'Love movies');
insert into mmember values (500, 'Reviewer 5', 'Love movies');

INSERT
INTO ACTOR VALUES
  (
    'Matt Damon',
    'Matthew Paige Damon',
    'Boston MA',
    '09-Oct-1970'
  );
INSERT
INTO ACTOR VALUES
  (
    'Jessica Chastain',
    'Jessica Michelle Chastain',
    'Sacramento CA',
    '24-MAR-1977'
  );
INSERT
INTO ACTOR VALUES
  (
    'Dylan O''Brien',
    'Dylan O''Brien',
    'New York NJ',
    '26-Aug-1991'
  );
INSERT
INTO ACTOR VALUES
  (
    'Mark Hamill',
    'Mark Richard Hamill',
    'Oakland CA',
    '25-Sep-1951'
  );
INSERT
INTO ACTOR VALUES
  (
    'Gwendoline Christie',
    'Gwendoline Christie',
    'Sussex England',
    '26-Aug-1978'
  );
INSERT
INTO actor VALUES
  (
    'Brad Pitt',
    'William Bradley Pitt',
    'Shawnee Oklahoma',
    '18-Dec-1983'
  );
INSERT
INTO actor VALUES
  (
    'George Clooney',
    'George Timothy Clooney',
    'Lexington Kentucky',
    '6-May-1961'
  );
  
insert into actor (stage_name) values ('Ben Affleck');
insert into actor (stage_name) values ('Christian Bale');
insert into actor (stage_name) values ('Morgan Freeman');
insert into actor (stage_name) values ('Nicole Kidman');
insert into actor (stage_name) values ('Val Kilmer');
insert into actor values ('Clint Eastwood','Clint Eastwood','San Fransisco','31-May-1930');
--
INSERT INTO MOVIE VALUES
  ('The Martian (2015)','141','30-Sep-2015',8.6
  );
INSERT INTO MOVIE VALUES
  ('The Maze Runner (2014)','141','30-Sep-2015',6.8
  );
INSERT
INTO MOVIE VALUES
  (
    'The Bourne Identity (2002)',
    '119',
    '6-Sep-2002',
    7.9
  );
INSERT
INTO MOVIE VALUES
  (
    'Saving Private Ryan(1998)',
    '169',
    '11-Sep-1998',
    8.6
  );
INSERT INTO MOVIE VALUES
  ('Good Will Hunting (1997)','126','6-Mar-1998',8.3
  );
INSERT
INTO MOVIE
  (
    MOVIE_NAME,
    movie_release_date
  )
  VALUES
  (
    'Star Wars: Episode VII - The Force Awakens',
    '01-Dec-2015'
  );
INSERT INTO MOVIE VALUES
  ('Ocean''s Twelve (2004)','125','4-Feb-2005',6.4
  );
INSERT INTO MOVIE VALUES
  ('Ocean''s Eleven (2001)','116','15-Feb-2002',7.8
  );
INSERT INTO MOVIE VALUES
  ('Ocean''s Thirteen (2007)','122','8-Jun-2007',6.9
  );
  insert into movie(movie_name) values('Interstellar (2014)');
insert into movie(movie_name) values('The Monuments Men (2014)');
insert into movie(movie_name) values('Gravity (2013)');
insert into movie(movie_name) values('Argo (2012)');
insert into movie(movie_name) values('The American (2010)');
insert into movie(movie_name) values('Invictus (2009)');
insert into movie(movie_name) values('The Bourne Ultimatum (2007)');
insert into movie(movie_name) values('Syriana (2005)');
insert into movie(movie_name) values('The Bourne Supremacy (2004)');
insert into movie(movie_name) values('Solaris (2002)');
insert into movie(movie_name) values('Batman and Robin (1997)');
insert into movie(movie_name) values('The Peacemaker (1997)');
insert into movie(movie_name) values('The Dark Knight Rises (2012)');
insert into movie(movie_name) values('The Dark Knight (2008)');
insert into movie(movie_name) values('Batman Forever (1995)');
--
alter table movie add director varchar2(60);
update movie set director = 'Ben Affleck' where movie_name like 'Argo%';
update movie set director = 'George Clooney' where movie_name like '%Monuments%';
update movie set director = 'A.N. Other' where director is null;
insert into movie values ('Play Misty for me.',102,'28-Jan-1972',7,'Clint Eastwood');
update movie set director = 'Clint Eastwood' where movie_name like 'Invictus%';

insert into role values ('Clint Eastwood','Play Misty for me.','Dave');
insert into role values('Matt Damon', 'Interstellar (2014)', 'Mann');
insert into role values('George Clooney', 'The Monuments Men (2014)', 'Frank Stokes');
insert into role values('Matt Damon', 'The Monuments Men (2014)', 'James Granger');
insert into role values('George Clooney', 'Gravity (2013)', 'Matt Kowalski');
insert into role values('Ben Affleck', 'Argo (2012)', 'Tony Mendez');
insert into role values('George Clooney', 'The American (2010)', 'Jack');
insert into role values('George Clooney', 'The American (2010)', 'Edward');
insert into role values('Matt Damon', 'Invictus (2009)', 'Francois Pienaar');
insert into role values('Morgan Freeman', 'Invictus (2009)', 'Nelson Mandela');
insert into role values('George Clooney', 'Ocean''s Thirteen (2007)', 'Danny Ocean');
insert into role values('Matt Damon', 'Ocean''s Thirteen (2007)', 'Linus Caldwell');
insert into role values('Matt Damon', 'Ocean''s Thirteen (2007)', 'Lenny Pepperidge');
insert into role values('Matt Damon', 'The Bourne Ultimatum (2007)', 'Jason Bourne');
insert into role values('George Clooney', 'Syriana (2005)', 'Bob Barnes');
insert into role values('Matt Damon', 'Syriana (2005)', 'Bryan Woodman');
insert into role values('George Clooney', 'Ocean''s Twelve (2004)', 'Danny Ocean');
insert into role values('Matt Damon', 'Ocean''s Twelve (2004)', 'Linus Caldwell');
insert into role values('Matt Damon', 'The Bourne Supremacy (2004)', 'Jason Bourne');
insert into role values('George Clooney', 'Solaris (2002)', 'Chris Kelvin');
insert into role values('Matt Damon', 'The Bourne Identity (2002)', 'Jason Bourne');
insert into role values('George Clooney', 'Ocean''s Eleven (2001)', 'Danny Ocean');
insert into role values('Matt Damon', 'Ocean''s Eleven (2001)', 'Linus Caldwell');
insert into role values('George Clooney', 'Batman and Robin (1997)', 'Batman');
insert into role values('George Clooney', 'Batman and Robin (1997)', 'Bruce Wayne');
insert into role values('Ben Affleck', 'Good Will Hunting (1997)', 'Chuckie Sullivan');
insert into role values('Matt Damon', 'Good Will Hunting (1997)', 'Will Hunting');
insert into role values('George Clooney', 'The Peacemaker (1997)', 'Lt. Col. Thomas Devoe');
insert into role values('Nicole Kidman', 'The Peacemaker (1997)', 'Dr. Julia Kelly');
insert into role values('Christian Bale', 'The Dark Knight Rises (2012)', 'Batman');
insert into role values('Christian Bale', 'The Dark Knight Rises (2012)', 'Bruce Wayne');
insert into role values('Christian Bale', 'The Dark Knight (2008)', 'Batman');
insert into role values('Christian Bale', 'The Dark Knight (2008)', 'Bruce Wayne');
insert into role values('Nicole Kidman', 'Batman Forever (1995)', 'Dr. Chase Meridian');
insert into role values('Val Kilmer', 'Batman Forever (1995)', 'Batman');
insert into role values('Val Kilmer', 'Batman Forever (1995)', 'Bruce Wayne');



INSERT INTO ROLE VALUES
  ('Brad Pitt','Ocean''s Twelve (2004)','Rusty Ryan'
  );

INSERT INTO ROLE VALUES
  ('Brad Pitt','Ocean''s Thirteen (2007)','Rusty Ryan'
  );
INSERT
INTO ROLE VALUES
  (
    'Jessica Chastain',
    'The Martian (2015)',
    'Melissa Lewis'
  );
INSERT INTO ROLE VALUES
  ('Dylan O''Brien','The Maze Runner (2014)','Thomas'
  );

INSERT
INTO ROLE VALUES
  (
    'Matt Damon',
    'Saving Private Ryan(1998)',
    'Private Ryan'
  );

insert into review values ('Argo (2012)', 100,'Great movie',2);                                                                                              
insert into review values ('Argo (2012)', 200,'Okay movie',5);                                                                                               
insert into review values ('Argo (2012)', 300,'Bad movie',5);                                                                                                
insert into review values ('Argo (2012)', 400,'Good movie',4);                                                                                               
insert into review values ('Argo (2012)', 500,'Not a Great movie',3);                                                                                        
insert into review values ('Batman Forever (1995)', 100,'Great movie',2);                                                                                     
insert into review values ('Batman Forever (1995)', 200,'Okay movie',2);                                                                                      
insert into review values ('Batman Forever (1995)', 300,'Bad movie',4);                                                                                       
insert into review values ('Batman Forever (1995)', 400,'Good movie',1);                                                                                      
insert into review values ('Batman Forever (1995)', 500,'Not a Great movie',4);                                                                               
insert into review values ('Batman and Robin (1997)', 100,'Great movie',3);                                                                                  
insert into review values ('Batman and Robin (1997)', 200,'Okay movie',3);                                                                                   
insert into review values ('Batman and Robin (1997)', 300,'Bad movie',4);                                                                                    
insert into review values ('Batman and Robin (1997)', 400,'Good movie',2);                                                                                   
insert into review values ('Batman and Robin (1997)', 500,'Not a Great movie',5);                                                                            
insert into review values ('Good Will Hunting (1997)', 100,'Great movie',3);                                                                                  
insert into review values ('Good Will Hunting (1997)', 200,'Okay movie',2);                                                                                   
insert into review values ('Good Will Hunting (1997)', 300,'Bad movie',3);                                                                                    
insert into review values ('Good Will Hunting (1997)', 400,'Good movie',1);                                                                                   
insert into review values ('Good Will Hunting (1997)', 500,'Not a Great movie',2);                                                                            
insert into review values ('Good Will Hunting (1997)', 100,'Great movie',2);                                                                                 
insert into review values ('Good Will Hunting (1997)', 200,'Okay movie',5);                                                                                  
insert into review values ('Good Will Hunting (1997)', 300,'Bad movie',3);                                                                                   
insert into review values ('Good Will Hunting (1997)', 400,'Good movie',4);                                                                                  
insert into review values ('Good Will Hunting (1997)', 500,'Not a Great movie',4);                                                                           
insert into review values ('Gravity (2013)', 100,'Great movie',3);                                                                                           
insert into review values ('Gravity (2013)', 200,'Okay movie',3);                                                                                            
insert into review values ('Gravity (2013)', 300,'Bad movie',3);                                                                                             
insert into review values ('Gravity (2013)', 400,'Good movie',2);                                                                                            
insert into review values ('Gravity (2013)', 500,'Not a Great movie',2);                                                                                     
insert into review values ('Interstellar (2014)', 100,'Great movie',1);                                                                                      
insert into review values ('Interstellar (2014)', 200,'Okay movie',3);                                                                                       
insert into review values ('Interstellar (2014)', 300,'Bad movie',4);                                                                                        
insert into review values ('Interstellar (2014)', 400,'Good movie',5);                                                                                       
insert into review values ('Interstellar (2014)', 500,'Not a Great movie',3);                                                                                
insert into review values ('Invictus (2009)', 100,'Great movie',3);                                                                                          
insert into review values ('Invictus (2009)', 200,'Okay movie',5);                                                                                           
insert into review values ('Invictus (2009)', 300,'Bad movie',4);                                                                                            
insert into review values ('Invictus (2009)', 400,'Good movie',3);                                                                                           
insert into review values ('Invictus (2009)', 500,'Not a Great movie',5);                                                                                    
insert into review values ('Ocean''s Eleven (2001)', 100,'Great movie',1);                                                                                    
insert into review values ('Ocean''s Eleven (2001)', 200,'Okay movie',5);                                                                                     
insert into review values ('Ocean''s Eleven (2001)', 300,'Bad movie',4);                                                                                      
insert into review values ('Ocean''s Eleven (2001)', 400,'Good movie',1);                                                                                     
insert into review values ('Ocean''s Eleven (2001)', 500,'Not a Great movie',4);                                                                              
insert into review values ('Ocean''s Thirteen (2007)', 100,'Great movie',3);                                                                                  
insert into review values ('Ocean''s Thirteen (2007)', 200,'Okay movie',2);                                                                                   
insert into review values ('Ocean''s Thirteen (2007)', 300,'Bad movie',5);                                                                                    
insert into review values ('Ocean''s Thirteen (2007)', 400,'Good movie',2);                                                                                   
insert into review values ('Ocean''s Thirteen (2007)', 500,'Not a Great movie',3);                                                                            
insert into review values ('Ocean''s Twelve (2004)', 100,'Great movie',2);                                                                                    
insert into review values ('Ocean''s Twelve (2004)', 200,'Okay movie',3);                                                                                     
insert into review values ('Ocean''s Twelve (2004)', 300,'Bad movie',5);                                                                                      
insert into review values ('Ocean''s Twelve (2004)', 400,'Good movie',3);                                                                                     
insert into review values ('Ocean''s Twelve (2004)', 500,'Not a Great movie',5);                                                                              
insert into review values ('Saving Private Ryan(1998)', 100,'Great movie',4);                                                                                 
insert into review values ('Saving Private Ryan(1998)', 200,'Okay movie',3);                                                                                  
insert into review values ('Saving Private Ryan(1998)', 300,'Bad movie',4);                                                                                   
insert into review values ('Saving Private Ryan(1998)', 400,'Good movie',4);                                                                                  
insert into review values ('Saving Private Ryan(1998)', 500,'Not a Great movie',4);                                                                           
insert into review values ('Solaris (2002)', 100,'Great movie',1);                                                                                           
insert into review values ('Solaris (2002)', 200,'Okay movie',1);                                                                                            
insert into review values ('Solaris (2002)', 300,'Bad movie',3);                                                                                             
insert into review values ('Solaris (2002)', 400,'Good movie',5);                                                                                            
insert into review values ('Solaris (2002)', 500,'Not a Great movie',3);                                                                                     
insert into review values ('Star Wars: Episode VII - The Force Awakens', 100,'Great movie',5);                                                                
insert into review values ('Star Wars: Episode VII - The Force Awakens', 200,'Okay movie',2);                                                                 
insert into review values ('Star Wars: Episode VII - The Force Awakens', 300,'Bad movie',2);                                                                  
insert into review values ('Star Wars: Episode VII - The Force Awakens', 400,'Good movie',1);                                                                 
insert into review values ('Star Wars: Episode VII - The Force Awakens', 500,'Not a Great movie',1);                                                          
insert into review values ('Syriana (2005)', 100,'Great movie',3);                                                                                           
insert into review values ('Syriana (2005)', 200,'Okay movie',2);                                                                                            
insert into review values ('Syriana (2005)', 300,'Bad movie',1);                                                                                             
insert into review values ('Syriana (2005)', 400,'Good movie',3);                                                                                            
insert into review values ('Syriana (2005)', 500,'Not a Great movie',4);                                                                                     
insert into review values ('The American (2010)', 100,'Great movie',2);                                                                                      
insert into review values ('The American (2010)', 200,'Okay movie',4);                                                                                       
insert into review values ('The American (2010)', 300,'Bad movie',3);                                                                                        
insert into review values ('The American (2010)', 400,'Good movie',5);                                                                                       
insert into review values ('The American (2010)', 500,'Not a Great movie',5);                                                                                
insert into review values ('The Bourne Identity (2002)', 100,'Great movie',5);                                                                                
insert into review values ('The Bourne Identity (2002)', 200,'Okay movie',4);                                                                                 
insert into review values ('The Bourne Identity (2002)', 300,'Bad movie',3);                                                                                  
insert into review values ('The Bourne Identity (2002)', 400,'Good movie',5);                                                                                 
insert into review values ('The Bourne Identity (2002)', 500,'Not a Great movie',5);                                                                          
insert into review values ('The Bourne Identity (2002)', 100,'Great movie',4);                                                                               
insert into review values ('The Bourne Identity (2002)', 200,'Okay movie',2);                                                                                
insert into review values ('The Bourne Identity (2002)', 300,'Bad movie',3);                                                                                 
insert into review values ('The Bourne Identity (2002)', 400,'Good movie',4);                                                                                
insert into review values ('The Bourne Identity (2002)', 500,'Not a Great movie',5);                                                                         
insert into review values ('The Bourne Supremacy (2004)', 100,'Great movie',4);                                                                              
insert into review values ('The Bourne Supremacy (2004)', 200,'Okay movie',2);                                                                               
insert into review values ('The Bourne Supremacy (2004)', 300,'Bad movie',3);                                                                                
insert into review values ('The Bourne Supremacy (2004)', 400,'Good movie',5);                                                                               
insert into review values ('The Bourne Supremacy (2004)', 500,'Not a Great movie',3);                                                                        
insert into review values ('The Bourne Ultimatum (2007)', 100,'Great movie',2);                                                                              
insert into review values ('The Bourne Ultimatum (2007)', 200,'Okay movie',3);                                                                               
insert into review values ('The Bourne Ultimatum (2007)', 300,'Bad movie',2);                                                                                
insert into review values ('The Bourne Ultimatum (2007)', 400,'Good movie',4);                                                                               
insert into review values ('The Bourne Ultimatum (2007)', 500,'Not a Great movie',5);                                                                        
insert into review values ('The Dark Knight (2008)', 100,'Great movie',2);                                                                                    
insert into review values ('The Dark Knight (2008)', 200,'Okay movie',1);                                                                                     
insert into review values ('The Dark Knight (2008)', 300,'Bad movie',2);                                                                                      
insert into review values ('The Dark Knight (2008)', 400,'Good movie',4);                                                                                     
insert into review values ('The Dark Knight (2008)', 500,'Not a Great movie',3);                                                                              
insert into review values ('The Dark Knight Rises (2012)', 100,'Great movie',4);                                                                              
insert into review values ('The Dark Knight Rises (2012)', 200,'Okay movie',5);                                                                               
insert into review values ('The Dark Knight Rises (2012)', 300,'Bad movie',3);                                                                                
insert into review values ('The Dark Knight Rises (2012)', 400,'Good movie',4);                                                                               
insert into review values ('The Dark Knight Rises (2012)', 500,'Not a Great movie',2);                                                                        
insert into review values ('The Martian (2015)', 100,'Great movie',5);                                                                                        
insert into review values ('The Martian (2015)', 200,'Okay movie',4);                                                                                         
insert into review values ('The Martian (2015)', 300,'Bad movie',4);                                                                                          
insert into review values ('The Martian (2015)', 400,'Good movie',5);                                                                                         
insert into review values ('The Martian (2015)', 500,'Not a Great movie',4);                                                                                  
insert into review values ('The Maze Runner (2014)', 100,'Great movie',4);                                                                                    
insert into review values ('The Maze Runner (2014)', 200,'Okay movie',1);                                                                                     
insert into review values ('The Maze Runner (2014)', 300,'Bad movie',3);                                                                                      
insert into review values ('The Maze Runner (2014)', 400,'Good movie',3);                                                                                     
insert into review values ('The Maze Runner (2014)', 500,'Not a Great movie',2);                                                                              
insert into review values ('The Monuments Men (2014)', 100,'Great movie',2);                                                                                 
insert into review values ('The Monuments Men (2014)', 200,'Okay movie',1);                                                                                  
insert into review values ('The Monuments Men (2014)', 300,'Bad movie',3);                                                                                   
insert into review values ('The Monuments Men (2014)', 400,'Good movie',2);                                                                                  
insert into review values ('The Monuments Men (2014)', 500,'Not a Great movie',2);                                                                           
insert into review values ('The Peacemaker (1997)', 100,'Great movie',2);                                                                                    
insert into review values ('The Peacemaker (1997)', 200,'Okay movie',3);                                                                                     
insert into review values ('The Peacemaker (1997)', 300,'Bad movie',1);                                                                                      
insert into review values ('The Peacemaker (1997)', 400,'Good movie',1);                                                                                     
insert into review values ('The Peacemaker (1997)', 500,'Not a Great movie',3); 
COMMIT;
--purge recyclebin; 