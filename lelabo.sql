-- MySQL Script generated by MySQL Workbench
-- Mon Jul 16 13:05:48 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema lelabo
-- -----------------------------------------------------
-- data base fresh lab 

-- -----------------------------------------------------
-- Schema lelabo
--
-- data base fresh lab 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lelabo` DEFAULT CHARACTER SET utf8 ;
USE `lelabo` ;

-- -----------------------------------------------------
-- Table `lelabo`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lelabo`.`users` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `gender` ENUM('male', 'female') NULL,
  `age` INT NULL,
  `created_at` DATETIME NULL,
  `firstname` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `is_journalist` ENUM('false', 'true') NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE INDEX `id_user_UNIQUE` (`id_user` ASC),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lelabo`.`articles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lelabo`.`articles` (
  `id_article` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `content` LONGTEXT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `id_journalist` INT NOT NULL,
  PRIMARY KEY (`id_article`),
  UNIQUE INDEX `id_article_UNIQUE` (`id_article` ASC),
  INDEX `fk_articles_users1_idx` (`id_journalist` ASC),
  CONSTRAINT `fk_articles_users1`
    FOREIGN KEY (`id_journalist`)
    REFERENCES `lelabo`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lelabo`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lelabo`.`categories` (
  `id_category` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_category`),
  UNIQUE INDEX `id_category_UNIQUE` (`id_category` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lelabo`.`subcategories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lelabo`.`subcategories` (
  `id_subcategory` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `category_id` INT NOT NULL,
  `article_id` INT NOT NULL,
  PRIMARY KEY (`id_subcategory`),
  UNIQUE INDEX `id_subcategory_UNIQUE` (`id_subcategory` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_subcategories_categories1_idx` (`category_id` ASC),
  INDEX `fk_subcategories_articles1_idx` (`article_id` ASC),
  CONSTRAINT `fk_subcategories_categories1`
    FOREIGN KEY (`category_id`)
    REFERENCES `lelabo`.`categories` (`id_category`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subcategories_articles1`
    FOREIGN KEY (`article_id`)
    REFERENCES `lelabo`.`articles` (`id_article`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lelabo`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lelabo`.`comments` (
  `id_comment` INT NOT NULL AUTO_INCREMENT,
  `message` VARCHAR(400) NULL,
  `user_id` INT NOT NULL,
  `article_id` INT NOT NULL,
  PRIMARY KEY (`id_comment`),
  UNIQUE INDEX `id_comment_UNIQUE` (`id_comment` ASC),
  INDEX `fk_comments_users_idx` (`user_id` ASC),
  INDEX `fk_comments_articles1_idx` (`article_id` ASC),
  CONSTRAINT `fk_comments_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `lelabo`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_articles1`
    FOREIGN KEY (`article_id`)
    REFERENCES `lelabo`.`articles` (`id_article`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
