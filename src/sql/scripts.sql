-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `QuestionType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QuestionType` (
  `id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Question` (
  `id` INT NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  `QuestionType_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Question_QuestionType_idx` (`QuestionType_id` ASC) VISIBLE,
  CONSTRAINT `fk_Question_QuestionType`
    FOREIGN KEY (`QuestionType_id`)
    REFERENCES `QuestionType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Answer` (
  `id` INT NOT NULL,
  `Content` VARCHAR(45) NOT NULL,
  `Question` VARCHAR(45) NOT NULL,
  `QuestionType` VARCHAR(45) NOT NULL,
  `Question_id` INT NOT NULL,
  `QuestionType_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Answer_Question1_idx` (`Question_id` ASC) VISIBLE,
  INDEX `fk_Answer_QuestionType1_idx` (`QuestionType_id` ASC) VISIBLE,
  CONSTRAINT `fk_Answer_Question1`
    FOREIGN KEY (`Question_id`)
    REFERENCES `Question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Answer_QuestionType1`
    FOREIGN KEY (`QuestionType_id`)
    REFERENCES `QuestionType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `AnswerOption`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AnswerOption` (
  `id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `IndexNumber` INT NULL,
  `Question_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_AnswerOption_Question1_idx` (`Question_id` ASC) VISIBLE,
  CONSTRAINT `fk_AnswerOption_Question1`
    FOREIGN KEY (`Question_id`)
    REFERENCES `Question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Organization`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Organization` (
  `id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  `CreationDate` DATE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `User` (
  `id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Password` VARBINARY(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Organization_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_User_Organization1_idx` (`Organization_id` ASC) VISIBLE,
  CONSTRAINT `fk_User_Organization1`
    FOREIGN KEY (`Organization_id`)
    REFERENCES `Organization` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Admin` (
  `id` INT NOT NULL,
  `NumberOfCreatedPolls` VARCHAR(45) NOT NULL,
  `User_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Admin_User1_idx` (`User_id` ASC) VISIBLE,
  CONSTRAINT `fk_Admin_User1`
    FOREIGN KEY (`User_id`)
    REFERENCES `User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Poll`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Poll` (
  `id` INT NOT NULL,
  `Title` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  `Question_id` INT NOT NULL,
  `Organization_id` INT NULL,
  `Admin_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Poll_Question1_idx` (`Question_id` ASC) VISIBLE,
  INDEX `fk_Poll_Organization1_idx` (`Organization_id` ASC) VISIBLE,
  INDEX `fk_Poll_Admin1_idx` (`Admin_id` ASC) VISIBLE,
  CONSTRAINT `fk_Poll_Question1`
    FOREIGN KEY (`Question_id`)
    REFERENCES `Question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Poll_Organization1`
    FOREIGN KEY (`Organization_id`)
    REFERENCES `Organization` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Poll_Admin1`
    FOREIGN KEY (`Admin_id`)
    REFERENCES `Admin` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `PollResult`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PollResult` (
  `id` INT NOT NULL,
  `Date` DATE NOT NULL,
  `Respondent` VARCHAR(45) NOT NULL,
  `Result` VARCHAR(45) NOT NULL,
  `Answer_id` INT NOT NULL,
  `Poll_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_PollResult_Answer1_idx` (`Answer_id` ASC) VISIBLE,
  INDEX `fk_PollResult_Poll1_idx` (`Poll_id` ASC) VISIBLE,
  CONSTRAINT `fk_PollResult_Answer1`
    FOREIGN KEY (`Answer_id`)
    REFERENCES `Answer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PollResult_Poll1`
    FOREIGN KEY (`Poll_id`)
    REFERENCES `Poll` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
