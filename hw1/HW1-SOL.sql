-- Q1

SELECT count(*)
FROM person
WHERE deathdate > '2010-02-01';
-- 284

SELECT count(*)
FROM person
WHERE deathdate IS NULL;
-- 52759

-- Q2

SELECT COUNT(*) 
FROM (
    SELECT movieId, AVG(P.height) 
    FROM Involved I
    JOIN person P ON I.personId = P.ID
    JOIN movie M ON I.movieId = M.id
    WHERE language = 'French' 
    GROUP BY I.movieId
    HAVING AVG(P.height) > 185
) X;
-- 46

SELECT COUNT(*) 
FROM (
    SELECT movieId, AVG(P.height) 
    FROM Involved I
    JOIN person P ON I.personId = P.ID
    JOIN movie M ON I.movieId = M.id
    WHERE language = 'Portuguese' 
    GROUP BY I.movieId
    HAVING AVG(P.height) > 175
) X;
-- 26


-- Q3

SELECT COUNT(*)
FROM (
    SELECT movieId
    FROM movie_genre
    WHERE genre = 'Action'  -- Specify the desired genre
    GROUP BY movieId
    HAVING COUNT(*) > 1
) X;
-- 14

SELECT COUNT(*)
FROM (
    SELECT movieId
    FROM movie_genre
    WHERE genre = 'Thriller'  -- Specify the desired genre
    GROUP BY movieId
    HAVING COUNT(*) > 1
) X;
-- 14


-- Q4

select count(distinct I1.personId)
from involved I1 
    join involved I2 on I1.movieId = I2.movieId
	join person P on I2.personId = P.id
where I1.role = 'actor'
  and I2.role = 'director'
  and P.name = 'Ingmar Bergman';
-- 52

select count(distinct I1.personId)
from involved I1 
    join involved I2 on I1.movieId = I2.movieId
	join person P on I2.personId = P.id
where I1.role = 'actor'
  and I2.role = 'director'
  and P.name = 'Akira Kurosawa';
-- 129

-- Q5
-- Movies with only one actor involved in them 

SELECT COUNT(*) 
FROM movie M
WHERE M.year = 2001
  AND M.id IN (
    SELECT I1.movieId
    FROM involved I1
    WHERE I1.role = 'actor'
    GROUP BY I1.movieId
    HAVING COUNT(*) = 1
  );
-- 10


SELECT COUNT(*) 
FROM movie M
WHERE M.year = 2005
  AND M.id IN (
    SELECT I1.movieId
    FROM involved I1
    WHERE I1.role = 'actor'
    GROUP BY I1.movieId
    HAVING COUNT(*) = 2
  );
-- 26

-- Q6

SELECT COUNT(*)
FROM (
    SELECT I1.personId, I2.personId, count(*)
    FROM involved I1
    JOIN involved I2 ON I1.movieId = I2.movieId AND I1.personId <> I2.personId
    WHERE I1.role = 'actor' AND I2.role = 'director'
    GROUP BY I1.personId, I2.personId
    HAVING COUNT(*) > 10
) X;
-- 92

SELECT COUNT(*)
FROM (
    SELECT I1.personId, I2.personId, count(*)
    FROM involved I1
    JOIN involved I2 ON I1.movieId = I2.movieId AND I1.personId <> I2.personId
    WHERE I1.role = 'actor' AND I2.role = 'director'
    GROUP BY I1.personId, I2.personId
    HAVING COUNT(*) > 15
) X;
-- 8

-- Q7

select count(*)
from (
	select M.id
	from movie M
		join involved I on M.id = I.movieId    
	where M.year = 2007
	group by M.id
	having count(distinct I.role) = (
		select count(*)
		from role R
	)
) X;
-- 325

select count(*)
from (
	select M.id
	from movie M
		join involved I on M.id = I.movieId    
	where M.year = 2004
	group by M.id
	having count(distinct I.role) = (
		select count(*)
		from role R
	)
) X;
-- 291


-- Q8

-- with counting
select count(*)
from (
	select I.personId
	from involved I 
		join movie_genre MG on MG.movieId = I.movieId
		join genre G on MG.genre = G.genre
	where G.category  = 'Newsworthy'
	group by I.personId
	having count(distinct G.genre) = (
		select count(*)
		from genre
		where category = 'Newsworthy'
	)
) X;
-- 156

-- with double negation
select count(P.id)
from person P
where not exists(
    select *
    from genre G
    where G.category = 'Newsworthy'
      and not exists(
        select *
        from movie_genre MG
            join involved I on MG.movieid = I.movieid
       	where I.personid  = P.id
	  and G.genre = MG.genre
     )
);
-- 156

-- with counting
select count(*)
from (
	select I.personId
	from involved I 
		join movie_genre MG on MG.movieId = I.movieId
		join genre G on MG.genre = G.genre
	where G.category  = 'Popular'
	group by I.personId
	having count(distinct G.genre) = (
		select count(*)
		from genre
		where category = 'Popular'
	)
) X;
-- 9693

-- with double negation
select count(P.id)
from person P
where not exists(
    select *
    from genre G
    where G.category = 'Popular'
      and not exists(
        select *
        from movie_genre MG
            join involved I on MG.movieid = I.movieid
       	where I.personid  = P.id
	  and G.genre = MG.genre
     )
);
-- 9693







