-- Create Department Table 
CREATE TABLE Department ( 
DepartmentID INT PRIMARY KEY, 
DepartmentName VARCHAR(100) NOT NULL UNIQUE 
);

-- Create Designation Table 
CREATE TABLE Designation ( 
DesignationID INT PRIMARY KEY, 
DesignationName VARCHAR(100) NOT NULL UNIQUE
); 

-- Create Person Table 
CREATE TABLE Person ( 
PersonID INT PRIMARY KEY IDENTITY(101,1), 
FirstName VARCHAR(100) NOT NULL, 
LastName VARCHAR(100) NOT NULL, 
Salary DECIMAL(8, 2) NOT NULL, 
JoiningDate DATETIME NOT NULL, 
DepartmentID INT NULL, 
DesignationID INT NULL, 
FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID), 
FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID)
); 

--Part – A 
--1. Department, Designation & Person Table’s INSERT, UPDATE & DELETE Procedures.
--DEPARTMENT TABLE
	--INSERT
	CREATE OR ALTER PROCEDURE PR_DEPARTMENT_INSERT
		@DEPTID INT,
		@DEPTNAME VARCHAR(100)
	AS
	BEGIN
		INSERT INTO Department VALUES
		(@DEPTID,@DEPTNAME)
	END

	EXEC PR_DEPARTMENT_INSERT 4,'Account'

	SELECT * FROM Department

	--UPDATE
	CREATE OR ALTER PROCEDURE PR_DEPARTMENT_UPDATE
		@DID INT,
		@DNAME VARCHAR(100)
	AS
	BEGIN
		UPDATE Department
		SET DepartmentName = @DNAME
		WHERE DepartmentID = @DID
	END

	EXEC PR_DEPARTMENT_UPDATE 2,CSE

	--DELETE
	CREATE OR ALTER PROCEDURE PR_DEPARTMENT_DELETE
		@DID INT
	AS
	BEGIN
		DELETE FROM DEPARTMENT
		WHERE DepartmentID = @DID
	END
------------------------------------------------ERROR
	EXEC PR_DEPARTMENT_DELETE 2

--DESIGNATION TABLE
	--INSERT
	CREATE OR ALTER PROCEDURE PR_DESIGNATION_INSERT
		@DESI_ID INT,
		@DESI_NAME VARCHAR(100)
	AS
	BEGIN
		INSERT INTO Designation VALUES
		(@DESI_ID,@DESI_NAME)
	END

	EXEC PR_DESIGNATION_INSERT 15,'CEO'

	SELECT * FROM Designation

	--UPDATE
	CREATE OR ALTER PROCEDURE PR_DESIGNATION_UPDATE
		@DESI_ID INT,
		@DESI_NAME VARCHAR(100)
	AS
	BEGIN
		UPDATE Designation
		SET DesignationName = @DESI_NAME
		WHERE DesignationID = @DESI_ID
	END

	EXEC PR_DESIGNATION_UPDATE 13,HEAD

	--DELETE
	CREATE OR ALTER PROCEDURE PR_DESIGNATION_DELETE
		@DESI_ID INT
	AS
	BEGIN
		DELETE FROM DESIGNATION
		WHERE DesignationID = @DESI_ID
	END

	EXEC PR_DESIGNATION_DELETE 13

--PERSON TABLE
	--INSERT
	CREATE OR ALTER PROCEDURE PR_PERSON_INSERT
		@FNAME VARCHAR(100),
		@LNAME VARCHAR(100),
		@SAL DECIMAL(8,2),
		@JOIN_DATE DATETIME,
		@DEPTID INT,
		@DESI_ID INT
	AS
	BEGIN
		INSERT INTO Person VALUES
		(@FNAME,@LNAME,@SAL,@JOIN_DATE,@DEPTID,@DESI_ID)
	END

	EXEC PR_PERSON_INSERT 'Neha','Trivedi',18000,'2014-02-20',3,15

	SELECT * FROM Person

	--UPDATE
	CREATE OR ALTER PROCEDURE PR_PERSON_UPDATE
		@PID INT,
		@SALARY DECIMAL(8,2)
	AS
	BEGIN
		UPDATE PERSON
		SET SALARY = @SALARY
		WHERE PERSONID = @PID
	END

	EXEC PR_PERSON_UPDATE 105,20000

	--DELETE 
	CREATE OR ALTER PROCEDURE PR_PERSON_DELETE
		@PID INT
	AS
	BEGIN
		DELETE FROM PERSON
		WHERE PERSONID = @PID
	END

	EXEC PR_PERSON_DELETE 105

