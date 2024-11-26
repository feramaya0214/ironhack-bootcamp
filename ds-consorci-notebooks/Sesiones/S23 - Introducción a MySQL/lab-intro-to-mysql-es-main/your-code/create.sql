DROP DATABASE IF EXISTS cars;
CREATE DATABASE cars; 
USE cars;



CREATE TABLE IF NOT EXISTS `cars`.`cars` (
  `car_id` INT NOT NULL,
  `VIN` VARCHAR(20) NOT NULL,  
  `manufacturer` VARCHAR(20) NOT NULL,
  `model` VARCHAR(20) NOT NULL,
  `year_` INT NOT NULL,
  `color` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`car_id`));


CREATE TABLE IF NOT EXISTS `cars`.`costumer` (
  `costumer_id` INT NOT NULL,
  `first_name` VARCHAR(20) NOT NULL,
  `phone_no` VARCHAR(20) NULL DEFAULT NULL,
  `email` VARCHAR(20) NULL DEFAULT NULL,
  `address` VARCHAR(40) NULL DEFAULT NULL,
  `city` VARCHAR(20) NULL DEFAULT NULL,
  `state` VARCHAR(20) NULL DEFAULT NULL,
  `country` VARCHAR(20) NULL DEFAULT NULL,
  `zip_code` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`costumer_id`));

  
CREATE TABLE IF NOT EXISTS `cars`.`salesperson` (
  `salesperson_id` INT NOT NULL,
  `first_name` VARCHAR(40) NOT NULL,
  `store_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`salesperson_id`));



CREATE TABLE IF NOT EXISTS `cars`.`invoices` (
  `invoice_id` INT NOT NULL,
  `date_` DATE NULL DEFAULT NULL,
  `car` VARCHAR(20) NOT NULL,
  `costumer` VARCHAR(20) NULL DEFAULT NULL,
  `salesperson` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`invoice_id`));



