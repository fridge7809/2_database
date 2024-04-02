DROP TABLE IF EXISTS person CASCADE;
DROP TABLE IF EXISTS brand CASCADE;
DROP TABLE IF EXISTS representative CASCADE;
DROP TABLE IF EXISTS guide CASCADE;
DROP TABLE IF EXISTS hiker;
DROP TABLE IF EXISTS is_member_of;
DROP TABLE IF EXISTS certification;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS works_for;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS destination;
DROP TABLE IF EXISTS package;
DROP TABLE IF EXISTS contains;
DROP TABLE IF EXISTS prerequisites;
DROP TABLE IF EXISTS trip;
DROP TABLE IF EXISTS guides;
DROP TABLE IF EXISTS participates;
DROP TABLE IF EXISTS rates;

CREATE TABLE person
(
	id         serial PRIMARY KEY,
	first_name varchar NOT NULL,
	last_name  varchar NOT NULL,
	address    text,
	ssn        char(10) CHECK ( length(ssn) = 10 ), -- assuming danish ssn
	phone      text UNIQUE
);

CREATE TABLE brand
(
	id   serial PRIMARY KEY,
	name varchar NOT NULL
);

CREATE TABLE representative
(
	id         serial PRIMARY KEY,
	represents integer REFERENCES brand (id) NOT NULL,
	payment    integer                       NOT NULL
);


CREATE TABLE guide
(
	id             integer REFERENCES person (id) PRIMARY KEY,
	specialization varchar
);

CREATE TABLE hiker
(
	id                integer REFERENCES person (id) PRIMARY KEY,
	representative_id integer REFERENCES representative (id),
	highest_peak      integer DEFAULT NULL -- assuming it is an integer?
);

CREATE TABLE club
(
	id                serial PRIMARY KEY,
	representative_id integer REFERENCES representative (id),
	name              varchar NOT NULL,
	established       date
);

CREATE TABLE is_member_of
(
	hiker_id integer REFERENCES hiker (id),
	club_id  integer REFERENCES club (id),
	PRIMARY KEY (hiker_id, club_id)
);

CREATE TABLE certification
(
	guide_id   integer REFERENCES person (id),
	name       varchar                                                    NOT NULL,
	issue_date date,
	academy    varchar(128),
	grade      character CHECK ( grade IN ('A', 'B', 'C', 'D', 'E', 'F')) NOT NULL,
	PRIMARY KEY (guide_id, name)
);

CREATE TABLE company
(
	id   serial PRIMARY KEY,
	name varchar NOT NULL
);

CREATE TABLE works_for
(
	start_date date NOT NULL,
	person_id  integer REFERENCES person (id),
	company_id integer REFERENCES company (id),
	end_date   date,
	PRIMARY KEY (start_date, person_id, company_id)
);

CREATE TABLE product
(
	id         serial PRIMARY KEY,
	price      integer,
	company_id integer REFERENCES company (id)
);

-- HW2 Description of destination differs from what the solution diagram shows.
-- I have assumed the solution diagram to be correct.
CREATE TABLE destination
(
	id         integer REFERENCES product (id) PRIMARY KEY,
	name       varchar UNIQUE NOT NULL,
	trackname  varchar,
	distance   integer CHECK ( distance >= 0 ),
	difficulty varchar(128)   NOT NULL,                                -- assuming it isn't a numeric difficulty (wasn't specified)
	elevation  integer CHECK ( elevation > -421 AND elevation < 8849 ) -- lowest and highest known points
);

CREATE TABLE package
(
	id         integer REFERENCES product (id) PRIMARY KEY,
	difficulty varchar(128) NOT NULL, -- assuming it isn't a numeric difficulty (wasn't specified)
	name       varchar      NOT NULL
);

CREATE TABLE contains
(
	package_id     integer REFERENCES package (id),
	destination_id integer REFERENCES destination (id)
);

CREATE TABLE prerequisites
(
	prerequisite integer REFERENCES destination (id),
	destination  integer REFERENCES destination (id),
	PRIMARY KEY (prerequisite, destination)
);

CREATE TABLE trip
(
	id             serial PRIMARY KEY,
	start_date     date NOT NULL,
	destination_id integer REFERENCES destination (id)
);

CREATE TABLE guides
(
	guide_id integer REFERENCES guide (id),
	trip_id  integer REFERENCES trip (id),
	PRIMARY KEY (guide_id, trip_id)
);

CREATE TABLE participates
(
	hiker_id integer REFERENCES hiker (id),
	trip_id  integer REFERENCES trip (id),
	PRIMARY KEY (hiker_id, trip_id)
);

CREATE TABLE rates
(
	date     timestamp    NOT NULL,
	rating   varchar(128) NOT NULL, -- assuming rating isn't numeric
	guide_id integer,
	hiker_id integer,
	trip_id  integer,
	FOREIGN KEY (guide_id, trip_id) REFERENCES guides (guide_id, trip_id),
	FOREIGN KEY (hiker_id, trip_id) REFERENCES participates (hiker_id, trip_id),
	PRIMARY KEY (guide_id, hiker_id, trip_id)
);