-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 06, 2015 at 08:58 PM
-- Server version: 5.5.40-MariaDB-1~trusty-log
-- PHP Version: 5.5.9-1ubuntu4.5

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `owncloud`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_activity`
--

DROP TABLE IF EXISTS `oc_activity`;
CREATE TABLE IF NOT EXISTS `oc_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8_bin NOT NULL,
  `user` varchar(64) COLLATE utf8_bin NOT NULL,
  `affecteduser` varchar(64) COLLATE utf8_bin NOT NULL,
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `subject` varchar(255) COLLATE utf8_bin NOT NULL,
  `subjectparams` varchar(255) COLLATE utf8_bin NOT NULL,
  `message` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `messageparams` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`activity_id`),
  KEY `activity_user_time` (`affecteduser`,`timestamp`),
  KEY `activity_filter_by` (`affecteduser`,`user`,`timestamp`),
  KEY `activity_filter_app` (`affecteduser`,`app`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_activity_mq`
--

DROP TABLE IF EXISTS `oc_activity_mq`;
CREATE TABLE IF NOT EXISTS `oc_activity_mq` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT,
  `amq_timestamp` int(11) NOT NULL DEFAULT '0',
  `amq_latest_send` int(11) NOT NULL DEFAULT '0',
  `amq_type` varchar(255) COLLATE utf8_bin NOT NULL,
  `amq_affecteduser` varchar(64) COLLATE utf8_bin NOT NULL,
  `amq_appid` varchar(255) COLLATE utf8_bin NOT NULL,
  `amq_subject` varchar(255) COLLATE utf8_bin NOT NULL,
  `amq_subjectparams` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`mail_id`),
  KEY `amp_user` (`amq_affecteduser`),
  KEY `amp_latest_send_time` (`amq_latest_send`),
  KEY `amp_timestamp_time` (`amq_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_appconfig`
--

DROP TABLE IF EXISTS `oc_appconfig`;
CREATE TABLE IF NOT EXISTS `oc_appconfig` (
  `appid` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `configkey` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `configvalue` longtext COLLATE utf8_bin,
  PRIMARY KEY (`appid`,`configkey`),
  KEY `appconfig_config_key_index` (`configkey`),
  KEY `appconfig_appid_key` (`appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `oc_appconfig`
--

INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES
('activity', 'enabled', 'yes'),
('activity', 'installed_version', '1.2.0'),
('activity', 'ocsid', '166038'),
('activity', 'types', 'filesystem'),
('backgroundjob', 'lastjob', '1'),
('core', 'global_cache_gc_lastrun', '1428341866'),
('core', 'installedat', '1428340067.4544'),
('core', 'lastcron', '1428341866'),
('core', 'lastupdatedat', '1428340067.5363'),
('core', 'public_files', 'files_sharing/public.php'),
('core', 'public_gallery', 'gallery/public.php'),
('core', 'public_webdav', 'files_sharing/publicwebdav.php'),
('core', 'remote_files', 'files/appinfo/remote.php'),
('core', 'remote_webdav', 'files/appinfo/remote.php'),
('files', 'enabled', 'yes'),
('files', 'installed_version', '1.1.9'),
('files', 'types', 'filesystem'),
('files_locking', 'enabled', 'yes'),
('files_locking', 'installed_version', ''),
('files_locking', 'types', 'filesystem'),
('files_pdfviewer', 'enabled', 'yes'),
('files_pdfviewer', 'installed_version', '0.7'),
('files_pdfviewer', 'ocsid', '166049'),
('files_pdfviewer', 'types', ''),
('files_sharing', 'enabled', 'yes'),
('files_sharing', 'installed_version', '0.6.1'),
('files_sharing', 'ocsid', '166050'),
('files_sharing', 'types', 'filesystem'),
('files_texteditor', 'enabled', 'yes'),
('files_texteditor', 'installed_version', '0.4'),
('files_texteditor', 'ocsid', '166051'),
('files_texteditor', 'types', ''),
('files_trashbin', 'enabled', 'yes'),
('files_trashbin', 'installed_version', '0.6.2'),
('files_trashbin', 'ocsid', '166052'),
('files_trashbin', 'types', 'filesystem'),
('files_versions', 'enabled', 'yes'),
('files_versions', 'installed_version', '1.0.5'),
('files_versions', 'ocsid', '166053'),
('files_versions', 'types', 'filesystem'),
('files_videoviewer', 'enabled', 'yes'),
('files_videoviewer', 'installed_version', '0.1.3'),
('files_videoviewer', 'ocsid', '166054'),
('files_videoviewer', 'types', ''),
('firstrunwizard', 'enabled', 'yes'),
('firstrunwizard', 'installed_version', '1.1'),
('firstrunwizard', 'ocsid', '166055'),
('firstrunwizard', 'types', ''),
('gallery', 'enabled', 'yes'),
('gallery', 'installed_version', '0.6.0'),
('gallery', 'ocsid', '166056'),
('gallery', 'types', ''),
('provisioning_api', 'enabled', 'yes'),
('provisioning_api', 'installed_version', '0.2'),
('provisioning_api', 'types', 'filesystem'),
('templateeditor', 'enabled', 'yes'),
('templateeditor', 'installed_version', '0.1'),
('templateeditor', 'types', ''),
('updater', 'enabled', 'yes'),
('updater', 'installed_version', '0.4'),
('updater', 'ocsid', '166059'),
('updater', 'types', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_filecache`
--

DROP TABLE IF EXISTS `oc_filecache`;
CREATE TABLE IF NOT EXISTS `oc_filecache` (
  `fileid` int(11) NOT NULL AUTO_INCREMENT,
  `storage` int(11) NOT NULL DEFAULT '0',
  `path` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `path_hash` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `parent` int(11) NOT NULL DEFAULT '0',
  `name` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `mimetype` int(11) NOT NULL DEFAULT '0',
  `mimepart` int(11) NOT NULL DEFAULT '0',
  `size` bigint(20) NOT NULL DEFAULT '0',
  `mtime` int(11) NOT NULL DEFAULT '0',
  `storage_mtime` int(11) NOT NULL DEFAULT '0',
  `encrypted` int(11) NOT NULL DEFAULT '0',
  `unencrypted_size` bigint(20) NOT NULL DEFAULT '0',
  `etag` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `permissions` int(11) DEFAULT '0',
  PRIMARY KEY (`fileid`),
  UNIQUE KEY `fs_storage_path_hash` (`storage`,`path_hash`),
  KEY `fs_parent_name_hash` (`parent`,`name`),
  KEY `fs_storage_mimetype` (`storage`,`mimetype`),
  KEY `fs_storage_mimepart` (`storage`,`mimepart`),
  KEY `fs_storage_size` (`storage`,`size`,`fileid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;

--
-- Dumping data for table `oc_filecache`
--

INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`) VALUES
(1, 1, '', 'd41d8cd98f00b204e9800998ecf8427e', -1, '', 2, 1, 2462544, 1428340070, 1428340068, 0, 0, '5522bd66d903e', 23),
(2, 1, 'cache', '0fea6a13c52b4d4725368f24b045ca84', 1, 'cache', 2, 1, 0, 1428340067, 1428340067, 0, 0, '5522bd6401f00', 31),
(3, 1, 'files', '45b963397aa40d4a0063e0d85e4fe7a1', 1, 'files', 2, 1, 2462544, 1428340070, 1428340069, 0, 0, '5522bd66e26ff', 31),
(4, 1, 'files/Documents', '0ad78ba05b6961d92f7970b2b3922eca', 3, 'Documents', 2, 1, 36227, 1428340069, 1428340068, 0, 0, '5522bd653c679', 31),
(5, 1, 'files/Documents/Example.odt', 'c89c560541b952a435783a7d51a27d50', 4, 'Example.odt', 4, 3, 36227, 1428340069, 1428340069, 0, 0, 'b23867472f48572d47e92a19baa71e66', 27),
(6, 1, 'files/ownCloudUserManual.pdf', 'c8edba2d1b8eb651c107b43532c34445', 3, 'ownCloudUserManual.pdf', 5, 3, 1747761, 1428340069, 1428340069, 0, 0, '037f3e857347f6bdc8bc16dc52c3988b', 27),
(7, 1, 'files/Photos', 'd01bb67e7b71dd49fd06bad922f521c9', 3, 'Photos', 2, 1, 678556, 1428340070, 1428340070, 0, 0, '5522bd66e3395', 31),
(8, 1, 'files/Photos/Paris.jpg', 'a208ddedf08367bbc56963107248dda5', 7, 'Paris.jpg', 7, 6, 228761, 1428340070, 1428340070, 0, 0, 'de7b9e68a73b20b5e3d0fe312a4428ee', 27),
(9, 1, 'files/Photos/San Francisco.jpg', '9fc714efbeaafee22f7058e73d2b1c3b', 7, 'San Francisco.jpg', 7, 6, 216071, 1428340070, 1428340070, 0, 0, 'f1cb9cd74f30a274f64aebaca2d94679', 27),
(10, 1, 'files/Photos/Squirrel.jpg', 'de85d1da71bcd6232ad893f959063b8c', 7, 'Squirrel.jpg', 7, 6, 233724, 1428340070, 1428340070, 0, 0, '5c1a6dc71712e8f9b7a54d168f8cb77a', 27);

-- --------------------------------------------------------

--
-- Table structure for table `oc_files_trash`
--

DROP TABLE IF EXISTS `oc_files_trash`;
CREATE TABLE IF NOT EXISTS `oc_files_trash` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(250) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timestamp` varchar(12) COLLATE utf8_bin NOT NULL DEFAULT '',
  `location` varchar(512) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `mime` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`auto_id`),
  KEY `id_index` (`id`),
  KEY `timestamp_index` (`timestamp`),
  KEY `user_index` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_file_map`
--

DROP TABLE IF EXISTS `oc_file_map`;
CREATE TABLE IF NOT EXISTS `oc_file_map` (
  `logic_path` varchar(512) COLLATE utf8_bin NOT NULL DEFAULT '',
  `logic_path_hash` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `physic_path` varchar(512) COLLATE utf8_bin NOT NULL DEFAULT '',
  `physic_path_hash` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`logic_path_hash`),
  UNIQUE KEY `file_map_pp_index` (`physic_path_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_groups`
--

DROP TABLE IF EXISTS `oc_groups`;
CREATE TABLE IF NOT EXISTS `oc_groups` (
  `gid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `oc_groups`
--

INSERT INTO `oc_groups` (`gid`) VALUES
('admin');

-- --------------------------------------------------------

--
-- Table structure for table `oc_group_admin`
--

DROP TABLE IF EXISTS `oc_group_admin`;
CREATE TABLE IF NOT EXISTS `oc_group_admin` (
  `gid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `uid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`),
  KEY `group_admin_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oc_group_user`
--

DROP TABLE IF EXISTS `oc_group_user`;
CREATE TABLE IF NOT EXISTS `oc_group_user` (
  `gid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `uid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `oc_group_user`
--

INSERT INTO `oc_group_user` (`gid`, `uid`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `oc_jobs`
--

DROP TABLE IF EXISTS `oc_jobs`;
CREATE TABLE IF NOT EXISTS `oc_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `argument` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT '',
  `last_run` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `job_class_index` (`class`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_jobs`
--

INSERT INTO `oc_jobs` (`id`, `class`, `argument`, `last_run`) VALUES
(1, 'OC\\Cache\\FileGlobalGC', 'null', 1428341866),
(2, 'OCA\\Activity\\BackgroundJob\\EmailNotification', 'null', 0),
(3, 'OCA\\Activity\\BackgroundJob\\ExpireActivities', 'null', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_locks`
--

DROP TABLE IF EXISTS `oc_locks`;
CREATE TABLE IF NOT EXISTS `oc_locks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `owner` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `timeout` int(10) unsigned DEFAULT NULL,
  `created` bigint(20) DEFAULT NULL,
  `token` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `scope` smallint(6) DEFAULT NULL,
  `depth` smallint(6) DEFAULT NULL,
  `uri` longtext COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_mimetypes`
--

DROP TABLE IF EXISTS `oc_mimetypes`;
CREATE TABLE IF NOT EXISTS `oc_mimetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mimetype` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mimetype_id_index` (`mimetype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

--
-- Dumping data for table `oc_mimetypes`
--

INSERT INTO `oc_mimetypes` (`id`, `mimetype`) VALUES
(3, 'application'),
(5, 'application/pdf'),
(4, 'application/vnd.oasis.opendocument.text'),
(1, 'httpd'),
(2, 'httpd/unix-directory'),
(6, 'image'),
(7, 'image/jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `oc_preferences`
--

DROP TABLE IF EXISTS `oc_preferences`;
CREATE TABLE IF NOT EXISTS `oc_preferences` (
  `userid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `appid` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `configkey` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `configvalue` longtext COLLATE utf8_bin,
  PRIMARY KEY (`userid`,`appid`,`configkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `oc_preferences`
--

INSERT INTO `oc_preferences` (`userid`, `appid`, `configkey`, `configvalue`) VALUES
('admin', 'firstrunwizard', 'show', '0'),
('admin', 'login', 'lastLogin', '1428340067');

-- --------------------------------------------------------

--
-- Table structure for table `oc_privatedata`
--

DROP TABLE IF EXISTS `oc_privatedata`;
CREATE TABLE IF NOT EXISTS `oc_privatedata` (
  `keyid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `app` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `key` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`keyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_properties`
--

DROP TABLE IF EXISTS `oc_properties`;
CREATE TABLE IF NOT EXISTS `oc_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `propertypath` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `propertyname` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `propertyvalue` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `property_index` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_share`
--

DROP TABLE IF EXISTS `oc_share`;
CREATE TABLE IF NOT EXISTS `oc_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `share_type` smallint(6) NOT NULL DEFAULT '0',
  `share_with` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uid_owner` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `parent` int(11) DEFAULT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `item_source` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `item_target` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `file_source` int(11) DEFAULT NULL,
  `file_target` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `permissions` smallint(6) NOT NULL DEFAULT '0',
  `stime` bigint(20) NOT NULL DEFAULT '0',
  `accepted` smallint(6) NOT NULL DEFAULT '0',
  `expiration` datetime DEFAULT NULL,
  `token` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `mail_send` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_share_type_index` (`item_type`,`share_type`),
  KEY `file_source_index` (`file_source`),
  KEY `token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_share_external`
--

DROP TABLE IF EXISTS `oc_share_external`;
CREATE TABLE IF NOT EXISTS `oc_share_external` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remote` varchar(512) COLLATE utf8_bin NOT NULL COMMENT 'Url of the remove owncloud instance',
  `remote_id` int(11) NOT NULL DEFAULT '-1',
  `share_token` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'Public share token',
  `password` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'Optional password for the public share',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'Original name on the remote server',
  `owner` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'User that owns the public share on the remote server',
  `user` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'Local user which added the external share',
  `mountpoint` varchar(4000) COLLATE utf8_bin NOT NULL COMMENT 'Full path where the share is mounted',
  `mountpoint_hash` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'md5 hash of the mountpoint',
  `accepted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sh_external_mp` (`user`,`mountpoint_hash`),
  KEY `sh_external_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_storages`
--

DROP TABLE IF EXISTS `oc_storages`;
CREATE TABLE IF NOT EXISTS `oc_storages` (
  `id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `numeric_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`numeric_id`),
  UNIQUE KEY `storages_id_index` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oc_storages`
--

INSERT INTO `oc_storages` (`id`, `numeric_id`) VALUES
('home::admin', 1),
('local::/mnt/Windows7_OS/wamp/www2/newGryfiPage/owncloud/data/', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_users`
--

DROP TABLE IF EXISTS `oc_users`;
CREATE TABLE IF NOT EXISTS `oc_users` (
  `uid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `displayname` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `oc_users`
--

INSERT INTO `oc_users` (`uid`, `displayname`, `password`) VALUES
('admin', NULL, '1|$2y$10$uhl2rJYVPOq8SelN34tHj.7xiNoYbGZxMWtdFjCJDZ011KYFsksM.');

-- --------------------------------------------------------

--
-- Table structure for table `oc_vcategory`
--

DROP TABLE IF EXISTS `oc_vcategory`;
CREATE TABLE IF NOT EXISTS `oc_vcategory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `category` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid_index` (`uid`),
  KEY `type_index` (`type`),
  KEY `category_index` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_vcategory_to_object`
--

DROP TABLE IF EXISTS `oc_vcategory_to_object`;
CREATE TABLE IF NOT EXISTS `oc_vcategory_to_object` (
  `objid` int(10) unsigned NOT NULL DEFAULT '0',
  `categoryid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryid`,`objid`,`type`),
  KEY `vcategory_objectd_index` (`objid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
