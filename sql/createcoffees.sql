DROP TABLE IF EXISTS Sells;
DROP TABLE IF EXISTS Ratings;
DROP TABLE IF EXISTS Coffeehouses;
DROP TABLE IF EXISTS Coffees;
DROP TABLE IF EXISTS Drinker;


CREATE TABLE Coffees (
	Name VARCHAR(255) PRIMARY KEY,
	Manufacturer VARCHAR(255)
);

CREATE TABLE Coffeehouses (
	Name VARCHAR(255) PRIMARY KEY,
	Address VARCHAR(255) NOT NULL,
	License VARCHAR(255) NOT NULL
);

CREATE TABLE Sells (
	Coffeehouse VARCHAR(255) REFERENCES Coffeehouses (Name),
	Coffee VARCHAR(255) REFERENCES Coffees (Name),
	Price NUMERIC(8,2) NOT NULL, --assuming a million is enough to represent the price of coffees
	PRIMARY KEY (Coffeehouse, Coffee)
);

CREATE TABLE Drinker (
	Drinker_id serial PRIMARY KEY,
	Name VARCHAR(40) NOT NULL check (name <> ''),
	Age int not null check (age > 0)
);
	
CREATE TABLE Ratings (
	Drinker_id integer REFERENCES Drinker(Drinker_id),
	Coffee VARCHAR(255) REFERENCES Coffees(Name),
	Rating int not null check (Rating >= 0 and Rating <= 5),
	PRIMARY KEY (Drinker_id, Coffee)
);