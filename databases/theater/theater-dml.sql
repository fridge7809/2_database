SELECT sum(a.base_salary + r.prod_salary) AS actor_salary_2015
FROM actors a
		 JOIN roles r ON r.actor = a.actor
		 JOIN productions p ON p.production = r.production
WHERE p.year = 2015;

SELECT d.director, sum(d.base_salary + c.prod_salary) AS salary
FROM directors d
		 JOIN conducts c ON c.director = d.director
		 JOIN productions p ON p.production = c.production
WHERE p.year > 2000
GROUP BY d.director
ORDER BY salary DESC;

SELECT a.actor
FROM actors a
		 JOIN directors d ON d.address LIKE a.address
GROUP BY a.actor
