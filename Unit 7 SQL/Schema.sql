DROP VIEW IF EXISTS transactions_of_each_cardholder;
DROP VIEW IF EXISTS number_of_transactions_less_than_two_dollars;
DROP VIEW IF EXISTS Top_Five_Merchants_Prone_to_Hacking;
DROP VIEW IF EXISTS seven_to_nine_top_100_transactions;
DROP TABLE IF EXISTS transaction;
DROP TABLE IF EXISTS merchant;
DROP TABLE IF EXISTS merchant_category;
DROP TABLE IF EXISTS credit_card;
DROP TABLE IF EXISTS card_holder;


CREATE TABLE card_holder(
	id INT PRIMARY KEY NOT NULL,
	name VARCHAR(50)
);

CREATE TABLE credit_card(
	card VARCHAR(20) PRIMARY KEY NOT NULL,
	id_card_holder INT,
	FOREIGN KEY (id_card_holder) REFERENCES card_holder(id)
);

CREATE TABLE merchant_category(
	id INT PRIMARY KEY NOT NULL,
	name VARCHAR(50)
);

CREATE TABLE merchant(
	id int PRIMARY KEY NOT NULL,
	name VARCHAR(50),
	id_merchant_category INT,
	FOREIGN KEY (id_merchant_category) REFERENCES merchant_category(id)
);

CREATE TABLE transaction(
	id INT,
	date TIMESTAMP,
	amount FLOAT(24),
	card VARCHAR(20),
	FOREIGN KEY (card) REFERENCES credit_card(card),
	id_merchant INT,
	FOREIGN KEY (id_merchant) REFERENCES merchant(id)
);