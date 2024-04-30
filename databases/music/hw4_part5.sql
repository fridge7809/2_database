-- task a result 345
select count(*)
from songs
where extract(epoch from duration) >= extract(epoch from interval '10 minutes')
  and extract(epoch from duration) <= extract(epoch from interval '30 minutes');

-- task b todo fix
select extract(epoch from duration)
from songs
where isexplicit = 1;

-- task c
select songid
from songs
group by extract(year from releasedate) = 1953;

-- task d, 266 should be in a sub query to get max

select a.album, round(extract(minute from avg(duration)) * 60 + extract(seconds from avg(duration)), 0)
from albums a
         join albumartists aa on a.albumid = aa.albumid
         join artists ar on aa.artistid = ar.artistid
         join albumsongs als on als.albumid = a.albumid
         join songs s on s.songid = als.songid
where ar.artist like 'Elton John'
group by a.album;

-- task e 4578, remove group by clause to get total
select genre, count(*)
from songs
         join songgenres sg on songs.songid = sg.songid
         join genres g on g.genreid = sg.genreid
where g.genre like 'Alter%'
group by genre;

-- task f 11996
select count(*) as year
from songs
         join albumsongs als on songs.songid = als.songid
         join albums a on a.albumid = als.albumid
where extract(year from releasedate) < 2007
   or extract(year from albumreleasedate) > 2010;

-- task g todo
select als.album
from (select album
      from albums
               join albumsongs a on albums.albumid = a.albumid
               join songs s on s.songid = a.songid
      where isexplicit = 0
      group by album) as als
group by album
having count(s.songid) > 1


-- task h
/*
 The highest number of genres covered within an Album is 5. In the database, there
is only one Album that has this amount of genres. What is the name of this Album?
 */

select album, count(distinct a.genreid) from albums
join albumgenres a on albums.albumid = a.albumid
join genres g on a.genreid = g.genreid
join songgenres sg on sg.genreid = g.genreid
group by album


-- (select distinct genreid as id from genres order by id asc) as ids

