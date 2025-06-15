SELECT TOP 10 CustomerID, SUM(TotalDue) AS Spent
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY Spent DESC;
