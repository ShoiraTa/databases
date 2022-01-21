SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '01-01-2016' AND '01-12-2019';
SELECT name FROM animals WHERE neutered='true' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pickachu';
SELECT name,escape_attempts FROM animals WHERE weight_Kg > 10.5;
SELECT * FROM animals WHERE neutered='true';
SELECT * FROM animals WHERE NOT name='Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals; 
ROLLBACK;
SELECT * FROM animals; 

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species is NULL;
select * from animals;
COMMIT;
select * from animals;

BEGIN;
DELETE FROM animals;
select * from animals;
ROLLBACK;
select * from animals;


BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-1-1';
SAVEPOINT delete_one;
UPDATE animals SET weight_kg = -1 * weight_kg;
ROLLBACK TO delete_one;
UPDATE animals SET weight_kg = -1 * weight_kg WHERE weight_kg < 0;
select * from animals;
COMMIT;
select * from animals;


SELECT COUNT(*) FROM animals;
-- 9
SELECT COUNT(*) FROM animals WHERE neutered = false;
-- 3
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
-- 2
SELECT AVG(weight_kg) FROM animals;
-- 16.6488888888888889
SELECT neutered,SUM(escape_attempts) AS TOTAL_ESCAPE FROM animals GROUP BY neutered;;


SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth >= '01-01-1990' AND date_of_birth < '12-31-2000' GROUP BY species;

-- What animals belong to Melody Pond?
select A.name, O.full_name as owner from animals A join owners O on  A.owner_id = O.id where O.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
select A.name, S.name  as species from animals A join species S  on A.species_id = S.id where S.name = 'Pokemon' ;

-- List all owners and their animals, remember to include those that don't own any animal.
select O.full_name as owner_name, A.name as animal_name from owners O left join animals A on O.id= A.owner_id;

-- How many animals are there per species?
select count(*), S.name from animals A join species S on A.species_id = S.id group by S.name;

-- List all Digimon owned by Jennifer Orwell.
select A.name as animal_name, S.name as species_name, O.full_name as owner_name
from animals A join species S on A.species_id = S.id join owners O on A.owner_id = O.id
where S.name = 'Digimon' and O.full_name = 'Jennifer Orwell';

-- List all animals owned by Dean Winchester that haven't tried to escape.
select A.name as animal_name, A.escape_attempts, O.full_name as owner_name
from animals A join owners O on A.owner_id = O.id
where A.escape_attempts = 0 and O.full_name = 'Dean Winchester';

-- Find Who owns the most animals?
select count(*) as number_of_animals, O.full_name
from animals A join owners O on A.owner_id = O.id
group by O.full_name
order by count(*) desc
LIMIT 1;

select count(distinct A.id) as number_of_animals
from animals A join visits V on A.id = V.animals_id
where V.vets_id = (select id from vets where name = 'Stephanie Mendez');

select V.id, V.name, V.age, V.date_of_graduation, s.name as specialization
from vets V left join specializations SP on V.id = SP.vets_id 
left join species S on SP.species_id = S.id;

select A.id, A.name, A.date_of_birth, A.escape_attempts, A.neutered, A.weight_kg 
from animals A join visits V on A.id = V.animals_id
where V.vets_id = (select id from vets where name = 'Stephanie Mendez') 
and V.date_of_visits between '2020-4-1' and '2020-8-30';

select A.id, A.name, A.date_of_birth, A.escape_attempts, A.neutered, A.weight_kg, count(*) as visits_number
from animals A join visits V on A.id = V.animals_id
group by A.id
order by count(*) desc
limit 1;

select A.id, A.name, A.date_of_birth, A.escape_attempts, A.neutered, A.weight_kg 
from animals A join visits V on A.id = V.animals_id
where V.vets_id = (select id from vets where name = 'Maisy Smith')
order by date_of_visits
limit 1;

select A.name, A.date_of_birth, A.escape_attempts, A.neutered, A.weight_kg, 
V.name, V.age, V.date_of_graduation, VI.date_of_visits 
from animals A join visits VI on A.id = VI.animals_id 
join vets V on VI.vets_id = V.id
order by VI.date_of_visits desc
limit 1;