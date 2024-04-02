-- TASK A

--  1. Rentals: pid --> pn | MAY HOLD
--  2. Rentals: hid --> hs | MAY HOLD
--  3. Rentals: hid --> hz | MAY HOLD
--  4. Rentals: hid --> hc | MAY HOLD (redundant as it is derived transitively by 3 and 5)
--  5. Rentals: hz --> hc | MAY HOLD

-- TASK B

/*
old schema
                     Table "public.rentals"
 Column |         Type          | Collation | Nullable | Default
--------+-----------------------+-----------+----------+---------
 pid    | integer               |           | not null |
 hid    | integer               |           | not null |
 pn     | character varying(50) |           | not null |
 s      | integer               |           | not null |
 hs     | character varying(50) |           | not null |
 hz     | integer               |           | not null |
 hc     | character varying(50) |           | not null |

I renamed attributes because it was bothering me they were cryptic :)

person(id, name)
zipcode(zipcode, city)
house(id, street, zipcode)
rentals_new(person_id, house_id, year)

*/

-- TASK C

DROP TABLE IF EXISTS person CASCADE;
DROP TABLE IF EXISTS zipcode CASCADE;
DROP TABLE IF EXISTS house CASCADE;
DROP TABLE IF EXISTS rentals_new CASCADE;

CREATE TABLE person
(
	id   integer PRIMARY KEY, -- formerly pid
	name varchar(50) NOT NULL -- formerly pn
);

INSERT INTO person
SELECT DISTINCT pid, pn
FROM rentals;

CREATE TABLE zipcode
(
	zipcode integer PRIMARY KEY, -- formerly hz
	city    varchar(50)          -- formerly hc
);

INSERT INTO zipcode
SELECT DISTINCT hz, hc
FROM rentals;

CREATE TABLE house
(
	id      integer PRIMARY KEY,  -- formerly hid
	street  varchar(50) NOT NULL, -- formerly hs
	zipcode integer REFERENCES zipcode (zipcode)
);

INSERT INTO house
SELECT DISTINCT hid, hs, hz
FROM rentals;

CREATE TABLE rentals_new
(
	person_id integer REFERENCES person (id),
	house_id  integer REFERENCES house (id),
	year      integer NOT NULL, --s
	PRIMARY KEY (person_id, house_id)
);

INSERT INTO rentals_new
SELECT DISTINCT pid, hid, s
FROM rentals;


-- check they are equal
SELECT count(*) AS new_count
FROM rentals_new r
		 JOIN person p ON r.person_id = p.id
		 JOIN house h ON r.house_id = h.id
		 JOIN zipcode z ON z.zipcode = h.zipcode;

SELECT count(*) old_count
FROM rentals r;

-- TASK D

-- The schema is in 3NF.