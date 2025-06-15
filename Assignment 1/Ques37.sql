SELECT e.BusinessEntityID, e.JobTitle, COUNT(soh.SalesOrderID) AS OrderCount
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN HumanResources.Employee e ON soh.SalesPersonID = e.BusinessEntityID
GROUP BY e.BusinessEntityID, e.JobTitle;
