SELECT SalesOrderID, AVG(OrderQty) AS AvgQty
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID;
