DROP TABLE Store CASCADE CONSTRAINTS;
DROP TABLE Distributor CASCADE CONSTRAINTS;
DROP TABLE Inventory CASCADE CONSTRAINTS;
DROP TABLE Customer CASCADE CONSTRAINTS;
DROP TABLE Catalogue CASCADE CONSTRAINTS;
DROP TABLE Charges CASCADE CONSTRAINTS;
DROP TABLE Movie CASCADE CONSTRAINTS;
DROP TABLE Actor CASCADE CONSTRAINTS;
DROP TABLE Director CASCADE CONSTRAINTS;
DROP TABLE Rental CASCADE CONSTRAINTS;

-- Store definition
CREATE TABLE Store(
	store_id INTEGER GENERATED BY DEFAULT AS IDENTITY,
	name VARCHAR(30) NOT NULL,
	CONSTRAINT store_pkey PRIMARY KEY (store_id)
);


-- Distributor definition



CREATE TABLE Distributor(
	distributor_id INTEGER GENERATED BY DEFAULT AS IDENTITY,
	genres VARCHAR(30) NOT NULL,
	store_id INTEGER NOT NULL,
	name VARCHAR(30) NULL,
	CONSTRAINT distributor_pkey PRIMARY KEY (distributor_id),
	CONSTRAINT distributor_fk FOREIGN KEY (store_id) REFERENCES Store(store_id) ON DELETE CASCADE
);


-- Inventory



CREATE TABLE Inventory (
	inventory_id INTEGER GENERATED BY DEFAULT AS IDENTITY,
	inventory_year INTEGER NOT NULL,
	store_id INTEGER NOT NULL,
	stock INTEGER NOT NULL,
	CONSTRAINT inventory_pk PRIMARY KEY (inventory_id),
	CONSTRAINT inventory_fk FOREIGN KEY (store_id) REFERENCES Store(store_id) ON DELETE CASCADE
);
CREATE INDEX inventory_inventory_id_idx ON Inventory (inventory_id, store_id);


-- public."Customer" definition



CREATE TABLE Customer (
	customer_id INTEGER GENERATED BY DEFAULT AS IDENTITY,
	store_id INTEGER NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	address VARCHAR(50) NOT NULL,
	phone_number INTEGER NOT NULL,
	email VARCHAR(30) NOT NULL,
	CONSTRAINT customer_pk PRIMARY KEY (customer_id),
	CONSTRAINT customer_fk FOREIGN KEY (store_id) REFERENCES Store(store_id) ON DELETE CASCADE
);


-- public."Catalogue" definition



CREATE TABLE Catalogue (
	catalogue_id INTEGER GENERATED BY DEFAULT AS IDENTITY,
	distributor_id INTEGER NOT NULL,
	inventory_id INTEGER NOT NULL,
	CONSTRAINT catalogue_pk PRIMARY KEY (catalogue_id),
	CONSTRAINT catalogue_fk FOREIGN KEY (distributor_id) REFERENCES Distributor(distributor_id) ON DELETE CASCADE ,
	CONSTRAINT catalogue_fk2 FOREIGN KEY (inventory_id) REFERENCES Inventory(inventory_id) ON DELETE CASCADE 
);


-- public."Charges" definition



CREATE TABLE Charges (
	charges_id INTEGER GENERATED BY DEFAULT AS IDENTITY,
	late_fee float NULL,
	damage_fee float NULL,
	no_rewind_fee float NULL,
	taxes float NULL,
	standard_fee float NOT NULL,
	customer_id INTEGER NOT NULL,
	CONSTRAINT charges_pk PRIMARY KEY (charges_id),
	CONSTRAINT charges_fk FOREIGN KEY (customer_id) REFERENCES Customer (customer_id) ON DELETE CASCADE
);


-- public."Movie" definition



CREATE TABLE Movie(
	movie_id INTEGER GENERATED BY DEFAULT AS IDENTITY,
	distributor_id INTEGER NOT NULL,
	inventory_id INTEGER NOT NULL,
	actor_id INTEGER NULL,
	director_id INTEGER NULL,
	genre VARCHAR(30) NOT NULL,
	year_released INTEGER NOT NULL,
	rating INTEGER NOT NULL,
	awards INTEGER NOT NULL,
	price float NOT NULL,
	name VARCHAR(30) NOT NULL,
	serial VARCHAR(30) NOT NULL,
	discount float NULL,
	"type" VARCHAR(30) NOT NULL,
	CONSTRAINT movie_pk PRIMARY KEY (movie_id)
);
CREATE INDEX movie_movie_id_idx ON Movie (movie_id, distributor_id, inventory_id, name);


-- public."Actor" definition



CREATE TABLE Actor (
	actor_id INTEGER GENERATED BY DEFAULT AS IDENTITY,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	awards INTEGER NOT NULL,
	movie_id INTEGER NOT NULL,
	CONSTRAINT actor_pk PRIMARY KEY (actor_id)
);


-- public."Director" definition



CREATE TABLE Director (
	director_id INTEGER GENERATED BY DEFAULT AS IDENTITY,
	movie_id INTEGER NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	awards INTEGER NOT NULL,
	CONSTRAINT director_pk PRIMARY KEY (director_id)
);


-- public."Rental" definition



CREATE TABLE Rental (
	rental_id INTEGER GENERATED BY DEFAULT AS IDENTITY,
	customer_id INTEGER NOT NULL,
	movie_id INTEGER NOT NULL,
	due_date date NOT NULL,
	rental_date date NOT NULL,
	price float NOT NULL,
	CONSTRAINT rental_pk PRIMARY KEY (rental_id)
);

-- public."Movie" foreign keys

ALTER TABLE Movie ADD CONSTRAINT movie_fk FOREIGN KEY (actor_id) REFERENCES Actor(actor_id) ON DELETE CASCADE;
ALTER TABLE Movie ADD CONSTRAINT movie_fk1 FOREIGN KEY (director_id) REFERENCES Director(director_id) ON DELETE CASCADE;
ALTER TABLE Movie ADD CONSTRAINT movie_fk2 FOREIGN KEY (distributor_id) REFERENCES Distributor(distributor_id) ON DELETE CASCADE;
ALTER TABLE Movie ADD CONSTRAINT movie_fk3 FOREIGN KEY (inventory_id) REFERENCES Inventory(inventory_id) ON DELETE CASCADE;


-- public."Actor" foreign keys

ALTER TABLE Actor ADD CONSTRAINT actor_fk FOREIGN KEY (movie_id) REFERENCES Movie(movie_id) ON DELETE CASCADE;


-- public."Director" foreign keys

ALTER TABLE Director ADD CONSTRAINT director_fk FOREIGN KEY (movie_id) REFERENCES Movie(movie_id) ON DELETE CASCADE;


-- public."Rental" foreign keys

ALTER TABLE Rental ADD CONSTRAINT rental_fk FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE ;
ALTER TABLE Rental ADD CONSTRAINT rental_fk1 FOREIGN KEY (movie_id) REFERENCES Movie(movie_id) ON DELETE CASCADE ;


commit;