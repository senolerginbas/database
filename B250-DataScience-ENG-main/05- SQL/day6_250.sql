SELECT * FROM words

SELECT * FROM employees2;

-- Get the employee name values which starts with 'B' ends with 't' 
-- WHERE  x field LIKE _wildcard
SELECT Name FROM employees2 WHERE Name LIKE 'B%t';



--Get the names which include a letter anywhere in name
SELECT Name FROM employees2 WHERE Name LIKE '%a%';


--Get the name which includes e letter or r letter in anywhere

SELECT Name FROM employees2 WHERE Name LIKE '%e%' OR Name LIKE '%r%';

SELECT Name FROM employees2 WHERE Name LIKE '%e%r%'; -- order matters 

INSERT INTO employees2 VALUES (123456712,'xcreu','x',6000,'x');

SELECT Name FROM employees2 WHERE Name LIKE '%e%r%' OR Name LIKE '%r%e%'; 
SELECT Name FROM employees2 WHERE Name ~ 'e';
---- WILDCARD 

-- _ -> only one character 

-- Get the state value which is second character is 'e' and 
-- the fourth character is 'n' 

SELECT State FROM employees2 WHERE State LIKE '_e_n%';


SELECT * FROM employees2;
-- Get the state values which is second character from end is 'i'

SELECT State FROM employees2 WHERE State LIKE '%i_';


--Get the state values which is second character is 'e' and at least 6 characters

SELECT State FROM employees2 WHERE State LIKE '_e____%';

--Get the state values which includes i letter after second character somewhere 

SELECT State FROM employees2 WHERE State LIKE '__%i%';





CREATE TABLE words
(
word_id CHAR(10) UNIQUE, 
word VARCHAR(50) NOT NULL, 
number_of_letters SMALLINT
);


INSERT INTO words VALUES (1001,'hot', 3);
INSERT INTO words VALUES (1002,'hat', 3);
INSERT INTO words VALUES (1003,'hit', 3);
INSERT INTO words VALUES (1004,'hbt', 3);
INSERT INTO words VALUES (1008,'hct', 3); 
INSERT INTO words VALUES (1005,'adem',4);
INSERT INTO words VALUES (1006,'selena', 6);
INSERT INTO words VALUES (1007,'yusuf', 5);
INSERT INTO words VALUES (1009,'hoait', 5);
INSERT INTO words VALUES (1010,'htc', 3);
INSERT INTO words VALUES (1011,'haxxyt', 6);
SELECT * FROM words;

SELECT word FROM words WHERE word ~ 'tc';
-- order matters 
--- NOT LIKE 

--Get the word values which doesnt include h letter in it 

SELECT word FROM words WHERE word NOT LIKE '%h%';

--Get the word values which ends with t or f letter 
SELECT word FROM words WHERE word LIKE '%t' OR word LIKE '%f';

--Get the word values which doesnt end with t or f letter 

SELECT word FROM words WHERE word NOT LIKE '%t' AND word NOT LIKE '%f';


--Get the word values which starts with any character 
-- and doesnt include a or e letter 

SELECT word FROM words WHERE word NOT LIKE '_%a%' AND word NOT LIKE '_%e%';



--Get the word values which doesnt include a or e letter 
SELECT word FROM words WHERE word NOT LIKE '%a%' AND word NOT LIKE '%e%';


------ Regular Expression Condition: -- REGEX 

--Get the word values which is first character is h , 
-- second chatacter is o, a, i and the last character is t

-- 1.way 
SELECT word FROM words 
WHERE word 
LIKE 'ho%t' OR word 
LIKE 'ha%t' OR word 
LIKE 'hi%t'


-- 2.way 
--3 letters 
SELECT word FROM words WHERE word ~ 'h[oai]t';
SELECT * FROM words 
--Get the word values which is first character is h , 
-- second chatacter is o, a, i and the last character is t, 
--even if there are more than 3 letters 
SELECT word FROM words WHERE word ~ 'h[oai](.*)t';


