CREATE DATABASE IF NOT EXISTS gambling_db;
USE gambling_db;

CREATE SCHEMA gambling_class;

DROP TABLE IF EXISTS gambling_db.customer;
DROP TABLE IF EXISTS gambling_db.account;
DROP TABLE IF EXISTS gambling_db.product;
DROP TABLE IF EXISTS gambling_db.betting;


CREATE TABLE gambling_db.customer (
    cust_id VARCHAR(50),
    account_location VARCHAR(50),
    tittle VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
	create_date VARCHAR(50),
	country_code VARCHAR(50), 
	language VARCHAR(50),
	status VARCHAR(50),    
	date_of_birth VARCHAR(50),      
	contact VARCHAR(50),         
    customer_group VARCHAR(50)
);




CREATE TABLE gambling_db.account (
    account_no VARCHAR(50),
    cust_id VARCHAR(50),
    account_location VARCHAR(50),
    currency_code VARCHAR(50),
    daily_deposit_limit VARCHAR(50),
	stake_scale VARCHAR(50),
    source_prod VARCHAR(50)
);

CREATE TABLE gambling_db.product (
    class_id VARCHAR(50),
    category_id VARCHAR(50),
    product VARCHAR(50),
    sub_product VARCHAR(50),
    description_ VARCHAR(50),
    bet_or_play VARCHAR(50)
);


CREATE TABLE gambling_db.betting (
    account_no VARCHAR(50),
    bet_date VARCHAR(50),
    class_id VARCHAR(50),
    category_id VARCHAR(50),
    source VARCHAR(50),
	bet_count VARCHAR(50),
	bet_amt VARCHAR(50),
	win_amt VARCHAR(50),
    product VARCHAR(50)
);

SELECT * FROM gambling_db.customer;
SELECT * FROM gambling_db.account;
SELECT * FROM gambling_db.product;
SELECT * FROM gambling_db.betting;


drop table betting;

SELECT * FROM gambling_db.account;