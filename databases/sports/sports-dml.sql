-- Task 1
SELECT S.NAME, S.RECORD AS SORTED
FROM SPORTS S
ORDER BY S.NAME ASC;

-- Task 2
SELECT S.NAME AS ONE_RESULT
FROM SPORTS S
         JOIN RESULTS R ON R.SPORTID = S.ID
GROUP BY S.NAME;

-- task 3 number of athletes that competed in 1 sport
SELECT COUNT(DISTINCT R.PEOPLEID) AS ATHELETES_COMPETED
FROM RESULTS R;

-- task 4 The ID and name of athletes who have at least twenty results.
SELECT P.ID, P.NAME
FROM PEOPLE P
         JOIN RESULTS R ON R.PEOPLEID = P.ID
GROUP BY P.ID, P.NAME
HAVING COUNT(R.PEOPLEID) >= 20;

-- task 5 The ID, name and gender description of all athletes that currently hold a record.
SELECT P.ID, P.NAME, G.DESCRIPTION
FROM PEOPLE P
         JOIN RESULTS R ON R.PEOPLEID = P.ID
         JOIN GENDER G ON G.GENDER = P.GENDER
         JOIN SPORTS S ON S.ID = R.SPORTID
WHERE R.RESULT = S.RECORD
GROUP BY P.ID, P.NAME,
         G.DESCRIPTION;

-- task 6 wrong todo fix
SELECT S.NAME   AS SPORT,
       COUNT(*) AS NUMATHLETES
FROM SPORTS S
         JOIN RESULTS R ON R.SPORTID = S.ID
WHERE R.RESULT = S.RECORD
GROUP BY S.ID,
         R.PEOPLEID;

-- Task 7 convert floating point to double digit precision
SELECT P.ID,
       P.NAME,
       MAX(R.RESULT)   AS BEST,
       TO_CHAR(S.RECORD - MAX(R.RESULT),
               '0D99') AS DIFF
FROM PEOPLE P
         JOIN RESULTS R ON R.PEOPLEID = P.ID
         JOIN SPORTS S ON S.ID = R.SPORTID
WHERE S.NAME = 'Triple Jump'
GROUP BY P.ID, S.RECORD
HAVING COUNT(*) >= 20;

-- Task 8 extract year from date
SELECT P.ID, P.NAME, G.DESCRIPTION
FROM PEOPLE P
         JOIN RESULTS R ON R.PEOPLEID = P.ID
         JOIN COMPETITIONS C ON C.ID = R.COMPETITIONID
         JOIN GENDER G ON G.GENDER = P.GENDER
WHERE C.PLACE like 'Hvide Sande'
  AND DATE_PART('year',
                C.HELD) = 2009
GROUP BY P.ID,
         G.DESCRIPTION;

-- Task 9 string splitting
SELECT P.NAME, G.DESCRIPTION
FROM PEOPLE P
         JOIN GENDER G ON G.GENDER = P.GENDER
WHERE SPLIT_PART(P.NAME,
                 ' ', 2) LIKE 'J%sen'
GROUP BY P.NAME, G.DESCRIPTION
ORDER BY P.NAME ASC;

-- Task 10 percentage formatting
SELECT P.NAME,
       S.NAME,
       CONCAT(TO_CHAR((ROUND((R.RESULT / S.RECORD) * 100)), '999'), '%') AS PERCENTAGE
FROM RESULTS R
         JOIN PEOPLE P ON P.ID = R.PEOPLEID
         JOIN SPORTS S ON S.ID = R.SPORTID;

-- Task 11 find null values
SELECT COUNT(DISTINCT P.ID) AS INCOMPLETE_COUNT
FROM PEOPLE P
         JOIN RESULTS R ON R.PEOPLEID = P.ID
WHERE R.RESULT IS NULL;


-- Task 12 numeric type formatting
SELECT S.ID,
       S.NAME,
       TO_CHAR(S.RECORD,
               'FM990D00') AS MAXRES
FROM SPORTS S
ORDER BY S.ID;

-- Task 13
SELECT P.ID,
       P.NAME,
       COUNT(*) AS RESULTS
FROM PEOPLE P
         JOIN RESULTS R ON R.PEOPLEID = P.ID
         JOIN SPORTS S ON S.ID = R.SPORTID
WHERE S.RECORD = R.RESULT
GROUP BY P.ID
HAVING COUNT(DISTINCT S.ID) >= 2;

-- Task 14 todo fix

-- bool -> int cast, where in sub query
--SELECT p.id, p.name, p.height, cast((s.record = r.result) as int) as "record?"
SELECT P.ID,
       P.NAME,
       P.HEIGHT,
       r.result,
       s.name,
       CASE
           WHEN (S.RECORD = R.RESULT) THEN 'true'
           ELSE 'false'
           END AS "record?"
FROM RESULTS R
         JOIN PEOPLE P ON P.ID = R.PEOPLEID
         JOIN SPORTS S ON S.ID = R.SPORTID
WHERE R.RESULT IN
      (SELECT MAX(R.RESULT)
       FROM COMPETITIONS C
                JOIN RESULTS R ON R.COMPETITIONID = C.ID
                JOIN SPORTS S ON S.ID = R.SPORTID
       GROUP BY S.ID)
GROUP BY P.ID, S.RECORD, R.RESULT;
