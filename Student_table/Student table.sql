create database student_table;
use student_table;

create table student(
student_id INT PRIMARY KEY,
student_name VARCHAR(20),
student_marks decimal(5,2));

-- Insert the details of a new student in the above table

INSERT INTO student(student_id,student_name,student_marks)
VALUES (101,'SINDHU',75.2),
(102,'Ram Moahn',88.6),
(103,'Sita Lakshmi',89.8),
(104,'Rajesh Kumar',92.62);
SELECT * FROM student;

-- Delete the detail of a student in the above table.
delete from student;
SELECT * FROM student;

-- Insert more records to the above student table more than 7.
insert into student
values(101,"Tikesh kaushik",79.6),
(102,"Rohan Ram",82.88),
(103,"Mahendra Das",89.36),
(104,"Sohan Sahu",33.98),
(105,"rajesh Ram",72.82),
(106,"Mahendra Das",49.76),
(107,"Sanjay Sahu",98.99),
(108,"Sammer Sahu",59.43);

SELECT * FROM student;

-- Use the select command to get the details of the students with marks more than 80.
SELECT student_id, student_Name ,student_marks FROM student
WHERE student_marks >80 ORDER BY RIGHT(student_name,3), student_id ASC;

-- Find the min, max, sum, and average of the marks in a student marks table.
select min(student_marks), max(student_marks), sum(student_marks), avg(student_marks) from student;

-- Find the student names whose marks are greater than 60 and less than 40

SELECT * FROM student WHERE student_marks> 40 AND student_marks < 60;

-- Write a SQL query to order the (student ID, marks) table in descending order of the marks
select* from student order by student_marks desc;

-- Write a SQL query to display the marks without decimal places, display the remainder after dividing marks by 3 and display the square of marks.
SELECT POWER(ROUND((student_marks)/3,0),2) AS total,student_id FROM student;

-- Write a SQL query to display names into capital letters, small letters, display first 3 letters of name, display last 3 letters of name, display the position the letter A in name
SELECT
UPPER(student_name),
LOWER(student_name),
LEFT(student_name, 2),
RIGHT(student_name, 2),
POSITION('A' IN student_name),
student_name,
student_id
FROM
student;

-- Remove extra spaces from left, right and both sides from the text – " Innomatics Research Lab              ".
SELECT TRIM(' ' FROM '     INNOMATICSRESERCH LABS     ');

-- Display today’s date in “Date/Month/Year” format
SELECT CURDATE();

-- Display dayname, monthname, day, dayname, day of month, day of year for today’s date

SELECT dayname('2023-02-06'),monthname('2023-02-06'),YEAR('2023-02-06');

-- Explain the difference between primary key and foriegn key.

/*ANSWER:
PRIMARY KEY ==
1.A primary key is used to ensure data in the specific column is unique.alter
2.It uniquely identifies a record in the relational database table.
3.Only one primary key is allowed in a table.
4.It does not allow NULL values.
5.Its value cannot be deleted from the parent table.
FOREIGN KEY ==
1.A foreign key is a column or group of columns in a relational database table that provides a link between data in two tables.
2.It refers to the field in a table which is the primary key of another table.
3.Whereas more than one foreign key are allowed in a table.
4.It can also contain NULL values.
5.Its value can be deleted from the child table.
*/
