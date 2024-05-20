---- practice 
CREATE TABLE Cats (
    CatID INT PRIMARY KEY,
    Name VARCHAR(50),
    Breed VARCHAR(50),
    Color CHAR(20),
    Age INT,
    Weight FLOAT
);


INSERT INTO Cats (CatID, Name, Breed, Color, Age, Weight) VALUES
(1, 'Whiskers', 'Persian', 'White', 5, 8.2),
(2, 'Luna', 'Siamese', 'Brown', 3, 6.5),
(3, 'Simba', 'Maine Coon', 'Orange', 4, 10.1),
(4, 'Mittens', 'Tabby', 'Gray', 2, 4.9),
(5, 'Oreo', 'Domestic Shorthair', 'Black and White', 1, 3.7),
(6, 'Tiger', 'Bengal', 'Striped', 6, 12.3),
(7, 'Pink', 'Maine Coon', 'Pink', 5, 10.2),
(8, 'Milo', 'Tabby', 'Orange', 2, 5.2),
(9, 'Loki', 'Siamese', 'Gray', 3, 6.7),
(10, 'Bella', 'Maine Coon', 'Brown', 5, 9.4),
(11, 'Shadow', 'Domestic Shorthair', 'Black', 1, 4.1);

SELECT * FROM Cats;


--UNION -> duplicates arent allowed
--UNION ALL -> duplicates allowed
--INTERSECT -> Common points
--EXCEPT ->


--UNION
-- Write a SQL query to display the list of unique colors and breed of cats that either belong to the 'Tabby' 
-- breed or are older than 4 years using UNION.

SELECT Color FROM Cats WHERE Breed='Tabby' OR Age>4


SELECT  Color,Breed FROM Cats WHERE Breed='Tabby'
UNION 
SELECT  Color,Breed FROM Cats WHERE Age>4

SELECT * FROM Cats

INSERT INTO Cats VALUES (12,'x','Tabby','Orange', 2, 10);

--2- Union with a Condition: Write a SQL query using UNION to list all unique cat names either 
--named 'Loki' or having a weight above 10 kilograms.

--from teacher
SELECT Name FROM Cats WHERE Name ='Loki'
UNION 
SELECT Name FROM Cats WHERE weight >10

--thanks to osman 
SELECT Breed AS Breed_or_name FROM Cats WHERE Name = 'Loki'
UNION
SELECT Name AS Breed_or_name FROM Cats WHERE Weight > 10

--thanks to fatima
select distinct name from cats where name ='Loki'
union
select distinct name from cats where weight > 10;


-- UNION ALL Example: Write a SQL query to list all colors of 'Maine Coon' and 'Tabby' cats,
-- including duplicates, using UNION ALL.
SELECT Breed AS breed_or_color FROM Cats WHERE Breed ='Maine Coon' 
UNION ALL 
SELECT Color AS breed_or_color FROM Cats WHERE Breed ='Tabby'

--INTERSECT is the operation that is used to get the common records of two different queries 
-- 

-- Basic INTERSECT Usage: Write a SQL query that finds cats that are both 'Maine Coon' breed and have a
-- color listed as 'Brown' using INTERSECT.

SELECT * FROM Cats WHERE Breed ='Maine Coon' 
INTERSECT 
SELECT * FROM Cats WHERE Color='Brown'

--ERRORRR!! -> Below code wont return any data because , intersect operation is looking for the common data. 
--But when we get in one query name and in second query color, there is no common data
SELECT Name FROM Cats WHERE Breed ='Maine Coon' 
INTERSECT 
SELECT Color FROM Cats WHERE Color='Brown'


-- Simple EXCEPT Query: Write a SQL query to list all cat names that are of the breed 'Siamese' but not 
-- colored 'Gray' using EXCEPT.

SELECT * FROM Cats WHERE Breed='Siamese' 
EXCEPT 
SELECT * FROM Cats WHERE Color='Gray'


-- Using EXCEPT with Conditions: Write a SQL query to display the breeds of cats that are older than
-- 2 years but exclude those that weigh less than 7 kilograms using EXCEPT.


SELECT Breed FROM Cats WHERE Age>2 
EXCEPT 
SELECT Breed FROM Cats WHERE weight <7

