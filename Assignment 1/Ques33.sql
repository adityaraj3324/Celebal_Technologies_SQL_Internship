SELECT p.Name, c.Name
FROM Production.Product p
JOIN Production.ProductSubcategory s ON p.ProductSubcategoryID = s.ProductSubcategoryID
JOIN Production.ProductCategory c ON s.ProductCategoryID = c.ProductCategoryID
JOIN Purchasing.ProductVendor v ON p.ProductID = v.ProductID
JOIN Purchasing.Vendor vd ON v.BusinessEntityID = vd.BusinessEntityID
WHERE vd.Name = 'Specialty Biscuits, Ltd.';
