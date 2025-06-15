SELECT DISTINCT o.CustomerID
FROM Sales.SalesOrderDetail d
JOIN Production.Product p ON d.ProductID = p.ProductID
JOIN Sales.SalesOrderHeader o ON o.SalesOrderID = d.SalesOrderID
WHERE p.Name = 'Tofu';