--2. Department, Designation & Person Table’s SELECTBYPRIMARYKEY.
--DEPARTMENT
	CREATE OR ALTER PROCEDURE PR_DEPT_BYPRIMARYKEY
		@DID INT
	AS
	BEGIN 
		SELECT DepartmentID,DepartmentName
		FROM Department
		WHERE DepartmentID = @DID
	END

	EXEC PR_DEPT_BYPRIMARYKEY 4

--DESIGNATION
	CREATE OR ALTER PROC PR_DESI_BYPRIMARYKEY
		@DESI_ID INT
	AS
	BEGIN
		SELECT DesignationID,DesignationName
		FROM Designation
		WHERE DesignationID = @DESI_ID
	END

	EXEC PR_DESI_BYPRIMARYKEY 14

--PERSON
	CREATE OR ALTER PROCEDURE PR_PERSON_BYPRIMARYKEY
		@PID INT
	AS
	BEGIN
		SELECT * 
		FROM PERSON 
		WHERE PersonID = @PID
	END

	EXEC PR_PERSON_BYPRIMARYKEY 107

--3. Department, Designation & Person Table’s (If foreign key is available then do write join and take columns on select list).
	CREATE OR ALTER PROC PR_DETAIL_FK
	AS
	BEGIN
		SELECT * 
		FROM PERSON P
		JOIN DEPARTMENT D
		ON P.DepartmentID = D.DepartmentID
		JOIN Designation DS
		ON P.DesignationID = DS.DesignationID
	END

	EXEC PR_DETAIL_FK

--4. Create a Procedure that shows details of the first 3 persons.
	CREATE OR ALTER PROC PR_TOP_3_PERSON
	AS
	BEGIN
		SELECT TOP 3 * 
		FROM PERSON P
		JOIN DEPARTMENT D
		ON P.DepartmentID = D.DepartmentID
		JOIN DESIGNATION DS
		ON P.DesignationID = DS.DesignationID
	END

	EXEC PR_TOP_3_PERSON


--Part – B 

--5. Create a Procedure that takes the department name as input and returns a table with all workers working in that department. 
	CREATE OR ALTER PROCEDURE PR_WORKER_DETAIL_BYDEPTNAME
		@DEPTNAME VARCHAR(100)
	AS
	BEGIN
		SELECT P.FIRSTNAME,P.LASTNAME,D.DEPARTMENTNAME
		FROM PERSON P
		JOIN DEPARTMENT D
		ON P.DepartmentID = D.DepartmentID
		WHERE D.DepartmentName = @DEPTNAME
	END

	EXEC PR_WORKER_DETAIL_BYDEPTNAME 'CSE'

--6. Create Procedure that takes department name & designation name as input and returns a table with worker’s 
--first name, salary, joining date & department name. 
	CREATE OR ALTER PROC PR_GETWORKERDETAILS
		@DEPTNAME VARCHAR(100),
		@DESINAME VARCHAR(100)
	AS
	BEGIN
		SELECT P.FIRSTNAME,P.SALARY,P.JOININGDATE,D.DEPARTMENTNAME
		FROM PERSON P 
		JOIN DEPARTMENT D
		ON P.DepartmentID = D.DepartmentID
		JOIN DESIGNATION DS
		ON P.DesignationID = DS.DesignationID
		WHERE D.DepartmentName = @DEPTNAME AND
			  DS.DesignationName = @DESINAME
	END

	EXEC PR_GETWORKERDETAILS 'CSE','CEO'

--7. Create a Procedure that takes the first name as an input parameter and display all the details of the 
--worker with their department & designation name.
	CREATE OR ALTER PROC PR_GETWORKERDETAILS_BY_FNAME
		@FNAME VARCHAR(100)	
	AS
	BEGIN
		SELECT P.PersonID,P.FirstName,P.LastName,P.Salary,P.JoiningDate,D.DepartmentName,DS.DesignationName
		FROM PERSON P 
		JOIN DEPARTMENT D
		ON P.DepartmentID = D.DepartmentID
		JOIN DESIGNATION DS
		ON P.DesignationID = DS.DesignationID
		WHERE P.FirstName = @FNAME
	END

	EXEC PR_GETWORKERDETAILS_BY_FNAME 'NEHA'

--8. Create Procedure which displays department wise maximum, minimum & total salaries.
	CREATE OR ALTER PROC PR_DISPLAY_SALARY
	AS
	BEGIN
		SELECT MIN(P.SALARY) AS MIN_SALARY,MAX(P.SALARY) AS MAX_SALARY,SUM(P.SALARY) AS TOTAL_SALARY
		FROM PERSON P
		JOIN DEPARTMENT D
		ON P.DepartmentID = D.DepartmentID
		GROUP BY D.DepartmentID
	END

	EXEC PR_DISPLAY_SALARY 

