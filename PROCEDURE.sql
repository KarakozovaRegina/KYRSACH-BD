commit;


EXECUTE MYBACKET_DELETE_ROW(61);
EXECUTE MYBACKET_INSERT_ROW(61,41,54);

EXECUTE MYORDERING_DELETE_ROW(93);
EXECUTE MYORDERING_INSERT_ROW(93,41,56,32,'23-06-01','доставлен');

EXECUTE MYMAKER_DELETE_ROW(22);
EXECUTE MYMAKER_INSERT_ROW(22,'Dior','США','+375336646532','dior@mail.ru','dior.by',9);

EXECUTE MYPROVIDER_DELETE_ROW(34);
EXECUTE MYPROVIDER_INSERT_ROW(34,'Какаши Хатаке','+375294677699','kakashi@mail.ru','Беларусь,Минск,ул Мира д11');

EXECUTE MYCUSTOMER_DELETE_ROW(41);
EXECUTE MYCUSTOMER_INSERT_ROW(41,'Каракозова Регина Витальевна','regina@mail.ru','1111','01-03-08');

EXECUTE MYOPINION_DELETE_ROW(100);
EXECUTE MYOPINION_INSERT_ROW(81,41,54,'хорошо');

EXECUTE MYCATEGORY_DELETE_ROW(12);
EXECUTE MYCATEGORY_INSERT_ROW(12,'Умывалка');


EXECUTE MYPRODUCT_DELETE_ROW(100005);
EXECUTE MYPRODUCT_INSERT_ROW(100005,'ПИНГВИН',10,10,12,'масла и кислоты', 22);
SELECT * FROM MYPRODUCT  WHERE NAME='ПИНГВИН';

EXECUTE MYCUSTOMER_UPDATE_ROW('1111','11110');
EXECUTE MYORDERING_UPDATE_ROW(92,'абс');


DROP procedure MYBACKET_DELETE_ROW;
DROP procedure MYBACKET_INSERT_ROW;
DROP procedure MYORDERING_DELETE_ROW;
DROP procedure MYORDERING_INSERT_ROW;
DROP procedure MYCATEGORY_DELETE_ROW;
DROP procedure MYCATEGORY_INSERT_ROW;
DROP procedure MYMAKER_DELETE_ROW;
DROP procedure MYMAKER_INSERT_ROW;
DROP procedure MYPROVIDER_DELETE_ROW;
DROP procedure MYPROVIDER_INSERT_ROW;
DROP procedure MYCUSTOMER_DELETE_ROW;
DROP procedure MYCUSTOMER_INSERT_ROW;
DROP procedure MYPRODUCT_DELETE_ROW;
DROP procedure MYPRODUCT_INSERT_ROW;
DROP procedure MYOPINION_DELETE_ROW;
DROP procedure MYOPINION_INSERT_ROW;
DROP procedure REGISTER_USERS;

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
---------------------------------------------------------------------------MYORDERING---------------------------------------------------------------------------------------
create or replace procedure MYORDERING_DELETE_ROW (ID in number)
as
idd number := ID;
begin
    DELETE FROM MYORDERING
    WHERE MYORDERING.ID = idd;
end;
---
create or replace procedure MYORDERING_UPDATE_ROW (ID in number, NEW_STATUS in varchar2)
as
idd number := ID;
begin
    UPDATE MYORDERING SET STATUS=NEW_STATUS WHERE ID=idd;

end;

---
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
---------------------------------------------------------------------------MYCATEGORY---------------------------------------------------------------------------------------
create or replace procedure MYCATEGORY_DELETE_ROW (ID in number)
as
idd number := ID;
begin
    DELETE FROM MYCATEGORY
    WHERE MYCATEGORY.ID = idd;
end;

