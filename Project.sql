-- Delete the following table if they exist in the
-- database priviously
drop table ORDERING;
drop table SUPPLIES;
drop table ORDERS;
drop table PRODUCT;
drop table SUPPLIER;
drop table CUSTOMER;
drop table CATAGORY;
drop table COURRIER;

--creation of the table of CUSTOMER
Create table CUSTOMER(
    c_id        integer not null, --lab 03(using not null key constraints)
    name        varchar(30),
    phone       varchar(20),
    email       varchar(20),
    pass        varchar(10) unique --lab 03(using unique key constraints)
);

--lab 03 Modification using alter
alter table CUSTOMER rename column pass to password;
alter table CUSTOMER drop column password;
alter table CUSTOMER add password varchar(10);
alter table CUSTOMER Modify password varchar(10) check(password>1000);

--Adding constraint into table CUSTOMER
alter table CUSTOMER add constraint CUSTOMER_PK primary key(c_id);

--creation of the table of SUPPLIER
Create table SUPPLIER(
    s_id       number(10) not null,
    name       varchar(20),
    phone      number(20),
    address    varchar(20),
    constraint SUPPLIER_PK primary key(s_id)
);

--creation of the table of CATAGORY
create table CATAGORY(
    cat_id              number(10) not null,
    catagory_name       varchar(20),
    primary key(cat_id)
);

--creation of the table of PRODUCT
create table PRODUCT(
    p_id                number(10) not null,
    name                varchar(20),
    price               number(10,2),
    stock               varchar(20),
    s_id                number(10) not null,
    cat_id              number(10) not null,
    primary key(p_id),
    foreign key(s_id) references SUPPLIER(s_id),
    foreign key(cat_id) references CATAGORY(cat_id)
);

--creation of the table of COURRIER
create table COURRIER(
    co_id               number(10) not null,
    name                varchar(20),
    address             varchar(20),
    phone               varchar(20),
    primary key(co_id)
);

--creation of the table of ORDERS
Create table ORDERS(
    o_id                number(10) not null,
    delivery_status     varchar(5),
    quantity            number(5),
    order_date          date,
    p_id                number(10) not null,
    co_id               number(10) not null,
    c_id                number(10) not null,
    primary key(o_id),
    foreign key(c_id) references CUSTOMER(c_id) on delete cascade,
    foreign key(p_id) references PRODUCT(p_id) on Delete cascade,
    foreign key(co_id) references COURRIER(co_id) on Delete cascade
);

--creation of the table of ORDERING
create table ORDERING(
    c_id                number(10) not null,
    p_id                number(10) not null,
    foreign key(c_id)   references CUSTOMER(c_id),
    foreign key(p_id)   references PRODUCT(p_id)
);

--creation of the table of SUPPLIES
create table SUPPLIES(
    s_id                number(10) not null,
    p_id                number(10) not null,
    foreign key(s_id)   references SUPPLIER(s_id),
    foreign key(p_id)   references PRODUCT(p_id)
);

-- Value Insertion into table Customer
insert into CUSTOMER values(1211,'MASHRUR ALAM',   '01711394292', 'alam@gmail.com', '1139');
insert into CUSTOMER values(1212,'RAIHAN IFTEE',   '01711394293', 'iftee@gmail.com', '2378');
insert into CUSTOMER values(1213,'TAQIUL ISLAM',   '01711394294', 'islam@gmail.com', '2919');
insert into CUSTOMER values(1214,'MOMINUR RAHMAN', '01711394295', 'rahman@gmail.com', '5212');
insert into CUSTOMER values(1215,'NAFIUL ALAM',    '01711394296', 'nafiul@gmail.com', '9343');

-- Value Insertion into table SUPPLIER
insert into SUPPLIER values(1311, 'ASIF SAAD',     '01618592834', 'DHAKA');
insert into SUPPLIER values(1312, 'SHAHID HASAN',  '01618592835', 'RAJSHASHI');
insert into SUPPLIER values(1313, 'KAZI ABRAR',    '01618592836', 'KHULNA');
insert into SUPPLIER values(1314, 'ABU TAHER',     '01618592837', 'BORISAL');
insert into SUPPLIER values(1315, 'SANJOY KUMAR',  '01618592838', 'RANGPUR');

