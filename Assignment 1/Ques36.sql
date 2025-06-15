SELECT TOP 10 sp.Name AS Country, SUM(h.TotalDue) AS Sales
FROM Sales.SalesOrderHeader h
JOIN Person.Address a ON h.ShipToAddressID = a.AddressID
JOIN Person.StateProvince sp ON a.StateProvinceID = sp.StateProvinceID
GROUP BY sp.Name
ORDER BY Sales DESC;
