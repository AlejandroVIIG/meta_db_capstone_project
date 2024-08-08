-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `little_lemon_db` ;
USE `little_lemon_db` ;

-- -----------------------------------------------------
-- Table `new_schema1`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`country` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`address` (
  `id` INT NOT NULL,
  `country_id` INT NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `ext_number` INT NOT NULL,
  `int_number` INT NULL,
  `postal_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_country_id_idx` (`country_id` ASC) VISIBLE,
  CONSTRAINT `fk_country_id`
    FOREIGN KEY (`country_id`)
    REFERENCES `new_schema1`.`country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`person` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `address_id_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `fk_address_id`
    FOREIGN KEY (`address_id`)
    REFERENCES `new_schema1`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`staff` (
  `id` INT NOT NULL,
  `person_id` INT NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `monthly_salary` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_person_id`
    FOREIGN KEY (`id`)
    REFERENCES `new_schema1`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`bookings` (
  `id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `table` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `staff_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `customer_id_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_staff_id_idx` (`staff_id` ASC) VISIBLE,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `new_schema1`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_staff_id`
    FOREIGN KEY (`staff_id`)
    REFERENCES `new_schema1`.`staff` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`cuisine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`cuisine` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`course` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`item_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`item_type` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`item` (
  `id` INT NOT NULL,
  `name` INT NOT NULL,
  `cuisine_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `item_type_id` INT NOT NULL,
  `price` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_cuisine_id_idx` (`cuisine_id` ASC) VISIBLE,
  INDEX `fk_course_id_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_item_type_id_idx` (`item_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_cuisine_id`
    FOREIGN KEY (`cuisine_id`)
    REFERENCES `new_schema1`.`cuisine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `new_schema1`.`course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_type_id`
    FOREIGN KEY (`item_type_id`)
    REFERENCES `new_schema1`.`item_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`order` (
  `id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `total` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_customer_id_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `new_schema1`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`order_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`order_item` (
  `order_id` INT NOT NULL,
  `item_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `subtotal` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`order_id`, `item_id`),
  INDEX `fk_item_id_idx` (`item_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `new_schema1`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_id`
    FOREIGN KEY (`item_id`)
    REFERENCES `new_schema1`.`item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
