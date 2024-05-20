CREATE TABLE DigitalDevices3 (
    DeviceID char(3) PRIMARY KEY,
    DeviceName VARCHAR(100),
    Brand VARCHAR(50) NOT NULL,
    Model VARCHAR (50) UNIQUE,
    Price DECIMAL(10, 2),
    Quantity INT
);

select * from digitaldevices3;

INSERT INTO DigitalDevices3 (DeviceID, DeviceName, Brand, Model, Price, Quantity) VALUES
('001' , 'Laptop', 'Dell', 'Inspiron 15', 899.99, 10),
('002' , 'Smartphone', 'Apple', 'iPhone 12', 999.00, 15),
('003' , 'Samsung', 'Galaxy Tab ', 'S7', 649.99, 8),
('004' , 'Fitbit', 'Versa ','3', 229.95, 20),
('005' , 'Apple', 'AirPods ','Pro', 249.00, 12);
INSERT INTO DigitalDevices3 VALUES ('011', 'Smartphone', 'Apple', 'iPhone 13', 999.00, 15);


--type code to delete the digital device which id 004
delete from digitaldevices3 where deviceid = '004';
delete from users3 where deviceid='004';
--Without deleting from the child table , you cant delete from the parent table , 
--cause there is a relationship still. 


--on delete cascade 
--when you delete from the parent table , the record also will be deleted from the child table 
-- use this feature while you are creating the child table 

--ddl - drop
---type code to delete the tables
DROP TABLE DigitalDevices3;
--we cannot delete the parent table directly without deleting the child table ;
--to execute using keyboard press f5 or function f5

DROP TABLE Users3;


---EERRORR!!
INSERT INTO DigitalDevices3 VALUES ('004', 'Fitness Tracker', 'Garmin', 'Vivosmart 4', 129.99, 10);



select * from DigitalDevices3;
INSERT INTO DigitalDevices3 VALUES ('010', 'Laptop', 'Dell', 'Inspiron 18', 899.99, 10);



---ERRORR!!
INSERT INTO DigitalDevices3 VALUES ('009', 'E-reader', 'Amazon', 'iPhone 12', 129.99, 15);


--Errrrorrrr!!!
INSERT INTO DigitalDevices3 VALUES('008', 'Gaming Console', 'X', 'PlayStation 5', 499.99, 5);






CREATE TABLE Users3 (
    UserID char(5) UNIQUE,
    UserName VARCHAR(40),
    DeviceID char(3),
    CONSTRAINT Users_fk FOREIGN KEY (DeviceID) REFERENCES DigitalDevices3(DeviceID)
	on delete cascade
);
INSERT INTO Users3 (UserID, UserName, DeviceID) VALUES
('12345','John', '001'), 
('23456','Alice', '004'), 
('34567','Bob', '003');  

select * from digitaldevices3;
SELECT * FROM Users3;
INSERT INTO Users3 VALUES ('12346', 'Alice', null);

delete from digitaldevices3 where deviceid='001';



---EERRRORRR!!1 -> UserId is too long, it is suppose to be at most 5 characters
INSERT INTO Users3 VALUES ('3456865', 'William', '010');


---ERRRORRR!!! -> The foreign key is not included in the parent table 
INSERT INTO Users3 VALUES ('23457', 'Olivia', '015');



----------------------------------------------------------------------

CREATE TABLE customers2 ( 
	product_id int,
	customer_name varchar(50), 
	product_name varchar(50)
);

INSERT INTO customers2 VALUES (10,'Mark', 'Orange');
INSERT INTO customers2 VALUES (10,'Mark', 'Orange');
INSERT INTO customers2 VALUES (20,'John', 'Apple');
INSERT INTO customers2 VALUES (30,'Amy', 'Palm');
INSERT INTO customers2 VALUES (20,'Mark', 'Apple');
INSERT INTO customers2 VALUES (10,'Adem', 'Orange');
INSERT INTO customers2 VALUES (40,'John', 'Apricot');
INSERT INTO customers2 VALUES (20,'Eddie', 'Apple');
SELECT * FROM customers2;

DROP TABLE customers2;


-----------    SQL Conditions 


-- From customers2 table get the data which is product name is orange ,apple or apricot.

--  OR 
SELECT * FROM customers2 WHERE product_name='Orange' 
							OR product_name='Apple' 
							OR product_name='Apricot';
							
							
---The below code wont work cause the
--product name cant be equals to orange apple apricot at the same time.		
--nothing we get
SELECT * FROM customers2 WHERE product_name='Orange' 
						AND product_name='Apple' 
						AND product_name='Apricot';

--code readablity is important 
--code shouldnt be repeating itself 

--IN 

SELECT * FROM customers2 WHERE product_name IN('Orange','Apple','Apricot');

--NOT IN 

-- From customers2 table get the data which is product name is NOT orange ,apple or apricot.
SELECT * FROM customers2 WHERE product_name NOT IN('Orange','Apple','Apricot');