-- Value Insertion into table CATAGORY
insert into CATAGORY values(1411, 'HEALTH');
insert into CATAGORY values(1412, 'Electronic');
insert into CATAGORY values(1413, 'Sports');
insert into CATAGORY values(1414, 'Fashion');
insert into CATAGORY values(1415, 'Babies Toys');

-- Value Insertion into table PRODUCT
insert into PRODUCT values(1511, 'Samsung TV', 40000.50, 'YES', 1311, 1412);
insert into PRODUCT values(1512, 'Football',   400.50,   'YES', 1311, 1413);
insert into PRODUCT values(1513, 'Walton TV',  30000,    'NO',  1312, 1412);
insert into PRODUCT values(1514, 'baby car',   2000,     'YES', 1314, 1415);
insert into PRODUCT values(1515, 'MAC',        140000,   'YES', 1313, 1412);

-- Value Insertion into table COURRIER
insert into COURRIER values(1611, 'sundarban',    'dhaka',    '01812546338');
insert into COURRIER values(1612, 'SA paribahan', 'rajshashi','01726982643');
insert into COURRIER values(1613, 'Fox parcel',   'dhaka',    '01526982642');

-- Value Insertion into table ORDERS
insert into ORDERS values(1711, 'NO', 2, '01-JUL-22', 1513, 1611, 1211);
insert into ORDERS values(1712, 'YES', 2, '01-JUN-22', 1514, 1612, 1212);
insert into ORDERS values(1713, 'NO', 2, '02-JUL-22', 1515, 1611, 1211);


--value Insertion into table ORDERING
insert into ORDERING values(1211, 1513);
insert into ORDERING values(1212, 1514);
insert into ORDERING values(1211, 1515);

--value Insertion into table SUPPLIES
insert into SUPPLIES values(1312, 1513);
insert into SUPPLIES values(1314, 1514);
insert into SUPPLIES values(1313, 1515);


SET SERVEROUTPUT ON
BEGIN
DBMS_OUTPUT.PUT_LINE('Data Inserted in each table');
end;
/

--Select operation of the tables
Select * from CUSTOMER;
Select * from SUPPLIER;
Select * from CATAGORY;
Select * from PRODUCT;
Select * from COURRIER;
Select * from ORDERS;
Select * from ORDERING;
Select * from SUPPLIES;


--LAB 02 & 03

--update operation (updating a value)
update ORDERS set quantity = 3 where o_id=1711;
select * from ORDERS;

update ORDERS set quantity = 2 where o_id=1711;
select * from ORDERS;

--delete operation (deleting a row from tags table)
delete from ORDERS where o_id=1711;
select * from ORDERS;

insert into ORDERS values(1711, 'NO', 2, '01-JUL-22', 1513, 1611);
select * from ORDERS;

--calculated field
select (quantity/2) as quantity_divided_by_two from ORDERS; --Giving the column a different name (from lab 04)

--applying conditions
select quantity from ORDERS where o_id=1711;

--Range Search
SELECT name,email FROM CUSTOMER
WHERE c_id BETWEEN 1211 AND 1255;

SELECT name,email FROM CUSTOMER
WHERE c_id not BETWEEN 1212 AND 1255;

--range operators
SELECT name,email FROM CUSTOMER
WHERE c_id>= 1211 and c_id<=1253;

SELECT name,email FROM CUSTOMER
WHERE c_id>= 1211 or c_id<=1255;

--Set membership
SELECT name,email FROM CUSTOMER where c_id in(1211, 1254);

SELECT name,email FROM CUSTOMER where c_id not in(1211, 1254);

--Ordering by column values
SELECT name,email FROM CUSTOMER order by c_id;
SELECT name,email FROM CUSTOMER order by c_id desc;

