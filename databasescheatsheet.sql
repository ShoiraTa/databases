
-- sudo mysql -u root -p
-- service mysql status
-- sudo /etc/init.d/mysql restart
-- sudo /etc/init.d/mysql start
-- sudo /etc/init.d/mysql stop
-- source databases.sql


-- troubleshooting
show warnings

POSTGRESQL

> check commands service postgresql 
    > service postgresql status
> use postgres sudo su postgres
   >commandline  psql

create user and make superhost
> CREATE USER shoira WITH PASSWORD 'password'
> ALTER USER shoira SUPERUSER

create database and connect to it
> postgres# : CREATE DATABASE TEST
        > psql -h localhost -p 5432 -U shoira test;
        > postgres=# \c test

-- Create show delete postgres
create database animals > create DB;
\l                      > list all databases
\d                      > describe
\d animals              > describe DB animals 
-- create from a file

\i animals.sql



-- Create show delete mySQL
create database animals;
show databases ;
drop database animals-1;
use  animals;
select database();





-- CRUD
CREATE     => insert into cats (name, age) values("monya", 5), ("nina", 10)
READ       => select name from cats/ select name, age from cats
    where         =>select * from cats where age=4
    alias         => select cat_id AS id from cats / select concat (surname, " ", name) AS "full name" from books 
UPDATE     => update cats set name ="new name" where id=1;
DELETE     => Delete from cats where  cat_id = 1        


-- Create table
create table  cats(
    cat_id int not null auto_increment,
    name varchar(100) not null default "unknown",
    age int not null default 3,
    primary key (cat_id)
);
show tables;
show columns from cats; == DESC cats;
drop table cats


-- READ
SELECT * FROM cats
SELECT * FROM cats ORDER BY first_name
SELECT name, population FROM world  WHERE name IN ('Sweden', 'Norway', 'Denmark');
SELECT name, area FROM world  WHERE area BETWEEN 200000 AND 250000  
SELECT name FROM world  WHERE name LIKE 'Y%'

-- String methods
SELECT CONCAT (name, " " , age) from cats
SELECT author_fname as last, author_lname as first, concat (author_fname, " ", author_lname) as full from books;
select substring("hello world", 4) ==> "hell"
select substring("hello world", 4, -1) ==> "o world"
select concat( substring(author_lname, 1,2), " ",author_fname ) as full_name from books;
select replace("hello world", "hello", "hi") = > 'hi world'
select reverse (title) from books 
select author_fname, CHAR_LENGTH(author_fname) from books
select upper(title)
select lower (title)


