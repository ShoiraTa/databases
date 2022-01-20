-- Animals
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
VALUES ('Charmander', DATE '08-02-2020', '0', 'false', '-11.0');

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Plantmon', DATE '11-15-2022', '2', 'true', '-5.7');

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Squirtle', DATE '02-04-1993', '3', 'false', '-12.13');

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Angemon', DATE '12-06-2005', '1', 'true', '-45.0');

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Boarmon', DATE '07-06-2005', '7', 'true', '20.4');

INSERT INTO animals
(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Blossom', DATE '10-13-1998', '3', 'true', '17');

-- Owners
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

-- Species
INSERT INTO species
(name)
VALUES('Pokemon' );

INSERT INTO species
(name)
VALUES('Digimon' );

-- update animals 
UPDATE animals set species_id = (select id from species where name = 'Digimon') where name like '%mon';

UPDATE animals set species_id = (select id from species where name = 'Pokemon' ) where species_id is null; 

-- Modify inserted animals to include owner information (owner_id)


-- Sam Smith owns Agumon.
UPDATE animals set owner_id = (select id from owners where full_name = 'Sam Smith' ) where name = 'Agumon';

-- Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals set owner_id = (select id from owners where full_name = 'Jennifer Orwell' ) where name in ('Pikachu', 'Gabumon');

-- Bob owns Devimon and Plantmon.
UPDATE animals set owner_id = (select id from owners where full_name = 'Bob' ) where name in('Plantmon', 'Devimon') ;

-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals set owner_id = (select id from owners where full_name = 'Melody Pond') where name in ('Charmander', 'Squirtle', 'Blossom');

-- Dean Winchester owns Angemon and Boarmon.
UPDATE animals set owner_id = (select id from owners where full_name = 'Dean Winchester') where name in ('Angemon', 'Boarmon');
