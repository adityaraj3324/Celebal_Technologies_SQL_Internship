SELECT e.BusinessEntityID, pe.FirstName AS EmpFirst, pe.LastName AS EmpLast,
       pm.FirstName AS MgrFirst, pm.LastName AS MgrLast
FROM HumanResources.Employee e
JOIN Person.Person pe ON e.BusinessEntityID = pe.BusinessEntityID
JOIN HumanResources.Employee m ON e.OrganizationNode.GetAncestor(1) = m.OrganizationNode
JOIN Person.Person pm ON m.BusinessEntityID = pm.BusinessEntityID;