--Ordering by column values(with multiple columns)
SELECT name,email FROM CUSTOMER order by c_id, name;
SELECT name,email FROM CUSTOMER order by c_id, name desc;

--Use of DISTINCT
select DISTINCT(name) from Customer;




--Lab 04

--Pattern Matching
select name, email from CUSTOMER
where phone like '%017%';

select c_id, name from CUSTOMER
where email like '%@gmail.com%';

--augmented function
select max(price) from PRODUCT;

select min(price) from PRODUCT;

select sum(price) from PRODUCT;

select count(price) from PRODUCT;

select count(*) from PRODUCT;

select avg(price) from PRODUCT;

--GROUP By clause
--To find total number of orders for each customer
SELECT c_id, COUNT(o_id)
FROM ORDERS
GROUP BY c_id;

SELECT c_id, COUNT(o_id)
FROM ORDERS  where delivery_status='NO'
GROUP BY c_id;

--HAVING CLAUSE
select c_id, count(o_id)
from ORDERS 
GROUP by c_id
HAVING c_id > 1210;



--lab 05
--IN
select name, phone, email from CUSTOMER where name in ('MASHRUR ALAM', 'TAQIUL ISLAM', 'NAFIUL ALAM');

--NESTED QUERY
select name, phone, email from CUSTOMER where name in (select name from CUSTOMER where phone like '%017%');

--------------------------------------
--set operations

--union all operation
select name, phone, email from CUSTOMER where name in ('MASHRUR ALAM', 'TAQIUL ISLAM', 'NAFIUL ALAM')
union all
select name, phone, email from CUSTOMER where name in (select name from CUSTOMER where phone like '%017%');

--union
select name, phone, email from CUSTOMER where name in ('MASHRUR ALAM', 'TAQIUL ISLAM', 'NAFIUL ALAM')
union
select name, phone, email from CUSTOMER where name in (select name from CUSTOMER where phone like '%017%');

--INTERSECT
select name, phone, email from CUSTOMER where name in ('MASHRUR ALAM', 'TAQIUL ISLAM', 'NAFIUL ALAM')
INTERSECT
select name, phone, email from CUSTOMER where name in (select name from CUSTOMER where phone like '%017%');

--MINUS
select name, phone, email from CUSTOMER where name in ('MASHRUR ALAM', 'TAQIUL ISLAM', 'NAFIUL ALAM')
MINUS
select name, phone, email from CUSTOMER where name in (select name from CUSTOMER where phone like '%017%');

select name, phone, email from CUSTOMER where name in (select name from CUSTOMER where phone like '%017%')
MINUS
select name, phone, email from CUSTOMER where name in ('MASHRUR ALAM', 'TAQIUL ISLAM', 'NAFIUL ALAM');

--lab 06(Joining multiple tables)
--simple join examples

--Join
select c.c_id, c.name, c.phone from customer c join orders od on c.c_id = od.c_id;

--Natural Join
select c_id, name, phone from customer natural join orders;

--Cross Joins/ Cartesian Products
select c.c_id, c.name, od.o_id from customer c cross join orders od;

--Inner Join
select c.c_id, c.name, od.o_id from customer c inner join orders od on c.c_id = od.c_id;


--LEFT Outer Join
select c.c_id, c.name, od.o_id from customer c left outer join orders od on c.c_id = od.c_id;

--Right Outer Join
select c.c_id, c.name, od.o_id from customer c right outer join orders od on c.c_id = od.c_id;

--FULL Outer Join
select c.c_id, c.name, od.o_id from customer c full outer join orders od on c.c_id = od.c_id;

--Self Join
--(max quantity of a product)
select o.quantity from orders o minus
select o.quantity from orders o join orders o2 on o.quantity < o2.quantity; 

--lab 07,08,09(pl/sql)

--Showing Price of Product after discount using PL/SQL

set SERVEROUTPUT on
declare
    price product.price%type;
    max_price product.price%type;
    p_id1 product.p_id%type;
    name1 product.name%type;
    stock1 product.stock%type;
    discount number(8,2);

