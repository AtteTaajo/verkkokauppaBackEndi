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


INSERT into product (name, price, image, kuvaus, ravintoarvot, aineosat, category_id) values ("Red Bull", 2.95,'https://i.imgur.com/xo3X864.jpeg', 'Original', '','', 1);

INSERT into product (name, price, image, kuvaus, ravintoarvot, aineosat, category_id) values ("Red Bull Pitaija", 2.95, 'https://i.imgur.com/sGhyZAd.png', 'Green nature', '', '',  1);

INSERT into product (name, price, image, kuvaus, ravintoarvot, aineosat, category_id) values ("Red Bull Tropical", 2.95,'https://i.imgur.com/SxD0QBa.jpeg', 'Tropical sunshine', '','', 1);

INSERT into product (name, price, image, kuvaus, ravintoarvot, aineosat, category_id) values ("Red Bull Appelsiini", 2.95,'https://i.imgur.com/jBD3VCR.png', 'Fruity', '','', 1);

INSERT into product (name, price, image, kuvaus, ravintoarvot, aineosat, category_id) values ("Red Bull Vesimeloni", 2.95,'https://i.imgur.com/pWbRSWM.jpeg', 'Watermelony melody', '','', 1);




INSERT into product (name, price, image, kuvaus, ravintoarvot, aineosat, category_id) values ("Battery",  3.00, 'battery.png', 'Original','', '',  2);

INSERT into product (name, price, image, kuvaus, ravintoarvot, aineosat, category_id) values ("Battery Juiced",  3.00, 'https://i.imgur.com/vwrR5Yk.jpeg', 'Juicy','', '',  2);

INSERT into product (name, price, image, kuvaus, ravintoarvot, aineosat, category_id) values ("Battery Licorice",  3.00, 'https://i.imgur.com/ESirhC5.jpeg', 'Licorice luikautus','', '',  2);

INSERT into product (name, price, image, kuvaus, ravintoarvot, aineosat, category_id) values ("Battery Remix",  3.00, 'https://i.imgur.com/LkdtSnc.jpeg', 'Remixed and mastered','', '',  2);

INSERT into product (name, price, image, kuvaus, ravintoarvot, aineosat, category_id) values ("Battery Jungled",  3.00, 'https://i.imgur.com/FaYKq0Q.jpeg', 'King of the jungle','', '',  2);





INSERT into product (name, price, image, kuvaus, ravintoarvot, aineosat, category_id) values ("Monster",  2.95, 'https://i.imgur.com/4hEWwzm.jpg', 'Original','', '',  3);
INSERT into product (name, price, image, kuvaus, ravintoarvot, aineosat, category_id) values ("Monster Punch",  2.95, 'https://i.imgur.com/tpm2Txx.jpg', 'Punch your way out','', '',  3);

INSERT into product (name, price, image, kuvaus, ravintoarvot, aineosat, category_id) values ("Monster Juice",  2.95, 'https://i.imgur.com/NcQy0I2.jpg', 'Once again the juice versio','', '',  3);

INSERT into product (name, price, image, kuvaus, ravintoarvot, aineosat, category_id) values ("https://i.imgur.com/GwJtTQH.png",  2.95, '', 'I dont even know','', '',  3);

INSERT into product (name, price, image, kuvaus, ravintoarvot, aineosat, category_id) values ("Monster Ultra",  2.95, 'https://i.imgur.com/l33nTua.jpeg', 'The one and only','', '',  3);

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