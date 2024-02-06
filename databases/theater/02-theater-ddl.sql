drop table if exists Conducts;
drop table if exists Roles;
drop table if exists Directors;
drop table if exists Productions;
drop table if exists Actors;


create table Actors (
	name varchar(50) primary key,
	adress varchar(50),
	base_salary integer
);

create table Productions (
	production varchar(50) primary key,
	stage varchar(50),
	year integer 
);

create table Roles (
	role varchar(50),
	actor varchar(50) references Actors(name),
	production varchar(50) references Productions(production),
	prod_salary integer,
	primary key (role, actor, production)
);

create table Directors (
	director varchar(50) primary key,
	adress varchar(50),
	base_salary integer
);

create table Conducts (
	director varchar(50) references Directors(director),
	production varchar(50) references Productions(production),
	prod_salary integer,
	primary key (director, production)
);

insert into Productions values ('Macbeth', '1', 2015);
insert into Productions values ('Hamlet', '2', 2015);
insert into Productions values ('Mamma mia!', '1', 2016);
insert into Productions values ('Whom the Bell Tolls', '2', 2004);
insert into Productions values ('The Wizard of Oz', '1', 2003);
insert into Productions values ('Hairspray', '1', 2000);

insert into Actors values ('Joan', 'Chicago', 5000);
insert into Actors values ('Jack', 'New York', 4000);
insert into Actors values ('Pierce', 'LA', 3000);

insert into Directors values ('Balti', 'LA', 6000);
insert into Directors values('Spielberg', 'LA', 3000);

insert into Roles values('Toto', 'Jack', 'The Wizard of Oz', 2000);
insert into Roles values('The Lion', 'Jack', 'The Wizard of Oz', 2000);
insert into Roles values('Dorothy', 'Joan', 'The Wizard of Oz', 20000);
insert into Roles values('The Witch', 'Joan', 'The Wizard of Oz', 30000);

insert into Conducts values ('Balti', 'Hamlet', 8500);
insert into Conducts values ('Spielberg', 'The Wizard of Oz', 5000);