-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 12. Okt 2015 um 22:25
-- Server Version: 5.5.44-MariaDB-1ubuntu0.14.04.1
-- PHP-Version: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `gryfenberg`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `AreaLayoutColumns`
--

DROP TABLE IF EXISTS `AreaLayoutColumns`;
CREATE TABLE `AreaLayoutColumns` (
  `arLayoutColumnID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `arLayoutID` int(10) unsigned NOT NULL DEFAULT '0',
  `arLayoutColumnIndex` int(10) unsigned NOT NULL DEFAULT '0',
  `arID` int(10) unsigned NOT NULL DEFAULT '0',
  `arLayoutColumnDisplayID` int(11) DEFAULT '0',
  PRIMARY KEY (`arLayoutColumnID`),
  KEY `arLayoutID` (`arLayoutID`,`arLayoutColumnIndex`),
  KEY `arID` (`arID`),
  KEY `arLayoutColumnDisplayID` (`arLayoutColumnDisplayID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=43 ;

--
-- Daten für Tabelle `AreaLayoutColumns`
--

INSERT INTO `AreaLayoutColumns` (`arLayoutColumnID`, `arLayoutID`, `arLayoutColumnIndex`, `arID`, `arLayoutColumnDisplayID`) VALUES
(1, 1, 0, 27, 1),
(2, 1, 1, 28, 2),
(3, 2, 0, 31, 3),
(4, 2, 1, 32, 4),
(5, 2, 2, 33, 5),
(6, 3, 0, 34, 6),
(7, 3, 1, 35, 7),
(8, 4, 0, 36, 8),
(9, 4, 1, 37, 9),
(10, 4, 2, 38, 10),
(11, 5, 0, 41, 11),
(12, 5, 1, 42, 12),
(13, 5, 2, 43, 13),
(14, 5, 3, 44, 14),
(15, 6, 0, 45, 15),
(16, 6, 1, 46, 16),
(17, 7, 0, 48, 17),
(18, 7, 1, 49, 18),
(19, 8, 0, 76, 19),
(20, 8, 1, 77, 20),
(21, 9, 0, 78, 21),
(22, 9, 1, 79, 22),
(23, 9, 2, 80, 23),
(24, 10, 0, 81, 24),
(25, 10, 1, 82, 25),
(26, 11, 0, 97, 26),
(27, 11, 1, 98, 27),
(28, 12, 0, 99, 28),
(29, 12, 1, 100, 29),
(30, 12, 2, 101, 30),
(31, 13, 0, 104, 31),
(32, 13, 1, 105, 32),
(33, 14, 0, 106, 33),
(34, 14, 1, 107, 34),
(35, 15, 0, 108, 35),
(36, 15, 1, 109, 36),
(37, 16, 0, 111, 37),
(38, 16, 1, 112, 38),
(39, 16, 2, 113, 39),
(40, 17, 0, 114, 40),
(41, 17, 1, 115, 41),
(42, 18, 0, 159, 42);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `AreaLayoutCustomColumns`
--

DROP TABLE IF EXISTS `AreaLayoutCustomColumns`;
CREATE TABLE `AreaLayoutCustomColumns` (
  `arLayoutColumnID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `arLayoutColumnWidth` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`arLayoutColumnID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `AreaLayoutPresets`
--

DROP TABLE IF EXISTS `AreaLayoutPresets`;
CREATE TABLE `AreaLayoutPresets` (
  `arLayoutPresetID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `arLayoutID` int(10) unsigned NOT NULL DEFAULT '0',
  `arLayoutPresetName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`arLayoutPresetID`),
  KEY `arLayoutID` (`arLayoutID`),
  KEY `arLayoutPresetName` (`arLayoutPresetName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `AreaLayouts`
--

DROP TABLE IF EXISTS `AreaLayouts`;
CREATE TABLE `AreaLayouts` (
  `arLayoutID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `arLayoutSpacing` int(10) unsigned NOT NULL DEFAULT '0',
  `arLayoutIsCustom` tinyint(1) NOT NULL DEFAULT '0',
  `arLayoutMaxColumns` int(10) unsigned NOT NULL DEFAULT '0',
  `arLayoutUsesThemeGridFramework` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`arLayoutID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Daten für Tabelle `AreaLayouts`
--

INSERT INTO `AreaLayouts` (`arLayoutID`, `arLayoutSpacing`, `arLayoutIsCustom`, `arLayoutMaxColumns`, `arLayoutUsesThemeGridFramework`) VALUES
(1, 0, 0, 12, 1),
(2, 0, 0, 12, 1),
(3, 0, 0, 12, 1),
(4, 0, 0, 12, 1),
(5, 0, 0, 12, 1),
(6, 0, 0, 12, 1),
(7, 0, 0, 12, 1),
(8, 0, 0, 12, 1),
(9, 0, 0, 12, 1),
(10, 0, 0, 12, 1),
(11, 0, 0, 12, 1),
(12, 0, 0, 12, 1),
(13, 0, 0, 12, 1),
(14, 0, 0, 12, 1),
(15, 0, 0, 12, 1),
(16, 0, 0, 12, 1),
(17, 0, 0, 12, 1),
(18, 0, 0, 12, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `AreaLayoutThemeGridColumns`
--

DROP TABLE IF EXISTS `AreaLayoutThemeGridColumns`;
CREATE TABLE `AreaLayoutThemeGridColumns` (
  `arLayoutColumnID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `arLayoutColumnSpan` int(10) unsigned DEFAULT '0',
  `arLayoutColumnOffset` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`arLayoutColumnID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=43 ;

--
-- Daten für Tabelle `AreaLayoutThemeGridColumns`
--

INSERT INTO `AreaLayoutThemeGridColumns` (`arLayoutColumnID`, `arLayoutColumnSpan`, `arLayoutColumnOffset`) VALUES
(1, 8, 0),
(2, 3, 1),
(3, 4, 0),
(4, 4, 0),
(5, 4, 0),
(6, 6, 0),
(7, 6, 0),
(8, 2, 0),
(9, 3, 0),
(10, 6, 1),
(11, 3, 0),
(12, 3, 0),
(13, 3, 0),
(14, 3, 0),
(15, 6, 0),
(16, 6, 0),
(17, 5, 0),
(18, 5, 2),
(19, 6, 0),
(20, 6, 0),
(21, 4, 0),
(22, 4, 0),
(23, 4, 0),
(24, 4, 0),
(25, 7, 1),
(26, 7, 0),
(27, 4, 1),
(28, 2, 0),
(29, 4, 0),
(30, 6, 0),
(31, 7, 0),
(32, 5, 0),
(33, 4, 0),
(34, 7, 1),
(35, 4, 0),
(36, 7, 1),
(37, 4, 0),
(38, 4, 0),
(39, 4, 0),
(40, 4, 0),
(41, 8, 0),
(42, 12, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `AreaPermissionAssignments`
--

DROP TABLE IF EXISTS `AreaPermissionAssignments`;
CREATE TABLE `AreaPermissionAssignments` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`arHandle`,`pkID`,`paID`),
  KEY `paID` (`paID`),
  KEY `pkID` (`pkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `AreaPermissionBlockTypeAccessList`
--

DROP TABLE IF EXISTS `AreaPermissionBlockTypeAccessList`;
CREATE TABLE `AreaPermissionBlockTypeAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`),
  KEY `peID` (`peID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `AreaPermissionBlockTypeAccessListCustom`
--

DROP TABLE IF EXISTS `AreaPermissionBlockTypeAccessListCustom`;
CREATE TABLE `AreaPermissionBlockTypeAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `btID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`btID`),
  KEY `peID` (`peID`),
  KEY `btID` (`btID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Areas`
--

DROP TABLE IF EXISTS `Areas`;
CREATE TABLE `Areas` (
  `arID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `arOverrideCollectionPermissions` tinyint(1) NOT NULL DEFAULT '0',
  `arInheritPermissionsFromAreaOnCID` int(10) unsigned NOT NULL DEFAULT '0',
  `arIsGlobal` tinyint(1) NOT NULL DEFAULT '0',
  `arParentID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arID`),
  KEY `arIsGlobal` (`arIsGlobal`),
  KEY `cID` (`cID`),
  KEY `arHandle` (`arHandle`),
  KEY `arParentID` (`arParentID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=395 ;

--
-- Daten für Tabelle `Areas`
--

INSERT INTO `Areas` (`arID`, `cID`, `arHandle`, `arOverrideCollectionPermissions`, `arInheritPermissionsFromAreaOnCID`, `arIsGlobal`, `arParentID`) VALUES
(1, 124, 'Main', 0, 0, 0, 0),
(2, 125, 'Primary', 0, 0, 0, 0),
(3, 125, 'Secondary 1', 0, 0, 0, 0),
(4, 125, 'Secondary 2', 0, 0, 0, 0),
(5, 125, 'Secondary 3', 0, 0, 0, 0),
(6, 125, 'Secondary 4', 0, 0, 0, 0),
(7, 125, 'Secondary 5', 0, 0, 0, 0),
(8, 142, 'Main', 0, 0, 0, 0),
(9, 143, 'Main', 0, 0, 0, 0),
(10, 144, 'Main', 0, 0, 0, 0),
(11, 145, 'Main', 0, 0, 0, 0),
(12, 146, 'Main', 0, 0, 0, 0),
(13, 147, 'Main', 0, 0, 0, 0),
(14, 148, 'Main', 0, 0, 0, 0),
(15, 149, 'Main', 0, 0, 0, 0),
(16, 167, 'Main', 0, 0, 0, 0),
(17, 167, 'Sidebar', 0, 0, 0, 0),
(18, 167, 'Page Footer', 0, 0, 0, 0),
(19, 174, 'Page Header', 0, 0, 0, 0),
(20, 174, 'Sidebar', 0, 0, 0, 0),
(21, 174, 'Main', 0, 0, 0, 0),
(22, 160, 'Page Header', 0, 0, 0, 0),
(23, 160, 'Sidebar', 0, 0, 0, 0),
(24, 160, 'Main', 0, 0, 0, 0),
(25, 160, 'Page Footer', 0, 0, 0, 0),
(26, 155, 'Main', 0, 0, 0, 0),
(27, 155, 'Main : 1', 0, 0, 0, 26),
(28, 155, 'Main : 2', 0, 0, 0, 26),
(29, 152, 'Main', 0, 0, 0, 0),
(30, 1, 'Main', 0, 0, 0, 0),
(31, 1, 'Main : 3', 0, 0, 0, 30),
(32, 1, 'Main : 4', 0, 0, 0, 30),
(33, 1, 'Main : 5', 0, 0, 0, 30),
(34, 1, 'Main : 6', 0, 0, 0, 30),
(35, 1, 'Main : 7', 0, 0, 0, 30),
(36, 1, 'Main : 8', 0, 0, 0, 30),
(37, 1, 'Main : 9', 0, 0, 0, 30),
(38, 1, 'Main : 10', 0, 0, 0, 30),
(39, 1, 'Page Footer', 0, 0, 0, 0),
(40, 151, 'Main', 0, 0, 0, 0),
(41, 151, 'Main : 11', 0, 0, 0, 40),
(42, 151, 'Main : 12', 0, 0, 0, 40),
(43, 151, 'Main : 13', 0, 0, 0, 40),
(44, 151, 'Main : 14', 0, 0, 0, 40),
(45, 151, 'Main : 15', 0, 0, 0, 40),
(46, 151, 'Main : 16', 0, 0, 0, 40),
(47, 151, 'Page Footer', 0, 0, 0, 0),
(48, 151, 'Page Footer : 17', 0, 0, 0, 47),
(49, 151, 'Page Footer : 18', 0, 0, 0, 47),
(50, 153, 'Main', 0, 0, 0, 0),
(51, 161, 'Page Header', 0, 0, 0, 0),
(52, 161, 'Main', 0, 0, 0, 0),
(53, 161, 'Sidebar', 0, 0, 0, 0),
(54, 161, 'Page Footer', 0, 0, 0, 0),
(55, 162, 'Page Header', 0, 0, 0, 0),
(56, 162, 'Main', 0, 0, 0, 0),
(57, 162, 'Sidebar', 0, 0, 0, 0),
(58, 162, 'Page Footer', 0, 0, 0, 0),
(59, 163, 'Page Header', 0, 0, 0, 0),
(60, 163, 'Main', 0, 0, 0, 0),
(61, 163, 'Sidebar', 0, 0, 0, 0),
(62, 163, 'Page Footer', 0, 0, 0, 0),
(63, 164, 'Page Header', 0, 0, 0, 0),
(64, 164, 'Main', 0, 0, 0, 0),
(65, 164, 'Sidebar', 0, 0, 0, 0),
(66, 164, 'Page Footer', 0, 0, 0, 0),
(67, 165, 'Page Header', 0, 0, 0, 0),
(68, 165, 'Main', 0, 0, 0, 0),
(69, 165, 'Sidebar', 0, 0, 0, 0),
(70, 165, 'Page Footer', 0, 0, 0, 0),
(71, 166, 'Page Header', 0, 0, 0, 0),
(72, 166, 'Main', 0, 0, 0, 0),
(73, 166, 'Sidebar', 0, 0, 0, 0),
(74, 166, 'Page Footer', 0, 0, 0, 0),
(75, 154, 'Main', 0, 0, 0, 0),
(76, 154, 'Main : 19', 0, 0, 0, 75),
(77, 154, 'Main : 20', 0, 0, 0, 75),
(78, 154, 'Main : 21', 0, 0, 0, 75),
(79, 154, 'Main : 22', 0, 0, 0, 75),
(80, 154, 'Main : 23', 0, 0, 0, 75),
(81, 154, 'Main : 24', 0, 0, 0, 75),
(82, 154, 'Main : 25', 0, 0, 0, 75),
(83, 156, 'Main', 0, 0, 0, 0),
(84, 156, 'Main : 1', 0, 0, 0, 0),
(85, 156, 'Main : 2', 0, 0, 0, 0),
(86, 168, 'Page Footer', 0, 0, 0, 0),
(87, 168, 'Main', 0, 0, 0, 0),
(88, 168, 'Sidebar', 0, 0, 0, 0),
(89, 169, 'Page Footer', 0, 0, 0, 0),
(90, 169, 'Main', 0, 0, 0, 0),
(91, 169, 'Sidebar', 0, 0, 0, 0),
(92, 170, 'Page Footer', 0, 0, 0, 0),
(93, 170, 'Main', 0, 0, 0, 0),
(94, 170, 'Sidebar', 0, 0, 0, 0),
(95, 157, 'Main', 0, 0, 0, 0),
(96, 158, 'Main', 0, 0, 0, 0),
(97, 158, 'Main : 26', 0, 0, 0, 96),
(98, 158, 'Main : 27', 0, 0, 0, 96),
(99, 158, 'Main : 28', 0, 0, 0, 96),
(100, 158, 'Main : 29', 0, 0, 0, 96),
(101, 158, 'Main : 30', 0, 0, 0, 96),
(102, 159, 'Main', 0, 0, 0, 0),
(103, 171, 'Main', 0, 0, 0, 0),
(104, 171, 'Main : 31', 0, 0, 0, 103),
(105, 171, 'Main : 32', 0, 0, 0, 103),
(106, 171, 'Main : 33', 0, 0, 0, 103),
(107, 171, 'Main : 34', 0, 0, 0, 103),
(108, 171, 'Main : 35', 0, 0, 0, 103),
(109, 171, 'Main : 36', 0, 0, 0, 103),
(110, 172, 'Main', 0, 0, 0, 0),
(111, 172, 'Main : 37', 0, 0, 0, 110),
(112, 172, 'Main : 38', 0, 0, 0, 110),
(113, 172, 'Main : 39', 0, 0, 0, 110),
(114, 172, 'Main : 40', 0, 0, 0, 110),
(115, 172, 'Main : 41', 0, 0, 0, 110),
(116, 175, 'Main', 0, 0, 0, 0),
(117, 175, 'Page Header', 0, 0, 0, 0),
(118, 175, 'Sidebar', 0, 0, 0, 0),
(119, 176, 'Main', 0, 0, 0, 0),
(120, 176, 'Page Header', 0, 0, 0, 0),
(121, 176, 'Sidebar', 0, 0, 0, 0),
(122, 173, 'Main', 0, 0, 0, 0),
(123, 1, 'Header Site Title', 0, 0, 1, 0),
(124, 1, 'Header Navigation', 0, 0, 1, 0),
(125, 1, 'Header Search', 0, 0, 1, 0),
(126, 1, 'Footer Site Title', 0, 0, 1, 0),
(127, 1, 'Footer Social', 0, 0, 1, 0),
(128, 1, 'Footer Legal', 0, 0, 1, 0),
(129, 1, 'Footer Navigation', 0, 0, 1, 0),
(130, 1, 'Footer Contact', 0, 0, 1, 0),
(131, 180, 'Main', 0, 0, 0, 0),
(132, 180, 'Main : 4', 0, 0, 0, 0),
(133, 180, 'Main : 5', 0, 0, 0, 0),
(134, 180, 'Main : 6', 0, 0, 0, 0),
(135, 180, 'Main : 7', 0, 0, 0, 0),
(136, 180, 'Main : 8', 0, 0, 0, 0),
(137, 180, 'Main : 9', 0, 0, 0, 0),
(138, 180, 'Main : 10', 0, 0, 0, 0),
(139, 180, 'Page Footer', 0, 0, 0, 0),
(140, 180, 'Main : 3', 0, 0, 0, 0),
(141, 180, 'Header Site Title', 0, 0, 1, 0),
(142, 180, 'Header Navigation', 0, 0, 1, 0),
(143, 180, 'Header Search', 0, 0, 1, 0),
(144, 180, 'Footer Site Title', 0, 0, 1, 0),
(145, 180, 'Footer Social', 0, 0, 1, 0),
(146, 180, 'Footer Legal', 0, 0, 1, 0),
(147, 180, 'Footer Navigation', 0, 0, 1, 0),
(148, 180, 'Footer Contact', 0, 0, 1, 0),
(149, 181, 'Header Site Title', 0, 0, 1, 0),
(150, 181, 'Header Navigation', 0, 0, 1, 0),
(151, 181, 'Header Search', 0, 0, 1, 0),
(152, 181, 'Main', 0, 0, 0, 0),
(153, 181, 'Page Footer', 0, 0, 0, 0),
(154, 181, 'Footer Site Title', 0, 0, 1, 0),
(155, 181, 'Footer Social', 0, 0, 1, 0),
(156, 181, 'Footer Legal', 0, 0, 1, 0),
(157, 181, 'Footer Navigation', 0, 0, 1, 0),
(158, 181, 'Footer Contact', 0, 0, 1, 0),
(159, 181, 'Main : 42', 0, 0, 0, 152),
(160, 139, 'Header Site Title', 0, 0, 1, 0),
(161, 139, 'Header Navigation', 0, 0, 1, 0),
(162, 139, 'Header Search', 0, 0, 1, 0),
(163, 139, 'Footer Site Title', 0, 0, 1, 0),
(164, 139, 'Footer Social', 0, 0, 1, 0),
(165, 139, 'Footer Legal', 0, 0, 1, 0),
(166, 139, 'Footer Navigation', 0, 0, 1, 0),
(167, 139, 'Footer Contact', 0, 0, 1, 0),
(168, 200, 'Main', 0, 0, 0, 0),
(169, 187, 'Header Site Title', 0, 0, 1, 0),
(170, 187, 'Header Navigation', 0, 0, 1, 0),
(171, 187, 'Header Search', 0, 0, 1, 0),
(172, 187, 'Main', 0, 0, 0, 0),
(173, 187, 'Page Footer', 0, 0, 0, 0),
(174, 187, 'Footer Site Title', 0, 0, 1, 0),
(175, 187, 'Footer Social', 0, 0, 1, 0),
(176, 187, 'Footer Legal', 0, 0, 1, 0),
(177, 187, 'Footer Navigation', 0, 0, 1, 0),
(178, 187, 'Footer Contact', 0, 0, 1, 0),
(179, 182, 'Header Site Title', 0, 0, 1, 0),
(180, 182, 'Header Navigation', 0, 0, 1, 0),
(181, 182, 'Header Search', 0, 0, 1, 0),
(182, 182, 'Main', 0, 0, 0, 0),
(183, 182, 'Page Footer', 0, 0, 0, 0),
(184, 182, 'Footer Site Title', 0, 0, 1, 0),
(185, 182, 'Footer Social', 0, 0, 1, 0),
(186, 182, 'Footer Legal', 0, 0, 1, 0),
(187, 182, 'Footer Navigation', 0, 0, 1, 0),
(188, 182, 'Footer Contact', 0, 0, 1, 0),
(189, 190, 'Header Site Title', 0, 0, 1, 0),
(190, 190, 'Header Navigation', 0, 0, 1, 0),
(191, 190, 'Header Search', 0, 0, 1, 0),
(192, 190, 'Main', 0, 0, 0, 0),
(193, 190, 'Page Footer', 0, 0, 0, 0),
(194, 190, 'Footer Site Title', 0, 0, 1, 0),
(195, 190, 'Footer Social', 0, 0, 1, 0),
(196, 190, 'Footer Legal', 0, 0, 1, 0),
(197, 190, 'Footer Navigation', 0, 0, 1, 0),
(198, 190, 'Footer Contact', 0, 0, 1, 0),
(199, 183, 'Header Site Title', 0, 0, 1, 0),
(200, 183, 'Header Navigation', 0, 0, 1, 0),
(201, 183, 'Header Search', 0, 0, 1, 0),
(202, 183, 'Main', 0, 0, 0, 0),
(203, 183, 'Page Footer', 0, 0, 0, 0),
(204, 183, 'Footer Site Title', 0, 0, 1, 0),
(205, 183, 'Footer Social', 0, 0, 1, 0),
(206, 183, 'Footer Legal', 0, 0, 1, 0),
(207, 183, 'Footer Navigation', 0, 0, 1, 0),
(208, 183, 'Footer Contact', 0, 0, 1, 0),
(209, 141, 'Header Site Title', 0, 0, 1, 0),
(210, 141, 'Header Navigation', 0, 0, 1, 0),
(211, 141, 'Header Search', 0, 0, 1, 0),
(212, 141, 'Footer Site Title', 0, 0, 1, 0),
(213, 141, 'Footer Social', 0, 0, 1, 0),
(214, 141, 'Footer Legal', 0, 0, 1, 0),
(215, 141, 'Footer Navigation', 0, 0, 1, 0),
(216, 141, 'Footer Contact', 0, 0, 1, 0),
(217, 186, 'Header Site Title', 0, 0, 1, 0),
(218, 186, 'Header Navigation', 0, 0, 1, 0),
(219, 186, 'Header Search', 0, 0, 1, 0),
(220, 186, 'Main', 0, 0, 0, 0),
(221, 186, 'Page Footer', 0, 0, 0, 0),
(222, 186, 'Footer Site Title', 0, 0, 1, 0),
(223, 186, 'Footer Social', 0, 0, 1, 0),
(224, 186, 'Footer Legal', 0, 0, 1, 0),
(225, 186, 'Footer Navigation', 0, 0, 1, 0),
(226, 186, 'Footer Contact', 0, 0, 1, 0),
(227, 188, 'Header Site Title', 0, 0, 1, 0),
(228, 188, 'Header Navigation', 0, 0, 1, 0),
(229, 188, 'Header Search', 0, 0, 1, 0),
(230, 188, 'Main', 0, 0, 0, 0),
(231, 188, 'Page Footer', 0, 0, 0, 0),
(232, 188, 'Footer Site Title', 0, 0, 1, 0),
(233, 188, 'Footer Social', 0, 0, 1, 0),
(234, 188, 'Footer Legal', 0, 0, 1, 0),
(235, 188, 'Footer Navigation', 0, 0, 1, 0),
(236, 188, 'Footer Contact', 0, 0, 1, 0),
(237, 189, 'Header Site Title', 0, 0, 1, 0),
(238, 189, 'Header Navigation', 0, 0, 1, 0),
(239, 189, 'Header Search', 0, 0, 1, 0),
(240, 189, 'Main', 0, 0, 0, 0),
(241, 189, 'Page Footer', 0, 0, 0, 0),
(242, 189, 'Footer Site Title', 0, 0, 1, 0),
(243, 189, 'Footer Social', 0, 0, 1, 0),
(244, 189, 'Footer Legal', 0, 0, 1, 0),
(245, 189, 'Footer Navigation', 0, 0, 1, 0),
(246, 189, 'Footer Contact', 0, 0, 1, 0),
(247, 185, 'Header Site Title', 0, 0, 1, 0),
(248, 185, 'Header Navigation', 0, 0, 1, 0),
(249, 185, 'Header Search', 0, 0, 1, 0),
(250, 185, 'Main', 0, 0, 0, 0),
(251, 185, 'Page Footer', 0, 0, 0, 0),
(252, 185, 'Footer Site Title', 0, 0, 1, 0),
(253, 185, 'Footer Social', 0, 0, 1, 0),
(254, 185, 'Footer Legal', 0, 0, 1, 0),
(255, 185, 'Footer Navigation', 0, 0, 1, 0),
(256, 185, 'Footer Contact', 0, 0, 1, 0),
(257, 184, 'Header Site Title', 0, 0, 1, 0),
(258, 184, 'Header Navigation', 0, 0, 1, 0),
(259, 184, 'Header Search', 0, 0, 1, 0),
(260, 184, 'Main', 0, 0, 0, 0),
(261, 184, 'Page Footer', 0, 0, 0, 0),
(262, 184, 'Footer Site Title', 0, 0, 1, 0),
(263, 184, 'Footer Social', 0, 0, 1, 0),
(264, 184, 'Footer Legal', 0, 0, 1, 0),
(265, 184, 'Footer Navigation', 0, 0, 1, 0),
(266, 184, 'Footer Contact', 0, 0, 1, 0),
(267, 201, 'Main', 0, 0, 0, 0),
(276, 201, 'Header Site Title', 0, 0, 1, 0),
(277, 201, 'Header Navigation', 0, 0, 1, 0),
(278, 201, 'Header Search', 0, 0, 1, 0),
(279, 201, 'Page Footer', 0, 0, 0, 0),
(280, 201, 'Footer Site Title', 0, 0, 1, 0),
(281, 201, 'Footer Social', 0, 0, 1, 0),
(282, 201, 'Footer Legal', 0, 0, 1, 0),
(283, 201, 'Footer Navigation', 0, 0, 1, 0),
(284, 201, 'Footer Contact', 0, 0, 1, 0),
(301, 205, 'Header Site Title', 0, 0, 1, 0),
(302, 205, 'Header Navigation', 0, 0, 1, 0),
(303, 205, 'Header Search', 0, 0, 1, 0),
(304, 205, 'Main', 0, 0, 0, 0),
(305, 205, 'Page Footer', 0, 0, 0, 0),
(306, 205, 'Footer Site Title', 0, 0, 1, 0),
(307, 205, 'Footer Social', 0, 0, 1, 0),
(308, 205, 'Footer Legal', 0, 0, 1, 0),
(309, 205, 'Footer Navigation', 0, 0, 1, 0),
(310, 205, 'Footer Contact', 0, 0, 1, 0),
(323, 202, 'Main', 0, 0, 0, 0),
(324, 203, 'Main', 0, 0, 0, 0),
(325, 204, 'Main', 0, 0, 0, 0),
(326, 157, 'Header Site Title', 0, 0, 1, 0),
(327, 157, 'Header Navigation', 0, 0, 1, 0),
(328, 157, 'Header Search', 0, 0, 1, 0),
(329, 157, 'Page Footer', 0, 0, 0, 0),
(330, 157, 'Footer Site Title', 0, 0, 1, 0),
(331, 157, 'Footer Social', 0, 0, 1, 0),
(332, 157, 'Footer Legal', 0, 0, 1, 0),
(333, 157, 'Footer Navigation', 0, 0, 1, 0),
(334, 157, 'Footer Contact', 0, 0, 1, 0),
(335, 208, 'Header Site Title', 0, 0, 1, 0),
(336, 208, 'Header Navigation', 0, 0, 1, 0),
(337, 208, 'Header Search', 0, 0, 1, 0),
(338, 208, 'Main', 0, 0, 0, 0),
(339, 208, 'Page Footer', 0, 0, 0, 0),
(340, 208, 'Footer Site Title', 0, 0, 1, 0),
(341, 208, 'Footer Social', 0, 0, 1, 0),
(342, 208, 'Footer Legal', 0, 0, 1, 0),
(343, 208, 'Footer Navigation', 0, 0, 1, 0),
(344, 208, 'Footer Contact', 0, 0, 1, 0),
(345, 209, 'Header Site Title', 0, 0, 1, 0),
(346, 209, 'Header Navigation', 0, 0, 1, 0),
(347, 209, 'Header Search', 0, 0, 1, 0),
(348, 209, 'Main', 0, 0, 0, 0),
(349, 209, 'Page Footer', 0, 0, 0, 0),
(350, 209, 'Footer Site Title', 0, 0, 1, 0),
(351, 209, 'Footer Social', 0, 0, 1, 0),
(352, 209, 'Footer Legal', 0, 0, 1, 0),
(353, 209, 'Footer Navigation', 0, 0, 1, 0),
(354, 209, 'Footer Contact', 0, 0, 1, 0),
(355, 211, 'Header Site Title', 0, 0, 1, 0),
(356, 211, 'Header Navigation', 0, 0, 1, 0),
(357, 211, 'Header Search', 0, 0, 1, 0),
(358, 211, 'Main', 0, 0, 0, 0),
(359, 211, 'Page Footer', 0, 0, 0, 0),
(360, 211, 'Footer Site Title', 0, 0, 1, 0),
(361, 211, 'Footer Social', 0, 0, 1, 0),
(362, 211, 'Footer Legal', 0, 0, 1, 0),
(363, 211, 'Footer Navigation', 0, 0, 1, 0),
(364, 211, 'Footer Contact', 0, 0, 1, 0),
(365, 210, 'Header Site Title', 0, 0, 1, 0),
(366, 210, 'Header Navigation', 0, 0, 1, 0),
(367, 210, 'Header Search', 0, 0, 1, 0),
(368, 210, 'Main', 0, 0, 0, 0),
(369, 210, 'Page Footer', 0, 0, 0, 0),
(370, 210, 'Footer Site Title', 0, 0, 1, 0),
(371, 210, 'Footer Social', 0, 0, 1, 0),
(372, 210, 'Footer Legal', 0, 0, 1, 0),
(373, 210, 'Footer Navigation', 0, 0, 1, 0),
(374, 210, 'Footer Contact', 0, 0, 1, 0),
(375, 212, 'Header Site Title', 0, 0, 1, 0),
(376, 212, 'Header Navigation', 0, 0, 1, 0),
(377, 212, 'Header Search', 0, 0, 1, 0),
(378, 212, 'Main', 0, 0, 0, 0),
(379, 212, 'Page Footer', 0, 0, 0, 0),
(380, 212, 'Footer Site Title', 0, 0, 1, 0),
(381, 212, 'Footer Social', 0, 0, 1, 0),
(382, 212, 'Footer Legal', 0, 0, 1, 0),
(383, 212, 'Footer Navigation', 0, 0, 1, 0),
(384, 212, 'Footer Contact', 0, 0, 1, 0),
(385, 213, 'Header Site Title', 0, 0, 1, 0),
(386, 213, 'Header Navigation', 0, 0, 1, 0),
(387, 213, 'Header Search', 0, 0, 1, 0),
(388, 213, 'Main', 0, 0, 0, 0),
(389, 213, 'Page Footer', 0, 0, 0, 0),
(390, 213, 'Footer Site Title', 0, 0, 1, 0),
(391, 213, 'Footer Social', 0, 0, 1, 0),
(392, 213, 'Footer Legal', 0, 0, 1, 0),
(393, 213, 'Footer Navigation', 0, 0, 1, 0),
(394, 213, 'Footer Contact', 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `atAddress`
--

DROP TABLE IF EXISTS `atAddress`;
CREATE TABLE `atAddress` (
  `avID` int(10) unsigned NOT NULL DEFAULT '0',
  `address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`avID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `atAddressCustomCountries`
--

DROP TABLE IF EXISTS `atAddressCustomCountries`;
CREATE TABLE `atAddressCustomCountries` (
  `atAddressCustomCountryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `country` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`atAddressCustomCountryID`),
  KEY `akID` (`akID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `atAddressSettings`
--

DROP TABLE IF EXISTS `atAddressSettings`;
CREATE TABLE `atAddressSettings` (
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `akHasCustomCountries` tinyint(1) NOT NULL DEFAULT '0',
  `akDefaultCountry` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`akID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `atAddressSettings`
--

INSERT INTO `atAddressSettings` (`akID`, `akHasCustomCountries`, `akDefaultCountry`) VALUES
(29, 0, NULL),
(33, 0, NULL),
(36, 0, NULL),
(40, 0, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `atBoolean`
--

DROP TABLE IF EXISTS `atBoolean`;
CREATE TABLE `atBoolean` (
  `avID` int(10) unsigned NOT NULL,
  `value` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`avID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `atBoolean`
--

INSERT INTO `atBoolean` (`avID`, `value`) VALUES
(9, 1),
(16, 1),
(18, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(42, 1),
(43, 1),
(47, 1),
(51, 1),
(98, 1),
(105, 1),
(106, 1),
(107, 1),
(144, 1),
(145, 1),
(146, 1),
(157, 1),
(163, 1),
(179, 1),
(184, 0),
(194, 1),
(196, 0),
(197, 1),
(202, 0),
(209, 0),
(212, 1),
(213, 1),
(214, 0),
(215, 0),
(216, 1),
(217, 0),
(218, 0),
(219, 1),
(220, 0),
(221, 1),
(222, 0),
(223, 1),
(224, 1),
(225, 1),
(226, 1),
(227, 1),
(228, 0),
(229, 1),
(230, 1),
(231, 1),
(232, 1),
(233, 1),
(234, 1),
(265, 0),
(266, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `atBooleanSettings`
--

DROP TABLE IF EXISTS `atBooleanSettings`;
CREATE TABLE `atBooleanSettings` (
  `akID` int(10) unsigned NOT NULL,
  `akCheckedByDefault` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`akID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `atBooleanSettings`
--

INSERT INTO `atBooleanSettings` (`akID`, `akCheckedByDefault`) VALUES
(5, 0),
(6, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 1),
(13, 1),
(20, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `atDateTime`
--

DROP TABLE IF EXISTS `atDateTime`;
CREATE TABLE `atDateTime` (
  `avID` int(10) unsigned NOT NULL,
  `value` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`avID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `atDateTimeSettings`
--

DROP TABLE IF EXISTS `atDateTimeSettings`;
CREATE TABLE `atDateTimeSettings` (
  `akID` int(10) unsigned NOT NULL,
  `akDateDisplayMode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`akID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `atDefault`
--

DROP TABLE IF EXISTS `atDefault`;
CREATE TABLE `atDefault` (
  `avID` int(10) unsigned NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`avID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `atDefault`
--

INSERT INTO `atDefault` (`avID`, `value`) VALUES
(1, 'fa fa-th-large'),
(2, 'pages, add page, delete page, copy, move, alias'),
(3, 'pages, add page, delete page, copy, move, alias'),
(4, 'pages, add page, delete page, copy, move, alias, bulk'),
(5, 'find page, search page, search, find, pages, sitemap'),
(6, 'add file, delete file, copy, move, alias, resize, crop, rename, images, title, attribute'),
(7, 'file, file attributes, title, attribute, description, rename'),
(8, 'files, category, categories'),
(10, 'new file set'),
(11, 'users, groups, people, find, delete user, remove user, change password, password'),
(12, 'find, search, people, delete user, remove user, change password, password'),
(13, 'user, group, people, permissions, expire, badges'),
(14, 'user attributes, user data, gather data, registration data'),
(15, 'new user, create'),
(17, 'new user group, new group, group, create'),
(19, 'group set'),
(20, 'community, points, karma'),
(21, 'action, community actions'),
(22, 'forms, log, error, email, mysql, exception, survey'),
(23, 'forms, questions, response, data'),
(24, 'questions, quiz, response'),
(25, 'forms, log, error, email, mysql, exception, survey, history'),
(26, 'new theme, theme, active theme, change theme, template, css'),
(27, 'page types'),
(36, 'page attributes, custom'),
(37, 'single, page, custom, application'),
(38, 'atom, rss, feed, syndication'),
(39, 'icon-bullhorn'),
(40, 'add workflow, remove workflow'),
(41, 'stacks, reusable content, scrapbook, copy, paste, paste block, copy block, site name, logo'),
(44, 'edit stacks, view stacks, all stacks'),
(45, 'block, refresh, custom'),
(46, 'add-on, addon, add on, package, app, ecommerce, discussions, forums, themes, templates, blocks'),
(48, 'add-on, addon, ecommerce, install, discussions, forums, themes, templates, blocks'),
(49, 'update, upgrade'),
(50, 'concrete5.org, my account, marketplace'),
(52, 'buy theme, new theme, marketplace, template'),
(53, 'buy addon, buy add on, buy add-on, purchase addon, purchase add on, purchase add-on, find addon, new addon, marketplace'),
(54, 'dashboard, configuration'),
(55, 'website name, title'),
(56, 'accessibility, easy mode'),
(57, 'sharing, facebook, twitter'),
(58, 'logo, favicon, iphone, icon, bookmark'),
(59, 'tinymce, content block, fonts, editor, content, overlay'),
(60, 'translate, translation, internationalization, multilingual'),
(61, 'timezone, profile, locale'),
(62, 'multilingual, localization, internationalization, i18n'),
(63, 'vanity, pretty url, seo, pageview, view'),
(64, 'bulk, seo, change keywords, engine, optimization, search'),
(65, 'traffic, statistics, google analytics, quant, pageviews, hits'),
(66, 'pretty, slug'),
(67, 'configure search, site search, search option'),
(68, 'file options, file manager, upload, modify'),
(69, 'security, files, media, extension, manager, upload'),
(70, 'images, picture, responsive, retina'),
(71, 'security, alternate storage, hide files'),
(72, 'cache option, change cache, override, turn on cache, turn off cache, no cache, page cache, caching'),
(73, 'cache option, turn off cache, no cache, page cache, caching'),
(74, 'index search, reindex search, build sitemap, sitemap.xml, clear old versions, page versions, remove old'),
(75, 'queries, database, mysql'),
(76, 'editors, hide site, offline, private, public, access'),
(77, 'security, actions, administrator, admin, package, marketplace, search'),
(78, 'security, lock ip, lock out, block ip, address, restrict, access'),
(79, 'security, registration'),
(80, 'antispam, block spam, security'),
(81, 'lock site, under construction, hide, hidden'),
(82, 'profile, login, redirect, specific, dashboard, administrators'),
(83, 'member profile, member page, community, forums, social, avatar'),
(84, 'signup, new user, community, public registration, public, registration'),
(85, 'auth, authentication, types, oauth, facebook, login, registration'),
(86, 'smtp, mail settings'),
(87, 'email server, mail settings, mail configuration, external, internal'),
(88, 'test smtp, test mail'),
(89, 'email server, mail settings, mail configuration, private message, message system, import, email, message'),
(90, 'conversations'),
(91, 'conversations'),
(92, 'conversations ratings, ratings, community, community points'),
(93, 'conversations bad words, banned words, banned, bad words, bad, words, list'),
(94, 'attribute configuration'),
(95, 'attributes, sets'),
(96, 'attributes, types'),
(97, 'topics, tags, taxonomy'),
(99, 'overrides, system info, debug, support, help'),
(100, 'errors, exceptions, develop, support, help'),
(101, 'email, logging, logs, smtp, pop, errors, mysql, log'),
(102, 'network, proxy server'),
(103, 'export, backup, database, sql, mysql, encryption, restore'),
(104, 'upgrade, new version, update'),
(108, 'fa fa-edit'),
(109, 'fa fa-trash-o'),
(110, 'fa fa-th'),
(111, 'fa fa-briefcase'),
(149, 'Test Client'),
(154, 'Test Client'),
(160, 'Test Client 2'),
(166, 'Test Client 2'),
(171, 'Test Client 2'),
(176, 'Test Client 2'),
(180, NULL),
(181, NULL),
(182, NULL),
(183, NULL),
(191, NULL),
(192, NULL),
(193, NULL),
(195, NULL),
(198, NULL),
(199, NULL),
(200, NULL),
(201, NULL),
(204, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla massa lacus, vehicula eu interdum convallis, laoreet id lectus. Nunc turpis elit, aliquam sit amet aliquam tincidunt, dapibus vel tellus. '),
(205, NULL),
(206, NULL),
(207, NULL),
(208, NULL),
(211, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla massa lacus, vehicula eu interdum convallis, laoreet id lectus. Nunc turpis elit, aliquam sit amet aliquam tincidunt, dapibus vel tellus. '),
(263, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `atFile`
--

DROP TABLE IF EXISTS `atFile`;
CREATE TABLE `atFile` (
  `avID` int(10) unsigned NOT NULL,
  `fID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`avID`),
  KEY `fID` (`fID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `atFile`
--

INSERT INTO `atFile` (`avID`, `fID`) VALUES
(185, 2),
(147, 6),
(187, 7),
(152, 8),
(174, 10),
(189, 11),
(169, 12),
(164, 15),
(158, 16);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `atNumber`
--

DROP TABLE IF EXISTS `atNumber`;
CREATE TABLE `atNumber` (
  `avID` int(10) unsigned NOT NULL,
  `value` decimal(14,4) DEFAULT '0.0000',
  PRIMARY KEY (`avID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `atNumber`
--

INSERT INTO `atNumber` (`avID`, `value`) VALUES
(112, 200.0000),
(113, 200.0000),
(114, 500.0000),
(115, 500.0000),
(116, 460.0000),
(117, 460.0000),
(118, 592.0000),
(119, 397.0000),
(120, 250.0000),
(121, 252.0000),
(122, 1600.0000),
(123, 1067.0000),
(124, 200.0000),
(125, 200.0000),
(126, 1499.0000),
(127, 1067.0000),
(128, 1100.0000),
(129, 263.0000),
(130, 1600.0000),
(131, 1067.0000),
(132, 1600.0000),
(133, 1066.0000),
(134, 1600.0000),
(135, 1067.0000),
(136, 1100.0000),
(137, 368.0000),
(138, 1100.0000),
(139, 368.0000),
(140, 1600.0000),
(141, 1067.0000),
(142, 1600.0000),
(143, 953.0000);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `atSelectedTopics`
--

DROP TABLE IF EXISTS `atSelectedTopics`;
CREATE TABLE `atSelectedTopics` (
  `avID` int(10) unsigned NOT NULL,
  `TopicNodeID` int(11) NOT NULL,
  PRIMARY KEY (`avID`,`TopicNodeID`),
  KEY `TopicNodeID` (`TopicNodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `atSelectedTopics`
--

INSERT INTO `atSelectedTopics` (`avID`, `TopicNodeID`) VALUES
(148, 16),
(153, 18),
(159, 16),
(165, 16),
(170, 16),
(175, 16),
(186, 11),
(188, 13),
(190, 11);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `atSelectOptions`
--

DROP TABLE IF EXISTS `atSelectOptions`;
CREATE TABLE `atSelectOptions` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akID` int(10) unsigned DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayOrder` int(10) unsigned DEFAULT NULL,
  `isEndUserAdded` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `akID` (`akID`,`displayOrder`),
  KEY `value` (`value`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

--
-- Daten für Tabelle `atSelectOptions`
--

INSERT INTO `atSelectOptions` (`ID`, `akID`, `value`, `displayOrder`, `isEndUserAdded`) VALUES
(1, 18, 'Finance', 0, 0),
(2, 18, 'Marketing and Sales', 1, 0),
(3, 18, 'Human Resources', 2, 0),
(4, 18, 'Technical and Operations', 3, 0),
(5, 18, 'Management', 4, 0),
(6, 25, 'Architecture', 0, 0),
(7, 25, 'Multimedia', 1, 0),
(8, 25, 'Design', 2, 0),
(9, 25, 'Production', 3, 0),
(10, 25, 'Development', 4, 0),
(11, 25, 'Quality Assurance', 5, 0),
(12, 26, 'HTML', 0, 0),
(13, 26, 'JavaScript', 1, 0),
(14, 26, 'PHP', 2, 0),
(15, 26, 'Database', 3, 0),
(16, 26, 'CSS', 4, 0),
(17, 26, 'Ruby', 5, 0),
(18, 26, 'Java', 6, 0),
(19, 26, 'iOS/Android/App Development', 7, 0),
(20, 26, 'Photoshop', 8, 0),
(21, 26, 'Python', 9, 0),
(22, 26, 'Writing', 10, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `atSelectOptionsSelected`
--

DROP TABLE IF EXISTS `atSelectOptionsSelected`;
CREATE TABLE `atSelectOptionsSelected` (
  `avID` int(10) unsigned NOT NULL,
  `atSelectOptionID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`avID`,`atSelectOptionID`),
  KEY `atSelectOptionID` (`atSelectOptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `atSelectOptionsSelected`
--

INSERT INTO `atSelectOptionsSelected` (`avID`, `atSelectOptionID`) VALUES
(150, 6),
(150, 8),
(150, 9),
(151, 12),
(151, 13),
(151, 14),
(155, 6),
(156, 14),
(161, 7),
(161, 9),
(161, 10),
(162, 12),
(162, 13),
(162, 14),
(162, 16),
(167, 8),
(168, 20),
(172, 8),
(173, 20),
(177, 8),
(178, 20),
(203, 4),
(210, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `atSelectSettings`
--

DROP TABLE IF EXISTS `atSelectSettings`;
CREATE TABLE `atSelectSettings` (
  `akID` int(10) unsigned NOT NULL,
  `akSelectAllowMultipleValues` tinyint(1) NOT NULL DEFAULT '0',
  `akSelectOptionDisplayOrder` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'display_asc',
  `akSelectAllowOtherValues` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`akID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `atSelectSettings`
--

INSERT INTO `atSelectSettings` (`akID`, `akSelectAllowMultipleValues`, `akSelectOptionDisplayOrder`, `akSelectAllowOtherValues`) VALUES
(8, 1, 'display_asc', 1),
(18, 0, 'display_asc', 0),
(25, 1, 'display_asc', 0),
(26, 1, 'display_asc', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `atSocialLinks`
--

DROP TABLE IF EXISTS `atSocialLinks`;
CREATE TABLE `atSocialLinks` (
  `avsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `avID` int(10) unsigned NOT NULL DEFAULT '0',
  `service` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serviceInfo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`avsID`),
  KEY `avID` (`avID`,`avsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `atTextareaSettings`
--

DROP TABLE IF EXISTS `atTextareaSettings`;
CREATE TABLE `atTextareaSettings` (
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `akTextareaDisplayMode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `akTextareaDisplayModeCustomOptions` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`akID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `atTextareaSettings`
--

INSERT INTO `atTextareaSettings` (`akID`, `akTextareaDisplayMode`, `akTextareaDisplayModeCustomOptions`) VALUES
(2, '', ''),
(3, '', ''),
(4, '', ''),
(7, '', ''),
(19, 'text', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `atTopicSettings`
--

DROP TABLE IF EXISTS `atTopicSettings`;
CREATE TABLE `atTopicSettings` (
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `akTopicParentNodeID` int(11) DEFAULT NULL,
  `akTopicTreeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`akID`),
  KEY `akTopicTreeID` (`akTopicTreeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `atTopicSettings`
--

INSERT INTO `atTopicSettings` (`akID`, `akTopicParentNodeID`, `akTopicTreeID`) VALUES
(22, 5, 2),
(23, 14, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `AttributeKeyCategories`
--

DROP TABLE IF EXISTS `AttributeKeyCategories`;
CREATE TABLE `AttributeKeyCategories` (
  `akCategoryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akCategoryHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `akCategoryAllowSets` smallint(6) NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`akCategoryID`),
  KEY `akCategoryHandle` (`akCategoryHandle`),
  KEY `pkgID` (`pkgID`,`akCategoryID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `AttributeKeyCategories`
--

INSERT INTO `AttributeKeyCategories` (`akCategoryID`, `akCategoryHandle`, `akCategoryAllowSets`, `pkgID`) VALUES
(1, 'collection', 1, NULL),
(2, 'user', 2, NULL),
(3, 'file', 1, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `AttributeKeys`
--

DROP TABLE IF EXISTS `AttributeKeys`;
CREATE TABLE `AttributeKeys` (
  `akID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `akName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `akIsSearchable` tinyint(1) NOT NULL DEFAULT '0',
  `akIsSearchableIndexed` tinyint(1) NOT NULL DEFAULT '0',
  `akIsAutoCreated` tinyint(1) NOT NULL DEFAULT '0',
  `akIsInternal` tinyint(1) NOT NULL DEFAULT '0',
  `akIsColumnHeader` tinyint(1) NOT NULL DEFAULT '0',
  `akIsEditable` tinyint(1) NOT NULL DEFAULT '0',
  `atID` int(10) unsigned DEFAULT NULL,
  `akCategoryID` int(10) unsigned DEFAULT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`akID`),
  UNIQUE KEY `akHandle` (`akHandle`,`akCategoryID`),
  KEY `akCategoryID` (`akCategoryID`),
  KEY `atID` (`atID`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=27 ;

--
-- Daten für Tabelle `AttributeKeys`
--

INSERT INTO `AttributeKeys` (`akID`, `akHandle`, `akName`, `akIsSearchable`, `akIsSearchableIndexed`, `akIsAutoCreated`, `akIsInternal`, `akIsColumnHeader`, `akIsEditable`, `atID`, `akCategoryID`, `pkgID`) VALUES
(1, 'meta_title', 'Meta Title', 1, 1, 1, 0, 0, 1, 1, 1, 0),
(2, 'meta_description', 'Meta Description', 1, 1, 1, 0, 0, 1, 2, 1, 0),
(3, 'meta_keywords', 'Meta Keywords', 1, 1, 1, 0, 0, 1, 2, 1, 0),
(4, 'icon_dashboard', 'Dashboard Icon', 0, 0, 1, 1, 0, 1, 2, 1, 0),
(5, 'exclude_nav', 'Exclude From Nav', 1, 1, 1, 0, 0, 1, 3, 1, 0),
(6, 'exclude_page_list', 'Exclude From Page List', 1, 1, 1, 0, 0, 1, 3, 1, 0),
(7, 'header_extra_content', 'Header Extra Content', 1, 1, 1, 0, 0, 1, 2, 1, 0),
(8, 'tags', 'Tags', 1, 1, 1, 0, 0, 1, 8, 1, 0),
(9, 'is_featured', 'Is Featured', 1, 0, 1, 0, 0, 1, 3, 1, 0),
(10, 'exclude_search_index', 'Exclude From Search Index', 1, 1, 1, 0, 0, 1, 3, 1, 0),
(11, 'exclude_sitemapxml', 'Exclude From sitemap.xml', 1, 1, 1, 0, 0, 1, 3, 1, 0),
(12, 'profile_private_messages_enabled', 'I would like to receive private messages.', 1, 0, 0, 0, 0, 1, 3, 2, 0),
(13, 'profile_private_messages_notification_enabled', 'Send me email notifications when I receive a private message.', 1, 0, 0, 0, 0, 1, 3, 2, 0),
(14, 'width', 'Width', 1, 1, 1, 0, 0, 1, 6, 3, 0),
(15, 'height', 'Height', 1, 1, 1, 0, 0, 1, 6, 3, 0),
(16, 'account_profile_links', 'Personal Links', 0, 0, 0, 0, 0, 1, 11, 2, 0),
(17, 'duration', 'Duration', 1, 1, 1, 0, 0, 1, 6, 3, 0),
(18, 'job_posting_department', 'Department', 1, 1, 1, 0, 0, 1, 8, 1, 0),
(19, 'job_location', 'Location', 1, 1, 1, 0, 0, 1, 2, 1, 0),
(20, 'exclude_subpages_from_nav', 'Exclude Sub-Pages From Nav', 1, 1, 1, 0, 0, 1, 3, 1, 0),
(21, 'thumbnail', 'Thumbnail', 1, 1, 1, 0, 0, 1, 5, 1, 0),
(22, 'blog_entry_topics', 'Blog Entry Topics', 1, 1, 1, 0, 0, 1, 10, 1, 0),
(23, 'project_topics', 'Project Topics', 1, 1, 1, 0, 0, 1, 10, 1, 0),
(24, 'project_client', 'Client', 1, 1, 1, 0, 0, 1, 1, 1, 0),
(25, 'project_tasks', 'Task', 1, 1, 1, 0, 0, 1, 8, 1, 0),
(26, 'project_skills', 'Skills', 1, 1, 1, 0, 0, 1, 8, 1, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `AttributeSetKeys`
--

DROP TABLE IF EXISTS `AttributeSetKeys`;
CREATE TABLE `AttributeSetKeys` (
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `asID` int(10) unsigned NOT NULL DEFAULT '0',
  `displayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`akID`,`asID`),
  KEY `asID` (`asID`,`displayOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `AttributeSetKeys`
--

INSERT INTO `AttributeSetKeys` (`akID`, `asID`, `displayOrder`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(7, 1, 4),
(11, 1, 5),
(9, 2, 1),
(5, 2, 2),
(6, 2, 3),
(10, 2, 4),
(8, 2, 5),
(21, 2, 6),
(20, 2, 7),
(18, 3, 1),
(19, 3, 2),
(22, 4, 1),
(23, 5, 1),
(24, 5, 2),
(25, 5, 3),
(26, 5, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `AttributeSets`
--

DROP TABLE IF EXISTS `AttributeSets`;
CREATE TABLE `AttributeSets` (
  `asID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `asHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `akCategoryID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  `asIsLocked` tinyint(1) NOT NULL DEFAULT '1',
  `asDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`asID`),
  UNIQUE KEY `asHandle` (`asHandle`),
  KEY `akCategoryID` (`akCategoryID`,`asDisplayOrder`),
  KEY `pkgID` (`pkgID`,`asID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Daten für Tabelle `AttributeSets`
--

INSERT INTO `AttributeSets` (`asID`, `asName`, `asHandle`, `akCategoryID`, `pkgID`, `asIsLocked`, `asDisplayOrder`) VALUES
(1, 'SEO', 'seo', 1, 0, 0, 0),
(2, 'Navigation and Indexing', 'navigation', 1, 0, 0, 1),
(3, 'Jobs', 'job_board', 1, 0, 0, 2),
(4, 'Blog', 'blog', 1, 0, 0, 3),
(5, 'Portfolio', 'portfolio', 1, 0, 0, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `AttributeTypeCategories`
--

DROP TABLE IF EXISTS `AttributeTypeCategories`;
CREATE TABLE `AttributeTypeCategories` (
  `atID` int(10) unsigned NOT NULL DEFAULT '0',
  `akCategoryID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`atID`,`akCategoryID`),
  KEY `akCategoryID` (`akCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `AttributeTypeCategories`
--

INSERT INTO `AttributeTypeCategories` (`atID`, `akCategoryID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3),
(4, 1),
(4, 2),
(4, 3),
(5, 1),
(6, 1),
(6, 2),
(6, 3),
(7, 1),
(7, 3),
(8, 1),
(8, 2),
(8, 3),
(9, 2),
(10, 1),
(10, 2),
(10, 3),
(11, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `AttributeTypes`
--

DROP TABLE IF EXISTS `AttributeTypes`;
CREATE TABLE `AttributeTypes` (
  `atID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `atHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `atName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`atID`),
  UNIQUE KEY `atHandle` (`atHandle`),
  KEY `pkgID` (`pkgID`,`atID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Daten für Tabelle `AttributeTypes`
--

INSERT INTO `AttributeTypes` (`atID`, `atHandle`, `atName`, `pkgID`) VALUES
(1, 'text', 'Text', 0),
(2, 'textarea', 'Text Area', 0),
(3, 'boolean', 'Checkbox', 0),
(4, 'date_time', 'Date/Time', 0),
(5, 'image_file', 'Image/File', 0),
(6, 'number', 'Number', 0),
(7, 'rating', 'Rating', 0),
(8, 'select', 'Select', 0),
(9, 'address', 'Address', 0),
(10, 'topics', 'Topics', 0),
(11, 'social_links', 'Social Links', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `AttributeValues`
--

DROP TABLE IF EXISTS `AttributeValues`;
CREATE TABLE `AttributeValues` (
  `avID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akID` int(10) unsigned DEFAULT NULL,
  `avDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uID` int(10) unsigned DEFAULT NULL,
  `atID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`avID`),
  KEY `akID` (`akID`),
  KEY `uID` (`uID`),
  KEY `atID` (`atID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=267 ;

--
-- Daten für Tabelle `AttributeValues`
--

INSERT INTO `AttributeValues` (`avID`, `akID`, `avDateAdded`, `uID`, `atID`) VALUES
(1, 4, '2015-04-06 20:45:31', 1, 2),
(2, 3, '2015-04-06 20:45:31', 1, 2),
(3, 3, '2015-04-06 20:45:31', 1, 2),
(4, 3, '2015-04-06 20:45:32', 1, 2),
(5, 3, '2015-04-06 20:45:32', 1, 2),
(6, 3, '2015-04-06 20:45:32', 1, 2),
(7, 3, '2015-04-06 20:45:32', 1, 2),
(8, 3, '2015-04-06 20:45:32', 1, 2),
(9, 5, '2015-04-06 20:45:32', 1, 3),
(10, 3, '2015-04-06 20:45:32', 1, 2),
(11, 3, '2015-04-06 20:45:32', 1, 2),
(12, 3, '2015-04-06 20:45:32', 1, 2),
(13, 3, '2015-04-06 20:45:32', 1, 2),
(14, 3, '2015-04-06 20:45:32', 1, 2),
(15, 3, '2015-04-06 20:45:32', 1, 2),
(16, 5, '2015-04-06 20:45:32', 1, 3),
(17, 3, '2015-04-06 20:45:32', 1, 2),
(18, 5, '2015-04-06 20:45:32', 1, 3),
(19, 3, '2015-04-06 20:45:32', 1, 2),
(20, 3, '2015-04-06 20:45:32', 1, 2),
(21, 3, '2015-04-06 20:45:32', 1, 2),
(22, 3, '2015-04-06 20:45:33', 1, 2),
(23, 3, '2015-04-06 20:45:33', 1, 2),
(24, 3, '2015-04-06 20:45:33', 1, 2),
(25, 3, '2015-04-06 20:45:33', 1, 2),
(26, 3, '2015-04-06 20:45:33', 1, 2),
(27, 3, '2015-04-06 20:45:33', 1, 2),
(28, 5, '2015-04-06 20:45:33', 1, 3),
(29, 5, '2015-04-06 20:45:33', 1, 3),
(30, 5, '2015-04-06 20:45:33', 1, 3),
(31, 5, '2015-04-06 20:45:33', 1, 3),
(32, 5, '2015-04-06 20:45:33', 1, 3),
(33, 5, '2015-04-06 20:45:33', 1, 3),
(34, 5, '2015-04-06 20:45:33', 1, 3),
(35, 5, '2015-04-06 20:45:33', 1, 3),
(36, 3, '2015-04-06 20:45:33', 1, 2),
(37, 3, '2015-04-06 20:45:33', 1, 2),
(38, 3, '2015-04-06 20:45:33', 1, 2),
(39, 4, '2015-04-06 20:45:33', 1, 2),
(40, 3, '2015-04-06 20:45:33', 1, 2),
(41, 3, '2015-04-06 20:45:33', 1, 2),
(42, 5, '2015-04-06 20:45:33', 1, 3),
(43, 10, '2015-04-06 20:45:33', 1, 3),
(44, 3, '2015-04-06 20:45:34', 1, 2),
(45, 3, '2015-04-06 20:45:34', 1, 2),
(46, 3, '2015-04-06 20:45:34', 1, 2),
(47, 5, '2015-04-06 20:45:34', 1, 3),
(48, 3, '2015-04-06 20:45:34', 1, 2),
(49, 3, '2015-04-06 20:45:34', 1, 2),
(50, 3, '2015-04-06 20:45:34', 1, 2),
(51, 5, '2015-04-06 20:45:34', 1, 3),
(52, 3, '2015-04-06 20:45:34', 1, 2),
(53, 3, '2015-04-06 20:45:34', 1, 2),
(54, 3, '2015-04-06 20:45:34', 1, 2),
(55, 3, '2015-04-06 20:45:34', 1, 2),
(56, 3, '2015-04-06 20:45:34', 1, 2),
(57, 3, '2015-04-06 20:45:34', 1, 2),
(58, 3, '2015-04-06 20:45:34', 1, 2),
(59, 3, '2015-04-06 20:45:34', 1, 2),
(60, 3, '2015-04-06 20:45:34', 1, 2),
(61, 3, '2015-04-06 20:45:34', 1, 2),
(62, 3, '2015-04-06 20:45:34', 1, 2),
(63, 3, '2015-04-06 20:45:34', 1, 2),
(64, 3, '2015-04-06 20:45:35', 1, 2),
(65, 3, '2015-04-06 20:45:35', 1, 2),
(66, 3, '2015-04-06 20:45:35', 1, 2),
(67, 3, '2015-04-06 20:45:35', 1, 2),
(68, 3, '2015-04-06 20:45:35', 1, 2),
(69, 3, '2015-04-06 20:45:35', 1, 2),
(70, 3, '2015-04-06 20:45:35', 1, 2),
(71, 3, '2015-04-06 20:45:35', 1, 2),
(72, 3, '2015-04-06 20:45:35', 1, 2),
(73, 3, '2015-04-06 20:45:35', 1, 2),
(74, 3, '2015-04-06 20:45:35', 1, 2),
(75, 3, '2015-04-06 20:45:35', 1, 2),
(76, 3, '2015-04-06 20:45:35', 1, 2),
(77, 3, '2015-04-06 20:45:35', 1, 2),
(78, 3, '2015-04-06 20:45:35', 1, 2),
(79, 3, '2015-04-06 20:45:35', 1, 2),
(80, 3, '2015-04-06 20:45:35', 1, 2),
(81, 3, '2015-04-06 20:45:35', 1, 2),
(82, 3, '2015-04-06 20:45:35', 1, 2),
(83, 3, '2015-04-06 20:45:35', 1, 2),
(84, 3, '2015-04-06 20:45:35', 1, 2),
(85, 3, '2015-04-06 20:45:35', 1, 2),
(86, 3, '2015-04-06 20:45:36', 1, 2),
(87, 3, '2015-04-06 20:45:36', 1, 2),
(88, 3, '2015-04-06 20:45:36', 1, 2),
(89, 3, '2015-04-06 20:45:36', 1, 2),
(90, 3, '2015-04-06 20:45:36', 1, 2),
(91, 3, '2015-04-06 20:45:36', 1, 2),
(92, 3, '2015-04-06 20:45:36', 1, 2),
(93, 3, '2015-04-06 20:45:36', 1, 2),
(94, 3, '2015-04-06 20:45:36', 1, 2),
(95, 3, '2015-04-06 20:45:36', 1, 2),
(96, 3, '2015-04-06 20:45:36', 1, 2),
(97, 3, '2015-04-06 20:45:36', 1, 2),
(98, 10, '2015-04-06 20:45:36', 1, 3),
(99, 3, '2015-04-06 20:45:36', 1, 2),
(100, 3, '2015-04-06 20:45:36', 1, 2),
(101, 3, '2015-04-06 20:45:36', 1, 2),
(102, 3, '2015-04-06 20:45:36', 1, 2),
(103, 3, '2015-04-06 20:45:36', 1, 2),
(104, 3, '2015-04-06 20:45:36', 1, 2),
(105, 5, '2015-04-06 20:45:37', 1, 3),
(106, 5, '2015-04-06 20:45:37', 1, 3),
(107, 10, '2015-04-06 20:45:37', 1, 3),
(108, 4, '2015-04-06 20:45:39', 1, 2),
(109, 4, '2015-04-06 20:45:39', 1, 2),
(110, 4, '2015-04-06 20:45:39', 1, 2),
(111, 4, '2015-04-06 20:45:39', 1, 2),
(112, 14, '2015-04-06 20:45:41', 1, 6),
(113, 15, '2015-04-06 20:45:41', 1, 6),
(114, 14, '2015-04-06 20:45:41', 1, 6),
(115, 15, '2015-04-06 20:45:41', 1, 6),
(116, 14, '2015-04-06 20:45:41', 1, 6),
(117, 15, '2015-04-06 20:45:41', 1, 6),
(118, 14, '2015-04-06 20:45:42', 1, 6),
(119, 15, '2015-04-06 20:45:42', 1, 6),
(120, 14, '2015-04-06 20:45:42', 1, 6),
(121, 15, '2015-04-06 20:45:42', 1, 6),
(122, 14, '2015-04-06 20:45:42', 1, 6),
(123, 15, '2015-04-06 20:45:43', 1, 6),
(124, 14, '2015-04-06 20:45:46', 1, 6),
(125, 15, '2015-04-06 20:45:46', 1, 6),
(126, 14, '2015-04-06 20:45:46', 1, 6),
(127, 15, '2015-04-06 20:45:46', 1, 6),
(128, 14, '2015-04-06 20:45:49', 1, 6),
(129, 15, '2015-04-06 20:45:50', 1, 6),
(130, 14, '2015-04-06 20:45:50', 1, 6),
(131, 15, '2015-04-06 20:45:50', 1, 6),
(132, 14, '2015-04-06 20:45:54', 1, 6),
(133, 15, '2015-04-06 20:45:54', 1, 6),
(134, 14, '2015-04-06 20:45:57', 1, 6),
(135, 15, '2015-04-06 20:45:57', 1, 6),
(136, 14, '2015-04-06 20:46:00', 1, 6),
(137, 15, '2015-04-06 20:46:00', 1, 6),
(138, 14, '2015-04-06 20:46:01', 1, 6),
(139, 15, '2015-04-06 20:46:01', 1, 6),
(140, 14, '2015-04-06 20:46:02', 1, 6),
(141, 15, '2015-04-06 20:46:02', 1, 6),
(142, 14, '2015-04-06 20:46:05', 1, 6),
(143, 15, '2015-04-06 20:46:05', 1, 6),
(144, 5, '2015-04-06 20:46:19', 1, 3),
(145, 20, '2015-04-06 20:46:20', 1, 3),
(146, 9, '2015-04-06 20:46:20', 1, 3),
(147, 21, '2015-04-06 20:46:20', 1, 5),
(148, 23, '2015-04-06 20:46:21', 1, 10),
(149, 24, '2015-04-06 20:46:21', 1, 1),
(150, 25, '2015-04-06 20:46:21', 1, 8),
(151, 26, '2015-04-06 20:46:21', 1, 8),
(152, 21, '2015-04-06 20:46:21', 1, 5),
(153, 23, '2015-04-06 20:46:21', 1, 10),
(154, 24, '2015-04-06 20:46:21', 1, 1),
(155, 25, '2015-04-06 20:46:21', 1, 8),
(156, 26, '2015-04-06 20:46:21', 1, 8),
(157, 9, '2015-04-06 20:46:22', 1, 3),
(158, 21, '2015-04-06 20:46:22', 1, 5),
(159, 23, '2015-04-06 20:46:22', 1, 10),
(160, 24, '2015-04-06 20:46:22', 1, 1),
(161, 25, '2015-04-06 20:46:22', 1, 8),
(162, 26, '2015-04-06 20:46:22', 1, 8),
(163, 9, '2015-04-06 20:46:22', 1, 3),
(164, 21, '2015-04-06 20:46:22', 1, 5),
(165, 23, '2015-04-06 20:46:22', 1, 10),
(166, 24, '2015-04-06 20:46:22', 1, 1),
(167, 25, '2015-04-06 20:46:22', 1, 8),
(168, 26, '2015-04-06 20:46:22', 1, 8),
(169, 21, '2015-04-06 20:46:23', 1, 5),
(170, 23, '2015-04-06 20:46:23', 1, 10),
(171, 24, '2015-04-06 20:46:23', 1, 1),
(172, 25, '2015-04-06 20:46:23', 1, 8),
(173, 26, '2015-04-06 20:46:23', 1, 8),
(174, 21, '2015-04-06 20:46:24', 1, 5),
(175, 23, '2015-04-06 20:46:24', 1, 10),
(176, 24, '2015-04-06 20:46:24', 1, 1),
(177, 25, '2015-04-06 20:46:24', 1, 8),
(178, 26, '2015-04-06 20:46:24', 1, 8),
(179, 20, '2015-04-06 20:46:27', 1, 3),
(180, 1, '2015-04-06 20:46:27', 1, 1),
(181, 2, '2015-04-06 20:46:27', 1, 2),
(182, 3, '2015-04-06 20:46:27', 1, 2),
(183, 7, '2015-04-06 20:46:27', 1, 2),
(184, 11, '2015-04-06 20:46:27', 1, 3),
(185, 21, '2015-04-06 20:46:28', 1, 5),
(186, 22, '2015-04-06 20:46:28', 1, 10),
(187, 21, '2015-04-06 20:46:28', 1, 5),
(188, 22, '2015-04-06 20:46:28', 1, 10),
(189, 21, '2015-04-06 20:46:29', 1, 5),
(190, 22, '2015-04-06 20:46:29', 1, 10),
(191, 1, '2015-04-06 20:46:29', 1, 1),
(192, 2, '2015-04-06 20:46:29', 1, 2),
(193, 3, '2015-04-06 20:46:29', 1, 2),
(194, 5, '2015-04-06 20:46:29', 1, 3),
(195, 7, '2015-04-06 20:46:29', 1, 2),
(196, 11, '2015-04-06 20:46:29', 1, 3),
(197, 5, '2015-04-06 20:46:30', 1, 3),
(198, 1, '2015-04-06 20:46:33', 1, 1),
(199, 2, '2015-04-06 20:46:33', 1, 2),
(200, 3, '2015-04-06 20:46:33', 1, 2),
(201, 7, '2015-04-06 20:46:33', 1, 2),
(202, 11, '2015-04-06 20:46:33', 1, 3),
(203, 18, '2015-04-06 20:46:33', 1, 8),
(204, 19, '2015-04-06 20:46:33', 1, 2),
(205, 1, '2015-04-06 20:46:34', 1, 1),
(206, 2, '2015-04-06 20:46:34', 1, 2),
(207, 3, '2015-04-06 20:46:34', 1, 2),
(208, 7, '2015-04-06 20:46:34', 1, 2),
(209, 11, '2015-04-06 20:46:34', 1, 3),
(210, 18, '2015-04-06 20:46:35', 1, 8),
(211, 19, '2015-04-06 20:46:35', 1, 2),
(212, 12, '2015-04-19 23:50:45', 1, 3),
(213, 13, '2015-04-19 23:50:45', 1, 3),
(214, 11, '2015-05-02 17:04:07', 1, 3),
(215, 5, '2015-05-02 17:04:07', 1, 3),
(216, 20, '2015-05-02 17:04:52', 1, 3),
(217, 5, '2015-05-02 17:04:52', 1, 3),
(218, 5, '2015-05-02 17:05:21', 1, 3),
(219, 20, '2015-05-02 17:05:34', 1, 3),
(220, 5, '2015-05-02 17:05:34', 1, 3),
(221, 5, '2015-05-02 17:06:17', 1, 3),
(222, 11, '2015-05-02 17:06:17', 1, 3),
(223, 5, '2015-05-02 17:06:31', 1, 3),
(224, 20, '2015-05-02 17:06:31', 1, 3),
(225, 5, '2015-05-02 17:06:43', 1, 3),
(226, 5, '2015-05-02 17:06:59', 1, 3),
(227, 20, '2015-05-02 17:06:59', 1, 3),
(228, 5, '2015-05-02 17:07:29', 1, 3),
(229, 5, '2015-05-02 17:08:50', 1, 3),
(230, 5, '2015-05-11 21:34:39', 1, 3),
(231, 5, '2015-05-11 21:34:39', 1, 3),
(232, 5, '2015-05-11 21:34:39', 1, 3),
(233, 5, '2015-05-11 21:34:39', 1, 3),
(234, 5, '2015-08-05 22:17:21', 1, 3),
(263, 19, '2015-08-05 22:36:46', 1, 2),
(264, 18, '2015-08-05 22:36:46', 1, 8),
(265, 12, '2015-10-08 22:30:52', 1, 3),
(266, 13, '2015-10-08 22:30:52', 1, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `AuthenticationTypes`
--

DROP TABLE IF EXISTS `AuthenticationTypes`;
CREATE TABLE `AuthenticationTypes` (
  `authTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authTypeHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `authTypeName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `authTypeIsEnabled` tinyint(1) NOT NULL,
  `authTypeDisplayOrder` int(10) unsigned DEFAULT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`authTypeID`),
  UNIQUE KEY `authTypeHandle` (`authTypeHandle`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Daten für Tabelle `AuthenticationTypes`
--

INSERT INTO `AuthenticationTypes` (`authTypeID`, `authTypeHandle`, `authTypeName`, `authTypeIsEnabled`, `authTypeDisplayOrder`, `pkgID`) VALUES
(1, 'concrete', 'Standard', 1, 0, 0),
(2, 'community', 'concrete5.org', 0, 0, 0),
(3, 'facebook', 'Facebook', 0, 0, 0),
(4, 'twitter', 'Twitter', 0, 0, 0),
(5, 'google', 'Google', 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `authTypeConcreteCookieMap`
--

DROP TABLE IF EXISTS `authTypeConcreteCookieMap`;
CREATE TABLE `authTypeConcreteCookieMap` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uID` int(11) DEFAULT NULL,
  `validThrough` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `token` (`token`),
  KEY `uID` (`uID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `BannedWords`
--

DROP TABLE IF EXISTS `BannedWords`;
CREATE TABLE `BannedWords` (
  `bwID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bannedWord` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`bwID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Daten für Tabelle `BannedWords`
--

INSERT INTO `BannedWords` (`bwID`, `bannedWord`) VALUES
(1, 'fuck'),
(2, 'shit'),
(3, 'bitch'),
(4, 'ass');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `BasicWorkflowPermissionAssignments`
--

DROP TABLE IF EXISTS `BasicWorkflowPermissionAssignments`;
CREATE TABLE `BasicWorkflowPermissionAssignments` (
  `wfID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`wfID`,`pkID`,`paID`),
  KEY `pkID` (`pkID`),
  KEY `paID` (`paID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `BasicWorkflowProgressData`
--

DROP TABLE IF EXISTS `BasicWorkflowProgressData`;
CREATE TABLE `BasicWorkflowProgressData` (
  `wpID` int(10) unsigned NOT NULL DEFAULT '0',
  `uIDStarted` int(10) unsigned NOT NULL DEFAULT '0',
  `uIDCompleted` int(10) unsigned NOT NULL DEFAULT '0',
  `wpDateCompleted` datetime DEFAULT NULL,
  PRIMARY KEY (`wpID`),
  KEY `uIDStarted` (`uIDStarted`),
  KEY `uIDCompleted` (`uIDCompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `BlockFeatureAssignments`
--

DROP TABLE IF EXISTS `BlockFeatureAssignments`;
CREATE TABLE `BlockFeatureAssignments` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '0',
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `faID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`bID`,`faID`),
  KEY `faID` (`faID`,`cID`,`cvID`),
  KEY `bID` (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `BlockFeatureAssignments`
--

INSERT INTO `BlockFeatureAssignments` (`cID`, `cvID`, `bID`, `faID`) VALUES
(1, 2, 163, 11),
(1, 4, 167, 13),
(1, 5, 167, 13),
(1, 6, 167, 13),
(1, 7, 167, 13),
(1, 8, 167, 13),
(154, 1, 110, 2),
(154, 2, 110, 2),
(154, 3, 110, 2),
(158, 1, 125, 6),
(158, 2, 125, 6),
(158, 3, 125, 6),
(167, 1, 16, 1),
(168, 1, 112, 3),
(169, 1, 114, 4),
(170, 1, 116, 5),
(171, 1, 132, 7),
(171, 1, 139, 8),
(171, 1, 143, 9),
(172, 1, 146, 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `BlockPermissionAssignments`
--

DROP TABLE IF EXISTS `BlockPermissionAssignments`;
CREATE TABLE `BlockPermissionAssignments` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '0',
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`bID`,`pkID`,`paID`),
  KEY `bID` (`bID`),
  KEY `pkID` (`pkID`),
  KEY `paID` (`paID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `BlockRelations`
--

DROP TABLE IF EXISTS `BlockRelations`;
CREATE TABLE `BlockRelations` (
  `brID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `originalBID` int(10) unsigned NOT NULL DEFAULT '0',
  `relationType` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`brID`),
  KEY `bID` (`bID`),
  KEY `originalBID` (`originalBID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Daten für Tabelle `BlockRelations`
--

INSERT INTO `BlockRelations` (`brID`, `bID`, `originalBID`, `relationType`) VALUES
(1, 168, 50, 'DUPLICATE'),
(2, 169, 48, 'DUPLICATE'),
(3, 173, 172, 'DUPLICATE'),
(4, 184, 168, 'DUPLICATE'),
(5, 192, 184, 'DUPLICATE'),
(6, 193, 192, 'DUPLICATE');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Blocks`
--

DROP TABLE IF EXISTS `Blocks`;
CREATE TABLE `Blocks` (
  `bID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bName` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bDateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bFilename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bIsActive` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `btID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned DEFAULT NULL,
  `btCachedBlockRecord` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`bID`),
  KEY `btID` (`btID`),
  KEY `uID` (`uID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=200 ;

--
-- Daten für Tabelle `Blocks`
--

INSERT INTO `Blocks` (`bID`, `bName`, `bDateAdded`, `bDateModified`, `bFilename`, `bIsActive`, `btID`, `uID`, `btCachedBlockRecord`) VALUES
(1, '', '2015-04-06 20:45:37', '2015-04-06 20:45:37', NULL, '0', 12, 1, NULL),
(2, '', '2015-04-06 20:45:37', '2015-04-06 20:45:37', NULL, '0', 9, 1, NULL),
(3, '', '2015-04-06 20:45:37', '2015-04-06 20:45:37', NULL, '0', 10, 1, NULL),
(4, '', '2015-04-06 20:45:37', '2015-04-06 20:45:37', NULL, '0', 8, 1, NULL),
(5, '', '2015-04-06 20:45:37', '2015-04-06 20:45:37', NULL, '0', 8, 1, NULL),
(6, '', '2015-04-06 20:45:37', '2015-04-06 20:45:37', NULL, '0', 7, 1, NULL),
(7, '', '2015-04-06 20:45:37', '2015-04-06 20:45:37', NULL, '0', 6, 1, NULL),
(8, '', '2015-04-06 20:45:37', '2015-04-06 20:45:37', NULL, '0', 8, 1, NULL),
(9, '', '2015-04-06 20:46:14', '2015-04-06 20:46:14', 'byline.php', '0', 18, 1, NULL),
(10, '', '2015-04-06 20:46:14', '2015-04-06 20:46:14', NULL, '0', 2, 1, NULL),
(11, '', '2015-04-06 20:46:14', '2015-04-06 20:46:14', NULL, '0', 29, 1, NULL),
(12, '', '2015-04-06 20:46:14', '2015-04-06 20:46:14', NULL, '0', 23, 1, NULL),
(13, '', '2015-04-06 20:46:14', '2015-04-06 20:46:14', NULL, '0', 20, 1, NULL),
(14, '', '2015-04-06 20:46:14', '2015-04-06 20:46:14', NULL, '0', 30, 1, NULL),
(15, '', '2015-04-06 20:46:14', '2015-04-06 20:46:14', NULL, '0', 26, 1, NULL),
(16, '', '2015-04-06 20:46:14', '2015-04-06 20:46:14', NULL, '0', 5, 1, NULL),
(17, '', '2015-04-06 20:46:14', '2015-04-06 20:46:14', NULL, '0', 18, 1, NULL),
(18, '', '2015-04-06 20:46:14', '2015-04-06 20:46:14', NULL, '0', 30, 1, NULL),
(19, '', '2015-04-06 20:46:15', '2015-04-06 20:46:15', NULL, '0', 12, 1, NULL),
(20, '', '2015-04-06 20:46:15', '2015-04-06 20:46:15', NULL, '0', 12, 1, NULL),
(21, '', '2015-04-06 20:46:15', '2015-04-06 20:46:15', NULL, '0', 16, 1, NULL),
(22, '', '2015-04-06 20:46:15', '2015-04-06 20:46:15', NULL, '0', 12, 1, NULL),
(23, '', '2015-04-06 20:46:15', '2015-04-06 20:46:15', NULL, '0', 16, 1, NULL),
(24, '', '2015-04-06 20:46:15', '2015-04-06 20:46:15', NULL, '0', 12, 1, NULL),
(25, '', '2015-04-06 20:46:15', '2015-04-06 20:46:15', NULL, '0', 2, 1, NULL),
(26, '', '2015-04-06 20:46:15', '2015-04-06 20:46:15', NULL, '0', 12, 1, NULL),
(27, '', '2015-04-06 20:46:15', '2015-04-06 20:46:15', NULL, '0', 18, 1, NULL),
(28, '', '2015-04-06 20:46:15', '2015-04-06 20:46:15', NULL, '0', 2, 1, NULL),
(29, '', '2015-04-06 20:46:15', '2015-04-06 20:46:15', NULL, '0', 16, 1, NULL),
(30, '', '2015-04-06 20:46:15', '2015-04-06 20:46:15', NULL, '0', 16, 1, NULL),
(31, '', '2015-04-06 20:46:15', '2015-04-06 20:46:15', NULL, '0', 16, 1, NULL),
(32, '', '2015-04-06 20:46:15', '2015-04-06 20:46:15', NULL, '0', 2, 1, NULL),
(33, '', '2015-04-06 20:46:15', '2015-04-06 20:46:15', NULL, '0', 26, 1, NULL),
(34, '', '2015-04-06 20:46:15', '2015-04-06 20:46:15', 'thumbnail_grid', '0', 30, 1, NULL),
(35, '', '2015-04-06 20:46:15', '2015-04-06 20:46:15', NULL, '0', 18, 1, NULL),
(36, '', '2015-04-06 20:46:15', '2015-04-06 20:46:15', NULL, '0', 1, 1, NULL),
(37, '', '2015-04-06 20:46:16', '2015-04-06 20:46:16', NULL, '0', 30, 1, NULL),
(38, '', '2015-04-06 20:46:16', '2015-04-06 20:46:16', NULL, '0', 20, 1, NULL),
(39, '', '2015-04-06 20:46:16', '2015-04-06 20:46:16', NULL, '0', 13, 1, NULL),
(40, '', '2015-04-06 20:46:16', '2015-04-06 20:46:16', NULL, '0', 18, 1, NULL),
(41, '', '2015-04-06 20:46:16', '2015-04-06 20:46:16', 'flat_filter.php', '0', 20, 1, NULL),
(42, '', '2015-04-06 20:46:16', '2015-04-06 20:46:16', 'thumbnail_grid', '0', 30, 1, NULL),
(43, '', '2015-04-06 20:46:16', '2015-04-06 20:46:16', NULL, '0', 12, 1, NULL),
(44, '', '2015-04-06 20:46:17', '2015-04-06 20:46:17', NULL, '0', 12, 1, NULL),
(45, '', '2015-04-06 20:46:17', '2015-04-06 20:46:17', NULL, '0', 12, 1, NULL),
(46, '', '2015-04-06 20:46:17', '2015-04-06 20:46:17', NULL, '0', 12, 1, NULL),
(47, '', '2015-04-06 20:46:17', '2015-04-06 20:46:17', NULL, '0', 21, 1, NULL),
(48, '', '2015-04-06 20:46:17', '2015-04-06 20:46:17', 'responsive_header_navigation', '0', 11, 1, NULL),
(49, '', '2015-04-06 20:46:17', '2015-04-06 20:46:17', NULL, '0', 32, 1, NULL),
(50, '', '2015-04-06 20:46:17', '2015-04-06 20:46:17', NULL, '0', 12, 1, NULL),
(51, '', '2015-04-06 20:46:17', '2015-04-06 20:46:17', NULL, '0', 33, 1, NULL),
(52, '', '2015-04-06 20:46:17', '2015-04-06 20:46:17', NULL, '0', 1, 1, NULL),
(53, '', '2015-04-06 20:46:17', '2015-04-06 20:46:17', NULL, '0', 19, 1, NULL),
(54, '', '2015-04-06 20:46:17', '2015-04-06 20:46:17', NULL, '0', 19, 1, NULL),
(55, '', '2015-04-06 20:46:17', '2015-04-06 20:46:17', NULL, '0', 19, 1, NULL),
(56, '', '2015-04-06 20:46:17', '2015-04-06 20:46:17', NULL, '0', 26, 1, NULL),
(57, '', '2015-04-06 20:46:17', '2015-04-06 20:46:17', NULL, '0', 12, 1, NULL),
(58, '', '2015-04-06 20:46:18', '2015-04-06 20:46:18', 'thumbnail_grid', '0', 30, 1, NULL),
(59, '', '2015-04-06 20:46:18', '2015-04-06 20:46:18', NULL, '0', 26, 1, NULL),
(60, '', '2015-04-06 20:46:18', '2015-04-06 20:46:18', NULL, '0', 1, 1, NULL),
(61, '', '2015-04-06 20:46:18', '2015-04-06 20:46:18', NULL, '0', 12, 1, NULL),
(62, '', '2015-04-06 20:46:18', '2015-04-06 20:46:18', NULL, '0', 12, 1, NULL),
(63, '', '2015-04-06 20:46:18', '2015-04-06 20:46:18', NULL, '0', 1, 1, NULL),
(64, '', '2015-04-06 20:46:18', '2015-04-06 20:46:18', NULL, '0', 30, 1, NULL),
(65, '', '2015-04-06 20:46:18', '2015-04-06 20:46:18', NULL, '0', 30, 1, NULL),
(66, '', '2015-04-06 20:46:18', '2015-04-06 20:46:18', NULL, '0', 12, 1, NULL),
(67, '', '2015-04-06 20:46:18', '2015-04-06 20:46:18', NULL, '0', 12, 1, NULL),
(68, '', '2015-04-06 20:46:19', '2015-04-06 20:46:19', NULL, '0', 18, 1, NULL),
(69, '', '2015-04-06 20:46:19', '2015-04-06 20:46:19', NULL, '0', 1, 1, NULL),
(70, '', '2015-04-06 20:46:19', '2015-04-06 20:46:19', 'hover_description', '0', 19, 1, NULL),
(71, '', '2015-04-06 20:46:19', '2015-04-06 20:46:19', 'hover_description', '0', 19, 1, NULL),
(72, '', '2015-04-06 20:46:19', '2015-04-06 20:46:19', 'hover_description', '0', 19, 1, NULL),
(73, '', '2015-04-06 20:46:19', '2015-04-06 20:46:19', 'hover_description', '0', 19, 1, NULL),
(74, '', '2015-04-06 20:46:19', '2015-04-06 20:46:19', NULL, '0', 26, 1, NULL),
(75, '', '2015-04-06 20:46:19', '2015-04-06 20:46:19', NULL, '0', 1, 1, NULL),
(76, '', '2015-04-06 20:46:19', '2015-04-06 20:46:19', NULL, '0', 12, 1, NULL),
(77, '', '2015-04-06 20:46:19', '2015-04-06 20:46:19', NULL, '0', 12, 1, NULL),
(78, '', '2015-04-06 20:46:19', '2015-04-06 20:46:19', NULL, '0', 12, 1, NULL),
(79, '', '2015-04-06 20:46:19', '2015-04-06 20:46:19', NULL, '0', 1, 1, NULL),
(80, '', '2015-04-06 20:46:19', '2015-04-06 20:46:19', NULL, '0', 22, 1, NULL),
(81, '', '2015-04-06 20:46:20', '2015-04-06 20:46:20', NULL, '0', 22, 1, NULL),
(82, '', '2015-04-06 20:46:20', '2015-04-06 20:46:20', NULL, '0', 22, 1, NULL),
(83, '', '2015-04-06 20:46:20', '2015-04-06 20:46:20', NULL, '0', 22, 1, NULL),
(84, '', '2015-04-06 20:46:20', '2015-04-06 20:46:20', NULL, '0', 33, 1, NULL),
(85, '', '2015-04-06 20:46:20', '2015-04-06 20:46:20', NULL, '0', 12, 1, NULL),
(86, '', '2015-04-06 20:46:21', '2015-04-06 20:46:21', NULL, '0', 33, 1, NULL),
(87, '', '2015-04-06 20:46:21', '2015-04-06 20:46:21', NULL, '0', 12, 1, NULL),
(88, '', '2015-04-06 20:46:21', '2015-04-06 20:46:21', NULL, '0', 33, 1, NULL),
(89, '', '2015-04-06 20:46:21', '2015-04-06 20:46:21', NULL, '0', 12, 1, NULL),
(90, '', '2015-04-06 20:46:22', '2015-04-06 20:46:22', NULL, '0', 33, 1, NULL),
(91, '', '2015-04-06 20:46:22', '2015-04-06 20:46:22', NULL, '0', 12, 1, NULL),
(92, '', '2015-04-06 20:46:23', '2015-04-06 20:46:23', NULL, '0', 33, 1, NULL),
(93, '', '2015-04-06 20:46:23', '2015-04-06 20:46:23', NULL, '0', 12, 1, NULL),
(94, '', '2015-04-06 20:46:23', '2015-04-06 20:46:23', NULL, '0', 33, 1, NULL),
(95, '', '2015-04-06 20:46:24', '2015-04-06 20:46:24', NULL, '0', 12, 1, NULL),
(96, '', '2015-04-06 20:46:24', '2015-04-06 20:46:24', NULL, '0', 18, 1, NULL),
(97, '', '2015-04-06 20:46:24', '2015-04-06 20:46:24', NULL, '0', 1, 1, NULL),
(98, '', '2015-04-06 20:46:24', '2015-04-06 20:46:24', NULL, '0', 22, 1, NULL),
(99, '', '2015-04-06 20:46:24', '2015-04-06 20:46:24', NULL, '0', 22, 1, NULL),
(100, '', '2015-04-06 20:46:24', '2015-04-06 20:46:24', NULL, '0', 26, 1, NULL),
(101, '', '2015-04-06 20:46:24', '2015-04-06 20:46:24', NULL, '0', 1, 1, NULL),
(102, '', '2015-04-06 20:46:24', '2015-04-06 20:46:24', NULL, '0', 22, 1, NULL),
(103, '', '2015-04-06 20:46:25', '2015-04-06 20:46:25', NULL, '0', 22, 1, NULL),
(104, '', '2015-04-06 20:46:25', '2015-04-06 20:46:25', NULL, '0', 22, 1, NULL),
(105, '', '2015-04-06 20:46:25', '2015-04-06 20:46:25', NULL, '0', 22, 1, NULL),
(106, '', '2015-04-06 20:46:25', '2015-04-06 20:46:25', NULL, '0', 22, 1, NULL),
(107, '', '2015-04-06 20:46:26', '2015-04-06 20:46:26', NULL, '0', 22, 1, NULL),
(108, '', '2015-04-06 20:46:26', '2015-04-06 20:46:26', NULL, '0', 26, 1, NULL),
(109, '', '2015-04-06 20:46:26', '2015-04-06 20:46:26', NULL, '0', 1, 1, NULL),
(110, '', '2015-04-06 20:46:26', '2015-04-06 20:46:26', NULL, '0', 27, 1, NULL),
(111, '', '2015-04-06 20:46:26', '2015-04-06 20:46:26', NULL, '0', 12, 1, NULL),
(112, '', '2015-04-06 20:46:27', '2015-04-06 20:46:27', NULL, '0', 5, 1, NULL),
(113, '', '2015-04-06 20:46:27', '2015-04-06 20:46:27', NULL, '0', 12, 1, NULL),
(114, '', '2015-04-06 20:46:28', '2015-04-06 20:46:28', NULL, '0', 5, 1, NULL),
(115, '', '2015-04-06 20:46:28', '2015-04-06 20:46:28', NULL, '0', 12, 1, NULL),
(116, '', '2015-04-06 20:46:28', '2015-04-06 20:46:28', NULL, '0', 5, 1, NULL),
(117, '', '2015-04-06 20:46:29', '2015-04-06 20:46:29', NULL, '0', 12, 1, NULL),
(118, '', '2015-04-06 20:46:29', '2015-04-06 20:46:29', NULL, '0', 32, 1, NULL),
(119, '', '2015-04-06 20:46:29', '2015-04-06 20:46:29', NULL, '0', 18, 1, NULL),
(120, '', '2015-04-06 20:46:29', '2015-04-06 20:46:29', NULL, '0', 1, 1, NULL),
(121, '', '2015-04-06 20:46:29', '2015-04-06 20:46:29', NULL, '0', 24, 1, NULL),
(122, '', '2015-04-06 20:46:29', '2015-04-06 20:46:29', NULL, '0', 12, 1, NULL),
(123, '', '2015-04-06 20:46:29', '2015-04-06 20:46:29', NULL, '0', 26, 1, NULL),
(124, '', '2015-04-06 20:46:29', '2015-04-06 20:46:29', NULL, '0', 1, 1, NULL),
(125, '', '2015-04-06 20:46:30', '2015-04-06 20:46:30', NULL, '0', 27, 1, NULL),
(126, '', '2015-04-06 20:46:30', '2015-04-06 20:46:30', NULL, '0', 12, 1, NULL),
(127, '', '2015-04-06 20:46:30', '2015-04-06 20:46:30', NULL, '0', 12, 1, NULL),
(128, '', '2015-04-06 20:46:30', '2015-04-06 20:46:30', NULL, '0', 17, 1, NULL),
(129, '', '2015-04-06 20:46:30', '2015-04-06 20:46:30', NULL, '0', 12, 1, NULL),
(130, '', '2015-04-06 20:46:30', '2015-04-06 20:46:30', NULL, '0', 18, 1, NULL),
(131, '', '2015-04-06 20:46:30', '2015-04-06 20:46:30', NULL, '0', 1, 1, NULL),
(132, '', '2015-04-06 20:46:30', '2015-04-06 20:46:30', NULL, '0', 27, 1, NULL),
(133, '', '2015-04-06 20:46:30', '2015-04-06 20:46:30', NULL, '0', 12, 1, NULL),
(134, '', '2015-04-06 20:46:30', '2015-04-06 20:46:30', NULL, '0', 12, 1, NULL),
(135, '', '2015-04-06 20:46:30', '2015-04-06 20:46:30', NULL, '0', 26, 1, NULL),
(136, '', '2015-04-06 20:46:30', '2015-04-06 20:46:30', NULL, '0', 1, 1, NULL),
(137, '', '2015-04-06 20:46:30', '2015-04-06 20:46:30', NULL, '0', 12, 1, NULL),
(138, '', '2015-04-06 20:46:31', '2015-04-06 20:46:31', NULL, '0', 12, 1, NULL),
(139, '', '2015-04-06 20:46:31', '2015-04-06 20:46:31', NULL, '0', 27, 1, NULL),
(140, '', '2015-04-06 20:46:31', '2015-04-06 20:46:31', NULL, '0', 12, 1, NULL),
(141, '', '2015-04-06 20:46:31', '2015-04-06 20:46:31', NULL, '0', 26, 1, NULL),
(142, '', '2015-04-06 20:46:31', '2015-04-06 20:46:31', NULL, '0', 1, 1, NULL),
(143, '', '2015-04-06 20:46:31', '2015-04-06 20:46:31', NULL, '0', 27, 1, NULL),
(144, '', '2015-04-06 20:46:31', '2015-04-06 20:46:31', NULL, '0', 12, 1, NULL),
(145, '', '2015-04-06 20:46:31', '2015-04-06 20:46:31', NULL, '0', 18, 1, NULL),
(146, '', '2015-04-06 20:46:32', '2015-04-06 20:46:32', NULL, '0', 27, 1, NULL),
(147, '', '2015-04-06 20:46:32', '2015-04-06 20:46:32', NULL, '0', 25, 1, NULL),
(148, '', '2015-04-06 20:46:32', '2015-04-06 20:46:32', NULL, '0', 1, 1, NULL),
(149, '', '2015-04-06 20:46:32', '2015-04-06 20:46:32', NULL, '0', 19, 1, NULL),
(150, '', '2015-04-06 20:46:32', '2015-04-06 20:46:32', NULL, '0', 19, 1, NULL),
(151, '', '2015-04-06 20:46:32', '2015-04-06 20:46:32', NULL, '0', 19, 1, NULL),
(152, '', '2015-04-06 20:46:32', '2015-04-06 20:46:32', NULL, '0', 19, 1, NULL),
(153, '', '2015-04-06 20:46:32', '2015-04-06 20:46:32', NULL, '0', 19, 1, NULL),
(154, '', '2015-04-06 20:46:32', '2015-04-06 20:46:32', NULL, '0', 19, 1, NULL),
(155, '', '2015-04-06 20:46:32', '2015-04-06 20:46:32', NULL, '0', 26, 1, NULL),
(156, '', '2015-04-06 20:46:32', '2015-04-06 20:46:32', NULL, '0', 1, 1, NULL),
(157, '', '2015-04-06 20:46:33', '2015-04-06 20:46:33', NULL, '0', 12, 1, NULL),
(158, '', '2015-04-06 20:46:33', '2015-04-06 20:46:33', NULL, '0', 30, 1, NULL),
(159, '', '2015-04-06 20:46:33', '2015-04-06 20:46:33', NULL, '0', 12, 1, NULL),
(160, '', '2015-04-06 20:46:34', '2015-04-06 20:46:34', NULL, '0', 12, 1, NULL),
(161, '', '2015-04-06 20:46:35', '2015-04-06 20:46:35', NULL, '0', 18, 1, NULL),
(162, '', '2015-04-06 20:46:35', '2015-04-06 20:46:35', NULL, '0', 28, 1, NULL),
(163, '', '2015-04-24 21:57:05', '2015-04-24 21:57:05', NULL, '0', 5, 1, NULL),
(167, '', '2015-04-30 20:51:54', '2015-04-30 20:52:23', 'mytemplate', '0', 27, 1, NULL),
(168, '', '2015-05-02 16:55:20', '2015-05-02 16:55:20', NULL, '1', 12, 1, NULL),
(169, '', '2015-05-02 17:02:48', '2015-08-05 23:08:28', 'responsive_header_navigation', '1', 11, 1, NULL),
(170, '', '2015-05-02 17:09:49', '2015-05-02 17:09:49', NULL, '0', 1, 1, NULL),
(171, '', '2015-05-02 17:10:26', '2015-05-02 17:10:26', NULL, '0', 12, 1, NULL),
(172, '', '2015-05-02 17:11:44', '2015-05-02 17:11:44', NULL, '0', 12, 1, NULL),
(173, '', '2015-05-03 12:35:14', '2015-05-03 12:35:14', NULL, '1', 12, 1, NULL),
(175, '', '2015-05-04 21:50:38', '2015-05-04 21:50:38', NULL, '0', 40, 1, NULL),
(180, '', '2015-07-30 21:11:44', '2015-07-30 21:11:44', NULL, '0', 44, 1, NULL),
(184, '', '2015-08-05 23:07:05', '2015-08-05 23:07:05', NULL, '1', 12, 1, NULL),
(185, '', '2015-08-06 20:06:25', '2015-08-06 20:06:25', NULL, '0', 44, 1, NULL),
(186, '', '2015-08-12 19:28:47', '2015-08-12 19:28:47', NULL, '0', 34, 1, NULL),
(187, '', '2015-08-13 21:15:22', '2015-08-13 21:15:22', NULL, '0', 44, 1, NULL),
(188, '', '2015-08-19 21:50:31', '2015-08-19 21:50:31', NULL, '0', 40, 1, NULL),
(189, '', '2015-08-20 19:59:29', '2015-08-20 19:59:29', NULL, '0', 40, 1, NULL),
(190, '', '2015-08-20 20:02:09', '2015-08-20 20:02:09', NULL, '0', 40, 1, NULL),
(191, '', '2015-08-20 20:35:44', '2015-08-20 20:35:44', NULL, '0', 44, 1, NULL),
(192, '', '2015-08-20 22:22:16', '2015-08-20 22:22:16', NULL, '1', 12, 1, NULL),
(193, '', '2015-08-20 22:22:47', '2015-08-20 22:22:47', NULL, '1', 12, 1, NULL),
(194, '', '2015-08-20 22:25:26', '2015-08-20 22:25:26', NULL, '0', 12, 1, NULL),
(195, '', '2015-08-20 22:25:40', '2015-08-20 22:25:40', NULL, '0', 12, 1, NULL),
(196, '', '2015-08-20 22:25:55', '2015-08-20 22:25:55', NULL, '0', 12, 1, NULL),
(197, '', '2015-08-20 22:29:29', '2015-08-20 22:29:29', NULL, '0', 44, 1, NULL),
(198, '', '2015-10-08 22:28:42', '2015-10-08 22:28:42', NULL, '0', 45, 1, NULL),
(199, '', '2015-10-08 22:59:02', '2015-10-08 22:59:02', NULL, '0', 46, 1, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `BlockTypePermissionBlockTypeAccessList`
--

DROP TABLE IF EXISTS `BlockTypePermissionBlockTypeAccessList`;
CREATE TABLE `BlockTypePermissionBlockTypeAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`),
  KEY `peID` (`peID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `BlockTypePermissionBlockTypeAccessListCustom`
--

DROP TABLE IF EXISTS `BlockTypePermissionBlockTypeAccessListCustom`;
CREATE TABLE `BlockTypePermissionBlockTypeAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `btID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`btID`),
  KEY `peID` (`peID`),
  KEY `btID` (`btID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `BlockTypes`
--

DROP TABLE IF EXISTS `BlockTypes`;
CREATE TABLE `BlockTypes` (
  `btID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `btHandle` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `btName` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `btDescription` text COLLATE utf8_unicode_ci,
  `btCopyWhenPropagate` tinyint(1) NOT NULL DEFAULT '0',
  `btIncludeAll` tinyint(1) NOT NULL DEFAULT '0',
  `btIsInternal` tinyint(1) NOT NULL DEFAULT '0',
  `btSupportsInlineAdd` tinyint(1) NOT NULL DEFAULT '0',
  `btSupportsInlineEdit` tinyint(1) NOT NULL DEFAULT '0',
  `btIgnorePageThemeGridFrameworkContainer` tinyint(1) NOT NULL DEFAULT '0',
  `btDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `btInterfaceWidth` int(10) unsigned NOT NULL DEFAULT '400',
  `btInterfaceHeight` int(10) unsigned NOT NULL DEFAULT '400',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`btID`),
  UNIQUE KEY `btHandle` (`btHandle`),
  KEY `btDisplayOrder` (`btDisplayOrder`,`btName`,`btID`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=47 ;

--
-- Daten für Tabelle `BlockTypes`
--

INSERT INTO `BlockTypes` (`btID`, `btHandle`, `btName`, `btDescription`, `btCopyWhenPropagate`, `btIncludeAll`, `btIsInternal`, `btSupportsInlineAdd`, `btSupportsInlineEdit`, `btIgnorePageThemeGridFrameworkContainer`, `btDisplayOrder`, `btInterfaceWidth`, `btInterfaceHeight`, `pkgID`) VALUES
(1, 'core_area_layout', 'Area Layout', 'Proxy block for area layouts.', 0, 0, 1, 1, 1, 0, 0, 400, 400, 0),
(2, 'core_page_type_composer_control_output', 'Composer Control', 'Proxy block for blocks that need to be output through composer.', 0, 0, 1, 0, 0, 0, 0, 400, 400, 0),
(3, 'core_scrapbook_display', 'Scrapbook Display', 'Proxy block for blocks pasted through the scrapbook.', 0, 0, 1, 0, 0, 0, 0, 400, 400, 0),
(4, 'core_stack_display', 'Stack Display', 'Proxy block for stacks added through the UI.', 0, 0, 1, 0, 0, 0, 0, 400, 400, 0),
(5, 'core_conversation', 'Conversation', 'Displays conversations on a page.', 1, 0, 0, 0, 0, 0, 22, 400, 400, 0),
(6, 'dashboard_featured_addon', 'Dashboard Featured Add-On', 'Features an add-on from concrete5.org.', 0, 0, 1, 0, 0, 0, 0, 300, 100, 0),
(7, 'dashboard_featured_theme', 'Dashboard Featured Theme', 'Features a theme from concrete5.org.', 0, 0, 1, 0, 0, 0, 0, 300, 100, 0),
(8, 'dashboard_newsflow_latest', 'Dashboard Newsflow Latest', 'Grabs the latest newsflow data from concrete5.org.', 0, 0, 1, 0, 0, 0, 0, 400, 400, 0),
(9, 'dashboard_app_status', 'Dashboard App Status', 'Displays update and welcome back information on your dashboard.', 0, 0, 1, 0, 0, 0, 0, 400, 400, 0),
(10, 'dashboard_site_activity', 'Dashboard Site Activity', 'Displays a summary of website activity.', 0, 0, 1, 0, 0, 0, 0, 400, 400, 0),
(11, 'autonav', 'Auto-Nav', 'Creates navigation trees and sitemaps.', 0, 0, 0, 0, 0, 0, 23, 800, 350, 0),
(12, 'content', 'Content', 'HTML/WYSIWYG Editor Content.', 0, 0, 0, 1, 1, 0, 24, 600, 465, 0),
(13, 'date_navigation', 'Date Navigation', 'Displays a list of months to filter a page list by.', 0, 0, 0, 0, 0, 0, 25, 400, 450, 0),
(14, 'external_form', 'External Form', 'Include external forms in the filesystem and place them on pages.', 0, 0, 0, 0, 0, 0, 26, 370, 175, 0),
(15, 'file', 'File', 'Link to files stored in the asset library.', 0, 0, 0, 0, 0, 0, 27, 300, 250, 0),
(16, 'page_attribute_display', 'Page Attribute Display', 'Displays the value of a page attribute for the current page.', 0, 0, 0, 0, 0, 0, 28, 500, 365, 0),
(17, 'form', 'Form', 'Build simple forms and surveys.', 0, 0, 0, 0, 0, 0, 29, 420, 430, 0),
(18, 'page_title', 'Page Title', 'Displays a Page''s Title', 0, 0, 0, 0, 0, 0, 30, 400, 200, 0),
(19, 'feature', 'Feature', 'Displays an icon, a title, and a short paragraph description.', 0, 0, 0, 0, 0, 0, 21, 400, 520, 0),
(20, 'topic_list', 'Topic List', 'Displays a list of your site''s topics, allowing you to click on them to filter a page list.', 0, 0, 0, 0, 0, 0, 20, 400, 400, 0),
(21, 'social_links', 'Social Links', 'Allows users to add social icons to their website', 0, 0, 0, 0, 0, 0, 3, 400, 400, 0),
(22, 'testimonial', 'Testimonial', 'Displays a quote or paragraph next to biographical information and a person''s picture.', 0, 0, 0, 0, 0, 0, 4, 450, 560, 0),
(23, 'share_this_page', 'Share This Page', 'Allows users to share this page with social networks.', 0, 0, 0, 0, 0, 0, 5, 400, 400, 0),
(24, 'google_map', 'Google Map', 'Enter an address and a Google Map of that location will be placed in your page.', 0, 0, 0, 0, 0, 0, 6, 400, 320, 0),
(25, 'html', 'HTML', 'For adding HTML by hand.', 0, 0, 0, 0, 0, 1, 7, 600, 500, 0),
(26, 'horizontal_rule', 'Horizontal Rule', 'Adds a thin hairline horizontal divider to the page.', 0, 0, 0, 0, 0, 1, 8, 400, 400, 0),
(27, 'image', 'Image', 'Adds images and onstates from the library to pages.', 0, 0, 0, 0, 0, 0, 9, 400, 550, 0),
(28, 'faq', 'FAQ', 'Frequently Asked Questions Block', 0, 0, 0, 0, 0, 0, 10, 600, 465, 0),
(29, 'next_previous', 'Next & Previous Nav', 'Navigate through sibling pages.', 0, 0, 0, 0, 0, 0, 11, 430, 400, 0),
(30, 'page_list', 'Page List', 'List pages based on type, area.', 0, 0, 0, 0, 0, 0, 12, 800, 350, 0),
(31, 'rss_displayer', 'RSS Displayer', 'Fetch, parse and display the contents of an RSS or Atom feed.', 0, 0, 0, 0, 0, 0, 13, 400, 550, 0),
(32, 'search', 'Search', 'Add a search box to your site.', 0, 0, 0, 0, 0, 0, 14, 400, 420, 0),
(33, 'image_slider', 'Image Slider', 'Display your images and captions in an attractive slideshow format.', 0, 0, 0, 0, 0, 1, 15, 600, 465, 0),
(34, 'survey', 'Survey', 'Provide a simple survey, along with results in a pie chart format.', 0, 0, 0, 0, 0, 0, 16, 420, 400, 0),
(35, 'switch_language', 'Switch Language', 'Adds a front-end language switcher to your website.', 0, 0, 0, 0, 0, 0, 17, 500, 150, 0),
(36, 'tags', 'Tags', 'List pages based on type, area.', 0, 0, 0, 0, 0, 0, 18, 450, 439, 0),
(37, 'video', 'Video Player', 'Embeds uploaded video into a web page. Supports WebM, Ogg, and Quicktime/MPEG4 formats.', 0, 0, 0, 0, 0, 0, 19, 320, 270, 0),
(38, 'youtube', 'YouTube Video', 'Embeds a YouTube Video in your web page.', 0, 0, 0, 0, 0, 0, 31, 400, 430, 0),
(40, 'basic_table_block', 'BasicTable', 'Show a simple Table with Data to create, edit, delete', 0, 0, 0, 0, 0, 0, 2, 400, 400, 0),
(44, 'eventtable', 'BasicEvent', 'Show a simple Table width Data of Events', 0, 0, 0, 0, 0, 0, 1, 400, 400, 0),
(45, 'quittungentable', 'BasicQuittungen', 'Store and show bills', 0, 0, 0, 0, 0, 0, 0, 400, 400, 0),
(46, 'budgettable', 'BasicBudget', 'Store and show bills', 0, 0, 0, 0, 0, 0, 0, 400, 400, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `BlockTypeSetBlockTypes`
--

DROP TABLE IF EXISTS `BlockTypeSetBlockTypes`;
CREATE TABLE `BlockTypeSetBlockTypes` (
  `btID` int(10) unsigned NOT NULL DEFAULT '0',
  `btsID` int(10) unsigned NOT NULL DEFAULT '0',
  `displayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`btID`,`btsID`),
  KEY `btsID` (`btsID`,`displayOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `BlockTypeSetBlockTypes`
--

INSERT INTO `BlockTypeSetBlockTypes` (`btID`, `btsID`, `displayOrder`) VALUES
(12, 1, 0),
(25, 1, 1),
(27, 1, 2),
(15, 1, 3),
(26, 1, 4),
(19, 1, 5),
(11, 2, 0),
(18, 2, 1),
(28, 2, 2),
(30, 2, 3),
(29, 2, 4),
(13, 2, 5),
(36, 2, 6),
(20, 2, 7),
(31, 2, 8),
(35, 2, 9),
(17, 3, 0),
(32, 3, 1),
(14, 3, 2),
(34, 4, 0),
(5, 4, 1),
(21, 4, 2),
(22, 4, 3),
(23, 4, 4),
(16, 5, 0),
(33, 5, 1),
(37, 5, 2),
(38, 5, 3),
(24, 5, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `BlockTypeSets`
--

DROP TABLE IF EXISTS `BlockTypeSets`;
CREATE TABLE `BlockTypeSets` (
  `btsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `btsName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `btsHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  `btsDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`btsID`),
  UNIQUE KEY `btsHandle` (`btsHandle`),
  KEY `btsDisplayOrder` (`btsDisplayOrder`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Daten für Tabelle `BlockTypeSets`
--

INSERT INTO `BlockTypeSets` (`btsID`, `btsName`, `btsHandle`, `pkgID`, `btsDisplayOrder`) VALUES
(1, 'Basic', 'basic', 0, 0),
(2, 'Navigation', 'navigation', 0, 0),
(3, 'Forms', 'form', 0, 0),
(4, 'Social Networking', 'social', 0, 0),
(5, 'Multimedia', 'multimedia', 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btBasicTable`
--

DROP TABLE IF EXISTS `btBasicTable`;
CREATE TABLE `btBasicTable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Daten für Tabelle `btBasicTable`
--

INSERT INTO `btBasicTable` (`id`, `value`) VALUES
(1, 'asdf'),
(7, 'test'),
(8, 'test'),
(9, 'test'),
(10, 'test'),
(11, 'test'),
(12, 'test'),
(13, 'test'),
(14, 'tes'),
(15, 'test'),
(16, 'test');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btBasicTableActionOption`
--

DROP TABLE IF EXISTS `btBasicTableActionOption`;
CREATE TABLE `btBasicTableActionOption` (
  `optionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bID` int(11) DEFAULT NULL,
  `optionName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayOrder` int(11) DEFAULT '0',
  PRIMARY KEY (`optionID`),
  KEY `bID` (`bID`,`displayOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btBasicTableInstance`
--

DROP TABLE IF EXISTS `btBasicTableInstance`;
CREATE TABLE `btBasicTableInstance` (
  `bID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `requiresRegistration` int(11) DEFAULT '0',
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=200 ;

--
-- Daten für Tabelle `btBasicTableInstance`
--

INSERT INTO `btBasicTableInstance` (`bID`, `question`, `requiresRegistration`) VALUES
(175, 'test', 0),
(180, '', 0),
(185, '', 0),
(187, '', 0),
(188, '', 0),
(189, '', 0),
(190, '', 0),
(191, '', 0),
(197, '', 0),
(198, '', 0),
(199, '', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btBudget`
--

DROP TABLE IF EXISTS `btBudget`;
CREATE TABLE `btBudget` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `price` double DEFAULT NULL,
  `parentBudgetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

--
-- Daten für Tabelle `btBudget`
--

INSERT INTO `btBudget` (`id`, `name`, `description`, `price`, `parentBudgetId`) VALUES
(17, 'test', 'test', 300, NULL),
(18, 'test2', 'test2', 212, NULL),
(19, 'terst', 'test', 312, 17),
(20, 'asdf', 'asdf', 300, 19),
(21, 'asdf', 'asdf', 3132, 18),
(22, 'test', 'test', 213, 21);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btBudgetPosten`
--

DROP TABLE IF EXISTS `btBudgetPosten`;
CREATE TABLE `btBudgetPosten` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btContentFile`
--

DROP TABLE IF EXISTS `btContentFile`;
CREATE TABLE `btContentFile` (
  `bID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fID` int(10) unsigned DEFAULT NULL,
  `fileLinkText` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filePassword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`bID`),
  KEY `fID` (`fID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btContentImage`
--

DROP TABLE IF EXISTS `btContentImage`;
CREATE TABLE `btContentImage` (
  `bID` int(10) unsigned NOT NULL,
  `fID` int(10) unsigned DEFAULT '0',
  `fOnstateID` int(10) unsigned DEFAULT '0',
  `maxWidth` int(10) unsigned DEFAULT '0',
  `maxHeight` int(10) unsigned DEFAULT '0',
  `externalLink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `internalLinkCID` int(10) unsigned DEFAULT '0',
  `altText` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`bID`),
  KEY `fID` (`fID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `btContentImage`
--

INSERT INTO `btContentImage` (`bID`, `fID`, `fOnstateID`, `maxWidth`, `maxHeight`, `externalLink`, `internalLinkCID`, `altText`, `title`) VALUES
(110, 5, 0, 0, 0, '', 0, 'Blank Image', 'Blank Image'),
(125, 7, 0, 0, 0, '', 0, '', NULL),
(132, 4, 0, 0, 0, '', 0, '', NULL),
(139, 4, 0, 0, 0, '', 0, '', NULL),
(143, 5, 0, 0, 0, '', 0, '', NULL),
(146, 9, 0, 0, 0, '', 0, '', NULL),
(167, 16, 16, 0, 0, '', 0, '', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btContentLocal`
--

DROP TABLE IF EXISTS `btContentLocal`;
CREATE TABLE `btContentLocal` (
  `bID` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `btContentLocal`
--

INSERT INTO `btContentLocal` (`bID`, `content`) VALUES
(1, '<div style="padding: 40px; text-align: center"> <iframe width="853" height="480" src="//www.youtube.com/embed/VB-R71zk06U" frameborder="0" allowfullscreen></iframe>                                     </div>'),
(19, '                                                     <p><a href="{CCM:CID_172}" style="background-color: rgb(255, 255, 255);"><i class="fa fa-arrow-left"></i> Back to Careers</a></p>'),
(20, '<h3>Department</h3>'),
(22, '<h3>Location</h3>'),
(24, '<h3>Job Information</h3>'),
(26, '                                                     <br/><br/>'),
(43, '                                     <p>1234 SE StreetView</p><p>Suite 301</p><p>Portland, OR 98101</p><p><a href="{CCM:CID_158}">View on Google Maps</a></p>'),
(44, '                                     <p>© 2014 Elemental Theme</p>'),
(45, '                                                                          <p><a href="{CCM:CID_173}">FAQ / Help</a></p>                                     <p><a href="{CCM:CID_153}">Case Studies</a></p>                                     <p><a href="{CCM:CID_156}">Blog</a></p>                                     <p><a href="{CCM:CID_1}">Another Link</a></p>                                     '),
(46, '<a href="{CCM:CID_1}" id="footer-site-title">Elemental</a>'),
(50, '<a href="{CCM:CID_1}" id="header-site-title">Elemental</a>'),
(57, '<p style="text-align: center"><span class="title-caps-bold">Presenting your Business has never been so easy</span></p><p style="text-align: center;">Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing.</p><p style="text-align: center;">Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. </p>'),
(61, '<h5>Latest Blog Post</h5>'),
(62, '<h5>Now Open For Business</h5>'),
(66, '<p>  <span class="title-thin">We specialize in making your concepts a reality.</span>  </p>  <p>    Sed cursus facilisis dignissim. Aliquam rhoncus enim et pellentesque varius. Nulla sodales nibh lorem, sit amet imperdiet arcu commodo sit amet. Mauris sed scelerisque nisl. Ut auctor ipsum tellus, vel viverra massa elementum sit amet.  </p>  <p>    Sed adipiscing tempus sem eu molestie. Aenean laoreet pretium ante vitae ultrices. Aenean eu gravida magna, vel aliquet magna. In auctor convallis gravida.<br>  </p>  <br/>  <p>  <a href="{CCM:CID_158}"><span class="btn btn-success">Contact Us Today</span></a>  </p>'),
(67, '<p style="text-align: center"><span class="title-caps">Customizable footer area with accent class.</span></p>'),
(76, '<h3>Awesome Features</h3><p>Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. Sed consequat eleifend metus, vitae malesuada eros elementum sed. </p><h3>Guide Books</h3><p>Fusce risus felis, viverra et dignissim at, lobortis non est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet consectetur lacus. Vestibulum neque lectus, egestas non cursus vitae, aliquam at magna. Etiam aliquam, justo et varius eleifend, dui lectus egestas nunc, vel malesuada nisl purus nec metus. </p><h3>Admin Accounts</h3><p>Fusce risus felis, viverra et dignissim at, lobortis non est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet consectetur lacus. Vestibulum neque lectus, egestas non cursus vitae, aliquam at magna. Etiam aliquam, justo et varius eleifend, dui lectus egestas nunc, vel malesuada nisl purus nec metus. </p>'),
(77, '<h3>Support</h3><p>Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. Sed consequat eleifend metus, vitae malesuada eros elementum sed. </p><h3>Additional Options</h3><p>Fusce risus felis, viverra et dignissim at, lobortis non est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet consectetur lacus. Vestibulum neque lectus, egestas non cursus vitae, aliquam at magna. </p><p>Etiam aliquam, justo et varius eleifend, dui lectus egestas nunc, vel malesuada nisl purus nec metus. In gravida turpis a pharetra commodo. Donec non turpis vulputate, faucibus metus a, consectetur nunc. Morbi tortor nisi, hendrerit sed laoreet eget, fermentum et justo. Suspendisse potenti.</p>'),
(78, '<p style="text-align: center"><span class="title-caps">What Clients Are Saying About Us</span></p>'),
(85, '<blockquote>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tempus nibh a laoreet cursus. Phasellus malesuada vulputate bibendum. Ut vitae justo nisi. Sed consectetur vestibulum tortor, in bibendum diam lacinia vitae. Nullam volutpat risus quis orci consectetur adipiscing. In commodo vulputate arcu sit amet ornare. Vivamus ut iaculis velit.</blockquote><p>Pellentesque euismod lacus sed accumsan luctus. Suspendisse urna felis, lacinia vel tempor id, ultricies rutrum nisl. Nunc ultrices nulla et bibendum molestie. Phasellus porttitor sit amet libero vel fermentum. Sed sapien risus, eleifend vel hendrerit eu, porta vel tellus. Duis faucibus odio et magna varius, quis accumsan tellus vestibulum. Nam nunc nulla, convallis at elementum pharetra, adipiscing quis enim. Donec feugiat porttitor dolor, nec porttitor mi auctor eget. Fusce iaculis varius diam non dictum. Fusce elementum a nunc vel tincidunt. Morbi nec est elementum, vehicula odio nec, lobortis lacus. Nulla ultricies vitae nunc ut lacinia. Proin mattis felis sem, eu consectetur arcu varius et. Duis at lectus eu lorem elementum aliquet nec in elit. Vestibulum non metus ac risus adipiscing pellentesque sed sit amet lorem. Donec viverra, metus in varius pulvinar, augue nunc accumsan eros, a pulvinar est elit vitae nulla.</p><p>Duis non leo in enim laoreet pretium. Nullam vitae neque nec libero pharetra tempor at faucibus lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed imperdiet convallis arcu. Nam sollicitudin sollicitudin lacus non dictum. Aliquam erat volutpat. Nulla sapien quam, consequat non dui ut, eleifend sodales orci. Praesent quis lorem accumsan, volutpat lectus a, sollicitudin erat. Donec faucibus mi in sapien volutpat, ac auctor lorem mollis. Proin eget turpis non lacus bibendum porta non ac justo. Aliquam aliquam viverra lorem ac rutrum. In et sapien sit amet diam vestibulum cursus ut tristique tellus.</p><p>Ut in purus mi. Etiam ac aliquet ipsum. Pellentesque faucibus diam dui. Morbi a semper orci. Ut nec malesuada urna. Vestibulum aliquet ante ac lacus dictum, sit amet pulvinar leo laoreet. Maecenas ut est commodo, commodo quam nec, dignissim est. Quisque rutrum molestie nunc, sed mollis nulla volutpat et. Donec dignissim ornare augue eu aliquam. Aliquam in tincidunt velit. In at fermentum mauris, ut accumsan nisl. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p><p>Integer ac nulla at nisi sodales ullamcorper id in justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam pharetra elit odio, ac mattis turpis consequat ac. Pellentesque tincidunt sed enim nec auctor. Quisque varius, felis a hendrerit faucibus, nunc lorem varius nibh, vel dignissim velit dolor ut elit. Mauris ut vulputate neque. Donec at est vitae massa egestas fringilla. Praesent a tristique nibh. Nunc blandit dui risus, quis rhoncus nisi consectetur vel.</p>'),
(87, '<blockquote>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tempus nibh a laoreet cursus. Phasellus malesuada vulputate bibendum. Ut vitae justo nisi. Sed consectetur vestibulum tortor, in bibendum diam lacinia vitae. Nullam volutpat risus quis orci consectetur adipiscing. In commodo vulputate arcu sit amet ornare. Vivamus ut iaculis velit.</blockquote><p>Pellentesque euismod lacus sed accumsan luctus. Suspendisse urna felis, lacinia vel tempor id, ultricies rutrum nisl. Nunc ultrices nulla et bibendum molestie. Phasellus porttitor sit amet libero vel fermentum. Sed sapien risus, eleifend vel hendrerit eu, porta vel tellus. Duis faucibus odio et magna varius, quis accumsan tellus vestibulum. Nam nunc nulla, convallis at elementum pharetra, adipiscing quis enim. Donec feugiat porttitor dolor, nec porttitor mi auctor eget. Fusce iaculis varius diam non dictum. Fusce elementum a nunc vel tincidunt. Morbi nec est elementum, vehicula odio nec, lobortis lacus. Nulla ultricies vitae nunc ut lacinia. Proin mattis felis sem, eu consectetur arcu varius et. Duis at lectus eu lorem elementum aliquet nec in elit. Vestibulum non metus ac risus adipiscing pellentesque sed sit amet lorem. Donec viverra, metus in varius pulvinar, augue nunc accumsan eros, a pulvinar est elit vitae nulla.</p><p>Duis non leo in enim laoreet pretium. Nullam vitae neque nec libero pharetra tempor at faucibus lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed imperdiet convallis arcu. Nam sollicitudin sollicitudin lacus non dictum. Aliquam erat volutpat. Nulla sapien quam, consequat non dui ut, eleifend sodales orci. Praesent quis lorem accumsan, volutpat lectus a, sollicitudin erat. Donec faucibus mi in sapien volutpat, ac auctor lorem mollis. Proin eget turpis non lacus bibendum porta non ac justo. Aliquam aliquam viverra lorem ac rutrum. In et sapien sit amet diam vestibulum cursus ut tristique tellus.</p><p>Ut in purus mi. Etiam ac aliquet ipsum. Pellentesque faucibus diam dui. Morbi a semper orci. Ut nec malesuada urna. Vestibulum aliquet ante ac lacus dictum, sit amet pulvinar leo laoreet. Maecenas ut est commodo, commodo quam nec, dignissim est. Quisque rutrum molestie nunc, sed mollis nulla volutpat et. Donec dignissim ornare augue eu aliquam. Aliquam in tincidunt velit. In at fermentum mauris, ut accumsan nisl. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p><p>Integer ac nulla at nisi sodales ullamcorper id in justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam pharetra elit odio, ac mattis turpis consequat ac. Pellentesque tincidunt sed enim nec auctor. Quisque varius, felis a hendrerit faucibus, nunc lorem varius nibh, vel dignissim velit dolor ut elit. Mauris ut vulputate neque. Donec at est vitae massa egestas fringilla. Praesent a tristique nibh. Nunc blandit dui risus, quis rhoncus nisi consectetur vel.</p>'),
(89, '<blockquote>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tempus nibh a laoreet cursus. Phasellus malesuada vulputate bibendum. Ut vitae justo nisi. Sed consectetur vestibulum tortor, in bibendum diam lacinia vitae. Nullam volutpat risus quis orci consectetur adipiscing. In commodo vulputate arcu sit amet ornare. Vivamus ut iaculis velit.</blockquote><p>Pellentesque euismod lacus sed accumsan luctus. Suspendisse urna felis, lacinia vel tempor id, ultricies rutrum nisl. Nunc ultrices nulla et bibendum molestie. Phasellus porttitor sit amet libero vel fermentum. Sed sapien risus, eleifend vel hendrerit eu, porta vel tellus. Duis faucibus odio et magna varius, quis accumsan tellus vestibulum. Nam nunc nulla, convallis at elementum pharetra, adipiscing quis enim. Donec feugiat porttitor dolor, nec porttitor mi auctor eget. Fusce iaculis varius diam non dictum. Fusce elementum a nunc vel tincidunt. Morbi nec est elementum, vehicula odio nec, lobortis lacus. Nulla ultricies vitae nunc ut lacinia. Proin mattis felis sem, eu consectetur arcu varius et. Duis at lectus eu lorem elementum aliquet nec in elit. Vestibulum non metus ac risus adipiscing pellentesque sed sit amet lorem. Donec viverra, metus in varius pulvinar, augue nunc accumsan eros, a pulvinar est elit vitae nulla.</p><p>Duis non leo in enim laoreet pretium. Nullam vitae neque nec libero pharetra tempor at faucibus lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed imperdiet convallis arcu. Nam sollicitudin sollicitudin lacus non dictum. Aliquam erat volutpat. Nulla sapien quam, consequat non dui ut, eleifend sodales orci. Praesent quis lorem accumsan, volutpat lectus a, sollicitudin erat. Donec faucibus mi in sapien volutpat, ac auctor lorem mollis. Proin eget turpis non lacus bibendum porta non ac justo. Aliquam aliquam viverra lorem ac rutrum. In et sapien sit amet diam vestibulum cursus ut tristique tellus.</p><p>Ut in purus mi. Etiam ac aliquet ipsum. Pellentesque faucibus diam dui. Morbi a semper orci. Ut nec malesuada urna. Vestibulum aliquet ante ac lacus dictum, sit amet pulvinar leo laoreet. Maecenas ut est commodo, commodo quam nec, dignissim est. Quisque rutrum molestie nunc, sed mollis nulla volutpat et. Donec dignissim ornare augue eu aliquam. Aliquam in tincidunt velit. In at fermentum mauris, ut accumsan nisl. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p><p>Integer ac nulla at nisi sodales ullamcorper id in justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam pharetra elit odio, ac mattis turpis consequat ac. Pellentesque tincidunt sed enim nec auctor. Quisque varius, felis a hendrerit faucibus, nunc lorem varius nibh, vel dignissim velit dolor ut elit. Mauris ut vulputate neque. Donec at est vitae massa egestas fringilla. Praesent a tristique nibh. Nunc blandit dui risus, quis rhoncus nisi consectetur vel.</p>'),
(91, '<blockquote>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tempus nibh a laoreet cursus. Phasellus malesuada vulputate bibendum. Ut vitae justo nisi. Sed consectetur vestibulum tortor, in bibendum diam lacinia vitae. Nullam volutpat risus quis orci consectetur adipiscing. In commodo vulputate arcu sit amet ornare. Vivamus ut iaculis velit.</blockquote><p>Pellentesque euismod lacus sed accumsan luctus. Suspendisse urna felis, lacinia vel tempor id, ultricies rutrum nisl. Nunc ultrices nulla et bibendum molestie. Phasellus porttitor sit amet libero vel fermentum. Sed sapien risus, eleifend vel hendrerit eu, porta vel tellus. Duis faucibus odio et magna varius, quis accumsan tellus vestibulum. Nam nunc nulla, convallis at elementum pharetra, adipiscing quis enim. Donec feugiat porttitor dolor, nec porttitor mi auctor eget. Fusce iaculis varius diam non dictum. Fusce elementum a nunc vel tincidunt. Morbi nec est elementum, vehicula odio nec, lobortis lacus. Nulla ultricies vitae nunc ut lacinia. Proin mattis felis sem, eu consectetur arcu varius et. Duis at lectus eu lorem elementum aliquet nec in elit. Vestibulum non metus ac risus adipiscing pellentesque sed sit amet lorem. Donec viverra, metus in varius pulvinar, augue nunc accumsan eros, a pulvinar est elit vitae nulla.</p><p>Duis non leo in enim laoreet pretium. Nullam vitae neque nec libero pharetra tempor at faucibus lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed imperdiet convallis arcu. Nam sollicitudin sollicitudin lacus non dictum. Aliquam erat volutpat. Nulla sapien quam, consequat non dui ut, eleifend sodales orci. Praesent quis lorem accumsan, volutpat lectus a, sollicitudin erat. Donec faucibus mi in sapien volutpat, ac auctor lorem mollis. Proin eget turpis non lacus bibendum porta non ac justo. Aliquam aliquam viverra lorem ac rutrum. In et sapien sit amet diam vestibulum cursus ut tristique tellus.</p><p>Ut in purus mi. Etiam ac aliquet ipsum. Pellentesque faucibus diam dui. Morbi a semper orci. Ut nec malesuada urna. Vestibulum aliquet ante ac lacus dictum, sit amet pulvinar leo laoreet. Maecenas ut est commodo, commodo quam nec, dignissim est. Quisque rutrum molestie nunc, sed mollis nulla volutpat et. Donec dignissim ornare augue eu aliquam. Aliquam in tincidunt velit. In at fermentum mauris, ut accumsan nisl. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p><p>Integer ac nulla at nisi sodales ullamcorper id in justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam pharetra elit odio, ac mattis turpis consequat ac. Pellentesque tincidunt sed enim nec auctor. Quisque varius, felis a hendrerit faucibus, nunc lorem varius nibh, vel dignissim velit dolor ut elit. Mauris ut vulputate neque. Donec at est vitae massa egestas fringilla. Praesent a tristique nibh. Nunc blandit dui risus, quis rhoncus nisi consectetur vel.</p>'),
(93, '<blockquote>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tempus nibh a laoreet cursus. Phasellus malesuada vulputate bibendum. Ut vitae justo nisi. Sed consectetur vestibulum tortor, in bibendum diam lacinia vitae. Nullam volutpat risus quis orci consectetur adipiscing. In commodo vulputate arcu sit amet ornare. Vivamus ut iaculis velit.</blockquote><p>Pellentesque euismod lacus sed accumsan luctus. Suspendisse urna felis, lacinia vel tempor id, ultricies rutrum nisl. Nunc ultrices nulla et bibendum molestie. Phasellus porttitor sit amet libero vel fermentum. Sed sapien risus, eleifend vel hendrerit eu, porta vel tellus. Duis faucibus odio et magna varius, quis accumsan tellus vestibulum. Nam nunc nulla, convallis at elementum pharetra, adipiscing quis enim. Donec feugiat porttitor dolor, nec porttitor mi auctor eget. Fusce iaculis varius diam non dictum. Fusce elementum a nunc vel tincidunt. Morbi nec est elementum, vehicula odio nec, lobortis lacus. Nulla ultricies vitae nunc ut lacinia. Proin mattis felis sem, eu consectetur arcu varius et. Duis at lectus eu lorem elementum aliquet nec in elit. Vestibulum non metus ac risus adipiscing pellentesque sed sit amet lorem. Donec viverra, metus in varius pulvinar, augue nunc accumsan eros, a pulvinar est elit vitae nulla.</p><p>Duis non leo in enim laoreet pretium. Nullam vitae neque nec libero pharetra tempor at faucibus lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed imperdiet convallis arcu. Nam sollicitudin sollicitudin lacus non dictum. Aliquam erat volutpat. Nulla sapien quam, consequat non dui ut, eleifend sodales orci. Praesent quis lorem accumsan, volutpat lectus a, sollicitudin erat. Donec faucibus mi in sapien volutpat, ac auctor lorem mollis. Proin eget turpis non lacus bibendum porta non ac justo. Aliquam aliquam viverra lorem ac rutrum. In et sapien sit amet diam vestibulum cursus ut tristique tellus.</p><p>Ut in purus mi. Etiam ac aliquet ipsum. Pellentesque faucibus diam dui. Morbi a semper orci. Ut nec malesuada urna. Vestibulum aliquet ante ac lacus dictum, sit amet pulvinar leo laoreet. Maecenas ut est commodo, commodo quam nec, dignissim est. Quisque rutrum molestie nunc, sed mollis nulla volutpat et. Donec dignissim ornare augue eu aliquam. Aliquam in tincidunt velit. In at fermentum mauris, ut accumsan nisl. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p><p>Integer ac nulla at nisi sodales ullamcorper id in justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam pharetra elit odio, ac mattis turpis consequat ac. Pellentesque tincidunt sed enim nec auctor. Quisque varius, felis a hendrerit faucibus, nunc lorem varius nibh, vel dignissim velit dolor ut elit. Mauris ut vulputate neque. Donec at est vitae massa egestas fringilla. Praesent a tristique nibh. Nunc blandit dui risus, quis rhoncus nisi consectetur vel.</p>'),
(95, '<blockquote>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tempus nibh a laoreet cursus. Phasellus malesuada vulputate bibendum. Ut vitae justo nisi. Sed consectetur vestibulum tortor, in bibendum diam lacinia vitae. Nullam volutpat risus quis orci consectetur adipiscing. In commodo vulputate arcu sit amet ornare. Vivamus ut iaculis velit.</blockquote><p>Pellentesque euismod lacus sed accumsan luctus. Suspendisse urna felis, lacinia vel tempor id, ultricies rutrum nisl. Nunc ultrices nulla et bibendum molestie. Phasellus porttitor sit amet libero vel fermentum. Sed sapien risus, eleifend vel hendrerit eu, porta vel tellus. Duis faucibus odio et magna varius, quis accumsan tellus vestibulum. Nam nunc nulla, convallis at elementum pharetra, adipiscing quis enim. Donec feugiat porttitor dolor, nec porttitor mi auctor eget. Fusce iaculis varius diam non dictum. Fusce elementum a nunc vel tincidunt. Morbi nec est elementum, vehicula odio nec, lobortis lacus. Nulla ultricies vitae nunc ut lacinia. Proin mattis felis sem, eu consectetur arcu varius et. Duis at lectus eu lorem elementum aliquet nec in elit. Vestibulum non metus ac risus adipiscing pellentesque sed sit amet lorem. Donec viverra, metus in varius pulvinar, augue nunc accumsan eros, a pulvinar est elit vitae nulla.</p><p>Duis non leo in enim laoreet pretium. Nullam vitae neque nec libero pharetra tempor at faucibus lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed imperdiet convallis arcu. Nam sollicitudin sollicitudin lacus non dictum. Aliquam erat volutpat. Nulla sapien quam, consequat non dui ut, eleifend sodales orci. Praesent quis lorem accumsan, volutpat lectus a, sollicitudin erat. Donec faucibus mi in sapien volutpat, ac auctor lorem mollis. Proin eget turpis non lacus bibendum porta non ac justo. Aliquam aliquam viverra lorem ac rutrum. In et sapien sit amet diam vestibulum cursus ut tristique tellus.</p><p>Ut in purus mi. Etiam ac aliquet ipsum. Pellentesque faucibus diam dui. Morbi a semper orci. Ut nec malesuada urna. Vestibulum aliquet ante ac lacus dictum, sit amet pulvinar leo laoreet. Maecenas ut est commodo, commodo quam nec, dignissim est. Quisque rutrum molestie nunc, sed mollis nulla volutpat et. Donec dignissim ornare augue eu aliquam. Aliquam in tincidunt velit. In at fermentum mauris, ut accumsan nisl. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p><p>Integer ac nulla at nisi sodales ullamcorper id in justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam pharetra elit odio, ac mattis turpis consequat ac. Pellentesque tincidunt sed enim nec auctor. Quisque varius, felis a hendrerit faucibus, nunc lorem varius nibh, vel dignissim velit dolor ut elit. Mauris ut vulputate neque. Donec at est vitae massa egestas fringilla. Praesent a tristique nibh. Nunc blandit dui risus, quis rhoncus nisi consectetur vel.</p>'),
(111, '                                                     <p class="title-thin">Get in Touch</p><p>Sed cursus facilisis dignissim. Aliquam rhoncus enim et pellentesque varius. Nulla sodales nibh lorem, sit amet imperdiet arcu commodo sit amet.<br><br></p><p><a class="btn btn-success" href="{CCM:CID_158}">Contact Us</a></p>'),
(113, '<blockquote>Fusce volutpat sodales mauris quis dapibus. Maecenas convallis, libero eu ultrices interdum, leo mauris commodo diam, sed cursus sapien ligula nec leo.</blockquote><p>Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. Sed consequat eleifend metus, vitae malesuada eros elementum sed. Fusce risus felis, viverra et dignissim at, lobortis non est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet consectetur lacus. Vestibulum neque lectus, egestas non cursus vitae, aliquam at magna. Etiam aliquam, justo et varius eleifend, dui lectus egestas nunc, vel malesuada nisl purus nec metus. In gravida turpis a pharetra commodo. Donec non turpis vulputate, faucibus metus a, consectetur nunc. Morbi tortor nisi, hendrerit sed laoreet eget, fermentum et justo. Suspendisse potenti.</p><p><a href="{CCM:FID_DL_2}" data-concrete5-link-launch="lightbox" data-concrete5-link-type="image"><concrete-picture alt="" fid="2" /></a></p><h2>Heading 2</h2><p>Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. Sed consequat eleifend metus, vitae malesuada eros elementum sed. Fusce risus felis, viverra et dignissim at, lobortis non est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet consectetur lacus. Vestibulum neque lectus, egestas non cursus vitae, aliquam at magna. Etiam aliquam, justo et varius eleifend, dui lectus egestas nunc, vel malesuada nisl purus nec metus. In gravida turpis a pharetra commodo. Donec non turpis vulputate, faucibus metus a, consectetur nunc. Morbi tortor nisi, hendrerit sed laoreet eget, fermentum et justo. Suspendisse potenti.</p><h3>Heading 3</h3><p>Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. Quisque dignissim neque a ipsum sodales, mattis aliquam ante dictum. Vestibulum elementum pellentesque tortor ac congue. Mauris vel nibh id metus tincidunt eleifend. In interdum gravida ligula, at venenatis odio fermentum at. Donec dapibus enim lectus, quis venenatis tellus volutpat in. Nullam in velit tortor.</p><h3>Heading 3</h3><p>Donec blandit lectus nec neque ullamcorper rhoncus. Sed adipiscing tempus sem eu molestie. Aenean laoreet pretium ante vitae ultrices. Aenean eu gravida magna, vel aliquet magna. In auctor convallis gravida. Phasellus est erat, adipiscing nec lobortis quis, eleifend at sem. Curabitur fringilla viverra dolor, in rutrum ipsum rutrum sit amet. Vestibulum feugiat porttitor ipsum vel condimentum. Suspendisse at tempus libero. Sed eu tempor enim. Etiam convallis eleifend rutrum. Donec porta diam quis tellus feugiat dignissim. Cras posuere, massa eget laoreet laoreet, urna libero lobortis dolor, sed consequat elit urna eget massa. Donec aliquet pellentesque consectetur.</p>'),
(115, '<p>Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. Sed consequat eleifend metus, vitae malesuada eros elementum sed. Fusce risus felis, viverra et dignissim at, lobortis non est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p><p><span class="title-thin">CMS To the Rescue!</span></p><p>Nullam sit amet consectetur lacus. Vestibulum neque lectus, egestas non cursus vitae, aliquam at magna. Etiam aliquam, justo et varius eleifend, dui lectus egestas nunc, vel malesuada nisl purus nec metus. In gravida turpis a pharetra commodo. Donec non turpis vulputate, faucibus metus a, consectetur nunc. Morbi tortor nisi, hendrerit sed laoreet eget, fermentum et justo. Suspendisse potenti.</p><p><a href="http://www.concrete5.org">Learn more at concrete5.org </a><br></p>'),
(117, '<p>Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. Sed consequat eleifend metus, vitae malesuada eros elementum sed. Fusce risus felis, viverra et dignissim at, lobortis non est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet consectetur lacus. Vestibulum neque lectus, egestas non cursus vitae, aliquam at magna. Etiam aliquam, justo et varius eleifend, dui lectus egestas nunc, vel malesuada nisl purus nec metus. In gravida turpis a pharetra commodo. Donec non turpis vulputate, faucibus metus a, consectetur nunc. Morbi tortor nisi, hendrerit sed laoreet eget, fermentum et justo. Suspendisse potenti.</p><p><span class="title-caps-bold">Heading 3</span></p><p>Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. Quisque dignissim neque a ipsum sodales, mattis aliquam ante dictum. Vestibulum elementum pellentesque tortor ac congue. Mauris vel nibh id metus tincidunt eleifend. In interdum gravida ligula, at venenatis odio fermentum at. Donec dapibus enim lectus, quis venenatis tellus volutpat in. Nullam in velit tortor.</p><p><a href="{CCM:FID_DL_11}" data-concrete5-link-launch="lightbox" data-concrete5-link-type="image"><concrete-picture alt="" fid="11" /></a></p><p><span class="image-caption">Look at my beautiful image. Don''t you to look more?</span></p><p>Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. Quisque dignissim neque a ipsum sodales, mattis aliquam ante dictum. Vestibulum elementum pellentesque tortor ac congue. Mauris vel nibh id metus tincidunt eleifend. In interdum gravida ligula, at venenatis odio fermentum at. Donec dapibus enim lectus, quis venenatis tellus volutpat in. Nullam in velit tortor.</p>'),
(122, '                                                     <h5>Headquarters</h5><p>1234 SE Street View<br>Suite 301<br>Portland, OR 98101</p><h5>HOURS</h5><p> <strong>M-F</strong>:  10 AM - 7 PM<br><strong>Sat</strong>: Noon - Midnight<br><strong>Sun</strong>: Closed</p>'),
(126, '                                                     <h2>Choosing Us</h2><p>Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. Quisque dignissim neque a ipsum sodales, mattis aliquam ante dictum. Vestibulum elementum pellentesque tortor ac congue. Mauris vel nibh id metus tincidunt eleifend. In interdum gravida ligula, at venenatis odio fermentum at. Donec dapibus enim lectus, quis venenatis tellus volutpat in. Nullam in velit tortor.</p>'),
(127, '<h5>We would love to hear from you!</h5>'),
(129, '<p>This is my empty content block on my blank page.</p>'),
(133, '                                                     <blockquote>Fusce volutpat sodales mauris quis dapibus. Maecenas convallis, libero eu ultrices interdum.</blockquote>'),
(134, '                                                     <p>Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. </p><p><a href="http://www.yahoo.com">Quisque dignissim</a> neque a ipsum sodales, mattis aliquam ante dictum. Vestibulum elementum pellentesque tortor ac congue. Mauris vel nibh id metus tincidunt eleifend.</p>'),
(137, '                                                     <h1>Heading 1</h1><h2>Heading 2</h2><h3>Heading 3</h3><h4>Heading 4</h4><h5>Heading 5</h5><h6>Heading 6</h6>'),
(138, '                                                     <p>Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. Sed consequat eleifend metus, vitae malesuada eros elementum sed. Fusce risus felis, viverra et dignissim at, lobortis non est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet consectetur lacus. Vestibulum neque lectus, egestas non cursus vitae, aliquam at magna. Etiam aliquam, justo et varius eleifend, dui lectus egestas nunc, vel malesuada nisl purus nec metus. In gravida turpis a pharetra commodo. Donec non turpis vulputate, faucibus metus a, consectetur nunc. Morbi tortor nisi, hendrerit sed laoreet eget, fermentum et justo. Suspendisse potenti.<br><br><br></p>'),
(140, '                                                     <p><br><br>Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. Sed consequat eleifend metus, vitae malesuada eros elementum sed. Fusce risus felis, viverra et dignissim at, lobortis non est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet consectetur lacus. Vestibulum neque lectus, egestas non cursus vitae, aliquam at magna. Etiam aliquam, justo et varius eleifend, dui lectus egestas nunc, vel malesuada nisl purus nec metus. In gravida turpis a pharetra commodo. Donec non turpis vulputate, faucibus metus a, consectetur nunc. Morbi tortor nisi, hendrerit sed laoreet eget, fermentum et justo. Suspendisse potenti.</p>'),
(144, '                                                     <p class="title-thin">Get in Touch</p><p>Sed cursus facilisis dignissim. Aliquam rhoncus enim et pellentesque varius. Nulla sodales nibh lorem, sit amet imperdiet arcu commodo sit amet.<br><br></p><p><a class="btn btn-success" href="{CCM:CID_158}">Contact Us</a></p>'),
(147, '<div style="height: 50px"></div>'),
(157, '                                                     <div class="title-thin">Open Positions</div>'),
(159, '                                     <p>Quisque accumsan leo sit amet neque pretium consectetur. Sed blandit nulla at justo volutpat rhoncus. Sed risus orci, luctus sit amet fringilla faucibus, congue nec dui. Phasellus mattis lobortis magna sed dapibus. Donec sagittis nunc sed accumsan eleifend. Ut porttitor sapien eu nisl volutpat, vitae interdum est mollis. Sed laoreet sit amet elit in eleifend. Sed a tincidunt velit, nec posuere urna. In eget metus non est varius viverra. Quisque accumsan odio sem, in consequat nunc lobortis ac.</p><p>Cras dignissim nulla ut euismod adipiscing. Mauris non eros sem. Cras at lacinia nulla. Maecenas nec magna arcu. Aenean iaculis, augue sed pretium semper, odio tellus volutpat risus, quis consectetur nibh mauris ut odio. Integer convallis, augue a accumsan condimentum, sem nisl congue lorem, consectetur lacinia neque tortor eu neque. Aenean convallis arcu vitae enim dignissim vestibulum. Phasellus tincidunt dolor id enim gravida ullamcorper. Nullam ut lorem auctor, congue quam non, auctor arcu. Morbi ac aliquam ipsum, at aliquet ligula.</p><p>Cras adipiscing tellus non nulla suscipit congue. Pellentesque id neque euismod, elementum augue vel, volutpat turpis. Pellentesque sit amet tortor non lorem hendrerit pellentesque ac in nisi. Sed aliquet tincidunt arcu, eu lacinia lorem fringilla id. Integer ut ornare orci. Donec scelerisque vulputate est a condimentum. Morbi tellus sapien, vehicula vel ipsum non, luctus ullamcorper mi. Phasellus felis tortor, egestas quis felis sit amet, malesuada auctor nibh. Sed mollis mi sit amet tristique scelerisque. Cras elementum mauris urna, ullamcorper consectetur orci vehicula ut.</p>'),
(160, '                                     <p>Quisque accumsan leo sit amet neque pretium consectetur. Sed blandit nulla at justo volutpat rhoncus. Sed risus orci, luctus sit amet fringilla faucibus, congue nec dui. Phasellus mattis lobortis magna sed dapibus. Donec sagittis nunc sed accumsan eleifend. Ut porttitor sapien eu nisl volutpat, vitae interdum est mollis. Sed laoreet sit amet elit in eleifend. Sed a tincidunt velit, nec posuere urna. In eget metus non est varius viverra. Quisque accumsan odio sem, in consequat nunc lobortis ac.</p><p>Cras dignissim nulla ut euismod adipiscing. Mauris non eros sem. Cras at lacinia nulla. Maecenas nec magna arcu. Aenean iaculis, augue sed pretium semper, odio tellus volutpat risus, quis consectetur nibh mauris ut odio. Integer convallis, augue a accumsan condimentum, sem nisl congue lorem, consectetur lacinia neque tortor eu neque. Aenean convallis arcu vitae enim dignissim vestibulum. Phasellus tincidunt dolor id enim gravida ullamcorper. Nullam ut lorem auctor, congue quam non, auctor arcu. Morbi ac aliquam ipsum, at aliquet ligula.</p><p>Cras adipiscing tellus non nulla suscipit congue. Pellentesque id neque euismod, elementum augue vel, volutpat turpis. Pellentesque sit amet tortor non lorem hendrerit pellentesque ac in nisi. Sed aliquet tincidunt arcu, eu lacinia lorem fringilla id. Integer ut ornare orci. Donec scelerisque vulputate est a condimentum. Morbi tellus sapien, vehicula vel ipsum non, luctus ullamcorper mi. Phasellus felis tortor, egestas quis felis sit amet, malesuada auctor nibh. Sed mollis mi sit amet tristique scelerisque. Cras elementum mauris urna, ullamcorper consectetur orci vehicula ut.</p>'),
(168, '<p><span class="title-caps-bold"><span style="color: rgb(79, 97, 40);">Pfadi Gryfenberg</span></span></p>'),
(171, '<p>Das isch en Text uf de siite vo de biber</p>'),
(172, '<p>dws isch&nbsp; en andere text</p>'),
(173, '<p>dws isch&nbsp; en andere textkjasdhcavsd</p>'),
(184, '<p><span class="title-caps-bold"><span style="color: rgb(79, 97, 40);">Gryfenberg</span></span></p>'),
(192, '<p><span class="title-caps-bold"><span style="color: rgb(79, 97, 40);">Gryfenberg</span></span></p>'),
(193, '<p><span class="title-caps-bold"><span style="color: rgb(79, 97, 40);"><a href="{CCM:CID_1}" data-concrete5-link-type="ajax">Gryfenberg</a></span></span></p>'),
(194, '<p>Uebung Biber</p>'),
(195, '<p>Uebung Wölf</p>'),
(196, '<p>Uebung Pfadi</p>');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btCoreAreaLayout`
--

DROP TABLE IF EXISTS `btCoreAreaLayout`;
CREATE TABLE `btCoreAreaLayout` (
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `arLayoutID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bID`),
  KEY `arLayoutID` (`arLayoutID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `btCoreAreaLayout`
--

INSERT INTO `btCoreAreaLayout` (`bID`, `arLayoutID`) VALUES
(36, 1),
(52, 2),
(60, 3),
(63, 4),
(69, 5),
(75, 6),
(79, 7),
(97, 8),
(101, 9),
(109, 10),
(120, 11),
(124, 12),
(131, 13),
(136, 14),
(142, 15),
(148, 16),
(156, 17),
(170, 18);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btCoreConversation`
--

DROP TABLE IF EXISTS `btCoreConversation`;
CREATE TABLE `btCoreConversation` (
  `bID` int(10) unsigned NOT NULL,
  `cnvID` int(11) DEFAULT NULL,
  `enablePosting` int(11) DEFAULT '1',
  `paginate` tinyint(1) NOT NULL DEFAULT '1',
  `itemsPerPage` smallint(5) unsigned NOT NULL DEFAULT '50',
  `displayMode` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'threaded',
  `orderBy` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'date_desc',
  `enableOrdering` tinyint(1) NOT NULL DEFAULT '1',
  `enableCommentRating` tinyint(1) NOT NULL DEFAULT '1',
  `displayPostingForm` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'top',
  `addMessageLabel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dateFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `customDateFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insertNewMessages` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'top',
  PRIMARY KEY (`bID`),
  KEY `cnvID` (`cnvID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `btCoreConversation`
--

INSERT INTO `btCoreConversation` (`bID`, `cnvID`, `enablePosting`, `paginate`, `itemsPerPage`, `displayMode`, `orderBy`, `enableOrdering`, `enableCommentRating`, `displayPostingForm`, `addMessageLabel`, `dateFormat`, `customDateFormat`, `insertNewMessages`) VALUES
(16, 1, 1, 1, 50, 'threaded', 'date_asc', 0, 1, 'top', 'Add Message', 'default', '', 'top'),
(112, 2, 1, 1, 50, 'threaded', 'date_asc', 0, 1, 'top', 'Add Message', 'default', '', 'top'),
(114, 3, 1, 1, 50, 'threaded', 'date_asc', 0, 1, 'top', 'Add Message', 'default', '', 'top'),
(116, 4, 1, 1, 50, 'threaded', 'date_asc', 0, 1, 'top', 'Add Message', 'default', '', 'top'),
(163, 5, 1, 1, 50, 'threaded', 'date_asc', 1, 1, 'top', 'Nachricht hinzufügen', 'default', '', 'top');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btCorePageTypeComposerControlOutput`
--

DROP TABLE IF EXISTS `btCorePageTypeComposerControlOutput`;
CREATE TABLE `btCorePageTypeComposerControlOutput` (
  `bID` int(10) unsigned NOT NULL,
  `ptComposerOutputControlID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bID`),
  KEY `ptComposerOutputControlID` (`ptComposerOutputControlID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `btCorePageTypeComposerControlOutput`
--

INSERT INTO `btCorePageTypeComposerControlOutput` (`bID`, `ptComposerOutputControlID`) VALUES
(10, 1),
(25, 2),
(28, 3),
(32, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btCoreScrapbookDisplay`
--

DROP TABLE IF EXISTS `btCoreScrapbookDisplay`;
CREATE TABLE `btCoreScrapbookDisplay` (
  `bID` int(10) unsigned NOT NULL,
  `bOriginalID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bID`),
  KEY `bOriginalID` (`bOriginalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btCoreStackDisplay`
--

DROP TABLE IF EXISTS `btCoreStackDisplay`;
CREATE TABLE `btCoreStackDisplay` (
  `bID` int(10) unsigned NOT NULL,
  `stID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bID`),
  KEY `stID` (`stID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btDashboardNewsflowLatest`
--

DROP TABLE IF EXISTS `btDashboardNewsflowLatest`;
CREATE TABLE `btDashboardNewsflowLatest` (
  `bID` int(10) unsigned NOT NULL,
  `slot` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `btDashboardNewsflowLatest`
--

INSERT INTO `btDashboardNewsflowLatest` (`bID`, `slot`) VALUES
(4, 'A'),
(5, 'B'),
(8, 'C');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btDateNavigation`
--

DROP TABLE IF EXISTS `btDateNavigation`;
CREATE TABLE `btDateNavigation` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filterByParent` tinyint(1) DEFAULT '0',
  `redirectToResults` tinyint(1) DEFAULT '0',
  `cParentID` int(10) unsigned NOT NULL DEFAULT '0',
  `cTargetID` int(10) unsigned NOT NULL DEFAULT '0',
  `ptID` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `btDateNavigation`
--

INSERT INTO `btDateNavigation` (`bID`, `title`, `filterByParent`, `redirectToResults`, `cParentID`, `cTargetID`, `ptID`) VALUES
(39, 'Archives', 1, 0, 156, 0, 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btEventInGroup`
--

DROP TABLE IF EXISTS `btEventInGroup`;
CREATE TABLE `btEventInGroup` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventID` int(11) DEFAULT NULL,
  `groupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Daten für Tabelle `btEventInGroup`
--

INSERT INTO `btEventInGroup` (`ID`, `eventID`, `groupID`) VALUES
(9, 8, 3),
(10, 0, 3),
(11, 9, 3),
(12, 9, 3),
(13, 9, 3),
(14, 9, 3),
(15, 9, 3),
(16, 9, 3),
(17, 9, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btEvents`
--

DROP TABLE IF EXISTS `btEvents`;
CREATE TABLE `btEvents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_from` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `date_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `time_from` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `time_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `infofile` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `registerfile` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `testselect` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `testlink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Daten für Tabelle `btEvents`
--

INSERT INTO `btEvents` (`id`, `date_from`, `date_to`, `time_from`, `time_to`, `title`, `description`, `infofile`, `registerfile`, `testselect`, `testlink`) VALUES
(9, '16.09.2015', '', '', '', '', '', '0', '0', '', '3'),
(10, '', '', '', '', '', '', '0', '0', '', '3'),
(11, NULL, '', '', '', '', '', '0', '0', '', '3'),
(13, NULL, '', '', '', '', '', '0', '0', '', '3');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btExternalForm`
--

DROP TABLE IF EXISTS `btExternalForm`;
CREATE TABLE `btExternalForm` (
  `bID` int(10) unsigned NOT NULL,
  `filename` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btFaq`
--

DROP TABLE IF EXISTS `btFaq`;
CREATE TABLE `btFaq` (
  `bID` int(10) unsigned NOT NULL,
  `blockTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `btFaq`
--

INSERT INTO `btFaq` (`bID`, `blockTitle`) VALUES
(162, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btFaqEntries`
--

DROP TABLE IF EXISTS `btFaqEntries`;
CREATE TABLE `btFaqEntries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bID` int(10) unsigned DEFAULT NULL,
  `linkTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `bID` (`bID`,`sortOrder`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Daten für Tabelle `btFaqEntries`
--

INSERT INTO `btFaqEntries` (`id`, `bID`, `linkTitle`, `title`, `sortOrder`, `description`) VALUES
(4, 162, 'What are page versions?', 'What are page versions?', 0, '\n                                    Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. '),
(5, 162, 'How do I add more people as editors in my website?', 'How do I add more people as editors in my website?', 1, '\n                                    Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. ');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btFeature`
--

DROP TABLE IF EXISTS `btFeature`;
CREATE TABLE `btFeature` (
  `bID` int(10) unsigned NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paragraph` text COLLATE utf8_unicode_ci,
  `externalLink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `internalLinkCID` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `btFeature`
--

INSERT INTO `btFeature` (`bID`, `icon`, `title`, `paragraph`, `externalLink`, `internalLinkCID`) VALUES
(53, 'pencil', 'Easy to Edit', '                                                    Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. ', '', 0),
(54, 'eye', 'Pixel Perfect', '                                                    Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. ', '', 0),
(55, 'youtube-play', 'Media Rich', '                                                    Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. ', '', 0),
(70, 'star', 'Quality', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sodales non leo id aliquet.', '', 0),
(71, 'tint', 'Design', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sodales non leo id aliquet.', '', 0),
(72, 'cog', 'Development', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sodales non leo id aliquet.', '', 0),
(73, 'lock', 'Security', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sodales non leo id aliquet.', '', 0),
(149, 'home', 'Welcome Home', '\n                                                    Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan.', '', 0),
(150, 'user', 'Great Workers', '\n                                                    Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan.', '', 0),
(151, 'flag', 'Amazing Location', '\n                                                    Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan.', '', 0),
(152, 'clock-o', 'Paid Time Off', '\n                                                    Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan.', '', 0),
(153, 'star', 'No Meetings', '\n                                                    Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan.', '', 0),
(154, 'beer', 'Free Drinks', '\n                                                    Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan.', '', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btForm`
--

DROP TABLE IF EXISTS `btForm`;
CREATE TABLE `btForm` (
  `bID` int(10) unsigned NOT NULL,
  `questionSetId` int(10) unsigned DEFAULT '0',
  `surveyName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thankyouMsg` text COLLATE utf8_unicode_ci,
  `notifyMeOnSubmission` tinyint(1) NOT NULL DEFAULT '0',
  `recipientEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayCaptcha` int(11) DEFAULT '1',
  `redirectCID` int(11) DEFAULT '0',
  `addFilesToSet` int(11) DEFAULT '0',
  PRIMARY KEY (`bID`),
  KEY `questionSetIdForeign` (`questionSetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `btForm`
--

INSERT INTO `btForm` (`bID`, `questionSetId`, `surveyName`, `thankyouMsg`, `notifyMeOnSubmission`, `recipientEmail`, `displayCaptcha`, `redirectCID`, `addFilesToSet`) VALUES
(128, 1428345990, 'Contact Us', 'Thanks!', 0, '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btFormAnswers`
--

DROP TABLE IF EXISTS `btFormAnswers`;
CREATE TABLE `btFormAnswers` (
  `aID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asID` int(10) unsigned DEFAULT '0',
  `msqID` int(10) unsigned DEFAULT '0',
  `answer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `answerLong` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`aID`),
  KEY `asID` (`asID`),
  KEY `msqID` (`msqID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btFormAnswerSet`
--

DROP TABLE IF EXISTS `btFormAnswerSet`;
CREATE TABLE `btFormAnswerSet` (
  `asID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionSetId` int(10) unsigned DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uID` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`asID`),
  KEY `questionSetId` (`questionSetId`),
  KEY `uID` (`uID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btFormQuestions`
--

DROP TABLE IF EXISTS `btFormQuestions`;
CREATE TABLE `btFormQuestions` (
  `qID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msqID` int(10) unsigned DEFAULT '0',
  `bID` int(10) unsigned DEFAULT '0',
  `questionSetId` int(10) unsigned DEFAULT '0',
  `question` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inputType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8_unicode_ci,
  `position` int(10) unsigned DEFAULT '1000',
  `width` int(10) unsigned DEFAULT '50',
  `height` int(10) unsigned DEFAULT '3',
  `required` int(11) DEFAULT '0',
  PRIMARY KEY (`qID`),
  KEY `questionSetId` (`questionSetId`),
  KEY `msqID` (`msqID`),
  KEY `bID` (`bID`,`questionSetId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=27 ;

--
-- Daten für Tabelle `btFormQuestions`
--

INSERT INTO `btFormQuestions` (`qID`, `msqID`, `bID`, `questionSetId`, `question`, `inputType`, `options`, `position`, `width`, `height`, `required`) VALUES
(19, 1, 128, 1428345990, 'First Name', 'field', '', 0, 50, 3, 1),
(20, 2, 128, 1428345990, 'Last Name', 'field', '', 0, 50, 3, 1),
(21, 3, 128, 1428345990, 'Email Address', 'email', 'a:1:{s:22:"send_notification_from";i:0;}', 0, 50, 3, 1),
(25, 4, 128, 1428345990, 'Subject', 'select', '\n                                                    I love your work.%%Great website.%%Check out this cool thing I found.%%Other.', 0, 50, 3, 0),
(26, 5, 128, 1428345990, 'Message', 'text', '', 0, 50, 3, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btGoogleMap`
--

DROP TABLE IF EXISTS `btGoogleMap`;
CREATE TABLE `btGoogleMap` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `zoom` smallint(6) DEFAULT NULL,
  `width` varchar(8) COLLATE utf8_unicode_ci DEFAULT '100%',
  `height` varchar(8) COLLATE utf8_unicode_ci DEFAULT '400px',
  `scrollwheel` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `btGoogleMap`
--

INSERT INTO `btGoogleMap` (`bID`, `title`, `location`, `latitude`, `longitude`, `zoom`, `width`, `height`, `scrollwheel`) VALUES
(121, '', '1200 NW Naito Pkwy, Portland, OR, United States', 45.5313254, -122.6763493, 14, '100%', '400px', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btImageSlider`
--

DROP TABLE IF EXISTS `btImageSlider`;
CREATE TABLE `btImageSlider` (
  `bID` int(10) unsigned NOT NULL,
  `navigationType` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `btImageSlider`
--

INSERT INTO `btImageSlider` (`bID`, `navigationType`) VALUES
(51, 1),
(84, 0),
(86, 0),
(88, 0),
(90, 0),
(92, 0),
(94, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btImageSliderEntries`
--

DROP TABLE IF EXISTS `btImageSliderEntries`;
CREATE TABLE `btImageSliderEntries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bID` int(10) unsigned DEFAULT NULL,
  `cID` int(10) unsigned DEFAULT '0',
  `fID` int(10) unsigned DEFAULT '0',
  `linkURL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `internalLinkCID` int(10) unsigned DEFAULT '0',
  `title` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `sortOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Daten für Tabelle `btImageSliderEntries`
--

INSERT INTO `btImageSliderEntries` (`id`, `bID`, `cID`, `fID`, `linkURL`, `internalLinkCID`, `title`, `description`, `sortOrder`) VALUES
(1, 51, 0, 13, '', 0, 'Stand Out on the Web', '                                    <p>Share your business with an impressive, yet minimal presentation. Let your customers understand your web presence through elegance and clarity.</p>', 0),
(2, 51, 0, 14, '', 0, 'A Simple Image Slider', '                                    <p>This image slider can have any content that you want in it.</p>', 1),
(3, 84, 0, 16, '', 0, '', '', 0),
(4, 84, 0, 15, '', 0, '', '', 1),
(5, 84, 0, 12, '', 0, '', '', 2),
(6, 86, 0, 16, '', 0, '', '', 0),
(7, 86, 0, 15, '', 0, '', '', 1),
(8, 86, 0, 12, '', 0, '', '', 2),
(9, 88, 0, 16, '', 0, '', '', 0),
(10, 88, 0, 15, '', 0, '', '', 1),
(11, 88, 0, 12, '', 0, '', '', 2),
(12, 90, 0, 16, '', 0, '', '', 0),
(13, 90, 0, 15, '', 0, '', '', 1),
(14, 90, 0, 12, '', 0, '', '', 2),
(15, 92, 0, 16, '', 0, '', '', 0),
(16, 92, 0, 15, '', 0, '', '', 1),
(17, 92, 0, 12, '', 0, '', '', 2),
(18, 94, 0, 16, '', 0, '', '', 0),
(19, 94, 0, 15, '', 0, '', '', 1),
(20, 94, 0, 12, '', 0, '', '', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btNavigation`
--

DROP TABLE IF EXISTS `btNavigation`;
CREATE TABLE `btNavigation` (
  `bID` int(10) unsigned NOT NULL,
  `orderBy` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'alpha_asc',
  `displayPages` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'top',
  `displayPagesCID` int(10) unsigned NOT NULL DEFAULT '1',
  `displayPagesIncludeSelf` tinyint(1) NOT NULL DEFAULT '0',
  `displaySubPages` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'none',
  `displaySubPageLevels` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'none',
  `displaySubPageLevelsNum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `displayUnavailablePages` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `btNavigation`
--

INSERT INTO `btNavigation` (`bID`, `orderBy`, `displayPages`, `displayPagesCID`, `displayPagesIncludeSelf`, `displaySubPages`, `displaySubPageLevels`, `displaySubPageLevelsNum`, `displayUnavailablePages`) VALUES
(48, 'display_asc', 'top', 0, 0, 'all', 'custom', 1, 0),
(169, 'display_asc', 'top', 0, 0, 'all', 'all', 1, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btNextPrevious`
--

DROP TABLE IF EXISTS `btNextPrevious`;
CREATE TABLE `btNextPrevious` (
  `bID` int(10) unsigned NOT NULL,
  `nextLabel` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `previousLabel` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parentLabel` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loopSequence` int(11) DEFAULT '1',
  `excludeSystemPages` int(11) DEFAULT '1',
  `orderBy` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'display_asc',
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `btNextPrevious`
--

INSERT INTO `btNextPrevious` (`bID`, `nextLabel`, `previousLabel`, `parentLabel`, `loopSequence`, `excludeSystemPages`, `orderBy`) VALUES
(11, 'Next Post', 'Last Post', '', 0, 1, 'chrono_desc');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btPageAttributeDisplay`
--

DROP TABLE IF EXISTS `btPageAttributeDisplay`;
CREATE TABLE `btPageAttributeDisplay` (
  `bID` int(10) unsigned NOT NULL,
  `attributeHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attributeTitleText` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayTag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateFormat` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'div',
  `thumbnailHeight` int(10) unsigned DEFAULT NULL,
  `thumbnailWidth` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `btPageAttributeDisplay`
--

INSERT INTO `btPageAttributeDisplay` (`bID`, `attributeHandle`, `attributeTitleText`, `displayTag`, `dateFormat`, `thumbnailHeight`, `thumbnailWidth`) VALUES
(21, 'job_posting_department', '', 'p', 'm/d/y h:i:a', 250, 250),
(23, 'job_location', '', 'p', 'm/d/y h:i:a', 250, 250),
(29, 'project_client', 'Client:', 'div', 'm/d/y h:i:a', 250, 250),
(30, 'project_tasks', 'Task:', 'div', 'm/d/y h:i:a', 250, 250),
(31, 'project_skills', 'Skills:', 'div', 'm/d/y h:i:a', 250, 250);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btPageList`
--

DROP TABLE IF EXISTS `btPageList`;
CREATE TABLE `btPageList` (
  `bID` int(10) unsigned NOT NULL,
  `num` smallint(5) unsigned NOT NULL,
  `orderBy` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cParentID` int(10) unsigned NOT NULL DEFAULT '1',
  `cThis` tinyint(1) NOT NULL DEFAULT '0',
  `useButtonForLink` tinyint(1) NOT NULL DEFAULT '0',
  `buttonLinkText` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pageListTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `relatedTopicAttributeKeyHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `includeName` tinyint(1) NOT NULL DEFAULT '1',
  `includeDescription` tinyint(1) NOT NULL DEFAULT '1',
  `includeDate` tinyint(1) NOT NULL DEFAULT '0',
  `includeAllDescendents` tinyint(1) NOT NULL DEFAULT '0',
  `paginate` tinyint(1) NOT NULL DEFAULT '0',
  `displayAliases` tinyint(1) NOT NULL DEFAULT '1',
  `enableExternalFiltering` tinyint(1) NOT NULL DEFAULT '0',
  `filterByRelated` tinyint(1) NOT NULL DEFAULT '0',
  `ptID` smallint(5) unsigned DEFAULT NULL,
  `pfID` int(11) DEFAULT '0',
  `truncateSummaries` int(11) DEFAULT '0',
  `displayFeaturedOnly` tinyint(1) DEFAULT '0',
  `noResultsMessage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayThumbnail` tinyint(1) DEFAULT '0',
  `truncateChars` int(11) DEFAULT '128',
  PRIMARY KEY (`bID`),
  KEY `ptID` (`ptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `btPageList`
--

INSERT INTO `btPageList` (`bID`, `num`, `orderBy`, `cParentID`, `cThis`, `useButtonForLink`, `buttonLinkText`, `pageListTitle`, `relatedTopicAttributeKeyHandle`, `includeName`, `includeDescription`, `includeDate`, `includeAllDescendents`, `paginate`, `displayAliases`, `enableExternalFiltering`, `filterByRelated`, `ptID`, `pfID`, `truncateSummaries`, `displayFeaturedOnly`, `noResultsMessage`, `displayThumbnail`, `truncateChars`) VALUES
(14, 3, 'random', 156, 0, 0, NULL, 'Related Posts', 'blog_entry_topics', 1, 0, 0, 0, 0, 0, 0, 1, 6, 0, 0, 0, NULL, 0, 0),
(18, 0, 'chrono_desc', 172, 0, 0, NULL, 'Open Positions', NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(34, 3, 'random', 0, 0, 0, NULL, 'Related Projects', 'project_topics', 1, 0, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 'No related projects found.', 0, 0),
(37, 10, 'chrono_desc', 0, 0, 0, '', NULL, NULL, 1, 1, 1, 0, 1, 0, 1, 0, 6, 1, 0, 0, 'No posts to this blog.', 0, 0),
(42, 0, 'chrono_desc', 0, 0, 0, '', NULL, NULL, 1, 0, 0, 0, 1, 0, 1, 0, 8, 0, 0, 0, 'No projects found.', 1, 0),
(58, 3, 'chrono_desc', 0, 0, 1, 'View Project', NULL, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, 1, '', 1, 0),
(64, 1, 'chrono_desc', 0, 0, 0, '', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, '', 1, 0),
(65, 1, 'display_asc', 0, 0, 0, '', NULL, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, '', 0, 0),
(158, 0, 'chrono_desc', 172, 1, 1, 'Apply Now', NULL, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btPageTitle`
--

DROP TABLE IF EXISTS `btPageTitle`;
CREATE TABLE `btPageTitle` (
  `bID` int(10) unsigned NOT NULL,
  `useCustomTitle` int(10) unsigned DEFAULT '0',
  `titleText` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `btPageTitle`
--

INSERT INTO `btPageTitle` (`bID`, `useCustomTitle`, `titleText`) VALUES
(9, 0, '[Page Title]'),
(17, 0, '[Page Title]'),
(27, 0, '[Page Title]'),
(35, 0, '[Page Title]'),
(40, 0, '[Page Title]'),
(68, 1, 'Our Expertise'),
(96, 0, ''),
(119, 0, ''),
(130, 0, ''),
(145, 1, 'Work with Us'),
(161, 0, 'Frequently Asked Questions');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btQuittungen`
--

DROP TABLE IF EXISTS `btQuittungen`;
CREATE TABLE `btQuittungen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `price` double DEFAULT NULL,
  `quittungfoto` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `groupID` int(11) DEFAULT NULL,
  `budgetID` int(11) DEFAULT NULL,
  `budgetposten` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btQUittunginBudgetPosten`
--

DROP TABLE IF EXISTS `btQUittunginBudgetPosten`;
CREATE TABLE `btQUittunginBudgetPosten` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quittungID` int(11) DEFAULT NULL,
  `budgetPostenID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btRssDisplay`
--

DROP TABLE IF EXISTS `btRssDisplay`;
CREATE TABLE `btRssDisplay` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateFormat` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemsToDisplay` int(10) unsigned DEFAULT '5',
  `showSummary` tinyint(1) NOT NULL DEFAULT '1',
  `launchInNewWindow` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btSearch`
--

DROP TABLE IF EXISTS `btSearch`;
CREATE TABLE `btSearch` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buttonText` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baseSearchPath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postTo_cID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resultsURL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `btSearch`
--

INSERT INTO `btSearch` (`bID`, `title`, `buttonText`, `baseSearchPath`, `postTo_cID`, `resultsURL`) VALUES
(49, '', '', '', '157', ''),
(118, 'Search', 'Search', '', '', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btShareThisPage`
--

DROP TABLE IF EXISTS `btShareThisPage`;
CREATE TABLE `btShareThisPage` (
  `btShareThisPageID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bID` int(10) unsigned DEFAULT '0',
  `service` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayOrder` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`btShareThisPageID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Daten für Tabelle `btShareThisPage`
--

INSERT INTO `btShareThisPage` (`btShareThisPageID`, `bID`, `service`, `displayOrder`) VALUES
(1, 12, 'facebook', 0),
(2, 12, 'twitter', 1),
(3, 12, 'linkedin', 2),
(4, 12, 'email', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btSocialLinks`
--

DROP TABLE IF EXISTS `btSocialLinks`;
CREATE TABLE `btSocialLinks` (
  `btSocialLinkID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bID` int(10) unsigned DEFAULT '0',
  `slID` int(10) unsigned DEFAULT '0',
  `displayOrder` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`btSocialLinkID`),
  KEY `bID` (`bID`,`displayOrder`),
  KEY `slID` (`slID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `btSocialLinks`
--

INSERT INTO `btSocialLinks` (`btSocialLinkID`, `bID`, `slID`, `displayOrder`) VALUES
(1, 47, 3, 0),
(2, 47, 2, 1),
(3, 47, 1, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btSurvey`
--

DROP TABLE IF EXISTS `btSurvey`;
CREATE TABLE `btSurvey` (
  `bID` int(10) unsigned NOT NULL,
  `question` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `requiresRegistration` int(11) DEFAULT '0',
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `btSurvey`
--

INSERT INTO `btSurvey` (`bID`, `question`, `requiresRegistration`) VALUES
(186, 'test', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btSurveyOptions`
--

DROP TABLE IF EXISTS `btSurveyOptions`;
CREATE TABLE `btSurveyOptions` (
  `optionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bID` int(11) DEFAULT NULL,
  `optionName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayOrder` int(11) DEFAULT '0',
  PRIMARY KEY (`optionID`),
  KEY `bID` (`bID`,`displayOrder`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `btSurveyOptions`
--

INSERT INTO `btSurveyOptions` (`optionID`, `bID`, `optionName`, `displayOrder`) VALUES
(1, 186, 'test', 0),
(2, 186, 'test', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btSurveyResults`
--

DROP TABLE IF EXISTS `btSurveyResults`;
CREATE TABLE `btSurveyResults` (
  `resultID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `optionID` int(10) unsigned DEFAULT '0',
  `uID` int(10) unsigned DEFAULT '0',
  `bID` int(11) DEFAULT NULL,
  `cID` int(11) DEFAULT NULL,
  `ipAddress` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`resultID`),
  KEY `optionID` (`optionID`),
  KEY `cID` (`cID`,`optionID`,`bID`),
  KEY `bID` (`bID`,`cID`,`uID`),
  KEY `uID` (`uID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `btSurveyResults`
--

INSERT INTO `btSurveyResults` (`resultID`, `optionID`, `uID`, `bID`, `cID`, `ipAddress`, `timestamp`) VALUES
(1, 1, 1, 186, 208, '127.0.0.1', '2015-08-12 17:29:04');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btSwitchLanguage`
--

DROP TABLE IF EXISTS `btSwitchLanguage`;
CREATE TABLE `btSwitchLanguage` (
  `bID` int(10) unsigned NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btTags`
--

DROP TABLE IF EXISTS `btTags`;
CREATE TABLE `btTags` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetCID` int(11) DEFAULT NULL,
  `displayMode` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'page',
  `cloudCount` int(11) DEFAULT '10',
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btTestimonial`
--

DROP TABLE IF EXISTS `btTestimonial`;
CREATE TABLE `btTestimonial` (
  `bID` int(10) unsigned NOT NULL,
  `fID` int(10) unsigned DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `companyURL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paragraph` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `btTestimonial`
--

INSERT INTO `btTestimonial` (`bID`, `fID`, `name`, `position`, `company`, `companyURL`, `paragraph`) VALUES
(80, 1, 'Franz Maruna', 'CEO & Founder', 'concrete5', 'http://concrete5.org', 'Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus.'),
(81, 1, 'John Doe', 'Marketing Directory', 'CompanyCo', '', 'Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus.'),
(82, 1, 'Andrew Embler', 'CTO & Founder', 'concrete5', 'http://concrete5.org', 'Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus.'),
(83, 1, 'Jane Doe', 'IT Manager', 'CompanyCo', '', 'Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus.'),
(98, 3, 'John Smith', 'Co-Founder / CEO', '', '', 'Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis.'),
(99, 3, 'Bob Smith', 'Co-Founder / CTO', '', '', 'Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis.'),
(102, 3, 'John Smith', 'Art Director', '', '', 'Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis.'),
(103, 3, 'John Smith', 'Art Director', '', '', 'Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis.'),
(104, 3, 'Bob Smith', 'Art Director', '', '', 'Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis.'),
(105, 3, 'Bob Smith', 'Art Director', '', '', 'Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis.'),
(106, 3, 'Bob Smith', 'Art Director', '', '', 'Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis.'),
(107, 3, 'Bob Smith', 'Art Director', '', '', 'Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis.');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btTopicList`
--

DROP TABLE IF EXISTS `btTopicList`;
CREATE TABLE `btTopicList` (
  `bID` int(10) unsigned NOT NULL,
  `mode` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `topicAttributeKeyHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `topicTreeID` int(10) unsigned NOT NULL DEFAULT '0',
  `cParentID` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `btTopicList`
--

INSERT INTO `btTopicList` (`bID`, `mode`, `topicAttributeKeyHandle`, `topicTreeID`, `cParentID`, `title`) VALUES
(13, 'P', 'blog_entry_topics', 2, 156, 'Topics'),
(38, 'S', '', 2, 0, 'Topics'),
(41, 'S', '', 3, 0, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btVideo`
--

DROP TABLE IF EXISTS `btVideo`;
CREATE TABLE `btVideo` (
  `bID` int(10) unsigned NOT NULL,
  `webmfID` int(10) unsigned DEFAULT '0',
  `oggfID` int(10) unsigned DEFAULT '0',
  `posterfID` int(10) unsigned DEFAULT '0',
  `mp4fID` int(10) unsigned DEFAULT '0',
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btVividStoreProduct`
--

DROP TABLE IF EXISTS `btVividStoreProduct`;
CREATE TABLE `btVividStoreProduct` (
  `bID` int(10) unsigned NOT NULL,
  `productLocation` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pID` int(11) DEFAULT NULL,
  `showProductName` int(11) DEFAULT NULL,
  `showProductDescription` int(11) DEFAULT NULL,
  `showProductDetails` int(11) DEFAULT NULL,
  `showProductPrice` int(11) DEFAULT NULL,
  `showWeight` int(11) DEFAULT NULL,
  `showImage` int(11) DEFAULT NULL,
  `showCartButton` int(11) DEFAULT NULL,
  `showIsFeatured` int(11) DEFAULT NULL,
  `showGroups` int(11) DEFAULT NULL,
  `showDimensions` int(11) DEFAULT NULL,
  `btnText` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btVividStoreProductList`
--

DROP TABLE IF EXISTS `btVividStoreProductList`;
CREATE TABLE `btVividStoreProductList` (
  `bID` int(10) unsigned NOT NULL,
  `sortOrder` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gID` int(10) unsigned DEFAULT NULL,
  `maxProducts` int(10) unsigned DEFAULT NULL,
  `productsPerRow` int(10) unsigned DEFAULT NULL,
  `showPagination` int(10) unsigned DEFAULT NULL,
  `showFeatured` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `showQuickViewLink` int(10) unsigned DEFAULT NULL,
  `showPageLink` int(10) unsigned DEFAULT NULL,
  `showAddToCart` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btVividUtilityLinks`
--

DROP TABLE IF EXISTS `btVividUtilityLinks`;
CREATE TABLE `btVividUtilityLinks` (
  `bID` int(10) unsigned NOT NULL,
  `showCartItems` int(11) DEFAULT NULL,
  `showSignIn` int(11) DEFAULT NULL,
  `cartLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemsLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `btYouTube`
--

DROP TABLE IF EXISTS `btYouTube`;
CREATE TABLE `btYouTube` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `videoURL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vHeight` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vWidth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vPlayer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `CollectionAttributeValues`
--

DROP TABLE IF EXISTS `CollectionAttributeValues`;
CREATE TABLE `CollectionAttributeValues` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `avID` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`akID`),
  KEY `akID` (`akID`),
  KEY `avID` (`avID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `CollectionAttributeValues`
--

INSERT INTO `CollectionAttributeValues` (`cID`, `cvID`, `akID`, `avID`) VALUES
(2, 1, 4, 1),
(3, 1, 3, 2),
(4, 1, 3, 3),
(5, 1, 3, 4),
(6, 1, 3, 5),
(8, 1, 3, 6),
(9, 1, 3, 7),
(10, 1, 3, 8),
(11, 1, 5, 9),
(11, 1, 3, 10),
(12, 1, 3, 11),
(13, 1, 3, 12),
(14, 1, 3, 13),
(15, 1, 3, 14),
(16, 1, 3, 15),
(16, 1, 5, 16),
(17, 1, 3, 17),
(17, 1, 5, 18),
(19, 1, 3, 19),
(20, 1, 3, 20),
(22, 1, 3, 21),
(23, 1, 3, 22),
(24, 1, 3, 23),
(25, 1, 3, 24),
(26, 1, 3, 25),
(28, 1, 3, 26),
(29, 1, 3, 27),
(29, 1, 5, 28),
(31, 1, 5, 29),
(32, 1, 5, 30),
(33, 1, 5, 31),
(34, 1, 5, 32),
(35, 1, 5, 33),
(36, 1, 5, 34),
(38, 1, 5, 35),
(39, 1, 3, 36),
(40, 1, 3, 37),
(41, 1, 3, 38),
(43, 1, 4, 39),
(44, 1, 3, 40),
(48, 1, 3, 41),
(50, 1, 5, 42),
(50, 1, 10, 43),
(50, 1, 3, 44),
(51, 1, 3, 45),
(52, 1, 3, 46),
(53, 1, 5, 47),
(54, 1, 3, 48),
(55, 1, 3, 49),
(56, 1, 3, 50),
(56, 1, 5, 51),
(57, 1, 3, 52),
(58, 1, 3, 53),
(59, 1, 3, 54),
(61, 1, 3, 55),
(62, 1, 3, 56),
(63, 1, 3, 57),
(64, 1, 3, 58),
(65, 1, 3, 59),
(66, 1, 3, 60),
(67, 1, 3, 61),
(68, 1, 3, 62),
(73, 1, 3, 63),
(74, 1, 3, 64),
(75, 1, 3, 65),
(76, 1, 3, 66),
(77, 1, 3, 67),
(79, 1, 3, 68),
(80, 1, 3, 69),
(81, 1, 3, 70),
(82, 1, 3, 71),
(84, 1, 3, 72),
(85, 1, 3, 73),
(86, 1, 3, 74),
(87, 1, 3, 75),
(89, 1, 3, 76),
(90, 1, 3, 77),
(93, 1, 3, 78),
(94, 1, 3, 79),
(95, 1, 3, 80),
(96, 1, 3, 81),
(98, 1, 3, 82),
(99, 1, 3, 83),
(100, 1, 3, 84),
(101, 1, 3, 85),
(102, 1, 3, 86),
(103, 1, 3, 87),
(104, 1, 3, 88),
(105, 1, 3, 89),
(106, 1, 3, 90),
(107, 1, 3, 91),
(108, 1, 3, 92),
(109, 1, 3, 93),
(111, 1, 3, 94),
(112, 1, 3, 95),
(113, 1, 3, 96),
(114, 1, 3, 97),
(116, 1, 10, 98),
(117, 1, 3, 99),
(118, 1, 3, 100),
(119, 1, 3, 101),
(120, 1, 3, 102),
(121, 1, 3, 103),
(123, 1, 3, 104),
(124, 1, 5, 105),
(125, 1, 5, 106),
(125, 1, 10, 107),
(126, 1, 4, 108),
(127, 1, 4, 109),
(128, 1, 4, 110),
(131, 1, 4, 111),
(1, 1, 5, 144),
(1, 2, 5, 144),
(1, 3, 5, 144),
(1, 4, 5, 144),
(1, 5, 5, 144),
(1, 6, 5, 144),
(1, 7, 5, 144),
(1, 8, 5, 144),
(1, 9, 5, 144),
(1, 10, 5, 144),
(180, 4, 5, 144),
(153, 1, 20, 145),
(161, 1, 9, 146),
(161, 1, 21, 147),
(161, 1, 23, 148),
(161, 1, 24, 149),
(161, 1, 25, 150),
(161, 1, 26, 151),
(162, 1, 21, 152),
(162, 1, 23, 153),
(162, 1, 24, 154),
(162, 1, 25, 155),
(162, 1, 26, 156),
(163, 1, 9, 157),
(163, 1, 21, 158),
(163, 1, 23, 159),
(163, 1, 24, 160),
(163, 1, 25, 161),
(163, 1, 26, 162),
(164, 1, 9, 163),
(164, 1, 21, 164),
(164, 1, 23, 165),
(164, 1, 24, 166),
(164, 1, 25, 167),
(164, 1, 26, 168),
(165, 1, 21, 169),
(165, 1, 23, 170),
(165, 1, 24, 171),
(165, 1, 25, 172),
(165, 1, 26, 173),
(166, 1, 21, 174),
(166, 1, 23, 175),
(166, 1, 24, 176),
(166, 1, 25, 177),
(166, 1, 26, 178),
(156, 1, 20, 179),
(168, 1, 1, 180),
(168, 1, 2, 181),
(168, 1, 3, 182),
(168, 1, 7, 183),
(168, 1, 11, 184),
(168, 1, 21, 185),
(168, 1, 22, 186),
(169, 1, 21, 187),
(169, 1, 22, 188),
(170, 1, 21, 189),
(170, 1, 22, 190),
(157, 1, 1, 191),
(157, 1, 2, 192),
(157, 1, 3, 193),
(157, 1, 5, 194),
(157, 1, 7, 195),
(157, 1, 11, 196),
(159, 1, 5, 197),
(175, 1, 1, 198),
(175, 1, 2, 199),
(175, 1, 3, 200),
(175, 1, 7, 201),
(175, 1, 11, 202),
(175, 1, 18, 203),
(175, 1, 19, 204),
(176, 1, 1, 205),
(176, 1, 2, 206),
(176, 1, 3, 207),
(176, 1, 7, 208),
(176, 1, 11, 209),
(176, 1, 18, 210),
(176, 1, 19, 211),
(151, 2, 11, 214),
(151, 2, 5, 215),
(153, 2, 20, 216),
(153, 2, 5, 217),
(154, 2, 5, 218),
(156, 2, 20, 219),
(156, 2, 5, 220),
(151, 3, 5, 221),
(151, 3, 11, 222),
(153, 3, 5, 223),
(153, 3, 20, 224),
(154, 3, 5, 225),
(156, 3, 5, 226),
(156, 3, 20, 227),
(158, 2, 5, 228),
(158, 3, 5, 229),
(199, 1, 5, 233),
(201, 1, 5, 234);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Collections`
--

DROP TABLE IF EXISTS `Collections`;
CREATE TABLE `Collections` (
  `cID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cDateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cID`),
  KEY `cIDDateModified` (`cID`,`cDateModified`),
  KEY `cDateModified` (`cDateModified`),
  KEY `cDateAdded` (`cDateAdded`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=214 ;

--
-- Daten für Tabelle `Collections`
--

INSERT INTO `Collections` (`cID`, `cDateAdded`, `cDateModified`, `cHandle`) VALUES
(1, '2015-04-06 20:44:38', '2015-08-20 22:28:58', 'home'),
(2, '2015-04-06 20:45:19', '2015-04-06 20:45:21', 'dashboard'),
(3, '2015-04-06 20:45:21', '2015-04-06 20:45:21', 'sitemap'),
(4, '2015-04-06 20:45:21', '2015-04-06 20:45:21', 'full'),
(5, '2015-04-06 20:45:21', '2015-04-06 20:45:21', 'explore'),
(6, '2015-04-06 20:45:21', '2015-04-06 20:45:21', 'search'),
(7, '2015-04-06 20:45:21', '2015-04-06 20:45:21', 'files'),
(8, '2015-04-06 20:45:21', '2015-04-06 20:45:21', 'search'),
(9, '2015-04-06 20:45:21', '2015-04-06 20:45:22', 'attributes'),
(10, '2015-04-06 20:45:22', '2015-04-06 20:45:22', 'sets'),
(11, '2015-04-06 20:45:22', '2015-04-06 20:45:22', 'add_set'),
(12, '2015-04-06 20:45:22', '2015-04-06 20:45:22', 'users'),
(13, '2015-04-06 20:45:22', '2015-04-06 20:45:22', 'search'),
(14, '2015-04-06 20:45:22', '2015-04-06 20:45:22', 'groups'),
(15, '2015-04-06 20:45:22', '2015-04-06 20:45:22', 'attributes'),
(16, '2015-04-06 20:45:22', '2015-04-06 20:45:22', 'add'),
(17, '2015-04-06 20:45:22', '2015-04-06 20:45:22', 'add_group'),
(18, '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'bulkupdate'),
(19, '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'group_sets'),
(20, '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'points'),
(21, '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'assign'),
(22, '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'actions'),
(23, '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'reports'),
(24, '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'forms'),
(25, '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'surveys'),
(26, '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'logs'),
(27, '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'pages'),
(28, '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'themes'),
(29, '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'inspect'),
(30, '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'types'),
(31, '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'organize'),
(32, '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'add'),
(33, '2015-04-06 20:45:23', '2015-04-06 20:45:24', 'form'),
(34, '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'output'),
(35, '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'attributes'),
(36, '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'permissions'),
(37, '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'templates'),
(38, '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'add'),
(39, '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'attributes'),
(40, '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'single'),
(41, '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'feeds'),
(42, '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'conversations'),
(43, '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'messages'),
(44, '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'workflow'),
(45, '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'workflows'),
(46, '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'me'),
(47, '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'blocks'),
(48, '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'stacks'),
(49, '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'permissions'),
(50, '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'list'),
(51, '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'types'),
(52, '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'extend'),
(53, '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'news'),
(54, '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'install'),
(55, '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'update'),
(56, '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'connect'),
(57, '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'themes'),
(58, '2015-04-06 20:45:25', '2015-04-06 20:45:26', 'addons'),
(59, '2015-04-06 20:45:26', '2015-04-06 20:45:26', 'system'),
(60, '2015-04-06 20:45:26', '2015-04-06 20:45:26', 'basics'),
(61, '2015-04-06 20:45:26', '2015-04-06 20:45:26', 'name'),
(62, '2015-04-06 20:45:26', '2015-04-06 20:45:26', 'accessibility'),
(63, '2015-04-06 20:45:26', '2015-04-06 20:45:26', 'social'),
(64, '2015-04-06 20:45:26', '2015-04-06 20:45:26', 'icons'),
(65, '2015-04-06 20:45:26', '2015-04-06 20:45:26', 'editor'),
(66, '2015-04-06 20:45:26', '2015-04-06 20:45:26', 'multilingual'),
(67, '2015-04-06 20:45:26', '2015-04-06 20:45:27', 'timezone'),
(68, '2015-04-06 20:45:27', '2015-04-06 20:45:27', 'multilingual'),
(69, '2015-04-06 20:45:27', '2015-04-06 20:45:27', 'setup'),
(70, '2015-04-06 20:45:27', '2015-04-06 20:45:27', 'page_report'),
(71, '2015-04-06 20:45:27', '2015-04-06 20:45:27', 'translate_interface'),
(72, '2015-04-06 20:45:27', '2015-04-06 20:45:27', 'seo'),
(73, '2015-04-06 20:45:27', '2015-04-06 20:45:27', 'urls'),
(74, '2015-04-06 20:45:27', '2015-04-06 20:45:27', 'bulk'),
(75, '2015-04-06 20:45:27', '2015-04-06 20:45:27', 'codes'),
(76, '2015-04-06 20:45:27', '2015-04-06 20:45:27', 'excluded'),
(77, '2015-04-06 20:45:27', '2015-04-06 20:45:27', 'searchindex'),
(78, '2015-04-06 20:45:27', '2015-04-06 20:45:27', 'files'),
(79, '2015-04-06 20:45:27', '2015-04-06 20:45:28', 'permissions'),
(80, '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'filetypes'),
(81, '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'thumbnails'),
(82, '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'storage'),
(83, '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'optimization'),
(84, '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'cache'),
(85, '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'clearcache'),
(86, '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'jobs'),
(87, '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'query_log'),
(88, '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'permissions'),
(89, '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'site'),
(90, '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'tasks'),
(91, '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'users'),
(92, '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'advanced'),
(93, '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'blacklist'),
(94, '2015-04-06 20:45:28', '2015-04-06 20:45:29', 'captcha'),
(95, '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'antispam'),
(96, '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'maintenance'),
(97, '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'registration'),
(98, '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'postlogin'),
(99, '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'profiles'),
(100, '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'open'),
(101, '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'authentication'),
(102, '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'mail'),
(103, '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'method'),
(104, '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'test'),
(105, '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'importers'),
(106, '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'conversations'),
(107, '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'settings'),
(108, '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'points'),
(109, '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'bannedwords'),
(110, '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'permissions'),
(111, '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'attributes'),
(112, '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'sets'),
(113, '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'types'),
(114, '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'topics'),
(115, '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'add'),
(116, '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'environment'),
(117, '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'info'),
(118, '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'debug'),
(119, '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'logging'),
(120, '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'proxy'),
(121, '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'backup'),
(122, '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'backup'),
(123, '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'update'),
(124, '2015-04-06 20:45:31', '2015-04-06 20:45:31', 'welcome'),
(125, '2015-04-06 20:45:31', '2015-04-06 20:45:31', 'home'),
(126, '2015-04-06 20:45:38', '2015-04-06 20:45:38', '!drafts'),
(127, '2015-04-06 20:45:38', '2015-04-06 20:45:38', '!trash'),
(128, '2015-04-06 20:45:38', '2015-04-06 20:45:38', '!stacks'),
(129, '2015-04-06 20:45:38', '2015-04-06 20:45:38', 'login'),
(130, '2015-04-06 20:45:38', '2015-04-06 20:45:38', 'register'),
(131, '2015-04-06 20:45:38', '2015-04-06 20:45:38', 'account'),
(132, '2015-04-06 20:45:38', '2015-04-06 20:45:38', 'edit_profile'),
(133, '2015-04-06 20:45:38', '2015-04-06 20:45:38', 'avatar'),
(134, '2015-04-06 20:45:38', '2015-04-06 20:45:38', 'messages'),
(135, '2015-04-06 20:45:38', '2015-04-06 20:45:38', 'inbox'),
(136, '2015-04-06 20:45:38', '2015-04-06 20:45:38', 'members'),
(137, '2015-04-06 20:45:38', '2015-04-06 20:45:39', 'profile'),
(138, '2015-04-06 20:45:39', '2015-04-06 20:45:39', 'directory'),
(139, '2015-04-06 20:45:39', '2015-04-06 20:45:39', 'page_not_found'),
(140, '2015-04-06 20:45:39', '2015-04-06 20:45:39', 'page_forbidden'),
(141, '2015-04-06 20:45:39', '2015-04-06 20:45:39', 'download_file'),
(142, '2015-04-06 20:46:08', '2015-04-06 20:46:08', 'footer-contact'),
(143, '2015-04-06 20:46:08', '2015-04-06 20:46:08', 'footer-legal'),
(144, '2015-04-06 20:46:09', '2015-04-06 20:46:09', 'footer-navigation'),
(145, '2015-04-06 20:46:09', '2015-04-06 20:46:09', 'footer-site-title'),
(146, '2015-04-06 20:46:09', '2015-04-06 20:46:09', 'footer-social'),
(147, '2015-04-06 20:46:09', '2015-08-12 19:28:57', 'header-navigation'),
(148, '2015-04-06 20:46:09', '2015-04-06 20:46:09', 'header-search'),
(149, '2015-04-06 20:46:09', '2015-08-20 22:22:57', 'header-site-title'),
(150, '2015-04-06 20:46:12', '2015-04-06 20:46:12', NULL),
(151, '2015-04-06 20:46:12', '2015-05-02 17:06:17', 'services'),
(152, '2015-04-06 20:46:12', '2015-04-06 20:46:12', NULL),
(153, '2015-04-06 20:46:12', '2015-08-05 22:54:58', 'portfolio'),
(154, '2015-04-06 20:46:12', '2015-08-05 22:55:02', 'team'),
(155, '2015-04-06 20:46:12', '2015-04-06 20:46:12', NULL),
(156, '2015-04-06 20:46:12', '2015-08-05 22:55:08', 'blog'),
(157, '2015-04-06 20:46:12', '2015-04-06 20:46:12', 'search'),
(158, '2015-04-06 20:46:13', '2015-05-02 17:08:50', 'contact'),
(159, '2015-04-06 20:46:13', '2015-08-05 22:55:48', 'blank-page'),
(160, '2015-04-06 20:46:13', '2015-04-06 20:46:13', NULL),
(161, '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'project-title'),
(162, '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'project-title-2'),
(163, '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'project-title-3'),
(164, '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'project-title-4'),
(165, '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'project-title-5'),
(166, '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'project-title-6'),
(167, '2015-04-06 20:46:13', '2015-04-06 20:46:13', NULL),
(168, '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'hello-world'),
(169, '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'another-blog-post'),
(170, '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'a-beautiful-blog'),
(171, '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'about'),
(172, '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'careers'),
(173, '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'faq'),
(174, '2015-04-06 20:46:13', '2015-04-06 20:46:13', NULL),
(175, '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'web-developer'),
(176, '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'sales-associate'),
(177, '2015-04-06 20:46:14', '2015-04-06 20:46:14', NULL),
(178, '2015-04-06 20:46:14', '2015-04-06 20:46:14', NULL),
(179, '2015-04-06 20:46:14', '2015-04-06 20:46:14', NULL),
(180, '2015-04-24 22:00:34', '2015-04-24 22:00:34', NULL),
(181, '2015-05-02 16:56:44', '2015-08-05 22:57:38', ''),
(182, '2015-05-02 16:58:39', '2015-08-05 22:57:42', ''),
(183, '2015-05-02 16:59:35', '2015-08-05 22:57:46', ''),
(184, '2015-05-02 16:59:52', '2015-05-02 16:59:52', ''),
(185, '2015-05-02 17:00:15', '2015-05-02 17:00:15', ''),
(186, '2015-05-02 17:00:35', '2015-08-20 22:29:42', ''),
(187, '2015-05-02 17:00:48', '2015-05-11 21:39:25', ''),
(188, '2015-05-02 17:01:07', '2015-05-02 17:01:07', ''),
(189, '2015-05-02 17:01:25', '2015-08-05 22:41:08', ''),
(190, '2015-05-02 17:01:42', '2015-08-05 23:11:35', ''),
(199, '2015-05-11 21:34:39', '2015-05-11 21:34:39', 'product-detail'),
(200, '2015-05-11 21:34:41', '2015-05-11 21:34:41', NULL),
(201, '2015-08-05 22:17:20', '2015-08-05 22:17:20', 'test'),
(202, '2015-08-05 22:17:55', '2015-08-05 22:17:55', ''),
(203, '2015-08-05 22:35:46', '2015-08-05 22:35:46', ''),
(204, '2015-08-05 22:36:09', '2015-08-05 22:36:09', ''),
(205, '2015-08-05 22:36:38', '2015-08-05 22:36:38', ''),
(208, '2015-08-05 22:56:30', '2015-08-20 22:22:57', ''),
(209, '2015-08-05 22:59:04', '2015-08-20 19:59:41', ''),
(210, '2015-08-05 22:59:19', '2015-08-20 20:36:01', ''),
(211, '2015-08-05 22:59:31', '2015-08-05 22:59:31', ''),
(212, '2015-10-08 22:27:54', '2015-10-08 22:28:48', ''),
(213, '2015-10-08 22:58:45', '2015-10-08 22:59:08', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `CollectionSearchIndexAttributes`
--

DROP TABLE IF EXISTS `CollectionSearchIndexAttributes`;
CREATE TABLE `CollectionSearchIndexAttributes` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `ak_meta_title` longtext COLLATE utf8_unicode_ci,
  `ak_meta_description` longtext COLLATE utf8_unicode_ci,
  `ak_meta_keywords` longtext COLLATE utf8_unicode_ci,
  `ak_icon_dashboard` longtext COLLATE utf8_unicode_ci,
  `ak_exclude_nav` tinyint(1) DEFAULT '0',
  `ak_exclude_page_list` tinyint(1) DEFAULT '0',
  `ak_header_extra_content` longtext COLLATE utf8_unicode_ci,
  `ak_tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ak_is_featured` tinyint(1) DEFAULT '0',
  `ak_exclude_search_index` tinyint(1) DEFAULT '0',
  `ak_exclude_sitemapxml` tinyint(1) DEFAULT '0',
  `ak_job_posting_department` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ak_job_location` longtext COLLATE utf8_unicode_ci,
  `ak_exclude_subpages_from_nav` tinyint(1) DEFAULT '0',
  `ak_thumbnail` int(11) DEFAULT '0',
  `ak_blog_entry_topics` longtext COLLATE utf8_unicode_ci,
  `ak_project_topics` longtext COLLATE utf8_unicode_ci,
  `ak_project_client` longtext COLLATE utf8_unicode_ci,
  `ak_project_tasks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ak_project_skills` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `CollectionSearchIndexAttributes`
--

INSERT INTO `CollectionSearchIndexAttributes` (`cID`, `ak_meta_title`, `ak_meta_description`, `ak_meta_keywords`, `ak_icon_dashboard`, `ak_exclude_nav`, `ak_exclude_page_list`, `ak_header_extra_content`, `ak_tags`, `ak_is_featured`, `ak_exclude_search_index`, `ak_exclude_sitemapxml`, `ak_job_posting_department`, `ak_job_location`, `ak_exclude_subpages_from_nav`, `ak_thumbnail`, `ak_blog_entry_topics`, `ak_project_topics`, `ak_project_client`, `ak_project_tasks`, `ak_project_skills`) VALUES
(1, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, NULL, 'fa fa-th-large', 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, 'pages, add page, delete page, copy, move, alias', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, 'pages, add page, delete page, copy, move, alias', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(5, NULL, NULL, 'pages, add page, delete page, copy, move, alias, bulk', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(6, NULL, NULL, 'find page, search page, search, find, pages, sitemap', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(8, NULL, NULL, 'add file, delete file, copy, move, alias, resize, crop, rename, images, title, attribute', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(9, NULL, NULL, 'file, file attributes, title, attribute, description, rename', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(10, NULL, NULL, 'files, category, categories', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(11, NULL, NULL, 'new file set', NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(12, NULL, NULL, 'users, groups, people, find, delete user, remove user, change password, password', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(13, NULL, NULL, 'find, search, people, delete user, remove user, change password, password', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(14, NULL, NULL, 'user, group, people, permissions, expire, badges', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(15, NULL, NULL, 'user attributes, user data, gather data, registration data', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(16, NULL, NULL, 'new user, create', NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(17, NULL, NULL, 'new user group, new group, group, create', NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(19, NULL, NULL, 'group set', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(20, NULL, NULL, 'community, points, karma', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(22, NULL, NULL, 'action, community actions', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(23, NULL, NULL, 'forms, log, error, email, mysql, exception, survey', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(24, NULL, NULL, 'forms, questions, response, data', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(25, NULL, NULL, 'questions, quiz, response', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(26, NULL, NULL, 'forms, log, error, email, mysql, exception, survey, history', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(28, NULL, NULL, 'new theme, theme, active theme, change theme, template, css', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(29, NULL, NULL, 'page types', NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(31, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(32, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(33, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(34, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(35, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(36, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(38, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(39, NULL, NULL, 'page attributes, custom', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(40, NULL, NULL, 'single, page, custom, application', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(41, NULL, NULL, 'atom, rss, feed, syndication', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(43, NULL, NULL, NULL, 'icon-bullhorn', 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(44, NULL, NULL, 'add workflow, remove workflow', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(48, NULL, NULL, 'stacks, reusable content, scrapbook, copy, paste, paste block, copy block, site name, logo', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(50, NULL, NULL, 'edit stacks, view stacks, all stacks', NULL, 1, 0, NULL, NULL, 0, 1, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(51, NULL, NULL, 'block, refresh, custom', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(52, NULL, NULL, 'add-on, addon, add on, package, app, ecommerce, discussions, forums, themes, templates, blocks', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(53, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(54, NULL, NULL, 'add-on, addon, ecommerce, install, discussions, forums, themes, templates, blocks', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(55, NULL, NULL, 'update, upgrade', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(56, NULL, NULL, 'concrete5.org, my account, marketplace', NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(57, NULL, NULL, 'buy theme, new theme, marketplace, template', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(58, NULL, NULL, 'buy addon, buy add on, buy add-on, purchase addon, purchase add on, purchase add-on, find addon, new addon, marketplace', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(59, NULL, NULL, 'dashboard, configuration', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(61, NULL, NULL, 'website name, title', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(62, NULL, NULL, 'accessibility, easy mode', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(63, NULL, NULL, 'sharing, facebook, twitter', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(64, NULL, NULL, 'logo, favicon, iphone, icon, bookmark', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(65, NULL, NULL, 'tinymce, content block, fonts, editor, content, overlay', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(66, NULL, NULL, 'translate, translation, internationalization, multilingual', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(67, NULL, NULL, 'timezone, profile, locale', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(68, NULL, NULL, 'multilingual, localization, internationalization, i18n', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(73, NULL, NULL, 'vanity, pretty url, seo, pageview, view', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(74, NULL, NULL, 'bulk, seo, change keywords, engine, optimization, search', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(75, NULL, NULL, 'traffic, statistics, google analytics, quant, pageviews, hits', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(76, NULL, NULL, 'pretty, slug', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(77, NULL, NULL, 'configure search, site search, search option', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(79, NULL, NULL, 'file options, file manager, upload, modify', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(80, NULL, NULL, 'security, files, media, extension, manager, upload', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(81, NULL, NULL, 'images, picture, responsive, retina', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(82, NULL, NULL, 'security, alternate storage, hide files', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(84, NULL, NULL, 'cache option, change cache, override, turn on cache, turn off cache, no cache, page cache, caching', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(85, NULL, NULL, 'cache option, turn off cache, no cache, page cache, caching', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(86, NULL, NULL, 'index search, reindex search, build sitemap, sitemap.xml, clear old versions, page versions, remove old', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(87, NULL, NULL, 'queries, database, mysql', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(89, NULL, NULL, 'editors, hide site, offline, private, public, access', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(90, NULL, NULL, 'security, actions, administrator, admin, package, marketplace, search', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(93, NULL, NULL, 'security, lock ip, lock out, block ip, address, restrict, access', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(94, NULL, NULL, 'security, registration', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(95, NULL, NULL, 'antispam, block spam, security', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(96, NULL, NULL, 'lock site, under construction, hide, hidden', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(98, NULL, NULL, 'profile, login, redirect, specific, dashboard, administrators', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(99, NULL, NULL, 'member profile, member page, community, forums, social, avatar', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(100, NULL, NULL, 'signup, new user, community, public registration, public, registration', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(101, NULL, NULL, 'auth, authentication, types, oauth, facebook, login, registration', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(102, NULL, NULL, 'smtp, mail settings', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(103, NULL, NULL, 'email server, mail settings, mail configuration, external, internal', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(104, NULL, NULL, 'test smtp, test mail', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(105, NULL, NULL, 'email server, mail settings, mail configuration, private message, message system, import, email, message', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(106, NULL, NULL, 'conversations', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(107, NULL, NULL, 'conversations', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(108, NULL, NULL, 'conversations ratings, ratings, community, community points', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(109, NULL, NULL, 'conversations bad words, banned words, banned, bad words, bad, words, list', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(111, NULL, NULL, 'attribute configuration', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(112, NULL, NULL, 'attributes, sets', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(113, NULL, NULL, 'attributes, types', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(114, NULL, NULL, 'topics, tags, taxonomy', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(116, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 1, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(117, NULL, NULL, 'overrides, system info, debug, support, help', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(118, NULL, NULL, 'errors, exceptions, develop, support, help', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(119, NULL, NULL, 'email, logging, logs, smtp, pop, errors, mysql, log', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(120, NULL, NULL, 'network, proxy server', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(121, NULL, NULL, 'export, backup, database, sql, mysql, encryption, restore', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(123, NULL, NULL, 'upgrade, new version, update', NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(124, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(125, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 1, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(126, NULL, NULL, NULL, 'fa fa-edit', 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(127, NULL, NULL, NULL, 'fa fa-trash-o', 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(128, NULL, NULL, NULL, 'fa fa-th', 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(131, NULL, NULL, NULL, 'fa fa-briefcase', 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(147, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(149, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(151, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(153, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL),
(154, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(156, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL),
(157, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(158, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(159, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(161, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 0, 0, NULL, NULL, 0, 6, NULL, '||/Homework||', 'Test Client', '\nArchitecture\nDesign\nProduction\n', '\nHTML\nJavaScript\nPHP\n'),
(162, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 8, NULL, '||/Activities||', 'Test Client', '\nArchitecture\n', '\nPHP\n'),
(163, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 0, 0, NULL, NULL, 0, 16, NULL, '||/Homework||', 'Test Client 2', '\nMultimedia\nProduction\nDevelopment\n', '\nHTML\nJavaScript\nPHP\nCSS\n'),
(164, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 0, 0, NULL, NULL, 0, 15, NULL, '||/Homework||', 'Test Client 2', '\nDesign\n', '\nPhotoshop\n'),
(165, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 12, NULL, '||/Homework||', 'Test Client 2', '\nDesign\n', '\nPhotoshop\n'),
(166, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 10, NULL, '||/Homework||', 'Test Client 2', '\nDesign\n', '\nPhotoshop\n'),
(168, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 2, '||/Projects||', NULL, NULL, NULL, NULL),
(169, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 7, '||/Humor||', NULL, NULL, NULL, NULL),
(170, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 11, '||/Projects||', NULL, NULL, NULL, NULL),
(171, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(172, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(173, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(175, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, '\nTechnical and Operations\n', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla massa lacus, vehicula eu interdum convallis, laoreet id lectus. Nunc turpis elit, aliquam sit amet aliquam tincidunt, dapibus vel tellus. ', 0, 0, NULL, NULL, NULL, NULL, NULL),
(176, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, '\nMarketing and Sales\n', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla massa lacus, vehicula eu interdum convallis, laoreet id lectus. Nunc turpis elit, aliquam sit amet aliquam tincidunt, dapibus vel tellus. ', 0, 0, NULL, NULL, NULL, NULL, NULL),
(181, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(182, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(183, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(184, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(185, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(186, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(187, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(188, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(189, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(190, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(199, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(201, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(208, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(209, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(210, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(211, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(212, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(213, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `CollectionVersionAreaStyles`
--

DROP TABLE IF EXISTS `CollectionVersionAreaStyles`;
CREATE TABLE `CollectionVersionAreaStyles` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `issID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`arHandle`),
  KEY `issID` (`issID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `CollectionVersionAreaStyles`
--

INSERT INTO `CollectionVersionAreaStyles` (`cID`, `cvID`, `arHandle`, `issID`) VALUES
(1, 1, 'Page Footer', 14),
(1, 2, 'Page Footer', 14),
(1, 3, 'Page Footer', 14),
(1, 4, 'Page Footer', 14),
(1, 5, 'Page Footer', 14),
(1, 6, 'Page Footer', 14),
(1, 7, 'Page Footer', 14),
(1, 8, 'Page Footer', 14),
(1, 9, 'Page Footer', 14),
(1, 10, 'Page Footer', 14),
(180, 4, 'Page Footer', 14),
(151, 1, 'Page Footer', 15),
(151, 2, 'Page Footer', 15),
(151, 3, 'Page Footer', 15),
(208, 2, 'Header Navigation', 32),
(208, 3, 'Header Navigation', 32),
(208, 4, 'Header Navigation', 32),
(208, 5, 'Header Navigation', 32);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `CollectionVersionBlocks`
--

DROP TABLE IF EXISTS `CollectionVersionBlocks`;
CREATE TABLE `CollectionVersionBlocks` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '1',
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cbDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `isOriginal` tinyint(1) NOT NULL DEFAULT '0',
  `cbOverrideAreaPermissions` tinyint(1) NOT NULL DEFAULT '0',
  `cbIncludeAll` tinyint(1) NOT NULL DEFAULT '0',
  `cbOverrideBlockTypeCacheSettings` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`bID`,`arHandle`),
  KEY `bID` (`bID`,`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `CollectionVersionBlocks`
--

INSERT INTO `CollectionVersionBlocks` (`cID`, `cvID`, `bID`, `arHandle`, `cbDisplayOrder`, `isOriginal`, `cbOverrideAreaPermissions`, `cbIncludeAll`, `cbOverrideBlockTypeCacheSettings`) VALUES
(1, 1, 51, 'Main', 1, 1, 0, 0, 0),
(1, 1, 52, 'Main', 2, 1, 0, 0, 0),
(1, 1, 53, 'Main : 3', 0, 1, 0, 0, 0),
(1, 1, 54, 'Main : 4', 0, 1, 0, 0, 0),
(1, 1, 55, 'Main : 5', 0, 1, 0, 0, 0),
(1, 1, 56, 'Main', 3, 1, 0, 0, 0),
(1, 1, 57, 'Main', 4, 1, 0, 0, 0),
(1, 1, 58, 'Main', 5, 1, 0, 0, 0),
(1, 1, 59, 'Main', 6, 1, 0, 0, 0),
(1, 1, 60, 'Main', 7, 1, 0, 0, 0),
(1, 1, 61, 'Main : 6', 0, 1, 0, 0, 0),
(1, 1, 62, 'Main : 7', 0, 1, 0, 0, 0),
(1, 1, 63, 'Main', 8, 1, 0, 0, 0),
(1, 1, 64, 'Main : 8', 0, 1, 0, 0, 0),
(1, 1, 65, 'Main : 9', 0, 1, 0, 0, 0),
(1, 1, 66, 'Main : 10', 0, 1, 0, 0, 0),
(1, 1, 67, 'Page Footer', 0, 1, 0, 0, 0),
(1, 2, 51, 'Main', 1, 0, 0, 0, 0),
(1, 2, 52, 'Main', 2, 0, 0, 0, 0),
(1, 2, 54, 'Main : 4', 0, 0, 0, 0, 0),
(1, 2, 55, 'Main : 5', 0, 0, 0, 0, 0),
(1, 2, 56, 'Main', 3, 0, 0, 0, 0),
(1, 2, 57, 'Main', 4, 0, 0, 0, 0),
(1, 2, 58, 'Main', 5, 0, 0, 0, 0),
(1, 2, 59, 'Main', 6, 0, 0, 0, 0),
(1, 2, 60, 'Main', 7, 0, 0, 0, 0),
(1, 2, 61, 'Main : 6', 0, 0, 0, 0, 0),
(1, 2, 62, 'Main : 7', 0, 0, 0, 0, 0),
(1, 2, 63, 'Main', 8, 0, 0, 0, 0),
(1, 2, 64, 'Main : 8', 0, 0, 0, 0, 0),
(1, 2, 65, 'Main : 9', 0, 0, 0, 0, 0),
(1, 2, 66, 'Main : 10', 0, 0, 0, 0, 0),
(1, 2, 67, 'Page Footer', 0, 0, 0, 0, 0),
(1, 2, 163, 'Main : 3', 0, 1, 0, 0, 0),
(1, 3, 51, 'Main', 1, 0, 0, 0, 0),
(1, 3, 52, 'Main', 2, 0, 0, 0, 0),
(1, 3, 54, 'Main : 4', 0, 0, 0, 0, 0),
(1, 3, 55, 'Main : 5', 0, 0, 0, 0, 0),
(1, 3, 56, 'Main', 3, 0, 0, 0, 0),
(1, 3, 57, 'Main', 4, 0, 0, 0, 0),
(1, 3, 58, 'Main', 5, 0, 0, 0, 0),
(1, 3, 59, 'Main', 6, 0, 0, 0, 0),
(1, 3, 60, 'Main', 7, 0, 0, 0, 0),
(1, 3, 61, 'Main : 6', 0, 0, 0, 0, 0),
(1, 3, 62, 'Main : 7', 0, 0, 0, 0, 0),
(1, 3, 63, 'Main', 8, 0, 0, 0, 0),
(1, 3, 64, 'Main : 8', 0, 0, 0, 0, 0),
(1, 3, 65, 'Main : 9', 0, 0, 0, 0, 0),
(1, 3, 66, 'Main : 10', 0, 0, 0, 0, 0),
(1, 3, 67, 'Page Footer', 0, 0, 0, 0, 0),
(1, 4, 51, 'Main', 1, 0, 0, 0, 0),
(1, 4, 52, 'Main', 2, 0, 0, 0, 0),
(1, 4, 54, 'Main : 4', 0, 0, 0, 0, 0),
(1, 4, 55, 'Main : 5', 0, 0, 0, 0, 0),
(1, 4, 56, 'Main', 3, 0, 0, 0, 0),
(1, 4, 57, 'Main', 4, 0, 0, 0, 0),
(1, 4, 58, 'Main', 5, 0, 0, 0, 0),
(1, 4, 59, 'Main', 6, 0, 0, 0, 0),
(1, 4, 60, 'Main', 7, 0, 0, 0, 0),
(1, 4, 61, 'Main : 6', 0, 0, 0, 0, 0),
(1, 4, 62, 'Main : 7', 0, 0, 0, 0, 0),
(1, 4, 63, 'Main', 8, 0, 0, 0, 0),
(1, 4, 64, 'Main : 8', 0, 0, 0, 0, 0),
(1, 4, 65, 'Main : 9', 0, 0, 0, 0, 0),
(1, 4, 66, 'Main : 10', 0, 0, 0, 0, 0),
(1, 4, 67, 'Page Footer', 0, 0, 0, 0, 0),
(1, 4, 167, 'Main : 3', 0, 1, 0, 0, 0),
(1, 5, 51, 'Main', 1, 0, 0, 0, 0),
(1, 5, 52, 'Main', 2, 0, 0, 0, 0),
(1, 5, 54, 'Main : 4', 0, 0, 0, 0, 0),
(1, 5, 55, 'Main : 5', 0, 0, 0, 0, 0),
(1, 5, 56, 'Main', 3, 0, 0, 0, 0),
(1, 5, 57, 'Main', 4, 0, 0, 0, 0),
(1, 5, 58, 'Main', 5, 0, 0, 0, 0),
(1, 5, 59, 'Main', 6, 0, 0, 0, 0),
(1, 5, 60, 'Main', 7, 0, 0, 0, 0),
(1, 5, 61, 'Main : 6', 0, 0, 0, 0, 0),
(1, 5, 62, 'Main : 7', 0, 0, 0, 0, 0),
(1, 5, 63, 'Main', 8, 0, 0, 0, 0),
(1, 5, 64, 'Main : 8', 0, 0, 0, 0, 0),
(1, 5, 65, 'Main : 9', 0, 0, 0, 0, 0),
(1, 5, 66, 'Main : 10', 0, 0, 0, 0, 0),
(1, 5, 67, 'Page Footer', 0, 0, 0, 0, 0),
(1, 5, 167, 'Main : 3', 0, 0, 0, 0, 0),
(1, 6, 51, 'Main', 1, 0, 0, 0, 0),
(1, 6, 52, 'Main', 2, 0, 0, 0, 0),
(1, 6, 54, 'Main : 4', 0, 0, 0, 0, 0),
(1, 6, 55, 'Main : 5', 0, 0, 0, 0, 0),
(1, 6, 56, 'Main', 3, 0, 0, 0, 0),
(1, 6, 57, 'Main', 4, 0, 0, 0, 0),
(1, 6, 58, 'Main', 5, 0, 0, 0, 0),
(1, 6, 59, 'Main', 6, 0, 0, 0, 0),
(1, 6, 60, 'Main', 7, 0, 0, 0, 0),
(1, 6, 61, 'Main : 6', 0, 0, 0, 0, 0),
(1, 6, 62, 'Main : 7', 0, 0, 0, 0, 0),
(1, 6, 63, 'Main', 8, 0, 0, 0, 0),
(1, 6, 64, 'Main : 8', 0, 0, 0, 0, 0),
(1, 6, 65, 'Main : 9', 0, 0, 0, 0, 0),
(1, 6, 66, 'Main : 10', 0, 0, 0, 0, 0),
(1, 6, 67, 'Page Footer', 0, 0, 0, 0, 0),
(1, 6, 167, 'Main : 3', 0, 0, 0, 0, 0),
(1, 6, 185, 'Main', 0, 1, 0, 0, 0),
(1, 7, 51, 'Main', 2, 0, 0, 0, 0),
(1, 7, 52, 'Main', 3, 0, 0, 0, 0),
(1, 7, 54, 'Main : 4', 0, 0, 0, 0, 0),
(1, 7, 55, 'Main : 5', 0, 0, 0, 0, 0),
(1, 7, 56, 'Main', 4, 0, 0, 0, 0),
(1, 7, 57, 'Main', 5, 0, 0, 0, 0),
(1, 7, 58, 'Main', 6, 0, 0, 0, 0),
(1, 7, 59, 'Main', 7, 0, 0, 0, 0),
(1, 7, 60, 'Main', 8, 0, 0, 0, 0),
(1, 7, 61, 'Main : 6', 0, 0, 0, 0, 0),
(1, 7, 62, 'Main : 7', 0, 0, 0, 0, 0),
(1, 7, 63, 'Main', 9, 0, 0, 0, 0),
(1, 7, 64, 'Main : 8', 0, 0, 0, 0, 0),
(1, 7, 65, 'Main : 9', 0, 0, 0, 0, 0),
(1, 7, 66, 'Main : 10', 0, 0, 0, 0, 0),
(1, 7, 67, 'Page Footer', 0, 0, 0, 0, 0),
(1, 7, 167, 'Main : 3', 0, 0, 0, 0, 0),
(1, 7, 190, 'Main', 0, 1, 0, 0, 0),
(1, 8, 51, 'Main', 1, 0, 0, 0, 0),
(1, 8, 52, 'Main', 2, 0, 0, 0, 0),
(1, 8, 54, 'Main : 4', 0, 0, 0, 0, 0),
(1, 8, 55, 'Main : 5', 0, 0, 0, 0, 0),
(1, 8, 56, 'Main', 3, 0, 0, 0, 0),
(1, 8, 57, 'Main', 4, 0, 0, 0, 0),
(1, 8, 58, 'Main', 5, 0, 0, 0, 0),
(1, 8, 59, 'Main', 6, 0, 0, 0, 0),
(1, 8, 60, 'Main', 7, 0, 0, 0, 0),
(1, 8, 61, 'Main : 6', 0, 0, 0, 0, 0),
(1, 8, 62, 'Main : 7', 0, 0, 0, 0, 0),
(1, 8, 63, 'Main', 8, 0, 0, 0, 0),
(1, 8, 64, 'Main : 8', 0, 0, 0, 0, 0),
(1, 8, 65, 'Main : 9', 0, 0, 0, 0, 0),
(1, 8, 66, 'Main : 10', 0, 0, 0, 0, 0),
(1, 8, 67, 'Page Footer', 0, 0, 0, 0, 0),
(1, 8, 167, 'Main : 3', 0, 0, 0, 0, 0),
(1, 9, 52, 'Main', 1, 0, 0, 0, 0),
(1, 9, 56, 'Main', 2, 0, 0, 0, 0),
(1, 9, 58, 'Main', 4, 0, 0, 0, 0),
(1, 9, 59, 'Main', 5, 0, 0, 0, 0),
(1, 9, 60, 'Main', 6, 0, 0, 0, 0),
(1, 9, 63, 'Main', 7, 0, 0, 0, 0),
(1, 10, 52, 'Main', 0, 0, 0, 0, 0),
(1, 10, 194, 'Main : 3', 0, 1, 0, 0, 0),
(1, 10, 195, 'Main : 4', 0, 1, 0, 0, 0),
(1, 10, 196, 'Main : 5', 0, 1, 0, 0, 0),
(124, 1, 1, 'Main', 0, 1, 0, 0, 0),
(125, 1, 2, 'Primary', 0, 1, 0, 0, 0),
(125, 1, 3, 'Primary', 1, 1, 0, 0, 0),
(125, 1, 4, 'Secondary 1', 0, 1, 0, 0, 0),
(125, 1, 5, 'Secondary 2', 0, 1, 0, 0, 0),
(125, 1, 6, 'Secondary 3', 0, 1, 0, 0, 0),
(125, 1, 7, 'Secondary 4', 0, 1, 0, 0, 0),
(125, 1, 8, 'Secondary 5', 0, 1, 0, 0, 0),
(142, 1, 43, 'Main', 0, 1, 0, 0, 0),
(143, 1, 44, 'Main', 0, 1, 0, 0, 0),
(144, 1, 45, 'Main', 0, 1, 0, 0, 0),
(145, 1, 46, 'Main', 0, 1, 0, 0, 0),
(146, 1, 47, 'Main', 0, 1, 0, 0, 0),
(147, 1, 48, 'Main', 0, 1, 0, 0, 1),
(147, 2, 169, 'Main', 0, 1, 0, 0, 1),
(147, 3, 169, 'Main', 0, 0, 0, 0, 1),
(148, 1, 49, 'Main', 0, 1, 0, 0, 0),
(149, 1, 50, 'Main', 0, 1, 0, 0, 0),
(149, 3, 50, 'Main', 0, 0, 0, 0, 0),
(149, 4, 168, 'Main', 0, 1, 0, 0, 0),
(149, 5, 184, 'Main', 0, 1, 0, 0, 0),
(149, 6, 192, 'Main', 0, 1, 0, 0, 0),
(149, 7, 193, 'Main', 0, 1, 0, 0, 0),
(151, 1, 68, 'Main', 0, 1, 0, 0, 0),
(151, 1, 69, 'Main', 1, 1, 0, 0, 0),
(151, 1, 70, 'Main : 11', 0, 1, 0, 0, 0),
(151, 1, 71, 'Main : 12', 0, 1, 0, 0, 0),
(151, 1, 72, 'Main : 13', 0, 1, 0, 0, 0),
(151, 1, 73, 'Main : 14', 0, 1, 0, 0, 0),
(151, 1, 74, 'Main', 2, 1, 0, 0, 0),
(151, 1, 75, 'Main', 3, 1, 0, 0, 0),
(151, 1, 76, 'Main : 15', 0, 1, 0, 0, 0),
(151, 1, 77, 'Main : 16', 0, 1, 0, 0, 0),
(151, 1, 78, 'Page Footer', 0, 1, 0, 0, 0),
(151, 1, 79, 'Page Footer', 1, 1, 0, 0, 0),
(151, 1, 80, 'Page Footer : 17', 0, 1, 0, 0, 0),
(151, 1, 81, 'Page Footer : 17', 1, 1, 0, 0, 0),
(151, 1, 82, 'Page Footer : 18', 0, 1, 0, 0, 0),
(151, 1, 83, 'Page Footer : 18', 1, 1, 0, 0, 0),
(151, 2, 68, 'Main', 0, 0, 0, 0, 0),
(151, 2, 69, 'Main', 1, 0, 0, 0, 0),
(151, 2, 70, 'Main : 11', 0, 0, 0, 0, 0),
(151, 2, 71, 'Main : 12', 0, 0, 0, 0, 0),
(151, 2, 72, 'Main : 13', 0, 0, 0, 0, 0),
(151, 2, 73, 'Main : 14', 0, 0, 0, 0, 0),
(151, 2, 74, 'Main', 2, 0, 0, 0, 0),
(151, 2, 75, 'Main', 3, 0, 0, 0, 0),
(151, 2, 76, 'Main : 15', 0, 0, 0, 0, 0),
(151, 2, 77, 'Main : 16', 0, 0, 0, 0, 0),
(151, 2, 78, 'Page Footer', 0, 0, 0, 0, 0),
(151, 2, 79, 'Page Footer', 1, 0, 0, 0, 0),
(151, 2, 80, 'Page Footer : 17', 0, 0, 0, 0, 0),
(151, 2, 81, 'Page Footer : 17', 1, 0, 0, 0, 0),
(151, 2, 82, 'Page Footer : 18', 0, 0, 0, 0, 0),
(151, 2, 83, 'Page Footer : 18', 1, 0, 0, 0, 0),
(151, 3, 68, 'Main', 0, 0, 0, 0, 0),
(151, 3, 69, 'Main', 1, 0, 0, 0, 0),
(151, 3, 70, 'Main : 11', 0, 0, 0, 0, 0),
(151, 3, 71, 'Main : 12', 0, 0, 0, 0, 0),
(151, 3, 72, 'Main : 13', 0, 0, 0, 0, 0),
(151, 3, 73, 'Main : 14', 0, 0, 0, 0, 0),
(151, 3, 74, 'Main', 2, 0, 0, 0, 0),
(151, 3, 75, 'Main', 3, 0, 0, 0, 0),
(151, 3, 76, 'Main : 15', 0, 0, 0, 0, 0),
(151, 3, 77, 'Main : 16', 0, 0, 0, 0, 0),
(151, 3, 78, 'Page Footer', 0, 0, 0, 0, 0),
(151, 3, 79, 'Page Footer', 1, 0, 0, 0, 0),
(151, 3, 80, 'Page Footer : 17', 0, 0, 0, 0, 0),
(151, 3, 81, 'Page Footer : 17', 1, 0, 0, 0, 0),
(151, 3, 82, 'Page Footer : 18', 0, 0, 0, 0, 0),
(151, 3, 83, 'Page Footer : 18', 1, 0, 0, 0, 0),
(152, 1, 40, 'Main', 0, 1, 0, 0, 0),
(152, 1, 41, 'Main', 1, 1, 0, 0, 0),
(152, 1, 42, 'Main', 2, 1, 0, 0, 0),
(153, 1, 40, 'Main', 0, 0, 0, 0, 0),
(153, 1, 41, 'Main', 1, 0, 0, 0, 0),
(153, 1, 42, 'Main', 2, 0, 0, 0, 0),
(153, 2, 40, 'Main', 0, 0, 0, 0, 0),
(153, 2, 41, 'Main', 1, 0, 0, 0, 0),
(153, 2, 42, 'Main', 2, 0, 0, 0, 0),
(153, 3, 40, 'Main', 0, 0, 0, 0, 0),
(153, 3, 41, 'Main', 1, 0, 0, 0, 0),
(153, 3, 42, 'Main', 2, 0, 0, 0, 0),
(154, 1, 96, 'Main', 0, 1, 0, 0, 0),
(154, 1, 97, 'Main', 1, 1, 0, 0, 0),
(154, 1, 98, 'Main : 19', 0, 1, 0, 0, 0),
(154, 1, 99, 'Main : 20', 0, 1, 0, 0, 0),
(154, 1, 100, 'Main', 2, 1, 0, 0, 0),
(154, 1, 101, 'Main', 3, 1, 0, 0, 0),
(154, 1, 102, 'Main : 21', 0, 1, 0, 0, 0),
(154, 1, 103, 'Main : 21', 1, 1, 0, 0, 0),
(154, 1, 104, 'Main : 22', 0, 1, 0, 0, 0),
(154, 1, 105, 'Main : 22', 1, 1, 0, 0, 0),
(154, 1, 106, 'Main : 23', 0, 1, 0, 0, 0),
(154, 1, 107, 'Main : 23', 1, 1, 0, 0, 0),
(154, 1, 108, 'Main', 4, 1, 0, 0, 0),
(154, 1, 109, 'Main', 5, 1, 0, 0, 0),
(154, 1, 110, 'Main : 24', 0, 1, 0, 0, 0),
(154, 1, 111, 'Main : 25', 0, 1, 0, 0, 0),
(154, 2, 96, 'Main', 0, 0, 0, 0, 0),
(154, 2, 97, 'Main', 1, 0, 0, 0, 0),
(154, 2, 98, 'Main : 19', 0, 0, 0, 0, 0),
(154, 2, 99, 'Main : 20', 0, 0, 0, 0, 0),
(154, 2, 100, 'Main', 2, 0, 0, 0, 0),
(154, 2, 101, 'Main', 3, 0, 0, 0, 0),
(154, 2, 102, 'Main : 21', 0, 0, 0, 0, 0),
(154, 2, 103, 'Main : 21', 1, 0, 0, 0, 0),
(154, 2, 104, 'Main : 22', 0, 0, 0, 0, 0),
(154, 2, 105, 'Main : 22', 1, 0, 0, 0, 0),
(154, 2, 106, 'Main : 23', 0, 0, 0, 0, 0),
(154, 2, 107, 'Main : 23', 1, 0, 0, 0, 0),
(154, 2, 108, 'Main', 4, 0, 0, 0, 0),
(154, 2, 109, 'Main', 5, 0, 0, 0, 0),
(154, 2, 110, 'Main : 24', 0, 0, 0, 0, 0),
(154, 2, 111, 'Main : 25', 0, 0, 0, 0, 0),
(154, 3, 96, 'Main', 0, 0, 0, 0, 0),
(154, 3, 97, 'Main', 1, 0, 0, 0, 0),
(154, 3, 98, 'Main : 19', 0, 0, 0, 0, 0),
(154, 3, 99, 'Main : 20', 0, 0, 0, 0, 0),
(154, 3, 100, 'Main', 2, 0, 0, 0, 0),
(154, 3, 101, 'Main', 3, 0, 0, 0, 0),
(154, 3, 102, 'Main : 21', 0, 0, 0, 0, 0),
(154, 3, 103, 'Main : 21', 1, 0, 0, 0, 0),
(154, 3, 104, 'Main : 22', 0, 0, 0, 0, 0),
(154, 3, 105, 'Main : 22', 1, 0, 0, 0, 0),
(154, 3, 106, 'Main : 23', 0, 0, 0, 0, 0),
(154, 3, 107, 'Main : 23', 1, 0, 0, 0, 0),
(154, 3, 108, 'Main', 4, 0, 0, 0, 0),
(154, 3, 109, 'Main', 5, 0, 0, 0, 0),
(154, 3, 110, 'Main : 24', 0, 0, 0, 0, 0),
(154, 3, 111, 'Main : 25', 0, 0, 0, 0, 0),
(155, 1, 35, 'Main', 0, 1, 0, 0, 0),
(155, 1, 36, 'Main', 1, 1, 0, 0, 0),
(155, 1, 37, 'Main : 1', 0, 1, 0, 0, 0),
(155, 1, 38, 'Main : 2', 0, 1, 0, 0, 0),
(155, 1, 39, 'Main : 2', 1, 1, 0, 0, 0),
(156, 1, 35, 'Main', 0, 0, 0, 0, 0),
(156, 1, 36, 'Main', 1, 0, 0, 0, 0),
(156, 1, 37, 'Main : 1', 0, 0, 0, 0, 0),
(156, 1, 38, 'Main : 2', 0, 0, 0, 0, 0),
(156, 1, 39, 'Main : 2', 1, 0, 0, 0, 0),
(156, 2, 35, 'Main', 0, 0, 0, 0, 0),
(156, 2, 36, 'Main', 1, 0, 0, 0, 0),
(156, 2, 37, 'Main : 1', 0, 0, 0, 0, 0),
(156, 2, 38, 'Main : 2', 0, 0, 0, 0, 0),
(156, 2, 39, 'Main : 2', 1, 0, 0, 0, 0),
(156, 3, 35, 'Main', 0, 0, 0, 0, 0),
(156, 3, 36, 'Main', 1, 0, 0, 0, 0),
(156, 3, 37, 'Main : 1', 0, 0, 0, 0, 0),
(156, 3, 38, 'Main : 2', 0, 0, 0, 0, 0),
(156, 3, 39, 'Main : 2', 1, 0, 0, 0, 0),
(157, 1, 118, 'Main', 0, 1, 0, 0, 0),
(158, 1, 119, 'Main', 0, 1, 0, 0, 0),
(158, 1, 120, 'Main', 1, 1, 0, 0, 0),
(158, 1, 121, 'Main : 26', 0, 1, 0, 0, 0),
(158, 1, 122, 'Main : 27', 0, 1, 0, 0, 0),
(158, 1, 123, 'Main', 2, 1, 0, 0, 0),
(158, 1, 124, 'Main', 3, 1, 0, 0, 0),
(158, 1, 125, 'Main : 28', 0, 1, 0, 0, 0),
(158, 1, 126, 'Main : 29', 0, 1, 0, 0, 0),
(158, 1, 127, 'Main : 30', 0, 1, 0, 0, 0),
(158, 1, 128, 'Main : 30', 1, 1, 0, 0, 0),
(158, 2, 119, 'Main', 0, 0, 0, 0, 0),
(158, 2, 120, 'Main', 1, 0, 0, 0, 0),
(158, 2, 121, 'Main : 26', 0, 0, 0, 0, 0),
(158, 2, 122, 'Main : 27', 0, 0, 0, 0, 0),
(158, 2, 123, 'Main', 2, 0, 0, 0, 0),
(158, 2, 124, 'Main', 3, 0, 0, 0, 0),
(158, 2, 125, 'Main : 28', 0, 0, 0, 0, 0),
(158, 2, 126, 'Main : 29', 0, 0, 0, 0, 0),
(158, 2, 127, 'Main : 30', 0, 0, 0, 0, 0),
(158, 2, 128, 'Main : 30', 1, 0, 0, 0, 0),
(158, 3, 119, 'Main', 0, 0, 0, 0, 0),
(158, 3, 120, 'Main', 1, 0, 0, 0, 0),
(158, 3, 121, 'Main : 26', 0, 0, 0, 0, 0),
(158, 3, 122, 'Main : 27', 0, 0, 0, 0, 0),
(158, 3, 123, 'Main', 2, 0, 0, 0, 0),
(158, 3, 124, 'Main', 3, 0, 0, 0, 0),
(158, 3, 125, 'Main : 28', 0, 0, 0, 0, 0),
(158, 3, 126, 'Main : 29', 0, 0, 0, 0, 0),
(158, 3, 127, 'Main : 30', 0, 0, 0, 0, 0),
(158, 3, 128, 'Main : 30', 1, 0, 0, 0, 0),
(159, 1, 129, 'Main', 0, 1, 0, 0, 0),
(160, 1, 27, 'Page Header', 0, 1, 0, 0, 0),
(160, 1, 28, 'Page Header', 1, 1, 0, 0, 0),
(160, 1, 29, 'Sidebar', 0, 1, 0, 0, 0),
(160, 1, 30, 'Sidebar', 1, 1, 0, 0, 0),
(160, 1, 31, 'Sidebar', 2, 1, 0, 0, 0),
(160, 1, 32, 'Main', 0, 1, 0, 0, 0),
(160, 1, 33, 'Page Footer', 0, 1, 0, 0, 0),
(160, 1, 34, 'Page Footer', 1, 1, 0, 0, 0),
(161, 1, 27, 'Page Header', 0, 0, 0, 0, 0),
(161, 1, 29, 'Sidebar', 0, 0, 0, 0, 0),
(161, 1, 30, 'Sidebar', 1, 0, 0, 0, 0),
(161, 1, 31, 'Sidebar', 2, 0, 0, 0, 0),
(161, 1, 33, 'Page Footer', 0, 0, 0, 0, 0),
(161, 1, 34, 'Page Footer', 1, 0, 0, 0, 0),
(161, 1, 84, 'Page Header', 1, 1, 0, 0, 0),
(161, 1, 85, 'Main', 0, 1, 0, 0, 0),
(162, 1, 27, 'Page Header', 0, 0, 0, 0, 0),
(162, 1, 29, 'Sidebar', 0, 0, 0, 0, 0),
(162, 1, 30, 'Sidebar', 1, 0, 0, 0, 0),
(162, 1, 31, 'Sidebar', 2, 0, 0, 0, 0),
(162, 1, 33, 'Page Footer', 0, 0, 0, 0, 0),
(162, 1, 34, 'Page Footer', 1, 0, 0, 0, 0),
(162, 1, 86, 'Page Header', 1, 1, 0, 0, 0),
(162, 1, 87, 'Main', 0, 1, 0, 0, 0),
(163, 1, 27, 'Page Header', 0, 0, 0, 0, 0),
(163, 1, 29, 'Sidebar', 0, 0, 0, 0, 0),
(163, 1, 30, 'Sidebar', 1, 0, 0, 0, 0),
(163, 1, 31, 'Sidebar', 2, 0, 0, 0, 0),
(163, 1, 33, 'Page Footer', 0, 0, 0, 0, 0),
(163, 1, 34, 'Page Footer', 1, 0, 0, 0, 0),
(163, 1, 88, 'Page Header', 1, 1, 0, 0, 0),
(163, 1, 89, 'Main', 0, 1, 0, 0, 0),
(164, 1, 27, 'Page Header', 0, 0, 0, 0, 0),
(164, 1, 29, 'Sidebar', 0, 0, 0, 0, 0),
(164, 1, 30, 'Sidebar', 1, 0, 0, 0, 0),
(164, 1, 31, 'Sidebar', 2, 0, 0, 0, 0),
(164, 1, 33, 'Page Footer', 0, 0, 0, 0, 0),
(164, 1, 34, 'Page Footer', 1, 0, 0, 0, 0),
(164, 1, 90, 'Page Header', 1, 1, 0, 0, 0),
(164, 1, 91, 'Main', 0, 1, 0, 0, 0),
(165, 1, 27, 'Page Header', 0, 0, 0, 0, 0),
(165, 1, 29, 'Sidebar', 0, 0, 0, 0, 0),
(165, 1, 30, 'Sidebar', 1, 0, 0, 0, 0),
(165, 1, 31, 'Sidebar', 2, 0, 0, 0, 0),
(165, 1, 33, 'Page Footer', 0, 0, 0, 0, 0),
(165, 1, 34, 'Page Footer', 1, 0, 0, 0, 0),
(165, 1, 92, 'Page Header', 1, 1, 0, 0, 0),
(165, 1, 93, 'Main', 0, 1, 0, 0, 0),
(166, 1, 27, 'Page Header', 0, 0, 0, 0, 0),
(166, 1, 29, 'Sidebar', 0, 0, 0, 0, 0),
(166, 1, 30, 'Sidebar', 1, 0, 0, 0, 0),
(166, 1, 31, 'Sidebar', 2, 0, 0, 0, 0),
(166, 1, 33, 'Page Footer', 0, 0, 0, 0, 0),
(166, 1, 34, 'Page Footer', 1, 0, 0, 0, 0),
(166, 1, 94, 'Page Header', 1, 1, 0, 0, 0),
(166, 1, 95, 'Main', 0, 1, 0, 0, 0),
(167, 1, 9, 'Main', 0, 1, 0, 0, 0),
(167, 1, 10, 'Main', 1, 1, 0, 0, 0),
(167, 1, 11, 'Sidebar', 0, 1, 0, 0, 0),
(167, 1, 12, 'Sidebar', 1, 1, 0, 0, 0),
(167, 1, 13, 'Sidebar', 2, 1, 0, 0, 0),
(167, 1, 14, 'Sidebar', 3, 1, 0, 0, 0),
(167, 1, 15, 'Page Footer', 0, 1, 0, 0, 0),
(167, 1, 16, 'Page Footer', 1, 1, 0, 0, 0),
(168, 1, 9, 'Main', 0, 0, 0, 0, 0),
(168, 1, 11, 'Sidebar', 0, 0, 0, 0, 0),
(168, 1, 12, 'Sidebar', 1, 0, 0, 0, 0),
(168, 1, 13, 'Sidebar', 2, 0, 0, 0, 0),
(168, 1, 14, 'Sidebar', 3, 0, 0, 0, 0),
(168, 1, 15, 'Page Footer', 0, 0, 0, 0, 0),
(168, 1, 112, 'Page Footer', 1, 1, 0, 0, 0),
(168, 1, 113, 'Main', 1, 1, 0, 0, 0),
(169, 1, 9, 'Main', 0, 0, 0, 0, 0),
(169, 1, 11, 'Sidebar', 0, 0, 0, 0, 0),
(169, 1, 12, 'Sidebar', 1, 0, 0, 0, 0),
(169, 1, 13, 'Sidebar', 2, 0, 0, 0, 0),
(169, 1, 14, 'Sidebar', 3, 0, 0, 0, 0),
(169, 1, 15, 'Page Footer', 0, 0, 0, 0, 0),
(169, 1, 114, 'Page Footer', 1, 1, 0, 0, 0),
(169, 1, 115, 'Main', 1, 1, 0, 0, 0),
(170, 1, 9, 'Main', 0, 0, 0, 0, 0),
(170, 1, 11, 'Sidebar', 0, 0, 0, 0, 0),
(170, 1, 12, 'Sidebar', 1, 0, 0, 0, 0),
(170, 1, 13, 'Sidebar', 2, 0, 0, 0, 0),
(170, 1, 14, 'Sidebar', 3, 0, 0, 0, 0),
(170, 1, 15, 'Page Footer', 0, 0, 0, 0, 0),
(170, 1, 116, 'Page Footer', 1, 1, 0, 0, 0),
(170, 1, 117, 'Main', 1, 1, 0, 0, 0),
(171, 1, 130, 'Main', 0, 1, 0, 0, 0),
(171, 1, 131, 'Main', 1, 1, 0, 0, 0),
(171, 1, 132, 'Main : 31', 0, 1, 0, 0, 0),
(171, 1, 133, 'Main : 32', 0, 1, 0, 0, 0),
(171, 1, 134, 'Main : 32', 1, 1, 0, 0, 0),
(171, 1, 135, 'Main', 2, 1, 0, 0, 0),
(171, 1, 136, 'Main', 3, 1, 0, 0, 0),
(171, 1, 137, 'Main : 33', 0, 1, 0, 0, 0),
(171, 1, 138, 'Main : 34', 0, 1, 0, 0, 0),
(171, 1, 139, 'Main : 34', 1, 1, 0, 0, 0),
(171, 1, 140, 'Main : 34', 2, 1, 0, 0, 0),
(171, 1, 141, 'Main', 4, 1, 0, 0, 0),
(171, 1, 142, 'Main', 5, 1, 0, 0, 0),
(171, 1, 143, 'Main : 35', 0, 1, 0, 0, 0),
(171, 1, 144, 'Main : 36', 0, 1, 0, 0, 0),
(172, 1, 145, 'Main', 0, 1, 0, 0, 0),
(172, 1, 146, 'Main', 1, 1, 0, 0, 0),
(172, 1, 147, 'Main', 2, 1, 0, 0, 0),
(172, 1, 148, 'Main', 3, 1, 0, 0, 0),
(172, 1, 149, 'Main : 37', 0, 1, 0, 0, 0),
(172, 1, 150, 'Main : 37', 1, 1, 0, 0, 0),
(172, 1, 151, 'Main : 38', 0, 1, 0, 0, 0),
(172, 1, 152, 'Main : 38', 1, 1, 0, 0, 0),
(172, 1, 153, 'Main : 39', 0, 1, 0, 0, 0),
(172, 1, 154, 'Main : 39', 1, 1, 0, 0, 0),
(172, 1, 155, 'Main', 4, 1, 0, 0, 0),
(172, 1, 156, 'Main', 5, 1, 0, 0, 0),
(172, 1, 157, 'Main : 40', 0, 1, 0, 0, 0),
(172, 1, 158, 'Main : 41', 0, 1, 0, 0, 0),
(173, 1, 161, 'Main', 0, 1, 0, 0, 0),
(173, 1, 162, 'Main', 1, 1, 0, 0, 0),
(174, 1, 17, 'Page Header', 0, 1, 0, 0, 0),
(174, 1, 18, 'Sidebar', 0, 1, 0, 0, 0),
(174, 1, 19, 'Main', 0, 1, 0, 0, 0),
(174, 1, 20, 'Main', 1, 1, 0, 0, 0),
(174, 1, 21, 'Main', 2, 1, 0, 0, 0),
(174, 1, 22, 'Main', 3, 1, 0, 0, 0),
(174, 1, 23, 'Main', 4, 1, 0, 0, 0),
(174, 1, 24, 'Main', 5, 1, 0, 0, 0),
(174, 1, 25, 'Main', 6, 1, 0, 0, 0),
(174, 1, 26, 'Main', 7, 1, 0, 0, 0),
(175, 1, 17, 'Page Header', 0, 0, 0, 0, 0),
(175, 1, 18, 'Sidebar', 0, 0, 0, 0, 0),
(175, 1, 19, 'Main', 0, 0, 0, 0, 0),
(175, 1, 20, 'Main', 1, 0, 0, 0, 0),
(175, 1, 21, 'Main', 2, 0, 0, 0, 0),
(175, 1, 22, 'Main', 3, 0, 0, 0, 0),
(175, 1, 23, 'Main', 4, 0, 0, 0, 0),
(175, 1, 24, 'Main', 5, 0, 0, 0, 0),
(175, 1, 26, 'Main', 7, 0, 0, 0, 0),
(175, 1, 159, 'Main', 6, 1, 0, 0, 0),
(176, 1, 17, 'Page Header', 0, 0, 0, 0, 0),
(176, 1, 18, 'Sidebar', 0, 0, 0, 0, 0),
(176, 1, 19, 'Main', 0, 0, 0, 0, 0),
(176, 1, 20, 'Main', 1, 0, 0, 0, 0),
(176, 1, 21, 'Main', 2, 0, 0, 0, 0),
(176, 1, 22, 'Main', 3, 0, 0, 0, 0),
(176, 1, 23, 'Main', 4, 0, 0, 0, 0),
(176, 1, 24, 'Main', 5, 0, 0, 0, 0),
(176, 1, 26, 'Main', 7, 0, 0, 0, 0),
(176, 1, 160, 'Main', 6, 1, 0, 0, 0),
(180, 4, 51, 'Main', 1, 0, 0, 0, 0),
(180, 4, 52, 'Main', 2, 0, 0, 0, 0),
(180, 4, 53, 'Main : 3', 0, 0, 0, 0, 0),
(180, 4, 54, 'Main : 4', 0, 0, 0, 0, 0),
(180, 4, 55, 'Main : 5', 0, 0, 0, 0, 0),
(180, 4, 56, 'Main', 3, 0, 0, 0, 0),
(180, 4, 57, 'Main', 4, 0, 0, 0, 0),
(180, 4, 58, 'Main', 5, 0, 0, 0, 0),
(180, 4, 59, 'Main', 6, 0, 0, 0, 0),
(180, 4, 60, 'Main', 7, 0, 0, 0, 0),
(180, 4, 61, 'Main : 6', 0, 0, 0, 0, 0),
(180, 4, 62, 'Main : 7', 0, 0, 0, 0, 0),
(180, 4, 63, 'Main', 8, 0, 0, 0, 0),
(180, 4, 64, 'Main : 8', 0, 0, 0, 0, 0),
(180, 4, 65, 'Main : 9', 0, 0, 0, 0, 0),
(180, 4, 66, 'Main : 10', 0, 0, 0, 0, 0),
(180, 4, 67, 'Page Footer', 0, 0, 0, 0, 0),
(181, 2, 170, 'Main', 0, 1, 0, 0, 0),
(181, 2, 171, 'Main : 42', 1, 1, 0, 0, 0),
(181, 2, 172, 'Main : 42', 0, 1, 0, 0, 0),
(181, 3, 170, 'Main', 1, 0, 0, 0, 0),
(181, 3, 171, 'Main : 42', 1, 0, 0, 0, 0),
(181, 3, 173, 'Main : 42', 0, 1, 0, 0, 0),
(181, 4, 170, 'Main', 0, 0, 0, 0, 0),
(181, 4, 171, 'Main : 42', 2, 0, 0, 0, 0),
(181, 4, 173, 'Main : 42', 1, 0, 0, 0, 0),
(181, 4, 175, 'Main : 42', 0, 1, 0, 0, 0),
(183, 2, 180, 'Main', 0, 1, 0, 0, 0),
(186, 2, 197, 'Main', 0, 1, 0, 0, 0),
(208, 2, 186, 'Main', 0, 1, 0, 0, 0),
(208, 3, 187, 'Main', 0, 1, 0, 0, 0),
(208, 4, 187, 'Main', 0, 0, 0, 0, 0),
(208, 5, 187, 'Main', 0, 0, 0, 0, 0),
(209, 2, 188, 'Main', 0, 1, 0, 0, 0),
(209, 3, 188, 'Main', 1, 0, 0, 0, 0),
(209, 3, 189, 'Main', 0, 1, 0, 0, 0),
(210, 2, 191, 'Main', 0, 1, 0, 0, 0),
(212, 2, 198, 'Main', 0, 1, 0, 0, 0),
(213, 2, 199, 'Main', 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `CollectionVersionBlocksCacheSettings`
--

DROP TABLE IF EXISTS `CollectionVersionBlocksCacheSettings`;
CREATE TABLE `CollectionVersionBlocksCacheSettings` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '1',
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `btCacheBlockOutput` tinyint(1) NOT NULL DEFAULT '0',
  `btCacheBlockOutputOnPost` tinyint(1) NOT NULL DEFAULT '0',
  `btCacheBlockOutputForRegisteredUsers` tinyint(1) NOT NULL DEFAULT '0',
  `btCacheBlockOutputLifetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`bID`,`arHandle`),
  KEY `bID` (`bID`,`cID`,`cvID`,`arHandle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `CollectionVersionBlocksCacheSettings`
--

INSERT INTO `CollectionVersionBlocksCacheSettings` (`cID`, `cvID`, `bID`, `arHandle`, `btCacheBlockOutput`, `btCacheBlockOutputOnPost`, `btCacheBlockOutputForRegisteredUsers`, `btCacheBlockOutputLifetime`) VALUES
(147, 1, 48, 'Main', 1, 1, 1, 3600),
(147, 3, 169, 'Main', 1, 1, 0, 300);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `CollectionVersionBlocksOutputCache`
--

DROP TABLE IF EXISTS `CollectionVersionBlocksOutputCache`;
CREATE TABLE `CollectionVersionBlocksOutputCache` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '1',
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `btCachedBlockOutput` longtext COLLATE utf8_unicode_ci,
  `btCachedBlockOutputExpires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`bID`,`arHandle`),
  KEY `bID` (`bID`,`cID`,`cvID`,`arHandle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `CollectionVersionBlockStyles`
--

DROP TABLE IF EXISTS `CollectionVersionBlockStyles`;
CREATE TABLE `CollectionVersionBlockStyles` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '0',
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `issID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`bID`,`arHandle`),
  KEY `bID` (`bID`,`issID`),
  KEY `issID` (`issID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `CollectionVersionBlockStyles`
--

INSERT INTO `CollectionVersionBlockStyles` (`cID`, `cvID`, `bID`, `arHandle`, `issID`) VALUES
(167, 1, 11, 'Sidebar', 1),
(168, 1, 11, 'Sidebar', 1),
(169, 1, 11, 'Sidebar', 1),
(170, 1, 11, 'Sidebar', 1),
(167, 1, 12, 'Sidebar', 2),
(168, 1, 12, 'Sidebar', 2),
(169, 1, 12, 'Sidebar', 2),
(170, 1, 12, 'Sidebar', 2),
(174, 1, 18, 'Sidebar', 3),
(175, 1, 18, 'Sidebar', 3),
(176, 1, 18, 'Sidebar', 3),
(155, 1, 37, 'Main : 1', 4),
(156, 1, 37, 'Main : 1', 4),
(156, 2, 37, 'Main : 1', 4),
(156, 3, 37, 'Main : 1', 4),
(155, 1, 38, 'Main : 2', 5),
(156, 1, 38, 'Main : 2', 5),
(156, 2, 38, 'Main : 2', 5),
(156, 3, 38, 'Main : 2', 5),
(155, 1, 39, 'Main : 2', 6),
(156, 1, 39, 'Main : 2', 6),
(156, 2, 39, 'Main : 2', 6),
(156, 3, 39, 'Main : 2', 6),
(152, 1, 41, 'Main', 7),
(153, 1, 41, 'Main', 7),
(153, 2, 41, 'Main', 7),
(153, 3, 41, 'Main', 7),
(1, 1, 53, 'Main : 3', 8),
(180, 4, 53, 'Main : 3', 8),
(1, 1, 54, 'Main : 4', 9),
(1, 2, 54, 'Main : 4', 9),
(1, 3, 54, 'Main : 4', 9),
(1, 4, 54, 'Main : 4', 9),
(1, 5, 54, 'Main : 4', 9),
(1, 6, 54, 'Main : 4', 9),
(1, 7, 54, 'Main : 4', 9),
(1, 8, 54, 'Main : 4', 9),
(180, 4, 54, 'Main : 4', 9),
(1, 1, 55, 'Main : 5', 10),
(1, 2, 55, 'Main : 5', 10),
(1, 3, 55, 'Main : 5', 10),
(1, 4, 55, 'Main : 5', 10),
(1, 5, 55, 'Main : 5', 10),
(1, 6, 55, 'Main : 5', 10),
(1, 7, 55, 'Main : 5', 10),
(1, 8, 55, 'Main : 5', 10),
(180, 4, 55, 'Main : 5', 10),
(1, 1, 57, 'Main', 11),
(1, 2, 57, 'Main', 11),
(1, 3, 57, 'Main', 11),
(1, 4, 57, 'Main', 11),
(1, 5, 57, 'Main', 11),
(1, 6, 57, 'Main', 11),
(1, 7, 57, 'Main', 11),
(1, 8, 57, 'Main', 11),
(180, 4, 57, 'Main', 11),
(1, 1, 64, 'Main : 8', 12),
(1, 2, 64, 'Main : 8', 12),
(1, 3, 64, 'Main : 8', 12),
(1, 4, 64, 'Main : 8', 12),
(1, 5, 64, 'Main : 8', 12),
(1, 6, 64, 'Main : 8', 12),
(1, 7, 64, 'Main : 8', 12),
(1, 8, 64, 'Main : 8', 12),
(180, 4, 64, 'Main : 8', 12),
(1, 1, 65, 'Main : 9', 13),
(1, 2, 65, 'Main : 9', 13),
(1, 3, 65, 'Main : 9', 13),
(1, 4, 65, 'Main : 9', 13),
(1, 5, 65, 'Main : 9', 13),
(1, 6, 65, 'Main : 9', 13),
(1, 7, 65, 'Main : 9', 13),
(1, 8, 65, 'Main : 9', 13),
(180, 4, 65, 'Main : 9', 13),
(154, 1, 98, 'Main : 19', 16),
(154, 2, 98, 'Main : 19', 16),
(154, 3, 98, 'Main : 19', 16),
(154, 1, 99, 'Main : 20', 17),
(154, 2, 99, 'Main : 20', 17),
(154, 3, 99, 'Main : 20', 17),
(154, 1, 102, 'Main : 21', 18),
(154, 2, 102, 'Main : 21', 18),
(154, 3, 102, 'Main : 21', 18),
(154, 1, 103, 'Main : 21', 19),
(154, 2, 103, 'Main : 21', 19),
(154, 3, 103, 'Main : 21', 19),
(154, 1, 104, 'Main : 22', 20),
(154, 2, 104, 'Main : 22', 20),
(154, 3, 104, 'Main : 22', 20),
(154, 1, 105, 'Main : 22', 21),
(154, 2, 105, 'Main : 22', 21),
(154, 3, 105, 'Main : 22', 21),
(154, 1, 106, 'Main : 23', 22),
(154, 2, 106, 'Main : 23', 22),
(154, 3, 106, 'Main : 23', 22),
(154, 1, 107, 'Main : 23', 23),
(154, 2, 107, 'Main : 23', 23),
(154, 3, 107, 'Main : 23', 23),
(154, 1, 110, 'Main : 24', 24),
(154, 2, 110, 'Main : 24', 24),
(154, 3, 110, 'Main : 24', 24),
(158, 1, 125, 'Main : 28', 25),
(158, 2, 125, 'Main : 28', 25),
(158, 3, 125, 'Main : 28', 25),
(171, 1, 143, 'Main : 35', 26),
(172, 1, 158, 'Main : 41', 27),
(147, 3, 169, 'Main', 30);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `CollectionVersionFeatureAssignments`
--

DROP TABLE IF EXISTS `CollectionVersionFeatureAssignments`;
CREATE TABLE `CollectionVersionFeatureAssignments` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '1',
  `faID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`faID`),
  KEY `faID` (`faID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `CollectionVersionFeatureAssignments`
--

INSERT INTO `CollectionVersionFeatureAssignments` (`cID`, `cvID`, `faID`) VALUES
(1, 2, 11),
(1, 4, 13),
(1, 5, 13),
(1, 6, 13),
(1, 7, 13),
(1, 8, 13),
(154, 1, 2),
(154, 2, 2),
(154, 3, 2),
(158, 1, 6),
(158, 2, 6),
(158, 3, 6),
(167, 1, 1),
(168, 1, 3),
(169, 1, 4),
(170, 1, 5),
(171, 1, 7),
(171, 1, 8),
(171, 1, 9),
(172, 1, 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `CollectionVersionRelatedEdits`
--

DROP TABLE IF EXISTS `CollectionVersionRelatedEdits`;
CREATE TABLE `CollectionVersionRelatedEdits` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '0',
  `cRelationID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvRelationID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`cRelationID`,`cvRelationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `CollectionVersions`
--

DROP TABLE IF EXISTS `CollectionVersions`;
CREATE TABLE `CollectionVersions` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '1',
  `cvName` text COLLATE utf8_unicode_ci,
  `cvHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cvDescription` text COLLATE utf8_unicode_ci,
  `cvDatePublic` datetime DEFAULT NULL,
  `cvDateCreated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cvComments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cvIsApproved` tinyint(1) NOT NULL DEFAULT '0',
  `cvIsNew` tinyint(1) NOT NULL DEFAULT '0',
  `cvAuthorUID` int(10) unsigned DEFAULT NULL,
  `cvApproverUID` int(10) unsigned DEFAULT NULL,
  `pThemeID` int(10) unsigned NOT NULL DEFAULT '0',
  `pTemplateID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvActivateDatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`cID`,`cvID`),
  KEY `cvIsApproved` (`cvIsApproved`),
  KEY `cvAuthorUID` (`cvAuthorUID`),
  KEY `cvApproverUID` (`cvApproverUID`),
  KEY `pThemeID` (`pThemeID`),
  KEY `pTemplateID` (`pTemplateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `CollectionVersions`
--

INSERT INTO `CollectionVersions` (`cID`, `cvID`, `cvName`, `cvHandle`, `cvDescription`, `cvDatePublic`, `cvDateCreated`, `cvComments`, `cvIsApproved`, `cvIsNew`, `cvAuthorUID`, `cvApproverUID`, `pThemeID`, `pTemplateID`, `cvActivateDatetime`) VALUES
(1, 1, 'Home', 'home', '', '2015-04-06 20:44:38', '2015-04-06 20:44:38', 'Initial Version', 0, 0, 1, NULL, 1, 6, NULL),
(1, 2, 'Home', 'home', '', '2015-04-06 20:44:38', '2015-04-24 21:55:58', 'Version 2', 0, 0, 1, NULL, 1, 6, NULL),
(1, 3, 'Home', 'home', '', '2015-04-06 20:44:38', '2015-04-24 21:58:41', 'Version 3', 0, 0, 1, NULL, 1, 6, NULL),
(1, 4, 'Home', 'home', '', '2015-04-06 20:44:38', '2015-04-30 20:51:54', 'Version 4', 0, 0, 1, NULL, 1, 6, NULL),
(1, 5, 'Home', 'home', '', '2015-04-06 20:44:38', '2015-05-02 16:50:40', 'New Version 5', 0, 0, 1, 1, 1, 6, NULL),
(1, 6, 'Home', 'home', '', '2015-04-06 20:44:38', '2015-08-06 20:06:25', 'Version 6', 0, 0, 1, 1, 1, 6, NULL),
(1, 7, 'Home', 'home', '', '2015-04-06 20:44:38', '2015-08-20 20:01:55', 'Version 7', 0, 0, 1, 1, 1, 6, NULL),
(1, 8, 'Home', 'home', '', '2015-04-06 20:44:38', '2015-08-20 22:20:05', 'Version 8', 0, 0, 1, 1, 1, 6, NULL),
(1, 9, 'Home', 'home', '', '2015-04-06 20:44:38', '2015-08-20 22:23:11', 'New Version 9', 0, 0, 1, 1, 1, 6, NULL),
(1, 10, 'Home', 'home', '', '2015-04-06 20:44:38', '2015-08-20 22:25:26', 'Version 10', 1, 0, 1, 1, 1, 6, NULL),
(2, 1, 'Dashboard', 'dashboard', '', '2015-04-06 20:45:19', '2015-04-06 20:45:19', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(3, 1, 'Sitemap', 'sitemap', 'Whole world at a glance.', '2015-04-06 20:45:21', '2015-04-06 20:45:21', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(4, 1, 'Full Sitemap', 'full', '', '2015-04-06 20:45:21', '2015-04-06 20:45:21', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(5, 1, 'Flat View', 'explore', '', '2015-04-06 20:45:21', '2015-04-06 20:45:21', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(6, 1, 'Page Search', 'search', '', '2015-04-06 20:45:21', '2015-04-06 20:45:21', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(7, 1, 'Files', 'files', 'All documents and images.', '2015-04-06 20:45:21', '2015-04-06 20:45:21', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(8, 1, 'File Manager', 'search', '', '2015-04-06 20:45:21', '2015-04-06 20:45:21', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(9, 1, 'Attributes', 'attributes', '', '2015-04-06 20:45:21', '2015-04-06 20:45:21', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(10, 1, 'File Sets', 'sets', '', '2015-04-06 20:45:22', '2015-04-06 20:45:22', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(11, 1, 'Add File Set', 'add_set', '', '2015-04-06 20:45:22', '2015-04-06 20:45:22', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(12, 1, 'Members', 'users', 'Add and manage the user accounts and groups on your website.', '2015-04-06 20:45:22', '2015-04-06 20:45:22', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(13, 1, 'Search Users', 'search', '', '2015-04-06 20:45:22', '2015-04-06 20:45:22', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(14, 1, 'User Groups', 'groups', '', '2015-04-06 20:45:22', '2015-04-06 20:45:22', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(15, 1, 'Attributes', 'attributes', '', '2015-04-06 20:45:22', '2015-04-06 20:45:22', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(16, 1, 'Add User', 'add', '', '2015-04-06 20:45:22', '2015-04-06 20:45:22', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(17, 1, 'Add Group', 'add_group', '', '2015-04-06 20:45:22', '2015-04-06 20:45:22', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(18, 1, 'Move Multiple Groups', 'bulkupdate', '', '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(19, 1, 'Group Sets', 'group_sets', '', '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(20, 1, 'Community Points', 'points', NULL, '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(21, 1, 'Assign Points', 'assign', NULL, '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(22, 1, 'Actions', 'actions', NULL, '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(23, 1, 'Reports', 'reports', 'Get data from forms and logs.', '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(24, 1, 'Form Results', 'forms', 'Get submission data.', '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(25, 1, 'Surveys', 'surveys', '', '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(26, 1, 'Logs', 'logs', '', '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(27, 1, 'Pages & Themes', 'pages', 'Reskin your site.', '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(28, 1, 'Themes', 'themes', 'Reskin your site.', '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(29, 1, 'Inspect', 'inspect', '', '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(30, 1, 'Page Types', 'types', '', '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(31, 1, 'Organize Page Type Order', 'organize', '', '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(32, 1, 'Add Page Type', 'add', '', '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(33, 1, 'Compose Form', 'form', '', '2015-04-06 20:45:23', '2015-04-06 20:45:23', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(34, 1, 'Defaults and Output', 'output', '', '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(35, 1, 'Page Type Attributes', 'attributes', '', '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(36, 1, 'Page Type Permissions', 'permissions', '', '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(37, 1, 'Page Templates', 'templates', 'Form factors for pages in your site.', '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(38, 1, 'Add Page Template', 'add', 'Add page templates to your site.', '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(39, 1, 'Attributes', 'attributes', '', '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(40, 1, 'Single Pages', 'single', '', '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(41, 1, 'RSS Feeds', 'feeds', '', '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(42, 1, 'Conversations', 'conversations', '', '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(43, 1, 'Messages', 'messages', '', '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(44, 1, 'Workflow', 'workflow', '', '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(45, 1, 'Workflow List', 'workflows', '', '2015-04-06 20:45:24', '2015-04-06 20:45:24', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(46, 1, 'Waiting for Me', 'me', '', '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(47, 1, 'Stacks & Blocks', 'blocks', 'Manage sitewide content and administer block types.', '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(48, 1, 'Stacks', 'stacks', 'Share content across your site.', '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(49, 1, 'Block & Stack Permissions', 'permissions', 'Control who can add blocks and stacks on your site.', '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(50, 1, 'Stack List', 'list', '', '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(51, 1, 'Block Types', 'types', 'Manage the installed block types in your site.', '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(52, 1, 'Extend concrete5', 'extend', '', '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(53, 1, 'Dashboard', 'news', '', '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(54, 1, 'Add Functionality', 'install', 'Install add-ons & themes.', '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(55, 1, 'Update Add-Ons', 'update', 'Update your installed packages.', '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(56, 1, 'Connect to the Community', 'connect', 'Connect to the concrete5 community.', '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(57, 1, 'Get More Themes', 'themes', 'Download themes from concrete5.org.', '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(58, 1, 'Get More Add-Ons', 'addons', 'Download add-ons from concrete5.org.', '2015-04-06 20:45:25', '2015-04-06 20:45:25', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(59, 1, 'System & Settings', 'system', 'Secure and setup your site.', '2015-04-06 20:45:26', '2015-04-06 20:45:26', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(60, 1, 'Basics', 'basics', 'Basic information about your website.', '2015-04-06 20:45:26', '2015-04-06 20:45:26', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(61, 1, 'Site Name', 'name', '', '2015-04-06 20:45:26', '2015-04-06 20:45:26', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(62, 1, 'Accessibility', 'accessibility', '', '2015-04-06 20:45:26', '2015-04-06 20:45:26', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(63, 1, 'Social Links', 'social', '', '2015-04-06 20:45:26', '2015-04-06 20:45:26', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(64, 1, 'Bookmark Icons', 'icons', 'Bookmark icon and mobile home screen icon setup.', '2015-04-06 20:45:26', '2015-04-06 20:45:26', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(65, 1, 'Rich Text Editor', 'editor', '', '2015-04-06 20:45:26', '2015-04-06 20:45:26', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(66, 1, 'Languages', 'multilingual', '', '2015-04-06 20:45:26', '2015-04-06 20:45:26', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(67, 1, 'Time Zone', 'timezone', '', '2015-04-06 20:45:26', '2015-04-06 20:45:26', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(68, 1, 'Multilingual', 'multilingual', 'Run your site in multiple languages.', '2015-04-06 20:45:27', '2015-04-06 20:45:27', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(69, 1, 'Multilingual Setup', 'setup', '', '2015-04-06 20:45:27', '2015-04-06 20:45:27', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(70, 1, 'Page Report', 'page_report', '', '2015-04-06 20:45:27', '2015-04-06 20:45:27', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(71, 1, 'Translate Site Interface', 'translate_interface', '', '2015-04-06 20:45:27', '2015-04-06 20:45:27', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(72, 1, 'SEO & Statistics', 'seo', 'Enable pretty URLs and tracking codes.', '2015-04-06 20:45:27', '2015-04-06 20:45:27', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(73, 1, 'Pretty URLs', 'urls', '', '2015-04-06 20:45:27', '2015-04-06 20:45:27', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(74, 1, 'Bulk SEO Updater', 'bulk', '', '2015-04-06 20:45:27', '2015-04-06 20:45:27', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(75, 1, 'Tracking Codes', 'codes', '', '2015-04-06 20:45:27', '2015-04-06 20:45:27', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(76, 1, 'Excluded URL Word List', 'excluded', '', '2015-04-06 20:45:27', '2015-04-06 20:45:27', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(77, 1, 'Search Index', 'searchindex', '', '2015-04-06 20:45:27', '2015-04-06 20:45:27', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(78, 1, 'Files', 'files', '', '2015-04-06 20:45:27', '2015-04-06 20:45:27', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(79, 1, 'File Manager Permissions', 'permissions', '', '2015-04-06 20:45:27', '2015-04-06 20:45:27', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(80, 1, 'Allowed File Types', 'filetypes', '', '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(81, 1, 'Thumbnails', 'thumbnails', '', '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(82, 1, 'File Storage Locations', 'storage', '', '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(83, 1, 'Optimization', 'optimization', 'Keep your site running well.', '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(84, 1, 'Cache & Speed Settings', 'cache', '', '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(85, 1, 'Clear Cache', 'clearcache', '', '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(86, 1, 'Automated Jobs', 'jobs', '', '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(87, 1, 'Database Query Log', 'query_log', '', '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(88, 1, 'Permissions & Access', 'permissions', 'Control who sees and edits your site.', '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(89, 1, 'Site Access', 'site', '', '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(90, 1, 'Task Permissions', 'tasks', '', '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(91, 1, 'User Permissions', 'users', '', '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(92, 1, 'Advanced Permissions', 'advanced', '', '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(93, 1, 'IP Blacklist', 'blacklist', '', '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(94, 1, 'Captcha Setup', 'captcha', '', '2015-04-06 20:45:28', '2015-04-06 20:45:28', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(95, 1, 'Spam Control', 'antispam', '', '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(96, 1, 'Maintenance Mode', 'maintenance', '', '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(97, 1, 'Login & Registration', 'registration', 'Change login behaviors and setup public profiles.', '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(98, 1, 'Login Destination', 'postlogin', '', '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(99, 1, 'Public Profiles', 'profiles', '', '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(100, 1, 'Public Registration', 'open', '', '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(101, 1, 'Authentication Types', 'authentication', '', '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(102, 1, 'Email', 'mail', 'Control how your site send and processes mail.', '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(103, 1, 'SMTP Method', 'method', '', '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(104, 1, 'Test Mail Settings', 'test', '', '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(105, 1, 'Email Importers', 'importers', '', '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(106, 1, 'Conversations', 'conversations', 'Manage your conversations settings', '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(107, 1, 'Settings', 'settings', '', '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(108, 1, 'Community Points', 'points', '', '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(109, 1, 'Banned Words', 'bannedwords', '', '2015-04-06 20:45:29', '2015-04-06 20:45:29', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(110, 1, 'Conversation Permissions', 'permissions', '', '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(111, 1, 'Attributes', 'attributes', 'Setup attributes for pages, users, files and more.', '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(112, 1, 'Sets', 'sets', 'Group attributes into sets for easier organization', '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(113, 1, 'Types', 'types', 'Choose which attribute types are available for different items.', '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(114, 1, 'Topics', 'topics', '', '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(115, 1, 'Add Topic Tree', 'add', '', '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(116, 1, 'Environment', 'environment', 'Advanced settings for web developers.', '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(117, 1, 'Environment Information', 'info', '', '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(118, 1, 'Debug Settings', 'debug', '', '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(119, 1, 'Logging Settings', 'logging', '', '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(120, 1, 'Proxy Server', 'proxy', '', '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(121, 1, 'Backup & Restore', 'backup', 'Backup or restore your website.', '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(122, 1, 'Backup Database', 'backup', '', '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(123, 1, 'Update concrete5', 'update', '', '2015-04-06 20:45:30', '2015-04-06 20:45:30', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(124, 1, 'Welcome to concrete5', 'welcome', 'Learn about how to use concrete5, how to develop for concrete5, and get general help.', '2015-04-06 20:45:31', '2015-04-06 20:45:31', 'Initial Version', 1, 0, 1, NULL, 1, 4, NULL),
(125, 1, 'Customize Dashboard Home', 'home', '', '2015-04-06 20:45:31', '2015-04-06 20:45:31', 'Initial Version', 1, 0, 1, NULL, 1, 2, NULL),
(126, 1, 'Drafts', '!drafts', '', '2015-04-06 20:45:38', '2015-04-06 20:45:38', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(127, 1, 'Trash', '!trash', '', '2015-04-06 20:45:38', '2015-04-06 20:45:38', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(128, 1, 'Stacks', '!stacks', '', '2015-04-06 20:45:38', '2015-04-06 20:45:38', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(129, 1, 'Login', 'login', '', '2015-04-06 20:45:38', '2015-04-06 20:45:38', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(130, 1, 'Register', 'register', '', '2015-04-06 20:45:38', '2015-04-06 20:45:38', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(131, 1, 'My Account', 'account', '', '2015-04-06 20:45:38', '2015-04-06 20:45:38', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(132, 1, 'Edit Profile', 'edit_profile', 'Edit your user profile and change password.', '2015-04-06 20:45:38', '2015-04-06 20:45:38', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(133, 1, 'Profile Picture', 'avatar', 'Specify a new image attached to posts or edits.', '2015-04-06 20:45:38', '2015-04-06 20:45:38', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(134, 1, 'Messages', 'messages', 'Inbox for site-specific messages.', '2015-04-06 20:45:38', '2015-04-06 20:45:38', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(135, 1, 'Inbox', 'inbox', '', '2015-04-06 20:45:38', '2015-04-06 20:45:38', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(136, 1, 'Members', 'members', '', '2015-04-06 20:45:38', '2015-04-06 20:45:38', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(137, 1, 'View Profile', 'profile', '', '2015-04-06 20:45:38', '2015-04-06 20:45:38', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(138, 1, 'Directory', 'directory', '', '2015-04-06 20:45:39', '2015-04-06 20:45:39', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(139, 1, 'Page Not Found', 'page_not_found', '', '2015-04-06 20:45:39', '2015-04-06 20:45:39', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(140, 1, 'Page Forbidden', 'page_forbidden', '', '2015-04-06 20:45:39', '2015-04-06 20:45:39', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(141, 1, 'Download File', 'download_file', '', '2015-04-06 20:45:39', '2015-04-06 20:45:39', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(142, 1, 'Footer Contact', 'footer-contact', NULL, '2015-04-06 20:46:08', '2015-04-06 20:46:08', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(143, 1, 'Footer Legal', 'footer-legal', NULL, '2015-04-06 20:46:08', '2015-04-06 20:46:08', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(144, 1, 'Footer Navigation', 'footer-navigation', NULL, '2015-04-06 20:46:09', '2015-04-06 20:46:09', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(145, 1, 'Footer Site Title', 'footer-site-title', NULL, '2015-04-06 20:46:09', '2015-04-06 20:46:09', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(146, 1, 'Footer Social', 'footer-social', NULL, '2015-04-06 20:46:09', '2015-04-06 20:46:09', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(147, 1, 'Header Navigation', 'header-navigation', NULL, '2015-04-06 20:46:09', '2015-04-06 20:46:09', 'Initial Version', 0, 0, 1, NULL, 1, 0, NULL),
(147, 2, 'Header Navigation', 'header-navigation', NULL, '2015-04-06 20:46:09', '2015-05-02 17:02:48', 'New Version 2', 0, 0, 1, 1, 1, 0, NULL),
(147, 3, 'Header Navigation', 'header-navigation', NULL, '2015-04-06 20:46:09', '2015-08-05 23:08:28', 'New Version 3', 1, 0, 1, 1, 1, 0, NULL),
(148, 1, 'Header Search', 'header-search', NULL, '2015-04-06 20:46:09', '2015-04-06 20:46:09', 'Initial Version', 1, 0, 1, NULL, 1, 0, NULL),
(149, 1, 'Header Site Title', 'header-site-title', NULL, '2015-04-06 20:46:09', '2015-04-06 20:46:09', 'Initial Version', 0, 0, 1, NULL, 1, 0, NULL),
(149, 2, 'Header Site Title', 'header-site-title', NULL, '2015-04-06 20:46:09', '2015-05-02 16:50:41', 'New Version 2', 0, 0, 1, 1, 1, 0, NULL),
(149, 3, 'Header Site Title', 'header-site-title', NULL, '2015-04-06 20:46:09', '2015-05-02 16:51:05', 'New Version 3', 0, 0, 1, 1, 1, 0, NULL),
(149, 4, 'Header Site Title', 'header-site-title', NULL, '2015-04-06 20:46:09', '2015-05-02 16:55:20', 'New Version 4', 0, 0, 1, 1, 1, 0, NULL),
(149, 5, 'Header Site Title', 'header-site-title', NULL, '2015-04-06 20:46:09', '2015-08-05 23:07:05', 'New Version 5', 0, 0, 1, 1, 1, 0, NULL),
(149, 6, 'Header Site Title', 'header-site-title', NULL, '2015-04-06 20:46:09', '2015-08-20 22:22:16', 'New Version 6', 0, 0, 1, 1, 1, 0, NULL),
(149, 7, 'Header Site Title', 'header-site-title', NULL, '2015-04-06 20:46:09', '2015-08-20 22:22:47', 'New Version 7', 1, 0, 1, 1, 1, 0, NULL),
(150, 1, '', NULL, NULL, '2015-04-06 20:46:12', '2015-04-06 20:46:12', 'Initial Version', 1, 0, NULL, NULL, 0, 6, NULL),
(151, 1, 'Services', 'services', '', '2015-04-06 20:46:12', '2015-04-06 20:46:12', 'Initial Version', 0, 0, 1, NULL, 1, 6, NULL),
(151, 2, 'Services', 'services', '', '2015-04-06 20:46:00', '2015-05-02 17:04:07', 'New Version 2', 0, 0, 1, 1, 1, 6, NULL),
(151, 3, 'Services', 'services', '', '2015-04-06 20:46:00', '2015-05-02 17:06:17', 'New Version 3', 1, 0, 1, 1, 1, 6, NULL),
(152, 1, '', NULL, NULL, '2015-04-06 20:46:12', '2015-04-06 20:46:12', 'Initial Version', 1, 0, NULL, NULL, 0, 6, NULL),
(153, 1, 'Portfolio', 'portfolio', '', '2015-04-06 20:46:12', '2015-04-06 20:46:12', 'Initial Version', 0, 0, 1, NULL, 1, 6, NULL),
(153, 2, 'Portfolio', 'portfolio', '', '2015-04-06 20:46:00', '2015-05-02 17:04:52', 'New Version 2', 0, 0, 1, 1, 1, 6, NULL),
(153, 3, 'Portfolio', 'portfolio', '', '2015-04-06 20:46:00', '2015-05-02 17:06:31', 'New Version 3', 1, 0, 1, 1, 1, 6, NULL),
(154, 1, 'Team', 'team', '', '2015-04-06 20:46:12', '2015-04-06 20:46:12', 'Initial Version', 0, 0, 1, NULL, 1, 6, NULL),
(154, 2, 'Team', 'team', '', '2015-04-06 20:46:00', '2015-05-02 17:05:21', 'New Version 2', 0, 0, 1, 1, 1, 6, NULL),
(154, 3, 'Team', 'team', '', '2015-04-06 20:46:00', '2015-05-02 17:06:43', 'New Version 3', 1, 0, 1, 1, 1, 6, NULL),
(155, 1, '', NULL, NULL, '2015-04-06 20:46:12', '2015-04-06 20:46:12', 'Initial Version', 1, 0, NULL, NULL, 0, 6, NULL),
(156, 1, 'Blog', 'blog', '', '2015-04-06 20:46:12', '2015-04-06 20:46:12', 'Initial Version', 0, 0, 1, NULL, 1, 6, NULL),
(156, 2, 'Blog', 'blog', '', '2015-04-06 20:46:00', '2015-05-02 17:05:34', 'New Version 2', 0, 0, 1, 1, 1, 6, NULL),
(156, 3, 'Blog', 'blog', '', '2015-04-06 20:46:00', '2015-05-02 17:06:59', 'New Version 3', 1, 0, 1, 1, 1, 6, NULL),
(157, 1, 'Search', 'search', '', '2015-04-06 20:46:12', '2015-04-06 20:46:12', 'Initial Version', 1, 0, 1, NULL, 1, 6, NULL),
(158, 1, 'Contact', 'contact', '', '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'Initial Version', 0, 0, 1, NULL, 1, 6, NULL),
(158, 2, 'Contact', 'contact', '', '2015-04-06 20:46:00', '2015-05-02 17:07:29', 'New Version 2', 0, 0, 1, 1, 1, 6, NULL),
(158, 3, 'Contact', 'contact', '', '2015-04-06 20:46:00', '2015-05-02 17:08:50', 'New Version 3', 1, 0, 1, 1, 1, 6, NULL),
(159, 1, 'Blank Page', 'blank-page', '', '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'Initial Version', 1, 0, 1, NULL, 1, 5, NULL),
(160, 1, '', NULL, NULL, '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'Initial Version', 1, 0, NULL, NULL, 0, 7, NULL),
(161, 1, 'Project Title', 'project-title', 'Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing.', '2014-08-06 15:30:00', '2015-04-06 20:46:13', 'Initial Version', 1, 0, 1, NULL, 1, 7, NULL),
(162, 1, 'Project Title 2', 'project-title-2', 'Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing.', '2014-08-06 15:20:00', '2015-04-06 20:46:13', 'Initial Version', 1, 0, 1, NULL, 1, 7, NULL),
(163, 1, 'Project Title 3', 'project-title-3', 'Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing.', '2014-08-06 15:10:00', '2015-04-06 20:46:13', 'Initial Version', 1, 0, 1, NULL, 1, 7, NULL),
(164, 1, 'Project Title 4', 'project-title-4', 'Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing.', '2014-08-06 15:00:00', '2015-04-06 20:46:13', 'Initial Version', 1, 0, 1, NULL, 1, 7, NULL),
(165, 1, 'Project Title 5', 'project-title-5', 'Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing.', '2014-08-06 14:30:00', '2015-04-06 20:46:13', 'Initial Version', 1, 0, 1, NULL, 1, 7, NULL),
(166, 1, 'Project Title 6', 'project-title-6', 'Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing.', '2014-08-06 14:20:00', '2015-04-06 20:46:13', 'Initial Version', 1, 0, 1, NULL, 1, 7, NULL),
(167, 1, '', NULL, NULL, '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'Initial Version', 1, 0, NULL, NULL, 0, 8, NULL),
(168, 1, 'Hello World!', 'hello-world', 'Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. Quisque dignissim neque a ipsum sodales, mattis aliquam ante dictum.', '2014-07-01 12:00:00', '2015-04-06 20:46:13', 'Initial Version', 1, 0, 1, NULL, 1, 8, NULL),
(169, 1, 'Another Blog Post', 'another-blog-post', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet consectetur lacus. Vestibulum neque lectus, egestas non cursus vitae, aliquam at magna.', '2014-07-04 15:00:00', '2015-04-06 20:46:13', 'Initial Version', 1, 0, 1, NULL, 1, 8, NULL),
(170, 1, 'A Beautiful Site Deserves a Beautiful Blog', 'a-beautiful-blog', 'Donec blandit lectus nec neque ullamcorper rhoncus. Sed adipiscing tempus sem eu molestie. Aenean laoreet pretium ante vitae ultrices. Aenean eu gravida magna, vel aliquet magna. In auctor convallis gravida. Phasellus est erat.', '2014-08-01 16:30:00', '2015-04-06 20:46:13', 'Initial Version', 1, 0, 1, NULL, 1, 8, NULL),
(171, 1, 'About', 'about', '', '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'Initial Version', 1, 0, 1, NULL, 1, 6, NULL),
(172, 1, 'Careers', 'careers', '', '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'Initial Version', 1, 0, 1, NULL, 1, 6, NULL),
(173, 1, 'Frequently Asked Questions', 'faq', '', '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'Initial Version', 1, 0, 1, NULL, 1, 6, NULL),
(174, 1, '', NULL, NULL, '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'Initial Version', 1, 0, NULL, NULL, 0, 7, NULL),
(175, 1, 'Web Developer', 'web-developer', 'Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. Sed consequat eleifend metus, vitae malesuada eros elementum sed. Fusce risus felis, viverra et dignissim at, lobortis non est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet consectetur lacus.', '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'Initial Version', 1, 0, 1, NULL, 1, 7, NULL),
(176, 1, 'Sales Associate', 'sales-associate', 'Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. Sed consequat eleifend metus, vitae malesuada eros elementum sed. Fusce risus felis, viverra et dignissim at, lobortis non est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet consectetur lacus.', '2015-04-06 20:46:13', '2015-04-06 20:46:13', 'Initial Version', 1, 0, 1, NULL, 1, 7, NULL),
(177, 1, '', NULL, NULL, '2015-04-06 20:46:14', '2015-04-06 20:46:14', 'Initial Version', 1, 0, NULL, NULL, 0, 5, NULL),
(178, 1, '', NULL, NULL, '2015-04-06 20:46:14', '2015-04-06 20:46:14', 'Initial Version', 1, 0, NULL, NULL, 0, 7, NULL),
(179, 1, '', NULL, NULL, '2015-04-06 20:46:14', '2015-04-06 20:46:14', 'Initial Version', 1, 0, NULL, NULL, 0, 8, NULL),
(180, 4, 'Home', 'home', '', '2015-04-06 20:44:38', '2015-04-24 22:00:38', 'Neue Seite aus Version erstellt', 0, 0, 1, NULL, 1, 6, NULL),
(181, 1, 'Biber', 'biber', 'Die Stufenseite der Biber', '2015-05-02 16:56:44', '2015-05-02 16:56:44', 'Initial Version', 0, 0, 1, 1, 1, 6, NULL),
(181, 2, 'Biber', 'biber', 'Die Stufenseite der Biber', '2015-05-02 16:56:44', '2015-05-02 17:09:49', 'Version 2', 0, 0, 1, 1, 1, 6, NULL),
(181, 3, 'Biber', 'biber', 'Die Stufenseite der Biber', '2015-05-02 16:56:44', '2015-05-03 12:35:14', 'Version 3', 0, 0, 1, 1, 1, 6, NULL),
(181, 4, 'Biber', 'biber', 'Die Stufenseite der Biber', '2015-05-02 16:56:44', '2015-05-04 21:50:38', 'Version 4', 1, 0, 1, 1, 1, 6, NULL),
(182, 1, 'Wölf', 'wolf', 'Stufenseite der Wölfe', '2015-05-02 16:58:39', '2015-05-02 16:58:39', 'Initial Version', 1, 0, 1, 1, 1, 6, NULL),
(183, 1, 'Pfadi', 'pfadi', '', '2015-05-02 16:59:35', '2015-05-02 16:59:35', 'Initial Version', 0, 0, 1, 1, 1, 6, NULL),
(183, 2, 'Pfadi', 'pfadi', '', '2015-05-02 16:59:35', '2015-07-30 21:11:44', 'Version 2', 1, 0, 1, 1, 1, 6, NULL),
(184, 1, 'Leiter', 'leiter', 'Leiter', '2015-05-02 16:59:52', '2015-05-02 16:59:52', 'Initial Version', 1, 0, 1, 1, 1, 6, NULL),
(185, 1, 'Bilder', 'bilder', '', '2015-05-02 17:00:15', '2015-05-02 17:00:15', 'Initial Version', 1, 0, 1, 1, 1, 6, NULL),
(186, 1, 'Agenda', 'agenda', '', '2015-05-02 17:00:35', '2015-05-02 17:00:35', 'Initial Version', 0, 0, 1, 1, 1, 6, NULL),
(186, 2, 'Agenda', 'agenda', '', '2015-05-02 17:00:35', '2015-08-20 22:29:29', 'Version 2', 1, 0, 1, 1, 1, 6, NULL),
(187, 1, 'Links', 'links', '', '2015-05-02 17:00:48', '2015-05-02 17:00:48', 'Initial Version', 0, 0, 1, 1, 1, 6, NULL),
(187, 2, 'Links', 'links', '', '2015-05-02 17:00:48', '2015-05-11 21:37:55', 'Version 2', 1, 0, 1, 1, 1, 6, NULL),
(188, 1, 'Elternrat', 'elternrat', '', '2015-05-02 17:01:07', '2015-05-02 17:01:07', 'Initial Version', 1, 0, 1, 1, 1, 6, NULL),
(189, 1, 'Abteilung', 'abteilung', '', '2015-05-02 17:01:25', '2015-05-02 17:01:25', 'Initial Version', 1, 0, 1, 1, 1, 6, NULL),
(190, 1, 'Administration', 'administration', '', '2015-05-02 17:01:42', '2015-05-02 17:01:42', 'Initial Version', 0, 0, 1, 1, 1, 6, NULL),
(190, 2, 'Admin', 'administration', '', '2015-05-02 17:01:00', '2015-08-05 23:11:35', 'New Version 2', 1, 0, 1, 1, 1, 6, NULL),
(199, 1, 'Product Detail', 'product-detail', NULL, '2015-05-11 21:34:39', '2015-05-11 21:34:39', 'Initial Version', 1, 0, 1, NULL, 1, 6, NULL),
(200, 1, '', NULL, NULL, '2015-05-11 21:34:41', '2015-05-11 21:34:41', 'Initial Version', 1, 0, NULL, NULL, 0, 6, NULL),
(201, 1, 'test', 'test', NULL, '2015-08-05 22:17:20', '2015-08-05 22:17:20', 'Initial Version', 1, 0, 1, NULL, 1, 6, NULL),
(202, 1, '', '', NULL, '2015-08-05 22:17:55', '2015-08-05 22:17:55', 'Initial Version', 0, 1, 1, NULL, 1, 6, NULL),
(203, 1, '', '', NULL, '2015-08-05 22:35:46', '2015-08-05 22:35:46', 'Initial Version', 0, 1, 1, NULL, 1, 6, NULL),
(204, 1, '', '', NULL, '2015-08-05 22:36:09', '2015-08-05 22:36:09', 'Initial Version', 0, 1, 1, NULL, 1, 6, NULL),
(205, 1, '', '', NULL, '2015-08-05 22:36:38', '2015-08-05 22:36:38', 'Initial Version', 0, 1, 1, NULL, 1, 6, NULL),
(208, 1, 'Stufen', 'stufen', '', '2015-08-05 22:56:30', '2015-08-05 22:56:30', 'Initial Version', 0, 0, 1, 1, 1, 6, NULL),
(208, 2, 'Stufen', 'stufen', '', '2015-08-05 22:56:30', '2015-08-05 23:07:05', 'Version 2', 0, 0, 1, 1, 1, 6, NULL),
(208, 3, 'Stufen', 'stufen', '', '2015-08-05 22:56:30', '2015-08-13 21:15:14', 'Version 3', 0, 0, 1, 1, 1, 6, NULL),
(208, 4, 'Stufen', 'stufen', '', '2015-08-05 22:56:30', '2015-08-20 22:22:16', 'Version 4', 0, 0, 1, 1, 1, 6, NULL),
(208, 5, 'Stufen', 'stufen', '', '2015-08-05 22:56:30', '2015-08-20 22:22:47', 'Version 5', 1, 0, 1, 1, 1, 6, NULL),
(209, 1, 'Biber', 'biber', '', '2015-08-05 22:59:04', '2015-08-05 22:59:04', 'Initial Version', 0, 0, 1, 1, 1, 6, NULL),
(209, 2, 'Biber', 'biber', '', '2015-08-05 22:59:04', '2015-08-19 21:50:31', 'Version 2', 0, 0, 1, 1, 1, 6, NULL),
(209, 3, 'Biber', 'biber', '', '2015-08-05 22:59:04', '2015-08-20 19:59:29', 'Version 3', 1, 0, 1, 1, 1, 6, NULL),
(210, 1, 'Wölf', 'wolf', '', '2015-08-05 22:59:19', '2015-08-05 22:59:19', 'Initial Version', 0, 0, 1, 1, 1, 6, NULL),
(210, 2, 'Wölf', 'wolf', '', '2015-08-05 22:59:19', '2015-08-20 20:35:44', 'Version 2', 1, 0, 1, 1, 1, 6, NULL),
(211, 1, 'Pfadi', 'pfadi', '', '2015-08-05 22:59:31', '2015-08-05 22:59:31', 'Initial Version', 1, 0, 1, 1, 1, 6, NULL),
(212, 1, 'Quittungen', 'quittungen', '', '2015-10-08 22:27:54', '2015-10-08 22:27:54', 'Initial Version', 0, 0, 1, 1, 1, 6, NULL),
(212, 2, 'Quittungen', 'quittungen', '', '2015-10-08 22:27:54', '2015-10-08 22:28:42', 'Version 2', 1, 0, 1, 1, 1, 6, NULL),
(213, 1, 'Budgets verwalten', 'budgets-verwalten', '', '2015-10-08 22:58:45', '2015-10-08 22:58:45', 'Initial Version', 0, 0, 1, 1, 1, 6, NULL),
(213, 2, 'Budgets verwalten', 'budgets-verwalten', '', '2015-10-08 22:58:45', '2015-10-08 22:59:02', 'Version 2', 1, 0, 1, 1, 1, 6, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `CollectionVersionThemeCustomStyles`
--

DROP TABLE IF EXISTS `CollectionVersionThemeCustomStyles`;
CREATE TABLE `CollectionVersionThemeCustomStyles` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '1',
  `pThemeID` int(10) unsigned NOT NULL DEFAULT '0',
  `scvlID` int(10) unsigned DEFAULT '0',
  `preset` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sccRecordID` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`pThemeID`),
  KEY `pThemeID` (`pThemeID`),
  KEY `scvlID` (`scvlID`),
  KEY `sccRecordID` (`sccRecordID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Config`
--

DROP TABLE IF EXISTS `Config`;
CREATE TABLE `Config` (
  `configNamespace` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `configGroup` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `configItem` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `configValue` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`configNamespace`,`configGroup`,`configItem`),
  KEY `configGroup` (`configGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `Config`
--

INSERT INTO `Config` (`configNamespace`, `configGroup`, `configItem`, `configValue`) VALUES
('', 'concrete', 'security.token.encryption', 'JGM7Fn5Cceu3yOBQ41w8NQl88YmP2r7rzgIrrry9w0YcL3N7ZPyGabLnV3bPpDkE'),
('', 'concrete', 'security.token.jobs', 'lEfuUSZxtPEWp5eS16oAk4YB0m4MqQieGJZgrKlObjH1KmpawNcZhDwnmWyiGRqV'),
('', 'concrete', 'security.token.validation', 'MzTPAPVMNOSZiIzE8Hnf1qzR7EUq9eQbxlPeT34pGn4k6rJvUnCbaeZjMNha9V5l'),
('vivid_store', 'vividstore', 'productPublishTarget', '199'),
('vivid_store', 'vividstore', 'sizeUnit', 'in'),
('vivid_store', 'vividstore', 'symbol', '$'),
('vivid_store', 'vividstore', 'thousand', ','),
('vivid_store', 'vividstore', 'weightUnit', 'lb'),
('vivid_store', 'vividstore', 'whole', '.');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ConfigStore`
--

DROP TABLE IF EXISTS `ConfigStore`;
CREATE TABLE `ConfigStore` (
  `cfKey` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cfValue` longtext COLLATE utf8_unicode_ci,
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cfKey`,`uID`),
  KEY `uID` (`uID`,`cfKey`),
  KEY `pkgID` (`pkgID`,`cfKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `ConfigStore`
--

INSERT INTO `ConfigStore` (`cfKey`, `timestamp`, `cfValue`, `uID`, `pkgID`) VALUES
('DISABLED_HELP_NOTIFICATIONS', '2015-04-19 21:49:16', 'all', 1, 0),
('NEWSFLOW_LAST_VIEWED', '2015-04-06 18:46:35', '1444678549', 1, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ConversationDiscussions`
--

DROP TABLE IF EXISTS `ConversationDiscussions`;
CREATE TABLE `ConversationDiscussions` (
  `cnvDiscussionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cnvDiscussionDateCreated` datetime NOT NULL,
  `cID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`cnvDiscussionID`),
  KEY `cID` (`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ConversationEditors`
--

DROP TABLE IF EXISTS `ConversationEditors`;
CREATE TABLE `ConversationEditors` (
  `cnvEditorID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cnvEditorHandle` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cnvEditorName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cnvEditorIsActive` tinyint(1) NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cnvEditorID`),
  KEY `pkgID` (`pkgID`,`cnvEditorHandle`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `ConversationEditors`
--

INSERT INTO `ConversationEditors` (`cnvEditorID`, `cnvEditorHandle`, `cnvEditorName`, `cnvEditorIsActive`, `pkgID`) VALUES
(1, 'plain_text', 'Plain Text', 0, 0),
(2, 'markdown', 'Markdown', 0, 0),
(3, 'redactor', 'Redactor', 1, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ConversationFeatureDetailAssignments`
--

DROP TABLE IF EXISTS `ConversationFeatureDetailAssignments`;
CREATE TABLE `ConversationFeatureDetailAssignments` (
  `faID` int(10) unsigned NOT NULL DEFAULT '0',
  `cnvID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`faID`),
  KEY `cnvID` (`cnvID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `ConversationFeatureDetailAssignments`
--

INSERT INTO `ConversationFeatureDetailAssignments` (`faID`, `cnvID`) VALUES
(1, 1),
(3, 2),
(4, 3),
(5, 4),
(11, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ConversationFlaggedMessages`
--

DROP TABLE IF EXISTS `ConversationFlaggedMessages`;
CREATE TABLE `ConversationFlaggedMessages` (
  `cnvMessageID` int(10) unsigned NOT NULL,
  `cnvMessageFlagTypeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`cnvMessageID`),
  KEY `cnvMessageFlagTypeID` (`cnvMessageFlagTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ConversationFlaggedMessageTypes`
--

DROP TABLE IF EXISTS `ConversationFlaggedMessageTypes`;
CREATE TABLE `ConversationFlaggedMessageTypes` (
  `cnvMessageFlagTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cnvMessageFlagTypeHandle` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cnvMessageFlagTypeID`),
  UNIQUE KEY `cnvMessageFlagTypeHandle` (`cnvMessageFlagTypeHandle`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `ConversationFlaggedMessageTypes`
--

INSERT INTO `ConversationFlaggedMessageTypes` (`cnvMessageFlagTypeID`, `cnvMessageFlagTypeHandle`) VALUES
(1, 'spam');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ConversationMessageAttachments`
--

DROP TABLE IF EXISTS `ConversationMessageAttachments`;
CREATE TABLE `ConversationMessageAttachments` (
  `cnvMessageAttachmentID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cnvMessageID` int(11) DEFAULT NULL,
  `fID` int(11) DEFAULT NULL,
  PRIMARY KEY (`cnvMessageAttachmentID`),
  KEY `cnvMessageID` (`cnvMessageID`),
  KEY `fID` (`fID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ConversationMessageRatings`
--

DROP TABLE IF EXISTS `ConversationMessageRatings`;
CREATE TABLE `ConversationMessageRatings` (
  `cnvMessageRatingID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cnvMessageID` int(10) unsigned DEFAULT NULL,
  `cnvRatingTypeID` int(10) unsigned NOT NULL DEFAULT '0',
  `cnvMessageRatingIP` tinyblob,
  `timestamp` datetime DEFAULT NULL,
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cnvMessageRatingID`),
  KEY `cnvMessageID` (`cnvMessageID`,`cnvRatingTypeID`),
  KEY `cnvRatingTypeID` (`cnvRatingTypeID`),
  KEY `uID` (`uID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ConversationMessages`
--

DROP TABLE IF EXISTS `ConversationMessages`;
CREATE TABLE `ConversationMessages` (
  `cnvMessageID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cnvID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `cnvEditorID` int(10) unsigned NOT NULL DEFAULT '0',
  `cnvMessageSubmitIP` tinyblob,
  `cnvMessageSubmitUserAgent` longtext COLLATE utf8_unicode_ci,
  `cnvMessageLevel` int(10) unsigned NOT NULL DEFAULT '0',
  `cnvMessageParentID` int(10) unsigned NOT NULL DEFAULT '0',
  `cnvMessageDateCreated` datetime DEFAULT NULL,
  `cnvMessageSubject` text COLLATE utf8_unicode_ci,
  `cnvMessageBody` text COLLATE utf8_unicode_ci,
  `cnvIsMessageDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `cnvIsMessageApproved` tinyint(1) NOT NULL DEFAULT '0',
  `cnvMessageTotalRatingScore` bigint(20) DEFAULT '0',
  PRIMARY KEY (`cnvMessageID`),
  KEY `cnvID` (`cnvID`),
  KEY `cnvMessageParentID` (`cnvMessageParentID`),
  KEY `uID` (`uID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `ConversationMessages`
--

INSERT INTO `ConversationMessages` (`cnvMessageID`, `cnvID`, `uID`, `cnvEditorID`, `cnvMessageSubmitIP`, `cnvMessageSubmitUserAgent`, `cnvMessageLevel`, `cnvMessageParentID`, `cnvMessageDateCreated`, `cnvMessageSubject`, `cnvMessageBody`, `cnvIsMessageDeleted`, `cnvIsMessageApproved`, `cnvMessageTotalRatingScore`) VALUES
(1, 5, 1, 3, 0x3766303030303031, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:35.0) Gecko/20100101 Firefox/35.0', 0, 0, '2015-04-24 21:57:26', NULL, '<p>lighhj</p>', 0, 1, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ConversationPermissionAssignments`
--

DROP TABLE IF EXISTS `ConversationPermissionAssignments`;
CREATE TABLE `ConversationPermissionAssignments` (
  `cnvID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cnvID`,`pkID`,`paID`),
  KEY `paID` (`paID`),
  KEY `pkID` (`pkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `ConversationPermissionAssignments`
--

INSERT INTO `ConversationPermissionAssignments` (`cnvID`, `pkID`, `paID`) VALUES
(0, 66, 72),
(0, 67, 73),
(0, 68, 77),
(0, 69, 75),
(0, 70, 74),
(0, 71, 76),
(0, 72, 78),
(0, 73, 79);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ConversationRatingTypes`
--

DROP TABLE IF EXISTS `ConversationRatingTypes`;
CREATE TABLE `ConversationRatingTypes` (
  `cnvRatingTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cnvRatingTypeHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cnvRatingTypeName` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cnvRatingTypeCommunityPoints` int(11) DEFAULT NULL,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cnvRatingTypeID`),
  UNIQUE KEY `cnvRatingTypeHandle` (`cnvRatingTypeHandle`),
  KEY `pkgID` (`pkgID`,`cnvRatingTypeHandle`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `ConversationRatingTypes`
--

INSERT INTO `ConversationRatingTypes` (`cnvRatingTypeID`, `cnvRatingTypeHandle`, `cnvRatingTypeName`, `cnvRatingTypeCommunityPoints`, `pkgID`) VALUES
(1, 'up_vote', 'Up Vote', 1, 0),
(2, 'down_vote', 'Down Vote', 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Conversations`
--

DROP TABLE IF EXISTS `Conversations`;
CREATE TABLE `Conversations` (
  `cnvID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cID` int(10) unsigned DEFAULT '0',
  `cnvDateCreated` datetime NOT NULL,
  `cnvDateLastMessage` datetime DEFAULT NULL,
  `cnvParentMessageID` int(10) unsigned DEFAULT '0',
  `cnvAttachmentsEnabled` tinyint(1) NOT NULL DEFAULT '1',
  `cnvMessagesTotal` int(10) unsigned DEFAULT '0',
  `cnvOverrideGlobalPermissions` smallint(5) unsigned DEFAULT '0',
  `cnvAttachmentOverridesEnabled` tinyint(1) NOT NULL DEFAULT '0',
  `cnvMaxFilesGuest` int(11) DEFAULT '0',
  `cnvMaxFilesRegistered` int(11) DEFAULT '0',
  `cnvMaxFileSizeGuest` int(11) DEFAULT '0',
  `cnvMaxFileSizeRegistered` int(11) DEFAULT '0',
  `cnvFileExtensions` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`cnvID`),
  KEY `cID` (`cID`),
  KEY `cnvParentMessageID` (`cnvParentMessageID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Daten für Tabelle `Conversations`
--

INSERT INTO `Conversations` (`cnvID`, `cID`, `cnvDateCreated`, `cnvDateLastMessage`, `cnvParentMessageID`, `cnvAttachmentsEnabled`, `cnvMessagesTotal`, `cnvOverrideGlobalPermissions`, `cnvAttachmentOverridesEnabled`, `cnvMaxFilesGuest`, `cnvMaxFilesRegistered`, `cnvMaxFileSizeGuest`, `cnvMaxFileSizeRegistered`, `cnvFileExtensions`) VALUES
(1, 167, '2015-04-06 20:46:14', '2015-04-06 20:46:14', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(2, 168, '2015-04-06 20:46:27', '2015-04-06 20:46:27', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(3, 169, '2015-04-06 20:46:28', '2015-04-06 20:46:28', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(4, 170, '2015-04-06 20:46:28', '2015-04-06 20:46:28', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(5, 1, '2015-04-24 21:57:05', '2015-04-24 21:57:26', 0, 0, 1, 0, 0, 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `DownloadStatistics`
--

DROP TABLE IF EXISTS `DownloadStatistics`;
CREATE TABLE `DownloadStatistics` (
  `dsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fID` int(10) unsigned NOT NULL,
  `fvID` int(10) unsigned NOT NULL,
  `uID` int(10) unsigned NOT NULL,
  `rcID` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dsID`),
  KEY `fID` (`fID`,`timestamp`),
  KEY `fvID` (`fID`,`fvID`),
  KEY `uID` (`uID`),
  KEY `rcID` (`rcID`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `DownloadStatistics`
--

INSERT INTO `DownloadStatistics` (`dsID`, `fID`, `fvID`, `uID`, `rcID`, `timestamp`) VALUES
(1, 16, 1, 1, 183, '2015-07-30 19:12:05'),
(2, 16, 1, 1, 198, '2015-08-05 20:30:36');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `FeatureAssignments`
--

DROP TABLE IF EXISTS `FeatureAssignments`;
CREATE TABLE `FeatureAssignments` (
  `faID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `feID` int(10) unsigned DEFAULT NULL,
  `fcID` int(10) unsigned DEFAULT NULL,
  `fdObject` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`faID`),
  KEY `feID` (`feID`),
  KEY `fcID` (`fcID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Daten für Tabelle `FeatureAssignments`
--

INSERT INTO `FeatureAssignments` (`faID`, `feID`, `fcID`, `fdObject`) VALUES
(1, 6, 1, 'O:47:"Concrete\\Core\\Feature\\Detail\\ConversationDetail":3:{s:8:"\0*\0cnvID";s:1:"1";s:7:"\0*\0item";N;s:5:"error";s:0:"";}'),
(2, 5, 1, 'O:40:"Concrete\\Core\\Feature\\Detail\\ImageDetail":5:{s:6:"\0*\0src";s:73:"/newGryfiPage/concrete5.7.3.1/application/files/5014/2834/5942/blank2.png";s:8:"\0*\0width";d:250;s:9:"\0*\0height";d:252;s:7:"\0*\0item";N;s:5:"error";s:0:"";}'),
(3, 6, 1, 'O:47:"Concrete\\Core\\Feature\\Detail\\ConversationDetail":3:{s:8:"\0*\0cnvID";s:1:"2";s:7:"\0*\0item";N;s:5:"error";s:0:"";}'),
(4, 6, 1, 'O:47:"Concrete\\Core\\Feature\\Detail\\ConversationDetail":3:{s:8:"\0*\0cnvID";s:1:"3";s:7:"\0*\0item";N;s:5:"error";s:0:"";}'),
(5, 6, 1, 'O:47:"Concrete\\Core\\Feature\\Detail\\ConversationDetail":3:{s:8:"\0*\0cnvID";s:1:"4";s:7:"\0*\0item";N;s:5:"error";s:0:"";}'),
(6, 5, 1, 'O:40:"Concrete\\Core\\Feature\\Detail\\ImageDetail":5:{s:6:"\0*\0src";s:81:"/newGryfiPage/concrete5.7.3.1/application/files/7814/2834/5946/chinese_house2.jpg";s:8:"\0*\0width";d:200;s:9:"\0*\0height";d:200;s:7:"\0*\0item";N;s:5:"error";s:0:"";}'),
(7, 5, 1, 'O:40:"Concrete\\Core\\Feature\\Detail\\ImageDetail":5:{s:6:"\0*\0src";s:72:"/newGryfiPage/concrete5.7.3.1/application/files/6114/2834/5942/blank.png";s:8:"\0*\0width";d:592;s:9:"\0*\0height";d:397;s:7:"\0*\0item";N;s:5:"error";s:0:"";}'),
(8, 5, 1, 'O:40:"Concrete\\Core\\Feature\\Detail\\ImageDetail":5:{s:6:"\0*\0src";s:72:"/newGryfiPage/concrete5.7.3.1/application/files/6114/2834/5942/blank.png";s:8:"\0*\0width";d:592;s:9:"\0*\0height";d:397;s:7:"\0*\0item";N;s:5:"error";s:0:"";}'),
(9, 5, 1, 'O:40:"Concrete\\Core\\Feature\\Detail\\ImageDetail":5:{s:6:"\0*\0src";s:73:"/newGryfiPage/concrete5.7.3.1/application/files/5014/2834/5942/blank2.png";s:8:"\0*\0width";d:250;s:9:"\0*\0height";d:252;s:7:"\0*\0item";N;s:5:"error";s:0:"";}'),
(10, 5, 1, 'O:40:"Concrete\\Core\\Feature\\Detail\\ImageDetail":5:{s:6:"\0*\0src";s:75:"/newGryfiPage/concrete5.7.3.1/application/files/8514/2834/5949/masthead.png";s:8:"\0*\0width";d:1100;s:9:"\0*\0height";d:263;s:7:"\0*\0item";N;s:5:"error";s:0:"";}'),
(11, 6, 1, 'O:47:"Concrete\\Core\\Feature\\Detail\\ConversationDetail":3:{s:8:"\0*\0cnvID";s:1:"5";s:7:"\0*\0item";N;s:5:"error";s:0:"";}'),
(13, 5, 1, 'O:40:"Concrete\\Core\\Feature\\Detail\\ImageDetail":5:{s:6:"\0*\0src";s:73:"/newGryfiPage/concrete5.7.3.1/application/files/2814/2834/5965/sunset.jpg";s:8:"\0*\0width";d:1600;s:9:"\0*\0height";d:953;s:7:"\0*\0item";N;s:5:"error";s:0:"";}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `FeatureCategories`
--

DROP TABLE IF EXISTS `FeatureCategories`;
CREATE TABLE `FeatureCategories` (
  `fcID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fcHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`fcID`),
  UNIQUE KEY `fcHandle` (`fcHandle`),
  KEY `pkgID` (`pkgID`,`fcID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `FeatureCategories`
--

INSERT INTO `FeatureCategories` (`fcID`, `fcHandle`, `pkgID`) VALUES
(1, 'collection_version', 0),
(2, 'gathering_item', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Features`
--

DROP TABLE IF EXISTS `Features`;
CREATE TABLE `Features` (
  `feID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `feHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `feScore` int(11) NOT NULL DEFAULT '1',
  `feHasCustomClass` tinyint(1) NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`feID`),
  UNIQUE KEY `feHandle` (`feHandle`),
  KEY `pkgID` (`pkgID`,`feID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Daten für Tabelle `Features`
--

INSERT INTO `Features` (`feID`, `feHandle`, `feScore`, `feHasCustomClass`, `pkgID`) VALUES
(1, 'title', 1, 0, 0),
(2, 'link', 1, 0, 0),
(3, 'author', 1, 0, 0),
(4, 'date_time', 1, 0, 0),
(5, 'image', 500, 1, 0),
(6, 'conversation', 10, 1, 0),
(7, 'description', 1, 0, 0),
(8, 'featured', 1000, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `FileAttributeValues`
--

DROP TABLE IF EXISTS `FileAttributeValues`;
CREATE TABLE `FileAttributeValues` (
  `fID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `avID` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`fID`,`fvID`,`akID`),
  KEY `akID` (`akID`),
  KEY `avID` (`avID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `FileAttributeValues`
--

INSERT INTO `FileAttributeValues` (`fID`, `fvID`, `akID`, `avID`) VALUES
(1, 1, 14, 112),
(1, 1, 15, 113),
(2, 1, 14, 114),
(2, 1, 15, 115),
(3, 1, 14, 116),
(3, 1, 15, 117),
(4, 1, 14, 118),
(4, 1, 15, 119),
(5, 1, 14, 120),
(5, 1, 15, 121),
(6, 1, 14, 122),
(6, 1, 15, 123),
(7, 1, 14, 124),
(7, 1, 15, 125),
(8, 1, 14, 126),
(8, 1, 15, 127),
(9, 1, 14, 128),
(9, 1, 15, 129),
(10, 1, 14, 130),
(10, 1, 15, 131),
(11, 1, 14, 132),
(11, 1, 15, 133),
(12, 1, 14, 134),
(12, 1, 15, 135),
(13, 1, 14, 136),
(13, 1, 15, 137),
(14, 1, 14, 138),
(14, 1, 15, 139),
(15, 1, 14, 140),
(15, 1, 15, 141),
(16, 1, 14, 142),
(16, 1, 15, 143);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `FileImageThumbnailTypes`
--

DROP TABLE IF EXISTS `FileImageThumbnailTypes`;
CREATE TABLE `FileImageThumbnailTypes` (
  `ftTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ftTypeHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ftTypeName` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ftTypeWidth` int(11) NOT NULL DEFAULT '0',
  `ftTypeHeight` int(11) DEFAULT NULL,
  `ftTypeIsRequired` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ftTypeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Daten für Tabelle `FileImageThumbnailTypes`
--

INSERT INTO `FileImageThumbnailTypes` (`ftTypeID`, `ftTypeHandle`, `ftTypeName`, `ftTypeWidth`, `ftTypeHeight`, `ftTypeIsRequired`) VALUES
(1, 'small', 'Small Image', 740, NULL, 0),
(2, 'medium', 'Medium Image', 940, NULL, 0),
(3, 'large', 'Large Image', 1140, NULL, 0),
(4, 'file_manager_listing', 'File Manager Thumbnails', 60, 60, 1),
(5, 'file_manager_detail', 'File Manager Detail Thumbnails', 400, NULL, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `FilePermissionAssignments`
--

DROP TABLE IF EXISTS `FilePermissionAssignments`;
CREATE TABLE `FilePermissionAssignments` (
  `fID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fID`,`pkID`,`paID`),
  KEY `pkID` (`pkID`),
  KEY `paID` (`paID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `FilePermissionAssignments`
--

INSERT INTO `FilePermissionAssignments` (`fID`, `pkID`, `paID`) VALUES
(16, 48, 38),
(16, 49, 39),
(16, 50, 40),
(16, 51, 41),
(16, 52, 42),
(16, 53, 43),
(16, 54, 44);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `FilePermissionFileTypes`
--

DROP TABLE IF EXISTS `FilePermissionFileTypes`;
CREATE TABLE `FilePermissionFileTypes` (
  `extension` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `fsID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fsID`,`gID`,`uID`,`extension`),
  KEY `gID` (`gID`),
  KEY `uID` (`uID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Files`
--

DROP TABLE IF EXISTS `Files`;
CREATE TABLE `Files` (
  `fID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fDateAdded` datetime DEFAULT NULL,
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `fslID` int(10) unsigned NOT NULL DEFAULT '0',
  `ocID` int(10) unsigned NOT NULL DEFAULT '0',
  `fOverrideSetPermissions` tinyint(1) NOT NULL DEFAULT '0',
  `fPassword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fID`,`uID`,`fslID`),
  KEY `uID` (`uID`),
  KEY `fslID` (`fslID`),
  KEY `ocID` (`ocID`),
  KEY `fOverrideSetPermissions` (`fOverrideSetPermissions`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Daten für Tabelle `Files`
--

INSERT INTO `Files` (`fID`, `fDateAdded`, `uID`, `fslID`, `ocID`, `fOverrideSetPermissions`, `fPassword`) VALUES
(1, '2015-04-06 20:45:40', 1, 1, 0, 0, NULL),
(2, '2015-04-06 20:45:41', 1, 1, 0, 0, NULL),
(3, '2015-04-06 20:45:41', 1, 1, 0, 0, NULL),
(4, '2015-04-06 20:45:42', 1, 1, 0, 0, NULL),
(5, '2015-04-06 20:45:42', 1, 1, 0, 0, NULL),
(6, '2015-04-06 20:45:42', 1, 1, 0, 0, NULL),
(7, '2015-04-06 20:45:46', 1, 1, 0, 0, NULL),
(8, '2015-04-06 20:45:46', 1, 1, 0, 0, NULL),
(9, '2015-04-06 20:45:49', 1, 1, 0, 0, NULL),
(10, '2015-04-06 20:45:50', 1, 1, 0, 0, NULL),
(11, '2015-04-06 20:45:54', 1, 1, 0, 0, NULL),
(12, '2015-04-06 20:45:57', 1, 1, 0, 0, NULL),
(13, '2015-04-06 20:46:00', 1, 1, 0, 0, NULL),
(14, '2015-04-06 20:46:01', 1, 1, 0, 0, NULL),
(15, '2015-04-06 20:46:02', 1, 1, 0, 0, NULL),
(16, '2015-04-06 20:46:05', 1, 1, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `FileSearchIndexAttributes`
--

DROP TABLE IF EXISTS `FileSearchIndexAttributes`;
CREATE TABLE `FileSearchIndexAttributes` (
  `fID` int(10) unsigned NOT NULL DEFAULT '0',
  `ak_width` decimal(14,4) DEFAULT '0.0000',
  `ak_height` decimal(14,4) DEFAULT '0.0000',
  `ak_duration` decimal(14,4) DEFAULT '0.0000',
  PRIMARY KEY (`fID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `FileSearchIndexAttributes`
--

INSERT INTO `FileSearchIndexAttributes` (`fID`, `ak_width`, `ak_height`, `ak_duration`) VALUES
(1, 200.0000, 200.0000, 0.0000),
(2, 500.0000, 500.0000, 0.0000),
(3, 460.0000, 460.0000, 0.0000),
(4, 592.0000, 397.0000, 0.0000),
(5, 250.0000, 252.0000, 0.0000),
(6, 1600.0000, 1067.0000, 0.0000),
(7, 200.0000, 200.0000, 0.0000),
(8, 1499.0000, 1067.0000, 0.0000),
(9, 1100.0000, 263.0000, 0.0000),
(10, 1600.0000, 1067.0000, 0.0000),
(11, 1600.0000, 1066.0000, 0.0000),
(12, 1600.0000, 1067.0000, 0.0000),
(13, 1100.0000, 368.0000, 0.0000),
(14, 1100.0000, 368.0000, 0.0000),
(15, 1600.0000, 1067.0000, 0.0000),
(16, 1600.0000, 953.0000, 0.0000);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `FileSetFiles`
--

DROP TABLE IF EXISTS `FileSetFiles`;
CREATE TABLE `FileSetFiles` (
  `fsfID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fID` int(10) unsigned NOT NULL,
  `fsID` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fsDisplayOrder` int(10) unsigned NOT NULL,
  PRIMARY KEY (`fsfID`),
  KEY `fID` (`fID`),
  KEY `fsID` (`fsID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `FileSetFiles`
--

INSERT INTO `FileSetFiles` (`fsfID`, `fID`, `fsID`, `timestamp`, `fsDisplayOrder`) VALUES
(1, 16, 1, '2015-08-05 20:17:21', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `FileSetPermissionAssignments`
--

DROP TABLE IF EXISTS `FileSetPermissionAssignments`;
CREATE TABLE `FileSetPermissionAssignments` (
  `fsID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fsID`,`pkID`,`paID`),
  KEY `paID` (`paID`),
  KEY `pkID` (`pkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `FileSetPermissionAssignments`
--

INSERT INTO `FileSetPermissionAssignments` (`fsID`, `pkID`, `paID`) VALUES
(0, 39, 38),
(0, 40, 39),
(0, 41, 40),
(0, 42, 41),
(0, 43, 42),
(0, 44, 43),
(0, 45, 45),
(0, 46, 44),
(0, 47, 46);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `FileSetPermissionFileTypeAccessList`
--

DROP TABLE IF EXISTS `FileSetPermissionFileTypeAccessList`;
CREATE TABLE `FileSetPermissionFileTypeAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`),
  KEY `peID` (`peID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `FileSetPermissionFileTypeAccessListCustom`
--

DROP TABLE IF EXISTS `FileSetPermissionFileTypeAccessListCustom`;
CREATE TABLE `FileSetPermissionFileTypeAccessListCustom` (
  `extension` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`extension`),
  KEY `peID` (`peID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `FileSets`
--

DROP TABLE IF EXISTS `FileSets`;
CREATE TABLE `FileSets` (
  `fsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fsName` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `fsType` smallint(6) NOT NULL,
  `fsOverrideGlobalPermissions` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`fsID`),
  KEY `uID` (`uID`,`fsType`,`fsName`),
  KEY `fsName` (`fsName`),
  KEY `fsType` (`fsType`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `FileSets`
--

INSERT INTO `FileSets` (`fsID`, `fsName`, `uID`, `fsType`, `fsOverrideGlobalPermissions`) VALUES
(1, 'Digital Downloads', 0, 1, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `FileSetSavedSearches`
--

DROP TABLE IF EXISTS `FileSetSavedSearches`;
CREATE TABLE `FileSetSavedSearches` (
  `fsID` int(10) unsigned NOT NULL DEFAULT '0',
  `fsSearchRequest` text COLLATE utf8_unicode_ci,
  `fsResultColumns` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`fsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `FileStorageLocations`
--

DROP TABLE IF EXISTS `FileStorageLocations`;
CREATE TABLE `FileStorageLocations` (
  `fslID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fslName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fslConfiguration` longtext COLLATE utf8_unicode_ci NOT NULL,
  `fslIsDefault` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fslID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `FileStorageLocations`
--

INSERT INTO `FileStorageLocations` (`fslID`, `fslName`, `fslConfiguration`, `fslIsDefault`) VALUES
(1, 'Default', 'O:69:"Concrete\\Core\\File\\StorageLocation\\Configuration\\DefaultConfiguration":1:{s:10:"\0*\0default";b:1;}', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `FileStorageLocationTypes`
--

DROP TABLE IF EXISTS `FileStorageLocationTypes`;
CREATE TABLE `FileStorageLocationTypes` (
  `fslTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fslTypeHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fslTypeName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fslTypeID`),
  UNIQUE KEY `fslTypeHandle` (`fslTypeHandle`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `FileStorageLocationTypes`
--

INSERT INTO `FileStorageLocationTypes` (`fslTypeID`, `fslTypeHandle`, `fslTypeName`, `pkgID`) VALUES
(1, 'default', 'Default', 0),
(2, 'local', 'Local', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `FileVersionLog`
--

DROP TABLE IF EXISTS `FileVersionLog`;
CREATE TABLE `FileVersionLog` (
  `fvlID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvUpdateTypeID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fvUpdateTypeAttributeID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fvlID`),
  KEY `fvID` (`fID`,`fvID`,`fvlID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=33 ;

--
-- Daten für Tabelle `FileVersionLog`
--

INSERT INTO `FileVersionLog` (`fvlID`, `fID`, `fvID`, `fvUpdateTypeID`, `fvUpdateTypeAttributeID`) VALUES
(1, 1, 1, 5, 14),
(2, 1, 1, 5, 15),
(3, 2, 1, 5, 14),
(4, 2, 1, 5, 15),
(5, 3, 1, 5, 14),
(6, 3, 1, 5, 15),
(7, 4, 1, 5, 14),
(8, 4, 1, 5, 15),
(9, 5, 1, 5, 14),
(10, 5, 1, 5, 15),
(11, 6, 1, 5, 14),
(12, 6, 1, 5, 15),
(13, 7, 1, 5, 14),
(14, 7, 1, 5, 15),
(15, 8, 1, 5, 14),
(16, 8, 1, 5, 15),
(17, 9, 1, 5, 14),
(18, 9, 1, 5, 15),
(19, 10, 1, 5, 14),
(20, 10, 1, 5, 15),
(21, 11, 1, 5, 14),
(22, 11, 1, 5, 15),
(23, 12, 1, 5, 14),
(24, 12, 1, 5, 15),
(25, 13, 1, 5, 14),
(26, 13, 1, 5, 15),
(27, 14, 1, 5, 14),
(28, 14, 1, 5, 15),
(29, 15, 1, 5, 14),
(30, 15, 1, 5, 15),
(31, 16, 1, 5, 14),
(32, 16, 1, 5, 15);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `FileVersions`
--

DROP TABLE IF EXISTS `FileVersions`;
CREATE TABLE `FileVersions` (
  `fID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvFilename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fvPrefix` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fvGenericType` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fvSize` int(10) unsigned NOT NULL DEFAULT '0',
  `fvTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fvDescription` text COLLATE utf8_unicode_ci,
  `fvTags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fvIsApproved` int(10) unsigned NOT NULL DEFAULT '1',
  `fvDateAdded` datetime DEFAULT NULL,
  `fvApproverUID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvAuthorUID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvActivateDatetime` datetime DEFAULT NULL,
  `fvHasListingThumbnail` tinyint(1) NOT NULL DEFAULT '0',
  `fvHasDetailThumbnail` tinyint(1) NOT NULL DEFAULT '0',
  `fvExtension` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fvType` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fID`,`fvID`),
  KEY `fvExtension` (`fvExtension`),
  KEY `fvType` (`fvType`),
  KEY `fvFilename` (`fvFilename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `FileVersions`
--

INSERT INTO `FileVersions` (`fID`, `fvID`, `fvFilename`, `fvPrefix`, `fvGenericType`, `fvSize`, `fvTitle`, `fvDescription`, `fvTags`, `fvIsApproved`, `fvDateAdded`, `fvApproverUID`, `fvAuthorUID`, `fvActivateDatetime`, `fvHasListingThumbnail`, `fvHasDetailThumbnail`, `fvExtension`, `fvType`) VALUES
(1, 1, 'avatar_none.png', '571428345940', 0, 12769, 'avatar_none.png', NULL, '', 1, '2015-04-06 20:45:40', 1, 1, '2015-04-06 20:45:40', 1, 0, 'png', 1),
(2, 1, 'balloon.jpg', '981428345941', 0, 49708, 'balloon.jpg', NULL, '', 1, '2015-04-06 20:45:41', 1, 1, '2015-04-06 20:45:41', 1, 1, 'jpg', 1),
(3, 1, 'bio.png', '491428345941', 0, 1353, 'bio.png', NULL, '', 1, '2015-04-06 20:45:41', 1, 1, '2015-04-06 20:45:41', 1, 1, 'png', 1),
(4, 1, 'blank.png', '611428345942', 0, 1837, 'blank.png', NULL, '', 1, '2015-04-06 20:45:42', 1, 1, '2015-04-06 20:45:42', 1, 1, 'png', 1),
(5, 1, 'blank2.png', '501428345942', 0, 1210, 'blank2.png', NULL, '', 1, '2015-04-06 20:45:42', 1, 1, '2015-04-06 20:45:42', 1, 0, 'png', 1),
(6, 1, 'bridge.jpg', '721428345942', 0, 211901, 'bridge.jpg', NULL, '', 1, '2015-04-06 20:45:42', 1, 1, '2015-04-06 20:45:42', 1, 1, 'jpg', 1),
(7, 1, 'chinese_house2.jpg', '781428345946', 0, 84383, 'chinese_house2.jpg', NULL, '', 1, '2015-04-06 20:45:46', 1, 1, '2015-04-06 20:45:46', 1, 0, 'jpg', 1),
(8, 1, 'houses.jpg', '781428345946', 0, 293154, 'houses.jpg', NULL, '', 1, '2015-04-06 20:45:46', 1, 1, '2015-04-06 20:45:46', 1, 1, 'jpg', 1),
(9, 1, 'masthead.png', '851428345949', 0, 1429, 'masthead.png', NULL, '', 1, '2015-04-06 20:45:49', 1, 1, '2015-04-06 20:45:49', 1, 1, 'png', 1),
(10, 1, 'mountains.jpg', '211428345950', 0, 330436, 'mountains.jpg', NULL, '', 1, '2015-04-06 20:45:50', 1, 1, '2015-04-06 20:45:50', 1, 1, 'jpg', 1),
(11, 1, 'plants.jpg', '491428345954', 0, 373839, 'plants.jpg', NULL, '', 1, '2015-04-06 20:45:54', 1, 1, '2015-04-06 20:45:54', 1, 1, 'jpg', 1),
(12, 1, 'shoes.jpg', '441428345957', 0, 170179, 'shoes.jpg', NULL, '', 1, '2015-04-06 20:45:57', 1, 1, '2015-04-06 20:45:57', 1, 1, 'jpg', 1),
(13, 1, 'slider1.png', '571428345960', 0, 338112, 'slider1.png', NULL, '', 1, '2015-04-06 20:46:00', 1, 1, '2015-04-06 20:46:00', 1, 1, 'png', 1),
(14, 1, 'slider2.png', '631428345961', 0, 406839, 'slider2.png', NULL, '', 1, '2015-04-06 20:46:01', 1, 1, '2015-04-06 20:46:01', 1, 1, 'png', 1),
(15, 1, 'subway.jpg', '401428345962', 0, 305595, 'subway.jpg', NULL, '', 1, '2015-04-06 20:46:02', 1, 1, '2015-04-06 20:46:02', 1, 1, 'jpg', 1),
(16, 1, 'sunset.jpg', '281428345965', 0, 458047, 'sunset.jpg', NULL, '', 1, '2015-04-06 20:46:05', 1, 1, '2015-04-06 20:46:05', 1, 1, 'jpg', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gaPage`
--

DROP TABLE IF EXISTS `gaPage`;
CREATE TABLE `gaPage` (
  `gaiID` int(10) unsigned NOT NULL,
  `cID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`gaiID`),
  KEY `cID` (`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `GatheringConfiguredDataSources`
--

DROP TABLE IF EXISTS `GatheringConfiguredDataSources`;
CREATE TABLE `GatheringConfiguredDataSources` (
  `gcsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gaID` int(10) unsigned DEFAULT NULL,
  `gasID` int(10) unsigned DEFAULT NULL,
  `gcdObject` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`gcsID`),
  KEY `gaID` (`gaID`),
  KEY `gasID` (`gasID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `GatheringDataSources`
--

DROP TABLE IF EXISTS `GatheringDataSources`;
CREATE TABLE `GatheringDataSources` (
  `gasID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gasName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gasHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  `gasDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`gasID`),
  UNIQUE KEY `gasHandle` (`gasHandle`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Daten für Tabelle `GatheringDataSources`
--

INSERT INTO `GatheringDataSources` (`gasID`, `gasName`, `gasHandle`, `pkgID`, `gasDisplayOrder`) VALUES
(1, 'Site Page', 'page', 0, 0),
(2, 'RSS Feed', 'rss_feed', 0, 1),
(3, 'Flickr Feed', 'flickr_feed', 0, 2),
(4, 'Twitter', 'twitter', 0, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `GatheringItemFeatureAssignments`
--

DROP TABLE IF EXISTS `GatheringItemFeatureAssignments`;
CREATE TABLE `GatheringItemFeatureAssignments` (
  `gafaID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gaiID` int(10) unsigned DEFAULT NULL,
  `faID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`gafaID`),
  KEY `gaiID` (`gaiID`,`faID`),
  KEY `faID` (`faID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `GatheringItems`
--

DROP TABLE IF EXISTS `GatheringItems`;
CREATE TABLE `GatheringItems` (
  `gaiID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gaID` int(10) unsigned DEFAULT NULL,
  `gasID` int(10) unsigned DEFAULT NULL,
  `gaiDateTimeCreated` datetime NOT NULL,
  `gaiPublicDateTime` datetime NOT NULL,
  `gaiTitle` text COLLATE utf8_unicode_ci,
  `gaiSlotWidth` int(10) unsigned DEFAULT '1',
  `gaiSlotHeight` int(10) unsigned DEFAULT '1',
  `gaiKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gaiBatchDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `gaiBatchTimestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `gaiIsDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`gaiID`),
  UNIQUE KEY `gaiUniqueKey` (`gaiKey`,`gasID`,`gaID`),
  KEY `gaID` (`gaID`,`gaiBatchTimestamp`),
  KEY `gasID` (`gasID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `GatheringItemSelectedTemplates`
--

DROP TABLE IF EXISTS `GatheringItemSelectedTemplates`;
CREATE TABLE `GatheringItemSelectedTemplates` (
  `gaiID` int(10) unsigned NOT NULL DEFAULT '0',
  `gatID` int(10) unsigned NOT NULL DEFAULT '0',
  `gatTypeID` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`gaiID`,`gatID`),
  UNIQUE KEY `gatUniqueKey` (`gaiID`,`gatTypeID`),
  KEY `gatTypeID` (`gatTypeID`),
  KEY `gatID` (`gatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `GatheringItemTemplateFeatures`
--

DROP TABLE IF EXISTS `GatheringItemTemplateFeatures`;
CREATE TABLE `GatheringItemTemplateFeatures` (
  `gfeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gatID` int(10) unsigned DEFAULT NULL,
  `feID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`gfeID`),
  KEY `gatID` (`gatID`),
  KEY `feID` (`feID`,`gatID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=67 ;

--
-- Daten für Tabelle `GatheringItemTemplateFeatures`
--

INSERT INTO `GatheringItemTemplateFeatures` (`gfeID`, `gatID`, `feID`) VALUES
(4, 1, 1),
(10, 2, 1),
(13, 3, 1),
(16, 4, 1),
(19, 5, 1),
(23, 7, 1),
(29, 11, 1),
(33, 12, 1),
(37, 13, 1),
(42, 14, 1),
(47, 15, 1),
(53, 17, 1),
(56, 18, 1),
(63, 21, 1),
(64, 22, 1),
(3, 1, 2),
(9, 2, 2),
(12, 3, 2),
(15, 4, 2),
(18, 5, 2),
(21, 6, 2),
(25, 8, 2),
(27, 9, 2),
(41, 13, 3),
(46, 14, 3),
(51, 16, 3),
(55, 17, 3),
(62, 20, 3),
(66, 22, 3),
(2, 1, 4),
(8, 2, 4),
(14, 4, 4),
(17, 5, 4),
(31, 11, 4),
(35, 12, 4),
(39, 13, 4),
(44, 14, 4),
(61, 20, 4),
(5, 1, 5),
(22, 6, 5),
(24, 8, 5),
(26, 9, 5),
(28, 10, 5),
(32, 11, 5),
(36, 12, 5),
(40, 13, 5),
(45, 14, 5),
(49, 15, 5),
(50, 16, 5),
(59, 19, 5),
(65, 22, 5),
(20, 5, 6),
(1, 1, 7),
(7, 2, 7),
(11, 3, 7),
(30, 11, 7),
(34, 12, 7),
(38, 13, 7),
(43, 14, 7),
(48, 15, 7),
(52, 16, 7),
(54, 17, 7),
(57, 18, 7),
(58, 19, 7),
(60, 20, 7),
(6, 1, 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `GatheringItemTemplates`
--

DROP TABLE IF EXISTS `GatheringItemTemplates`;
CREATE TABLE `GatheringItemTemplates` (
  `gatID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gatHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gatName` text COLLATE utf8_unicode_ci,
  `gatHasCustomClass` tinyint(1) NOT NULL DEFAULT '0',
  `gatFixedSlotWidth` int(10) unsigned DEFAULT '0',
  `gatFixedSlotHeight` int(10) unsigned DEFAULT '0',
  `gatForceDefault` int(10) unsigned DEFAULT '0',
  `pkgID` int(10) unsigned DEFAULT NULL,
  `gatTypeID` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`gatID`),
  UNIQUE KEY `gatHandle` (`gatHandle`,`gatTypeID`),
  KEY `gatTypeID` (`gatTypeID`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

--
-- Daten für Tabelle `GatheringItemTemplates`
--

INSERT INTO `GatheringItemTemplates` (`gatID`, `gatHandle`, `gatName`, `gatHasCustomClass`, `gatFixedSlotWidth`, `gatFixedSlotHeight`, `gatForceDefault`, `pkgID`, `gatTypeID`) VALUES
(1, 'featured', 'Featured Item', 0, 6, 2, 1, 0, 1),
(2, 'title_date_description', 'Title Date & Description', 0, 0, 0, 0, 0, 1),
(3, 'title_description', 'Title & Description', 0, 0, 0, 0, 0, 1),
(4, 'title_date', 'Title & Date', 0, 0, 0, 0, 0, 1),
(5, 'title_date_comments', 'Title, Date & Comments', 1, 0, 0, 0, 0, 1),
(6, 'thumbnail', 'Thumbnail', 0, 0, 0, 0, 0, 1),
(7, 'basic', 'Basic', 0, 0, 0, 0, 0, 2),
(8, 'image_sharing_link', 'Image Sharing Link', 0, 0, 0, 0, 0, 2),
(9, 'image_conversation', 'Image Conversation', 0, 0, 0, 0, 0, 2),
(10, 'image', 'Large Image', 0, 0, 0, 0, 0, 2),
(11, 'masthead_image_left', 'Masthead Image Left', 0, 0, 0, 0, 0, 1),
(12, 'masthead_image_right', 'Masthead Image Right', 0, 0, 0, 0, 0, 1),
(13, 'masthead_image_byline_right', 'Masthead Image Byline Right', 0, 0, 0, 0, 0, 1),
(14, 'masthead_image_byline_left', 'Masthead Image Byline Left', 0, 0, 0, 0, 0, 1),
(15, 'image_masthead_description_center', 'Image Masthead Description Center', 0, 0, 0, 0, 0, 1),
(16, 'image_byline_description_center', 'Image Byline Description Center', 0, 0, 0, 0, 0, 1),
(17, 'masthead_byline_description', 'Masthead Byline Description', 0, 0, 0, 0, 0, 1),
(18, 'masthead_description', 'Masthead Description', 0, 0, 0, 0, 0, 1),
(19, 'thumbnail_description_center', 'Thumbnail & Description Center', 0, 0, 0, 0, 0, 1),
(20, 'tweet', 'Tweet', 0, 0, 0, 0, 0, 1),
(21, 'vimeo', 'Vimeo', 0, 0, 0, 0, 0, 1),
(22, 'image_overlay_headline', 'Image Overlay Headline', 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `GatheringItemTemplateTypes`
--

DROP TABLE IF EXISTS `GatheringItemTemplateTypes`;
CREATE TABLE `GatheringItemTemplateTypes` (
  `gatTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gatTypeHandle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`gatTypeID`),
  UNIQUE KEY `gatTypeHandle` (`gatTypeHandle`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `GatheringItemTemplateTypes`
--

INSERT INTO `GatheringItemTemplateTypes` (`gatTypeID`, `gatTypeHandle`, `pkgID`) VALUES
(1, 'tile', 0),
(2, 'detail', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `GatheringPermissionAssignments`
--

DROP TABLE IF EXISTS `GatheringPermissionAssignments`;
CREATE TABLE `GatheringPermissionAssignments` (
  `gaID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`gaID`,`pkID`,`paID`),
  KEY `pkID` (`pkID`),
  KEY `paID` (`paID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Gatherings`
--

DROP TABLE IF EXISTS `Gatherings`;
CREATE TABLE `Gatherings` (
  `gaID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gaDateCreated` datetime NOT NULL,
  `gaDateLastUpdated` datetime NOT NULL,
  PRIMARY KEY (`gaID`),
  KEY `gaDateLastUpdated` (`gaDateLastUpdated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Groups`
--

DROP TABLE IF EXISTS `Groups`;
CREATE TABLE `Groups` (
  `gID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gName` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `gDescription` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gUserExpirationIsEnabled` tinyint(1) NOT NULL DEFAULT '0',
  `gUserExpirationMethod` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gUserExpirationSetDateTime` datetime DEFAULT NULL,
  `gUserExpirationInterval` int(10) unsigned NOT NULL DEFAULT '0',
  `gUserExpirationAction` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gIsBadge` tinyint(1) NOT NULL DEFAULT '0',
  `gBadgeFID` int(10) unsigned NOT NULL DEFAULT '0',
  `gBadgeDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gBadgeCommunityPointValue` int(11) NOT NULL DEFAULT '0',
  `gIsAutomated` tinyint(1) NOT NULL DEFAULT '0',
  `gCheckAutomationOnRegister` tinyint(1) NOT NULL DEFAULT '0',
  `gCheckAutomationOnLogin` tinyint(1) NOT NULL DEFAULT '0',
  `gCheckAutomationOnJobRun` tinyint(1) NOT NULL DEFAULT '0',
  `gPath` text COLLATE utf8_unicode_ci,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`gID`),
  KEY `gName` (`gName`),
  KEY `gBadgeFID` (`gBadgeFID`),
  KEY `pkgID` (`pkgID`),
  KEY `gPath` (`gPath`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Daten für Tabelle `Groups`
--

INSERT INTO `Groups` (`gID`, `gName`, `gDescription`, `gUserExpirationIsEnabled`, `gUserExpirationMethod`, `gUserExpirationSetDateTime`, `gUserExpirationInterval`, `gUserExpirationAction`, `gIsBadge`, `gBadgeFID`, `gBadgeDescription`, `gBadgeCommunityPointValue`, `gIsAutomated`, `gCheckAutomationOnRegister`, `gCheckAutomationOnLogin`, `gCheckAutomationOnJobRun`, `gPath`, `pkgID`) VALUES
(1, 'Guest', 'The guest group represents unregistered visitors to your site.', 0, NULL, NULL, 0, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '/Guest', 0),
(2, 'Registered Users', 'The registered users group represents all user accounts.', 0, NULL, NULL, 0, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '/Registered Users', 0),
(3, 'Administrators', '', 0, NULL, NULL, 0, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '/Administrators', 0),
(4, 'owncloud', 'Benutzer, die auch zugriff auf die owncloud haben', 0, NULL, NULL, 0, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '/owncloud', 0),
(5, 'Store Customer', 'Registered Customer in your store', 0, NULL, NULL, 0, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '/Store Customer', 0),
(6, 'Leiter', '', 0, NULL, NULL, 0, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '/Leiter', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `GroupSetGroups`
--

DROP TABLE IF EXISTS `GroupSetGroups`;
CREATE TABLE `GroupSetGroups` (
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `gsID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`gID`,`gsID`),
  KEY `gsID` (`gsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `GroupSets`
--

DROP TABLE IF EXISTS `GroupSets`;
CREATE TABLE `GroupSets` (
  `gsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gsName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`gsID`),
  KEY `gsName` (`gsName`),
  KEY `pkgID` (`pkgID`,`gsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Jobs`
--

DROP TABLE IF EXISTS `Jobs`;
CREATE TABLE `Jobs` (
  `jID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `jDescription` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `jDateInstalled` datetime DEFAULT NULL,
  `jDateLastRun` datetime DEFAULT NULL,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  `jLastStatusText` longtext COLLATE utf8_unicode_ci,
  `jLastStatusCode` smallint(6) NOT NULL DEFAULT '0',
  `jStatus` varchar(14) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ENABLED',
  `jHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `jNotUninstallable` smallint(6) NOT NULL DEFAULT '0',
  `isScheduled` smallint(6) NOT NULL DEFAULT '0',
  `scheduledInterval` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'days',
  `scheduledValue` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`jID`),
  UNIQUE KEY `jHandle` (`jHandle`),
  KEY `pkgID` (`pkgID`),
  KEY `isScheduled` (`isScheduled`,`jDateLastRun`,`jID`),
  KEY `jDateLastRun` (`jDateLastRun`,`jID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Daten für Tabelle `Jobs`
--

INSERT INTO `Jobs` (`jID`, `jName`, `jDescription`, `jDateInstalled`, `jDateLastRun`, `pkgID`, `jLastStatusText`, `jLastStatusCode`, `jStatus`, `jHandle`, `jNotUninstallable`, `isScheduled`, `scheduledInterval`, `scheduledValue`) VALUES
(1, 'Index Search Engine - Updates', 'Index the site to allow searching to work quickly and accurately. Only reindexes pages that have changed since last indexing.', '2015-04-06 20:45:19', NULL, 0, NULL, 0, 'ENABLED', 'index_search', 1, 0, 'days', 0),
(2, 'Index Search Engine - All', 'Empties the page search index and reindexes all pages.', '2015-04-06 20:45:19', NULL, 0, NULL, 0, 'ENABLED', 'index_search_all', 1, 0, 'days', 0),
(3, 'Check Automated Groups', 'Automatically add users to groups and assign badges.', '2015-04-06 20:45:19', NULL, 0, NULL, 0, 'ENABLED', 'check_automated_groups', 0, 0, 'days', 0),
(4, 'Generate the sitemap.xml file', 'Generate the sitemap.xml file that search engines use to crawl your site.', '2015-04-06 20:45:19', NULL, 0, NULL, 0, 'ENABLED', 'generate_sitemap', 0, 0, 'days', 0),
(5, 'Process Email Posts', 'Polls an email account and grabs private messages/postings that are sent there..', '2015-04-06 20:45:19', NULL, 0, NULL, 0, 'ENABLED', 'process_email', 0, 0, 'days', 0),
(6, 'Remove Old Page Versions', 'Removes all except the 10 most recent page versions for each page.', '2015-04-06 20:45:19', NULL, 0, NULL, 0, 'ENABLED', 'remove_old_page_versions', 0, 0, 'days', 0),
(7, 'Update Gatherings', 'Loads new items into gatherings.', '2015-04-06 20:45:19', NULL, 0, NULL, 0, 'ENABLED', 'update_gatherings', 0, 0, 'days', 0),
(8, 'Clear Empty Workflow Progress', 'Deletes empty "Compare Versions" alert.', '2015-05-04 23:03:54', '2015-05-04 23:04:01', 0, 'The Job was run successfully.', 0, 'ENABLED', 'clear_empty_workflow_progress', 0, 1, 'days', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `JobSetJobs`
--

DROP TABLE IF EXISTS `JobSetJobs`;
CREATE TABLE `JobSetJobs` (
  `jsID` int(10) unsigned NOT NULL DEFAULT '0',
  `jID` int(10) unsigned NOT NULL DEFAULT '0',
  `jRunOrder` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`jsID`,`jID`),
  KEY `jID` (`jID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `JobSetJobs`
--

INSERT INTO `JobSetJobs` (`jsID`, `jID`, `jRunOrder`) VALUES
(1, 1, 0),
(1, 4, 0),
(1, 5, 0),
(1, 6, 0),
(1, 7, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `JobSets`
--

DROP TABLE IF EXISTS `JobSets`;
CREATE TABLE `JobSets` (
  `jsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jsName` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  `jDateLastRun` datetime DEFAULT NULL,
  `isScheduled` smallint(6) NOT NULL DEFAULT '0',
  `scheduledInterval` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'days',
  `scheduledValue` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`jsID`),
  KEY `pkgID` (`pkgID`),
  KEY `jsName` (`jsName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `JobSets`
--

INSERT INTO `JobSets` (`jsID`, `jsName`, `pkgID`, `jDateLastRun`, `isScheduled`, `scheduledInterval`, `scheduledValue`) VALUES
(1, 'Default', 0, NULL, 0, 'days', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `JobsLog`
--

DROP TABLE IF EXISTS `JobsLog`;
CREATE TABLE `JobsLog` (
  `jlID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jID` int(10) unsigned NOT NULL,
  `jlMessage` longtext COLLATE utf8_unicode_ci NOT NULL,
  `jlTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `jlError` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`jlID`),
  KEY `jID` (`jID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `JobsLog`
--

INSERT INTO `JobsLog` (`jlID`, `jID`, `jlMessage`, `jlTimestamp`, `jlError`) VALUES
(1, 8, 'The Job was run successfully.', '2015-05-04 21:04:01', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Logs`
--

DROP TABLE IF EXISTS `Logs`;
CREATE TABLE `Logs` (
  `logID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` int(10) unsigned NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci,
  `uID` int(10) unsigned DEFAULT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`logID`),
  KEY `channel` (`channel`),
  KEY `uID` (`uID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=117 ;

--
-- Daten für Tabelle `Logs`
--

INSERT INTO `Logs` (`logID`, `channel`, `time`, `message`, `uID`, `level`) VALUES
(1, 'exceptions', 1429480245, 'Fehler aufgetreten:/var/www/html/newGryfiPage/concrete5.7.3.1/concrete/src/Database/Connection/Connection.php:176 Missing argument 3 for Concrete\\Core\\Database\\Connection\\Connection::Replace(), called in /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/src/User/User.php on line 538 and defined (2)\n', 1, 600),
(2, 'exceptions', 1430419633, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/illuminate/container/Illuminate/Container/Container.php:501 Class html/div does not exist (-1)\n', 1, 600),
(3, 'exceptions', 1430419659, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/illuminate/container/Illuminate/Container/Container.php:501 Class html/div does not exist (-1)\n', 1, 600),
(4, 'exceptions', 1430419686, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/illuminate/container/Illuminate/Container/Container.php:501 Class html/div does not exist (-1)\n', 1, 600),
(5, 'exceptions', 1430419726, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/image/templates/mytemplate/view.php:12 Call to undefined method Concrete\\Block\\Image\\Controller::displayTable() (1)\n', 1, 600),
(6, 'exceptions', 1430470231, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/controllers/backend/page.php:51 Class ''Concrete\\Controller\\Backend\\Response'' not found (1)\n', 0, 600),
(7, 'exceptions', 1430470252, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/controllers/backend/page.php:51 Class ''Concrete\\Controller\\Backend\\Response'' not found (1)\n', 0, 600),
(8, 'exceptions', 1430768544, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/src/Block/View/BlockView.php:322 include(/var/www/html/newGryfiPage/concrete5.7.3.1/concrete/blocks/basic_table_block/views/table_view.php): failed to open stream: No such file or directory (2)\n', 0, 600),
(9, 'exceptions', 1430768850, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/src/Block/View/BlockView.php:322 include(/var/www/html/newGryfiPage/concrete5.7.3.1/concrete/blocks/basic_table_block/views/table_view.php): failed to open stream: No such file or directory (2)\n', 0, 600),
(10, 'exceptions', 1430768905, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/src/Block/View/BlockView.php:322 include(/var/www/html/newGryfiPage/concrete5.7.3.1/concrete/blocks/basic_table_block/views/table_view.php): failed to open stream: No such file or directory (2)\n', 0, 600),
(11, 'exceptions', 1430770079, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/views/form_view.php:7 Call to undefined method Application\\Block\\BasicTableBlock\\Controller::getRowValues() (1)\n', 1, 600),
(12, 'exceptions', 1430772468, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/controller.php:233 Cannot redeclare Application\\Block\\BasicTableBlock\\Controller::createInsertString() (64)\n', 1, 600),
(13, 'exceptions', 1430773417, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/jobs/clear_empty_workflow_progress.php:37 syntax error, unexpected ''hissy'' (T_STRING) (4)\n', 1, 600),
(14, 'exceptions', 1438722714, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/field_types/dropdown_field.php:2 syntax error, unexpected ''<'' (4)\n', 1, 600),
(15, 'exceptions', 1438722736, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/field_types/dropdown_field.php:18 syntax error, unexpected ''public'' (T_PUBLIC), expecting '','' or '';'' (4)\n', 1, 600),
(16, 'exceptions', 1438722766, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/views/table_view.php:46 Call to a member function setValue() on a non-object (1)\n', 1, 600),
(17, 'exceptions', 1438722833, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/views/table_view.php:46 Call to a member function setValue() on a non-object (1)\n', 1, 600),
(18, 'exceptions', 1438722997, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/eventtable/controller.php:56 Call to a member function setOptions() on a non-object (1)\n', 1, 600),
(19, 'exceptions', 1438726359, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/field_types/dropdown_field.php:45 syntax error, unexpected ''['' (4)\n', 0, 600),
(20, 'exceptions', 1438726407, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/field_types/dropdown_link_field.php:53 Default value for parameters with a class type hint can only be NULL (64)\n', 0, 600),
(21, 'exceptions', 1438726444, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/field_types/dropdown_link_field.php:53 Default value for parameters with a class type hint can only be NULL (64)\n', 0, 600),
(22, 'exceptions', 1438726458, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/field_types/dropdown_link_field.php:15 Class ''Application\\Block\\BasicTableBlock\\FieldTypes'' not found (1)\n', 0, 600),
(23, 'exceptions', 1438726486, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/field_types/dropdown_link_field.php:27 Argument 1 passed to Application\\Block\\BasicTableBlock\\FieldTypes\\DropdownLinkField::setLinkTable() must be an instance of Application\\Block\\BasicTableBlock\\FieldTypes\\String, string given, called in /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/eventtable/controller.php on line 60 and defined (4096)\n', 0, 600),
(24, 'exceptions', 1438726529, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/field_types/dropdown_link_field.php:90 Call to a member function query() on a non-object (1)\n', 0, 600),
(25, 'exceptions', 1438726568, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/doctrine/dbal/lib/Doctrine/DBAL/DBALException.php:91 An exception occurred while executing ''SELECT id, gName FROM Groups\n					WHERE '':\n\nSQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '''' at line 2 (0)\n', 0, 600),
(26, 'exceptions', 1438726661, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/doctrine/dbal/lib/Doctrine/DBAL/DBALException.php:91 An exception occurred while executing ''SELECT id, gName FROM Groups\n					WHERE  1=1 '':\n\nSQLSTATE[42S22]: Column not found: 1054 Unknown column ''id'' in ''field list'' (0)\n', 0, 600),
(27, 'exceptions', 1438802197, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/field_types/dropdown_field.php:51 syntax error, unexpected ''$html'' (T_VARIABLE) (4)\n', 0, 600),
(28, 'exceptions', 1438802285, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/tedivm/stash/src/Stash/Utilities.php:206 Cache path is not writable. (0)\n', 0, 600),
(29, 'exceptions', 1438802491, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/controller.php:400 Call to a member function getSQLFieldName() on a non-object (1)\n', 1, 600),
(30, 'exceptions', 1438802641, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/controller.php:400 Call to a member function getSQLFieldName() on a non-object (1)\n', 1, 600),
(31, 'exceptions', 1438802641, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/controller.php:400 Call to a member function getSQLFieldName() on a non-object (1)\n', 1, 600),
(32, 'exceptions', 1438802649, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/controller.php:400 Call to a member function getSQLFieldName() on a non-object (1)\n', 1, 600),
(33, 'exceptions', 1438802718, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/controller.php:400 Call to a member function getSQLFieldName() on a non-object (1)\n', 1, 600),
(34, 'exceptions', 1438802866, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/controller.php:400 Call to a member function getSQLFieldName() on a non-object (1)\n', 1, 600),
(35, 'exceptions', 1438802875, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/controller.php:400 Call to a member function getSQLFieldName() on a non-object (1)\n', 1, 600),
(36, 'exceptions', 1438802992, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/controller.php:400 Call to a member function getSQLFieldName() on a non-object (1)\n', 1, 600),
(37, 'exceptions', 1438803012, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/field_types/dropdown_field.php:28 Argument 1 passed to Application\\Block\\BasicTableBlock\\FieldTypes\\DropdownField::setOptions() must be of the type array, null given, called in /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/field_types/dropdown_link_field.php on line 103 and defined (4096)\n', 0, 600),
(38, 'exceptions', 1438803168, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/controller.php:400 Call to a member function getSQLFieldName() on a non-object (1)\n', 1, 600),
(39, 'exceptions', 1438803216, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/controller.php:400 Call to a member function getSQLFieldName() on a non-object (1)\n', 1, 600),
(40, 'exceptions', 1438803724, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/controller.php:401 Call to a member function getSQLFieldName() on a non-object (1)\n', 1, 600),
(41, 'exceptions', 1438803748, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/controller.php:401 Call to a member function getSQLFieldName() on a non-object (1)\n', 1, 600),
(42, 'exceptions', 1438803811, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/controller.php:401 Call to a member function getSQLFieldName() on a non-object (1)\n', 1, 600),
(43, 'exceptions', 1438803824, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/controller.php:401 Call to a member function getSQLFieldName() on a non-object (1)\n', 1, 600),
(44, 'exceptions', 1438803906, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/controller.php:403 Call to a member function getSQLFieldName() on a non-object (1)\n', 1, 600),
(45, 'exceptions', 1438803985, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/field_types/dropdown_field.php:28 Argument 1 passed to Application\\Block\\BasicTableBlock\\FieldTypes\\DropdownField::setOptions() must be of the type array, null given, called in /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/field_types/dropdown_link_field.php on line 103 and defined (4096)\n', 1, 600),
(46, 'exceptions', 1438804648, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/doctrine/dbal/lib/Doctrine/DBAL/DBALException.php:91 An exception occurred while executing ''INSERT INTO btEvents (date_from,date_to,time_from,time_to,title,description,infofile,registerfile,testselect,testlink)VALUES(?,?,?,?,?,?,?,?,?,?)'' with params ["", "", "", "", "", "", "0", "0", "", "3"]:\n\nSQLSTATE[42S22]: Column not found: 1054 Unknown column ''testlink'' in ''field list'' (0)\n', 1, 600),
(47, 'exceptions', 1438804681, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/doctrine/dbal/lib/Doctrine/DBAL/DBALException.php:91 An exception occurred while executing ''INSERT INTO btEvents (date_from,date_to,time_from,time_to,title,description,infofile,registerfile,testselect,testlink)VALUES(?,?,?,?,?,?,?,?,?,?)'' with params ["", "", "", "", "", "", "0", "0", "", "3"]:\n\nSQLSTATE[42S22]: Column not found: 1054 Unknown column ''testlink'' in ''field list'' (0)\n', 1, 600),
(48, 'exceptions', 1438805875, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/src/Page/Type/Type.php:1029 Call to a member function getDefaultParentPageID() on a non-object (1)\n', 1, 600),
(49, 'exceptions', 1438806118, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/packages/vivid_store/src/VividStore/Orders/Order.php:103 Class ''Concrete\\Package\\VividStore\\src\\VividStore\\Orders\\OrderEvent'' not found (1)\n', 1, 600),
(50, 'exceptions', 1438806442, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/packages/vivid_store/src/VividStore/Orders/Order.php:103 Class ''Concrete\\Package\\VividStore\\src\\VividStore\\Orders\\OrderEvent'' not found (1)\n', 1, 600),
(51, 'exceptions', 1438806625, 'Mail Exception Occurred. Unable to send mail: Unable to send mail: Unknown error\n#0 [internal function]: Zend\\Mail\\Transport\\Sendmail->mailHandler(''lucius.bachmann...'', ''=?UTF-8?Q?Order...'', ''This is a messa...'', ''Date: Wed, 05 A...'', '' -f store@local...'')\n#1 /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/zendframework/zend-mail/Zend/Mail/Transport/Sendmail.php(139): call_user_func(Array, ''lucius.bachmann...'', ''=?UTF-8?Q?Order...'', ''This is a messa...'', ''Date: Wed, 05 A...'', '' -f store@local...'')\n#2 /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/src/Mail/Service.php(473): Zend\\Mail\\Transport\\Sendmail->send(Object(Zend\\Mail\\Message))\n#3 /var/www/html/newGryfiPage/concrete5.7.3.1/packages/vivid_store/src/VividStore/Orders/Order.php(123): Concrete\\Core\\Mail\\Service->sendMail()\n#4 /var/www/html/newGryfiPage/concrete5.7.3.1/packages/vivid_store/controllers/single_page/checkout.php(80): Concrete\\Package\\VividStore\\src\\VividStore\\Orders\\Order->add(Array, Object(Concrete\\Package\\VividStore\\src\\VividStore\\Payment\\Method))\n#5 [internal function]: Concrete\\Package\\VividStore\\Controller\\SinglePage\\Checkout->submit()\n#6 /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/src/Controller/AbstractController.php(156): call_user_func_array(Array, Array)\n#7 /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/src/Routing/DispatcherRouteCallback.php(175): Concrete\\Core\\Controller\\AbstractController->runAction(''submit'', Array)\n#8 /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/src/Application/Application.php(345): Concrete\\Core\\Routing\\DispatcherRouteCallback->execute(Object(Concrete\\Core\\Http\\Request))\n#9 /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/bootstrap/start.php(256): Concrete\\Core\\Application\\Application->dispatch(Object(Concrete\\Core\\Http\\Request))\n#10 /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/dispatcher.php(36): require(''/var/www/html/n...'')\n#11 /var/www/html/newGryfiPage/concrete5.7.3.1/index.php(2): require(''/var/www/html/n...'')\n#12 {main}\nTemplate Used: order_receipt\nTo: lucius.bachmann@gmx.ch\nFrom: store@localhost\nReply-To: \nSubject: Order Receipt\nBody: 1', 1, 500),
(52, 'sent_emails', 1438806625, '**EMAILS ARE ENABLED. THIS EMAIL WAS SENT TO mail()**\nTemplate Used: order_receipt\nMail Details: Date: Wed, 05 Aug 2015 22:30:24 +0200\r\nFrom: store@localhost\r\nSubject: =?UTF-8?Q?Order=20Receipt?=\r\nTo: lucius.bachmann@gmx.ch\r\nMIME-Version: 1.0\r\nContent-Type: multipart/mixed;\r\n boundary="=_6b247aa01d8cff573c7154f3247e3879"\r\nSender: \r\n\r\nThis is a message in Mime Format.  If you see this, your mail reader does not support this format.\r\n\r\n--=_6b247aa01d8cff573c7154f3247e3879\r\nContent-Type: text/plain; charset=UTF-8\r\nContent-Transfer-Encoding: 8bit\r\n\r\n1\r\n--=_6b247aa01d8cff573c7154f3247e3879\r\nContent-Type: text/html; charset=UTF-8\r\nContent-Transfer-Encoding: 8bit\r\n\r\n<!DOCTYPE HTML PUBLIC ''-//W3C//DTD HTML 4.01 Transitional//EN'' ''http://www.w3.org/TR/html4/loose.dtd''> \r\n<html>\r\n\r\n<body bgcolor=''#ddd''>\r\n    \r\n    <div style="font-family: Arial; background: #fff; box-shadow: 0 3px 3px #ccc; width: 600px; max-width: 100%;color: #444;">\r\n        <div style="background: #444; padding: 20px; color: #fff; font-size: 24px;">Your Order</div>\r\n        <div style="padding: 20px;">\r\n            <p><strong>Order#:</strong> 3</p>\r\n            <p>Thanks for your order! Below are the details of your order.</p>\r\n            <table border="0" width="100%">\r\n                <tr>\r\n                    <td width="50%">\r\n                        <strong>Billing Information</strong>\r\n                        <p>\r\n                            test test<br>\r\n                            test<br>\r\n                            tset<br>                            test,  tset<br>\r\n                            test                        </p>\r\n                    </td>\r\n                    <td>\r\n                        <strong>Shipping Information</strong>\r\n                        <p>\r\n                            test test<br>\r\n                            test<br>\r\n                            tset<br>                            test,  tset<br>\r\n                            \r\n                        </p>\r\n                    </td>\r\n                </tr>\r\n            </table>\r\n            \r\n            <p style="font-size: 18px;">Order Details</p>\r\n            <table border="0" cellpawidth="0" cellspacing="0" width="100%">\r\n                <thead>\r\n                    <tr>\r\n                        <th style="border-bottom: 1px solid #aaa;">Product Name</th>\r\n                        <th style="border-bottom: 1px solid #aaa;">Options</th>\r\n                        <th style="border-bottom: 1px solid #aaa;">Qty</th>\r\n                        <th style="border-bottom: 1px solid #aaa;">Price</th>\r\n                        <th style="border-bottom: 1px solid #aaa;">Subtotal</th>\r\n                    </tr>\r\n                </thead>\r\n                <tbody>\r\n                                            <tr>\r\n                            <td>test</td>\r\n                            <td>\r\n                                                            </td>\r\n                            <td>1</td>\r\n                            <td>$0.00</td>\r\n                            <td>$0.00</td>\r\n                        </tr>\r\n                                      </tbody>\r\n            </table>\r\n            \r\n            <div style="margin: 30px 0;">\r\n                                <p><strong>Your Downloads</strong></p>\r\n                    <p>Note: You must be logged in to download files</p>\r\n                    <ul class="order-downloads">\r\n                    <li><a href="http://localhost/newGryfiPage/concrete5.7.3.1/index.php/download_file/16/197">test</a></li>                    </ul>\r\n                            </div>\r\n            \r\n            <p>\r\n                <strong>Tax:</strong>  $0.00<br>\r\n                <strong>Shipping:</strong>  $0.00<br>\r\n                <strong class="text-large">Total:</strong>  $0.00            </p>\r\n            \r\n        </div>\r\n    </div>\r\n    \r\n</body>\r\n</html>\r\n\r\n\r\n--=_6b247aa01d8cff573c7154f3247e3879--', 1, 200),
(53, 'exceptions', 1438806625, 'Mail Exception Occurred. Unable to send mail: Unable to send mail: Unknown error\n#0 [internal function]: Zend\\Mail\\Transport\\Sendmail->mailHandler('''', ''=?UTF-8?Q?New=2...'', ''This is a messa...'', ''Date: Wed, 05 A...'', '' -f store@local...'')\n#1 /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/zendframework/zend-mail/Zend/Mail/Transport/Sendmail.php(139): call_user_func(Array, '''', ''=?UTF-8?Q?New=2...'', ''This is a messa...'', ''Date: Wed, 05 A...'', '' -f store@local...'')\n#2 /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/src/Mail/Service.php(473): Zend\\Mail\\Transport\\Sendmail->send(Object(Zend\\Mail\\Message))\n#3 /var/www/html/newGryfiPage/concrete5.7.3.1/packages/vivid_store/src/VividStore/Orders/Order.php(132): Concrete\\Core\\Mail\\Service->sendMail()\n#4 /var/www/html/newGryfiPage/concrete5.7.3.1/packages/vivid_store/controllers/single_page/checkout.php(80): Concrete\\Package\\VividStore\\src\\VividStore\\Orders\\Order->add(Array, Object(Concrete\\Package\\VividStore\\src\\VividStore\\Payment\\Method))\n#5 [internal function]: Concrete\\Package\\VividStore\\Controller\\SinglePage\\Checkout->submit()\n#6 /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/src/Controller/AbstractController.php(156): call_user_func_array(Array, Array)\n#7 /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/src/Routing/DispatcherRouteCallback.php(175): Concrete\\Core\\Controller\\AbstractController->runAction(''submit'', Array)\n#8 /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/src/Application/Application.php(345): Concrete\\Core\\Routing\\DispatcherRouteCallback->execute(Object(Concrete\\Core\\Http\\Request))\n#9 /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/bootstrap/start.php(256): Concrete\\Core\\Application\\Application->dispatch(Object(Concrete\\Core\\Http\\Request))\n#10 /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/dispatcher.php(36): require(''/var/www/html/n...'')\n#11 /var/www/html/newGryfiPage/concrete5.7.3.1/index.php(2): require(''/var/www/html/n...'')\n#12 {main}\nTemplate Used: new_order_notification\nTo: \nFrom: store@localhost\nReply-To: \nSubject: New Order Notification\nBody: 1', 1, 500),
(54, 'sent_emails', 1438806625, '**EMAILS ARE ENABLED. THIS EMAIL WAS SENT TO mail()**\nTemplate Used: new_order_notification\nMail Details: Date: Wed, 05 Aug 2015 22:30:25 +0200\r\nFrom: store@localhost\r\nSubject: =?UTF-8?Q?New=20Order=20Notification?=\r\nMIME-Version: 1.0\r\nContent-Type: multipart/mixed;\r\n boundary="=_68b4115b7b503a7ff6fb9e00c92652cb"\r\nSender: \r\n\r\nThis is a message in Mime Format.  If you see this, your mail reader does not support this format.\r\n\r\n--=_68b4115b7b503a7ff6fb9e00c92652cb\r\nContent-Type: text/plain; charset=UTF-8\r\nContent-Transfer-Encoding: 8bit\r\n\r\n1\r\n--=_68b4115b7b503a7ff6fb9e00c92652cb\r\nContent-Type: text/html; charset=UTF-8\r\nContent-Transfer-Encoding: 8bit\r\n\r\n<!DOCTYPE HTML PUBLIC ''-//W3C//DTD HTML 4.01 Transitional//EN'' ''http://www.w3.org/TR/html4/loose.dtd''> \r\n<html>\r\n\r\n<body bgcolor=''#ddd''>\r\n    \r\n    <div style="font-family: Arial; background: #fff; box-shadow: 0 3px 3px #ccc; width: 600px; max-width: 100%;color: #444;">\r\n        <div style="background: #444; padding: 20px; color: #fff; font-size: 24px;">An order has been placed!</div>\r\n        <div style="padding: 20px;">\r\n            <p><strong>Order#:</strong> 3</p>\r\n            <p>An order has been placed on your website.</p>\r\n            <table border="0" width="100%">\r\n                <tr>\r\n                    <td width="50%">\r\n                        <strong>Billing Information</strong>\r\n                        <p>\r\n                            test test<br>\r\n                            test<br>\r\n                            tset<br>                            test,  tset<br>\r\n                            test                        </p>\r\n                    </td>\r\n                    <td>\r\n                        <strong>Shipping Information</strong>\r\n                        <p>\r\n                            test test<br>\r\n                            test<br>\r\n                            tset<br>                            test,  tset<br>\r\n                            \r\n                        </p>\r\n                    </td>\r\n                </tr>\r\n            </table>\r\n            \r\n            <p style="font-size: 18px;">Order Details</p>\r\n            <table border="0" cellpawidth="0" cellspacing="0" width="100%">\r\n                <thead>\r\n                    <tr>\r\n                        <th style="border-bottom: 1px solid #aaa;">Product Name</th>\r\n                        <th style="border-bottom: 1px solid #aaa;">Options</th>\r\n                        <th style="border-bottom: 1px solid #aaa;">Qty</th>\r\n                        <th style="border-bottom: 1px solid #aaa;">Price</th>\r\n                        <th style="border-bottom: 1px solid #aaa;">Subtotal</th>\r\n                    </tr>\r\n                </thead>\r\n                <tbody>\r\n                                            <tr>\r\n                            <td>test</td>\r\n                            <td>\r\n                                                            </td>\r\n                            <td>1</td>\r\n                            <td>$0.00</td>\r\n                            <td>$0.00</td>\r\n                        </tr>\r\n                                      </tbody>\r\n            </table>\r\n            \r\n            <p>\r\n                <strong>Tax:</strong>  $0.00<br>\r\n                <strong>Shipping:</strong>  $0.00<br>\r\n                <strong class="text-large">Total:</strong>  $0.00            </p>\r\n            \r\n        </div>\r\n    </div>\r\n    \r\n</body>\r\n</html>\r\n\r\n\r\n--=_68b4115b7b503a7ff6fb9e00c92652cb--', 1, 200),
(55, 'exceptions', 1438806946, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/src/Page/Type/Type.php:1029 Call to a member function getDefaultParentPageID() on a non-object (1)\n', 1, 600),
(56, 'exceptions', 1438806969, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/src/Page/Type/Type.php:1029 Call to a member function getDefaultParentPageID() on a non-object (1)\n', 1, 600),
(57, 'application', 1438807020, 'Page "" at path "/!drafts/206" deleted', 1, 100),
(58, 'application', 1438807268, 'Page "Abteilung" at path "/abteilung" Moved to trash', 1, 100),
(59, 'application', 1438808025, 'Page "" at path "" deleted', 1, 100),
(60, 'application', 1438808025, 'Page "Store" at path "/dashboard/store" deleted', 1, 100),
(61, 'application', 1438808025, 'Page "Orders" at path "/dashboard/store/orders" deleted', 1, 100),
(62, 'application', 1438808025, 'Page "Products" at path "/dashboard/store/products" deleted', 1, 100),
(63, 'application', 1438808025, 'Page "Attributes" at path "/dashboard/store/products/attributes" deleted', 1, 100),
(64, 'application', 1438808025, 'Page "Settings" at path "/dashboard/store/settings" deleted', 1, 100),
(65, 'application', 1438808025, 'Page "Orders" at path "/dashboard/store/orders" deleted', 1, 100),
(66, 'application', 1438808025, 'Page "Products" at path "/dashboard/store/products" deleted', 1, 100),
(67, 'application', 1438808025, 'Page "Attributes" at path "/dashboard/store/products/attributes" deleted', 1, 100),
(68, 'application', 1438808025, 'Page "Settings" at path "/dashboard/store/settings" deleted', 1, 100),
(69, 'application', 1438808025, 'Page "Cart" at path "/cart" deleted', 1, 100),
(70, 'application', 1438808025, 'Page "Checkout" at path "/checkout" deleted', 1, 100),
(71, 'application', 1438808026, 'Page "Complete" at path "/checkout/complete" deleted', 1, 100),
(72, 'application', 1438808026, 'Page "Complete" at path "/checkout/complete" deleted', 1, 100),
(73, 'application', 1438808098, 'Page "Portfolio" at path "/portfolio" Moved to trash', 1, 100),
(74, 'application', 1438808102, 'Page "Team" at path "/team" Moved to trash', 1, 100),
(75, 'application', 1438808108, 'Page "Blog" at path "/blog" Moved to trash', 1, 100),
(76, 'application', 1438808148, 'Page "Blank Page" at path "/blank-page" Moved to trash', 1, 100),
(77, 'application', 1438808258, 'Page "Biber" at path "/biber" Moved to trash', 1, 100),
(78, 'application', 1438808262, 'Page "Wölf" at path "/wolf" Moved to trash', 1, 100),
(79, 'application', 1438808266, 'Page "Pfadi" at path "/pfadi" Moved to trash', 1, 100),
(80, 'exceptions', 1439400544, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/blocks/survey/controller.php:122 Cannot modify header information - headers already sent by (output started at /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/symfony/http-foundation/Symfony/Component/HttpFoundation/Response.php:1256) (2)\n', 1, 600),
(81, 'exceptions', 1439489726, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/field_types/dropdown_multilink_field.php:17 Interface ''Application\\Block\\BasicTableBlock\\SelfSaveInterface'' not found (1)\n', 0, 600),
(82, 'exceptions', 1439489918, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/controller.php:439 Call to undefined method Application\\Block\\BasicTableBlock\\Field::getValues() (1)\n', 0, 600),
(83, 'exceptions', 1439489991, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/doctrine/dbal/lib/Doctrine/DBAL/Connection.php:674 Argument 2 passed to Doctrine\\DBAL\\Connection::executeQuery() must be of the type array, string given, called in /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/src/Database/Connection/Connection.php on line 76 and defined (4096)\n', 0, 600),
(84, 'exceptions', 1439490042, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/doctrine/dbal/lib/Doctrine/DBAL/DBALException.php:91 An exception occurred while executing ''SELECT l.gID as key,l.gName as value FROM \n					Groups l\n					JOIN btEventInGroup nm ON l.gID = nm.groupID\n					WHERE nm.eventID = ?	\n					 AND  1=1 '' with params ["1"]:\n\nSQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''key,l.gName as value FROM \n					Groups l\n					JOIN btEventInGroup nm ON l.gID = '' at line 1 (0)\n', 0, 600),
(85, 'exceptions', 1439490165, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/doctrine/dbal/lib/Doctrine/DBAL/DBALException.php:91 An exception occurred while executing ''SELECT l.gID as key,l.gName as value FROM \n					Groups l\n					JOIN btEventInGroup nm ON l.gID = nm.groupID\n					WHERE nm.eventID = ?	\n					 AND  1=1 '' with params ["1"]:\n\nSQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''key,l.gName as value FROM \n					Groups l\n					JOIN btEventInGroup nm ON l.gID = '' at line 1 (0)\n', 0, 600),
(86, 'exceptions', 1439490170, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/doctrine/dbal/lib/Doctrine/DBAL/DBALException.php:91 An exception occurred while executing ''SELECT l.gID as key,l.gName as value FROM \n					Groups l\n					JOIN btEventInGroup nm ON l.gID = nm.groupID\n					WHERE nm.eventID = ?	\n					 AND  1=1 '' with params ["1"]:\n\nSQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''key,l.gName as value FROM \n					Groups l\n					JOIN btEventInGroup nm ON l.gID = '' at line 1 (0)\n', 0, 600),
(87, 'exceptions', 1439490182, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/doctrine/dbal/lib/Doctrine/DBAL/DBALException.php:91 An exception occurred while executing ''SELECT l.gID as key,l.gName as value FROM \n					Groups l\n					JOIN btEventInGroup nm ON l.gID = nm.groupID\n					WHERE nm.eventID = ?	\n					 AND  1=1 '' with params ["1"]:\n\nSQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''key,l.gName as value FROM \n					Groups l\n					JOIN btEventInGroup nm ON l.gID = '' at line 1 (0)\n', 1, 600),
(88, 'exceptions', 1439490188, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/doctrine/dbal/lib/Doctrine/DBAL/DBALException.php:91 An exception occurred while executing ''SELECT l.gID as key,l.gName as value FROM \n					Groups l\n					JOIN btEventInGroup nm ON l.gID = nm.groupID\n					WHERE nm.eventID = ?	\n					 AND  1=1 '' with params ["1"]:\n\nSQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''key,l.gName as value FROM \n					Groups l\n					JOIN btEventInGroup nm ON l.gID = '' at line 1 (0)\n', 1, 600),
(89, 'exceptions', 1439490203, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/doctrine/dbal/lib/Doctrine/DBAL/DBALException.php:91 An exception occurred while executing ''SELECT l.gID as key,l.gName as value FROM \n					Groups l\n					JOIN btEventInGroup nm ON l.gID = nm.groupID\n					WHERE nm.eventID = ?	\n					 AND  1=1 '' with params ["1"]:\n\nSQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''key,l.gName as value FROM \n					Groups l\n					JOIN btEventInGroup nm ON l.gID = '' at line 1 (0)\n', 1, 600),
(90, 'exceptions', 1439490212, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/doctrine/dbal/lib/Doctrine/DBAL/DBALException.php:91 An exception occurred while executing ''SELECT l.gID as key,l.gName as value FROM \n					Groups l\n					JOIN btEventInGroup nm ON l.gID = nm.groupID\n					WHERE nm.eventID = ?	\n					 AND  1=1 '' with params ["1"]:\n\nSQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''key,l.gName as value FROM \n					Groups l\n					JOIN btEventInGroup nm ON l.gID = '' at line 1 (0)\n', 1, 600),
(91, 'exceptions', 1439490244, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/doctrine/dbal/lib/Doctrine/DBAL/DBALException.php:91 An exception occurred while executing ''SELECT l.gID as schluessel,l.gName as value FROM \n					Groups l\n					JOIN btEventInGroup nm ON l.gID = nm.groupID\n					WHERE nm.eventID = ?	\n					 AND  1=1 '' with params ["1"]:\n\nSQLSTATE[42S02]: Base table or view not found: 1146 Table ''gryfenberg.btEventInGroup'' doesn''t exist (0)\n', 1, 600),
(92, 'exceptions', 1439490261, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/doctrine/dbal/lib/Doctrine/DBAL/DBALException.php:91 An exception occurred while executing ''SELECT l.gID as schluessel,l.gName as value FROM \n					Groups l\n					JOIN btEventInGroup nm ON l.gID = nm.groupID\n					WHERE nm.eventID = ?	\n					 AND  1=1 '' with params ["1"]:\n\nSQLSTATE[42S02]: Base table or view not found: 1146 Table ''gryfenberg.btEventInGroup'' doesn''t exist (0)\n', 1, 600),
(93, 'exceptions', 1439490266, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/doctrine/dbal/lib/Doctrine/DBAL/DBALException.php:91 An exception occurred while executing ''SELECT l.gID as schluessel,l.gName as value FROM \n					Groups l\n					JOIN btEventInGroup nm ON l.gID = nm.groupID\n					WHERE nm.eventID = ?	\n					 AND  1=1 '' with params ["1"]:\n\nSQLSTATE[42S02]: Base table or view not found: 1146 Table ''gryfenberg.btEventInGroup'' doesn''t exist (0)\n', 1, 600),
(94, 'exceptions', 1439490337, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/field_types/dropdown_multilink_field.php:148 Invalid argument supplied for foreach() (2)\n', 1, 600),
(95, 'exceptions', 1439490379, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/field_types/dropdown_multilink_field.php:148 Invalid argument supplied for foreach() (2)\n', 1, 600),
(96, 'exceptions', 1439490393, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/field_types/dropdown_multilink_field.php:148 Invalid argument supplied for foreach() (2)\n', 1, 600),
(97, 'exceptions', 1439490617, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/field_types/dropdown_multilink_field.php:148 Invalid argument supplied for foreach() (2)\n', 1, 600),
(98, 'exceptions', 1439490640, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/field_types/dropdown_multilink_field.php:148 Invalid argument supplied for foreach() (2)\n', 1, 600),
(99, 'exceptions', 1439490674, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/doctrine/dbal/lib/Doctrine/DBAL/DBALException.php:91 An exception occurred while executing ''UPDATE btEvents SET date_from=?, date_to=?, time_from=?, time_to=?, title=?, description=?, infofile=?, registerfile=?, testselect=?, testlink=?, testmultiLink=? WHERE id=?'' with params ["", "", "", "", "", "", "16", "0", "", "3", "Administrators", "1"]:\n\nSQLSTATE[42S22]: Column not found: 1054 Unknown column ''testmultiLink'' in ''field list'' (0)\n', 1, 600),
(100, 'exceptions', 1439490755, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/controller.php:190 Call to a member function getErrorMsg() on a non-object (1)\n', 1, 600),
(101, 'exceptions', 1439491032, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/doctrine/dbal/lib/Doctrine/DBAL/DBALException.php:91 An exception occurred while executing ''UPDATE btEvents SET date_from=?, date_to=?, time_from=?, time_to=?, title=?, description=?, infofile=?, registerfile=?, testselect=?, testlink=? WHERE id=?'' with params ["", "", "", "", "", "", "16", "0", "", "3", "Administrators", "1"]:\n\nSQLSTATE[HY093]: Invalid parameter number: number of bound variables does not match number of tokens (0)\n', 1, 600),
(102, 'exceptions', 1439491163, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/doctrine/dbal/lib/Doctrine/DBAL/DBALException.php:91 An exception occurred while executing ''UPDATE btEvents SET date_from=?, date_to=?, time_from=?, time_to=?, title=?, description=?, infofile=?, registerfile=?, testselect=?, testlink=? WHERE id=?'' with params ["", "", "", "", "", "", "16", "0", "", "3", "Administrators", "1"]:\n\nSQLSTATE[HY093]: Invalid parameter number: number of bound variables does not match number of tokens (0)\n', 1, 600),
(103, 'exceptions', 1439492514, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/views/table_view.php:50 Call to a member function setRowId() on a non-object (1)\n', 1, 600),
(104, 'exceptions', 1439492559, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/doctrine/dbal/lib/Doctrine/DBAL/DBALException.php:91 An exception occurred while executing ''INSERT INTO btEventInGroup (eventID, groupID) VALUES (?, ?)'' with params ["1", 3]:\n\nSQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry ''0'' for key ''PRIMARY'' (0)\n', 1, 600),
(105, 'exceptions', 1439492705, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/doctrine/dbal/lib/Doctrine/DBAL/DBALException.php:91 An exception occurred while executing ''INSERT INTO btEventInGroup (eventID, groupID) VALUES (?, ?)'' with params ["1", 3]:\n\nSQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry ''0'' for key ''PRIMARY'' (0)\n', 1, 600),
(106, 'exceptions', 1439493644, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/doctrine/dbal/lib/Doctrine/DBAL/ConnectionException.php:42 There is no active transaction. (0)\n', 0, 600),
(107, 'exceptions', 1440011549, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/controller.php:147 Call to a member function getCollectionPath() on a non-object (1)\n', 0, 600),
(108, 'exceptions', 1442268812, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/field_types/date_field.php:74 syntax error, unexpected ''$explodeValue'' (T_VARIABLE) (4)\n', 0, 600),
(109, 'exceptions', 1442268875, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/field_types/date_field.php:129 syntax error, unexpected ''$this'' (T_VARIABLE) (4)\n', 0, 600),
(110, 'exceptions', 1442351045, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/field_types/date_field.php:134 syntax error, unexpected ''"'' (4)\n', 0, 600),
(111, 'exceptions', 1442352008, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/controller.php:207 Call to a member function getErrorMsg() on a non-object (1)\n', 0, 600),
(112, 'exceptions', 1442352498, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/controller.php:212 Call to undefined function Application\\Block\\BasicTableBlock\\dpa() (1)\n', 0, 600),
(113, 'exceptions', 1444337791, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/src/Block/BlockType/BlockTypeList.php:95 Class ''\\Application\\Block\\Budgettable\\Controller'' not found (1)\n', 1, 600),
(114, 'exceptions', 1444337807, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/src/Block/BlockType/BlockTypeList.php:95 Class ''\\Application\\Block\\Budgettable\\Controller'' not found (1)\n', 1, 600),
(115, 'exceptions', 1444678562, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/concrete/vendor/doctrine/dbal/lib/Doctrine/DBAL/DBALException.php:91 An exception occurred while executing ''SELECT * from btBudget WHERE  parentBudgetId = '':\n\nSQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '''' at line 1 (0)\n', 1, 600),
(116, 'exceptions', 1444679704, 'Exception Occurred: /var/www/html/newGryfiPage/concrete5.7.3.1/application/blocks/basic_table_block/field.php:26 Cannot access empty property (1)\n', 1, 600);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `MailImporters`
--

DROP TABLE IF EXISTS `MailImporters`;
CREATE TABLE `MailImporters` (
  `miID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `miHandle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `miServer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `miUsername` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `miPassword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `miEncryption` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `miIsEnabled` tinyint(1) NOT NULL DEFAULT '0',
  `miEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `miPort` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned DEFAULT NULL,
  `miConnectionMethod` varchar(8) COLLATE utf8_unicode_ci DEFAULT 'POP',
  PRIMARY KEY (`miID`),
  UNIQUE KEY `miHandle` (`miHandle`),
  KEY `pkgID` (`pkgID`,`miID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `MailImporters`
--

INSERT INTO `MailImporters` (`miID`, `miHandle`, `miServer`, `miUsername`, `miPassword`, `miEncryption`, `miIsEnabled`, `miEmail`, `miPort`, `pkgID`, `miConnectionMethod`) VALUES
(1, 'private_message', '', NULL, NULL, NULL, 0, '', 0, 0, 'POP');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `MailValidationHashes`
--

DROP TABLE IF EXISTS `MailValidationHashes`;
CREATE TABLE `MailValidationHashes` (
  `mvhID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `miID` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `mHash` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `mDateGenerated` int(10) unsigned NOT NULL DEFAULT '0',
  `mDateRedeemed` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`mvhID`),
  UNIQUE KEY `mHash` (`mHash`),
  KEY `miID` (`miID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `MultilingualPageRelations`
--

DROP TABLE IF EXISTS `MultilingualPageRelations`;
CREATE TABLE `MultilingualPageRelations` (
  `mpRelationID` int(10) unsigned NOT NULL DEFAULT '0',
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `mpLanguage` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mpLocale` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`mpRelationID`,`cID`,`mpLocale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `MultilingualSections`
--

DROP TABLE IF EXISTS `MultilingualSections`;
CREATE TABLE `MultilingualSections` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `msLanguage` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `msCountry` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `MultilingualTranslations`
--

DROP TABLE IF EXISTS `MultilingualTranslations`;
CREATE TABLE `MultilingualTranslations` (
  `mtID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mtSectionID` int(10) unsigned NOT NULL DEFAULT '0',
  `msgid` text COLLATE utf8_unicode_ci NOT NULL,
  `msgstr` text COLLATE utf8_unicode_ci,
  `context` text COLLATE utf8_unicode_ci,
  `comments` text COLLATE utf8_unicode_ci,
  `reference` text COLLATE utf8_unicode_ci,
  `flags` text COLLATE utf8_unicode_ci,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`mtID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `OauthUserMap`
--

DROP TABLE IF EXISTS `OauthUserMap`;
CREATE TABLE `OauthUserMap` (
  `user_id` int(10) unsigned NOT NULL,
  `namespace` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `binding` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`namespace`),
  UNIQUE KEY `oauth_binding` (`binding`,`namespace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_activity`
--

DROP TABLE IF EXISTS `oc_activity`;
CREATE TABLE `oc_activity` (
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
-- Tabellenstruktur für Tabelle `oc_activity_mq`
--

DROP TABLE IF EXISTS `oc_activity_mq`;
CREATE TABLE `oc_activity_mq` (
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
-- Tabellenstruktur für Tabelle `oc_appconfig`
--

DROP TABLE IF EXISTS `oc_appconfig`;
CREATE TABLE `oc_appconfig` (
  `appid` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `configkey` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `configvalue` longtext COLLATE utf8_bin,
  PRIMARY KEY (`appid`,`configkey`),
  KEY `appconfig_config_key_index` (`configkey`),
  KEY `appconfig_appid_key` (`appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `oc_appconfig`
--

INSERT INTO `oc_appconfig` (`appid`, `configkey`, `configvalue`) VALUES
('activity', 'enabled', 'yes'),
('activity', 'installed_version', '1.2.0'),
('activity', 'ocsid', '166038'),
('activity', 'types', 'filesystem'),
('backgroundjob', 'lastjob', '1'),
('core', 'global_cache_gc_lastrun', '1430649377'),
('core', 'installedat', '1428340067.4544'),
('core', 'lastcron', '1430649377'),
('core', 'lastupdateResult', '{"version":{},"versionstring":{},"url":{},"web":{}}'),
('core', 'lastupdatedat', '1430649374'),
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
-- Tabellenstruktur für Tabelle `oc_filecache`
--

DROP TABLE IF EXISTS `oc_filecache`;
CREATE TABLE `oc_filecache` (
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
-- Daten für Tabelle `oc_filecache`
--

INSERT INTO `oc_filecache` (`fileid`, `storage`, `path`, `path_hash`, `parent`, `name`, `mimetype`, `mimepart`, `size`, `mtime`, `storage_mtime`, `encrypted`, `unencrypted_size`, `etag`, `permissions`) VALUES
(1, 1, '', 'd41d8cd98f00b204e9800998ecf8427e', -1, '', 2, 1, 2462544, 1430649377, 1428340068, 0, 0, '5545fa21411a5', 23),
(2, 1, 'cache', '0fea6a13c52b4d4725368f24b045ca84', 1, 'cache', 2, 1, 0, 1428340067, 1428340067, 0, 0, '5522bd6401f00', 31),
(3, 1, 'files', '45b963397aa40d4a0063e0d85e4fe7a1', 1, 'files', 2, 1, 2462544, 1430649377, 1429452625, 0, 0, '5545fa2143747', 31),
(4, 1, 'files/Documents', '0ad78ba05b6961d92f7970b2b3922eca', 3, 'Documents', 2, 1, 36227, 1430649377, 1429452625, 0, 0, '5545fa214586d', 31),
(5, 1, 'files/Documents/Example.odt', 'c89c560541b952a435783a7d51a27d50', 4, 'Example.odt', 4, 3, 36227, 1429452625, 1429452625, 0, 0, '44e2b3c15c69a0f1ef9b050bc085544b', 27),
(6, 1, 'files/ownCloudUserManual.pdf', 'c8edba2d1b8eb651c107b43532c34445', 3, 'ownCloudUserManual.pdf', 5, 3, 1747761, 1429452624, 1429452624, 0, 0, 'aa49f691d31506d10c6dee7a4cc4d908', 27),
(7, 1, 'files/Photos', 'd01bb67e7b71dd49fd06bad922f521c9', 3, 'Photos', 2, 1, 678556, 1430649377, 1429452622, 0, 0, '5545fa21448a5', 31),
(8, 1, 'files/Photos/Paris.jpg', 'a208ddedf08367bbc56963107248dda5', 7, 'Paris.jpg', 7, 6, 228761, 1429452619, 1429452619, 0, 0, '664428d9b21480aec977c0e503fd5a21', 27),
(9, 1, 'files/Photos/San Francisco.jpg', '9fc714efbeaafee22f7058e73d2b1c3b', 7, 'San Francisco.jpg', 7, 6, 216071, 1429452619, 1429452619, 0, 0, '695f8c9c0b4ac92466e57173d5f81ed2', 27),
(10, 1, 'files/Photos/Squirrel.jpg', 'de85d1da71bcd6232ad893f959063b8c', 7, 'Squirrel.jpg', 7, 6, 233724, 1429452622, 1429452622, 0, 0, 'd0d3da96160cf8c66c7879500d3176a0', 27);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_files_trash`
--

DROP TABLE IF EXISTS `oc_files_trash`;
CREATE TABLE `oc_files_trash` (
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
-- Tabellenstruktur für Tabelle `oc_file_map`
--

DROP TABLE IF EXISTS `oc_file_map`;
CREATE TABLE `oc_file_map` (
  `logic_path` varchar(512) COLLATE utf8_bin NOT NULL DEFAULT '',
  `logic_path_hash` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `physic_path` varchar(512) COLLATE utf8_bin NOT NULL DEFAULT '',
  `physic_path_hash` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`logic_path_hash`),
  UNIQUE KEY `file_map_pp_index` (`physic_path_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_groups`
--

DROP TABLE IF EXISTS `oc_groups`;
CREATE TABLE `oc_groups` (
  `gid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `oc_groups`
--

INSERT INTO `oc_groups` (`gid`) VALUES
('admin');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_group_admin`
--

DROP TABLE IF EXISTS `oc_group_admin`;
CREATE TABLE `oc_group_admin` (
  `gid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `uid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`),
  KEY `group_admin_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_group_user`
--

DROP TABLE IF EXISTS `oc_group_user`;
CREATE TABLE `oc_group_user` (
  `gid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `uid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `oc_group_user`
--

INSERT INTO `oc_group_user` (`gid`, `uid`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_jobs`
--

DROP TABLE IF EXISTS `oc_jobs`;
CREATE TABLE `oc_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `argument` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT '',
  `last_run` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `job_class_index` (`class`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `oc_jobs`
--

INSERT INTO `oc_jobs` (`id`, `class`, `argument`, `last_run`) VALUES
(1, 'OC\\Cache\\FileGlobalGC', 'null', 1430649377),
(2, 'OCA\\Activity\\BackgroundJob\\EmailNotification', 'null', 1429478870),
(3, 'OCA\\Activity\\BackgroundJob\\ExpireActivities', 'null', 1430649368);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_locks`
--

DROP TABLE IF EXISTS `oc_locks`;
CREATE TABLE `oc_locks` (
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
-- Tabellenstruktur für Tabelle `oc_mimetypes`
--

DROP TABLE IF EXISTS `oc_mimetypes`;
CREATE TABLE `oc_mimetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mimetype` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mimetype_id_index` (`mimetype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

--
-- Daten für Tabelle `oc_mimetypes`
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
-- Tabellenstruktur für Tabelle `oc_preferences`
--

DROP TABLE IF EXISTS `oc_preferences`;
CREATE TABLE `oc_preferences` (
  `userid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `appid` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `configkey` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `configvalue` longtext COLLATE utf8_bin,
  PRIMARY KEY (`userid`,`appid`,`configkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `oc_preferences`
--

INSERT INTO `oc_preferences` (`userid`, `appid`, `configkey`, `configvalue`) VALUES
('admin', 'core', 'timezone', 'Europe/Berlin'),
('admin', 'firstrunwizard', 'show', '0'),
('admin', 'login', 'lastLogin', '1430649374');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_privatedata`
--

DROP TABLE IF EXISTS `oc_privatedata`;
CREATE TABLE `oc_privatedata` (
  `keyid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `app` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `key` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`keyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_properties`
--

DROP TABLE IF EXISTS `oc_properties`;
CREATE TABLE `oc_properties` (
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
-- Tabellenstruktur für Tabelle `oc_share`
--

DROP TABLE IF EXISTS `oc_share`;
CREATE TABLE `oc_share` (
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
-- Tabellenstruktur für Tabelle `oc_share_external`
--

DROP TABLE IF EXISTS `oc_share_external`;
CREATE TABLE `oc_share_external` (
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
-- Tabellenstruktur für Tabelle `oc_storages`
--

DROP TABLE IF EXISTS `oc_storages`;
CREATE TABLE `oc_storages` (
  `id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `numeric_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`numeric_id`),
  UNIQUE KEY `storages_id_index` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `oc_storages`
--

INSERT INTO `oc_storages` (`id`, `numeric_id`) VALUES
('home::admin', 1),
('local::/mnt/Windows7_OS/wamp/www2/newGryfiPage/owncloud/data/', 2),
('local::/var/www/html/newGryfiPage/owncloud/data/', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_users`
--

DROP TABLE IF EXISTS `oc_users`;
CREATE TABLE `oc_users` (
  `uid` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `displayname` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `oc_users`
--

INSERT INTO `oc_users` (`uid`, `displayname`, `password`) VALUES
('admin', NULL, '1|$2y$10$uhl2rJYVPOq8SelN34tHj.7xiNoYbGZxMWtdFjCJDZ011KYFsksM.'),
('testuser', NULL, '$2a$12$VXsKmMvHz.dExxWQVA1j8eyYcLvRkPs6qFXy/js4JWVgpkD5A52YK');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_vcategory`
--

DROP TABLE IF EXISTS `oc_vcategory`;
CREATE TABLE `oc_vcategory` (
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
-- Tabellenstruktur für Tabelle `oc_vcategory_to_object`
--

DROP TABLE IF EXISTS `oc_vcategory_to_object`;
CREATE TABLE `oc_vcategory_to_object` (
  `objid` int(10) unsigned NOT NULL DEFAULT '0',
  `categoryid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryid`,`objid`,`type`),
  KEY `vcategory_objectd_index` (`objid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Packages`
--

DROP TABLE IF EXISTS `Packages`;
CREATE TABLE `Packages` (
  `pkgID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pkgName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkgHandle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `pkgDescription` text COLLATE utf8_unicode_ci,
  `pkgDateInstalled` datetime NOT NULL,
  `pkgIsInstalled` tinyint(1) NOT NULL DEFAULT '1',
  `pkgVersion` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pkgAvailableVersion` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pkgID`),
  UNIQUE KEY `pkgHandle` (`pkgHandle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PageFeeds`
--

DROP TABLE IF EXISTS `PageFeeds`;
CREATE TABLE `PageFeeds` (
  `pfID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cParentID` int(10) unsigned NOT NULL DEFAULT '1',
  `pfTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pfHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pfDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pfIncludeAllDescendents` tinyint(1) NOT NULL DEFAULT '0',
  `pfContentToDisplay` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `pfAreaHandleToDisplay` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pfDisplayAliases` tinyint(1) NOT NULL DEFAULT '0',
  `ptID` smallint(5) unsigned DEFAULT NULL,
  `pfDisplayFeaturedOnly` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`pfID`),
  UNIQUE KEY `pfHandle` (`pfHandle`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `PageFeeds`
--

INSERT INTO `PageFeeds` (`pfID`, `cParentID`, `pfTitle`, `pfHandle`, `pfDescription`, `pfIncludeAllDescendents`, `pfContentToDisplay`, `pfAreaHandleToDisplay`, `pfDisplayAliases`, `ptID`, `pfDisplayFeaturedOnly`) VALUES
(1, 156, 'Blog', 'blog', 'concrete5 Blog', 0, 'S', NULL, 0, 6, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PagePaths`
--

DROP TABLE IF EXISTS `PagePaths`;
CREATE TABLE `PagePaths` (
  `ppID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cID` int(10) unsigned DEFAULT '0',
  `cPath` text COLLATE utf8_unicode_ci NOT NULL,
  `ppIsCanonical` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`ppID`),
  KEY `cID` (`cID`),
  KEY `ppIsCanonical` (`ppIsCanonical`),
  KEY `cPath` (`cPath`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=202 ;

--
-- Daten für Tabelle `PagePaths`
--

INSERT INTO `PagePaths` (`ppID`, `cID`, `cPath`, `ppIsCanonical`) VALUES
(1, 2, '/dashboard', '1'),
(2, 3, '/dashboard/sitemap', '1'),
(3, 4, '/dashboard/sitemap/full', '1'),
(4, 5, '/dashboard/sitemap/explore', '1'),
(5, 6, '/dashboard/sitemap/search', '1'),
(6, 7, '/dashboard/files', '1'),
(7, 8, '/dashboard/files/search', '1'),
(8, 9, '/dashboard/files/attributes', '1'),
(9, 10, '/dashboard/files/sets', '1'),
(10, 11, '/dashboard/files/add_set', '1'),
(11, 12, '/dashboard/users', '1'),
(12, 13, '/dashboard/users/search', '1'),
(13, 14, '/dashboard/users/groups', '1'),
(14, 15, '/dashboard/users/attributes', '1'),
(15, 16, '/dashboard/users/add', '1'),
(16, 17, '/dashboard/users/add_group', '1'),
(17, 18, '/dashboard/users/groups/bulkupdate', '1'),
(18, 19, '/dashboard/users/group_sets', '1'),
(19, 20, '/dashboard/users/points', '1'),
(20, 21, '/dashboard/users/points/assign', '1'),
(21, 22, '/dashboard/users/points/actions', '1'),
(22, 23, '/dashboard/reports', '1'),
(23, 24, '/dashboard/reports/forms', '1'),
(24, 25, '/dashboard/reports/surveys', '1'),
(25, 26, '/dashboard/reports/logs', '1'),
(26, 27, '/dashboard/pages', '1'),
(27, 28, '/dashboard/pages/themes', '1'),
(28, 29, '/dashboard/pages/themes/inspect', '1'),
(29, 30, '/dashboard/pages/types', '1'),
(30, 31, '/dashboard/pages/types/organize', '1'),
(31, 32, '/dashboard/pages/types/add', '1'),
(32, 33, '/dashboard/pages/types/form', '1'),
(33, 34, '/dashboard/pages/types/output', '1'),
(34, 35, '/dashboard/pages/types/attributes', '1'),
(35, 36, '/dashboard/pages/types/permissions', '1'),
(36, 37, '/dashboard/pages/templates', '1'),
(37, 38, '/dashboard/pages/templates/add', '1'),
(38, 39, '/dashboard/pages/attributes', '1'),
(39, 40, '/dashboard/pages/single', '1'),
(40, 41, '/dashboard/pages/feeds', '1'),
(41, 42, '/dashboard/conversations', '1'),
(42, 43, '/dashboard/conversations/messages', '1'),
(43, 44, '/dashboard/workflow', '1'),
(44, 45, '/dashboard/workflow/workflows', '1'),
(45, 46, '/dashboard/workflow/me', '1'),
(46, 47, '/dashboard/blocks', '1'),
(47, 48, '/dashboard/blocks/stacks', '1'),
(48, 49, '/dashboard/blocks/permissions', '1'),
(49, 50, '/dashboard/blocks/stacks/list', '1'),
(50, 51, '/dashboard/blocks/types', '1'),
(51, 52, '/dashboard/extend', '1'),
(52, 53, '/dashboard/news', '1'),
(53, 54, '/dashboard/extend/install', '1'),
(54, 55, '/dashboard/extend/update', '1'),
(55, 56, '/dashboard/extend/connect', '1'),
(56, 57, '/dashboard/extend/themes', '1'),
(57, 58, '/dashboard/extend/addons', '1'),
(58, 59, '/dashboard/system', '1'),
(59, 60, '/dashboard/system/basics', '1'),
(60, 61, '/dashboard/system/basics/name', '1'),
(61, 62, '/dashboard/system/basics/accessibility', '1'),
(62, 63, '/dashboard/system/basics/social', '1'),
(63, 64, '/dashboard/system/basics/icons', '1'),
(64, 65, '/dashboard/system/basics/editor', '1'),
(65, 66, '/dashboard/system/basics/multilingual', '1'),
(66, 67, '/dashboard/system/basics/timezone', '1'),
(67, 68, '/dashboard/system/multilingual', '1'),
(68, 69, '/dashboard/system/multilingual/setup', '1'),
(69, 70, '/dashboard/system/multilingual/page_report', '1'),
(70, 71, '/dashboard/system/multilingual/translate_interface', '1'),
(71, 72, '/dashboard/system/seo', '1'),
(72, 73, '/dashboard/system/seo/urls', '1'),
(73, 74, '/dashboard/system/seo/bulk', '1'),
(74, 75, '/dashboard/system/seo/codes', '1'),
(75, 76, '/dashboard/system/seo/excluded', '1'),
(76, 77, '/dashboard/system/seo/searchindex', '1'),
(77, 78, '/dashboard/system/files', '1'),
(78, 79, '/dashboard/system/files/permissions', '1'),
(79, 80, '/dashboard/system/files/filetypes', '1'),
(80, 81, '/dashboard/system/files/thumbnails', '1'),
(81, 82, '/dashboard/system/files/storage', '1'),
(82, 83, '/dashboard/system/optimization', '1'),
(83, 84, '/dashboard/system/optimization/cache', '1'),
(84, 85, '/dashboard/system/optimization/clearcache', '1'),
(85, 86, '/dashboard/system/optimization/jobs', '1'),
(86, 87, '/dashboard/system/optimization/query_log', '1'),
(87, 88, '/dashboard/system/permissions', '1'),
(88, 89, '/dashboard/system/permissions/site', '1'),
(89, 90, '/dashboard/system/permissions/tasks', '1'),
(90, 91, '/dashboard/system/permissions/users', '1'),
(91, 92, '/dashboard/system/permissions/advanced', '1'),
(92, 93, '/dashboard/system/permissions/blacklist', '1'),
(93, 94, '/dashboard/system/permissions/captcha', '1'),
(94, 95, '/dashboard/system/permissions/antispam', '1'),
(95, 96, '/dashboard/system/permissions/maintenance', '1'),
(96, 97, '/dashboard/system/registration', '1'),
(97, 98, '/dashboard/system/registration/postlogin', '1'),
(98, 99, '/dashboard/system/registration/profiles', '1'),
(99, 100, '/dashboard/system/registration/open', '1'),
(100, 101, '/dashboard/system/registration/authentication', '1'),
(101, 102, '/dashboard/system/mail', '1'),
(102, 103, '/dashboard/system/mail/method', '1'),
(103, 104, '/dashboard/system/mail/method/test', '1'),
(104, 105, '/dashboard/system/mail/importers', '1'),
(105, 106, '/dashboard/system/conversations', '1'),
(106, 107, '/dashboard/system/conversations/settings', '1'),
(107, 108, '/dashboard/system/conversations/points', '1'),
(108, 109, '/dashboard/system/conversations/bannedwords', '1'),
(109, 110, '/dashboard/system/conversations/permissions', '1'),
(110, 111, '/dashboard/system/attributes', '1'),
(111, 112, '/dashboard/system/attributes/sets', '1'),
(112, 113, '/dashboard/system/attributes/types', '1'),
(113, 114, '/dashboard/system/attributes/topics', '1'),
(114, 115, '/dashboard/system/attributes/topics/add', '1'),
(115, 116, '/dashboard/system/environment', '1'),
(116, 117, '/dashboard/system/environment/info', '1'),
(117, 118, '/dashboard/system/environment/debug', '1'),
(118, 119, '/dashboard/system/environment/logging', '1'),
(119, 120, '/dashboard/system/environment/proxy', '1'),
(120, 121, '/dashboard/system/backup', '1'),
(121, 122, '/dashboard/system/backup/backup', '1'),
(122, 123, '/dashboard/system/backup/update', '1'),
(123, 124, '/dashboard/welcome', '1'),
(124, 125, '/dashboard/home', '1'),
(125, 126, '/!drafts', '1'),
(126, 127, '/!trash', '1'),
(127, 128, '/!stacks', '1'),
(128, 129, '/login', '1'),
(129, 130, '/register', '1'),
(130, 131, '/account', '1'),
(131, 132, '/account/edit_profile', '1'),
(132, 133, '/account/avatar', '1'),
(133, 134, '/account/messages', '1'),
(134, 135, '/account/messages/inbox', '1'),
(135, 136, '/members', '1'),
(136, 137, '/members/profile', '1'),
(137, 138, '/members/directory', '1'),
(138, 139, '/page_not_found', '1'),
(139, 140, '/page_forbidden', '1'),
(140, 141, '/download_file', '1'),
(141, 142, '/!stacks/footer-contact', '1'),
(142, 143, '/!stacks/footer-legal', '1'),
(143, 144, '/!stacks/footer-navigation', '1'),
(144, 145, '/!stacks/footer-site-title', '1'),
(145, 146, '/!stacks/footer-social', '1'),
(146, 147, '/!stacks/header-navigation', '1'),
(147, 148, '/!stacks/header-search', '1'),
(148, 149, '/!stacks/header-site-title', '1'),
(149, 151, '/services', '1'),
(150, 153, '/!trash/portfolio', '1'),
(151, 154, '/!trash/team', '1'),
(152, 156, '/!trash/blog', '1'),
(153, 157, '/search', '1'),
(154, 158, '/contact', '1'),
(155, 159, '/!trash/blank-page', '1'),
(156, 161, '/!trash/portfolio/project-title', '1'),
(157, 162, '/!trash/portfolio/project-title-2', '1'),
(158, 163, '/!trash/portfolio/project-title-3', '1'),
(159, 164, '/!trash/portfolio/project-title-4', '1'),
(160, 165, '/!trash/portfolio/project-title-5', '1'),
(161, 166, '/!trash/portfolio/project-title-6', '1'),
(162, 168, '/!trash/blog/hello-world', '1'),
(163, 169, '/!trash/blog/another-blog-post', '1'),
(164, 170, '/!trash/blog/a-beautiful-blog', '1'),
(165, 171, '/!trash/team/about', '1'),
(166, 172, '/!trash/team/careers', '1'),
(167, 173, '/!trash/team/faq', '1'),
(168, 175, '/!trash/team/careers/web-developer', '1'),
(169, 176, '/!trash/team/careers/sales-associate', '1'),
(170, 180, '/!drafts/home', '1'),
(171, 181, '/!trash/biber', '1'),
(172, 182, '/!trash/wolf', '1'),
(173, 183, '/!trash/pfadi', '1'),
(174, 184, '/leiter', '1'),
(175, 185, '/bilder', '1'),
(176, 186, '/agenda', '1'),
(177, 187, '/links', '1'),
(178, 188, '/elternrat', '1'),
(179, 189, '/!trash/abteilung', '1'),
(180, 190, '/administration', '1'),
(189, 199, '/product-detail', '1'),
(190, 201, '/product-detail/test', '1'),
(191, 202, '/!drafts/202', '1'),
(192, 203, '/!drafts/203', '1'),
(193, 204, '/!drafts/204', '1'),
(194, 205, '/!drafts/205', '1'),
(196, 208, '/stufen', '1'),
(197, 209, '/stufen/biber', '1'),
(198, 210, '/stufen/wolf', '1'),
(199, 211, '/stufen/pfadi', '1'),
(200, 212, '/administration/quittungen', '1'),
(201, 213, '/administration/quittungen/budgets-verwalten', '1');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PagePermissionAssignments`
--

DROP TABLE IF EXISTS `PagePermissionAssignments`;
CREATE TABLE `PagePermissionAssignments` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`pkID`,`paID`),
  KEY `paID` (`paID`,`pkID`),
  KEY `pkID` (`pkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `PagePermissionAssignments`
--

INSERT INTO `PagePermissionAssignments` (`cID`, `pkID`, `paID`) VALUES
(1, 1, 47),
(1, 2, 48),
(1, 3, 49),
(1, 4, 50),
(1, 5, 51),
(1, 6, 52),
(1, 7, 53),
(1, 8, 55),
(1, 9, 56),
(1, 10, 81),
(1, 11, 57),
(1, 12, 58),
(1, 13, 59),
(1, 14, 60),
(1, 15, 61),
(1, 16, 62),
(1, 17, 63),
(1, 18, 54),
(2, 1, 66),
(129, 1, 64),
(130, 1, 65),
(180, 1, 47),
(180, 2, 48),
(180, 3, 49),
(180, 4, 50),
(180, 5, 51),
(180, 6, 52),
(180, 7, 53),
(180, 8, 55),
(180, 9, 56),
(180, 11, 57),
(180, 12, 58),
(180, 13, 59),
(180, 14, 60),
(180, 15, 61),
(180, 16, 62),
(180, 17, 63),
(180, 18, 54),
(190, 1, 82),
(190, 2, 48),
(190, 3, 49),
(190, 4, 50),
(190, 5, 51),
(190, 6, 52),
(190, 7, 53),
(190, 8, 55),
(190, 9, 56),
(190, 10, 81),
(190, 11, 57),
(190, 12, 58),
(190, 13, 59),
(190, 14, 60),
(190, 15, 61),
(190, 16, 62),
(190, 17, 63),
(190, 18, 54);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PagePermissionPageTypeAccessList`
--

DROP TABLE IF EXISTS `PagePermissionPageTypeAccessList`;
CREATE TABLE `PagePermissionPageTypeAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `externalLink` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`),
  KEY `peID` (`peID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PagePermissionPageTypeAccessListCustom`
--

DROP TABLE IF EXISTS `PagePermissionPageTypeAccessListCustom`;
CREATE TABLE `PagePermissionPageTypeAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `ptID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`ptID`),
  KEY `peID` (`peID`),
  KEY `ptID` (`ptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PagePermissionPropertyAccessList`
--

DROP TABLE IF EXISTS `PagePermissionPropertyAccessList`;
CREATE TABLE `PagePermissionPropertyAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `name` tinyint(1) DEFAULT '0',
  `publicDateTime` tinyint(1) DEFAULT '0',
  `uID` tinyint(1) DEFAULT '0',
  `description` tinyint(1) DEFAULT '0',
  `paths` tinyint(1) DEFAULT '0',
  `attributePermission` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`),
  KEY `peID` (`peID`),
  KEY `uID` (`uID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PagePermissionPropertyAttributeAccessListCustom`
--

DROP TABLE IF EXISTS `PagePermissionPropertyAttributeAccessListCustom`;
CREATE TABLE `PagePermissionPropertyAttributeAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`akID`),
  KEY `peID` (`peID`),
  KEY `akID` (`akID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PagePermissionThemeAccessList`
--

DROP TABLE IF EXISTS `PagePermissionThemeAccessList`;
CREATE TABLE `PagePermissionThemeAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`),
  KEY `peID` (`peID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PagePermissionThemeAccessListCustom`
--

DROP TABLE IF EXISTS `PagePermissionThemeAccessListCustom`;
CREATE TABLE `PagePermissionThemeAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `pThemeID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`pThemeID`),
  KEY `peID` (`peID`),
  KEY `pThemeID` (`pThemeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Pages`
--

DROP TABLE IF EXISTS `Pages`;
CREATE TABLE `Pages` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `ptID` int(10) unsigned NOT NULL DEFAULT '0',
  `cIsTemplate` tinyint(1) NOT NULL DEFAULT '0',
  `uID` int(10) unsigned DEFAULT NULL,
  `cIsCheckedOut` tinyint(1) NOT NULL DEFAULT '0',
  `cCheckedOutUID` int(10) unsigned DEFAULT NULL,
  `cCheckedOutDatetime` datetime DEFAULT NULL,
  `cCheckedOutDatetimeLastEdit` datetime DEFAULT NULL,
  `cOverrideTemplatePermissions` tinyint(1) NOT NULL DEFAULT '1',
  `cInheritPermissionsFromCID` int(10) unsigned NOT NULL DEFAULT '0',
  `cInheritPermissionsFrom` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PARENT',
  `cFilename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cPointerID` int(10) unsigned NOT NULL DEFAULT '0',
  `cPointerExternalLink` longtext COLLATE utf8_unicode_ci,
  `cPointerExternalLinkNewWindow` tinyint(1) NOT NULL DEFAULT '0',
  `cIsActive` tinyint(1) NOT NULL DEFAULT '1',
  `cChildren` int(10) unsigned NOT NULL DEFAULT '0',
  `cDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `cParentID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  `cDraftTargetParentPageID` int(10) unsigned NOT NULL DEFAULT '0',
  `cCacheFullPageContent` smallint(6) NOT NULL DEFAULT '-1',
  `cCacheFullPageContentOverrideLifetime` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `cCacheFullPageContentLifetimeCustom` int(10) unsigned NOT NULL DEFAULT '0',
  `cIsSystemPage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`ptID`),
  KEY `cParentID` (`cParentID`),
  KEY `cIsActive` (`cID`,`cIsActive`),
  KEY `cCheckedOutUID` (`cCheckedOutUID`),
  KEY `uID` (`uID`,`cPointerID`),
  KEY `cPointerID` (`cPointerID`,`cDisplayOrder`),
  KEY `cIsTemplate` (`cID`,`cIsTemplate`),
  KEY `cIsSystemPage` (`cID`,`cIsSystemPage`),
  KEY `pkgID` (`pkgID`),
  KEY `cParentMaxDisplay` (`cParentID`,`cDisplayOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `Pages`
--

INSERT INTO `Pages` (`cID`, `ptID`, `cIsTemplate`, `uID`, `cIsCheckedOut`, `cCheckedOutUID`, `cCheckedOutDatetime`, `cCheckedOutDatetimeLastEdit`, `cOverrideTemplatePermissions`, `cInheritPermissionsFromCID`, `cInheritPermissionsFrom`, `cFilename`, `cPointerID`, `cPointerExternalLink`, `cPointerExternalLinkNewWindow`, `cIsActive`, `cChildren`, `cDisplayOrder`, `cParentID`, `pkgID`, `cDraftTargetParentPageID`, `cCacheFullPageContent`, `cCacheFullPageContentOverrideLifetime`, `cCacheFullPageContentLifetimeCustom`, `cIsSystemPage`) VALUES
(1, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'OVERRIDE', NULL, 0, NULL, 0, 1, 22, 0, 0, 0, 0, -1, '0', 0, 0),
(2, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'OVERRIDE', '/dashboard/view.php', 0, NULL, 0, 1, 13, 0, 0, 0, 0, -1, '0', 0, 1),
(3, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/sitemap/view.php', 0, NULL, 0, 1, 3, 0, 2, 0, 0, -1, '0', 0, 1),
(4, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/sitemap/full.php', 0, NULL, 0, 1, 0, 0, 3, 0, 0, -1, '0', 0, 1),
(5, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/sitemap/explore.php', 0, NULL, 0, 1, 0, 1, 3, 0, 0, -1, '0', 0, 1),
(6, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/sitemap/search.php', 0, NULL, 0, 1, 0, 2, 3, 0, 0, -1, '0', 0, 1),
(7, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/view.php', 0, NULL, 0, 1, 4, 1, 2, 0, 0, -1, '0', 0, 1),
(8, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/search.php', 0, NULL, 0, 1, 0, 0, 7, 0, 0, -1, '0', 0, 1),
(9, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/attributes.php', 0, NULL, 0, 1, 0, 1, 7, 0, 0, -1, '0', 0, 1),
(10, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/sets.php', 0, NULL, 0, 1, 0, 2, 7, 0, 0, -1, '0', 0, 1),
(11, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/add_set.php', 0, NULL, 0, 1, 0, 3, 7, 0, 0, -1, '0', 0, 1),
(12, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/view.php', 0, NULL, 0, 1, 7, 2, 2, 0, 0, -1, '0', 0, 1),
(13, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/search.php', 0, NULL, 0, 1, 0, 0, 12, 0, 0, -1, '0', 0, 1),
(14, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/groups.php', 0, NULL, 0, 1, 1, 1, 12, 0, 0, -1, '0', 0, 1),
(15, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/attributes.php', 0, NULL, 0, 1, 0, 2, 12, 0, 0, -1, '0', 0, 1),
(16, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/add.php', 0, NULL, 0, 1, 0, 3, 12, 0, 0, -1, '0', 0, 1),
(17, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/add_group.php', 0, NULL, 0, 1, 0, 4, 12, 0, 0, -1, '0', 0, 1),
(18, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/groups/bulkupdate.php', 0, NULL, 0, 1, 0, 0, 14, 0, 0, -1, '0', 0, 1),
(19, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/group_sets.php', 0, NULL, 0, 1, 0, 5, 12, 0, 0, -1, '0', 0, 1),
(20, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/points/view.php', 0, NULL, 0, 1, 2, 6, 12, 0, 0, -1, '0', 0, 1),
(21, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/points/assign.php', 0, NULL, 0, 1, 0, 0, 20, 0, 0, -1, '0', 0, 1),
(22, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/points/actions.php', 0, NULL, 0, 1, 0, 1, 20, 0, 0, -1, '0', 0, 1),
(23, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports.php', 0, NULL, 0, 1, 3, 3, 2, 0, 0, -1, '0', 0, 1),
(24, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports/forms.php', 0, NULL, 0, 1, 0, 0, 23, 0, 0, -1, '0', 0, 1),
(25, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports/surveys.php', 0, NULL, 0, 1, 0, 1, 23, 0, 0, -1, '0', 0, 1),
(26, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports/logs.php', 0, NULL, 0, 1, 0, 2, 23, 0, 0, -1, '0', 0, 1),
(27, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/view.php', 0, NULL, 0, 1, 6, 4, 2, 0, 0, -1, '0', 0, 1),
(28, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/themes/view.php', 0, NULL, 0, 1, 1, 0, 27, 0, 0, -1, '0', 0, 1),
(29, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/themes/inspect.php', 0, NULL, 0, 1, 0, 0, 28, 0, 0, -1, '0', 0, 1),
(30, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/view.php', 0, NULL, 0, 1, 6, 1, 27, 0, 0, -1, '0', 0, 1),
(31, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/organize.php', 0, NULL, 0, 1, 0, 0, 30, 0, 0, -1, '0', 0, 1),
(32, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/add.php', 0, NULL, 0, 1, 0, 1, 30, 0, 0, -1, '0', 0, 1),
(33, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/form.php', 0, NULL, 0, 1, 0, 2, 30, 0, 0, -1, '0', 0, 1),
(34, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/output.php', 0, NULL, 0, 1, 0, 3, 30, 0, 0, -1, '0', 0, 1),
(35, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/attributes.php', 0, NULL, 0, 1, 0, 4, 30, 0, 0, -1, '0', 0, 1),
(36, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/permissions.php', 0, NULL, 0, 1, 0, 5, 30, 0, 0, -1, '0', 0, 1),
(37, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/templates/view.php', 0, NULL, 0, 1, 1, 2, 27, 0, 0, -1, '0', 0, 1),
(38, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/templates/add.php', 0, NULL, 0, 1, 0, 0, 37, 0, 0, -1, '0', 0, 1),
(39, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/attributes.php', 0, NULL, 0, 1, 0, 3, 27, 0, 0, -1, '0', 0, 1),
(40, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/single.php', 0, NULL, 0, 1, 0, 4, 27, 0, 0, -1, '0', 0, 1),
(41, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/feeds.php', 0, NULL, 0, 1, 0, 5, 27, 0, 0, -1, '0', 0, 1),
(42, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/conversations/view.php', 0, NULL, 0, 1, 1, 5, 2, 0, 0, -1, '0', 0, 1),
(43, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/conversations/messages.php', 0, NULL, 0, 1, 0, 0, 42, 0, 0, -1, '0', 0, 1),
(44, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/workflow/view.php', 0, NULL, 0, 1, 2, 6, 2, 0, 0, -1, '0', 0, 1),
(45, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/workflow/workflows.php', 0, NULL, 0, 1, 0, 0, 44, 0, 0, -1, '0', 0, 1),
(46, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/workflow/me.php', 0, NULL, 0, 1, 0, 1, 44, 0, 0, -1, '0', 0, 1),
(47, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/blocks/view.php', 0, NULL, 0, 1, 3, 7, 2, 0, 0, -1, '0', 0, 1),
(48, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/blocks/stacks/view.php', 0, NULL, 0, 1, 1, 0, 47, 0, 0, -1, '0', 0, 1),
(49, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/blocks/permissions.php', 0, NULL, 0, 1, 0, 1, 47, 0, 0, -1, '0', 0, 1),
(50, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/blocks/stacks/list/view.php', 0, NULL, 0, 1, 0, 0, 48, 0, 0, -1, '0', 0, 1),
(51, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/blocks/types/view.php', 0, NULL, 0, 1, 0, 2, 47, 0, 0, -1, '0', 0, 1),
(52, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/view.php', 0, NULL, 0, 1, 5, 8, 2, 0, 0, -1, '0', 0, 1),
(53, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/news.php', 0, NULL, 0, 1, 0, 9, 2, 0, 0, -1, '0', 0, 1),
(54, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/install.php', 0, NULL, 0, 1, 0, 0, 52, 0, 0, -1, '0', 0, 1),
(55, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/update.php', 0, NULL, 0, 1, 0, 1, 52, 0, 0, -1, '0', 0, 1),
(56, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/connect.php', 0, NULL, 0, 1, 0, 2, 52, 0, 0, -1, '0', 0, 1),
(57, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/themes.php', 0, NULL, 0, 1, 0, 3, 52, 0, 0, -1, '0', 0, 1),
(58, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/addons.php', 0, NULL, 0, 1, 0, 4, 52, 0, 0, -1, '0', 0, 1),
(59, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/view.php', 0, NULL, 0, 1, 12, 10, 2, 0, 0, -1, '0', 0, 1),
(60, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/view.php', 0, NULL, 0, 1, 7, 0, 59, 0, 0, -1, '0', 0, 1),
(61, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/name.php', 0, NULL, 0, 1, 0, 0, 60, 0, 0, -1, '0', 0, 1),
(62, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/accessibility.php', 0, NULL, 0, 1, 0, 1, 60, 0, 0, -1, '0', 0, 1),
(63, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/social.php', 0, NULL, 0, 1, 0, 2, 60, 0, 0, -1, '0', 0, 1),
(64, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/icons.php', 0, NULL, 0, 1, 0, 3, 60, 0, 0, -1, '0', 0, 1),
(65, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/editor.php', 0, NULL, 0, 1, 0, 4, 60, 0, 0, -1, '0', 0, 1),
(66, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/multilingual/view.php', 0, NULL, 0, 1, 0, 5, 60, 0, 0, -1, '0', 0, 1),
(67, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/timezone.php', 0, NULL, 0, 1, 0, 6, 60, 0, 0, -1, '0', 0, 1),
(68, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/multilingual/view.php', 0, NULL, 0, 1, 3, 1, 59, 0, 0, -1, '0', 0, 1),
(69, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/multilingual/setup.php', 0, NULL, 0, 1, 0, 0, 68, 0, 0, -1, '0', 0, 1),
(70, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/multilingual/page_report.php', 0, NULL, 0, 1, 0, 1, 68, 0, 0, -1, '0', 0, 1),
(71, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/multilingual/translate_interface.php', 0, NULL, 0, 1, 0, 2, 68, 0, 0, -1, '0', 0, 1),
(72, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/view.php', 0, NULL, 0, 1, 5, 2, 59, 0, 0, -1, '0', 0, 1),
(73, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/urls.php', 0, NULL, 0, 1, 0, 0, 72, 0, 0, -1, '0', 0, 1),
(74, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/bulk.php', 0, NULL, 0, 1, 0, 1, 72, 0, 0, -1, '0', 0, 1),
(75, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/codes.php', 0, NULL, 0, 1, 0, 2, 72, 0, 0, -1, '0', 0, 1),
(76, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/excluded.php', 0, NULL, 0, 1, 0, 3, 72, 0, 0, -1, '0', 0, 1),
(77, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/searchindex.php', 0, NULL, 0, 1, 0, 4, 72, 0, 0, -1, '0', 0, 1),
(78, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/files/view.php', 0, NULL, 0, 1, 4, 3, 59, 0, 0, -1, '0', 0, 1),
(79, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/files/permissions.php', 0, NULL, 0, 1, 0, 0, 78, 0, 0, -1, '0', 0, 1),
(80, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/files/filetypes.php', 0, NULL, 0, 1, 0, 1, 78, 0, 0, -1, '0', 0, 1),
(81, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/files/thumbnails.php', 0, NULL, 0, 1, 0, 2, 78, 0, 0, -1, '0', 0, 1),
(82, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/files/storage.php', 0, NULL, 0, 1, 0, 3, 78, 0, 0, -1, '0', 0, 1),
(83, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/optimization/view.php', 0, NULL, 0, 1, 4, 4, 59, 0, 0, -1, '0', 0, 1),
(84, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/optimization/cache.php', 0, NULL, 0, 1, 0, 0, 83, 0, 0, -1, '0', 0, 1),
(85, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/optimization/clearcache.php', 0, NULL, 0, 1, 0, 1, 83, 0, 0, -1, '0', 0, 1),
(86, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/optimization/jobs.php', 0, NULL, 0, 1, 0, 2, 83, 0, 0, -1, '0', 0, 1),
(87, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/optimization/query_log.php', 0, NULL, 0, 1, 0, 3, 83, 0, 0, -1, '0', 0, 1),
(88, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/view.php', 0, NULL, 0, 1, 8, 5, 59, 0, 0, -1, '0', 0, 1),
(89, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/site.php', 0, NULL, 0, 1, 0, 0, 88, 0, 0, -1, '0', 0, 1),
(90, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/tasks.php', 0, NULL, 0, 1, 0, 1, 88, 0, 0, -1, '0', 0, 1),
(91, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/users.php', 0, NULL, 0, 1, 0, 2, 88, 0, 0, -1, '0', 0, 1),
(92, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/advanced.php', 0, NULL, 0, 1, 0, 3, 88, 0, 0, -1, '0', 0, 1),
(93, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/blacklist.php', 0, NULL, 0, 1, 0, 4, 88, 0, 0, -1, '0', 0, 1),
(94, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/captcha.php', 0, NULL, 0, 1, 0, 5, 88, 0, 0, -1, '0', 0, 1),
(95, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/antispam.php', 0, NULL, 0, 1, 0, 6, 88, 0, 0, -1, '0', 0, 1),
(96, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/maintenance.php', 0, NULL, 0, 1, 0, 7, 88, 0, 0, -1, '0', 0, 1),
(97, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/view.php', 0, NULL, 0, 1, 4, 6, 59, 0, 0, -1, '0', 0, 1),
(98, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/postlogin.php', 0, NULL, 0, 1, 0, 0, 97, 0, 0, -1, '0', 0, 1),
(99, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/profiles.php', 0, NULL, 0, 1, 0, 1, 97, 0, 0, -1, '0', 0, 1),
(100, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/open.php', 0, NULL, 0, 1, 0, 2, 97, 0, 0, -1, '0', 0, 1),
(101, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/authentication.php', 0, NULL, 0, 1, 0, 3, 97, 0, 0, -1, '0', 0, 1),
(102, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/mail/view.php', 0, NULL, 0, 1, 2, 7, 59, 0, 0, -1, '0', 0, 1),
(103, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/mail/method.php', 0, NULL, 0, 1, 1, 0, 102, 0, 0, -1, '0', 0, 1),
(104, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/mail/method/test.php', 0, NULL, 0, 1, 0, 0, 103, 0, 0, -1, '0', 0, 1),
(105, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/mail/importers.php', 0, NULL, 0, 1, 0, 1, 102, 0, 0, -1, '0', 0, 1),
(106, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/conversations/view.php', 0, NULL, 0, 1, 4, 8, 59, 0, 0, -1, '0', 0, 1),
(107, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/conversations/settings.php', 0, NULL, 0, 1, 0, 0, 106, 0, 0, -1, '0', 0, 1),
(108, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/conversations/points.php', 0, NULL, 0, 1, 0, 1, 106, 0, 0, -1, '0', 0, 1),
(109, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/conversations/bannedwords.php', 0, NULL, 0, 1, 0, 2, 106, 0, 0, -1, '0', 0, 1),
(110, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/conversations/permissions.php', 0, NULL, 0, 1, 0, 3, 106, 0, 0, -1, '0', 0, 1),
(111, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/attributes/view.php', 0, NULL, 0, 1, 3, 9, 59, 0, 0, -1, '0', 0, 1),
(112, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/attributes/sets.php', 0, NULL, 0, 1, 0, 0, 111, 0, 0, -1, '0', 0, 1),
(113, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/attributes/types.php', 0, NULL, 0, 1, 0, 1, 111, 0, 0, -1, '0', 0, 1),
(114, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/attributes/topics/view.php', 0, NULL, 0, 1, 1, 2, 111, 0, 0, -1, '0', 0, 1),
(115, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/attributes/topics/add.php', 0, NULL, 0, 1, 0, 0, 114, 0, 0, -1, '0', 0, 1),
(116, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/view.php', 0, NULL, 0, 1, 4, 10, 59, 0, 0, -1, '0', 0, 1),
(117, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/info.php', 0, NULL, 0, 1, 0, 0, 116, 0, 0, -1, '0', 0, 1),
(118, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/debug.php', 0, NULL, 0, 1, 0, 1, 116, 0, 0, -1, '0', 0, 1),
(119, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/logging.php', 0, NULL, 0, 1, 0, 2, 116, 0, 0, -1, '0', 0, 1),
(120, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/proxy.php', 0, NULL, 0, 1, 0, 3, 116, 0, 0, -1, '0', 0, 1),
(121, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/backup/view.php', 0, NULL, 0, 1, 2, 11, 59, 0, 0, -1, '0', 0, 1),
(122, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/backup/backup.php', 0, NULL, 0, 1, 0, 0, 121, 0, 0, -1, '0', 0, 1),
(123, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/backup/update.php', 0, NULL, 0, 1, 0, 1, 121, 0, 0, -1, '0', 0, 1),
(124, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', NULL, 0, NULL, 0, 1, 0, 11, 2, 0, 0, -1, '0', 0, 1),
(125, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', NULL, 0, NULL, 0, 1, 0, 12, 2, 0, 0, -1, '0', 0, 1),
(126, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/!drafts/view.php', 0, NULL, 0, 1, 5, 0, 0, 0, 0, -1, '0', 0, 1),
(127, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/!trash/view.php', 0, NULL, 0, 1, 8, 0, 0, 0, 0, -1, '0', 0, 1),
(128, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/!stacks/view.php', 0, NULL, 0, 1, 8, 0, 0, 0, 0, -1, '0', 0, 1),
(129, 0, 0, 1, 0, NULL, NULL, NULL, 1, 129, 'OVERRIDE', '/login.php', 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(130, 0, 0, 1, 0, NULL, NULL, NULL, 1, 130, 'OVERRIDE', '/register.php', 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(131, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/account/view.php', 0, NULL, 0, 1, 3, 0, 0, 0, 0, -1, '0', 0, 1),
(132, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/account/edit_profile.php', 0, NULL, 0, 1, 0, 0, 131, 0, 0, -1, '0', 0, 1),
(133, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/account/avatar.php', 0, NULL, 0, 1, 0, 1, 131, 0, 0, -1, '0', 0, 1),
(134, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/account/messages/view.php', 0, NULL, 0, 1, 1, 2, 131, 0, 0, -1, '0', 0, 1),
(135, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/account/messages/inbox.php', 0, NULL, 0, 1, 0, 0, 134, 0, 0, -1, '0', 0, 1),
(136, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/members/view.php', 0, NULL, 0, 1, 2, 0, 1, 0, 0, -1, '0', 0, 1),
(137, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/members/profile.php', 0, NULL, 0, 1, 0, 0, 136, 0, 0, -1, '0', 0, 1),
(138, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/members/directory.php', 0, NULL, 0, 1, 0, 1, 136, 0, 0, -1, '0', 0, 1),
(139, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/page_not_found.php', 0, NULL, 0, 1, 0, 1, 0, 0, 0, -1, '0', 0, 1),
(140, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/page_forbidden.php', 0, NULL, 0, 1, 0, 1, 0, 0, 0, -1, '0', 0, 1),
(141, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/download_file.php', 0, NULL, 0, 1, 0, 1, 1, 0, 0, -1, '0', 0, 1),
(142, 1, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 128, 0, 0, -1, '0', 0, 1),
(143, 1, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 1, 128, 0, 0, -1, '0', 0, 1),
(144, 1, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 2, 128, 0, 0, -1, '0', 0, 1),
(145, 1, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 3, 128, 0, 0, -1, '0', 0, 1),
(146, 1, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 4, 128, 0, 0, -1, '0', 0, 1),
(147, 1, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 5, 128, 0, 0, -1, '0', 0, 1),
(148, 1, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 6, 128, 0, 0, -1, '0', 0, 1),
(149, 1, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 7, 128, 0, 0, -1, '0', 0, 1),
(150, 5, 1, NULL, 0, NULL, NULL, NULL, 1, 150, 'OVERRIDE', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 0),
(151, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 1, 0, 0, -1, '0', 0, 0),
(152, 10, 1, NULL, 0, NULL, NULL, NULL, 1, 152, 'OVERRIDE', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 0),
(153, 10, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 6, 19, 127, 0, 0, -1, '0', 0, 1),
(154, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 3, 20, 127, 0, 0, -1, '0', 0, 1),
(155, 9, 1, NULL, 0, NULL, NULL, NULL, 1, 155, 'OVERRIDE', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 0),
(156, 9, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 3, 21, 127, 0, 0, -1, '0', 0, 1),
(157, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 1, 1, 0, 0, -1, '0', 0, 0),
(158, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 2, 1, 0, 0, -1, '0', 0, 0),
(159, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 22, 127, 0, 0, -1, '0', 0, 1),
(160, 8, 1, NULL, 0, NULL, NULL, NULL, 1, 160, 'OVERRIDE', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 0),
(161, 8, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 0, 153, 0, 0, -1, '0', 0, 1),
(162, 8, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 1, 153, 0, 0, -1, '0', 0, 1),
(163, 8, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 2, 153, 0, 0, -1, '0', 0, 1),
(164, 8, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 3, 153, 0, 0, -1, '0', 0, 1),
(165, 8, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 4, 153, 0, 0, -1, '0', 0, 1),
(166, 8, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 5, 153, 0, 0, -1, '0', 0, 1),
(167, 6, 1, NULL, 0, NULL, NULL, NULL, 1, 167, 'OVERRIDE', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 0),
(168, 6, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 0, 156, 0, 0, -1, '0', 0, 1),
(169, 6, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 1, 156, 0, 0, -1, '0', 0, 1),
(170, 6, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 2, 156, 0, 0, -1, '0', 0, 1),
(171, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 0, 154, 0, 0, -1, '0', 0, 1),
(172, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 2, 1, 154, 0, 0, -1, '0', 0, 1),
(173, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 2, 154, 0, 0, -1, '0', 0, 1),
(174, 7, 1, NULL, 0, NULL, NULL, NULL, 1, 174, 'OVERRIDE', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 0),
(175, 7, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 0, 172, 0, 0, -1, '0', 0, 1),
(176, 7, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 1, 172, 0, 0, -1, '0', 0, 1),
(177, 5, 1, NULL, 0, NULL, NULL, NULL, 1, 177, 'OVERRIDE', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 0),
(178, 5, 1, NULL, 0, NULL, NULL, NULL, 1, 178, 'OVERRIDE', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 0),
(179, 5, 1, NULL, 0, NULL, NULL, NULL, 1, 179, 'OVERRIDE', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 0),
(180, 0, 0, 1, 0, NULL, NULL, NULL, 1, 180, 'OVERRIDE', NULL, 0, NULL, 0, 0, 0, 2, 126, 0, 0, -1, '0', 0, 1),
(181, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 23, 127, 0, 1, -1, '0', 0, 1),
(182, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 24, 127, 0, 1, -1, '0', 0, 1),
(183, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 25, 127, 0, 1, -1, '0', 0, 1),
(184, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 4, 1, 0, 1, -1, '0', 0, 0),
(185, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 5, 1, 0, 1, -1, '0', 0, 0),
(186, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 6, 1, 0, 1, -1, '0', 0, 0),
(187, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 7, 1, 0, 1, -1, '0', 0, 0),
(188, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 8, 1, 0, 1, -1, '0', 0, 0),
(189, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 18, 127, 0, 1, -1, '0', 0, 1),
(190, 5, 0, 1, 0, NULL, NULL, NULL, 0, 190, 'OVERRIDE', NULL, 0, NULL, 0, 1, 1, 9, 1, 0, 1, -1, '0', 0, 0),
(199, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 1, 10, 1, 1, 0, -1, '0', 0, 0),
(200, 11, 1, NULL, 0, NULL, NULL, NULL, 1, 200, 'OVERRIDE', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 0),
(201, 11, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 199, 1, 0, -1, '0', 0, 0),
(202, 11, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 3, 126, 1, 0, -1, '0', 0, 1),
(203, 11, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 4, 126, 1, 0, -1, '0', 0, 1),
(204, 11, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 5, 126, 1, 0, -1, '0', 0, 1),
(205, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 0, 0, 6, 126, 0, 0, -1, '0', 0, 1),
(208, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 3, 3, 1, 0, 1, -1, '0', 0, 0),
(209, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 8, 208, 0, 208, -1, '0', 0, 0),
(210, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 9, 208, 0, 208, -1, '0', 0, 0),
(211, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 10, 208, 0, 208, -1, '0', 0, 0),
(212, 5, 0, 1, 0, NULL, NULL, NULL, 1, 150, 'TEMPLATE', NULL, 0, NULL, 0, 1, 1, 8, 190, 0, 190, -1, '0', 0, 0),
(213, 5, 0, 1, 0, NULL, NULL, NULL, 1, 150, 'PARENT', NULL, 0, NULL, 0, 1, 0, 8, 212, 0, 212, -1, '0', 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PageSearchIndex`
--

DROP TABLE IF EXISTS `PageSearchIndex`;
CREATE TABLE `PageSearchIndex` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `cName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cDescription` text COLLATE utf8_unicode_ci,
  `cPath` text COLLATE utf8_unicode_ci,
  `cDatePublic` datetime DEFAULT NULL,
  `cDateLastIndexed` datetime DEFAULT NULL,
  `cDateLastSitemapped` datetime DEFAULT NULL,
  `cRequiresReindex` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`cID`),
  KEY `cDateLastIndexed` (`cDateLastIndexed`),
  KEY `cDateLastSitemapped` (`cDateLastSitemapped`),
  KEY `cRequiresReindex` (`cRequiresReindex`),
  FULLTEXT KEY `cName` (`cName`),
  FULLTEXT KEY `cDescription` (`cDescription`),
  FULLTEXT KEY `content` (`content`),
  FULLTEXT KEY `content2` (`cName`,`cDescription`,`content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `PageSearchIndex`
--

INSERT INTO `PageSearchIndex` (`cID`, `content`, `cName`, `cDescription`, `cPath`, `cDatePublic`, `cDateLastIndexed`, `cDateLastSitemapped`, `cRequiresReindex`) VALUES
(2, '', 'Dashboard', '', '/dashboard', '2015-04-06 20:45:19', '2015-04-06 20:45:31', NULL, 0),
(3, '', 'Sitemap', 'Whole world at a glance.', '/dashboard/sitemap', '2015-04-06 20:45:21', '2015-04-06 20:45:31', NULL, 0),
(4, '', 'Full Sitemap', '', '/dashboard/sitemap/full', '2015-04-06 20:45:21', '2015-04-06 20:45:32', NULL, 0),
(5, '', 'Flat View', '', '/dashboard/sitemap/explore', '2015-04-06 20:45:21', '2015-04-06 20:45:32', NULL, 0),
(6, '', 'Page Search', '', '/dashboard/sitemap/search', '2015-04-06 20:45:21', '2015-04-06 20:45:32', NULL, 0),
(8, '', 'File Manager', '', '/dashboard/files/search', '2015-04-06 20:45:21', '2015-04-06 20:45:32', NULL, 0),
(9, '', 'Attributes', '', '/dashboard/files/attributes', '2015-04-06 20:45:21', '2015-04-06 20:45:32', NULL, 0),
(10, '', 'File Sets', '', '/dashboard/files/sets', '2015-04-06 20:45:22', '2015-04-06 20:45:32', NULL, 0),
(11, '', 'Add File Set', '', '/dashboard/files/add_set', '2015-04-06 20:45:22', '2015-04-06 20:45:32', NULL, 0),
(12, '', 'Members', 'Add and manage the user accounts and groups on your website.', '/dashboard/users', '2015-04-06 20:45:22', '2015-04-06 20:45:32', NULL, 0),
(13, '', 'Search Users', '', '/dashboard/users/search', '2015-04-06 20:45:22', '2015-04-06 20:45:32', NULL, 0),
(14, '', 'User Groups', '', '/dashboard/users/groups', '2015-04-06 20:45:22', '2015-04-06 20:45:32', NULL, 0),
(15, '', 'Attributes', '', '/dashboard/users/attributes', '2015-04-06 20:45:22', '2015-04-06 20:45:32', NULL, 0),
(16, '', 'Add User', '', '/dashboard/users/add', '2015-04-06 20:45:22', '2015-04-06 20:45:32', NULL, 0),
(17, '', 'Add Group', '', '/dashboard/users/add_group', '2015-04-06 20:45:22', '2015-04-06 20:45:32', NULL, 0),
(19, '', 'Group Sets', '', '/dashboard/users/group_sets', '2015-04-06 20:45:23', '2015-04-06 20:45:32', NULL, 0),
(20, '', 'Community Points', NULL, '/dashboard/users/points', '2015-04-06 20:45:23', '2015-04-06 20:45:32', NULL, 0),
(22, '', 'Actions', NULL, '/dashboard/users/points/actions', '2015-04-06 20:45:23', '2015-04-06 20:45:33', NULL, 0),
(23, '', 'Reports', 'Get data from forms and logs.', '/dashboard/reports', '2015-04-06 20:45:23', '2015-04-06 20:45:33', NULL, 0),
(24, '', 'Form Results', 'Get submission data.', '/dashboard/reports/forms', '2015-04-06 20:45:23', '2015-04-06 20:45:33', NULL, 0),
(25, '', 'Surveys', '', '/dashboard/reports/surveys', '2015-04-06 20:45:23', '2015-04-06 20:45:33', NULL, 0),
(26, '', 'Logs', '', '/dashboard/reports/logs', '2015-04-06 20:45:23', '2015-04-06 20:45:33', NULL, 0),
(28, '', 'Themes', 'Reskin your site.', '/dashboard/pages/themes', '2015-04-06 20:45:23', '2015-04-06 20:45:33', NULL, 0),
(29, '', 'Inspect', '', '/dashboard/pages/themes/inspect', '2015-04-06 20:45:23', '2015-04-06 20:45:33', NULL, 0),
(31, '', 'Organize Page Type Order', '', '/dashboard/pages/types/organize', '2015-04-06 20:45:23', '2015-04-06 20:45:33', NULL, 0),
(32, '', 'Add Page Type', '', '/dashboard/pages/types/add', '2015-04-06 20:45:23', '2015-04-06 20:45:33', NULL, 0),
(33, '', 'Compose Form', '', '/dashboard/pages/types/form', '2015-04-06 20:45:23', '2015-04-06 20:45:33', NULL, 0),
(34, '', 'Defaults and Output', '', '/dashboard/pages/types/output', '2015-04-06 20:45:24', '2015-04-06 20:45:33', NULL, 0),
(35, '', 'Page Type Attributes', '', '/dashboard/pages/types/attributes', '2015-04-06 20:45:24', '2015-04-06 20:45:33', NULL, 0),
(36, '', 'Page Type Permissions', '', '/dashboard/pages/types/permissions', '2015-04-06 20:45:24', '2015-04-06 20:45:33', NULL, 0),
(38, '', 'Add Page Template', 'Add page templates to your site.', '/dashboard/pages/templates/add', '2015-04-06 20:45:24', '2015-04-06 20:45:33', NULL, 0),
(39, '', 'Attributes', '', '/dashboard/pages/attributes', '2015-04-06 20:45:24', '2015-04-06 20:45:33', NULL, 0),
(40, '', 'Single Pages', '', '/dashboard/pages/single', '2015-04-06 20:45:24', '2015-04-06 20:45:33', NULL, 0),
(41, '', 'RSS Feeds', '', '/dashboard/pages/feeds', '2015-04-06 20:45:24', '2015-04-06 20:45:33', NULL, 0),
(43, '', 'Messages', '', '/dashboard/conversations/messages', '2015-04-06 20:45:24', '2015-04-06 20:45:33', NULL, 0),
(44, '', 'Workflow', '', '/dashboard/workflow', '2015-04-06 20:45:24', '2015-04-06 20:45:33', NULL, 0),
(48, '', 'Stacks', 'Share content across your site.', '/dashboard/blocks/stacks', '2015-04-06 20:45:25', '2015-04-06 20:45:33', NULL, 0),
(50, '', 'Stack List', '', '/dashboard/blocks/stacks/list', '2015-04-06 20:45:25', '2015-04-06 20:45:34', NULL, 0),
(51, '', 'Block Types', 'Manage the installed block types in your site.', '/dashboard/blocks/types', '2015-04-06 20:45:25', '2015-04-06 20:45:34', NULL, 0),
(52, '', 'Extend concrete5', '', '/dashboard/extend', '2015-04-06 20:45:25', '2015-04-06 20:45:34', NULL, 0),
(53, '', 'Dashboard', '', '/dashboard/news', '2015-04-06 20:45:25', '2015-04-06 20:45:34', NULL, 0),
(54, '', 'Add Functionality', 'Install add-ons & themes.', '/dashboard/extend/install', '2015-04-06 20:45:25', '2015-04-06 20:45:34', NULL, 0),
(55, '', 'Update Add-Ons', 'Update your installed packages.', '/dashboard/extend/update', '2015-04-06 20:45:25', '2015-04-06 20:45:34', NULL, 0),
(56, '', 'Connect to the Community', 'Connect to the concrete5 community.', '/dashboard/extend/connect', '2015-04-06 20:45:25', '2015-04-06 20:45:34', NULL, 0),
(57, '', 'Get More Themes', 'Download themes from concrete5.org.', '/dashboard/extend/themes', '2015-04-06 20:45:25', '2015-04-06 20:45:34', NULL, 0),
(58, '', 'Get More Add-Ons', 'Download add-ons from concrete5.org.', '/dashboard/extend/addons', '2015-04-06 20:45:25', '2015-04-06 20:45:34', NULL, 0),
(59, '', 'System & Settings', 'Secure and setup your site.', '/dashboard/system', '2015-04-06 20:45:26', '2015-04-06 20:45:34', NULL, 0),
(61, '', 'Site Name', '', '/dashboard/system/basics/name', '2015-04-06 20:45:26', '2015-04-06 20:45:34', NULL, 0),
(62, '', 'Accessibility', '', '/dashboard/system/basics/accessibility', '2015-04-06 20:45:26', '2015-04-06 20:45:34', NULL, 0),
(63, '', 'Social Links', '', '/dashboard/system/basics/social', '2015-04-06 20:45:26', '2015-04-06 20:45:34', NULL, 0),
(64, '', 'Bookmark Icons', 'Bookmark icon and mobile home screen icon setup.', '/dashboard/system/basics/icons', '2015-04-06 20:45:26', '2015-04-06 20:45:34', NULL, 0),
(65, '', 'Rich Text Editor', '', '/dashboard/system/basics/editor', '2015-04-06 20:45:26', '2015-04-06 20:45:34', NULL, 0),
(66, '', 'Languages', '', '/dashboard/system/basics/multilingual', '2015-04-06 20:45:26', '2015-04-06 20:45:34', NULL, 0),
(67, '', 'Time Zone', '', '/dashboard/system/basics/timezone', '2015-04-06 20:45:26', '2015-04-06 20:45:34', NULL, 0),
(68, '', 'Multilingual', 'Run your site in multiple languages.', '/dashboard/system/multilingual', '2015-04-06 20:45:27', '2015-04-06 20:45:34', NULL, 0),
(73, '', 'Pretty URLs', '', '/dashboard/system/seo/urls', '2015-04-06 20:45:27', '2015-04-06 20:45:34', NULL, 0),
(74, '', 'Bulk SEO Updater', '', '/dashboard/system/seo/bulk', '2015-04-06 20:45:27', '2015-04-06 20:45:35', NULL, 0),
(75, '', 'Tracking Codes', '', '/dashboard/system/seo/codes', '2015-04-06 20:45:27', '2015-04-06 20:45:35', NULL, 0),
(76, '', 'Excluded URL Word List', '', '/dashboard/system/seo/excluded', '2015-04-06 20:45:27', '2015-04-06 20:45:35', NULL, 0),
(77, '', 'Search Index', '', '/dashboard/system/seo/searchindex', '2015-04-06 20:45:27', '2015-04-06 20:45:35', NULL, 0),
(79, '', 'File Manager Permissions', '', '/dashboard/system/files/permissions', '2015-04-06 20:45:27', '2015-04-06 20:45:35', NULL, 0),
(80, '', 'Allowed File Types', '', '/dashboard/system/files/filetypes', '2015-04-06 20:45:28', '2015-04-06 20:45:35', NULL, 0),
(81, '', 'Thumbnails', '', '/dashboard/system/files/thumbnails', '2015-04-06 20:45:28', '2015-04-06 20:45:35', NULL, 0),
(82, '', 'File Storage Locations', '', '/dashboard/system/files/storage', '2015-04-06 20:45:28', '2015-04-06 20:45:35', NULL, 0),
(84, '', 'Cache & Speed Settings', '', '/dashboard/system/optimization/cache', '2015-04-06 20:45:28', '2015-04-06 20:45:35', NULL, 0),
(85, '', 'Clear Cache', '', '/dashboard/system/optimization/clearcache', '2015-04-06 20:45:28', '2015-04-06 20:45:35', NULL, 0),
(86, '', 'Automated Jobs', '', '/dashboard/system/optimization/jobs', '2015-04-06 20:45:28', '2015-04-06 20:45:35', NULL, 0),
(87, '', 'Database Query Log', '', '/dashboard/system/optimization/query_log', '2015-04-06 20:45:28', '2015-04-06 20:45:35', NULL, 0),
(89, '', 'Site Access', '', '/dashboard/system/permissions/site', '2015-04-06 20:45:28', '2015-04-06 20:45:35', NULL, 0),
(90, '', 'Task Permissions', '', '/dashboard/system/permissions/tasks', '2015-04-06 20:45:28', '2015-04-06 20:45:35', NULL, 0),
(93, '', 'IP Blacklist', '', '/dashboard/system/permissions/blacklist', '2015-04-06 20:45:28', '2015-04-06 20:45:35', NULL, 0),
(94, '', 'Captcha Setup', '', '/dashboard/system/permissions/captcha', '2015-04-06 20:45:28', '2015-04-06 20:45:35', NULL, 0),
(95, '', 'Spam Control', '', '/dashboard/system/permissions/antispam', '2015-04-06 20:45:29', '2015-04-06 20:45:35', NULL, 0),
(96, '', 'Maintenance Mode', '', '/dashboard/system/permissions/maintenance', '2015-04-06 20:45:29', '2015-04-06 20:45:35', NULL, 0),
(98, '', 'Login Destination', '', '/dashboard/system/registration/postlogin', '2015-04-06 20:45:29', '2015-04-06 20:45:35', NULL, 0),
(99, '', 'Public Profiles', '', '/dashboard/system/registration/profiles', '2015-04-06 20:45:29', '2015-04-06 20:45:35', NULL, 0),
(100, '', 'Public Registration', '', '/dashboard/system/registration/open', '2015-04-06 20:45:29', '2015-04-06 20:45:35', NULL, 0),
(101, '', 'Authentication Types', '', '/dashboard/system/registration/authentication', '2015-04-06 20:45:29', '2015-04-06 20:45:36', NULL, 0),
(102, '', 'Email', 'Control how your site send and processes mail.', '/dashboard/system/mail', '2015-04-06 20:45:29', '2015-04-06 20:45:36', NULL, 0),
(103, '', 'SMTP Method', '', '/dashboard/system/mail/method', '2015-04-06 20:45:29', '2015-04-06 20:45:36', NULL, 0),
(104, '', 'Test Mail Settings', '', '/dashboard/system/mail/method/test', '2015-04-06 20:45:29', '2015-04-06 20:45:36', NULL, 0),
(105, '', 'Email Importers', '', '/dashboard/system/mail/importers', '2015-04-06 20:45:29', '2015-04-06 20:45:36', NULL, 0),
(106, '', 'Conversations', 'Manage your conversations settings', '/dashboard/system/conversations', '2015-04-06 20:45:29', '2015-04-06 20:45:36', NULL, 0),
(107, '', 'Settings', '', '/dashboard/system/conversations/settings', '2015-04-06 20:45:29', '2015-04-06 20:45:36', NULL, 0),
(108, '', 'Community Points', '', '/dashboard/system/conversations/points', '2015-04-06 20:45:29', '2015-04-06 20:45:36', NULL, 0),
(109, '', 'Banned Words', '', '/dashboard/system/conversations/bannedwords', '2015-04-06 20:45:29', '2015-04-06 20:45:36', NULL, 0),
(111, '', 'Attributes', 'Setup attributes for pages, users, files and more.', '/dashboard/system/attributes', '2015-04-06 20:45:30', '2015-04-06 20:45:36', NULL, 0),
(112, '', 'Sets', 'Group attributes into sets for easier organization', '/dashboard/system/attributes/sets', '2015-04-06 20:45:30', '2015-04-06 20:45:36', NULL, 0),
(113, '', 'Types', 'Choose which attribute types are available for different items.', '/dashboard/system/attributes/types', '2015-04-06 20:45:30', '2015-04-06 20:45:36', NULL, 0),
(114, '', 'Topics', '', '/dashboard/system/attributes/topics', '2015-04-06 20:45:30', '2015-04-06 20:45:36', NULL, 0),
(116, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(117, '', 'Environment Information', '', '/dashboard/system/environment/info', '2015-04-06 20:45:30', '2015-04-06 20:45:36', NULL, 0),
(118, '', 'Debug Settings', '', '/dashboard/system/environment/debug', '2015-04-06 20:45:30', '2015-04-06 20:45:36', NULL, 0),
(119, '', 'Logging Settings', '', '/dashboard/system/environment/logging', '2015-04-06 20:45:30', '2015-04-06 20:45:36', NULL, 0),
(120, '', 'Proxy Server', '', '/dashboard/system/environment/proxy', '2015-04-06 20:45:30', '2015-04-06 20:45:36', NULL, 0),
(121, '', 'Backup & Restore', 'Backup or restore your website.', '/dashboard/system/backup', '2015-04-06 20:45:30', '2015-04-06 20:45:36', NULL, 0),
(123, '', 'Update concrete5', '', '/dashboard/system/backup/update', '2015-04-06 20:45:30', '2015-04-06 20:45:36', NULL, 0),
(124, '                                        ', 'Welcome to concrete5', 'Learn about how to use concrete5, how to develop for concrete5, and get general help.', '/dashboard/welcome', '2015-04-06 20:45:31', '2015-04-06 20:45:37', NULL, 0),
(125, '', 'Customize Dashboard Home', '', '/dashboard/home', '2015-04-06 20:45:31', '2015-04-06 20:45:37', NULL, 0),
(126, '', 'Drafts', '', '/!drafts', '2015-04-06 20:45:38', '2015-04-06 20:45:39', NULL, 0),
(127, '', 'Trash', '', '/!trash', '2015-04-06 20:45:38', '2015-04-06 20:45:39', NULL, 0),
(128, '', 'Stacks', '', '/!stacks', '2015-04-06 20:45:38', '2015-04-06 20:45:39', NULL, 0),
(131, '', 'My Account', '', '/account', '2015-04-06 20:45:38', '2015-04-06 20:45:39', NULL, 0),
(1, ' Uebung Biber   Uebung Wölf   Uebung Pfadi  ', 'Home', '', NULL, '2015-04-06 20:44:38', '2015-08-20 22:29:17', NULL, 0),
(212, '', 'Quittungen', '', '/administration/quittungen', '2015-10-08 22:27:54', '2015-10-08 22:29:09', NULL, 0),
(213, '', 'Budgets verwalten', '', '/administration/quittungen/budgets-verwalten', '2015-10-08 22:58:45', '2015-10-08 22:59:11', NULL, 0),
(201, '', 'test', NULL, '/product-detail/test', '2015-08-05 22:17:20', '2015-08-05 22:17:21', NULL, 0),
(211, '', 'Pfadi', '', '/stufen/pfadi', '2015-08-05 22:59:31', '2015-08-05 23:01:52', NULL, 0),
(151, 'Our Expertise Quality Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sodales non leo id aliquet. Design Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sodales non leo id aliquet. Development Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sodales non leo id aliquet. Security Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sodales non leo id aliquet. Awesome Features Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. Sed consequat eleifend metus, vitae malesuada eros elementum sed.  Guide Books Fusce risus felis, viverra et dignissim at, lobortis non est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet consectetur lacus. Vestibulum neque lectus, egestas non cursus vitae, aliquam at magna. Etiam aliquam, justo et varius eleifend, dui lectus egestas nunc, vel malesuada nisl purus nec metus.  Admin Accounts Fusce risus felis, viverra et dignissim at, lobortis non est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet consectetur lacus. Vestibulum neque lectus, egestas non cursus vitae, aliquam at magna. Etiam aliquam, justo et varius eleifend, dui lectus egestas nunc, vel malesuada nisl purus nec metus.   Support Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. Sed consequat eleifend metus, vitae malesuada eros elementum sed.  Additional Options Fusce risus felis, viverra et dignissim at, lobortis non est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet consectetur lacus. Vestibulum neque lectus, egestas non cursus vitae, aliquam at magna.   Etiam aliquam, justo et varius eleifend, dui lectus egestas nunc, vel malesuada nisl purus nec metus. In gravida turpis a pharetra commodo. Donec non turpis vulputate, faucibus metus a, consectetur nunc. Morbi tortor nisi, hendrerit sed laoreet eget, fermentum et justo. Suspendisse potenti.  What Clients Are Saying About Us  Franz Maruna\nconcrete5\nCurabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. John Doe\nCompanyCo\nCurabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. Andrew Embler\nconcrete5\nCurabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. Jane Doe\nCompanyCo\nCurabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. ', 'Services', '', '/services', '2015-04-06 20:46:00', '2015-05-02 17:07:34', NULL, 0),
(153, '', 'Portfolio', '', '/portfolio', '2015-04-06 20:46:00', '2015-05-02 17:07:34', NULL, 0),
(161, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tempus nibh a laoreet cursus. Phasellus malesuada vulputate bibendum. Ut vitae justo nisi. Sed consectetur vestibulum tortor, in bibendum diam lacinia vitae. Nullam volutpat risus quis orci consectetur adipiscing. In commodo vulputate arcu sit amet ornare. Vivamus ut iaculis velit. Pellentesque euismod lacus sed accumsan luctus. Suspendisse urna felis, lacinia vel tempor id, ultricies rutrum nisl. Nunc ultrices nulla et bibendum molestie. Phasellus porttitor sit amet libero vel fermentum. Sed sapien risus, eleifend vel hendrerit eu, porta vel tellus. Duis faucibus odio et magna varius, quis accumsan tellus vestibulum. Nam nunc nulla, convallis at elementum pharetra, adipiscing quis enim. Donec feugiat porttitor dolor, nec porttitor mi auctor eget. Fusce iaculis varius diam non dictum. Fusce elementum a nunc vel tincidunt. Morbi nec est elementum, vehicula odio nec, lobortis lacus. Nulla ultricies vitae nunc ut lacinia. Proin mattis felis sem, eu consectetur arcu varius et. Duis at lectus eu lorem elementum aliquet nec in elit. Vestibulum non metus ac risus adipiscing pellentesque sed sit amet lorem. Donec viverra, metus in varius pulvinar, augue nunc accumsan eros, a pulvinar est elit vitae nulla.  Duis non leo in enim laoreet pretium. Nullam vitae neque nec libero pharetra tempor at faucibus lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed imperdiet convallis arcu. Nam sollicitudin sollicitudin lacus non dictum. Aliquam erat volutpat. Nulla sapien quam, consequat non dui ut, eleifend sodales orci. Praesent quis lorem accumsan, volutpat lectus a, sollicitudin erat. Donec faucibus mi in sapien volutpat, ac auctor lorem mollis. Proin eget turpis non lacus bibendum porta non ac justo. Aliquam aliquam viverra lorem ac rutrum. In et sapien sit amet diam vestibulum cursus ut tristique tellus.  Ut in purus mi. Etiam ac aliquet ipsum. Pellentesque faucibus diam dui. Morbi a semper orci. Ut nec malesuada urna. Vestibulum aliquet ante ac lacus dictum, sit amet pulvinar leo laoreet. Maecenas ut est commodo, commodo quam nec, dignissim est. Quisque rutrum molestie nunc, sed mollis nulla volutpat et. Donec dignissim ornare augue eu aliquam. Aliquam in tincidunt velit. In at fermentum mauris, ut accumsan nisl. Interdum et malesuada fames ac ante ipsum primis in faucibus.  Integer ac nulla at nisi sodales ullamcorper id in justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam pharetra elit odio, ac mattis turpis consequat ac. Pellentesque tincidunt sed enim nec auctor. Quisque varius, felis a hendrerit faucibus, nunc lorem varius nibh, vel dignissim velit dolor ut elit. Mauris ut vulputate neque. Donec at est vitae massa egestas fringilla. Praesent a tristique nibh. Nunc blandit dui risus, quis rhoncus nisi consectetur vel.  ', 'Project Title', 'Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing.', '/portfolio/project-title', '2014-08-06 15:30:00', '2015-04-06 20:46:21', NULL, 0),
(162, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tempus nibh a laoreet cursus. Phasellus malesuada vulputate bibendum. Ut vitae justo nisi. Sed consectetur vestibulum tortor, in bibendum diam lacinia vitae. Nullam volutpat risus quis orci consectetur adipiscing. In commodo vulputate arcu sit amet ornare. Vivamus ut iaculis velit. Pellentesque euismod lacus sed accumsan luctus. Suspendisse urna felis, lacinia vel tempor id, ultricies rutrum nisl. Nunc ultrices nulla et bibendum molestie. Phasellus porttitor sit amet libero vel fermentum. Sed sapien risus, eleifend vel hendrerit eu, porta vel tellus. Duis faucibus odio et magna varius, quis accumsan tellus vestibulum. Nam nunc nulla, convallis at elementum pharetra, adipiscing quis enim. Donec feugiat porttitor dolor, nec porttitor mi auctor eget. Fusce iaculis varius diam non dictum. Fusce elementum a nunc vel tincidunt. Morbi nec est elementum, vehicula odio nec, lobortis lacus. Nulla ultricies vitae nunc ut lacinia. Proin mattis felis sem, eu consectetur arcu varius et. Duis at lectus eu lorem elementum aliquet nec in elit. Vestibulum non metus ac risus adipiscing pellentesque sed sit amet lorem. Donec viverra, metus in varius pulvinar, augue nunc accumsan eros, a pulvinar est elit vitae nulla.  Duis non leo in enim laoreet pretium. Nullam vitae neque nec libero pharetra tempor at faucibus lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed imperdiet convallis arcu. Nam sollicitudin sollicitudin lacus non dictum. Aliquam erat volutpat. Nulla sapien quam, consequat non dui ut, eleifend sodales orci. Praesent quis lorem accumsan, volutpat lectus a, sollicitudin erat. Donec faucibus mi in sapien volutpat, ac auctor lorem mollis. Proin eget turpis non lacus bibendum porta non ac justo. Aliquam aliquam viverra lorem ac rutrum. In et sapien sit amet diam vestibulum cursus ut tristique tellus.  Ut in purus mi. Etiam ac aliquet ipsum. Pellentesque faucibus diam dui. Morbi a semper orci. Ut nec malesuada urna. Vestibulum aliquet ante ac lacus dictum, sit amet pulvinar leo laoreet. Maecenas ut est commodo, commodo quam nec, dignissim est. Quisque rutrum molestie nunc, sed mollis nulla volutpat et. Donec dignissim ornare augue eu aliquam. Aliquam in tincidunt velit. In at fermentum mauris, ut accumsan nisl. Interdum et malesuada fames ac ante ipsum primis in faucibus.  Integer ac nulla at nisi sodales ullamcorper id in justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam pharetra elit odio, ac mattis turpis consequat ac. Pellentesque tincidunt sed enim nec auctor. Quisque varius, felis a hendrerit faucibus, nunc lorem varius nibh, vel dignissim velit dolor ut elit. Mauris ut vulputate neque. Donec at est vitae massa egestas fringilla. Praesent a tristique nibh. Nunc blandit dui risus, quis rhoncus nisi consectetur vel.  ', 'Project Title 2', 'Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing.', '/portfolio/project-title-2', '2014-08-06 15:20:00', '2015-04-06 20:46:21', NULL, 0),
(163, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tempus nibh a laoreet cursus. Phasellus malesuada vulputate bibendum. Ut vitae justo nisi. Sed consectetur vestibulum tortor, in bibendum diam lacinia vitae. Nullam volutpat risus quis orci consectetur adipiscing. In commodo vulputate arcu sit amet ornare. Vivamus ut iaculis velit. Pellentesque euismod lacus sed accumsan luctus. Suspendisse urna felis, lacinia vel tempor id, ultricies rutrum nisl. Nunc ultrices nulla et bibendum molestie. Phasellus porttitor sit amet libero vel fermentum. Sed sapien risus, eleifend vel hendrerit eu, porta vel tellus. Duis faucibus odio et magna varius, quis accumsan tellus vestibulum. Nam nunc nulla, convallis at elementum pharetra, adipiscing quis enim. Donec feugiat porttitor dolor, nec porttitor mi auctor eget. Fusce iaculis varius diam non dictum. Fusce elementum a nunc vel tincidunt. Morbi nec est elementum, vehicula odio nec, lobortis lacus. Nulla ultricies vitae nunc ut lacinia. Proin mattis felis sem, eu consectetur arcu varius et. Duis at lectus eu lorem elementum aliquet nec in elit. Vestibulum non metus ac risus adipiscing pellentesque sed sit amet lorem. Donec viverra, metus in varius pulvinar, augue nunc accumsan eros, a pulvinar est elit vitae nulla.  Duis non leo in enim laoreet pretium. Nullam vitae neque nec libero pharetra tempor at faucibus lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed imperdiet convallis arcu. Nam sollicitudin sollicitudin lacus non dictum. Aliquam erat volutpat. Nulla sapien quam, consequat non dui ut, eleifend sodales orci. Praesent quis lorem accumsan, volutpat lectus a, sollicitudin erat. Donec faucibus mi in sapien volutpat, ac auctor lorem mollis. Proin eget turpis non lacus bibendum porta non ac justo. Aliquam aliquam viverra lorem ac rutrum. In et sapien sit amet diam vestibulum cursus ut tristique tellus.  Ut in purus mi. Etiam ac aliquet ipsum. Pellentesque faucibus diam dui. Morbi a semper orci. Ut nec malesuada urna. Vestibulum aliquet ante ac lacus dictum, sit amet pulvinar leo laoreet. Maecenas ut est commodo, commodo quam nec, dignissim est. Quisque rutrum molestie nunc, sed mollis nulla volutpat et. Donec dignissim ornare augue eu aliquam. Aliquam in tincidunt velit. In at fermentum mauris, ut accumsan nisl. Interdum et malesuada fames ac ante ipsum primis in faucibus.  Integer ac nulla at nisi sodales ullamcorper id in justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam pharetra elit odio, ac mattis turpis consequat ac. Pellentesque tincidunt sed enim nec auctor. Quisque varius, felis a hendrerit faucibus, nunc lorem varius nibh, vel dignissim velit dolor ut elit. Mauris ut vulputate neque. Donec at est vitae massa egestas fringilla. Praesent a tristique nibh. Nunc blandit dui risus, quis rhoncus nisi consectetur vel.  ', 'Project Title 3', 'Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing.', '/portfolio/project-title-3', '2014-08-06 15:10:00', '2015-04-06 20:46:22', NULL, 0),
(164, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tempus nibh a laoreet cursus. Phasellus malesuada vulputate bibendum. Ut vitae justo nisi. Sed consectetur vestibulum tortor, in bibendum diam lacinia vitae. Nullam volutpat risus quis orci consectetur adipiscing. In commodo vulputate arcu sit amet ornare. Vivamus ut iaculis velit. Pellentesque euismod lacus sed accumsan luctus. Suspendisse urna felis, lacinia vel tempor id, ultricies rutrum nisl. Nunc ultrices nulla et bibendum molestie. Phasellus porttitor sit amet libero vel fermentum. Sed sapien risus, eleifend vel hendrerit eu, porta vel tellus. Duis faucibus odio et magna varius, quis accumsan tellus vestibulum. Nam nunc nulla, convallis at elementum pharetra, adipiscing quis enim. Donec feugiat porttitor dolor, nec porttitor mi auctor eget. Fusce iaculis varius diam non dictum. Fusce elementum a nunc vel tincidunt. Morbi nec est elementum, vehicula odio nec, lobortis lacus. Nulla ultricies vitae nunc ut lacinia. Proin mattis felis sem, eu consectetur arcu varius et. Duis at lectus eu lorem elementum aliquet nec in elit. Vestibulum non metus ac risus adipiscing pellentesque sed sit amet lorem. Donec viverra, metus in varius pulvinar, augue nunc accumsan eros, a pulvinar est elit vitae nulla.  Duis non leo in enim laoreet pretium. Nullam vitae neque nec libero pharetra tempor at faucibus lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed imperdiet convallis arcu. Nam sollicitudin sollicitudin lacus non dictum. Aliquam erat volutpat. Nulla sapien quam, consequat non dui ut, eleifend sodales orci. Praesent quis lorem accumsan, volutpat lectus a, sollicitudin erat. Donec faucibus mi in sapien volutpat, ac auctor lorem mollis. Proin eget turpis non lacus bibendum porta non ac justo. Aliquam aliquam viverra lorem ac rutrum. In et sapien sit amet diam vestibulum cursus ut tristique tellus.  Ut in purus mi. Etiam ac aliquet ipsum. Pellentesque faucibus diam dui. Morbi a semper orci. Ut nec malesuada urna. Vestibulum aliquet ante ac lacus dictum, sit amet pulvinar leo laoreet. Maecenas ut est commodo, commodo quam nec, dignissim est. Quisque rutrum molestie nunc, sed mollis nulla volutpat et. Donec dignissim ornare augue eu aliquam. Aliquam in tincidunt velit. In at fermentum mauris, ut accumsan nisl. Interdum et malesuada fames ac ante ipsum primis in faucibus.  Integer ac nulla at nisi sodales ullamcorper id in justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam pharetra elit odio, ac mattis turpis consequat ac. Pellentesque tincidunt sed enim nec auctor. Quisque varius, felis a hendrerit faucibus, nunc lorem varius nibh, vel dignissim velit dolor ut elit. Mauris ut vulputate neque. Donec at est vitae massa egestas fringilla. Praesent a tristique nibh. Nunc blandit dui risus, quis rhoncus nisi consectetur vel.  ', 'Project Title 4', 'Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing.', '/portfolio/project-title-4', '2014-08-06 15:00:00', '2015-04-06 20:46:23', NULL, 0),
(165, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tempus nibh a laoreet cursus. Phasellus malesuada vulputate bibendum. Ut vitae justo nisi. Sed consectetur vestibulum tortor, in bibendum diam lacinia vitae. Nullam volutpat risus quis orci consectetur adipiscing. In commodo vulputate arcu sit amet ornare. Vivamus ut iaculis velit. Pellentesque euismod lacus sed accumsan luctus. Suspendisse urna felis, lacinia vel tempor id, ultricies rutrum nisl. Nunc ultrices nulla et bibendum molestie. Phasellus porttitor sit amet libero vel fermentum. Sed sapien risus, eleifend vel hendrerit eu, porta vel tellus. Duis faucibus odio et magna varius, quis accumsan tellus vestibulum. Nam nunc nulla, convallis at elementum pharetra, adipiscing quis enim. Donec feugiat porttitor dolor, nec porttitor mi auctor eget. Fusce iaculis varius diam non dictum. Fusce elementum a nunc vel tincidunt. Morbi nec est elementum, vehicula odio nec, lobortis lacus. Nulla ultricies vitae nunc ut lacinia. Proin mattis felis sem, eu consectetur arcu varius et. Duis at lectus eu lorem elementum aliquet nec in elit. Vestibulum non metus ac risus adipiscing pellentesque sed sit amet lorem. Donec viverra, metus in varius pulvinar, augue nunc accumsan eros, a pulvinar est elit vitae nulla.  Duis non leo in enim laoreet pretium. Nullam vitae neque nec libero pharetra tempor at faucibus lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed imperdiet convallis arcu. Nam sollicitudin sollicitudin lacus non dictum. Aliquam erat volutpat. Nulla sapien quam, consequat non dui ut, eleifend sodales orci. Praesent quis lorem accumsan, volutpat lectus a, sollicitudin erat. Donec faucibus mi in sapien volutpat, ac auctor lorem mollis. Proin eget turpis non lacus bibendum porta non ac justo. Aliquam aliquam viverra lorem ac rutrum. In et sapien sit amet diam vestibulum cursus ut tristique tellus.  Ut in purus mi. Etiam ac aliquet ipsum. Pellentesque faucibus diam dui. Morbi a semper orci. Ut nec malesuada urna. Vestibulum aliquet ante ac lacus dictum, sit amet pulvinar leo laoreet. Maecenas ut est commodo, commodo quam nec, dignissim est. Quisque rutrum molestie nunc, sed mollis nulla volutpat et. Donec dignissim ornare augue eu aliquam. Aliquam in tincidunt velit. In at fermentum mauris, ut accumsan nisl. Interdum et malesuada fames ac ante ipsum primis in faucibus.  Integer ac nulla at nisi sodales ullamcorper id in justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam pharetra elit odio, ac mattis turpis consequat ac. Pellentesque tincidunt sed enim nec auctor. Quisque varius, felis a hendrerit faucibus, nunc lorem varius nibh, vel dignissim velit dolor ut elit. Mauris ut vulputate neque. Donec at est vitae massa egestas fringilla. Praesent a tristique nibh. Nunc blandit dui risus, quis rhoncus nisi consectetur vel.  ', 'Project Title 5', 'Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing.', '/portfolio/project-title-5', '2014-08-06 14:30:00', '2015-04-06 20:46:23', NULL, 0),
(166, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tempus nibh a laoreet cursus. Phasellus malesuada vulputate bibendum. Ut vitae justo nisi. Sed consectetur vestibulum tortor, in bibendum diam lacinia vitae. Nullam volutpat risus quis orci consectetur adipiscing. In commodo vulputate arcu sit amet ornare. Vivamus ut iaculis velit. Pellentesque euismod lacus sed accumsan luctus. Suspendisse urna felis, lacinia vel tempor id, ultricies rutrum nisl. Nunc ultrices nulla et bibendum molestie. Phasellus porttitor sit amet libero vel fermentum. Sed sapien risus, eleifend vel hendrerit eu, porta vel tellus. Duis faucibus odio et magna varius, quis accumsan tellus vestibulum. Nam nunc nulla, convallis at elementum pharetra, adipiscing quis enim. Donec feugiat porttitor dolor, nec porttitor mi auctor eget. Fusce iaculis varius diam non dictum. Fusce elementum a nunc vel tincidunt. Morbi nec est elementum, vehicula odio nec, lobortis lacus. Nulla ultricies vitae nunc ut lacinia. Proin mattis felis sem, eu consectetur arcu varius et. Duis at lectus eu lorem elementum aliquet nec in elit. Vestibulum non metus ac risus adipiscing pellentesque sed sit amet lorem. Donec viverra, metus in varius pulvinar, augue nunc accumsan eros, a pulvinar est elit vitae nulla.  Duis non leo in enim laoreet pretium. Nullam vitae neque nec libero pharetra tempor at faucibus lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed imperdiet convallis arcu. Nam sollicitudin sollicitudin lacus non dictum. Aliquam erat volutpat. Nulla sapien quam, consequat non dui ut, eleifend sodales orci. Praesent quis lorem accumsan, volutpat lectus a, sollicitudin erat. Donec faucibus mi in sapien volutpat, ac auctor lorem mollis. Proin eget turpis non lacus bibendum porta non ac justo. Aliquam aliquam viverra lorem ac rutrum. In et sapien sit amet diam vestibulum cursus ut tristique tellus.  Ut in purus mi. Etiam ac aliquet ipsum. Pellentesque faucibus diam dui. Morbi a semper orci. Ut nec malesuada urna. Vestibulum aliquet ante ac lacus dictum, sit amet pulvinar leo laoreet. Maecenas ut est commodo, commodo quam nec, dignissim est. Quisque rutrum molestie nunc, sed mollis nulla volutpat et. Donec dignissim ornare augue eu aliquam. Aliquam in tincidunt velit. In at fermentum mauris, ut accumsan nisl. Interdum et malesuada fames ac ante ipsum primis in faucibus.  Integer ac nulla at nisi sodales ullamcorper id in justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam pharetra elit odio, ac mattis turpis consequat ac. Pellentesque tincidunt sed enim nec auctor. Quisque varius, felis a hendrerit faucibus, nunc lorem varius nibh, vel dignissim velit dolor ut elit. Mauris ut vulputate neque. Donec at est vitae massa egestas fringilla. Praesent a tristique nibh. Nunc blandit dui risus, quis rhoncus nisi consectetur vel.  ', 'Project Title 6', 'Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing.', '/portfolio/project-title-6', '2014-08-06 14:20:00', '2015-04-06 20:46:24', NULL, 0),
(154, 'John Smith\n\nCurabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Bob Smith\n\nCurabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. John Smith\n\nCurabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. John Smith\n\nCurabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Bob Smith\n\nCurabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Bob Smith\n\nCurabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Bob Smith\n\nCurabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Bob Smith\n\nCurabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis.                                                      Get in Touch  Sed cursus facilisis dignissim. Aliquam rhoncus enim et pellentesque varius. Nulla sodales nibh lorem, sit amet imperdiet arcu commodo sit amet.    Contact Us  ', 'Team', '', '/team', '2015-04-06 20:46:00', '2015-05-02 17:07:34', NULL, 0),
(156, '', 'Blog', '', '/blog', '2015-04-06 20:46:00', '2015-05-02 17:07:34', NULL, 0),
(168, 'Fusce volutpat sodales mauris quis dapibus. Maecenas convallis, libero eu ultrices interdum, leo mauris commodo diam, sed cursus sapien ligula nec leo. Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. Sed consequat eleifend metus, vitae malesuada eros elementum sed. Fusce risus felis, viverra et dignissim at, lobortis non est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet consectetur lacus. Vestibulum neque lectus, egestas non cursus vitae, aliquam at magna. Etiam aliquam, justo et varius eleifend, dui lectus egestas nunc, vel malesuada nisl purus nec metus. In gravida turpis a pharetra commodo. Donec non turpis vulputate, faucibus metus a, consectetur nunc. Morbi tortor nisi, hendrerit sed laoreet eget, fermentum et justo. Suspendisse potenti.   Heading 2 Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. Sed consequat eleifend metus, vitae malesuada eros elementum sed. Fusce risus felis, viverra et dignissim at, lobortis non est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet consectetur lacus. Vestibulum neque lectus, egestas non cursus vitae, aliquam at magna. Etiam aliquam, justo et varius eleifend, dui lectus egestas nunc, vel malesuada nisl purus nec metus. In gravida turpis a pharetra commodo. Donec non turpis vulputate, faucibus metus a, consectetur nunc. Morbi tortor nisi, hendrerit sed laoreet eget, fermentum et justo. Suspendisse potenti. Heading 3 Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. Quisque dignissim neque a ipsum sodales, mattis aliquam ante dictum. Vestibulum elementum pellentesque tortor ac congue. Mauris vel nibh id metus tincidunt eleifend. In interdum gravida ligula, at venenatis odio fermentum at. Donec dapibus enim lectus, quis venenatis tellus volutpat in. Nullam in velit tortor. Heading 3 Donec blandit lectus nec neque ullamcorper rhoncus. Sed adipiscing tempus sem eu molestie. Aenean laoreet pretium ante vitae ultrices. Aenean eu gravida magna, vel aliquet magna. In auctor convallis gravida. Phasellus est erat, adipiscing nec lobortis quis, eleifend at sem. Curabitur fringilla viverra dolor, in rutrum ipsum rutrum sit amet. Vestibulum feugiat porttitor ipsum vel condimentum. Suspendisse at tempus libero. Sed eu tempor enim. Etiam convallis eleifend rutrum. Donec porta diam quis tellus feugiat dignissim. Cras posuere, massa eget laoreet laoreet, urna libero lobortis dolor, sed consequat elit urna eget massa. Donec aliquet pellentesque consectetur.  ', 'Hello World!', 'Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. Quisque dignissim neque a ipsum sodales, mattis aliquam ante dictum.', '/blog/hello-world', '2014-07-01 12:00:00', '2015-04-06 20:46:28', NULL, 0),
(169, ' Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. Sed consequat eleifend metus, vitae malesuada eros elementum sed. Fusce risus felis, viverra et dignissim at, lobortis non est. Lorem ipsum dolor sit amet, consectetur adipiscing elit.   CMS To the Rescue!  Nullam sit amet consectetur lacus. Vestibulum neque lectus, egestas non cursus vitae, aliquam at magna. Etiam aliquam, justo et varius eleifend, dui lectus egestas nunc, vel malesuada nisl purus nec metus. In gravida turpis a pharetra commodo. Donec non turpis vulputate, faucibus metus a, consectetur nunc. Morbi tortor nisi, hendrerit sed laoreet eget, fermentum et justo. Suspendisse potenti.  Learn more at concrete5.org    ', 'Another Blog Post', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet consectetur lacus. Vestibulum neque lectus, egestas non cursus vitae, aliquam at magna.', '/blog/another-blog-post', '2014-07-04 15:00:00', '2015-04-06 20:46:28', NULL, 0),
(170, ' Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. Sed consequat eleifend metus, vitae malesuada eros elementum sed. Fusce risus felis, viverra et dignissim at, lobortis non est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet consectetur lacus. Vestibulum neque lectus, egestas non cursus vitae, aliquam at magna. Etiam aliquam, justo et varius eleifend, dui lectus egestas nunc, vel malesuada nisl purus nec metus. In gravida turpis a pharetra commodo. Donec non turpis vulputate, faucibus metus a, consectetur nunc. Morbi tortor nisi, hendrerit sed laoreet eget, fermentum et justo. Suspendisse potenti.  Heading 3  Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. Quisque dignissim neque a ipsum sodales, mattis aliquam ante dictum. Vestibulum elementum pellentesque tortor ac congue. Mauris vel nibh id metus tincidunt eleifend. In interdum gravida ligula, at venenatis odio fermentum at. Donec dapibus enim lectus, quis venenatis tellus volutpat in. Nullam in velit tortor.    Look at my beautiful image. Don''t you to look more?  Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. Quisque dignissim neque a ipsum sodales, mattis aliquam ante dictum. Vestibulum elementum pellentesque tortor ac congue. Mauris vel nibh id metus tincidunt eleifend. In interdum gravida ligula, at venenatis odio fermentum at. Donec dapibus enim lectus, quis venenatis tellus volutpat in. Nullam in velit tortor.  ', 'A Beautiful Site Deserves a Beautiful Blog', 'Donec blandit lectus nec neque ullamcorper rhoncus. Sed adipiscing tempus sem eu molestie. Aenean laoreet pretium ante vitae ultrices. Aenean eu gravida magna, vel aliquet magna. In auctor convallis gravida. Phasellus est erat.', '/blog/a-beautiful-blog', '2014-08-01 16:30:00', '2015-04-06 20:46:29', NULL, 0),
(157, '', 'Search', '', '/search', '2015-04-06 20:46:12', '2015-04-06 20:46:29', NULL, 0),
(158, '                                                     Headquarters 1234 SE Street View Suite 301 Portland, OR 98101 HOURS  M-F:  10 AM - 7 PM Sat: Noon - Midnight Sun: Closed                                                       Choosing Us Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. Quisque dignissim neque a ipsum sodales, mattis aliquam ante dictum. Vestibulum elementum pellentesque tortor ac congue. Mauris vel nibh id metus tincidunt eleifend. In interdum gravida ligula, at venenatis odio fermentum at. Donec dapibus enim lectus, quis venenatis tellus volutpat in. Nullam in velit tortor.  We would love to hear from you! ', 'Contact', '', '/contact', '2015-04-06 20:46:00', '2015-05-02 17:08:57', NULL, 0),
(159, ' This is my empty content block on my blank page.  ', 'Blank Page', '', '/blank-page', '2015-04-06 20:46:13', '2015-04-06 20:46:30', NULL, 0),
(171, '                                                     Fusce volutpat sodales mauris quis dapibus. Maecenas convallis, libero eu ultrices interdum.                                                       Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna.   Quisque dignissim neque a ipsum sodales, mattis aliquam ante dictum. Vestibulum elementum pellentesque tortor ac congue. Mauris vel nibh id metus tincidunt eleifend.                                                       Heading 1Heading 2Heading 3Heading 4Heading 5Heading 6                                                       Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. Sed consequat eleifend metus, vitae malesuada eros elementum sed. Fusce risus felis, viverra et dignissim at, lobortis non est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet consectetur lacus. Vestibulum neque lectus, egestas non cursus vitae, aliquam at magna. Etiam aliquam, justo et varius eleifend, dui lectus egestas nunc, vel malesuada nisl purus nec metus. In gravida turpis a pharetra commodo. Donec non turpis vulputate, faucibus metus a, consectetur nunc. Morbi tortor nisi, hendrerit sed laoreet eget, fermentum et justo. Suspendisse potenti.                                                             Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. Sed consequat eleifend metus, vitae malesuada eros elementum sed. Fusce risus felis, viverra et dignissim at, lobortis non est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet consectetur lacus. Vestibulum neque lectus, egestas non cursus vitae, aliquam at magna. Etiam aliquam, justo et varius eleifend, dui lectus egestas nunc, vel malesuada nisl purus nec metus. In gravida turpis a pharetra commodo. Donec non turpis vulputate, faucibus metus a, consectetur nunc. Morbi tortor nisi, hendrerit sed laoreet eget, fermentum et justo. Suspendisse potenti.                                                       Get in Touch  Sed cursus facilisis dignissim. Aliquam rhoncus enim et pellentesque varius. Nulla sodales nibh lorem, sit amet imperdiet arcu commodo sit amet.    Contact Us  ', 'About', '', '/team/about', '2015-04-06 20:46:13', '2015-04-06 20:46:31', NULL, 0),
(172, 'Work with Us   Welcome Home \n                                                    Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Great Workers \n                                                    Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Amazing Location \n                                                    Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Paid Time Off \n                                                    Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. No Meetings \n                                                    Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Free Drinks \n                                                    Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan.                                                      Open Positions  ', 'Careers', '', '/team/careers', '2015-04-06 20:46:13', '2015-04-06 20:46:33', NULL, 0);
INSERT INTO `PageSearchIndex` (`cID`, `content`, `cName`, `cDescription`, `cPath`, `cDatePublic`, `cDateLastIndexed`, `cDateLastSitemapped`, `cRequiresReindex`) VALUES
(175, '                                                       Back to Careers  Department Location Job Information                                                                                               Quisque accumsan leo sit amet neque pretium consectetur. Sed blandit nulla at justo volutpat rhoncus. Sed risus orci, luctus sit amet fringilla faucibus, congue nec dui. Phasellus mattis lobortis magna sed dapibus. Donec sagittis nunc sed accumsan eleifend. Ut porttitor sapien eu nisl volutpat, vitae interdum est mollis. Sed laoreet sit amet elit in eleifend. Sed a tincidunt velit, nec posuere urna. In eget metus non est varius viverra. Quisque accumsan odio sem, in consequat nunc lobortis ac.  Cras dignissim nulla ut euismod adipiscing. Mauris non eros sem. Cras at lacinia nulla. Maecenas nec magna arcu. Aenean iaculis, augue sed pretium semper, odio tellus volutpat risus, quis consectetur nibh mauris ut odio. Integer convallis, augue a accumsan condimentum, sem nisl congue lorem, consectetur lacinia neque tortor eu neque. Aenean convallis arcu vitae enim dignissim vestibulum. Phasellus tincidunt dolor id enim gravida ullamcorper. Nullam ut lorem auctor, congue quam non, auctor arcu. Morbi ac aliquam ipsum, at aliquet ligula.  Cras adipiscing tellus non nulla suscipit congue. Pellentesque id neque euismod, elementum augue vel, volutpat turpis. Pellentesque sit amet tortor non lorem hendrerit pellentesque ac in nisi. Sed aliquet tincidunt arcu, eu lacinia lorem fringilla id. Integer ut ornare orci. Donec scelerisque vulputate est a condimentum. Morbi tellus sapien, vehicula vel ipsum non, luctus ullamcorper mi. Phasellus felis tortor, egestas quis felis sit amet, malesuada auctor nibh. Sed mollis mi sit amet tristique scelerisque. Cras elementum mauris urna, ullamcorper consectetur orci vehicula ut.  ', 'Web Developer', 'Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. Sed consequat eleifend metus, vitae malesuada eros elementum sed. Fusce risus felis, viverra et dignissim at, lobortis non est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet consectetur lacus.', '/team/careers/web-developer', '2015-04-06 20:46:13', '2015-04-06 20:46:33', NULL, 0),
(176, '                                                       Back to Careers  Department Location Job Information                                                                                               Quisque accumsan leo sit amet neque pretium consectetur. Sed blandit nulla at justo volutpat rhoncus. Sed risus orci, luctus sit amet fringilla faucibus, congue nec dui. Phasellus mattis lobortis magna sed dapibus. Donec sagittis nunc sed accumsan eleifend. Ut porttitor sapien eu nisl volutpat, vitae interdum est mollis. Sed laoreet sit amet elit in eleifend. Sed a tincidunt velit, nec posuere urna. In eget metus non est varius viverra. Quisque accumsan odio sem, in consequat nunc lobortis ac.  Cras dignissim nulla ut euismod adipiscing. Mauris non eros sem. Cras at lacinia nulla. Maecenas nec magna arcu. Aenean iaculis, augue sed pretium semper, odio tellus volutpat risus, quis consectetur nibh mauris ut odio. Integer convallis, augue a accumsan condimentum, sem nisl congue lorem, consectetur lacinia neque tortor eu neque. Aenean convallis arcu vitae enim dignissim vestibulum. Phasellus tincidunt dolor id enim gravida ullamcorper. Nullam ut lorem auctor, congue quam non, auctor arcu. Morbi ac aliquam ipsum, at aliquet ligula.  Cras adipiscing tellus non nulla suscipit congue. Pellentesque id neque euismod, elementum augue vel, volutpat turpis. Pellentesque sit amet tortor non lorem hendrerit pellentesque ac in nisi. Sed aliquet tincidunt arcu, eu lacinia lorem fringilla id. Integer ut ornare orci. Donec scelerisque vulputate est a condimentum. Morbi tellus sapien, vehicula vel ipsum non, luctus ullamcorper mi. Phasellus felis tortor, egestas quis felis sit amet, malesuada auctor nibh. Sed mollis mi sit amet tristique scelerisque. Cras elementum mauris urna, ullamcorper consectetur orci vehicula ut.  ', 'Sales Associate', 'Curabitur sagittis elementum felis at sodales. Nullam fermentum at urna quis accumsan. Nam bibendum leo nisi, lacinia molestie arcu consequat quis. Morbi at suscipit risus. Sed consequat eleifend metus, vitae malesuada eros elementum sed. Fusce risus felis, viverra et dignissim at, lobortis non est. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet consectetur lacus.', '/team/careers/sales-associate', '2015-04-06 20:46:13', '2015-04-06 20:46:35', NULL, 0),
(173, 'What are page versions? What are page versions? \n                                    Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. How do I add more people as editors in my website? How do I add more people as editors in my website? \n                                    Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna. Pellentesque ultricies ligula vel neque dictum, eu mollis tortor adipiscing. Etiam congue, est vel tincidunt vestibulum, nunc nunc porta nulla, at adipiscing neque tellus quis urna.  ', 'Frequently Asked Questions', '', '/team/faq', '2015-04-06 20:46:13', '2015-04-06 20:46:35', NULL, 0),
(182, '', 'Wölf', 'Stufenseite der Wölfe', '/wolf', '2015-05-02 16:58:39', '2015-05-02 17:01:51', NULL, 0),
(183, '', 'Pfadi', '', '/pfadi', '2015-05-02 16:59:35', '2015-07-30 21:11:51', NULL, 0),
(184, '', 'Leiter', 'Leiter', '/leiter', '2015-05-02 16:59:52', '2015-05-02 17:01:51', NULL, 0),
(185, '', 'Bilder', '', '/bilder', '2015-05-02 17:00:15', '2015-05-02 17:01:51', NULL, 0),
(186, '', 'Agenda', '', '/agenda', '2015-05-02 17:00:35', '2015-08-20 22:29:47', NULL, 0),
(187, '', 'Links', '', '/links', '2015-05-02 17:00:48', '2015-05-11 21:39:40', NULL, 0),
(188, '', 'Elternrat', '', '/elternrat', '2015-05-02 17:01:07', '2015-05-02 17:01:51', NULL, 0),
(189, '', 'Abteilung', '', '/abteilung', '2015-05-02 17:01:25', '2015-05-02 17:01:51', NULL, 0),
(190, '', 'Admin', '', '/administration', '2015-05-02 17:01:00', '2015-08-05 23:11:38', NULL, 0),
(181, ' Das isch en Text uf de siite vo de biber   dws isch  en andere textkjasdhcavsd  ', 'Biber', 'Die Stufenseite der Biber', '/biber', '2015-05-02 16:56:44', '2015-05-04 22:04:41', NULL, 0),
(210, '', 'Wölf', '', '/stufen/wolf', '2015-08-05 22:59:19', '2015-08-20 20:36:10', NULL, 0),
(209, '', 'Biber', '', '/stufen/biber', '2015-08-05 22:59:04', '2015-08-20 20:03:41', NULL, 0),
(208, '', 'Stufen', '', '/stufen', '2015-08-05 22:56:30', '2015-08-20 22:22:59', NULL, 0),
(199, '', 'Product Detail', NULL, '/product-detail', '2015-05-11 21:34:39', '2015-05-11 21:34:39', NULL, 0),
(147, '', 'Header Navigation', NULL, '/!stacks/header-navigation', '2015-04-06 20:46:09', '2015-08-12 19:28:58', NULL, 0),
(149, ' Gryfenberg  ', 'Header Site Title', NULL, '/!stacks/header-site-title', '2015-04-06 20:46:09', '2015-08-20 22:22:57', NULL, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PageStatistics`
--

DROP TABLE IF EXISTS `PageStatistics`;
CREATE TABLE `PageStatistics` (
  `pstID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pstID`),
  KEY `cID` (`cID`),
  KEY `date` (`date`),
  KEY `uID` (`uID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PageTemplates`
--

DROP TABLE IF EXISTS `PageTemplates`;
CREATE TABLE `PageTemplates` (
  `pTemplateID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pTemplateHandle` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `pTemplateIcon` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pTemplateName` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `pTemplateIsInternal` tinyint(1) NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pTemplateID`),
  UNIQUE KEY `pTemplateHandle` (`pTemplateHandle`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Daten für Tabelle `PageTemplates`
--

INSERT INTO `PageTemplates` (`pTemplateID`, `pTemplateHandle`, `pTemplateIcon`, `pTemplateName`, `pTemplateIsInternal`, `pkgID`) VALUES
(1, 'core_stack', '', 'Stack', 1, 0),
(2, 'dashboard_primary_five', '', 'Dashboard Primary + Five', 1, 0),
(3, 'dashboard_header_four_col', '', 'Dashboard Header + Four Column', 1, 0),
(4, 'dashboard_full', '', 'Dashboard Full', 1, 0),
(5, 'blank', 'blank.png', 'Blank', 0, 0),
(6, 'full', 'full.png', 'Full', 0, 0),
(7, 'left_sidebar', 'left_sidebar.png', 'Left Sidebar', 0, 0),
(8, 'right_sidebar', 'right_sidebar.png', 'Right Sidebar', 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PageThemeCustomStyles`
--

DROP TABLE IF EXISTS `PageThemeCustomStyles`;
CREATE TABLE `PageThemeCustomStyles` (
  `pThemeID` int(10) unsigned NOT NULL DEFAULT '0',
  `scvlID` int(10) unsigned DEFAULT '0',
  `preset` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sccRecordID` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`pThemeID`),
  KEY `scvlID` (`scvlID`),
  KEY `sccRecordID` (`sccRecordID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PageThemes`
--

DROP TABLE IF EXISTS `PageThemes`;
CREATE TABLE `PageThemes` (
  `pThemeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pThemeHandle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `pThemeName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pThemeDescription` text COLLATE utf8_unicode_ci,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  `pThemeHasCustomClass` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pThemeID`),
  UNIQUE KEY `ptHandle` (`pThemeHandle`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `PageThemes`
--

INSERT INTO `PageThemes` (`pThemeID`, `pThemeHandle`, `pThemeName`, `pThemeDescription`, `pkgID`, `pThemeHasCustomClass`) VALUES
(1, 'elemental', 'Elemental', 'Elegant, spacious theme with support for blogs, portfolios, layouts and more.', 0, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PageTypeComposerControlTypes`
--

DROP TABLE IF EXISTS `PageTypeComposerControlTypes`;
CREATE TABLE `PageTypeComposerControlTypes` (
  `ptComposerControlTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ptComposerControlTypeHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ptComposerControlTypeName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ptComposerControlTypeID`),
  UNIQUE KEY `ptComposerControlTypeHandle` (`ptComposerControlTypeHandle`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `PageTypeComposerControlTypes`
--

INSERT INTO `PageTypeComposerControlTypes` (`ptComposerControlTypeID`, `ptComposerControlTypeHandle`, `ptComposerControlTypeName`, `pkgID`) VALUES
(1, 'core_page_property', 'Built-In Properties', 0),
(2, 'collection_attribute', 'Custom Attributes', 0),
(3, 'block', 'Block', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PageTypeComposerFormLayoutSetControls`
--

DROP TABLE IF EXISTS `PageTypeComposerFormLayoutSetControls`;
CREATE TABLE `PageTypeComposerFormLayoutSetControls` (
  `ptComposerFormLayoutSetControlID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ptComposerFormLayoutSetID` int(10) unsigned DEFAULT '0',
  `ptComposerControlTypeID` int(10) unsigned DEFAULT '0',
  `ptComposerControlObject` longtext COLLATE utf8_unicode_ci,
  `ptComposerFormLayoutSetControlDisplayOrder` int(10) unsigned DEFAULT '0',
  `ptComposerFormLayoutSetControlCustomLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ptComposerFormLayoutSetControlCustomTemplate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ptComposerFormLayoutSetControlDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ptComposerFormLayoutSetControlRequired` int(11) DEFAULT '0',
  PRIMARY KEY (`ptComposerFormLayoutSetControlID`),
  KEY `ptComposerControlTypeID` (`ptComposerControlTypeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=34 ;

--
-- Daten für Tabelle `PageTypeComposerFormLayoutSetControls`
--

INSERT INTO `PageTypeComposerFormLayoutSetControls` (`ptComposerFormLayoutSetControlID`, `ptComposerFormLayoutSetID`, `ptComposerControlTypeID`, `ptComposerControlObject`, `ptComposerFormLayoutSetControlDisplayOrder`, `ptComposerFormLayoutSetControlCustomLabel`, `ptComposerFormLayoutSetControlCustomTemplate`, `ptComposerFormLayoutSetControlDescription`, `ptComposerFormLayoutSetControlRequired`) VALUES
(1, 1, 1, 'O:78:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\NameCorePageProperty":9:{s:37:"\0*\0ptComposerControlRequiredByDefault";b:1;s:17:"\0*\0propertyHandle";s:4:"name";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:4:"name";s:24:"\0*\0ptComposerControlName";s:9:"Page Name";s:27:"\0*\0ptComposerControlIconSRC";s:63:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/text/icon.png";s:20:"\0*\0ptComposerControl";N;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 0, 'Page Name', NULL, NULL, 1),
(2, 1, 1, 'O:85:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\DescriptionCorePageProperty":9:{s:17:"\0*\0propertyHandle";s:11:"description";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:11:"description";s:24:"\0*\0ptComposerControlName";s:11:"Description";s:27:"\0*\0ptComposerControlIconSRC";s:67:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/textarea/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 1, NULL, NULL, NULL, 0),
(3, 1, 1, 'O:81:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\UrlSlugCorePageProperty":9:{s:17:"\0*\0propertyHandle";s:8:"url_slug";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:8:"url_slug";s:24:"\0*\0ptComposerControlName";s:8:"URL Slug";s:27:"\0*\0ptComposerControlIconSRC";s:63:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/text/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 2, NULL, NULL, NULL, 0),
(4, 1, 1, 'O:86:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\PageTemplateCorePageProperty":9:{s:17:"\0*\0propertyHandle";s:13:"page_template";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:13:"page_template";s:24:"\0*\0ptComposerControlName";s:13:"Page Template";s:27:"\0*\0ptComposerControlIconSRC";s:65:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/select/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 3, NULL, NULL, NULL, 0),
(5, 1, 1, 'O:87:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\PublishTargetCorePageProperty":9:{s:17:"\0*\0propertyHandle";s:14:"publish_target";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:14:"publish_target";s:24:"\0*\0ptComposerControlName";s:13:"Page Location";s:27:"\0*\0ptComposerControlIconSRC";s:69:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/image_file/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 4, NULL, NULL, NULL, 0),
(6, 2, 1, 'O:78:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\NameCorePageProperty":9:{s:37:"\0*\0ptComposerControlRequiredByDefault";b:1;s:17:"\0*\0propertyHandle";s:4:"name";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:4:"name";s:24:"\0*\0ptComposerControlName";s:9:"Page Name";s:27:"\0*\0ptComposerControlIconSRC";s:63:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/text/icon.png";s:20:"\0*\0ptComposerControl";N;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 0, 'Entry Name', NULL, NULL, 0),
(7, 2, 1, 'O:81:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\UrlSlugCorePageProperty":9:{s:17:"\0*\0propertyHandle";s:8:"url_slug";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:8:"url_slug";s:24:"\0*\0ptComposerControlName";s:8:"URL Slug";s:27:"\0*\0ptComposerControlIconSRC";s:63:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/text/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 1, NULL, NULL, NULL, 0),
(8, 2, 1, 'O:85:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\DescriptionCorePageProperty":9:{s:17:"\0*\0propertyHandle";s:11:"description";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:11:"description";s:24:"\0*\0ptComposerControlName";s:11:"Description";s:27:"\0*\0ptComposerControlIconSRC";s:67:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/textarea/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 2, 'Short Description', NULL, NULL, 0),
(9, 2, 1, 'O:87:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\PublishTargetCorePageProperty":9:{s:17:"\0*\0propertyHandle";s:14:"publish_target";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:14:"publish_target";s:24:"\0*\0ptComposerControlName";s:13:"Page Location";s:27:"\0*\0ptComposerControlIconSRC";s:69:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/image_file/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 3, NULL, NULL, NULL, 0),
(10, 2, 2, 'O:67:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CollectionAttributeControl":10:{s:7:"\0*\0akID";s:2:"22";s:5:"\0*\0ak";b:0;s:30:"\0*\0ptComposerControlTypeHandle";s:20:"collection_attribute";s:30:"\0*\0ptComposerControlIdentifier";s:2:"22";s:24:"\0*\0ptComposerControlName";s:17:"Blog Entry Topics";s:27:"\0*\0ptComposerControlIconSRC";s:65:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/topics/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 4, 'Topics', NULL, NULL, 0),
(11, 3, 2, 'O:67:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CollectionAttributeControl":10:{s:7:"\0*\0akID";s:2:"21";s:5:"\0*\0ak";b:0;s:30:"\0*\0ptComposerControlTypeHandle";s:20:"collection_attribute";s:30:"\0*\0ptComposerControlIdentifier";s:2:"21";s:24:"\0*\0ptComposerControlName";s:9:"Thumbnail";s:27:"\0*\0ptComposerControlIconSRC";s:69:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/image_file/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 0, NULL, NULL, NULL, 0),
(12, 3, 3, 'O:53:"Concrete\\Core\\Page\\Type\\Composer\\Control\\BlockControl":11:{s:7:"\0*\0btID";i:12;s:30:"\0*\0ptComposerControlTypeHandle";s:5:"block";s:5:"\0*\0bt";b:0;s:4:"\0*\0b";b:0;s:30:"\0*\0ptComposerControlIdentifier";i:12;s:24:"\0*\0ptComposerControlName";s:7:"Content";s:27:"\0*\0ptComposerControlIconSRC";s:62:"/newGryfiPage/concrete5.7.3.1/concrete/blocks/content/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 1, NULL, NULL, NULL, 0),
(13, 4, 1, 'O:78:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\NameCorePageProperty":9:{s:37:"\0*\0ptComposerControlRequiredByDefault";b:1;s:17:"\0*\0propertyHandle";s:4:"name";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:4:"name";s:24:"\0*\0ptComposerControlName";s:9:"Page Name";s:27:"\0*\0ptComposerControlIconSRC";s:63:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/text/icon.png";s:20:"\0*\0ptComposerControl";N;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 0, 'Job Name', NULL, NULL, 1),
(14, 4, 1, 'O:82:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\DateTimeCorePageProperty":9:{s:17:"\0*\0propertyHandle";s:9:"date_time";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:9:"date_time";s:24:"\0*\0ptComposerControlName";s:16:"Public Date/Time";s:27:"\0*\0ptComposerControlIconSRC";s:68:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/date_time/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 1, 'Posting Date', NULL, NULL, 0),
(15, 5, 2, 'O:67:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CollectionAttributeControl":10:{s:7:"\0*\0akID";s:2:"19";s:5:"\0*\0ak";b:0;s:30:"\0*\0ptComposerControlTypeHandle";s:20:"collection_attribute";s:30:"\0*\0ptComposerControlIdentifier";s:2:"19";s:24:"\0*\0ptComposerControlName";s:8:"Location";s:27:"\0*\0ptComposerControlIconSRC";s:67:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/textarea/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 0, NULL, NULL, NULL, 0),
(16, 5, 2, 'O:67:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CollectionAttributeControl":10:{s:7:"\0*\0akID";s:2:"18";s:5:"\0*\0ak";b:0;s:30:"\0*\0ptComposerControlTypeHandle";s:20:"collection_attribute";s:30:"\0*\0ptComposerControlIdentifier";s:2:"18";s:24:"\0*\0ptComposerControlName";s:10:"Department";s:27:"\0*\0ptComposerControlIconSRC";s:65:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/select/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 1, NULL, NULL, NULL, 0),
(17, 5, 1, 'O:85:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\DescriptionCorePageProperty":9:{s:17:"\0*\0propertyHandle";s:11:"description";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:11:"description";s:24:"\0*\0ptComposerControlName";s:11:"Description";s:27:"\0*\0ptComposerControlIconSRC";s:67:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/textarea/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 2, 'Brief Description', NULL, NULL, 0),
(18, 5, 3, 'O:53:"Concrete\\Core\\Page\\Type\\Composer\\Control\\BlockControl":11:{s:7:"\0*\0btID";i:12;s:30:"\0*\0ptComposerControlTypeHandle";s:5:"block";s:5:"\0*\0bt";b:0;s:4:"\0*\0b";b:0;s:30:"\0*\0ptComposerControlIdentifier";i:12;s:24:"\0*\0ptComposerControlName";s:7:"Content";s:27:"\0*\0ptComposerControlIconSRC";s:62:"/newGryfiPage/concrete5.7.3.1/concrete/blocks/content/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 3, 'Job Details', NULL, NULL, 0),
(19, 6, 1, 'O:78:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\NameCorePageProperty":9:{s:37:"\0*\0ptComposerControlRequiredByDefault";b:1;s:17:"\0*\0propertyHandle";s:4:"name";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:4:"name";s:24:"\0*\0ptComposerControlName";s:9:"Page Name";s:27:"\0*\0ptComposerControlIconSRC";s:63:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/text/icon.png";s:20:"\0*\0ptComposerControl";N;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 0, NULL, NULL, 'Give your portfolio project a name.', 0),
(20, 6, 1, 'O:81:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\UrlSlugCorePageProperty":9:{s:17:"\0*\0propertyHandle";s:8:"url_slug";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:8:"url_slug";s:24:"\0*\0ptComposerControlName";s:8:"URL Slug";s:27:"\0*\0ptComposerControlIconSRC";s:63:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/text/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 1, NULL, NULL, NULL, 0),
(21, 6, 1, 'O:87:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\PublishTargetCorePageProperty":9:{s:17:"\0*\0propertyHandle";s:14:"publish_target";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:14:"publish_target";s:24:"\0*\0ptComposerControlName";s:13:"Page Location";s:27:"\0*\0ptComposerControlIconSRC";s:69:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/image_file/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 2, NULL, NULL, NULL, 0),
(22, 7, 2, 'O:67:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CollectionAttributeControl":10:{s:7:"\0*\0akID";s:2:"23";s:5:"\0*\0ak";b:0;s:30:"\0*\0ptComposerControlTypeHandle";s:20:"collection_attribute";s:30:"\0*\0ptComposerControlIdentifier";s:2:"23";s:24:"\0*\0ptComposerControlName";s:14:"Project Topics";s:27:"\0*\0ptComposerControlIconSRC";s:65:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/topics/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 0, NULL, NULL, NULL, 0),
(23, 7, 1, 'O:82:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\DateTimeCorePageProperty":9:{s:17:"\0*\0propertyHandle";s:9:"date_time";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:9:"date_time";s:24:"\0*\0ptComposerControlName";s:16:"Public Date/Time";s:27:"\0*\0ptComposerControlIconSRC";s:68:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/date_time/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 1, 'Date Completed', NULL, NULL, 0),
(24, 7, 2, 'O:67:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CollectionAttributeControl":10:{s:7:"\0*\0akID";s:2:"24";s:5:"\0*\0ak";b:0;s:30:"\0*\0ptComposerControlTypeHandle";s:20:"collection_attribute";s:30:"\0*\0ptComposerControlIdentifier";s:2:"24";s:24:"\0*\0ptComposerControlName";s:6:"Client";s:27:"\0*\0ptComposerControlIconSRC";s:63:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/text/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 2, NULL, NULL, NULL, 0),
(25, 7, 2, 'O:67:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CollectionAttributeControl":10:{s:7:"\0*\0akID";s:2:"25";s:5:"\0*\0ak";b:0;s:30:"\0*\0ptComposerControlTypeHandle";s:20:"collection_attribute";s:30:"\0*\0ptComposerControlIdentifier";s:2:"25";s:24:"\0*\0ptComposerControlName";s:4:"Task";s:27:"\0*\0ptComposerControlIconSRC";s:65:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/select/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 3, NULL, NULL, NULL, 0),
(26, 7, 2, 'O:67:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CollectionAttributeControl":10:{s:7:"\0*\0akID";s:2:"26";s:5:"\0*\0ak";b:0;s:30:"\0*\0ptComposerControlTypeHandle";s:20:"collection_attribute";s:30:"\0*\0ptComposerControlIdentifier";s:2:"26";s:24:"\0*\0ptComposerControlName";s:6:"Skills";s:27:"\0*\0ptComposerControlIconSRC";s:65:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/select/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 4, NULL, NULL, NULL, 0),
(27, 7, 2, 'O:67:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CollectionAttributeControl":10:{s:7:"\0*\0akID";s:2:"21";s:5:"\0*\0ak";b:0;s:30:"\0*\0ptComposerControlTypeHandle";s:20:"collection_attribute";s:30:"\0*\0ptComposerControlIdentifier";s:2:"21";s:24:"\0*\0ptComposerControlName";s:9:"Thumbnail";s:27:"\0*\0ptComposerControlIconSRC";s:69:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/image_file/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 5, NULL, NULL, NULL, 0),
(28, 8, 3, 'O:53:"Concrete\\Core\\Page\\Type\\Composer\\Control\\BlockControl":11:{s:7:"\0*\0btID";i:33;s:30:"\0*\0ptComposerControlTypeHandle";s:5:"block";s:5:"\0*\0bt";b:0;s:4:"\0*\0b";b:0;s:30:"\0*\0ptComposerControlIdentifier";i:33;s:24:"\0*\0ptComposerControlName";s:12:"Image Slider";s:27:"\0*\0ptComposerControlIconSRC";s:67:"/newGryfiPage/concrete5.7.3.1/concrete/blocks/image_slider/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 0, NULL, NULL, NULL, 0),
(29, 9, 3, 'O:53:"Concrete\\Core\\Page\\Type\\Composer\\Control\\BlockControl":11:{s:7:"\0*\0btID";i:12;s:30:"\0*\0ptComposerControlTypeHandle";s:5:"block";s:5:"\0*\0bt";b:0;s:4:"\0*\0b";b:0;s:30:"\0*\0ptComposerControlIdentifier";i:12;s:24:"\0*\0ptComposerControlName";s:7:"Content";s:27:"\0*\0ptComposerControlIconSRC";s:62:"/newGryfiPage/concrete5.7.3.1/concrete/blocks/content/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 0, NULL, NULL, NULL, 0),
(30, 10, 1, 'O:78:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\NameCorePageProperty":9:{s:37:"\0*\0ptComposerControlRequiredByDefault";b:1;s:17:"\0*\0propertyHandle";s:4:"name";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:4:"name";s:24:"\0*\0ptComposerControlName";s:9:"Page Name";s:27:"\0*\0ptComposerControlIconSRC";s:63:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/text/icon.png";s:20:"\0*\0ptComposerControl";N;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 0, NULL, NULL, NULL, 0),
(31, 10, 1, 'O:87:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\PublishTargetCorePageProperty":9:{s:17:"\0*\0propertyHandle";s:14:"publish_target";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:14:"publish_target";s:24:"\0*\0ptComposerControlName";s:13:"Page Location";s:27:"\0*\0ptComposerControlIconSRC";s:69:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/image_file/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 1, NULL, NULL, NULL, 0),
(32, 11, 1, 'O:78:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\NameCorePageProperty":9:{s:37:"\0*\0ptComposerControlRequiredByDefault";b:1;s:17:"\0*\0propertyHandle";s:4:"name";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:4:"name";s:24:"\0*\0ptComposerControlName";s:9:"Page Name";s:27:"\0*\0ptComposerControlIconSRC";s:63:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/text/icon.png";s:20:"\0*\0ptComposerControl";N;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 0, 'Name', NULL, NULL, 0),
(33, 11, 1, 'O:87:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\PublishTargetCorePageProperty":9:{s:17:"\0*\0propertyHandle";s:14:"publish_target";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:14:"publish_target";s:24:"\0*\0ptComposerControlName";s:13:"Page Location";s:27:"\0*\0ptComposerControlIconSRC";s:69:"/newGryfiPage/concrete5.7.3.1/concrete/attributes/image_file/icon.png";s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:5:"error";s:0:"";}', 1, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PageTypeComposerFormLayoutSets`
--

DROP TABLE IF EXISTS `PageTypeComposerFormLayoutSets`;
CREATE TABLE `PageTypeComposerFormLayoutSets` (
  `ptComposerFormLayoutSetID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ptID` int(10) unsigned DEFAULT '0',
  `ptComposerFormLayoutSetName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ptComposerFormLayoutSetDescription` text COLLATE utf8_unicode_ci,
  `ptComposerFormLayoutSetDisplayOrder` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`ptComposerFormLayoutSetID`),
  KEY `ptID` (`ptID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Daten für Tabelle `PageTypeComposerFormLayoutSets`
--

INSERT INTO `PageTypeComposerFormLayoutSets` (`ptComposerFormLayoutSetID`, `ptID`, `ptComposerFormLayoutSetName`, `ptComposerFormLayoutSetDescription`, `ptComposerFormLayoutSetDisplayOrder`) VALUES
(1, 5, 'Basics', '', 0),
(2, 6, 'Post Details', '', 0),
(3, 6, 'Content', '', 1),
(4, 7, 'Basics', '', 0),
(5, 7, 'About This Job', '', 1),
(6, 8, 'Page', '', 0),
(7, 8, 'Project Data', '', 1),
(8, 8, 'Image Slider', '', 2),
(9, 8, 'Body', '', 3),
(10, 9, 'Details', '', 0),
(11, 10, '', '', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PageTypeComposerOutputBlocks`
--

DROP TABLE IF EXISTS `PageTypeComposerOutputBlocks`;
CREATE TABLE `PageTypeComposerOutputBlocks` (
  `ptComposerOutputBlockID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cbDisplayOrder` int(10) unsigned DEFAULT '0',
  `ptComposerFormLayoutSetControlID` int(10) unsigned NOT NULL DEFAULT '0',
  `bID` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`ptComposerOutputBlockID`),
  KEY `cID` (`cID`),
  KEY `bID` (`bID`,`cID`),
  KEY `ptComposerFormLayoutSetControlID` (`ptComposerFormLayoutSetControlID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `PageTypeComposerOutputBlocks`
--

INSERT INTO `PageTypeComposerOutputBlocks` (`ptComposerOutputBlockID`, `cID`, `arHandle`, `cbDisplayOrder`, `ptComposerFormLayoutSetControlID`, `bID`) VALUES
(3, 206, 'Main', 8, 18, 183);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PageTypeComposerOutputControls`
--

DROP TABLE IF EXISTS `PageTypeComposerOutputControls`;
CREATE TABLE `PageTypeComposerOutputControls` (
  `ptComposerOutputControlID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pTemplateID` int(10) unsigned DEFAULT '0',
  `ptID` int(10) unsigned DEFAULT '0',
  `ptComposerFormLayoutSetControlID` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`ptComposerOutputControlID`),
  KEY `pTemplateID` (`pTemplateID`,`ptComposerFormLayoutSetControlID`),
  KEY `ptID` (`ptID`),
  KEY `ptComposerFormLayoutSetControlID` (`ptComposerFormLayoutSetControlID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Daten für Tabelle `PageTypeComposerOutputControls`
--

INSERT INTO `PageTypeComposerOutputControls` (`ptComposerOutputControlID`, `pTemplateID`, `ptID`, `ptComposerFormLayoutSetControlID`) VALUES
(1, 8, 6, 12),
(2, 7, 7, 18),
(3, 7, 8, 28),
(4, 7, 8, 29);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PageTypePageTemplateDefaultPages`
--

DROP TABLE IF EXISTS `PageTypePageTemplateDefaultPages`;
CREATE TABLE `PageTypePageTemplateDefaultPages` (
  `pTemplateID` int(10) unsigned NOT NULL DEFAULT '0',
  `ptID` int(10) unsigned NOT NULL DEFAULT '0',
  `cID` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`pTemplateID`,`ptID`),
  KEY `ptID` (`ptID`),
  KEY `cID` (`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `PageTypePageTemplateDefaultPages`
--

INSERT INTO `PageTypePageTemplateDefaultPages` (`pTemplateID`, `ptID`, `cID`) VALUES
(6, 5, 150),
(6, 10, 152),
(6, 9, 155),
(7, 8, 160),
(8, 6, 167),
(7, 7, 174),
(5, 5, 177),
(7, 5, 178),
(8, 5, 179),
(6, 11, 207);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PageTypePageTemplates`
--

DROP TABLE IF EXISTS `PageTypePageTemplates`;
CREATE TABLE `PageTypePageTemplates` (
  `ptID` int(10) unsigned NOT NULL DEFAULT '0',
  `pTemplateID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ptID`,`pTemplateID`),
  KEY `pTemplateID` (`pTemplateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `PageTypePageTemplates`
--

INSERT INTO `PageTypePageTemplates` (`ptID`, `pTemplateID`) VALUES
(6, 8),
(7, 7),
(8, 7),
(9, 6),
(10, 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PageTypePermissionAssignments`
--

DROP TABLE IF EXISTS `PageTypePermissionAssignments`;
CREATE TABLE `PageTypePermissionAssignments` (
  `ptID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ptID`,`pkID`,`paID`),
  KEY `pkID` (`pkID`),
  KEY `ptID` (`ptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `PageTypePermissionAssignments`
--

INSERT INTO `PageTypePermissionAssignments` (`ptID`, `pkID`, `paID`) VALUES
(1, 59, 9),
(1, 60, 9),
(1, 61, 9),
(1, 62, 9),
(1, 63, 25),
(2, 59, 9),
(2, 60, 9),
(2, 61, 9),
(2, 62, 9),
(2, 63, 26),
(3, 59, 9),
(3, 60, 9),
(3, 61, 9),
(3, 62, 9),
(3, 63, 27),
(4, 59, 9),
(4, 60, 9),
(4, 61, 9),
(4, 62, 9),
(4, 63, 28),
(5, 59, 9),
(5, 60, 9),
(5, 61, 9),
(5, 62, 9),
(5, 63, 31),
(6, 59, 9),
(6, 60, 9),
(6, 61, 9),
(6, 62, 9),
(6, 63, 32),
(7, 59, 9),
(7, 60, 9),
(7, 61, 9),
(7, 62, 9),
(7, 63, 33),
(8, 59, 9),
(8, 60, 9),
(8, 61, 9),
(8, 62, 9),
(8, 63, 34),
(9, 59, 9),
(9, 60, 9),
(9, 61, 9),
(9, 62, 9),
(9, 63, 35),
(10, 59, 9),
(10, 60, 9),
(10, 61, 9),
(10, 62, 9),
(10, 63, 36),
(11, 59, 9),
(11, 60, 9),
(11, 61, 9),
(11, 62, 9),
(11, 63, 80);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PageTypePublishTargetTypes`
--

DROP TABLE IF EXISTS `PageTypePublishTargetTypes`;
CREATE TABLE `PageTypePublishTargetTypes` (
  `ptPublishTargetTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ptPublishTargetTypeHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ptPublishTargetTypeName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ptPublishTargetTypeID`),
  KEY `ptPublishTargetTypeHandle` (`ptPublishTargetTypeHandle`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `PageTypePublishTargetTypes`
--

INSERT INTO `PageTypePublishTargetTypes` (`ptPublishTargetTypeID`, `ptPublishTargetTypeHandle`, `ptPublishTargetTypeName`, `pkgID`) VALUES
(1, 'parent_page', 'Always publish below a certain page', 0),
(2, 'page_type', 'Choose from pages of a certain type', 0),
(3, 'all', 'Choose from all pages when publishing', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PageTypes`
--

DROP TABLE IF EXISTS `PageTypes`;
CREATE TABLE `PageTypes` (
  `ptID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ptName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ptHandle` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ptPublishTargetTypeID` int(10) unsigned DEFAULT NULL,
  `ptDefaultPageTemplateID` int(10) unsigned DEFAULT NULL,
  `ptAllowedPageTemplates` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'A',
  `ptIsInternal` tinyint(1) NOT NULL DEFAULT '0',
  `ptIsFrequentlyAdded` tinyint(1) NOT NULL DEFAULT '1',
  `ptDisplayOrder` int(10) unsigned DEFAULT NULL,
  `ptLaunchInComposer` tinyint(1) NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  `ptPublishTargetObject` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ptID`),
  UNIQUE KEY `ptHandle` (`ptHandle`),
  KEY `pkgID` (`pkgID`,`ptID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Daten für Tabelle `PageTypes`
--

INSERT INTO `PageTypes` (`ptID`, `ptName`, `ptHandle`, `ptPublishTargetTypeID`, `ptDefaultPageTemplateID`, `ptAllowedPageTemplates`, `ptIsInternal`, `ptIsFrequentlyAdded`, `ptDisplayOrder`, `ptLaunchInComposer`, `pkgID`, `ptPublishTargetObject`) VALUES
(1, 'Stack', 'core_stack', NULL, 0, 'A', 1, 0, 0, 0, 0, NULL),
(2, 'Dashboard Primary + Five', 'dashboard_primary_five', NULL, 0, 'A', 1, 0, 1, 0, 0, NULL),
(3, 'Dashboard Header + Four Column', 'dashboard_header_four_col', NULL, 0, 'A', 1, 0, 2, 0, 0, NULL),
(4, 'Dashboard Full', 'dashboard_full', NULL, 0, 'A', 1, 0, 3, 0, 0, NULL),
(5, 'Empty Page', 'page', 3, 6, 'A', 0, 1, 0, 0, 0, 'O:68:"Concrete\\Core\\Page\\Type\\PublishTarget\\Configuration\\AllConfiguration":4:{s:5:"error";s:0:"";s:21:"ptPublishTargetTypeID";s:1:"3";s:25:"ptPublishTargetTypeHandle";s:3:"all";s:9:"pkgHandle";b:0;}'),
(6, 'Blog Entry', 'blog_entry', 2, 8, 'C', 0, 1, 1, 1, 0, 'O:73:"Concrete\\Core\\Page\\Type\\PublishTarget\\Configuration\\PageTypeConfiguration":5:{s:7:"\0*\0ptID";s:1:"9";s:5:"error";s:0:"";s:21:"ptPublishTargetTypeID";s:1:"2";s:25:"ptPublishTargetTypeHandle";s:9:"page_type";s:9:"pkgHandle";b:0;}'),
(7, 'Job Posting', 'job_posting', 1, 7, 'C', 0, 1, 2, 1, 0, 'O:75:"Concrete\\Core\\Page\\Type\\PublishTarget\\Configuration\\ParentPageConfiguration":5:{s:12:"\0*\0cParentID";s:3:"172";s:5:"error";s:0:"";s:21:"ptPublishTargetTypeID";s:1:"1";s:25:"ptPublishTargetTypeHandle";s:11:"parent_page";s:9:"pkgHandle";b:0;}'),
(8, 'Portfolio Project', 'portfolio_project', 2, 7, 'C', 0, 1, 3, 1, 0, 'O:73:"Concrete\\Core\\Page\\Type\\PublishTarget\\Configuration\\PageTypeConfiguration":5:{s:7:"\0*\0ptID";s:2:"10";s:5:"error";s:0:"";s:21:"ptPublishTargetTypeID";s:1:"2";s:25:"ptPublishTargetTypeHandle";s:9:"page_type";s:9:"pkgHandle";b:0;}'),
(9, 'Blog', 'blog', 3, 6, 'C', 0, 0, 4, 1, 0, 'O:68:"Concrete\\Core\\Page\\Type\\PublishTarget\\Configuration\\AllConfiguration":4:{s:5:"error";s:0:"";s:21:"ptPublishTargetTypeID";s:1:"3";s:25:"ptPublishTargetTypeHandle";s:3:"all";s:9:"pkgHandle";b:0;}'),
(10, 'Portfolio', 'portfolio', 3, 6, 'C', 0, 0, 5, 1, 0, 'O:68:"Concrete\\Core\\Page\\Type\\PublishTarget\\Configuration\\AllConfiguration":4:{s:5:"error";s:0:"";s:21:"ptPublishTargetTypeID";s:1:"3";s:25:"ptPublishTargetTypeHandle";s:3:"all";s:9:"pkgHandle";b:0;}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PageWorkflowProgress`
--

DROP TABLE IF EXISTS `PageWorkflowProgress`;
CREATE TABLE `PageWorkflowProgress` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `wpID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`wpID`),
  KEY `wpID` (`wpID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PermissionAccess`
--

DROP TABLE IF EXISTS `PermissionAccess`;
CREATE TABLE `PermissionAccess` (
  `paID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `paIsInUse` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=84 ;

--
-- Daten für Tabelle `PermissionAccess`
--

INSERT INTO `PermissionAccess` (`paID`, `paIsInUse`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PermissionAccessEntities`
--

DROP TABLE IF EXISTS `PermissionAccessEntities`;
CREATE TABLE `PermissionAccessEntities` (
  `peID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `petID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`peID`),
  KEY `petID` (`petID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Daten für Tabelle `PermissionAccessEntities`
--

INSERT INTO `PermissionAccessEntities` (`peID`, `petID`) VALUES
(1, 1),
(5, 1),
(6, 1),
(8, 1),
(7, 2),
(2, 5),
(3, 6),
(4, 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PermissionAccessEntityGroups`
--

DROP TABLE IF EXISTS `PermissionAccessEntityGroups`;
CREATE TABLE `PermissionAccessEntityGroups` (
  `pegID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pegID`),
  KEY `peID` (`peID`),
  KEY `gID` (`gID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Daten für Tabelle `PermissionAccessEntityGroups`
--

INSERT INTO `PermissionAccessEntityGroups` (`pegID`, `peID`, `gID`) VALUES
(1, 1, 3),
(2, 5, 1),
(3, 6, 2),
(4, 8, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PermissionAccessEntityGroupSets`
--

DROP TABLE IF EXISTS `PermissionAccessEntityGroupSets`;
CREATE TABLE `PermissionAccessEntityGroupSets` (
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `gsID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`peID`,`gsID`),
  KEY `gsID` (`gsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PermissionAccessEntityTypeCategories`
--

DROP TABLE IF EXISTS `PermissionAccessEntityTypeCategories`;
CREATE TABLE `PermissionAccessEntityTypeCategories` (
  `petID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkCategoryID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`petID`,`pkCategoryID`),
  KEY `pkCategoryID` (`pkCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `PermissionAccessEntityTypeCategories`
--

INSERT INTO `PermissionAccessEntityTypeCategories` (`petID`, `pkCategoryID`) VALUES
(1, 1),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(2, 1),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(3, 1),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(3, 19),
(3, 20),
(4, 1),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(4, 16),
(4, 17),
(4, 18),
(4, 19),
(4, 20),
(5, 1),
(5, 14),
(6, 5),
(6, 6),
(7, 19),
(7, 20);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PermissionAccessEntityTypes`
--

DROP TABLE IF EXISTS `PermissionAccessEntityTypes`;
CREATE TABLE `PermissionAccessEntityTypes` (
  `petID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `petHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `petName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`petID`),
  UNIQUE KEY `petHandle` (`petHandle`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Daten für Tabelle `PermissionAccessEntityTypes`
--

INSERT INTO `PermissionAccessEntityTypes` (`petID`, `petHandle`, `petName`, `pkgID`) VALUES
(1, 'group', 'Group', 0),
(2, 'user', 'User', 0),
(3, 'group_set', 'Group Set', 0),
(4, 'group_combination', 'Group Combination', 0),
(5, 'page_owner', 'Page Owner', 0),
(6, 'file_uploader', 'File Uploader', 0),
(7, 'conversation_message_author', 'Message Author', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PermissionAccessEntityUsers`
--

DROP TABLE IF EXISTS `PermissionAccessEntityUsers`;
CREATE TABLE `PermissionAccessEntityUsers` (
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`peID`,`uID`),
  KEY `uID` (`uID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `PermissionAccessEntityUsers`
--

INSERT INTO `PermissionAccessEntityUsers` (`peID`, `uID`) VALUES
(7, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PermissionAccessList`
--

DROP TABLE IF EXISTS `PermissionAccessList`;
CREATE TABLE `PermissionAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `pdID` int(10) unsigned NOT NULL DEFAULT '0',
  `accessType` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`),
  KEY `accessType` (`accessType`),
  KEY `peID` (`peID`),
  KEY `peID_accessType` (`peID`,`accessType`),
  KEY `pdID` (`pdID`),
  KEY `permissionAccessDuration` (`paID`,`pdID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `PermissionAccessList`
--

INSERT INTO `PermissionAccessList` (`paID`, `peID`, `pdID`, `accessType`) VALUES
(1, 1, 0, 10),
(2, 1, 0, 10),
(3, 1, 0, 10),
(4, 1, 0, 10),
(5, 1, 0, 10),
(6, 1, 0, 10),
(7, 1, 0, 10),
(8, 1, 0, 10),
(9, 1, 0, 10),
(10, 1, 0, 10),
(11, 1, 0, 10),
(12, 1, 0, 10),
(13, 1, 0, 10),
(14, 1, 0, 10),
(15, 1, 0, 10),
(16, 1, 0, 10),
(17, 1, 0, 10),
(18, 1, 0, 10),
(19, 1, 0, 10),
(20, 1, 0, 10),
(21, 1, 0, 10),
(22, 1, 0, 10),
(23, 1, 0, 10),
(24, 1, 0, 10),
(25, 2, 0, 10),
(26, 2, 0, 10),
(27, 2, 0, 10),
(28, 2, 0, 10),
(29, 5, 0, 10),
(30, 5, 0, 10),
(31, 2, 0, 10),
(32, 2, 0, 10),
(33, 2, 0, 10),
(34, 2, 0, 10),
(35, 2, 0, 10),
(36, 2, 0, 10),
(37, 5, 0, 10),
(38, 1, 0, 10),
(38, 7, 0, 10),
(39, 1, 0, 10),
(40, 1, 0, 10),
(41, 1, 0, 10),
(42, 1, 0, 10),
(43, 1, 0, 10),
(44, 1, 0, 10),
(45, 1, 0, 10),
(46, 1, 0, 10),
(47, 5, 0, 10),
(48, 1, 0, 10),
(49, 1, 0, 10),
(50, 1, 0, 10),
(51, 1, 0, 10),
(52, 1, 0, 10),
(53, 1, 0, 10),
(54, 1, 0, 10),
(55, 1, 0, 10),
(56, 1, 0, 10),
(57, 1, 0, 10),
(58, 1, 0, 10),
(59, 1, 0, 10),
(60, 1, 0, 10),
(61, 1, 0, 10),
(62, 1, 0, 10),
(63, 1, 0, 10),
(64, 5, 0, 10),
(65, 5, 0, 10),
(66, 1, 0, 10),
(67, 1, 0, 10),
(68, 1, 0, 10),
(69, 1, 0, 10),
(70, 1, 0, 10),
(71, 1, 0, 10),
(72, 5, 0, 10),
(73, 5, 0, 10),
(74, 1, 0, 10),
(74, 4, 0, 10),
(75, 1, 0, 10),
(75, 4, 0, 10),
(76, 1, 0, 10),
(76, 6, 0, 10),
(77, 1, 0, 10),
(78, 1, 0, 10),
(79, 1, 0, 10),
(80, 2, 0, 10),
(81, 1, 0, 10),
(82, 8, 0, 10),
(83, 8, 0, 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PermissionAccessWorkflows`
--

DROP TABLE IF EXISTS `PermissionAccessWorkflows`;
CREATE TABLE `PermissionAccessWorkflows` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `wfID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`wfID`),
  KEY `wfID` (`wfID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PermissionAssignments`
--

DROP TABLE IF EXISTS `PermissionAssignments`;
CREATE TABLE `PermissionAssignments` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`pkID`),
  KEY `pkID` (`pkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `PermissionAssignments`
--

INSERT INTO `PermissionAssignments` (`paID`, `pkID`) VALUES
(1, 19),
(2, 20),
(3, 74),
(4, 75),
(5, 76),
(6, 78),
(7, 79),
(8, 80),
(9, 86),
(10, 87),
(11, 89),
(12, 90),
(13, 91),
(14, 92),
(15, 93),
(16, 94),
(17, 95),
(18, 96),
(19, 97),
(20, 98),
(21, 99),
(22, 100),
(23, 101),
(24, 102);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PermissionDurationObjects`
--

DROP TABLE IF EXISTS `PermissionDurationObjects`;
CREATE TABLE `PermissionDurationObjects` (
  `pdID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pdObject` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`pdID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PermissionKeyCategories`
--

DROP TABLE IF EXISTS `PermissionKeyCategories`;
CREATE TABLE `PermissionKeyCategories` (
  `pkCategoryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pkCategoryHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`pkCategoryID`),
  UNIQUE KEY `pkCategoryHandle` (`pkCategoryHandle`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Daten für Tabelle `PermissionKeyCategories`
--

INSERT INTO `PermissionKeyCategories` (`pkCategoryID`, `pkCategoryHandle`, `pkgID`) VALUES
(1, 'page', NULL),
(2, 'single_page', NULL),
(3, 'stack', NULL),
(4, 'user', NULL),
(5, 'file_set', NULL),
(6, 'file', NULL),
(7, 'area', NULL),
(8, 'block_type', NULL),
(9, 'block', NULL),
(10, 'admin', NULL),
(11, 'sitemap', NULL),
(12, 'marketplace_newsflow', NULL),
(13, 'basic_workflow', NULL),
(14, 'page_type', NULL),
(15, 'gathering', NULL),
(16, 'group_tree_node', NULL),
(17, 'topic_category_tree_node', NULL),
(18, 'topic_tree_node', NULL),
(19, 'conversation', NULL),
(20, 'conversation_message', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PermissionKeys`
--

DROP TABLE IF EXISTS `PermissionKeys`;
CREATE TABLE `PermissionKeys` (
  `pkID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pkHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkCanTriggerWorkflow` tinyint(1) NOT NULL DEFAULT '0',
  `pkHasCustomClass` tinyint(1) NOT NULL DEFAULT '0',
  `pkDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pkCategoryID` int(10) unsigned DEFAULT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`pkID`),
  UNIQUE KEY `akHandle` (`pkHandle`),
  KEY `pkCategoryID` (`pkCategoryID`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=103 ;

--
-- Daten für Tabelle `PermissionKeys`
--

INSERT INTO `PermissionKeys` (`pkID`, `pkHandle`, `pkName`, `pkCanTriggerWorkflow`, `pkHasCustomClass`, `pkDescription`, `pkCategoryID`, `pkgID`) VALUES
(1, 'view_page', 'View', 0, 0, 'Can see a page exists and read its content.', 1, 0),
(2, 'view_page_versions', 'View Versions', 0, 0, 'Can view the page versions dialog and read past versions of a page.', 1, 0),
(3, 'view_page_in_sitemap', 'View Page in Sitemap', 0, 0, 'Controls whether a user can see a page in the sitemap or intelligent search.', 1, 0),
(4, 'preview_page_as_user', 'Preview Page As User', 0, 0, 'Ability to see what this page will look like at a specific time in the future as a specific user.', 1, 0),
(5, 'edit_page_properties', 'Edit Properties', 0, 1, 'Ability to change anything in the Page Properties menu.', 1, 0),
(6, 'edit_page_contents', 'Edit Contents', 0, 0, 'Ability to make edits to at least some of the content in the page. You can lock down different block areas and specific blocks by clicking Permissions on them as well. ', 1, 0),
(7, 'edit_page_speed_settings', 'Edit Speed Settings', 0, 0, 'Ability to change caching settings.', 1, 0),
(8, 'edit_page_theme', 'Change Theme', 0, 1, 'Ability to change just the theme for this page.', 1, 0),
(9, 'edit_page_template', 'Change Page Template', 0, 0, 'Ability to change just the page template for this page.', 1, 0),
(10, 'edit_page_page_type', 'Edit Page Type', 0, 0, 'Change the type of an existing page.', 1, 0),
(11, 'edit_page_permissions', 'Edit Permissions', 1, 0, 'Ability to change permissions for this page. Warning: by granting this a user could give themselves more access.', 1, 0),
(12, 'delete_page', 'Delete', 1, 0, 'Ability to move this page to the site''s Trash.', 1, 0),
(13, 'delete_page_versions', 'Delete Versions', 1, 0, 'Ability to remove old versions of this page.', 1, 0),
(14, 'approve_page_versions', 'Approve Changes', 1, 0, 'Can publish an unapproved version of the page.', 1, 0),
(15, 'add_subpage', 'Add Sub-Page', 0, 1, 'Can add a page beneath the current page.', 1, 0),
(16, 'move_or_copy_page', 'Move or Copy Page', 1, 0, 'Can move or copy this page to another location.', 1, 0),
(17, 'schedule_page_contents_guest_access', 'Schedule Guest Access', 0, 0, 'Can control scheduled guest access to this page.', 1, 0),
(18, 'edit_page_multilingual_settings', 'Edit Multilingual Settings', 0, 0, 'Controls whether a user can see the multilingual settings menu, re-map a page or set a page as ignored in multilingual settings.', 1, 0),
(19, 'add_block', 'Add Block', 0, 1, 'Can add a block to any area on the site. If someone is added here they can add blocks to any area (unless that area has permissions that override these global permissions.)', 8, 0),
(20, 'add_stack', 'Add Stack', 0, 0, 'Can add a stack or block from a stack to any area on the site. If someone is added here they can add stacks to any area (unless that area has permissions that override these global permissions.)', 8, 0),
(21, 'view_area', 'View Area', 0, 0, 'Can view the area and its contents.', 7, 0),
(22, 'edit_area_contents', 'Edit Area Contents', 0, 0, 'Can edit blocks within this area.', 7, 0),
(23, 'add_block_to_area', 'Add Block to Area', 0, 1, 'Can add blocks to this area. This setting overrides the global Add Block permission for this area.', 7, 0),
(24, 'add_stack_to_area', 'Add Stack to Area', 0, 0, 'Can add stacks to this area. This setting overrides the global Add Stack permission for this area.', 7, 0),
(25, 'add_layout_to_area', 'Add Layouts to Area', 0, 0, 'Controls whether users get the ability to add layouts to a particular area.', 7, 0),
(26, 'edit_area_design', 'Edit Area Design', 0, 0, 'Controls whether users see design controls and can modify an area''s custom CSS.', 7, 0),
(27, 'edit_area_permissions', 'Edit Area Permissions', 0, 0, 'Controls whether users can access the permissions on an area. Custom area permissions could override those of the page.', 7, 0),
(28, 'delete_area_contents', 'Delete Area Contents', 0, 0, 'Controls whether users can delete blocks from this area.', 7, 0),
(29, 'schedule_area_contents_guest_access', 'Schedule Guest Access', 0, 0, 'Controls whether users can schedule guest access permissions on blocks in this area. Guest Access is a shortcut for granting permissions just to the Guest Group.', 7, 0),
(30, 'view_block', 'View Block', 0, 0, 'Controls whether users can view this block in the page.', 9, 0),
(31, 'edit_block', 'Edit Block', 0, 0, 'Controls whether users can edit this block. This overrides any area or page permissions.', 9, 0),
(32, 'edit_block_custom_template', 'Change Custom Template', 0, 0, 'Controls whether users can change the custom template on this block. This overrides any area or page permissions.', 9, 0),
(33, 'edit_block_cache_settings', 'Edit Cache Settings', 0, 0, 'Controls whether users can change the block cache settings for this block instance.', 9, 0),
(34, 'edit_block_name', 'Edit Name', 0, 0, 'Controls whether users can change the block''s name (rarely used.)', 9, 0),
(35, 'delete_block', 'Delete Block', 0, 0, 'Controls whether users can delete this block. This overrides any area or page permissions.', 9, 0),
(36, 'edit_block_design', 'Edit Design', 0, 0, 'Controls whether users can set custom design properties or CSS on this block.', 9, 0),
(37, 'edit_block_permissions', 'Edit Permissions', 0, 0, 'Controls whether users can change permissions on this block, potentially granting themselves or others greater access.', 9, 0),
(38, 'schedule_guest_access', 'Schedule Guest Access', 0, 0, 'Controls whether users can schedule guest access permissions on this block. Guest Access is a shortcut for granting permissions just to the Guest Group.', 9, 0),
(39, 'view_file_set_file', 'View Files', 0, 0, 'Can view and download files in the site.', 5, 0),
(40, 'search_file_set', 'Search Files in File Manager', 0, 0, 'Can access the file manager', 5, 0),
(41, 'edit_file_set_file_properties', 'Edit File Properties', 0, 0, 'Can edit a file''s properties.', 5, 0),
(42, 'edit_file_set_file_contents', 'Edit File Contents', 0, 0, 'Can edit or replace files in set.', 5, 0),
(43, 'copy_file_set_files', 'Copy File', 0, 0, 'Can copy files in file set.', 5, 0),
(44, 'edit_file_set_permissions', 'Edit File Access', 0, 0, 'Can edit access to file sets.', 5, 0),
(45, 'delete_file_set', 'Delete File Set', 0, 0, 'Can delete file set.', 5, 0),
(46, 'delete_file_set_files', 'Delete File', 0, 0, 'Can delete files in set.', 5, 0),
(47, 'add_file', 'Add File', 0, 1, 'Can add files to set.', 5, 0),
(48, 'view_file', 'View Files', 0, 0, 'Can view and download files.', 6, 0),
(49, 'view_file_in_file_manager', 'View File in File Manager', 0, 0, 'Can access the File Manager.', 6, 0),
(50, 'edit_file_properties', 'Edit File Properties', 0, 0, 'Can edit a file''s properties.', 6, 0),
(51, 'edit_file_contents', 'Edit File Contents', 0, 0, 'Can edit or replace files.', 6, 0),
(52, 'copy_file', 'Copy File', 0, 0, 'Can copy file.', 6, 0),
(53, 'edit_file_permissions', 'Edit File Access', 0, 0, 'Can edit access to file.', 6, 0),
(54, 'delete_file', 'Delete File', 0, 0, 'Can delete file.', 6, 0),
(55, 'approve_basic_workflow_action', 'Approve or Deny', 0, 0, 'Grant ability to approve workflow.', 13, 0),
(56, 'notify_on_basic_workflow_entry', 'Notify on Entry', 0, 0, 'Notify approvers that a change has entered the workflow.', 13, 0),
(57, 'notify_on_basic_workflow_approve', 'Notify on Approve', 0, 0, 'Notify approvers that a change has been approved.', 13, 0),
(58, 'notify_on_basic_workflow_deny', 'Notify on Deny', 0, 0, 'Notify approvers that a change has been denied.', 13, 0),
(59, 'add_page_type', 'Add Pages of This Type', 0, 0, '', 14, 0),
(60, 'edit_page_type', 'Edit Page Type', 0, 0, '', 14, 0),
(61, 'delete_page_type', 'Delete Page Type', 0, 0, '', 14, 0),
(62, 'edit_page_type_permissions', 'Edit Page Type Permissions', 0, 0, '', 14, 0),
(63, 'edit_page_type_drafts', 'Edit Page Type Drafts', 0, 0, '', 14, 0),
(64, 'view_topic_tree_node', 'View Topic Tree Node', 0, 0, '', 18, 0),
(65, 'view_topic_category_tree_node', 'View Topic Category Tree Node', 0, 0, '', 17, 0),
(66, 'add_conversation_message', 'Add Message to Conversation', 0, 0, '', 19, 0),
(67, 'add_conversation_message_attachments', 'Add Message Attachments', 0, 0, '', 19, 0),
(68, 'edit_conversation_permissions', 'Edit Conversation Permissions', 0, 0, '', 19, 0),
(69, 'delete_conversation_message', 'Delete Message', 0, 0, '', 19, 0),
(70, 'edit_conversation_message', 'Edit Message', 0, 0, '', 19, 0),
(71, 'rate_conversation_message', 'Rate Message', 0, 0, '', 19, 0),
(72, 'flag_conversation_message', 'Flag Message', 0, 0, '', 19, 0),
(73, 'approve_conversation_message', 'Approve Message', 0, 0, '', 19, 0),
(74, 'edit_user_properties', 'Edit User Details', 0, 1, NULL, 4, 0),
(75, 'view_user_attributes', 'View User Attributes', 0, 1, NULL, 4, 0),
(76, 'activate_user', 'Activate/Deactivate User', 0, 0, NULL, 4, 0),
(77, 'sudo', 'Sign in as User', 0, 0, NULL, 4, 0),
(78, 'upgrade', 'Upgrade concrete5', 0, 0, NULL, 10, 0),
(79, 'access_group_search', 'Access Group Search', 0, 0, NULL, 4, 0),
(80, 'delete_user', 'Delete User', 0, 0, NULL, 4, 0),
(81, 'search_users_in_group', 'Search User Group', 0, 0, NULL, 16, 0),
(82, 'edit_group', 'Edit Group', 0, 0, NULL, 16, 0),
(83, 'assign_group', 'Assign Group', 0, 0, NULL, 16, 0),
(84, 'add_sub_group', 'Add Child Group', 0, 0, NULL, 16, 0),
(85, 'edit_group_permissions', 'Edit Group Permissions', 0, 0, NULL, 16, 0),
(86, 'access_page_type_permissions', 'Access Page Type Permissions', 0, 0, NULL, 10, 0),
(87, 'backup', 'Perform Backups', 0, 0, NULL, 10, 0),
(88, 'access_task_permissions', 'Access Task Permissions', 0, 0, NULL, 10, 0),
(89, 'access_sitemap', 'Access Sitemap', 0, 0, NULL, 11, 0),
(90, 'access_page_defaults', 'Access Page Type Defaults', 0, 0, NULL, 10, 0),
(91, 'customize_themes', 'Customize Themes', 0, 0, NULL, 10, 0),
(92, 'manage_layout_presets', 'Manage Layout Presets', 0, 0, NULL, 10, 0),
(93, 'empty_trash', 'Empty Trash', 0, 0, NULL, 10, 0),
(94, 'add_topic_tree', 'Add Topic Tree', 0, 0, NULL, 10, 0),
(95, 'remove_topic_tree', 'Remove Topic Tree', 0, 0, NULL, 10, 0),
(96, 'uninstall_packages', 'Uninstall Packages', 0, 0, NULL, 12, 0),
(97, 'install_packages', 'Install Packages', 0, 0, NULL, 12, 0),
(98, 'view_newsflow', 'View Newsflow', 0, 0, NULL, 12, 0),
(99, 'access_user_search_export', 'Export Site Users', 0, 0, 'Controls whether a user can export site users or not', 4, 0),
(100, 'access_user_search', 'Access User Search', 0, 0, 'Controls whether a user can view the search user interface.', 4, 0),
(101, 'edit_gatherings', 'Edit Gatherings', 0, 0, 'Can edit the footprint and items in all gatherings.', 10, 0),
(102, 'edit_gathering_items', 'Edit Gathering Items', 0, 0, '', 15, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PileContents`
--

DROP TABLE IF EXISTS `PileContents`;
CREATE TABLE `PileContents` (
  `pcID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pID` int(10) unsigned NOT NULL DEFAULT '0',
  `itemID` int(10) unsigned NOT NULL DEFAULT '0',
  `itemType` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `displayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pcID`),
  KEY `pID` (`pID`,`displayOrder`),
  KEY `itemID` (`itemID`),
  KEY `itemType` (`itemType`,`itemID`,`pID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Piles`
--

DROP TABLE IF EXISTS `Piles`;
CREATE TABLE `Piles` (
  `pID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uID` int(10) unsigned DEFAULT NULL,
  `isDefault` tinyint(1) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`pID`),
  KEY `uID` (`uID`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `Piles`
--

INSERT INTO `Piles` (`pID`, `uID`, `isDefault`, `timestamp`, `name`, `state`) VALUES
(1, 1, 1, '2015-04-06 18:54:10', NULL, 'READY');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `QueueMessages`
--

DROP TABLE IF EXISTS `QueueMessages`;
CREATE TABLE `QueueMessages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `queue_id` int(10) unsigned NOT NULL,
  `handle` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` varchar(8192) COLLATE utf8_unicode_ci NOT NULL,
  `md5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `timeout` decimal(14,0) DEFAULT NULL,
  `created` int(10) unsigned NOT NULL,
  PRIMARY KEY (`message_id`),
  UNIQUE KEY `message_handle` (`handle`),
  KEY `message_queueid` (`queue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `QueuePageDuplicationRelations`
--

DROP TABLE IF EXISTS `QueuePageDuplicationRelations`;
CREATE TABLE `QueuePageDuplicationRelations` (
  `queue_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `originalCID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`originalCID`),
  KEY `originalCID` (`originalCID`,`queue_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Queues`
--

DROP TABLE IF EXISTS `Queues`;
CREATE TABLE `Queues` (
  `queue_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `queue_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `timeout` int(10) unsigned NOT NULL DEFAULT '30',
  PRIMARY KEY (`queue_id`),
  KEY `queue_name` (`queue_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Sessions`
--

DROP TABLE IF EXISTS `Sessions`;
CREATE TABLE `Sessions` (
  `sessionID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sessionValue` text COLLATE utf8_unicode_ci NOT NULL,
  `sessionTime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sessionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SignupRequests`
--

DROP TABLE IF EXISTS `SignupRequests`;
CREATE TABLE `SignupRequests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipFrom` tinyblob,
  `date_access` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ipFrom` (`ipFrom`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SocialLinks`
--

DROP TABLE IF EXISTS `SocialLinks`;
CREATE TABLE `SocialLinks` (
  `slID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ssHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`slID`),
  UNIQUE KEY `ssHandle` (`ssHandle`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `SocialLinks`
--

INSERT INTO `SocialLinks` (`slID`, `ssHandle`, `url`) VALUES
(1, 'facebook', 'http://facebook.com/concrete5'),
(2, 'github', 'http://github.com/concrete5'),
(3, 'twitter', 'http://twitter.com/concrete5');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Stacks`
--

DROP TABLE IF EXISTS `Stacks`;
CREATE TABLE `Stacks` (
  `stID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stType` int(10) unsigned NOT NULL DEFAULT '0',
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stID`),
  KEY `stType` (`stType`),
  KEY `stName` (`stName`),
  KEY `cID` (`cID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Daten für Tabelle `Stacks`
--

INSERT INTO `Stacks` (`stID`, `stName`, `stType`, `cID`) VALUES
(1, 'Footer Contact', 20, 142),
(2, 'Footer Legal', 20, 143),
(3, 'Footer Navigation', 20, 144),
(4, 'Footer Site Title', 20, 145),
(5, 'Footer Social', 20, 146),
(6, 'Header Navigation', 20, 147),
(7, 'Header Search', 20, 148),
(8, 'Header Site Title', 20, 149);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `StyleCustomizerCustomCssRecords`
--

DROP TABLE IF EXISTS `StyleCustomizerCustomCssRecords`;
CREATE TABLE `StyleCustomizerCustomCssRecords` (
  `sccRecordID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`sccRecordID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `StyleCustomizerInlineStylePresets`
--

DROP TABLE IF EXISTS `StyleCustomizerInlineStylePresets`;
CREATE TABLE `StyleCustomizerInlineStylePresets` (
  `pssPresetID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pssPresetName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `issID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pssPresetID`),
  KEY `issID` (`issID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `StyleCustomizerInlineStyleSets`
--

DROP TABLE IF EXISTS `StyleCustomizerInlineStyleSets`;
CREATE TABLE `StyleCustomizerInlineStyleSets` (
  `issID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `backgroundColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `backgroundImageFileID` int(11) DEFAULT NULL,
  `backgroundRepeat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `borderWidth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `borderColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `borderStyle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `borderRadius` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baseFontSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alignment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `textColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paddingTop` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paddingBottom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paddingLeft` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paddingRight` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marginTop` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marginBottom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marginLeft` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marginRight` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rotate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `boxShadowHorizontal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `boxShadowVertical` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `boxShadowBlur` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `boxShadowSpread` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `boxShadowColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customClass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`issID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=33 ;

--
-- Daten für Tabelle `StyleCustomizerInlineStyleSets`
--

INSERT INTO `StyleCustomizerInlineStyleSets` (`issID`, `backgroundColor`, `backgroundImageFileID`, `backgroundRepeat`, `borderWidth`, `borderColor`, `borderStyle`, `borderRadius`, `baseFontSize`, `alignment`, `textColor`, `linkColor`, `paddingTop`, `paddingBottom`, `paddingLeft`, `paddingRight`, `marginTop`, `marginBottom`, `marginLeft`, `marginRight`, `rotate`, `boxShadowHorizontal`, `boxShadowVertical`, `boxShadowBlur`, `boxShadowSpread`, `boxShadowColor`, `customClass`) VALUES
(1, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'block-sidebar-wrapped'),
(2, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'block-sidebar-wrapped'),
(3, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'block-sidebar-wrapped'),
(4, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'blog-entry-list'),
(5, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'block-sidebar-wrapped'),
(6, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'block-sidebar-padded'),
(7, '', 0, 'no-repeat', '', '', 'none', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(8, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'feature-home-page'),
(9, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'feature-home-page'),
(10, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'feature-home-page'),
(11, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '80px', '', '', '', '', '', '', '', '', ''),
(12, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'recent-blog-entry'),
(13, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'recent-blog-entry'),
(14, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'area-content-accent'),
(15, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'area-content-accent'),
(16, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'testimonial-bio'),
(17, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'testimonial-bio'),
(18, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'testimonial-bio'),
(19, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'testimonial-bio'),
(20, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'testimonial-bio'),
(21, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'testimonial-bio'),
(22, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'testimonial-bio'),
(23, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'testimonial-bio'),
(24, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'image-right-tilt'),
(25, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'image-circle'),
(26, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'image-right-tilt'),
(27, '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'page-list-with-buttons'),
(28, '', 0, 'no-repeat', NULL, '', 'none', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', ''),
(29, '', 0, 'no-repeat', NULL, '', 'none', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', ''),
(30, '', 0, 'no-repeat', NULL, '', 'none', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '-3px', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', ''),
(31, '', 0, 'no-repeat', NULL, '', 'none', NULL, '61px', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', ''),
(32, '', 0, 'no-repeat', NULL, '', 'none', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `StyleCustomizerValueLists`
--

DROP TABLE IF EXISTS `StyleCustomizerValueLists`;
CREATE TABLE `StyleCustomizerValueLists` (
  `scvlID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`scvlID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `StyleCustomizerValues`
--

DROP TABLE IF EXISTS `StyleCustomizerValues`;
CREATE TABLE `StyleCustomizerValues` (
  `scvID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scvlID` int(10) unsigned DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`scvID`),
  KEY `scvlID` (`scvlID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SystemAntispamLibraries`
--

DROP TABLE IF EXISTS `SystemAntispamLibraries`;
CREATE TABLE `SystemAntispamLibraries` (
  `saslHandle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `saslName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `saslIsActive` tinyint(1) NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`saslHandle`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SystemCaptchaLibraries`
--

DROP TABLE IF EXISTS `SystemCaptchaLibraries`;
CREATE TABLE `SystemCaptchaLibraries` (
  `sclHandle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `sclName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sclIsActive` tinyint(1) NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sclHandle`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `SystemCaptchaLibraries`
--

INSERT INTO `SystemCaptchaLibraries` (`sclHandle`, `sclName`, `sclIsActive`, `pkgID`) VALUES
('securimage', 'SecurImage (Default)', 1, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SystemContentEditorSnippets`
--

DROP TABLE IF EXISTS `SystemContentEditorSnippets`;
CREATE TABLE `SystemContentEditorSnippets` (
  `scsHandle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `scsName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scsIsActive` tinyint(1) NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`scsHandle`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `SystemContentEditorSnippets`
--

INSERT INTO `SystemContentEditorSnippets` (`scsHandle`, `scsName`, `scsIsActive`, `pkgID`) VALUES
('page_name', 'Page Name', 1, 0),
('user_name', 'User Name', 1, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SystemDatabaseMigrations`
--

DROP TABLE IF EXISTS `SystemDatabaseMigrations`;
CREATE TABLE `SystemDatabaseMigrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `SystemDatabaseMigrations`
--

INSERT INTO `SystemDatabaseMigrations` (`version`) VALUES
('20150109000000');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SystemDatabaseQueryLog`
--

DROP TABLE IF EXISTS `SystemDatabaseQueryLog`;
CREATE TABLE `SystemDatabaseQueryLog` (
  `query` text COLLATE utf8_unicode_ci,
  `params` text COLLATE utf8_unicode_ci,
  `executionMS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SystemImageEditorComponents`
--

DROP TABLE IF EXISTS `SystemImageEditorComponents`;
CREATE TABLE `SystemImageEditorComponents` (
  `scsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scsHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scsName` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scsDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`scsID`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SystemImageEditorControlSets`
--

DROP TABLE IF EXISTS `SystemImageEditorControlSets`;
CREATE TABLE `SystemImageEditorControlSets` (
  `scsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scsHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scsName` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scsDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`scsID`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `SystemImageEditorControlSets`
--

INSERT INTO `SystemImageEditorControlSets` (`scsID`, `scsHandle`, `scsName`, `scsDisplayOrder`, `pkgID`) VALUES
(1, 'position', 'Position', 0, 0),
(2, 'filter', 'Filter', 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SystemImageEditorFilters`
--

DROP TABLE IF EXISTS `SystemImageEditorFilters`;
CREATE TABLE `SystemImageEditorFilters` (
  `scsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scsHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scsName` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scsDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`scsID`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Daten für Tabelle `SystemImageEditorFilters`
--

INSERT INTO `SystemImageEditorFilters` (`scsID`, `scsHandle`, `scsName`, `scsDisplayOrder`, `pkgID`) VALUES
(1, 'none', 'None', 0, 0),
(2, 'grayscale', 'Grayscale', 0, 0),
(3, 'sepia', 'Sepia', 0, 0),
(4, 'gaussian_blur', 'Blur', 0, 0),
(5, 'vignette', 'Vignette', 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SystemImageEditorShapes`
--

DROP TABLE IF EXISTS `SystemImageEditorShapes`;
CREATE TABLE `SystemImageEditorShapes` (
  `scsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scsHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scsName` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scsDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`scsID`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `TopicTrees`
--

DROP TABLE IF EXISTS `TopicTrees`;
CREATE TABLE `TopicTrees` (
  `treeID` int(10) unsigned NOT NULL DEFAULT '0',
  `topicTreeName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`treeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `TopicTrees`
--

INSERT INTO `TopicTrees` (`treeID`, `topicTreeName`) VALUES
(2, 'Blog Entries'),
(3, 'Projects');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `TreeCategoryNodes`
--

DROP TABLE IF EXISTS `TreeCategoryNodes`;
CREATE TABLE `TreeCategoryNodes` (
  `treeNodeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `treeNodeCategoryName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`treeNodeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Daten für Tabelle `TreeCategoryNodes`
--

INSERT INTO `TreeCategoryNodes` (`treeNodeID`, `treeNodeCategoryName`) VALUES
(5, ''),
(6, 'Reviews'),
(14, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `TreeGroupNodes`
--

DROP TABLE IF EXISTS `TreeGroupNodes`;
CREATE TABLE `TreeGroupNodes` (
  `treeNodeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gID` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`treeNodeID`),
  KEY `gID` (`gID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Daten für Tabelle `TreeGroupNodes`
--

INSERT INTO `TreeGroupNodes` (`treeNodeID`, `gID`) VALUES
(2, 1),
(3, 2),
(4, 3),
(19, 4),
(20, 5),
(21, 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `TreeNodePermissionAssignments`
--

DROP TABLE IF EXISTS `TreeNodePermissionAssignments`;
CREATE TABLE `TreeNodePermissionAssignments` (
  `treeNodeID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`treeNodeID`,`pkID`,`paID`),
  KEY `pkID` (`pkID`),
  KEY `paID` (`paID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `TreeNodePermissionAssignments`
--

INSERT INTO `TreeNodePermissionAssignments` (`treeNodeID`, `pkID`, `paID`) VALUES
(1, 81, 67),
(1, 82, 68),
(1, 83, 69),
(1, 84, 70),
(1, 85, 71),
(5, 65, 29),
(14, 65, 30);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `TreeNodes`
--

DROP TABLE IF EXISTS `TreeNodes`;
CREATE TABLE `TreeNodes` (
  `treeNodeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `treeNodeTypeID` int(10) unsigned DEFAULT '0',
  `treeID` int(10) unsigned DEFAULT '0',
  `treeNodeParentID` int(10) unsigned DEFAULT '0',
  `treeNodeDisplayOrder` int(10) unsigned DEFAULT '0',
  `treeNodeOverridePermissions` tinyint(1) DEFAULT '0',
  `inheritPermissionsFromTreeNodeID` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`treeNodeID`),
  KEY `treeNodeParentID` (`treeNodeParentID`),
  KEY `treeNodeTypeID` (`treeNodeTypeID`),
  KEY `treeID` (`treeID`),
  KEY `inheritPermissionsFromTreeNodeID` (`inheritPermissionsFromTreeNodeID`,`treeNodeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Daten für Tabelle `TreeNodes`
--

INSERT INTO `TreeNodes` (`treeNodeID`, `treeNodeTypeID`, `treeID`, `treeNodeParentID`, `treeNodeDisplayOrder`, `treeNodeOverridePermissions`, `inheritPermissionsFromTreeNodeID`) VALUES
(1, 1, 1, 0, 0, 1, 1),
(2, 1, 1, 1, 0, 0, 1),
(3, 1, 1, 1, 1, 0, 1),
(4, 1, 1, 1, 2, 0, 1),
(5, 2, 2, 0, 0, 1, 5),
(6, 2, 2, 5, 0, 0, 5),
(7, 3, 2, 6, 0, 0, 5),
(8, 3, 2, 6, 1, 0, 5),
(9, 3, 2, 6, 2, 0, 5),
(10, 3, 2, 6, 3, 0, 5),
(11, 3, 2, 5, 1, 0, 5),
(12, 3, 2, 5, 2, 0, 5),
(13, 3, 2, 5, 3, 0, 5),
(14, 2, 3, 0, 0, 1, 14),
(15, 3, 3, 14, 0, 0, 14),
(16, 3, 3, 14, 1, 0, 14),
(17, 3, 3, 14, 2, 0, 14),
(18, 3, 3, 14, 3, 0, 14),
(19, 1, 1, 1, 3, 0, 1),
(20, 1, 1, 1, 4, 0, 1),
(21, 1, 1, 1, 5, 0, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `TreeNodeTypes`
--

DROP TABLE IF EXISTS `TreeNodeTypes`;
CREATE TABLE `TreeNodeTypes` (
  `treeNodeTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `treeNodeTypeHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `pkgID` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`treeNodeTypeID`),
  UNIQUE KEY `treeNodeTypeHandle` (`treeNodeTypeHandle`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `TreeNodeTypes`
--

INSERT INTO `TreeNodeTypes` (`treeNodeTypeID`, `treeNodeTypeHandle`, `pkgID`) VALUES
(1, 'group', 0),
(2, 'topic_category', 0),
(3, 'topic', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Trees`
--

DROP TABLE IF EXISTS `Trees`;
CREATE TABLE `Trees` (
  `treeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `treeTypeID` int(10) unsigned DEFAULT '0',
  `treeDateAdded` datetime DEFAULT NULL,
  `rootTreeNodeID` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`treeID`),
  KEY `treeTypeID` (`treeTypeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `Trees`
--

INSERT INTO `Trees` (`treeID`, `treeTypeID`, `treeDateAdded`, `rootTreeNodeID`) VALUES
(1, 1, '2015-04-06 20:44:34', 1),
(2, 2, '2015-04-06 20:46:09', 5),
(3, 2, '2015-04-06 20:46:09', 14);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `TreeTopicNodes`
--

DROP TABLE IF EXISTS `TreeTopicNodes`;
CREATE TABLE `TreeTopicNodes` (
  `treeNodeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `treeNodeTopicName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`treeNodeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Daten für Tabelle `TreeTopicNodes`
--

INSERT INTO `TreeTopicNodes` (`treeNodeID`, `treeNodeTopicName`) VALUES
(7, 'Gadgets'),
(8, 'Movies'),
(9, 'Books'),
(10, 'Music'),
(11, 'Projects'),
(12, 'Sports'),
(13, 'Humor'),
(15, 'Crafts'),
(16, 'Homework'),
(17, 'Supplies'),
(18, 'Activities');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `TreeTypes`
--

DROP TABLE IF EXISTS `TreeTypes`;
CREATE TABLE `TreeTypes` (
  `treeTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `treeTypeHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `pkgID` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`treeTypeID`),
  UNIQUE KEY `treeTypeHandle` (`treeTypeHandle`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `TreeTypes`
--

INSERT INTO `TreeTypes` (`treeTypeID`, `treeTypeHandle`, `pkgID`) VALUES
(1, 'group', 0),
(2, 'topic', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `UserAttributeKeys`
--

DROP TABLE IF EXISTS `UserAttributeKeys`;
CREATE TABLE `UserAttributeKeys` (
  `akID` int(10) unsigned NOT NULL,
  `uakProfileDisplay` tinyint(1) NOT NULL DEFAULT '0',
  `uakMemberListDisplay` tinyint(1) NOT NULL DEFAULT '0',
  `uakProfileEdit` tinyint(1) NOT NULL DEFAULT '1',
  `uakProfileEditRequired` tinyint(1) NOT NULL DEFAULT '0',
  `uakRegisterEdit` tinyint(1) NOT NULL DEFAULT '0',
  `uakRegisterEditRequired` tinyint(1) NOT NULL DEFAULT '0',
  `displayOrder` int(10) unsigned DEFAULT '0',
  `uakIsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`akID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `UserAttributeKeys`
--

INSERT INTO `UserAttributeKeys` (`akID`, `uakProfileDisplay`, `uakMemberListDisplay`, `uakProfileEdit`, `uakProfileEditRequired`, `uakRegisterEdit`, `uakRegisterEditRequired`, `displayOrder`, `uakIsActive`) VALUES
(12, 0, 0, 1, 0, 1, 0, 1, 1),
(13, 0, 0, 1, 0, 1, 0, 2, 1),
(16, 0, 0, 0, 0, 0, 0, 3, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `UserAttributeValues`
--

DROP TABLE IF EXISTS `UserAttributeValues`;
CREATE TABLE `UserAttributeValues` (
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `avID` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`uID`,`akID`),
  KEY `akID` (`akID`),
  KEY `avID` (`avID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `UserAttributeValues`
--

INSERT INTO `UserAttributeValues` (`uID`, `akID`, `avID`) VALUES
(2, 12, 212),
(2, 13, 213),
(3, 12, 265),
(3, 13, 266);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `UserBannedIPs`
--

DROP TABLE IF EXISTS `UserBannedIPs`;
CREATE TABLE `UserBannedIPs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ipFrom` tinyblob,
  `ipTo` tinyblob,
  `banCode` tinyint(1) NOT NULL DEFAULT '1',
  `expires` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isManual` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipFrom` (`ipFrom`(32),`ipTo`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `UserGroups`
--

DROP TABLE IF EXISTS `UserGroups`;
CREATE TABLE `UserGroups` (
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `ugEntered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`uID`,`gID`),
  KEY `uID` (`uID`),
  KEY `gID` (`gID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `UserGroups`
--

INSERT INTO `UserGroups` (`uID`, `gID`, `ugEntered`) VALUES
(1, 5, '2015-08-05 22:21:58'),
(2, 4, '2015-05-03 12:37:52'),
(3, 6, '2015-10-08 22:30:52');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `UserPermissionEditPropertyAccessList`
--

DROP TABLE IF EXISTS `UserPermissionEditPropertyAccessList`;
CREATE TABLE `UserPermissionEditPropertyAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `uName` tinyint(1) DEFAULT '0',
  `uEmail` tinyint(1) DEFAULT '0',
  `uPassword` tinyint(1) DEFAULT '0',
  `uAvatar` tinyint(1) DEFAULT '0',
  `uTimezone` tinyint(1) DEFAULT '0',
  `uDefaultLanguage` tinyint(1) DEFAULT '0',
  `attributePermission` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `UserPermissionEditPropertyAttributeAccessListCustom`
--

DROP TABLE IF EXISTS `UserPermissionEditPropertyAttributeAccessListCustom`;
CREATE TABLE `UserPermissionEditPropertyAttributeAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`akID`),
  KEY `peID` (`peID`),
  KEY `akID` (`akID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `UserPermissionViewAttributeAccessList`
--

DROP TABLE IF EXISTS `UserPermissionViewAttributeAccessList`;
CREATE TABLE `UserPermissionViewAttributeAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`),
  KEY `peID` (`peID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `UserPermissionViewAttributeAccessListCustom`
--

DROP TABLE IF EXISTS `UserPermissionViewAttributeAccessListCustom`;
CREATE TABLE `UserPermissionViewAttributeAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`akID`),
  KEY `peID` (`peID`),
  KEY `akID` (`akID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `UserPointActions`
--

DROP TABLE IF EXISTS `UserPointActions`;
CREATE TABLE `UserPointActions` (
  `upaID` int(11) NOT NULL AUTO_INCREMENT,
  `upaHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upaName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upaDefaultPoints` int(11) NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  `upaHasCustomClass` tinyint(1) NOT NULL DEFAULT '0',
  `upaIsActive` tinyint(1) NOT NULL DEFAULT '1',
  `gBadgeID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`upaID`),
  UNIQUE KEY `upaHandle` (`upaHandle`),
  KEY `pkgID` (`pkgID`),
  KEY `gBBadgeID` (`gBadgeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `UserPointActions`
--

INSERT INTO `UserPointActions` (`upaID`, `upaHandle`, `upaName`, `upaDefaultPoints`, `pkgID`, `upaHasCustomClass`, `upaIsActive`, `gBadgeID`) VALUES
(1, 'won_badge', 'Won a Badge', 5, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `UserPointHistory`
--

DROP TABLE IF EXISTS `UserPointHistory`;
CREATE TABLE `UserPointHistory` (
  `upID` int(11) NOT NULL AUTO_INCREMENT,
  `upuID` int(11) NOT NULL DEFAULT '0',
  `upaID` int(11) DEFAULT '0',
  `upPoints` int(11) DEFAULT '0',
  `object` longtext COLLATE utf8_unicode_ci,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`upID`),
  KEY `upuID` (`upuID`),
  KEY `upaID` (`upaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `UserPrivateMessages`
--

DROP TABLE IF EXISTS `UserPrivateMessages`;
CREATE TABLE `UserPrivateMessages` (
  `msgID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uAuthorID` int(10) unsigned NOT NULL DEFAULT '0',
  `msgDateCreated` datetime NOT NULL,
  `msgSubject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `msgBody` text COLLATE utf8_unicode_ci,
  `uToID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`msgID`),
  KEY `uAuthorID` (`uAuthorID`,`msgDateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `UserPrivateMessagesTo`
--

DROP TABLE IF EXISTS `UserPrivateMessagesTo`;
CREATE TABLE `UserPrivateMessagesTo` (
  `msgID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `uAuthorID` int(10) unsigned NOT NULL DEFAULT '0',
  `msgMailboxID` int(11) NOT NULL,
  `msgIsNew` tinyint(1) NOT NULL DEFAULT '0',
  `msgIsUnread` tinyint(1) NOT NULL DEFAULT '0',
  `msgIsReplied` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`msgID`,`uID`,`uAuthorID`,`msgMailboxID`),
  KEY `uID` (`uID`),
  KEY `uAuthorID` (`uAuthorID`),
  KEY `msgFolderID` (`msgMailboxID`),
  KEY `msgIsNew` (`msgIsNew`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Users`
--

DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
  `uID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uName` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `uEmail` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `uPassword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uIsActive` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `uIsValidated` tinyint(1) NOT NULL DEFAULT '-1',
  `uIsFullRecord` tinyint(1) NOT NULL DEFAULT '1',
  `uDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uLastPasswordChange` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uHasAvatar` tinyint(1) NOT NULL DEFAULT '0',
  `uLastOnline` int(10) unsigned NOT NULL DEFAULT '0',
  `uLastLogin` int(10) unsigned NOT NULL DEFAULT '0',
  `uLastIP` tinyblob,
  `uPreviousLogin` int(10) unsigned DEFAULT '0',
  `uNumLogins` int(10) unsigned NOT NULL DEFAULT '0',
  `uLastAuthTypeID` int(10) unsigned NOT NULL DEFAULT '0',
  `uTimezone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uDefaultLanguage` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uID`),
  UNIQUE KEY `uName` (`uName`),
  KEY `uEmail` (`uEmail`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `Users`
--

INSERT INTO `Users` (`uID`, `uName`, `uEmail`, `uPassword`, `uIsActive`, `uIsValidated`, `uIsFullRecord`, `uDateAdded`, `uLastPasswordChange`, `uHasAvatar`, `uLastOnline`, `uLastLogin`, `uLastIP`, `uPreviousLogin`, `uNumLogins`, `uLastAuthTypeID`, `uTimezone`, `uDefaultLanguage`) VALUES
(1, 'admin', 'lucius.bachmann@gmx.ch', '$2a$12$uHEYWy975GfxTaOzWTweye3OBYO7bBdsdb2IHi3dqTieafdCkkyCu', '1', -1, 1, '2015-04-06 20:44:34', '2015-04-06 20:44:34', 0, 1444680114, 1444678548, 0x3766303030303031, 1444336300, 33, 1, NULL, NULL),
(2, 'testuser', 'bachmann395@gmail.com', '$2a$12$VXsKmMvHz.dExxWQVA1j8eyYcLvRkPs6qFXy/js4JWVgpkD5A52YK', '1', -1, 1, '2015-04-19 23:50:45', '2015-04-19 23:50:45', 0, 0, 0, NULL, 0, 0, 0, NULL, 'de_DE'),
(3, 'testleiter', 'lucius.bachmann@centerboard.ch', '$2a$12$3sj2rtJyk.Jm/bF2.M1Jdu.oK2nx8KAKrT2FTIlyWrDGVHjVuHcOm', '1', -1, 1, '2015-10-08 22:30:51', '2015-10-08 22:30:51', 0, 1444336284, 1444336284, 0x3766303030303031, 0, 1, 1, NULL, 'de_DE');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `UserSearchIndexAttributes`
--

DROP TABLE IF EXISTS `UserSearchIndexAttributes`;
CREATE TABLE `UserSearchIndexAttributes` (
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `ak_profile_private_messages_enabled` tinyint(1) DEFAULT '0',
  `ak_profile_private_messages_notification_enabled` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`uID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `UserSearchIndexAttributes`
--

INSERT INTO `UserSearchIndexAttributes` (`uID`, `ak_profile_private_messages_enabled`, `ak_profile_private_messages_notification_enabled`) VALUES
(1, 0, 0),
(2, 1, 1),
(3, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `UserValidationHashes`
--

DROP TABLE IF EXISTS `UserValidationHashes`;
CREATE TABLE `UserValidationHashes` (
  `uvhID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uID` int(10) unsigned DEFAULT NULL,
  `uHash` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `uDateGenerated` int(10) unsigned NOT NULL DEFAULT '0',
  `uDateRedeemed` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uvhID`),
  KEY `uID` (`uID`,`type`),
  KEY `uHash` (`uHash`,`type`),
  KEY `uDateGenerated` (`uDateGenerated`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `VividStoreDigitalFile`
--

DROP TABLE IF EXISTS `VividStoreDigitalFile`;
CREATE TABLE `VividStoreDigitalFile` (
  `dfID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pID` int(11) DEFAULT NULL,
  `dffID` int(11) DEFAULT NULL,
  PRIMARY KEY (`dfID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `VividStoreDigitalFile`
--

INSERT INTO `VividStoreDigitalFile` (`dfID`, `pID`, `dffID`) VALUES
(1, 1, 16);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `VividStoreGroups`
--

DROP TABLE IF EXISTS `VividStoreGroups`;
CREATE TABLE `VividStoreGroups` (
  `gID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`gID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `VividStoreOrder`
--

DROP TABLE IF EXISTS `VividStoreOrder`;
CREATE TABLE `VividStoreOrder` (
  `oID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cID` int(11) DEFAULT NULL,
  `oDate` datetime DEFAULT NULL,
  `oStatus` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pmID` int(11) DEFAULT NULL,
  `smID` int(11) DEFAULT NULL,
  `oShippingTotal` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oTax` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oTotal` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`oID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `VividStoreOrder`
--

INSERT INTO `VividStoreOrder` (`oID`, `cID`, `oDate`, `oStatus`, `pmID`, `smID`, `oShippingTotal`, `oTax`, `oTotal`) VALUES
(1, 1, '2015-08-05 22:21:58', 'pending', 2, NULL, '$0.00', '$0.00', '$0.00'),
(2, 1, '2015-08-05 22:27:22', 'pending', 2, NULL, '$0.00', '$0.00', '$0.00'),
(3, 1, '2015-08-05 22:30:24', 'pending', 2, NULL, '$0.00', '$0.00', '$0.00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `VividStoreOrderAttributeKeys`
--

DROP TABLE IF EXISTS `VividStoreOrderAttributeKeys`;
CREATE TABLE `VividStoreOrderAttributeKeys` (
  `akID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`akID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `VividStoreOrderAttributeKeys`
--

INSERT INTO `VividStoreOrderAttributeKeys` (`akID`) VALUES
(34),
(35),
(36),
(37),
(38),
(39),
(40);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `VividStoreOrderAttributeValues`
--

DROP TABLE IF EXISTS `VividStoreOrderAttributeValues`;
CREATE TABLE `VividStoreOrderAttributeValues` (
  `oID` int(10) unsigned NOT NULL,
  `akID` int(10) unsigned NOT NULL,
  `avID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`oID`,`akID`,`avID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `VividStoreOrderItem`
--

DROP TABLE IF EXISTS `VividStoreOrderItem`;
CREATE TABLE `VividStoreOrderItem` (
  `oiID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pID` int(11) DEFAULT NULL,
  `oID` int(11) DEFAULT NULL,
  `oiProductName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oiPricePaid` decimal(10,0) DEFAULT NULL,
  `oiQty` int(11) DEFAULT NULL,
  PRIMARY KEY (`oiID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `VividStoreOrderItem`
--

INSERT INTO `VividStoreOrderItem` (`oiID`, `pID`, `oID`, `oiProductName`, `oiPricePaid`, `oiQty`) VALUES
(1, 1, 1, 'test', 0, 1),
(2, 1, 2, 'test', 0, 1),
(3, 1, 3, 'test', 0, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `VividStoreOrderItemOption`
--

DROP TABLE IF EXISTS `VividStoreOrderItemOption`;
CREATE TABLE `VividStoreOrderItemOption` (
  `oioID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oiID` int(11) DEFAULT NULL,
  `oioKey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oioValue` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`oioID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `VividStoreOrderStatus`
--

DROP TABLE IF EXISTS `VividStoreOrderStatus`;
CREATE TABLE `VividStoreOrderStatus` (
  `osID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `osHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `osName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `osInformSite` int(11) DEFAULT NULL,
  `osInformCustomer` int(11) DEFAULT NULL,
  `osIsStartingStatus` int(11) DEFAULT NULL,
  `osSortOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`osID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Daten für Tabelle `VividStoreOrderStatus`
--

INSERT INTO `VividStoreOrderStatus` (`osID`, `osHandle`, `osName`, `osInformSite`, `osInformCustomer`, `osIsStartingStatus`, `osSortOrder`) VALUES
(1, 'pending', 'Pending', 1, 1, NULL, NULL),
(2, 'processing', 'Processing', 1, 1, NULL, NULL),
(3, 'shipped', 'shipped', 1, 1, NULL, NULL),
(4, 'complete', 'Complete', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `VividStoreOrderStatusHistory`
--

DROP TABLE IF EXISTS `VividStoreOrderStatusHistory`;
CREATE TABLE `VividStoreOrderStatusHistory` (
  `oshID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oID` int(11) DEFAULT NULL,
  `oshStatus` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oshDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uID` int(11) DEFAULT NULL,
  PRIMARY KEY (`oshID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `VividStorePaymentMethods`
--

DROP TABLE IF EXISTS `VividStorePaymentMethods`;
CREATE TABLE `VividStorePaymentMethods` (
  `pmID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pmHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pmName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pmDisplayName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pmEnabled` int(11) DEFAULT NULL,
  `pkgID` int(11) DEFAULT NULL,
  PRIMARY KEY (`pmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `VividStoreProduct`
--

DROP TABLE IF EXISTS `VividStoreProduct`;
CREATE TABLE `VividStoreProduct` (
  `pID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gID` int(11) DEFAULT NULL,
  `cID` int(11) DEFAULT NULL,
  `pName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pDesc` longtext COLLATE utf8_unicode_ci,
  `pDetail` longtext COLLATE utf8_unicode_ci,
  `pPrice` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pFeatured` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pQty` int(11) DEFAULT NULL,
  `pQtyUnlim` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pTaxable` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pfID` int(10) unsigned DEFAULT NULL,
  `pActive` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pDateAdded` datetime DEFAULT NULL,
  `pGroup` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pShippable` int(11) DEFAULT NULL,
  `pWidth` int(11) DEFAULT NULL,
  `pHeight` int(11) DEFAULT NULL,
  `pLength` int(11) DEFAULT NULL,
  `pWeight` int(11) DEFAULT NULL,
  PRIMARY KEY (`pID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `VividStoreProduct`
--

INSERT INTO `VividStoreProduct` (`pID`, `gID`, `cID`, `pName`, `pDesc`, `pDetail`, `pPrice`, `pFeatured`, `pQty`, `pQtyUnlim`, `pTaxable`, `pfID`, `pActive`, `pDateAdded`, `pGroup`, `pShippable`, `pWidth`, `pHeight`, `pLength`, `pWeight`) VALUES
(1, 0, 201, 'test', '', '', '0', '0', 996, NULL, '0', 15, '1', '2015-08-05 22:17:20', NULL, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `VividStoreProductAttributeKeys`
--

DROP TABLE IF EXISTS `VividStoreProductAttributeKeys`;
CREATE TABLE `VividStoreProductAttributeKeys` (
  `akID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`akID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `VividStoreProductAttributeValues`
--

DROP TABLE IF EXISTS `VividStoreProductAttributeValues`;
CREATE TABLE `VividStoreProductAttributeValues` (
  `pID` int(10) unsigned NOT NULL,
  `akID` int(10) unsigned NOT NULL,
  `avID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pID`,`akID`,`avID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `VividStoreProductImage`
--

DROP TABLE IF EXISTS `VividStoreProductImage`;
CREATE TABLE `VividStoreProductImage` (
  `piID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pID` int(11) DEFAULT NULL,
  `pifID` int(11) DEFAULT NULL,
  `piSort` int(11) DEFAULT NULL,
  PRIMARY KEY (`piID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `VividStoreProductOptionGroup`
--

DROP TABLE IF EXISTS `VividStoreProductOptionGroup`;
CREATE TABLE `VividStoreProductOptionGroup` (
  `pogID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pID` int(11) DEFAULT NULL,
  `pogName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pogSort` int(11) DEFAULT NULL,
  PRIMARY KEY (`pogID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `VividStoreProductOptionItem`
--

DROP TABLE IF EXISTS `VividStoreProductOptionItem`;
CREATE TABLE `VividStoreProductOptionItem` (
  `poiID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pID` int(11) DEFAULT NULL,
  `pogID` int(11) DEFAULT NULL,
  `poiName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `poiSort` int(11) DEFAULT NULL,
  PRIMARY KEY (`poiID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `VividStoreProductUserGroups`
--

DROP TABLE IF EXISTS `VividStoreProductUserGroups`;
CREATE TABLE `VividStoreProductUserGroups` (
  `pugID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pID` int(11) DEFAULT NULL,
  `gID` int(11) DEFAULT NULL,
  PRIMARY KEY (`pugID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `VividStoreProductUserGroups`
--

INSERT INTO `VividStoreProductUserGroups` (`pugID`, `pID`, `gID`) VALUES
(1, 1, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `WorkflowProgress`
--

DROP TABLE IF EXISTS `WorkflowProgress`;
CREATE TABLE `WorkflowProgress` (
  `wpID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wpCategoryID` int(10) unsigned DEFAULT NULL,
  `wfID` int(10) unsigned NOT NULL DEFAULT '0',
  `wpApproved` tinyint(1) NOT NULL DEFAULT '0',
  `wpDateAdded` datetime DEFAULT NULL,
  `wpDateLastAction` datetime DEFAULT NULL,
  `wpCurrentStatus` int(11) NOT NULL DEFAULT '0',
  `wrID` int(11) NOT NULL DEFAULT '0',
  `wpIsCompleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wpID`),
  KEY `wpCategoryID` (`wpCategoryID`),
  KEY `wfID` (`wfID`),
  KEY `wrID` (`wrID`,`wpID`,`wpIsCompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `WorkflowProgressCategories`
--

DROP TABLE IF EXISTS `WorkflowProgressCategories`;
CREATE TABLE `WorkflowProgressCategories` (
  `wpCategoryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wpCategoryHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`wpCategoryID`),
  UNIQUE KEY `wpCategoryHandle` (`wpCategoryHandle`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `WorkflowProgressCategories`
--

INSERT INTO `WorkflowProgressCategories` (`wpCategoryID`, `wpCategoryHandle`, `pkgID`) VALUES
(1, 'page', NULL),
(2, 'file', NULL),
(3, 'user', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `WorkflowProgressHistory`
--

DROP TABLE IF EXISTS `WorkflowProgressHistory`;
CREATE TABLE `WorkflowProgressHistory` (
  `wphID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wpID` int(10) unsigned NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `object` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`wphID`),
  KEY `wpID` (`wpID`,`timestamp`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=62 ;

--
-- Daten für Tabelle `WorkflowProgressHistory`
--

INSERT INTO `WorkflowProgressHistory` (`wphID`, `wpID`, `timestamp`, `object`) VALUES
(1, 1, '2015-05-02 14:56:44', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"181";s:4:"cvID";s:1:"1";s:4:"wrID";s:1:"1";}'),
(2, 2, '2015-05-02 14:58:40', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"182";s:4:"cvID";s:1:"1";s:4:"wrID";s:1:"2";}'),
(3, 3, '2015-05-02 14:59:35', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"183";s:4:"cvID";s:1:"1";s:4:"wrID";s:1:"3";}'),
(4, 4, '2015-05-02 14:59:52', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"184";s:4:"cvID";s:1:"1";s:4:"wrID";s:1:"4";}'),
(5, 5, '2015-05-02 15:00:15', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"185";s:4:"cvID";s:1:"1";s:4:"wrID";s:1:"5";}'),
(6, 6, '2015-05-02 15:00:35', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"186";s:4:"cvID";s:1:"1";s:4:"wrID";s:1:"6";}'),
(7, 7, '2015-05-02 15:00:48', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"187";s:4:"cvID";s:1:"1";s:4:"wrID";s:1:"7";}'),
(8, 8, '2015-05-02 15:01:07', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"188";s:4:"cvID";s:1:"1";s:4:"wrID";s:1:"8";}'),
(9, 9, '2015-05-02 15:01:25', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"189";s:4:"cvID";s:1:"1";s:4:"wrID";s:1:"9";}'),
(10, 10, '2015-05-02 15:01:42', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"190";s:4:"cvID";s:1:"1";s:4:"wrID";s:2:"10";}'),
(11, 11, '2015-05-02 15:04:07', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"151";s:4:"cvID";s:1:"2";s:4:"wrID";s:2:"11";}'),
(12, 12, '2015-05-02 15:04:52', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"153";s:4:"cvID";s:1:"2";s:4:"wrID";s:2:"12";}'),
(13, 13, '2015-05-02 15:05:21', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"154";s:4:"cvID";s:1:"2";s:4:"wrID";s:2:"13";}'),
(14, 14, '2015-05-02 15:05:34', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"156";s:4:"cvID";s:1:"2";s:4:"wrID";s:2:"14";}'),
(15, 15, '2015-05-02 15:06:17', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"151";s:4:"cvID";s:1:"3";s:4:"wrID";s:2:"15";}'),
(16, 16, '2015-05-02 15:06:31', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"153";s:4:"cvID";s:1:"3";s:4:"wrID";s:2:"16";}'),
(17, 17, '2015-05-02 15:06:43', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"154";s:4:"cvID";s:1:"3";s:4:"wrID";s:2:"17";}'),
(18, 18, '2015-05-02 15:06:59', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"156";s:4:"cvID";s:1:"3";s:4:"wrID";s:2:"18";}'),
(19, 19, '2015-05-02 15:07:29', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"158";s:4:"cvID";s:1:"2";s:4:"wrID";s:2:"19";}'),
(20, 20, '2015-05-02 15:08:50', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"158";s:4:"cvID";s:1:"3";s:4:"wrID";s:2:"20";}'),
(21, 21, '2015-05-02 15:16:07', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"181";s:4:"cvID";s:1:"2";s:4:"wrID";s:2:"21";}'),
(22, 2, '2015-05-03 10:39:43', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"181";s:4:"cvID";s:1:"3";s:4:"wrID";s:1:"2";}'),
(23, 3, '2015-05-04 19:54:43', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"181";s:4:"cvID";s:1:"4";s:4:"wrID";s:1:"3";}'),
(24, 4, '2015-05-04 19:58:13', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"181";s:4:"cvID";s:1:"4";s:4:"wrID";s:1:"4";}'),
(25, 1, '2015-05-11 19:39:25', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"187";s:4:"cvID";s:1:"2";s:4:"wrID";s:1:"1";}'),
(26, 1, '2015-07-30 19:05:05', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:1:"1";s:4:"cvID";s:1:"5";s:4:"wrID";s:1:"1";}'),
(27, 2, '2015-07-30 19:11:49', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"183";s:4:"cvID";s:1:"2";s:4:"wrID";s:1:"2";}'),
(28, 1, '2015-08-05 20:40:31', 'O:59:"Concrete\\Core\\Workflow\\Request\\ChangePagePermissionsRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"11";s:3:"cID";s:1:"1";s:13:"permissionSet";O:28:"Concrete\\Core\\Permission\\Set":2:{s:14:"\0*\0permissions";a:18:{i:1;s:2:"47";i:2;s:2:"48";i:3;s:2:"49";i:4;s:2:"50";i:5;s:2:"51";i:6;s:2:"52";i:7;s:2:"53";i:8;s:2:"55";i:9;s:2:"56";i:10;s:2:"81";i:11;s:2:"57";i:12;s:2:"58";i:13;s:2:"59";i:14;s:2:"60";i:15;s:2:"61";i:16;s:2:"62";i:17;s:2:"63";i:18;s:2:"54";}s:19:"\0*\0pkCategoryHandle";s:4:"page";}s:4:"wrID";s:1:"1";}'),
(29, 2, '2015-08-05 20:41:08', 'O:48:"Concrete\\Core\\Workflow\\Request\\DeletePageRequest":7:{s:14:"\0*\0wrStatusNum";i:100;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:3:"189";s:4:"wrID";s:1:"2";}'),
(30, 3, '2015-08-05 20:54:58', 'O:48:"Concrete\\Core\\Workflow\\Request\\DeletePageRequest":7:{s:14:"\0*\0wrStatusNum";i:100;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:3:"153";s:4:"wrID";s:1:"3";}'),
(31, 4, '2015-08-05 20:55:02', 'O:48:"Concrete\\Core\\Workflow\\Request\\DeletePageRequest":7:{s:14:"\0*\0wrStatusNum";i:100;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:3:"154";s:4:"wrID";s:1:"4";}'),
(32, 5, '2015-08-05 20:55:08', 'O:48:"Concrete\\Core\\Workflow\\Request\\DeletePageRequest":7:{s:14:"\0*\0wrStatusNum";i:100;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:3:"156";s:4:"wrID";s:1:"5";}'),
(33, 6, '2015-08-05 20:55:48', 'O:48:"Concrete\\Core\\Workflow\\Request\\DeletePageRequest":7:{s:14:"\0*\0wrStatusNum";i:100;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:3:"159";s:4:"wrID";s:1:"6";}'),
(34, 7, '2015-08-05 20:56:30', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"208";s:4:"cvID";s:1:"1";s:4:"wrID";s:1:"7";}'),
(35, 8, '2015-08-05 20:57:38', 'O:48:"Concrete\\Core\\Workflow\\Request\\DeletePageRequest":7:{s:14:"\0*\0wrStatusNum";i:100;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:3:"181";s:4:"wrID";s:1:"8";}'),
(36, 9, '2015-08-05 20:57:42', 'O:48:"Concrete\\Core\\Workflow\\Request\\DeletePageRequest":7:{s:14:"\0*\0wrStatusNum";i:100;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:3:"182";s:4:"wrID";s:1:"9";}'),
(37, 10, '2015-08-05 20:57:46', 'O:48:"Concrete\\Core\\Workflow\\Request\\DeletePageRequest":7:{s:14:"\0*\0wrStatusNum";i:100;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"12";s:3:"cID";s:3:"183";s:4:"wrID";s:2:"10";}'),
(38, 11, '2015-08-05 20:59:05', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"209";s:4:"cvID";s:1:"1";s:4:"wrID";s:2:"11";}'),
(39, 12, '2015-08-05 20:59:19', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"210";s:4:"cvID";s:1:"1";s:4:"wrID";s:2:"12";}'),
(40, 13, '2015-08-05 20:59:31', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"211";s:4:"cvID";s:1:"1";s:4:"wrID";s:2:"13";}'),
(41, 14, '2015-08-05 21:00:03', 'O:70:"Concrete\\Core\\Workflow\\Request\\ChangeSubpageDefaultsInheritanceRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"11";s:3:"cID";s:3:"190";s:11:"inheritance";s:1:"0";s:4:"wrID";s:2:"14";}'),
(42, 15, '2015-08-05 21:00:25', 'O:70:"Concrete\\Core\\Workflow\\Request\\ChangePagePermissionsInheritanceRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"11";s:3:"cID";s:3:"190";s:11:"inheritance";s:8:"OVERRIDE";s:4:"wrID";s:2:"15";}'),
(43, 16, '2015-08-05 21:00:58', 'O:59:"Concrete\\Core\\Workflow\\Request\\ChangePagePermissionsRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"11";s:3:"cID";s:3:"190";s:13:"permissionSet";O:28:"Concrete\\Core\\Permission\\Set":2:{s:14:"\0*\0permissions";a:18:{i:1;s:2:"82";i:2;s:2:"48";i:3;s:2:"49";i:4;s:2:"50";i:5;s:2:"51";i:6;s:2:"52";i:7;s:2:"53";i:8;s:2:"55";i:9;s:2:"56";i:10;s:2:"81";i:11;s:2:"57";i:12;s:2:"58";i:13;s:2:"59";i:14;s:2:"60";i:15;s:2:"61";i:16;s:2:"62";i:17;s:2:"63";i:18;s:2:"54";}s:19:"\0*\0pkCategoryHandle";s:4:"page";}s:4:"wrID";s:2:"16";}'),
(44, 17, '2015-08-05 21:11:35', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"190";s:4:"cvID";s:1:"2";s:4:"wrID";s:2:"17";}'),
(45, 18, '2015-08-06 18:06:42', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:1:"1";s:4:"cvID";s:1:"6";s:4:"wrID";s:2:"18";}'),
(46, 1, '2015-08-12 17:28:57', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"208";s:4:"cvID";s:1:"2";s:4:"wrID";s:1:"1";}'),
(47, 2, '2015-08-13 19:15:27', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"208";s:4:"cvID";s:1:"3";s:4:"wrID";s:1:"2";}'),
(48, 1, '2015-08-19 19:50:37', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"209";s:4:"cvID";s:1:"2";s:4:"wrID";s:1:"1";}'),
(49, 1, '2015-08-20 17:59:41', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"209";s:4:"cvID";s:1:"3";s:4:"wrID";s:1:"1";}'),
(50, 2, '2015-08-20 18:02:14', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:1:"1";s:4:"cvID";s:1:"7";s:4:"wrID";s:1:"2";}'),
(51, 3, '2015-08-20 18:36:01', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"210";s:4:"cvID";s:1:"2";s:4:"wrID";s:1:"3";}'),
(52, 4, '2015-08-20 20:20:12', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:1:"1";s:4:"cvID";s:1:"8";s:4:"wrID";s:1:"4";}'),
(53, 5, '2015-08-20 20:22:20', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"208";s:4:"cvID";s:1:"4";s:4:"wrID";s:1:"5";}'),
(54, 6, '2015-08-20 20:22:57', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"208";s:4:"cvID";s:1:"5";s:4:"wrID";s:1:"6";}'),
(55, 7, '2015-08-20 20:24:39', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:1:"1";s:4:"cvID";s:1:"9";s:4:"wrID";s:1:"7";}'),
(56, 8, '2015-08-20 20:28:58', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:1:"1";s:4:"cvID";s:2:"10";s:4:"wrID";s:1:"8";}'),
(57, 9, '2015-08-20 20:29:42', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"186";s:4:"cvID";s:1:"2";s:4:"wrID";s:1:"9";}'),
(58, 1, '2015-10-08 20:27:55', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"212";s:4:"cvID";s:1:"1";s:4:"wrID";s:1:"1";}'),
(59, 2, '2015-10-08 20:28:48', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"212";s:4:"cvID";s:1:"2";s:4:"wrID";s:1:"2";}'),
(60, 3, '2015-10-08 20:58:45', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"213";s:4:"cvID";s:1:"1";s:4:"wrID";s:1:"3";}'),
(61, 4, '2015-10-08 20:59:08', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":8:{s:14:"\0*\0wrStatusNum";i:30;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"213";s:4:"cvID";s:1:"2";s:4:"wrID";s:1:"4";}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `WorkflowRequestObjects`
--

DROP TABLE IF EXISTS `WorkflowRequestObjects`;
CREATE TABLE `WorkflowRequestObjects` (
  `wrID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wrObject` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`wrID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Workflows`
--

DROP TABLE IF EXISTS `Workflows`;
CREATE TABLE `Workflows` (
  `wfID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wfName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wftID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`wfID`),
  UNIQUE KEY `wfName` (`wfName`),
  KEY `wftID` (`wftID`,`wfID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `WorkflowTypes`
--

DROP TABLE IF EXISTS `WorkflowTypes`;
CREATE TABLE `WorkflowTypes` (
  `wftID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wftHandle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `wftName` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`wftID`),
  UNIQUE KEY `wftHandle` (`wftHandle`),
  KEY `pkgID` (`pkgID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `WorkflowTypes`
--

INSERT INTO `WorkflowTypes` (`wftID`, `wftHandle`, `wftName`, `pkgID`) VALUES
(1, 'basic', 'Basic Workflow', 0);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `QueueMessages`
--
ALTER TABLE `QueueMessages`
  ADD CONSTRAINT `QueueMessages_ibfk_1` FOREIGN KEY (`queue_id`) REFERENCES `Queues` (`queue_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
