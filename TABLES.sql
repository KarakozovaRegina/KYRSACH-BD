commit;

select * from MYCATEGORY;
select * from MYMAKER;
select * from MYPROVIDER;
select * from MYCUSTOMER;
select * from MYPRODUCT;
select * from MYBASKET;
select * from MYOPINION;
select * from MYORDERING;
select * from USERS_BD;

drop table MYPRODUCT;
drop table MYCUSTOMER;
drop table MYBASKET;
drop table MYOPINION;
drop table MYPROVIDER;
drop table MYMAKER;
drop table MYCATEGORY;
drop table MYORDERING;
drop table USERS_BD;
---------------------------------------------------------------------------------TABLES-----------------------------------------------------------------------------------------
create table MYCATEGORY(
    ID number primary key,
    NAME varchar2(50)
)

create table MYMAKER(
    ID number primary key,
    NAME varchar2(50),
    COUNTRY varchar2(50),
    TELEPHONE varchar2(50),
    EMAIL varchar2(50),
    WEBSITE varchar2(50),
    RATING number---������� ������������� �� ������ ������� �����������
)

create table MYPROVIDER(
    ID number primary key,
    NAME varchar2(50),
    TELEPHONE varchar2(50),
    EMAIL varchar2(70),
    ADDRESS varchar2(70)
)

create table MYCUSTOMER(
    ID number primary key,
    NAME varchar2(100),
    EMAIL varchar2(50),
    LOGIN varchar2(50),
    DATE_REGISTRATION date
)

create table MYPRODUCT(
    ID number primary key,
    NAME varchar2(50),
    COST number,
    VOLUME number,
    ID_MYCATEGORY number,
    COMPONENT varchar2(200),
    ID_MYMAKER number
)

create table MYBASKET(
    ID number primary key ,
    ID_MYCUSTOMER number,
    ID_MYPRODUCT number,
    
    FOREIGN KEY (ID_MYCUSTOMER)
    REFERENCES MYCUSTOMER(ID),
    FOREIGN KEY (ID_MYPRODUCT)
    REFERENCES MYPRODUCT(ID)
)
  

create table MYOPINION(
    ID number primary key,
    ID_MYCUSTOMER number,
    ID_MYPRODUCT number,
    MYCOMMENT varchar2(200),
    
    FOREIGN KEY (ID_MYCUSTOMER)
    REFERENCES MYCUSTOMER(ID),
    FOREIGN KEY (ID_MYPRODUCT)
    REFERENCES MYPRODUCT(ID)
)

create table MYORDERING(
    ID number primary key,
    ID_MYCUSTOMER number,
    ID_MYPRODUCT number,
    ID_MYPROVIDER number,
    DATE_ORDERING date,
    STATUS varchar2(20),
    
    FOREIGN KEY (ID_MYCUSTOMER)
    REFERENCES MYCUSTOMER(ID),
    FOREIGN KEY (ID_MYPRODUCT)
    REFERENCES MYPRODUCT(ID),
    FOREIGN KEY (ID_MYPROVIDER)
    REFERENCES MYPROVIDER(ID)
)

CREATE table USERS_BD(
     ID number primary key,
     NAME varchar2(50),
     LOGIN varchar2(50)
)
---------------------------------------------------------------------------------INSERT-----------------------------------------------------
INSERT INTO MYCATEGORY (ID, NAME) VALUES(12,'��������');
INSERT INTO MYCATEGORY (ID, NAME) VALUES(13,'�����');
INSERT INTO MYCATEGORY (ID, NAME) VALUES(14,'����');

INSERT INTO MYMAKER (ID, NAME, COUNTRY, TELEPHONE, EMAIL, WEBSITE, RATING) VALUES(22,'Dior','���','+375336646532','dior@mail.ru','dior.by',9);
INSERT INTO MYMAKER (ID, NAME, COUNTRY, TELEPHONE, EMAIL, WEBSITE, RATING) VALUES(23,'Lancome ','��������','+375298876543','lancome@mail.ru','lancome.by',8);
INSERT INTO MYMAKER (ID, NAME, COUNTRY, TELEPHONE, EMAIL, WEBSITE, RATING) VALUES(24,'Estee','������','+375294677676','estee@mail.ru','estee.by',7);

