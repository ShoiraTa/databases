CREATE TABLE animals(
  id bigserial PRIMARY KEY,
  name VARCHAR(50),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg decimal
);


create table owners (
id   bigserial PRIMARY KEY,
full_name varchar(20),
age int
);

create table species (
id   bigserial PRIMARY KEY,
name varchar(20)
);

INSERT INTO owners
(full_name, age)
VALUES('Sam Smith', '34' );
INSERT INTO owners
(full_name, age)
VALUES('Jennifer Orwell', '19' );
INSERT INTO owners
(full_name, age)
VALUES('Bob', '45' );
INSERT INTO owners
(full_name, age)
VALUES('Melody Pond', '77' );
INSERT INTO owners
(full_name, age)
VALUES('Dean Winchester', '14' );
INSERT INTO owners
(full_name, age)
VALUES('Jodie Whittaker', '38' );

INSERT INTO species
(name)
VALUES('Pokemon' );
INSERT INTO species
(name)
VALUES('Digimon' );

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Agumon', DATE '2020-02-03', '0', 'true', '10.23' );

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Gabumon', DATE '11-15-2018', '2', 'true', '8');

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Pikachu', DATE '01-07-2021', '1', 'false', '15.08');

INSERT INTO animals 
(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Devimon', DATE '05-12-2017', '5', 'true', '11');


INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Charmander', DATE '08-02-2020', '0', 'false', '11');

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Plantmon', DATE '11-15-2022', '2', 'true', '5.7');

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Squirtle', DATE '02-04-1993', '3', 'false', '12.3');

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Angemon', DATE '12-06-2005', '1', 'true', '45');

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Boarmon', DATE '07-06-2005', '7', 'true', '20.4');

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Blossom', DATE '10-13-1998', '3', 'true', '17');


ALTER TABLE animals
ADD species VARCHAR(20);

ALTER TABLE animals
drop COLUMN species;

ALTER TABLE animals
ADD species_id BIGINT REFERENCES species(id);

ALTER TABLE animals
ADD owner_id BIGINT REFERENCES owners(id);