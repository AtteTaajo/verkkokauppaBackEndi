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
    price double(10,2) not null,
    image VARCHAR(255),
    category_id int not null,
    index category_id(category_id),
    FOREIGN KEY (category_id) REFERENCES category(id)
    on delete RESTRICT
);


insert into category (name) values ("Red Bullit");
insert into category (name) values ("Batteryt");

insert into category (name) values ("Monsterit");
INSERT into product (name, price, image, category_id) values ("Test Redbulli 1", 3.33,'https://public.keskofiles.com/f/k-ruoka/product/9002490100773?w=480&h=480&fit=max&auto=format&fm=jpg&cs=srgb', 1);
INSERT into product (name, price, image, category_id) values ("Test Battery 1", 2.45, 'https://alkostore24.com/media/catalog/product/cache/d93fad4313d058678385fbb1227fb376/7/0/7020447_1.jpg', 2);

/* Tää vaa viskataa sinne mysql :) */ 