/*
select * from cat;
drop sequence studseq;
purge recyclebin;
create sequence studseq start with 10000;
*/
SET serveroutput ON
DECLARE
  v_prog p_student.prog_code%TYPE     := '&Enter_Programme_Code';
  v_stg p_student.stage_code%TYPE     :=  &Enter_Stage_Code;
  v_name p_student.studentname%TYPE   := '&Enter_Student_Name';
  v_addr p_student.studentaddress%TYPE:= '&EnterStudent_Address';
  v_in_stage INTEGER                  := 0; -- Number currently in stage
  v_capacity INTEGER                  := 0; -- Capacity of stage
  v_sno p_student.studentno%type;

BEGIN
  SELECT capacity INTO v_capacity FROM p_stage
  WHERE (v_prog = prog_code AND v_stg = stage_code);
  SELECT COUNT(*) INTO v_in_stage FROM p_student
  WHERE (v_prog = prog_code AND v_stg = stage_code);
  IF v_in_stage < v_capacity THEN
    v_sno      := 'C17'||studseq.nextval;
    INSERT INTO p_student VALUES
      (v_sno,v_prog,v_stg,v_name,v_addr);
    COMMIT;
    dbms_output.put_line(v_name||' is added, with student number '||v_sno);
  ELSE
    dbms_output.put_line('This stage is full.  The student is not added.');
  END IF;

EXCEPTION
WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Error number '||SQLCODE||
      ' meaning '||SQLERRM||'. Rolling back...');
  ROLLBACK;
END;
/
/*
update p_stage set capacity = 3 where prog_code = 'DT211' and stage_code = 1;
commit;
*/