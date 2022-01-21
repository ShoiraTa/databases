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


insert into vets (name, age, date_of_graduation) values 
('William Tatcher', 45, '2000-4-23'),
('Maisy Smith', 26, '2013-1-17'),
('Stephanie Mendez', 64, '1981-5-4'),
('Jack Harkness', 38, '2008-6-8');

insert into specializations (species_id, vets_id) values 
((select id from species where name = 'Pokemon'), (select id from vets where name = 'William Tatcher')),
((select id from species where name = 'Digimon'), (select id from vets where name = 'Stephanie Mendez')),
((select id from species where name = 'Pokemon'), (select id from vets where name = 'Stephanie Mendez')),
((select id from species where name = 'Digimon'), (select id from vets where name = 'Jack Harkness'));

-- Agumon visited William Tatcher on May 24th, 2020.

insert into visits (animals_id, vets_id, date_of_visits) 
values ((select id from animals where name = 'Agumon'), 
(select id from vets where name = 'William Tatcher'), '2020-5-24'),

-- Agumon visited Stephanie Mendez on Jul 22th, 2020. 
values ((select id from animals where name = 'Agumon'), 
(select id from vets where name = 'Stephanie Mendez'), '2020-5-24'),

-- Gabumon visited Jack Harkness on Feb 2nd, 2021.
((select id from animals where name = 'Gabumon'), (select id from vets where name = 'Jack Harkness'), '2021-2-2'),

-- Pikachu visited Maisy Smith on Jan 5th, 2020.
((select id from animals where name = 'Pikachu'), (select id from vets where name = 'Maisy Smith'), '2020-1-5'),

-- Pikachu visited Maisy Smith on Mar 8th, 2020.
((select id from animals where name = 'Pikachu'), (select id from vets where name = 'Maisy Smith'), '2020-3-8'),

-- Pikachu visited Maisy Smith on May 14th, 2020.
((select id from animals where name = 'Pikachu'), (select id from vets where name = 'Maisy Smith'), '2020-3-14'),

-- Devimon visited Stephanie Mendez on May 4th, 2021.
((select id from animals where name = 'Devimon'), (select id from vets where name = 'Stephanie Mendez'), '2021-3-4'),

-- Charmander visited Jack Harkness on Feb 24th, 2021.
((select id from animals where name = 'Charmander'), (select id from vets where name = 'Jack Harkness'), '2021-2-24'),

-- Plantmon visited Maisy Smith on Dec 21st, 2019.
((select id from animals where name = 'Plantmon'), (select id from vets where name = 'Maisy Smith'), '2019-12-21'),

-- Plantmon visited William Tatcher on Aug 10th, 2020.
((select id from animals where name = 'Plantmon'), (select id from vets where name = 'William Tatcher'), '2020-8-10'),

-- Plantmon visited Maisy Smith on Apr 7th, 2021.
((select id from animals where name = 'Plantmon'), (select id from vets where name = 'Maisy Smith'), '2021-4-7'),

-- Squirtle visited Stephanie Mendez on Sep 29th, 2019.
((select id from animals where name = 'Squirtle'), (select id from vets where name = 'Stephanie Mendez'), '2019-9-29'),


-- Angemon visited Jack Harkness on Oct 3rd, 2020.
((select id from animals where name = 'Angemon'), (select id from vets where name = 'Jack Harkness'), '2020-10-3'),

-- Angemon visited Jack Harkness on Nov 4th, 2020.
((select id from animals where name = 'Angemon'), (select id from vets where name = 'Jack Harkness'), '2020-11-4'),


-- Boarmon visited Maisy Smith on Jan 24th, 2019.
((select id from animals where name = 'Boarmon'), (select id from vets where name = 'Maisy Smith'), '2019-1-24'),

-- Boarmon visited Maisy Smith on May 15th, 2019.
((select id from animals where name = 'Boarmon'), (select id from vets where name = 'Maisy Smith'), '2019-5-15'),

-- Boarmon visited Maisy Smith on Feb 27th, 2020.
((select id from animals where name = 'Boarmon'), (select id from vets where name = 'Maisy Smith'), '2020-2-27'),

-- Boarmon visited Maisy Smith on Aug 3rd, 2020.
((select id from animals where name = 'Boarmon'), (select id from vets where name = 'Maisy Smith'), '2020-8-3'),

-- Blossom visited Stephanie Mendez on May 24th, 2020.
((select id from animals where name = 'Blossom'), (select id from vets where name = 'Stephanie Mendez'), '2020-8-24'),

-- Blossom visited William Tatcher on Jan 11th, 2021.
((select id from animals where name = 'Blossom'), (select id from vets where name = 'William Tatcher'), '2021-1-11');









