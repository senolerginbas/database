-- This how we comment out in sql.

--DDL -> Data Definition Language 
-- You can create a new database using following code. 
CREATE database b250Practice;


--How to create a table -> DDL 

--Create a table name as students  
--Define the fields
--Put comma between the field names 
--Specify the data types 
CREATE TABLE students(
	student_no char(7),
	student_name varchar(25),
	student_surname varchar(20),
	note_avg real,
	registration_date date

);

-- DQL -> Data Query Language 
SELECT * FROM students;
--yyyy-mm-dd

--DML -> Data Manipulation Language 
INSERT INTO students VALUES('1245789','Chris','Brown',90.50,'2023-04-20');
INSERT INTO students VALUES('1234567','Leon','Black',44.90,'2010-10-05');
INSERT INTO students VALUES('1245789','Chris2','Brown',90.50,'2023-04-20');
INSERT INTO students VALUES('1234567','Leon2','Black',44.90,'2010-10-05');

--Data places mixes with below code
INSERT INTO students VALUES('1234567','Leon2',44.90,900);


--Insert the data partially 
INSERT INTO students(student_name,student_surname) VALUES('Jane','Blue');

-- now() provides the current date. 
INSERT INTO students VALUES ('3758368','Brat','Pitt',89.78,now());

--ERROR!!!
INSERT INTO students VALUES ('9998875468754676','Brat2','Pitt',89.78,now());


INSERT INTO students VALUES ('9087','Brat2','Pitt',89.78,now());





---- Two ways to create a table 
--First way is that you can create a table from scratch 
--Second way you can get the specified fields from another table you can copy
--and then you can create the table. 

CREATE TABLE students_marks 
AS 
SELECT student_name, student_surname, note_avg FROM students;

SELECT * FROM students_marks;



-- CONSTRAINTS 
-- UNIQUE
--NOT NULL


--Create a customers table 

CREATE TABLE customers(
	customer_no char(5) UNIQUE,
	first_name varchar(25) NOT NULL,
	last_name varchar(25) NOT NULL,
	salary real,
	hiring_date date
	

);
SELECT * FROM customers;

--Insert a record into table !!!
--thanks to muhammed 
INSERT INTO customers VALUES('12378','Enes','Tekin',40000, '2023-04-20');

-- from fatima 
insert into customers values ('65315','f','k',9000.50,'2021-04-20');
insert into customers values ('24789','m','k',44887.90,'2010-10-05');
insert into customers values ('45876','C','b',97880.50,'2021-04-20');
insert into customers values ('15757','L','a',45474.90,'2010-10-05');


--from mr elnur 
INSERT INTO customers VALUES('12345','elnur','asg',120000,'2020-12-12');


-- It is not possible to insert the same customer_no , Because of unique constraints.


--ERRORR!!!!! -> since we used not null constraints for first and last name ,
--it is not possible to leave them empty.
INSERT INTO customers (customer_no, salary,hiring_date) 
VALUES ('28674',787990,'2000-10-03');


INSERT INTO customers (first_name,last_name) VALUES('Jane','Blue');

--Unique means duplicate values are not accepted. 
--It can accept null values and more than one null values. 


-- PRIMARY KEY 
--It doesnt accept null values, duplicate values. 


--First way of assigning primary key 
CREATE TABLE students2(
	student_no char(5) PRIMARY KEY,
	name varchar(20),
	lastname varchar(30),
	not_avg real,
	dob date
);

SELECT * FROM students2;


--Second way of assigning primary key to a field. 

CREATE TABLE stds5(
	student_no char(5),
	name varchar(20),
	lastname varchar(30),
	not_avg real,
	dob date,
	CONSTRAINT stdx PRIMARY KEY (student_no)
);

SELECT * FROM stds5;
--stdx is the name of the primary key 
-- database - schemas - go to tables - constraints - stdx



INSERT INTO stds5 VALUES('12345','Jane','Blue',90.90,'1800-10-10');

--ERRORRR!!! -> PK doesnt accept duplicates
INSERT INTO stds5 VALUES('12345','Jessica','Poland',10.34,'1890-10-10');
--ERRORRR!!! -> PK cant be null
INSERT INTO stds5 (name,lastname) VALUES('Jack','Sparrow');



--FOREIGN KEY 
--thanks to tahereh 
--to connect two tables

-- foreign key accepts duplicates, null is accepted 
-- In a table there can be multiple foreign keys. 


--EXAMPLE 
--Create a table name as suppliers , 
--Create supplier_id, supplier_name, contact_name fields, 

--thanks to elnur 
CREATE TABLE suppliers(
	supplier_id char(5) PRIMARY KEY,
	supplier_name varchar(30),
	contact_name varchar(30)
);

SELECT * FROM suppliers;

--Create one more table name as products, 
--Create supplier_id and product_id fields, 
--Make supplier_id field Foreign Key


--1. Way of assigning a foreign key 
CREATE TABLE products(
	supplier_id char(5),
	product_id char(7),
	FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)

);


SELECT * FROM products;



--2.Way of assigning a foreign key 
--In this way actually we are naming the foreign key. 
CREATE TABLE products2(
	suplr_id char(5),
	product_id char(7),
	CONSTRAINT splrFK  FOREIGN KEY (suplr_id) REFERENCES suppliers(supplier_id)

);

SELECT * FROM products2;













