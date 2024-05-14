select count(*) from gDesigners; 
-- 2314
select count(*) from gTypes;
-- 83
select count(*) from gFabrics;
-- 56
select count(*) from gElements;
-- 218
select count(*) from gGarments;
-- 28170
select count(*) from gMadeOf;
-- 128011
select count(*) from gHasType;
-- 30972

-- (a)
-- simple join with a filter
-- fabric with elements
-- The chiffon fabric consists of 9 distinct elements.
select count (E.e_element)
from gFabrics F
	join gElements E on E.f_id = F.f_id
where F.f_name = 'chiffon';
-- 9
-- How many distinct elements does the cashmere fabric consist of?
select count (E.e_element)
from gFabrics F
	join gElements E on E.f_id = F.f_id
where F.f_name = 'cashmere'
-- 2


-- (b)
-- groupby with having
-- number of different countries
select count(*)
from (
select D.d_country, count(*)
from gDesigners D
group by D.d_country
) X;
-- 106

select count(distinct D.d_country)
from gDesigners D;
-- 106

-- number of countries with more than 1 designers
select count(*)
from (
select D.d_country, count(*)
from gDesigners D
group by D.d_country
having count(*) > 1
) X;
-- 84

-- number of countries with more than 2 designers
select count(*)
from (
select D.d_country, count(*)
from gDesigners D
group by D.d_country
having count(*) > 2
) X;
-- 70


-- (c)
-- simple nested query
select count(*)
from gGarments G
where G.g_Price > (select AVG(G.g_Price)
					from gGarments G);
-- 12609

select count(*)
from gGarments G
where G.g_Price < (select AVG(G.g_Price)
					from gGarments G);
-- 12708

select count(*)
from gGarments G
where G.g_Price isNULL;
-- 2853

-- common mistake / counting NULL values
SELECT COUNT(*)
FROM gGarments
WHERE g_price IS NULL OR g_price < (SELECT AVG(g_price) FROM gGarments);

SELECT COUNT(*)
FROM gGarments AS gg1
WHERE gg1.g_id NOT IN (
    SELECT gg2.g_id
    FROM gGarments AS gg2
    WHERE gg2.g_price >= (
        SELECT AVG(g_price)
        FROM gGarments
    )
);

-- unnecessary distinct
select count(distinct g_id) from ggarments
	where g_price < (select avg(g_price) from ggarments)
	
-- unnecessary grouby	
SELECT
    count(*)
FROM (
    SELECT
        gg.g_id
    FROM
        ggarments AS gg
    GROUP BY
        gg.g_id
    HAVING
        avg(gg.g_price) < (
            SELECT
                avg(g_price)
            FROM
                ggarments)) tmp;

-- (d)
-- intersect
-- have a type with importance = 6 and are sold at an unknown price
select count(*)
from (
	select T.g_ID
	from gHasType T
	where T.ht_Importance = 6 
	intersect
	select G.g_ID
	from gGarments G 
	where G.g_Price is NULL
) X;
--33

select count(*)
from (
	select T.g_ID
	from gHasType T
	where T.ht_Importance = 6 and T.g_ID in
		(select G.g_ID
		from gGarments G 
		where G.g_Price is NULL)
) X;
--33

select count(*)
from gGarments gg
join gHasType gHT on gg.g_id = gHT.g_id 
where gg.g_price IS NULL
and gHT.ht_importance = 6

-- mistake with left join
SELECT COUNT(ght.g_Id)
FROM gHasType ght LEFT JOIN gGarments gg ON ght.g_ID = gg.g_ID
WHERE gg.g_Price IS NULL AND ght.ht_Importance = 6; 


-- (e)
-- division
select count(*)
from (
	select G.d_ID
	from gGarments G
		join gHasType HT on G.g_ID = HT.g_ID
		join gTypes T on HT.t_ID = T.t_ID
	group by G.d_ID
	having count(distinct T.t_category) = (
		select count(distinct T.t_category)
		from gTypes T
	)
) X;
-- 8


-- the following query has one unnecessary join
select count(*)
from (
	select D.d_ID, count(distinct T.t_category)
	from gDesigners D
 	join gGarments G on G.d_ID = D.d_ID --or G.co_ID = D.d_ID
		join gHasType H on H.g_ID = G.g_ID 
			join gTypes T on T.t_ID = H.t_ID
	group by D.d_ID
	having count(distinct T.t_category) = (
		select count(distinct T.t_category)
		from gTypes T
	)
) X;
-- 8
-- could change the query by adding the co-designed



-- f 
drop view if exists gAllPairs;
create view gAllPairs
as
select G.d_ID as d_ID1, G.co_ID as d_ID2
from gGarments G
where not G.co_ID is null
union
select G.co_ID as d_ID1, G.d_ID as d_ID2
from gGarments G
where not G.co_ID is null;

drop view if exists gCountryCount;
create view gCountryCount
as
select P.d_ID1 as d_ID, 
	count(*) as d_DesignerCount, 
	count(distinct D.d_Country) as d_CountryCount
from gAllPairs P
	join gDesigners D on P.d_ID2 = D.d_ID
group by P.d_ID1;

-- 7 countries, 13 designers
select * 
from gCountryCount CC
where CC.d_ID = 100;

-- 582
select d_ID
from gCountryCount CC
where CC.d_CountryCount = (
	select max(d_CountryCount) 
	from gCountryCount
);


-- 7 countries, 11 designers
select * 
from gCountryCount CC
where CC.d_ID = 200;
	
-- 1
select count(*)
from gCountryCount CC
where CC.d_CountryCount = 14;


-- correct query without views
SELECT
	count(*)
FROM (
	SELECT
		G.d_id,
		count(D.d_country)
	FROM
		ggarments G
		JOIN gdesigners D ON D.d_id = G.co_id
	GROUP BY
		G.d_id
	UNION
	SELECT
		G.co_id,
		count(D.d_country)
	FROM
		ggarments G
		JOIN gdesigners D ON D.d_id = G.d_id
	GROUP BY
		G.co_id) X
WHERE
	count = 14;


-- Trigger
select G.g_Price
from gGarments G
where G.g_ID = 500;
-- 1509464

