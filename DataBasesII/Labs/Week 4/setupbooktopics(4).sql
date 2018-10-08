DROP TABLE Cover;
DROP TABLE Topic;
DROP TABLE Book;
CREATE TABLE Book
(
	book_code CHAR(10)   PRIMARY KEy,
  TITLE varCHAR (28)
);
insert into book values ('CBEGG','Connolly and Begg');
insert into book values ('Fowler','Refactoring in UML');
insert into book values ('Elmasri','Elmasri and Navathe');
insert into book values ('Flint','Java for Beginners');
CREATE TABLE Topic(	Topic_code	  CHAR(10) PRIMARY KEY,
	Topic_description  VARCHAR(28)
);
insert into topic values ('DB','Databases');
insert into topic values ('SE','Software Engineering');

CREATE TABLE Cover
(
	book_code		  CHAR(10)  NOT NULL ,
	Topic_code	  CHAR(10)  NOT NULL ,
PRIMARY KEY (book_code, Topic_code));
insert into cover values ('Elmasri','DB');
insert into cover values ('Elmasri','SE');
insert into cover values ('CBEGG','DB');
insert into cover values ('Fowler','SE');
commit;
