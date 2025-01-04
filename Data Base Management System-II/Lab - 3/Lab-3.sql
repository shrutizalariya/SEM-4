CREATE TABLE Departments ( 
DepartmentID INT PRIMARY KEY, 
DepartmentName VARCHAR(100) NOT NULL UNIQUE, 
ManagerID INT NOT NULL, 
Location VARCHAR(100) NOT NULL 
); 

CREATE TABLE Employee ( 
EmployeeID INT PRIMARY KEY, 
FirstName VARCHAR(100) NOT NULL, 
LastName VARCHAR(100) NOT NULL, 
DoB DATETIME NOT NULL, 
Gender VARCHAR(50) NOT NULL, 
HireDate DATETIME NOT NULL, 
DepartmentID INT NOT NULL, 
Salary DECIMAL(10, 2) NOT NULL, 
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
);

CREATE TABLE Projects ( 
ProjectID INT PRIMARY KEY, 
ProjectName VARCHAR(100) NOT NULL, 
StartDate DATETIME NOT NULL, 
EndDate DATETIME NOT NULL, 
DepartmentID INT NOT NULL, 
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
); 

INSERT INTO Departments (DepartmentID, DepartmentName, ManagerID, Location) 
VALUES  
(1, 'IT', 101, 'New York'), 
(2, 'HR', 102, 'San Francisco'), 
(3, 'Finance', 103, 'Los Angeles'), 
(4, 'Admin', 104, 'Chicago'), 
(5, 'Marketing', 105, 'Miami'); 

INSERT INTO Employee (EmployeeID, FirstName, LastName, DoB, Gender, HireDate, DepartmentID, Salary) 
VALUES  
(101, 'John', 'Doe', '1985-04-12', 'Male', '2010-06-15', 1, 75000.00), 
(102, 'Jane', 'Smith', '1990-08-24', 'Female', '2015-03-10', 2, 60000.00), 
(103, 'Robert', 'Brown', '1982-12-05', 'Male', '2008-09-25', 3, 82000.00), 
(104, 'Emily', 'Davis', '1988-11-11', 'Female', '2012-07-18', 4, 58000.00), 
(105, 'Michael', 'Wilson', '1992-02-02', 'Male', '2018-11-30', 5, 67000.00); 

INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate, DepartmentID) 
VALUES  
(201, 'Project Alpha', '2022-01-01', '2022-12-31', 1), 
(202, 'Project Beta', '2023-03-15', '2024-03-14', 2), 
(203, 'Project Gamma', '2021-06-01', '2022-05-31', 3), 
(204, 'Project Delta', '2020-10-10', '2021-10-09', 4), 
(205, 'Project Epsilon', '2024-04-01', '2025-03-31', 5);

SELECT * FROM Departments
SELECT * FROM Employee
SELECT * FROM Projects


--Part – A

--1. Create Stored Procedure for Employee table As User enters either First Name or Last Name and based on this you must give EmployeeID, DOB, Gender & Hiredate. 
	CREATE OR ALTER PROCEDURE PR_EMPLOYEE_GETBYNAME
		@FIRSTNAME VARCHAR(100)=NULL,
		@LASTNAME VARCHAR(100)=NULL
	AS
	BEGIN
		SELECT EMPLOYEEID,DOB,GENDER,HIREDATE
		FROM EMPLOYEE
		WHERE (FirstName = @FIRSTNAME) OR (LastName = @LASTNAME)
	END

	EXEC PR_EMPLOYEE_GETBYNAME 'JANE'
	EXEC PR_EMPLOYEE_GETBYNAME ' ','DOE'
	EXEC PR_EMPLOYEE_GETBYNAME @LASTNAME = 'SMITH'
	EXEC PR_EMPLOYEE_GETBYNAME NULL,'DOE'

--2. Create a Procedure that will accept Department Name and based on that gives employees list who belongs to that department.
	CREATE OR ALTER PROCEDURE PR_EMPLOYEE_DETAILS
		@DEPTNAME VARCHAR(100)
	AS
	BEGIN
		SELECT E.EMPLOYEEID,E.FIRSTNAME,E.LASTNAME,E.DOB,E.GENDER,E.HIREDATE,E.DEPARTMENTID,E.SALARY
		FROM EMPLOYEE E 
		JOIN DEPARTMENTS D
		ON E.DepartmentID = D.DepartmentID
		WHERE D.DepartmentName = @DEPTNAME
	END

	EXEC PR_EMPLOYEE_DETAILS 'FINANCE'
		
