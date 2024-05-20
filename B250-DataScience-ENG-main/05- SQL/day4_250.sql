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

CREATE TABLE UsersCats (
    UserID INT PRIMARY KEY,
    Breed varchar(50),
    City VARCHAR(50),
    State VARCHAR(50)
);


INSERT INTO UsersCats (UserID, Breed, City, State) VALUES
(1, 'Persian', 'New York', 'NY'),
(2, 'Maine Coon', 'Los Angeles', 'CA'),
(3, 'Tabby', 'Chicago', 'IL'),
(4, 'Siamese', 'Houston', 'TX'),
(5, 'Domestic Shorthair', 'Phoenix', 'AZ'),
(6, 'Persian', 'San Francisco', 'CA'),
(7, 'Tabby', 'Seattle', 'WA'),
(8, 'Maine Coon', 'Miami', 'FL'),
(9, 'Siamese', 'Atlanta', 'GA'),
(10, 'Domestic Shorthair', 'Boston', 'MA');

SELECT * FROM UsersCats;

SELECT * FROM Cats;
-- Question: Write a SQL query to retrieve the state of users who own a Persian cat.
SELECT State FROM UsersCats WHERE Breed ='Persian';

-- Question: Write a SQL query to retrieve the names of cats owned by
-- users who live in New York.
SELECT * FROM Cats

SELECT Name FROM Cats 
			WHERE Breed IN (SELECT Breed 
							FROM UsersCats 
							WHERE city='New York');

-- Question: Write a SQL query to calculate the average age of cats owned
-- by users who live in California.

--thanks to fatima
select avg(Age) from Cats 
				where Breed in (select Breed 
								from UsersCats 
								where State ='CA' );

--thanks to elnur
SELECT avg(age) from cats WHERE breed IN
	(SELECT breed from userscats where state = 'CA');

