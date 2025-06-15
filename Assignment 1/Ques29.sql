SELECT TOP 1 CustomerID, COUNT(*) AS TotalOrders
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY COUNT(*) DESC;
