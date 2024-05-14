-- task 3 answer 6
SELECT max(x.cnt)
FROM (SELECT count(*) AS cnt FROM orders o GROUP BY customer_id, employee_id) x;

-- task 5 answer 74
SELECT count(DISTINCT p.product_id)
FROM products p
		 JOIN order_details od ON p.product_id = od.product_id
		 JOIN orders o ON od.order_id = o.order_id
		 JOIN employees e ON o.employee_id = e.employee_id
		 JOIN employee_territories et ON e.employee_id = et.employee_id
		 JOIN territories t ON et.territory_id = t.territory_id
		 JOIN region r ON t.region_id = r.region_id
WHERE r.region_description = 'Southern';

-- task 7 answer 2452

SELECT count(*)
FROM order_details od1
		 JOIN order_details od2 ON od2.order_id = od1.order_id
WHERE od1.product_id < od2.product_id;

-- task 9 answer 167

SELECT count(*)
FROM customers c
		 JOIN suppliers ON c.country = suppliers.country

-- task 11 answer 249

-- Speedy Express has already shipped 245 orders.
-- How many orders have been shipped by Federal Shipping?
-- NOTE: Orders' ship_via attribute is a FOREIGN KEY to Shippers.

SELECT count(*)
FROM orders
		 JOIN shippers s ON orders.ship_via = s.shipper_id
WHERE s.company_name = 'Federal Shipping'
  AND shipped_date IS NOT NULL;

-- task 13 How many customers have received the highest discount?

SELECT count(DISTINCT c.customer_id)
FROM customers c
		 JOIN orders o ON c.customer_id = o.customer_id
		 JOIN order_details od ON od.order_id = o.order_id
WHERE od.discount = (SELECT max(discount) FROM order_details);

-- task 15 How many customers have no "Sales" in their contact title?

SELECT count(*)
FROM customers
WHERE contact_title NOT LIKE '%Sales%';

-- task 17 How many customers have placed orders for products in all categories? 85

SELECT count(DISTINCT c.customer_id)
FROM customers c
		 JOIN orders o ON o.customer_id = c.customer_id
		 JOIN order_details od ON od.order_id = o.order_id
		 JOIN products p ON p.product_id = od.product_id
GROUP BY p.category_id
HAVING p.category_id = (SELECT count(DISTINCT category_id) FROM categories);