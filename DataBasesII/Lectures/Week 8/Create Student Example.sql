/*

Download Oracle express from here :-

https://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/xe-prior-releases-5172097.html

*/

/* Creates - no need to execute if you have these already in your schema */
drop table p_student;
drop table p_stage;
drop table p_programme;
drop sequence studseq;

create table p_programme
(
prog_code varchar2(6) not null,
 prog_name varchar2(50),
 prog_chairperson varchar2(25),
primary key (prog_code)
);
--
insert into p_programme values ('DT228','Degree in Computer Science','Susan McKeever');
insert into p_programme values ('DT211','Degree in Computer Science (Infrastructure)','Patricia O''Byrne');
insert into p_programme values ('DT282','Degree in Computer Science International','Michael Collins');
--
create table p_stage
(
 prog_code varchar2(6) not null,
 stage_code integer not null,
 mentor varchar2(25),
 capacity integer,
primary key (prog_code,stage_code),
foreign key (prog_code) references p_programme
);
--
--
insert into p_stage values ('DT228',1,'Michael Collins',80);
insert into p_stage values ('DT228',2,'Richard Lawlor',80);
insert into p_stage values ('DT228',3,'Susan McKeever',80);
insert into p_stage values ('DT228',4,'Damian Bourke',80);
insert into p_stage values ('DT211',1,'Aneel Rahim',50);
insert into p_stage values ('DT211',2,'Paul Bourke',50);
insert into p_stage values ('DT211',3,'Paul Bourke',50);
insert into p_stage values ('DT211',4,'Brian Keegan',50);
insert into p_stage values ('DT282',1,'Art Sloan',20);
insert into p_stage values ('DT282',2,'Richard Lawlor',20);
insert into p_stage values ('DT282',3,'Diana Carvahlo',20);
insert into p_stage values ('DT282',4,'Svetlana Hensman',20);
--
create table p_student
(
studentNo varchar2(12) not null,
prog_code varchar2(6) not null,
stage_code integer not null,
studentname varchar2(40),
studentAddress varchar2(60),
primary key (studentNo),
foreign key (prog_code,stage_code) references p_stage(prog_code,stage_code)
);
insert into p_student
values ('c88221133','DT228',1,'Joe Bloggs','9 Waintree View, Glasnevin');
insert into p_student 
values ('c88221141','DT228',1,'Joe O''Reilly','8 Terenure Rd, Terenure');
insert into p_student 
values ('c88221165','DT228',2,'Paul Bloggs','9 Waintree View, Glasnevin');
insert into p_student 
values ('c88221122','DT228',1,'Kevin Healy','153 Camden St., Dublin 8');
insert into p_student 
values ('c88224433','DT228',2,'Peter Cahill','Tallaght Drive, Tallaght');
insert into p_student 
values ('c88223333','DT228',2,'Antoine Lafoux','Main St., Dundrum');
insert into p_student 
values ('c88222133','DT228',4,'Ann-Marie Mee','Churchtown Rd., Churchtown');
insert into p_student 
values ('c88226633','DT228',3,'Pauline Quinn','Dartry Rd, Dartry');
insert into p_student 
values ('c88286433','DT228',3,'Jerrad Markham','9 Glasnevin Rd, Glasnevin');
insert into p_student 
values ('c88221364','DT228',4,'Lewis Begg','19 Waintree Drive, Glasnevin');
insert into p_student 
values ('c88211933','DT228',4,'Bing Wu','Fassaugh Rd, Cabra');
insert into p_student 
values ('c88865433','DT211',1,'Raj Sunderraman','Main Rd, Blanchardstown');
insert into p_student 
values ('c88221198','DT211',2,'Colin Ritchie','Doyles Corner, Phibsborough');
insert into p_student 
values ('c88221186','DT211',3,'Dieter Bruegge','554 Main St, Ranelagh');
insert into p_student 
values ('c88221144','DT211',4,'Carol Britton','15 The Green, Rathmines');
insert into p_student 
values ('c88228144','DT282',3,'Arthur Malks','9 the Green, Rathmines');
insert into p_student 
values ('c88225533','DT282',1,'Alan Dillon','54 Ratra Rd, Templeogue');
insert into p_student 
values ('c88222233','DT282',2,'Conor McCarthy','21 Henry St, Dublin 1');
insert into p_student 
values ('c88228833','DT282',4,'Cindy Liu','12 Beaumont Rd, Dalkey');
insert into p_student 
values ('c88221233','DT211',3,'June Barrett','8 Firtree Drive, Templeogue');
insert into p_student 
values ('c88221633','DT211',3,'Kuda Dubewashe','14 Main St, Glasnevin');
commit;

create sequence studseq start with 100000;

CREATE OR REPLACE FUNCTION addstudent(
    p_prog p_student.prog_code%TYPE,
    p_stg p_student.stage_code%TYPE,
    p_name p_student.studentname%TYPE,
    p_addr p_student.studentaddress%TYPE
)
RETURN varchar2 
AS
    v_in_stage integer;
    v_capacity integer;
    v_sno p_student.studentno%type;
BEGIN
    -- whats the max students per stage
    SELECT capacity INTO v_capacity
    FROM p_stage
    WHERE (p_prog = prog_code AND p_stg = stage_code);

    -- how many students are there
    SELECT COUNT(*) INTO v_in_stage
    FROM p_student
    WHERE (p_prog = prog_code AND p_stg = stage_code);

    -- now, check if we can add a new student
    IF v_in_stage < v_capacity THEN
        -- we can - so build the student number from the sequence starting with C17
        v_sno := 'C18'||studseq.nextval;
        -- create a new student record
        INSERT INTO p_student 
        VALUES (v_sno,p_prog,p_stg,p_name,p_addr);
        COMMIT;
        -- return doesn't need to list all return vars - these are taken from return param list.
        RETURN v_sno;
    ELSE
        RETURN NULL;
    END IF;
EXCEPTION
WHEN OTHERS THEN
  ROLLBACK;
  RAISE;
END ADDSTUDENT;
/
-- now pl/sql block to call the new function

-- make sure we can see the server message log
set serveroutput on;
-- just in case this was turned off when tables were created.
set define on;
-- PL/SQL Block
declare
v_prog varchar2(40):='&Prog';
v_stage integer := &Stage;
v_sname varchar2(40):='&Student_Name';
v_addr varchar2(40):='&Address';
v_sno varchar2(15);
begin
 v_sno :=  ADDSTUDENT(v_prog, v_stage, v_sname,v_addr);
 dbms_output.put_line(v_sno);
end;
/