--JOINS
--1) INNER JOIN: It returns common data from two tables. 
--2) LEFT JOIN: Returns all data from the first table 
--3) RIGHT JOIN: Returns all data from the second table
--4) FULL JOIN: Returns all data from both table
--5) SELF JOIN: You will have a single table but you will use it as 2 tables




CREATE TABLE my_companies
(
	company_id CHAR(3),
	company_name VARCHAR(20)
);

INSERT INTO my_companies VALUES (100, 'IBM'); 
INSERT INTO my_companies VALUES (101, 'GOOGLE');
INSERT INTO my_companies VALUES (102, 'MICROSOFT');
INSERT INTO my_companies VALUES (103, 'APPLE');
SELECT * FROM my_companies;
  


CREATE TABLE orders
(
	company_id CHAR(3), 
	order_id CHAR(3), 
	order_date DATE
);
INSERT INTO orders VALUES (101, 11, '17-Apr-2020'); 
INSERT INTO orders VALUES (102, 22, '18-Apr-2020'); 
INSERT INTO orders VALUES (103, 33, '19-Apr-2020'); 
INSERT INTO orders VALUES (104, 44, '20-Apr-2020'); 
INSERT INTO orders VALUES (105, 55, '21-Apr-2020');
SELECT * FROM orders;

--INNER JOIN -- we get the common data of two tables 

--SELECT company name, order id and order date 
--The below code without alias work also 
SELECT my_companies.company_id, my_companies.company_name,orders.order_id, orders.order_date 
FROM my_companies INNER JOIN orders 
ON my_companies.company_id=orders.company_id

--In the below code we used alias to make it shorter
SELECT myc.company_id, myc.company_name,ord.order_id, ord.order_date 
FROM my_companies myc INNER JOIN orders ord
ON myc.company_id=ord.company_id


SELECT * FROM my_companies;

--SELECT company name, order id and order date 

--SUBQUERY 
SELECT company_id, order_id, order_date ,
(SELECT company_name FROM my_companies 
 WHERE my_companies.company_id = orders.company_id ) FROM orders 
 WHERE company_id IN (SELECT company_id FROM my_companies)
 

--2) LEFT JOIN: Returns all data from first table and common data from the second table 
-- Get company_name, order id and order date for the companies in my_companies table 


SELECT mc.company_id, mc.company_name, o.order_id, o.order_date 
FROM my_companies mc LEFT JOIN orders o
ON mc.company_id=o.company_id


SELECT * FROM my_companies
--3) RIGHT JOIN: Returns all data from second table and common data from the first table 
--Get company_name, order id and order date for the companies in my companies table

SELECT o.company_id, mc.company_name, o.order_id, o.order_date 
FROM my_companies mc RIGHT JOIN orders o
ON mc.company_id=o.company_id

--FULL JOIN: Returns all data from two tables 
--Get company_name, order id and order date for the companies in my_companies table


SELECT o.company_id, mc.company_name, o.order_id, o.order_date 
FROM my_companies mc FULL JOIN orders o
ON mc.company_id=o.company_id

--SELF JOIN: Returns the common data from the table itself

CREATE TABLE workers4
(
	id CHAR(2),
	name VARCHAR(20), 
	title VARCHAR(60), 
	manager_id CHAR(2)
);
INSERT INTO workers4 VALUES (1, 'Ali Can', 'SDET', 2);
INSERT INTO workers4 VALUES (2, 'John Walker', 'QA', 3);
INSERT INTO workers4 VALUES (3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers4 VALUES (4, 'Amy Sky', 'CEO', 5);
SELECT * FROM workers4;

--In postgre sql we will use 'INNER JOIN' 
--Oracle 'SELF JOIN'

--John Walker is the manager of Ali Can 

SELECT ws.name AS worker_name , mn.name AS manager_name , mn.title AS manager_title
FROM workers4 ws INNER JOIN workers4 mn
ON ws.manager_id=mn.id


-- DML -> Data Manipulation Language - INSERT, UPDATE , DELETE 
-- DQL -> Data Query Language - SELECT 
-- DDL -> Data Definition Language - CREATE , DROP ,ALTER 














