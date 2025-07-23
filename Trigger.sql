CREATE TRIGGER trg_LowStock
ON Products
AFTER UPDATE
AS
BEGIN
  INSERT INTO Stock_Alerts (product_id, message)
  SELECT product_id, 'Stock dropped below 10!'
  FROM inserted
  WHERE stock_quantity < 10;
END;
