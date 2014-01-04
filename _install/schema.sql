/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50615
 Source Host           : localhost
 Source Database       : fw

 Target Server Type    : MySQL
 Target Server Version : 50615
 File Encoding         : utf-8

 Date: 01/03/2014 12:47:12 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `bonuses`
-- ----------------------------
DROP TABLE IF EXISTS `bonuses`;
CREATE TABLE `bonuses` (
  `bonusId` int(11) NOT NULL AUTO_INCREMENT,
  `superstarId` int(11) NOT NULL,
  `matchId` int(11) NOT NULL,
  `bonusTypeId` int(11) NOT NULL,
  PRIMARY KEY (`bonusId`),
  KEY `superstarId_idx` (`superstarId`),
  KEY `matchId_idx` (`matchId`),
  KEY `bonusTypeId_idx` (`bonusTypeId`),
  CONSTRAINT `bonuses_bonusTypeId` FOREIGN KEY (`bonusTypeId`) REFERENCES `bonustypes` (`bonusTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bonuses_matchId` FOREIGN KEY (`matchId`) REFERENCES `matches` (`matchId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bonuses_superstarId` FOREIGN KEY (`superstarId`) REFERENCES `superstars` (`superstarId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bonustypes`
-- ----------------------------
DROP TABLE IF EXISTS `bonustypes`;
CREATE TABLE `bonustypes` (
  `bonusTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `bonusTypeName` varchar(255) NOT NULL,
  `bonusTypeShortName` varchar(255) DEFAULT NULL,
  `bonusTypePoints` int(11) NOT NULL,
  PRIMARY KEY (`bonusTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `championships`
-- ----------------------------
DROP TABLE IF EXISTS `championships`;
CREATE TABLE `championships` (
  `championshipId` int(11) NOT NULL AUTO_INCREMENT,
  `championshipName` varchar(255) NOT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`championshipId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `events`
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `eventId` int(11) NOT NULL AUTO_INCREMENT,
  `superstarId` int(11) NOT NULL,
  `eventTypeId` int(11) NOT NULL,
  `showId` int(11) NOT NULL,
  `matchId` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`eventId`),
  KEY `superstarId_idx` (`superstarId`),
  KEY `evenTypeId_idx` (`eventTypeId`),
  KEY `matchId_idx` (`matchId`),
  KEY `events_showId_idx` (`showId`),
  CONSTRAINT `events_evenTypeId` FOREIGN KEY (`eventTypeId`) REFERENCES `eventtypes` (`eventTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `events_matchId` FOREIGN KEY (`matchId`) REFERENCES `matches` (`matchId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `events_showId` FOREIGN KEY (`showId`) REFERENCES `shows` (`showId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `events_superstarId` FOREIGN KEY (`superstarId`) REFERENCES `superstars` (`superstarId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `eventtypes`
-- ----------------------------
DROP TABLE IF EXISTS `eventtypes`;
CREATE TABLE `eventtypes` (
  `eventTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `eventType` varchar(255) NOT NULL,
  `eventTypeShortName` varchar(255) DEFAULT NULL,
  `eventTypePoints` int(11) NOT NULL,
  PRIMARY KEY (`eventTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `factions`
-- ----------------------------
DROP TABLE IF EXISTS `factions`;
CREATE TABLE `factions` (
  `factionId` int(11) NOT NULL AUTO_INCREMENT,
  `factionName` varchar(255) NOT NULL,
  `factionShortName` varchar(255) DEFAULT NULL,
  `promotionId` int(11) NOT NULL DEFAULT '1',
  `isActive` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`factionId`),
  UNIQUE KEY `factionName_UNIQUE` (`factionName`),
  KEY `factions_promotionId_idx` (`promotionId`),
  CONSTRAINT `factions_promotionId` FOREIGN KEY (`promotionId`) REFERENCES `promotions` (`promotionId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `leagueplayers`
-- ----------------------------
DROP TABLE IF EXISTS `leagueplayers`;
CREATE TABLE `leagueplayers` (
  `leagueId` int(11) NOT NULL,
  `player1` int(11) NOT NULL,
  `player2` int(11) DEFAULT NULL,
  `player3` int(11) DEFAULT NULL,
  `player4` int(11) DEFAULT NULL,
  `player5` int(11) DEFAULT NULL,
  `player6` int(11) DEFAULT NULL,
  `player7` int(11) DEFAULT NULL,
  `player8` int(11) DEFAULT NULL,
  PRIMARY KEY (`leagueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `leagues`
-- ----------------------------
DROP TABLE IF EXISTS `leagues`;
CREATE TABLE `leagues` (
  `leagueId` int(11) NOT NULL AUTO_INCREMENT,
  `season` int(11) NOT NULL,
  `userId` int(11) NOT NULL COMMENT 'league creator/owner',
  `leagueName` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `type` varchar(255) NOT NULL,
  `draftType` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `players` tinyint(1) NOT NULL DEFAULT '1',
  `maxPlayers` tinyint(1) NOT NULL DEFAULT '8',
  PRIMARY KEY (`leagueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `matchdecisions`
-- ----------------------------
DROP TABLE IF EXISTS `matchdecisions`;
CREATE TABLE `matchdecisions` (
  `decisionId` int(11) NOT NULL AUTO_INCREMENT,
  `decisionName` varchar(255) NOT NULL,
  `decisionShortName` varchar(255) DEFAULT NULL,
  `decisionPoints` int(11) NOT NULL,
  PRIMARY KEY (`decisionId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `matches`
-- ----------------------------
DROP TABLE IF EXISTS `matches`;
CREATE TABLE `matches` (
  `matchId` int(11) NOT NULL AUTO_INCREMENT,
  `season` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `showId` int(11) NOT NULL,
  `matchTypeId` int(11) NOT NULL,
  `decisionId` int(11) NOT NULL,
  `isDraw` tinyint(1) NOT NULL DEFAULT '0',
  `isTitleMatch` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`matchId`),
  KEY `showId_idx` (`showId`),
  KEY `matchTypeId_idx` (`matchTypeId`),
  KEY `season_idx` (`season`),
  CONSTRAINT `matches_matchTypeId` FOREIGN KEY (`matchTypeId`) REFERENCES `matchtypes` (`matchTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `matches_season` FOREIGN KEY (`season`) REFERENCES `seasons` (`season`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `matches_showId` FOREIGN KEY (`showId`) REFERENCES `shows` (`showId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `matchstats`
-- ----------------------------
DROP TABLE IF EXISTS `matchstats`;
CREATE TABLE `matchstats` (
  `superstarId` int(11) NOT NULL,
  `matchId` int(11) NOT NULL,
  `match_won` tinyint(1) DEFAULT NULL,
  `match_loss` tinyint(1) DEFAULT NULL,
  `match_draw` tinyint(1) DEFAULT NULL,
  `match_referee` tinyint(1) DEFAULT NULL,
  KEY `matchId_idx` (`matchId`),
  KEY `superstarId_idx` (`superstarId`),
  CONSTRAINT `matchId` FOREIGN KEY (`matchId`) REFERENCES `matches` (`matchId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `superstarId` FOREIGN KEY (`superstarId`) REFERENCES `superstars` (`superstarId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `matchtypes`
-- ----------------------------
DROP TABLE IF EXISTS `matchtypes`;
CREATE TABLE `matchtypes` (
  `matchTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `matchTypeName` varchar(255) NOT NULL,
  `matchTypeShortName` varchar(255) DEFAULT NULL,
  `matchTypePoints` int(11) NOT NULL,
  PRIMARY KEY (`matchTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `promotions`
-- ----------------------------
DROP TABLE IF EXISTS `promotions`;
CREATE TABLE `promotions` (
  `promotionId` int(11) NOT NULL AUTO_INCREMENT,
  `promotionName` varchar(255) DEFAULT NULL,
  `promotionShortName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`promotionId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `seasons`
-- ----------------------------
DROP TABLE IF EXISTS `seasons`;
CREATE TABLE `seasons` (
  `season` int(11) NOT NULL DEFAULT '0',
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `promotionId` int(11) NOT NULL,
  PRIMARY KEY (`season`),
  KEY `promotionId_idx` (`promotionId`),
  CONSTRAINT `seasons_promotionId` FOREIGN KEY (`promotionId`) REFERENCES `promotions` (`promotionId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `shows`
-- ----------------------------
DROP TABLE IF EXISTS `shows`;
CREATE TABLE `shows` (
  `showId` int(11) NOT NULL AUTO_INCREMENT,
  `showName` varchar(255) NOT NULL,
  `showShortName` varchar(255) DEFAULT NULL,
  `showColor` varchar(255) DEFAULT NULL,
  `hasRoster` tinyint(1) NOT NULL DEFAULT '0',
  `isPPV` tinyint(1) NOT NULL DEFAULT '0',
  `promotionId` int(11) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`showId`),
  KEY `promotionId_idx` (`promotionId`),
  CONSTRAINT `shows_promotionId` FOREIGN KEY (`promotionId`) REFERENCES `promotions` (`promotionId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `superstars`
-- ----------------------------
DROP TABLE IF EXISTS `superstars`;
CREATE TABLE `superstars` (
  `superstarId` int(11) NOT NULL AUTO_INCREMENT,
  `superstarName` varchar(255) NOT NULL,
  `superstarShortName` varchar(255) DEFAULT NULL,
  `superstarSlug` varchar(255) NOT NULL,
  `tierId` int(11) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `showId` int(11) NOT NULL,
  `factionId` int(11) DEFAULT NULL,
  `championshipId` int(11) DEFAULT NULL,
  `promotionId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`superstarId`),
  UNIQUE KEY `superstarName` (`superstarName`),
  UNIQUE KEY `superstarSlug_UNIQUE` (`superstarSlug`),
  KEY `tierId_idx` (`tierId`),
  KEY `showId_idx` (`showId`),
  KEY `championshipId_idx` (`championshipId`),
  KEY `factionId_idx` (`factionId`),
  KEY `promotionId_idx` (`promotionId`),
  CONSTRAINT `superstars_championshipId` FOREIGN KEY (`championshipId`) REFERENCES `championships` (`championshipId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `superstars_factionId` FOREIGN KEY (`factionId`) REFERENCES `factions` (`factionId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `superstars_promotionId` FOREIGN KEY (`promotionId`) REFERENCES `promotions` (`promotionId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `superstars_showId` FOREIGN KEY (`showId`) REFERENCES `shows` (`showId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `superstars_tierId` FOREIGN KEY (`tierId`) REFERENCES `tiers` (`tierId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tiers`
-- ----------------------------
DROP TABLE IF EXISTS `tiers`;
CREATE TABLE `tiers` (
  `tierId` int(11) NOT NULL AUTO_INCREMENT,
  `tierName` varchar(255) NOT NULL,
  PRIMARY KEY (`tierId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `registerDate` datetime NOT NULL,
  `avatar` text,
  `membership` tinyint(1) NOT NULL DEFAULT '0',
  `session` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Procedure structure for `spGetSeasonsBySuperstarId`
-- ----------------------------
DROP PROCEDURE IF EXISTS `spGetSeasonsBySuperstarId`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetSeasonsBySuperstarId`(IN superstarId INT)
BEGIN
  SELECT DISTINCT season FROM matchstats s INNER JOIN matches m ON m.matchId = s.matchId  WHERE s.superstarId = superstarId;
END
 ;;
delimiter ;

-- ----------------------------
--  Function structure for `GetCurrentSeason`
-- ----------------------------
DROP FUNCTION IF EXISTS `GetCurrentSeason`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetCurrentSeason`() RETURNS int(11)
BEGIN
  #Routine body goes here...
  DECLARE today DATETIME DEFAULT NOW();
  DECLARE season INT DEFAULT 1;

  SET season = (SELECT season FROM seasons WHERE startDate <= today AND endDate >= today LIMIT 1);
  RETURN season;
END
 ;;
delimiter ;

-- ----------------------------
--  Function structure for `GetPointsBySuperstarIdMatchId`
-- ----------------------------
DROP FUNCTION IF EXISTS `GetPointsBySuperstarIdMatchId`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetPointsBySuperstarIdMatchId`(`superstarId` int, `matchId` int) RETURNS int(11)
BEGIN
  DECLARE matchPoints INT DEFAULT 0;
  DECLARE bonusPoints INT DEFAULT 0;
  DECLARE eventPoints INT DEFAULT 0;

  SELECT SUM(t.matchTypePoints) INTO matchPoints
  FROM matchstats s 
  INNER JOIN matches m ON m.matchId = s.matchId
  INNER JOIN matchtypes t ON t.matchTypeId = m.matchTypeId
  WHERE s.match_won = 1 AND s.superstarId = superstarId AND m.matchId = matchId;

  SELECT SUM(t.bonusTypePoints) INTO bonusPoints
  FROM bonuses b
  INNER JOIN matches m ON m.matchId = b.matchId
  INNER JOIN bonustypes t ON t.bonusTypeId = b.bonusTypeId
  WHERE b.superstarId = superstarId AND m.matchId = matchId;

  SELECT SUM(t.eventTypePoints) INTO eventPoints
  FROM `events` e
  INNER JOIN seasons s ON e.date >= s.startDate AND e.date <= s.endDate
  INNER JOIN eventypes t ON t.eventTypeId = e.eventTypeId
  WHERE e.superstarId = superstarId AND e.matchId = matchId;

  SET matchPoints = IF(matchPoints IS NULL, 0, matchPoints);
  SET bonusPoints = IF(bonusPoints IS NULL, 0, bonusPoints);
  SET eventPoints = IF(eventPoints IS NULL, 0, eventPoints);

  RETURN (matchPoints + bonusPoints + eventPoints);
END
 ;;
delimiter ;

-- ----------------------------
--  Function structure for `GetPointsBySuperstarIdSeason`
-- ----------------------------
DROP FUNCTION IF EXISTS `GetPointsBySuperstarIdSeason`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetPointsBySuperstarIdSeason`(`superstarId` int,`season` int) RETURNS int(11)
BEGIN
  DECLARE matchPoints INT DEFAULT 0;
  DECLARE bonusPoints INT DEFAULT 0;
  DECLARE eventPoints INT DEFAULT 0;

  SELECT SUM(t.matchTypePoints) INTO matchPoints
  FROM matchstats s 
  INNER JOIN matches m ON m.matchId = s.matchId
  INNER JOIN matchtypes t ON t.matchTypeId = m.matchTypeId
  WHERE s.match_won = 1 AND s.superstarId = superstarId and m.season = season;

  SELECT SUM(t.bonusTypePoints) INTO bonusPoints
  FROM bonuses b
  INNER JOIN matches m ON m.matchId = b.matchId
  INNER JOIN bonustypes t ON t.bonusTypeId = b.bonusTypeId
  WHERE b.superstarId = superstarId and m.season = season;

  SELECT SUM(t.eventTypePoints) INTO eventPoints
  FROM `events` e
  INNER JOIN seasons s ON e.date >= s.startDate and e.date <= s.endDate
  INNER JOIN eventtypes t ON t.eventTypeId = e.eventTypeId
  WHERE e.superstarId = superstarId and s.season = season;

  SET matchPoints = IF(matchPoints IS NULL, 0, matchPoints);
  SET bonusPoints = IF(bonusPoints IS NULL, 0, bonusPoints);
  SET eventPoints = IF(eventPoints IS NULL, 0, eventPoints);

  RETURN (matchPoints + bonusPoints + eventPoints);
END
 ;;
delimiter ;

-- ----------------------------
--  Function structure for `GetTotalDrawsBySuperstarIdSeason`
-- ----------------------------
DROP FUNCTION IF EXISTS `GetTotalDrawsBySuperstarIdSeason`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetTotalDrawsBySuperstarIdSeason`(`superstarId` int,`season` int) RETURNS int(11)
BEGIN
  DECLARE total INT DEFAULT 0;

  SELECT COUNT(*) INTO total
  FROM matchstats ms 
  LEFT JOIN matches m ON m.matchId = ms.matchId 
  WHERE ms.superstarId = superstarId AND m.season = season AND ms.match_draw = 1;

  RETURN total;
END
 ;;
delimiter ;

-- ----------------------------
--  Function structure for `GetTotalLossesBySuperstarIdSeason`
-- ----------------------------
DROP FUNCTION IF EXISTS `GetTotalLossesBySuperstarIdSeason`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetTotalLossesBySuperstarIdSeason`(`superstarId` int,`season` int) RETURNS int(11)
BEGIN
  #Routine body goes here...
  DECLARE total INT DEFAULT 0;

  SELECT COUNT(*) INTO total
  FROM matchstats ms 
  LEFT JOIN matches m ON m.matchId = ms.matchId 
  WHERE ms.superstarId = superstarId AND m.season = season AND ms.match_loss = 1;

  RETURN total;
END
 ;;
delimiter ;

-- ----------------------------
--  Function structure for `GetTotalWinsBySuperstarIdSeason`
-- ----------------------------
DROP FUNCTION IF EXISTS `GetTotalWinsBySuperstarIdSeason`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetTotalWinsBySuperstarIdSeason`(`superstarId` int,`season` int) RETURNS int(11)
BEGIN
  DECLARE total INT DEFAULT 0;

  SELECT COUNT(*) INTO total
  FROM matchstats ms 
  LEFT JOIN matches m ON m.matchId = ms.matchId 
  WHERE ms.superstarId = superstarId AND m.season = season AND ms.match_won = 1;

  RETURN total;
END
 ;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
