-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-10-2024 a las 17:07:43
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pokedex`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pokemon`
--

CREATE TABLE `pokemon` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `base_experience` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `types` varchar(100) DEFAULT NULL,
  `captured` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pokemon`
--

INSERT INTO `pokemon` (`id`, `name`, `base_experience`, `height`, `weight`, `types`, `captured`) VALUES
(1, 'bulbasaur', 64, 7, 69, 'grass, poison', 1),
(2, 'ivysaur', 142, 10, 130, 'grass, poison', 0),
(3, 'venusaur', 263, 20, 1000, 'grass, poison', 0),
(4, 'charmander', 62, 6, 85, 'fire', 0),
(5, 'charmeleon', 142, 11, 190, 'fire', 0),
(6, 'charizard', 267, 17, 905, 'fire, flying', 0),
(7, 'squirtle', 63, 5, 90, 'water', 0),
(8, 'wartortle', 142, 10, 225, 'water', 0),
(9, 'blastoise', 265, 16, 855, 'water', 0),
(10, 'caterpie', 39, 3, 29, 'bug', 0),
(11, 'metapod', 72, 7, 99, 'bug', 0),
(12, 'butterfree', 198, 11, 320, 'bug, flying', 0),
(13, 'weedle', 39, 3, 32, 'bug, poison', 0),
(14, 'kakuna', 72, 6, 100, 'bug, poison', 0),
(15, 'beedrill', 178, 10, 295, 'bug, poison', 0),
(16, 'pidgey', 50, 3, 18, 'normal, flying', 0),
(17, 'pidgeotto', 122, 11, 300, 'normal, flying', 0),
(18, 'pidgeot', 216, 15, 395, 'normal, flying', 0),
(19, 'rattata', 51, 3, 35, 'normal', 0),
(20, 'raticate', 145, 7, 185, 'normal', 0),
(21, 'spearow', 52, 3, 20, 'normal, flying', 0),
(22, 'fearow', 155, 12, 380, 'normal, flying', 0),
(23, 'ekans', 58, 20, 69, 'poison', 1),
(24, 'arbok', 157, 35, 650, 'poison', 0),
(25, 'pikachu', 112, 4, 60, 'electric', 1),
(26, 'raichu', 243, 8, 300, 'electric', 0),
(27, 'sandshrew', 60, 6, 120, 'ground', 0),
(28, 'sandslash', 158, 10, 295, 'ground', 0),
(29, 'nidoran-f', 55, 4, 70, 'poison', 0),
(30, 'nidorina', 128, 8, 200, 'poison', 0),
(31, 'nidoqueen', 253, 13, 600, 'poison, ground', 0),
(32, 'nidoran-m', 55, 5, 90, 'poison', 0),
(33, 'nidorino', 128, 9, 195, 'poison', 0),
(34, 'nidoking', 253, 14, 620, 'poison, ground', 0),
(35, 'clefairy', 113, 6, 75, 'fairy', 0),
(36, 'clefable', 242, 13, 400, 'fairy', 0),
(37, 'vulpix', 60, 6, 99, 'fire', 0),
(38, 'ninetales', 177, 11, 199, 'fire', 0),
(39, 'jigglypuff', 95, 5, 55, 'normal, fairy', 0),
(40, 'wigglytuff', 218, 10, 120, 'normal, fairy', 0),
(41, 'zubat', 49, 8, 75, 'poison, flying', 0),
(42, 'golbat', 159, 16, 550, 'poison, flying', 0),
(43, 'oddish', 64, 5, 54, 'grass, poison', 0),
(44, 'gloom', 138, 8, 86, 'grass, poison', 0),
(45, 'vileplume', 245, 12, 186, 'grass, poison', 0),
(46, 'paras', 57, 3, 54, 'bug, grass', 0),
(47, 'parasect', 142, 10, 295, 'bug, grass', 0),
(48, 'venonat', 61, 10, 300, 'bug, poison', 0),
(49, 'venomoth', 158, 15, 125, 'bug, poison', 0),
(50, 'diglett', 53, 2, 8, 'ground', 0),
(51, 'dugtrio', 149, 7, 333, 'ground', 0),
(52, 'meowth', 58, 4, 42, 'normal', 0),
(53, 'persian', 154, 10, 320, 'normal', 0),
(54, 'psyduck', 64, 8, 196, 'water', 1),
(55, 'golduck', 175, 17, 766, 'water', 0),
(56, 'mankey', 61, 5, 280, 'fighting', 0),
(57, 'primeape', 159, 10, 320, 'fighting', 0),
(58, 'growlithe', 70, 7, 190, 'fire', 0),
(59, 'arcanine', 194, 19, 1550, 'fire', 0),
(60, 'poliwag', 60, 6, 124, 'water', 0),
(61, 'poliwhirl', 135, 10, 200, 'water', 0),
(62, 'poliwrath', 255, 13, 540, 'water, fighting', 0),
(63, 'abra', 62, 9, 195, 'psychic', 0),
(64, 'kadabra', 140, 13, 565, 'psychic', 0),
(65, 'alakazam', 250, 15, 480, 'psychic', 0),
(66, 'machop', 61, 8, 195, 'fighting', 0),
(67, 'machoke', 142, 15, 705, 'fighting', 0),
(68, 'machamp', 253, 16, 1300, 'fighting', 0),
(69, 'bellsprout', 60, 7, 40, 'grass, poison', 0),
(70, 'weepinbell', 137, 10, 64, 'grass, poison', 0),
(71, 'victreebel', 221, 17, 155, 'grass, poison', 0),
(72, 'tentacool', 67, 9, 455, 'water, poison', 0),
(73, 'tentacruel', 180, 16, 550, 'water, poison', 0),
(74, 'geodude', 60, 4, 200, 'rock, ground', 0),
(75, 'graveler', 137, 10, 1050, 'rock, ground', 0),
(76, 'golem', 223, 14, 3000, 'rock, ground', 0),
(77, 'ponyta', 82, 10, 300, 'fire', 1),
(78, 'rapidash', 175, 17, 950, 'fire', 0),
(79, 'slowpoke', 63, 12, 360, 'water, psychic', 0),
(80, 'slowbro', 172, 16, 785, 'water, psychic', 0),
(81, 'magnemite', 65, 3, 60, 'electric, steel', 0),
(82, 'magneton', 163, 10, 600, 'electric, steel', 0),
(83, 'farfetchd', 132, 8, 150, 'normal, flying', 0),
(84, 'doduo', 62, 14, 392, 'normal, flying', 0),
(85, 'dodrio', 165, 18, 852, 'normal, flying', 0),
(86, 'seel', 65, 11, 900, 'water', 0),
(87, 'dewgong', 166, 17, 1200, 'water, ice', 0),
(88, 'grimer', 65, 9, 300, 'poison', 0),
(89, 'muk', 175, 12, 300, 'poison', 0),
(90, 'shellder', 61, 3, 40, 'water', 0),
(91, 'cloyster', 184, 15, 1325, 'water, ice', 0),
(92, 'gastly', 62, 13, 1, 'ghost, poison', 0),
(93, 'haunter', 142, 16, 1, 'ghost, poison', 0),
(94, 'gengar', 250, 15, 405, 'ghost, poison', 0),
(95, 'onix', 77, 88, 2100, 'rock, ground', 0),
(96, 'drowzee', 66, 10, 324, 'psychic', 0),
(97, 'hypno', 169, 16, 756, 'psychic', 0),
(98, 'krabby', 65, 4, 65, 'water', 0),
(99, 'kingler', 166, 13, 600, 'water', 0),
(100, 'voltorb', 66, 5, 104, 'electric', 1),
(101, 'electrode', 172, 12, 666, 'electric', 0),
(102, 'exeggcute', 65, 4, 25, 'grass, psychic', 0),
(103, 'exeggutor', 186, 20, 1200, 'grass, psychic', 0),
(104, 'cubone', 64, 4, 65, 'ground', 0),
(105, 'marowak', 149, 10, 450, 'ground', 0),
(106, 'hitmonlee', 159, 15, 498, 'fighting', 0),
(107, 'hitmonchan', 159, 14, 502, 'fighting', 0),
(108, 'lickitung', 77, 12, 655, 'normal', 0),
(109, 'koffing', 68, 6, 10, 'poison', 0),
(110, 'weezing', 172, 12, 95, 'poison', 0),
(111, 'rhyhorn', 69, 10, 1150, 'ground, rock', 0),
(112, 'rhydon', 170, 19, 1200, 'ground, rock', 0),
(113, 'chansey', 395, 11, 346, 'normal', 0),
(114, 'tangela', 87, 10, 350, 'grass', 0),
(115, 'kangaskhan', 172, 22, 800, 'normal', 0),
(116, 'horsea', 59, 4, 80, 'water', 0),
(117, 'seadra', 154, 12, 250, 'water', 0),
(118, 'goldeen', 64, 6, 150, 'water', 0),
(119, 'seaking', 158, 13, 390, 'water', 0),
(120, 'staryu', 68, 8, 345, 'water', 0),
(121, 'starmie', 182, 11, 800, 'water, psychic', 0),
(122, 'mr-mime', 161, 13, 545, 'psychic, fairy', 0),
(123, 'scyther', 100, 15, 560, 'bug, flying', 0),
(124, 'jynx', 159, 14, 406, 'ice, psychic', 0),
(125, 'electabuzz', 172, 11, 300, 'electric', 0),
(126, 'magmar', 173, 13, 445, 'fire', 0),
(127, 'pinsir', 175, 15, 550, 'bug', 0),
(128, 'tauros', 172, 14, 884, 'normal', 0),
(129, 'magikarp', 40, 9, 100, 'water', 0),
(130, 'gyarados', 189, 65, 2350, 'water, flying', 0),
(131, 'lapras', 187, 25, 2200, 'water, ice', 0),
(132, 'ditto', 101, 3, 40, 'normal', 0),
(133, 'eevee', 65, 3, 65, 'normal', 0),
(134, 'vaporeon', 184, 10, 290, 'water', 0),
(135, 'jolteon', 184, 8, 245, 'electric', 0),
(136, 'flareon', 184, 9, 250, 'fire', 0),
(137, 'porygon', 79, 8, 365, 'normal', 0),
(138, 'omanyte', 71, 4, 75, 'rock, water', 0),
(139, 'omastar', 173, 10, 350, 'rock, water', 0),
(140, 'kabuto', 71, 5, 115, 'rock, water', 0),
(141, 'kabutops', 173, 13, 405, 'rock, water', 0),
(142, 'aerodactyl', 180, 18, 590, 'rock, flying', 0),
(143, 'snorlax', 189, 21, 4600, 'normal', 0),
(144, 'articuno', 290, 17, 554, 'ice, flying', 0),
(145, 'zapdos', 290, 16, 526, 'electric, flying', 0),
(146, 'moltres', 290, 20, 600, 'fire, flying', 0),
(147, 'dratini', 60, 18, 33, 'dragon', 0),
(148, 'dragonair', 147, 40, 165, 'dragon', 0),
(149, 'dragonite', 300, 22, 2100, 'dragon, flying', 0),
(150, 'mewtwo', 340, 20, 1220, 'psychic', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pokemon`
--
ALTER TABLE `pokemon`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
