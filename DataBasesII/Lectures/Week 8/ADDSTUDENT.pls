create or replace FUNCTION ADDSTUDENT(
P_prog p_student.prog_code%TYPE,
P_stg p_student.stage_code%TYPE,
P_name p_student.studentname%TYPE,
P_addr p_student.studentaddress%TYPE)
RETURN VARCHAR2 AS
  v_in_stage INTEGER ;
  v_capacity INTEGER ;
  v_sno p_student.studentno%type;
BEGIN
  SELECT capacity INTO v_capacity FROM p_stage
  WHERE (p_prog = prog_code AND p_stg = stage_code);
  SELECT COUNT(*) INTO v_in_stage FROM p_student
  WHERE (p_prog = prog_code AND p_stg = stage_code);
  IF v_in_stage < v_capacity THEN
    v_sno      := 'C17'||studseq.nextval;
    INSERT INTO p_student VALUES
      (v_sno,p_prog,p_stg,p_name,p_addr);
    COMMIT;
    RETURN  v_sno;
  ELSE
    RETURN NULL;
END IF;
---exception section goes here
EXCEPTION
WHEN OTHERS THEN
  ROLLBACK;
  RAISE;
END ADDSTUDENT;