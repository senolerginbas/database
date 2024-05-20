-- FOREIGN KEY 
--PARENT TABLE
CREATE TABLE employees(
	id char(7) PRIMARY KEY,
	name varchar(25) UNIQUE,
	salary smallint NOT NULL,
	hired_date date
);

SELECT * FROM employees;

INSERT INTO employees VALUES('1000001','Jenifer',12000,'2024-04-04');
INSERT INTO employees VALUES('1000008',null,5000, '2018-04-14');
INSERT INTO employees VALUES('1000004','Veli Han',5000, '2019-04-14');
INSERT INTO employees VALUES('1000005','Mustafa Ali',5000, '2019-04-14');


--ERRORRRR !!!
--INSERT INTO employees VALUES('10006','Mustafa Ali',null, '2019-04-14');

INSERT INTO employees VALUES ('10009','cem',30000,'2018-04-14');

--this code works
INSERT INTO employees VALUES ('','cem2',100,'2018-04-14');
-- null and space character are different from each other.


--ERRORRRR!!!!
INSERT INTO employees VALUES ('','cem3',10000,'2018-04-14');


SELECT * FROM employees;

--CHILD TABLE -> addresses
--adresid, street, state, city
CREATE TABLE addresses(
	address_id char(7),
	street varchar(30),
	state varchar(20),
	city varchar(20),
	CONSTRAINT ad_id FOREIGN KEY (address_id) REFERENCES employees (id)
	
);
SELECT * FROM addresses;
--yyyy-mm-dd


--ERRORRR!
INSERT INTO addresses VALUES('10003','X street','X state','X city');
--If in the parent table as primary key you dont have the data (id),
--then you can not creaate a record using that id in the child table 
--cause system tries to create it as a foreign key.

INSERT INTO addresses VALUES('1000004','X street','X state','X city');
/*
employees (PARENT)-> id field -> PK 
addresses (CHILD) -> address_id-> FK

--When you try to add a new record into addresses table , you have to make sure the FK is already exist in the parent table 
*/

--ERRROR!!!
INSERT INTO  addresses VALUES('102','street A','state A','city A');

INSERT INTO  addresses VALUES('1000008','street A','state A','city A');

--Below code works since FK accepts null values 
INSERT INTO addresses VALUES (NULL,'Uzunh','Ohio','X');

INSERT INTO addresses VALUES ('1000008','Uzunh','Ohio','X');

SELECT * FROM addresses;


--CHECK CONSTRAINT 

CREATE TABLE employees2(
	
	id char(7) PRIMARY KEY,
	name varchar(25) UNIQUE,
	salary int CHECK (salary>5000) NOT NULL,
	hired_date date

);

SELECT * FROM employees2;

INSERT INTO employees2 VALUES('1000001','Eric Court', 20000, '2018-04-06');
INSERT INTO employees2 VALUES('1000003','Jennifer K', 40000, '2018-04-06');
INSERT INTO employees2 VALUES('1000004','Johnson S', 70000, '2018-04-06');
INSERT INTO employees2 VALUES('1000005','George L', 9000, '2018-04-06');


--ERRORRRR!!! -> Since the salary is less than 5000 it does not satisfy the condition.
--INSERT INTO employees2 VALUES('1000002','Melisa Jackson', 700, '2018-04-06');

--DQL -> Data Query Language - SELECT 
SELECT * FROM employees2;

--How we get only one column
SELECT name FROM employees2;

--Get from database names and the salary columns
SELECT name, salary FROM employees2;

--Get id and hired_date and name columns from employees2 table
--thanks to fatima and elnur 
select id,name, hired_date from employees2;

SELECT * FROM employees2;
--WHERE -> Filter 

-- EXP: list the names,salary whose salary is greater than 20000 from employees2 table. 
SELECT name,salary FROM employees2 WHERE salary>20000;


--Get the record whose name is George L from employees2 table, all the data .

SELECT * FROM employees2 WHERE name='George L';

