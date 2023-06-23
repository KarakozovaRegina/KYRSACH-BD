commit;
set serveroutput on
------------------
select count(NAME) from MYPRODUCT;
SELECT * FROM (SELECT * FROM MYPRODUCT ORDER BY id DESC) WHERE ROWNUM = 1;

SELECT * FROM MYPRODUCT
    WHERE CONTAINS(NAME, 'Тоник') > 0;
    
SELECT * FROM MYPRODUCT
    WHERE CONTAINS(COMPONENT, 'малина и мед') > 0;
----------------------------------------------------------------------------------------------------------    
CREATE OR REPLACE PROCEDURE POISK_MYPRODUCT_BY_COMPONENT(MY_COMPONENT IN VARCHAR2) 
  IS
    cursor MY_CURSOR (MY_COMPONENT VARCHAR2) IS
    SELECT * FROM MYPRODUCT
        WHERE CONTAINS(COMPONENT, MY_COMPONENT) > 0;
BEGIN
  FOR PEREMENAY IN MY_CURSOR(MY_COMPONENT) LOOP
    DBMS_OUTPUT.PUT_LINE(PEREMENAY.ID || ' - ' || PEREMENAY.NAME || ' ' || PEREMENAY.COST);
  END LOOP;
END;

BEGIN
 POISK_MYPRODUCT_BY_COMPONENT('малина');
END;
------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PUT_100000_TABLE
AS
BEGIN
  FOR i IN 99960..100000 LOOP
    INSERT INTO MYPRODUCT (ID, NAME, COST,  VOLUME, ID_MYCATEGORY, COMPONENT, ID_MYMAKER)
    VALUES (1+i,'Крем с мкофе',10,20,14, 'лекарственный состав', 24);
  END LOOP;
END;

BEGIN
 PUT_100000_TABLE;
END;
--------------------------------------------------------------

CREATE OR REPLACE PROCEDURE DELETE_100000_TABLE
IS
BEGIN
  FOR i IN 59..100059 LOOP
    DELETE FROM MYPRODUCT
    WHERE MYPRODUCT.ID = i;
  END LOOP;
END;

BEGIN
 DELETE_100000_TABLE;
END;