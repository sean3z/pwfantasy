/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : fw

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2014-01-26 07:52:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bonuses`
-- ----------------------------
DROP TABLE IF EXISTS `bonuses`;
CREATE TABLE `bonuses` (
  `bonusId` int(11) NOT NULL AUTO_INCREMENT,
  `superstarId` int(11) NOT NULL,
  `season` int(11) NOT NULL,
  `matchId` int(11) NOT NULL,
  `bonusTypeId` int(11) NOT NULL,
  PRIMARY KEY (`bonusId`),
  KEY `superstarId_idx` (`superstarId`),
  KEY `matchId_idx` (`matchId`),
  KEY `bonusTypeId_idx` (`bonusTypeId`),
  KEY `bonuses_season_idx` (`season`),
  CONSTRAINT `bonuses_bonusTypeId` FOREIGN KEY (`bonusTypeId`) REFERENCES `bonustypes` (`bonusTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bonuses_matchId` FOREIGN KEY (`matchId`) REFERENCES `matches` (`matchId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bonuses_superstarId` FOREIGN KEY (`superstarId`) REFERENCES `superstars` (`superstarId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bonuses_season` FOREIGN KEY (`season`) REFERENCES `seasons` (`season`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bonuses
-- ----------------------------

-- ----------------------------
-- Table structure for `bonustypes`
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
-- Records of bonustypes
-- ----------------------------

-- ----------------------------
-- Table structure for `championships`
-- ----------------------------
DROP TABLE IF EXISTS `championships`;
CREATE TABLE `championships` (
  `championshipId` int(11) NOT NULL AUTO_INCREMENT,
  `championshipName` varchar(255) NOT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`championshipId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of championships
-- ----------------------------

