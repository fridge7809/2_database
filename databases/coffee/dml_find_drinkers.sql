select * from ratings r join drinker d on d.drinker_id = r.drinker_id where d.age >= 24;

select coffee from sells where price=(select min(price) from sells);