SELECT BusinessEntityID, COUNT(*) AS Products
FROM Purchasing.ProductVendor
GROUP BY BusinessEntityID;
