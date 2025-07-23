-- USERS
CREATE TABLE Users (
  user_id INT IDENTITY(1,1) PRIMARY KEY,
  name NVARCHAR(100),
  email NVARCHAR(100),
  signup_date DATE
);

-- PRODUCTS
CREATE TABLE Products (
  product_id INT IDENTITY(1,1) PRIMARY KEY,
  name NVARCHAR(100),
  category NVARCHAR(50),
  price DECIMAL(10,2),
  stock_quantity INT
);

-- ORDERS
CREATE TABLE Orders (
  order_id INT IDENTITY(1,1) PRIMARY KEY,
  user_id INT,
  order_date DATE,
  total_amount DECIMAL(10,2),
  payment_method NVARCHAR(50),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- ORDER ITEMS
CREATE TABLE Order_Items (
  order_item_id INT IDENTITY(1,1) PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  unit_price DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- REVIEWS
CREATE TABLE Reviews (
  review_id INT IDENTITY(1,1) PRIMARY KEY,
  user_id INT,
  product_id INT,
  rating INT CHECK (rating BETWEEN 1 AND 5),
  comment NVARCHAR(MAX),
  review_date DATE,
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- STOCK ALERTS
CREATE TABLE Stock_Alerts (
  alert_id INT IDENTITY(1,1) PRIMARY KEY,
  product_id INT,
  alert_time DATETIME DEFAULT GETDATE(),
  message NVARCHAR(200)
);