-- ----------------------------
-- Table structure for `events`
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `eventId` int(11) NOT NULL AUTO_INCREMENT,
  `superstarId` int(11) NOT NULL,
  `season` int(11) NOT NULL,
  `eventTypeId` int(11) NOT NULL,
  `showId` int(11) NOT NULL,
  `matchId` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`eventId`),
  KEY `superstarId_idx` (`superstarId`),
  KEY `evenTypeId_idx` (`eventTypeId`),
  KEY `matchId_idx` (`matchId`),
  KEY `events_showId_idx` (`showId`),
  KEY `events_season_idx` (`season`),
  CONSTRAINT `events_evenTypeId` FOREIGN KEY (`eventTypeId`) REFERENCES `eventtypes` (`eventTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `events_matchId` FOREIGN KEY (`matchId`) REFERENCES `matches` (`matchId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `events_showId` FOREIGN KEY (`showId`) REFERENCES `shows` (`showId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `events_superstarId` FOREIGN KEY (`superstarId`) REFERENCES `superstars` (`superstarId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `events_season` FOREIGN KEY (`season`) REFERENCES `seasons` (`season`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of events
-- ----------------------------

-- ----------------------------
-- Table structure for `eventtypes`
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
-- Records of eventtypes
-- ----------------------------

-- ----------------------------
-- Table structure for `factions`
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
-- Records of factions
-- ----------------------------

-- ----------------------------
-- Table structure for `leagueplayers`
-- ----------------------------
DROP TABLE IF EXISTS `leagueplayers`;
CREATE TABLE `leagueplayers` (
  `leagueId` int(11) NOT NULL,
  `season` int(11) NOT NULL,
  `player1` int(11) NOT NULL,
  `player2` int(11) DEFAULT NULL,
  `player3` int(11) DEFAULT NULL,
  `player4` int(11) DEFAULT NULL,
  `player5` int(11) DEFAULT NULL,
  `player6` int(11) DEFAULT NULL,
  `player7` int(11) DEFAULT NULL,
  `player8` int(11) DEFAULT NULL,
  PRIMARY KEY (`leagueId`),
  KEY `leagueplayers_userId1_idx` (`player1`),
  KEY `leagueplayers_userId2_idx` (`player2`),
  KEY `leagueplayers_userId3_idx` (`player3`),
  KEY `leagueplayers_userId4_idx` (`player4`),
  KEY `leagueplayers_userId5_idx` (`player5`),
  KEY `leagueplayers_userId6_idx` (`player6`),
  KEY `leagueplayers_userId7_idx` (`player7`),
  KEY `leagueplayers_userId8_idx` (`player8`),
  KEY `leagueplayers_season_idx` (`season`),
  CONSTRAINT `leagueplayers_leagueId` FOREIGN KEY (`leagueId`) REFERENCES `leagues` (`leagueId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `leagueplayers_userId1` FOREIGN KEY (`player1`) REFERENCES `users` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `leagueplayers_userId2` FOREIGN KEY (`player2`) REFERENCES `users` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `leagueplayers_userId3` FOREIGN KEY (`player3`) REFERENCES `users` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `leagueplayers_userId4` FOREIGN KEY (`player4`) REFERENCES `users` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `leagueplayers_userId5` FOREIGN KEY (`player5`) REFERENCES `users` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `leagueplayers_userId6` FOREIGN KEY (`player6`) REFERENCES `users` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `leagueplayers_userId7` FOREIGN KEY (`player7`) REFERENCES `users` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `leagueplayers_userId8` FOREIGN KEY (`player8`) REFERENCES `users` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `leagueplayers_season` FOREIGN KEY (`season`) REFERENCES `seasons` (`season`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of leagueplayers
-- ----------------------------

-- ----------------------------
-- Table structure for `leagues`
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
  PRIMARY KEY (`leagueId`),
  KEY `leagues_season_idx` (`season`),
  CONSTRAINT `leagues_season` FOREIGN KEY (`season`) REFERENCES `seasons` (`season`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of leagues
-- ----------------------------

-- ----------------------------
-- Table structure for `leaguesuperstars`
-- ----------------------------
DROP TABLE IF EXISTS `leaguesuperstars`;
CREATE TABLE `leaguesuperstars` (
  `leagueId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `mainevent` int(11) DEFAULT NULL,
  `midcard1` int(11) DEFAULT NULL,
  `midcard2` int(11) DEFAULT NULL,
  `undercard` int(11) DEFAULT NULL,
  `flex` int(11) DEFAULT NULL,
  `diva` int(11) DEFAULT NULL,
  `locker1` int(11) DEFAULT NULL,
  `locker2` int(11) DEFAULT NULL,
  `locker3` int(11) DEFAULT NULL,
  PRIMARY KEY (`leagueId`,`userId`),
  KEY `leaguesuperstars_userId_idx` (`userId`),
  KEY `leaguesuperstars_mainEvent_idx` (`mainevent`),
  KEY `leaguesuperstars_midcard1_idx` (`midcard1`),
  KEY `leaguesuperstars_midcard2_idx` (`midcard2`),
  KEY `leaguesuperstars_undercard_idx` (`undercard`),
  KEY `leaguesuperstars_flex_idx` (`flex`),
  KEY `leaguesuperstars_diva_idx` (`diva`),
  KEY `leaguesuperstars_locker1_idx` (`locker1`),
  KEY `leaguesuperstars_locker2_idx` (`locker2`),
  KEY `leaguesuperstars_locker3_idx` (`locker3`),
  CONSTRAINT `leaguesuperstars_leagueId` FOREIGN KEY (`leagueId`) REFERENCES `leagues` (`leagueId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `leaguesuperstars_userId` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `leaguesuperstars_mainevent` FOREIGN KEY (`mainevent`) REFERENCES `superstars` (`superstarId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `leaguesuperstars_midcard1` FOREIGN KEY (`midcard1`) REFERENCES `superstars` (`superstarId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `leaguesuperstars_midcard2` FOREIGN KEY (`midcard2`) REFERENCES `superstars` (`superstarId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `leaguesuperstars_undercard` FOREIGN KEY (`undercard`) REFERENCES `superstars` (`superstarId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `leaguesuperstars_flex` FOREIGN KEY (`flex`) REFERENCES `superstars` (`superstarId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `leaguesuperstars_diva` FOREIGN KEY (`diva`) REFERENCES `superstars` (`superstarId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `leaguesuperstars_locker1` FOREIGN KEY (`locker1`) REFERENCES `superstars` (`superstarId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `leaguesuperstars_locker2` FOREIGN KEY (`locker2`) REFERENCES `superstars` (`superstarId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `leaguesuperstars_locker3` FOREIGN KEY (`locker3`) REFERENCES `superstars` (`superstarId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of leaguesuperstars
-- ----------------------------

-- ----------------------------
-- Table structure for `matchdecisions`
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
-- Records of matchdecisions
-- ----------------------------

-- ----------------------------
-- Table structure for `matches`
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
  KEY `matches_decisionId_idx` (`decisionId`),
  CONSTRAINT `matches_matchTypeId` FOREIGN KEY (`matchTypeId`) REFERENCES `matchtypes` (`matchTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `matches_season` FOREIGN KEY (`season`) REFERENCES `seasons` (`season`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `matches_showId` FOREIGN KEY (`showId`) REFERENCES `shows` (`showId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `matches_decisionId` FOREIGN KEY (`decisionId`) REFERENCES `matchdecisions` (`decisionId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of matches
-- ----------------------------

-- ----------------------------
-- Table structure for `matchstats`
-- ----------------------------
DROP TABLE IF EXISTS `matchstats`;
CREATE TABLE `matchstats` (
  `superstarId` int(11) NOT NULL,
  `season` int(11) NOT NULL,
  `matchId` int(11) NOT NULL,
  `match_won` tinyint(1) DEFAULT NULL,
  `match_loss` tinyint(1) DEFAULT NULL,
  `match_draw` tinyint(1) DEFAULT NULL,
  `match_referee` tinyint(1) DEFAULT NULL,
  KEY `matchId_idx` (`matchId`),
  KEY `superstarId_idx` (`superstarId`),
  KEY `matchstats_season_idx` (`season`),
  CONSTRAINT `matchstats_matchId` FOREIGN KEY (`matchId`) REFERENCES `matches` (`matchId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `matchstats_superstarId` FOREIGN KEY (`superstarId`) REFERENCES `superstars` (`superstarId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `matchstats_season` FOREIGN KEY (`season`) REFERENCES `seasons` (`season`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of matchstats
-- ----------------------------

-- ----------------------------
-- Table structure for `matchtypes`
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
-- Records of matchtypes
-- ----------------------------

-- ----------------------------
-- Table structure for `promotions`
-- ----------------------------
DROP TABLE IF EXISTS `promotions`;
CREATE TABLE `promotions` (
  `promotionId` int(11) NOT NULL AUTO_INCREMENT,
  `promotionName` varchar(255) DEFAULT NULL,
  `promotionShortName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`promotionId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of promotions
-- ----------------------------

-- ----------------------------
-- Table structure for `seasons`
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
-- Records of seasons
-- ----------------------------

-- ----------------------------
-- Table structure for `shows`
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
-- Records of shows
-- ----------------------------

-- ----------------------------
-- Table structure for `superstars`
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
-- Records of superstars
-- ----------------------------

-- ----------------------------
-- Table structure for `tiers`
-- ----------------------------
DROP TABLE IF EXISTS `tiers`;
CREATE TABLE `tiers` (
  `tierId` int(11) NOT NULL AUTO_INCREMENT,
  `tierName` varchar(255) NOT NULL,
  PRIMARY KEY (`tierId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tiers
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
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
-- Records of users
-- ----------------------------

-- ----------------------------
-- Procedure structure for `spGetSeasonsBySuperstarId`
-- ----------------------------
DROP PROCEDURE IF EXISTS `spGetSeasonsBySuperstarId`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetSeasonsBySuperstarId`(IN superstarId INT)
BEGIN
	SELECT DISTINCT season FROM matchstats WHERE superstarId = superstarId;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `GetCurrentSeason`
-- ----------------------------
DROP FUNCTION IF EXISTS `GetCurrentSeason`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetCurrentSeason`() RETURNS int(11)
BEGIN
	#Routine body goes here...
	DECLARE today DATETIME DEFAULT NOW();
	DECLARE season INT DEFAULT 1;

	SET season = (SELECT season FROM seasons WHERE startDate <= today AND endDate >= today LIMIT 1);
	RETURN season;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `GetPointsBySuperstarIdMatchId`
-- ----------------------------
DROP FUNCTION IF EXISTS `GetPointsBySuperstarIdMatchId`;
DELIMITER ;;
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
DELIMITER ;

-- ----------------------------
-- Function structure for `GetPointsBySuperstarIdSeason`
-- ----------------------------
DROP FUNCTION IF EXISTS `GetPointsBySuperstarIdSeason`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetPointsBySuperstarIdSeason`(`superstarId` int,`season` int) RETURNS int(11)
BEGIN
	DECLARE matchPoints INT DEFAULT 0;
	DECLARE bonusPoints INT DEFAULT 0;
	DECLARE eventPoints INT DEFAULT 0;

	SELECT SUM(t.matchTypePoints) INTO matchPoints
	FROM matchstats s 
	INNER JOIN matchtypes t ON t.matchTypeId = m.matchTypeId
	WHERE s.match_won = 1 AND s.superstarId = superstarId and s.season = season;

	SELECT SUM(t.bonusTypePoints) INTO bonusPoints
	FROM bonuses b
	INNER JOIN bonustypes t ON t.bonusTypeId = b.bonusTypeId
	WHERE b.superstarId = superstarId and b.season = season;

	SELECT SUM(t.eventTypePoints) INTO eventPoints
	FROM `events` e
	INNER JOIN eventtypes t ON t.eventTypeId = e.eventTypeId
	WHERE e.superstarId = superstarId and e.season = season;

	SET matchPoints = IF(matchPoints IS NULL, 0, matchPoints);
	SET bonusPoints = IF(bonusPoints IS NULL, 0, bonusPoints);
	SET eventPoints = IF(eventPoints IS NULL, 0, eventPoints);

	RETURN (matchPoints + bonusPoints + eventPoints);
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `GetTotalDrawsBySuperstarIdSeason`
-- ----------------------------
DROP FUNCTION IF EXISTS `GetTotalDrawsBySuperstarIdSeason`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetTotalDrawsBySuperstarIdSeason`(`superstarId` int,`season` int) RETURNS int(11)
BEGIN
	DECLARE total INT DEFAULT 0;

	SELECT COUNT(*) INTO total
	FROM matchstats m 
	WHERE m.superstarId = superstarId AND m.season = season AND m.match_draw = 1;

	RETURN total;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `GetTotalLossesBySuperstarIdSeason`
-- ----------------------------
DROP FUNCTION IF EXISTS `GetTotalLossesBySuperstarIdSeason`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetTotalLossesBySuperstarIdSeason`(`superstarId` int,`season` int) RETURNS int(11)
BEGIN
	#Routine body goes here...
	DECLARE total INT DEFAULT 0;

	SELECT COUNT(*) INTO total
	FROM matchstats m
	WHERE m.superstarId = superstarId AND m.season = season AND m.match_loss = 1;

	RETURN total;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `GetTotalWinsBySuperstarIdSeason`
-- ----------------------------
DROP FUNCTION IF EXISTS `GetTotalWinsBySuperstarIdSeason`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetTotalWinsBySuperstarIdSeason`(`superstarId` int,`season` int) RETURNS int(11)
BEGIN
	DECLARE total INT DEFAULT 0;

	SELECT COUNT(*) INTO total
	FROM matchstats m
	WHERE m.superstarId = superstarId AND m.season = season AND m.match_won = 1;

	RETURN total;
END
;;
DELIMITER ;