--9. Create Procedure which displays designation wise average & total salaries.
	CREATE OR ALTER PROC PR_DISPLAY_SALARY_DESIWISE
	AS
	BEGIN
		SELECT AVG(P.SALARY) AS AVG_SALARY,SUM(P.SALARY) AS TOTAL_SALARY
		FROM PERSON P
		JOIN DESIGNATION D
		ON P.DesignationID = D.DesignationID
		GROUP BY D.DesignationID
	END

	EXEC PR_DISPLAY_SALARY_DESIWISE 


--Part – C 

--10. Create Procedure that Accepts Department Name and Returns Person Count. 
	CREATE OR ALTER PROC PR_PERSON_COUNT
		@DEPTNAME VARCHAR(100)
	AS
	BEGIN
		SELECT COUNT(P.PersonID) AS TOTAL_PERSON
		FROM PERSON P
		JOIN DEPARTMENT D
		ON P.DepartmentID = D.DepartmentID
		WHERE D.DepartmentName = @DEPTNAME
		GROUP BY D.DepartmentID
	END

	EXEC PR_PERSON_COUNT 'HR'

--11. Create a procedure that takes a salary value as input and returns all workers with a salary greater than 
--input salary value along with their department and designation details. 
	CREATE OR ALTER PROCEDURE PR_WORKER_DETAILS_BY_SALARY
		@SAL DECIMAL(8,2)
	AS
	BEGIN
		SELECT P.PersonID,P.FirstName,P.LastName,P.JoiningDate,P.Salary,D.DepartmentName,DS.DesignationName
		FROM Person P
		JOIN Department D
		ON P.DepartmentID = D.DepartmentID
		JOIN Designation DS
		ON P.DesignationID = DS.DesignationID
		WHERE P.Salary > @SAL
	END

	EXEC PR_WORKER_DETAILS_BY_SALARY 15000

--12. Create a procedure to find the department(s) with the highest total salary among all departments.
	CREATE OR ALTER PROCEDURE PR_HIGHSAL_DEPT
	AS
	BEGIN
		SELECT TOP 1 SUM(P.SALARY) AS TOTAL_SAL,D.DepartmentName
		FROM PERSON P
		JOIN DEPARTMENT D
		ON P.DepartmentID = D.DepartmentID
		GROUP BY D.DepartmentName
		ORDER BY SUM(P.SALARY) DESC
	END

	EXEC PR_HIGHSAL_DEPT 

--13. Create a procedure that takes a designation name as input and returns a list of all workers under that 
--designation who joined within the last 10 years, along with their department.
	CREATE OR ALTER PROCEDURE PR_WORKER_DETAIL_BY_DESI
		@DESI_NAME VARCHAR(100)
	AS
	BEGIN
		SELECT P.PersonID,P.FirstName,P.LastName,P.JoiningDate,P.Salary,DS.DesignationName,D.DepartmentName
		FROM Person P
		JOIN Designation DS
		ON P.DesignationID = DS.DesignationID
		JOIN Department D
		ON P.DepartmentID = D.DepartmentID
		WHERE DS.DesignationName = @DESI_NAME
			  AND
			  DATEDIFF(YEAR,JoiningDate,GETDATE()) > 10
	END

	EXEC PR_WORKER_DETAIL_BY_DESI 'CEO'

--14. Create a procedure to list the number of workers in each department who do not have a designation assigned. 
	CREATE OR ALTER PROC PR_NOT_HAVE_DESI
	AS
	BEGIN
		SELECT COUNT(P.PersonID) AS TOTAL_WORKER,D.DepartmentName
		FROM Person P 
		JOIN Department D
		ON P.DepartmentID = D.DepartmentID
		JOIN Designation DS
		ON P.DesignationID = DS.DesignationID
		WHERE DS.DesignationName = ' ' OR DS.DesignationID = NULL
		GROUP BY D.DepartmentName
	END

	EXEC PR_NOT_HAVE_DESI-------------------------------------CHECK OUTPUT

	SELECT * FROM Person

--15. Create a procedure to retrieve the details of workers in departments where the average salary is above 12000.
	CREATE OR ALTER PROC PR_WORKER_DETAILS_BY_DEPT
	AS
	BEGIN
		SELECT AVG(P.Salary) AS AVG_SAL,D.DepartmentName
		FROM PERSON P
		JOIN DEPARTMENT D
		ON P.DepartmentID = D.DepartmentID
		GROUP BY D.DepartmentName
		HAVING AVG(P.SALARY) > 12000
	END

	EXEC PR_WORKER_DETAILS_BY_DEPT