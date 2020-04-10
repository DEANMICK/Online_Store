create database online_store;
use online_store;

------------------------------------------------
--------------Category Schema-------------------
------------------------------------------------

create table category(
	id int PRIMARY KEY AUTO_INCREMENT,
	title char(20) NOT NULL
);

------------------------------------------------

------------------------------------------------
--------------Product Schema--------------------
------------------------------------------------

create table product(
	id int PRIMARY KEY AUTO_INCREMENT,
	title char(20) NOT NULL,
	description text(1000)
);

------------------------------------------------

------------------------------------------------
--------------Product_Category Schema-----------
------------------------------------------------

create table product_category(
	id int PRIMARY KEY AUTO_INCREMENT,
	category_id int,
	product_id int,
	FOREIGN KEY (category_id) REFERENCES category (id) ON DELETE CASCADE,
	FOREIGN KEY (product_id) REFERENCES product (id) ON DELETE CASCADE
);

------------------------------------------------

------------------------------------------------
--------------Address Schema-------------------
------------------------------------------------

create table address(
	id int PRIMARY KEY AUTO_INCREMENT,
	city char(20) NOT NULL,
	street char(20) NOT NULL,
	home tinyint NOT NULL,
	apartment_office char(20) NOT NULL,
	porch tinyint,
	floor tinyint
);

------------------------------------------------

------------------------------------------------
--------------Customer Schema-------------------
------------------------------------------------

create table customer(
	id int PRIMARY KEY AUTO_INCREMENT,
	name char(20) NOT NULL,
	surname char(20) NOT NULL,
	email char(20) NOT NULL,
	phone tinyint NOT NULL UNIQUE,
	address_id int NOT NULL,
	FOREIGN KEY (address_id) REFERENCES address (id) ON DELETE CASCADE
);

------------------------------------------------

------------------------------------------------
--------------Basket Schema---------------------
------------------------------------------------

create table basket(
	id int PRIMARY KEY AUTO_INCREMENT,
	customer_id int NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer (id) ON DELETE CASCADE
);

------------------------------------------------

------------------------------------------------
--------------Basket_Item Schema----------------
------------------------------------------------

create table basket_item(
	id int PRIMARY KEY AUTO_INCREMENT,
	product_id int NOT NULL,
	product_count int NOT NULL,
	basket_id int NOT NULL,
	FOREIGN KEY (basket_id) REFERENCES basket (id) ON DELETE CASCADE
);

------------------------------------------------

------------------------------------------------
--------------Orders Schema----------------------
------------------------------------------------

create table orders(
	id int PRIMARY KEY AUTO_INCREMENT,
	status char(10) NOT NULL,
	orders_method int NOT NULL,
	payment_method int NOT NULL,
	address_id int NOT NULL,
	FOREIGN KEY (orders_method) REFERENCES orders_method (id) ON DELETE CASCADE,
	FOREIGN KEY (payment_method) REFERENCES payment_method (id) ON DELETE CASCADE,
	FOREIGN KEY (address_id) REFERENCES address (id) ON DELETE CASCADE
);

------------------------------------------------

------------------------------------------------
--------------Orders_method Schema--------------
------------------------------------------------

create table orders_method(
	id int PRIMARY KEY AUTO_INCREMENT,
	method char(10) NOT NULL
);

------------------------------------------------

------------------------------------------------
--------------Payment_method Schema-------------
------------------------------------------------

create table payment_method(
	id int PRIMARY KEY AUTO_INCREMENT,
	method char(10) NOT NULL
);


------------------------------------------------

------------------------------------------------
--------------Orders_Item Schema----------------
------------------------------------------------

create table orders_item(
	id int PRIMARY KEY AUTO_INCREMENT,
	product_id int NOT NULL,
	product_count int NOT NULL,
	orders_id int NOT NULL,
	FOREIGN KEY (orders_id) REFERENCES orders (id) ON DELETE CASCADE,
	FOREIGN KEY (product_id) REFERENCES product (id) ON DELETE CASCADE
);