create or replace procedure MYCATEGORY_INSERT_ROW (ID in number,NAME in nvarchar2)
as
begin
    INSERT INTO MYCATEGORY (ID, NAME)
    VALUES (ID, NAME);
    COMMIT;
    
    EXCEPTION
    -- Обрабатываем исключения
    WHEN OTHERS THEN
        -- Выводим сообщение об ошибке
        DBMS_OUTPUT.PUT_LINE('Ошибка: ' || SQLERRM);
        -- Отменяем изменения в базе данных
        ROLLBACK;
end;
---------------------------------------------------------------------------MYMAKER---------------------------------------------------------------------------------------
create or replace procedure MYMAKER_DELETE_ROW (ID in number)
as
idd number := ID;
begin
    DELETE FROM MYMAKER
    WHERE MYMAKER.ID = idd;
end;

create or replace procedure MYMAKER_INSERT_ROW (ID in number,NAME in nvarchar2,COUNTRY in nvarchar2,TELEPHONE in nvarchar2,
                                                EMAIL in nvarchar2,WEBSITE in nvarchar2,RATING in number)
as
begin
    INSERT INTO MYMAKER (ID, NAME, COUNTRY, TELEPHONE, EMAIL, WEBSITE, RATING)
    VALUES (ID, NAME, COUNTRY, TELEPHONE, EMAIL, WEBSITE, RATING);
    COMMIT;
    
    EXCEPTION
    -- Обрабатываем исключения
    WHEN OTHERS THEN
        -- Выводим сообщение об ошибке
        DBMS_OUTPUT.PUT_LINE('Ошибка: ' || SQLERRM);
        -- Отменяем изменения в базе данных
        ROLLBACK;
end;

---------------------------------------------------------------------------MYPROVIDER---------------------------------------------------------------------------------------
create or replace procedure MYPROVIDER_DELETE_ROW (ID in number)
as
idd number := ID;
begin
 DELETE FROM MYORDERING
 WHERE MYORDERING.ID_MYPROVIDER = idd;
    
    DELETE FROM MYPROVIDER
    WHERE MYPROVIDER.ID = idd;
end;

create or replace procedure MYPROVIDER_INSERT_ROW (ID in number,NAME in nvarchar2,TELEPHONE in nvarchar2,EMAIL in nvarchar2,ADDRESS in nvarchar2)
as
begin
    INSERT INTO MYPROVIDER (ID, NAME, TELEPHONE, EMAIL, ADDRESS)
    VALUES (ID, NAME, TELEPHONE, EMAIL, ADDRESS);
    COMMIT;
    
    EXCEPTION
    -- Обрабатываем исключения
    WHEN OTHERS THEN
        -- Выводим сообщение об ошибке
        DBMS_OUTPUT.PUT_LINE('Ошибка: ' || SQLERRM);
        -- Отменяем изменения в базе данных
        ROLLBACK;
end;
---------------------------------------------------------------------------MYCUSTOMER---------------------------------------------------------------------------------------
create or replace procedure MYCUSTOMER_DELETE_ROW (ID in number)
as
idd number := ID;
begin
     DELETE FROM MYBASKET
     WHERE MYBASKET.ID_MYCUSTOMER = idd;
     DELETE FROM MYOPINION
     WHERE MYOPINION.ID_MYCUSTOMER = idd;
     DELETE FROM MYORDERING
     WHERE MYORDERING.ID_MYCUSTOMER = idd;
    
    DELETE FROM MYCUSTOMER
    WHERE MYCUSTOMER.ID = idd;
end;

create or replace procedure MYCUSTOMER_UPDATE_ROW (LOGIN in nvarchar2, NEWLOGIN in nvarchar2)
as
LOG number := LOGIN;
begin
    UPDATE MYCUSTOMER SET MYCUSTOMER.LOGIN = NEWLOGIN WHERE MYCUSTOMER.LOGIN = LOG;
end;


