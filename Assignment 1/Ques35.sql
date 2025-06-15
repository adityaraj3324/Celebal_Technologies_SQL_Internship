SELECT Name
FROM Production.Product
WHERE SafetyStockLevel < 10 AND ReorderPoint = 0;
