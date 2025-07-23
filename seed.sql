-- USERS
INSERT INTO Users (name, email, signup_date) VALUES
('Ava Patel', 'ava@example.com', '2025-07-01'),
('Rahul Verma', 'rahul@example.com', '2025-07-02');

-- PRODUCTS
INSERT INTO Products (name, category, price, stock_quantity) VALUES
('Eco Bottle', 'Accessories', 15.99, 100),
('Wireless Earbuds', 'Electronics', 49.99, 30),
('Yoga Mat', 'Fitness', 25.00, 50),
('LED Desk Lamp', 'Home', 30.00, 9); -- triggers low stock alert

-- ORDERS
INSERT INTO Orders (user_id, order_date, total_amount, payment_method) VALUES
(1, '2025-07-05', 31.98, 'Credit Card'),
(2, '2025-07-06', 49.99, 'UPI');

-- ORDER ITEMS
INSERT INTO Order_Items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 2, 15.99),
(2, 2, 1, 49.99);

-- REVIEWS
INSERT INTO Reviews (user_id, product_id, rating, comment, review_date) VALUES
(1, 1, 5, 'Excellent quality!', '2025-07-06'),
(2, 2, 4, 'Great sound.', '2025-07-07');
