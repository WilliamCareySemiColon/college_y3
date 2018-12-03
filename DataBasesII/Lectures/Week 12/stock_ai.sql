CREATE TABLE LOGTABLE (
tabnam varchar2(20),
opname char(3) check (opname in (‘INS’,’UPD’,’DEL’)),
Uname varchar2(20),
Sdate  date);
--
CREATE OR REPLACE TRIGGER stock_AI
AFTER INSERT ON stock
BEGIN
INSERT INTO logtable VALUES(
‘STOCK’,’INS’,TO_CHAR(USER),SYSDATE);
END;
