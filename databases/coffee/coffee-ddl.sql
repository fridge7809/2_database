DROP TABLE IF EXISTS sells;
DROP TABLE IF EXISTS ratings;
DROP TABLE IF EXISTS coffeehouses;
DROP TABLE IF EXISTS coffees;
DROP TABLE IF EXISTS drinker;


CREATE TABLE coffees
(
	name         varchar(255) PRIMARY KEY,
	manufacturer varchar(255)
);

CREATE TABLE coffeehouses
(
	name    varchar(255) PRIMARY KEY,
	address varchar(255) NOT NULL,
	license varchar(255) NOT NULL
);

CREATE TABLE sells
(
	coffeehouse varchar(255) REFERENCES coffeehouses (name),
	coffee      varchar(255) REFERENCES coffees (name),
	price       numeric(8, 2) NOT NULL, --assuming a million is enough to represent the price of coffees
	PRIMARY KEY (coffeehouse, coffee)
);

CREATE TABLE drinker
(
	drinker_id serial PRIMARY KEY,
	name       varchar(40) NOT NULL CHECK (name <> ''),
	age        int         NOT NULL CHECK (age > 0)
);

CREATE TABLE ratings
(
	drinker_id integer REFERENCES drinker (drinker_id),
	coffee     varchar(255) REFERENCES coffees (name),
	rating     int NOT NULL CHECK (rating >= 0 AND rating <= 5),
	PRIMARY KEY (drinker_id, coffee)
);

--coffee
INSERT INTO coffees (name, manufacturer)
VALUES ('Ethiopian Yirgacheffe', 'Yirgacheffe Coffee Farmers Cooperative Union');
INSERT INTO coffees (name, manufacturer)
VALUES ('Colombian Supremo', 'Café de Colombia');
INSERT INTO coffees (name, manufacturer)
VALUES ('Brazilian Santos', 'Santos Coffee Exporters');
INSERT INTO coffees (name, manufacturer)
VALUES ('Sumatra Mandheling', 'Mandheling Coffee Producers Association');
INSERT INTO coffees (name, manufacturer)
VALUES ('Kenyan AA', 'Kenyan Coffee Farmers Federation');
INSERT INTO coffees (name, manufacturer)
VALUES ('Costa Rican Tarrazu', 'Tarrazu Coffee Cooperative');
INSERT INTO coffees (name, manufacturer)
VALUES ('Guatemalan Antigua', 'Antigua Coffee Growers Association');
INSERT INTO coffees (name, manufacturer)
VALUES ('Mexican Chiapas', 'Chiapas Coffee Collective');
INSERT INTO coffees (name, manufacturer)
VALUES ('Panama Boquete', 'Boquete Coffee Artisans');
INSERT INTO coffees (name, manufacturer)
VALUES ('Tanzanian Peaberry', 'Tanzania Peaberry Estates');

--coffeehouses
INSERT INTO coffeehouses (name, address, license)
VALUES ('Coffee Haven', '123 Brew Street, Espresso City', 'CH123456');
INSERT INTO coffeehouses (name, address, license)
VALUES ('Bean Bliss Café', '456 Arabica Lane, Mocha Town', 'CH789012');
INSERT INTO coffeehouses (name, address, license)
VALUES ('Caffeine Corner', '789 Latte Avenue, Macchiato Village', 'CH345678');
INSERT INTO coffeehouses (name, address, license)
VALUES ('Mugful Moments', '101 Java Square, Cappuccino Springs', 'CH901234');
INSERT INTO coffeehouses (name, address, license)
VALUES ('Brewed Elegance', '234 Cup Street, Latte Junction', 'CH567890');
INSERT INTO coffeehouses (name, address, license)
VALUES ('Morning Aroma', '789 Roast Lane, Americano Heights', 'CH654321');
INSERT INTO coffeehouses (name, address, license)
VALUES ('Cuppa Crafts', '234 Filter Square, Macchiato Meadow', 'CH246810');
INSERT INTO coffeehouses (name, address, license)
VALUES ('Bean Boulevard', '567 Espresso Road, Cappuccino City', 'CH135790');
INSERT INTO coffeehouses (name, address, license)
VALUES ('Brewed Harmony', '890 Creamer Avenue, Latte Springs', 'CH987654');
INSERT INTO coffeehouses (name, address, license)
VALUES ('Espresso Elegance', '321 Barista Street, Cortado Crossing', 'CH112233');

--drinker
INSERT INTO drinker (name, age)
VALUES ('Alice', 12);
INSERT INTO drinker (name, age)
VALUES ('Bob', 23);
INSERT INTO drinker (name, age)
VALUES ('Carl', 70);
INSERT INTO drinker (name, age)
VALUES ('Diana', 40);
INSERT INTO drinker (name, age)
VALUES ('Eva', 0);
INSERT INTO drinker (name, age)
VALUES ('Chichi', 10);
INSERT INTO drinker (name, age)
VALUES ('Morten', 30);

--sells

INSERT INTO sells (coffeehouse, coffee, price)
VALUES ('Bean Bliss Café', 'Brazilian Santos', 250.50);
INSERT INTO sells (coffeehouse, coffee, price)
VALUES ('Caffeine Corner', 'Sumatra Mandheling', 280.75);
INSERT INTO sells (coffeehouse, coffee, price)
VALUES ('Mugful Moments', 'Kenyan AA', 320.00);
INSERT INTO sells (coffeehouse, coffee, price)
VALUES ('Morning Aroma', 'Guatemalan Antigua', 290.80);
INSERT INTO sells (coffeehouse, coffee, price)
VALUES ('Bean Boulevard', 'Panama Boquete', 340.50);
INSERT INTO sells (coffeehouse, coffee, price)
VALUES ('Brewed Harmony', 'Tanzanian Peaberry', 380.00);
INSERT INTO sells (coffeehouse, coffee, price)
VALUES ('Espresso Elegance', 'Ethiopian Yirgacheffe', 360.75);

--ratings
INSERT INTO ratings (drinker_id, coffee, rating)
VALUES (1, 'Colombian Supremo', 4);
INSERT INTO ratings (drinker_id, coffee, rating)
VALUES (2, 'Brazilian Santos', 5);
INSERT INTO ratings (drinker_id, coffee, rating)
VALUES (3, 'Sumatra Mandheling', 2);
INSERT INTO ratings (drinker_id, coffee, rating)
VALUES (4, 'Guatemalan Antigua', 4);
INSERT INTO ratings (drinker_id, coffee, rating)
VALUES (5, 'Kenyan AA', 3);
INSERT INTO ratings (drinker_id, coffee, rating)
VALUES (6, 'Tanzanian Peaberry', 5);
INSERT INTO ratings (drinker_id, coffee, rating)
VALUES (7, 'Espresso Elegance', 4);
INSERT INTO ratings (drinker_id, coffee, rating)
VALUES (1, 'Costa Rican Tarrazu', 4);
INSERT INTO ratings (drinker_id, coffee, rating)
VALUES (2, 'Mexican Chiapas', 3);
INSERT INTO ratings (drinker_id, coffee, rating)
VALUES (3, 'Colombian Supremo', 4);
INSERT INTO ratings (drinker_id, coffee, rating)
VALUES (4, 'Tanzanian Peaberry', 5);
INSERT INTO ratings (drinker_id, coffee, rating)
VALUES (5, 'Brazilian Santos', 2);
INSERT INTO ratings (drinker_id, coffee, rating)
VALUES (6, 'Guatemalan Antigua', 4);
INSERT INTO ratings (drinker_id, coffee, rating)
VALUES (7, 'Kenyan AA', 3);
