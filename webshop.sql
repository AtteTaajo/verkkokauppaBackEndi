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
    image VARCHAR(50),
    kuvaus VARCHAR(255),
    ravintoarvot VARCHAR(255),
    aineosat VARCHAR(255),
    category_id int not null,
    index category_id(category_id),
    FOREIGN KEY (category_id) REFERENCES category(id)
    on delete RESTRICT
);


insert into category (name) values ("Red Bullit");
insert into category (name) values ("Batteryt");

insert into category (name) values ("Monsterit");
INSERT into product (name, price, image, kuvaus, ravintoarvot, aineosat, category_id) values ("Test Redbulli 1", 3.33,'teho_pullo.png', 'Tämä on tehopullo', 'Sisältää tehoa<br>toine rivi','ainesosia', 1);
INSERT into product (name, price, image, kuvaus, ravintoarvot, aineosat, category_id) values ("Test Battery 1", 2.45, 'battery.png', 'Tämä on battery','testi <br> testi', 'lisäää ainesosia',  2);

create table customer (
    id int primary key auto_increment,
    firstname VARCHAR(50) not null,
    lastname VARCHAR(50) not null,
    address VARCHAR(50) not null,
    zip VARCHAR(10) not null,
    city VARCHAR(30) not null
);

create table `order` (
    id int primary key auto_increment, 
    order_date timestamp default current_timestamp,
    customer_id int not null,
    index customer_id(customer_id),
    foreign key (customer_id) references customer(id)
    on delete restrict
);

create table order_row (
    order_id int not null,
    index order_id(order_id),
    foreign key (order_id) references `order`(id)
    on delete restrict,
    product_id int not null,
    index product_id(product_id),
    foreign key (product_id) references product(id)
    on delete restrict 
);