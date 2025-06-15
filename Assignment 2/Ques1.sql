CREATE PROCEDURE InsertOrderDetails_AW
    @SalesOrderID INT,
    @ProductID INT,
    @OrderQty INT,
    @UnitPrice MONEY = NULL,
    @Discount MONEY = 0
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @AvailableStock INT;
    DECLARE @ReorderLevel INT;
    DECLARE @ActualPrice MONEY;

    SELECT 
        @AvailableStock = SafetyStockLevel,
        @ReorderLevel = ReorderPoint,
        @ActualPrice = StandardCost
    FROM Production.Product
    WHERE ProductID = @ProductID;

    IF @UnitPrice IS NULL
        SET @UnitPrice = @ActualPrice;

    IF @OrderQty > @AvailableStock
    BEGIN
        PRINT 'Not enough stock. Order failed.';
        RETURN;
    END

    INSERT INTO Sales.SalesOrderDetail 
        (SalesOrderID, ProductID, OrderQty, UnitPrice, UnitPriceDiscount)
    VALUES 
        (@SalesOrderID, @ProductID, @OrderQty, @UnitPrice, @Discount);

    UPDATE Production.Product
    SET SafetyStockLevel = SafetyStockLevel - @OrderQty
    WHERE ProductID = @ProductID;

    IF (@AvailableStock - @OrderQty) < @ReorderLevel
    BEGIN
        PRINT 'Warning: Stock is below reorder level.';
    END
END
