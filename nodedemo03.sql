create database nodedemo; 

use nodedemo; 

create table person (
	id int(11) unsigned NOT NULL AUTO_INCREMENT,
        firstName varchar(128),
        lastName varchar(128),
        primary key (id)
);

insert into `person` VALUES ( 1,'Juan','Valdez\n'),
(2,'Joe','Smith\n');

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'password!' WITH GRANT OPTION;
