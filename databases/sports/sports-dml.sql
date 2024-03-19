-- Task 1
SELECT s.name, s.record AS sorted
FROM sports s
ORDER BY s.name ASC;

-- Task 2
SELECT s.name AS one_result
FROM sports s
		 JOIN results r ON r.sportid = s.id
GROUP BY s.name;

-- task 3 number of athletes that competed in 1 sport
SELECT COUNT(DISTINCT r.peopleid) AS atheletes_competed
FROM results r;

-- task 4 The ID and name of athletes who have at least twenty results.
SELECT p.id, p.name
FROM people p
		 JOIN results r ON r.peopleid = p.id
GROUP BY p.id, p.name
HAVING COUNT(r.peopleid) >= 20;

-- task 5 The ID, name and gender description of all athletes that currently hold a record.
SELECT p.id, p.name, g.description
FROM people p
		 JOIN results r ON r.peopleid = p.id
		 JOIN gender g ON g.gender = p.gender
		 JOIN sports s ON s.id = r.sportid
WHERE r.result = s.record
GROUP BY p.id, p.name,
		 g.description;

-- task 6 wrong todo fix
SELECT s.name   AS sport,
	   COUNT(*) AS numathletes
FROM sports s
		 JOIN results r ON r.sportid = s.id
WHERE r.result = s.record
GROUP BY s.id,
		 r.peopleid;

-- Task 7 convert floating point to double digit precision
SELECT p.id,
	   p.name,
	   MAX(r.result)   AS best,
	   TO_CHAR(s.record - MAX(r.result),
			   '0D99') AS diff
FROM people p
		 JOIN results r ON r.peopleid = p.id
		 JOIN sports s ON s.id = r.sportid
WHERE s.name = 'Triple Jump'
GROUP BY p.id, s.record
HAVING COUNT(*) >= 20;

-- Task 8 extract year from date
SELECT p.id, p.name, g.description
FROM people p
		 JOIN results r ON r.peopleid = p.id
		 JOIN competitions c ON c.id = r.competitionid
		 JOIN gender g ON g.gender = p.gender
WHERE c.place LIKE 'Hvide Sande'
  AND DATE_PART('year',
				c.held) = 2009
GROUP BY p.id,
		 g.description;

-- Task 9 string splitting
SELECT p.name, g.description
FROM people p
		 JOIN gender g ON g.gender = p.gender
WHERE SPLIT_PART(p.name,
				 ' ', 2) LIKE 'J%sen'
GROUP BY p.name, g.description
ORDER BY p.name ASC;

-- Task 10 percentage formatting
SELECT p.name,
	   s.name,
	   CONCAT(TO_CHAR((ROUND((r.result / s.record) * 100)), '999'), '%') AS percentage
FROM results r
		 JOIN people p ON p.id = r.peopleid
		 JOIN sports s ON s.id = r.sportid;

-- Task 11 find null values
SELECT COUNT(DISTINCT p.id) AS incomplete_count
FROM people p
		 JOIN results r ON r.peopleid = p.id
WHERE r.result IS NULL;


-- Task 12 numeric type formatting
SELECT s.id,
	   s.name,
	   TO_CHAR(s.record,
			   'FM990D00') AS maxres
FROM sports s
ORDER BY s.id;

-- Task 13
SELECT p.id,
	   p.name,
	   COUNT(*) AS results
FROM people p
		 JOIN results r ON r.peopleid = p.id
		 JOIN sports s ON s.id = r.sportid
WHERE s.record = r.result
GROUP BY p.id
HAVING COUNT(DISTINCT s.id) >= 2;

-- Task 14 todo fix

-- bool -> int cast, where in sub query
--SELECT p.id, p.name, p.height, cast((s.record = r.result) as int) as "record?"
SELECT p.id,
	   p.name,
	   p.height,
	   r.result,
	   s.name,
	   CASE
		   WHEN (s.record = r.result) THEN 'true'
		   ELSE 'false'
		   END AS "record?"
FROM results r
		 JOIN people p ON p.id = r.peopleid
		 JOIN sports s ON s.id = r.sportid
WHERE r.result IN
	  (SELECT MAX(r.result)
	   FROM competitions c
				JOIN results r ON r.competitionid = c.id
				JOIN sports s ON s.id = r.sportid
	   GROUP BY s.id)
GROUP BY p.id, s.record, r.result;

SELECT *
FROM sports
WHERE name