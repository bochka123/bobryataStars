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
  `Password` VARCHAR(45) NOT NULL,
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
  `NumberOfCreatedPolls` INT NOT NULL,
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
  `Organization_id` INT NULL,
  `Admin_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Poll_Organization1_idx` (`Organization_id` ASC) VISIBLE,
  INDEX `fk_Poll_Admin1_idx` (`Admin_id` ASC) VISIBLE,
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
-- Table `Question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Question` (
  `id` INT NOT NULL,
  `Description` VARCHAR(150) NOT NULL,
  `QuestionType_id` INT NOT NULL,
  `Poll_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Question_QuestionType_idx` (`QuestionType_id` ASC) VISIBLE,
  INDEX `fk_Question_Poll1_idx` (`Poll_id` ASC) VISIBLE,
  CONSTRAINT `fk_Question_QuestionType`
    FOREIGN KEY (`QuestionType_id`)
    REFERENCES `QuestionType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Question_Poll1`
    FOREIGN KEY (`Poll_id`)
    REFERENCES `Poll` (`id`)
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
  `Poll_id` INT NOT NULL,
  `User_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_PollResult_Poll1_idx` (`Poll_id` ASC) VISIBLE,
  INDEX `fk_PollResult_User1_idx` (`User_id` ASC) VISIBLE,
  CONSTRAINT `fk_PollResult_Poll1`
    FOREIGN KEY (`Poll_id`)
    REFERENCES `Poll` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PollResult_User1`
    FOREIGN KEY (`User_id`)
    REFERENCES `User` (`id`)
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
  `Question_id` INT NOT NULL,
  `PollResult_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Answer_Question1_idx` (`Question_id` ASC) VISIBLE,
  INDEX `fk_Answer_PollResult1_idx` (`PollResult_id` ASC) VISIBLE,
  CONSTRAINT `fk_Answer_Question1`
    FOREIGN KEY (`Question_id`)
    REFERENCES `Question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Answer_PollResult1`
    FOREIGN KEY (`PollResult_id`)
    REFERENCES `PollResult` (`id`)
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

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`organization` (`id`, `Name`, `Description`, `CreationDate`) VALUES (1, 'Bobr Enterprises', 'Young and progressive gays', STR_TO_DATE('26-04-1986','%d-%m-%Y'));
INSERT INTO `mydb`.`organization` (`id`, `Name`, `Description`, `CreationDate`) VALUES (2, 'Crusty Crabs', 'Macdonalds', STR_TO_DATE('00-00-2000','%d-%m-%Y'));
INSERT INTO `mydb`.`organization` (`id`, `Name`, `Description`, `CreationDate`) VALUES (3, 'Abibas', 'Faster then Hike', STR_TO_DATE('00-01-2000','%d-%m-%Y'));
INSERT INTO `mydb`.`organization` (`id`, `Name`, `Description`, `CreationDate`) VALUES (4, 'Bunny Gays', 'Old but strong togeyher', STR_TO_DATE('21-11-1953','%d-%m-%Y'));
COMMIT;

START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`User` (`id`, `Name`, `Email`, `Password`) VALUES (1, 'Sasha', 'sasha_sas@gmail.com', '12345');
INSERT INTO `mydb`.`User` (`id`, `Name`, `Email`, `Password`, `Organization_id`) VALUES (2, 'Sasha2', 'sas_sasha@gmail.com', '54321', '4');
INSERT INTO `mydb`.`User` (`id`, `Name`, `Email`, `Password`, `Organization_id`) VALUES (3, 'Yarik', 'yarichek_lova@ukr.net', '1111', '1');
INSERT INTO `mydb`.`User` (`id`, `Name`, `Email`, `Password`, `Organization_id`) VALUES (4, 'Nazar', 'tymchyshka@yahoo.com', '111', '2');
INSERT INTO `mydb`.`User` (`id`, `Name`, `Email`, `Password`, `Organization_id`) VALUES (5, 'Petro Poroshenko', 'poroh@gmail.com', 'shekoladkaAlenka', '2');
INSERT INTO `mydb`.`User` (`id`, `Name`, `Email`, `Password`, `Organization_id`) VALUES (6, 'Leonardo Pepsi', 'cristiano@ronaldo.com', '7777', '3');
COMMIT;

START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`admin` (`id`, `NumberOfCreatedPolls`, `User_id`) VALUES (1, 5, 3);
INSERT INTO `mydb`.`admin` (`id`, `NumberOfCreatedPolls`, `User_id`) VALUES (2, 0, 5);
COMMIT;

START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`QuestionType` (`id`, `Name`, `Description`) VALUES (1, 'Input', 'Text answer');
INSERT INTO `mydb`.`QuestionType` (`id`, `Name`, `Description`) VALUES (2, 'Single selection', 'Multiple options, only one is correct');
INSERT INTO `mydb`.`QuestionType` (`id`, `Name`, `Description`) VALUES (3, 'Multiple selection', 'Multiple options with multiple answers');
COMMIT;

START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`poll` (`id`, `Title`, `Description`, `Admin_id`) VALUES (1, 'АТБ', 'Я вже проголосував на виборах, а ти?', 2);
COMMIT;

START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Question` (`id`, `Description`, `QuestionType_id`, `Poll_id`) VALUES (1, 'Скільки років Спанч Бобу?', 1, 1);
INSERT INTO `mydb`.`Question` (`id`, `Description`, `QuestionType_id`, `Poll_id`) VALUES (2, 'Якщо людину послати по гриби, то коли база данних стане юзабельною?', 2, 1);
INSERT INTO `mydb`.`Question` (`id`, `Description`, `QuestionType_id`, `Poll_id`) VALUES (3, 'В якому році Європейський Союз увійде до складу України?', 2, 1);
COMMIT;

START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`answeroption`(`id`, `Name`, `Question_id`) VALUES (1, "Так", 2);
INSERT INTO `mydb`.`answeroption`(`id`, `Name`, `Question_id`) VALUES (2, "Ні", 2);
INSERT INTO `mydb`.`answeroption`(`id`, `Name`, `Question_id`) VALUES (3, "Ніколи", 2);
INSERT INTO `mydb`.`answeroption`(`id`, `Name`, `Question_id`) VALUES (4, "До кінця 2022", 3);
INSERT INTO `mydb`.`answeroption`(`id`, `Name`, `Question_id`) VALUES (5, "До середини 2025", 3);
INSERT INTO `mydb`.`answeroption`(`id`, `Name`, `Question_id`) VALUES (6, "До кінця 2030", 3);
COMMIT;

START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`PollResult` (`id`, `Date`, `Poll_id`, `User_id`) VALUES (2, STR_TO_DATE('19-05-2022','%d-%m-%Y'), 1, 1);
INSERT INTO `mydb`.`PollResult` (`id`, `Date`, `Poll_id`, `User_id`) VALUES (1, STR_TO_DATE('18-05-2022','%d-%m-%Y'), 1, 6);
COMMIT;

START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Answer` (`id`, `Content`, `Question_Id`, `PollResult_id`) VALUES (1, '11', 1, 2);
INSERT INTO `mydb`.`Answer` (`id`, `Content`, `Question_Id`, `PollResult_id`) VALUES (2, 'Ніколи', 2, 2);
INSERT INTO `mydb`.`Answer` (`id`, `Content`, `Question_Id`, `PollResult_id`) VALUES (3, 'До кінця 2022', 3, 2);
INSERT INTO `mydb`.`Answer` (`id`, `Content`, `Question_Id`, `PollResult_id`) VALUES (4, '12', 1, 1);
INSERT INTO `mydb`.`Answer` (`id`, `Content`, `Question_Id`, `PollResult_id`) VALUES (5, 'Ні', 2, 1);
INSERT INTO `mydb`.`Answer` (`id`, `Content`, `Question_Id`, `PollResult_id`) VALUES (6, 'До середини 2025', 3, 1);
COMMIT;