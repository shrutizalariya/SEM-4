CREATE TABLE EMPLOYEEDETAILS
(
	EmployeeID Int Primary Key,
	EmployeeName Varchar(100) Not Null,
	ContactNo Varchar(100) Not Null,
	Department Varchar(100) Not Null,
	Salary Decimal(10,2) Not Null,
	JoiningDate DateTime Null
)

CREATE TABLE EmployeeLogs (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT NOT NULL,
    EmployeeName VARCHAR(100) NOT NULL,
    ActionPerformed VARCHAR(100) NOT NULL,
    ActionDate DATETIME NOT NULL
);

CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    MovieTitle VARCHAR(255) NOT NULL,
    ReleaseYear INT NOT NULL,
    Genre VARCHAR(100) NOT NULL,
    Rating DECIMAL(3, 1) NOT NULL,
    Duration INT NOT NULL
);


CREATE TABLE MoviesLog
(
	LogID INT PRIMARY KEY IDENTITY(1,1),
	MovieID INT NOT NULL,
	MovieTitle VARCHAR(255) NOT NULL,
	ActionPerformed VARCHAR(100) NOT NULL,
	ActionDate	DATETIME  NOT NULL
);

--1) Create a trigger that fires AFTER INSERT, UPDATE, and DELETE operations on the EmployeeDetails table to display the message "Employee record inserted", "Employee record updated", "Employee record deleted"
--INSERT
CREATE OR ALTER TRIGGER TR_EMPDETAIL_INSERT
ON EMPLOYEEDETAILS
AFTER INSERT
AS
BEGIN
	PRINT 'Employee record inserted'
END

INSERT INTO EMPLOYEEDETAILS VALUES(102,'ABC','1236547890','CSE',12000,'2024-11-15')

SELECT * FROM EMPLOYEEDETAILS

DROP TRIGGER TR_EMPDETAIL_INSERT

--UPDATE
CREATE OR ALTER TRIGGER TR_EMPDETAIL_UPDATE
ON EMPLOYEEDETAILS
AFTER UPDATE
AS
BEGIN
	PRINT 'Employee record updated'
END

UPDATE EMPLOYEEDETAILS
SET EmployeeName = 'ASDF'
WHERE EmployeeID = 101

DROP TRIGGER TR_EMPDETAIL_UPDATE

--DELETE
CREATE OR ALTER TRIGGER TR_EMPDETAIL_DELETE
ON EMPLOYEEDETAILS
AFTER DELETE
AS
BEGIN
	PRINT 'Employee record deleted'
END

DELETE FROM EMPLOYEEDETAILS
WHERE EmployeeID = 102

DROP TRIGGER TR_EMPDETAIL_DELETE

--2) Create a trigger that fires AFTER INSERT, UPDATE, and DELETE operations on the EmployeeDetails table to log all operations into the EmployeeLog table.
--INSERT
CREATE OR ALTER TRIGGER TR_EMPLOYEELOG_INSERT
ON EMPLOYEEDETAILS
AFTER INSERT
AS
BEGIN
	DECLARE @EMPLOYEEID INT,@EMPLOYEENAME VARCHAR(100) 

	SELECT @EMPLOYEEID = EMPLOYEEID , @EMPLOYEENAME = EMPLOYEENAME
	FROM INSERTED

	INSERT INTO EmployeeLogs VALUES(@EMPLOYEEID,@EMPLOYEENAME,'INSERT',GETDATE())
END

INSERT INTO EMPLOYEEDETAILS VALUES(103,'ABCD','1236545550','CS',15000,'2023-11-15')
SELECT * FROM EMPLOYEEDETAILS
SELECT * FROM EmployeeLogs
DROP TRIGGER TR_EMPLOYEELOG_INSERT

--UPDATE
CREATE OR ALTER TRIGGER TR_EMPLOYEELOG_UPDATE
ON EMPLOYEEDETAILS
AFTER UPDATE
AS
BEGIN
	DECLARE @EMPLOYEEID INT,@EMPLOYEENAME VARCHAR(100) 

	SELECT @EMPLOYEEID = EMPLOYEEID , @EMPLOYEENAME = EMPLOYEENAME
	FROM INSERTED

	INSERT INTO EmployeeLogs VALUES(@EMPLOYEEID,@EMPLOYEENAME,'UPDATE',GETDATE())
END

UPDATE EMPLOYEEDETAILS 
SET EmployeeName = 'QWER'
WHERE EmployeeID = 103

DROP TRIGGER TR_EMPLOYEELOG_UPDATE

--DELETE
CREATE OR ALTER TRIGGER TR_EMPLOYEELOG_DELETE
ON EMPLOYEEDETAILS
AFTER DELETE
AS
BEGIN
	DECLARE @EMPLOYEEID INT,@EMPLOYEENAME VARCHAR(100) 

	SELECT @EMPLOYEEID = EMPLOYEEID , @EMPLOYEENAME = EMPLOYEENAME
	FROM DELETED

	INSERT INTO EmployeeLogs VALUES(@EMPLOYEEID,@EMPLOYEENAME,'DELETE',GETDATE())
END

DELETE FROM EMPLOYEEDETAILS
WHERE EmployeeID = 103

DROP TRIGGER TR_EMPLOYEELOG_DELETE

--3) Create a trigger that fires AFTER INSERT to automatically calculate the joining bonus (10% of the salary) for new employees and update a bonus column in the EmployeeDetails table.
CREATE OR ALTER TRIGGER TR_UPDATE_SALARY
ON EMPLOYEEDETAILS
AFTER INSERT
AS
BEGIN
	DECLARE @SAL DECIMAL(10,2)


END

--4) Create a trigger to ensure that the JoiningDate is automatically set to the current date if it is NULL during an INSERT operation.
CREATE OR ALTER TRIGGER TR_EMPLOYEE_UPDATE_JDATE
ON EMPLOYEEDETAILS
AFTER INSERT
AS
BEGIN
	DECLARE @JDATE DATETIME,@EMPLOYEEID INT
	
	SELECT @JDATE = JoiningDate ,@EMPLOYEEID = EMPLOYEEID FROM EMPLOYEEDETAILS
	WHERE JoiningDate IS NULL 

	UPDATE EMPLOYEEDETAILS
	SET JoiningDate = GETDATE()
	WHERE EmployeeID = @EMPLOYEEID
END

INSERT INTO EMPLOYEEDETAILS VALUES(104,'XYZW','7896541230','IT',30000,NULL)

DROP TRIGGER TR_EMPLOYEE_UPDATE_JDATE

--5)	Create a trigger that ensure that ContactNo is valid during insert and update (Like ContactNo length is 10)



--1.	Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the Movies table. For that, log all operations performed on the Movies table into MoviesLog.

--2.	Create a trigger that only allows to insert movies for which Rating is greater than 5.5 .

--3.	Create trigger that prevent duplicate 'MovieTitle' of Movies table and log details of it in MoviesLog table.

--4.	Create trigger that prevents to insert pre-release movies.

--5.	Develop a trigger to ensure that the Duration of a movie cannot be updated to a value greater than 120 minutes (2 hours) to prevent unrealistic entries.