--3.  Create a Procedure that accepts Project Name & Department Name and based on that you must give all the project related details.
	CREATE OR ALTER PROCEDURE PR_PROJECT_DETAILS
		@PNAME VARCHAR(100),
		@DNAME VARCHAR(100)
	AS
	BEGIN
		SELECT P.PROJECTID,P.PROJECTNAME,P.STARTDATE,P.ENDDATE,D.DEPARTMENTNAME
		FROM PROJECTS P 
		JOIN DEPARTMENTS D
		ON P.DEPARTMENTID = D.DEPARTMENTID
		WHERE (P.PROJECTNAME = @PNAME) AND (D.DepartmentName = @DNAME)
	END

	EXEC PR_PROJECT_DETAILS 'PROJECT GAMMA','FINANCE'

--4. Create a procedure that will accepts any integer and if salary is between provided integer, then those employee list comes in output.  
	CREATE OR ALTER PROCEDURE PR_EMPLOYEE_LIST
		@MAXNUMBER INT,
		@MINNUMBER INT
	AS
	BEGIN
		SELECT (FIRSTNAME+' '+LASTNAME) AS FULL_NAME,SALARY
		FROM Employee
		WHERE SALARY BETWEEN @MAXNUMBER AND @MINNUMBER
	END

	EXEC PR_EMPLOYEE_LIST 50000,80000

--5. Create a Procedure that will accepts a date and gives all the employees who all are hired on that date.  
	CREATE OR ALTER PROC PR_GETEMPLOYEENAME
		@DATE DATETIME
	AS
	BEGIN
		SELECT FIRSTNAME,LASTNAME,HIREDATE
		FROM EMPLOYEE
		WHERE HIREDATE = @DATE
	END

	EXEC PR_GETEMPLOYEENAME '2010-6-15'


--Part – B 

--6. Create a Procedure that accepts Gender’s first letter only and based on that employee details will be served.  
	CREATE OR ALTER PROC PR_EMPLOYEE_GETBYGENDER
		@FLOFGENDER VARCHAR(20)
	AS
	BEGIN
		SELECT *
		FROM EMPLOYEE
		WHERE GENDER LIKE @FLOFGENDER+'%'
	END

	EXEC PR_EMPLOYEE_GETBYGENDER 'M'

--7. Create a Procedure that accepts First Name or Department Name as input and based on that employee data will come.  
	CREATE OR ALTER PROC PR_EMPLOYEE_GETBYDNAME_FNAME
		@FNAME VARCHAR(100) = NULL,
		@DNAME VARCHAR(100) = NULL
	AS
	BEGIN
		SELECT E.EMPLOYEEID,E.FIRSTNAME,E.LASTNAME,E.DOB,E.GENDER,E.HIREDATE,E.DEPARTMENTID,E.SALARY
		FROM EMPLOYEE E
		JOIN DEPARTMENTS D
		ON E.DepartmentID = D.DepartmentID
		WHERE (E.FIRSTNAME = @FNAME) OR (D.DEPARTMENTNAME = @DNAME)
	END

	EXEC PR_EMPLOYEE_GETBYDNAME_FNAME 'JOHN'

--8. Create a procedure that will accepts location, if user enters a location any characters, then he/she will get all the departments with all data.
	CREATE OR ALTER PROC PR_DEPARTMENT_GETBYLOCATION
		@LOCATION VARCHAR(100)
	AS
	BEGIN
		SELECT * 
		FROM Departments
		WHERE LOCATION LIKE '%' + @LOCATION + '%'
	END

	EXEC PR_DEPARTMENT_GETBYLOCATION 'I'

--Part – C 
--9. Create a procedure that will accepts From Date & To Date and based on that he/she will retrieve Project related data. 
	CREATE OR ALTER PROC PR_PROJECT_GETBYDATE
		@FROMDATE DATETIME,
		@TODATE DATETIME
	AS
	BEGIN
		SELECT * 
		FROM PROJECTS
		WHERE StartDate = @FROMDATE AND EndDate = @TODATE
	END

	EXEC PR_PROJECT_GETBYDATE '2021-06-01', '2022-05-31'

--10. Create a procedure in which user will enter project name & location and based on that you must provide all data with Department Name, 
--Manager Name with Project Name & Starting Ending Dates. 
	CREATE OR ALTER PROC PR_PROJECT_ALLDETAILS
		@PNAME VARCHAR(100),
		@LOCATION VARCHAR(100)
	AS
	BEGIN
		SELECT D.DepartmentName,D.ManagerId,P.ProjectName,P.StartDate,P.EndDate
		FROM Departments D
		JOIN Projects P
		ON D.DepartmentID = P.DepartmentID
		WHERE P.ProjectName = @PNAME AND D.Location = @LOCATION
	END

	EXEC PR_PROJECT_ALLDETAILS 'PROJECT EPSILON','MIAMI'