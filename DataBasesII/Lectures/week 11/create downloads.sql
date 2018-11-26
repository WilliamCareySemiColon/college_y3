 drop table downloaded;
 drop table musiclover;
 drop table musictrack;
  CREATE TABLE MUSICLOVER (L_ID NUMBER(7) primary key, L_NAME VARCHAR2(40));
  CREATE TABLE MUSICTRACK (T_ID NUMBER(7) primary key, T_TITLE VARCHAR2(40), T_ARTIST VARCHAR2(40));
  CREATE TABLE DOWNLOADED (T_ID NUMBER(7) not null, L_ID NUMBER(7) not null, D_DATE DATE,
  primary key (T_ID, L_ID));
REM INSERTING into MUSICLOVER
Insert into MUSICLOVER (L_ID,L_NAME) values (1,'Gerry');
Insert into MUSICLOVER (L_ID,L_NAME) values (2,'Pat');
Insert into MUSICLOVER (L_ID,L_NAME) values (3,'Mike');
Insert into MUSICLOVER (L_ID,L_NAME) values (4,'Eileen');
Insert into MUSICLOVER (L_ID,L_NAME) values (5,'Maya');
Insert into MUSICLOVER (L_ID,L_NAME) values (6,'Carina');
REM INSERTING into MUSICTRACK
Insert into MUSICTRACK (T_ID,T_TITLE,T_ARTIST) values (1,'Bohemian Rhapsody','Queen');
Insert into MUSICTRACK (T_ID,T_TITLE,T_ARTIST) values (2,'We are the Champions','Queen');
Insert into MUSICTRACK (T_ID,T_TITLE,T_ARTIST) values (3,'We Will Rock You','Queen');
Insert into MUSICTRACK (T_ID,T_TITLE,T_ARTIST) values (4,'Don''t Stop Me Now','Queen');
Insert into MUSICTRACK (T_ID,T_TITLE,T_ARTIST) values (5,'Hotel California','Eagles');
Insert into MUSICTRACK (T_ID,T_TITLE,T_ARTIST) values (6,'Desperado','Eagles');
Insert into MUSICTRACK (T_ID,T_TITLE,T_ARTIST) values (7,'Imagine','Lennon');
Insert into MUSICTRACK (T_ID,T_TITLE,T_ARTIST) values (8,'Don''t Look Back in Anger','Oasis');
Insert into MUSICTRACK (T_ID,T_TITLE,T_ARTIST) values (9,'Wonderwall','Oasis');
Insert into MUSICTRACK (T_ID,T_TITLE,T_ARTIST) values (10,'Let There Be Love','Oasis');
Insert into MUSICTRACK (T_ID,T_TITLE,T_ARTIST) values (11,'Stairway to Heaven','Led Zeppelin');
Insert into MUSICTRACK (T_ID,T_TITLE,T_ARTIST) values (12,'Smells Like Teen Spirit','Nirvana');
REM INSERTING into DOWNLOADED
Insert into DOWNLOADED (T_ID,L_ID,D_DATE) values (1,1,to_date('03-AUG-17','DD-MON-RR'));
Insert into DOWNLOADED (T_ID,L_ID,D_DATE) values (1,2,to_date('29-JUL-17','DD-MON-RR'));
Insert into DOWNLOADED (T_ID,L_ID,D_DATE) values (1,3,to_date('24-JUL-17','DD-MON-RR'));
Insert into DOWNLOADED (T_ID,L_ID,D_DATE) values (1,4,to_date('19-JUL-17','DD-MON-RR'));
Insert into DOWNLOADED (T_ID,L_ID,D_DATE) values (1,5,to_date('14-JUL-17','DD-MON-RR'));
Insert into DOWNLOADED (T_ID,L_ID,D_DATE) values (1,6,to_date('02-AUG-17','DD-MON-RR'));
Insert into DOWNLOADED (T_ID,L_ID,D_DATE) values (2,1,to_date('30-JUL-17','DD-MON-RR'));
Insert into DOWNLOADED (T_ID,L_ID,D_DATE) values (3,1,to_date('27-JUL-17','DD-MON-RR'));
Insert into DOWNLOADED (T_ID,L_ID,D_DATE) values (4,1,to_date('24-JUL-17','DD-MON-RR'));
Insert into DOWNLOADED (T_ID,L_ID,D_DATE) values (2,6,to_date('21-JUL-17','DD-MON-RR'));
Insert into DOWNLOADED (T_ID,L_ID,D_DATE) values (6,5,to_date('03-AUG-17','DD-MON-RR'));
Insert into DOWNLOADED (T_ID,L_ID,D_DATE) values (6,6,to_date('01-AUG-17','DD-MON-RR'));
commit;
select * from musiclover join downloaded using (l_id) join musictrack using (t_id) order by l_id;