INSERT INTO MYPROVIDER (ID, NAME, TELEPHONE, EMAIL, ADDRESS) VALUES(32,'���� ��������','+375336336532','saske@email.ru','��������,�����,�� ������� �21');
INSERT INTO MYPROVIDER (ID, NAME, TELEPHONE, EMAIL, ADDRESS) VALUES(33,'������� �������� �����','+375298876556','naruto@mail.ru','��������,�����,�� ������ �31');
INSERT INTO MYPROVIDER (ID, NAME, TELEPHONE, EMAIL, ADDRESS) VALUES(34,'������ ������','+375294677699','kakashi@mail.ru','��������,�����,�� ���� �11');

INSERT INTO MYCUSTOMER (ID, NAME, EMAIL, LOGIN, DATE_REGISTRATION) VALUES (41,'���������� ������ ����������','regina@mail.ru','1111','01-03-08');
INSERT INTO MYCUSTOMER (ID, NAME, EMAIL, LOGIN, DATE_REGISTRATION) VALUES (42,'���������� ����� ��������','mary@mail.ru','2222','22-03-08');
INSERT INTO MYCUSTOMER (ID, NAME, EMAIL, LOGIN, DATE_REGISTRATION) VALUES (43,'���� �������� ��������','shino@mail.ru','3333','23-05-01');

INSERT INTO MYPRODUCT (ID, NAME, COST,  VOLUME, ID_MYCATEGORY, COMPONENT, ID_MYMAKER) VALUES (54,'��������',10,10,12,'����� � �������', 22);
INSERT INTO MYPRODUCT (ID, NAME, COST,  VOLUME, ID_MYCATEGORY, COMPONENT, ID_MYMAKER) VALUES (55,'�����',11,13,13,'������ � ���', 23);
INSERT INTO MYPRODUCT (ID, NAME, COST,  VOLUME, ID_MYCATEGORY, COMPONENT, ID_MYMAKER) VALUES (56,'����',12,15,14,'������� � ������ ��� �����', 24);

INSERT INTO MYBASKET (ID, ID_MYCUSTOMER, ID_MYPRODUCT) VALUES (61,41,54);
INSERT INTO MYBASKET (ID, ID_MYCUSTOMER, ID_MYPRODUCT) VALUES (62,42,55);
INSERT INTO MYBASKET (ID, ID_MYCUSTOMER, ID_MYPRODUCT) VALUES (63,43,56);
INSERT INTO MYBASKET (ID, ID_MYCUSTOMER, ID_MYPRODUCT) VALUES (71,41,54);
INSERT INTO MYBASKET (ID, ID_MYCUSTOMER, ID_MYPRODUCT) VALUES (72,42,55);
INSERT INTO MYBASKET (ID, ID_MYCUSTOMER, ID_MYPRODUCT) VALUES (73,43,56);

INSERT INTO MYOPINION (ID, ID_MYCUSTOMER, ID_MYPRODUCT, MYCOMMENT) VALUES (81,41,54,'������');
INSERT INTO MYOPINION (ID, ID_MYCUSTOMER, ID_MYPRODUCT, MYCOMMENT) VALUES (82,42,55,'�������');
INSERT INTO MYOPINION (ID, ID_MYCUSTOMER, ID_MYPRODUCT, MYCOMMENT) VALUES (83,43,56,'�����');

INSERT INTO MYORDERING (ID, ID_MYCUSTOMER, ID_MYPRODUCT, ID_MYPROVIDER, DATE_ORDERING, STATUS) VALUES (91,41,54,32,'23-05-05','���������');
INSERT INTO MYORDERING (ID, ID_MYCUSTOMER, ID_MYPRODUCT, ID_MYPROVIDER, DATE_ORDERING, STATUS) VALUES (92,42,55,33,'23-06-05','���������');
INSERT INTO MYORDERING (ID, ID_MYCUSTOMER, ID_MYPRODUCT, ID_MYPROVIDER, DATE_ORDERING, STATUS) VALUES (93,42,56,34,'23-07-05','���������');