--thanks to jalil
Select avg(age) from Cats 
				where breed in ( select breed 
								from usercats 
								where state = 'CA';
								
								
								
								
-- Question: Write a SQL query to find the states of users who has
-- a Maine Coon and orange cat 							
								
----ERRRRORRRR !!!
--The below query will not work , cause it is not possible to look for 
--colors in breed , second query returns breeds.
Select State from UsersCats 
where breed = 'Maine Coon' and Color in (select breed
										 from Cats 
										 where color = 'Orange')							
								

-- Question: Write a SQL query to find the states of users who has
-- a Maine Coon or an orange cat
			select * from cats;		
								
								
SELECT State FROM UsersCats 
			WHERE Breed='Maine Coon' 
								OR Breed 
								IN (SELECT Breed 
									FROM Cats 
									WHERE Color='Orange');								

								
SELECT * FROM Cats;
							
						
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								

--------- EXISTS CONDITION 

CREATE TABLE march
(
product_id int,
customer_name varchar (50), 
product_name varchar (50)
);
INSERT INTO march VALUES (10, 'Mark', 'Honda'); 
INSERT INTO march VALUES (20, 'John', 'Toyota'); 
INSERT INTO march VALUES (30, 'Amy', 'Ford'); 
INSERT INTO march VALUES (20, 'Mark', 'Toyota'); 
INSERT INTO march VALUES (10, 'Adam', 'Honda'); 
INSERT INTO march VALUES (40, 'John', 'Hyundai'); 
INSERT INTO march VALUES (20, 'Eddie', 'Toyota');


CREATE TABLE april
(
product_id int,
customer_name varchar(50), 
product_name varchar(50)
);
INSERT INTO april VALUES (10, 'Hasan', 'Honda'); 
INSERT INTO april VALUES (10, 'Kemal', 'Honda'); 
INSERT INTO april VALUES (20, 'Ayse', 'Toyota'); 
INSERT INTO april VALUES (50, 'Yasar', 'Volvo'); 
INSERT INTO april VALUES (20, 'Mine', 'Toyota');




SELECT * FROM march;
SELECT * FROM april;


--EXMPL:
-- Write a query that lists the PRODUCT_IDs of products sold with the same
--PRODUCT_ID in both MARCH and APRIL,
-- and at the same time lists the CUSTOMER_NAMES who bought these
--products in MARCH.


--1.way 
SELECT product_id,customer_name FROM march WHERE product_id IN 
(SELECT product_id FROM april)


--2.way 
SELECT product_id, customer_name FROM march WHERE EXISTS 
(SELECT product_id FROM april WHERE march.product_id=april.product_id)

select * from march
-- List the products product_name which is sold in both months, and 
-- the customer_name who bought these products on april.

SELECT product_name,customer_name FROM April WHERE EXISTS 
(SELECT product_name FROM march 
 WHERE march.product_name = april.product_name)




---------------------------------


CREATE TABLE customer_preferences
(
product_id CHAR(10),
customer_name VARCHAR (50), 
product_name VARCHAR (50)
);



INSERT INTO customer_preferences VALUES (10, 'Mark', 'Orange'); 
INSERT INTO customer_preferences VALUES (50, 'Mark', 'Pineapple'); 
INSERT INTO customer_preferences VALUES (60, 'John', 'Avocado');
INSERT INTO customer_preferences VALUES (30, 'Lary', 'Cherries'); 
INSERT INTO customer_preferences VALUES (20, 'Mark', 'Apple'); 
INSERT INTO customer_preferences VALUES (10, 'Adem', 'Orange'); 
INSERT INTO customer_preferences VALUES (40, 'John', 'Apricot');
INSERT INTO customer_preferences VALUES (20, 'Eddie', 'Apple');
SELECT * FROM customer_preferences;


------- UPDATE KEYWORD
--Update keyword is used together with SET keyword

--EXMP:
-- If customer_name is Lary , update Lary as No Name
Update customer_preferences SET customer_name='No Name' WHERE customer_name='Lary';

DROP TABLE customer_preferences;
--EXMP:
-- If customer_name is Lary , update all customer_name field values as No Name

Update customer_preferences SET customer_name='No Name' WHERE EXISTS 
(SELECT customer_name FROM customer_preferences WHERE customer_name='Lary');

SELECT * FROM customer_preferences;




--EXMPL:
--If 60 is exist in product_id field , update all product_id as 50.


UPDATE customer_preferences SET product_id='50' WHERE EXISTS 
(SELECT product_id FROM customer_preferences WHERE product_id='60');



--If Orange is exist as product_namein at least one record,
-- delete all records. 
DELETE FROM customer_preferences WHERE EXISTS 
(SELECT product_name FROM customer_preferences WHERE product_name='Orange')







------------------------


CREATE TABLE workers(
	worker_id SMALLINT, 
	worker_name VARCHAR(50), 
	worker_salary NUMERIC,
	CONSTRAINT Worker_id_pk PRIMARY KEY (worker_id)
);
	
INSERT INTO workers VALUES (101,'Tom Hanks', 12000); 
INSERT INTO workers VALUES (102,'Brad Pitt', 2000);
INSERT INTO workers VALUES (103,'Aisha Can', 7000);
INSERT INTO workers VALUES (104,'Angie Ocean', 12000);
SELECT * FROM workers;

-- If the salaries are less then the average salary ,
-- make it equals to the average one. 
--8250 avg
SELECT AVG(worker_salary) FROM workers 
SELECT worker_salary FROM workers WHERE worker_salary<(SELECT AVG(worker_salary) FROM workers)

Update workers SET worker_salary=(SELECT AVG(worker_salary) FROM workers) 
WHERE worker_salary<(SELECT AVG(worker_salary) FROM workers)

DROP TABLE workers;

--If the salaries are less than the average salary increase the salaries by 1000 
SELECT * FROM workers;
SELECT worker_salary FROM workers WHERE worker_salary<(SELECT AVG(worker_salary) FROM workers);


UPDATE workers SET worker_salary=worker_salary+1000 
WHERE worker_salary<(SELECT AVG(worker_salary) FROM workers);


--Update Brat Pits`s salary that it will be 20% less than the highest salary 

UPDATE workers SET worker_salary=(SELECT MAX(worker_salary)*0.8 FROM workers)
WHERE worker_name='Brad Pitt';

SELECT * FROM workers;
---Update Tom Hanks salary that it will be 30% more than the minimum salary
--10.400
UPDATE workers SET worker_salary =(SELECT MIN(worker_salary)*1.3 FROM workers)
WHERE worker_name='Tom Hanks';

--- NOTE : worker_salary +(worker_salary*0.3) = worker_salary*1.3


------------------------


CREATE TABLE people
(
ssn INT,
name VARCHAR(50),
address VARCHAR (80)
);
INSERT INTO people VALUES (123456789, 'Mark Star', 'Florida'); 
INSERT INTO people VALUES (234567890, 'Angie Way', 'Virginia'); 
INSERT INTO people VALUES (345678901, 'Maryy Tien', 'New Jersey'); 
INSERT INTO people (ssn, address) VALUES (456789012, 'Michigan'); 
INSERT INTO people (ssn, address) VALUES (567890123, 'California'); 
INSERT INTO people (ssn, name) VALUES (567890123, 'California');
select * from people;

--Find the record which is SSN is 234567890, Update the SSN number into 555558888 

UPDATE people SET SSN = '555558888' WHERE SSN='234567890';


--- IS NULL 

-- to be inserted 

--Update all null values in name fields into to be inserted 
UPDATE people SET name='To Be Inserted' WHERE name IS NULL


--Update all null address fields into to be inserted

Update people set address = 'To Be Inserted' where address is null;


--How to delete a specific record from a table?
--Delete the record which name is Angie Way 
DELETE FROM people WHERE name='Angie Way'


-- Delete the records which is name is null (to be inserted)

DELETE FROM people WHERE name ='To Be Inserted';

DELETE FROM people
select * from people



--Delete the records which is ssn is greater than 123456789 and is less than 345678901

DELETE FROM people WHERE SSN >123456789 AND SSN<345678901
DELETE FROM people WHERE SSN BETWEEN 123456789 AND 345678901

---IS NOT NULL

--Delete the records which is name is not null 

DELETE FROM people WHERE ssn IS NOT NULL


--What is the difference between TRUNCATE and DROP query with DELETE?
--DELETE command deletes one or more existing records from the table in the database.
--DROP Command removes the entire table from the database.
--TRUNCATE command deletes all rows in the current table and leaves the row with its column names.





