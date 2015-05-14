-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 14. Mai 2015 um 19:13
-- Server Version: 5.6.21
-- PHP-Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `key-manager`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `person`
--

CREATE TABLE IF NOT EXISTS `person` (
`pid` int(10) NOT NULL,
  `first_name` varchar(250) DEFAULT NULL,
  `last_name` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `person`
--

INSERT INTO `person` (`pid`, `first_name`, `last_name`) VALUES
(1, 'Marvin', 'Schmidt');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `raueme`
--

CREATE TABLE IF NOT EXISTS `raueme` (
`rid` int(10) NOT NULL,
  `raumname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `raueme`
--

INSERT INTO `raueme` (`rid`, `raumname`) VALUES
(1, '215');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `schluessel`
--

CREATE TABLE IF NOT EXISTS `schluessel` (
`sid` int(10) NOT NULL,
  `schluesselNr` int(10) DEFAULT NULL,
  `bestand` int(10) DEFAULT NULL,
  `faerbung` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `schluessel`
--

INSERT INTO `schluessel` (`sid`, `schluesselNr`, `bestand`, `faerbung`) VALUES
(1, 1, 100, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `schluesselpasstzuzylinder`
--

CREATE TABLE IF NOT EXISTS `schluesselpasstzuzylinder` (
`szid` int(10) NOT NULL,
  `zid` int(10) DEFAULT NULL,
  `sid` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `schluesselpasstzuzylinder`
--

INSERT INTO `schluesselpasstzuzylinder` (`szid`, `zid`, `sid`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_account`
--

CREATE TABLE IF NOT EXISTS `user_account` (
`uid` int(10) NOT NULL,
  `pid` int(10) DEFAULT NULL,
  `username` varchar(250) DEFAULT NULL,
  `pw` varchar(250) DEFAULT NULL,
  `privilege` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vergabevonschluesseln`
--

CREATE TABLE IF NOT EXISTS `vergabevonschluesseln` (
`vid` int(10) NOT NULL,
  `sid` int(10) DEFAULT NULL,
  `pid` int(10) DEFAULT NULL,
  `ausgabe_datum` date DEFAULT NULL,
  `rueckgabe_datum` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `vergabevonschluesseln`
--

INSERT INTO `vergabevonschluesseln` (`vid`, `sid`, `pid`, `ausgabe_datum`, `rueckgabe_datum`) VALUES
(1, 1, 1, '2000-01-01', '2015-01-01');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zylinder`
--

CREATE TABLE IF NOT EXISTS `zylinder` (
`zid` int(10) NOT NULL,
  `bezeichnung` varchar(50) DEFAULT NULL,
  `bestand` int(10) DEFAULT NULL,
  `typ` varchar(10) DEFAULT NULL,
  `laengeInnen` int(10) DEFAULT NULL,
  `laengeAussen` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `zylinder`
--

INSERT INTO `zylinder` (`zid`, `bezeichnung`, `bestand`, `typ`, `laengeInnen`, `laengeAussen`) VALUES
(1, 'bla', 10, '2', 10, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zylinderwechsel`
--

CREATE TABLE IF NOT EXISTS `zylinderwechsel` (
`zwid` int(10) NOT NULL,
  `rid` int(10) DEFAULT NULL,
  `zid` int(10) DEFAULT NULL,
  `einbau_datum` date DEFAULT NULL,
  `ausbau_datum` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `zylinderwechsel`
--

INSERT INTO `zylinderwechsel` (`zwid`, `rid`, `zid`, `einbau_datum`, `ausbau_datum`) VALUES
(1, 1, 1, '2000-01-01', '2015-01-01');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `person`
--
ALTER TABLE `person`
 ADD PRIMARY KEY (`pid`);

--
-- Indizes für die Tabelle `raueme`
--
ALTER TABLE `raueme`
 ADD PRIMARY KEY (`rid`);

--
-- Indizes für die Tabelle `schluessel`
--
ALTER TABLE `schluessel`
 ADD PRIMARY KEY (`sid`);

--
-- Indizes für die Tabelle `schluesselpasstzuzylinder`
--
ALTER TABLE `schluesselpasstzuzylinder`
 ADD PRIMARY KEY (`szid`), ADD KEY `zid` (`zid`), ADD KEY `sid` (`sid`);

--
-- Indizes für die Tabelle `user_account`
--
ALTER TABLE `user_account`
 ADD PRIMARY KEY (`uid`), ADD KEY `pid` (`pid`);

--
-- Indizes für die Tabelle `vergabevonschluesseln`
--
ALTER TABLE `vergabevonschluesseln`
 ADD PRIMARY KEY (`vid`), ADD KEY `pid` (`pid`), ADD KEY `sid` (`sid`);

--
-- Indizes für die Tabelle `zylinder`
--
ALTER TABLE `zylinder`
 ADD PRIMARY KEY (`zid`);

--
-- Indizes für die Tabelle `zylinderwechsel`
--
ALTER TABLE `zylinderwechsel`
 ADD PRIMARY KEY (`zwid`), ADD KEY `rid` (`rid`), ADD KEY `zid` (`zid`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `person`
--
ALTER TABLE `person`
MODIFY `pid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `raueme`
--
ALTER TABLE `raueme`
MODIFY `rid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `schluessel`
--
ALTER TABLE `schluessel`
MODIFY `sid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `schluesselpasstzuzylinder`
--
ALTER TABLE `schluesselpasstzuzylinder`
MODIFY `szid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `user_account`
--
ALTER TABLE `user_account`
MODIFY `uid` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `vergabevonschluesseln`
--
ALTER TABLE `vergabevonschluesseln`
MODIFY `vid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `zylinder`
--
ALTER TABLE `zylinder`
MODIFY `zid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `zylinderwechsel`
--
ALTER TABLE `zylinderwechsel`
MODIFY `zwid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `schluesselpasstzuzylinder`
--
ALTER TABLE `schluesselpasstzuzylinder`
ADD CONSTRAINT `schluesselpasstzuzylinder_ibfk_1` FOREIGN KEY (`zid`) REFERENCES `zylinder` (`zid`) ON DELETE CASCADE,
ADD CONSTRAINT `schluesselpasstzuzylinder_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `schluessel` (`sid`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `user_account`
--
ALTER TABLE `user_account`
ADD CONSTRAINT `user_account_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `person` (`pid`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `vergabevonschluesseln`
--
ALTER TABLE `vergabevonschluesseln`
ADD CONSTRAINT `vergabevonschluesseln_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `person` (`pid`) ON DELETE CASCADE,
ADD CONSTRAINT `vergabevonschluesseln_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `schluessel` (`sid`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `zylinderwechsel`
--
ALTER TABLE `zylinderwechsel`
ADD CONSTRAINT `zylinderwechsel_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `raueme` (`rid`) ON DELETE CASCADE,
ADD CONSTRAINT `zylinderwechsel_ibfk_2` FOREIGN KEY (`zid`) REFERENCES `zylinder` (`zid`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
