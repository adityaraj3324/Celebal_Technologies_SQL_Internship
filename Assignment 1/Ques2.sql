SELECT distinct P.FirstName, P.LastName 
FROM Sales.Customer C 
JOIN Sales.Store S ON C.StoreID = S.BusinessEntityID 
JOIN Person.Person P ON S.SalesPersonID = P.BusinessEntityID 
WHERE S.Name LIKE '%N';
