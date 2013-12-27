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

 Date: 12/27/2013 11:18:35 AM
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
--  Records of `bonustypes`
-- ----------------------------
BEGIN;
INSERT INTO `bonustypes` VALUES ('1', 'WWE Championship Win', 'WWE Championship Win', '5'), ('2', 'World Heavyweight Championship Win', 'World Heavyweight Championship Win', '3'), ('3', 'Intercontinental Championship Win', 'Intercontinental Championship Win', '3'), ('4', 'United States Championship Win', 'United States Championship Win', '3'), ('5', 'Divas Championship Win', 'Divas Championship Win', '3'), ('6', 'WWE Tag Team Championship Win', 'WWE Tag Team Championship Win', '2'), ('7', 'Royal Rumble Win', 'Royal Rumble Win', '4');
COMMIT;

-- ----------------------------
--  Table structure for `championships`
-- ----------------------------
DROP TABLE IF EXISTS `championships`;
CREATE TABLE `championships` (
  `championshipId` int(11) NOT NULL AUTO_INCREMENT,
  `championshipName` varchar(255) NOT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`championshipId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `championships`
-- ----------------------------
BEGIN;
INSERT INTO `championships` VALUES ('1', 'WWE Champion', '1'), ('2', 'World Heavyweight Champion', '1'), ('3', 'Intercontinental Champion', '1'), ('4', 'United States Champion', '1'), ('5', 'Divas Champion', '1'), ('6', 'Tag Team Champion', '1'), ('7', 'Cruiserweight Champion', '0'), ('8', 'Hardcore Champion', '0'), ('9', 'European Champion', '0'), ('10', 'Women\'s Champion', '0');
COMMIT;

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
--  Records of `eventtypes`
-- ----------------------------
BEGIN;
INSERT INTO `eventtypes` VALUES ('1', 'Match Interference', 'Interference', '2'), ('2', 'Interview', 'Interview', '2'), ('3', 'Promo', 'Promo', '2'), ('4', 'Special Guest Referee', 'Guest Referee', '2'), ('5', 'PPV Appearence', 'PPV Appearence', '1');
COMMIT;

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
--  Records of `factions`
-- ----------------------------
BEGIN;
INSERT INTO `factions` VALUES ('1', 'The Shield', 'The Shield', '1', '1'), ('2', 'The Real Americans', 'The Real Americans', '1', '1'), ('3', 'The Usos', 'The Usos', '1', '1'), ('4', 'Prime Time Players', 'PTP', '1', '1'), ('5', 'The Wyatt Family', 'Wyatt Family', '1', '1'), ('6', 'Los Matadors', 'Los Matadors', '1', '1'), ('7', 'Three Man Band', '3MB', '1', '1'), ('8', 'Tons of Funk', 'Tons of Funk', '1', '1'), ('9', 'The Funkadactyls', 'The Funkadactyls', '1', '1');
COMMIT;

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
--  Records of `leagueplayers`
-- ----------------------------
BEGIN;
INSERT INTO `leagueplayers` VALUES ('1', '1', null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `leagues`
-- ----------------------------
DROP TABLE IF EXISTS `leagues`;
CREATE TABLE `leagues` (
  `leagueId` int(11) NOT NULL AUTO_INCREMENT,
  `leagueName` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL COMMENT 'league creator/owner',
  `created` datetime NOT NULL,
  `type` varchar(255) NOT NULL,
  `draftType` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `players` tinyint(1) NOT NULL DEFAULT '1',
  `maxPlayers` tinyint(1) NOT NULL DEFAULT '8',
  PRIMARY KEY (`leagueId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `leagues`
-- ----------------------------
BEGIN;
INSERT INTO `leagues` VALUES ('1', 'League 1', '1', '2013-12-16 07:07:22', 'Open', 'Snake', null, '1', '8'), ('2', 'League 2', '2', '2013-12-23 14:23:51', 'Private', 'Automatic', null, '2', '8'), ('3', 'League 3', '3', '2013-12-19 14:24:14', 'Closed', 'Automatic', null, '8', '8');
COMMIT;

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
--  Records of `matchdecisions`
-- ----------------------------
BEGIN;
INSERT INTO `matchdecisions` VALUES ('1', 'Pinfall', 'Pin', '1'), ('2', 'Submission', 'Submission', '1'), ('3', 'Knockout', 'KO', '1'), ('4', 'Stipulation Fulfilment', 'Stipulation Fufillment', '1'), ('5', 'Countout', 'Countout', '1'), ('6', 'Disqualification', 'DQ', '1'), ('7', 'Forefit', 'Forefit', '1'), ('8', 'Avoiding Elimination', 'Avoiding Elimination', '1');
COMMIT;

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
--  Records of `matchtypes`
-- ----------------------------
BEGIN;
INSERT INTO `matchtypes` VALUES ('1', 'Singles', 'Singles', '2'), ('2', 'Tag Team', 'Tag', '1'), ('3', 'Triple Threat ', 'Triple Threat', '3'), ('4', 'Fatal Four Way', 'Fatal 4 Way', '4'), ('5', 'Battle Royal', 'Battle Royal', '5'), ('6', 'Royal Rumble', 'Royal Rumble', '10'), ('7', 'Elimination Chamber', 'Elimination Chamber', '10'), ('8', 'Beat the Clock Challenge', 'Beat the Clock', '1');
COMMIT;

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
--  Records of `promotions`
-- ----------------------------
BEGIN;
INSERT INTO `promotions` VALUES ('1', 'World Wrestling Entertainment', 'WWE'), ('2', 'Total Nonstop Action', 'TNA');
COMMIT;

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
--  Records of `seasons`
-- ----------------------------
BEGIN;
INSERT INTO `seasons` VALUES ('1', '2013-08-09 00:00:01', '2014-04-07 00:00:01', '1'), ('2', '2014-08-07 00:00:01', '2015-04-08 00:00:01', '1');
COMMIT;

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
--  Records of `shows`
-- ----------------------------
BEGIN;
INSERT INTO `shows` VALUES ('1', 'Monday Night Raw', 'Raw', '#e3272a', '1', '0', '1', '1'), ('2', 'Friday Night Smackdown', 'Smackdown', '#2f68dd', '1', '0', '1', '1'), ('3', 'NXT', 'NXT', '#e98412', '1', '0', '1', '1'), ('4', 'Main Event', 'Main Event', '', '0', '0', '1', '1'), ('5', 'Total Divas', 'Total Divas', '', '0', '0', '1', '0'), ('6', 'WWE Superstars', 'Superstars', '', '0', '0', '1', '1'), ('7', 'WWE Battlegound', 'Battleground', '', '0', '1', '1', '1'), ('8', 'WWE Hell in a Cell', 'Hell in a Cell', '', '0', '1', '1', '1'), ('9', 'Tribute to the Troops', 'Troops Tribute', null, '0', '0', '1', '1');
COMMIT;

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
--  Records of `superstars`
-- ----------------------------
BEGIN;
INSERT INTO `superstars` VALUES ('1', 'Alex Riley', 'Alex Riley', 'alexriley', '6', '1', '1', null, null, '1'), ('2', 'Antonio Cesaro', 'Antonio Cesaro', 'antoniocesaro', '2', '1', '1', '2', null, '1'), ('3', 'Big E Langston', 'Big E Langston', 'big-e-langston', '2', '1', '1', null, null, '1'), ('4', 'Brad Maddox', 'Brad Maddox', 'brad-maddox', '12', '1', '1', null, null, '1'), ('5', 'Bray Wyatt', 'Bray Wyatt', 'braywyatt', '2', '1', '1', '5', null, '1'), ('6', 'Brie Bella', 'Brie Bella', 'briebella', '7', '1', '1', null, null, '1'), ('7', 'Brock Lesnar', 'Brock Lesnar', 'brock-lesnar', '3', '0', '1', null, null, '1'), ('8', 'Brodus Clay', 'Brodus Clay', 'brodusclay', '1', '1', '1', '8', null, '1'), ('9', 'Cameron', 'Cameron', 'cameron', '7', '1', '1', '9', null, '1'), ('10', 'CM Punk', 'CM Punk', 'cmpunk', '3', '1', '1', null, null, '1'), ('11', 'Curtis Axel', 'Curtis Axel', 'curtisaxel', '2', '1', '1', null, '3', '1'), ('12', 'Daniel Bryan', 'Daniel Bryan', 'danielbryan', '3', '1', '1', null, null, '1'), ('13', 'David Otunga', 'David Otunga', 'davidotunga', '1', '1', '1', null, null, '1'), ('14', 'Dean Ambrose', 'Dean Ambrose', 'dean-ambrose', '2', '1', '1', '1', '4', '1'), ('15', 'Diego', 'Diego', 'diego', '1', '1', '1', '6', null, '1'), ('16', 'Dolph Ziggler', 'Dolph Ziggler', 'dolphziggler', '2', '1', '1', null, null, '1'), ('17', 'Dwayne \"The Rock\" Johnson', 'The Rock', 'therock', '3', '0', '1', null, null, '1'), ('18', 'El Torito', 'El Torito', 'el-torito', '1', '1', '1', '6', null, '1'), ('19', 'Epico', 'Epico', 'epico', '1', '1', '1', null, null, '1'), ('20', 'Erick Rowan', 'Erick Rowan', 'erickrowan', '2', '1', '1', '5', null, '1'), ('21', 'Evan Bourne', 'Evan Bourne', 'evanbourne', '1', '0', '1', null, null, '1'), ('22', 'Fandango', 'Fandango', 'fandango', '2', '1', '1', null, null, '1'), ('23', 'Fernando', 'Fernando', 'fernando', '1', '1', '1', '6', null, '1'), ('24', 'Jack Swagger', 'Jack Swagger', 'jackswagger', '2', '1', '1', '2', null, '1'), ('25', 'Jerry Lawler', 'Jerry Lawler', 'jerrylawler', '6', '1', '1', null, null, '1'), ('26', 'John Cena', 'John Cena', 'johncena', '3', '0', '1', null, null, '1'), ('27', 'JTG', 'JTG', 'jtg', '1', '1', '1', null, null, '1'), ('28', 'Justin Roberts', 'Justin Roberts', 'justinroberts', '5', '1', '1', null, null, '1'), ('29', 'Kane', 'Kane', 'kane', '2', '0', '1', null, null, '1'), ('30', 'Kofi Kingston', 'Kofi Kingston', 'kofikingston', '2', '1', '1', null, null, '1'), ('31', 'Luke Harper', 'Luke Harper', 'lukeharper', '2', '1', '1', '5', null, '1'), ('32', 'Michael Cole', 'Michael Cole', 'michaelcole', '6', '1', '1', null, null, '1'), ('33', 'The Miz', 'The Miz', 'themiz', '2', '1', '1', null, null, '1'), ('34', 'Mr. McMahon', 'Mr. McMahon', 'mrmcmahon', '9', '1', '1', null, null, '1'), ('35', 'Naomi', 'Naomi', 'naomi', '7', '1', '1', '9', null, '1'), ('36', 'Nikki Bella', 'Nikki Bella', 'nikkibella', '7', '1', '1', null, null, '1'), ('37', 'Paul Heyman', 'Paul Heyman', 'paulheyman', '8', '1', '1', null, null, '1'), ('38', 'Primo', 'Primo', 'primo', '1', '1', '1', null, null, '1'), ('39', 'R-Truth', 'R-Truth', 'rtruth', '2', '1', '1', null, null, '1'), ('40', 'Randy Orton', 'Randy Orton', 'randyorton', '3', '1', '1', null, null, '1'), ('41', 'Rey Mysterio', 'Rey Mysterio', 'reymysterio', '2', '0', '1', null, null, '1'), ('42', 'Ricardo Rodriguez', 'Ricardo Rodriguez', 'ricardorodriguez', '5', '1', '1', null, null, '1'), ('43', 'Roman Reigns', 'Roman Reigns', 'roman-reigns', '2', '1', '1', '1', null, '1'), ('44', 'Ryback', 'Ryback', 'ryback', '3', '1', '1', null, null, '1'), ('45', 'Santino Marella', 'Santino Marella', 'santinomarella', '2', '1', '1', null, null, '1'), ('46', 'Scott Stanford', 'Scott Stanford', 'scottstanford', '6', '1', '1', null, null, '1'), ('47', 'Seth Rollins', 'Seth Rollins', 'seth-rollins', '2', '1', '1', '1', null, '1'), ('48', 'Stephanie McMahon', 'Stephanie McMahon', 'stephaniemcmahon', '9', '1', '1', null, null, '1'), ('49', 'Summer Rae', 'Summer Rae', 'summer-rae', '7', '1', '1', null, null, '1'), ('50', 'Tamina Snuka', 'Tamina Snuka', 'tamina-snuka', '7', '1', '1', null, null, '1'), ('51', 'Tensai', 'Tensai', 'tensai', '1', '1', '1', '8', null, '1'), ('52', 'Triple H', 'Triple H', 'tripleh', '9', '1', '1', null, null, '1'), ('54', 'Zack Ryder', 'Zack Ryder', 'zackryder', '1', '1', '1', null, null, '1'), ('55', 'Zeb Colter', 'Zeb Colter', 'zeb-colter', '8', '1', '1', '2', null, '1'), ('56', 'AJ Lee', 'AJ Lee', 'aj', '7', '1', '1', null, '5', '1'), ('57', 'Aksana', 'Aksana', 'aksana', '7', '1', '2', null, null, '1'), ('58', 'Alberto Del Rio', 'Alberto Del Rio', 'albertodelrio', '3', '1', '2', null, '2', '1'), ('59', 'Alicia Fox', 'Alicia Fox', 'aliciafox', '7', '1', '2', null, null, '1'), ('60', 'Big Show', 'Big Show', 'bigshow', '3', '0', '2', null, null, '1'), ('61', 'Booker T', 'Booker T', 'bookert', '12', '1', '2', null, null, '1'), ('62', 'Camacho', 'Camacho', 'camacho', '1', '1', '2', null, null, '1'), ('63', 'Christian', 'Christian', 'christian', '3', '1', '2', null, null, '1'), ('64', 'Curt Hawkins', 'Curt Hawkins', 'curthawkins', '1', '1', '2', null, null, '1'), ('65', 'Damien Sandow', 'Damien Sandow', 'damien-sandow', '2', '1', '2', null, null, '1'), ('66', 'Darren Young', 'Darren Young', 'darrenyoung', '2', '1', '2', '4', null, '1'), ('67', 'Drew McIntyre', 'Drew McIntyre', 'drewmcintyre', '1', '1', '2', '7', null, '1'), ('68', 'Ezekiel Jackson', 'Ezekiel Jackson', 'ezekieljackson', '1', '1', '2', null, null, '1'), ('69', 'The Great Khali', 'The Great Khali', 'thegreatkhali', '1', '1', '2', null, null, '1'), ('70', 'Heath Slater', 'Heath Slater', 'heathslater', '1', '1', '2', '7', null, '1'), ('71', 'Hornswoggle', 'Hornswoggle', 'hornswoggle', '1', '1', '2', null, null, '1'), ('72', 'Hunico', 'Hunico', 'hunico', '1', '1', '2', null, null, '1'), ('73', 'JBL', 'JBL', 'jbl', '6', '1', '2', null, null, '1'), ('74', 'Jey Uso', 'Jey Uso', 'jeyuso', '2', '1', '2', '3', null, '1'), ('75', 'Jimmy Uso', 'Jimmy Uso', 'jimmyuso', '2', '1', '2', '3', null, '1'), ('76', 'Jinder Mahal', 'Jinder Mahal', 'jindermahal', '1', '1', '2', '7', null, '1'), ('77', 'Josh Mathews', 'Josh Mathews', 'joshmathews', '6', '1', '2', null, null, '1'), ('78', 'Justin Gabriel', 'Justin Gabriel', 'justingabriel', '1', '1', '2', null, null, '1'), ('79', 'Kaitlyn', 'Kaitlyn', 'kaitlyn', '7', '1', '2', null, null, '1'), ('80', 'Layla', 'Layla', 'layla', '7', '1', '2', null, null, '1'), ('81', 'Lilian Garcia', 'Lilian Garcia', 'liliangarcia', '5', '1', '2', null, null, '1'), ('82', 'Mark Henry', 'Mark Henry', 'markhenry', '3', '0', '2', null, null, '1'), ('83', 'Natalya', 'Natalya', 'natalya', '7', '1', '2', null, null, '1'), ('84', 'Renee Young', 'Renee Young', 'renee-young', '10', '1', '2', null, null, '1'), ('85', 'Rosa Mendes', 'Rosa Mendes', 'rosamendes', '7', '1', '2', null, null, '1'), ('86', 'Sheamus', 'Sheamus', 'sheamus', '3', '0', '2', null, null, '1'), ('87', 'Sin Cara', 'Sin Cara', 'sin-cara', '1', '0', '2', null, null, '1'), ('88', 'Theodore Long', 'Theodore Long', 'theodorelong', '12', '1', '2', null, null, '1'), ('89', 'Titus O\'Neil', 'Titus O\'Neil', 'titusoneil', '2', '1', '2', '4', null, '1'), ('90', 'Tony Chimel', 'Tony Chimel', 'tonychimel', '5', '1', '2', null, null, '1'), ('91', 'Tyson Kidd', 'Tyson Kidd', 'tysonkidd', '1', '1', '2', null, null, '1'), ('92', 'Undertaker', 'Undertaker', 'undertaker', '3', '0', '2', null, null, '1'), ('93', 'Vickie Guerrero', 'Vickie Guerrero', 'vickieguerrero', '12', '1', '2', null, null, '1'), ('94', 'Wade Barrett', 'Wade Barrett', 'wadebarrett', '2', '0', '2', null, null, '1'), ('95', 'William Regal', 'William Regal', 'williamregal', '1', '0', '2', null, null, '1'), ('96', 'Yoshi Tatsu', 'Yoshi Tatsu', 'yoshitatsu', '1', '1', '2', null, null, '1'), ('97', 'Adrian Neville', 'Adrian Neville', 'adrianneville', '11', '1', '3', null, null, '1'), ('98', 'Aiden English', 'Aiden English', 'aidenenglish', '11', '1', '3', null, null, '1'), ('99', 'Alexa Bliss', 'Alexa Bliss', 'alexabliss', '11', '1', '3', null, null, '1'), ('100', 'Alexander Rusev', 'Alexander Rusev', 'alexanderrusev', '11', '1', '3', null, null, '1'), ('101', 'Angelo Dawkins', 'Angelo Dawkins', 'angelodawkins', '11', '1', '3', null, null, '1'), ('102', 'Baron Corbin', 'Baron Corbin', 'baroncorbin', '11', '1', '3', null, null, '1'), ('103', 'Bayley', 'Bayley', 'bayley', '11', '1', '3', null, null, '1'), ('104', 'Bo Dallas', 'Bo Dallas', 'bo-dallas', '11', '1', '3', null, null, '1'), ('105', 'Byron Saxton', 'Byron Saxton', 'byronsaxton', '11', '1', '3', null, null, '1'), ('106', 'Charlotte', 'Charlotte', 'charlotte', '11', '1', '3', null, null, '1'), ('107', 'CJ Parker', 'CJ Parker', 'cjparker', '11', '1', '3', null, null, '1'), ('108', 'Colin Cassady', 'Colin Cassady', 'colincassady', '11', '1', '3', null, null, '1'), ('109', 'Conor O\'Brian', 'Conor O\'Brian', 'conorobrian', '11', '1', '3', null, null, '1'), ('110', 'Corey Graves', 'Corey Graves', 'coreygraves', '11', '1', '3', null, null, '1'), ('111', 'Danny Burch', 'Danny Burch', 'dannyburch', '11', '1', '3', null, null, '1'), ('112', 'Emma', 'Emma', 'emma', '11', '1', '3', null, null, '1'), ('113', 'Enzo Amore', 'Enzo Amore', 'enzoamore', '11', '1', '3', null, null, '1'), ('114', 'Jason Jordan', 'Jason Jordan', 'jasonjordan', '11', '1', '3', null, null, '1'), ('115', 'Judas Devlin', 'Judas Devlin', 'judasdevlin', '11', '1', '3', null, null, '1'), ('116', 'Kassius Ohno', 'Kassius Ohno', 'kassiusohno', '11', '1', '3', null, null, '1'), ('117', 'Kendall Skye', 'Kendall Skye', 'kendallskye', '11', '1', '3', null, null, '1'), ('118', 'Knuckles Madsen', 'Knuckles Madsen', 'knucklesmadsen', '11', '1', '3', null, null, '1'), ('119', 'Leo Kruger', 'Leo Kruger', 'leokruger', '11', '1', '3', null, null, '1'), ('120', 'Mason Ryan', 'Mason Ryan', 'masonryan', '11', '1', '3', null, null, '1'), ('121', 'Mickey Keegan', 'Mickey Keegan', 'axlkeegan', '11', '1', '3', null, null, '1'), ('122', 'Mojo Rawley', 'Mojo Rawley', 'mojorawley', '11', '1', '3', null, null, '1'), ('123', 'Oliver Grey', 'Oliver Grey', 'olivergrey', '11', '1', '3', null, null, '1'), ('124', 'Paige', 'Paige', 'paige', '11', '1', '3', null, null, '1'), ('125', 'Rick Victor', 'Rick Victor', 'rickvictor', '11', '1', '3', null, null, '1'), ('126', 'Sami Zayn', 'Sami Zayn', 'samizayn', '11', '1', '3', null, null, '1'), ('127', 'Sasha Banks', 'Sasha Banks', 'sashabanks', '11', '1', '3', null, null, '1'), ('128', 'Sawyer Fulton', 'Sawyer Fulton', 'sawyerfulton', '11', '1', '3', null, null, '1'), ('129', 'Scott Dawson', 'Scott Dawson', 'scottdawson', '11', '1', '3', null, null, '1'), ('130', 'Sylvester Lefort', 'Sylvester Lefort', 'sylvesterlefort', '11', '1', '3', null, null, '1'), ('131', 'Tom Phillips', 'Tom Phillips', 'tomphillips', '6', '1', '3', null, null, '1'), ('132', 'Travis Tyler', 'Travis Tyler', 'travistyler', '11', '1', '3', null, null, '1'), ('133', 'Troy McClain', 'Troy McClain', 'troymcclain', '11', '1', '3', null, null, '1'), ('134', 'Tyler Breeze', 'Tyler Breeze', 'tylerbreeze', '11', '1', '3', null, null, '1'), ('135', 'Xavier Woods', 'Xavier Woods', 'xavierwoods', '11', '1', '3', null, null, '1'), ('136', 'Rob Van Dam', 'RVD', 'robvandam', '3', '0', '1', null, null, '1'), ('138', 'Cody Rhodes', 'Cody Rhodes', 'codyrhodes', '2', '1', '1', null, '6', '1'), ('139', 'Goldust', 'Goldust', 'goldust', '2', '1', '1', null, '6', '1'), ('140', 'Chad Patton', 'Chad Patton', 'chadpatton', '4', '1', '1', null, null, '1'), ('141', 'Charles Robinson', 'Charles Robinson', 'charlesrobinson', '4', '1', '1', null, null, '1'), ('142', 'John Cone', 'John Cone', 'johncone', '4', '1', '1', null, null, '1'), ('143', 'Justin King', 'Justin King', 'justinking', '4', '1', '1', null, null, '1'), ('144', 'Mike Chioda', 'Mike Chioda', 'mikechioda', '4', '1', '1', null, null, '1'), ('145', 'Rod Zapata', 'Rod Zapata', 'rodzapata', '4', '1', '1', null, null, '1'), ('146', 'Marc Harris', 'Marc Harris', 'marcharri', '4', '1', '1', null, null, '1'), ('147', 'Darrick Moore', 'Darrick Moore', 'darrickmoore', '4', '1', '1', null, null, '1'), ('148', 'Jason Ayers', 'Jason Ayers', 'jasonayers', '4', '1', '1', null, null, '1'), ('149', 'Matt Bennett', 'Matt Bennett', 'mattbennett', '4', '1', '1', null, null, '1'), ('150', 'Rudy Charles', 'Rudy Charles', 'rudycharles', '4', '1', '1', null, null, '1'), ('151', 'Ryan Tran', 'Ryan Tran', 'ryantran', '4', '1', '1', null, null, '1');
COMMIT;

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
--  Records of `tiers`
-- ----------------------------
BEGIN;
INSERT INTO `tiers` VALUES ('1', 'Undercard'), ('2', 'Midcard'), ('3', 'Main Event'), ('4', 'Referee'), ('5', 'Announcer'), ('6', 'Commentator'), ('7', 'Diva'), ('8', 'Manager'), ('9', 'Corporate'), ('10', 'Reporter'), ('11', 'Developmental'), ('12', 'General Manager');
COMMIT;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `registerDate` datetime NOT NULL,
  `avatar` text,
  `membership` tinyint(1) NOT NULL DEFAULT '0',
  `session` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `users`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1', 'Sean3z', 'zyos', 'seanwragg@gmail.com', '2013-12-24 14:57:22', null, '0', null);
COMMIT;

-- ----------------------------
--  View structure for `superstarsextended`
-- ----------------------------
DROP VIEW IF EXISTS `superstarsextended`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `superstarsextended` AS select `s`.`superstarId` AS `superstarId`,`s`.`superstarName` AS `superstarName`,`s`.`superstarShortName` AS `superstarShortName`,`s`.`superstarSlug` AS `superstarSlug`,`s`.`tierId` AS `tierId`,`s`.`isActive` AS `isActive`,`s`.`showId` AS `showId`,`s`.`factionId` AS `factionId`,`s`.`championshipId` AS `championshipId`,`s`.`promotionId` AS `promotionId`,`t`.`tierName` AS `tierName`,`h`.`showShortName` AS `showShortName`,`f`.`factionName` AS `factionName`,`c`.`championshipName` AS `championshipName`,`p`.`promotionShortName` AS `promotionShortName`,`GetPointsBySuperstarIdSeason`(`s`.`superstarId`,`GetCurrentSeason`()) AS `points`,`GetTotalWinsBySuperstarIdSeason`(`s`.`superstarId`,`GetCurrentSeason`()) AS `wins`,`GetTotalLossesBySuperstarIdSeason`(`s`.`superstarId`,`GetCurrentSeason`()) AS `losses`,`GetTotalDrawsBySuperstarIdSeason`(`s`.`superstarId`,`GetCurrentSeason`()) AS `draws` from (((((`superstars` `s` join `tiers` `t` on((`t`.`tierId` = `s`.`tierId`))) join `shows` `h` on((`h`.`showId` = `s`.`showId`))) left join `factions` `f` on((`f`.`factionId` = `s`.`factionId`))) left join `championships` `c` on((`c`.`championshipId` = `s`.`championshipId`))) join `promotions` `p` on((`p`.`promotionId` = `s`.`promotionId`))) order by `s`.`superstarName`;

-- ----------------------------
--  Procedure structure for `spBuildSuperstarsExtended`
-- ----------------------------
DROP PROCEDURE IF EXISTS `spBuildSuperstarsExtended`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spBuildSuperstarsExtended`()
BEGIN
	#Routine body goes here...
	CREATE VIEW SuperstarsExtended AS
	SELECT s.*, 
	t.tierName, h.showShortName, f.factionName, c.championshipName, p.promotionShortName,
	GetPointsBySuperstarIdSeason(superstarId, GetCurrentSeason()) as points,
	GetTotalWinsBySuperstarIdSeason(superstarId, GetCurrentSeason()) as wins,
	GetTotalLossesBySuperstarIdSeason(superstarId, GetCurrentSeason()) as losses,
	GetTotalDrawsBySuperstarIdSeason(superstarId, GetCurrentSeason()) as draws
	FROM superstars s
	INNER JOIN tiers t ON t.tierId = s.tierId
	INNER JOIN shows h ON h.showId = s.showId
	LEFT JOIN factions f ON f.factionId = s.factionId
	LEFT JOIN championships c ON c.championshipId = s.championshipId
	INNER JOIN promotions p ON p.promotionId = s.promotionId
	ORDER BY superstarName ASC;

END
 ;;
delimiter ;

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
