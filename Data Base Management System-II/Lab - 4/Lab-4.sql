--Part – A 

--1. Write a function to print "hello world". 
	CREATE OR ALTER FUNCTION FN_HELLOWORLD()
	RETURNS VARCHAR(100)
	AS
	BEGIN
		RETURN  'HELLO WORLD'
	END

	SELECT DBO.FN_HELLOWORLD()

--2. Write a function which returns addition of two numbers. 
	CREATE OR ALTER FUNCTION FN_ADD_OF_TWO(
		@NUM1 INT,
		@NUM2 INT
	)
	RETURNS INT
	AS
	BEGIN
		DECLARE @ANS INT
		SET @ANS = @NUM1 + @NUM2
		RETURN @ANS
	END

	SELECT DBO.FN_ADD_OF_TWO(5,10)

--3. Write a function to check whether the given number is ODD or EVEN.
	CREATE OR ALTER FUNCTION FN_EVEN_OR_ODD(
		@NUM INT
	)
	RETURNS VARCHAR(100)
	AS
	BEGIN
		DECLARE @ANS VARCHAR(100)
		IF @NUM%2=0
			SET @ANS = 'EVEN'
		ELSE 
			SET @ANS = 'ODD'
		RETURN @ANS
	END

	SELECT DBO.FN_EVEN_OR_ODD(13)

--4. Write a function which returns a table with details of a person whose first name starts with B. 
	CREATE OR ALTER FUNCTION FN_PERSON_DETAILS()
	RETURNS TABLE
	AS
		RETURN(
				SELECT * 
				FROM PERSON 
				WHERE FIRSTNAME LIKE 'B%'
				)

	SELECT * FROM DBO.FN_PERSON_DETAILS()

--5. Write a function which returns a table with unique first names from the person table.
	CREATE OR ALTER FUNCTION FN_UNIQUE_FNAME()
	RETURNS TABLE
	AS
		RETURN(
				SELECT DISTINCT FIRSTNAME
				FROM PERSON
		)

		SELECT * FROM FN_UNIQUE_FNAME()

--6. Write a function to print number from 1 to N. (Using while loop) 
	CREATE OR ALTER FUNCTION FN_1_TO_N(@N INT)
	RETURNS VARCHAR(500)
	AS
	BEGIN
		DECLARE @ANS VARCHAR(100),@I INT
		SET @I = 1
		SET @ANS = ' '

		WHILE @I < = @N
		BEGIN
			SET @ANS = @ANS + CAST(@I AS VARCHAR) + ' '
			SET @I = @I + 1
		END

		RETURN @ANS
	END

	SELECT DBO.FN_1_TO_N(10)

--7. Write a function to find the factorial of a given integer.
	CREATE OR ALTER FUNCTION FN_FACT(@NUM INT)
	RETURNS INT
	AS
	BEGIN
		DECLARE @ANS INT,@I INT
		SET @I = 1
		SET @ANS = 1

		WHILE @I < = @NUM
		BEGIN
			SET @ANS = @ANS * @I
			SET @I = @I + 1
		END

		RETURN @ANS
	END

	SELECT DBO.FN_FACT(5)

--Part – B 
--8. Write a function to compare two integers and return the comparison result. (Using Case statement) 
	CREATE OR ALTER FUNCTION FN_COMPARE_TWO_NUM(
		@NUM1 INT,
		@NUM2 INT
	)
	RETURNS VARCHAR(100)
	AS
	BEGIN
		RETURN CASE
			WHEN @NUM1 = @NUM2 THEN 'BOTH NUMBERS ARE EQUAL!'
			WHEN @NUM1 > @NUM2 THEN CAST(@NUM1 AS VARCHAR) + ' IS GREATER THAN ' + CAST(@NUM2 AS VARCHAR)
			WHEN @NUM1 < @NUM2 THEN CAST(@NUM1 AS VARCHAR) + ' IS LESSER THAN ' + CAST(@NUM2 AS VARCHAR)
			ELSE 'GIVEN INPUT IS INVALID!'
		END
	END

	SELECT DBO.FN_COMPARE_TWO_NUM(15,10)

