-- Assignment
create database EMP_details;
use EMP_details;

-- 1. Create 3 tables with following schema

create table employee(empid int primary key,
empname varchar(100), 
department varchar(50),
contactno bigint, 
emaildid varchar(100), 
empheadid int);
 
create table empdept(
deptid varchar(50) primary key,
deptname varchar(100),
dept_off varchar(100),
depthead int ,
CONSTRAINT fk_empdept_head 
foreign key (depthead) 
references employee(empid));

create table empsalary(
empid int,
salary bigint, 
ispermanent varchar(3),
CONSTRAINT fk_empsalary1_productLine 
FOREIGN KEY (empid) 
REFERENCES employee (empid));

-- 2. Insert the suitable data in all 3 tables with at least 10 records each.

INSERT INTO employee(empid,empname,department,contactno,emaildid,empheadid)
values
(101,'Isha','E-101',1234567890,'isha@gmail.com',105),
(102,'Priya','E-104',1234567890,'priya@yahoo.com',103),
(103,'Neha','E-101',1234567890,'neha@gmail.com',101),
(104,'Rahul','E-102',1234567890,'rahul@yahoo.com',105),
(105,'Abhishek','E-101',1234567890,'abhishek@gmail.com',102),
(106,'Sindhu','E-102',1234567890,'abc@gmail.com',101),
(107,'Sahithi','E-104',1144646547,'def@yahoo.com',105),
(108,'Vasu','E-104',9876543212,'123@gmail.com',103),
(109,'Madhuri','E-105',7896543242,'ma@gmail.com',102),
(110,'Avani','E-103',7854327566,'av@gmail.com',105),
(111,'Anu','E-101',1234567890,'ai@gmail.com',102),
(112,'Priyanka','E-104',1234567890,'priya@yahoo.com',103);

select* from employee;

-- INcerting the data in empdept
INSERT INTO empdept(deptid,deptname,dept_off,depthead)
VALUES
('E-101','HR','Monday',105),
('E-102','Development','Tuesday',101),
('E-103','Hous Keeping','Saturday',103),
('E-104','Sales','Sunday',104),
('E-105','Purchaser','Tuesday',104);
 select * from empdept;
 
 -- INcerting the data in empsalary
 INSERT INTO empsalary(empid,salary,ispermanent)
values
(101,2000,'Yes'),
(102,10000,'Yes'),
(103,5000,'No'),
(104,1900,'Yes'),
(105,2300,'Yes'),
(106,34000,'No'),
(107,45000,'Yes'),
(108,12000,'No'),
(109,1500,'Yes'),
(110,39000,'Yes');

select* from empsalary;

/*-- Write queries for following

•	Select the detail of the employee whose name start with P.(hint use like)*/
SELECT * FROM employee WHERE empname LIKE 'P%';

-- •	How many permanent candidates earn more than 5000.
SELECT * FROM empsalary WHERE salary>5000;

-- •	Select the details of the employee whose emailId is in gmail.
SELECT * FROM employee WHERE emaildid LIKE '%gmail%';

-- What is the total salary that is paid to permanent employees?
SELECT SUM(salary) as total from empsalary WHERE ispermanent = 'Yes';

-- •	List name of all employees whose name ends with a.
SELECT * FROM employee WHERE empname LIKE 'a%';

-- •	Select the name of the employee who is working under Abhishek.
SELECT empname FROM employee WHERE empheadid =(SELECT empid FROM employee WHERE empname='abhishek');

-- •	Select the name of the employee head who is permanent.
SELECT empname FROM employee WHERE empid IN(SELECT empheadid FROM employee) AND empid IN(SELECT empid FROM empsalary WHERE ispermanent='yes');

/*Joins Select all details and apply the following
•	left join on above any 2 tables*/
SELECT * FROM employee
LEFT JOIN empsalary ON employee.empid = empsalary.empid;

-- •	right join on above any 2 tables.
SELECT * FROM employee
RIGHT JOIN empsalary ON employee.empid = empsalary.empid;

-- •	inner join on above any 2 tables
select * from employee
INNER join empsalary on employee.empid = empsalary.empid;

-- •	cross join on above any 2 tables
select emp.empid, emp.empname, emp.emaildid, es.salary, es.ispermanent
from employee emp cross join  empsalary es;

/*-- •	observe the difference in each join and explain all of them in your own words
ANSWER:
1.In left join it displays all the rows present in employee table based 
2.In right join it displays all the rows present in empsalary table
3.In Inner join it displays the common columns in employee table and empsalary table based on empid column 
4.In Cross Join  that returns the Cartesian product of rows from the tables in the join from the above join  each empid gives cartesian product with salary in empsalary table;
*/

/*Update a value in the employee table. 
•	Hint(Set empname as Maria where empid is 10)*/

UPDATE employee set empname='Maria'
where empid=110;

-- •	Delete the entire row in employee table where empid is 10
DELETE FROM empsalary WHERE empid=110;

/*Altering table
⦁	Adding additional column in employee table
*/
INSERT INTO employee(empid,empname,department,contactno,emaildid,empheadid)
values
(113,'Anusha','E-101',1234567890,'ai@gmail.com',102);

-- •	Removing the newly added column from employee table
delete from empsalary
where empid in(113);
 
DELETE FROM employee
WHERE empid IN (113);

-- •	Find the count of common salaries given to the employees (hint use group by)
SELECT count(salary), salary
FROM empsalary
GROUP BY salary;

-- •	lists the number of employees and there common salary, sorted high to low (Only include common salary with more than 5 employees)
SELECT salary,count(empid) FROM empsalary 
WHERE salary  IN (SELECT salary FROM empsalary WHERE salary IN (SELECT salary FROM empsalary 
GROUP BY salary HAVING count(salary)>=5) group by salary) group by salary order by salary DESC;

/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ QAN ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
•	Explain about the JOINS.
1. A JOIN clause is used to combine rows from two or more tables, based on a related column between them.
2.Different types of join :
•	(INNER) JOIN: Returns records that have matching values in both tables
•	LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
•	RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table
•	FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table


•	What are UNION, MINUS and INTERSECT commands?
1. UNION merges the results of two SELECT statements.UNION statements only return UNIQUE values.
2. The Minus Operator in SQL is used with two SELECT statements. The MINUS operator is used to subtract the result set obtained by first SELECT query from the result set obtained by second SELECT query.
3. INTERSECT returns distinct rows that are output by both the left and right input queries operator. To combine the result sets of two queries that use EXCEPT or INTERSECT, the basic rules are: The number and the order of the columns must be the same in all queries.


•	What are the differences between TRUNCATE, DELETE and DROP?
1.TRUNCATE -- 
1.The TRUNCATE command is a Data Definition Language Command.
2. The TRUNCATE Command deletes all the rows from the existing table, leaving the row with the column names.
3. We cannot restore all the deleted rows from the database using the ROLLBACK command.
4. TRUNCATE TABLE table_name;

2.DELETE--
1. The DELETE command is Data Manipulation Language Command.
2. The DELETE command deletes one or more existing records from the table in the database.
3. We can restore any deleted row or multiple rows from the database using the ROLLBACK command.
4. DELETE FROM table_name WHERE condition;

3.DROP--
1. The DROP command is Data Definition Language Command.
2. The DROP Command drops the complete table from the database.
3. We cannot get the complete table deleted from the database using the ROLLBACK command.
4. DROP TABLE table_name;
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  === END === +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
*/
