DROP TABLE IF EXISTS `#__tuiyo_albums`;
CREATE TABLE  `#__tuiyo_albums` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ownerid` int(10) unsigned NOT NULL,
  `coverpic_id` int(10) unsigned DEFAULT '0',
  `name` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text,
  `location` text,
  `slideshow_link` text,
  `last_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `album_type` varchar(45) NOT NULL DEFAULT 'profile' COMMENT 'profile or group?',
  `published` enum('0','1') NOT NULL DEFAULT '1',
  `photocount` int(10) unsigned NOT NULL DEFAULT '0',
  `privacy` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tuiyo_applications`;
CREATE TABLE  `#__tuiyo_applications` (
  `extID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `published` enum('0','1') NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL,
  `installedDate` date NOT NULL DEFAULT '0000-00-00',
  `usersCount` int(11) NOT NULL DEFAULT '0',
  `lastUpdated` date NOT NULL DEFAULT '0000-00-00',
  `folder` varchar(45) NOT NULL DEFAULT 'applications',
  PRIMARY KEY (`extID`,`identifier`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tuiyo_categories`;
CREATE TABLE  `#__tuiyo_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(10) unsigned DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `thumb` varchar(200) DEFAULT NULL,
  `description` text,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `creator` int(10) unsigned NOT NULL,
  `dateadded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lft` int(10) NOT NULL,
  `rgt` int(10) NOT NULL,
  `params` text NOT NULL,
  `attributes` text NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tuiyo_categories_maps`;
CREATE TABLE  `#__tuiyo_categories_maps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resourceid` int(11) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `maptype` varchar(100) NOT NULL,
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tuiyo_fields`;
CREATE TABLE  `#__tuiyo_fields` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `descr` text,
  `type` varchar(100) NOT NULL,
  `maxlength` int(11) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `required` enum('0','1') NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL,
  `defaultvalue` varchar(255) DEFAULT NULL,
  `visible` enum('0','1') NOT NULL DEFAULT '1',
  `validation` text,
  `attributes` text,
  `indexed` enum('0','1') DEFAULT '1',
  `linkfieldvalue` varchar(255) DEFAULT NULL,
  `tablename` varchar(90) DEFAULT NULL,
  `options` text,
  `editable` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tuiyo_friends`;
CREATE TABLE  `#__tuiyo_friends` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `listID` int(10) unsigned NOT NULL DEFAULT '0',
  `thisUserID` int(10) unsigned NOT NULL,
  `thatUserID` int(10) unsigned NOT NULL,
  `state` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `lastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user1` int(10) unsigned NOT NULL,
  `user2` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNIQUE` (`user1`,`user2`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tuiyo_groups`;
