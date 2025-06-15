CREATE VIEW MyProducts AS
SELECT 
    p.ProductID,
    p.Name AS ProductName,
    p.StandardCost AS UnitPrice,
    p.Size AS QuantityPerUnit,
    s.Name AS SupplierName,
    c.Name AS CategoryName
FROM Production.Product p
JOIN Purchasing.ProductVendor pv ON p.ProductID = pv.ProductID
JOIN Purchasing.Vendor s ON pv.BusinessEntityID = s.BusinessEntityID
JOIN Production.ProductSubcategory sub ON p.ProductSubcategoryID = sub.ProductSubcategoryID
JOIN Production.ProductCategory c ON sub.ProductCategoryID = c.ProductCategoryID
WHERE p.DiscontinuedDate IS NULL
