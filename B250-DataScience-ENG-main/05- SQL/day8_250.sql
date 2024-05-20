SELECT * FROM Cats 

CREATE TABLE Cats (
    CatID INT PRIMARY KEY,
    Name VARCHAR(50),
    Breed VARCHAR(50),
    Color CHAR(20),
    Age INT,
    Weight Decimal
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


--Question: Retrieve the first 5 rows from the Cats table.
SELECT * FROM Cats LIMIT 5;


--Question: Retrieve the next 5 rows from the Cats table, skipping the first 5 rows.
--1. WAY 
SELECT * FROM Cats LIMIT 5 OFFSET 5
--2.WAY 
SELECT * FROM Cats OFFSET 5 FETCH NEXT 5 ROWS ONLY


--Question: List the unique breeds of cats along with their average weight.
SELECT ROUND(AVG(weight),0) AS avg_weight, Breed FROM Cats GROUP BY Breed
--!! errorrr -> find the reason why it is not working
SELECT ROUND(AVG(Weight), 0) AS avg_weight, Breed 
FROM Cats 
GROUP BY Breed;
--Note: If the data type is float u cant use round function 
-- if the data type is not accepted to change use casting



DROP TABLE Cats

--Question: List the breeds of cats that have an average weight greater than 7.5.

SELECT ROUND(AVG(weight),0) AS avg_weight, Breed FROM Cats GROUP BY Breed HAVING ROUND(AVG(weight),0)>7.5


--Question: Retrieve the top 3 heaviest cats from the Cats table.

SELECT * FROM Cats ORDER BY weight DESC LIMIT 3


--Question: Retrieve the 4th to 6th heaviest cats.

SELECT * FROM Cats ORDER BY weight DESC LIMIT 3 OFFSET 3


--Question: Count the number of cats in each breed and order the result by the breed name.
--thanks to elnur
SELECT breed, count(*) from cats group by breed order by breed


--Question: Find the breeds that have a total weight of all cats greater than 10, and order the result by total weight.
SELECT Breed, SUM(weight) AS sum_of_weight FROM Cats GROUP BY Breed HAVING SUM(weight)>10 ORDER BY SUM(weight)


--Question: Retrieve the names and breeds of cats that are older than the average age of all cats.
SELECT Name, Breed,Age FROM Cats WHERE Age> (SELECT AVG(Age) FROM Cats)

--Note:  It is not possible to use aggregate function with where keyword so if you need you can create a subquery


--Question: Find breeds that have more than 2 cats and an average age of less than 5 years.
SELECT Breed,COUNT(*),AVG(Age) FROM Cats GROUP BY Breed HAVING COUNT(*)>2 AND AVG(Age)<5


SELECT Breed,COUNT(Breed),AVG(Age) FROM Cats GROUP BY Breed HAVING COUNT(*)>2 AND AVG(Age)<5


--- WILD CARD 
--Retrieve all cat records whose name starts with the letter 'L'.

select * from cats where name like 'L%'

select * from cats where name ~ '^L'



--Retrieve all cat records where the name contains an 'i' somewhere in the middle.
--Thanks to elnur -- regex
select * from cats where name ~ 'i'
--thanks to muhammed - wild card
Select * From cats where name LIKE '%i%'

-- Retrieve all cat records whose breed starts with either 'M' or 'B'.

SELECT * FROM Cats WHERE Breed ~ '^[MB]'

-- Retrieve all cat records whose breed ends with 'oon'.


--thanks to muhammed --wild card
Select * From cats where Breed like '%oon'

--thanks to elnur -- regex
select * from cats where breed ~ 'oon$'


--Get the name values which starts with 'L', 'T',  or 'W' and ends with 'r'

SELECT Name FROM Cats WHERE Name ~ '^[LTW](.*)r$';

--thanks to Neslihan
select * from cats where name ~ '^[LTW]' and name ~ 'r$'


--get the color value which starts with a letter between A to M , continues with any character
--and the fourth character is c or w

SELECT color FROM Cats WHERE Color  ~ '^[A-M]..[cw](.*)'


--NOTE
-- _ % wild card -> LIKE
-- . * (.*) ^ $ regex -> ~



---------------------------------------------------NEW SUBJECTS 



CREATE TABLE employees4
(
employee_id CHAR (9),
employee_first_name VARCHAR(20), 
employee_last_name VARCHAR (20)
);



INSERT INTO employees4 VALUES (14, 'Chris', 'Tae');
INSERT INTO employees4 VALUES (11, 'John', 'Walker');
INSERT INTO employees4 VALUES (12, 'Amy', 'Star');
INSERT INTO employees4 VALUES (13, 'Brad', 'Pitt');
INSERT INTO employees4 VALUES (15, 'Chris', 'Way');
SELECT * FROM employees4;
   

--How to put multiple columns in a single column

SELECT employee_id AS id , employee_first_name || ' ' ||employee_last_name AS full_name FROM employees4


SELECT employee_id || ' ' || employee_first_name || ' ' ||employee_last_name AS full_name FROM employees4


--It doesnt matter for sql even if you have different data types, sql can still merge them 


------------------------------ QUERY Operators 
SELECT * FROM workers2


CREATE TABLE workers2
(
id CHAR (9),
name VARCHAR (50),
state VARCHAR (50), 
salary SMALLINT, 
company VARCHAR (20),
number_of_employees numeric(6)
);

INSERT INTO workers2 VALUES (123456789, 'John Walker', 'Florida', 2500, 'IBM',15000); 
INSERT INTO workers2 VALUES (234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE',34900); 
INSERT INTO workers2 VALUES (345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM',903400); 
INSERT INTO workers2 VALUES (456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE',259000); 
INSERT INTO workers2 VALUES (567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT',90100); 
INSERT INTO workers2 VALUES (456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE',56900); 
INSERT INTO workers2 VALUES (123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM',45690);
SELECT * FROM workers2;
DELETE FROM workers2

---UNION 
--1) Used to combine the result of 2 queries
--2) UNION Operator returns unique records every time, removes duplicate records if there are any 
--3) By using "UNION Operator" we can place different fields in a single field as in the example below.


--Find the state which is salary is greater than 3000 , and find worker name whose salary is less than 2000 and NO duplicates allowed 


SELECT state AS state_or_name,salary FROM workers2 WHERE Salary >3000
UNION
SELECT name AS state_or_name, salary FROM workers2 WHERE Salary <2000


--UNION ALL Operator 
-- UNION ALL operator is used to combine the results of 2 queries and presents it without elimination if there is duplicate data.

--Find the state which is salary is greater than 3000 , and find worker name whose salary is less than 2000 and duplicates allowed 


SELECT state AS state_or_name,salary FROM workers2 WHERE Salary >3000
UNION ALL
SELECT name AS state_or_name, salary FROM workers2 WHERE Salary <2000


--INTERSECT Operator 
SELECT * FROM workers2
--It returns the common data of two query results, without repetation

--Find all common employee names whose salary is greater than 1000 and less than 2000 
--1.way  --AND
SELECT name,salary FROM workers2 WHERE Salary>1000 AND Salary <2000 

--2.way --BETWEEN
SELECT name,salary FROM workers2 WHERE Salary BETWEEN 1000 AND 2000 

--3.way --INTERSECT
SELECT name,salary FROM workers2 WHERE Salary >1000 
INTERSECT
SELECT name,salary FROM workers2 WHERE Salary <2000 



--exmpl
--Find all common employee names whose salary is greater than
-- 2000 and company name is IBM, APPLE or GOOGLE 

SELECT Name,Company,Salary FROM workers2 WHERE Salary >2000
INTERSECT
SELECT Name,Company,Salary FROM workers2 
WHERE company IN ('IBM','APPLE','GOOGLE')



--EXCEPT Operator 
--It is used to extract one query result from another one 
-- It returns unique records 

--example
--Find the employee names whose salary is less than 3000 and not working in GOOGLE 

--1. WAY
SELECT Name,Salary,Company FROM workers2 WHERE Salary<3000  AND Company !='GOOGLE'


SELECT Name,Salary,Company FROM workers2 WHERE Salary<3000
EXCEPT
SELECT Name,Salary,Company FROM workers2 WHERE Company ='GOOGLE'





