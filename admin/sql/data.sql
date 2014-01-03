-- ----------------------------
-- Records of bonuses
-- ----------------------------

-- ----------------------------
-- Records of bonustypes
-- ----------------------------
INSERT INTO `bonustypes` VALUES ('1', 'WWE Championship Win', 'WWE Championship Win', '5');
INSERT INTO `bonustypes` VALUES ('2', 'World Heavyweight Championship Win', 'World Heavyweight Championship Win', '3');
INSERT INTO `bonustypes` VALUES ('3', 'Intercontinental Championship Win', 'Intercontinental Championship Win', '3');
INSERT INTO `bonustypes` VALUES ('4', 'United States Championship Win', 'United States Championship Win', '3');
INSERT INTO `bonustypes` VALUES ('5', 'Divas Championship Win', 'Divas Championship Win', '3');
INSERT INTO `bonustypes` VALUES ('6', 'WWE Tag Team Championship Win', 'WWE Tag Team Championship Win', '2');
INSERT INTO `bonustypes` VALUES ('7', 'Royal Rumble Win', 'Royal Rumble Win', '4');

-- ----------------------------
-- Records of championships
-- ----------------------------
INSERT INTO `championships` VALUES ('1', 'WWE Champion', '0');
INSERT INTO `championships` VALUES ('2', 'World Heavyweight Champion', '0');
INSERT INTO `championships` VALUES ('3', 'Intercontinental Champion', '1');
INSERT INTO `championships` VALUES ('4', 'United States Champion', '1');
INSERT INTO `championships` VALUES ('5', 'Divas Champion', '1');
INSERT INTO `championships` VALUES ('6', 'Tag Team Champion', '1');
INSERT INTO `championships` VALUES ('7', 'Cruiserweight Champion', '0');
INSERT INTO `championships` VALUES ('8', 'Hardcore Champion', '0');
INSERT INTO `championships` VALUES ('9', 'European Champion', '0');
INSERT INTO `championships` VALUES ('10', 'Women\'s Champion', '0');
INSERT INTO `championships` VALUES ('11', 'WWE World Heavyweight Champion', '1');

-- ----------------------------
-- Records of events
-- ----------------------------

-- ----------------------------
-- Records of eventtypes
-- ----------------------------
INSERT INTO `eventtypes` VALUES ('1', 'Match Interference', 'Interference', '2');
INSERT INTO `eventtypes` VALUES ('2', 'Interview', 'Interview', '2');
INSERT INTO `eventtypes` VALUES ('3', 'Promo', 'Promo', '2');
INSERT INTO `eventtypes` VALUES ('4', 'Special Guest Referee', 'Guest Referee', '2');
INSERT INTO `eventtypes` VALUES ('5', 'PPV Appearence', 'PPV Appearence', '1');

-- ----------------------------
-- Records of factions
-- ----------------------------
INSERT INTO `factions` VALUES ('1', 'The Shield', 'The Shield', '1', '1');
INSERT INTO `factions` VALUES ('2', 'The Real Americans', 'The Real Americans', '1', '1');
INSERT INTO `factions` VALUES ('3', 'The Usos', 'The Usos', '1', '1');
INSERT INTO `factions` VALUES ('4', 'Prime Time Players', 'PTP', '1', '1');
INSERT INTO `factions` VALUES ('5', 'The Wyatt Family', 'Wyatt Family', '1', '1');
INSERT INTO `factions` VALUES ('6', 'Los Matadors', 'Los Matadors', '1', '1');
INSERT INTO `factions` VALUES ('7', 'Three Man Band', '3MB', '1', '1');
INSERT INTO `factions` VALUES ('8', 'Tons of Funk', 'Tons of Funk', '1', '1');
INSERT INTO `factions` VALUES ('9', 'The Funkadactyls', 'The Funkadactyls', '1', '1');

-- ----------------------------
-- Records of leagueplayers
-- ----------------------------

-- ----------------------------
-- Records of leagues
-- ----------------------------

