set serveroutput on 
-----------------------------------------------------------------MYCATEGORY-------------
CREATE OR REPLACE trigger MYCATEGORY_AFTER_INSERT
after insert on MYCATEGORY for each row
begin 
    dbms_output.put_line('MYCATEGORY_AFTER_INSERT');
end;

CREATE OR REPLACE trigger MYCATEGORY_AFTER_delete
after delete on MYCATEGORY for each row
begin 
    dbms_output.put_line('MYCATEGORY_AFTER_delete');
end;
-----------------------------------------------------------------MYMAKER----------------------
CREATE OR REPLACE trigger MYMAKER_AFTER_INSERT
after insert on MYMAKER for each row
begin 
    dbms_output.put_line('MYMAKER_AFTER_INSERT');
end;

CREATE OR REPLACE trigger MYMAKER_AFTER_delete
after delete on MYMAKER for each row
begin 
    dbms_output.put_line('MYMAKER_AFTER_DELETE');
end;
-----------------------------------------------------------------MYPROVIDER----------------------
CREATE OR REPLACE trigger MYPROVIDER_AFTER_INSERT
after insert on MYPROVIDER for each row
begin 
    dbms_output.put_line('MYPROVIDER_AFTER_INSERT');
end;

CREATE OR REPLACE trigger MYPROVIDER_AFTER_delete
after delete on MYPROVIDER for each row
begin 
    dbms_output.put_line('MYPROVIDER_AFTER_DELETE');
end;
-----------------------------------------------------------------MYCUSTOMER----------------------
CREATE OR REPLACE trigger MYCUSTOMER_AFTER_INSERT
after insert on MYCUSTOMER for each row
begin 
    dbms_output.put_line('MYPROVIDER_AFTER_INSERT');
end;

CREATE OR REPLACE trigger MYCUSTOMER_AFTER_delete
after delete on MYCUSTOMER for each row
begin 
    dbms_output.put_line('MYCUSTOMER_AFTER_DELETE');
end;
-----------------------------------------------------------------MYPRODUCT----------------------
CREATE OR REPLACE trigger MYPRODUCT_AFTER_INSERT
after insert on MYPRODUCT for each row
begin 
    dbms_output.put_line('MYPRODUCT_AFTER_INSERT');
end;

CREATE OR REPLACE trigger MYPRODUCT_AFTER_delete
after delete on MYPRODUCT for each row
begin 
    dbms_output.put_line('MYPRODUCT_AFTER_DELETE');
end;
-----------------------------------------------------------------MYBASKET----------------------
CREATE OR REPLACE trigger MYBASKET_AFTER_INSERT
after insert on MYBASKET for each row
begin 
    dbms_output.put_line('MYBASKET_AFTER_INSERT');
end;

CREATE OR REPLACE trigger MYBASKET_AFTER_delete
after delete on MYBASKET for each row
begin 
    dbms_output.put_line('MYBASKET_AFTER_DELETE');
end;
-----------------------------------------------------------------MYOPINION----------------------
CREATE OR REPLACE trigger MYOPINION_AFTER_INSERT
after insert on MYOPINION for each row
begin 
    dbms_output.put_line('MYOPINION_AFTER_INSERT');
end;

CREATE OR REPLACE trigger MYOPINION_AFTER_delete
after delete on MYOPINION for each row
begin 
    dbms_output.put_line('MYOPINION_AFTER_DELETE');
end;
-----------------------------------------------------------------MYORDERING----------------------
CREATE OR REPLACE trigger MYORDERING_AFTER_INSERT
after insert on MYORDERING for each row
begin 
    dbms_output.put_line('MYORDERING_AFTER_INSERT');
end;

CREATE OR REPLACE trigger MYORDERING_AFTER_delete
after delete on MYORDERING for each row
begin 
    dbms_output.put_line('MYORDERING_AFTER_DELETE');
end;
-----------------------------------------------------------------USERS_BD----------------------
CREATE OR REPLACE trigger USERS_BD_AFTER_INSERT
after insert on USERS_BD for each row
begin 
    dbms_output.put_line('USERS_BD_AFTER_INSERT');
end;

CREATE OR REPLACE trigger USERS_BD_AFTER_delete
after delete on USERS_BD for each row
begin 
    dbms_output.put_line('USERS_BD_AFTER_DELETE');
end;