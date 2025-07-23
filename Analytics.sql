-- Create roles
CREATE ROLE ecommerce_admin;
CREATE ROLE ecommerce_analyst;

-- Assign permissions
GRANT SELECT, INSERT, UPDATE, DELETE ON Orders TO ecommerce_admin;
GRANT SELECT ON Monthly_Sales TO ecommerce_analyst;
