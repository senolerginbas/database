DROP TABLE workers2


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
INSERT INTO workers2 VALUES (123456711, 'Maks Stelon', 'Ohio', 12500, 'IBM',5790);
INSERT INTO workers2 VALUES (123456712, 'Maksim Mark', 'Ohio', 3500, 'Google',3090);
SELECT * FROM workers2;


--Get the name values which includes 'a' or 'k' letter anywhere
--The below codes search for the same result
SELECT name FROM workers2 WHERE name ~ 'a' OR name ~ 'k';  = SELECT name FROM workers2 WHERE name ~ '[ak]';

SELECT name FROM workers2 WHERE name ~ 'ak';  = SELECT name FROM workers2 WHERE name LIKE '%ak%';

SELECT name FROM workers2 WHERE name LIKE '%ak%';

SELECT name FROM workers2 WHERE name ~ '[ak]';

--a and k letters both included by name field but the order matters
SELECT name FROM workers2 WHERE name ~ 'a(.*)k';

SELECT * FROM workers2;

-- Get the name values the first letter is from 'A' to 'F' and the second letter is anycharacter and the third letter is 'a'

SELECT name FROM workers2 WHERE name ~ '^[A-F].a'


--Get the state values that is third character is 'o' or 'x'

SELECT state FROM workers2 WHERE state  ~ '..[ox]'

-- When we use caret symbol means start from beginning 
SELECT state FROM workers2 WHERE state  ~ '^..[ox]'

--Get the state values that the third character isnt 'o' or 'x'

SELECT state FROM workers2 WHERE state !~ '^..[ox]'

SELECT state FROM workers2 WHERE state ~ '^..[^ox]'



------- ORDER BY 

--Order by is a keyword that helps you to sort the data 
-- You can order by ascending or descending order 
-- Ascending means from min to max or alphabetic order from a to z 
-- Descending order means from max to min or from z to a 
--If you do not specify the order type , as default it will be ordered in ascending order 

SELECT * FROM workers2

SELECT * FROM workers2 ORDER BY number_of_employees

-- If you d like to order by descending you have to specify it 
--In descending order 
SELECT * FROM workers2 ORDER BY number_of_employees DESC

--In ascending order
SELECT * FROM workers2 ORDER BY number_of_employees ASC



--Get salary field from workers2 table order by salary descending
--  thanks to Neslihan 
SELECT salary FROM workers2 ORDER BY salary DESC



--- LIMIT 
--It is used together with order by , if you need to specify how many records you will get from database use limit

--How to get first 3 records from workers2 , order by number of employees
SELECT * FROM workers2 ORDER BY number_of_employees LIMIT 3


--Get the highest 3 number_of_employees 

SELECT * FROM workers2 ORDER BY number_of_employees DESC LIMIT 3

---OFFSET 
-- It is used to skip the records , specific number of records 
SELECT * FROM workers2 ORDER BY number_of_employees LIMIT 3 OFFSET 5

--Get records which is third and fourth after ordering by number of empl desc

SELECT * FROM workers2 ORDER BY number_of_employees DESC LIMIT 2 OFFSET 2

-- Get salary and number of employees fields after ordering by salary get 5-7 records 

SELECT salary, number_of_employees FROM workers2 ORDER BY salary ASC LIMIT 3 OFFSET 4 


---- FETCH NEXT X ROW ONLY 

SELECT salary, number_of_employees FROM workers2 ORDER BY salary ASC OFFSET 4 FETCH NEXT 3 ROWS ONLY

SELECT * FROM workers2 ORDER BY number_of_employees DESC OFFSET 2 FETCH NEXT 2 ROWS ONLY




--- GROUP BY 
--It is used to group by a specific field value

SELECT company FROM workers2 GROUP BY company


--Find the total salary for each name 

SELECT name,sum(salary) FROM workers2 GROUP BY name


SELECT name,sum(salary) FROM workers2 GROUP BY name ORDER BY name

SELECT name,sum(salary) FROM workers2 GROUP BY name ORDER BY sum(salary)


SELECT name,sum(salary) AS sum_salary FROM workers2 GROUP BY name ORDER BY sum_salary DESC LIMIT 1 OFFSET 1


--Find the workers number for each state and order by descending 

SELECT State, COUNT(*) AS num_of_workers FROM workers2 GROUP BY state ORDER BY num_of_workers DESC


SELECT SUM(number_of_employees) AS sum_of_employees, State FROM workers2 GROUP BY State 



--Find the sum of number_of_employees for each company which pays over 2000$
SELECT * FROM workers2
SELECT SUM(number_of_employees) AS total_employees ,company FROM workers2 WHERE Salary >2000 GROUP BY company


--Find the min and max salary for each company 

SELECT MIN(Salary) AS min_salary , MAX(Salary) AS max_salary ,company FROM workers2 GROUP BY company



---HAVING Clause 


-- Having is a keyword that we use for filtering after group by keyword. 
-- You cant use where keyword after group by, and aggregate functions are not used with where keyword, 
-- But you can use them(aggregate functions) with having filter keyword 

SELECT * FROM workers2
--Find the total salary for each worker name which is total salary is greater than 2500 

SELECT Name, SUM(Salary) AS total_salary FROM workers2 GROUP BY Name HAVING SUM(Salary)>2500

--SQL doesnt allow any other field accept aggregate function and the field that we use in group by 
-- to be used together with group by keyword


--Find total worker name for each company which has more than on person. 
-- thanks to senol
SELECT company, COUNT(name) AS num_of_workers
FROM workers2
GROUP BY company
HAVING COUNT(name) > 1;


--Find total worker name for each company which has more than on person. 


SELECT company,COUNT(name) FROM workers2 GROUP BY company HAVING COUNT(name)>1


--Find min salary value which is greater than 2000 for each company


SELECT company, MIN(Salary) FROM workers2 GROUP BY company HAVING MIN(Salary)>2000

--Find max salary value which is less than 3000 for each state
SELECT MAX(Salary) , state FROM workers2 GROUP BY State HAVING MAX(Salary)<3000


---DISTINCT --> removes the duplicates , returns only one time 
select * from workers2
SELECT name FROM Workers2
SELECT DISTINCT name FROM Workers2





