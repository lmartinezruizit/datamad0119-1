-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_mysql` DEFAULT CHARACTER SET utf8 ;
USE `lab_mysql` ;

-- -----------------------------------------------------
-- Table `lab_mysql`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`salesperson` (
  `ID` INT NOT NULL,
  `staff_ID` INT NULL,
  `name` VARCHAR(200) NULL,
  `store` VARCHAR(200) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`customers` (
  `customer_ID` INT NOT NULL,
  `name` VARCHAR(200) NULL,
  `phone` VARCHAR(200) NULL,
  `email` VARCHAR(200) NULL,
  `address` VARCHAR(200) NULL,
  `city` VARCHAR(200) NULL,
  `state` VARCHAR(200) NULL,
  `country` VARCHAR(200) NULL,
  `zip` VARCHAR(200) NULL,
  `ID` INT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`invoices` (
  `ID` INT NOT NULL,
  `invoice_number` INT NULL,
  `date` DATE NULL,
  `car` VARCHAR(200) NULL,
  `salesperson_ID` INT NOT NULL,
  `customers_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_invoices_salesperson1_idx` (`salesperson_ID` ASC),
  INDEX `fk_invoices_customers1_idx` (`customers_ID` ASC),
  CONSTRAINT `fk_invoices_salesperson1`
    FOREIGN KEY (`salesperson_ID`)
    REFERENCES `lab_mysql`.`salesperson` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_ID`)
    REFERENCES `lab_mysql`.`customers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`cars` (
  `ID` INT NOT NULL,
  `VIN` VARCHAR(200) NULL,
  `manufacturer` VARCHAR(200) NULL,
  `model` VARCHAR(200) NULL,
  `year` INT NULL,
  `color` VARCHAR(200) NULL,
  `invoices_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_cars_invoices_idx` (`invoices_ID` ASC),
  CONSTRAINT `fk_cars_invoices`
    FOREIGN KEY (`invoices_ID`)
    REFERENCES `lab_mysql`.`invoices` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



INSERT INTO `lab_mysql`.`salesperson` (`ID`,`staff_ID`, `name`, `store`) VALUES (0,00001, 'Petey Cruiser', 'Madrid');
INSERT INTO `lab_mysql`.`salesperson` (`ID`,`staff_ID`, `name`, `store`) VALUES (1,00002, 'Anna Sthesia', 'Barcelona');
INSERT INTO `lab_mysql`.`salesperson` (`ID`,`staff_ID`, `name`, `store`) VALUES (2,00003, 'Paul Molive', 'Berlin');
INSERT INTO `lab_mysql`.`salesperson` (`ID`,`staff_ID`, `name`, `store`) VALUES (3,00004, 'Gail Forcewind', 'Paris');
INSERT INTO `lab_mysql`.`salesperson` (`ID`,`staff_ID`, `name`, `store`) VALUES (4,00005, 'Paige Turner', 'Mimia');
INSERT INTO `lab_mysql`.`salesperson` (`ID`,`staff_ID`, `name`, `store`) VALUES (5,00006, 'Bob Frapples', 'Mexico City');
INSERT INTO `lab_mysql`.`salesperson` (`ID`,`staff_ID`, `name`, `store`) VALUES (6,00007, 'Walter Melon', 'Amsterdam');
INSERT INTO `lab_mysql`.`salesperson` (`ID`,`staff_ID`, `name`, `store`) VALUES (7,00008, 'Shonda Leer', 'São Paulo');

INSERT INTO customers(customer_ID,name,phone,email,address,city,state,country,zip,ID) values (10001,'Pablo Picasso','+34636176382','','Paseo de la Chopera, 14','Madrid','Madrid','Spain','28045',0);
INSERT INTO customers(customer_ID,name,phone,email,address,city,state,country,zip,ID) values (20001,'Abraham Lincoln','+13059077086','','120 SW 8th St','Miami','Florida','United States','33130',1);
INSERT INTO customers(customer_ID,name,phone,email,address,city,state,country,zip,ID) values (30001,'Napoléon Bonaparte','+33179754000','','40 Rue du Colisée','Paris','Île-de-France','France','75008',2);


INSERT INTO `lab_mysql`.`invoices` (`ID`,`invoice_number`, `date`, `car`, `customers_ID`, `salesperson_ID`) VALUES (0,852399038, '2018-08-22', '0', 1, 3);
INSERT INTO `lab_mysql`.`invoices` (`ID`,`invoice_number`, `date`, `car`, `customers_ID`, `salesperson_ID`) VALUES (1,731166526, '2018-12-31', '3', 0, 5);
INSERT INTO `lab_mysql`.`invoices` (`ID`,`invoice_number`, `date`, `car`, `customers_ID`, `salesperson_ID`) VALUES (2,271135104, '2019-01-22', '2', 2, 7);



INSERT INTO `lab_mysql`.`cars` (`ID`,`VIN`, `manufacturer`, `model`, `year`, `color`, `invoices_ID`) VALUES (0,'3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue',0);
INSERT INTO `lab_mysql`.`cars` (`ID`,`VIN`, `manufacturer`, `model`, `year`, `color`, `invoices_ID`) VALUES (1,'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red',1);
INSERT INTO `lab_mysql`.`cars` (`ID`,`VIN`, `manufacturer`, `model`, `year`, `color`, `invoices_ID`) VALUES (2,'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White',2);
INSERT INTO `lab_mysql`.`cars` (`ID`,`VIN`, `manufacturer`, `model`, `year`, `color`, `invoices_ID`) VALUES (3,'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver',0);
INSERT INTO `lab_mysql`.`cars` (`ID`,`VIN`, `manufacturer`, `model`, `year`, `color`, `invoices_ID`) VALUES (4,'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray',1);
INSERT INTO `lab_mysql`.`cars` (`ID`,`VIN`, `manufacturer`, `model`, `year`, `color`, `invoices_ID`) VALUES (5,'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', '2019', 'Gray',2);

UPDATE `lab_mysql`.`salesperson` SET `store`='Miami' WHERE `ID`='4';

UPDATE `lab_mysql`.`customers` SET `email`='ppicasso@gmail.com' WHERE `ID`='0';
UPDATE `lab_mysql`.`customers` SET `email`='lincoln@us.gov' WHERE `ID`='1';
UPDATE `lab_mysql`.`customers` SET `email`='hello@napoleon.me' WHERE `ID`='2';

DELETE FROM cars WHERE ID=4;