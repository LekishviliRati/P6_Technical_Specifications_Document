-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`restaurant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `location` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `e-mail` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `phone_number` VARCHAR(15) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `e-mail_UNIQUE` (`e-mail` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`delivery` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `recipient` VARCHAR(150) NOT NULL,
  `street` VARCHAR(150) NOT NULL,
  `postal_code` INT NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `status` ENUM('Cuisinier', 'Livreur', 'Responsable') NOT NULL,
  `professional_id` VARCHAR(45) NOT NULL,
  `professional_phone` VARCHAR(15) NULL,
  `password` VARCHAR(45) NOT NULL,
  `personal_mail` VARCHAR(100) NOT NULL,
  `personal_phone` VARCHAR(15) NOT NULL,
  `restaurant_id` INT NOT NULL,
  PRIMARY KEY (`id`, `restaurant_id`),
  INDEX `fk_employee_restaurant1_idx` (`restaurant_id` ASC) VISIBLE,
  UNIQUE INDEX `professional_id_UNIQUE` (`professional_id` ASC) VISIBLE,
  UNIQUE INDEX `professional_phone_UNIQUE` (`professional_phone` ASC) VISIBLE,
  CONSTRAINT `fk_employee_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `mydb`.`restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `total_price` DECIMAL(4,2) NOT NULL,
  `status` ENUM('En attente', 'Terminée') NOT NULL,
  `payment_status` ENUM('Payé', 'A payer') NOT NULL,
  `restaurant_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `delivery_id` INT NULL,
  `deliverer_id` INT NULL,
  PRIMARY KEY (`id`, `restaurant_id`, `customer_id`),
  INDEX `fk_order_restaurant1_idx` (`restaurant_id` ASC) VISIBLE,
  INDEX `fk_order_customer1_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_order_delivery1_idx` (`delivery_id` ASC) VISIBLE,
  INDEX `fk_order_employee1_idx` (`deliverer_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `mydb`.`restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `mydb`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_delivery1`
    FOREIGN KEY (`delivery_id`)
    REFERENCES `mydb`.`delivery` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_employee1`
    FOREIGN KEY (`deliverer_id`)
    REFERENCES `mydb`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT(500) NOT NULL,
  `price` DECIMAL(4,2) NOT NULL,
  `recipe` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`order_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`order_product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `product_unit` INT NOT NULL,
  `unit_price` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`id`, `order_id`, `product_id`),
  INDEX `fk_product_has_order_order1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_product_has_order_product_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_has_order_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_has_order_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `mydb`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ingredient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ingredient` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ingredient_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ingredient_product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `ingredient_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`id`, `product_id`, `ingredient_id`),
  INDEX `fk_product_has_ingredient_ingredient1_idx` (`ingredient_id` ASC) VISIBLE,
  INDEX `fk_product_has_ingredient_product1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_has_ingredient_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_has_ingredient_ingredient1`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `mydb`.`ingredient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ingredient_restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ingredient_restaurant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `restaurant_id` INT NOT NULL,
  `ingredient_id` INT NOT NULL,
  `stock` INT NOT NULL,
  PRIMARY KEY (`id`, `restaurant_id`, `ingredient_id`),
  INDEX `fk_ingredient_has_restaurant_restaurant1_idx` (`restaurant_id` ASC) VISIBLE,
  INDEX `fk_ingredient_has_restaurant_ingredient1_idx` (`ingredient_id` ASC) VISIBLE,
  CONSTRAINT `fk_ingredient_has_restaurant_ingredient1`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `mydb`.`ingredient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingredient_has_restaurant_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `mydb`.`restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`customer_delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customer_delivery` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `delivery_id` INT NOT NULL,
  PRIMARY KEY (`id`, `customer_id`, `delivery_id`),
  INDEX `fk_customer_has_delivery_delivery1_idx` (`delivery_id` ASC) VISIBLE,
  INDEX `fk_customer_has_delivery_customer1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_has_delivery_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `mydb`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_has_delivery_delivery1`
    FOREIGN KEY (`delivery_id`)
    REFERENCES `mydb`.`delivery` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
