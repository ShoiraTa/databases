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