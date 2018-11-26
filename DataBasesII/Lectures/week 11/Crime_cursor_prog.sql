/*Add a viewer that watches only crime shows*/
SET SERVEROUTPUT ON
DECLARE
  in_viewer viewer.viewer_id%type :=
                  '&Enter_Viewer_id';
  CURSOR crimes IS
    SELECT show_id FROM tv_show
    WHERE show_type LIKE 'Crime';
  thisshow tv_show.show_id%type;
  vnam     viewer.vname%type;
  BEGIN
  SELECT vname INTO vnam FROM viewer WHERE viewer_id LIKE in_viewer;
  OPEN crimes;
  LOOP
    FETCH crimes INTO thisshow;
    EXIT WHEN crimes%notfound;
    INSERT INTO watches VALUES(in_viewer, thisshow);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('There were '|| crimes%rowcount||' viewers who like crime shows.');
  CLOSE CRIMES;
  commit;
EXCEPTION
WHEN TOO_MANY_ROWS THEN
  DBMS_OUTPUT.PUT_LINE('There are too many viewers with this id.');
  ROLLBACK WORK;
WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('This viewer does not exist.');
  ROLLBACK WORK;
WHEN DUP_VAL_ON_INDEX THEN
  DBMS_OUTPUT.PUT_LINE('A viewer was found that already watches crime - the operation has failed.');
  ROLLBACK WORK;
WHEN  OTHERS THEN
  DBMS_OUTPUT.PUT_LINE ('The error '||SQLCODE||' has occurred.'||' meaning '||SQLERRM||'.');
  ROLLBACK WORK;
END;
