CREATE VIEW Monthly_Sales AS
SELECT 
  FORMAT(order_date, 'yyyy-MM') AS month,
  COUNT(order_id) AS total_orders,
  SUM(total_amount) AS revenue
FROM Orders
GROUP BY FORMAT(order_date, 'yyyy-MM');
--RFM Customer Segmentation
SELECT 
  user_id,
  DATEDIFF(DAY, MAX(order_date), GETDATE()) AS recency,
  COUNT(order_id) AS frequency,
  SUM(total_amount) AS monetary
FROM Orders
GROUP BY user_id;
--Top Rated Products
SELECT 
  P.name, 
  AVG(CAST(R.rating AS FLOAT)) AS avg_rating, 
  COUNT(R.review_id) AS reviews
FROM Reviews R
JOIN Products P ON R.product_id = P.product_id
GROUP BY P.name
ORDER BY avg_rating DESC;
