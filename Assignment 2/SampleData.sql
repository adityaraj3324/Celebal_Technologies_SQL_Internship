CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CompanyName VARCHAR(100),
    OrderDate DATE
);

CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    UnitPrice DECIMAL(10, 2),
    Quantity INT,
    Discount DECIMAL(5, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    UnitPrice DECIMAL(10, 2),
    UnitsInStock INT,
    ReorderLevel INT,
    QuantityPerUnit VARCHAR(50),
    Discontinued BIT
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    CompanyName VARCHAR(100)
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

ALTER TABLE Products ADD SupplierID INT, CategoryID INT;
ALTER TABLE Products ADD FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID);
ALTER TABLE Products ADD FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

INSERT INTO Orders VALUES
(1, 'Contoso Ltd', '2025-06-14'),
(2, 'Northwind Traders', '2025-06-13'),
(3, 'Tailspin Toys', '2025-06-15');

INSERT INTO OrderDetails VALUES
(1, 101, 20.00, 2, 0.00),
(1, 102, 15.00, 3, 0.10),
(2, 101, 20.00, 5, 0.00);

INSERT INTO Products (ProductID, ProductName, UnitPrice, UnitsInStock, ReorderLevel, QuantityPerUnit, Discontinued)
VALUES
(101, 'Mountain Bike', 20.00, 10, 2, '1 unit', 0),
(102, 'Road Bike', 15.00, 5, 2, '1 unit', 0),
(103, 'Helmet', 10.00, 3, 2, '1 unit', 0);

INSERT INTO Suppliers VALUES
(1, 'BikeWorld'),
(2, 'AdventureCycles');

INSERT INTO Categories VALUES
(1, 'Bicycles'),
(2, 'Accessories');

UPDATE Products SET SupplierID = 1, CategoryID = 1 WHERE ProductID = 101;
UPDATE Products SET SupplierID = 2, CategoryID = 1 WHERE ProductID = 102;
UPDATE Products SET SupplierID = 2, CategoryID = 2 WHERE ProductID = 103;
