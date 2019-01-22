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
  `zip` INT NULL,
  `ID` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`salesperson` (
  `staff_ID` INT NOT NULL,
  `name` VARCHAR(200) NULL,
  `store` VARCHAR(200) NULL,
  `ID` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`invoice` (
  `invoice_number` INT NOT NULL,
  `date` VARCHAR(45) NULL,
  `car` VARCHAR(45) NULL,
  `ID` INT NOT NULL AUTO_INCREMENT,
  `customers_ID` INT NOT NULL,
  `salesperson_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_invoice_customers1_idx` (`customers_ID` ASC),
  INDEX `fk_invoice_salesperson1_idx` (`salesperson_ID` ASC),
  CONSTRAINT `fk_invoice_customers1`
    FOREIGN KEY (`customers_ID`)
    REFERENCES `lab_mysql`.`customers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoice_salesperson1`
    FOREIGN KEY (`salesperson_ID`)
    REFERENCES `lab_mysql`.`salesperson` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`cars` (
  `VIN` VARCHAR(200) NOT NULL,
  `manufacturer` VARCHAR(200) NULL,
  `model` VARCHAR(200) NULL,
  `year` INT NULL,
  `color` VARCHAR(200) NULL,
  `ID` INT NOT NULL AUTO_INCREMENT,
  `customers_ID` INT NOT NULL,
  `salesperson_ID` INT NOT NULL,
  `invoice_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_cars_customers_idx` (`customers_ID` ASC),
  INDEX `fk_cars_salesperson1_idx` (`salesperson_ID` ASC),
  INDEX `fk_cars_invoice1_idx` (`invoice_ID` ASC),
  CONSTRAINT `fk_cars_customers`
    FOREIGN KEY (`customers_ID`)
    REFERENCES `lab_mysql`.`customers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cars_salesperson1`
    FOREIGN KEY (`salesperson_ID`)
    REFERENCES `lab_mysql`.`salesperson` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cars_invoice1`
    FOREIGN KEY (`invoice_ID`)
    REFERENCES `lab_mysql`.`invoice` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO customers(customer_ID,name,phone,email,address,city,state,country,zip,ID) values ('10001','Pablo Picasso','+34636176382','','Paseo de la Chopera, 14','Madrid','Madrid','Spain','28045','0');
INSERT INTO customers(customer_ID,name,phone,email,address,city,state,country,zip,ID) values ('20001','Abraham Lincoln','+13059077086','','120 SW 8th St','Miami','Florida','United States','33130','1');
INSERT INTO customers(customer_ID,name,phone,email,address,city,state,country,zip,ID) values ('30001','Napoléon Bonaparte','+33179754000','','40 Rue du Colisée','Paris','Île-de-France','France','75008','2');

INSERT INTO `lab_mysql`.`salesperson` (`staff_ID`, `name`, `store`) VALUES ('00001', 'Petey Cruiser', 'Madrid');
INSERT INTO `lab_mysql`.`salesperson` (`staff_ID`, `name`, `store`) VALUES ('00002', 'Anna Sthesia', 'Barcelona');
INSERT INTO `lab_mysql`.`salesperson` (`staff_ID`, `name`, `store`) VALUES ('00003', 'Paul Molive', 'Berlin');
INSERT INTO `lab_mysql`.`salesperson` (`staff_ID`, `name`, `store`) VALUES ('00004', 'Gail Forcewind', 'Paris');
INSERT INTO `lab_mysql`.`salesperson` (`staff_ID`, `name`, `store`) VALUES ('00005', 'Paige Turner', 'Mimia');
INSERT INTO `lab_mysql`.`salesperson` (`staff_ID`, `name`, `store`) VALUES ('00006', 'Bob Frapples', 'Mexico City');
INSERT INTO `lab_mysql`.`salesperson` (`staff_ID`, `name`, `store`) VALUES ('00007', 'Walter Melon', 'Amsterdam');
INSERT INTO `lab_mysql`.`salesperson` (`staff_ID`, `name`, `store`) VALUES ('00008', 'Shonda Leer', 'São Paulo');


INSERT INTO `lab_mysql`.`invoice` (`invoice_number`, `date`, `car`, `customer`, `salesperson`) VALUES ('852399038', '22-08-2018', '0', '1', '3');
INSERT INTO `lab_mysql`.`invoice` (`invoice_number`, `date`, `car`, `customer`, `salesperson`) VALUES ('731166526', '31-12-2018', '3', '0', '5');
INSERT INTO `lab_mysql`.`invoice` (`invoice_number`, `date`, `car`, `customer`, `salesperson`) VALUES ('271135104', '22-01-2019', '2', '2', '7');



INSERT INTO `lab_mysql`.`cars` (`VIN`, `manufacturer`, `model`, `year`, `color`, `ID`, `customers_ID`, `salesperson_ID`, `invoice_ID`) VALUES ('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', '2019', 'Blue', '0', '1', '3', '0');
INSERT INTO `lab_mysql`.`cars` (`VIN`, `manufacturer`, `model`, `year`, `color`, `ID`, `customers_ID`, `salesperson_ID`, `invoice_ID`) VALUES ('ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', '2019', 'Red', '1', '0', '5', '1');
INSERT INTO `lab_mysql`.`cars` (`VIN`, `manufacturer`, `model`, `year`, `color`, `ID`, `customers_ID`, `salesperson_ID`, `invoice_ID`) VALUES ('RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', '2018', 'White', '2', '0', '5', '2');
INSERT INTO `lab_mysql`.`cars` (`VIN`, `manufacturer`, `model`, `year`, `color`, `ID`, `customers_ID`, `salesperson_ID`, `invoice_ID`) VALUES ('HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', '2018', 'Silver', '3', '1', '3', '0');
INSERT INTO `lab_mysql`.`cars` (`VIN`, `manufacturer`, `model`, `year`, `color`, `ID`, `customers_ID`, `salesperson_ID`, `invoice_ID`) VALUES ('DAM41UDN3CHU2WVF6', 'Volvo', 'V60', '2019', 'Gray', '4', '2', '7', '2');
INSERT INTO `lab_mysql`.`cars` (`VIN`, `manufacturer`, `model`, `year`, `color`, `ID`, `customers_ID`, `salesperson_ID`, `invoice_ID`) VALUES ('DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', '2019', 'Gray', '5', '0', '5', '1');