CREATE TABLE  `#__tuiyo_groups` (
  `groupID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creatorID` int(10) unsigned NOT NULL,
  `gType` varchar(45) NOT NULL,
  `longDescription` text,
  `shortDescription` text NOT NULL,
  `gName` varchar(45) NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `topicCount` int(10) unsigned NOT NULL DEFAULT '0',
  `memberCount` int(10) unsigned NOT NULL DEFAULT '0',
  `banner` varchar(200) DEFAULT NULL,
  `lastUpdated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `logo` varchar(200) DEFAULT NULL,
  `webpageURL` varchar(200) DEFAULT NULL,
  `isPublished` tinyint(1) NOT NULL DEFAULT '0',
  `params` text,
  `catID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`groupID`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tuiyo_groups_activity`;
CREATE TABLE  `#__tuiyo_groups_activity` (
  `activityID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `memberID` int(10) unsigned NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `userName` varchar(45) NOT NULL,
  `inReplyTo` int(10) unsigned DEFAULT NULL,
  `aType` varchar(45) NOT NULL DEFAULT 'topic' COMMENT 'comment, like, resource, dislike',
  `groupID` int(10) unsigned NOT NULL,
  `attachment` int(10) unsigned DEFAULT NULL,
  `dateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`activityID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tuiyo_groups_members`;
CREATE TABLE  `#__tuiyo_groups_members` (
  `memberID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` varchar(45) NOT NULL,
  `joinDate` varchar(45) NOT NULL,
  `lastSeen` datetime NOT NULL,
  `rank` varchar(45) NOT NULL,
  `params` varchar(45) NOT NULL,
  `privacy` varchar(45) NOT NULL,
  `groupID` varchar(45) NOT NULL,
  PRIMARY KEY (`memberID`),
  UNIQUE KEY `UNIQUE-PAIR` (`groupID`,`userID`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tuiyo_invites`;
CREATE TABLE  `#__tuiyo_invites` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(150) NOT NULL,
  `name` text NOT NULL,
  `state` enum('0','1') NOT NULL COMMENT '0 pendng, 1=activated',
  `acceptdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `code` text NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNIQUE` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tuiyo_log`;
CREATE TABLE  `#__tuiyo_log` (
  `logID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(45) DEFAULT NULL,
  `client` text,
  `title` varchar(45) NOT NULL,
  `notes` text,
  `related` int(10) unsigned DEFAULT NULL,
  `caseID` int(10) unsigned DEFAULT NULL,
  `mentioned` text,
  `actionType` varchar(45) NOT NULL DEFAULT 'maintainance',
  PRIMARY KEY (`logID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tuiyo_notifications`;
CREATE TABLE  `#__tuiyo_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `template` text,
  `link` text NOT NULL,
  `application` varchar(50) NOT NULL DEFAULT 'Profile',
  `status` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '0 = unread, 1= read , 2=solved if in moderation queue',
  `type` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `linktitle` text NOT NULL,
  `noticetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tuiyo_params`;
CREATE TABLE  `#__tuiyo_params` (
  `paramsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(10) unsigned NOT NULL,
  `application` varchar(20) NOT NULL DEFAULT 'system',
  `data` text,
  `lastModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`paramsID`),
  UNIQUE KEY `UNIQUE` (`userID`,`application`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tuiyo_photos`;
CREATE TABLE  `#__tuiyo_photos` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aid` int(10) unsigned NOT NULL,
  `userid` int(10) unsigned NOT NULL,
  `src_thumb_id` int(10) unsigned NOT NULL,
  `src_original_id` int(10) unsigned NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment_count` int(10) unsigned NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tags` text,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tuiyo_plugins`;
CREATE TABLE  `#__tuiyo_plugins` (
  `pluginID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `key` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `access` varchar(45) NOT NULL DEFAULT '0',
  `isPublished` tinyint(1) NOT NULL DEFAULT '0',
  `isCore` tinyint(1) NOT NULL DEFAULT '0',
  `params` text,
  PRIMARY KEY (`pluginID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tuiyo_posts`;
CREATE TABLE  `#__tuiyo_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `postcontent` longtext NOT NULL,
  `posttitle` text NOT NULL,
  `postexcerpt` text NOT NULL,
  `poststatus` varchar(20) NOT NULL DEFAULT 'publish',
  `commentstatus` varchar(20) NOT NULL DEFAULT 'open',
  `pingstatus` varchar(20) NOT NULL DEFAULT 'open',
  `postpassword` varchar(20) NOT NULL DEFAULT '',
  `postname` varchar(200) NOT NULL DEFAULT '',
  `toping` text NOT NULL,
  `pinged` text NOT NULL,
  `postmodified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `postmodifiedgmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `postcontentfiltered` text NOT NULL,
  `postparent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `posttype` varchar(20) NOT NULL DEFAULT 'post',
  `postmimetype` varchar(100) NOT NULL DEFAULT '',
  `commentcount` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tuiyo_reports`;
CREATE TABLE  `#__tuiyo_reports` (
  `reportID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(45) NOT NULL,
  `reporterID` int(10) unsigned NOT NULL,
  `resourceID` int(10) unsigned NOT NULL,
  `resourceType` varchar(45) NOT NULL COMMENT 'profile, avatar, audio, comment, video, tag ..(anything)',
  `ownerID` int(10) unsigned NOT NULL,
  `notes` text NOT NULL,
  `resolved` tinyint(1) NOT NULL DEFAULT '0',
  `reportDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resolvedDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`reportID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tuiyo_resources`;
CREATE TABLE  `#__tuiyo_resources` (
  `resourceID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(10) unsigned NOT NULL,
  `dateAdded` date DEFAULT NULL,
  `size` int(10) unsigned DEFAULT '0',
  `rating` varchar(10) DEFAULT '0',
  `album` varchar(100) DEFAULT NULL,
  `artist` varchar(100) DEFAULT NULL,
  `author` varchar(60) DEFAULT NULL,
  `composer` varchar(100) DEFAULT NULL,
  `contentType` varchar(15) DEFAULT NULL,
  `dateLastModified` date DEFAULT NULL,
  `dimension` varchar(200) DEFAULT NULL,
  `fileName` varchar(100) DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  `owner` varchar(45) DEFAULT NULL,
  `fileType` varchar(10) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `year` varchar(5) DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL,
  `fileTitle` varchar(160) NOT NULL,
  PRIMARY KEY (`resourceID`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tuiyo_timeline`;
CREATE TABLE  `#__tuiyo_timeline` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(10) unsigned NOT NULL,
  `appID` int(10) unsigned DEFAULT NULL,
  `source` varchar(50) DEFAULT 'web',
  `template` int(11) NOT NULL,
  `data` text NOT NULL,
  `state` enum('0','1') NOT NULL DEFAULT '1',
  `type` varchar(50) NOT NULL,
  `inreplyto` int(10) unsigned DEFAULT '0',
  `mentions` text,
  `tags` text,
  `likes` text,
  `dislikes` text,
  `sharewith` text NOT NULL,
  `geolocation` varchar(100) DEFAULT NULL,
  `mapresourceid` int(11) DEFAULT NULL,
  `params` text,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tuiyo_timelinetmpl`;
CREATE TABLE  `#__tuiyo_timelinetmpl` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `appName` varchar(45) NOT NULL,
  `identifier` varchar(45) NOT NULL,
  `title` text NOT NULL,
  `variables` text,
  `body` text,
  `resources` text,
  `actions` text,
  `type` enum('0','1') NOT NULL DEFAULT '0',
  `thisUserID` int(10) unsigned DEFAULT NULL,
  `thatUserID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tuiyo_userapps`;
CREATE TABLE  `#__tuiyo_userapps` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `appID` int(10) unsigned NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `ordering` int(10) unsigned NOT NULL DEFAULT '0',
  `lastUsed` datetime DEFAULT '0000-00-00 00:00:00',
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `appName` varchar(45) NOT NULL,
  `hasTimeline` tinyint(1) NOT NULL DEFAULT '0',
  `hasSearch` tinyint(1) NOT NULL DEFAULT '0',
  `hasNotifications` tinyint(1) NOT NULL DEFAULT '0',
  `hasProfile` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ONEAPPPERUSER` (`appID`,`userID`,`appName`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tuiyo_userplugins`;
CREATE TABLE  `#__tuiyo_userplugins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `userid` varchar(45) NOT NULL DEFAULT '0',
  `lastupdated` varchar(100) DEFAULT NULL,
  `privacy` tinyint(10) NOT NULL DEFAULT '0',
  `params` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_SERVICE` (`name`,`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tuiyo_users`;
CREATE TABLE  `#__tuiyo_users` (
  `profileID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(10) unsigned NOT NULL,
  `profileName` text,
  `dateCreated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sex` enum('0','1') DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `picture` int(11) unsigned DEFAULT NULL,
  `statusID` int(11) DEFAULT NULL,
  `profileView` int(11) NOT NULL DEFAULT '0',
  `profileRatings` int(11) NOT NULL DEFAULT '0',
  `totalVotes` int(11) NOT NULL DEFAULT '0',
  `styleID` int(11) DEFAULT NULL,
  `externalIDs` text,
  `privacyID` int(11) DEFAULT NULL,
  `suspended` enum('0','1','2','3') NOT NULL DEFAULT '0',
  PRIMARY KEY (`profileID`,`userID`),
  UNIQUE KEY `userID` (`userID`),
  UNIQUE KEY `profileID` (`profileID`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='User profile table';

DROP TABLE IF EXISTS `#__tuiyo_widgets`;
CREATE TABLE  `#__tuiyo_widgets` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(10) unsigned NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `identifier` varchar(45) DEFAULT NULL,
  `title` text,
  `size` int(10) unsigned DEFAULT NULL COMMENT 'column size percentile',
  `type` varchar(45) NOT NULL COMMENT 'page, tab, column, widget',
  `file_xml` text COMMENT 'e.g gshark.xml',
  `params` text COMMENT 'json configuration',
  `ordering` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tuiyo_chat_rooms`;
CREATE TABLE IF NOT EXISTS `#__tuiyo_chat_rooms` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `usercount` int(10) NOT NULL,
  `datafile` text,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UNIQUE2` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

DROP TABLE IF EXISTS `#__tuiyo_chat_rooms_users`;
CREATE TABLE IF NOT EXISTS `#__tuiyo_chat_rooms_users` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET latin1 NOT NULL,
  `room` int(10) NOT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UNIQUE` (`userid`,`room`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;

DROP TABLE IF EXISTS `#__core_acl_acl`;
CREATE TABLE IF NOT EXISTS `#__core_acl_acl` (
  `id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(100) NOT NULL DEFAULT 'system',
  `allow` int(11) NOT NULL DEFAULT '0',
  `enabled` int(11) NOT NULL DEFAULT '0',
  `return_value` text,
  `note` text,
  `updated_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `enabled_acl` (`enabled`),
  KEY `section_value_acl` (`section_value`),
  KEY `updated_date_acl` (`updated_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT="added by com_tuiyo";

DROP TABLE IF EXISTS `#__core_acl_acl_sections`;
CREATE TABLE IF NOT EXISTS `#__core_acl_acl_sections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(100) NOT NULL,
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(220) NOT NULL,
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `value_acl_sections` (`value`),
  KEY `hidden_acl_sections` (`hidden`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT="added by com_tuiyo";

DROP TABLE IF EXISTS `#__core_acl_aco`;
CREATE TABLE IF NOT EXISTS `#__core_acl_aco` (
  `id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(100) NOT NULL DEFAULT '0',
  `value` varchar(100) NOT NULL,
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `section_value_value_aco` (`section_value`,`value`),
  KEY `hidden_aco` (`hidden`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT="added by com_tuiyo";

DROP TABLE IF EXISTS `#__core_acl_aco_map`;
CREATE TABLE IF NOT EXISTS `#__core_acl_aco_map` (
  `acl_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(100) NOT NULL DEFAULT '0',
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT="added by com_tuiyo";

DROP TABLE IF EXISTS `#__core_acl_aco_sections`;
CREATE TABLE IF NOT EXISTS `#__core_acl_aco_sections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(100) NOT NULL,
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(230) NOT NULL,
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `value_aco_sections` (`value`),
  KEY `hidden_aco_sections` (`hidden`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT="added by com_tuiyo";

DROP TABLE IF EXISTS `#__core_acl_aro_groups_map`;
CREATE TABLE IF NOT EXISTS `#__core_acl_aro_groups_map` (
  `acl_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`acl_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT="added by com_tuiyo";

INSERT INTO `#__core_acl_aco_sections` VALUES(1, 'access', 10, 'Access', 0);
INSERT INTO `#__core_acl_aco_sections` VALUES(2, 'view', 10, 'View', 0);
INSERT INTO `#__core_acl_aco_sections` VALUES(3, 'edit', 10, 'Edit', 0);
INSERT INTO `#__core_acl_aco_sections` VALUES(4, 'manage', 10, 'Manage', 0);
INSERT INTO `#__core_acl_aco_sections` VALUES(5, 'delete', 10, 'Delete', 0);
INSERT INTO `#__core_acl_aco_sections` VALUES(6, 'create', 10, 'Create', 0);
INSERT INTO `#__core_acl_aco_sections` VALUES(7, 'moderate', 10, 'Delete', 0);