SELECT * FROM words

INSERT INTO words VALUES (1011,'habit',5);
INSERT INTO words VALUES (1012,'ahmet',5);
INSERT INTO words VALUES (1013,'ahmetaga',8);

SELECT word FROM words WHERE word ~ 'h(.*)[oae]t';

SELECT word FROM words WHERE word ~ 'h(.*)[oae]t$';


SELECT word FROM words WHERE word ~ '^h(.*)[oae]t';

SELECT word FROM words WHERE word ~ 'h'

-- ^ -> first letter 
-- $ -> last letter 
-- (.*) -> any character 
-- . -> _ -> one character 
-- * -> % -> 0, 1, multiple characters 

--Get the word values which include in first character h, last character is t and second character is any character
--from a to e 
SELECT word FROM words WHERE word ~ '^h[a-e](.*)t$';

-- Get the word values which starts with s, a or y 


SELECT word FROM words WHERE word ~ '^[say]';

--Get word values which is last character is m a or f . 

SELECT word FROM words WHERE word ~ '[maf]$'

-- Get word values which is first character is s and last character is a 
-- s is only one character so we dont have to say ^ 
Select word from words where word ~ '^s(.*)a$';


--- The below code wont work , if there is only one character no need to put between square brackets, 
-- if there is gonna be extra characters in the middle you can use (.*),
-- '^sa$'; this regex is not gonna work cause in the middle we are suppose to specify that there can by any other characters 
--ERRRORR!!
Select word from words where word ~ '^s[a]$';
Select word from words where word ~ '^sa$';
Select word from words where word ~ '^s(.*)a$';
--Get the words which include a letter in anywhere 

SELECT word from words where word ~ 'a';


--get the word value which starts with a letter between 'd' to 't' , continues with any character
--and the third character is l 
SELECT word from words where word ~ '^[d-t].l'

SELECT word from words where word ~ '^[a-e](.*)m$'; --adem
SELECT word from words where word ~ '^[a-e].e'; --adem



--get the word value which starts with a letter between d to t , continues with any character
--and the fourth character is e 

SELECT word from words where word ~ '^[d-t]..e'


--get the word value which starts with a letter between r to z , continues with any character
--and the fourth character is u

SELECT word from words where word ~ '^[r-z]..u';

SELECT word from words where word ~ '[r-z]..u';




CREATE TABLE workers3
(
id CHAR (9),
name VARCHAR (50),
state VARCHAR (50), 
salary SMALLINT, 
company VARCHAR (20)
);

INSERT INTO workers3 VALUES (123456789, 'John Walker', 'Florida', 2500, 'IBM'); 
INSERT INTO workers3 VALUES (234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE'); 
INSERT INTO workers3 VALUES (345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM'); 
INSERT INTO workers3 VALUES (456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE'); 
INSERT INTO workers3 VALUES (567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT'); 
INSERT INTO workers3 VALUES (456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE'); 
INSERT INTO workers3 VALUES (123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
SELECT * FROM workers3;



-- EN
--^ if written outside square brackets, it means the first letter
--^ If written within square brackets, any character other than this character

--Get the name values from workers3 which start with 'E' and end with y

SELECT name FROM workers3 WHERE Name ~ '^E(.*)y$'


--Get the name values from workers2 which doesnt start with 'E' and end with y
SELECT name FROM workers3 WHERE Name ~ '^[^E](.*)[^y]$';

--Get the name values which starts with 'J', 'B',  or 'E' and ends with 'r' or 't'

SELECT name FROM workers3 WHERE Name ~ '^[JBA](.*)[rt]$'


--Get the name values which starts with 'J', 'B',  or 'E' OR ends with 'r' or 't'

SELECT name FROM workers3 WHERE Name ~ '^[JBE]' OR Name ~ '[rt]$'


--Get the name values which doesnt start with 'J', 'B',  or 'E' AND doesnt end with 'r' or 't'

SELECT name FROM workers3 WHERE Name ~ '^[^JBE](.*)[^rt]$';











