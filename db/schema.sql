-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema scholarmesh
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `scholarmesh` ;

-- -----------------------------------------------------
-- Schema scholarmesh
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `scholarmesh` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `scholarmesh` ;

-- -----------------------------------------------------
-- Table `scholarmesh`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`user` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`user` (
  `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(64) NOT NULL,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` TINYINT(1) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `dp` MEDIUMBLOB NULL,
  `dob` DATE NOT NULL,
  `phone` VARCHAR(13) NULL,
  `address` JSON NULL,
  `remember_token` VARCHAR(100) NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `scholarmesh`.`post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`post` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`post` (
  `post_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` TINYINT UNSIGNED NOT NULL,
  `post_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `text` TEXT NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `like_cnt` INT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`post_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`post_id` ASC) VISIBLE,
  INDEX `fk_post_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_post_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `scholarmesh`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = '	';


-- -----------------------------------------------------
-- Table `scholarmesh`.`organization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`organization` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`organization` (
  `org_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(127) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `website` VARCHAR(255) NULL DEFAULT NULL,
  `address` JSON NULL,
  `dp` MEDIUMBLOB NULL DEFAULT NULL,
  `phone` VARCHAR(13) NULL DEFAULT NULL,
  PRIMARY KEY (`org_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`org_id` ASC) VISIBLE)
COMMENT = '					';


-- -----------------------------------------------------
-- Table `scholarmesh`.`message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`message` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`message` (
  `sender_id` INT UNSIGNED NOT NULL,
  `receiver_id` INT UNSIGNED NOT NULL,
  `msg_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `text` TEXT NOT NULL,
  PRIMARY KEY (`sender_id`, `receiver_id`, `msg_time`),
  INDEX `fk_post_user1_idx` (`sender_id` ASC) VISIBLE,
  INDEX `fk_message_user1_idx` (`receiver_id` ASC) VISIBLE,
  CONSTRAINT `fk_post_user10`
    FOREIGN KEY (`sender_id`)
    REFERENCES `scholarmesh`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_user1`
    FOREIGN KEY (`receiver_id`)
    REFERENCES `scholarmesh`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = '	';


-- -----------------------------------------------------
-- Table `scholarmesh`.`conference`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`conference` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`conference` (
  `conf_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(127) NOT NULL,
  `dp` MEDIUMBLOB NULL DEFAULT NULL,
  `venue` JSON NOT NULL,
  `start_time` DATETIME NOT NULL,
  `end_time` DATETIME NULL DEFAULT NULL,
  `creator_id` INT UNSIGNED NOT NULL,
  `url` VARCHAR(255) NULL,
  PRIMARY KEY (`conf_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`conf_id` ASC) VISIBLE,
  INDEX `fk_conference_user1_idx` (`creator_id` ASC) VISIBLE,
  CONSTRAINT `fk_conference_user1`
    FOREIGN KEY (`creator_id`)
    REFERENCES `scholarmesh`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = '	';


-- -----------------------------------------------------
-- Table `scholarmesh`.`chat_room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`chat_room` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`chat_room` (
  `room_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `memb_cnt` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  `admin_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`room_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`room_id` ASC) VISIBLE,
  INDEX `fk_room_user1_idx` (`admin_id` ASC) VISIBLE,
  CONSTRAINT `fk_room_user1`
    FOREIGN KEY (`admin_id`)
    REFERENCES `scholarmesh`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = '	';


-- -----------------------------------------------------
-- Table `scholarmesh`.`paper`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`paper` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`paper` (
  `ppr_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `publish_date` DATE NOT NULL,
  `url` VARCHAR(255) NULL,
  `doi` VARCHAR(255) NULL,
  `file` MEDIUMBLOB NULL,
  PRIMARY KEY (`ppr_id`),
  UNIQUE INDEX `ppr_id_UNIQUE` (`ppr_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scholarmesh`.`follows`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`follows` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`follows` (
  `follower_id` INT UNSIGNED NOT NULL,
  `followed_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`follower_id`, `followed_id`),
  INDEX `fk_follows_user2_idx` (`followed_id` ASC) VISIBLE,
  CONSTRAINT `fk_follows_user1`
    FOREIGN KEY (`follower_id`)
    REFERENCES `scholarmesh`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_follows_user2`
    FOREIGN KEY (`followed_id`)
    REFERENCES `scholarmesh`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scholarmesh`.`affiliation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`affiliation` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`affiliation` (
  `user_id` INT UNSIGNED NOT NULL,
  `org_id` INT UNSIGNED NOT NULL,
  `designation` CHAR(32) NOT NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  PRIMARY KEY (`user_id`, `org_id`, `designation`),
  INDEX `fk_works_at_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_works_at_organization1_idx` (`org_id` ASC) VISIBLE,
  CONSTRAINT `fk_works_at_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `scholarmesh`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_works_at_organization1`
    FOREIGN KEY (`org_id`)
    REFERENCES `scholarmesh`.`organization` (`org_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scholarmesh`.`group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`group` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`group` (
  `grp_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `memb_cnt` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  `admin_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`grp_id`),
  UNIQUE INDEX `grp_id_UNIQUE` (`grp_id` ASC) VISIBLE,
  INDEX `fk_group_user1_idx` (`admin_id` ASC) VISIBLE,
  CONSTRAINT `fk_group_user1`
    FOREIGN KEY (`admin_id`)
    REFERENCES `scholarmesh`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scholarmesh`.`grp_memb`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`grp_memb` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`grp_memb` (
  `grp_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `since_time` TIMESTAMP NOT NULL,
  PRIMARY KEY (`grp_id`, `user_id`),
  INDEX `fk_group_has_user_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_group_has_user_group1_idx` (`grp_id` ASC) VISIBLE,
  CONSTRAINT `fk_group_has_user_group1`
    FOREIGN KEY (`grp_id`)
    REFERENCES `scholarmesh`.`group` (`grp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `scholarmesh`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scholarmesh`.`subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`subject` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`subject` (
  `subj_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`subj_name`),
  UNIQUE INDEX `subj_name_UNIQUE` (`subj_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scholarmesh`.`interest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`interest` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`interest` (
  `user_id` INT UNSIGNED NOT NULL,
  `subj_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`, `subj_name`),
  INDEX `fk_subject_has_user_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_subject_has_user_subject1_idx` (`subj_name` ASC) VISIBLE,
  CONSTRAINT `fk_subject_has_user_subject1`
    FOREIGN KEY (`subj_name`)
    REFERENCES `scholarmesh`.`subject` (`subj_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `scholarmesh`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scholarmesh`.`grp_is_about_subj`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`grp_is_about_subj` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`grp_is_about_subj` (
  `grp_id` INT UNSIGNED NOT NULL,
  `subj_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`grp_id`, `subj_name`),
  INDEX `fk_subject_has_group_group1_idx` (`grp_id` ASC) VISIBLE,
  INDEX `fk_subject_has_group_subject1_idx` (`subj_name` ASC) VISIBLE,
  CONSTRAINT `fk_subject_has_group_subject1`
    FOREIGN KEY (`subj_name`)
    REFERENCES `scholarmesh`.`subject` (`subj_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_has_group_group1`
    FOREIGN KEY (`grp_id`)
    REFERENCES `scholarmesh`.`group` (`grp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scholarmesh`.`room_msg`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`room_msg` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`room_msg` (
  `sender_id` INT UNSIGNED NOT NULL,
  `room_id` INT UNSIGNED NOT NULL,
  `msg_time` TIMESTAMP NOT NULL,
  `text` TEXT NOT NULL,
  PRIMARY KEY (`sender_id`, `room_id`, `msg_time`),
  INDEX `fk_room_has_user_user1_idx` (`sender_id` ASC) VISIBLE,
  INDEX `fk_room_has_user_room1_idx` (`room_id` ASC) VISIBLE,
  CONSTRAINT `fk_room_has_user_room1`
    FOREIGN KEY (`room_id`)
    REFERENCES `scholarmesh`.`chat_room` (`room_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_room_has_user_user1`
    FOREIGN KEY (`sender_id`)
    REFERENCES `scholarmesh`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `scholarmesh`.`room_memb`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`room_memb` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`room_memb` (
  `room_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`room_id`, `user_id`),
  INDEX `fk_room_has_user_user2_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_room_has_user_room2_idx` (`room_id` ASC) VISIBLE,
  CONSTRAINT `fk_room_has_user_room2`
    FOREIGN KEY (`room_id`)
    REFERENCES `scholarmesh`.`chat_room` (`room_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_room_has_user_user2`
    FOREIGN KEY (`user_id`)
    REFERENCES `scholarmesh`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `scholarmesh`.`bookmark`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`bookmark` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`bookmark` (
  `ppr_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`ppr_id`, `user_id`),
  INDEX `fk_paper_has_user_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_paper_has_user_paper1_idx` (`ppr_id` ASC) VISIBLE,
  CONSTRAINT `fk_paper_has_user_paper1`
    FOREIGN KEY (`ppr_id`)
    REFERENCES `scholarmesh`.`paper` (`ppr_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_paper_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `scholarmesh`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scholarmesh`.`author`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`author` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`author` (
  `ppr_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`ppr_id`, `user_id`),
  INDEX `fk_paper_has_user_user2_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_paper_has_user_paper2_idx` (`ppr_id` ASC) VISIBLE,
  CONSTRAINT `fk_paper_has_user_paper2`
    FOREIGN KEY (`ppr_id`)
    REFERENCES `scholarmesh`.`paper` (`ppr_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_paper_has_user_user2`
    FOREIGN KEY (`user_id`)
    REFERENCES `scholarmesh`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scholarmesh`.`attends`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`attends` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`attends` (
  `user_id` INT UNSIGNED NOT NULL,
  `conf_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`, `conf_id`),
  INDEX `fk_user_has_conference_conference1_idx` (`conf_id` ASC) VISIBLE,
  INDEX `fk_user_has_conference_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_conference_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `scholarmesh`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_conference_conference1`
    FOREIGN KEY (`conf_id`)
    REFERENCES `scholarmesh`.`conference` (`conf_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `scholarmesh`.`org_admin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`org_admin` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`org_admin` (
  `org_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`org_id`, `user_id`),
  INDEX `fk_organization_has_user_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_organization_has_user_organization1_idx` (`org_id` ASC) VISIBLE,
  CONSTRAINT `fk_organization_has_user_organization1`
    FOREIGN KEY (`org_id`)
    REFERENCES `scholarmesh`.`organization` (`org_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_organization_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `scholarmesh`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `scholarmesh`.`post_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`post_image` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`post_image` (
  `post_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `img_id` INT UNSIGNED NOT NULL,
  `file` MEDIUMBLOB NOT NULL,
  PRIMARY KEY (`post_id`, `img_id`),
  INDEX `fk_post_image_post1_idx` (`post_id` ASC) VISIBLE,
  CONSTRAINT `fk_post_image_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `scholarmesh`.`post` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scholarmesh`.`notification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`notification` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`notification` (
  `user_id` INT UNSIGNED NOT NULL,
  `notif_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` TINYINT(1) UNSIGNED NOT NULL,
  `link` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`user_id`, `notif_id`),
  UNIQUE INDEX `notif_id_UNIQUE` (`notif_id` ASC) VISIBLE,
  INDEX `fk_notification_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_notification_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `scholarmesh`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scholarmesh`.`comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`comment` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`comment` (
  `cmnt_id` INT(20) UNSIGNED NOT NULL,
  `cmnt_time` TIMESTAMP NOT NULL,
  `text` TEXT NOT NULL,
  `like_cnt` INT UNSIGNED NOT NULL DEFAULT 0,
  `user_id` INT UNSIGNED NOT NULL,
  `post_id` INT UNSIGNED NOT NULL,
  `parent_cmnt_id` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`cmnt_id`),
  UNIQUE INDEX `cmnt_id_UNIQUE` (`cmnt_id` ASC) VISIBLE,
  INDEX `fk_comment_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_comment_post1_idx` (`post_id` ASC) VISIBLE,
  INDEX `fk_comment_comment1_idx` (`parent_cmnt_id` ASC) VISIBLE,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `scholarmesh`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `scholarmesh`.`post` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_comment1`
    FOREIGN KEY (`parent_cmnt_id`)
    REFERENCES `scholarmesh`.`comment` (`cmnt_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `scholarmesh`.`likes_cmnt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`likes_cmnt` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`likes_cmnt` (
  `user_id` INT UNSIGNED NOT NULL,
  `cmnt_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`, `cmnt_id`),
  INDEX `fk_user_has_comment_comment1_idx` (`cmnt_id` ASC) VISIBLE,
  INDEX `fk_user_has_comment_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `scholarmesh`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_comment_comment1`
    FOREIGN KEY (`cmnt_id`)
    REFERENCES `scholarmesh`.`comment` (`cmnt_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `scholarmesh`.`likes_post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`likes_post` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`likes_post` (
  `user_id` INT UNSIGNED NOT NULL,
  `post_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`, `post_id`),
  INDEX `fk_post_has_user_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_post_has_user_post1_idx` (`post_id` ASC) VISIBLE,
  CONSTRAINT `fk_post_has_user_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `scholarmesh`.`post` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `scholarmesh`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `scholarmesh`.`timestamps`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`timestamps` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`timestamps` (
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL);


-- -----------------------------------------------------
-- Table `scholarmesh`.`ppr_is_about_subj`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `scholarmesh`.`ppr_is_about_subj` ;

CREATE TABLE IF NOT EXISTS `scholarmesh`.`ppr_is_about_subj` (
  `ppr_id` INT UNSIGNED NOT NULL,
  `subj_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ppr_id`, `subj_name`),
  INDEX `fk_subject_has_paper_paper1_idx` (`ppr_id` ASC) VISIBLE,
  INDEX `fk_subject_has_paper_subject1_idx` (`subj_name` ASC) VISIBLE,
  CONSTRAINT `fk_subject_has_paper_subject1`
    FOREIGN KEY (`subj_name`)
    REFERENCES `scholarmesh`.`subject` (`subj_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_has_paper_paper1`
    FOREIGN KEY (`ppr_id`)
    REFERENCES `scholarmesh`.`paper` (`ppr_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `scholarmesh` ;

-- -----------------------------------------------------
-- procedure delete_for_matching_user_id
-- -----------------------------------------------------

USE `scholarmesh`;
DROP procedure IF EXISTS `scholarmesh`.`delete_for_matching_user_id`;

DELIMITER $$
USE `scholarmesh`$$
CREATE PROCEDURE `delete_for_matching_user_id`(IN t VARCHAR(45), IN id INT)
BEGIN
  SET @sql = CONCAT('DELETE FROM ', t, 'WHERE user_id = ', id);
  PREPARE delete_statement FROM @sql;
  EXECUTE delete_statement;
END$$

DELIMITER ;
USE `scholarmesh`;

DELIMITER $$

USE `scholarmesh`$$
DROP TRIGGER IF EXISTS `scholarmesh`.`user_AFTER_DELETE` $$
USE `scholarmesh`$$
CREATE DEFINER = CURRENT_USER TRIGGER `scholarmesh`.`user_AFTER_DELETE` AFTER DELETE ON `user` FOR EACH ROW
BEGIN
  CALL delete_for_matching_user_id('affiliation', OLD.user_id);
  CALL delete_for_matching_user_id('attends', OLD.user_id);
  CALL delete_for_matching_user_id('author', OLD.user_id);
  CALL delete_for_matching_user_id('bookmark', OLD.user_id);
  CALL delete_for_matching_user_id('comment', OLD.user_id);
  CALL delete_for_matching_user_id('grp_memb', OLD.user_id);
  CALL delete_for_matching_user_id('interest', OLD.user_id);
  CALL delete_for_matching_user_id('likes_cmnt', OLD.user_id);
  CALL delete_for_matching_user_id('likes_post', OLD.user_id);
  CALL delete_for_matching_user_id('notification', OLD.user_id);
  CALL delete_for_matching_user_id('org_admin', OLD.user_id);
  CALL delete_for_matching_user_id('post', OLD.user_id);
  CALL delete_for_matching_user_id('room_memb', OLD.user_id);
  DELETE FROM `group` WHERE admin_id = OLD.user_id;
  DELETE FROM chat_room WHERE admin_id = OLD.user_id;
  DELETE FROM conference WHERE creator_id = OLD.user_id;
  DELETE FROM `follows` WHERE OLD.user_id IN (follower_id, followed_id);
  DELETE FROM message WHERE OLD.user_id IN (sender_id, receiver_id);
  DELETE FROM room_msg WHERE sender_id = OLD.user_id;
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
