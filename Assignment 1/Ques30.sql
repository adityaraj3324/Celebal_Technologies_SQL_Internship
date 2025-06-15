SELECT soh.SalesOrderID
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
LEFT JOIN Person.PersonPhone pp ON c.PersonID = pp.BusinessEntityID
LEFT JOIN Person.PhoneNumberType pnt ON pp.PhoneNumberTypeID = pnt.PhoneNumberTypeID AND pnt.Name = 'Fax'
WHERE pnt.Name IS NULL;
