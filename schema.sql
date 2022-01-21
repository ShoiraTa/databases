CREATE DATABASE vet_clinic
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

ALTER TABLE animals
ADD species VARCHAR(20);

ALTER TABLE animals
drop COLUMN species;

ALTER TABLE animals
ADD species_id BIGINT REFERENCES species(id);

ALTER TABLE animals
ADD owner_id BIGINT REFERENCES owners(id);

-- Create a table named vets
create table vets (
id bigserial PRIMARY KEY,
name varchar(10),
age integer,
date_of_graduation date);

create table specializations (
	species_id integer,
	vets_id integer,
	constraint fk_species foreign key(species_id) references species(id),
	constraint fk_vets foreign key(vets_id) references vets(id),
	primary key(species_id, vets_id)
);

create table visits (
	animals_id integer,
	vets_id integer,
	date_of_visits date,
	constraint fk_animals foreign key(animals_id) references animals(id),
	constraint fk_vets foreign key(vets_id) references vets(id),
	primary key(animals_id, vets_id, date_of_visits)
);