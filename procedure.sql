CREATE PROCEDURE PlaceOrder
  @user_id INT,
  @product_id INT,
  @quantity INT,
  @payment_method NVARCHAR(50)
AS
BEGIN
  DECLARE @price DECIMAL(10,2), @order_id INT;

  SELECT @price = price FROM Products WHERE product_id = @product_id;

  INSERT INTO Orders(user_id, order_date, total_amount, payment_method)
  VALUES(@user_id, GETDATE(), @price * @quantity, @payment_method);

  SET @order_id = SCOPE_IDENTITY();

  INSERT INTO Order_Items(order_id, product_id, quantity, unit_price)
  VALUES(@order_id, @product_id, @quantity, @price);

  UPDATE Products
  SET stock_quantity = stock_quantity - @quantity
  WHERE product_id = @product_id;
END;