--Get all the records whose salary is 20000; 
--thanks to fatima, jalil , elnur 
Select * from employees2 where salary = 20000;

--DELETE 

SELECT * FROM addresses;
--Delete from addresses table the record whichs city is X city

DELETE FROM addresses WHERE city= 'X city';

DELETE FROM addresses WHERE address_id='1000008' AND state='Ohio';

--DML 
--The below code deletes all the data from the table .
DELETE FROM addresses;
DELETE FROM employees2;
SELECT * FROM employees2;

--DDL
--The below code deletes the table itself including the data in it.
DROP TABLE addresses;
DROP TABLE employees2;


--------------------




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


---AND  OR 

-- EXP: Delete the records which brand is Fitbit, Dell.
--The below code wont delete anything cause the condition cant be satisfied.
DELETE FROM DigitalDevices WHERE Brand = 'Fitbit' AND Brand ='Dell';
-->The brand cant be equals to fitbit and dell at the same time. 

DELETE FROM DigitalDevices WHERE Brand = 'Fitbit' OR Brand ='Dell2';


-- EXP:Delete the records whichs Brand is Apple and Model is iPhone 12
--Thanks to jalil, fatima, elnur
delete from digitalDevices where Brand = 'Apple' and Model = 'iPhone 12';

SELECT * FROM DigitalDevices;


--SQL is case insensitive. It doesnt matter if uppercased or lowercased no problem.

--Below code wont delete any data cause we dont have SaMSung in the table we have Samsung.
DELETE FROM DigitalDevices WHERE Brand='SaMSung'; 
--Strings are case sensitive.

DELETE FROM DigitalDevices WHERE Brand='Samsung'; 


--TRUNCATE  -> deletes permanently. - data is deleted permanently. 
TRUNCATE DigitalDevices;


DROP TABLE if exists DigitalDevices;


-----------------------------------------

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

SELECT * FROM stds1;

--Errorrr!!!! -> Below code doesnt work
DELETE FROM stds1 WHERE id='123';
--If FK is exist in the child table , you can not delete from the parent table directly. 
-- It gives errorr, because it is connected , there is a relationship. 
--If you would like to delete firstly you will delete from child table then you can delete from the parent table
--stds1 is the parent table 

DELETE FROM notes1 WHERE std_id='123';



DELETE FROM notes1 WHERE std_id='124';

DELETE FROM stds1 WHERE id='124';




-----------------------



CREATE TABLE stds2
(
id CHAR(3) primary key,
name VARCHAR (50), 
parent_name VARCHAR(50), 
exam_note int);

INSERT INTO stds2 VALUES (123,'Ali Can', 'Hasan', 75); 
INSERT INTO stds2 VALUES (124, 'Merve Gul', 'Ayse',85);
INSERT INTO stds2 VALUES (125, 'Kemal Yasa', 'Hasan',85); 
INSERT INTO stds2 VALUES (126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO stds2 VALUES (127, 'Mustafa Bak', 'Can',99);

SELECT * FROM stds2;



CREATE TABLE notes2 ( 
std_id char (3),
lesson_name varchar (30),
exam_note int,
CONSTRAINT notes2_fk FOREIGN KEY (std_id) REFERENCES stds2(id)
on delete cascade
);

--on delete cascade feature is used in child table creation .


INSERT INTO notes2 VALUES ('123', 'chemistry',75); 
INSERT INTO notes2 VALUES ('124', 'pyhsics',65); 
INSERT INTO notes2 VALUES ('125', 'history',90); 
INSERT INTO notes2 VALUES ('126', 'Maths',90);

SELECT * FROM notes2;


--on delete cascade -> deletes the record even if it is related in another table , without caring the relationship we can delete it.

--The below code will work even if there is a relationship between different table
--The below code deletes the data from also the child table.
--It means if you delete the record from parent it is also deleted from the child table when we use on delete cascade feature.
DELETE FROM stds2 WHERE id='123';

--when we delete from child it wont be deleted from the parent table,it stays.
DELETE FROM notes2 WHERE std_id='124';














