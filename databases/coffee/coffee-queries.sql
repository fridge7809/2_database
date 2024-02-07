SELECT *
FROM ratings r
		 JOIN drinker d ON d.drinker_id = r.drinker_id
WHERE d.age >= 24;


-- sub query?
SELECT coffee
FROM sells
WHERE price = (SELECT min(price) FROM sells);

--select average price
SELECT avg(price)
FROM sells;

-- coffees costing < 700 average
SELECT coffee
FROM sells
GROUP BY coffee
HAVING avg(price) < 320;