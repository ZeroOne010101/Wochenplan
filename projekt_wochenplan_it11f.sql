-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 06. Apr 2022 um 11:38
-- Server-Version: 10.4.21-MariaDB
-- PHP-Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `projekt_wochenplan_it11f`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `beilagen`
--

CREATE TABLE `beilagen` (
  `Name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `beilagen_zutaten`
--

CREATE TABLE `beilagen_zutaten` (
  `Beilagen_Name` varchar(80) DEFAULT NULL,
  `Zutaten_id` int(11) DEFAULT NULL,
  `Menge` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gericht`
--

CREATE TABLE `gericht` (
  `Name` varchar(80) NOT NULL,
  `Beschreibung` varchar(380) DEFAULT NULL,
  `Link` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gericht_beilagen`
--

CREATE TABLE `gericht_beilagen` (
  `Gericht_Name` varchar(80) DEFAULT NULL,
  `Beilagen_Name` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gericht_zutaten`
--

CREATE TABLE `gericht_zutaten` (
  `Gericht_Name` varchar(80) DEFAULT NULL,
  `Zutaten_id` int(11) DEFAULT NULL,
  `Menge` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wochenplan`
--

CREATE TABLE `wochenplan` (
  `tag` int(11) NOT NULL,
  `Gericht` varchar(80) DEFAULT NULL,
  `Beilage` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zutaten`
--

CREATE TABLE `zutaten` (
  `id` int(11) NOT NULL,
  `Name` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `beilagen`
--
ALTER TABLE `beilagen`
  ADD PRIMARY KEY (`Name`);

--
-- Indizes für die Tabelle `beilagen_zutaten`
--
ALTER TABLE `beilagen_zutaten`
  ADD KEY `Zutaten_id` (`Zutaten_id`),
  ADD KEY `Beilagen_Name` (`Beilagen_Name`);

--
-- Indizes für die Tabelle `gericht`
--
ALTER TABLE `gericht`
  ADD PRIMARY KEY (`Name`);

--
-- Indizes für die Tabelle `gericht_beilagen`
--
ALTER TABLE `gericht_beilagen`
  ADD KEY `Gericht_Name` (`Gericht_Name`),
  ADD KEY `Beilagen_Name` (`Beilagen_Name`);

--
-- Indizes für die Tabelle `gericht_zutaten`
--
ALTER TABLE `gericht_zutaten`
  ADD KEY `Zutaten_id` (`Zutaten_id`),
  ADD KEY `Gericht_Name` (`Gericht_Name`);

--
-- Indizes für die Tabelle `wochenplan`
--
ALTER TABLE `wochenplan`
  ADD PRIMARY KEY (`tag`),
  ADD KEY `Gericht` (`Gericht`),
  ADD KEY `Beilage` (`Beilage`);

--
-- Indizes für die Tabelle `zutaten`
--
ALTER TABLE `zutaten`
  ADD PRIMARY KEY (`id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `beilagen_zutaten`
--
ALTER TABLE `beilagen_zutaten`
  ADD CONSTRAINT `beilagen_zutaten_ibfk_1` FOREIGN KEY (`Zutaten_id`) REFERENCES `zutaten` (`id`),
  ADD CONSTRAINT `beilagen_zutaten_ibfk_2` FOREIGN KEY (`Beilagen_Name`) REFERENCES `beilagen` (`Name`);

--
-- Constraints der Tabelle `gericht_beilagen`
--
ALTER TABLE `gericht_beilagen`
  ADD CONSTRAINT `gericht_beilagen_ibfk_1` FOREIGN KEY (`Gericht_Name`) REFERENCES `gericht` (`Name`),
  ADD CONSTRAINT `gericht_beilagen_ibfk_2` FOREIGN KEY (`Beilagen_Name`) REFERENCES `beilagen` (`Name`);

--
-- Constraints der Tabelle `gericht_zutaten`
--
ALTER TABLE `gericht_zutaten`
  ADD CONSTRAINT `gericht_zutaten_ibfk_1` FOREIGN KEY (`Zutaten_id`) REFERENCES `zutaten` (`id`),
  ADD CONSTRAINT `gericht_zutaten_ibfk_2` FOREIGN KEY (`Gericht_Name`) REFERENCES `gericht` (`Name`);

--
-- Constraints der Tabelle `wochenplan`
--
ALTER TABLE `wochenplan`
  ADD CONSTRAINT `wochenplan_ibfk_1` FOREIGN KEY (`Gericht`) REFERENCES `gericht` (`Name`),
  ADD CONSTRAINT `wochenplan_ibfk_2` FOREIGN KEY (`Beilage`) REFERENCES `beilagen` (`Name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
