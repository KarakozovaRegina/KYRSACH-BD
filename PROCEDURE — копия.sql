commit;


EXECUTE MYBACKET_DELETE_ROW(61);
EXECUTE MYBACKET_INSERT_ROW(61,41,51);


EXECUTE MYORDERING_DELETE_ROW(91);
EXECUTE MYORDERING_INSERT_ROW(91,41,51,32,'23-05-05','доставлен');


DROP procedure MYBACKET_DELETE_ROW;
DROP procedure MYBACKET_INSERT_ROW;
DROP procedure MYORDERING_DELETE_ROW;
DROP procedure MYORDERING_INSERT_ROW;

---------------------------------------------------------------------------MYBACKET---------------------------------------------------------------------------------------
create or replace procedure MYBACKET_DELETE_ROW (ID in number)
as
idd number := ID;
begin
    DELETE FROM MYBASKET
    WHERE MYBASKET.ID = idd;
end;

create or replace procedure MYBACKET_INSERT_ROW (ID in number,ID_MYCUSTOMER in number,ID_MYPRODUCT in number)
as
idd number := ID;
idd_mycustomer number := ID_MYCUSTOMER;
idd_myproduct number := ID_MYPRODUCT;
begin
    INSERT INTO MYBASKET (ID, ID_MYCUSTOMER,ID_MYPRODUCT)VALUES(idd,idd_mycustomer,idd_myproduct);
end;
---------------------------------------------------------------------------ORDERING---------------------------------------------------------------------------------------
create or replace procedure MYORDERING_DELETE_ROW (ID in number)
as
idd number := ID;
begin
    DELETE FROM MYORDERING
    WHERE MYORDERING.ID = idd;
end;

create or replace procedure MYORDERING_INSERT_ROW (ID in number,ID_MYCUSTOMER in number,ID_MYPRODUCT in number,ID_MYPROVIDER in number,DATE_ORDERING in date, STATUS in nvarchar2)
as
begin
    INSERT INTO MYORDERING (ID, ID_MYCUSTOMER, ID_MYPRODUCT, ID_MYPROVIDER, DATE_ORDERING, STATUS)
    VALUES (ID, ID_MYCUSTOMER, ID_MYPRODUCT, ID_MYPROVIDER, DATE_ORDERING, STATUS);
    COMMIT;
    
    EXCEPTION
    -- Обрабатываем исключения
    WHEN OTHERS THEN
        -- Выводим сообщение об ошибке
        DBMS_OUTPUT.PUT_LINE('Ошибка: ' || SQLERRM);
        -- Отменяем изменения в базе данных
        ROLLBACK;
end;


