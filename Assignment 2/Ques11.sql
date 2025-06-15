CREATE TRIGGER trg_CheckStockBeforeInsert
ON Sales.SalesOrderDetail
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Production.Product p ON i.ProductID = p.ProductID
        WHERE i.OrderQty > p.SafetyStockLevel
    )
    BEGIN
        PRINT 'Not enough stock to fulfill the order.';
        RETURN;
    END;

    INSERT INTO Sales.SalesOrderDetail (SalesOrderID, ProductID, OrderQty, UnitPrice)
    SELECT i.SalesOrderID, i.ProductID, i.OrderQty, i.UnitPrice
    FROM inserted i;

    UPDATE p
    SET p.SafetyStockLevel = p.SafetyStockLevel - i.OrderQty
    FROM Production.Product p
    JOIN inserted i ON p.ProductID = i.ProductID;
END;