-- ----------------------------
-- Records of matchdecisions
-- ----------------------------
INSERT INTO `matchdecisions` VALUES ('1', 'Pinfall', 'Pin', '0');
INSERT INTO `matchdecisions` VALUES ('2', 'Submission', 'Submission', '0');
INSERT INTO `matchdecisions` VALUES ('3', 'Knockout', 'KO', '0');
INSERT INTO `matchdecisions` VALUES ('4', 'Stipulation Fulfilment', 'Stipulation Fufillment', '0');
INSERT INTO `matchdecisions` VALUES ('5', 'Countout', 'Countout', '0');
INSERT INTO `matchdecisions` VALUES ('6', 'Disqualification', 'DQ', '0');
INSERT INTO `matchdecisions` VALUES ('7', 'Forefit', 'Forefit', '0');
INSERT INTO `matchdecisions` VALUES ('8', 'Avoiding Elimination', 'Avoiding Elimination', '0');

-- ----------------------------
-- Records of matches
-- ----------------------------

-- ----------------------------
-- Records of matchstats
-- ----------------------------

-- ----------------------------
-- Records of matchtypes
-- ----------------------------
INSERT INTO `matchtypes` VALUES ('1', 'Singles', 'Singles', '2');
INSERT INTO `matchtypes` VALUES ('2', 'Tag Team', 'Tag', '1');
INSERT INTO `matchtypes` VALUES ('3', 'Triple Threat ', 'Triple Threat', '3');
INSERT INTO `matchtypes` VALUES ('4', 'Fatal Four Way', 'Fatal 4 Way', '4');
INSERT INTO `matchtypes` VALUES ('5', 'Battle Royal', 'Battle Royal', '5');
INSERT INTO `matchtypes` VALUES ('6', 'Royal Rumble', 'Royal Rumble', '10');
INSERT INTO `matchtypes` VALUES ('7', 'Elimination Chamber', 'Elimination Chamber', '10');
INSERT INTO `matchtypes` VALUES ('8', 'Beat the Clock Challenge', 'Beat the Clock', '1');

-- ----------------------------
-- Records of promotions
-- ----------------------------
INSERT INTO `promotions` VALUES ('1', 'World Wrestling Entertainment', 'WWE');
INSERT INTO `promotions` VALUES ('2', 'Total Nonstop Action', 'TNA');

-- ----------------------------
-- Records of seasons
-- ----------------------------
INSERT INTO `seasons` VALUES ('1', '2013-08-09 00:00:01', '2014-04-07 00:00:01', '1');
INSERT INTO `seasons` VALUES ('2', '2014-08-07 00:00:01', '2015-04-08 00:00:01', '1');

-- ----------------------------
-- Records of shows
-- ----------------------------
INSERT INTO `shows` VALUES ('1', 'Monday Night Raw', 'Raw', '#e3272a', '1', '0', '1', '1');
INSERT INTO `shows` VALUES ('2', 'Friday Night Smackdown', 'Smackdown', '#2f68dd', '1', '0', '1', '1');
INSERT INTO `shows` VALUES ('3', 'NXT', 'NXT', '#e98412', '1', '0', '1', '1');
INSERT INTO `shows` VALUES ('4', 'Main Event', 'Main Event', '', '0', '0', '1', '1');
INSERT INTO `shows` VALUES ('5', 'Total Divas', 'Total Divas', '', '0', '0', '1', '0');
INSERT INTO `shows` VALUES ('6', 'WWE Superstars', 'Superstars', '', '0', '0', '1', '1');
INSERT INTO `shows` VALUES ('7', 'WWE Battlegound', 'Battleground', '', '0', '1', '1', '1');
INSERT INTO `shows` VALUES ('8', 'WWE Hell in a Cell', 'Hell in a Cell', '', '0', '1', '1', '1');
INSERT INTO `shows` VALUES ('9', 'Tribute to the Troops', 'Troops Tribute', null, '0', '0', '1', '1');

