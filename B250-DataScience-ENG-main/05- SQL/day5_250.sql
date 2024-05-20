CREATE TABLE Employees3 (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    DepartmentID INT,
    Position VARCHAR(50),
    Salary DECIMAL(10, 2)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL,
    Location VARCHAR(50)
);



INSERT INTO Departments (DepartmentID, DepartmentName, Location)
VALUES 
(1, 'Sales', 'New York'),
(2, 'HR', 'Los Angeles'),
(3, 'Finance', 'Chicago'),
(4, 'IT', 'San Francisco'),
(5, 'Marketing', 'New York');


INSERT INTO Employees3 (EmployeeID, Name, DepartmentID, Position, Salary)
VALUES 
(101, 'John Smith', 1, 'Sales Manager', 75000),
(102, 'Jane Doe', 1, 'Sales Representative', 60000),
(103, 'Michael Johnson', 2, 'HR Manager', 70000),
(104, 'Emily Brown', 2, 'HR Assistant', 45000),
(105, 'Robert Lee', 3, 'Financial Analyst', 65000),
(106, 'Emma Garcia', 3, 'Financial Analyst', 65000),
(107, 'William Martinez', 4, 'IT Manager', 80000),
(108, 'Olivia Clark', 4, 'Software Engineer', 70000),
(109, 'James Taylor', 4, 'Database Administrator', 75000),
(110, 'Sophia Hernandez', 5, 'Marketing Manager', 72000),
(111, 'Daniel Scott', 5, 'Marketing Specialist', 58000),
(112, 'Isabella Young', 5, 'Marketing Specialist', 58000);

SELECT * FROM departments;

SELECT * FROM employees3;


--Retrieve the names of all employees along with their positions.
SELECT Name, Position FROM Employees3;

--Update the salary of the employee 
-- with EmployeeID 101 to 65000.
UPDATE Employees3 SET Salary=65000 WHERE EmployeeId=101



--Delete the employee with EmployeeID
-- 101 from the Employees table.
DELETE FROM Employees3 WHERE EmployeeId=101


--Retrieve the names of employees
-- who earn more than the average salary.
SELECT Name FROM Employees3 WHERE Salary>(SELECT AVG(Salary) FROM Employees3)

--Retrieve the names of employees 
--who work in the 'Sales' department.

SELECT Name FROM Employees3 WHERE DepartmentId IN 
(SELECT DepartmentId FROM Departments WHERE DepartmentName='Sales');



--Find the total salary expense for
-- the 'Sales' department.


SELECT SUM(Salary) AS TotalSalaryExpense 
FROM Employees3 
WHERE DepartmentId IN (SELECT DepartmentId 
						 FROM Departments 
						 WHERE DepartmentName='Sales')


-- Retrieve the names of employees who work in the department 
--located in 'New York'.

SELECT Name ,(SELECT Location FROM Departments 
WHERE Location='New York' AND Employees3.DepartmentId=Departments.DepartmentId) 
FROM Employees3 WHERE DepartmentId IN 
(SELECT DepartmentId FROM Departments WHERE Location='New York');



-- list department name location and the 
-- max salary for that dep 

SELECT DepartmentName , Location ,
(SELECT ROUND(MAX(Salary),0) AS MaxSalary FROM Employees3 
 WHERE Employees3.DepartmentId=Departments.DepartmentId) FROM Departments



--Create a view named "EmployeeInfo" 
-- that shows the names, positions, 
-- and salaries of all employees.


CREATE VIEW EmployeeInfo AS 
SELECT Name,Position,Salary FROM Employees3;

SELECT * FROM EmployeeInfo

SELECT * FROM employees3
-- Retrieve the names of employees who have the same
-- position as 'Emma Garcia'.

SELECT Name FROM Employees3 WHERE Position= 
(SELECT Position FROM Employees3 WHERE Name='Emma Garcia')


-- Retrieve the names of departments where the total 
-- salary expense is greater than $200,000.

SELECT DepartmentName FROM Departments WHERE 
(SELECT SUM(Salary) FROM Employees3 
 WHERE Employees3.DepartmentId=Departments.DepartmentId)>200000


-- Increase the salary of all employees in the 'IT'
-- department by 10%.

