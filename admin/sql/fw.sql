/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : fw

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2013-10-20 12:55:00
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `bonuses`
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bonustypes
-- ----------------------------
INSERT INTO bonustypes VALUES ('1', 'Pay-Per-View Win', 'PPV Win', '4');
INSERT INTO bonustypes VALUES ('2', 'Foreign Object Use', 'Foreign Object', '3');
INSERT INTO bonustypes VALUES ('3', 'Championship Win', 'Championship Win', '5');

-- ----------------------------
-- Table structure for `championships`
-- ----------------------------
DROP TABLE IF EXISTS `championships`;
CREATE TABLE `championships` (
  `championshipId` int(11) NOT NULL AUTO_INCREMENT,
  `championshipName` varchar(255) NOT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`championshipId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of championships
-- ----------------------------
INSERT INTO championships VALUES ('1', 'WWE Champion', '1');
INSERT INTO championships VALUES ('2', 'World Heavyweight Champion', '1');
INSERT INTO championships VALUES ('3', 'Intercontinental Champion', '1');
INSERT INTO championships VALUES ('4', 'United States Champion', '1');
INSERT INTO championships VALUES ('5', 'Divas Champion', '1');
INSERT INTO championships VALUES ('6', 'Tag Team Champion', '1');
INSERT INTO championships VALUES ('7', 'Cruiserweight Champion', '0');
INSERT INTO championships VALUES ('8', 'Hardcore Champion', '0');
INSERT INTO championships VALUES ('9', 'European Champion', '0');
INSERT INTO championships VALUES ('10', 'Women\'s Champion', '0');

-- ----------------------------
-- Table structure for `events`
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eventtypes
-- ----------------------------
INSERT INTO eventtypes VALUES ('1', 'Match Interference', 'Interference', '2');
INSERT INTO eventtypes VALUES ('2', 'Interview', 'Interview', '2');
INSERT INTO eventtypes VALUES ('3', 'Promo', 'Promo', '2');
INSERT INTO eventtypes VALUES ('4', 'Special Guest Referee', 'Guest Referee', '2');

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
INSERT INTO factions VALUES ('1', 'The Shield', 'The Shield', '1', '1');
INSERT INTO factions VALUES ('2', 'The Real Americans', 'The Real Americans', '1', '1');
INSERT INTO factions VALUES ('3', 'The Usos', 'The Usos', '1', '1');
INSERT INTO factions VALUES ('4', 'Prime Time Players', 'PTP', '1', '1');
INSERT INTO factions VALUES ('5', 'The Wyatt Family', 'Wyatt Family', '1', '1');
INSERT INTO factions VALUES ('6', 'Los Matadors', 'Los Matadors', '1', '1');
INSERT INTO factions VALUES ('7', 'Three Man Band', '3MB', '1', '1');
INSERT INTO factions VALUES ('8', 'Tons of Funk', 'Tons of Funk', '1', '1');
INSERT INTO factions VALUES ('9', 'The Funkadactyls', 'The Funkadactyls', '1', '1');

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
  `isDraw` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`matchId`),
  KEY `showId_idx` (`showId`),
  KEY `matchTypeId_idx` (`matchTypeId`),
  KEY `season_idx` (`season`),
  CONSTRAINT `matches_matchTypeId` FOREIGN KEY (`matchTypeId`) REFERENCES `matchtypes` (`matchTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `matches_season` FOREIGN KEY (`season`) REFERENCES `seasons` (`season`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `matches_showId` FOREIGN KEY (`showId`) REFERENCES `shows` (`showId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of matches
-- ----------------------------
INSERT INTO matches VALUES ('7', '2013', '2013-10-14 07:54:31', '1', '1', '0');
INSERT INTO matches VALUES ('8', '2013', '2013-10-14 08:21:09', '1', '1', '0');
INSERT INTO matches VALUES ('9', '2013', '2013-10-14 08:22:49', '1', '2', '0');
INSERT INTO matches VALUES ('10', '2013', '2013-10-14 08:25:11', '1', '2', '0');
INSERT INTO matches VALUES ('11', '2013', '2013-10-14 08:26:12', '1', '1', '0');

-- ----------------------------
-- Table structure for `matchstats`
-- ----------------------------
DROP TABLE IF EXISTS `matchstats`;
CREATE TABLE `matchstats` (
  `superstarId` int(11) NOT NULL,
  `matchId` int(11) NOT NULL,
  `match_won` tinyint(1) DEFAULT NULL,
  `match_loss` tinyint(1) DEFAULT NULL,
  `match_draw` tinyint(1) DEFAULT NULL,
  KEY `matchId_idx` (`matchId`),
  KEY `superstarId_idx` (`superstarId`),
  CONSTRAINT `matchId` FOREIGN KEY (`matchId`) REFERENCES `matches` (`matchId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `superstarId` FOREIGN KEY (`superstarId`) REFERENCES `superstars` (`superstarId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of matchstats
-- ----------------------------
INSERT INTO matchstats VALUES ('40', '7', '1', null, null);
INSERT INTO matchstats VALUES ('33', '7', null, '1', null);
INSERT INTO matchstats VALUES ('22', '8', '1', null, null);
INSERT INTO matchstats VALUES ('45', '8', null, '1', null);
INSERT INTO matchstats VALUES ('23', '9', '1', null, null);
INSERT INTO matchstats VALUES ('15', '9', '1', null, null);
INSERT INTO matchstats VALUES ('70', '9', null, '1', null);
INSERT INTO matchstats VALUES ('67', '9', null, '1', null);
INSERT INTO matchstats VALUES ('24', '10', '1', null, null);
INSERT INTO matchstats VALUES ('2', '10', '1', null, null);
INSERT INTO matchstats VALUES ('8', '10', null, '1', null);
INSERT INTO matchstats VALUES ('51', '10', null, '1', null);
INSERT INTO matchstats VALUES ('50', '11', '1', null, null);
INSERT INTO matchstats VALUES ('6', '11', null, '1', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of matchtypes
-- ----------------------------
INSERT INTO matchtypes VALUES ('1', 'Singles', 'Singles', '1');
INSERT INTO matchtypes VALUES ('2', 'Tag Team', 'Tag', '2');
INSERT INTO matchtypes VALUES ('3', 'Triple Threat ', 'Triple Threat', '3');
INSERT INTO matchtypes VALUES ('4', 'Fatal Four Way', 'Fatal 4 Way', '4');
INSERT INTO matchtypes VALUES ('5', 'Battle Royal', 'Battle Royal', '5');
INSERT INTO matchtypes VALUES ('6', 'Royal Rumble', 'Royal Rumble', '10');
INSERT INTO matchtypes VALUES ('7', 'Elimination Chamber', 'Elimination Chamber', '10');

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
INSERT INTO promotions VALUES ('1', 'World Wrestling Entertainment', 'WWE');
INSERT INTO promotions VALUES ('2', 'Total Nonstop Action', 'TNA');

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
INSERT INTO seasons VALUES ('2013', '2013-08-09 00:00:01', '2014-04-07 00:00:01', '1');
INSERT INTO seasons VALUES ('2014', '2014-08-07 00:00:01', '2015-04-08 00:00:01', '1');

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
  PRIMARY KEY (`showId`),
  KEY `promotionId_idx` (`promotionId`),
  CONSTRAINT `shows_promotionId` FOREIGN KEY (`promotionId`) REFERENCES `promotions` (`promotionId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shows
-- ----------------------------
INSERT INTO shows VALUES ('1', 'Monday Night Raw', 'Raw', '#e3272a', '1', '0', '1');
INSERT INTO shows VALUES ('2', 'Friday Night Smackdown', 'Smackdown', '#2f68dd', '1', '0', '1');
INSERT INTO shows VALUES ('3', 'NXT', 'NXT', '#e98412', '1', '0', '1');
INSERT INTO shows VALUES ('4', 'Main Event', 'Main Event', '', '0', '0', '1');
INSERT INTO shows VALUES ('5', 'Total Divas', 'Total Divas', '', '0', '0', '1');
INSERT INTO shows VALUES ('6', 'WWE Superstars', 'Superstars', '', '0', '1', '1');
INSERT INTO shows VALUES ('7', 'WWE Battlegound', 'Battleground', '', '0', '1', '1');
INSERT INTO shows VALUES ('8', 'WWE Hell in a Cell', 'HiaC', '', '0', '1', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of superstars
-- ----------------------------
INSERT INTO superstars VALUES ('1', 'Alex Riley', 'Alex Riley', 'alexriley', '6', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('2', 'Antonio Cesaro', 'Antonio Cesaro', 'antoniocesaro', '2', '1', '1', '2', null, '1');
INSERT INTO superstars VALUES ('3', 'Big E Langston', 'Big E Langston', 'big-e-langston', '2', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('4', 'Brad Maddox', 'Brad Maddox', 'brad-maddox', '12', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('5', 'Bray Wyatt', 'Bray Wyatt', 'braywyatt', '2', '1', '1', '5', null, '1');
INSERT INTO superstars VALUES ('6', 'Brie Bella', 'Brie Bella', 'briebella', '7', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('7', 'Brock Lesnar', 'Brock Lesnar', 'brock-lesnar', '3', '0', '1', null, null, '1');
INSERT INTO superstars VALUES ('8', 'Brodus Clay', 'Brodus Clay', 'brodusclay', '1', '1', '1', '8', null, '1');
INSERT INTO superstars VALUES ('9', 'Cameron', 'Cameron', 'cameron', '7', '1', '1', '9', null, '1');
INSERT INTO superstars VALUES ('10', 'CM Punk', 'CM Punk', 'cmpunk', '3', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('11', 'Curtis Axel', 'Curtis Axel', 'curtisaxel', '2', '1', '1', null, '3', '1');
INSERT INTO superstars VALUES ('12', 'Daniel Bryan', 'Daniel Bryan', 'danielbryan', '3', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('13', 'David Otunga', 'David Otunga', 'davidotunga', '1', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('14', 'Dean Ambrose', 'Dean Ambrose', 'dean-ambrose', '2', '1', '1', '1', '4', '1');
INSERT INTO superstars VALUES ('15', 'Diego', 'Diego', 'diego', '1', '1', '1', '6', null, '1');
INSERT INTO superstars VALUES ('16', 'Dolph Ziggler', 'Dolph Ziggler', 'dolphziggler', '2', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('17', 'Dwayne \"The Rock\" Johnson', 'The Rock', 'therock', '3', '0', '1', null, null, '1');
INSERT INTO superstars VALUES ('18', 'El Torito', 'El Torito', 'el-torito', '1', '1', '1', '6', null, '1');
INSERT INTO superstars VALUES ('19', 'Epico', 'Epico', 'epico', '1', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('20', 'Erick Rowan', 'Erick Rowan', 'erickrowan', '2', '1', '1', '5', null, '1');
INSERT INTO superstars VALUES ('21', 'Evan Bourne', 'Evan Bourne', 'evanbourne', '1', '0', '1', null, null, '1');
INSERT INTO superstars VALUES ('22', 'Fandango', 'Fandango', 'fandango', '2', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('23', 'Fernando', 'Fernando', 'fernando', '1', '1', '1', '6', null, '1');
INSERT INTO superstars VALUES ('24', 'Jack Swagger', 'Jack Swagger', 'jackswagger', '2', '1', '1', '2', null, '1');
INSERT INTO superstars VALUES ('25', 'Jerry Lawler', 'Jerry Lawler', 'jerrylawler', '6', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('26', 'John Cena', 'John Cena', 'johncena', '3', '0', '1', null, null, '1');
INSERT INTO superstars VALUES ('27', 'JTG', 'JTG', 'jtg', '1', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('28', 'Justin Roberts', 'Justin Roberts', 'justinroberts', '5', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('29', 'Kane', 'Kane', 'kane', '2', '0', '1', null, null, '1');
INSERT INTO superstars VALUES ('30', 'Kofi Kingston', 'Kofi Kingston', 'kofikingston', '2', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('31', 'Luke Harper', 'Luke Harper', 'lukeharper', '2', '1', '1', '5', null, '1');
INSERT INTO superstars VALUES ('32', 'Michael Cole', 'Michael Cole', 'michaelcole', '6', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('33', 'The Miz', 'The Miz', 'themiz', '2', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('34', 'Mr. McMahon', 'Mr. McMahon', 'mrmcmahon', '9', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('35', 'Naomi', 'Naomi', 'naomi', '7', '1', '1', '9', null, '1');
INSERT INTO superstars VALUES ('36', 'Nikki Bella', 'Nikki Bella', 'nikkibella', '7', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('37', 'Paul Heyman', 'Paul Heyman', 'paulheyman', '8', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('38', 'Primo', 'Primo', 'primo', '1', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('39', 'R-Truth', 'R-Truth', 'rtruth', '2', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('40', 'Randy Orton', 'Randy Orton', 'randyorton', '3', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('41', 'Rey Mysterio', 'Rey Mysterio', 'reymysterio', '2', '0', '1', null, null, '1');
INSERT INTO superstars VALUES ('42', 'Ricardo Rodriguez', 'Ricardo Rodriguez', 'ricardorodriguez', '5', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('43', 'Roman Reigns', 'Roman Reigns', 'roman-reigns', '2', '1', '1', '1', null, '1');
INSERT INTO superstars VALUES ('44', 'Ryback', 'Ryback', 'ryback', '3', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('45', 'Santino Marella', 'Santino Marella', 'santinomarella', '2', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('46', 'Scott Stanford', 'Scott Stanford', 'scottstanford', '6', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('47', 'Seth Rollins', 'Seth Rollins', 'seth-rollins', '2', '1', '1', '1', null, '1');
INSERT INTO superstars VALUES ('48', 'Stephanie McMahon', 'Stephanie McMahon', 'stephaniemcmahon', '9', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('49', 'Summer Rae', 'Summer Rae', 'summer-rae', '7', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('50', 'Tamina Snuka', 'Tamina Snuka', 'tamina-snuka', '7', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('51', 'Tensai', 'Tensai', 'tensai', '1', '1', '1', '8', null, '1');
INSERT INTO superstars VALUES ('52', 'Triple H', 'Triple H', 'tripleh', '9', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('54', 'Zack Ryder', 'Zack Ryder', 'zackryder', '1', '1', '1', null, null, '1');
INSERT INTO superstars VALUES ('55', 'Zeb Colter', 'Zeb Colter', 'zeb-colter', '8', '1', '1', '2', null, '1');
INSERT INTO superstars VALUES ('56', 'AJ Lee', 'AJ Lee', 'aj', '7', '1', '1', null, '5', '1');
INSERT INTO superstars VALUES ('57', 'Aksana', 'Aksana', 'aksana', '7', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('58', 'Alberto Del Rio', 'Alberto Del Rio', 'albertodelrio', '3', '1', '2', null, '2', '1');
INSERT INTO superstars VALUES ('59', 'Alicia Fox', 'Alicia Fox', 'aliciafox', '7', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('60', 'Big Show', 'Big Show', 'bigshow', '3', '0', '2', null, null, '1');
INSERT INTO superstars VALUES ('61', 'Booker T', 'Booker T', 'bookert', '12', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('62', 'Camacho', 'Camacho', 'camacho', '1', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('63', 'Christian', 'Christian', 'christian', '3', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('64', 'Curt Hawkins', 'Curt Hawkins', 'curthawkins', '1', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('65', 'Damien Sandow', 'Damien Sandow', 'damien-sandow', '2', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('66', 'Darren Young', 'Darren Young', 'darrenyoung', '2', '1', '2', '4', null, '1');
INSERT INTO superstars VALUES ('67', 'Drew McIntyre', 'Drew McIntyre', 'drewmcintyre', '1', '1', '2', '7', null, '1');
INSERT INTO superstars VALUES ('68', 'Ezekiel Jackson', 'Ezekiel Jackson', 'ezekieljackson', '1', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('69', 'The Great Khali', 'The Great Khali', 'thegreatkhali', '1', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('70', 'Heath Slater', 'Heath Slater', 'heathslater', '1', '1', '2', '7', null, '1');
INSERT INTO superstars VALUES ('71', 'Hornswoggle', 'Hornswoggle', 'hornswoggle', '1', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('72', 'Hunico', 'Hunico', 'hunico', '1', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('73', 'JBL', 'JBL', 'jbl', '6', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('74', 'Jey Uso', 'Jey Uso', 'jeyuso', '2', '1', '2', '3', null, '1');
INSERT INTO superstars VALUES ('75', 'Jimmy Uso', 'Jimmy Uso', 'jimmyuso', '2', '1', '2', '3', null, '1');
INSERT INTO superstars VALUES ('76', 'Jinder Mahal', 'Jinder Mahal', 'jindermahal', '1', '1', '2', '7', null, '1');
INSERT INTO superstars VALUES ('77', 'Josh Mathews', 'Josh Mathews', 'joshmathews', '6', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('78', 'Justin Gabriel', 'Justin Gabriel', 'justingabriel', '1', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('79', 'Kaitlyn', 'Kaitlyn', 'kaitlyn', '7', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('80', 'Layla', 'Layla', 'layla', '7', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('81', 'Lilian Garcia', 'Lilian Garcia', 'liliangarcia', '5', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('82', 'Mark Henry', 'Mark Henry', 'markhenry', '3', '0', '2', null, null, '1');
INSERT INTO superstars VALUES ('83', 'Natalya', 'Natalya', 'natalya', '7', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('84', 'Renee Young', 'Renee Young', 'renee-young', '10', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('85', 'Rosa Mendes', 'Rosa Mendes', 'rosamendes', '7', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('86', 'Sheamus', 'Sheamus', 'sheamus', '3', '0', '2', null, null, '1');
INSERT INTO superstars VALUES ('87', 'Sin Cara', 'Sin Cara', 'sin-cara', '1', '0', '2', null, null, '1');
INSERT INTO superstars VALUES ('88', 'Theodore Long', 'Theodore Long', 'theodorelong', '12', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('89', 'Titus O\'Neil', 'Titus O\'Neil', 'titusoneil', '2', '1', '2', '4', null, '1');
INSERT INTO superstars VALUES ('90', 'Tony Chimel', 'Tony Chimel', 'tonychimel', '5', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('91', 'Tyson Kidd', 'Tyson Kidd', 'tysonkidd', '1', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('92', 'Undertaker', 'Undertaker', 'undertaker', '3', '0', '2', null, null, '1');
INSERT INTO superstars VALUES ('93', 'Vickie Guerrero', 'Vickie Guerrero', 'vickieguerrero', '12', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('94', 'Wade Barrett', 'Wade Barrett', 'wadebarrett', '2', '0', '2', null, null, '1');
INSERT INTO superstars VALUES ('95', 'William Regal', 'William Regal', 'williamregal', '1', '0', '2', null, null, '1');
INSERT INTO superstars VALUES ('96', 'Yoshi Tatsu', 'Yoshi Tatsu', 'yoshitatsu', '1', '1', '2', null, null, '1');
INSERT INTO superstars VALUES ('97', 'Adrian Neville', 'Adrian Neville', 'adrianneville', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('98', 'Aiden English', 'Aiden English', 'aidenenglish', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('99', 'Alexa Bliss', 'Alexa Bliss', 'alexabliss', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('100', 'Alexander Rusev', 'Alexander Rusev', 'alexanderrusev', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('101', 'Angelo Dawkins', 'Angelo Dawkins', 'angelodawkins', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('102', 'Baron Corbin', 'Baron Corbin', 'baroncorbin', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('103', 'Bayley', 'Bayley', 'bayley', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('104', 'Bo Dallas', 'Bo Dallas', 'bo-dallas', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('105', 'Byron Saxton', 'Byron Saxton', 'byronsaxton', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('106', 'Charlotte', 'Charlotte', 'charlotte', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('107', 'CJ Parker', 'CJ Parker', 'cjparker', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('108', 'Colin Cassady', 'Colin Cassady', 'colincassady', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('109', 'Conor O\'Brian', 'Conor O\'Brian', 'conorobrian', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('110', 'Corey Graves', 'Corey Graves', 'coreygraves', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('111', 'Danny Burch', 'Danny Burch', 'dannyburch', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('112', 'Emma', 'Emma', 'emma', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('113', 'Enzo Amore', 'Enzo Amore', 'enzoamore', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('114', 'Jason Jordan', 'Jason Jordan', 'jasonjordan', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('115', 'Judas Devlin', 'Judas Devlin', 'judasdevlin', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('116', 'Kassius Ohno', 'Kassius Ohno', 'kassiusohno', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('117', 'Kendall Skye', 'Kendall Skye', 'kendallskye', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('118', 'Knuckles Madsen', 'Knuckles Madsen', 'knucklesmadsen', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('119', 'Leo Kruger', 'Leo Kruger', 'leokruger', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('120', 'Mason Ryan', 'Mason Ryan', 'masonryan', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('121', 'Mickey Keegan', 'Mickey Keegan', 'axlkeegan', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('122', 'Mojo Rawley', 'Mojo Rawley', 'mojorawley', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('123', 'Oliver Grey', 'Oliver Grey', 'olivergrey', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('124', 'Paige', 'Paige', 'paige', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('125', 'Rick Victor', 'Rick Victor', 'rickvictor', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('126', 'Sami Zayn', 'Sami Zayn', 'samizayn', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('127', 'Sasha Banks', 'Sasha Banks', 'sashabanks', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('128', 'Sawyer Fulton', 'Sawyer Fulton', 'sawyerfulton', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('129', 'Scott Dawson', 'Scott Dawson', 'scottdawson', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('130', 'Sylvester Lefort', 'Sylvester Lefort', 'sylvesterlefort', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('131', 'Tom Phillips', 'Tom Phillips', 'tomphillips', '6', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('132', 'Travis Tyler', 'Travis Tyler', 'travistyler', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('133', 'Troy McClain', 'Troy McClain', 'troymcclain', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('134', 'Tyler Breeze', 'Tyler Breeze', 'tylerbreeze', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('135', 'Xavier Woods', 'Xavier Woods', 'xavierwoods', '11', '1', '3', null, null, '1');
INSERT INTO superstars VALUES ('136', 'Rob Van Dam', 'RVD', 'robvandam', '3', '0', '1', null, null, '1');
INSERT INTO superstars VALUES ('138', 'Cody Rhodes', 'Cody Rhodes', 'codyrhodes', '2', '1', '1', null, '6', '1');
INSERT INTO superstars VALUES ('139', 'Goldust', 'Goldust', 'goldust', '2', '1', '1', null, '6', '1');

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
INSERT INTO tiers VALUES ('1', 'Undercard');
INSERT INTO tiers VALUES ('2', 'Midcard');
INSERT INTO tiers VALUES ('3', 'Main Event');
INSERT INTO tiers VALUES ('4', 'Referee');
INSERT INTO tiers VALUES ('5', 'Announcer');
INSERT INTO tiers VALUES ('6', 'Commentator');
INSERT INTO tiers VALUES ('7', 'Diva');
INSERT INTO tiers VALUES ('8', 'Manager');
INSERT INTO tiers VALUES ('9', 'Corporate');
INSERT INTO tiers VALUES ('10', 'Reporter');
INSERT INTO tiers VALUES ('11', 'Developmental');
INSERT INTO tiers VALUES ('12', 'General Manager');

-- ----------------------------
-- View structure for `superstarsextended`
-- ----------------------------
DROP VIEW IF EXISTS `superstarsextended`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `superstarsextended` AS select `s`.`superstarId` AS `superstarId`,`s`.`superstarName` AS `superstarName`,`s`.`superstarShortName` AS `superstarShortName`,`s`.`superstarSlug` AS `superstarSlug`,`s`.`tierId` AS `tierId`,`s`.`isActive` AS `isActive`,`s`.`showId` AS `showId`,`s`.`factionId` AS `factionId`,`s`.`championshipId` AS `championshipId`,`s`.`promotionId` AS `promotionId`,`t`.`tierName` AS `tierName`,`h`.`showShortName` AS `showShortName`,`f`.`factionName` AS `factionName`,`c`.`championshipName` AS `championshipName`,`p`.`promotionShortName` AS `promotionShortName`,`GetPointsBySuperstarIdSeason`(`s`.`superstarId`,`GetCurrentSeason`()) AS `points`,`GetTotalWinsBySuperstarIdSeason`(`s`.`superstarId`,`GetCurrentSeason`()) AS `wins`,`GetTotalLossesBySuperstarIdSeason`(`s`.`superstarId`,`GetCurrentSeason`()) AS `losses`,`GetTotalDrawsBySuperstarIdSeason`(`s`.`superstarId`,`GetCurrentSeason`()) AS `draws` from (((((`superstars` `s` join `tiers` `t` on((`t`.`tierId` = `s`.`tierId`))) join `shows` `h` on((`h`.`showId` = `s`.`showId`))) left join `factions` `f` on((`f`.`factionId` = `s`.`factionId`))) left join `championships` `c` on((`c`.`championshipId` = `s`.`championshipId`))) join `promotions` `p` on((`p`.`promotionId` = `s`.`promotionId`))) order by `s`.`superstarName`;

-- ----------------------------
-- Procedure structure for `spBuildSuperstarsExtended`
-- ----------------------------
DROP PROCEDURE IF EXISTS `spBuildSuperstarsExtended`;
DELIMITER ;;
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
DELIMITER ;

-- ----------------------------
-- Procedure structure for `spGetSeasonsBySuperstarId`
-- ----------------------------
DROP PROCEDURE IF EXISTS `spGetSeasonsBySuperstarId`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetSeasonsBySuperstarId`(IN superstarId INT)
BEGIN
	SELECT DISTINCT season FROM matchstats s INNER JOIN matches m ON m.matchId = s.matchId  WHERE s.superstarId = superstarId;
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
	DECLARE season INT DEFAULT YEAR(CURDATE());

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
	FROM matchstats ms 
	LEFT JOIN matches m ON m.matchId = ms.matchId 
	WHERE ms.superstarId = superstarId AND m.season = season AND ms.match_draw = 1;

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
	FROM matchstats ms 
	LEFT JOIN matches m ON m.matchId = ms.matchId 
	WHERE ms.superstarId = superstarId AND m.season = season AND ms.match_loss = 1;

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
	FROM matchstats ms 
	LEFT JOIN matches m ON m.matchId = ms.matchId 
	WHERE ms.superstarId = superstarId AND m.season = season AND ms.match_won = 1;

	RETURN total;
END
;;
DELIMITER ;
