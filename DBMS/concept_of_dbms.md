# DBMS + SQL – Complete Concepts (From Scratch)

This document covers all SQL topics required for DBMS Unit-1:
- SQL Basics  
- Aggregate functions  
- GROUP BY, HAVING  
- ORDER BY  
- JOINs  
- Loops  
- Datetime functions  
- CAST / CONVERT / PARSE  
- String & Math functions  
- Keys & Normalization  
- Views, UDF, Stored Procedures, Triggers  

---

# 1. What is DBMS?

A **Database Management System** is software used to store, manage, and retrieve data.  
Examples: SQL Server, MySQL, Oracle, PostgreSQL.

## Advantages:
- Reduced redundancy  
- Data security  
- Backup & recovery  
- Concurrent access  
- Data consistency  

---

# 2. SQL – Structured Query Language

SQL is divided into categories:

## 2.1 DDL – Data Definition Language
CREATE
ALTER
DROP
TRUNCATE

## 2.2 DML – Data Manipulation Language
INSERT
UPDATE
DELETE

## 2.3 DQL – Data Query Language
SELECT

## 2.4 DCL – Data Control Language
GRANT
REVOKE

## 2.5 TCL – Transaction Control Language
COMMIT
ROLLBACK
SAVEPOINT

pgsql
Copy code

---

# 3. Basic SELECT Queries

