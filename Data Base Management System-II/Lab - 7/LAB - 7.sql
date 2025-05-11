CREATE TABLE Customers ( 
Customer_id INT PRIMARY KEY,                 
Customer_Name VARCHAR(250) NOT NULL,         
Email VARCHAR(50) UNIQUE                     
); 

CREATE TABLE Orders ( 
Order_id INT PRIMARY KEY,                    
Customer_id INT,                             
Order_date DATE NOT NULL,                    
FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)  
); 

--Part – A 
--1. Handle Divide by Zero Error and Print message like: Error occurs that is - Divide by zero error. 
BEGIN TRY
	DECLARE @NUM1 INT=10, @NUM2 INT=0
	DECLARE @RESULT DECIMAL(4,2)
	SET @RESULT = @NUM1 / @NUM2
END TRY
BEGIN CATCH
	PRINT('Error occurs that is - Divide by zero error')
END CATCH

--2. Try to convert string to integer and handle the error using try…catch block. 
BEGIN TRY
	DECLARE @STR VARCHAR(100) = 'ABCD'
	DECLARE @INTVALUE INT = CAST(@STR AS INT)
END TRY
BEGIN CATCH
	PRINT('Error : Unable to convert string to integer')
END CATCH

--3. Create a procedure that prints the sum of two numbers: take both numbers as integer & handle 
--exception with all error functions if any one enters string value in numbers otherwise print result. 
CREATE OR ALTER PROCEDURE PR_SUM_OF_TWO_NUMBERS
	@N1 VARCHAR(50),
	@N2 VARCHAR(50)
AS
BEGIN
BEGIN TRY
	DECLARE @SUM INT
	SET @SUM = CAST(@N1 AS INT) + CAST(@N2 AS INT)
	PRINT('SUM = '+ CAST(@SUM AS VARCHAR(100)))
END TRY
BEGIN CATCH
	PRINT('ERROR_NUMBER : ' + CAST(ERROR_NUMBER() AS VARCHAR(50)))
	PRINT('ERROR_MESSAGE : ' + ERROR_MESSAGE())
	PRINT('ERROR_LINE : ' + CAST(ERROR_LINE() AS VARCHAR(50)))
	PRINT('ERROR_SEVERITY : ' + CAST(ERROR_SEVERITY() AS VARCHAR(50)))
	PRINT('ERROR_STATE : ' + CAST(ERROR_STATE() AS VARCHAR(50)))
	PRINT('ERROR_PROCEDURE : ' + CAST(ERROR_PROCEDURE() AS VARCHAR(50)))
END CATCH
END

EXEC PR_SUM_OF_TWO_NUMBERS 1 , 'AB'

--4. Handle a Primary Key Violation while inserting data into customers table and print the error details 
--such as the error message, error number, severity, and state. 
CREATE OR ALTER PROCEDURE PR_PRIMARYKEY_VIOLATION
	@Customer_id INT,               
	@Customer_Name VARCHAR(250),         
	@Email VARCHAR(50)
AS
BEGIN
BEGIN TRY
	INSERT INTO CUSTOMERS 
	VALUES(1,'ABC','abc1@gmail.com')
	INSERT INTO CUSTOMERS
	VALUES(@Customer_id,@Customer_Name,@Email)
END TRY
BEGIN CATCH
	PRINT('ERROR_NUMBER : ' + CAST(ERROR_NUMBER() AS VARCHAR(50)))
	PRINT('ERROR_MESSAGE : ' + ERROR_MESSAGE())
	PRINT('ERROR_LINE : ' + CAST(ERROR_LINE() AS VARCHAR(50)))
	PRINT('ERROR_SEVERITY : ' + CAST(ERROR_SEVERITY() AS VARCHAR(50)))
	PRINT('ERROR_STATE : ' + CAST(ERROR_STATE() AS VARCHAR(50)))
	PRINT('ERROR_PROCEDURE : ' + CAST(ERROR_PROCEDURE() AS VARCHAR(50)))
END CATCH
END

EXEC PR_PRIMARYKEY_VIOLATION 1,'XYZ','xyz1@gmail.com'