UPDATE Employees3 SET Salary=Salary*1.1 WHERE DepartmentId = 
(SELECT DepartmentId FROM Departments WHERE DepartmentName='IT')



-----------------------------------------------------

SELECT * FROM workers;

--INTERVIEW QUESTION: Get the records which is salary is highest and which is salary is the minimum. 

SELECT MAX(worker_salary) FROM workers
SELECT MIN(worker_salary) FROM workers


-- 1.way --OR
SELECT * FROM workers 
WHERE worker_salary=(SELECT MAX(worker_salary) FROM workers)
OR 
worker_salary=(SELECT MIN(worker_salary) FROM workers)


-- 2.way --IN
SELECT * FROM workers 
WHERE worker_salary 
IN ((SELECT MAX(worker_salary) FROM workers),
	(SELECT MIN(worker_salary) FROM workers))



--INTERVIEW QUESTION : Find the second highest salary. 

SELECT MAX(worker_salary) FROM workers WHERE worker_salary <(SELECT MAX(worker_salary) FROM workers)


---- ORDER BY 
----- EN
--ORDER BY orders the data in the given field according to "natural order".
--By default, it sorts from lower to uppercase or from A to Z if it is a letter.
--ORDER BY + field name sorts the data from smallest to largest by default.
--ORDER BY + field name+ 'ASC'--> sorts the data from smallest to largest
--ORDER BY + field name + 'DESC' -> sorts the data from largest to smallest

SELECT * FROM workers ORDER BY worker_salary

SELECT * FROM workers ORDER BY worker_salary ASC

SELECT * FROM workers ORDER BY worker_salary DESC
--ASC -> Ascending order -> min to max 
--DESC ->Descending order -> max to min 

--OFFSET -> SKIP 
--INTERVIEW QUESTION : Find the third highest salary. 

SELECT * FROM workers ORDER BY worker_salary DESC 
OFFSET 2 ROWS 
FETCH NEXT 1 ROW ONLY

----------------------------------------------------


CREATE TABLE employees2
(
id CHAR (9),
name VARCHAR(50),
state VARCHAR (50),
salary SMALLINT,
company VARCHAR (20)
);

INSERT INTO employees2 VALUES (123456789, 'John Walker', 'Florida', 2500, 'IBM'); 
INSERT INTO employees2 VALUES (234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE'); 
INSERT INTO employees2 VALUES (345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM'); 
INSERT INTO employees2 VALUES (456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE'); 
INSERT INTO employees2 VALUES (567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT'); 
INSERT INTO employees2 VALUES (456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE'); 
INSERT INTO employees2 VALUES (123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
SELECT * FROM employees2;




CREATE TABLE companies(
company_id CHAR (9), 
company VARCHAR(20), 
number_of_employees SMALLINT
	);
INSERT INTO companies VALUES (100,'IBM', 12000);
INSERT INTO companies VALUES (101,'GOOGLE', 18000);
INSERT INTO companies VALUES (102,'MICROSOFT', 10000);
INSERT INTO companies VALUES (103,'APPLE', 21000);
   
SELECT * FROM companies;
SELECT * FROM employees2;


--Find company, number of employees and the avg salary 
-- values for each company 

SELECT company,number_of_employees ,
(SELECT AVG(salary) FROM employees2 
 WHERE employees2.company=companies.company) FROM companies


-- WILDCARDS 
--WILDCARDS in SQL
--LIKE Condition: Used with Wildcard.
--1)% percentage sign wildcard: queries whether there are zero or
--more than one character


-- %a 
-- , Sophia, Olivia, Isabella, Emma, Mia, Ava, a

-- %a% 
-- Ayşe, Fatma, Ahmet, Aslı, Canan, Melisa 

-- % -> 0 character or 1 character any character , multiple characters 

-- a%
-- Adam, Alexander, Aaron, Andrew, Anthony, a


--How to comment out shortly -> Ctrl+/ 
SELECT * FROM employees2;


-- Call employee 'name' values that start with 'E'.

SELECT Name FROM employees2 WHERE Name LIKE 'E%';

-- Call employee 'name' values ending in 'e'.
SELECT Name FROM Employees2 WHERE Name LIKE '%e';

--Get the names which include e letter anywhere

SELECT Name FROM Employees2 WHERE Name LIKE '%e%';





