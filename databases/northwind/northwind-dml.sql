-- 3 How many suppliers are not from the USA

SELECT count(*)
FROM suppliers
WHERE country <> 'USA';

-- 5 How many products have been sold by suppliers from Tokyo?

SELECT count(*)
FROM order_details od
		 JOIN public.products p ON od.product_id = p.product_id
		 JOIN public.suppliers s ON p.supplier_id = s.supplier_id
WHERE s.city = 'Tokyo';

-- 7 What is the maximum number of suppliers that supply products in the same order?

SELECT max(supplier_count)
FROM (SELECT count(DISTINCT p.supplier_id) AS supplier_count
	  FROM order_details od
			   JOIN public.products p ON od.product_id = p.product_id
	  GROUP BY od.order_id) AS order_sup;

-- 9 What is the maximum number of suppliers that supply products in the same order?

SELECT od.order_id
FROM order_details od
		 JOIN public.products p ON od.product_id = p.product_id
		 JOIN public.suppliers s ON p.supplier_id = s.supplier_id
GROUP BY od.order_id
HAVING count(DISTINCT s.country) = 1;

-- 11 How many employees operate from all regions of Northwind?

SELECT count(DISTINCT e.employee_id)
FROM employees e
		 JOIN employee_territories et ON e.employee_id = et.employee_id
		 JOIN territories t ON et.territory_id = t.territory_id
		 JOIN region r ON t.region_id = r.region_id
GROUP BY e.employee_id
HAVING count(DISTINCT r.region_id) = (SELECT count(DISTINCT r.region_id) FROM region r);

-- The query correctly identifies 1 employee if we insert more data into the db with the following DML
INSERT INTO employees
VALUES (11, 'TESTUSER', 'Nancy', 'Sales Representative', 'Ms.', '1948-12-08', '1992-05-01',
		'507 - 20th Ave. E.\nApt. 2A', 'Seattle', 'WA', '98122', 'USA', '(206) 555-9857', '5467', '\x',
		'Education includes a BA in psychology from Colorado State University in 1970.  She also completed The Art of the Cold Call.  Nancy is a member of Toastmasters International.',
		2, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employee_territories
VALUES (10, '01581');
INSERT INTO employee_territories
VALUES (10, '03801');
INSERT INTO employee_territories
VALUES (10, '30346');
INSERT INTO employee_territories
VALUES (10, '60601');

-- 13 There are 22 orders with fewer than 30 products (quantity included) that have a freight above 50.0.
-- How many orders are there with 10 or fewer products (quantity included) that have a freight that is more than 10.0?

SELECT count(DISTINCT o.order_id)
FROM (SELECT order_id, SUM(quantity) AS total_quantity
	  FROM order_details
	  GROUP BY order_id
	  HAVING SUM(quantity) <= 10) AS sub
		 JOIN orders o ON sub.order_id = o.order_id
WHERE o.freight > 10.0;

-- 15 How many customers have a contact title that ends in "Manager"?

SELECT count(DISTINCT customer_id)
FROM customers
WHERE contact_title LIKE '%Manager';

-- 17 How many employees have handled orders for products in all categories?

SELECT count(DISTINCT e.employee_id)
FROM employees e
		 JOIN orders o ON o.employee_id = e.employee_id
WHERE o.order_id = (SELECT order_id
					FROM order_details
							 JOIN public.products p ON order_details.product_id = p.product_id
							 JOIN public.categories c ON p.category_id = c.category_id
					GROUP BY order_id
					HAVING count(DISTINCT c.category_id) = (SELECT count(*) FROM categories))