-- task A answer 4
SELECT count(*)
FROM empires
		 JOIN countries c ON c.code = empires.countrycode
WHERE empire = 'Iberian';

-- task B answer 4
SELECT count(*)
FROM countries_continents
WHERE countrycode IN (SELECT countrycode FROM countries_continents WHERE continent = 'Asia')
GROUP BY countrycode
HAVING count(DISTINCT continent) > 1;

--task C answer 236902.80000000002, could be rounded but don't have time :)
SELECT sum(sum)
FROM (SELECT sum(population * (percentage / 100)) AS sum
	  FROM (SELECT code, population
			FROM countries c
					 JOIN countries_continents cc ON cc.countrycode = c.code
			WHERE cc.continent = 'Europe'
			  AND population > 50000000) AS cc_sub
			   JOIN countries_languages cl ON cl.countrycode = code
	  WHERE language = 'Spanish'
	  GROUP BY code) AS pop;

-- task D answer 1
SELECT cl.language AS lang
FROM countries c
		 JOIN empires e ON e.countrycode = c.code
		 JOIN countries_languages cl ON cl.countrycode = c.code
WHERE e.empire = 'Danish Empire'
GROUP BY cl.language
HAVING COUNT(DISTINCT c.code) = (SELECT COUNT(DISTINCT c2.code)
								 FROM countries c2
										  JOIN empires e2 ON e2.countrycode = c2.code
								 WHERE e2.empire = 'Danish Empire')
