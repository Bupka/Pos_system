SELECT * FROM users LEFT JOIN salaries ON users.Salary_id = salaries.ID;

SELECT users.ID, users.Name, Value
FROM users 
INNER JOIN salaries
ON users.Salary_id = salaries.ID WHERE salaries.Value > 450; 

SELECT * FROM product WHERE Product_type_id = 1 AND Price > 2;

SELECT * FROM orders  WHERE orders.loc_id = 3;

SELECT * FROM orders 
INNER JOIN order_type 
ON orders.order_type_id = order_type.ID
AND order_type.description = 'sell';


SELECT users.ID, users.Name, order_type_id, location.City
FROM users
INNER JOIN orders 
ON users.ID = orders.user_id  
INNER JOIN location
ON location.ID = loc_id;

SELECT product_category, product.name, product.Price
FROM product_type
INNER JOIN product
ON product_type.id = product.Product_type_id;