```sql
SELECT * FROM Student;

SELECT Name, City FROM Student;

SELECT * FROM Student
WHERE Department = 'CS';

# 4. Aggregate Functions (5 Main)
Aggregate functions work on a group of rows and return a single output.

1. COUNT()
SELECT COUNT(*) FROM Student;

2. SUM()
SELECT SUM(Salary) FROM Employee;

3. AVG()
SELECT AVG(Marks) FROM Result;

4. MIN()
SELECT MIN(Price) FROM Product;

5. MAX()
SELECT MAX(Credits) FROM Course;

5. GROUP BY and HAVING
GROUP BY – groups rows by column

SELECT Department, COUNT(*) AS Total
FROM Student
GROUP BY Department;
HAVING – condition after grouping

SELECT Department, COUNT(*) AS Total
FROM Student
GROUP BY Department
HAVING COUNT(*) > 50;

6. ORDER BY – sorting results
SELECT * FROM Student ORDER BY Name ASC;

SELECT * FROM Product ORDER BY Price DESC;


# 7. SQL JOINs (All Types)

7.1 INNER JOIN
Returns matching records.

SELECT S.Name, C.CourseName
FROM Student S
JOIN Enrollment E ON S.StudentID = E.StudentID
JOIN Course C ON E.CourseID = C.CourseID;

7.2 LEFT JOIN
All from left table + matched from right.

SELECT S.Name, E.CourseID
FROM Student S
LEFT JOIN Enrollment E ON S.StudentID = E.StudentID;

7.3 RIGHT JOIN
All from right + matched from left.
SELECT * FROM A RIGHT JOIN B ON A.ID = B.ID;

7.4 FULL OUTER JOIN
All data from both tables.
SELECT * 
FROM A FULL OUTER JOIN B ON A.ID = B.ID;

7.5 CROSS JOIN
Cartesian product.
SELECT * FROM A CROSS JOIN B;

7.6 SELF JOIN
Used when table joins to itself.
SELECT E1.Name, E2.Name AS Manager
FROM Employee E1
JOIN Employee E2
ON E1.ManagerID = E2.EmpID;


# 8. Datetime Functions

8.1 Current Date & Time
SELECT GETDATE();        
SELECT SYSDATETIME();
SELECT CURRENT_TIMESTAMP;

8.2 Extract Part
SELECT YEAR(GETDATE());
SELECT MONTH(GETDATE());
SELECT DAY(GETDATE());
SELECT DATEPART(WEEKDAY, GETDATE());
SELECT DATENAME(MONTH, GETDATE());

8.3 Add/Subtract
SELECT DATEADD(DAY, 10, GETDATE());
SELECT DATEADD(MONTH, -1, GETDATE());
SELECT DATEADD(YEAR, 5, GETDATE());

8.4 Date Difference
SELECT DATEDIFF(DAY, '2024-01-01', '2024-02-01');
SELECT DATEDIFF(YEAR, '2000-05-04', GETDATE());

8.5 Convert format
SELECT FORMAT(GETDATE(), 'dd-MM-yyyy');
SELECT FORMAT(GETDATE(), 'yyyy/MM/dd');
SELECT FORMAT(GETDATE(), 'MMMM yyyy');

8.6 End of Month
SELECT EOMONTH(GETDATE());

8.7 Valid Date check
SELECT ISDATE('2024-15-20');  


# 9. Conversion Functions

CAST()
SELECT CAST('2024-02-05' AS DATE);
SELECT CAST(12.56 AS INT);

CONVERT()
SELECT CONVERT(VARCHAR(10), GETDATE(), 103);  
SELECT CONVERT(VARCHAR(10), GETDATE(), 101); 

PARSE()
SELECT PARSE('10 Jan 2025' AS DATE);


# 10. String Functions
SELECT UPPER(Name);
SELECT LOWER(Name);
SELECT LEN(Name);
SELECT SUBSTRING('DATABASE', 1, 4);
SELECT REPLACE('Hello World', 'World', 'SQL');
SELECT CONCAT(FirstName, ' ', LastName);
SELECT TRIM('   SQL   ');
SELECT CHARINDEX('a', 'Database');
SELECT LEFT('Database', 4);
SELECT RIGHT('Database', 4);


# 11. Mathematical Functions
SELECT ABS(-100);
SELECT CEILING(12.3);
SELECT FLOOR(12.9);
SELECT SQRT(81);
SELECT POWER(2, 4);
SELECT ROUND(10.5678, 2);


# 12. Conditional Functions

CASE:
SELECT Name,
CASE
    WHEN Marks >= 90 THEN 'A'
    WHEN Marks >= 75 THEN 'B'
    ELSE 'C'
END AS Grade
FROM Result;

ISNULL()
SELECT ISNULL(Phone, 'Not Available');

NULLIF()
SELECT NULLIF(10, 10);

COALESCE()
SELECT COALESCE(NULL, NULL, 'Hello');


# 13. LOOP (WHILE)
DECLARE @N INT = 5;

WHILE(@N > 0)
BEGIN
    PRINT @N;
    SET @N = @N - 1;
END;


# 14. User-Defined Functions (UDF)

Scalar Function:
CREATE FUNCTION FN_CREDITS(@CID VARCHAR(10))
RETURNS INT
AS
BEGIN
    DECLARE @C INT;
    SELECT @C = Credits FROM Course WHERE CourseID = @CID;
    RETURN @C;
END;

Table-Valued Function:
CREATE FUNCTION FN_STUDENT_BY_YEAR(@Y INT)
RETURNS TABLE
AS RETURN(
    SELECT * FROM Student WHERE EnrollmentYear = @Y
);

# 15. Stored Procedures:
CREATE PROCEDURE SP_STUDENT_BY_DEPT @Dept VARCHAR(20)
AS
BEGIN
    SELECT * FROM Student WHERE Department = @Dept;
END;

EXEC SP_STUDENT_BY_DEPT 'CS';

# 16. Triggers:
AFTER INSERT Trigger:
CREATE TRIGGER TR_NEW_STUDENT
ON Student
AFTER INSERT
AS
BEGIN
    PRINT 'New student added';
END;

INSTEAD OF DELETE Trigger:
CREATE TRIGGER TR_PREVENT_DELETE
ON Faculty
INSTEAD OF DELETE
AS
BEGIN
    PRINT 'Deletion is not allowed!';
END;

# 17. Views
CREATE VIEW ActiveStudents
AS
SELECT Name, Email
FROM Student
WHERE Status = 'Active';

SELECT * FROM ActiveStudents;

# 18. Keys
Primary Key – unique & not null

Foreign Key – references another table

Candidate Key – possible keys

Alternate Key – remaining candidate keys

Composite Key – multiple columns

Super Key – unique combination

# 19. Normalization (1NF → BCNF)
1NF
Atomic values

No repeating groups

2NF
No partial dependency

3NF
No transitive dependency

BCNF
Every determinant is a candidate key