--From customers table get the records which is customername is Mark or amy 
select * from customers2 where customer_name in ('Mark','Amy');
select * from customers2

----AND 
--From customers table get the records which is customername is Mark and
--product name is Orange

SELECT * FROM customers2 where customer_name ='Mark' AND product_name= 'Orange';

--Get the record which is Id 30 and customer_name is Amy.
SELECT * FROM customers2 WHERE product_id='30' AND customer_name ='Amy';


----BETWEEN CONDITION 

--Get the records which is product_id is between 20- 40 
SELECT * FROM customers2 WHERE product_id<40 AND product_id>20;

SELECT * FROM customers2 WHERE product_id<=40 AND product_id>=20;

SELECT * FROM customers2 WHERE product_id BETWEEN 20 AND 40;

----NOT BETWEEN 
SELECT * FROM customers2 WHERE product_id NOT BETWEEN 20 AND 40;



----------------------------------------------------

CREATE TABLE clients
(
	id int,
	name VARCHAR(50),
	city VARCHAR (50),
	salary int,
	company VARCHAR (20)
);


INSERT INTO clients VALUES (123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko'); 
INSERT INTO clients VALUES (234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki'); 
INSERT INTO clients VALUES (345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko'); 
INSERT INTO clients VALUES (456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin'); 
INSERT INTO clients VALUES (567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas'); 
INSERT INTO clients VALUES (456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin'); 
INSERT INTO clients VALUES (123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');


SELECT * FROM clients;






CREATE TABLE brands
(
brand_id int,
brand_name VARCHAR (20), 
employee_number int
);

INSERT INTO brands VALUES (100,'Vakko', 12000);
INSERT INTO brands VALUES (101,'Pierre Cardin', 18000);
INSERT INTO brands VALUES (102,'Adidas', 10000);
INSERT INTO brands VALUES (103,'LCWaikiki', 21000); 
INSERT INTO brands VALUES (104,'Nike', 19000);

SELECT * FROM brands;
select * from clients;


--get the records name, salary, city fields which is 
--brand_id is greater than 101 

SELECT name, salary,company, city FROM clients WHERE company 
IN (SELECT brand_name FROM brands WHERE brand_id>101 );

--('Adidas','LCWaikiki','Nike')
select * from clients;

------   Subquery
--Get the brand names which is employee number is greater than 15000
--and the names of people who work for those brands and their salaries 

SELECT name, salary, company FROM clients WHERE company IN 
(SELECT brand_name FROM brands WHERE employee_number>15000);

--List the brand id and employee number of those brands 
--which has employees in Ankara.

--thanks to Tahereh
select brand_id,employee_number from brands where brand_name
in (select company from clients where city ='Ankara');


SELECT * FROM clients;
--AGGREGATE FUNCTIONS
-- SUM(), MAX(), MIN(), COUNT(), AVG()

--Aggregate functions return mathematical number value. 
--Get the max salary from clients table 

SELECT MAX(salary) FROM clients;

--alias -> temporary name that you give to the result of aggregate function 

SELECT MAX(salary) AS max_salary FROM clients;

---MIN() -> returns the minimum value 
--Get the min salary from clients table 

SELECT MIN(salary) AS min_salary FROM clients;

--AVG -> Average is used to find the mean
--Get the average salary from clients table 
SELECT AVG(salary) AS avg_salary FROM clients;

--ROUND() ->Define how many characters will be after comma 
SELECT ROUND(AVG(salary),3) AS avg_slry FROM clients;

--COUNT()
SELECT COUNT(*) FROM clients;

--Count number of records which is company is Pierre Cardin 
SELECT COUNT(*)  FROM clients WHERE company ='Pierre Cardin';

--Count number of records which is salary is greater than 3000
select count(*) as salary_count from clients where salary > 3000;--1


--SUM
--Get the sum of salary from clients table
select sum(salary) from clients;

-----------  Aggregate Function Subqueries 

select * from clients;

--List Each brands id name and total in how many cities

SELECT brand_id, brand_name,(SELECT COUNT(city) 
							 FROM clients 
							 WHERE company=brand_name) 
FROM brands ;


--Each brands name, employee number 
--and the employees max salary who work for that company

SELECT brand_name, employee_number,(SELECT MAX(salary) 
									FROM clients 
									WHERE company = brand_name) 
FROM brands;




------- CREATE VIEW 

---It saves into the memory temporarly, 
--Without creating table, or typing the query again if you want to save in sql 
--you can use create view keywords. 

--Each brands name, employee number 
--and the employees max and min salary who work for that company
 CREATE VIEW max_min_salaries 
 AS
 SELECT brand_name, employee_number,(SELECT MAX(salary) 
									FROM clients 
									WHERE company = brand_name),
									
									(SELECT MIN(salary) 
									FROM clients 
									WHERE company = brand_name)  
FROM brands;

--To be able to call we only use the name that we provided .
SELECT * FROM max_min_salaries;