--9. Write a function to print the sum of even numbers between 1 to 20.
	CREATE OR ALTER FUNCTION FN_EVENNUM_SUM()
	RETURNS INT
	AS
	BEGIN
		DECLARE @SUM INT,@I INT
		SET @SUM = 0
		SET @I = 1

		WHILE @I < = 20
		BEGIN
			IF @I % 2 = 0
				SET @SUM = @SUM + @I
			SET @I = @I + 1
		END
		RETURN @SUM
	END

	SELECT DBO.FN_EVENNUM_SUM()

--10. Write a function that checks if a given string is a palindrome.
	CREATE OR ALTER FUNCTION FN_PALINDROM(
	@STR VARCHAR(100))
	RETURNS VARCHAR(100)
	AS
	BEGIN
		DECLARE @ANS VARCHAR(100) , @REV VARCHAR(100)
		SET @REV = REVERSE(@STR)
		IF @STR = @REV
			SET @ANS = @STR + ' IS A PLAINDROM STRING.'
		ELSE
			SET @ANS = @STR + ' IS NOT A PALINDROM STRING.'
		RETURN @ANS
	END

	SELECT DBO.FN_PALINDROM('ABCBA')

--Part – C 
--11. Write a function to check whether a given number is prime or not. 
	CREATE OR ALTER FUNCTION FN_PRIME_OR_NOT(
		@NUM INT
	)
	RETURNS VARCHAR(100)
	AS
	BEGIN
		DECLARE @ANS VARCHAR(100),@COUNT INT,@I INT
		SET @COUNT = 0
		SET @I = 2
		WHILE @I < = @NUM/2
		BEGIN
			IF @NUM % @I = 0
				SET @COUNT = @COUNT + 1
				SET @I = @I + 1
		END
		IF @COUNT = 0
			RETURN CAST(@NUM AS VARCHAR)+' IS A PRIME NUMBER'
		RETURN CAST(@NUM AS VARCHAR)+' IS NOT A PRIME NUMBER'
	END

	SELECT DBO.FN_PRIME_OR_NOT(2)

--12. Write a function which accepts two parameters start date & end date, and returns a difference in days. 
	CREATE OR ALTER FUNCTION FN_DATE_DIFF(
		@SDATE DATE,
		@EDATE DATE
	)
	RETURNS INT
	AS
	BEGIN
		DECLARE @ANS INT
		SET @ANS = DATEDIFF(DAY,@SDATE,@EDATE)
		RETURN @ANS
	END

	SELECT DBO.FN_DATE_DIFF('2024-02-12','2024-02-28');

--13. Write a function which accepts two parameters year & month in integer and returns total days each year.
	CREATE OR ALTER FUNCTION FN_TOTAL_DAY(
		@YEAR INT,
		@MONTH INT
	)
	RETURNS INT
	AS
	BEGIN
		DECLARE @DAY INT,@DATE DATE,@ANS VARCHAR(100)
		SET @ANS = CAST(@YEAR AS VARCHAR)+'-'+CAST(@MONTH AS VARCHAR)+'-1'
		SET @DATE = CAST(@ANS AS DATE)
		SET @DAY = DAY(EOMONTH(@DATE))
		
		RETURN @DAY
	END

	SELECT DBO.FN_TOTAL_DAY(2024,05)
	
--14. Write a function which accepts departmentID as a parameter & returns a detail of the persons.
	CREATE OR ALTER FUNCTION FN_GETPERSON_BYDID(
		@DID INT
	)
	RETURNS TABLE 
	AS
		RETURN (SELECT * 
				FROM PERSON
				WHERE DepartmentID = @DID)

	SELECT * FROM DBO.FN_GETPERSON_BYDID(2)

--15. Write a function that returns a table with details of all persons who joined after 1-1-1991.
	CREATE OR ALTER FUNCTION FN_GETPERSON_BYJDATE()
	RETURNS TABLE 
	AS
		RETURN (SELECT * 
				FROM PERSON
				WHERE JoiningDate > '1991-1-1')

	SELECT * FROM DBO.FN_GETPERSON_BYJDATE()