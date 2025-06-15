SELECT e1.BusinessEntityID AS ManagerID, COUNT(*) AS TotalEmployees
FROM HumanResources.Employee e1
JOIN HumanResources.Employee e2 
  ON e2.OrganizationNode.GetAncestor(1) = e1.OrganizationNode
GROUP BY e1.BusinessEntityID;
