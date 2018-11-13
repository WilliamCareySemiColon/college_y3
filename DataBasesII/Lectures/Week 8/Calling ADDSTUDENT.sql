set serveroutput on
declare
 v_prog varchar2(40):='&Prog';
 v_stage integer := &Stage;
 v_sname varchar2(40):='&Student_Name';
 v_addr varchar2(60):='&Address';
 v_sno varchar2(10);
 begin
 v_sno :=  ADDSTUDENT(v_prog, v_stage, v_sname,v_addr);
 dbms_output.put_line(v_sno);
 end;