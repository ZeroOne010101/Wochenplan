-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 06. Apr 2022 um 14:48
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

--
-- Daten für Tabelle `beilagen`
--

INSERT INTO `beilagen` (`Name`) VALUES
('Apfelmus'),
('Blaukraut'),
('Bratensoße'),
('Brot'),
('Brühe'),
('Bunter Salat'),
('Buttergemüse'),
('Grüner Salat'),
('Kaisergemüse'),
('Kartoffeln'),
('Kartoffelsalat'),
('Ketchup'),
('Kroketten'),
('Pommes'),
('Reis'),
('Semmelknödel'),
('Tomatensoße'),
('Vanillesoße');

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

--
-- Daten für Tabelle `gericht`
--

INSERT INTO `gericht` (`Name`, `Beschreibung`, `Link`) VALUES
('Bauerntopf', 'Ganz viel Hackfleisch, Paprika und Kartoffeln – genial!', 'https://www.daskochrezept.de/rezepte/bauerntopf-mit-hackfleisch-nach-omas-rezept'),
('Cheeseburger', 'Burger mit Fleisch und Käse', 'https://www.daskochrezept.de/rezepte/cheeseburger'),
('Chicken-Nuggets', 'Knusprige Hähnchenstückchen mit Cornflakes-Panade', 'https://www.daskochrezept.de/rezepte/chicken-nuggets-selber-machen'),
('Dampfnudeln', 'gebratene und gedämpfte Hefeklöße.', 'https://www.daskochrezept.de/rezepte/dampfnudeln'),
('Gnocchis', 'Eiförmige, spätzleähnliche Teiglinge', 'https://www.daskochrezept.de/rezepte/grundrezept-gnocchi'),
('Gulasch', 'zartes Schweinegulasch mit herrlich viel Soße.', 'https://www.daskochrezept.de/rezepte/schweinegulasch'),
('Gyros', 'Gericht aus am Drehspieß gebratenem, gewürztem Fleisch', 'https://www.daskochrezept.de/rezepte/gyros'),
('Hot Dog', 'Würstchen im Brötchen', 'https://www.daskochrezept.de/rezepte/hot-dogs'),
('Kaiserschmarrn', 'Österreichische Süßspeise. Dicker gehackter Pfannkuchen.', 'https://www.daskochrezept.de/rezepte/tiroler-kaiserschmarrn-das-einfache-original-rezept'),
('Lachs', 'Gebratenes Seelachsfilet', 'https://www.daskochrezept.de/rezepte/gebratenes-seelachsfilet'),
('Maultaschen', 'Gefüllte Taschen aus Nudelteig', 'https://www.daskochrezept.de/rezepte/maultaschen-0'),
('Schnitzel', 'Schnitzel Wiener Art (Schwein)', 'https://www.daskochrezept.de/rezepte/paniertes-schnitzel-wiener-art'),
('Schweinebraten', 'Zarter, saftiger Schweinebraten.', 'https://www.daskochrezept.de/rezepte/schweinebraten-0');

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
-- Daten für Tabelle `zutaten`
--

INSERT INTO `zutaten` (`id`, `Name`) VALUES
(1, 'Zucker'),
(2, 'Salz'),
(3, 'Mehl'),
(4, 'Milch'),
(5, 'Sahne'),
(6, 'Dosentomaten'),
(7, 'Brühpulver'),
(8, 'Reis'),
(9, 'Apfelmus'),
(10, 'Vanillesoße (Tütenpulver)'),
(11, 'TK Kaisergemüse'),
(12, 'TK Buttergemüse'),
(13, 'TK Kroketten'),
(14, 'Senf'),
(15, 'Pfeffer'),
(16, 'Paprika'),
(17, 'Paprika edelsüß'),
(18, 'Eisbergsalat'),
(19, 'Karotte'),
(20, 'Schnittlauch'),
(21, 'Petersilie'),
(22, 'Hackfleisch'),
(23, 'Schweinefleisch von der Nuss'),
(24, 'Rosinen'),
(25, 'Puderzucker'),
(26, 'Sauerkraut'),
(27, 'Röstzwiebeln'),
(28, 'Tomatenmark'),
(29, 'Butterschmalz'),
(30, 'Majoran'),
(31, 'Spinat'),
(32, 'Speck'),
(33, 'Nudelteig'),
(34, 'Zwiebeln'),
(35, 'Tomate'),
(36, 'Schmelzkäse'),
(37, 'Burgerbrötchen'),
(38, 'Speiseöl'),
(39, 'Cornflakes'),
(40, 'gehobelte Mandeln'),
(41, 'Vanillezucker'),
(42, 'Gurke'),
(43, 'Remoulade'),
(44, 'Würstchen (rot)'),
(45, 'Hot-Dog-Brötchen'),
(46, 'Knollensellerie'),
(47, 'Knoblauchzehe'),
(48, 'Lorbeerblatt'),
(49, 'Butter'),
(50, 'Wasser'),
(51, 'Kräuter der Provence'),
(52, 'Kümmel'),
(53, 'Cayennepfeffer'),
(54, 'Ei');

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
