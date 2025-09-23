/*
MariaDB Backup
Database: l2junionfree
Backup Time: 2025-09-22 21:32:56
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `l2junionfree`.`accounts`;
DROP TABLE IF EXISTS `l2junionfree`.`aio_skills`;
DROP TABLE IF EXISTS `l2junionfree`.`auction_table`;
DROP TABLE IF EXISTS `l2junionfree`.`auctions`;
DROP TABLE IF EXISTS `l2junionfree`.`augmentations`;
DROP TABLE IF EXISTS `l2junionfree`.`auto_farm_ip`;
DROP TABLE IF EXISTS `l2junionfree`.`autofarm_areas`;
DROP TABLE IF EXISTS `l2junionfree`.`autofarm_nodes`;
DROP TABLE IF EXISTS `l2junionfree`.`banned_ips`;
DROP TABLE IF EXISTS `l2junionfree`.`bbs_favorite`;
DROP TABLE IF EXISTS `l2junionfree`.`bbs_forum`;
DROP TABLE IF EXISTS `l2junionfree`.`bbs_mail`;
DROP TABLE IF EXISTS `l2junionfree`.`bbs_post`;
DROP TABLE IF EXISTS `l2junionfree`.`bbs_topic`;
DROP TABLE IF EXISTS `l2junionfree`.`bookmarks`;
DROP TABLE IF EXISTS `l2junionfree`.`buffer_schemes`;
DROP TABLE IF EXISTS `l2junionfree`.`buylists`;
DROP TABLE IF EXISTS `l2junionfree`.`castle`;
DROP TABLE IF EXISTS `l2junionfree`.`castle_doorupgrade`;
DROP TABLE IF EXISTS `l2junionfree`.`castle_manor_procure`;
DROP TABLE IF EXISTS `l2junionfree`.`castle_manor_production`;
DROP TABLE IF EXISTS `l2junionfree`.`castle_trapupgrade`;
DROP TABLE IF EXISTS `l2junionfree`.`character_aio`;
DROP TABLE IF EXISTS `l2junionfree`.`character_aio_skills_backup`;
DROP TABLE IF EXISTS `l2junionfree`.`character_autofarm`;
DROP TABLE IF EXISTS `l2junionfree`.`character_evolutions`;
DROP TABLE IF EXISTS `l2junionfree`.`character_hennas`;
DROP TABLE IF EXISTS `l2junionfree`.`character_macroses`;
DROP TABLE IF EXISTS `l2junionfree`.`character_memo`;
DROP TABLE IF EXISTS `l2junionfree`.`character_quests`;
DROP TABLE IF EXISTS `l2junionfree`.`character_raid_points`;
DROP TABLE IF EXISTS `l2junionfree`.`character_recipebook`;
DROP TABLE IF EXISTS `l2junionfree`.`character_recommends`;
DROP TABLE IF EXISTS `l2junionfree`.`character_relations`;
DROP TABLE IF EXISTS `l2junionfree`.`character_shortcuts`;
DROP TABLE IF EXISTS `l2junionfree`.`character_skills`;
DROP TABLE IF EXISTS `l2junionfree`.`character_skills_save`;
DROP TABLE IF EXISTS `l2junionfree`.`character_subclasses`;
DROP TABLE IF EXISTS `l2junionfree`.`characters`;
DROP TABLE IF EXISTS `l2junionfree`.`clan_data`;
DROP TABLE IF EXISTS `l2junionfree`.`clan_privs`;
DROP TABLE IF EXISTS `l2junionfree`.`clan_skills`;
DROP TABLE IF EXISTS `l2junionfree`.`clan_subpledges`;
DROP TABLE IF EXISTS `l2junionfree`.`clan_wars`;
DROP TABLE IF EXISTS `l2junionfree`.`clanhall`;
DROP TABLE IF EXISTS `l2junionfree`.`clanhall_flagwar_attackers`;
DROP TABLE IF EXISTS `l2junionfree`.`clanhall_flagwar_members`;
DROP TABLE IF EXISTS `l2junionfree`.`clanhall_flagwar_owner_npcs`;
DROP TABLE IF EXISTS `l2junionfree`.`clanhall_functions`;
DROP TABLE IF EXISTS `l2junionfree`.`clanhall_siege_attackers`;
DROP TABLE IF EXISTS `l2junionfree`.`connection_logs`;
DROP TABLE IF EXISTS `l2junionfree`.`cursed_weapons`;
DROP TABLE IF EXISTS `l2junionfree`.`custom_spawns`;
DROP TABLE IF EXISTS `l2junionfree`.`event_pvp_config`;
DROP TABLE IF EXISTS `l2junionfree`.`event_pvp_locations`;
DROP TABLE IF EXISTS `l2junionfree`.`event_pvp_players`;
DROP TABLE IF EXISTS `l2junionfree`.`fishing_championship`;
DROP TABLE IF EXISTS `l2junionfree`.`games`;
DROP TABLE IF EXISTS `l2junionfree`.`gameservers`;
DROP TABLE IF EXISTS `l2junionfree`.`grandboss_list`;
DROP TABLE IF EXISTS `l2junionfree`.`heroes`;
DROP TABLE IF EXISTS `l2junionfree`.`heroes_diary`;
DROP TABLE IF EXISTS `l2junionfree`.`items`;
DROP TABLE IF EXISTS `l2junionfree`.`items_on_ground`;
DROP TABLE IF EXISTS `l2junionfree`.`mdt_bets`;
DROP TABLE IF EXISTS `l2junionfree`.`mdt_history`;
DROP TABLE IF EXISTS `l2junionfree`.`mods_wedding`;
DROP TABLE IF EXISTS `l2junionfree`.`olympiad_fights`;
DROP TABLE IF EXISTS `l2junionfree`.`olympiad_nobles`;
DROP TABLE IF EXISTS `l2junionfree`.`olympiad_nobles_eom`;
DROP TABLE IF EXISTS `l2junionfree`.`pcbang_points`;
DROP TABLE IF EXISTS `l2junionfree`.`petition`;
DROP TABLE IF EXISTS `l2junionfree`.`petition_message`;
DROP TABLE IF EXISTS `l2junionfree`.`pets`;
DROP TABLE IF EXISTS `l2junionfree`.`rainbowsprings_attacker_list`;
DROP TABLE IF EXISTS `l2junionfree`.`server_memo`;
DROP TABLE IF EXISTS `l2junionfree`.`seven_signs`;
DROP TABLE IF EXISTS `l2junionfree`.`seven_signs_festival`;
DROP TABLE IF EXISTS `l2junionfree`.`seven_signs_status`;
DROP TABLE IF EXISTS `l2junionfree`.`siege_clans`;
DROP TABLE IF EXISTS `l2junionfree`.`spawn_data`;
DROP TABLE IF EXISTS `l2junionfree`.`starter_kits`;
CREATE TABLE `accounts`  (
  `login` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `password` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `last_active` bigint(20) NOT NULL DEFAULT 0,
  `access_level` int(11) NOT NULL DEFAULT 0,
  `last_server` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`login`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `aio_skills`  (
  `skill_id` int(11) NOT NULL,
  `skill_level` int(11) NOT NULL,
  PRIMARY KEY (`skill_id`, `skill_level`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
CREATE TABLE `auction_table`  (
  `auctionid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ownerid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `itemid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `enchant` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `costid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `costcount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`auctionid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `auctions`  (
  `clanhall_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `bidder_name` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `clan_oid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `clan_name` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `max_bid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `time_bid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`clanhall_id`, `clan_oid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `augmentations`  (
  `item_oid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `attributes` int(11) NOT NULL DEFAULT -1,
  `skill_id` int(11) NOT NULL DEFAULT -1,
  `skill_level` int(11) NOT NULL DEFAULT -1,
  PRIMARY KEY (`item_oid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `auto_farm_ip`  (
  `char_id` int(11) NOT NULL,
  `ip` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `autofarm_areas`  (
  `player_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `area_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(44) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `type` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`player_id`, `area_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `autofarm_nodes`  (
  `node_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `area_id` int(11) NOT NULL DEFAULT 0,
  `loc_x` int(11) NOT NULL DEFAULT 0,
  `loc_y` int(11) NOT NULL DEFAULT 0,
  `loc_z` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`area_id`, `node_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `banned_ips`  (
  `ip` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `timestamp_banned` datetime NULL DEFAULT NULL,
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ip`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `bbs_favorite`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `player_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bypass` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `bbs_forum`  (
  `id` int(11) NOT NULL DEFAULT 0,
  `type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `access` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `owner_id` int(11) NOT NULL DEFAULT 0,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `bbs_mail`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `receiver_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sender_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `location` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `recipients` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `subject` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `message` varchar(3000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sent_date` timestamp NULL DEFAULT NULL,
  `is_unread` smallint(6) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `bbs_post`  (
  `id` int(11) NOT NULL DEFAULT 0,
  `owner_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `owner_id` int(11) NOT NULL DEFAULT 0,
  `date` decimal(20, 0) NOT NULL DEFAULT 0,
  `topic_id` int(11) NOT NULL DEFAULT 0,
  `forum_id` int(11) NOT NULL DEFAULT 0,
  `txt` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `bbs_topic`  (
  `id` int(11) NOT NULL DEFAULT 0,
  `forum_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `date` decimal(20, 0) NOT NULL DEFAULT 0,
  `owner_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `owner_id` int(11) NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `bookmarks`  (
  `name` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `obj_Id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `x` mediumint(9) NULL DEFAULT NULL,
  `y` mediumint(9) NULL DEFAULT NULL,
  `z` mediumint(9) NULL DEFAULT NULL,
  PRIMARY KEY (`name`, `obj_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `buffer_schemes`  (
  `object_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `scheme_name` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'default',
  `skills` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`object_id`, `scheme_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `buylists`  (
  `buylist_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `next_restock_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`buylist_id`, `item_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `castle`  (
  `id` int(11) NOT NULL DEFAULT 0,
  `currentTaxPercent` int(11) NOT NULL DEFAULT 0,
  `nextTaxPercent` int(11) NOT NULL DEFAULT 0,
  `treasury` bigint(20) NOT NULL DEFAULT 0,
  `taxRevenue` bigint(20) NOT NULL DEFAULT 0,
  `seedIncome` bigint(20) NOT NULL DEFAULT 0,
  `siegeDate` decimal(20, 0) NOT NULL DEFAULT 0,
  `regTimeOver` enum('true','false') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'true',
  `certificates` smallint(6) NOT NULL DEFAULT 300,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `castle_doorupgrade`  (
  `doorId` int(11) NOT NULL DEFAULT 0,
  `hp` tinyint(4) NOT NULL DEFAULT 0,
  `castleId` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`doorId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `castle_manor_procure`  (
  `castle_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `crop_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `start_amount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `reward_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `next_period` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`castle_id`, `crop_id`, `next_period`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `castle_manor_production`  (
  `castle_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `seed_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `start_amount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `next_period` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`castle_id`, `seed_id`, `next_period`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `castle_trapupgrade`  (
  `castleId` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `towerIndex` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `level` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`towerIndex`, `castleId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `character_aio`  (
  `obj_Id` int(10) UNSIGNED NOT NULL,
  `expireTime` bigint(20) NOT NULL,
  PRIMARY KEY (`obj_Id`) USING BTREE,
  CONSTRAINT `fk_character_aio` FOREIGN KEY (`obj_Id`) REFERENCES `l2junionfree`.`characters` (`obj_Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
CREATE TABLE `character_aio_skills_backup`  (
  `obj_Id` int(10) UNSIGNED NOT NULL,
  `skill_id` int(11) NOT NULL,
  `skill_level` int(11) NOT NULL,
  PRIMARY KEY (`obj_Id`, `skill_id`) USING BTREE,
  CONSTRAINT `fk_aio_skills_backup` FOREIGN KEY (`obj_Id`) REFERENCES `l2junionfree`.`characters` (`obj_Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
CREATE TABLE `character_autofarm`  (
  `char_id` int(11) NOT NULL,
  `char_name` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `radius` int(11) NOT NULL DEFAULT 1200,
  `short_cut` int(11) NOT NULL DEFAULT 9,
  `heal_percent` int(11) NOT NULL DEFAULT 30,
  `buff_protection` tinyint(1) NOT NULL DEFAULT 0,
  `anti_ks_protection` tinyint(1) NOT NULL DEFAULT 0,
  `summon_attack` tinyint(1) NOT NULL DEFAULT 0,
  `summon_skill_percent` int(11) NOT NULL DEFAULT 0,
  `hp_potion_percent` int(11) NOT NULL DEFAULT 60,
  `mp_potion_percent` int(11) NOT NULL DEFAULT 60,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `character_evolutions`  (
  `charId` int(10) UNSIGNED NOT NULL,
  `evolution_count` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `chosen_skill_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `skill_level` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `last_evolution` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`charId`) USING BTREE,
  CONSTRAINT `character_evolutions_ibfk_1` FOREIGN KEY (`charId`) REFERENCES `l2junionfreee`.`characters` (`obj_Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
CREATE TABLE `character_hennas`  (
  `char_obj_id` int(11) NOT NULL DEFAULT 0,
  `symbol_id` int(11) NULL DEFAULT NULL,
  `slot` int(11) NOT NULL DEFAULT 0,
  `class_index` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_obj_id`, `slot`, `class_index`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `character_macroses`  (
  `char_obj_id` int(11) NOT NULL DEFAULT 0,
  `id` int(11) NOT NULL DEFAULT 0,
  `icon` int(11) NULL DEFAULT NULL,
  `name` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `descr` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `acronym` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `commands` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`char_obj_id`, `id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `character_memo`  (
  `charId` int(10) UNSIGNED NOT NULL,
  `var` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `val` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`charId`, `var`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `character_quests`  (
  `charId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `var` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `value` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`charId`, `name`, `var`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `character_raid_points`  (
  `char_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `boss_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `points` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_id`, `boss_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `character_recipebook`  (
  `charId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `recipeId` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`charId`, `recipeId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `character_recommends`  (
  `char_id` int(11) NOT NULL DEFAULT 0,
  `target_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_id`, `target_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `character_relations`  (
  `char_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `friend_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `relation` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_id`, `friend_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `character_shortcuts`  (
  `char_obj_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `slot` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `page` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'NONE',
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `level` smallint(6) NOT NULL DEFAULT 0,
  `class_index` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_obj_id`, `slot`, `page`, `class_index`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `character_skills`  (
  `char_obj_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `skill_id` int(11) NOT NULL DEFAULT 0,
  `skill_level` int(11) NOT NULL DEFAULT 1,
  `class_index` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_obj_id`, `skill_id`, `class_index`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `character_skills_save`  (
  `char_obj_id` int(11) NOT NULL DEFAULT 0,
  `skill_id` int(11) NOT NULL DEFAULT 0,
  `skill_level` int(11) NOT NULL DEFAULT 1,
  `effect_count` int(11) NOT NULL DEFAULT 0,
  `effect_cur_time` int(11) NOT NULL DEFAULT 0,
  `reuse_delay` int(11) NOT NULL DEFAULT 0,
  `systime` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `restore_type` int(11) NOT NULL DEFAULT 0,
  `class_index` int(11) NOT NULL DEFAULT 0,
  `buff_index` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_obj_id`, `skill_id`, `skill_level`, `class_index`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `character_subclasses`  (
  `char_obj_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `class_id` int(11) NOT NULL DEFAULT 0,
  `exp` decimal(20, 0) NOT NULL DEFAULT 0,
  `sp` decimal(11, 0) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 40,
  `class_index` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_obj_id`, `class_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `characters`  (
  `account_name` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `obj_Id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `char_name` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `level` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `maxHp` mediumint(8) UNSIGNED NULL DEFAULT NULL,
  `curHp` mediumint(8) UNSIGNED NULL DEFAULT NULL,
  `maxCp` mediumint(8) UNSIGNED NULL DEFAULT NULL,
  `curCp` mediumint(8) UNSIGNED NULL DEFAULT NULL,
  `maxMp` mediumint(8) UNSIGNED NULL DEFAULT NULL,
  `curMp` mediumint(8) UNSIGNED NULL DEFAULT NULL,
  `face` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `hairStyle` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `hairColor` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `sex` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `heading` mediumint(9) NULL DEFAULT NULL,
  `x` mediumint(9) NULL DEFAULT NULL,
  `y` mediumint(9) NULL DEFAULT NULL,
  `z` mediumint(9) NULL DEFAULT NULL,
  `exp` bigint(20) UNSIGNED NULL DEFAULT 0,
  `expBeforeDeath` bigint(20) UNSIGNED NULL DEFAULT 0,
  `sp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `karma` int(10) UNSIGNED NULL DEFAULT NULL,
  `pvpkills` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `pkkills` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `clanid` int(10) UNSIGNED NULL DEFAULT NULL,
  `race` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `classid` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `base_class` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `deletetime` bigint(20) NULL DEFAULT NULL,
  `title` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rec_have` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `rec_left` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `accesslevel` mediumint(9) NULL DEFAULT 0,
  `online` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `onlinetime` int(11) NULL DEFAULT NULL,
  `lastAccess` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `wantspeace` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `isin7sdungeon` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `punish_level` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `punish_timer` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `power_grade` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `nobless` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `hero` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `subpledge` smallint(6) NOT NULL DEFAULT 0,
  `lvl_joined_academy` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `apprentice` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sponsor` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `varka_ketra_ally` tinyint(4) NOT NULL DEFAULT 0,
  `clan_join_expiry_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `clan_create_expiry_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `death_penalty_level` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`obj_Id`) USING BTREE,
  INDEX `clanid`(`clanid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `clan_data`  (
  `clan_id` int(11) NOT NULL DEFAULT 0,
  `clan_name` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `clan_level` int(11) NOT NULL DEFAULT 0,
  `reputation_score` int(11) NOT NULL DEFAULT 0,
  `hasCastle` tinyint(4) NOT NULL DEFAULT 0,
  `ally_id` int(11) NOT NULL DEFAULT 0,
  `ally_name` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `leader_id` int(11) NOT NULL DEFAULT 0,
  `new_leader_id` int(11) NOT NULL DEFAULT 0,
  `crest_id` int(11) NOT NULL DEFAULT 0,
  `crest_large_id` int(11) NOT NULL DEFAULT 0,
  `ally_crest_id` int(11) NOT NULL DEFAULT 0,
  `auction_bid_at` int(11) NOT NULL DEFAULT 0,
  `ally_penalty_expiry_time` bigint(20) NOT NULL DEFAULT 0,
  `ally_penalty_type` int(11) NOT NULL DEFAULT 0,
  `char_penalty_expiry_time` bigint(20) NOT NULL DEFAULT 0,
  `dissolving_expiry_time` bigint(20) NOT NULL DEFAULT 0,
  `enabled` tinyint(4) NOT NULL DEFAULT 0,
  `notice` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `introduction` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`clan_id`) USING BTREE,
  INDEX `leader_id`(`leader_id`) USING BTREE,
  INDEX `ally_id`(`ally_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `clan_privs`  (
  `clan_id` int(11) NOT NULL DEFAULT 0,
  `ranking` int(11) NOT NULL DEFAULT 0,
  `privs` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`clan_id`, `ranking`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `clan_skills`  (
  `clan_id` int(11) NOT NULL DEFAULT 0,
  `skill_id` int(11) NOT NULL DEFAULT 0,
  `skill_level` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`clan_id`, `skill_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `clan_subpledges`  (
  `clan_id` int(11) NOT NULL DEFAULT 0,
  `sub_pledge_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `leader_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`clan_id`, `sub_pledge_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `clan_wars`  (
  `clan1` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `clan2` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `expiry_time` decimal(20, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`clan1`, `clan2`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `clanhall`  (
  `id` tinyint(4) NOT NULL DEFAULT 0,
  `ownerId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `paidUntil` bigint(20) NOT NULL DEFAULT 0,
  `paid` tinyint(4) NOT NULL DEFAULT 0,
  `sellerBid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sellerName` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `sellerClanName` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `endDate` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `clanhall_flagwar_attackers`  (
  `clanhall_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `flag` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `npc` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `clan_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`flag`) USING BTREE,
  INDEX `hall_id`(`clanhall_id`) USING BTREE,
  INDEX `clan_id`(`clan_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `clanhall_flagwar_members`  (
  `clanhall_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `clan_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `object_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  INDEX `clanhall_id`(`clanhall_id`) USING BTREE,
  INDEX `clan_id`(`clan_id`) USING BTREE,
  INDEX `object_id`(`object_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `clanhall_flagwar_owner_npcs`  (
  `clanhall_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `npc_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `clan_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`clanhall_id`) USING BTREE,
  INDEX `npc_id`(`npc_id`) USING BTREE,
  INDEX `clan_id`(`clan_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `clanhall_functions`  (
  `hall_id` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `lvl` int(11) NOT NULL DEFAULT 0,
  `lease` int(11) NOT NULL DEFAULT 0,
  `rate` decimal(20, 0) NOT NULL DEFAULT 0,
  `endTime` decimal(20, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`hall_id`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `clanhall_siege_attackers`  (
  `clanhall_id` tinyint(4) NOT NULL DEFAULT 0,
  `attacker_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`clanhall_id`, `attacker_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `connection_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nickname` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `port` int(11) NULL DEFAULT NULL,
  `country` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `timestamp` datetime NULL DEFAULT NULL,
  `sqli_detected` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `cursed_weapons`  (
  `itemId` int(11) NOT NULL,
  `playerId` int(11) NULL DEFAULT 0,
  `playerKarma` int(11) NULL DEFAULT 0,
  `playerPkKills` int(11) NULL DEFAULT 0,
  `nbKills` int(11) NULL DEFAULT 0,
  `currentStage` int(11) NULL DEFAULT 0,
  `numberBeforeNextStage` int(11) NULL DEFAULT 0,
  `hungryTime` int(11) NULL DEFAULT 0,
  `endTime` decimal(20, 0) NULL DEFAULT 0,
  PRIMARY KEY (`itemId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `custom_spawns`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `npc_id` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `z` int(11) NOT NULL,
  `heading` int(11) NOT NULL DEFAULT 0,
  `respawn_delay` int(11) NOT NULL DEFAULT 0,
  `spawn_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_npc`(`npc_id`) USING BTREE,
  INDEX `idx_location`(`x`, `y`, `z`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
CREATE TABLE `event_pvp_config`  (
  `event_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'PvP Event',
  `min_level` int(11) NOT NULL DEFAULT 40,
  `max_level` int(11) NOT NULL DEFAULT 85,
  `max_players` int(11) NOT NULL DEFAULT 50,
  `event_duration` int(11) NOT NULL DEFAULT 60,
  `points_per_kill` int(11) NOT NULL DEFAULT 5,
  `points_for_hero` int(11) NOT NULL DEFAULT 100,
  `hero_duration` int(11) NOT NULL DEFAULT 24,
  `preparation_time` int(11) NOT NULL DEFAULT 20,
  `registration_time` int(11) NOT NULL DEFAULT 5,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `schedule_times` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '18:00,20:00,22:00',
  PRIMARY KEY (`event_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `event_pvp_locations`  (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `z` int(11) NOT NULL,
  `is_spawn` tinyint(1) NOT NULL DEFAULT 0,
  `is_arena` tinyint(1) NOT NULL DEFAULT 0,
  `is_return` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`location_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `event_pvp_players`  (
  `char_id` int(11) NOT NULL,
  `char_name` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `kills` int(11) NOT NULL DEFAULT 0,
  `deaths` int(11) NOT NULL DEFAULT 0,
  `is_playing` tinyint(1) NOT NULL DEFAULT 0,
  `last_participation` timestamp NULL DEFAULT NULL,
  `hero_until` timestamp NULL DEFAULT NULL,
  `banned_until` timestamp NULL DEFAULT NULL,
  `current_event` tinyint(1) NOT NULL DEFAULT 0,
  `total_hero_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `fishing_championship`  (
  `player_name` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fish_length` double(10, 3) NOT NULL,
  `rewarded` int(11) NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `games`  (
  `id` int(11) NOT NULL DEFAULT 0,
  `idnr` int(11) NOT NULL DEFAULT 0,
  `number1` int(11) NOT NULL DEFAULT 0,
  `number2` int(11) NOT NULL DEFAULT 0,
  `prize` int(11) NOT NULL DEFAULT 0,
  `newprize` int(11) NOT NULL DEFAULT 0,
  `prize1` int(11) NOT NULL DEFAULT 0,
  `prize2` int(11) NOT NULL DEFAULT 0,
  `prize3` int(11) NOT NULL DEFAULT 0,
  `enddate` decimal(20, 0) NOT NULL DEFAULT 0,
  `finished` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`, `idnr`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `gameservers`  (
  `server_id` int(11) NOT NULL DEFAULT 0,
  `hexid` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `host` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`server_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `grandboss_list`  (
  `player_id` decimal(11, 0) NOT NULL,
  `zone` decimal(11, 0) NOT NULL,
  PRIMARY KEY (`player_id`, `zone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `heroes`  (
  `char_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `class_id` decimal(3, 0) NOT NULL DEFAULT 0,
  `count` decimal(3, 0) NOT NULL DEFAULT 0,
  `played` decimal(1, 0) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `message` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `heroes_diary`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `action` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `param` int(10) UNSIGNED NOT NULL DEFAULT 0,
  INDEX `char_id`(`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `items`  (
  `owner_id` int(11) NULL DEFAULT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `item_id` smallint(5) UNSIGNED NOT NULL,
  `count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `enchant_level` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `loc` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `loc_data` int(11) NULL DEFAULT NULL,
  `custom_type1` int(11) NOT NULL DEFAULT 0,
  `custom_type2` int(11) NOT NULL DEFAULT 0,
  `mana_left` int(11) NOT NULL DEFAULT -1,
  `time` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `items_on_ground`  (
  `object_id` int(11) NOT NULL DEFAULT 0,
  `item_id` int(11) NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL,
  `enchant_level` int(11) NULL DEFAULT NULL,
  `x` int(11) NULL DEFAULT NULL,
  `y` int(11) NULL DEFAULT NULL,
  `z` int(11) NULL DEFAULT NULL,
  `time` decimal(20, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`object_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `mdt_bets`  (
  `lane_id` int(11) NOT NULL DEFAULT 0,
  `bet` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`lane_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `mdt_history`  (
  `race_id` mediumint(9) NOT NULL DEFAULT 0,
  `first` int(11) NULL DEFAULT 0,
  `second` int(11) NULL DEFAULT 0,
  `odd_rate` double(10, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`race_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `mods_wedding`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `requesterId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `partnerId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `olympiad_fights`  (
  `charOneId` int(10) UNSIGNED NOT NULL,
  `charTwoId` int(10) UNSIGNED NOT NULL,
  `charOneClass` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `charTwoClass` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `winner` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `start` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `classed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  INDEX `charOneId`(`charOneId`) USING BTREE,
  INDEX `charTwoId`(`charTwoId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `olympiad_nobles`  (
  `char_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `class_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `olympiad_points` int(11) NOT NULL DEFAULT 0,
  `competitions_done` smallint(6) NOT NULL DEFAULT 0,
  `competitions_won` smallint(6) NOT NULL DEFAULT 0,
  `competitions_lost` smallint(6) NOT NULL DEFAULT 0,
  `competitions_drawn` smallint(6) NOT NULL DEFAULT 0,
  `rewarded` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `olympiad_nobles_eom`  (
  `char_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `class_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `olympiad_points` int(11) NOT NULL DEFAULT 0,
  `competitions_done` smallint(6) NOT NULL DEFAULT 0,
  `competitions_won` smallint(6) NOT NULL DEFAULT 0,
  `competitions_lost` smallint(6) NOT NULL DEFAULT 0,
  `competitions_drawn` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `pcbang_points`  (
  `player_id` int(10) UNSIGNED NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`player_id`) USING BTREE,
  CONSTRAINT `pcbang_points_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `l2junionfree`.`characters` (`obj_Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `petition`  (
  `oid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `petitioner_oid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `submit_date` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `content` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `is_unread` smallint(6) NOT NULL DEFAULT 1,
  `state` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rate` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `feedback` varchar(512) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `responders` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `petition_message`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `petition_oid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `player_oid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `player_name` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `content` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`, `petition_oid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `pets`  (
  `item_obj_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `name` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `level` decimal(11, 0) NULL DEFAULT NULL,
  `curHp` decimal(18, 0) NULL DEFAULT NULL,
  `curMp` decimal(18, 0) NULL DEFAULT NULL,
  `exp` decimal(20, 0) NULL DEFAULT NULL,
  `sp` decimal(11, 0) NULL DEFAULT NULL,
  `fed` decimal(11, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`item_obj_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `rainbowsprings_attacker_list`  (
  `clanId` int(11) NOT NULL DEFAULT 0,
  `war_decrees_count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`clanId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `server_memo`  (
  `var` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `value` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`var`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `seven_signs`  (
  `char_obj_id` int(11) NOT NULL DEFAULT 0,
  `cabal` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'NORMAL',
  `seal` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'NONE',
  `red_stones` int(11) NOT NULL DEFAULT 0,
  `green_stones` int(11) NOT NULL DEFAULT 0,
  `blue_stones` int(11) NOT NULL DEFAULT 0,
  `ancient_adena_amount` decimal(20, 0) NOT NULL DEFAULT 0,
  `contribution_score` decimal(20, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_obj_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `seven_signs_festival`  (
  `festivalId` int(11) NOT NULL DEFAULT 0,
  `cabal` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `cycle` int(11) NOT NULL DEFAULT 0,
  `date` bigint(20) NULL DEFAULT 0,
  `score` int(11) NOT NULL DEFAULT 0,
  `members` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`festivalId`, `cabal`, `cycle`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `seven_signs_status`  (
  `id` int(11) NOT NULL DEFAULT 0,
  `current_cycle` int(11) NOT NULL DEFAULT 1,
  `festival_cycle` int(11) NOT NULL DEFAULT 1,
  `active_period` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'COMPETITION',
  `date` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `previous_winner` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'NORMAL',
  `dawn_stone_score` decimal(20, 0) NOT NULL DEFAULT 0,
  `dawn_festival_score` int(11) NOT NULL DEFAULT 0,
  `dusk_stone_score` decimal(20, 0) NOT NULL DEFAULT 0,
  `dusk_festival_score` int(11) NOT NULL DEFAULT 0,
  `avarice_owner` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'NORMAL',
  `gnosis_owner` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'NORMAL',
  `strife_owner` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'NORMAL',
  `avarice_dawn_score` int(11) NOT NULL DEFAULT 0,
  `gnosis_dawn_score` int(11) NOT NULL DEFAULT 0,
  `strife_dawn_score` int(11) NOT NULL DEFAULT 0,
  `avarice_dusk_score` int(11) NOT NULL DEFAULT 0,
  `gnosis_dusk_score` int(11) NOT NULL DEFAULT 0,
  `strife_dusk_score` int(11) NOT NULL DEFAULT 0,
  `accumulated_bonus0` int(11) NOT NULL DEFAULT 0,
  `accumulated_bonus1` int(11) NOT NULL DEFAULT 0,
  `accumulated_bonus2` int(11) NOT NULL DEFAULT 0,
  `accumulated_bonus3` int(11) NOT NULL DEFAULT 0,
  `accumulated_bonus4` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `siege_clans`  (
  `castle_id` tinyint(4) NOT NULL DEFAULT 0,
  `clan_id` int(11) NOT NULL DEFAULT 0,
  `type` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'PENDING',
  PRIMARY KEY (`castle_id`, `clan_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `spawn_data`  (
  `name` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `current_hp` int(10) UNSIGNED NOT NULL,
  `current_mp` int(10) UNSIGNED NOT NULL,
  `loc_x` int(11) NOT NULL DEFAULT 0,
  `loc_y` int(11) NOT NULL DEFAULT 0,
  `loc_z` int(11) NOT NULL DEFAULT 0,
  `heading` mediumint(9) NOT NULL DEFAULT 0,
  `db_value` smallint(6) NOT NULL DEFAULT 0,
  `respawn_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
CREATE TABLE `starter_kits`  (
  `charId` int(11) NOT NULL,
  `received` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`charId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
BEGIN;
LOCK TABLES `l2junionfree`.`accounts` WRITE;
DELETE FROM `l2junionfree`.`accounts`;
INSERT INTO `l2junionfree`.`accounts` (`login`,`password`,`last_active`,`access_level`,`last_server`) VALUES ('admin', '$2a$10$H2q6oqojUB2cTpSUmswXXOXsM3NoevtXDYoZFR/upO1XZN47js4Li', 1758524419660, 0, 1),('prueva', '$2a$10$AvY8iDFgkXrgi5p46aGJVeuLUDmJ42roRqC6zgCP.4ixYOStKkSIa', 1758517655894, 0, 1),('prueva1', '$2a$10$XZOED/3GbY96SMkWTPlv/OLIjrmA1eiNUkHlXOreNSXm4dgs1XkaK', 1758151431145, 0, 1)
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`aio_skills` WRITE;
DELETE FROM `l2junionfree`.`aio_skills`;
INSERT INTO `l2junionfree`.`aio_skills` (`skill_id`,`skill_level`) VALUES (168, 3),(213, 8),(228, 3),(229, 7),(234, 23),(264, 1),(265, 1),(266, 1),(267, 1),(268, 1),(269, 1),(270, 1),(271, 1),(272, 1),(273, 1),(274, 1),(275, 1),(276, 1),(277, 1),(304, 1),(305, 1),(306, 1),(307, 1),(308, 1),(309, 1),(310, 1),(311, 1),(349, 1),(363, 1),(364, 1),(365, 1),(366, 1),(544, 1),(545, 1),(1003, 3),(1005, 3),(1006, 3),(1007, 3),(1009, 3),(1032, 3),(1033, 3),(1035, 4),(1036, 2),(1040, 3),(1044, 3),(1045, 6),(1048, 6),(1059, 3),(1062, 2),(1068, 3),(1073, 2),(1077, 3),(1078, 6),(1085, 3),(1086, 2),(1087, 3),(1182, 3),(1189, 3),(1191, 3),(1204, 2),(1217, 33),(1218, 33),(1219, 33),(1229, 15),(1240, 3),(1242, 3),(1243, 6),(1253, 3),(1257, 3),(1259, 4),(1268, 4),(1282, 2),(1284, 3),(1292, 6),(1303, 2),(1304, 3),(1306, 6),(1308, 3),(1309, 3),(1310, 4),(1311, 6),(1352, 1),(1353, 3),(1354, 1),(1355, 1),(1356, 1),(1357, 33),(1362, 1),(1363, 1),(1388, 3),(1389, 3),(1390, 3),(1391, 3),(1397, 3),(1413, 1),(1552, 3),(4699, 8),(4700, 8),(4703, 8)
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`auction_table` WRITE;
DELETE FROM `l2junionfree`.`auction_table`;
INSERT INTO `l2junionfree`.`auction_table` (`auctionid`,`ownerid`,`itemid`,`count`,`enchant`,`costid`,`costcount`) VALUES (1, 268473539, 6393, 1, 0, 57, 2),(2, 268473539, 2532, 1, 0, 57, 12)
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`auctions` WRITE;
DELETE FROM `l2junionfree`.`auctions`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`augmentations` WRITE;
DELETE FROM `l2junionfree`.`augmentations`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`auto_farm_ip` WRITE;
DELETE FROM `l2junionfree`.`auto_farm_ip`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`autofarm_areas` WRITE;
DELETE FROM `l2junionfree`.`autofarm_areas`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`autofarm_nodes` WRITE;
DELETE FROM `l2junionfree`.`autofarm_nodes`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`banned_ips` WRITE;
DELETE FROM `l2junionfree`.`banned_ips`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`bbs_favorite` WRITE;
DELETE FROM `l2junionfree`.`bbs_favorite`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`bbs_forum` WRITE;
DELETE FROM `l2junionfree`.`bbs_forum`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`bbs_mail` WRITE;
DELETE FROM `l2junionfree`.`bbs_mail`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`bbs_post` WRITE;
DELETE FROM `l2junionfree`.`bbs_post`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`bbs_topic` WRITE;
DELETE FROM `l2junionfree`.`bbs_topic`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`bookmarks` WRITE;
DELETE FROM `l2junionfree`.`bookmarks`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`buffer_schemes` WRITE;
DELETE FROM `l2junionfree`.`buffer_schemes`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`buylists` WRITE;
DELETE FROM `l2junionfree`.`buylists`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`castle` WRITE;
DELETE FROM `l2junionfree`.`castle`;
INSERT INTO `l2junionfree`.`castle` (`id`,`currentTaxPercent`,`nextTaxPercent`,`treasury`,`taxRevenue`,`seedIncome`,`siegeDate`,`regTimeOver`,`certificates`) VALUES (1, 0, 0, 0, 0, 0, 1759006800000, 'false', 300),(2, 0, 0, 0, 0, 0, 1759006800000, 'false', 300),(3, 0, 0, 0, 0, 0, 1759093200000, 'false', 300),(4, 0, 0, 0, 0, 0, 1759093200000, 'false', 300),(5, 0, 0, 0, 0, 0, 1759006800000, 'false', 300),(6, 0, 0, 0, 0, 0, 1759093200000, 'false', 300),(7, 0, 0, 0, 0, 0, 1759093200000, 'false', 300),(8, 0, 0, 0, 0, 0, 1759006800000, 'false', 300),(9, 0, 0, 0, 0, 0, 1759006800000, 'false', 300)
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`castle_doorupgrade` WRITE;
DELETE FROM `l2junionfree`.`castle_doorupgrade`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`castle_manor_procure` WRITE;
DELETE FROM `l2junionfree`.`castle_manor_procure`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`castle_manor_production` WRITE;
DELETE FROM `l2junionfree`.`castle_manor_production`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`castle_trapupgrade` WRITE;
DELETE FROM `l2junionfree`.`castle_trapupgrade`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`character_aio` WRITE;
DELETE FROM `l2junionfree`.`character_aio`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`character_aio_skills_backup` WRITE;
DELETE FROM `l2junionfree`.`character_aio_skills_backup`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`character_autofarm` WRITE;
DELETE FROM `l2junionfree`.`character_autofarm`;
INSERT INTO `l2junionfree`.`character_autofarm` (`char_id`,`char_name`,`radius`,`short_cut`,`heal_percent`,`buff_protection`,`anti_ks_protection`,`summon_attack`,`summon_skill_percent`,`hp_potion_percent`,`mp_potion_percent`) VALUES (268473539, 'L2jUnion', 1400, 9, 30, 0, 0, 0, 0, 60, 60)
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`character_evolutions` WRITE;
DELETE FROM `l2junionfree`.`character_evolutions`;
INSERT INTO `l2junionfree`.`character_evolutions` (`charId`,`evolution_count`,`chosen_skill_id`,`skill_level`,`last_evolution`) VALUES (268473469, 1, 1003, 1, NULL)
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`character_hennas` WRITE;
DELETE FROM `l2junionfree`.`character_hennas`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`character_macroses` WRITE;
DELETE FROM `l2junionfree`.`character_macroses`;
INSERT INTO `l2junionfree`.`character_macroses` (`char_obj_id`,`id`,`icon`,`name`,`descr`,`acronym`,`commands`) VALUES (268473754, 1000, 0, 'admin', '', '', '3,0,0,//admin;'),(268473754, 1001, 0, 'matar', '', '', '3,0,0,//kill;'),(268473754, 1002, 0, 'info', '', '', '3,0,0,//info;'),(268473754, 1003, 0, 'gmspeed', '', '', '3,0,0,//gmspeed 4;'),(268473754, 1004, 0, 'loc', '', '', '3,0,0,/loc;'),(268473754, 1005, 0, 'res', '', '', '3,0,0,//res;'),(268473754, 1006, 0, 'mapanuevo', '', '', '3,0,0,//teleport -56217 26011 -3168;'),(268473754, 1007, 4, 'reload htm', '', '', '3,0,0,//reload htm;'),(268473754, 1008, 0, 'reloa multis', '', '', '3,0,0,//reload multisell;'),(268473754, 1009, 0, 'curar', '', '', '3,0,0,//heal;'),(268473754, 1010, 0, 'menu', '', '', '3,0,0,.menu;'),(268473754, 1011, 0, 'fortresgm', '', '', '3,0,0,//teleport -52741 156350 -2048;')
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`character_memo` WRITE;
DELETE FROM `l2junionfree`.`character_memo`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`character_quests` WRITE;
DELETE FROM `l2junionfree`.`character_quests`;
INSERT INTO `l2junionfree`.`character_quests` (`charId`,`name`,`var`,`value`) VALUES (268473289, 'Tutorial', '<state>', 'STARTED'),(268473289, 'Tutorial', 'Adena', '1'),(268473289, 'Tutorial', 'Ex', '-5'),(268473289, 'Tutorial', 'HP', '1'),(268473289, 'Tutorial', 'sit', '8388608'),(268473289, 'Tutorial', 'ucMemo', '2'),(268473295, 'Tutorial', '<state>', 'STARTED'),(268473295, 'Tutorial', 'Ex', '0'),(268473295, 'Tutorial', 'ucMemo', '1'),(268473320, 'Tutorial', '<state>', 'STARTED'),(268473320, 'Tutorial', 'Ex', '0'),(268473320, 'Tutorial', 'ucMemo', '1'),(268473417, 'Tutorial', '<state>', 'STARTED'),(268473417, 'Tutorial', 'Adena', '1'),(268473417, 'Tutorial', 'Ex', '-5'),(268473417, 'Tutorial', 'ucMemo', '2'),(268473423, 'Tutorial', '<state>', 'STARTED'),(268473423, 'Tutorial', 'Ex', '0'),(268473423, 'Tutorial', 'ucMemo', '1'),(268473454, 'Tutorial', '<state>', 'STARTED'),(268473454, 'Tutorial', 'Die', '1'),(268473454, 'Tutorial', 'Ex', '-3'),(268473454, 'Tutorial', 'HP', '1'),(268473454, 'Tutorial', 'sit', '8388608'),(268473454, 'Tutorial', 'ucMemo', '1'),(268474126, 'Tutorial', '<state>', 'STARTED'),(268474126, 'Tutorial', 'Ex', '0'),(268474126, 'Tutorial', 'ucMemo', '1'),(268475841, 'Tutorial', '<state>', 'STARTED'),(268475841, 'Tutorial', 'Adena', '1'),(268475841, 'Tutorial', 'Ex', '0'),(268475841, 'Tutorial', 'lvl', '15'),(268475841, 'Tutorial', 'ucMemo', '1')
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`character_raid_points` WRITE;
DELETE FROM `l2junionfree`.`character_raid_points`;
INSERT INTO `l2junionfree`.`character_raid_points` (`char_id`,`boss_id`,`points`) VALUES (268473754, 25082, 34)
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`character_recipebook` WRITE;
DELETE FROM `l2junionfree`.`character_recipebook`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`character_recommends` WRITE;
DELETE FROM `l2junionfree`.`character_recommends`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`character_relations` WRITE;
DELETE FROM `l2junionfree`.`character_relations`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`character_shortcuts` WRITE;
DELETE FROM `l2junionfree`.`character_shortcuts`;
INSERT INTO `l2junionfree`.`character_shortcuts` (`char_obj_id`,`slot`,`page`,`type`,`id`,`level`,`class_index`) VALUES (268473289, 0, 0, 'ACTION', 2, -1, 0),(268473289, 3, 0, 'ACTION', 5, -1, 0),(268473289, 10, 0, 'ACTION', 0, -1, 0),(268473289, 11, 0, 'ITEM', 268473294, -1, 0),(268473295, 0, 0, 'ACTION', 2, -1, 0),(268473295, 1, 0, 'SKILL', 7029, 4, 0),(268473295, 2, 0, 'SKILL', 1177, 5, 0),(268473295, 3, 0, 'ACTION', 5, -1, 0),(268473295, 9, 0, 'SKILL', 1216, 1, 0),(268473295, 10, 0, 'ACTION', 0, -1, 0),(268473295, 11, 0, 'ITEM', 268473299, -1, 0),(268473320, 0, 0, 'ACTION', 2, -1, 0),(268473320, 3, 0, 'ACTION', 5, -1, 0),(268473320, 10, 0, 'ACTION', 0, -1, 0),(268473320, 11, 0, 'ITEM', 268473325, -1, 0),(268473417, 0, 0, 'ACTION', 2, -1, 0),(268473417, 3, 0, 'ACTION', 5, -1, 0),(268473417, 10, 0, 'ACTION', 0, -1, 0),(268473417, 11, 0, 'ITEM', 268473422, -1, 0),(268473423, 0, 0, 'ACTION', 2, -1, 0),(268473423, 1, 0, 'SKILL', 1177, 1, 0),(268473423, 3, 0, 'ACTION', 5, -1, 0),(268473423, 9, 0, 'SKILL', 1216, 1, 0),(268473423, 10, 0, 'ACTION', 0, -1, 0),(268473423, 11, 0, 'ITEM', 268473427, -1, 0),(268473454, 0, 0, 'ACTION', 2, -1, 0),(268473454, 3, 0, 'ACTION', 5, -1, 0),(268473454, 10, 0, 'ACTION', 0, -1, 0),(268473454, 10, 2, 'ITEM', 268474904, -1, 0),(268473454, 11, 0, 'ITEM', 268473459, -1, 0),(268473754, 0, 0, 'ACTION', 2, -1, 0),(268473754, 0, 2, 'MACRO', 1000, -1, 0),(268473754, 1, 0, 'ACTION', 4, -1, 0),(268473754, 1, 2, 'SKILL', 196, 1, 0),(268473754, 2, 0, 'MACRO', 1002, -1, 0),(268473754, 2, 0, 'MACRO', 1002, -1, 2),(268473754, 2, 0, 'MACRO', 1002, -1, 3),(268473754, 4, 0, 'MACRO', 1010, -1, 0),(268473754, 5, 2, 'MACRO', 1003, -1, 0),(268473754, 6, 0, 'MACRO', 1001, -1, 0),(268473754, 6, 2, 'MACRO', 1007, -1, 0),(268473754, 7, 0, 'MACRO', 1005, -1, 0),(268473754, 8, 2, 'MACRO', 1008, -1, 0),(268474126, 0, 0, 'ACTION', 2, -1, 0),(268474126, 3, 0, 'ACTION', 5, -1, 0),(268474126, 10, 0, 'ACTION', 0, -1, 0),(268474126, 11, 0, 'ITEM', 268474131, -1, 0),(268474126, 11, 2, 'ITEM', 268474903, -1, 0),(268475841, 0, 0, 'ACTION', 2, -1, 0),(268475841, 0, 2, 'SKILL', 7029, 4, 0),(268475841, 1, 0, 'ACTION', 4, -1, 0),(268475841, 2, 0, 'SKILL', 3, 9, 0),(268475841, 3, 0, 'ACTION', 5, -1, 0),(268475841, 10, 0, 'ACTION', 0, -1, 0),(268475841, 11, 0, 'ITEM', 268475846, -1, 0),(268475841, 11, 2, 'ITEM', 268475850, -1, 0)
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`character_skills` WRITE;
DELETE FROM `l2junionfree`.`character_skills`;
INSERT INTO `l2junionfree`.`character_skills` (`char_obj_id`,`skill_id`,`skill_level`,`class_index`) VALUES (268473289, 194, 1, 0),(268473289, 1320, 1, 0),(268473289, 1322, 1, 0),(268473295, 3, 9, 1),(268473295, 4, 1, 1),(268473295, 16, 24, 1),(268473295, 19, 3, 1),(268473295, 27, 5, 1),(268473295, 56, 24, 1),(268473295, 96, 2, 1),(268473295, 99, 1, 1),(268473295, 101, 6, 1),(268473295, 111, 1, 1),(268473295, 113, 2, 1),(268473295, 118, 1, 0),(268473295, 131, 1, 1),(268473295, 137, 1, 1),(268473295, 141, 3, 1),(268473295, 142, 5, 1),(268473295, 146, 45, 0),(268473295, 148, 3, 1),(268473295, 163, 1, 0),(268473295, 164, 3, 0),(268473295, 168, 1, 1),(268473295, 169, 1, 1),(268473295, 171, 1, 1),(268473295, 173, 1, 1),(268473295, 193, 2, 1),(268473295, 194, 1, 0),(268473295, 194, 1, 1),(268473295, 195, 1, 1),(268473295, 198, 1, 1),(268473295, 208, 18, 1),(268473295, 209, 8, 1),(268473295, 212, 6, 0),(268473295, 213, 8, 0),(268473295, 214, 1, 0),(268473295, 225, 1, 1),(268473295, 226, 1, 1),(268473295, 228, 3, 0),(268473295, 229, 7, 0),(268473295, 233, 13, 1),(268473295, 234, 41, 0),(268473295, 239, 5, 0),(268473295, 239, 2, 1),(268473295, 244, 3, 0),(268473295, 249, 42, 0),(268473295, 256, 1, 1),(268473295, 285, 27, 0),(268473295, 312, 6, 1),(268473295, 328, 1, 0),(268473295, 329, 1, 0),(268473295, 331, 1, 0),(268473295, 337, 1, 0),(268473295, 427, 1, 0),(268473295, 434, 1, 0),(268473295, 1011, 6, 0),(268473295, 1012, 1, 0),(268473295, 1015, 3, 0),(268473295, 1027, 3, 0),(268473295, 1040, 1, 0),(268473295, 1064, 14, 0),(268473295, 1068, 1, 0),(268473295, 1069, 42, 0),(268473295, 1078, 2, 0),(268473295, 1083, 3, 0),(268473295, 1111, 4, 0),(268473295, 1126, 6, 0),(268473295, 1127, 12, 0),(268473295, 1129, 7, 0),(268473295, 1144, 1, 0),(268473295, 1147, 6, 0),(268473295, 1148, 13, 0),(268473295, 1151, 16, 0),(268473295, 1154, 6, 0),(268473295, 1155, 15, 0),(268473295, 1156, 13, 0),(268473295, 1157, 5, 0),(268473295, 1159, 22, 0),(268473295, 1160, 1, 0),(268473295, 1163, 14, 0),(268473295, 1164, 19, 0),(268473295, 1167, 6, 0),(268473295, 1168, 7, 0),(268473295, 1169, 14, 0),(268473295, 1170, 13, 0),(268473295, 1172, 8, 0),(268473295, 1177, 5, 0),(268473295, 1181, 3, 0),(268473295, 1184, 6, 0),(268473295, 1216, 1, 0),(268473295, 1220, 8, 0),(268473295, 1222, 15, 0),(268473295, 1225, 4, 0),(268473295, 1234, 28, 0),(268473295, 1262, 5, 0),(268473295, 1263, 13, 0),(268473295, 1269, 9, 0),(268473295, 1274, 4, 0),(268473295, 1298, 14, 0),(268473295, 1320, 9, 0),(268473295, 1320, 6, 1),(268473295, 1322, 1, 0),(268473295, 1322, 1, 1),(268473295, 1334, 7, 0),(268473295, 1336, 1, 0),(268473295, 1337, 1, 0),(268473295, 1343, 1, 0),(268473295, 1344, 1, 0),(268473295, 1345, 1, 0),(268473295, 1381, 5, 0),(268473295, 1382, 5, 0),(268473295, 1387, 3, 0),(268473295, 1405, 4, 0),(268473295, 1422, 1, 0),(268473295, 1423, 1, 0),(268473295, 7029, 4, 0),(268473417, 3, 9, 0),(268473417, 16, 9, 0),(268473417, 56, 9, 0),(268473417, 141, 3, 0),(268473417, 142, 5, 0),(268473417, 194, 1, 0),(268473417, 226, 1, 0),(268473417, 239, 5, 0),(268473417, 1320, 9, 0),(268473417, 1322, 1, 0),(268473754, 3, 9, 0),(268473754, 3, 9, 2),(268473754, 16, 9, 0),(268473754, 16, 9, 2),(268473754, 18, 37, 2),(268473754, 28, 12, 2),(268473754, 44, 3, 2),(268473754, 45, 9, 2),(268473754, 49, 26, 2),(268473754, 56, 9, 0),(268473754, 56, 9, 2),(268473754, 69, 25, 2),(268473754, 70, 13, 2),(268473754, 72, 3, 2),(268473754, 77, 1, 0),(268473754, 82, 1, 2),(268473754, 91, 1, 0),(268473754, 92, 15, 2),(268473754, 97, 11, 2),(268473754, 110, 1, 2),(268473754, 112, 2, 2),(268473754, 118, 1, 0),(268473754, 118, 1, 1),(268473754, 118, 1, 3),(268473754, 141, 3, 0),(268473754, 141, 3, 2),(268473754, 142, 5, 0),(268473754, 142, 5, 2),(268473754, 146, 45, 0),(268473754, 146, 4, 1),(268473754, 146, 4, 3),(268473754, 147, 14, 2),(268473754, 153, 2, 2),(268473754, 163, 1, 0),(268473754, 163, 1, 1),(268473754, 163, 1, 3),(268473754, 164, 3, 0),(268473754, 164, 2, 1),(268473754, 164, 2, 3),(268473754, 191, 1, 2),(268473754, 194, 1, 0),(268473754, 194, 1, 1),(268473754, 194, 1, 2),(268473754, 194, 1, 3),(268473754, 196, 1, 2),(268473754, 197, 2, 2),(268473754, 212, 6, 0),(268473754, 212, 1, 1),(268473754, 212, 1, 3),(268473754, 213, 8, 0),(268473754, 213, 2, 1),(268473754, 213, 2, 3),(268473754, 214, 1, 0),(268473754, 214, 1, 1),(268473754, 214, 1, 3),(268473754, 217, 8, 2),(268473754, 226, 1, 0),(268473754, 226, 1, 2),(268473754, 228, 3, 0),(268473754, 228, 1, 1),(268473754, 228, 1, 3),(268473754, 229, 7, 0),(268473754, 229, 2, 1),(268473754, 229, 2, 3),(268473754, 232, 15, 2),(268473754, 234, 41, 0),(268473754, 234, 8, 1),(268473754, 235, 4, 0),(268473754, 235, 8, 3),(268473754, 236, 4, 0),(268473754, 236, 8, 3),(268473754, 239, 1, 0),(268473754, 239, 5, 1),(268473754, 239, 5, 2),(268473754, 239, 5, 3),(268473754, 244, 3, 0),(268473754, 244, 3, 1),(268473754, 244, 3, 3),(268473754, 249, 42, 0),(268473754, 249, 2, 1),(268473754, 249, 2, 3),(268473754, 262, 37, 2),(268473754, 285, 27, 0),(268473754, 285, 8, 1),(268473754, 291, 11, 2),(268473754, 318, 1, 2),(268473754, 322, 6, 2),(268473754, 328, 1, 0),(268473754, 329, 1, 2),(268473754, 331, 1, 0),(268473754, 335, 1, 2),(268473754, 336, 1, 3),(268473754, 337, 1, 0),(268473754, 341, 1, 2),(268473754, 350, 1, 2),(268473754, 353, 1, 2),(268473754, 368, 1, 2),(268473754, 400, 10, 2),(268473754, 403, 10, 2),(268473754, 404, 5, 2),(268473754, 405, 10, 2),(268473754, 406, 3, 2),(268473754, 426, 1, 2),(268473754, 427, 1, 0),(268473754, 429, 1, 2),(268473754, 433, 1, 0),(268473754, 436, 1, 3),(268473754, 438, 1, 2),(268473754, 454, 1, 2),(268473754, 1011, 6, 0),(268473754, 1011, 6, 1),(268473754, 1011, 6, 3),(268473754, 1012, 1, 0),(268473754, 1012, 1, 1),(268473754, 1012, 1, 3),(268473754, 1015, 3, 0),(268473754, 1015, 3, 1),(268473754, 1015, 3, 3),(268473754, 1016, 1, 0),(268473754, 1016, 2, 3),(268473754, 1018, 3, 3),(268473754, 1020, 27, 3),(268473754, 1027, 3, 0),(268473754, 1027, 3, 1),(268473754, 1027, 3, 3),(268473754, 1028, 19, 3),(268473754, 1031, 4, 0),(268473754, 1031, 8, 3),(268473754, 1034, 13, 3),(268473754, 1035, 1, 0),(268473754, 1035, 1, 3),(268473754, 1040, 1, 0),(268473754, 1040, 1, 1),(268473754, 1040, 1, 3),(268473754, 1042, 12, 3),(268473754, 1043, 1, 0),(268473754, 1043, 1, 3),(268473754, 1044, 1, 3),(268473754, 1049, 14, 3),(268473754, 1056, 12, 0),(268473754, 1062, 1, 3),(268473754, 1064, 14, 1),(268473754, 1068, 1, 0),(268473754, 1068, 1, 1),(268473754, 1068, 1, 3),(268473754, 1069, 42, 0),(268473754, 1069, 9, 1),(268473754, 1069, 9, 3),(268473754, 1072, 5, 0),(268473754, 1073, 1, 0),(268473754, 1073, 1, 3),(268473754, 1074, 14, 0),(268473754, 1075, 1, 3),(268473754, 1077, 1, 0),(268473754, 1077, 1, 3),(268473754, 1078, 6, 0),(268473754, 1078, 2, 1),(268473754, 1078, 2, 3),(268473754, 1083, 17, 0),(268473754, 1083, 3, 1),(268473754, 1085, 1, 0),(268473754, 1085, 2, 3),(268473754, 1111, 4, 0),(268473754, 1111, 4, 1),(268473754, 1126, 6, 0),(268473754, 1126, 6, 1),(268473754, 1127, 12, 0),(268473754, 1127, 12, 1),(268473754, 1129, 7, 1),(268473754, 1144, 1, 0),(268473754, 1144, 1, 1),(268473754, 1147, 6, 0),(268473754, 1147, 2, 1),(268473754, 1147, 2, 3),(268473754, 1148, 13, 1),(268473754, 1151, 2, 0),(268473754, 1151, 2, 1),(268473754, 1154, 6, 1),(268473754, 1155, 15, 1),(268473754, 1156, 13, 1),(268473754, 1157, 1, 0),(268473754, 1157, 1, 1),(268473754, 1159, 22, 1),(268473754, 1160, 15, 0),(268473754, 1160, 1, 1),(268473754, 1163, 14, 1),(268473754, 1164, 5, 0),(268473754, 1164, 1, 1),(268473754, 1164, 1, 3),(268473754, 1167, 2, 0),(268473754, 1167, 2, 1),(268473754, 1168, 3, 0),(268473754, 1168, 1, 1),(268473754, 1168, 1, 3),(268473754, 1169, 14, 0),(268473754, 1169, 14, 1),(268473754, 1170, 13, 1),(268473754, 1171, 19, 0),(268473754, 1172, 8, 0),(268473754, 1172, 8, 1),(268473754, 1177, 5, 0),(268473754, 1177, 5, 1),(268473754, 1177, 5, 3),(268473754, 1181, 3, 0),(268473754, 1181, 3, 1),(268473754, 1184, 6, 0),(268473754, 1184, 4, 1),(268473754, 1184, 4, 3),(268473754, 1191, 1, 3),(268473754, 1201, 3, 0),(268473754, 1201, 9, 3),(268473754, 1204, 1, 0),(268473754, 1204, 2, 3),(268473754, 1216, 1, 0),(268473754, 1216, 1, 1),(268473754, 1216, 1, 3),(268473754, 1217, 33, 3),(268473754, 1218, 33, 3),(268473754, 1219, 33, 3),(268473754, 1220, 8, 0),(268473754, 1220, 8, 1),(268473754, 1222, 1, 0),(268473754, 1222, 1, 1),(268473754, 1225, 4, 0),(268473754, 1225, 4, 1),(268473754, 1230, 28, 0),(268473754, 1231, 28, 0),(268473754, 1232, 3, 0),(268473754, 1233, 4, 0),(268473754, 1234, 28, 1),(268473754, 1254, 6, 3),(268473754, 1258, 4, 3),(268473754, 1262, 5, 1),(268473754, 1263, 13, 1),(268473754, 1269, 9, 1),(268473754, 1271, 1, 3),(268473754, 1274, 4, 0),(268473754, 1274, 4, 1),(268473754, 1275, 14, 0),(268473754, 1285, 1, 0),(268473754, 1288, 1, 0),(268473754, 1289, 1, 0),(268473754, 1292, 1, 0),(268473754, 1296, 9, 0),(268473754, 1297, 6, 0),(268473754, 1298, 14, 1),(268473754, 1307, 3, 3),(268473754, 1311, 6, 3),(268473754, 1320, 5, 0),(268473754, 1320, 9, 1),(268473754, 1320, 9, 2),(268473754, 1320, 9, 3),(268473754, 1322, 1, 0),(268473754, 1322, 1, 1),(268473754, 1322, 1, 2),(268473754, 1322, 1, 3),(268473754, 1334, 7, 1),(268473754, 1335, 1, 3),(268473754, 1338, 1, 0),(268473754, 1339, 1, 0),(268473754, 1353, 1, 3),(268473754, 1360, 1, 3),(268473754, 1361, 1, 3),(268473754, 1381, 5, 1),(268473754, 1382, 5, 1),(268473754, 1387, 3, 1),(268473754, 1394, 10, 3),(268473754, 1395, 10, 3),(268473754, 1396, 10, 3),(268473754, 1398, 10, 3),(268473754, 1399, 5, 3),(268473754, 1400, 10, 3),(268473754, 1401, 11, 3),(268473754, 1402, 5, 3),(268473754, 1405, 4, 0),(268473754, 1405, 2, 1),(268473754, 1405, 2, 2),(268473754, 1405, 2, 3),(268473754, 1409, 1, 3),(268473754, 1410, 1, 3),(268473754, 1417, 5, 0),(268473754, 1418, 1, 3),(268473754, 1419, 1, 0),(268473754, 1425, 1, 3),(268473754, 1426, 1, 3),(268473754, 1430, 5, 3),(268475841, 1, 37, 0),(268475841, 3, 9, 0),(268475841, 5, 31, 0),(268475841, 6, 37, 0),(268475841, 7, 28, 0),(268475841, 8, 7, 0),(268475841, 9, 34, 0),(268475841, 16, 9, 0),(268475841, 56, 9, 0),(268475841, 75, 1, 0),(268475841, 78, 2, 0),(268475841, 80, 1, 0),(268475841, 87, 1, 0),(268475841, 88, 1, 0),(268475841, 100, 15, 0),(268475841, 104, 1, 0),(268475841, 121, 1, 0),(268475841, 141, 3, 0),(268475841, 142, 5, 0),(268475841, 144, 37, 0),(268475841, 148, 2, 0),(268475841, 190, 37, 0),(268475841, 194, 1, 0),(268475841, 211, 3, 0),(268475841, 212, 8, 0),(268475841, 216, 8, 0),(268475841, 226, 1, 0),(268475841, 227, 50, 0),(268475841, 231, 50, 0),(268475841, 239, 5, 0),(268475841, 245, 15, 0),(268475841, 255, 15, 0),(268475841, 256, 1, 0),(268475841, 257, 45, 0),(268475841, 260, 37, 0),(268475841, 261, 22, 0),(268475841, 287, 3, 0),(268475841, 290, 14, 0),(268475841, 297, 2, 0),(268475841, 312, 20, 0),(268475841, 328, 1, 0),(268475841, 329, 1, 0),(268475841, 330, 1, 0),(268475841, 340, 1, 0),(268475841, 345, 1, 0),(268475841, 359, 1, 0),(268475841, 360, 1, 0),(268475841, 424, 3, 0),(268475841, 426, 1, 0),(268475841, 430, 1, 0),(268475841, 440, 1, 0),(268475841, 442, 1, 0),(268475841, 451, 2, 0),(268475841, 458, 1, 0),(268475841, 1320, 9, 0),(268475841, 1322, 1, 0),(268475841, 1405, 4, 0),(268475841, 7029, 4, 0)
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`character_skills_save` WRITE;
DELETE FROM `l2junionfree`.`character_skills_save`;
INSERT INTO `l2junionfree`.`character_skills_save` (`char_obj_id`,`skill_id`,`skill_level`,`effect_count`,`effect_cur_time`,`reuse_delay`,`systime`,`restore_type`,`class_index`,`buff_index`) VALUES (268473454, 1040, 1, 1, 650, 0, 0, 0, 0, 3),(268473454, 1068, 1, 1, 650, 0, 0, 0, 0, 2),(268473454, 1238, 3, 1, 944, 0, 0, 0, 0, 1),(268473754, 265, 1, 1, 52, 0, 0, 0, 1, 1),(268473754, 269, 1, 1, 51, 0, 0, 0, 1, 2),(268473754, 270, 1, 1, 50, 0, 0, 0, 1, 3),(268473754, 304, 1, 1, 50, 0, 0, 0, 1, 4),(268473754, 305, 1, 1, 49, 0, 0, 0, 1, 5),(268475841, 78, 2, 1, 6, 144086, 1757452946662, 0, 0, 1)
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`character_subclasses` WRITE;
DELETE FROM `l2junionfree`.`character_subclasses`;
INSERT INTO `l2junionfree`.`character_subclasses` (`char_obj_id`,`class_id`,`exp`,`sp`,`level`,`class_index`) VALUES (268473295, 92, 4200000000, 0, 80, 1),(268473754, 90, 4200000000, 0, 80, 2),(268473754, 95, 4200000000, 0, 80, 1),(268473754, 97, 4200000000, 0, 80, 3)
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`characters` WRITE;
DELETE FROM `l2junionfree`.`characters`;
INSERT INTO `l2junionfree`.`characters` (`account_name`,`obj_Id`,`char_name`,`level`,`maxHp`,`curHp`,`maxCp`,`curCp`,`maxMp`,`curMp`,`face`,`hairStyle`,`hairColor`,`sex`,`heading`,`x`,`y`,`z`,`exp`,`expBeforeDeath`,`sp`,`karma`,`pvpkills`,`pkkills`,`clanid`,`race`,`classid`,`base_class`,`deletetime`,`title`,`rec_have`,`rec_left`,`accesslevel`,`online`,`onlinetime`,`lastAccess`,`wantspeace`,`isin7sdungeon`,`punish_level`,`punish_timer`,`power_grade`,`nobless`,`hero`,`subpledge`,`lvl_joined_academy`,`apprentice`,`sponsor`,`varka_ketra_ally`,`clan_join_expiry_time`,`clan_create_expiry_time`,`death_penalty_level`) VALUES ('prueva', 268473289, 'ghgh', 2, 159, 159, 58, 58, 45, 45, 0, 0, 0, 0, 57957, -73928, 253892, -3328, 105, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 349, 1758229835818, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),('prueva', 268473295, 'gggtu', 80, 4673, 4673, 3271, 3271, 1807, 1807, 0, 0, 0, 0, 50785, 83632, 147555, -3400, 4200000000, 0, 0, 0, 0, 0, 0, 0, 92, 95, 0, '', 0, 0, 0, 0, 7908, 1758504396139, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),('prueva', 268473320, 'cocoliso', 80, 6327, 3558, 3163, 2215, 1645, 1074, 0, 0, 0, 0, 55375, 82448, 148446, -3464, 4200000000, 0, 0, 0, 0, 0, 0, 3, 114, 114, 0, '', 0, 0, 0, 0, 155, 1758517824797, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),('admin', 268473417, 'sssss', 80, 2459, 28, 894, 50, 827, 14, 0, 0, 0, 0, 0, 0, 0, 0, 4200000000, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Master', 0, 0, 8, 0, 1442, 1758229265091, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),('prueva', 268473423, 'jhkjkjk', 1, 98, 98, 49, 0, 88, 59, 0, 0, 0, 0, 0, -90954, 248118, -3570, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, '', 0, 0, 0, 0, 0, 1758504411329, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),('prueva', 268473454, 'pelele', 20, 516, 516, 309, 309, 184, 184, 0, 1, 0, 0, 29485, 82328, 148579, -3464, 835854, 17044073, 0, 0, 0, 0, 0, 0, 5, 5, 0, 'Chat Moderator', 0, 6, 1, 0, 4315, 1758493068867, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),('admin', 268473754, 'DarkGm', 80, 4087, 4087, 2452, 2452, 1348, 1348, 0, 0, 1, 0, 42655, 204684, -57749, -4672, 4200000139, 0, 284759, 0, 0, 1, 0, 0, 4, 4, 0, 'Master', 0, 3, 8, 0, 54935, 1758524584670, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),('prueva1', 268474126, 'polo', 14, 385, 385, 154, 154, 135, 135, 0, 0, 0, 0, 49366, 82940, 148328, -3464, 191452, 964381, 2, 0, 2, 0, 0, 0, 0, 0, 0, 'L2jUnion', 0, 6, 0, 0, 3073, 1755233754997, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),('prueva', 268475841, 'fgfghfg', 80, 5389, 2726, 4951, 1319, 1607, 930, 0, 0, 0, 0, 14024, -93543, 239616, -3424, 4200000000, 0, 42, 0, 0, 0, 0, 0, 88, 88, 0, '', 0, 0, 0, 0, 313, 1757452810233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`clan_data` WRITE;
DELETE FROM `l2junionfree`.`clan_data`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`clan_privs` WRITE;
DELETE FROM `l2junionfree`.`clan_privs`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`clan_skills` WRITE;
DELETE FROM `l2junionfree`.`clan_skills`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`clan_subpledges` WRITE;
DELETE FROM `l2junionfree`.`clan_subpledges`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`clan_wars` WRITE;
DELETE FROM `l2junionfree`.`clan_wars`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`clanhall` WRITE;
DELETE FROM `l2junionfree`.`clanhall`;
INSERT INTO `l2junionfree`.`clanhall` (`id`,`ownerId`,`paidUntil`,`paid`,`sellerBid`,`sellerName`,`sellerClanName`,`endDate`) VALUES (21, 0, 0, 0, 0, '', '', 1758639600803),(22, 0, 0, 0, 0, '', '', 1758681356590),(23, 0, 0, 0, 0, '', '', 1758681356666),(24, 0, 0, 0, 0, '', '', 1758681356671),(25, 0, 0, 0, 0, '', '', 1758681356674),(26, 0, 0, 0, 0, '', '', 1758681356717),(27, 0, 0, 0, 0, '', '', 1758681356728),(28, 0, 0, 0, 0, '', '', 1758681356731),(29, 0, 0, 0, 0, '', '', 1758681356736),(30, 0, 0, 0, 0, '', '', 1758681356740),(31, 0, 0, 0, 0, '', '', 1758681356744),(32, 0, 0, 0, 0, '', '', 1758681356749),(33, 0, 0, 0, 0, '', '', 1758681356756),(34, 0, 0, 0, 0, '', '', 1758639600839),(35, 0, 0, 0, 0, '', '', 1758639600841),(36, 0, 0, 0, 0, '', '', 1758681356764),(37, 0, 0, 0, 0, '', '', 1758681356770),(38, 0, 0, 0, 0, '', '', 1758681356777),(39, 0, 0, 0, 0, '', '', 1758681356799),(40, 0, 0, 0, 0, '', '', 1758681356805),(41, 0, 0, 0, 0, '', '', 1758681356811),(42, 0, 0, 0, 0, '', '', 1758681356817),(43, 0, 0, 0, 0, '', '', 1758681356825),(44, 0, 0, 0, 0, '', '', 1758681356835),(45, 0, 0, 0, 0, '', '', 1758681356849),(46, 0, 0, 0, 0, '', '', 1758681356856),(47, 0, 0, 0, 0, '', '', 1758681356863),(48, 0, 0, 0, 0, '', '', 1758681356870),(49, 0, 0, 0, 0, '', '', 1758681356874),(50, 0, 0, 0, 0, '', '', 1758681356877),(51, 0, 0, 0, 0, '', '', 1758681356884),(52, 0, 0, 0, 0, '', '', 1758681356887),(53, 0, 0, 0, 0, '', '', 1758681356890),(54, 0, 0, 0, 0, '', '', 1758681356896),(55, 0, 0, 0, 0, '', '', 1758681356910),(56, 0, 0, 0, 0, '', '', 1758681356915),(57, 0, 0, 0, 0, '', '', 1758681356921),(58, 0, 0, 0, 0, '', '', 1758681356927),(59, 0, 0, 0, 0, '', '', 1758681356931),(60, 0, 0, 0, 0, '', '', 1758681356936),(61, 0, 0, 0, 0, '', '', 1758681356940),(62, 0, 0, 0, 0, '', '', 1758639600895),(63, 0, 0, 0, 0, '', '', 1758639600896),(64, 0, 0, 0, 0, '', '', 1758639600898)
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`clanhall_flagwar_attackers` WRITE;
DELETE FROM `l2junionfree`.`clanhall_flagwar_attackers`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`clanhall_flagwar_members` WRITE;
DELETE FROM `l2junionfree`.`clanhall_flagwar_members`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`clanhall_flagwar_owner_npcs` WRITE;
DELETE FROM `l2junionfree`.`clanhall_flagwar_owner_npcs`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`clanhall_functions` WRITE;
DELETE FROM `l2junionfree`.`clanhall_functions`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`clanhall_siege_attackers` WRITE;
DELETE FROM `l2junionfree`.`clanhall_siege_attackers`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`connection_logs` WRITE;
DELETE FROM `l2junionfree`.`connection_logs`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`cursed_weapons` WRITE;
DELETE FROM `l2junionfree`.`cursed_weapons`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`custom_spawns` WRITE;
DELETE FROM `l2junionfree`.`custom_spawns`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`event_pvp_config` WRITE;
DELETE FROM `l2junionfree`.`event_pvp_config`;
INSERT INTO `l2junionfree`.`event_pvp_config` (`event_name`,`min_level`,`max_level`,`max_players`,`event_duration`,`points_per_kill`,`points_for_hero`,`hero_duration`,`preparation_time`,`registration_time`,`enabled`,`schedule_times`) VALUES ('PvP Championship', 40, 85, 2, 60, 5, 41, 1, 20, 5, 1, '22:51,20:00,22:00')
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`event_pvp_locations` WRITE;
DELETE FROM `l2junionfree`.`event_pvp_locations`;
INSERT INTO `l2junionfree`.`event_pvp_locations` (`location_id`,`location_name`,`x`,`y`,`z`,`is_spawn`,`is_arena`,`is_return`) VALUES (1, 'Spawn Point', 148592, 46710, -3408, 1, 1, 0),(2, 'Arena Spot 1', 150263, 46708, -3408, 1, 1, 0),(3, 'city', -84315, 242895, -3704, 0, 0, 1)
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`event_pvp_players` WRITE;
DELETE FROM `l2junionfree`.`event_pvp_players`;
INSERT INTO `l2junionfree`.`event_pvp_players` (`char_id`,`char_name`,`points`,`kills`,`deaths`,`is_playing`,`last_participation`,`hero_until`,`banned_until`,`current_event`,`total_hero_time`) VALUES (268473295, 'gggtu', 0, 4, 2, 0, '2025-09-17 22:57:04', NULL, '2025-09-17 23:57:04', 0, 1),(268473417, 'sssss', 95, 0, 4, 1, '2025-09-17 22:57:04', NULL, NULL, 0, 0),(268473754, 'DarkGm', 0, 2, 0, 1, '2025-09-17 19:26:32', NULL, NULL, 0, 1)
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`fishing_championship` WRITE;
DELETE FROM `l2junionfree`.`fishing_championship`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`games` WRITE;
DELETE FROM `l2junionfree`.`games`;
INSERT INTO `l2junionfree`.`games` (`id`,`idnr`,`number1`,`number2`,`prize`,`newprize`,`prize1`,`prize2`,`prize3`,`enddate`,`finished`) VALUES (1, 1, 4432, 2, 50000, 100000, 0, 0, 0, 1751148000174, 1),(1, 2, 5136, 6, 100000, 150000, 0, 0, 0, 1751752800174, 1),(1, 3, 4237, 0, 150000, 200000, 0, 0, 0, 1752357600174, 1),(1, 4, 16417, 5, 200000, 250000, 0, 0, 0, 1752962400174, 1),(1, 5, 16936, 8, 250000, 300000, 0, 0, 0, 1753567200174, 1),(1, 6, 1548, 8, 300000, 350000, 0, 0, 0, 1754172000174, 1),(1, 7, 688, 2, 350000, 400000, 0, 0, 0, 1754172000857, 1),(1, 8, 117, 0, 400000, 450000, 0, 0, 0, 1754776800857, 1),(1, 9, 8449, 3, 450000, 500000, 0, 0, 0, 1755381600857, 1),(1, 10, 100, 10, 500000, 550000, 0, 0, 0, 1755986400539, 1),(1, 11, 59392, 2, 550000, 600000, 0, 0, 0, 1756591200539, 1),(1, 12, 1664, 3, 600000, 650000, 0, 0, 0, 1757196000539, 1),(1, 13, 8452, 9, 650000, 700000, 0, 0, 0, 1757800800539, 1),(1, 14, 20512, 10, 700000, 750000, 0, 0, 0, 1758405600539, 1),(1, 15, 0, 0, 750000, 750000, 0, 0, 0, 1759010400539, 0)
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`gameservers` WRITE;
DELETE FROM `l2junionfree`.`gameservers`;
INSERT INTO `l2junionfree`.`gameservers` (`server_id`,`hexid`,`host`) VALUES (1, 'a7e12d723c2fa7923a45635f42dd156', '')
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`grandboss_list` WRITE;
DELETE FROM `l2junionfree`.`grandboss_list`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`heroes` WRITE;
DELETE FROM `l2junionfree`.`heroes`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`heroes_diary` WRITE;
DELETE FROM `l2junionfree`.`heroes_diary`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`items` WRITE;
DELETE FROM `l2junionfree`.`items`;
INSERT INTO `l2junionfree`.`items` (`owner_id`,`object_id`,`item_id`,`count`,`enchant_level`,`loc`,`loc_data`,`custom_type1`,`custom_type2`,`mana_left`,`time`) VALUES (268473417, 268473209, 57, 11, 0, 'INVENTORY', 0, 0, 0, -1, 1758229256542),(268473754, 268473210, 2382, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758524435796),(268473754, 268473211, 2383, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758524435797),(268473754, 268473212, 459, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758524435799),(268473754, 268473213, 2393, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758524435800),(268473289, 268473290, 1147, 1, 0, 'PAPERDOLL', 11, 0, 0, -1, 1758229801751),(268473289, 268473291, 1146, 1, 0, 'PAPERDOLL', 10, 0, 0, -1, 1758229801682),(268473289, 268473292, 10, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758229801654),(268473289, 268473293, 2369, 1, 0, 'PAPERDOLL', 7, 0, 0, -1, 1758229801679),(268473289, 268473294, 5588, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758229801655),(268473295, 268473296, 425, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758504335114),(268473295, 268473297, 461, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758504335119),(268473295, 268473298, 6, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758504335120),(268473295, 268473299, 5588, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758504335120),(268473754, 268473313, 57, 99997799, 0, 'INVENTORY', 0, 0, 0, -1, 1758524435801),(268473295, 268473314, 396, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758504335124),(268473295, 268473315, 393, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758504335133),(268473295, 268473316, 352, 1, 0, 'PAPERDOLL', 10, 0, 0, -1, 1758504335130),(268473320, 268473321, 1147, 1, 0, 'PAPERDOLL', 11, 0, 0, -1, 1758517669454),(268473320, 268473322, 1146, 1, 0, 'PAPERDOLL', 10, 0, 0, -1, 1758517669448),(268473320, 268473323, 2368, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758517669421),(268473320, 268473324, 2369, 1, 0, 'PAPERDOLL', 7, 0, 0, -1, 1758517669423),(268473320, 268473325, 5588, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758517669421),(268473320, 268473331, 57, 24999999, 0, 'INVENTORY', 0, 0, 0, -1, 1758517774997),(268473320, 268473332, 2382, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758517786212),(268473320, 268473333, 5768, 1, 0, 'PAPERDOLL', 9, 0, 0, -1, 1758517786212),(268473320, 268473334, 5780, 1, 0, 'PAPERDOLL', 12, 0, 0, -1, 1758517786212),(268473320, 268473335, 547, 1, 0, 'PAPERDOLL', 6, 0, 0, -1, 1758517786213),(268473454, 268473338, 352, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758493040834),(268473454, 268473339, 2378, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758493040835),(268473454, 268473340, 2411, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758493040835),(268473454, 268473341, 2425, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758493040838),(268473454, 268473342, 2449, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758493040839),(268473454, 268473343, 2493, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758493040840),(268473454, 268473344, 394, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758493047846),(268473454, 268473345, 416, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758493047846),(268473454, 268473346, 2422, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758493047846),(268473454, 268473347, 2446, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758493047846),(268473417, 268473418, 1147, 1, 0, 'PAPERDOLL', 11, 0, 0, -1, 1758229256623),(268473417, 268473419, 1146, 1, 0, 'PAPERDOLL', 10, 0, 0, -1, 1758229256621),(268473417, 268473420, 10, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758229256611),(268473417, 268473421, 2369, 1, 0, 'PAPERDOLL', 7, 0, 0, -1, 1758229256611),(268473417, 268473422, 5588, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758229256611),(268473423, 268473424, 425, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758504411183),(268473423, 268473425, 461, 1, 0, 'PAPERDOLL', 11, 0, 0, -1, 1758504410362),(268473423, 268473426, 6, 1, 0, 'PAPERDOLL', 7, 0, 0, -1, 1758504410362),(268473423, 268473427, 5588, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758504410362),(268473295, 268473478, 6608, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758504335131),(268473754, 268473503, 127, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758524435813),(268473423, 268473518, 25, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1758504454050),(268473423, 268473519, 24, 1, 0, 'PAPERDOLL', 10, 0, 0, -1, 1758504546760),(268473289, 268473572, 57, 12, 0, 'INVENTORY', 0, 0, 0, -1, 1758229801658),(268473454, 268473675, 57, 7008333, 0, 'INVENTORY', 0, 0, 0, -1, 1758493029632),(268475841, 268475842, 1147, 1, 0, 'PAPERDOLL', 11, 0, 0, -1, 1757452795612),(268475841, 268475843, 1146, 1, 0, 'PAPERDOLL', 10, 0, 0, -1, 1757452795610),(268475841, 268475844, 10, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1757452795607),(268475841, 268475845, 2369, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1757452795609),(268475841, 268475846, 5588, 1, 0, 'INVENTORY', 0, 0, 0, -1, 1757452795609),(268475841, 268475848, 68, 1, 0, 'PAPERDOLL', 7, 0, 0, -1, 1757452795609),(268475841, 268475850, 1835, 2000, 0, 'INVENTORY', 0, 0, 0, -1, 1757452795609),(268475841, 268475851, 57, 22, 0, 'INVENTORY', 0, 0, 0, -1, 1757452795609)
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`items_on_ground` WRITE;
DELETE FROM `l2junionfree`.`items_on_ground`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`mdt_bets` WRITE;
DELETE FROM `l2junionfree`.`mdt_bets`;
INSERT INTO `l2junionfree`.`mdt_bets` (`lane_id`,`bet`) VALUES (1, 0),(2, 0),(3, 0),(4, 0),(5, 0),(6, 0),(7, 0),(8, 0)
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`mdt_history` WRITE;
DELETE FROM `l2junionfree`.`mdt_history`;
INSERT INTO `l2junionfree`.`mdt_history` (`race_id`,`first`,`second`,`odd_rate`) VALUES (1, 1, 2, 0.00),(2, 0, 6, 0.00),(3, 3, 1, 0.00),(4, 2, 1, 0.00),(5, 6, 4, 0.00),(6, 7, 5, 0.00),(7, 6, 4, 0.00),(8, 3, 0, 0.00),(9, 2, 0, 0.00),(10, 7, 6, 0.00),(11, 1, 5, 0.00),(12, 0, 7, 0.00),(13, 2, 4, 0.00),(14, 7, 5, 0.00),(15, 0, 4, 0.00),(16, 1, 0, 0.00),(17, 2, 3, 0.00),(18, 3, 0, 0.00),(19, 3, 0, 0.00),(20, 3, 2, 0.00),(21, 1, 5, 0.00),(22, 1, 3, 0.00),(23, 6, 1, 0.00),(24, 6, 4, 0.00),(25, 5, 1, 0.00),(26, 3, 5, 0.00),(27, 1, 2, 0.00),(28, 7, 1, 0.00),(29, 3, 6, 0.00),(30, 3, 0, 0.00),(31, 6, 0, 0.00),(32, 4, 6, 0.00),(33, 0, 2, 0.00),(34, 2, 5, 0.00),(35, 7, 3, 0.00),(36, 1, 2, 0.00),(37, 4, 5, 0.00),(38, 3, 6, 0.00),(39, 6, 7, 0.00),(40, 5, 2, 0.00),(41, 6, 5, 0.00),(42, 4, 0, 0.00),(43, 6, 4, 0.00),(44, 5, 6, 0.00),(45, 4, 0, 0.00),(46, 0, 6, 0.00),(47, 6, 1, 0.00),(48, 7, 6, 0.00),(49, 5, 1, 0.00),(50, 4, 7, 0.00),(51, 3, 7, 0.00),(52, 4, 1, 0.00),(53, 5, 3, 0.00),(54, 6, 3, 0.00),(55, 6, 5, 0.00),(56, 4, 2, 0.00),(57, 2, 1, 0.00),(58, 0, 3, 0.00),(59, 3, 4, 0.00),(60, 0, 6, 0.00),(61, 6, 4, 0.00),(62, 1, 2, 0.00),(63, 6, 1, 0.00),(64, 7, 0, 0.00)
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`mods_wedding` WRITE;
DELETE FROM `l2junionfree`.`mods_wedding`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`olympiad_fights` WRITE;
DELETE FROM `l2junionfree`.`olympiad_fights`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`olympiad_nobles` WRITE;
DELETE FROM `l2junionfree`.`olympiad_nobles`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`olympiad_nobles_eom` WRITE;
DELETE FROM `l2junionfree`.`olympiad_nobles_eom`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`pcbang_points` WRITE;
DELETE FROM `l2junionfree`.`pcbang_points`;
INSERT INTO `l2junionfree`.`pcbang_points` (`player_id`,`points`,`last_update`) VALUES (268473289, 16, '2025-09-18 18:10:16'),(268473295, 4047, '2025-09-21 22:26:14'),(268473320, 40, '2025-09-22 02:10:23'),(268473417, 682, '2025-09-17 23:34:03'),(268473423, 0, '2025-09-21 22:26:50'),(268473454, 19, '2025-09-21 19:17:26'),(268473754, 10419, '2025-09-22 04:02:53'),(268475841, 79, '2025-09-09 18:20:03')
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`petition` WRITE;
DELETE FROM `l2junionfree`.`petition`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`petition_message` WRITE;
DELETE FROM `l2junionfree`.`petition_message`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`pets` WRITE;
DELETE FROM `l2junionfree`.`pets`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`rainbowsprings_attacker_list` WRITE;
DELETE FROM `l2junionfree`.`rainbowsprings_attacker_list`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`server_memo` WRITE;
DELETE FROM `l2junionfree`.`server_memo`;
INSERT INTO `l2junionfree`.`server_memo` (`var`,`value`) VALUES ('fishChampionshipEnd', '1758664800585'),('olympiad_cycle', '1'),('server_crash', 'true')
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`seven_signs` WRITE;
DELETE FROM `l2junionfree`.`seven_signs`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`seven_signs_festival` WRITE;
DELETE FROM `l2junionfree`.`seven_signs_festival`;
INSERT INTO `l2junionfree`.`seven_signs_festival` (`festivalId`,`cabal`,`cycle`,`date`,`score`,`members`) VALUES (0, 'DAWN', 1, 0, 0, ''),(0, 'DAWN', 2, 0, 0, ''),(0, 'DAWN', 3, 0, 0, ''),(0, 'DAWN', 4, 0, 0, ''),(0, 'DAWN', 5, 0, 0, ''),(0, 'DAWN', 6, 0, 0, ''),(0, 'DAWN', 7, 0, 0, ''),(0, 'DUSK', 1, 0, 0, ''),(0, 'DUSK', 2, 0, 0, ''),(0, 'DUSK', 3, 0, 0, ''),(0, 'DUSK', 4, 0, 0, ''),(0, 'DUSK', 5, 0, 0, ''),(0, 'DUSK', 6, 0, 0, ''),(0, 'DUSK', 7, 0, 0, ''),(1, 'DAWN', 1, 0, 0, ''),(1, 'DAWN', 2, 0, 0, ''),(1, 'DAWN', 3, 0, 0, ''),(1, 'DAWN', 4, 0, 0, ''),(1, 'DAWN', 5, 0, 0, ''),(1, 'DAWN', 6, 0, 0, ''),(1, 'DAWN', 7, 0, 0, ''),(1, 'DUSK', 1, 0, 0, ''),(1, 'DUSK', 2, 0, 0, ''),(1, 'DUSK', 3, 0, 0, ''),(1, 'DUSK', 4, 0, 0, ''),(1, 'DUSK', 5, 0, 0, ''),(1, 'DUSK', 6, 0, 0, ''),(1, 'DUSK', 7, 0, 0, ''),(2, 'DAWN', 1, 0, 0, ''),(2, 'DAWN', 2, 0, 0, ''),(2, 'DAWN', 3, 0, 0, ''),(2, 'DAWN', 4, 0, 0, ''),(2, 'DAWN', 5, 0, 0, ''),(2, 'DAWN', 6, 0, 0, ''),(2, 'DAWN', 7, 0, 0, ''),(2, 'DUSK', 1, 0, 0, ''),(2, 'DUSK', 2, 0, 0, ''),(2, 'DUSK', 3, 0, 0, ''),(2, 'DUSK', 4, 0, 0, ''),(2, 'DUSK', 5, 0, 0, ''),(2, 'DUSK', 6, 0, 0, ''),(2, 'DUSK', 7, 0, 0, ''),(3, 'DAWN', 1, 0, 0, ''),(3, 'DAWN', 2, 0, 0, ''),(3, 'DAWN', 3, 0, 0, ''),(3, 'DAWN', 4, 0, 0, ''),(3, 'DAWN', 5, 0, 0, ''),(3, 'DAWN', 6, 0, 0, ''),(3, 'DAWN', 7, 0, 0, ''),(3, 'DUSK', 1, 0, 0, ''),(3, 'DUSK', 2, 0, 0, ''),(3, 'DUSK', 3, 0, 0, ''),(3, 'DUSK', 4, 0, 0, ''),(3, 'DUSK', 5, 0, 0, ''),(3, 'DUSK', 6, 0, 0, ''),(3, 'DUSK', 7, 0, 0, ''),(4, 'DAWN', 1, 0, 0, ''),(4, 'DAWN', 2, 0, 0, ''),(4, 'DAWN', 3, 0, 0, ''),(4, 'DAWN', 4, 0, 0, ''),(4, 'DAWN', 5, 0, 0, ''),(4, 'DAWN', 6, 0, 0, ''),(4, 'DAWN', 7, 0, 0, ''),(4, 'DUSK', 1, 0, 0, ''),(4, 'DUSK', 2, 0, 0, ''),(4, 'DUSK', 3, 0, 0, ''),(4, 'DUSK', 4, 0, 0, ''),(4, 'DUSK', 5, 0, 0, ''),(4, 'DUSK', 6, 0, 0, ''),(4, 'DUSK', 7, 0, 0, '')
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`seven_signs_status` WRITE;
DELETE FROM `l2junionfree`.`seven_signs_status`;
INSERT INTO `l2junionfree`.`seven_signs_status` (`id`,`current_cycle`,`festival_cycle`,`active_period`,`date`,`previous_winner`,`dawn_stone_score`,`dawn_festival_score`,`dusk_stone_score`,`dusk_festival_score`,`avarice_owner`,`gnosis_owner`,`strife_owner`,`avarice_dawn_score`,`gnosis_dawn_score`,`strife_dawn_score`,`avarice_dusk_score`,`gnosis_dusk_score`,`strife_dusk_score`,`accumulated_bonus0`,`accumulated_bonus1`,`accumulated_bonus2`,`accumulated_bonus3`,`accumulated_bonus4`) VALUES (0, 7, 18, 'COMPETITION', 1758524400021, 'NORMAL', 0, 0, 0, 0, 'NORMAL', 'NORMAL', 'NORMAL', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`siege_clans` WRITE;
DELETE FROM `l2junionfree`.`siege_clans`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`spawn_data` WRITE;
DELETE FROM `l2junionfree`.`spawn_data`;
INSERT INTO `l2junionfree`.`spawn_data` (`name`,`status`,`current_hp`,`current_mp`,`loc_x`,`loc_y`,`loc_z`,`heading`,`db_value`,`respawn_time`) VALUES ('amber', 1, 1100996, 4304, 185853, -106218, -6304, 10156, 0, 0),('anais_brilliance_master', 1, 1144519, 4553, 112800, -76160, 10, 49152, 0, 0),('anakims_nemesis_zakaron', 1, 1777317, 2987, 150900, 88213, -5424, 17188, 0, 0),('ancient_weird_drake', 1, 1052436, 2286, 120084, 111394, -3056, 45538, 0, 0),('antaras_adherent_skyla', 1, 141034, 795, 117756, 103643, -3576, 6889, 0, 0),('antaras_cloe', 1, 935092, 3274, 152260, 110394, -5552, 0, 0, 0),('antaras_max', 1, 21551606, 53859, 185708, 114298, -8221, 32768, 0, 0),('antaras_min', 1, 17331988, 43314, 185708, 114298, -8221, 32768, 0, 0),('antaras_normal', 1, 19717847, 49277, 185708, 114298, -8221, 32768, 0, 0),('apepi', 1, 255564, 731, 87857, 175918, -3512, 6167, 0, 0),('archon_susceptor', 1, 288415, 1355, 14926, 119010, -12088, 28648, 0, 0),('atraiban', 1, 235272, 1847, 55867, 205817, -3704, 58789, 0, 0),('baium', 1, 5571187, 7430, -105200, -253104, -15264, 0, 0, 0),('bandit_leader_barda', 1, 451391, 1975, 103946, -16653, -1792, 36393, 0, 0),('barion', 1, 319791, 1476, 108044, 27105, -3480, 3662, 0, 0),('beastlord_behemoth', 1, 888658, 2987, 124060, -23649, -3488, 19680, 0, 0),('benom', 1, 568382, 4071, 11882, -49216, -3008, 0, 0, 0),('bereths_seer_sephia', 1, 451391, 1975, 125640, 103273, -3336, 672, 0, 0),('betrayer_of_urutu_freki', 1, 103092, 575, -18324, -101346, -2104, 1059, 0, 0),('biconne_of_blue_sky', 1, 288415, 1355, 106902, 168957, -3320, 386, 0, 0),('blinding_fire_barakiel', 1, 888658, 2987, 91190, -86086, -2712, 35379, 0, 0),('bloody_empress_decarbia', 1, 945900, 3347, 188964, 13344, -2656, 14591, 0, 0),('bloody_priest_rudelto', 1, 875948, 2917, 143955, 110360, -3955, 32768, 0, 0),('bloody_tree_vermilion', 1, 945900, 3347, 147670, -20320, -3136, 47754, 0, 0),('breka_warlock_pastu', 1, 156584, 860, 90291, 125695, -2120, 3543, 0, 0),('carnage_lord_gato', 1, 369009, 1660, 75908, -9275, -2656, 55434, 0, 0),('carnamakos', 1, 507285, 1660, 23762, 119632, -8976, 41658, 0, 0),('catseye', 1, 168366, 731, 53530, 102586, -1056, 51399, 0, 0),('cherub_garacsia', 1, 987470, 3643, 113959, 14797, 9560, 16715, 0, 0),('chief_mate_tilion', 1, 369009, 1660, 43423, 219912, -3720, 6711, 0, 0),('core', 1, 244871, 1276, 17726, 108915, -6480, 0, 0, 0),('corsair_captain_kylon', 1, 148507, 827, 36113, 191620, -3088, 40380, 0, 0),('crazy_mechanic_golem', 1, 702418, 1224, 90810, 15816, -5288, 11151, 0, 0),('cronoss_summons_mumu', 1, 156584, 860, 69064, 203425, -3560, 47271, 0, 0),('cursed_clala', 1, 369009, 1660, 89804, 106033, -3256, 58595, 0, 0),('darkness_shaman_baranka', 1, 418874, 1847, 74877, -101449, -960, 9707, 0, 0),('degeneration_golem', 1, 1848045, 3202, 167614, -59561, -3792, 6719, 0, 0),('demonic_agent_falston', 1, 834231, 2707, 93396, -74932, -1824, 10167, 0, 0),('demon_tempest', 1, 174646, 927, 53159, 144130, -3856, 26878, 0, 0),('discard_guardian', 1, 175392, 426, 48166, 243428, -6608, 54386, 0, 0),('domb_death_cabrio', 1, 888658, 2987, 181110, 11907, -2720, 32960, 0, 0),('doom_blade_tanatos', 1, 1825269, 3130, 127686, -13447, -3760, 9385, 0, 0),('dread_avenger_kraven', 1, 273375, 1296, 63035, 7677, -3264, 822, 0, 0),('dr_chaos_npc', 1, 3862, 1641, 96524, -111070, -3335, 0, 0, 0),('earth_protecter_panathen', 1, 258849, 1237, 125140, 190701, -3272, 24377, 0, 0),('elf_renoa', 1, 121941, 699, -37586, 198230, -2688, 33155, 0, 0),('enmity_ghost_ramdal', 1, 588136, 2639, 113295, 17293, -4376, 34700, 0, 0),('ereve_deathman', 1, 385670, 1722, 149748, 67461, -3656, 39789, 0, 0),('eva_guardian_millenu', 1, 346037, 2169, 89557, 246544, -10376, 15425, 0, 0),('eyes_of_bereth', 1, 165289, 893, 6025, 189251, -3688, 17718, 0, 0),('fafurions_pagehood_sika', 1, 218810, 1062, 112181, 209262, -3576, 57022, 0, 0),('faf_herald_lokness', 1, 1777317, 2987, 102656, 157424, -3735, 0, 0, 0),('fairys_watcher_ruell', 1, 451391, 1975, 125675, 50221, -3688, 2500, 0, 0),('fairy_queen_timiniel', 1, 539706, 2368, 114062, 47546, -4656, 23599, 0, 0),('fiercetiger_king_angel', 1, 1637918, 2627, 170763, 85184, -1984, 26128, 0, 0),('flamelord_shadar', 1, 165289, 893, 44351, 123904, -3128, 54752, 0, 0),('flamestone_golem', 1, 273375, 1296, 79369, 18599, -5240, 8535, 0, 0),('flame_stone_golem', 1, 956490, 3420, 144570, -5635, -4720, 63006, 0, 0),('follower_of_frintessa', 1, 1832600, 22200, -105200, -253104, -15264, 16834, 0, 0),('follower_of_frintessa_tr', 1, 2748900, 46620, -105200, -253104, -15264, 16834, 0, 0),('frintessa', 1, 791683, 47157, -105200, -253104, -15264, 16834, 0, 0),('furious_thieles', 1, 624464, 1975, 113375, 52934, -3696, 80, 0, 0),('gargoyle_lord_sirocco', 1, 165289, 893, -16072, 184361, -3807, 45056, 0, 0),('gargoyle_lord_tiphon', 1, 1637918, 2639, 170671, -24979, -3512, 38457, 0, 0),('geyser_guardian_hestia', 1, 977229, 3568, 134590, -114869, -1176, 732, 0, 0),('ghost_kabed', 1, 451391, 1975, 183113, 24818, -3168, 48736, 0, 0),('ghost_of_peasant_leader', 1, 507285, 1660, 169478, 11751, -2728, 9156, 0, 0),('giant_marpanak', 1, 1461912, 2301, 193357, 53807, -4368, 511, 0, 0),('giant_wasteland_basil', 1, 127782, 731, -16896, 175000, -3296, 60976, 0, 0),('golkonda_longhorn', 1, 1974940, 3643, 116668, 14882, 6992, 64638, 0, 0),('gordon', 1, 2289038, 4553, 151230, -64246, -3184, 34694, 0, 0),('gorgolos', 1, 576851, 2570, 186122, 61854, -4152, 5103, 0, 0),('grandeur_soul_chertuba', 1, 330579, 893, -91153, 116202, -3456, 37885, 0, 0),('grave_rabber_khim', 1, 402319, 1784, 175815, 29745, -3776, 15868, 0, 0),('grave_robber_akata', 1, 127782, 731, 48575, -106191, -1568, 50856, 0, 0),('greyclaw_kutus', 1, 95986, 514, -54598, 146156, -2872, 2031, 0, 0),('guardian_3_of_garden', 1, 283755, 2301, 77267, 245751, -10376, 23014, 0, 0),('gwindorr', 1, 218810, 1062, 86101, 217410, -3576, 25966, 0, 0),('Hallate_the_death_lord', 1, 924022, 3202, 112769, 17775, -2120, 22346, 0, 0),('handmaiden_of_orfen', 1, 335987, 1537, 41388, 23947, -4512, 5074, 0, 0),('harit_hero_tamash', 1, 624464, 1975, 165886, 87803, -2368, 4543, 0, 0),('harit_tutelar_garangky', 1, 467209, 2039, 166219, 67629, -3256, 57308, 0, 0),('hatos', 1, 526218, 2301, 182106, 52736, -4360, 4708, 0, 0),('heart_of_volcano', 1, 3861, 1657, 189872, -105152, -724, 49000, 0, 0),('hekaton_prime', 1, 818959, 2639, 191683, 55616, -7616, 8021, 0, 0),('hope_immortality_mardil', 1, 645953, 3058, 113335, 17508, -1408, 25082, 0, 0),('icarus_sample_21', 1, 294846, 1062, 94067, 197816, -3704, 2008, 0, 0),('ikuntai', 1, 134813, 575, -21798, 152062, -3056, 6423, 0, 0),('ipos_the_death_lord', 1, 1891801, 3332, 153984, -14529, -3680, 13059, 0, 0),('iron_giant_totem', 1, 392985, 1355, 93393, 20001, -3584, 33769, 0, 0),('istary_papurrion', 1, 288415, 1355, 126656, 174476, -3048, 50397, 0, 0),('jeruna_queen', 1, 208019, 860, 25913, 100687, -3696, 6, 0, 0),('karte', 1, 352421, 1598, 116765, 28146, -3312, 46754, 0, 0),('katu_van_atui', 1, 352421, 1598, 92661, 8102, -3904, 46765, 0, 0),('kaysha_herald_of_ikaros', 1, 90169, 455, -47006, 52234, -5912, 56098, 0, 0),('kelbar', 1, 273375, 1296, 107321, 92413, -2208, 41587, 0, 0),('Kernon', 1, 945900, 3347, 113931, 16597, 3960, 52612, 0, 0),('ketra_chief_brakki', 1, 1639965, 4553, 144556, -84806, -6224, 49885, 0, 0),('ketra_commander_tayr', 1, 773553, 4183, 145416, -81208, -6000, 11814, 0, 0),('ketra_hero_hekaton', 1, 714778, 3718, 148021, -72990, -4904, 33967, 0, 0),('king_tarlk', 1, 920790, 1537, 77391, 5478, -3096, 33760, 0, 0),('king_tiger_karuta', 1, 288415, 1355, 75159, 111359, -2448, 10223, 0, 0),('korim', 1, 888658, 2987, 115782, 15964, 1944, 51702, 0, 0),('krokian_padisha_sobekk', 1, 935092, 3274, 119760, 157392, -3744, 0, 0, 0),('kurikups', 1, 512194, 2235, 42038, 215553, -3728, 1842, 0, 0),('langk_matriarch_rashkos', 1, 198734, 545, -47552, 219196, -2400, 1429, 0, 0),('last_lesser_glaki', 1, 977229, 3568, 188803, 47814, -5880, 24892, 0, 0),('last_lesser_olkuth', 1, 1891801, 3347, 172074, 55148, -5920, 46342, 0, 0),('last_lesser_utenus', 1, 598898, 2707, 187096, 56271, -4576, 42716, 0, 0),('leto_chief_talkin', 1, 218810, 1062, 86816, 75972, -3624, 2748, 0, 0),('liliths_oracle_marilion', 1, 507285, 1660, 54666, 180188, -4976, 7078, 0, 0),('lizardman_leader_hellion', 1, 195371, 994, 26503, 123335, -3624, 32033, 0, 0),('lord_ishka', 1, 526218, 2301, 114826, 112399, -3016, 11943, 0, 0),('lost_cat_the_cat_a', 1, 206753, 1028, 87963, 140302, -3472, 64365, 0, 0),('love_reverser_kael', 1, 99367, 545, -60621, 188315, -4512, 32959, 0, 0),('madness_beast', 1, 87696, 426, -53762, 84366, -3544, 21347, 0, 0),('magician_kenishee', 1, 100831, 1847, 52993, 205358, -3728, 44441, 0, 0),('malex_herald_of_dagoniel', 1, 90169, 455, 9563, 77161, -3808, 46385, 0, 0),('malruks_oracle_sekina', 1, 848789, 2777, 144660, -28010, -1936, 3772, 0, 0),('mammpns_collector_talos', 1, 103092, 575, 171805, -215308, -3520, 44073, 0, 0),('manes_lidia', 1, 526218, 2301, 173977, -11245, -2872, 21896, 0, 0),('master_of_ledflage_shaka', 1, 554640, 1784, 94475, -23312, -2128, 11492, 0, 0),('meanas_anor', 1, 888658, 2987, 156666, -6009, -4144, 21344, 0, 0),('meana_agent_of_beres', 1, 127782, 731, 115853, 139583, -3632, 25591, 0, 0),('monster_cyrion', 1, 288415, 1355, 111410, 83352, -2904, 64118, 0, 0),('nakondas', 1, 218810, 1062, 128489, 138738, -3456, 52417, 0, 0),('necrosentinel_guard', 1, 319791, 1476, 81968, 113622, -3104, 27526, 0, 0),('nightmare_drake', 1, 512194, 2235, 154999, 85353, -3472, 32463, 0, 0),('niniel_spirit_eva', 1, 451391, 1975, 82259, 251616, -10592, 53466, 0, 0),('nurkas_messenger', 1, 297015, 827, 45444, 120245, -2368, 60624, 0, 0),('obern_mgr_of_fairyqueen', 1, 507285, 1660, 121517, 64360, -3480, 35760, 0, 0),('oblivion_s_mirror', 1, 352421, 1598, 133670, 87315, -3632, 38595, 0, 0),('ocean_flame_ashakiel', 1, 956490, 3420, 123808, 153408, -3671, 0, 0, 0),('orfen', 1, 489744, 3685, 56416, 27178, -4912, 23422, 0, 0),('pagan_warder_cerberon', 1, 1248928, 1975, -12931, -240387, -8160, 60867, 0, 0),('palibati_queen_themis', 1, 888658, 2987, 193408, 22784, -3608, 25941, 0, 0),('pan_draid', 1, 206185, 571, 7914, 169622, -3672, 60363, 0, 0),('papurrion_pingolpin', 1, 402319, 1784, 88639, 258103, -10376, 27173, 0, 0),('partisan_leader_talakin', 1, 233163, 668, 48960, 128039, -3512, 4132, 0, 0),('patriarch_kuroboros', 1, 214372, 598, -62023, 190594, -3664, 41622, 0, 0),('premo_prime_the_creature', 1, 390743, 994, 101478, 200805, -3720, 51573, 0, 0),('priest_hisilrome', 1, 588136, 2639, 167721, 28714, -3600, 64065, 0, 0),('priest_of_kuroboros', 1, 95986, 514, -62098, 179942, -3512, 37466, 0, 0),('princess_molrang', 1, 103092, 575, -61356, 126501, -2880, 51294, 0, 0),('queens_nobel_leader', 1, 141034, 795, 30093, 107228, -3720, 40696, 0, 0),('queen_ant', 1, 346301, 1480, -21610, 181594, -5734, 0, 0, 0),('ragraman', 1, 336732, 731, -54306, 170683, -3160, 36479, 0, 0),('rahha', 1, 818959, 2639, 117432, -8799, -3264, 6068, 0, 0),('raid_boss_von_helman', 1, 900867, 3058, 59333, -41858, -3003, 9241, 0, 0),('rayito_the_looter', 1, 184670, 960, 127832, -160647, -1232, 37571, 0, 0),('redeye_leader_trakia', 1, 165289, 893, 40129, 102048, -1248, 8192, 0, 0),('refuge_hoper_leo', 1, 467209, 2039, 86369, -8269, -3032, 13615, 0, 0),('remmel', 1, 165289, 893, 10720, 126507, -3688, 3996, 0, 0),('repiro_rot_tree', 1, 273375, 1296, 63695, 16093, -3520, 45653, 0, 0),('retreat_spider_cletu', 1, 331522, 1178, 124635, 74817, -2760, 30281, 0, 0),('revenant_of_sir_calibus', 1, 156584, 860, 51165, 153919, -3544, 37571, 0, 0),('road_scavenger_leader', 1, 218810, 1062, 71683, 126083, -3632, 18514, 0, 0),('roaring_seer_kastor', 1, 768537, 2435, 103823, -2925, -3376, 30781, 0, 0),('roar_skylancer', 1, 1338611, 2987, 130420, 59176, 3584, 19888, 0, 0),('sailren', 1, 1639965, 4553, -113091, -243942, -15536, 0, 0, 0),('sebek', 1, 174646, 927, 76539, 192940, -3704, 31010, 0, 0),('sejarr_s_summoner', 1, 330579, 887, 123240, 133905, -3632, 15230, 0, 0),('serpent_demon_bifrons', 1, 90169, 455, -13885, 214259, -3736, 55735, 0, 0),('shacram', 1, 576831, 1355, 114254, 84519, -2472, 63399, 0, 0),('shaman_king_selu', 1, 294846, 1062, 73083, 66572, -3720, 3728, 0, 0),('shax_the_death_lord', 1, 1891801, 3347, 179278, -8336, -4896, 13754, 0, 0),('shuriel_fire_of_wrath', 1, 977229, 3568, 112969, 16128, 6992, 34855, 0, 0),('sorcery_isirr', 1, 451391, 1975, 135379, 94258, -3696, 19827, 0, 0),('soulless_wild_boar', 1, 512194, 2235, 165032, 94022, -3080, 10921, 0, 0),('soul_collector_acheron', 1, 165289, 893, 42879, 152440, -2832, 43408, 0, 0),('soul_scavenger', 1, 103092, 575, -45691, 110846, -3808, 48924, 0, 0),('spike_stakato_qn_shyid', 1, 714778, 3718, 78777, -55331, -6136, 45050, 0, 0),('spirits_of_nellis', 1, 206753, 1028, 122994, -141125, -1504, 15298, 0, 0),('spirit_andras_betrayer', 1, 1256671, 2917, 185729, -26494, -2152, 51922, 0, 0),('storm_winged_naga', 1, 1891801, 3347, 137806, -19885, -3488, 42259, 0, 0),('sukar_wererat_chief', 1, 90169, 455, -3180, 113237, -3504, 55177, 0, 0),('taik_prefect_arak', 1, 526218, 2301, 170282, 42266, -4848, 17526, 0, 0),('tasaba_patriarch_hellena', 1, 165289, 893, 88278, 166048, -3448, 29148, 0, 0),('tiger_hornet', 1, 107186, 606, 29316, 179184, -3608, 12479, 0, 0),('timak_orc_gosmos', 1, 576831, 1355, 67604, 64185, -3704, 58629, 0, 0),('timak_orc_hunter_a', 1, 371721, 1296, 66403, 67882, -3720, 54499, 0, 0),('timak_seer_ragoth', 1, 482650, 2104, 66522, 46326, -3912, 45901, 0, 0),('tirak', 1, 116581, 668, -57345, 186464, -4968, 13190, 0, 0),('tracker_sharuk', 1, 95986, 514, -56369, 186998, -3336, 43854, 0, 0),('triolls_priest_andreas', 1, 275385, 4553, -16385, -53268, -10439, 16384, 0, 0),('turek_mercenary_boss', 1, 168366, 731, -93511, 100249, -3544, 65023, 0, 0),('unicorn_paniel', 1, 435256, 1911, 124810, 43078, -3656, 38975, 0, 0),('uruka', 1, 1608553, 451, 5225, -8439, -3576, 15553, 0, 0),('valakas', 1, 25095443, 49277, -105200, -253104, -15264, 0, 0, 0),('vanor_chief_kandra', 1, 912634, 3130, 116345, -62558, -3248, 54521, 0, 0),('varka_chief_horuth', 1, 1639965, 4553, 105586, -42557, -1752, 22146, 0, 0),('varka_commnder_mos', 1, 773553, 4183, 108601, -35457, -808, 55594, 0, 0),('varka_hero_shadith', 1, 714778, 3718, 116142, -38919, -2432, 4001, 0, 0),('verfa', 1, 771340, 1722, 125862, 26505, -3664, 53473, 0, 0),('vuku_witchdr_gharmash', 1, 148507, 827, 17604, 179463, -3528, 24424, 0, 0),('warden_guillotine', 1, 330579, 893, 50529, 146300, -3608, 62843, 0, 0),('water_couatl_ateka', 1, 218810, 1062, 73507, 201389, -3768, 60328, 0, 0),('water_spirit_lian', 1, 218810, 1062, 82451, 183540, -3608, 49990, 0, 0),('wdragon_priest_sheshark', 1, 912634, 3130, 108096, 157408, -3688, 0, 0, 0),('witch_wimere', 1, 451391, 1975, 92571, 115302, -3200, 59271, 0, 0),('wizard_of_storm_teruk', 1, 218810, 1062, 92455, 84602, -3688, 54185, 0, 0),('zaken', 1, 1293211, 4384, 56457, 218167, -3496, 51318, 0, 0),('zakens_butcher_krantz', 1, 1248928, 1975, 42058, 208097, -3760, 55051, 0, 0),('zombie_lord_crowl', 1, 103092, 575, -12728, 137807, -3544, 43023, 0, 0),('zombie_lord_farakelsus', 1, 87696, 426, 22362, 80257, -3192, 62438, 0, 0)
;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `l2junionfree`.`starter_kits` WRITE;
DELETE FROM `l2junionfree`.`starter_kits`;
INSERT INTO `l2junionfree`.`starter_kits` (`charId`,`received`) VALUES (268473454, 1),(268473539, 1),(268473644, 1),(268473673, 1),(268473754, 1),(268473785, 1),(268474126, 1)
;
UNLOCK TABLES;
COMMIT;
