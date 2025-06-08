SELECT distinct p.FirstName, p.LastName
FROM Sales.Customer c
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
JOIN Person.BusinessEntityAddress b ON b.BusinessEntityID = p.BusinessEntityID
JOIN Person.Address a ON a.AddressID = b.AddressID
JOIN Person.StateProvince s ON a.StateProvinceID = s.StateProvinceID
WHERE s.CountryRegionCode IN ('US', 'GB');
