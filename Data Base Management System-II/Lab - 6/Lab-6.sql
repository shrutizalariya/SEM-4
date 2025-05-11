CREATE TABLE Products(
Product_id INT PRIMARY KEY,
Product_Name VARCHAR(250) NOT NULL,
Price DECIMAL(10,2) NOT NULL
)

SELECT * FROM Products

--Part - A 

--1. Create a cursor Product_Cursor to fetch all the rows from a products table. 
	DECLARE @Product_id INT,
			@Product_Name VARCHAR(250),
			@Price DECIMAL(10,2)
	DECLARE Product_Cursor CURSOR
	FOR SELECT * FROM Products
	OPEN Product_Cursor
	FETCH NEXT FROM Product_Cursor INTO
		@Product_id,
		@Product_Name,
		@Price
	WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT CAST(@Product_id AS VARCHAR)+' '+@Product_Name+' '+CAST(@Price AS VARCHAR)
		FETCH NEXT FROM Product_Cursor INTO
			@Product_id,
			@Product_Name,
			@Price
	END
	CLOSE Product_Cursor
	DEALLOCATE Product_Cursor

--2. Create a cursor Product_Cursor_Fetch to fetch the records in form of ProductID_ProductName. (Example: 1_Smartphone) 
	DECLARE @Product_id INT,
			@Product_Name VARCHAR(250)
	DECLARE Product_Cursor_Fetch CURSOR
	FOR SELECT Product_id,Product_Name
		FROM Products
	OPEN Product_Cursor_Fetch
	FETCH NEXT FROM Product_Cursor_Fetch INTO
		@Product_id,
		@Product_Name
	WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT CAST(@Product_id AS VARCHAR)+'_'+@Product_Name
		FETCH NEXT FROM Product_Cursor_Fetch INTO
			@Product_id,
			@Product_Name
	END
	CLOSE Product_Cursor_Fetch
	DEALLOCATE Product_Cursor_Fetch

--3. Create a Cursor to Find and Display Products Above Price 30,000. 
	DECLARE @P_id INT,
			@P_Name VARCHAR(250),
			@Pri DECIMAL(10,2)
	DECLARE Product_Cursor_Display CURSOR
	FOR SELECT Product_id,Product_Name,Price
		FROM Products
		WHERE Price > 30000
	OPEN Product_Cursor_Display
	FETCH NEXT FROM Product_Cursor_Display INTO
		@P_id,
		@P_Name,
		@Pri
	WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT CAST(@P_id AS VARCHAR)+' '+@P_Name+' '+CAST(@Pri AS VARCHAR)
		FETCH NEXT FROM Product_Cursor_Display INTO
			@P_id,
			@P_Name,
			@Pri
	END
	CLOSE Product_Cursor_Display
	DEALLOCATE Product_Cursor_Display

--4. Create a cursor Product_CursorDelete that deletes all the data from the Products table.
	DECLARE @Pid INT
	DECLARE Product_Cursor_Delete CURSOR
	FOR SELECT Product_id
		FROM Products
	OPEN Product_Cursor_Delete
	FETCH NEXT FROM Product_Cursor_Delete INTO @Pid
		
	WHILE @@FETCH_STATUS = 0
	BEGIN
		DELETE FROM Products
		WHERE Product_id = @Pid
		FETCH NEXT FROM Product_Cursor_Delete INTO @Pid
	END
	CLOSE Product_Cursor_Delete
	DEALLOCATE Product_Cursor_Delete


--Part – B 

--5. Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increases the price by 10%. 
	DECLARE @P_id INT,
			@P_Name VARCHAR(250),
			@Pri DECIMAL(10,2)
	DECLARE Product_Cursor_Update CURSOR
	FOR SELECT Product_id,Product_Name,Price
		FROM Products
	OPEN Product_Cursor_Update
	FETCH NEXT FROM Product_Cursor_Update INTO
		@P_id,
		@P_Name,
		@Pri
	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE Products
		SET Price = @Pri + @Pri*0.1
		WHERE Product_id = @P_id

		FETCH NEXT FROM Product_Cursor_Update INTO
			@P_id,
			@P_Name,
			@Pri
	END
	CLOSE Product_Cursor_Update
	DEALLOCATE Product_Cursor_Update

	SELECT * FROM Products

--6. Create a Cursor to Rounds the price of each product to the nearest whole number. 
	DECLARE @P_id INT,
		@P_Name VARCHAR(250),
		@Pri DECIMAL(10,2)
	DECLARE Product_Cursor_Round CURSOR
	FOR SELECT Product_id,Product_Name,Price
		FROM Products
	OPEN Product_Cursor_Round
	FETCH NEXT FROM Product_Cursor_Round INTO
		@P_id,
		@P_Name,
		@Pri
	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE Products
		SET Price = ROUND(@Pri,2)
		WHERE Product_id = @P_id

		FETCH NEXT FROM Product_Cursor_Round INTO
			@P_id,
			@P_Name,
			@Pri
	END
	CLOSE Product_Cursor_Round
	DEALLOCATE Product_Cursor_Round

	SELECT * FROM Products

--Part – C 
--7. Create a cursor to insert details of Products into the NewProducts table if the product is “Laptop” 
--(Note: Create NewProducts table first with same fields as Products table) 
	CREATE TABLE NewProducts(
	Product_id INT PRIMARY KEY,
	Product_Name VARCHAR(250) NOT NULL,
	Price DECIMAL(10,2) NOT NULL
	)
	DECLARE @P_id INT,
		@P_Name VARCHAR(250),
		@Pri DECIMAL(10,2)
	DECLARE Product_Cursor_Insert CURSOR
	FOR SELECT Product_id,Product_Name,Price
		FROM Products
		WHERE Product_Name = 'Laptop'
	OPEN Product_Cursor_Insert
	FETCH NEXT FROM Product_Cursor_Insert INTO
		@P_id,
		@P_Name,
		@Pri
	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO NewProducts 
		VALUES (@P_id,@P_Name,@Pri)
		FETCH NEXT FROM Product_Cursor_Insert INTO
			@P_id,
			@P_Name,
			@Pri
	END
	CLOSE Product_Cursor_Insert
	DEALLOCATE Product_Cursor_Insert

	SELECT * FROM NewProducts

--8. Create a Cursor to Archive High-Price Products in a New Table (ArchivedProducts), Moves products 
--with a price above 50000 to an archive table, removing them from the original Products table. 
	CREATE TABLE ArchivedProducts(
	Product_id INT PRIMARY KEY,
	Product_Name VARCHAR(250) NOT NULL,
	Price DECIMAL(10,2) NOT NULL
	)
	DECLARE @P_id INT,
		@P_Name VARCHAR(250),
		@Pri DECIMAL(10,2)
	DECLARE Product_Cursor_Insert_Delete CURSOR
	FOR SELECT Product_id,Product_Name,Price
		FROM Products
		WHERE Price > 50000
	OPEN Product_Cursor_Insert_Delete
	FETCH NEXT FROM Product_Cursor_Insert_Delete INTO
		@P_id,
		@P_Name,
		@Pri
	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO ArchivedProducts 
		VALUES (@P_id,@P_Name,@Pri)
		DELETE FROM Products
		WHERE Product_id = @P_id
		FETCH NEXT FROM Product_Cursor_Insert_Delete INTO
			@P_id,
			@P_Name,
			@Pri
	END
	CLOSE Product_Cursor_Insert_Delete
	DEALLOCATE Product_Cursor_Insert_Delete

	SELECT * FROM ArchivedProducts
	SELECT * FROM Products