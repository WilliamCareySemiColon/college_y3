DROP TABLE Sees;
DROP TABLE Patient;
DROP TABLE Doctor;
CREATE TABLE Doctor
(
	D_Id		  number(4)  primary key,
	D_Name		varCHAR2(40)
);
drop sequence docseq;
create sequence docseq;
insert into doctor values (docseq.nextval, 'Dr. Zhivago');
insert into doctor values (docseq.nextval, 'Dr. No');
insert into doctor values (docseq.nextval, 'Dr. Dredd');
insert into doctor values (docseq.nextval, 'Dr. Strangelove');
insert into doctor values (docseq.nextval, 'Dr. Dolittle');


CREATE TABLE Patient
(
	P_Id		  number(4)  primary key,
	P_Name		  VARCHAR2(20)
);
drop sequence patseq;
create sequence patseq;
insert into patient values (patseq.nextval, 'Stanley Kubrick');
insert into patient values (patseq.nextval, 'James Bond');
insert into patient values (patseq.nextval, 'ROM');
insert into patient values (patseq.nextval, 'Fido');
insert into patient values (patseq.nextval, 'Lara');
insert into patient values (patseq.nextval, 'Patricia');
--insert into patient values (patseq.nextval, 'Iron Man');

CREATE TABLE Sees
(
	D_Id		  number(4)  NOT NULL REFERENCES Doctor,
	P_Id		  number(4)  NOT NULL REFERENCES Patient,
	Appt_date	  DATE ,
 PRIMARY KEY (D_Id,P_Id,Appt_date)
);

insert into sees values (1,1,sysdate-40);
insert into sees values (1,2,sysdate-39);
insert into sees values (1,3,sysdate-38);
insert into sees values (1,4,sysdate-37);
insert into sees values (1,5,sysdate-36);
insert into sees values (1,5,sysdate-31);
insert into sees values (1,5,sysdate-26);
insert into sees values (1,5,sysdate-21);
insert into sees values (1,5,sysdate-16);
insert into sees values (1,5,sysdate-11);
insert into sees values (2,1,sysdate-40);
insert into sees values (3,2,sysdate-40);
insert into sees values (3,3,sysdate-40);
insert into sees values (5,4,sysdate-40);
insert into sees values (1,1,sysdate-30);
insert into sees values (1,2,sysdate-20);
insert into sees values (1,3,sysdate-10);
insert into sees values (1,4,sysdate);
commit;



