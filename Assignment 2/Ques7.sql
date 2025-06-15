CREATE VIEW vwCustomerOrders AS
SELECT 
    s.Name AS StoreName,
    o.SalesOrderID AS OrderID,
    o.OrderDate,
    od.ProductID,
    p.Name AS ProductName,
    od.OrderQty AS Quantity,
    od.UnitPrice,
    od.OrderQty * od.UnitPrice AS Total
FROM Sales.SalesOrderDetail od
JOIN Sales.SalesOrderHeader o ON od.SalesOrderID = o.SalesOrderID
JOIN Production.Product p ON od.ProductID = p.ProductID
JOIN Sales.Customer c ON o.CustomerID = c.CustomerID
JOIN Sales.Store s ON c.StoreID = s.BusinessEntityID
