

--coffee
INSERT INTO Coffees (name, manufacturer) VALUES ('Ethiopian Yirgacheffe', 'Yirgacheffe Coffee Farmers Cooperative Union');
INSERT INTO Coffees (name, manufacturer) VALUES ('Colombian Supremo', 'Café de Colombia');
INSERT INTO Coffees (name, manufacturer) VALUES ('Brazilian Santos', 'Santos Coffee Exporters');
INSERT INTO Coffees (name, manufacturer) VALUES ('Sumatra Mandheling', 'Mandheling Coffee Producers Association');
INSERT INTO Coffees (name, manufacturer) VALUES ('Kenyan AA', 'Kenyan Coffee Farmers Federation');
INSERT INTO Coffees (name, manufacturer) VALUES ('Costa Rican Tarrazu', 'Tarrazu Coffee Cooperative');
INSERT INTO Coffees (name, manufacturer) VALUES ('Guatemalan Antigua', 'Antigua Coffee Growers Association');
INSERT INTO Coffees (name, manufacturer) VALUES ('Mexican Chiapas', 'Chiapas Coffee Collective');
INSERT INTO Coffees (name, manufacturer) VALUES ('Panama Boquete', 'Boquete Coffee Artisans');
INSERT INTO Coffees (name, manufacturer) VALUES ('Tanzanian Peaberry', 'Tanzania Peaberry Estates');

--coffeehouses
INSERT INTO CoffeeHouses (name, address, license) VALUES ('Coffee Haven', '123 Brew Street, Espresso City', 'CH123456');
INSERT INTO CoffeeHouses (name, address, license) VALUES ('Bean Bliss Café', '456 Arabica Lane, Mocha Town', 'CH789012');
INSERT INTO CoffeeHouses (name, address, license) VALUES ('Caffeine Corner', '789 Latte Avenue, Macchiato Village', 'CH345678');
INSERT INTO CoffeeHouses (name, address, license) VALUES ('Mugful Moments', '101 Java Square, Cappuccino Springs', 'CH901234');
INSERT INTO CoffeeHouses (name, address, license) VALUES ('Brewed Elegance', '234 Cup Street, Latte Junction', 'CH567890');
INSERT INTO CoffeeHouses (name, address, license) VALUES ('Morning Aroma', '789 Roast Lane, Americano Heights', 'CH654321');
INSERT INTO CoffeeHouses (name, address, license) VALUES ('Cuppa Crafts', '234 Filter Square, Macchiato Meadow', 'CH246810');
INSERT INTO CoffeeHouses (name, address, license) VALUES ('Bean Boulevard', '567 Espresso Road, Cappuccino City', 'CH135790');
INSERT INTO CoffeeHouses (name, address, license) VALUES ('Brewed Harmony', '890 Creamer Avenue, Latte Springs', 'CH987654');
INSERT INTO CoffeeHouses (name, address, license) VALUES ('Espresso Elegance', '321 Barista Street, Cortado Crossing', 'CH112233');

--drinker
insert into Drinker (name, age) values ('Alice', 12);
insert into Drinker (name, age) values ('Bob', 23);
insert into Drinker (name, age) values ('Carl', 70);
insert into Drinker (name, age) values ('Diana', 40);
insert into Drinker (name, age) values ('Eva', 0);
insert into Drinker (name, age) values ('Chichi', 10);
insert into Drinker (name, age) values ('Morten', 30);

--sells

INSERT INTO Sells (coffeehouse, coffee, price) VALUES ('Bean Bliss Café', 'Brazilian Santos', 250.50);
INSERT INTO Sells (coffeehouse, coffee, price) VALUES ('Caffeine Corner', 'Sumatra Mandheling', 280.75);
INSERT INTO Sells (coffeehouse, coffee, price) VALUES ('Mugful Moments', 'Kenyan AA', 320.00);
INSERT INTO Sells (coffeehouse, coffee, price) VALUES ('Morning Aroma', 'Guatemalan Antigua', 290.80);
INSERT INTO Sells (coffeehouse, coffee, price) VALUES ('Bean Boulevard', 'Panama Boquete', 340.50);
INSERT INTO Sells (coffeehouse, coffee, price) VALUES ('Brewed Harmony', 'Tanzanian Peaberry', 380.00);
INSERT INTO Sells (coffeehouse, coffee, price) VALUES ('Espresso Elegance', 'Ethiopian Yirgacheffe', 360.75);

--ratings
insert into Ratings (drinker_id, coffee, rating) values (1, 'Colombian Supremo', 4);
insert into Ratings (drinker_id, coffee, rating) values (2, 'Brazilian Santos', 5);
insert into Ratings (drinker_id, coffee, rating) values (3, 'Sumatra Mandheling', 2);
insert into Ratings (drinker_id, coffee, rating) values (4, 'Guatemalan Antigua', 4);
insert into Ratings (drinker_id, coffee, rating) values (5, 'Kenyan AA', 3);
insert into Ratings (drinker_id, coffee, rating) values (6, 'Tanzanian Peaberry', 5);
insert into Ratings (drinker_id, coffee, rating) values (7, 'Espresso Elegance', 4);
insert into Ratings (drinker_id, coffee, rating) values (1, 'Costa Rican Tarrazu', 4);
insert into Ratings (drinker_id, coffee, rating) values (2, 'Mexican Chiapas', 3);
insert into Ratings (drinker_id, coffee, rating) values (3, 'Colombian Supremo', 4);
insert into Ratings (drinker_id, coffee, rating) values (4, 'Tanzanian Peaberry', 5);
insert into Ratings (drinker_id, coffee, rating) values (5, 'Brazilian Santos', 2);
insert into Ratings (drinker_id, coffee, rating) values (6, 'Guatemalan Antigua', 4);
insert into Ratings (drinker_id, coffee, rating) values (7, 'Kenyan AA', 3);
