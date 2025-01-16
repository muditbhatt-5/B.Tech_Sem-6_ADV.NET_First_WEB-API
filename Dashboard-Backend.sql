CREATE TABLE [dbo].[Bills](
	[BillID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[BillDate] [datetime] NULL DEFAULT (getdate()),
	[TotalAmount] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](500) NULL,
	[CreatedAt] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[OrderItems](
	[OrderItemID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderDate] [datetime] NULL DEFAULT (getdate()),
	[Status] [nvarchar](50) NULL DEFAULT ('Pending'),
	[TotalAmount] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[Category] [nvarchar](255) NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[StockQuantity] [int] NOT NULL,
	[AddedDate] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

-- Insert records into Customers
INSERT INTO [dbo].[Customers] (CustomerName, Email, Phone, Address, CreatedAt) 
VALUES ('John Doe', 'johndoe@example.com', '1234567890', '123 Elm Street, NY', '2024-01-15');

INSERT INTO [dbo].[Customers] (CustomerName, Email, Phone, Address, CreatedAt) 
VALUES ('Jane Smith', 'janesmith@example.com', '9876543210', '456 Oak Avenue, LA', '2024-02-20');

INSERT INTO [dbo].[Customers] (CustomerName, Email, Phone, Address, CreatedAt) 
VALUES ('Michael Brown', 'michaelb@example.com', '1122334455', '789 Pine Road, SF', '2024-03-10');

INSERT INTO [dbo].[Customers] (CustomerName, Email, Phone, Address, CreatedAt) 
VALUES ('Emily Davis', 'emilyd@example.com', '2233445566', '321 Cedar Lane, CH', '2024-04-05');

INSERT INTO [dbo].[Customers] (CustomerName, Email, Phone, Address, CreatedAt) 
VALUES ('David Wilson', 'davidw@example.com', '5566778899', '567 Maple Court, TX', '2024-01-10');

INSERT INTO [dbo].[Customers] (CustomerName, Email, Phone, Address, CreatedAt) 
VALUES ('Sophia Lee', 'sophial@example.com', '6677889900', '890 Birch Way, FL', '2024-03-01');

INSERT INTO [dbo].[Customers] (CustomerName, Email, Phone, Address, CreatedAt) 
VALUES ('Chris Evans', 'chrise@example.com', '7788990011', '234 Willow Drive, GA', '2024-02-25');

INSERT INTO [dbo].[Customers] (CustomerName, Email, Phone, Address, CreatedAt) 
VALUES ('Olivia Clark', 'oliviac@example.com', '8899001122', '678 Cherry Street, IL', '2024-04-02');

INSERT INTO [dbo].[Customers] (CustomerName, Email, Phone, Address, CreatedAt) 
VALUES ('Ethan Hall', 'ethanh@example.com', '9900112233', '345 Maple Lane, TX', '2024-01-25');

INSERT INTO [dbo].[Customers] (CustomerName, Email, Phone, Address, CreatedAt) 
VALUES ('Amelia Wright', 'ameliaw@example.com', '2345678901', '901 Spruce Drive, NY', '2024-03-12');

INSERT INTO [dbo].[Customers] (CustomerName, Email, Phone, Address, CreatedAt) 
VALUES ('Mason Johnson', 'masonj@example.com', '3456789012', '567 Cedar Blvd, LA', '2024-02-18');

INSERT INTO [dbo].[Customers] (CustomerName, Email, Phone, Address, CreatedAt) 
VALUES ('Ella Adams', 'ellaa@example.com', '4567890123', '789 Birch Blvd, IL', '2024-03-29');

INSERT INTO [dbo].[Customers] (CustomerName, Email, Phone, Address, CreatedAt) 
VALUES ('Liam Nelson', 'liamn@example.com', '5678901234', '678 Pine Court, SF', '2024-01-10');

INSERT INTO [dbo].[Customers] (CustomerName, Email, Phone, Address, CreatedAt) 
VALUES ('Ava Martinez', 'avam@example.com', '6789012345', '890 Oak Road, CH', '2024-02-05');

INSERT INTO [dbo].[Customers] (CustomerName, Email, Phone, Address, CreatedAt) 
VALUES ('Noah Thomas', 'noaht@example.com', '7890123456', '234 Elm Blvd, TX', '2024-03-15');

-- Insert records into Products
INSERT INTO [dbo].[Products] (ProductName, Category, Price, StockQuantity, AddedDate) VALUES ('Laptop', 'Electronics', 799.99, 50, '2023-12-01');
INSERT INTO [dbo].[Products] (ProductName, Category, Price, StockQuantity, AddedDate) VALUES ('Smartphone', 'Electronics', 599.99, 100, '2023-11-15');
INSERT INTO [dbo].[Products] (ProductName, Category, Price, StockQuantity, AddedDate) VALUES ('Tablet', 'Electronics', 299.99, 75, '2023-12-10');
INSERT INTO [dbo].[Products] (ProductName, Category, Price, StockQuantity, AddedDate) VALUES ('Headphones', 'Accessories', 49.99, 200, '2023-11-20');
INSERT INTO [dbo].[Products] (ProductName, Category, Price, StockQuantity, AddedDate) VALUES ('Chair', 'Furniture', 149.99, 30, '2023-10-25');
INSERT INTO [dbo].[Products] (ProductName, Category, Price, StockQuantity, AddedDate) VALUES ('Desk', 'Furniture', 249.99, 20, '2023-10-30');
INSERT INTO [dbo].[Products] (ProductName, Category, Price, StockQuantity, AddedDate) VALUES ('Monitor', 'Electronics', 199.99, 40, '2023-11-05');
INSERT INTO [dbo].[Products] (ProductName, Category, Price, StockQuantity, AddedDate) VALUES ('Keyboard', 'Accessories', 39.99, 150, '2023-11-10');
INSERT INTO [dbo].[Products] (ProductName, Category, Price, StockQuantity, AddedDate) VALUES ('Mouse', 'Accessories', 29.99, 300, '2023-11-12');
INSERT INTO [dbo].[Products] (ProductName, Category, Price, StockQuantity, AddedDate) VALUES ('Printer', 'Electronics', 129.99, 25, '2023-12-01');
INSERT INTO [dbo].[Products] (ProductName, Category, Price, StockQuantity, AddedDate) VALUES ('Camera', 'Electronics', 499.99, 15, '2023-12-15');
INSERT INTO [dbo].[Products] (ProductName, Category, Price, StockQuantity, AddedDate) VALUES ('Speaker', 'Accessories', 79.99, 120, '2023-11-30');
INSERT INTO [dbo].[Products] (ProductName, Category, Price, StockQuantity, AddedDate) VALUES ('Bookshelf', 'Furniture', 89.99, 10, '2023-10-15');
INSERT INTO [dbo].[Products] (ProductName, Category, Price, StockQuantity, AddedDate) VALUES ('Rug', 'Furniture', 59.99, 25, '2023-10-20');
INSERT INTO [dbo].[Products] (ProductName, Category, Price, StockQuantity, AddedDate) VALUES ('Lamp', 'Furniture', 39.99, 50, '2023-11-05');

-- Insert records into Orders

INSERT INTO [dbo].[Orders] (CustomerID, OrderDate, Status, TotalAmount) VALUES (1, '2024-03-01', 'Completed', 849.98);
INSERT INTO [dbo].[Orders] (CustomerID, OrderDate, Status, TotalAmount) VALUES (2, '2024-03-15', 'Pending', 599.99);
INSERT INTO [dbo].[Orders] (CustomerID, OrderDate, Status, TotalAmount) VALUES (3, '2024-03-20', 'Completed', 299.99);
INSERT INTO [dbo].[Orders] (CustomerID, OrderDate, Status, TotalAmount) VALUES (4, '2024-04-01', 'Cancelled', 49.99);
INSERT INTO [dbo].[Orders] (CustomerID, OrderDate, Status, TotalAmount) VALUES (5, '2024-03-05', 'Pending', 399.98);
INSERT INTO [dbo].[Orders] (CustomerID, OrderDate, Status, TotalAmount) VALUES (6, '2024-02-28', 'Completed', 649.98);
INSERT INTO [dbo].[Orders] (CustomerID, OrderDate, Status, TotalAmount) VALUES (7, '2024-03-18', 'Pending', 899.97);
INSERT INTO [dbo].[Orders] (CustomerID, OrderDate, Status, TotalAmount) VALUES (8, '2024-03-22', 'Completed', 139.98);
INSERT INTO [dbo].[Orders] (CustomerID, OrderDate, Status, TotalAmount) VALUES (9, '2024-02-15', 'Pending', 79.99);
INSERT INTO [dbo].[Orders] (CustomerID, OrderDate, Status, TotalAmount) VALUES (10, '2024-04-05', 'Completed', 529.98);
INSERT INTO [dbo].[Orders] (CustomerID, OrderDate, Status, TotalAmount) VALUES (11, '2024-03-25', 'Pending', 259.98);
INSERT INTO [dbo].[Orders] (CustomerID, OrderDate, Status, TotalAmount) VALUES (12, '2024-03-29', 'Cancelled', 199.99);
INSERT INTO [dbo].[Orders] (CustomerID, OrderDate, Status, TotalAmount) VALUES (13, '2024-04-03', 'Completed', 699.98);
INSERT INTO [dbo].[Orders] (CustomerID, OrderDate, Status, TotalAmount) VALUES (14, '2024-02-28', 'Pending', 89.99);
INSERT INTO [dbo].[Orders] (CustomerID, OrderDate, Status, TotalAmount) VALUES (15, '2024-03-01', 'Completed', 149.99);

-- Insert records into Orderitems
INSERT INTO [dbo].[OrderItems] (OrderID, ProductID, Quantity, Price) VALUES (1, 1, 1, 799.99);
INSERT INTO [dbo].[OrderItems] (OrderID, ProductID, Quantity, Price) VALUES (1, 4, 1, 49.99);
INSERT INTO [dbo].[OrderItems] (OrderID, ProductID, Quantity, Price) VALUES (2, 2, 1, 599.99);
INSERT INTO [dbo].[OrderItems] (OrderID, ProductID, Quantity, Price) VALUES (3, 3, 1, 299.99);
INSERT INTO [dbo].[OrderItems] (OrderID, ProductID, Quantity, Price) VALUES (4, 4, 1, 49.99);
INSERT INTO [dbo].[OrderItems] (OrderID, ProductID, Quantity, Price) VALUES (5, 6, 1, 249.99);
INSERT INTO [dbo].[OrderItems] (OrderID, ProductID, Quantity, Price) VALUES (5, 5, 1, 149.99);
INSERT INTO [dbo].[OrderItems] (OrderID, ProductID, Quantity, Price) VALUES (6, 7, 1, 199.99);
INSERT INTO [dbo].[OrderItems] (OrderID, ProductID, Quantity, Price) VALUES (6, 2, 1, 449.99);
INSERT INTO [dbo].[OrderItems] (OrderID, ProductID, Quantity, Price) VALUES (7, 1, 1, 799.99);
INSERT INTO [dbo].[OrderItems] (OrderID, ProductID, Quantity, Price) VALUES (7, 8, 2, 39.99);
INSERT INTO [dbo].[OrderItems] (OrderID, ProductID, Quantity, Price) VALUES (8, 9, 2, 29.99);
INSERT INTO [dbo].[OrderItems] (OrderID, ProductID, Quantity, Price) VALUES (8, 10, 1, 79.99);
INSERT INTO [dbo].[OrderItems] (OrderID, ProductID, Quantity, Price) VALUES (9, 13, 1, 59.99);
INSERT INTO [dbo].[OrderItems] (OrderID, ProductID, Quantity, Price) VALUES (9, 14, 1, 19.99);
INSERT INTO [dbo].[OrderItems] (OrderID, ProductID, Quantity, Price) VALUES (10, 15, 2, 39.99);
INSERT INTO [dbo].[OrderItems] (OrderID, ProductID, Quantity, Price) VALUES (10, 7, 1, 199.99);
INSERT INTO [dbo].[OrderItems] (OrderID, ProductID, Quantity, Price) VALUES (11, 5, 1, 149.99);
INSERT INTO [dbo].[OrderItems] (OrderID, ProductID, Quantity, Price) VALUES (11, 4, 1, 49.99);
INSERT INTO [dbo].[OrderItems] (OrderID, ProductID, Quantity, Price) VALUES (12, 2, 1, 199.99);

-- Insert records into Bills

INSERT INTO [dbo].[Bills] (OrderID, BillDate, TotalAmount) VALUES (1, '2024-03-01', 849.98);
INSERT INTO [dbo].[Bills] (OrderID, BillDate, TotalAmount) VALUES (2, '2024-03-15', 599.99);
INSERT INTO [dbo].[Bills] (OrderID, BillDate, TotalAmount) VALUES (3, '2024-03-20', 299.99);
INSERT INTO [dbo].[Bills] (OrderID, BillDate, TotalAmount) VALUES (5, '2024-03-05', 399.98);
INSERT INTO [dbo].[Bills] (OrderID, BillDate, TotalAmount) VALUES (6, '2024-02-28', 649.98);
INSERT INTO [dbo].[Bills] (OrderID, BillDate, TotalAmount) VALUES (8, '2024-03-22', 139.98);
INSERT INTO [dbo].[Bills] (OrderID, BillDate, TotalAmount) VALUES (10, '2024-04-05', 529.98);
INSERT INTO [dbo].[Bills] (OrderID, BillDate, TotalAmount) VALUES (13, '2024-04-03', 699.98);
INSERT INTO [dbo].[Bills] (OrderID, BillDate, TotalAmount) VALUES (15, '2024-03-01', 149.99);


CREATE PROCEDURE [dbo].[usp_GetDashboardData]
AS
BEGIN
    -- Enable NOCOUNT for better performance
    SET NOCOUNT ON;
-- SET NOCOUNT ON: Suppresses the message from being returned. This prevents the sending of DONEINPROC messages to the client for each
-- statement in a stored procedure.
-- SET NOCOUNT OFF: Includes the message in the result set. 
    -- Temporary tables for organized data fetching
	CREATE TABLE #Counts (
        Metric NVARCHAR(255),
        Value INT
		);

    CREATE TABLE #RecentOrders (
        OrderID INT,
        CustomerName NVARCHAR(255),
        OrderDate DATETIME,
        Status NVARCHAR(50)
    );

    CREATE TABLE #RecentProducts (
        ProductID INT,
        ProductName NVARCHAR(255),
        Category NVARCHAR(255),
        AddedDate DATETIME,
        StockQuantity INT
    );

    CREATE TABLE #TopCustomers (
        CustomerName NVARCHAR(255),
        TotalOrders INT,
        Email NVARCHAR(255)
    );

    CREATE TABLE #TopSellingProducts (
        ProductName NVARCHAR(255),
        TotalSoldQuantity INT,
        Category NVARCHAR(255)
    );

    ---- Step 1: Get Counts
    --
	INSERT INTO #Counts
        SELECT 'TotalCustomers', COUNT(*) FROM Customers
    INSERT INTO #Counts
	    SELECT 'TotalProducts', COUNT(*) FROM Products
	INSERT INTO #Counts
		SELECT 'TotalOrders',COUNT(*) FROM Orders
	INSERT INTO #Counts
		SELECT 'TotalBills',COUNT(*) FROM Bills
		
    --    (SELECT COUNT(*) FROM Customers) AS TotalCustomers,
    --    (SELECT COUNT(*) FROM Products) AS TotalProducts,
    --    (SELECT COUNT(*) FROM Orders) AS TotalOrders,
    --    (SELECT COUNT(*) FROM Bills) AS TotalBills;

    -- Step 2: Get Recent 10 Orders
    INSERT INTO #RecentOrders
    SELECT TOP 10
        O.OrderID,
        C.CustomerName,
        O.OrderDate,
        O.Status
    FROM Orders O
    INNER JOIN Customers C ON O.CustomerID = C.CustomerID
    ORDER BY O.OrderDate DESC;

    -- Step 3: Get Recent 10 Newly Added Products
    INSERT INTO #RecentProducts
    SELECT TOP 10
        ProductID,
        ProductName,
        Category,
        AddedDate,
        StockQuantity
    FROM Products
    ORDER BY AddedDate DESC;

    -- Step 4: Get Top 10 Customers by Order Count
    INSERT INTO #TopCustomers
    SELECT TOP 10
        C.CustomerName,
        COUNT(O.OrderID) AS TotalOrders,
        C.Email
    FROM Orders O
    INNER JOIN Customers C ON O.CustomerID = C.CustomerID
    GROUP BY C.CustomerName, C.Email
    ORDER BY COUNT(O.OrderID) DESC;

    -- Step 5: Get Top 10 Selling Products
    INSERT INTO #TopSellingProducts
    SELECT TOP 10
        P.ProductName,
        SUM(OI.Quantity) AS TotalSoldQuantity,
        P.Category
    FROM OrderItems OI
    INNER JOIN Products P ON OI.ProductID = P.ProductID
    GROUP BY P.ProductName, P.Category
    ORDER BY SUM(OI.Quantity) DESC;

    -- Output Results
    -- Output Counts
    SELECT * FROM #Counts;

    -- Output Recent Orders
    SELECT * FROM #RecentOrders;

    -- Output Recent Products
    SELECT * FROM #RecentProducts;

    -- Output Top Customers
    SELECT * FROM #TopCustomers;

    -- Output Top Selling Products
    SELECT * FROM #TopSellingProducts;

    -- Cleanup Temporary Tables
    DROP TABLE #RecentOrders;
    DROP TABLE #RecentProducts;
    DROP TABLE #TopCustomers;
    DROP TABLE #TopSellingProducts;
END;