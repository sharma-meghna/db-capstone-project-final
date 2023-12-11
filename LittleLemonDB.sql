-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`customerdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`customerdetails` (
  `idcustomer` INT NOT NULL,
  `names` VARCHAR(45) NOT NULL,
  `contact` INT NOT NULL,
  PRIMARY KEY (`idcustomer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`staffinformation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`staffinformation` (
  `idstaff` INT NOT NULL,
  `roles` VARCHAR(45) NOT NULL,
  `salary` INT NOT NULL,
  PRIMARY KEY (`idstaff`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `idBookings` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `tablenumber` INT NOT NULL,
  `idcustomer` INT NOT NULL,
  `idstaff` INT NOT NULL,
  PRIMARY KEY (`idBookings`),
  INDEX `idcustomer_idx` (`idcustomer` ASC) VISIBLE,
  INDEX `idstaff_idx` (`idstaff` ASC) VISIBLE,
  CONSTRAINT `idcustomer`
    FOREIGN KEY (`idcustomer`)
    REFERENCES `LittleLemonDB`.`customerdetails` (`idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idstaff`
    FOREIGN KEY (`idstaff`)
    REFERENCES `LittleLemonDB`.`staffinformation` (`idstaff`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`menu` (
  `cuisines` VARCHAR(45) NOT NULL,
  `starters` VARCHAR(45) NOT NULL,
  `courses` VARCHAR(45) NOT NULL,
  `drinks` VARCHAR(45) NOT NULL,
  `desserts` VARCHAR(45) NOT NULL,
  `ismenu` INT NOT NULL,
  PRIMARY KEY (`ismenu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`orderDeliverystatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`orderDeliverystatus` (
  `deliverydate` DATETIME NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `iddelivery` INT NOT NULL,
  PRIMARY KEY (`iddelivery`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`orders` (
  `orderdate` DATETIME NOT NULL,
  `quantity` INT NOT NULL,
  `totalcost` INT NOT NULL,
  `idBookings` INT NOT NULL,
  `idmenu` INT NOT NULL,
  `iddelivery` INT NOT NULL,
  INDEX `idBookings_idx` (`idBookings` ASC) VISIBLE,
  INDEX `idmenu_idx` (`idmenu` ASC) VISIBLE,
  INDEX `iddelivery_idx` (`iddelivery` ASC) VISIBLE,
  CONSTRAINT `idBookings`
    FOREIGN KEY (`idBookings`)
    REFERENCES `LittleLemonDB`.`Bookings` (`idBookings`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idmenu`
    FOREIGN KEY (`idmenu`)
    REFERENCES `LittleLemonDB`.`menu` (`ismenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `iddelivery`
    FOREIGN KEY (`iddelivery`)
    REFERENCES `LittleLemonDB`.`orderDeliverystatus` (`iddelivery`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
