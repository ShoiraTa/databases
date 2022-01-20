CREATE DATABASE vet_clinic
CREATE TABLE animals(
  id bigserial PRIMARY KEY,
  name VARCHAR(50),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg decimal
);

ALTER TABLE vet_clinic
ADD species VARCHAR(20);