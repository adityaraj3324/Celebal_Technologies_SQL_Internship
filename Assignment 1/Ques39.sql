SELECT p.Name, SUM(d.LineTotal) AS Revenue
FROM Sales.SalesOrderDetail d
JOIN Production.Product p ON d.ProductID = p.ProductID
GROUP BY p.Name;