create or replace procedure MYCUSTOMER_INSERT_ROW (ID in number,NAME in nvarchar2,EMAIL in nvarchar2,LOGIN in nvarchar2,DATE_REGISTRATION in date)
as
begin
    INSERT INTO MYCUSTOMER (ID, NAME, EMAIL, LOGIN, DATE_REGISTRATION)
    VALUES (ID, NAME, EMAIL, LOGIN, DATE_REGISTRATION);
    COMMIT;
    
    EXCEPTION
    -- Обрабатываем исключения
    WHEN OTHERS THEN
        -- Выводим сообщение об ошибке
        DBMS_OUTPUT.PUT_LINE('Ошибка: ' || SQLERRM);
        -- Отменяем изменения в базе данных
        ROLLBACK;
end;
---------------------------------------------------------------------------MYPRODUCT---------------------------------------------------------------------------------------
create or replace procedure MYPRODUCT_DELETE_ROW (ID in number)
as
idd number := ID;
begin
     DELETE FROM MYBASKET
     WHERE MYBASKET.ID_MYPRODUCT = idd;
     DELETE FROM MYOPINION
     WHERE MYOPINION.ID_MYPRODUCT = idd;
     DELETE FROM MYORDERING
     WHERE MYORDERING.ID_MYPRODUCT = idd;
    
    DELETE FROM MYPRODUCT
    WHERE MYPRODUCT.ID = idd;
end;


create or replace procedure MYPRODUCT_INSERT_ROW (ID in number,NAME in nvarchar2,COST in number,VOLUME in number,ID_MYCATEGORY in number,COMPONENT in nvarchar2,ID_MYMAKER in number)
as
begin
    INSERT INTO MYPRODUCT (ID, NAME, COST,  VOLUME, ID_MYCATEGORY, COMPONENT, ID_MYMAKER)
    VALUES (ID, NAME, COST,  VOLUME, ID_MYCATEGORY, COMPONENT, ID_MYMAKER);
    COMMIT;
    
    EXCEPTION
    -- Обрабатываем исключения
    WHEN OTHERS THEN
        -- Выводим сообщение об ошибке
        DBMS_OUTPUT.PUT_LINE('Ошибка: ' || SQLERRM);
        -- Отменяем изменения в базе данных
        ROLLBACK;
end;
---------------------------------------------------------------------------MYOPINION---------------------------------------------------------------------------------------
create or replace procedure MYOPINION_DELETE_ROW (ID in number)
as
idd number := ID;
begin
    DELETE FROM MYOPINION
    WHERE MYOPINION.ID = idd;
end;


create or replace procedure MYOPINION_INSERT_ROW (ID in number,ID_MYCUSTOMER in number,ID_MYPRODUCT in number,MYCOMMENT in nvarchar2)
as
begin
    INSERT INTO MYOPINION (ID, ID_MYCUSTOMER, ID_MYPRODUCT, MYCOMMENT) VALUES (ID, ID_MYCUSTOMER, ID_MYPRODUCT, MYCOMMENT);
    COMMIT;
    
    EXCEPTION
    -- Обрабатываем исключения
    WHEN OTHERS THEN
        -- Выводим сообщение об ошибке
        DBMS_OUTPUT.PUT_LINE('Ошибка: ' || SQLERRM);
        -- Отменяем изменения в базе данных
        ROLLBACK;
end;
------------------------------------------------------------------REGISTER_USERS---------------------------------------------
CREATE OR REPLACE PROCEDURE REGISTER_USERS (ID in number,NAME_USER IN VARCHAR2, USER_PASSWORD IN VARCHAR2, USER_TABLESPACE IN VARCHAR2) AS
BEGIN
  EXECUTE IMMEDIATE 'CREATE USER '||NAME_USER||' IDENTIFIED BY '||USER_PASSWORD||' DEFAULT TABLESPACE '||USER_TABLESPACE;
  INSERT INTO USERS_BD (ID, NAME, LOGIN) VALUES (ID, NAME_USER, USER_PASSWORD);
END;

DROP procedure REGISTER_USERS;


EXECUTE REGISTER_USERS(224,'MY_NAME_1',1124,'TS_FLORE');
ALTER USER MY_NAME IDENTIFIED BY 1124;
GRANT CREATE SESSION TO MY_NAME_1;