BEGIN   
    select max(price) into max_price from product;

    select p_id, name, stock into p_id1, name1, stock1 from product where price in max_price;

    DBMS_OUTPUT.PUT_LINE('The maximum price is : '||max_price ||' with name : '||name1 || ' id : '||p_id1 || ' Instock: '||stock1);

     if max_price <= 20000 then
        discount := max_price*0.10;
     elsif max_price <= 40000 then
        discount := max_price*0.20;
     elsif max_price <= 60000 then
        discount := max_price*0.30;
     elsif max_price <= 80000 then
        discount := max_price*0.40;
     else
        discount := max_price*0.50;
     end if;
     DBMS_OUTPUT.PUT_LINE('The discount of the product is : '||discount);
end;
/
show errors


--showing product description which is in stock using cursor
set SERVEROUTPUT on
declare
    cursor stockCursor is select p_id, name, price, stock from product where stock = 'YES';
    accessVar stockCursor%rowtype;
    rowCounting int;
BEGIN
    open stockCursor;
    select count(*) into rowCounting from product where stock = 'YES';
    DBMS_OUTPUT.PUT_LINE('p_Id  name       price      stock ');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------');
    loop

        fetch stockCursor into accessVar;
        DBMS_OUTPUT.PUT_LINE(accessVar.p_Id || '  '||accessVar.name || ' '||accessVar.price || ' '|| accessVar.stock);
        DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');
exit when stockCursor%rowcount > rowCounting-1;
    end loop;
    close stockCursor;
end;
/

--Insertion into Courrier table using PROCEDURE
create or replace PROCEDURE InsertIntoCourrier(co_id1 COURRIER.co_id%type, name1 COURRIER.name%type, address1 COURRIER.address%type, phone1 COURRIER.phone%type) is
BEGIN
    insert into COURRIER values(co_id1, name1, address1, phone1);
    commit;
end InsertIntoCourrier;
/

--Calling the PROCEDURE for Inserting into COURRIER
SET SERVEROUTPUT ON
BEGIN
    InsertIntoCourrier(1614, 'ant parcel',   'dhaka',    '01526982846');
end;
/

select * from courrier;

--Finding price of product for using FUNCTION
create or replace function PriceOfProduct(p_Id1 PRODUCT.p_Id%type) return number is price1 PRODUCT.price%type;
BEGIN
    select price into price1 from PRODUCT where p_Id = p_Id1;
    return price1;
end PriceOfProduct;
/

--Calling the function for the price of product
set SERVEROUTPUT on
declare
    id PRODUCT.p_Id%type;
BEGIN
    DBMS_OUTPUT.PUT_LINE('The price of product id 1514 is : '|| PriceOfProduct('1514'));
end;
/

--ordering Management(Rollback)
select * from ordering;
delete from ordering;
select * from ordering;
rollback;
select * from ordering;
insert into ordering values(1212, 1513);
savepoint insert1;
insert into ordering values(1212, 1515);
savepoint insert2;
rollback to insert1;
select * from ordering;

--Trigger
create Trigger product_stock
before insert on PRODUCT
for each row
BEGIN
:new.stock := 'YES' || :new.name || '_';
:new.stock := initcap(:new.stock);
end product_stock;
/

--Insert a value to to test trigger
insert into PRODUCT values(1516, 'DSLR', 40000, null, 1311, 1412);

select * from product;

--product value constraints using trigger
create or replace trigger pro_val before insert or update on product
for each row
declare
    val_min constant number(8,2) := 100.0;
    val_max constant number(8,2) := 200000.0;
BEGIN
    if :new.price > val_max or :new.price < val_min then
    RAISE_APPLICATION_ERROR(-20000,'price is too small or large');
    end if;
end;
/

--Insert a value to check trigger
insert into PRODUCT values(1517, 'DSLR', 200, null, 1311, 1412);

--View
create or replace View orders_view as
    select delivery_status, quantity, order_date from orders;

select * from orders_view;

--View testing
select quantity from orders_view where delivery_status='YES';