 


/*
EXAMPLE 2
Create a table name as employees, 
Create id, name , salary, hired_date fields. 
Make id primary key, Name Unique, salary not null. 

Create an another table name as addresses, 
Create addres_id, street, state, city fields
Make address_id Foreign key. 
*/

CREATE TABLE employees(
	id char(7) PRIMARY KEY,
	name varchar(25) UNIQUE,
	salary smallint NOT NULL,
	hired_date date
);

SELECT * FROM employees;


CREATE TABLE addresses(
	address_id char(7),
	street varchar(25),
	state varchar(20),
	city varchar(20),
	CONSTRAINT add_id FOREIGN KEY (address_id) REFERENCES employees (id)
);

SELECT * FROM addresses;

-- unique duplicate kabul etmez 

INSERT INTO employees VALUES('10002','Jenifer Lopez',12000, '2018-04-14');
INSERT INTO employees VALUES('10008',null,5000, '2018-04-14');


INSERT INTO employees VALUES('10004','Veli Han',5000, '2019-04-14');
INSERT INTO employees VALUES('10005','Mustafa Ali',5000, '2019-04-14');

--ERRORR!!! -> ISIM unique olacak, maas null olamaz
INSERT INTO employees VALUES('10006','Mustafa Ali',null, '2019-04-14');

--ERRORRR!!
INSERT INTO employees VALUES ('10009','cem','','2018-04-14');



INSERT INTO employees VALUES ('','cem2',100,'2018-04-14');

--null is different from space 
--ERRRORRR!!! -> primary key is already exist
INSERT INTO employees VALUES ('','cem3',100,'2018-04-14');


SELECT * FROM employees;


SELECT * FROM addresses;

--ERRORR!!1   -- > FK is not exist as PK in parent table 
INSERT INTO addresses VALUES('10003','X street','X state','X city');
--******* YOU CAN NOT INSERT THE FK WHICH IS NOT EXIST IN THE Parent table as PK .***** 

--The foreign key should be the same with the primary key which is in the parent table 

INSERT INTO addresses VALUES('10002','X2 street','X2 state','X2 city');


--foreign key can be null. 
INSERT INTO addresses VALUES (null, 'X3 street','X3 State', 'x3  city');


--CHECK CONSTRAINT : It checks the conditions that we define for the data entry  


CREATE TABLE employees2(
	id varchar(10) PRIMARY KEY,
	name varchar(20) UNIQUE,
	salary int CHECK (salary>5000) NOT NULL,
	hired_date date
)
--if salary is greater than 5000 then accept it otherwise reject it. 

SELECT * FROM employees2;

INSERT INTO employees2 VALUES('10001','Eric Court', 20000, '2018-04-06');
INSERT INTO employees2 VALUES('10003','Jennifer K', 40000, '2018-04-06');
INSERT INTO employees2 VALUES('10004','Johnson S', 70000, '2018-04-06');
INSERT INTO employees2 VALUES('10005','George L', 9000, '2018-04-06');

INSERT INTO employees2 VALUES('10006','George L', 19000, '2018-04-06');
INSERT INTO employees2 VALUES('10007','Emin K', 20000, '2018-04-06');

--ERRRRORRR!!!  -> salary cant be less than 5000 
INSERT INTO employees2 VALUES('10002','Melisa Jackson', 700, '2018-04-06');

-- DQL - WHERE usage (filter)

SELECT * FROM employees2;


SELECT name FROM employees2;

SELECT name,salary FROM employees2;


-- EXP: list the names whose salary is greater than 20000 from employees2 table. 
SELECT name,salary FROM employees2 WHERE salary>20000;


--Get the record whose name is George L from employees2 table, all the data .
SELECT * FROM employees2 WHERE name='George L';


--Get all the records whose salary is 20000; 
SELECT * FROM employees2 WHERE salary=20000;


--Delete from addresses table the record whichs city is x city
DELETE FROM addresses WHERE city ='X city';



--DML -> DELETE COMMAND 
--It deleted the data from the table , we didnt delete the table , we deleted the data.
DELETE FROM employees2;
DELETE FROM addresses;

SELECT * FROM employees2;

SELECT * FROM addresses;

--DELETE THE TABLE itself
DROP TABLE employees2;

DROP TABLE addresses;
DROP TABLE employees;

-----------------------------
--SESSION 4

CREATE TABLE DigitalDevices (
    DeviceID INT PRIMARY KEY,
    DeviceName VARCHAR(100),
    Brand VARCHAR(50),
    Model VARCHAR(50),
    Price DECIMAL(10, 2),
    Quantity INT
);

SELECT * FROM DigitalDevices;

-- Inserting Sample Digital Devices
INSERT INTO DigitalDevices (DeviceID, DeviceName, Brand, Model, Price, Quantity) VALUES
(1, 'Laptop', 'Dell', 'Inspiron 15', 899.99, 10),
(2, 'Smartphone', 'Apple', 'iPhone 12', 999.00, 15),
(3, 'Tablet', 'Samsung', 'Galaxy Tab S7', 649.99, 8),
(4, 'Smartwatch', 'Fitbit', 'Versa 3', 229.95, 20),
(5, 'Wireless Earbuds', 'Apple', 'AirPods Pro', 249.00, 12);



-- EXP: Delete the records which brand is Fitbit, Dell.
DELETE FROM DigitalDevices WHERE Brand='Fitbit' OR Brand='Dell';

--When we need both options we use and 



-- EXP:Delete the records whichs Brand is Apple and Model is iPhone 12
DELETE FROM DigitalDevices WHERE Brand= 'Apple' AND Model='iPhone 12';

