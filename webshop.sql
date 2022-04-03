drop database if exists verkkokauppa;

create database verkkokauppa;

use verkkokauppa;

create table category (
    id int primary key AUTO_INCREMENT,
    name VARCHAR(255) not null unique
);

create table product (
    id int primary key AUTO_INCREMENT,
    name VARCHAR(255) not null, 
    price double(10,2) not null
);

insert into category (name) values ("Red Bull");
insert into category (name) values ("Battery");

/* Tää vaa viskataa sinne mysql :) */ 