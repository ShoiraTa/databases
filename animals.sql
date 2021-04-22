CREATE table cats (
    cat_id int not null auto_increment,
    name varchar(10),
    age int,
    primary key(cat_id)
);

insert into cats(name, age) 
values("monya",6), ("nina", 2);