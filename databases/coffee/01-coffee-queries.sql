select * from ratings r join drinker d on d.drinker_id = r.drinker_id where d.age >= 24;


-- sub query?
select coffee from sells where price=(select min(price) from sells);

--select average price
select avg(price) from sells

-- coffees costing < 700 average
select coffee from sells group by coffee having avg(price) < 320;