--5. Throw custom exception using stored procedure which accepts Customer_id as input & that throws 
--Error like no Customer_id is available in database. 
CREATE OR ALTER PROCEDURE PR_FOREIGNKEY_VIOLATION
	@Customer_id INT
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM CUSTOMERS WHERE CUSTOMER_ID = @CUSTOMER_ID) 
	BEGIN 
		THROW 50002,'no Customer_id is available in database',1
	END 
	ELSE
	BEGIN
		PRINT('Customer Id is exists')
	END
END

EXEC PR_FOREIGNKEY_VIOLATION 2

--Part – B 
--6. Handle a Foreign Key Violation while inserting data into Orders table and print appropriate error message. 
CREATE OR ALTER PROCEDURE PR_FOREIGNKEY_VIOLATION_FOR_ORDER
	@Order_id INT,                   
	@Customer_id INT,                             
	@Order_date DATE                    
AS
BEGIN
	BEGIN TRY
		INSERT INTO ORDERS
		VALUES(@Order_id,@Customer_id,@Order_date)
	END TRY
	BEGIN CATCH
		PRINT 'Foreign_key is invalid because Not found customer_id in customer table'
	END CATCH
END

EXEC PR_FOREIGNKEY_VIOLATION_FOR_ORDER 2,2,'2024-3-12'

--7. Throw custom exception that throws error if the data is invalid. 
CREATE OR ALTER PROCEDURE PR_CUSTOME_EXCEPTION
	@Customer_Name VARCHAR(250)
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM CUSTOMERS WHERE CUSTOMER_NAME = @CUSTOMER_NAME) 
	BEGIN 
		THROW 50001,'no Customer_Name is available in database',2
	END 
	ELSE
	BEGIN
		PRINT('Customer Name is exists')
		SELECT * FROM CUSTOMERS
		WHERE Customer_Name = @Customer_Name
	END
END

EXEC PR_CUSTOME_EXCEPTION 'ABCDE'

--8. Create a Procedure to Update Customer’s Email with Error Handling.
CREATE OR ALTER PROCEDURE PR_UPDATE_CUSTOMER_EMAIL
	@Customer_Id VARCHAR(250),
	@Email VARCHAR(50)
AS
BEGIN
	IF @Email NOT LIKE '_%@_%._%'
	BEGIN
		THROW 50003, 'ERROR : Invalid Email Format' , 3
	END
	BEGIN TRY
		UPDATE Customers
		SET Email = @Email
		WHERE Customer_id = @Customer_Id
	END TRY
	BEGIN CATCH
		PRINT 'Error occurred while updating an email'
		PRINT 'ERROR_NUMBER : ' + CAST(ERROR_NUMBER() AS VARCHAR(50))
		PRINT 'ERROR_MESSAGE : ' + CAST(ERROR_MESSAGE() AS VARCHAR(50))
	END CATCH
END

EXEC PR_UPDATE_CUSTOMER_EMAIL 1,'XCTVYU@GMAILCOM'

--Part – C  
--9. Create a procedure which prints the error message that “The Customer_id is already taken. Try another one”.
CREATE OR ALTER PROCEDURE PR_CUSTOMERID
AS
BEGIN
	BEGIN TRY
		INSERT INTO CUSTOMERS 
		VALUES(1,'ABC','abc1@gmail.com')
END TRY
BEGIN CATCH
	PRINT 'The Customer_id is already taken. Try another one' 
END CATCH
END

EXEC PR_CUSTOMERID

--10. Handle Duplicate Email Insertion in Customers Table. 
CREATE OR ALTER PROCEDURE PR_DUPICATE_EMAIL_INSERT
	@Customer_id INT,               
	@Customer_Name VARCHAR(250),         
	@Email VARCHAR(50)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Customers WHERE EMAIL = @Email)
	BEGIN
		THROW 50004 , 'Email is already inserted try onther one' ,2
	END
	ELSE
		INSERT INTO CUSTOMERS
		VALUES(@Customer_id,@Customer_Name,@Email)
END

EXEC PR_DUPICATE_EMAIL_INSERT 3,'xyz','abc1@gmail.com'
