SELECT distinct P.FirstName, P.LastName 
FROM Person.Person P 
JOIN Person.BusinessEntityAddress B ON P.BusinessEntityID = B.BusinessEntityID 
JOIN Person.Address A ON B.AddressID = A.AddressID 
WHERE A.City IN ('Berlin', 'London');