-- ----------------------------
-- Records of superstars
-- ----------------------------
INSERT INTO `superstars` VALUES ('1', 'Alex Riley', 'Alex Riley', 'alexriley', '6', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('2', 'Antonio Cesaro', 'Antonio Cesaro', 'antoniocesaro', '2', '1', '1', '2', null, '1');
INSERT INTO `superstars` VALUES ('3', 'Big E Langston', 'Big E Langston', 'big-e-langston', '2', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('4', 'Brad Maddox', 'Brad Maddox', 'brad-maddox', '12', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('5', 'Bray Wyatt', 'Bray Wyatt', 'braywyatt', '2', '1', '1', '5', null, '1');
INSERT INTO `superstars` VALUES ('6', 'Brie Bella', 'Brie Bella', 'briebella', '7', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('7', 'Brock Lesnar', 'Brock Lesnar', 'brock-lesnar', '3', '0', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('8', 'Brodus Clay', 'Brodus Clay', 'brodusclay', '1', '1', '1', '8', null, '1');
INSERT INTO `superstars` VALUES ('9', 'Cameron', 'Cameron', 'cameron', '7', '1', '1', '9', null, '1');
INSERT INTO `superstars` VALUES ('10', 'CM Punk', 'CM Punk', 'cmpunk', '3', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('11', 'Curtis Axel', 'Curtis Axel', 'curtisaxel', '2', '1', '1', null, '3', '1');
INSERT INTO `superstars` VALUES ('12', 'Daniel Bryan', 'Daniel Bryan', 'danielbryan', '3', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('13', 'David Otunga', 'David Otunga', 'davidotunga', '1', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('14', 'Dean Ambrose', 'Dean Ambrose', 'dean-ambrose', '2', '1', '1', '1', '4', '1');
INSERT INTO `superstars` VALUES ('15', 'Diego', 'Diego', 'diego', '1', '1', '1', '6', null, '1');
INSERT INTO `superstars` VALUES ('16', 'Dolph Ziggler', 'Dolph Ziggler', 'dolphziggler', '2', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('17', 'Dwayne \"The Rock\" Johnson', 'The Rock', 'therock', '3', '0', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('18', 'El Torito', 'El Torito', 'el-torito', '1', '1', '1', '6', null, '1');
INSERT INTO `superstars` VALUES ('19', 'Epico', 'Epico', 'epico', '1', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('20', 'Erick Rowan', 'Erick Rowan', 'erickrowan', '2', '1', '1', '5', null, '1');
INSERT INTO `superstars` VALUES ('21', 'Evan Bourne', 'Evan Bourne', 'evanbourne', '1', '0', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('22', 'Fandango', 'Fandango', 'fandango', '2', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('23', 'Fernando', 'Fernando', 'fernando', '1', '1', '1', '6', null, '1');
INSERT INTO `superstars` VALUES ('24', 'Jack Swagger', 'Jack Swagger', 'jackswagger', '2', '1', '1', '2', null, '1');
INSERT INTO `superstars` VALUES ('25', 'Jerry Lawler', 'Jerry Lawler', 'jerrylawler', '6', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('26', 'John Cena', 'John Cena', 'johncena', '3', '0', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('27', 'JTG', 'JTG', 'jtg', '1', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('28', 'Justin Roberts', 'Justin Roberts', 'justinroberts', '5', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('29', 'Kane', 'Kane', 'kane', '2', '0', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('30', 'Kofi Kingston', 'Kofi Kingston', 'kofikingston', '2', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('31', 'Luke Harper', 'Luke Harper', 'lukeharper', '2', '1', '1', '5', null, '1');
INSERT INTO `superstars` VALUES ('32', 'Michael Cole', 'Michael Cole', 'michaelcole', '6', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('33', 'The Miz', 'The Miz', 'themiz', '2', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('34', 'Mr. McMahon', 'Mr. McMahon', 'mrmcmahon', '9', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('35', 'Naomi', 'Naomi', 'naomi', '7', '1', '1', '9', null, '1');
INSERT INTO `superstars` VALUES ('36', 'Nikki Bella', 'Nikki Bella', 'nikkibella', '7', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('37', 'Paul Heyman', 'Paul Heyman', 'paulheyman', '8', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('38', 'Primo', 'Primo', 'primo', '1', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('39', 'R-Truth', 'R-Truth', 'rtruth', '2', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('40', 'Randy Orton', 'Randy Orton', 'randyorton', '3', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('41', 'Rey Mysterio', 'Rey Mysterio', 'reymysterio', '2', '0', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('42', 'Ricardo Rodriguez', 'Ricardo Rodriguez', 'ricardorodriguez', '5', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('43', 'Roman Reigns', 'Roman Reigns', 'roman-reigns', '2', '1', '1', '1', null, '1');
INSERT INTO `superstars` VALUES ('44', 'Ryback', 'Ryback', 'ryback', '3', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('45', 'Santino Marella', 'Santino Marella', 'santinomarella', '2', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('46', 'Scott Stanford', 'Scott Stanford', 'scottstanford', '6', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('47', 'Seth Rollins', 'Seth Rollins', 'seth-rollins', '2', '1', '1', '1', null, '1');
INSERT INTO `superstars` VALUES ('48', 'Stephanie McMahon', 'Stephanie McMahon', 'stephaniemcmahon', '9', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('49', 'Summer Rae', 'Summer Rae', 'summer-rae', '7', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('50', 'Tamina Snuka', 'Tamina Snuka', 'tamina-snuka', '7', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('51', 'Tensai', 'Tensai', 'tensai', '1', '1', '1', '8', null, '1');
INSERT INTO `superstars` VALUES ('52', 'Triple H', 'Triple H', 'tripleh', '9', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('54', 'Zack Ryder', 'Zack Ryder', 'zackryder', '1', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('55', 'Zeb Colter', 'Zeb Colter', 'zeb-colter', '8', '1', '1', '2', null, '1');
INSERT INTO `superstars` VALUES ('56', 'AJ Lee', 'AJ Lee', 'aj', '7', '1', '1', null, '5', '1');
INSERT INTO `superstars` VALUES ('57', 'Aksana', 'Aksana', 'aksana', '7', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('58', 'Alberto Del Rio', 'Alberto Del Rio', 'albertodelrio', '3', '1', '2', null, '2', '1');
INSERT INTO `superstars` VALUES ('59', 'Alicia Fox', 'Alicia Fox', 'aliciafox', '7', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('60', 'Big Show', 'Big Show', 'bigshow', '3', '0', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('61', 'Booker T', 'Booker T', 'bookert', '12', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('62', 'Camacho', 'Camacho', 'camacho', '1', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('63', 'Christian', 'Christian', 'christian', '3', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('64', 'Curt Hawkins', 'Curt Hawkins', 'curthawkins', '1', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('65', 'Damien Sandow', 'Damien Sandow', 'damien-sandow', '2', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('66', 'Darren Young', 'Darren Young', 'darrenyoung', '2', '1', '2', '4', null, '1');
INSERT INTO `superstars` VALUES ('67', 'Drew McIntyre', 'Drew McIntyre', 'drewmcintyre', '1', '1', '2', '7', null, '1');
INSERT INTO `superstars` VALUES ('68', 'Ezekiel Jackson', 'Ezekiel Jackson', 'ezekieljackson', '1', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('69', 'The Great Khali', 'The Great Khali', 'thegreatkhali', '1', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('70', 'Heath Slater', 'Heath Slater', 'heathslater', '1', '1', '2', '7', null, '1');
INSERT INTO `superstars` VALUES ('71', 'Hornswoggle', 'Hornswoggle', 'hornswoggle', '1', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('72', 'Hunico', 'Hunico', 'hunico', '1', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('73', 'JBL', 'JBL', 'jbl', '6', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('74', 'Jey Uso', 'Jey Uso', 'jeyuso', '2', '1', '2', '3', null, '1');
INSERT INTO `superstars` VALUES ('75', 'Jimmy Uso', 'Jimmy Uso', 'jimmyuso', '2', '1', '2', '3', null, '1');
INSERT INTO `superstars` VALUES ('76', 'Jinder Mahal', 'Jinder Mahal', 'jindermahal', '1', '1', '2', '7', null, '1');
INSERT INTO `superstars` VALUES ('77', 'Josh Mathews', 'Josh Mathews', 'joshmathews', '6', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('78', 'Justin Gabriel', 'Justin Gabriel', 'justingabriel', '1', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('79', 'Kaitlyn', 'Kaitlyn', 'kaitlyn', '7', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('80', 'Layla', 'Layla', 'layla', '7', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('81', 'Lilian Garcia', 'Lilian Garcia', 'liliangarcia', '5', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('82', 'Mark Henry', 'Mark Henry', 'markhenry', '3', '0', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('83', 'Natalya', 'Natalya', 'natalya', '7', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('84', 'Renee Young', 'Renee Young', 'renee-young', '10', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('85', 'Rosa Mendes', 'Rosa Mendes', 'rosamendes', '7', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('86', 'Sheamus', 'Sheamus', 'sheamus', '3', '0', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('87', 'Sin Cara', 'Sin Cara', 'sin-cara', '1', '0', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('88', 'Theodore Long', 'Theodore Long', 'theodorelong', '12', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('89', 'Titus O\'Neil', 'Titus O\'Neil', 'titusoneil', '2', '1', '2', '4', null, '1');
INSERT INTO `superstars` VALUES ('90', 'Tony Chimel', 'Tony Chimel', 'tonychimel', '5', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('91', 'Tyson Kidd', 'Tyson Kidd', 'tysonkidd', '1', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('92', 'Undertaker', 'Undertaker', 'undertaker', '3', '0', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('93', 'Vickie Guerrero', 'Vickie Guerrero', 'vickieguerrero', '12', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('94', 'Wade Barrett', 'Wade Barrett', 'wadebarrett', '2', '0', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('95', 'William Regal', 'William Regal', 'williamregal', '1', '0', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('96', 'Yoshi Tatsu', 'Yoshi Tatsu', 'yoshitatsu', '1', '1', '2', null, null, '1');
INSERT INTO `superstars` VALUES ('97', 'Adrian Neville', 'Adrian Neville', 'adrianneville', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('98', 'Aiden English', 'Aiden English', 'aidenenglish', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('99', 'Alexa Bliss', 'Alexa Bliss', 'alexabliss', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('100', 'Alexander Rusev', 'Alexander Rusev', 'alexanderrusev', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('101', 'Angelo Dawkins', 'Angelo Dawkins', 'angelodawkins', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('102', 'Baron Corbin', 'Baron Corbin', 'baroncorbin', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('103', 'Bayley', 'Bayley', 'bayley', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('104', 'Bo Dallas', 'Bo Dallas', 'bo-dallas', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('105', 'Byron Saxton', 'Byron Saxton', 'byronsaxton', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('106', 'Charlotte', 'Charlotte', 'charlotte', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('107', 'CJ Parker', 'CJ Parker', 'cjparker', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('108', 'Colin Cassady', 'Colin Cassady', 'colincassady', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('109', 'Conor O\'Brian', 'Conor O\'Brian', 'conorobrian', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('110', 'Corey Graves', 'Corey Graves', 'coreygraves', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('111', 'Danny Burch', 'Danny Burch', 'dannyburch', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('112', 'Emma', 'Emma', 'emma', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('113', 'Enzo Amore', 'Enzo Amore', 'enzoamore', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('114', 'Jason Jordan', 'Jason Jordan', 'jasonjordan', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('115', 'Judas Devlin', 'Judas Devlin', 'judasdevlin', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('116', 'Kassius Ohno', 'Kassius Ohno', 'kassiusohno', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('117', 'Kendall Skye', 'Kendall Skye', 'kendallskye', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('118', 'Knuckles Madsen', 'Knuckles Madsen', 'knucklesmadsen', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('119', 'Leo Kruger', 'Leo Kruger', 'leokruger', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('120', 'Mason Ryan', 'Mason Ryan', 'masonryan', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('121', 'Mickey Keegan', 'Mickey Keegan', 'axlkeegan', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('122', 'Mojo Rawley', 'Mojo Rawley', 'mojorawley', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('123', 'Oliver Grey', 'Oliver Grey', 'olivergrey', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('124', 'Paige', 'Paige', 'paige', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('125', 'Rick Victor', 'Rick Victor', 'rickvictor', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('126', 'Sami Zayn', 'Sami Zayn', 'samizayn', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('127', 'Sasha Banks', 'Sasha Banks', 'sashabanks', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('128', 'Sawyer Fulton', 'Sawyer Fulton', 'sawyerfulton', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('129', 'Scott Dawson', 'Scott Dawson', 'scottdawson', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('130', 'Sylvester Lefort', 'Sylvester Lefort', 'sylvesterlefort', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('131', 'Tom Phillips', 'Tom Phillips', 'tomphillips', '6', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('132', 'Travis Tyler', 'Travis Tyler', 'travistyler', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('133', 'Troy McClain', 'Troy McClain', 'troymcclain', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('134', 'Tyler Breeze', 'Tyler Breeze', 'tylerbreeze', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('135', 'Xavier Woods', 'Xavier Woods', 'xavierwoods', '11', '1', '3', null, null, '1');
INSERT INTO `superstars` VALUES ('136', 'Rob Van Dam', 'RVD', 'robvandam', '3', '0', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('138', 'Cody Rhodes', 'Cody Rhodes', 'codyrhodes', '2', '1', '1', null, '6', '1');
INSERT INTO `superstars` VALUES ('139', 'Goldust', 'Goldust', 'goldust', '2', '1', '1', null, '6', '1');
INSERT INTO `superstars` VALUES ('140', 'Chad Patton', 'Chad Patton', 'chadpatton', '4', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('141', 'Charles Robinson', 'Charles Robinson', 'charlesrobinson', '4', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('142', 'John Cone', 'John Cone', 'johncone', '4', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('143', 'Justin King', 'Justin King', 'justinking', '4', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('144', 'Mike Chioda', 'Mike Chioda', 'mikechioda', '4', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('145', 'Rod Zapata', 'Rod Zapata', 'rodzapata', '4', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('146', 'Marc Harris', 'Marc Harris', 'marcharri', '4', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('147', 'Darrick Moore', 'Darrick Moore', 'darrickmoore', '4', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('148', 'Jason Ayers', 'Jason Ayers', 'jasonayers', '4', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('149', 'Matt Bennett', 'Matt Bennett', 'mattbennett', '4', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('150', 'Rudy Charles', 'Rudy Charles', 'rudycharles', '4', '1', '1', null, null, '1');
INSERT INTO `superstars` VALUES ('151', 'Ryan Tran', 'Ryan Tran', 'ryantran', '4', '1', '1', null, null, '1');

-- ----------------------------
-- Records of tiers
-- ----------------------------
INSERT INTO `tiers` VALUES ('1', 'Undercard');
INSERT INTO `tiers` VALUES ('2', 'Midcard');
INSERT INTO `tiers` VALUES ('3', 'Main Event');
INSERT INTO `tiers` VALUES ('4', 'Referee');
INSERT INTO `tiers` VALUES ('5', 'Announcer');
INSERT INTO `tiers` VALUES ('6', 'Commentator');
INSERT INTO `tiers` VALUES ('7', 'Diva');
INSERT INTO `tiers` VALUES ('8', 'Manager');
INSERT INTO `tiers` VALUES ('9', 'Corporate');
INSERT INTO `tiers` VALUES ('10', 'Reporter');
INSERT INTO `tiers` VALUES ('11', 'Developmental');
INSERT INTO `tiers` VALUES ('12', 'General Manager');

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'sean', 'zyos', 'Sean3z', 'seanwragg@gmail.com', '2013-12-28 12:24:25', 'http://www.gravatar.com/avatar/a4b372c704f7c131e636812e746c2f98.jpg?s=45&d=mm', '0', 'fb97001ef554e460fe494d1637702a33');
