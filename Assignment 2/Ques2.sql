CREATE PROCEDURE UpdateOrderDetails
    @OrderID INT,
    @ProductID INT,
    @Quantity INT = NULL,
    @Price MONEY = NULL,
    @Discount MONEY = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @OldQuantity INT;

    SELECT @OldQuantity = OrderQty
    FROM Sales.SalesOrderDetail
    WHERE SalesOrderID = @OrderID AND ProductID = @ProductID;

    UPDATE Sales.SalesOrderDetail
    SET 
        OrderQty = ISNULL(@Quantity, OrderQty),
        UnitPrice = ISNULL(@Price, UnitPrice),
        UnitPriceDiscount = ISNULL(@Discount, UnitPriceDiscount)
    WHERE SalesOrderID = @OrderID AND ProductID = @ProductID;

    DECLARE @NewQuantity INT;

    SELECT @NewQuantity = OrderQty
    FROM Sales.SalesOrderDetail
    WHERE SalesOrderID = @OrderID AND ProductID = @ProductID;

    UPDATE Production.Product
    SET SafetyStockLevel = SafetyStockLevel - (@NewQuantity - @OldQuantity)
    WHERE ProductID = @ProductID;
END
