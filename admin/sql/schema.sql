SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `fw` DEFAULT CHARACTER SET utf8 ;
USE `fw` ;

-- -----------------------------------------------------
-- Table `fw`.`bonustypes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fw`.`bonustypes` (
  `bonusTypeId` INT(11) NOT NULL AUTO_INCREMENT ,
  `bonusTypeName` VARCHAR(255) NOT NULL ,
  `bonusTypeShortName` VARCHAR(255) NULL DEFAULT NULL ,
  `bonusTypePoints` INT(11) NOT NULL ,
  PRIMARY KEY (`bonusTypeId`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fw`.`championships`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fw`.`championships` (
  `championshipId` INT(11) NOT NULL AUTO_INCREMENT ,
  `championshipName` VARCHAR(255) NOT NULL ,
  `isActive` TINYINT(1) NULL DEFAULT '1' ,
  PRIMARY KEY (`championshipId`) )
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fw`.`eventtypes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fw`.`eventtypes` (
  `eventTypeId` INT(11) NOT NULL AUTO_INCREMENT ,
  `eventType` VARCHAR(255) NOT NULL ,
  `eventTypeShortName` VARCHAR(255) NULL DEFAULT NULL ,
  `eventTypePoints` INT(11) NOT NULL ,
  PRIMARY KEY (`eventTypeId`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fw`.`promotions`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fw`.`promotions` (
  `promotionId` INT(11) NOT NULL AUTO_INCREMENT ,
  `promotionName` VARCHAR(255) NULL DEFAULT NULL ,
  `promotionShortName` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`promotionId`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fw`.`factions`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fw`.`factions` (
  `factionId` INT(11) NOT NULL AUTO_INCREMENT ,
  `factionName` VARCHAR(255) NOT NULL ,
  `factionShortName` VARCHAR(255) NULL ,
  `promotionId` INT(11) NOT NULL DEFAULT 1 ,
  `isActive` TINYINT(1) NULL DEFAULT 0 ,
  PRIMARY KEY (`factionId`) ,
  CONSTRAINT `factions_promotionId`
    FOREIGN KEY (`promotionId` )
    REFERENCES `fw`.`promotions` (`promotionId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE=InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `factionName_UNIQUE` ON `fw`.`factions` (`factionName` ASC) ;

CREATE INDEX `factions_promotionId_idx` ON `fw`.`factions` (`promotionId` ASC) ;


-- -----------------------------------------------------
-- Table `fw`.`shows`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fw`.`shows` (
  `showId` INT(11) NOT NULL AUTO_INCREMENT ,
  `showName` VARCHAR(255) NOT NULL ,
  `showShortName` VARCHAR(255) NULL DEFAULT NULL ,
  `showColor` VARCHAR(255) NULL DEFAULT NULL ,
  `hasRoster` TINYINT(1) NOT NULL DEFAULT '0' ,
  `isPPV` TINYINT(1) NOT NULL DEFAULT '0' ,
  `promotionId` INT(11) NOT NULL ,
  PRIMARY KEY (`showId`) ,
  CONSTRAINT `shows_promotionId`
    FOREIGN KEY (`promotionId` )
    REFERENCES `fw`.`promotions` (`promotionId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE=InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `promotionId_idx` ON `fw`.`shows` (`promotionId` ASC) ;


-- -----------------------------------------------------
-- Table `fw`.`matchtypes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fw`.`matchtypes` (
  `matchTypeId` INT(11) NOT NULL AUTO_INCREMENT ,
  `matchTypeName` VARCHAR(255) NOT NULL ,
  `matchTypeShortName` VARCHAR(255) NULL DEFAULT NULL ,
  `matchTypePoints` INT(11) NOT NULL ,
  PRIMARY KEY (`matchTypeId`) )
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fw`.`seasons`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fw`.`seasons` (
  `season` INT(11) NOT NULL DEFAULT '0' ,
  `startDate` DATETIME NOT NULL ,
  `endDate` DATETIME NOT NULL ,
  `promotionId` INT(11) NOT NULL ,
  PRIMARY KEY (`season`) ,
  CONSTRAINT `seasons_promotionId`
    FOREIGN KEY (`promotionId` )
    REFERENCES `fw`.`promotions` (`promotionId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE=InnoDB
AUTO_INCREMENT = 2015
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `promotionId_idx` ON `fw`.`seasons` (`promotionId` ASC) ;


-- -----------------------------------------------------
-- Table `fw`.`matches`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fw`.`matches` (
  `matchId` INT(11) NOT NULL AUTO_INCREMENT ,
  `season` INT(11) NOT NULL ,
  `date` DATETIME NOT NULL ,
  `showId` INT(11) NOT NULL ,
  `matchTypeId` INT(11) NOT NULL ,
  PRIMARY KEY (`matchId`) ,
  CONSTRAINT `matches_showId`
    FOREIGN KEY (`showId` )
    REFERENCES `fw`.`shows` (`showId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `matches_matchTypeId`
    FOREIGN KEY (`matchTypeId` )
    REFERENCES `fw`.`matchtypes` (`matchTypeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `matches_season`
    FOREIGN KEY (`season` )
    REFERENCES `fw`.`seasons` (`season` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE=InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `showId_idx` ON `fw`.`matches` (`showId` ASC) ;

CREATE INDEX `matchTypeId_idx` ON `fw`.`matches` (`matchTypeId` ASC) ;

CREATE INDEX `season_idx` ON `fw`.`matches` (`season` ASC) ;


-- -----------------------------------------------------
-- Table `fw`.`tiers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fw`.`tiers` (
  `tierId` INT(11) NOT NULL AUTO_INCREMENT ,
  `tierName` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`tierId`) )
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fw`.`superstars`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fw`.`superstars` (
  `superstarId` INT(11) NOT NULL AUTO_INCREMENT ,
  `superstarName` VARCHAR(255) NOT NULL ,
  `superstarShortName` VARCHAR(255) NULL ,
  `superstarSlug` VARCHAR(255) NOT NULL ,
  `tierId` INT(11) NOT NULL ,
  `isActive` TINYINT(1) NOT NULL DEFAULT '1' ,
  `showId` INT(11) NOT NULL ,
  `factionId` INT(11) NULL DEFAULT NULL ,
  `championshipId` INT(11) NULL DEFAULT NULL ,
  `promotionId` INT(11) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`superstarId`) ,
  CONSTRAINT `superstars_tierId`
    FOREIGN KEY (`tierId` )
    REFERENCES `fw`.`tiers` (`tierId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `superstars_showId`
    FOREIGN KEY (`showId` )
    REFERENCES `fw`.`shows` (`showId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `superstars_championshipId`
    FOREIGN KEY (`championshipId` )
    REFERENCES `fw`.`championships` (`championshipId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `superstars_factionId`
    FOREIGN KEY (`factionId` )
    REFERENCES `fw`.`factions` (`factionId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `superstars_promotionId`
    FOREIGN KEY (`promotionId` )
    REFERENCES `fw`.`promotions` (`promotionId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE=InnoDB
AUTO_INCREMENT = 137
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `superstarName` ON `fw`.`superstars` (`superstarName` ASC) ;

CREATE INDEX `tierId_idx` ON `fw`.`superstars` (`tierId` ASC) ;

CREATE UNIQUE INDEX `superstarSlug_UNIQUE` ON `fw`.`superstars` (`superstarSlug` ASC) ;

CREATE INDEX `showId_idx` ON `fw`.`superstars` (`showId` ASC) ;

CREATE INDEX `championshipId_idx` ON `fw`.`superstars` (`championshipId` ASC) ;

CREATE INDEX `factionId_idx` ON `fw`.`superstars` (`factionId` ASC) ;

CREATE INDEX `promotionId_idx` ON `fw`.`superstars` (`promotionId` ASC) ;


-- -----------------------------------------------------
-- Table `fw`.`bonuses`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fw`.`bonuses` (
  `bonusId` INT(11) NOT NULL AUTO_INCREMENT ,
  `superstarId` INT(11) NOT NULL ,
  `matchId` INT(11) NOT NULL ,
  `bonusTypeId` INT(11) NOT NULL ,
  PRIMARY KEY (`bonusId`) ,
  CONSTRAINT `bonuses_superstarId`
    FOREIGN KEY (`superstarId` )
    REFERENCES `fw`.`superstars` (`superstarId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `bonuses_matchId`
    FOREIGN KEY (`matchId` )
    REFERENCES `fw`.`matches` (`matchId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `bonuses_bonusTypeId`
    FOREIGN KEY (`bonusTypeId` )
    REFERENCES `fw`.`bonustypes` (`bonusTypeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `superstarId_idx` ON `fw`.`bonuses` (`superstarId` ASC) ;

CREATE INDEX `matchId_idx` ON `fw`.`bonuses` (`matchId` ASC) ;

CREATE INDEX `bonusTypeId_idx` ON `fw`.`bonuses` (`bonusTypeId` ASC) ;


-- -----------------------------------------------------
-- Table `fw`.`events`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fw`.`events` (
  `eventId` INT(11) NOT NULL AUTO_INCREMENT ,
  `superstarId` INT(11) NOT NULL ,
  `eventTypeId` INT(11) NOT NULL ,
  `showId` INT(11) NOT NULL ,
  `matchId` INT(11) NULL ,
  `date` DATETIME NOT NULL ,
  PRIMARY KEY (`eventId`) ,
  CONSTRAINT `events_superstarId`
    FOREIGN KEY (`superstarId` )
    REFERENCES `fw`.`superstars` (`superstarId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `events_evenTypeId`
    FOREIGN KEY (`eventTypeId` )
    REFERENCES `fw`.`eventtypes` (`eventTypeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `events_matchId`
    FOREIGN KEY (`matchId` )
    REFERENCES `fw`.`matches` (`matchId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `events_showId`
    FOREIGN KEY (`showId` )
    REFERENCES `fw`.`shows` (`showId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `superstarId_idx` ON `fw`.`events` (`superstarId` ASC) ;

CREATE INDEX `evenTypeId_idx` ON `fw`.`events` (`eventTypeId` ASC) ;

CREATE INDEX `matchId_idx` ON `fw`.`events` (`matchId` ASC) ;

CREATE INDEX `events_showId_idx` ON `fw`.`events` (`showId` ASC) ;


-- -----------------------------------------------------
-- Table `fw`.`matchstats`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fw`.`matchstats` (
  `superstarId` INT(11) NOT NULL ,
  `matchId` INT(11) NOT NULL ,
  `matchResolution` ENUM('W', 'L', 'D') NOT NULL ,
  CONSTRAINT `matchId`
    FOREIGN KEY (`matchId` )
    REFERENCES `fw`.`matches` (`matchId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `superstarId`
    FOREIGN KEY (`superstarId` )
    REFERENCES `fw`.`superstars` (`superstarId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `matchId_idx` ON `fw`.`matchstats` (`matchId` ASC) ;

CREATE INDEX `superstarId_idx` ON `fw`.`matchstats` (`superstarId` ASC) ;

USE `fw` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `fw`.`bonustypes`
-- -----------------------------------------------------
START TRANSACTION;
USE `fw`;
INSERT INTO `fw`.`bonustypes` (`bonusTypeId`, `bonusTypeName`, `bonusTypeShortName`, `bonusTypePoints`) VALUES (1, 'Pay-Per-View Win', 'PPV Win', 4);
INSERT INTO `fw`.`bonustypes` (`bonusTypeId`, `bonusTypeName`, `bonusTypeShortName`, `bonusTypePoints`) VALUES (2, 'Foreign Object Use', 'Foreign Object', 3);
INSERT INTO `fw`.`bonustypes` (`bonusTypeId`, `bonusTypeName`, `bonusTypeShortName`, `bonusTypePoints`) VALUES (3, 'Championship Win', 'Championship Win', 5);

COMMIT;

-- -----------------------------------------------------
-- Data for table `fw`.`championships`
-- -----------------------------------------------------
START TRANSACTION;
USE `fw`;
INSERT INTO `fw`.`championships` (`championshipId`, `championshipName`, `isActive`) VALUES (1, 'WWE Champion', 1);
INSERT INTO `fw`.`championships` (`championshipId`, `championshipName`, `isActive`) VALUES (2, 'World Heavyweight Champion', 1);
INSERT INTO `fw`.`championships` (`championshipId`, `championshipName`, `isActive`) VALUES (3, 'Intercontinental Champion', 1);
INSERT INTO `fw`.`championships` (`championshipId`, `championshipName`, `isActive`) VALUES (4, 'United States Champion', 1);
INSERT INTO `fw`.`championships` (`championshipId`, `championshipName`, `isActive`) VALUES (5, 'Divas Champion', 1);
INSERT INTO `fw`.`championships` (`championshipId`, `championshipName`, `isActive`) VALUES (6, 'Tag Team Champion', 1);
INSERT INTO `fw`.`championships` (`championshipId`, `championshipName`, `isActive`) VALUES (7, 'Cruiserweight Champion', 0);
INSERT INTO `fw`.`championships` (`championshipId`, `championshipName`, `isActive`) VALUES (8, 'Hardcore Champion', 0);
INSERT INTO `fw`.`championships` (`championshipId`, `championshipName`, `isActive`) VALUES (9, 'European Champion', 0);
INSERT INTO `fw`.`championships` (`championshipId`, `championshipName`, `isActive`) VALUES (10, 'Women\'s Champion', 0);

COMMIT;

-- -----------------------------------------------------
-- Data for table `fw`.`eventtypes`
-- -----------------------------------------------------
START TRANSACTION;
USE `fw`;
INSERT INTO `fw`.`eventtypes` (`eventTypeId`, `eventType`, `eventTypeShortName`, `eventTypePoints`) VALUES (1, 'Match Interference', 'Interference', 2);
INSERT INTO `fw`.`eventtypes` (`eventTypeId`, `eventType`, `eventTypeShortName`, `eventTypePoints`) VALUES (2, 'Interview', 'Interview', 2);
INSERT INTO `fw`.`eventtypes` (`eventTypeId`, `eventType`, `eventTypeShortName`, `eventTypePoints`) VALUES (3, 'Promo', 'Promo', 2);

COMMIT;

-- -----------------------------------------------------
-- Data for table `fw`.`promotions`
-- -----------------------------------------------------
START TRANSACTION;
USE `fw`;
INSERT INTO `fw`.`promotions` (`promotionId`, `promotionName`, `promotionShortName`) VALUES (1, 'World Wrestling Entertainment', 'WWE');
INSERT INTO `fw`.`promotions` (`promotionId`, `promotionName`, `promotionShortName`) VALUES (2, 'Total Nonstop Action', 'TNA');

COMMIT;

-- -----------------------------------------------------
-- Data for table `fw`.`factions`
-- -----------------------------------------------------
START TRANSACTION;
USE `fw`;
INSERT INTO `fw`.`factions` (`factionId`, `factionName`, `factionShortName`, `promotionId`, `isActive`) VALUES (1, 'The Shield', 'The Shield', 1, 1);
INSERT INTO `fw`.`factions` (`factionId`, `factionName`, `factionShortName`, `promotionId`, `isActive`) VALUES (2, 'The Real Americans', 'The Real Americans', 1, 1);
INSERT INTO `fw`.`factions` (`factionId`, `factionName`, `factionShortName`, `promotionId`, `isActive`) VALUES (3, 'The Usos', 'The Usos', 1, 1);
INSERT INTO `fw`.`factions` (`factionId`, `factionName`, `factionShortName`, `promotionId`, `isActive`) VALUES (4, 'Prime Time Players', 'PTP', 1, 1);
INSERT INTO `fw`.`factions` (`factionId`, `factionName`, `factionShortName`, `promotionId`, `isActive`) VALUES (5, 'The Wyatt Family', 'Wyatt Family', 1, 1);
INSERT INTO `fw`.`factions` (`factionId`, `factionName`, `factionShortName`, `promotionId`, `isActive`) VALUES (6, 'Los Matadors', 'Los Matadors', 1, 1);
INSERT INTO `fw`.`factions` (`factionId`, `factionName`, `factionShortName`, `promotionId`, `isActive`) VALUES (7, 'Three Man Band', '3MB', 1, 1);
INSERT INTO `fw`.`factions` (`factionId`, `factionName`, `factionShortName`, `promotionId`, `isActive`) VALUES (8, 'Tons of Funk', 'ToF', 1, 1);
INSERT INTO `fw`.`factions` (`factionId`, `factionName`, `factionShortName`, `promotionId`, `isActive`) VALUES (9, 'The Funkadactyls', 'The Funkadactyls', 1, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `fw`.`shows`
-- -----------------------------------------------------
START TRANSACTION;
USE `fw`;
INSERT INTO `fw`.`shows` (`showId`, `showName`, `showShortName`, `showColor`, `hasRoster`, `isPPV`, `promotionId`) VALUES (1, 'Monday Night Raw', 'RAW', '#e3272a', 1, 0, 1);
INSERT INTO `fw`.`shows` (`showId`, `showName`, `showShortName`, `showColor`, `hasRoster`, `isPPV`, `promotionId`) VALUES (2, 'Friday Night Smackdown', 'Smackdown', '#2f68dd', 1, 0, 1);
INSERT INTO `fw`.`shows` (`showId`, `showName`, `showShortName`, `showColor`, `hasRoster`, `isPPV`, `promotionId`) VALUES (3, 'NXT', 'NXT', '#e98412', 1, 0, 1);
INSERT INTO `fw`.`shows` (`showId`, `showName`, `showShortName`, `showColor`, `hasRoster`, `isPPV`, `promotionId`) VALUES (4, 'Main Event', 'Main Event', '', 0, 0, 1);
INSERT INTO `fw`.`shows` (`showId`, `showName`, `showShortName`, `showColor`, `hasRoster`, `isPPV`, `promotionId`) VALUES (5, 'Total Divas', 'Total Divas', '', 0, 0, 1);
INSERT INTO `fw`.`shows` (`showId`, `showName`, `showShortName`, `showColor`, `hasRoster`, `isPPV`, `promotionId`) VALUES (6, 'WWE Superstars', 'Superstars', '', 0, 0, 1);
INSERT INTO `fw`.`shows` (`showId`, `showName`, `showShortName`, `showColor`, `hasRoster`, `isPPV`, `promotionId`) VALUES (7, 'WWE Battlegound', 'Battleground', '', 0, 1, 1);
INSERT INTO `fw`.`shows` (`showId`, `showName`, `showShortName`, `showColor`, `hasRoster`, `isPPV`, `promotionId`) VALUES (8, 'WWE Hell in a Cell', 'HiaC', '', 0, 1, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `fw`.`matchtypes`
-- -----------------------------------------------------
START TRANSACTION;
USE `fw`;
INSERT INTO `fw`.`matchtypes` (`matchTypeId`, `matchTypeName`, `matchTypeShortName`, `matchTypePoints`) VALUES (1, 'Singles', 'Singles', 1);
INSERT INTO `fw`.`matchtypes` (`matchTypeId`, `matchTypeName`, `matchTypeShortName`, `matchTypePoints`) VALUES (2, 'Tag Team', 'Tag', 2);
INSERT INTO `fw`.`matchtypes` (`matchTypeId`, `matchTypeName`, `matchTypeShortName`, `matchTypePoints`) VALUES (3, 'Triple Threat ', 'Triple Threat', 3);
INSERT INTO `fw`.`matchtypes` (`matchTypeId`, `matchTypeName`, `matchTypeShortName`, `matchTypePoints`) VALUES (4, 'Fatal Four Way', 'Fatal 4 Way', 4);
INSERT INTO `fw`.`matchtypes` (`matchTypeId`, `matchTypeName`, `matchTypeShortName`, `matchTypePoints`) VALUES (5, 'Battle Royal', 'Battle Royal', 5);
INSERT INTO `fw`.`matchtypes` (`matchTypeId`, `matchTypeName`, `matchTypeShortName`, `matchTypePoints`) VALUES (6, 'Royal Rumble', 'Royal Rumble', 10);
INSERT INTO `fw`.`matchtypes` (`matchTypeId`, `matchTypeName`, `matchTypeShortName`, `matchTypePoints`) VALUES (7, 'Elimination Chamber', 'Elimination Chamber', 10);

COMMIT;

-- -----------------------------------------------------
-- Data for table `fw`.`seasons`
-- -----------------------------------------------------
START TRANSACTION;
USE `fw`;
INSERT INTO `fw`.`seasons` (`season`, `startDate`, `endDate`, `promotionId`) VALUES (2013, '2013-08-09 00:00:01', '2014-04-07 00:00:01', 1);
INSERT INTO `fw`.`seasons` (`season`, `startDate`, `endDate`, `promotionId`) VALUES (2014, '2014-08-07 00:00:01', '2015-04-08 00:00:01', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `fw`.`matches`
-- -----------------------------------------------------
START TRANSACTION;
USE `fw`;
INSERT INTO `fw`.`matches` (`matchId`, `season`, `date`, `showId`, `matchTypeId`) VALUES (1, 2013, '2013-10-11 07:31:31', 1, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `fw`.`tiers`
-- -----------------------------------------------------
START TRANSACTION;
USE `fw`;
INSERT INTO `fw`.`tiers` (`tierId`, `tierName`) VALUES (1, 'Undercard');
INSERT INTO `fw`.`tiers` (`tierId`, `tierName`) VALUES (2, 'Midcard');
INSERT INTO `fw`.`tiers` (`tierId`, `tierName`) VALUES (3, 'Main Event');
INSERT INTO `fw`.`tiers` (`tierId`, `tierName`) VALUES (4, 'Referee');
INSERT INTO `fw`.`tiers` (`tierId`, `tierName`) VALUES (5, 'Announcer');
INSERT INTO `fw`.`tiers` (`tierId`, `tierName`) VALUES (6, 'Commentator');
INSERT INTO `fw`.`tiers` (`tierId`, `tierName`) VALUES (7, 'Diva');
INSERT INTO `fw`.`tiers` (`tierId`, `tierName`) VALUES (8, 'Manager');
INSERT INTO `fw`.`tiers` (`tierId`, `tierName`) VALUES (9, 'Corporate');
INSERT INTO `fw`.`tiers` (`tierId`, `tierName`) VALUES (10, 'Reporter');
INSERT INTO `fw`.`tiers` (`tierId`, `tierName`) VALUES (11, 'Developmental');
INSERT INTO `fw`.`tiers` (`tierId`, `tierName`) VALUES (12, 'General Manager');

COMMIT;

-- -----------------------------------------------------
-- Data for table `fw`.`superstars`
-- -----------------------------------------------------
START TRANSACTION;
USE `fw`;
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (1, 'Alex Riley', 'Alex Riley', 'alexriley', 6, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (2, 'Antonio Cesaro', 'Antonio Cesaro', 'antoniocesaro', 1, 1, 1, 2, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (3, 'Big E Langston', 'Big E Langston', 'big-e-langston', 1, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (4, 'Brad Maddox', 'Brad Maddox', 'brad-maddox', 12, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (5, 'Bray Wyatt', 'Bray Wyatt', 'braywyatt', 1, 1, 1, 5, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (6, 'Brie Bella', 'Brie Bella', 'briebella', 7, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (7, 'Brock Lesnar', 'Brock Lesnar', 'brock-lesnar', 1, 0, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (8, 'Brodus Clay', 'Brodus Clay', 'brodusclay', 1, 1, 1, 8, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (9, 'Cameron', 'Cameron', 'cameron', 7, 1, 1, 9, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (10, 'CM Punk', 'CM Punk', 'cmpunk', 3, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (11, 'Curtis Axel', 'Curtis Axel', 'curtisaxel', 1, 1, 1, NULL, 3, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (12, 'Daniel Bryan', 'Daniel Bryan', 'danielbryan', 3, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (13, 'David Otunga', 'David Otunga', 'davidotunga', 1, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (14, 'Dean Ambrose', 'Dean Ambrose', 'dean-ambrose', 1, 1, 1, 1, 4, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (15, 'Diego', 'Diego', 'diego', 1, 1, 1, 6, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (16, 'Dolph Ziggler', 'Dolph Ziggler', 'dolphziggler', 1, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (17, 'Dwayne \"The Rock\" Johnson', 'The Rock', 'therock', 3, 0, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (18, 'El Torito', 'El Torito', 'el-torito', 1, 1, 1, 6, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (19, 'Epico', 'Epico', 'epico', 1, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (20, 'Erick Rowan', 'Erick Rowan', 'erickrowan', 1, 1, 1, 5, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (21, 'Evan Bourne', 'Evan Bourne', 'evanbourne', 1, 0, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (22, 'Fandango', 'Fandango', 'fandango', 1, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (23, 'Fernando', 'Fernando', 'fernando', 1, 1, 1, 6, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (24, 'Jack Swagger', 'Jack Swagger', 'jackswagger', 1, 1, 1, 2, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (25, 'Jerry Lawler', 'Jerry Lawler', 'jerrylawler', 6, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (26, 'John Cena', 'John Cena', 'johncena', 1, 0, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (27, 'JTG', 'JTG', 'jtg', 1, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (28, 'Justin Roberts', 'Justin Roberts', 'justinroberts', 5, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (29, 'Kane', 'Kane', 'kane', 1, 0, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (30, 'Kofi Kingston', 'Kofi Kingston', 'kofikingston', 1, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (31, 'Luke Harper', 'Luke Harper', 'lukeharper', 1, 1, 1, 5, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (32, 'Michael Cole', 'Michael Cole', 'michaelcole', 6, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (33, 'The Miz', 'The Miz', 'themiz', 1, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (34, 'Mr. McMahon', 'Mr. McMahon', 'mrmcmahon', 9, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (35, 'Naomi', 'Naomi', 'naomi', 7, 1, 1, 9, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (36, 'Nikki Bella', 'Nikki Bella', 'nikkibella', 7, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (37, 'Paul Heyman', 'Paul Heyman', 'paulheyman', 8, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (38, 'Primo', 'Primo', 'primo', 1, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (39, 'R-Truth', 'R-Truth', 'rtruth', 1, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (40, 'Randy Orton', 'Randy Orton', 'randyorton', 3, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (41, 'Rey Mysterio', 'Rey Mysterio', 'reymysterio', 1, 0, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (42, 'Ricardo Rodriguez', 'Ricardo Rodriguez', 'ricardorodriguez', 5, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (43, 'Roman Reigns', 'Roman Reigns', 'roman-reigns', 1, 1, 1, 1, 6, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (44, 'Ryback', 'Ryback', 'ryback', 3, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (45, 'Santino Marella', 'Santino Marella', 'santinomarella', 1, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (46, 'Scott Stanford', 'Scott Stanford', 'scottstanford', 6, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (47, 'Seth Rollins', 'Seth Rollins', 'seth-rollins', 1, 1, 1, 1, 6, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (48, 'Stephanie McMahon', 'Stephanie McMahon', 'stephaniemcmahon', 9, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (49, 'Summer Rae', 'Summer Rae', 'summer-rae', 7, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (50, 'Tamina Snuka', 'Tamina Snuka', 'tamina-snuka', 7, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (51, 'Tensai', 'Tensai', 'tensai', 1, 1, 1, 8, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (52, 'Triple H', 'Triple H', 'tripleh', 1, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (54, 'Zack Ryder', 'Zack Ryder', 'zackryder', 1, 1, 1, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (55, 'Zeb Colter', 'Zeb Colter', 'zeb-colter', 8, 1, 1, 2, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (56, 'AJ Lee', 'AJ Lee', 'aj', 7, 1, 2, NULL, 5, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (57, 'Aksana', 'Aksana', 'aksana', 7, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (58, 'Alberto Del Rio', 'Alberto Del Rio', 'albertodelrio', 3, 1, 2, NULL, 2, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (59, 'Alicia Fox', 'Alicia Fox', 'aliciafox', 7, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (60, 'Big Show', 'Big Show', 'bigshow', 1, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (61, 'Booker T', 'Booker T', 'bookert', 1, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (62, 'Camacho', 'Camacho', 'camacho', 1, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (63, 'Christian', 'Christian', 'christian', 1, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (64, 'Curt Hawkins', 'Curt Hawkins', 'curthawkins', 1, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (65, 'Damien Sandow', 'Damien Sandow', 'damien-sandow', 1, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (66, 'Darren Young', 'Darren Young', 'darrenyoung', 1, 1, 2, 4, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (67, 'Drew McIntyre', 'Drew McIntyre', 'drewmcintyre', 1, 1, 2, 7, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (68, 'Ezekiel Jackson', 'Ezekiel Jackson', 'ezekieljackson', 1, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (69, 'The Great Khali', 'The Great Khali', 'thegreatkhali', 1, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (70, 'Heath Slater', 'Heath Slater', 'heathslater', 1, 1, 2, 7, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (71, 'Hornswoggle', 'Hornswoggle', 'hornswoggle', 1, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (72, 'Hunico', 'Hunico', 'hunico', 1, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (73, 'JBL', 'JBL', 'jbl', 6, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (74, 'Jey Uso', 'Jey Uso', 'jeyuso', 1, 1, 2, 3, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (75, 'Jimmy Uso', 'Jimmy Uso', 'jimmyuso', 1, 1, 2, 3, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (76, 'Jinder Mahal', 'Jinder Mahal', 'jindermahal', 1, 1, 2, 7, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (77, 'Josh Mathews', 'Josh Mathews', 'joshmathews', 6, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (78, 'Justin Gabriel', 'Justin Gabriel', 'justingabriel', 1, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (79, 'Kaitlyn', 'Kaitlyn', 'kaitlyn', 7, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (80, 'Layla', 'Layla', 'layla', 7, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (81, 'Lilian Garcia', 'Lilian Garcia', 'liliangarcia', 5, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (82, 'Mark Henry', 'Mark Henry', 'markhenry', 1, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (83, 'Natalya', 'Natalya', 'natalya', 7, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (84, 'Renee Young', 'Renee Young', 'renee-young', 10, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (85, 'Rosa Mendes', 'Rosa Mendes', 'rosamendes', 7, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (86, 'Sheamus', 'Sheamus', 'sheamus', 1, 0, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (87, 'Sin Cara', 'Sin Cara', 'sin-cara', 1, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (88, 'Theodore Long', 'Theodore Long', 'theodorelong', 1, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (89, 'Titus O\'Neil', 'Titus O\'Neil', 'titusoneil', 1, 1, 2, 4, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (90, 'Tony Chimel', 'Tony Chimel', 'tonychimel', 5, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (91, 'Tyson Kidd', 'Tyson Kidd', 'tysonkidd', 1, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (92, 'Undertaker', 'Undertaker', 'undertaker', 1, 0, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (93, 'Vickie Guerrero', 'Vickie Guerrero', 'vickieguerrero', 12, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (94, 'Wade Barrett', 'Wade Barrett', 'wadebarrett', 1, 0, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (95, 'William Regal', 'William Regal', 'williamregal', 1, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (96, 'Yoshi Tatsu', 'Yoshi Tatsu', 'yoshitatsu', 1, 1, 2, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (97, 'Adrian Neville', 'Adrian Neville', 'adrianneville', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (98, 'Aiden English', 'Aiden English', 'aidenenglish', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (99, 'Alexa Bliss', 'Alexa Bliss', 'alexabliss', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (100, 'Alexander Rusev', 'Alexander Rusev', 'alexanderrusev', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (101, 'Angelo Dawkins', 'Angelo Dawkins', 'angelodawkins', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (102, 'Baron Corbin', 'Baron Corbin', 'baroncorbin', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (103, 'Bayley', 'Bayley', 'bayley', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (104, 'Bo Dallas', 'Bo Dallas', 'bo-dallas', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (105, 'Byron Saxton', 'Byron Saxton', 'byronsaxton', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (106, 'Charlotte', 'Charlotte', 'charlotte', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (107, 'CJ Parker', 'CJ Parker', 'cjparker', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (108, 'Colin Cassady', 'Colin Cassady', 'colincassady', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (109, 'Conor O\'Brian', 'Conor O\'Brian', 'conorobrian', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (110, 'Corey Graves', 'Corey Graves', 'coreygraves', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (111, 'Danny Burch', 'Danny Burch', 'dannyburch', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (112, 'Emma', 'Emma', 'emma', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (113, 'Enzo Amore', 'Enzo Amore', 'enzoamore', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (114, 'Jason Jordan', 'Jason Jordan', 'jasonjordan', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (115, 'Judas Devlin', 'Judas Devlin', 'judasdevlin', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (116, 'Kassius Ohno', 'Kassius Ohno', 'kassiusohno', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (117, 'Kendall Skye', 'Kendall Skye', 'kendallskye', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (118, 'Knuckles Madsen', 'Knuckles Madsen', 'knucklesmadsen', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (119, 'Leo Kruger', 'Leo Kruger', 'leokruger', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (120, 'Mason Ryan', 'Mason Ryan', 'masonryan', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (121, 'Mickey Keegan', 'Mickey Keegan', 'axlkeegan', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (122, 'Mojo Rawley', 'Mojo Rawley', 'mojorawley', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (123, 'Oliver Grey', 'Oliver Grey', 'olivergrey', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (124, 'Paige', 'Paige', 'paige', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (125, 'Rick Victor', 'Rick Victor', 'rickvictor', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (126, 'Sami Zayn', 'Sami Zayn', 'samizayn', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (127, 'Sasha Banks', 'Sasha Banks', 'sashabanks', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (128, 'Sawyer Fulton', 'Sawyer Fulton', 'sawyerfulton', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (129, 'Scott Dawson', 'Scott Dawson', 'scottdawson', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (130, 'Sylvester Lefort', 'Sylvester Lefort', 'sylvesterlefort', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (131, 'Tom Phillips', 'Tom Phillips', 'tomphillips', 6, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (132, 'Travis Tyler', 'Travis Tyler', 'travistyler', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (133, 'Troy McClain', 'Troy McClain', 'troymcclain', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (134, 'Tyler Breeze', 'Tyler Breeze', 'tylerbreeze', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (135, 'Xavier Woods', 'Xavier Woods', 'xavierwoods', 11, 1, 3, NULL, NULL, 1);
INSERT INTO `fw`.`superstars` (`superstarId`, `superstarName`, `superstarShortName`, `superstarSlug`, `tierId`, `isActive`, `showId`, `factionId`, `championshipId`, `promotionId`) VALUES (136, 'Rob Van Dam', 'RVD', 'robvandam', 3, 1, 1, NULL, NULL, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `fw`.`bonuses`
-- -----------------------------------------------------
START TRANSACTION;
USE `fw`;
INSERT INTO `fw`.`bonuses` (`bonusId`, `superstarId`, `matchId`, `bonusTypeId`) VALUES (1, 66, 1, 2);

COMMIT;

-- -----------------------------------------------------
-- Data for table `fw`.`events`
-- -----------------------------------------------------
START TRANSACTION;
USE `fw`;
INSERT INTO `fw`.`events` (`eventId`, `superstarId`, `eventTypeId`, `showId`, `matchId`, `date`) VALUES (1, 34, 2, 1, NULL, '2013-10-11 07:35:35');

COMMIT;

-- -----------------------------------------------------
-- Data for table `fw`.`matchstats`
-- -----------------------------------------------------
START TRANSACTION;
USE `fw`;
INSERT INTO `fw`.`matchstats` (`superstarId`, `matchId`, `matchResolution`) VALUES (65, 1, 'W');
INSERT INTO `fw`.`matchstats` (`superstarId`, `matchId`, `matchResolution`) VALUES (66, 1, 'L');

COMMIT;
