-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/A0vAPe
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE card_holder (
	card_holder_id SERIAL NOT NULL, 
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	PRIMARY KEY (card_holder_id)
	
);

CREATE TABLE credit_card (
	card_number VARCHAR(20),
	card_holder_id int 

);

CREATE TABLE merchant_category (
	cat_id SERIAL NOT NULL,
	merchant_type VARCHAR(50),
	PRIMARY KEY (cat_id)
);

CREATE TABLE merchant(
	merchant_id SERIAL NOT NULL,
	merchant_name VARCHAR(50),
	cat_id int

);

CREATE TABLE transactions (
	transaction_id SERIAL NOT NULL,
	date TIMESTAMP,
	amount FLOAT,
	card_number VARCHAR(20),
	merchant_id int NOT NULL
	
);