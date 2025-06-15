SELECT DISTINCT c.CustomerID
FROM Sales.SalesOrderHeader o
JOIN Sales.SalesOrderDetail d ON o.SalesOrderID = d.SalesOrderID
JOIN Production.Product p ON p.ProductID = d.ProductID
JOIN Sales.Customer c ON o.CustomerID = c.CustomerID
JOIN Person.BusinessEntityAddress b ON b.BusinessEntityID = c.PersonID
JOIN Person.Address a ON a.AddressID = b.AddressID
WHERE a.City = 'London' AND p.Name LIKE '%Chair%';
