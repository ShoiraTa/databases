=begin
    
Web Programming, [20.04.21 15:35]
MySQL 

sudo mysql -u root -p

service mysql status
sudo /etc/init.d/mysql restart
sudo /etc/init.d/mysql start
sudo /etc/init.d/mysql stop


create database animals;
show databases ;
drop database animals-1;

use  animals;
select database();

create table  cats(
cat_id int not null auto_increment,
name varchar(100) not null default "unknown",
age int not null default 3,
primary key (cat_id)
);

show tables;
show columns from cats; == DESC cats;
drop table cats

insert into cats (name, age) values("monya", 5), ("nina", 10)

select * from cats

show warnings
=end

=begin
CRUD

CREATE     => insert into cats (name, age) values("monya", 5), ("nina", 10)
READ       => select name from cats/ select name, age from cats
where         =>select * from cats where age=4
UPPDATE    => update cats set name ="new name" where id=1;
DELETE     => Delete from cats where  cat_id = 1        

Alias      => select cat_id AS id from cats


=end