DROP TABLE IF EXISTS conducts;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS directors;
DROP TABLE IF EXISTS productions;
DROP TABLE IF EXISTS actors;


CREATE TABLE actors
(
	name        varchar(50) PRIMARY KEY,
	adress      varchar(50),
	base_salary integer
);

CREATE TABLE productions
(
	production varchar(50) PRIMARY KEY,
	stage      varchar(50),
	year       integer
);

CREATE TABLE roles
(
	role        varchar(50),
	actor       varchar(50) REFERENCES actors (name),
	production  varchar(50) REFERENCES productions (production),
	prod_salary integer,
	PRIMARY KEY (role, actor, production)
);

CREATE TABLE directors
(
	director    varchar(50) PRIMARY KEY,
	adress      varchar(50),
	base_salary integer
);

CREATE TABLE conducts
(
	director    varchar(50) REFERENCES directors (director),
	production  varchar(50) REFERENCES productions (production),
	prod_salary integer,
	PRIMARY KEY (director, production)
);

INSERT INTO productions
VALUES ('Macbeth', '1', 2015);
INSERT INTO productions
VALUES ('Hamlet', '2', 2015);
INSERT INTO productions
VALUES ('Mamma mia!', '1', 2016);
INSERT INTO productions
VALUES ('Whom the Bell Tolls', '2', 2004);
INSERT INTO productions
VALUES ('The Wizard of Oz', '1', 2003);
INSERT INTO productions
VALUES ('Hairspray', '1', 2000);

INSERT INTO actors
VALUES ('Joan', 'Chicago', 5000);
INSERT INTO actors
VALUES ('Jack', 'New York', 4000);
INSERT INTO actors
VALUES ('Pierce', 'LA', 3000);

INSERT INTO directors
VALUES ('Balti', 'LA', 6000);
INSERT INTO directors
VALUES ('Spielberg', 'LA', 3000);

INSERT INTO roles
VALUES ('Toto', 'Jack', 'The Wizard of Oz', 2000);
INSERT INTO roles
VALUES ('The Lion', 'Jack', 'The Wizard of Oz', 2000);
INSERT INTO roles
VALUES ('Dorothy', 'Joan', 'The Wizard of Oz', 20000);
INSERT INTO roles
VALUES ('The Witch', 'Joan', 'The Wizard of Oz', 30000);

INSERT INTO conducts
VALUES ('Balti', 'Hamlet', 8500);
INSERT INTO conducts
VALUES ('Spielberg', 'The Wizard of Oz', 5000);