DELETE FROM DigitalDevices WHERE Brand='SaMSung'; -- Because we dont have SaMSung
--brand we have Samsung brand . case sensitive 



--Recycle bin den permanent silmek gibi. 
-- TRUNCATE command deletes totaly which is not possible to find later.
TRUNCATE DigitalDevices;


--Without error it runs but nothing to delete 
DROP TABLE if exists DigitalDevices;



---------------------------


CREATE TABLE DigitalDevices (
    DeviceID char(3) PRIMARY KEY,
    DeviceName VARCHAR(100),
    Brand VARCHAR(50),
    Model VARCHAR(50),
    Price DECIMAL(10, 2),
    Quantity INT
);

-- Inserting Sample Digital Devices
INSERT INTO DigitalDevices (DeviceID, DeviceName, Brand, Model, Price, Quantity) VALUES
('001' , 'Laptop', 'Dell', 'Inspiron 15', 899.99, 10),
('002' , 'Smartphone', 'Apple', 'iPhone 12', 999.00, 15),
('003' , 'Samsung', 'Galaxy Tab ', 'S7', 649.99, 8),
('004' , 'Fitbit', 'Versa ','3', 229.95, 20),
('005' , 'Apple', 'AirPods ','Pro', 249.00, 12);

select * from DigitalDevices;


-- Creating Users Table with Foreign Key
CREATE TABLE Users (
    UserID char(5),
    UserName VARCHAR(40),
    DeviceID char(3),
    CONSTRAINT Users_fk FOREIGN KEY (DeviceID) REFERENCES DigitalDevices(DeviceID)
	on delete cascade
);
--on delete cascade -> parent child bakmadan delete yapar.


-- Inserting Sample Users
INSERT INTO Users (UserID, UserName, DeviceID) VALUES
('12345','John', '001'), -- John owns a Laptop (DeviceID: 1)
('23456','Alice', '004'), -- Alice owns a Smartphone (DeviceID: 2)
('34567','Bob', '003');   -- Bob owns a Smartwatch (DeviceID: 4)


SELECT * FROM Users;

--EXP: Delete the records whichs UserID is 1. 
DELETE FROM Users WHERE DeviceID='003';
delete from DigitalDevices WHERE DeviceID = '002';

DROP TABLE Users;
DROP TABLE DigitalDevices;


--Parenttan silince childdan da gidiyor. 





-------------------------------------------

CREATE TABLE stds1
(
id CHAR(3) primary key,
name VARCHAR (50), 
parent_name VARCHAR(50), 
exam_note int);

INSERT INTO stds1 VALUES (123,'Ali Can', 'Hasan', 75); 
INSERT INTO stds1 VALUES (124, 'Merve Gul', 'Ayse',85);
INSERT INTO stds1 VALUES (125, 'Kemal Yasa', 'Hasan',85); 
INSERT INTO stds1 VALUES (126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO stds1 VALUES (127, 'Mustafa Bak', 'Can',99);

SELECT * FROM stds1;



CREATE TABLE notes1 ( 
std_id char (3),
lesson_name varchar (30),
exam_note int,
CONSTRAINT notes1_fk FOREIGN KEY (std_id) REFERENCES stds1(id)
--on delete cascade
);
INSERT INTO notes1 VALUES ('123', 'chemistry',75); 
INSERT INTO notes1 VALUES ('124', 'pyhsics',65); 
INSERT INTO notes1 VALUES ('125', 'history',90); 
INSERT INTO notes1 VALUES ('126', 'Maths',90);

SELECT * FROM notes1;


DELETE FROM stds1 WHERE id='123'; 
DELETE FROM notes1 WHERE std_id='124'; 


--EXP: Delete the records whichs UserID is 1. 
DELETE FROM DigitalDevices2 WHERE DeviceID='004';

DROP TABLE notes1;
DROP TABLE stds1;



---------------------------------





CREATE TABLE DigitalDevices2 (
    DeviceID char(3) PRIMARY KEY,
    DeviceName VARCHAR(100),
    Brand VARCHAR(50),
    Model VARCHAR(50),
    Price DECIMAL(10, 2),
    Quantity INT
);

-- Inserting Sample Digital Devices
INSERT INTO DigitalDevices2 (DeviceID, DeviceName, Brand, Model, Price, Quantity) VALUES
('001' , 'Laptop', 'Dell', 'Inspiron 15', 899.99, 10),
('002' , 'Smartphone', 'Apple', 'iPhone 12', 999.00, 15),
('003' , 'Samsung', 'Galaxy Tab ', 'S7', 649.99, 8),
('004' , 'Fitbit', 'Versa ','3', 229.95, 20),
('005' , 'Apple', 'AirPods ','Pro', 249.00, 12);

select * from DigitalDevices2;


-- Creating Users Table with Foreign Key
CREATE TABLE Users2 (
    UserID char(5),
    UserName VARCHAR(40),
    DeviceID char(3),
    CONSTRAINT Users_fk FOREIGN KEY (DeviceID) REFERENCES DigitalDevices2(DeviceID)
	
);
--on delete cascade -> parent child bakmadan delete yapar.


-- Inserting Sample Users
INSERT INTO Users2 (UserID, UserName, DeviceID) VALUES
('12345','John', '001'), -- John owns a Laptop (DeviceID: 1)
('23456','Alice', '004'), -- Alice owns a Smartphone (DeviceID: 2)
('34567','Bob', '003');   -- Bob owns a Smartwatch (DeviceID: 4)


SELECT * FROM Users2;

--EXP: Delete the records whichs UserID is 1. 
DELETE FROM DigitalDevices2 WHERE DeviceID='004';

--Normally we are supposed to delete from child first, than parent , 
-- but we use on cascade feature it deletes the data also from the child directly 
















