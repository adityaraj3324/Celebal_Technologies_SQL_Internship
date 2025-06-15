USE AdventureWorks2022;
GO
SELECT CustomerID 
FROM Sales.Customer
WHERE CustomerID NOT IN (
  SELECT CustomerID FROM Sales.SalesOrderHeader
);
