-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28/12/2024 às 20:02
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `otserv`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `password` text NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `created` int(11) NOT NULL DEFAULT 0,
  `rlname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(3) NOT NULL DEFAULT '',
  `web_lastlogin` int(11) NOT NULL DEFAULT 0,
  `web_flags` int(11) NOT NULL DEFAULT 0,
  `email_hash` varchar(32) NOT NULL DEFAULT '',
  `email_new` varchar(255) NOT NULL DEFAULT '',
  `email_new_time` int(11) NOT NULL DEFAULT 0,
  `email_code` varchar(255) NOT NULL DEFAULT '',
  `email_next` int(11) NOT NULL DEFAULT 0,
  `email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `phone` varchar(15) DEFAULT NULL,
  `key` varchar(64) NOT NULL DEFAULT '',
  `premdays` int(11) NOT NULL DEFAULT 0,
  `premdays_purchased` int(11) NOT NULL DEFAULT 0,
  `lastday` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `coins` int(12) UNSIGNED NOT NULL DEFAULT 0,
  `coins_transferable` int(12) UNSIGNED NOT NULL DEFAULT 0,
  `tournament_coins` int(12) UNSIGNED NOT NULL DEFAULT 0,
  `creation` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `recruiter` int(6) DEFAULT 0,
  `vote` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `email`, `created`, `rlname`, `location`, `country`, `web_lastlogin`, `web_flags`, `email_hash`, `email_new`, `email_new_time`, `email_code`, `email_next`, `email_verified`, `phone`, `key`, `premdays`, `premdays_purchased`, `lastday`, `type`, `coins`, `coins_transferable`, `tournament_coins`, `creation`, `recruiter`, `vote`) VALUES
(1, '4966348', '9f41b3fd81b703bed92746327bf36ac63906aac9', '@4966348', 0, '', '', 'br', 1735397865, 3, '', '', 0, '', 0, 0, '', 'XZ268AYSF7LXV8Q', 0, 0, 0, 5, 0, 5000, 0, 1724856320, 0, 0),
(2, 'andreoam', '4124129c5e7d5eabb9734d4bf45b2a1795d80409', 'andreoam@gmail.com', 1724856389, 'andre', 'rua a', 'br', 1735412321, 3, '03bf2bd05ab2231736ce2bb405d608d4', '', 0, '', 0, 1, '11981049632', 'XZ268AYSF7LXV8Q', 296, 360, 1760969197, 6, 1000, 4000, 0, 1724894604, 0, 0),
(5, '7956292', 'b27e43d8500e4d286e645a4d7ab2771786f2c62e', 'paulozebu2022@gmail.com', 0, '0', '0', '0', 0, 0, '0', '0', 0, '0', 0, 0, '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 'samike', 'fafd163b53a2f1d37554ff706b0b083c395cecaf', 'cadissraiziel@outlook.es', 0, '0', '0', '0', 0, 0, '0', '0', 0, '0', 0, 0, '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20, 'alyssongg', '6f37fe6002858e97f69cdba33cec42f0dec545ad', 'alyssonrarengenharia@gmail.com', 0, '0', '0', '0', 0, 0, '0', '0', 0, '0', 0, 0, '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(23, 'magnorod', '2c89a9545cde42cbe93ced2d94a2ca3bd22d2d9a', 'magnorodriguesp.adv@gmail.com', 0, '0', '0', '0', 0, 0, '0', '0', 0, '0', 0, 0, '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(25, '7858905', '52df816dfd70d6270a9b7898e3b7f6b477d40c87', 'phelipe.itap@gmail.com', 0, '0', '0', '0', 0, 0, '0', '0', 0, '0', 0, 0, '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(27, 'glatharth', 'b44cee3666c215457b6a76dbc9ebbf9ad6455678', 'phlinho10@gmail.com', 0, '0', '0', '0', 0, 0, '0', '0', 0, '0', 0, 0, '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(30, '78589055', '52df816dfd70d6270a9b7898e3b7f6b477d40c87', 'phelipe.itapp@gmail.com', 0, '0', '0', '0', 0, 0, '0', '0', 0, '0', 0, 0, '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(31, 'scorpion1', 'dfaa95c7ef7b435d9f4aa93b82826408d5e674eb', 'jof@hotmail.com', 0, '0', '0', '0', 0, 0, '0', '0', 0, '0', 0, 0, '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(32, '38221841', 'f3397740a5ca1ca6819bc5e500f1e4da39f3a6eb', 'swagha602@gmail.com', 0, '0', '0', '0', 0, 0, '0', '0', 0, '0', 0, 0, '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(33, '38242971', 'f3397740a5ca1ca6819bc5e500f1e4da39f3a6eb', 'swagha601@gmail.com', 0, '0', '0', '0', 0, 0, '0', '0', 0, '0', 0, 0, '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(34, '7858906', 'f3397740a5ca1ca6819bc5e500f1e4da39f3a6eb', 'swagha603@gmail.com', 0, '0', '0', '0', 0, 0, '0', '0', 0, '0', 0, 0, '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(35, '7858902', 'f3397740a5ca1ca6819bc5e500f1e4da39f3a6eb', 'swagha606@gmail.com', 0, '0', '0', '0', 0, 0, '0', '0', 0, '0', 0, 0, '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(36, '7858904', 'f3397740a5ca1ca6819bc5e500f1e4da39f3a6eb', 'swagha604@gmail.com', 0, '0', '0', '0', 0, 0, '0', '0', 0, '0', 0, 0, '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(37, '888888', 'bb76c76b69e38d12ea71c533a3cf4d808d41c32b', 'pene8@gmail.com', 0, '0', '0', '0', 0, 0, '0', '0', 0, '0', 0, 0, '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(38, '000000', '386816c1984a11f6dd02b7e47efaa14fbf4dbc29', 'pene0@gmail.com', 0, '0', '0', '0', 0, 0, '0', '0', 0, '0', 0, 0, '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(39, '7127934064', '1af6bf10617525f848480366b4fbab317457fa94', 'figaflor@gmail.com', 0, '0', '0', '0', 0, 0, '0', '0', 0, '0', 0, 0, '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(40, '4807734551', '0b00310b885fd1fe1f5a5b11a74c59fa8b591dd9', 'marinamorena@gmail.com', 0, '0', '0', '0', 0, 0, '0', '0', 0, '0', 0, 0, '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(41, 'andreoam2', '5829b6c8b47edd8c600f1e99b751f2b611e9ae79', 'andreoam2@gmail.com', 1729974924, '', '', 'br', 1729974924, 0, '', '', 0, '', 0, 0, '', '', 0, 0, 0, 1, 0, 0, 0, 1733673664, 0, 0),
(42, 'miyamiya', '4847603590b61cb6f84b1988def838ccc4d348d2', 'miyamiya@outlook.com', 0, '0', '0', '0', 0, 0, '0', '0', 0, '0', 0, 0, '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(43, 'asdrubalgenoves', '1b6a07cad5dd7e59a6c59eaf81e44855d3fdd875', 'asdrubalgenoves@protonmail.com', 0, '0', '0', '0', 0, 0, '0', '0', 0, '0', 0, 0, '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(66, 'claudemir321', 'd6794806f83ed5bfbd9a48a4da0ce77e42254ec0', 'claudemirxd32@gmail.com', 0, '0', '0', '0', 0, 0, '0', '0', 0, '0', 0, 0, '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(67, 'ppaulo', '65bde1d4889b7687d9f9cdb42b5b8618b3e36092', 'pj.paiva.chaves@gmail.com', 0, '0', '0', '0', 0, 0, '0', '0', 0, '0', 0, 0, '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(68, '987560038', '85a17f1c4e5acd224e43a8285a3e59582e48a13b', 'jordancristiancarvalho@gmail.com', 0, '0', '0', '0', 0, 0, '0', '0', 0, '0', 0, 0, '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

--
-- Acionadores `accounts`
--
DELIMITER $$
CREATE TRIGGER `oncreate_accounts` AFTER INSERT ON `accounts` FOR EACH ROW BEGIN
    INSERT INTO `account_vipgroups` (`account_id`, `name`, `customizable`) VALUES (NEW.`id`, 'Enemies', 0);
    INSERT INTO `account_vipgroups` (`account_id`, `name`, `customizable`) VALUES (NEW.`id`, 'Friends', 0);
    INSERT INTO `account_vipgroups` (`account_id`, `name`, `customizable`) VALUES (NEW.`id`, 'Trading Partner', 0);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_bans`
--

CREATE TABLE `account_bans` (
  `account_id` int(11) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_ban_history`
--

CREATE TABLE `account_ban_history` (
  `id` int(11) NOT NULL,
  `account_id` int(11) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expired_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_sessions`
--

CREATE TABLE `account_sessions` (
  `id` varchar(191) NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `expires` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_vipgrouplist`
--

CREATE TABLE `account_vipgrouplist` (
  `account_id` int(11) UNSIGNED NOT NULL COMMENT 'id of account whose viplist entry it is',
  `player_id` int(11) NOT NULL COMMENT 'id of target player of viplist entry',
  `vipgroup_id` int(11) UNSIGNED NOT NULL COMMENT 'id of vip group that player belongs'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_vipgroups`
--

CREATE TABLE `account_vipgroups` (
  `id` int(11) UNSIGNED NOT NULL,
  `account_id` int(11) UNSIGNED NOT NULL COMMENT 'id of account whose vip group entry it is',
  `name` varchar(128) NOT NULL,
  `customizable` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `account_vipgroups`
--

INSERT INTO `account_vipgroups` (`id`, `account_id`, `name`, `customizable`) VALUES
(1, 1, 'Enemies', 0),
(2, 1, 'Friends', 0),
(3, 1, 'Trading Partner', 0),
(4, 2, 'Enemies', 0),
(5, 2, 'Friends', 0),
(6, 2, 'Trading Partner', 0),
(7, 3, 'Enemies', 0),
(8, 3, 'Friends', 0),
(9, 3, 'Trading Partner', 0),
(10, 5, 'Enemies', 0),
(11, 5, 'Friends', 0),
(12, 5, 'Trading Partner', 0),
(109, 7, 'Enemies', 0),
(110, 7, 'Friends', 0),
(111, 7, 'Trading Partner', 0),
(112, 20, 'Enemies', 0),
(113, 20, 'Friends', 0),
(114, 20, 'Trading Partner', 0),
(115, 23, 'Enemies', 0),
(116, 23, 'Friends', 0),
(117, 23, 'Trading Partner', 0),
(118, 25, 'Enemies', 0),
(119, 25, 'Friends', 0),
(120, 25, 'Trading Partner', 0),
(121, 27, 'Enemies', 0),
(122, 27, 'Friends', 0),
(123, 27, 'Trading Partner', 0),
(124, 30, 'Enemies', 0),
(125, 30, 'Friends', 0),
(126, 30, 'Trading Partner', 0),
(127, 31, 'Enemies', 0),
(128, 31, 'Friends', 0),
(129, 31, 'Trading Partner', 0),
(130, 32, 'Enemies', 0),
(131, 32, 'Friends', 0),
(132, 32, 'Trading Partner', 0),
(133, 33, 'Enemies', 0),
(134, 33, 'Friends', 0),
(135, 33, 'Trading Partner', 0),
(136, 34, 'Enemies', 0),
(137, 34, 'Friends', 0),
(138, 34, 'Trading Partner', 0),
(139, 35, 'Enemies', 0),
(140, 35, 'Friends', 0),
(141, 35, 'Trading Partner', 0),
(142, 36, 'Enemies', 0),
(143, 36, 'Friends', 0),
(144, 36, 'Trading Partner', 0),
(145, 37, 'Enemies', 0),
(146, 37, 'Friends', 0),
(147, 37, 'Trading Partner', 0),
(148, 38, 'Enemies', 0),
(149, 38, 'Friends', 0),
(150, 38, 'Trading Partner', 0),
(151, 39, 'Enemies', 0),
(152, 39, 'Friends', 0),
(153, 39, 'Trading Partner', 0),
(154, 40, 'Enemies', 0),
(155, 40, 'Friends', 0),
(156, 40, 'Trading Partner', 0),
(157, 42, 'Enemies', 0),
(158, 42, 'Friends', 0),
(159, 42, 'Trading Partner', 0),
(160, 43, 'Enemies', 0),
(161, 43, 'Friends', 0),
(162, 43, 'Trading Partner', 0),
(163, 66, 'Enemies', 0),
(164, 66, 'Friends', 0),
(165, 66, 'Trading Partner', 0),
(166, 67, 'Enemies', 0),
(167, 67, 'Friends', 0),
(168, 67, 'Trading Partner', 0),
(169, 68, 'Enemies', 0),
(170, 68, 'Friends', 0),
(171, 68, 'Trading Partner', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_viplist`
--

CREATE TABLE `account_viplist` (
  `account_id` int(11) UNSIGNED NOT NULL COMMENT 'id of account whose viplist entry it is',
  `player_id` int(11) NOT NULL COMMENT 'id of target player of viplist entry',
  `description` varchar(128) NOT NULL DEFAULT '',
  `icon` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `notify` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `boosted_boss`
--

CREATE TABLE `boosted_boss` (
  `boostname` text DEFAULT NULL,
  `date` varchar(250) NOT NULL DEFAULT '',
  `raceid` varchar(250) NOT NULL DEFAULT '',
  `looktypeEx` int(11) NOT NULL DEFAULT 0,
  `looktype` int(11) NOT NULL DEFAULT 136,
  `lookfeet` int(11) NOT NULL DEFAULT 0,
  `looklegs` int(11) NOT NULL DEFAULT 0,
  `lookhead` int(11) NOT NULL DEFAULT 0,
  `lookbody` int(11) NOT NULL DEFAULT 0,
  `lookaddons` int(11) NOT NULL DEFAULT 0,
  `lookmount` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `boosted_boss`
--

INSERT INTO `boosted_boss` (`boostname`, `date`, `raceid`, `looktypeEx`, `looktype`, `lookfeet`, `looklegs`, `lookhead`, `lookbody`, `lookaddons`, `lookmount`) VALUES
('The False God', '26', '1409', 0, 984, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `boosted_creature`
--

CREATE TABLE `boosted_creature` (
  `boostname` text DEFAULT NULL,
  `date` varchar(250) NOT NULL DEFAULT '',
  `raceid` varchar(250) NOT NULL DEFAULT '',
  `looktype` int(11) NOT NULL DEFAULT 136,
  `lookfeet` int(11) NOT NULL DEFAULT 0,
  `looklegs` int(11) NOT NULL DEFAULT 0,
  `lookhead` int(11) NOT NULL DEFAULT 0,
  `lookbody` int(11) NOT NULL DEFAULT 0,
  `lookaddons` int(11) NOT NULL DEFAULT 0,
  `lookmount` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `boosted_creature`
--

INSERT INTO `boosted_creature` (`boostname`, `date`, `raceid`, `looktype`, `lookfeet`, `looklegs`, `lookhead`, `lookbody`, `lookaddons`, `lookmount`) VALUES
('Gargoyle', '26', '95', 95, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `coins_transactions`
--

CREATE TABLE `coins_transactions` (
  `id` int(11) UNSIGNED NOT NULL,
  `account_id` int(11) UNSIGNED NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL,
  `coin_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `amount` int(12) UNSIGNED NOT NULL,
  `description` varchar(3500) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `coins_transactions`
--

INSERT INTO `coins_transactions` (`id`, `account_id`, `type`, `coin_type`, `amount`, `description`, `timestamp`) VALUES
(3, 1, 2, 3, 41, 'REMOVE Coins', '2024-10-06 23:32:09'),
(4, 1, 2, 3, 10, 'REMOVE Coins', '2024-10-06 23:43:00'),
(5, 2, 2, 3, 50, 'REMOVE Coins', '2024-10-23 03:37:32'),
(6, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:32'),
(7, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:38'),
(8, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:39'),
(9, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:39'),
(10, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:39'),
(11, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:40'),
(12, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:40'),
(13, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:40'),
(14, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:41'),
(15, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:41'),
(16, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:41'),
(17, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:42'),
(18, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:42'),
(19, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:43'),
(20, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:43'),
(21, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:43'),
(22, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:44'),
(23, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:44'),
(24, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:44'),
(25, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:45'),
(26, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:46'),
(27, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:47'),
(28, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:47'),
(29, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:47'),
(30, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:48'),
(31, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:48'),
(32, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:48'),
(33, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:49'),
(34, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:49'),
(35, 2, 1, 3, 100, 'ADD Coins', '2024-10-23 05:35:49'),
(36, 2, 2, 3, 3000, 'REMOVE Coins', '2024-10-23 05:36:22'),
(37, 2, 2, 3, 900, 'REMOVE Coins', '2024-10-25 02:17:49'),
(38, 2, 1, 3, 1, 'ADD Coins', '2024-10-25 03:34:23'),
(39, 2, 2, 3, 500, 'REMOVE Coins', '2024-10-28 02:10:03'),
(40, 2, 2, 3, 500, 'REMOVE Coins', '2024-10-28 05:10:05'),
(41, 2, 1, 3, 1, 'ADD Coins', '2024-12-06 14:11:09'),
(42, 2, 1, 3, 100, 'ADD Coins', '2024-12-06 14:11:10'),
(43, 2, 1, 3, 100, 'ADD Coins', '2024-12-06 14:11:10'),
(44, 2, 1, 3, 100, 'ADD Coins', '2024-12-06 14:11:11'),
(45, 2, 1, 3, 100, 'ADD Coins', '2024-12-06 14:11:12'),
(46, 2, 1, 3, 100, 'ADD Coins', '2024-12-06 14:11:25'),
(47, 2, 1, 3, 100, 'ADD Coins', '2024-12-06 14:11:25'),
(48, 2, 1, 3, 100, 'ADD Coins', '2024-12-06 14:11:26'),
(49, 2, 1, 3, 100, 'ADD Coins', '2024-12-06 14:11:27'),
(50, 2, 1, 3, 100, 'ADD Coins', '2024-12-06 14:11:27'),
(51, 2, 2, 3, 500, 'REMOVE Coins', '2024-12-06 14:11:35'),
(52, 2, 2, 3, 200, 'REMOVE Coins', '2024-12-06 14:11:57'),
(53, 2, 1, 3, 99, 'ADD Coins', '2024-12-06 14:12:00'),
(54, 2, 1, 1, 1, 'ADD Coins', '2024-12-06 15:16:45'),
(55, 2, 1, 3, 1, 'ADD Coins', '2024-12-06 15:21:56'),
(56, 2, 1, 3, 99, 'ADD Coins', '2024-12-06 15:22:04'),
(57, 2, 1, 3, 10, 'ADD Coins', '2024-12-06 15:24:17'),
(58, 2, 2, 3, 10, 'REMOVE Coins', '2024-12-06 15:24:31'),
(59, 2, 1, 3, 10, 'ADD Coins', '2024-12-06 15:27:40'),
(60, 2, 1, 3, 90, 'ADD Coins', '2024-12-06 15:27:48'),
(61, 2, 2, 3, 100, 'REMOVE Coins', '2024-12-06 15:28:24'),
(62, 2, 1, 3, 1410065407, 'ADD Coins', '2024-12-06 15:28:36'),
(63, 2, 1, 3, 1500, 'ADD Coins', '2024-12-06 18:34:40'),
(64, 2, 1, 3, 100, 'ADD Coins', '2024-12-06 18:34:40'),
(65, 2, 1, 3, 1500, 'ADD Coins', '2024-12-06 18:36:20'),
(66, 2, 1, 3, 100, 'ADD Coins', '2024-12-06 18:36:20'),
(67, 2, 2, 3, 999999999, 'REMOVE Coins', '2024-12-06 18:36:51'),
(68, 2, 2, 3, 99999999, 'REMOVE Coins', '2024-12-06 18:37:00'),
(69, 2, 2, 3, 99999999, 'REMOVE Coins', '2024-12-06 18:37:02'),
(70, 2, 2, 3, 99999999, 'REMOVE Coins', '2024-12-06 18:37:03'),
(71, 2, 2, 3, 99999999, 'REMOVE Coins', '2024-12-06 18:37:05'),
(72, 2, 2, 3, 9999999, 'REMOVE Coins', '2024-12-06 18:37:09'),
(73, 2, 2, 3, 69013, 'REMOVE Coins', '2024-12-06 18:37:24'),
(74, 2, 1, 3, 1500, 'ADD Coins', '2024-12-06 18:37:31'),
(75, 2, 1, 3, 100, 'ADD Coins', '2024-12-06 18:37:31'),
(76, 2, 1, 3, 1500, 'ADD Coins', '2024-12-06 18:37:44'),
(77, 2, 1, 3, 100, 'ADD Coins', '2024-12-06 18:37:44'),
(78, 2, 1, 3, 1500, 'ADD Coins', '2024-12-06 18:43:11'),
(79, 2, 1, 3, 100, 'ADD Coins', '2024-12-06 18:43:11'),
(80, 2, 1, 3, 1500, 'ADD Coins', '2024-12-06 18:48:01'),
(81, 2, 1, 3, 100, 'ADD Coins', '2024-12-06 18:48:01'),
(82, 2, 1, 3, 1500, 'ADD Coins', '2024-12-06 18:51:06'),
(83, 2, 1, 3, 100, 'ADD Coins', '2024-12-06 18:51:06'),
(84, 2, 1, 3, 1500, 'ADD Coins', '2024-12-06 18:52:49'),
(85, 2, 1, 3, 100, 'ADD Coins', '2024-12-06 18:52:49'),
(86, 2, 2, 3, 500, 'REMOVE Coins', '2024-12-07 05:00:40'),
(87, 2, 1, 3, 1500, 'ADD Coins', '2024-12-07 05:46:03'),
(88, 2, 1, 3, 100, 'ADD Coins', '2024-12-07 05:46:03'),
(89, 2, 2, 3, 200, 'REMOVE Coins', '2024-12-07 05:47:23'),
(90, 2, 1, 3, 1500, 'ADD Coins', '2024-12-07 05:53:25'),
(91, 2, 1, 3, 100, 'ADD Coins', '2024-12-07 05:53:25'),
(92, 2, 1, 3, 1500, 'ADD Coins', '2024-12-07 05:56:05'),
(93, 2, 1, 3, 1500, 'ADD Coins', '2024-12-07 05:57:27'),
(94, 2, 1, 3, 1500, 'ADD Coins', '2024-12-08 03:08:16'),
(95, 2, 2, 3, 500, 'REMOVE Coins', '2024-12-09 07:07:17'),
(96, 2, 2, 3, 30, 'REMOVE Coins', '2024-12-09 07:08:14'),
(97, 2, 1, 3, 1500, 'ADD Coins', '2024-12-18 16:30:30');

-- --------------------------------------------------------

--
-- Estrutura para tabela `crypto_payments`
--

CREATE TABLE `crypto_payments` (
  `paymentID` int(11) UNSIGNED NOT NULL,
  `boxID` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `boxType` enum('paymentbox','captchabox') NOT NULL,
  `orderID` varchar(50) NOT NULL DEFAULT '',
  `userID` varchar(50) NOT NULL DEFAULT '',
  `countryID` varchar(3) NOT NULL DEFAULT '',
  `coinLabel` varchar(6) NOT NULL DEFAULT '',
  `amount` double(20,8) NOT NULL DEFAULT 0.00000000,
  `amountUSD` double(20,8) NOT NULL DEFAULT 0.00000000,
  `unrecognised` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `addr` varchar(34) NOT NULL DEFAULT '',
  `txID` char(64) NOT NULL DEFAULT '',
  `txDate` datetime DEFAULT NULL,
  `txConfirmed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `txCheckDate` datetime DEFAULT NULL,
  `processed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `processedDate` datetime DEFAULT NULL,
  `recordCreated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `daily_reward_history`
--

CREATE TABLE `daily_reward_history` (
  `id` int(11) NOT NULL,
  `daystreak` smallint(2) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `forge_history`
--

CREATE TABLE `forge_history` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `action_type` int(11) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `is_success` tinyint(4) NOT NULL DEFAULT 0,
  `bonus` tinyint(4) NOT NULL DEFAULT 0,
  `done_at` bigint(20) NOT NULL,
  `done_at_date` datetime DEFAULT current_timestamp(),
  `cost` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `gained` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `global_storage`
--

CREATE TABLE `global_storage` (
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `global_storage`
--

INSERT INTO `global_storage` (`key`, `value`) VALUES
('14110', '1735182300'),
('40000', '4');

-- --------------------------------------------------------

--
-- Estrutura para tabela `guilds`
--

CREATE TABLE `guilds` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL DEFAULT '',
  `residence` int(11) NOT NULL DEFAULT 0,
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `points` int(11) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `logo_name` varchar(255) NOT NULL DEFAULT 'default.gif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Acionadores `guilds`
--
DELIMITER $$
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds` FOR EACH ROW BEGIN
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('The Leader', 3, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Vice-Leader', 2, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Member', 1, NEW.`id`);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guildwar_kills`
--

CREATE TABLE `guildwar_kills` (
  `id` int(11) NOT NULL,
  `killer` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  `killerguild` int(11) NOT NULL DEFAULT 0,
  `targetguild` int(11) NOT NULL DEFAULT 0,
  `warid` int(11) NOT NULL DEFAULT 0,
  `time` bigint(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guild_invites`
--

CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `guild_id` int(11) NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guild_membership`
--

CREATE TABLE `guild_membership` (
  `player_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `nick` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guild_ranks`
--

CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL COMMENT 'guild',
  `name` varchar(255) NOT NULL COMMENT 'rank name',
  `level` int(11) NOT NULL COMMENT 'rank level - leader, vice, member, maybe something else'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guild_wars`
--

CREATE TABLE `guild_wars` (
  `id` int(11) NOT NULL,
  `guild1` int(11) NOT NULL DEFAULT 0,
  `guild2` int(11) NOT NULL DEFAULT 0,
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL,
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `started` bigint(15) NOT NULL DEFAULT 0,
  `ended` bigint(15) NOT NULL DEFAULT 0,
  `frags_limit` smallint(4) UNSIGNED NOT NULL DEFAULT 0,
  `payment` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `duration_days` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `houses`
--

CREATE TABLE `houses` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `new_owner` int(11) NOT NULL DEFAULT -1,
  `paid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `warnings` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `rent` int(11) NOT NULL DEFAULT 0,
  `town_id` int(11) NOT NULL DEFAULT 0,
  `bid` int(11) NOT NULL DEFAULT 0,
  `bid_end` int(11) NOT NULL DEFAULT 0,
  `last_bid` int(11) NOT NULL DEFAULT 0,
  `highest_bidder` int(11) NOT NULL DEFAULT 0,
  `size` int(11) NOT NULL DEFAULT 0,
  `guildid` int(11) DEFAULT NULL,
  `beds` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `houses`
--

INSERT INTO `houses` (`id`, `owner`, `new_owner`, `paid`, `warnings`, `name`, `rent`, `town_id`, `bid`, `bid_end`, `last_bid`, `highest_bidder`, `size`, `guildid`, `beds`) VALUES
(1, 0, -1, 0, 0, 'Thunder City #1', 0, 1, 0, 0, 0, 0, 23, NULL, 0),
(2, 0, -1, 0, 0, 'Thunder City #2', 0, 1, 0, 0, 0, 0, 28, NULL, 0),
(3, 0, -1, 0, 0, 'Thunder City #3', 0, 1, 0, 0, 0, 0, 28, NULL, 0),
(4, 0, -1, 0, 0, 'Thunder City #4', 0, 1, 0, 0, 0, 0, 28, NULL, 0),
(5, 0, -1, 0, 0, 'Thunder City #5', 0, 1, 0, 0, 0, 0, 26, NULL, 0),
(6, 0, -1, 0, 0, 'Thunder City #6', 0, 1, 0, 0, 0, 0, 22, NULL, 0),
(7, 0, -1, 0, 0, 'Thunder City #7', 0, 1, 0, 0, 0, 0, 7, NULL, 0),
(8, 0, -1, 0, 0, 'Thunder City #9', 0, 1, 0, 0, 0, 0, 28, NULL, 0),
(9, 0, -1, 0, 0, 'Thunder City #10', 0, 1, 0, 0, 0, 0, 38, NULL, 0),
(10, 0, -1, 0, 0, 'Thunder City #11', 0, 1, 0, 0, 0, 0, 24, NULL, 0),
(11, 0, -1, 0, 0, 'Thunder City #12', 0, 1, 0, 0, 0, 0, 23, NULL, 0),
(12, 0, -1, 0, 0, 'Thunder City #13', 0, 1, 0, 0, 0, 0, 28, NULL, 0),
(13, 0, -1, 0, 0, 'Thunder City #14', 0, 1, 0, 0, 0, 0, 28, NULL, 0),
(14, 0, -1, 0, 0, 'Thunder City #15', 0, 1, 0, 0, 0, 0, 23, NULL, 0),
(15, 0, -1, 0, 0, 'Thunder City #16', 0, 1, 0, 0, 0, 0, 18, NULL, 0),
(16, 0, -1, 0, 0, 'Thunder City #17', 0, 1, 0, 0, 0, 0, 28, NULL, 0),
(17, 0, -1, 0, 0, 'Thunder City #18', 0, 1, 0, 0, 0, 0, 22, NULL, 0),
(18, 0, -1, 0, 0, 'Thunder City #19', 0, 1, 0, 0, 0, 0, 23, NULL, 0),
(19, 0, -1, 0, 0, 'Thunder City #20', 0, 1, 0, 0, 0, 0, 23, NULL, 0),
(20, 0, -1, 0, 0, 'Thunder City #21', 0, 1, 0, 0, 0, 0, 26, NULL, 0),
(21, 0, -1, 0, 0, 'Thunder City #22', 0, 1, 0, 0, 0, 0, 32, NULL, 0),
(22, 0, -1, 0, 0, 'Thunder City #23', 0, 1, 0, 0, 0, 0, 18, NULL, 0),
(23, 0, -1, 0, 0, 'Thunder City #24', 0, 1, 0, 0, 0, 0, 23, NULL, 0),
(24, 0, -1, 0, 0, 'Thunder City #25', 0, 1, 0, 0, 0, 0, 355, NULL, 0),
(25, 0, -1, 0, 0, 'Thunder City #26', 0, 1, 0, 0, 0, 0, 34, NULL, 0),
(26, 0, -1, 0, 0, 'Thunder City #27', 0, 1, 0, 0, 0, 0, 36, NULL, 0),
(27, 0, -1, 0, 0, 'Thunder City #28', 0, 1, 0, 0, 0, 0, 34, NULL, 0),
(28, 0, -1, 0, 0, 'Thunder City #29', 0, 1, 0, 0, 0, 0, 44, NULL, 0),
(29, 0, -1, 0, 0, 'Thunder City #30', 0, 1, 0, 0, 0, 0, 44, NULL, 0),
(30, 0, -1, 0, 0, 'Thunder City #31', 0, 1, 0, 0, 0, 0, 22, NULL, 0),
(31, 0, -1, 0, 0, 'Thunder City #32', 0, 1, 0, 0, 0, 0, 22, NULL, 0),
(32, 0, -1, 0, 0, 'Thunder City #33', 0, 1, 0, 0, 0, 0, 22, NULL, 0),
(33, 0, -1, 0, 0, 'Thunder City #34', 0, 1, 0, 0, 0, 0, 38, NULL, 0),
(34, 0, -1, 0, 0, 'Thunder City #35', 0, 1, 0, 0, 0, 0, 142, NULL, 0),
(35, 0, -1, 0, 0, 'Thunder City #36', 0, 1, 0, 0, 0, 0, 30, NULL, 0),
(36, 0, -1, 0, 0, 'Thunder City #37', 0, 1, 0, 0, 0, 0, 30, NULL, 0),
(37, 0, -1, 0, 0, 'Thunder City #38', 0, 1, 0, 0, 0, 0, 30, NULL, 0),
(38, 0, -1, 0, 0, 'Thunder City #39', 0, 1, 0, 0, 0, 0, 51, NULL, 0),
(39, 0, -1, 0, 0, 'Thunder City #40', 0, 1, 0, 0, 0, 0, 33, NULL, 0),
(40, 0, -1, 0, 0, 'Thunder City #41', 0, 1, 0, 0, 0, 0, 33, NULL, 0),
(41, 0, -1, 0, 0, 'Thunder City #42', 0, 1, 0, 0, 0, 0, 28, NULL, 0),
(42, 0, -1, 0, 0, 'Thunder City #43', 0, 1, 0, 0, 0, 0, 28, NULL, 0),
(43, 0, -1, 0, 0, 'Thunder City #44', 0, 1, 0, 0, 0, 0, 28, NULL, 0),
(44, 0, -1, 0, 0, 'Thunder City #45', 0, 1, 0, 0, 0, 0, 28, NULL, 0),
(45, 0, -1, 0, 0, 'Thunder City #46', 0, 1, 0, 0, 0, 0, 33, NULL, 0),
(46, 0, -1, 0, 0, 'Thunder City #47', 0, 1, 0, 0, 0, 0, 27, NULL, 0),
(47, 0, -1, 0, 0, 'Thunder City #48', 0, 1, 0, 0, 0, 0, 34, NULL, 0),
(48, 0, -1, 0, 0, 'Thunder City #49', 0, 1, 0, 0, 0, 0, 18, NULL, 0),
(49, 0, -1, 0, 0, 'Thunder City #50', 0, 1, 0, 0, 0, 0, 21, NULL, 0),
(50, 0, -1, 0, 0, 'Thunder City #51', 0, 1, 0, 0, 0, 0, 34, NULL, 0),
(51, 0, -1, 0, 0, 'Thunder City #52', 0, 1, 0, 0, 0, 0, 70, NULL, 0),
(52, 0, -1, 0, 0, 'Thunder City #53', 0, 1, 0, 0, 0, 0, 70, NULL, 0),
(53, 0, -1, 0, 0, 'Thunder City #54', 0, 1, 0, 0, 0, 0, 28, NULL, 0),
(54, 0, -1, 0, 0, 'Thunder City #55', 0, 1, 0, 0, 0, 0, 34, NULL, 0),
(55, 0, -1, 0, 0, 'Thunder City #56', 0, 1, 0, 0, 0, 0, 26, NULL, 0),
(56, 0, -1, 0, 0, 'Thunder City #57', 0, 1, 0, 0, 0, 0, 26, NULL, 0),
(57, 0, -1, 0, 0, 'Thunder City #58', 0, 1, 0, 0, 0, 0, 22, NULL, 0),
(58, 0, -1, 0, 0, 'Thunder City #59', 0, 1, 0, 0, 0, 0, 22, NULL, 0),
(59, 0, -1, 0, 0, 'Thunder City #60', 0, 1, 0, 0, 0, 0, 30, NULL, 0),
(60, 0, -1, 0, 0, 'Thunder City #61', 0, 1, 0, 0, 0, 0, 24, NULL, 0),
(61, 0, -1, 0, 0, 'Thunder City #62', 0, 1, 0, 0, 0, 0, 34, NULL, 0),
(62, 0, -1, 0, 0, 'Thunder City #63', 0, 1, 0, 0, 0, 0, 36, NULL, 0),
(63, 0, -1, 0, 0, 'Thunder City #64', 0, 1, 0, 0, 0, 0, 36, NULL, 0),
(64, 0, -1, 0, 0, 'Thunder City #65', 0, 1, 0, 0, 0, 0, 31, NULL, 0),
(65, 0, -1, 0, 0, 'Thunder City #66', 0, 1, 0, 0, 0, 0, 14, NULL, 0),
(66, 0, -1, 0, 0, 'Thunder City #67', 0, 1, 0, 0, 0, 0, 26, NULL, 0),
(67, 0, -1, 0, 0, 'Thunder City #68', 0, 1, 0, 0, 0, 0, 27, NULL, 0),
(68, 0, -1, 0, 0, 'Thunder City #69', 0, 1, 0, 0, 0, 0, 46, NULL, 0),
(69, 0, -1, 0, 0, 'Thunder City #70', 0, 1, 0, 0, 0, 0, 38, NULL, 0),
(70, 0, -1, 0, 0, 'Thunder City #71', 0, 1, 0, 0, 0, 0, 33, NULL, 0),
(71, 0, -1, 0, 0, 'Thunder City #72', 0, 1, 0, 0, 0, 0, 28, NULL, 0),
(72, 0, -1, 0, 0, 'Thunder City #73', 0, 1, 0, 0, 0, 0, 18, NULL, 0),
(73, 0, -1, 0, 0, 'Thunder City #74', 0, 1, 0, 0, 0, 0, 33, NULL, 0),
(74, 0, -1, 0, 0, 'Thunder City #75', 0, 1, 0, 0, 0, 0, 28, NULL, 0),
(75, 0, -1, 0, 0, 'Thunder City #76', 0, 1, 0, 0, 0, 0, 6, NULL, 0),
(76, 0, -1, 0, 0, 'Thunder City #77', 0, 1, 0, 0, 0, 0, 6, NULL, 0),
(77, 0, -1, 0, 0, 'Thunder City #78', 0, 1, 0, 0, 0, 0, 6, NULL, 0),
(78, 0, -1, 0, 0, 'Thunder City #79', 0, 1, 0, 0, 0, 0, 6, NULL, 0),
(79, 0, -1, 0, 0, 'Thunder City #80', 0, 1, 0, 0, 0, 0, 6, NULL, 0),
(80, 0, -1, 0, 0, 'Thunder City #81', 0, 1, 0, 0, 0, 0, 6, NULL, 0),
(81, 0, -1, 0, 0, 'Thunder City #82', 0, 1, 0, 0, 0, 0, 6, NULL, 0),
(82, 0, -1, 0, 0, 'Thunder City #83', 0, 1, 0, 0, 0, 0, 6, NULL, 0),
(83, 0, -1, 0, 0, 'Thunder City #84', 0, 1, 0, 0, 0, 0, 79, NULL, 0),
(84, 0, -1, 0, 0, 'Thunder City #85', 0, 1, 0, 0, 0, 0, 22, NULL, 0),
(85, 0, -1, 0, 0, 'Thunder City #86', 0, 1, 0, 0, 0, 0, 22, NULL, 0),
(86, 0, -1, 0, 0, 'Thunder City #87', 0, 1, 0, 0, 0, 0, 21, NULL, 0),
(87, 0, -1, 0, 0, 'Thunder City #88', 0, 1, 0, 0, 0, 0, 30, NULL, 0),
(88, 0, -1, 0, 0, 'Thunder City #89', 0, 1, 0, 0, 0, 0, 36, NULL, 0),
(89, 0, -1, 0, 0, 'Thunder City #90', 0, 1, 0, 0, 0, 0, 37, NULL, 0),
(90, 0, -1, 0, 0, 'Thunder City #91', 0, 1, 0, 0, 0, 0, 28, NULL, 0),
(91, 0, -1, 0, 0, 'Thunder City #92', 0, 1, 0, 0, 0, 0, 13, NULL, 0),
(92, 0, -1, 0, 0, 'Thunder City #93', 0, 1, 0, 0, 0, 0, 14, NULL, 0),
(93, 0, -1, 0, 0, 'Thunder City #94', 0, 1, 0, 0, 0, 0, 14, NULL, 0),
(94, 0, -1, 0, 0, 'Thunder City #95', 0, 1, 0, 0, 0, 0, 32, NULL, 0),
(95, 0, -1, 0, 0, 'Thunder City #96', 0, 1, 0, 0, 0, 0, 30, NULL, 0),
(96, 0, -1, 0, 0, 'Thunder City #97', 0, 1, 0, 0, 0, 0, 13, NULL, 0),
(97, 0, -1, 0, 0, 'Jamila Island #1', 0, 2, 0, 0, 0, 0, 30, NULL, 0),
(98, 0, -1, 0, 0, 'Jamila Island #2', 0, 2, 0, 0, 0, 0, 39, NULL, 0),
(99, 0, -1, 0, 0, 'Jamila Island #3', 0, 2, 0, 0, 0, 0, 24, NULL, 0),
(100, 0, -1, 0, 0, 'Jamila Island #4', 0, 2, 0, 0, 0, 0, 45, NULL, 0),
(101, 0, -1, 0, 0, 'Jamila Island #5', 0, 2, 0, 0, 0, 0, 20, NULL, 0),
(102, 0, -1, 0, 0, 'Jamila Island #6', 0, 2, 0, 0, 0, 0, 15, NULL, 0),
(103, 0, -1, 0, 0, 'Jamila Island #7', 0, 2, 0, 0, 0, 0, 12, NULL, 0),
(104, 0, -1, 0, 0, 'Jamila Island #8', 0, 2, 0, 0, 0, 0, 19, NULL, 0),
(105, 0, -1, 0, 0, 'Jamila Island #9', 0, 2, 0, 0, 0, 0, 20, NULL, 0),
(106, 0, -1, 0, 0, 'Jamila Island #10', 0, 2, 0, 0, 0, 0, 20, NULL, 0),
(107, 0, -1, 0, 0, 'Jamila Island #11', 0, 2, 0, 0, 0, 0, 36, NULL, 0),
(108, 0, -1, 0, 0, 'Jamila Island #12', 0, 2, 0, 0, 0, 0, 28, NULL, 0),
(109, 0, -1, 0, 0, 'Jamila Island #13', 0, 2, 0, 0, 0, 0, 19, NULL, 0),
(110, 0, -1, 0, 0, 'Jamila Island #14', 0, 2, 0, 0, 0, 0, 43, NULL, 0),
(111, 0, -1, 0, 0, 'Jamila Island #15', 0, 2, 0, 0, 0, 0, 10, NULL, 0),
(112, 0, -1, 0, 0, 'Jamila Island #16', 0, 2, 0, 0, 0, 0, 10, NULL, 0),
(113, 0, -1, 0, 0, 'Jamila Island #17', 0, 2, 0, 0, 0, 0, 12, NULL, 0),
(114, 0, -1, 0, 0, 'Jamila Island #18', 0, 2, 0, 0, 0, 0, 12, NULL, 0),
(115, 0, -1, 0, 0, 'Jamila Island #19', 0, 2, 0, 0, 0, 0, 10, NULL, 0),
(116, 0, -1, 0, 0, 'Jamila Island #20', 0, 2, 0, 0, 0, 0, 10, NULL, 0),
(117, 0, -1, 0, 0, 'Jamila Island #21', 0, 2, 0, 0, 0, 0, 7, NULL, 0),
(118, 0, -1, 0, 0, 'Jamila Island #22', 0, 2, 0, 0, 0, 0, 7, NULL, 0),
(119, 0, -1, 0, 0, 'Bhark #1', 0, 5, 0, 0, 0, 0, 15, NULL, 0),
(120, 0, -1, 0, 0, 'Bhark #2', 0, 5, 0, 0, 0, 0, 15, NULL, 0),
(121, 0, -1, 0, 0, 'Bhark #3', 0, 5, 0, 0, 0, 0, 5, NULL, 0),
(122, 0, -1, 0, 0, 'Bhark #4', 0, 5, 0, 0, 0, 0, 5, NULL, 0),
(123, 0, -1, 0, 0, 'Bhark #5', 0, 5, 0, 0, 0, 0, 19, NULL, 0),
(124, 0, -1, 0, 0, 'Bhark #6', 0, 5, 0, 0, 0, 0, 19, NULL, 0),
(125, 0, -1, 0, 0, 'Bhark #7', 0, 5, 0, 0, 0, 0, 40, NULL, 0),
(126, 0, -1, 0, 0, 'Bhark #8', 0, 5, 0, 0, 0, 0, 7, NULL, 0),
(127, 0, -1, 0, 0, 'Bhark #9', 0, 5, 0, 0, 0, 0, 28, NULL, 0),
(128, 0, -1, 0, 0, 'Bhark #10', 0, 5, 0, 0, 0, 0, 22, NULL, 0),
(129, 0, -1, 0, 0, 'Bhark #11', 0, 5, 0, 0, 0, 0, 29, NULL, 0),
(130, 0, -1, 0, 0, 'Bhark #12', 0, 5, 0, 0, 0, 0, 4, NULL, 0),
(131, 0, -1, 0, 0, 'Bhark #13', 0, 5, 0, 0, 0, 0, 17, NULL, 0),
(132, 0, -1, 0, 0, 'Bhark #14', 0, 5, 0, 0, 0, 0, 6, NULL, 0),
(133, 0, -1, 0, 0, 'Bhark #15', 0, 5, 0, 0, 0, 0, 10, NULL, 0),
(134, 0, -1, 0, 0, 'Bhark #16', 0, 5, 0, 0, 0, 0, 13, NULL, 0),
(135, 0, -1, 0, 0, 'Bhark #17', 0, 5, 0, 0, 0, 0, 33, NULL, 0),
(136, 0, -1, 0, 0, 'Bhark #18', 0, 5, 0, 0, 0, 0, 17, NULL, 0),
(137, 0, -1, 0, 0, 'Bhark #19', 0, 5, 0, 0, 0, 0, 24, NULL, 0),
(138, 0, -1, 0, 0, 'Bhark #20', 0, 5, 0, 0, 0, 0, 11, NULL, 0),
(139, 0, -1, 0, 0, 'Bhark #21', 0, 5, 0, 0, 0, 0, 12, NULL, 0),
(140, 0, -1, 0, 0, 'Bhark #22', 0, 5, 0, 0, 0, 0, 7, NULL, 0),
(141, 0, -1, 0, 0, 'Bhark #23', 0, 5, 0, 0, 0, 0, 7, NULL, 0),
(142, 0, -1, 0, 0, 'Bhark #24', 0, 5, 0, 0, 0, 0, 17, NULL, 0),
(143, 0, -1, 0, 0, 'Bhark #25', 0, 5, 0, 0, 0, 0, 9, NULL, 0),
(144, 0, -1, 0, 0, 'Bhark #26', 0, 5, 0, 0, 0, 0, 10, NULL, 0),
(145, 0, -1, 0, 0, 'Bhark #27', 0, 5, 0, 0, 0, 0, 6, NULL, 0),
(146, 0, -1, 0, 0, 'Bhark #28', 0, 5, 0, 0, 0, 0, 6, NULL, 0),
(147, 0, -1, 0, 0, 'Bhark #29', 0, 5, 0, 0, 0, 0, 23, NULL, 0),
(148, 0, -1, 0, 0, 'Bhark #30', 0, 5, 0, 0, 0, 0, 36, NULL, 0),
(149, 0, -1, 0, 0, 'Bhark #31', 0, 5, 0, 0, 0, 0, 10, NULL, 0),
(150, 0, -1, 0, 0, 'Bhark #32', 0, 5, 0, 0, 0, 0, 10, NULL, 0),
(151, 0, -1, 0, 0, 'Bhark #33', 0, 5, 0, 0, 0, 0, 7, NULL, 0),
(152, 0, -1, 0, 0, 'Bhark #34', 0, 5, 0, 0, 0, 0, 7, NULL, 0),
(153, 0, -1, 0, 0, 'Bhark #35', 0, 5, 0, 0, 0, 0, 10, NULL, 0),
(154, 0, -1, 0, 0, 'Bhark #36', 0, 5, 0, 0, 0, 0, 10, NULL, 0),
(155, 0, -1, 0, 0, 'Bhark #37', 0, 5, 0, 0, 0, 0, 14, NULL, 0),
(156, 0, -1, 0, 0, 'Bhark #38', 0, 5, 0, 0, 0, 0, 10, NULL, 0),
(157, 0, -1, 0, 0, 'Bhark #39', 0, 5, 0, 0, 0, 0, 15, NULL, 0),
(158, 0, -1, 0, 0, 'Bhark #40', 0, 5, 0, 0, 0, 0, 29, NULL, 0),
(159, 0, -1, 0, 0, 'Bhark #41', 0, 5, 0, 0, 0, 0, 14, NULL, 0),
(160, 0, -1, 0, 0, 'Bhark #42', 0, 5, 0, 0, 0, 0, 16, NULL, 0),
(161, 0, -1, 0, 0, 'Bhark #43', 0, 5, 0, 0, 0, 0, 5, NULL, 0),
(162, 0, -1, 0, 0, 'Bhark #44', 0, 5, 0, 0, 0, 0, 5, NULL, 0),
(163, 0, -1, 0, 0, 'Thunder City #8', 0, 1, 0, 0, 0, 0, 22, NULL, 0),
(164, 0, -1, 0, 0, 'Akravi #1', 0, 3, 0, 0, 0, 0, 34, NULL, 0),
(165, 0, -1, 0, 0, 'Akravi #2', 0, 3, 0, 0, 0, 0, 24, NULL, 0),
(166, 0, -1, 0, 0, 'Akravi #3', 0, 3, 0, 0, 0, 0, 26, NULL, 0),
(167, 0, -1, 0, 0, 'Akravi #4', 0, 3, 0, 0, 0, 0, 24, NULL, 0),
(168, 0, -1, 0, 0, 'Akravi #5', 0, 3, 0, 0, 0, 0, 26, NULL, 0),
(169, 0, -1, 0, 0, 'Akravi #6', 0, 3, 0, 0, 0, 0, 14, NULL, 0),
(170, 0, -1, 0, 0, 'Akravi #7', 0, 3, 0, 0, 0, 0, 14, NULL, 0),
(171, 0, -1, 0, 0, 'Akravi #8', 0, 3, 0, 0, 0, 0, 32, NULL, 0),
(172, 0, -1, 0, 0, 'Akravi #9', 0, 3, 0, 0, 0, 0, 14, NULL, 0),
(173, 0, -1, 0, 0, 'Akravi #10', 0, 3, 0, 0, 0, 0, 14, NULL, 0),
(174, 0, -1, 0, 0, 'Akravi #11', 0, 3, 0, 0, 0, 0, 14, NULL, 0),
(175, 0, -1, 0, 0, 'Akravi #12', 0, 3, 0, 0, 0, 0, 32, NULL, 0),
(176, 0, -1, 0, 0, 'Akravi #13', 0, 3, 0, 0, 0, 0, 14, NULL, 0),
(177, 0, -1, 0, 0, 'Akravi #14', 0, 3, 0, 0, 0, 0, 14, NULL, 0),
(178, 0, -1, 0, 0, 'Akravi #15', 0, 3, 0, 0, 0, 0, 14, NULL, 0),
(179, 0, -1, 0, 0, 'Akravi #16', 0, 3, 0, 0, 0, 0, 32, NULL, 0),
(180, 0, -1, 0, 0, 'Akravi #17', 0, 3, 0, 0, 0, 0, 4, NULL, 0),
(181, 0, -1, 0, 0, 'Akravi #18', 0, 3, 0, 0, 0, 0, 44, NULL, 0),
(182, 0, -1, 0, 0, 'Akravi #19', 0, 3, 0, 0, 0, 0, 20, NULL, 0),
(183, 0, -1, 0, 0, 'Akravi #20', 0, 3, 0, 0, 0, 0, 26, NULL, 0),
(184, 0, -1, 0, 0, 'Akravi #21', 0, 3, 0, 0, 0, 0, 6, NULL, 0),
(185, 0, -1, 0, 0, 'Akravi #22', 0, 3, 0, 0, 0, 0, 4, NULL, 0),
(186, 0, -1, 0, 0, 'Akravi #23', 0, 3, 0, 0, 0, 0, 6, NULL, 0),
(187, 0, -1, 0, 0, 'Akravi #24', 0, 3, 0, 0, 0, 0, 4, NULL, 0),
(188, 0, -1, 0, 0, 'Akravi #25', 0, 3, 0, 0, 0, 0, 14, NULL, 0),
(189, 0, -1, 0, 0, 'Akravi #26', 0, 3, 0, 0, 0, 0, 14, NULL, 0),
(190, 0, -1, 0, 0, 'Akravi #27', 0, 3, 0, 0, 0, 0, 14, NULL, 0),
(191, 0, -1, 0, 0, 'Akravi #28', 0, 3, 0, 0, 0, 0, 14, NULL, 0),
(192, 0, -1, 0, 0, 'Akravi #29', 0, 3, 0, 0, 0, 0, 14, NULL, 0),
(193, 0, -1, 0, 0, 'Akravi #30', 0, 3, 0, 0, 0, 0, 21, NULL, 0),
(194, 0, -1, 0, 0, 'Akravi #31', 0, 3, 0, 0, 0, 0, 4, NULL, 0),
(195, 0, -1, 0, 0, 'Akravi #32', 0, 3, 0, 0, 0, 0, 10, NULL, 0),
(196, 0, -1, 0, 0, 'Akravi #33', 0, 3, 0, 0, 0, 0, 10, NULL, 0),
(197, 0, -1, 0, 0, 'Akravi #34', 0, 3, 0, 0, 0, 0, 10, NULL, 0),
(198, 0, -1, 0, 0, 'Akravi #35', 0, 3, 0, 0, 0, 0, 10, NULL, 0),
(199, 0, -1, 0, 0, 'Wintermere #1', 0, 6, 0, 0, 0, 0, 66, NULL, 0),
(200, 0, -1, 0, 0, 'Wintermere #2', 0, 6, 0, 0, 0, 0, 31, NULL, 0),
(201, 0, -1, 0, 0, 'Wintermere #3', 0, 6, 0, 0, 0, 0, 13, NULL, 0),
(202, 0, -1, 0, 0, 'Wintermere #4', 0, 6, 0, 0, 0, 0, 61, NULL, 0),
(203, 0, -1, 0, 0, 'Wintermere #5', 0, 6, 0, 0, 0, 0, 106, NULL, 0),
(204, 0, -1, 0, 0, 'Wintermere #6', 0, 6, 0, 0, 0, 0, 93, NULL, 0),
(205, 0, -1, 0, 0, 'Wintermere #7', 0, 6, 0, 0, 0, 0, 37, NULL, 0),
(206, 0, -1, 0, 0, 'Wintermere #8', 0, 6, 0, 0, 0, 0, 29, NULL, 0),
(207, 0, -1, 0, 0, 'Wintermere #9', 0, 6, 0, 0, 0, 0, 23, NULL, 0),
(208, 0, -1, 0, 0, 'Wintermere #10', 0, 6, 0, 0, 0, 0, 47, NULL, 0),
(209, 0, -1, 0, 0, 'Wintermere #11', 0, 6, 0, 0, 0, 0, 51, NULL, 0),
(210, 0, -1, 0, 0, 'Wintermere #12', 0, 6, 0, 0, 0, 0, 97, NULL, 0),
(211, 0, -1, 0, 0, 'Wintermere #13', 0, 6, 0, 0, 0, 0, 37, NULL, 0),
(212, 0, -1, 0, 0, 'Wintermere #14', 0, 6, 0, 0, 0, 0, 21, NULL, 0),
(213, 0, -1, 0, 0, 'Wintermere #15', 0, 6, 0, 0, 0, 0, 72, NULL, 0),
(214, 0, -1, 0, 0, 'Wintermere #16', 0, 6, 0, 0, 0, 0, 56, NULL, 0),
(215, 0, -1, 0, 0, 'Wintermere #17', 0, 6, 0, 0, 0, 0, 89, NULL, 0),
(216, 0, -1, 0, 0, 'Wintermere #18', 0, 6, 0, 0, 0, 0, 54, NULL, 0),
(217, 0, -1, 0, 0, 'Wintermere #19', 0, 6, 0, 0, 0, 0, 64, NULL, 0),
(218, 0, -1, 0, 0, 'Wintermere #20', 0, 6, 0, 0, 0, 0, 23, NULL, 0),
(219, 0, -1, 0, 0, 'Wintermere #21', 0, 6, 0, 0, 0, 0, 23, NULL, 0),
(220, 0, -1, 0, 0, 'Wintermere #22', 0, 6, 0, 0, 0, 0, 62, NULL, 0),
(221, 0, -1, 0, 0, 'Wintermere #23', 0, 6, 0, 0, 0, 0, 40, NULL, 0),
(222, 0, -1, 0, 0, 'Wintermere #24', 0, 6, 0, 0, 0, 0, 31, NULL, 0),
(223, 0, -1, 0, 0, 'Wintermere #25', 0, 6, 0, 0, 0, 0, 57, NULL, 0),
(224, 0, -1, 0, 0, 'Al Arar #1', 0, 4, 0, 0, 0, 0, 34, NULL, 0),
(225, 0, -1, 0, 0, 'Al Arar #2', 0, 4, 0, 0, 0, 0, 42, NULL, 0),
(226, 0, -1, 0, 0, 'Al Arar #3', 0, 4, 0, 0, 0, 0, 15, NULL, 0),
(227, 0, -1, 0, 0, 'Al Arar #4', 0, 4, 0, 0, 0, 0, 50, NULL, 0),
(228, 0, -1, 0, 0, 'Al Arar #5', 0, 4, 0, 0, 0, 0, 17, NULL, 0),
(229, 0, -1, 0, 0, 'Al Arar #6', 0, 4, 0, 0, 0, 0, 15, NULL, 0),
(230, 0, -1, 0, 0, 'Al Arar #7', 0, 4, 0, 0, 0, 0, 69, NULL, 0),
(231, 0, -1, 0, 0, 'Al Arar #8', 0, 4, 0, 0, 0, 0, 54, NULL, 0),
(232, 0, -1, 0, 0, 'Al Arar #9', 0, 4, 0, 0, 0, 0, 26, NULL, 0),
(233, 0, -1, 0, 0, 'Al Arar #10', 0, 4, 0, 0, 0, 0, 24, NULL, 0),
(234, 0, -1, 0, 0, 'Al Arar #11', 0, 4, 0, 0, 0, 0, 12, NULL, 0),
(235, 0, -1, 0, 0, 'Al Arar #12', 0, 4, 0, 0, 0, 0, 170, NULL, 0),
(236, 0, -1, 0, 0, 'Al Arar #13', 0, 4, 0, 0, 0, 0, 9, NULL, 0),
(237, 0, -1, 0, 0, 'Shadow Wood #1', 0, 7, 0, 0, 0, 0, 12, NULL, 0),
(238, 0, -1, 0, 0, 'Shadow Wood #2', 0, 7, 0, 0, 0, 0, 12, NULL, 0),
(239, 0, -1, 0, 0, 'Shadow Wood #3', 0, 7, 0, 0, 0, 0, 12, NULL, 0),
(240, 0, -1, 0, 0, 'Shadow Wood #4', 0, 7, 0, 0, 0, 0, 12, NULL, 0),
(241, 0, -1, 0, 0, 'Shadow Wood #5', 0, 7, 0, 0, 0, 0, 15, NULL, 0),
(242, 0, -1, 0, 0, 'Shadow Wood #6', 0, 7, 0, 0, 0, 0, 9, NULL, 0),
(243, 0, -1, 0, 0, 'Shadow Wood #7', 0, 7, 0, 0, 0, 0, 9, NULL, 0),
(244, 0, -1, 0, 0, 'Shadow Wood #8', 0, 7, 0, 0, 0, 0, 9, NULL, 0),
(245, 0, -1, 0, 0, 'Shadow Wood #9', 0, 7, 0, 0, 0, 0, 9, NULL, 0),
(246, 0, -1, 0, 0, 'Shadow Wood #10', 0, 7, 0, 0, 0, 0, 40, NULL, 0),
(247, 0, -1, 0, 0, 'Shadow Wood #11', 0, 7, 0, 0, 0, 0, 9, NULL, 0),
(248, 0, -1, 0, 0, 'Shadow Wood #12', 0, 7, 0, 0, 0, 0, 6, NULL, 0),
(249, 0, -1, 0, 0, 'Shadow Wood #13', 0, 7, 0, 0, 0, 0, 51, NULL, 0),
(250, 0, -1, 0, 0, 'Fork Village #1', 0, 1, 0, 0, 0, 0, 12, NULL, 0),
(251, 0, -1, 0, 0, 'Fork Village #2', 0, 1, 0, 0, 0, 0, 20, NULL, 0),
(252, 0, -1, 0, 0, 'Fork Village #3', 0, 1, 0, 0, 0, 0, 14, NULL, 0),
(253, 0, -1, 0, 0, 'Fork Village #4', 0, 1, 0, 0, 0, 0, 16, NULL, 0),
(254, 0, -1, 0, 0, 'Fork Village #5', 0, 1, 0, 0, 0, 0, 28, NULL, 0),
(255, 0, -1, 0, 0, 'Fork Village #6', 0, 1, 0, 0, 0, 0, 19, NULL, 0),
(256, 0, -1, 0, 0, 'Fork Village #7', 0, 1, 0, 0, 0, 0, 15, NULL, 0),
(257, 0, -1, 0, 0, 'Fork Village #8', 0, 1, 0, 0, 0, 0, 10, NULL, 0),
(258, 0, -1, 0, 0, 'Fork Village #9', 0, 1, 0, 0, 0, 0, 15, NULL, 0),
(259, 0, -1, 0, 0, 'Fork Village #10', 0, 1, 0, 0, 0, 0, 38, NULL, 0),
(260, 0, -1, 0, 0, 'Fork Village #11', 0, 1, 0, 0, 0, 0, 17, NULL, 0),
(261, 0, -1, 0, 0, 'Fork Village #12', 0, 1, 0, 0, 0, 0, 15, NULL, 0),
(262, 0, -1, 0, 0, 'Fork Village #13', 0, 1, 0, 0, 0, 0, 8, NULL, 0),
(263, 0, -1, 0, 0, 'Thunder Hut #1', 0, 1, 0, 0, 0, 0, 10, NULL, 0),
(264, 0, -1, 0, 0, 'Thunder Hut #2', 0, 1, 0, 0, 0, 0, 10, NULL, 0),
(265, 0, -1, 0, 0, 'Thunder Hut #3', 0, 1, 0, 0, 0, 0, 10, NULL, 0),
(266, 0, -1, 0, 0, 'Thunder Hut #4', 0, 1, 0, 0, 0, 0, 7, NULL, 0),
(267, 0, -1, 0, 0, 'Thunder Hut #5', 0, 1, 0, 0, 0, 0, 7, NULL, 0),
(268, 0, -1, 0, 0, 'Premia #1', 0, 8, 0, 0, 0, 0, 360, NULL, 0),
(269, 0, -1, 0, 0, 'Premia #2', 0, 8, 0, 0, 0, 0, 415, NULL, 0),
(270, 0, -1, 0, 0, 'Premia #3', 0, 8, 0, 0, 0, 0, 242, NULL, 0),
(271, 0, -1, 0, 0, 'Premia #4', 0, 8, 0, 0, 0, 0, 242, NULL, 0),
(272, 0, -1, 0, 0, 'Premia #5', 0, 8, 0, 0, 0, 0, 242, NULL, 0),
(273, 0, -1, 0, 0, 'Premia #6', 0, 8, 0, 0, 0, 0, 368, NULL, 0),
(274, 0, -1, 0, 0, 'Premia #7', 0, 8, 0, 0, 0, 0, 154, NULL, 0),
(275, 0, -1, 0, 0, 'Premia #8', 0, 8, 0, 0, 0, 0, 154, NULL, 0),
(276, 0, -1, 0, 0, 'Premia #9', 0, 8, 0, 0, 0, 0, 154, NULL, 0),
(277, 0, -1, 0, 0, 'Premia #10', 0, 8, 0, 0, 0, 0, 509, NULL, 0),
(278, 0, -1, 0, 0, 'Premia #11', 0, 8, 0, 0, 0, 0, 206, NULL, 0),
(279, 0, -1, 0, 0, 'Premia #12', 0, 8, 0, 0, 0, 0, 250, NULL, 0),
(280, 0, -1, 0, 0, 'Premia #13', 0, 8, 0, 0, 0, 0, 630, NULL, 0),
(281, 0, -1, 0, 0, 'Premia #14', 0, 8, 0, 0, 0, 0, 154, NULL, 0),
(282, 0, -1, 0, 0, 'Premia #15', 0, 8, 0, 0, 0, 0, 154, NULL, 0),
(283, 0, -1, 0, 0, 'Premia #16', 0, 8, 0, 0, 0, 0, 154, NULL, 0),
(284, 0, -1, 0, 0, 'Premia #17', 0, 8, 0, 0, 0, 0, 154, NULL, 0),
(285, 0, -1, 0, 0, 'Premia #18', 0, 8, 0, 0, 0, 0, 154, NULL, 0),
(286, 0, -1, 0, 0, 'Premia Subsolo #1', 0, 8, 0, 0, 0, 0, 40, NULL, 0),
(287, 0, -1, 0, 0, 'Premia Subsolo #2', 0, 8, 0, 0, 0, 0, 40, NULL, 0),
(288, 0, -1, 0, 0, 'Premia Subsolo #3', 0, 8, 0, 0, 0, 0, 40, NULL, 0),
(289, 0, -1, 0, 0, 'Premia Subsolo #4', 0, 8, 0, 0, 0, 0, 40, NULL, 0),
(290, 0, -1, 0, 0, 'Premia Subsolo #5', 0, 8, 0, 0, 0, 0, 85, NULL, 0),
(291, 0, -1, 0, 0, 'Premia Subsolo #6', 0, 8, 0, 0, 0, 0, 49, NULL, 0),
(292, 0, -1, 0, 0, 'Premia Subsolo #7', 0, 8, 0, 0, 0, 0, 59, NULL, 0),
(293, 0, -1, 0, 0, 'Premia Subsolo #8', 0, 8, 0, 0, 0, 0, 147, NULL, 0),
(294, 0, -1, 0, 0, 'Premia Subsolo #9', 0, 8, 0, 0, 0, 0, 69, NULL, 0),
(295, 0, -1, 0, 0, 'Premia Subsolo #10', 0, 8, 0, 0, 0, 0, 84, NULL, 0),
(296, 0, -1, 0, 0, 'Premia Subsolo #11', 0, 8, 0, 0, 0, 0, 84, NULL, 0),
(297, 0, -1, 0, 0, 'Premia Subsolo #12', 0, 8, 0, 0, 0, 0, 186, NULL, 0),
(298, 0, -1, 0, 0, 'Thunder Farm #1', 0, 1, 0, 0, 0, 0, 143, NULL, 0),
(299, 0, -1, 0, 0, 'Thunder House #98', 0, 1, 0, 0, 0, 0, 24, NULL, 0),
(300, 0, -1, 0, 0, 'Thunder House #99', 0, 1, 0, 0, 0, 0, 7, NULL, 0),
(2628, 0, -1, 0, 0, 'Castle of the Winds', 500000, 5, 0, 0, 0, 0, 514, NULL, 0),
(2629, 0, -1, 0, 0, 'Ab\'Dendriel Clanhall', 250000, 5, 0, 0, 0, 0, 326, NULL, 0),
(2630, 0, -1, 0, 0, 'Underwood 9', 50000, 5, 0, 0, 0, 0, 14, NULL, 0),
(2631, 0, -1, 0, 0, 'Treetop 13', 100000, 5, 0, 0, 0, 0, 28, NULL, 0),
(2632, 0, -1, 0, 0, 'Underwood 8', 50000, 5, 0, 0, 0, 0, 23, NULL, 0),
(2633, 0, -1, 0, 0, 'Treetop 11', 50000, 5, 0, 0, 0, 0, 24, NULL, 0),
(2635, 0, -1, 0, 0, 'Great Willow 2a', 50000, 5, 0, 0, 0, 0, 20, NULL, 0),
(2637, 0, -1, 0, 0, 'Great Willow 2b', 50000, 5, 0, 0, 0, 0, 25, NULL, 0),
(2638, 0, -1, 0, 0, 'Great Willow Western Wing', 100000, 5, 0, 0, 0, 0, 61, NULL, 0),
(2640, 0, -1, 0, 0, 'Great Willow 1', 100000, 5, 0, 0, 0, 0, 35, NULL, 0),
(2642, 0, -1, 0, 0, 'Great Willow 3a', 50000, 5, 0, 0, 0, 0, 19, NULL, 0),
(2644, 0, -1, 0, 0, 'Great Willow 3b', 80000, 5, 0, 0, 0, 0, 40, NULL, 0),
(2645, 0, -1, 0, 0, 'Great Willow 4a', 25000, 5, 0, 0, 0, 0, 19, NULL, 0),
(2648, 0, -1, 0, 0, 'Great Willow 4b', 25000, 5, 0, 0, 0, 0, 19, NULL, 0),
(2649, 0, -1, 0, 0, 'Underwood 6', 100000, 5, 0, 0, 0, 0, 40, NULL, 0),
(2650, 0, -1, 0, 0, 'Underwood 3', 100000, 5, 0, 0, 0, 0, 39, NULL, 0),
(2651, 0, -1, 0, 0, 'Underwood 5', 80000, 5, 0, 0, 0, 0, 33, NULL, 0),
(2652, 0, -1, 0, 0, 'Underwood 2', 100000, 5, 0, 0, 0, 0, 37, NULL, 0),
(2653, 0, -1, 0, 0, 'Underwood 1', 100000, 5, 0, 0, 0, 0, 39, NULL, 0),
(2654, 0, -1, 0, 0, 'Prima Arbor', 400000, 5, 0, 0, 0, 0, 200, NULL, 0),
(2655, 0, -1, 0, 0, 'Underwood 7', 200000, 5, 0, 0, 0, 0, 34, NULL, 0),
(2656, 0, -1, 0, 0, 'Underwood 10', 25000, 5, 0, 0, 0, 0, 19, NULL, 0),
(2657, 0, -1, 0, 0, 'Underwood 4', 100000, 5, 0, 0, 0, 0, 50, NULL, 0),
(2658, 0, -1, 0, 0, 'Treetop 9', 50000, 5, 0, 0, 0, 0, 24, NULL, 0),
(2659, 0, -1, 0, 0, 'Treetop 10', 80000, 5, 0, 0, 0, 0, 28, NULL, 0),
(2660, 0, -1, 0, 0, 'Treetop 8', 25000, 5, 0, 0, 0, 0, 22, NULL, 0),
(2661, 0, -1, 0, 0, 'Treetop 7', 50000, 5, 0, 0, 0, 0, 20, NULL, 0),
(2662, 0, -1, 0, 0, 'Treetop 6', 25000, 5, 0, 0, 0, 0, 17, NULL, 0),
(2663, 0, -1, 0, 0, 'Treetop 5 (Shop)', 80000, 5, 0, 0, 0, 0, 36, NULL, 0),
(2664, 0, -1, 0, 0, 'Treetop 12 (Shop)', 100000, 5, 0, 0, 0, 0, 39, NULL, 0),
(2665, 0, -1, 0, 0, 'Treetop 4 (Shop)', 80000, 5, 0, 0, 0, 0, 31, NULL, 0),
(2666, 0, -1, 0, 0, 'Treetop 3 (Shop)', 80000, 5, 0, 0, 0, 0, 36, NULL, 0),
(2687, 0, -1, 0, 0, 'Northern Street 1a', 100000, 6, 0, 0, 0, 0, 26, NULL, 0),
(2688, 0, -1, 0, 0, 'Park Lane 3a', 100000, 6, 0, 0, 0, 0, 36, NULL, 0),
(2689, 0, -1, 0, 0, 'Park Lane 1a', 150000, 6, 0, 0, 0, 0, 36, NULL, 0),
(2690, 0, -1, 0, 0, 'Park Lane 4', 150000, 6, 0, 0, 0, 0, 27, NULL, 0),
(2691, 0, -1, 0, 0, 'Park Lane 2', 150000, 6, 0, 0, 0, 0, 28, NULL, 0),
(2692, 0, -1, 0, 0, 'Theater Avenue 7, Flat 04', 50000, 6, 0, 0, 0, 0, 15, NULL, 0),
(2693, 0, -1, 0, 0, 'Theater Avenue 7, Flat 03', 25000, 6, 0, 0, 0, 0, 13, NULL, 0),
(2694, 0, -1, 0, 0, 'Theater Avenue 7, Flat 05', 50000, 6, 0, 0, 0, 0, 13, NULL, 0),
(2695, 0, -1, 0, 0, 'Theater Avenue 7, Flat 06', 25000, 6, 0, 0, 0, 0, 13, NULL, 0),
(2696, 0, -1, 0, 0, 'Theater Avenue 7, Flat 02', 25000, 6, 0, 0, 0, 0, 15, NULL, 0),
(2697, 0, -1, 0, 0, 'Theater Avenue 7, Flat 01', 25000, 6, 0, 0, 0, 0, 13, NULL, 0),
(2698, 0, -1, 0, 0, 'Northern Street 5', 200000, 6, 0, 0, 0, 0, 52, NULL, 0),
(2699, 0, -1, 0, 0, 'Northern Street 7', 150000, 6, 0, 0, 0, 0, 44, NULL, 0),
(2700, 0, -1, 0, 0, 'Theater Avenue 6e', 80000, 6, 0, 0, 0, 0, 25, NULL, 0),
(2701, 0, -1, 0, 0, 'Theater Avenue 6c', 25000, 6, 0, 0, 0, 0, 9, NULL, 0),
(2702, 0, -1, 0, 0, 'Theater Avenue 6a', 80000, 6, 0, 0, 0, 0, 24, NULL, 0),
(2703, 0, -1, 0, 0, 'Theater Avenue, Tower', 300000, 6, 0, 0, 0, 0, 80, NULL, 0),
(2705, 0, -1, 0, 0, 'East Lane 2', 300000, 6, 0, 0, 0, 0, 93, NULL, 0),
(2706, 0, -1, 0, 0, 'Harbour Lane 2a (Shop)', 80000, 6, 0, 0, 0, 0, 18, NULL, 0),
(2707, 0, -1, 0, 0, 'Harbour Lane 2b (Shop)', 80000, 6, 0, 0, 0, 0, 21, NULL, 0),
(2708, 0, -1, 0, 0, 'Harbour Lane 3', 400000, 6, 0, 0, 0, 0, 92, NULL, 0),
(2709, 0, -1, 0, 0, 'Magician\'s Alley 8', 150000, 6, 0, 0, 0, 0, 31, NULL, 0),
(2710, 0, -1, 0, 0, 'Lonely Sea Side Hostel', 400000, 6, 0, 0, 0, 0, 331, NULL, 0),
(2711, 0, -1, 0, 0, 'Suntower', 500000, 6, 0, 0, 0, 0, 306, NULL, 0),
(2712, 0, -1, 0, 0, 'House of Recreation', 500000, 6, 0, 0, 0, 0, 469, NULL, 0),
(2713, 0, -1, 0, 0, 'Carlin Clanhall', 250000, 6, 0, 0, 0, 0, 287, NULL, 0),
(2714, 0, -1, 0, 0, 'Magician\'s Alley 4', 200000, 6, 0, 0, 0, 0, 60, NULL, 0),
(2715, 0, -1, 0, 0, 'Theater Avenue 14 (Shop)', 200000, 6, 0, 0, 0, 0, 54, NULL, 0),
(2716, 0, -1, 0, 0, 'Theater Avenue 12', 80000, 6, 0, 0, 0, 0, 21, NULL, 0),
(2717, 0, -1, 0, 0, 'Magician\'s Alley 1', 100000, 6, 0, 0, 0, 0, 23, NULL, 0),
(2718, 0, -1, 0, 0, 'Theater Avenue 10', 100000, 6, 0, 0, 0, 0, 29, NULL, 0),
(2719, 0, -1, 0, 0, 'Magician\'s Alley 1b', 25000, 6, 0, 0, 0, 0, 16, NULL, 0),
(2720, 0, -1, 0, 0, 'Magician\'s Alley 1a', 25000, 6, 0, 0, 0, 0, 16, NULL, 0),
(2721, 0, -1, 0, 0, 'Magician\'s Alley 1c', 25000, 6, 0, 0, 0, 0, 13, NULL, 0),
(2722, 0, -1, 0, 0, 'Magician\'s Alley 1d', 25000, 6, 0, 0, 0, 0, 16, NULL, 0),
(2723, 0, -1, 0, 0, 'Magician\'s Alley 5c', 100000, 6, 0, 0, 0, 0, 25, NULL, 0),
(2724, 0, -1, 0, 0, 'Magician\'s Alley 5f', 80000, 6, 0, 0, 0, 0, 28, NULL, 0),
(2725, 0, -1, 0, 0, 'Magician\'s Alley 5b', 50000, 6, 0, 0, 0, 0, 25, NULL, 0),
(2727, 0, -1, 0, 0, 'Magician\'s Alley 5a', 50000, 6, 0, 0, 0, 0, 30, NULL, 0),
(2729, 0, -1, 0, 0, 'Central Plaza 3 (Shop)', 50000, 6, 0, 0, 0, 0, 17, NULL, 0),
(2730, 0, -1, 0, 0, 'Central Plaza 2 (Shop)', 25000, 6, 0, 0, 0, 0, 15, NULL, 0),
(2731, 0, -1, 0, 0, 'Central Plaza 1 (Shop)', 50000, 6, 0, 0, 0, 0, 19, NULL, 0),
(2732, 0, -1, 0, 0, 'Theater Avenue 8b', 100000, 6, 0, 0, 0, 0, 31, NULL, 0),
(2733, 0, -1, 0, 0, 'Harbour Lane 1 (Shop)', 100000, 6, 0, 0, 0, 0, 31, NULL, 0),
(2734, 0, -1, 0, 0, 'Theater Avenue 6f', 80000, 6, 0, 0, 0, 0, 24, NULL, 0),
(2735, 0, -1, 0, 0, 'Theater Avenue 6d', 25000, 6, 0, 0, 0, 0, 7, NULL, 0),
(2736, 0, -1, 0, 0, 'Theater Avenue 6b', 50000, 6, 0, 0, 0, 0, 25, NULL, 0),
(2737, 0, -1, 0, 0, 'Northern Street 3a', 80000, 6, 0, 0, 0, 0, 20, NULL, 0),
(2738, 0, -1, 0, 0, 'Northern Street 3b', 80000, 6, 0, 0, 0, 0, 22, NULL, 0),
(2739, 0, -1, 0, 0, 'Northern Street 1b', 80000, 6, 0, 0, 0, 0, 25, NULL, 0),
(2740, 0, -1, 0, 0, 'Northern Street 1c', 80000, 6, 0, 0, 0, 0, 21, NULL, 0),
(2741, 0, -1, 0, 0, 'Theater Avenue 7, Flat 14', 25000, 6, 0, 0, 0, 0, 13, NULL, 0),
(2742, 0, -1, 0, 0, 'Theater Avenue 7, Flat 13', 25000, 6, 0, 0, 0, 0, 14, NULL, 0),
(2743, 0, -1, 0, 0, 'Theater Avenue 7, Flat 15', 25000, 6, 0, 0, 0, 0, 12, NULL, 0),
(2744, 0, -1, 0, 0, 'Theater Avenue 7, Flat 12', 25000, 6, 0, 0, 0, 0, 14, NULL, 0),
(2745, 0, -1, 0, 0, 'Theater Avenue 7, Flat 11', 50000, 6, 0, 0, 0, 0, 21, NULL, 0),
(2746, 0, -1, 0, 0, 'Theater Avenue 7, Flat 16', 25000, 6, 0, 0, 0, 0, 16, NULL, 0),
(2747, 0, -1, 0, 0, 'Theater Avenue 5', 200000, 6, 0, 0, 0, 0, 113, NULL, 0),
(2751, 0, -1, 0, 0, 'Harbour Flats, Flat 11', 25000, 6, 0, 0, 0, 0, 17, NULL, 0),
(2752, 0, -1, 0, 0, 'Harbour Flats, Flat 13', 25000, 6, 0, 0, 0, 0, 17, NULL, 0),
(2753, 0, -1, 0, 0, 'Harbour Flats, Flat 15', 50000, 6, 0, 0, 0, 0, 27, NULL, 0),
(2755, 0, -1, 0, 0, 'Harbour Flats, Flat 12', 50000, 6, 0, 0, 0, 0, 33, NULL, 0),
(2757, 0, -1, 0, 0, 'Harbour Flats, Flat 16', 50000, 6, 0, 0, 0, 0, 35, NULL, 0),
(2759, 0, -1, 0, 0, 'Harbour Flats, Flat 21', 50000, 6, 0, 0, 0, 0, 23, NULL, 0),
(2760, 0, -1, 0, 0, 'Harbour Flats, Flat 22', 80000, 6, 0, 0, 0, 0, 30, NULL, 0),
(2761, 0, -1, 0, 0, 'Harbour Flats, Flat 23', 25000, 6, 0, 0, 0, 0, 17, NULL, 0),
(2763, 0, -1, 0, 0, 'Park Lane 1b', 200000, 6, 0, 0, 0, 0, 39, NULL, 0),
(2764, 0, -1, 0, 0, 'Theater Avenue 8a', 100000, 6, 0, 0, 0, 0, 31, NULL, 0),
(2765, 0, -1, 0, 0, 'Theater Avenue 11a', 100000, 6, 0, 0, 0, 0, 32, NULL, 0),
(2767, 0, -1, 0, 0, 'Theater Avenue 11b', 100000, 6, 0, 0, 0, 0, 31, NULL, 0),
(2768, 0, -1, 0, 0, 'Caretaker\'s Residence', 600000, 6, 0, 0, 0, 0, 298, NULL, 0),
(2769, 0, -1, 0, 0, 'Moonkeep', 250000, 6, 0, 0, 0, 0, 298, NULL, 0),
(2770, 0, -1, 0, 0, 'Mangrove 1', 80000, 5, 0, 0, 0, 0, 39, NULL, 0),
(2771, 0, -1, 0, 0, 'Coastwood 2', 50000, 5, 0, 0, 0, 0, 20, NULL, 0),
(2772, 0, -1, 0, 0, 'Coastwood 1', 50000, 5, 0, 0, 0, 0, 23, NULL, 0),
(2773, 0, -1, 0, 0, 'Coastwood 3', 50000, 5, 0, 0, 0, 0, 27, NULL, 0),
(2774, 0, -1, 0, 0, 'Coastwood 4', 50000, 5, 0, 0, 0, 0, 25, NULL, 0),
(2775, 0, -1, 0, 0, 'Mangrove 4', 50000, 5, 0, 0, 0, 0, 23, NULL, 0),
(2776, 0, -1, 0, 0, 'Coastwood 10', 80000, 5, 0, 0, 0, 0, 32, NULL, 0),
(2777, 0, -1, 0, 0, 'Coastwood 5', 50000, 5, 0, 0, 0, 0, 33, NULL, 0),
(2778, 0, -1, 0, 0, 'Coastwood 6 (Shop)', 80000, 5, 0, 0, 0, 0, 32, NULL, 0),
(2779, 0, -1, 0, 0, 'Coastwood 7', 25000, 5, 0, 0, 0, 0, 16, NULL, 0),
(2780, 0, -1, 0, 0, 'Coastwood 8', 50000, 5, 0, 0, 0, 0, 30, NULL, 0),
(2781, 0, -1, 0, 0, 'Coastwood 9', 50000, 5, 0, 0, 0, 0, 25, NULL, 0),
(2782, 0, -1, 0, 0, 'Treetop 2', 25000, 5, 0, 0, 0, 0, 18, NULL, 0),
(2783, 0, -1, 0, 0, 'Treetop 1', 25000, 5, 0, 0, 0, 0, 17, NULL, 0),
(2784, 0, -1, 0, 0, 'Mangrove 3', 80000, 5, 0, 0, 0, 0, 27, NULL, 0),
(2785, 0, -1, 0, 0, 'Mangrove 2', 50000, 5, 0, 0, 0, 0, 32, NULL, 0),
(2786, 0, -1, 0, 0, 'The Hideout', 250000, 5, 0, 0, 0, 0, 449, NULL, 0),
(2787, 0, -1, 0, 0, 'Shadow Towers', 250000, 5, 0, 0, 0, 0, 429, NULL, 0),
(2788, 0, -1, 0, 0, 'Druids Retreat A', 50000, 6, 0, 0, 0, 0, 32, NULL, 0),
(2789, 0, -1, 0, 0, 'Druids Retreat C', 50000, 6, 0, 0, 0, 0, 27, NULL, 0),
(2790, 0, -1, 0, 0, 'Druids Retreat B', 50000, 6, 0, 0, 0, 0, 31, NULL, 0),
(2791, 0, -1, 0, 0, 'Druids Retreat D', 80000, 6, 0, 0, 0, 0, 27, NULL, 0),
(2792, 0, -1, 0, 0, 'East Lane 1b', 150000, 6, 0, 0, 0, 0, 43, NULL, 0),
(2793, 0, -1, 0, 0, 'East Lane 1a', 200000, 6, 0, 0, 0, 0, 62, NULL, 0),
(2794, 0, -1, 0, 0, 'Senja Village 11', 80000, 6, 0, 0, 0, 0, 59, NULL, 0),
(2795, 0, -1, 0, 0, 'Senja Village 10', 50000, 6, 0, 0, 0, 0, 36, NULL, 0),
(2796, 0, -1, 0, 0, 'Senja Village 9', 80000, 6, 0, 0, 0, 0, 55, NULL, 0),
(2797, 0, -1, 0, 0, 'Senja Village 8', 50000, 6, 0, 0, 0, 0, 40, NULL, 0),
(2798, 0, -1, 0, 0, 'Senja Village 7', 25000, 6, 0, 0, 0, 0, 19, NULL, 0),
(2799, 0, -1, 0, 0, 'Senja Village 6b', 25000, 6, 0, 0, 0, 0, 19, NULL, 0),
(2800, 0, -1, 0, 0, 'Senja Village 6a', 50000, 6, 0, 0, 0, 0, 18, NULL, 0),
(2801, 0, -1, 0, 0, 'Senja Village 5', 50000, 6, 0, 0, 0, 0, 28, NULL, 0),
(2802, 0, -1, 0, 0, 'Senja Village 4', 50000, 6, 0, 0, 0, 0, 38, NULL, 0),
(2803, 0, -1, 0, 0, 'Senja Village 3', 50000, 6, 0, 0, 0, 0, 35, NULL, 0),
(2804, 0, -1, 0, 0, 'Senja Village 1b', 50000, 6, 0, 0, 0, 0, 38, NULL, 0),
(2805, 0, -1, 0, 0, 'Senja Village 1a', 25000, 6, 0, 0, 0, 0, 19, NULL, 0),
(2806, 0, -1, 0, 0, 'Rosebud C', 100000, 6, 0, 0, 0, 0, 36, NULL, 0),
(2807, 0, -1, 0, 0, 'Rosebud B', 80000, 6, 0, 0, 0, 0, 29, NULL, 0),
(2808, 0, -1, 0, 0, 'Rosebud A', 50000, 6, 0, 0, 0, 0, 29, NULL, 0),
(2809, 0, -1, 0, 0, 'Park Lane 3b', 100000, 6, 0, 0, 0, 0, 29, NULL, 0),
(2810, 0, -1, 0, 0, 'Northport Village 6', 80000, 6, 0, 0, 0, 0, 42, NULL, 0),
(2811, 0, -1, 0, 0, 'Northport Village 5', 80000, 6, 0, 0, 0, 0, 34, NULL, 0),
(2812, 0, -1, 0, 0, 'Northport Village 4', 100000, 6, 0, 0, 0, 0, 50, NULL, 0),
(2813, 0, -1, 0, 0, 'Northport Village 3', 150000, 6, 0, 0, 0, 0, 104, NULL, 0),
(2814, 0, -1, 0, 0, 'Northport Village 2', 50000, 6, 0, 0, 0, 0, 28, NULL, 0),
(2815, 0, -1, 0, 0, 'Northport Village 1', 50000, 6, 0, 0, 0, 0, 28, NULL, 0),
(2816, 0, -1, 0, 0, 'Nautic Observer', 200000, 6, 0, 0, 0, 0, 220, NULL, 0),
(2817, 0, -1, 0, 0, 'Nordic Stronghold', 250000, 6, 0, 0, 0, 0, 536, NULL, 0),
(2818, 0, -1, 0, 0, 'Senja Clanhall', 250000, 6, 0, 0, 0, 0, 228, NULL, 0),
(2819, 0, -1, 0, 0, 'Seawatch', 250000, 6, 0, 0, 0, 0, 431, NULL, 0),
(2820, 0, -1, 0, 0, 'Dwarven Magnate\'s Estate', 300000, 7, 0, 0, 0, 0, 269, NULL, 0),
(2821, 0, -1, 0, 0, 'Forge Master\'s Quarters', 300000, 7, 0, 0, 0, 0, 79, NULL, 0),
(2822, 0, -1, 0, 0, 'Upper Barracks 13', 25000, 7, 0, 0, 0, 0, 16, NULL, 0),
(2823, 0, -1, 0, 0, 'Upper Barracks 5', 80000, 7, 0, 0, 0, 0, 27, NULL, 0),
(2824, 0, -1, 0, 0, 'Upper Barracks 3', 80000, 7, 0, 0, 0, 0, 16, NULL, 0),
(2825, 0, -1, 0, 0, 'Upper Barracks 4', 50000, 7, 0, 0, 0, 0, 16, NULL, 0),
(2826, 0, -1, 0, 0, 'Upper Barracks 2', 80000, 7, 0, 0, 0, 0, 27, NULL, 0),
(2827, 0, -1, 0, 0, 'Upper Barracks 1', 50000, 7, 0, 0, 0, 0, 16, NULL, 0),
(2828, 0, -1, 0, 0, 'Tunnel Gardens 9', 150000, 7, 0, 0, 0, 0, 74, NULL, 0),
(2829, 0, -1, 0, 0, 'Tunnel Gardens 8', 25000, 7, 0, 0, 0, 0, 24, NULL, 0),
(2830, 0, -1, 0, 0, 'Tunnel Gardens 7', 50000, 7, 0, 0, 0, 0, 21, NULL, 0),
(2831, 0, -1, 0, 0, 'Tunnel Gardens 6', 25000, 7, 0, 0, 0, 0, 21, NULL, 0),
(2832, 0, -1, 0, 0, 'Tunnel Gardens 5', 25000, 7, 0, 0, 0, 0, 21, NULL, 0),
(2835, 0, -1, 0, 0, 'Tunnel Gardens 4', 80000, 7, 0, 0, 0, 0, 33, NULL, 0),
(2836, 0, -1, 0, 0, 'Tunnel Gardens 2', 80000, 7, 0, 0, 0, 0, 27, NULL, 0),
(2837, 0, -1, 0, 0, 'Tunnel Gardens 1', 80000, 7, 0, 0, 0, 0, 27, NULL, 0),
(2838, 0, -1, 0, 0, 'Tunnel Gardens 3', 80000, 7, 0, 0, 0, 0, 33, NULL, 0),
(2839, 0, -1, 0, 0, 'The Market 4 (Shop)', 80000, 7, 0, 0, 0, 0, 32, NULL, 0),
(2840, 0, -1, 0, 0, 'The Market 3 (Shop)', 80000, 7, 0, 0, 0, 0, 26, NULL, 0),
(2841, 0, -1, 0, 0, 'The Market 2 (Shop)', 50000, 7, 0, 0, 0, 0, 23, NULL, 0),
(2842, 0, -1, 0, 0, 'The Market 1 (Shop)', 25000, 7, 0, 0, 0, 0, 11, NULL, 0),
(2843, 0, -1, 0, 0, 'The Farms 6, Fishing Hut', 50000, 7, 0, 0, 0, 0, 26, NULL, 0),
(2844, 0, -1, 0, 0, 'The Farms 5', 50000, 7, 0, 0, 0, 0, 26, NULL, 0),
(2845, 0, -1, 0, 0, 'The Farms 4', 25000, 7, 0, 0, 0, 0, 26, NULL, 0),
(2846, 0, -1, 0, 0, 'The Farms 3', 80000, 7, 0, 0, 0, 0, 26, NULL, 0),
(2847, 0, -1, 0, 0, 'The Farms 2', 50000, 7, 0, 0, 0, 0, 26, NULL, 0),
(2849, 0, -1, 0, 0, 'The Farms 1', 80000, 7, 0, 0, 0, 0, 57, NULL, 0),
(2850, 0, -1, 0, 0, 'Outlaw Camp 14 (Shop)', 25000, 7, 0, 0, 0, 0, 31, NULL, 0),
(2852, 0, -1, 0, 0, 'Outlaw Camp 13 (Shop)', 50000, 7, 0, 0, 0, 0, 33, NULL, 0),
(2853, 0, -1, 0, 0, 'Outlaw Camp 9', 80000, 7, 0, 0, 0, 0, 36, NULL, 0),
(2854, 0, -1, 0, 0, 'Outlaw Camp 7', 25000, 7, 0, 0, 0, 0, 33, NULL, 0),
(2855, 0, -1, 0, 0, 'Outlaw Camp 4', 50000, 7, 0, 0, 0, 0, 31, NULL, 0),
(2856, 0, -1, 0, 0, 'Outlaw Camp 2', 50000, 7, 0, 0, 0, 0, 33, NULL, 0),
(2857, 0, -1, 0, 0, 'Outlaw Camp 3', 50000, 7, 0, 0, 0, 0, 29, NULL, 0),
(2858, 0, -1, 0, 0, 'Outlaw Camp 1', 80000, 7, 0, 0, 0, 0, 47, NULL, 0),
(2859, 0, -1, 0, 0, 'Nobility Quarter 5', 100000, 7, 0, 0, 0, 0, 141, NULL, 0),
(2860, 0, -1, 0, 0, 'Nobility Quarter 4', 50000, 7, 0, 0, 0, 0, 65, NULL, 0),
(2861, 0, -1, 0, 0, 'Nobility Quarter 3', 80000, 7, 0, 0, 0, 0, 51, NULL, 0),
(2862, 0, -1, 0, 0, 'Nobility Quarter 2', 50000, 7, 0, 0, 0, 0, 58, NULL, 0),
(2863, 0, -1, 0, 0, 'Nobility Quarter 1', 80000, 7, 0, 0, 0, 0, 63, NULL, 0),
(2864, 0, -1, 0, 0, 'Lower Barracks 10', 80000, 7, 0, 0, 0, 0, 25, NULL, 0),
(2865, 0, -1, 0, 0, 'Lower Barracks 9', 80000, 7, 0, 0, 0, 0, 25, NULL, 0),
(2866, 0, -1, 0, 0, 'Lower Barracks 8', 80000, 7, 0, 0, 0, 0, 25, NULL, 0),
(2867, 0, -1, 0, 0, 'Lower Barracks 1', 80000, 7, 0, 0, 0, 0, 27, NULL, 0),
(2868, 0, -1, 0, 0, 'Lower Barracks 2', 80000, 7, 0, 0, 0, 0, 27, NULL, 0),
(2869, 0, -1, 0, 0, 'Lower Barracks 3', 80000, 7, 0, 0, 0, 0, 27, NULL, 0),
(2870, 0, -1, 0, 0, 'Lower Barracks 4', 50000, 7, 0, 0, 0, 0, 28, NULL, 0),
(2871, 0, -1, 0, 0, 'Lower Barracks 5', 100000, 7, 0, 0, 0, 0, 63, NULL, 0),
(2872, 0, -1, 0, 0, 'Lower Barracks 6', 100000, 7, 0, 0, 0, 0, 63, NULL, 0),
(2873, 0, -1, 0, 0, 'Lower Barracks 7', 80000, 7, 0, 0, 0, 0, 28, NULL, 0),
(2874, 0, -1, 0, 0, 'Wolftower', 500000, 7, 0, 0, 0, 0, 402, NULL, 0),
(2875, 0, -1, 0, 0, 'Riverspring', 250000, 7, 0, 0, 0, 0, 371, NULL, 0),
(2876, 0, -1, 0, 0, 'Outlaw Castle', 250000, 7, 0, 0, 0, 0, 302, NULL, 0),
(2877, 0, -1, 0, 0, 'Marble Guildhall', 250000, 7, 0, 0, 0, 0, 410, NULL, 0),
(2878, 0, -1, 0, 0, 'Iron Guildhall', 250000, 7, 0, 0, 0, 0, 379, NULL, 0),
(2879, 0, -1, 0, 0, 'Hill Hideout', 250000, 7, 0, 0, 0, 0, 247, NULL, 0),
(2880, 0, -1, 0, 0, 'Granite Guildhall', 250000, 7, 0, 0, 0, 0, 506, NULL, 0),
(2881, 0, -1, 0, 0, 'Alai Flats, Flat 01', 50000, 8, 0, 0, 0, 0, 17, NULL, 0),
(2882, 0, -1, 0, 0, 'Alai Flats, Flat 02', 50000, 8, 0, 0, 0, 0, 18, NULL, 0),
(2883, 0, -1, 0, 0, 'Alai Flats, Flat 03', 50000, 8, 0, 0, 0, 0, 18, NULL, 0),
(2884, 0, -1, 0, 0, 'Alai Flats, Flat 04', 80000, 8, 0, 0, 0, 0, 19, NULL, 0),
(2885, 0, -1, 0, 0, 'Alai Flats, Flat 05', 100000, 8, 0, 0, 0, 0, 28, NULL, 0),
(2886, 0, -1, 0, 0, 'Alai Flats, Flat 06', 100000, 8, 0, 0, 0, 0, 25, NULL, 0),
(2887, 0, -1, 0, 0, 'Alai Flats, Flat 07', 25000, 8, 0, 0, 0, 0, 18, NULL, 0),
(2888, 0, -1, 0, 0, 'Alai Flats, Flat 08', 50000, 8, 0, 0, 0, 0, 18, NULL, 0),
(2889, 0, -1, 0, 0, 'Alai Flats, Flat 11', 80000, 8, 0, 0, 0, 0, 19, NULL, 0),
(2890, 0, -1, 0, 0, 'Alai Flats, Flat 12', 25000, 8, 0, 0, 0, 0, 17, NULL, 0),
(2891, 0, -1, 0, 0, 'Alai Flats, Flat 13', 50000, 8, 0, 0, 0, 0, 19, NULL, 0),
(2892, 0, -1, 0, 0, 'Alai Flats, Flat 14', 80000, 8, 0, 0, 0, 0, 22, NULL, 0),
(2893, 0, -1, 0, 0, 'Alai Flats, Flat 15', 100000, 8, 0, 0, 0, 0, 34, NULL, 0),
(2894, 0, -1, 0, 0, 'Alai Flats, Flat 16', 100000, 8, 0, 0, 0, 0, 31, NULL, 0),
(2895, 0, -1, 0, 0, 'Alai Flats, Flat 17', 80000, 8, 0, 0, 0, 0, 22, NULL, 0),
(2896, 0, -1, 0, 0, 'Alai Flats, Flat 18', 50000, 8, 0, 0, 0, 0, 22, NULL, 0),
(2897, 0, -1, 0, 0, 'Alai Flats, Flat 21', 50000, 8, 0, 0, 0, 0, 19, NULL, 0),
(2898, 0, -1, 0, 0, 'Alai Flats, Flat 22', 50000, 8, 0, 0, 0, 0, 17, NULL, 0),
(2899, 0, -1, 0, 0, 'Alai Flats, Flat 23', 25000, 8, 0, 0, 0, 0, 19, NULL, 0),
(2900, 0, -1, 0, 0, 'Alai Flats, Flat 28', 80000, 8, 0, 0, 0, 0, 22, NULL, 0),
(2901, 0, -1, 0, 0, 'Alai Flats, Flat 27', 80000, 8, 0, 0, 0, 0, 22, NULL, 0),
(2902, 0, -1, 0, 0, 'Alai Flats, Flat 26', 100000, 8, 0, 0, 0, 0, 31, NULL, 0),
(2903, 0, -1, 0, 0, 'Alai Flats, Flat 25', 100000, 8, 0, 0, 0, 0, 34, NULL, 0),
(2904, 0, -1, 0, 0, 'Alai Flats, Flat 24', 80000, 8, 0, 0, 0, 0, 23, NULL, 0),
(2905, 0, -1, 0, 0, 'Beach Home Apartments, Flat 01', 50000, 8, 0, 0, 0, 0, 16, NULL, 0),
(2906, 0, -1, 0, 0, 'Beach Home Apartments, Flat 02', 80000, 8, 0, 0, 0, 0, 16, NULL, 0),
(2907, 0, -1, 0, 0, 'Beach Home Apartments, Flat 03', 80000, 8, 0, 0, 0, 0, 15, NULL, 0),
(2908, 0, -1, 0, 0, 'Beach Home Apartments, Flat 04', 50000, 8, 0, 0, 0, 0, 14, NULL, 0),
(2909, 0, -1, 0, 0, 'Beach Home Apartments, Flat 05', 80000, 8, 0, 0, 0, 0, 15, NULL, 0),
(2910, 0, -1, 0, 0, 'Beach Home Apartments, Flat 06', 100000, 8, 0, 0, 0, 0, 24, NULL, 0),
(2911, 0, -1, 0, 0, 'Beach Home Apartments, Flat 11', 25000, 8, 0, 0, 0, 0, 15, NULL, 0),
(2912, 0, -1, 0, 0, 'Beach Home Apartments, Flat 12', 50000, 8, 0, 0, 0, 0, 18, NULL, 0),
(2913, 0, -1, 0, 0, 'Beach Home Apartments, Flat 13', 80000, 8, 0, 0, 0, 0, 19, NULL, 0),
(2914, 0, -1, 0, 0, 'Beach Home Apartments, Flat 14', 25000, 8, 0, 0, 0, 0, 8, NULL, 0),
(2915, 0, -1, 0, 0, 'Beach Home Apartments, Flat 15', 25000, 8, 0, 0, 0, 0, 9, NULL, 0),
(2916, 0, -1, 0, 0, 'Beach Home Apartments, Flat 16', 80000, 8, 0, 0, 0, 0, 21, NULL, 0),
(2917, 0, -1, 0, 0, 'Demon Tower', 100000, 8, 0, 0, 0, 0, 75, NULL, 0),
(2918, 0, -1, 0, 0, 'Farm Lane, 1st floor (Shop)', 80000, 8, 0, 0, 0, 0, 18, NULL, 0),
(2919, 0, -1, 0, 0, 'Farm Lane, 2nd Floor (Shop)', 50000, 8, 0, 0, 0, 0, 17, NULL, 0),
(2920, 0, -1, 0, 0, 'Farm Lane, Basement (Shop)', 50000, 8, 0, 0, 0, 0, 21, NULL, 0),
(2921, 0, -1, 0, 0, 'Fibula Village 1', 25000, 8, 0, 0, 0, 0, 15, NULL, 0),
(2922, 0, -1, 0, 0, 'Fibula Village 2', 25000, 8, 0, 0, 0, 0, 15, NULL, 0),
(2923, 0, -1, 0, 0, 'Fibula Village 4', 25000, 8, 0, 0, 0, 0, 27, NULL, 0),
(2924, 0, -1, 0, 0, 'Fibula Village 5', 50000, 8, 0, 0, 0, 0, 27, NULL, 0),
(2925, 0, -1, 0, 0, 'Fibula Village 3', 80000, 8, 0, 0, 0, 0, 60, NULL, 0),
(2926, 0, -1, 0, 0, 'Fibula Village, Tower Flat', 100000, 8, 0, 0, 0, 0, 94, NULL, 0),
(2927, 0, -1, 0, 0, 'Guildhall of the Red Rose', 250000, 8, 0, 0, 0, 0, 396, NULL, 0),
(2928, 0, -1, 0, 0, 'Fibula Village, Bar (Shop)', 100000, 8, 0, 0, 0, 0, 74, NULL, 0),
(2929, 0, -1, 0, 0, 'Fibula Village, Villa', 200000, 8, 0, 0, 0, 0, 264, NULL, 0),
(2930, 0, -1, 0, 0, 'Greenshore Village 1', 80000, 8, 0, 0, 0, 0, 39, NULL, 0),
(2931, 0, -1, 0, 0, 'Greenshore Clanhall', 250000, 8, 0, 0, 0, 0, 176, NULL, 0),
(2932, 0, -1, 0, 0, 'Castle of Greenshore', 250000, 8, 0, 0, 0, 0, 325, NULL, 0),
(2933, 0, -1, 0, 0, 'Greenshore Village, Shop', 80000, 8, 0, 0, 0, 0, 31, NULL, 0),
(2934, 0, -1, 0, 0, 'Greenshore Village, Villa', 300000, 8, 0, 0, 0, 0, 178, NULL, 0),
(2935, 0, -1, 0, 0, 'Greenshore Village 7', 25000, 8, 0, 0, 0, 0, 23, NULL, 0),
(2936, 0, -1, 0, 0, 'Greenshore Village 3', 50000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2939, 0, -1, 0, 0, 'Greenshore Village 2', 50000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2940, 0, -1, 0, 0, 'Greenshore Village 6', 150000, 8, 0, 0, 0, 0, 79, NULL, 0),
(2941, 0, -1, 0, 0, 'Harbour Place 1 (Shop)', 800000, 8, 0, 0, 0, 0, 21, NULL, 0),
(2942, 0, -1, 0, 0, 'Harbour Place 2 (Shop)', 600000, 8, 0, 0, 0, 0, 25, NULL, 0),
(2943, 0, -1, 0, 0, 'Harbour Place 3', 800000, 8, 0, 0, 0, 0, 88, NULL, 0),
(2944, 0, -1, 0, 0, 'Harbour Place 4', 80000, 8, 0, 0, 0, 0, 18, NULL, 0),
(2945, 0, -1, 0, 0, 'Lower Swamp Lane 1', 400000, 8, 0, 0, 0, 0, 80, NULL, 0),
(2946, 0, -1, 0, 0, 'Lower Swamp Lane 3', 400000, 8, 0, 0, 0, 0, 80, NULL, 0),
(2947, 0, -1, 0, 0, 'Main Street 9, 1st floor (Shop)', 200000, 8, 0, 0, 0, 0, 30, NULL, 0),
(2948, 0, -1, 0, 0, 'Main Street 9a, 2nd floor (Shop)', 100000, 8, 0, 0, 0, 0, 15, NULL, 0),
(2949, 0, -1, 0, 0, 'Main Street 9b, 2nd floor (Shop)', 150000, 8, 0, 0, 0, 0, 27, NULL, 0),
(2950, 0, -1, 0, 0, 'Mill Avenue 1 (Shop)', 200000, 8, 0, 0, 0, 0, 28, NULL, 0),
(2951, 0, -1, 0, 0, 'Mill Avenue 2 (Shop)', 200000, 8, 0, 0, 0, 0, 47, NULL, 0),
(2952, 0, -1, 0, 0, 'Mill Avenue 3', 100000, 8, 0, 0, 0, 0, 32, NULL, 0),
(2953, 0, -1, 0, 0, 'Mill Avenue 4', 100000, 8, 0, 0, 0, 0, 33, NULL, 0),
(2954, 0, -1, 0, 0, 'Mill Avenue 5', 300000, 8, 0, 0, 0, 0, 69, NULL, 0),
(2955, 0, -1, 0, 0, 'Open-Air Theatre', 150000, 8, 0, 0, 0, 0, 81, NULL, 0),
(2956, 0, -1, 0, 0, 'Smuggler\'s Den', 400000, 8, 0, 0, 0, 0, 226, NULL, 0),
(2957, 0, -1, 0, 0, 'Sorcerer\'s Avenue 1a', 100000, 8, 0, 0, 0, 0, 24, NULL, 0),
(2958, 0, -1, 0, 0, 'Sorcerer\'s Avenue 5 (Shop)', 150000, 8, 0, 0, 0, 0, 54, NULL, 0),
(2959, 0, -1, 0, 0, 'Sorcerer\'s Avenue 1b', 80000, 8, 0, 0, 0, 0, 19, NULL, 0),
(2960, 0, -1, 0, 0, 'Sorcerer\'s Avenue 1c', 100000, 8, 0, 0, 0, 0, 25, NULL, 0),
(2961, 0, -1, 0, 0, 'Sorcerer\'s Avenue Labs 2a', 50000, 8, 0, 0, 0, 0, 29, NULL, 0),
(2962, 0, -1, 0, 0, 'Sorcerer\'s Avenue Labs 2c', 50000, 8, 0, 0, 0, 0, 29, NULL, 0),
(2963, 0, -1, 0, 0, 'Sorcerer\'s Avenue Labs 2b', 50000, 8, 0, 0, 0, 0, 29, NULL, 0),
(2964, 0, -1, 0, 0, 'Sunset Homes, Flat 01', 100000, 8, 0, 0, 0, 0, 15, NULL, 0),
(2965, 0, -1, 0, 0, 'Sunset Homes, Flat 02', 80000, 8, 0, 0, 0, 0, 14, NULL, 0),
(2966, 0, -1, 0, 0, 'Sunset Homes, Flat 03', 80000, 8, 0, 0, 0, 0, 14, NULL, 0),
(2967, 0, -1, 0, 0, 'Sunset Homes, Flat 11', 80000, 8, 0, 0, 0, 0, 15, NULL, 0),
(2968, 0, -1, 0, 0, 'Sunset Homes, Flat 12', 50000, 8, 0, 0, 0, 0, 15, NULL, 0),
(2969, 0, -1, 0, 0, 'Sunset Homes, Flat 13', 100000, 8, 0, 0, 0, 0, 22, NULL, 0),
(2970, 0, -1, 0, 0, 'Sunset Homes, Flat 14', 50000, 8, 0, 0, 0, 0, 17, NULL, 0),
(2971, 0, -1, 0, 0, 'Sunset Homes, Flat 21', 50000, 8, 0, 0, 0, 0, 15, NULL, 0),
(2972, 0, -1, 0, 0, 'Sunset Homes, Flat 22', 50000, 8, 0, 0, 0, 0, 15, NULL, 0),
(2973, 0, -1, 0, 0, 'Sunset Homes, Flat 23', 80000, 8, 0, 0, 0, 0, 22, NULL, 0),
(2974, 0, -1, 0, 0, 'Sunset Homes, Flat 24', 50000, 8, 0, 0, 0, 0, 17, NULL, 0),
(2975, 0, -1, 0, 0, 'Thais Hostel', 200000, 8, 0, 0, 0, 0, 129, NULL, 0),
(2976, 0, -1, 0, 0, 'The City Wall 1a', 150000, 8, 0, 0, 0, 0, 32, NULL, 0),
(2977, 0, -1, 0, 0, 'The City Wall 1b', 100000, 8, 0, 0, 0, 0, 31, NULL, 0),
(2978, 0, -1, 0, 0, 'The City Wall 3a', 100000, 8, 0, 0, 0, 0, 23, NULL, 0),
(2979, 0, -1, 0, 0, 'The City Wall 3b', 100000, 8, 0, 0, 0, 0, 23, NULL, 0),
(2980, 0, -1, 0, 0, 'The City Wall 3c', 100000, 8, 0, 0, 0, 0, 23, NULL, 0),
(2981, 0, -1, 0, 0, 'The City Wall 3d', 100000, 8, 0, 0, 0, 0, 23, NULL, 0),
(2982, 0, -1, 0, 0, 'The City Wall 3e', 100000, 8, 0, 0, 0, 0, 23, NULL, 0),
(2983, 0, -1, 0, 0, 'The City Wall 3f', 100000, 8, 0, 0, 0, 0, 23, NULL, 0),
(2984, 0, -1, 0, 0, 'Upper Swamp Lane 12', 300000, 8, 0, 0, 0, 0, 76, NULL, 0),
(2985, 0, -1, 0, 0, 'Upper Swamp Lane 10', 150000, 8, 0, 0, 0, 0, 40, NULL, 0),
(2986, 0, -1, 0, 0, 'Upper Swamp Lane 8', 600000, 8, 0, 0, 0, 0, 159, NULL, 0),
(2987, 0, -1, 0, 0, 'Upper Swamp Lane 4', 600000, 8, 0, 0, 0, 0, 100, NULL, 0),
(2988, 0, -1, 0, 0, 'Upper Swamp Lane 2', 600000, 8, 0, 0, 0, 0, 100, NULL, 0),
(2989, 0, -1, 0, 0, 'The City Wall 9', 80000, 8, 0, 0, 0, 0, 25, NULL, 0),
(2990, 0, -1, 0, 0, 'The City Wall 7h', 50000, 8, 0, 0, 0, 0, 18, NULL, 0),
(2991, 0, -1, 0, 0, 'The City Wall 7b', 25000, 8, 0, 0, 0, 0, 18, NULL, 0),
(2992, 0, -1, 0, 0, 'The City Wall 7d', 50000, 8, 0, 0, 0, 0, 22, NULL, 0),
(2993, 0, -1, 0, 0, 'The City Wall 7f', 80000, 8, 0, 0, 0, 0, 22, NULL, 0),
(2994, 0, -1, 0, 0, 'The City Wall 7c', 80000, 8, 0, 0, 0, 0, 22, NULL, 0),
(2995, 0, -1, 0, 0, 'The City Wall 7a', 80000, 8, 0, 0, 0, 0, 18, NULL, 0),
(2996, 0, -1, 0, 0, 'The City Wall 7g', 50000, 8, 0, 0, 0, 0, 18, NULL, 0),
(2997, 0, -1, 0, 0, 'The City Wall 7e', 80000, 8, 0, 0, 0, 0, 22, NULL, 0),
(2998, 0, -1, 0, 0, 'The City Wall 5b', 50000, 8, 0, 0, 0, 0, 17, NULL, 0),
(2999, 0, -1, 0, 0, 'The City Wall 5d', 50000, 8, 0, 0, 0, 0, 15, NULL, 0),
(3000, 0, -1, 0, 0, 'The City Wall 5f', 25000, 8, 0, 0, 0, 0, 17, NULL, 0),
(3001, 0, -1, 0, 0, 'The City Wall 5a', 50000, 8, 0, 0, 0, 0, 17, NULL, 0),
(3002, 0, -1, 0, 0, 'The City Wall 5c', 50000, 8, 0, 0, 0, 0, 15, NULL, 0),
(3003, 0, -1, 0, 0, 'The City Wall 5e', 50000, 8, 0, 0, 0, 0, 17, NULL, 0),
(3004, 0, -1, 1736103212, 0, 'Warriors\' Guildhall', 5000000, 8, 0, 0, 0, 0, 334, NULL, 0),
(3005, 0, -1, 0, 0, 'The Tibianic', 500000, 8, 0, 0, 0, 0, 809, NULL, 0),
(3006, 0, -1, 0, 0, 'Bloodhall', 500000, 8, 0, 0, 0, 0, 321, NULL, 0),
(3007, 0, -1, 0, 0, 'Fibula Clanhall', 250000, 8, 0, 0, 0, 0, 178, NULL, 0),
(3008, 0, -1, 0, 0, 'Dark Mansion', 1000000, 8, 0, 0, 0, 0, 375, NULL, 0),
(3009, 0, -1, 0, 0, 'Halls of the Adventurers', 250000, 8, 0, 0, 0, 0, 317, NULL, 0),
(3010, 0, -1, 0, 0, 'Mercenary Tower', 250000, 8, 0, 0, 0, 0, 619, NULL, 0),
(3011, 0, -1, 0, 0, 'Snake Tower', 500000, 8, 0, 0, 0, 0, 627, NULL, 0),
(3012, 0, -1, 0, 0, 'Southern Thais Guildhall', 1000000, 8, 0, 0, 0, 0, 374, NULL, 0),
(3013, 0, -1, 0, 0, 'Spiritkeep', 500000, 8, 0, 0, 0, 0, 289, NULL, 0),
(3014, 0, -1, 0, 0, 'Thais Clanhall', 500000, 8, 0, 0, 0, 0, 206, NULL, 0),
(3015, 0, -1, 0, 0, 'The Lair', 200000, 9, 0, 0, 0, 0, 259, NULL, 0),
(3016, 0, -1, 0, 0, 'Silver Street 4', 300000, 9, 0, 0, 0, 0, 119, NULL, 0),
(3017, 0, -1, 0, 0, 'Dream Street 1 (Shop)', 600000, 9, 0, 0, 0, 0, 149, NULL, 0),
(3018, 0, -1, 0, 0, 'Dagger Alley 1', 200000, 9, 0, 0, 0, 0, 103, NULL, 0),
(3019, 0, -1, 0, 0, 'Dream Street 2', 400000, 9, 0, 0, 0, 0, 113, NULL, 0),
(3020, 0, -1, 0, 0, 'Dream Street 3', 300000, 9, 0, 0, 0, 0, 104, NULL, 0),
(3021, 0, -1, 0, 0, 'Elm Street 1', 300000, 9, 0, 0, 0, 0, 99, NULL, 0),
(3022, 0, -1, 0, 0, 'Elm Street 3', 300000, 9, 0, 0, 0, 0, 107, NULL, 0),
(3023, 0, -1, 0, 0, 'Elm Street 2', 300000, 9, 0, 0, 0, 0, 98, NULL, 0),
(3024, 0, -1, 0, 0, 'Elm Street 4', 300000, 9, 0, 0, 0, 0, 108, NULL, 0),
(3025, 0, -1, 0, 0, 'Seagull Walk 1', 800000, 9, 0, 0, 0, 0, 169, NULL, 0),
(3026, 0, -1, 0, 0, 'Seagull Walk 2', 300000, 9, 0, 0, 0, 0, 102, NULL, 0),
(3027, 0, -1, 0, 0, 'Dream Street 4', 400000, 9, 0, 0, 0, 0, 128, NULL, 0),
(3028, 0, -1, 0, 0, 'Old Lighthouse', 200000, 9, 0, 0, 0, 0, 157, NULL, 0),
(3029, 0, -1, 0, 0, 'Market Street 1', 600000, 9, 0, 0, 0, 0, 220, NULL, 0),
(3030, 0, -1, 0, 0, 'Market Street 3', 600000, 9, 0, 0, 0, 0, 127, NULL, 0),
(3031, 0, -1, 0, 0, 'Market Street 4 (Shop)', 800000, 9, 0, 0, 0, 0, 176, NULL, 0),
(3032, 0, -1, 0, 0, 'Market Street 5 (Shop)', 800000, 9, 0, 0, 0, 0, 230, NULL, 0),
(3033, 0, -1, 0, 0, 'Market Street 2', 600000, 9, 0, 0, 0, 0, 173, NULL, 0),
(3034, 0, -1, 0, 0, 'Loot Lane 1 (Shop)', 600000, 9, 0, 0, 0, 0, 159, NULL, 0),
(3035, 0, -1, 0, 0, 'Mystic Lane 1', 300000, 9, 0, 0, 0, 0, 92, NULL, 0),
(3036, 0, -1, 0, 0, 'Mystic Lane 2', 200000, 9, 0, 0, 0, 0, 119, NULL, 0),
(3037, 0, -1, 0, 0, 'Lucky Lane 2 (Tower)', 600000, 9, 0, 0, 0, 0, 216, NULL, 0),
(3038, 0, -1, 0, 0, 'Lucky Lane 3 (Tower)', 600000, 9, 0, 0, 0, 0, 216, NULL, 0),
(3039, 0, -1, 0, 0, 'Iron Alley 1', 300000, 9, 0, 0, 0, 0, 101, NULL, 0),
(3040, 0, -1, 0, 0, 'Iron Alley 2', 300000, 9, 0, 0, 0, 0, 128, NULL, 0),
(3041, 0, -1, 0, 0, 'Swamp Watch', 500000, 9, 0, 0, 0, 0, 379, NULL, 0),
(3042, 0, -1, 0, 0, 'Golden Axe Guildhall', 500000, 9, 0, 0, 0, 0, 344, NULL, 0),
(3043, 0, -1, 0, 0, 'Silver Street 1', 200000, 9, 0, 0, 0, 0, 108, NULL, 0),
(3044, 0, -1, 0, 0, 'Valorous Venore', 500000, 9, 0, 0, 0, 0, 457, NULL, 0),
(3045, 0, -1, 0, 0, 'Salvation Street 2', 300000, 9, 0, 0, 0, 0, 113, NULL, 0),
(3046, 0, -1, 0, 0, 'Salvation Street 3', 300000, 9, 0, 0, 0, 0, 143, NULL, 0),
(3047, 0, -1, 0, 0, 'Silver Street 2', 200000, 9, 0, 0, 0, 0, 76, NULL, 0),
(3048, 0, -1, 0, 0, 'Silver Street 3', 200000, 9, 0, 0, 0, 0, 82, NULL, 0),
(3049, 0, -1, 0, 0, 'Mystic Lane 3 (Tower)', 800000, 9, 0, 0, 0, 0, 214, NULL, 0),
(3050, 0, -1, 0, 0, 'Market Street 7', 200000, 9, 0, 0, 0, 0, 90, NULL, 0),
(3051, 0, -1, 0, 0, 'Market Street 6', 600000, 9, 0, 0, 0, 0, 186, NULL, 0),
(3052, 0, -1, 0, 0, 'Iron Alley Watch, Upper', 600000, 9, 0, 0, 0, 0, 215, NULL, 0),
(3053, 0, -1, 0, 0, 'Iron Alley Watch, Lower', 600000, 9, 0, 0, 0, 0, 217, NULL, 0),
(3054, 0, -1, 0, 0, 'Blessed Shield Guildhall', 500000, 9, 0, 0, 0, 0, 250, NULL, 0),
(3055, 0, -1, 0, 0, 'Steel Home', 500000, 9, 0, 0, 0, 0, 388, NULL, 0),
(3056, 0, -1, 0, 0, 'Salvation Street 1 (Shop)', 600000, 9, 0, 0, 0, 0, 215, NULL, 0),
(3057, 0, -1, 0, 0, 'Lucky Lane 1 (Shop)', 800000, 9, 0, 0, 0, 0, 220, NULL, 0),
(3058, 0, -1, 0, 0, 'Paupers Palace, Flat 34', 100000, 9, 0, 0, 0, 0, 59, NULL, 0),
(3059, 0, -1, 0, 0, 'Paupers Palace, Flat 33', 50000, 9, 0, 0, 0, 0, 35, NULL, 0),
(3060, 0, -1, 0, 0, 'Paupers Palace, Flat 32', 100000, 9, 0, 0, 0, 0, 50, NULL, 0),
(3061, 0, -1, 0, 0, 'Paupers Palace, Flat 31', 80000, 9, 0, 0, 0, 0, 40, NULL, 0),
(3062, 0, -1, 0, 0, 'Paupers Palace, Flat 28', 25000, 9, 0, 0, 0, 0, 13, NULL, 0),
(3063, 0, -1, 0, 0, 'Paupers Palace, Flat 26', 25000, 9, 0, 0, 0, 0, 19, NULL, 0),
(3064, 0, -1, 0, 0, 'Paupers Palace, Flat 24', 25000, 9, 0, 0, 0, 0, 19, NULL, 0),
(3065, 0, -1, 0, 0, 'Paupers Palace, Flat 22', 25000, 9, 0, 0, 0, 0, 19, NULL, 0);
INSERT INTO `houses` (`id`, `owner`, `new_owner`, `paid`, `warnings`, `name`, `rent`, `town_id`, `bid`, `bid_end`, `last_bid`, `highest_bidder`, `size`, `guildid`, `beds`) VALUES
(3066, 0, -1, 0, 0, 'Paupers Palace, Flat 21', 25000, 9, 0, 0, 0, 0, 18, NULL, 0),
(3067, 0, -1, 0, 0, 'Paupers Palace, Flat 27', 50000, 9, 0, 0, 0, 0, 23, NULL, 0),
(3068, 0, -1, 0, 0, 'Paupers Palace, Flat 25', 50000, 9, 0, 0, 0, 0, 24, NULL, 0),
(3069, 0, -1, 0, 0, 'Paupers Palace, Flat 23', 50000, 9, 0, 0, 0, 0, 29, NULL, 0),
(3070, 0, -1, 0, 0, 'Paupers Palace, Flat 11', 25000, 9, 0, 0, 0, 0, 14, NULL, 0),
(3071, 0, -1, 0, 0, 'Paupers Palace, Flat 13', 50000, 9, 0, 0, 0, 0, 20, NULL, 0),
(3072, 0, -1, 0, 0, 'Paupers Palace, Flat 15', 50000, 9, 0, 0, 0, 0, 20, NULL, 0),
(3073, 0, -1, 0, 0, 'Paupers Palace, Flat 17', 25000, 9, 0, 0, 0, 0, 20, NULL, 0),
(3074, 0, -1, 0, 0, 'Paupers Palace, Flat 18', 25000, 9, 0, 0, 0, 0, 20, NULL, 0),
(3075, 0, -1, 0, 0, 'Paupers Palace, Flat 12', 50000, 9, 0, 0, 0, 0, 25, NULL, 0),
(3076, 0, -1, 0, 0, 'Paupers Palace, Flat 14', 50000, 9, 0, 0, 0, 0, 25, NULL, 0),
(3077, 0, -1, 0, 0, 'Paupers Palace, Flat 16', 50000, 9, 0, 0, 0, 0, 30, NULL, 0),
(3078, 0, -1, 0, 0, 'Paupers Palace, Flat 06', 25000, 9, 0, 0, 0, 0, 11, NULL, 0),
(3079, 0, -1, 0, 0, 'Paupers Palace, Flat 05', 25000, 9, 0, 0, 0, 0, 9, NULL, 0),
(3080, 0, -1, 0, 0, 'Paupers Palace, Flat 04', 25000, 9, 0, 0, 0, 0, 17, NULL, 0),
(3081, 0, -1, 0, 0, 'Paupers Palace, Flat 07', 50000, 9, 0, 0, 0, 0, 14, NULL, 0),
(3082, 0, -1, 0, 0, 'Paupers Palace, Flat 03', 25000, 9, 0, 0, 0, 0, 11, NULL, 0),
(3083, 0, -1, 0, 0, 'Paupers Palace, Flat 02', 25000, 9, 0, 0, 0, 0, 14, NULL, 0),
(3084, 0, -1, 0, 0, 'Paupers Palace, Flat 01', 25000, 9, 0, 0, 0, 0, 15, NULL, 0),
(3085, 0, -1, 0, 0, 'Castle, Residence', 600000, 11, 0, 0, 0, 0, 104, NULL, 0),
(3086, 0, -1, 0, 0, 'Castle, 3rd Floor, Flat 07', 80000, 11, 0, 0, 0, 0, 17, NULL, 0),
(3087, 0, -1, 0, 0, 'Castle, 3rd Floor, Flat 04', 25000, 11, 0, 0, 0, 0, 13, NULL, 0),
(3088, 0, -1, 0, 0, 'Castle, 3rd Floor, Flat 03', 50000, 11, 0, 0, 0, 0, 13, NULL, 0),
(3089, 0, -1, 0, 0, 'Castle, 3rd Floor, Flat 06', 100000, 11, 0, 0, 0, 0, 22, NULL, 0),
(3090, 0, -1, 0, 0, 'Castle, 3rd Floor, Flat 05', 80000, 11, 0, 0, 0, 0, 18, NULL, 0),
(3091, 0, -1, 0, 0, 'Castle, 3rd Floor, Flat 02', 80000, 11, 0, 0, 0, 0, 18, NULL, 0),
(3092, 0, -1, 0, 0, 'Castle, 3rd Floor, Flat 01', 50000, 11, 0, 0, 0, 0, 15, NULL, 0),
(3093, 0, -1, 0, 0, 'Castle, 4th Floor, Flat 09', 50000, 11, 0, 0, 0, 0, 17, NULL, 0),
(3094, 0, -1, 0, 0, 'Castle, 4th Floor, Flat 08', 80000, 11, 0, 0, 0, 0, 22, NULL, 0),
(3095, 0, -1, 0, 0, 'Castle, 4th Floor, Flat 07', 80000, 11, 0, 0, 0, 0, 17, NULL, 0),
(3096, 0, -1, 0, 0, 'Castle, 4th Floor, Flat 04', 50000, 11, 0, 0, 0, 0, 14, NULL, 0),
(3097, 0, -1, 0, 0, 'Castle, 4th Floor, Flat 03', 50000, 11, 0, 0, 0, 0, 14, NULL, 0),
(3098, 0, -1, 0, 0, 'Castle, 4th Floor, Flat 06', 100000, 11, 0, 0, 0, 0, 21, NULL, 0),
(3099, 0, -1, 0, 0, 'Castle, 4th Floor, Flat 05', 80000, 11, 0, 0, 0, 0, 18, NULL, 0),
(3100, 0, -1, 0, 0, 'Castle, 4th Floor, Flat 02', 80000, 11, 0, 0, 0, 0, 18, NULL, 0),
(3101, 0, -1, 0, 0, 'Castle, 4th Floor, Flat 01', 50000, 11, 0, 0, 0, 0, 14, NULL, 0),
(3102, 0, -1, 0, 0, 'Castle Street 2', 150000, 11, 0, 0, 0, 0, 35, NULL, 0),
(3103, 0, -1, 0, 0, 'Castle Street 3', 150000, 11, 0, 0, 0, 0, 41, NULL, 0),
(3104, 0, -1, 0, 0, 'Castle Street 4', 150000, 11, 0, 0, 0, 0, 40, NULL, 0),
(3105, 0, -1, 0, 0, 'Castle Street 5', 150000, 11, 0, 0, 0, 0, 40, NULL, 0),
(3106, 0, -1, 0, 0, 'Castle Street 1', 300000, 11, 0, 0, 0, 0, 71, NULL, 0),
(3107, 0, -1, 0, 0, 'Edron Flats, Flat 08', 25000, 11, 0, 0, 0, 0, 10, NULL, 0),
(3108, 0, -1, 0, 0, 'Edron Flats, Flat 05', 25000, 11, 0, 0, 0, 0, 10, NULL, 0),
(3109, 0, -1, 0, 0, 'Edron Flats, Flat 04', 25000, 11, 0, 0, 0, 0, 10, NULL, 0),
(3110, 0, -1, 0, 0, 'Edron Flats, Flat 01', 50000, 11, 0, 0, 0, 0, 11, NULL, 0),
(3111, 0, -1, 0, 0, 'Edron Flats, Flat 07', 25000, 11, 0, 0, 0, 0, 11, NULL, 0),
(3112, 0, -1, 0, 0, 'Edron Flats, Flat 06', 25000, 11, 0, 0, 0, 0, 11, NULL, 0),
(3113, 0, -1, 0, 0, 'Edron Flats, Flat 03', 25000, 11, 0, 0, 0, 0, 11, NULL, 0),
(3114, 0, -1, 0, 0, 'Edron Flats, Flat 02', 100000, 11, 0, 0, 0, 0, 20, NULL, 0),
(3115, 0, -1, 0, 0, 'Edron Flats, Basement Flat 2', 100000, 11, 0, 0, 0, 0, 36, NULL, 0),
(3116, 0, -1, 0, 0, 'Edron Flats, Basement Flat 1', 100000, 11, 0, 0, 0, 0, 36, NULL, 0),
(3119, 0, -1, 0, 0, 'Edron Flats, Flat 13', 80000, 11, 0, 0, 0, 0, 22, NULL, 0),
(3121, 0, -1, 0, 0, 'Edron Flats, Flat 14', 100000, 11, 0, 0, 0, 0, 31, NULL, 0),
(3123, 0, -1, 0, 0, 'Edron Flats, Flat 12', 80000, 11, 0, 0, 0, 0, 24, NULL, 0),
(3124, 0, -1, 0, 0, 'Edron Flats, Flat 11', 100000, 11, 0, 0, 0, 0, 32, NULL, 0),
(3125, 0, -1, 0, 0, 'Edron Flats, Flat 25', 80000, 11, 0, 0, 0, 0, 31, NULL, 0),
(3127, 0, -1, 0, 0, 'Edron Flats, Flat 24', 80000, 11, 0, 0, 0, 0, 22, NULL, 0),
(3128, 0, -1, 0, 0, 'Edron Flats, Flat 21', 80000, 11, 0, 0, 0, 0, 20, NULL, 0),
(3131, 0, -1, 0, 0, 'Edron Flats, Flat 23', 80000, 11, 0, 0, 0, 0, 24, NULL, 0),
(3133, 0, -1, 0, 0, 'Castle Shop 1', 400000, 11, 0, 0, 0, 0, 38, NULL, 0),
(3134, 0, -1, 0, 0, 'Castle Shop 2', 400000, 11, 0, 0, 0, 0, 38, NULL, 0),
(3135, 0, -1, 0, 0, 'Castle Shop 3', 300000, 11, 0, 0, 0, 0, 38, NULL, 0),
(3136, 0, -1, 0, 0, 'Central Circle 1', 800000, 11, 0, 0, 0, 0, 76, NULL, 0),
(3137, 0, -1, 0, 0, 'Central Circle 2', 800000, 11, 0, 0, 0, 0, 90, NULL, 0),
(3138, 0, -1, 0, 0, 'Central Circle 3', 800000, 11, 0, 0, 0, 0, 99, NULL, 0),
(3139, 0, -1, 0, 0, 'Central Circle 4', 800000, 11, 0, 0, 0, 0, 97, NULL, 0),
(3140, 0, -1, 0, 0, 'Central Circle 5', 800000, 11, 0, 0, 0, 0, 99, NULL, 0),
(3141, 0, -1, 0, 0, 'Central Circle 8 (Shop)', 400000, 11, 0, 0, 0, 0, 101, NULL, 0),
(3142, 0, -1, 0, 0, 'Central Circle 7 (Shop)', 400000, 11, 0, 0, 0, 0, 101, NULL, 0),
(3143, 0, -1, 0, 0, 'Central Circle 6 (Shop)', 400000, 11, 0, 0, 0, 0, 101, NULL, 0),
(3144, 0, -1, 0, 0, 'Central Circle 9a', 150000, 11, 0, 0, 0, 0, 23, NULL, 0),
(3145, 0, -1, 0, 0, 'Central Circle 9b', 150000, 11, 0, 0, 0, 0, 23, NULL, 0),
(3146, 0, -1, 0, 0, 'Sky Lane, Guild 1', 1000000, 11, 0, 0, 0, 0, 459, NULL, 0),
(3147, 0, -1, 0, 0, 'Sky Lane, Sea Tower', 300000, 11, 0, 0, 0, 0, 106, NULL, 0),
(3148, 0, -1, 0, 0, 'Sky Lane, Guild 3', 1000000, 11, 0, 0, 0, 0, 391, NULL, 0),
(3149, 0, -1, 0, 0, 'Sky Lane, Guild 2', 1000000, 11, 0, 0, 0, 0, 440, NULL, 0),
(3150, 0, -1, 0, 0, 'Wood Avenue 11', 600000, 11, 0, 0, 0, 0, 165, NULL, 0),
(3151, 0, -1, 0, 0, 'Wood Avenue 8', 800000, 11, 0, 0, 0, 0, 147, NULL, 0),
(3152, 0, -1, 0, 0, 'Wood Avenue 7', 800000, 11, 0, 0, 0, 0, 145, NULL, 0),
(3153, 0, -1, 0, 0, 'Wood Avenue 10a', 200000, 11, 0, 0, 0, 0, 35, NULL, 0),
(3154, 0, -1, 0, 0, 'Wood Avenue 9a', 200000, 11, 0, 0, 0, 0, 33, NULL, 0),
(3155, 0, -1, 0, 0, 'Wood Avenue 6a', 300000, 11, 0, 0, 0, 0, 34, NULL, 0),
(3156, 0, -1, 0, 0, 'Wood Avenue 6b', 200000, 11, 0, 0, 0, 0, 35, NULL, 0),
(3157, 0, -1, 0, 0, 'Wood Avenue 9b', 200000, 11, 0, 0, 0, 0, 33, NULL, 0),
(3158, 0, -1, 0, 0, 'Wood Avenue 10b', 200000, 11, 0, 0, 0, 0, 35, NULL, 0),
(3159, 0, -1, 0, 0, 'Stronghold', 800000, 11, 0, 0, 0, 0, 194, NULL, 0),
(3160, 0, -1, 0, 0, 'Wood Avenue 5', 300000, 11, 0, 0, 0, 0, 40, NULL, 0),
(3161, 0, -1, 0, 0, 'Wood Avenue 3', 200000, 11, 0, 0, 0, 0, 39, NULL, 0),
(3162, 0, -1, 0, 0, 'Wood Avenue 4', 200000, 11, 0, 0, 0, 0, 40, NULL, 0),
(3163, 0, -1, 0, 0, 'Wood Avenue 2', 200000, 11, 0, 0, 0, 0, 39, NULL, 0),
(3164, 0, -1, 0, 0, 'Wood Avenue 1', 200000, 11, 0, 0, 0, 0, 41, NULL, 0),
(3165, 0, -1, 0, 0, 'Wood Avenue 4c', 200000, 11, 0, 0, 0, 0, 41, NULL, 0),
(3166, 0, -1, 0, 0, 'Wood Avenue 4a', 150000, 11, 0, 0, 0, 0, 33, NULL, 0),
(3167, 0, -1, 0, 0, 'Wood Avenue 4b', 150000, 11, 0, 0, 0, 0, 35, NULL, 0),
(3168, 0, -1, 0, 0, 'Stonehome Village 1', 150000, 11, 0, 0, 0, 0, 45, NULL, 0),
(3169, 0, -1, 0, 0, 'Stonehome Flats, Flat 04', 80000, 11, 0, 0, 0, 0, 24, NULL, 0),
(3171, 0, -1, 0, 0, 'Stonehome Flats, Flat 03', 80000, 11, 0, 0, 0, 0, 24, NULL, 0),
(3173, 0, -1, 0, 0, 'Stonehome Flats, Flat 02', 25000, 11, 0, 0, 0, 0, 18, NULL, 0),
(3174, 0, -1, 0, 0, 'Stonehome Flats, Flat 01', 25000, 11, 0, 0, 0, 0, 11, NULL, 0),
(3175, 0, -1, 0, 0, 'Stonehome Flats, Flat 13', 80000, 11, 0, 0, 0, 0, 24, NULL, 0),
(3177, 0, -1, 0, 0, 'Stonehome Flats, Flat 11', 50000, 11, 0, 0, 0, 0, 17, NULL, 0),
(3178, 0, -1, 0, 0, 'Stonehome Flats, Flat 14', 80000, 11, 0, 0, 0, 0, 24, NULL, 0),
(3180, 0, -1, 0, 0, 'Stonehome Flats, Flat 12', 50000, 11, 0, 0, 0, 0, 18, NULL, 0),
(3181, 0, -1, 0, 0, 'Stonehome Village 2', 50000, 11, 0, 0, 0, 0, 19, NULL, 0),
(3182, 0, -1, 0, 0, 'Stonehome Village 3', 50000, 11, 0, 0, 0, 0, 20, NULL, 0),
(3183, 0, -1, 0, 0, 'Stonehome Village 4', 80000, 11, 0, 0, 0, 0, 23, NULL, 0),
(3184, 0, -1, 0, 0, 'Stonehome Village 6', 100000, 11, 0, 0, 0, 0, 34, NULL, 0),
(3185, 0, -1, 0, 0, 'Stonehome Village 5', 80000, 11, 0, 0, 0, 0, 29, NULL, 0),
(3186, 0, -1, 0, 0, 'Stonehome Village 7', 100000, 11, 0, 0, 0, 0, 28, NULL, 0),
(3187, 0, -1, 0, 0, 'Stonehome Village 8', 25000, 11, 0, 0, 0, 0, 19, NULL, 0),
(3188, 0, -1, 0, 0, 'Stonehome Village 9', 50000, 11, 0, 0, 0, 0, 19, NULL, 0),
(3189, 0, -1, 0, 0, 'Stonehome Clanhall', 250000, 11, 0, 0, 0, 0, 205, NULL, 0),
(3190, 0, -1, 0, 0, 'Mad Scientist\'s Lab', 600000, 17, 0, 0, 0, 0, 63, NULL, 0),
(3191, 0, -1, 0, 0, 'Radiant Plaza 4', 800000, 17, 0, 0, 0, 0, 197, NULL, 0),
(3192, 0, -1, 0, 0, 'Radiant Plaza 3', 800000, 17, 0, 0, 0, 0, 126, NULL, 0),
(3193, 0, -1, 0, 0, 'Radiant Plaza 2', 600000, 17, 0, 0, 0, 0, 99, NULL, 0),
(3194, 0, -1, 0, 0, 'Radiant Plaza 1', 800000, 17, 0, 0, 0, 0, 138, NULL, 0),
(3195, 0, -1, 0, 0, 'Aureate Court 3', 400000, 17, 0, 0, 0, 0, 131, NULL, 0),
(3196, 0, -1, 0, 0, 'Aureate Court 4', 400000, 17, 0, 0, 0, 0, 104, NULL, 0),
(3197, 0, -1, 0, 0, 'Aureate Court 5', 600000, 17, 0, 0, 0, 0, 138, NULL, 0),
(3198, 0, -1, 0, 0, 'Aureate Court 2', 400000, 17, 0, 0, 0, 0, 125, NULL, 0),
(3199, 0, -1, 0, 0, 'Aureate Court 1', 600000, 17, 0, 0, 0, 0, 131, NULL, 0),
(3205, 0, -1, 0, 0, 'Halls of Serenity', 5000000, 17, 0, 0, 0, 0, 517, NULL, 0),
(3206, 0, -1, 0, 0, 'Fortune Wing 3', 600000, 17, 0, 0, 0, 0, 148, NULL, 0),
(3207, 0, -1, 0, 0, 'Fortune Wing 4', 600000, 17, 0, 0, 0, 0, 147, NULL, 0),
(3208, 0, -1, 0, 0, 'Fortune Wing 2', 600000, 17, 0, 0, 0, 0, 148, NULL, 0),
(3209, 0, -1, 0, 0, 'Fortune Wing 1', 800000, 17, 0, 0, 0, 0, 254, NULL, 0),
(3211, 0, -1, 0, 0, 'Cascade Towers', 5000000, 17, 0, 0, 0, 0, 419, NULL, 0),
(3212, 0, -1, 0, 0, 'Luminous Arc 5', 800000, 17, 0, 0, 0, 0, 145, NULL, 0),
(3213, 0, -1, 0, 0, 'Luminous Arc 2', 600000, 17, 0, 0, 0, 0, 161, NULL, 0),
(3214, 0, -1, 0, 0, 'Luminous Arc 1', 800000, 17, 0, 0, 0, 0, 167, NULL, 0),
(3215, 0, -1, 0, 0, 'Luminous Arc 3', 600000, 17, 0, 0, 0, 0, 139, NULL, 0),
(3216, 0, -1, 0, 0, 'Luminous Arc 4', 800000, 17, 0, 0, 0, 0, 200, NULL, 0),
(3217, 0, -1, 0, 0, 'Harbour Promenade 1', 800000, 17, 0, 0, 0, 0, 137, NULL, 0),
(3218, 0, -1, 0, 0, 'Sun Palace', 5000000, 17, 0, 0, 0, 0, 533, NULL, 0),
(3219, 0, -1, 0, 0, 'Haggler\'s Hangout 3', 300000, 15, 0, 0, 0, 0, 186, NULL, 0),
(3220, 0, -1, 0, 0, 'Haggler\'s Hangout 7', 400000, 15, 0, 0, 0, 0, 155, NULL, 0),
(3221, 0, -1, 0, 0, 'Big Game Hunter\'s Lodge', 600000, 15, 0, 0, 0, 0, 164, NULL, 0),
(3222, 0, -1, 0, 0, 'Haggler\'s Hangout 6', 400000, 15, 0, 0, 0, 0, 143, NULL, 0),
(3223, 0, -1, 0, 0, 'Haggler\'s Hangout 5 (Shop)', 200000, 15, 0, 0, 0, 0, 42, NULL, 0),
(3224, 0, -1, 0, 0, 'Haggler\'s Hangout 4b (Shop)', 150000, 15, 0, 0, 0, 0, 34, NULL, 0),
(3225, 0, -1, 0, 0, 'Haggler\'s Hangout 4a (Shop)', 200000, 15, 0, 0, 0, 0, 44, NULL, 0),
(3226, 0, -1, 0, 0, 'Haggler\'s Hangout 2', 100000, 15, 0, 0, 0, 0, 35, NULL, 0),
(3227, 0, -1, 0, 0, 'Haggler\'s Hangout 1', 100000, 15, 0, 0, 0, 0, 37, NULL, 0),
(3228, 0, -1, 0, 0, 'Bamboo Garden 3', 150000, 15, 0, 0, 0, 0, 44, NULL, 0),
(3229, 0, -1, 0, 0, 'Bamboo Fortress', 500000, 15, 0, 0, 0, 0, 531, NULL, 0),
(3230, 0, -1, 0, 0, 'Bamboo Garden 2', 80000, 15, 0, 0, 0, 0, 30, NULL, 0),
(3231, 0, -1, 0, 0, 'Bamboo Garden 1', 100000, 15, 0, 0, 0, 0, 44, NULL, 0),
(3232, 0, -1, 0, 0, 'Banana Bay 4', 25000, 15, 0, 0, 0, 0, 17, NULL, 0),
(3233, 0, -1, 0, 0, 'Banana Bay 2', 50000, 15, 0, 0, 0, 0, 27, NULL, 0),
(3234, 0, -1, 0, 0, 'Banana Bay 3', 50000, 15, 0, 0, 0, 0, 18, NULL, 0),
(3235, 0, -1, 0, 0, 'Banana Bay 1', 25000, 15, 0, 0, 0, 0, 17, NULL, 0),
(3236, 0, -1, 0, 0, 'Crocodile Bridge 1', 80000, 15, 0, 0, 0, 0, 29, NULL, 0),
(3237, 0, -1, 0, 0, 'Crocodile Bridge 2', 80000, 15, 0, 0, 0, 0, 25, NULL, 0),
(3238, 0, -1, 0, 0, 'Crocodile Bridge 3', 100000, 15, 0, 0, 0, 0, 34, NULL, 0),
(3239, 0, -1, 0, 0, 'Crocodile Bridge 4', 300000, 15, 0, 0, 0, 0, 119, NULL, 0),
(3240, 0, -1, 0, 0, 'Crocodile Bridge 5', 200000, 15, 0, 0, 0, 0, 102, NULL, 0),
(3241, 0, -1, 0, 0, 'Woodway 1', 80000, 15, 0, 0, 0, 0, 18, NULL, 0),
(3242, 0, -1, 0, 0, 'Woodway 2', 50000, 15, 0, 0, 0, 0, 17, NULL, 0),
(3243, 0, -1, 0, 0, 'Woodway 3', 150000, 15, 0, 0, 0, 0, 42, NULL, 0),
(3244, 0, -1, 0, 0, 'Woodway 4', 25000, 15, 0, 0, 0, 0, 17, NULL, 0),
(3245, 0, -1, 0, 0, 'Flamingo Flats 5', 150000, 15, 0, 0, 0, 0, 53, NULL, 0),
(3246, 0, -1, 0, 0, 'Flamingo Flats 4', 80000, 15, 0, 0, 0, 0, 23, NULL, 0),
(3247, 0, -1, 0, 0, 'Flamingo Flats 1', 50000, 15, 0, 0, 0, 0, 19, NULL, 0),
(3248, 0, -1, 0, 0, 'Flamingo Flats 2', 80000, 15, 0, 0, 0, 0, 28, NULL, 0),
(3249, 0, -1, 0, 0, 'Flamingo Flats 3', 50000, 15, 0, 0, 0, 0, 20, NULL, 0),
(3250, 0, -1, 0, 0, 'Jungle Edge 1', 200000, 15, 0, 0, 0, 0, 63, NULL, 0),
(3251, 0, -1, 0, 0, 'Jungle Edge 2', 200000, 15, 0, 0, 0, 0, 89, NULL, 0),
(3252, 0, -1, 0, 0, 'Jungle Edge 4', 80000, 15, 0, 0, 0, 0, 23, NULL, 0),
(3253, 0, -1, 0, 0, 'Jungle Edge 5', 80000, 15, 0, 0, 0, 0, 27, NULL, 0),
(3254, 0, -1, 0, 0, 'Jungle Edge 6', 25000, 15, 0, 0, 0, 0, 17, NULL, 0),
(3255, 0, -1, 0, 0, 'Jungle Edge 3', 80000, 15, 0, 0, 0, 0, 27, NULL, 0),
(3256, 0, -1, 0, 0, 'River Homes 3', 200000, 15, 0, 0, 0, 0, 111, NULL, 0),
(3257, 0, -1, 0, 0, 'River Homes 2b', 150000, 15, 0, 0, 0, 0, 37, NULL, 0),
(3258, 0, -1, 0, 0, 'River Homes 2a', 100000, 15, 0, 0, 0, 0, 33, NULL, 0),
(3259, 0, -1, 0, 0, 'River Homes 1', 300000, 15, 0, 0, 0, 0, 96, NULL, 0),
(3260, 0, -1, 0, 0, 'Coconut Quay 4', 150000, 15, 0, 0, 0, 0, 52, NULL, 0),
(3261, 0, -1, 0, 0, 'Coconut Quay 3', 200000, 15, 0, 0, 0, 0, 50, NULL, 0),
(3262, 0, -1, 0, 0, 'Coconut Quay 2', 100000, 15, 0, 0, 0, 0, 27, NULL, 0),
(3263, 0, -1, 0, 0, 'Coconut Quay 1', 150000, 15, 0, 0, 0, 0, 47, NULL, 0),
(3264, 0, -1, 0, 0, 'Shark Manor', 250000, 15, 0, 0, 0, 0, 173, NULL, 0),
(3265, 0, -1, 0, 0, 'Glacier Side 2', 300000, 16, 0, 0, 0, 0, 102, NULL, 0),
(3266, 0, -1, 0, 0, 'Glacier Side 1', 150000, 16, 0, 0, 0, 0, 34, NULL, 0),
(3267, 0, -1, 0, 0, 'Glacier Side 3', 150000, 16, 0, 0, 0, 0, 41, NULL, 0),
(3268, 0, -1, 0, 0, 'Glacier Side 4', 150000, 16, 0, 0, 0, 0, 46, NULL, 0),
(3269, 0, -1, 0, 0, 'Shelf Site', 300000, 16, 0, 0, 0, 0, 98, NULL, 0),
(3270, 0, -1, 0, 0, 'Spirit Homes 5', 150000, 16, 0, 0, 0, 0, 29, NULL, 0),
(3271, 0, -1, 0, 0, 'Spirit Homes 4', 80000, 16, 0, 0, 0, 0, 24, NULL, 0),
(3272, 0, -1, 0, 0, 'Spirit Homes 1', 150000, 16, 0, 0, 0, 0, 35, NULL, 0),
(3273, 0, -1, 0, 0, 'Spirit Homes 2', 150000, 16, 0, 0, 0, 0, 39, NULL, 0),
(3274, 0, -1, 0, 0, 'Spirit Homes 3', 300000, 16, 0, 0, 0, 0, 90, NULL, 0),
(3275, 0, -1, 0, 0, 'Arena Walk 3', 300000, 16, 0, 0, 0, 0, 74, NULL, 0),
(3276, 0, -1, 0, 0, 'Arena Walk 2', 150000, 16, 0, 0, 0, 0, 29, NULL, 0),
(3277, 0, -1, 0, 0, 'Arena Walk 1', 300000, 16, 0, 0, 0, 0, 67, NULL, 0),
(3278, 0, -1, 0, 0, 'Bears Paw 2', 300000, 16, 0, 0, 0, 0, 54, NULL, 0),
(3279, 0, -1, 0, 0, 'Bears Paw 1', 200000, 16, 0, 0, 0, 0, 42, NULL, 0),
(3280, 0, -1, 0, 0, 'Crystal Glance', 1000000, 16, 0, 0, 0, 0, 321, NULL, 0),
(3281, 0, -1, 0, 0, 'Shady Rocks 2', 200000, 16, 0, 0, 0, 0, 41, NULL, 0),
(3282, 0, -1, 0, 0, 'Shady Rocks 1', 300000, 16, 0, 0, 0, 0, 79, NULL, 0),
(3283, 0, -1, 0, 0, 'Shady Rocks 3', 300000, 16, 0, 0, 0, 0, 94, NULL, 0),
(3284, 0, -1, 0, 0, 'Shady Rocks 4 (Shop)', 200000, 16, 0, 0, 0, 0, 61, NULL, 0),
(3285, 0, -1, 0, 0, 'Shady Rocks 5', 300000, 16, 0, 0, 0, 0, 66, NULL, 0),
(3286, 0, -1, 0, 0, 'Tusk Flats 2', 80000, 16, 0, 0, 0, 0, 28, NULL, 0),
(3287, 0, -1, 0, 0, 'Tusk Flats 1', 80000, 16, 0, 0, 0, 0, 25, NULL, 0),
(3288, 0, -1, 0, 0, 'Tusk Flats 3', 80000, 16, 0, 0, 0, 0, 26, NULL, 0),
(3289, 0, -1, 0, 0, 'Tusk Flats 4', 25000, 16, 0, 0, 0, 0, 13, NULL, 0),
(3290, 0, -1, 0, 0, 'Tusk Flats 6', 50000, 16, 0, 0, 0, 0, 23, NULL, 0),
(3291, 0, -1, 0, 0, 'Tusk Flats 5', 25000, 16, 0, 0, 0, 0, 18, NULL, 0),
(3292, 0, -1, 0, 0, 'Corner Shop (Shop)', 200000, 16, 0, 0, 0, 0, 50, NULL, 0),
(3293, 0, -1, 0, 0, 'Bears Paw 5', 200000, 16, 0, 0, 0, 0, 45, NULL, 0),
(3294, 0, -1, 0, 0, 'Bears Paw 4', 400000, 16, 0, 0, 0, 0, 119, NULL, 0),
(3295, 0, -1, 0, 0, 'Trout Plaza 2', 150000, 16, 0, 0, 0, 0, 36, NULL, 0),
(3296, 0, -1, 0, 0, 'Trout Plaza 1', 200000, 16, 0, 0, 0, 0, 56, NULL, 0),
(3297, 0, -1, 0, 0, 'Trout Plaza 5 (Shop)', 300000, 16, 0, 0, 0, 0, 89, NULL, 0),
(3298, 0, -1, 0, 0, 'Trout Plaza 3', 80000, 16, 0, 0, 0, 0, 22, NULL, 0),
(3299, 0, -1, 0, 0, 'Trout Plaza 4', 80000, 16, 0, 0, 0, 0, 22, NULL, 0),
(3300, 0, -1, 0, 0, 'Skiffs End 2', 80000, 16, 0, 0, 0, 0, 21, NULL, 0),
(3301, 0, -1, 0, 0, 'Skiffs End 1', 100000, 16, 0, 0, 0, 0, 35, NULL, 0),
(3302, 0, -1, 0, 0, 'Furrier Quarter 3', 100000, 16, 0, 0, 0, 0, 40, NULL, 0),
(3303, 0, -1, 0, 0, 'Fimbul Shelf 4', 100000, 16, 0, 0, 0, 0, 42, NULL, 0),
(3304, 0, -1, 0, 0, 'Fimbul Shelf 3', 100000, 16, 0, 0, 0, 0, 49, NULL, 0),
(3305, 0, -1, 0, 0, 'Furrier Quarter 2', 80000, 16, 0, 0, 0, 0, 37, NULL, 0),
(3306, 0, -1, 0, 0, 'Furrier Quarter 1', 150000, 16, 0, 0, 0, 0, 53, NULL, 0),
(3307, 0, -1, 0, 0, 'Fimbul Shelf 2', 100000, 16, 0, 0, 0, 0, 43, NULL, 0),
(3308, 0, -1, 0, 0, 'Fimbul Shelf 1', 80000, 16, 0, 0, 0, 0, 36, NULL, 0),
(3309, 0, -1, 0, 0, 'Bears Paw 3', 200000, 16, 0, 0, 0, 0, 47, NULL, 0),
(3310, 0, -1, 0, 0, 'Raven Corner 2', 150000, 16, 0, 0, 0, 0, 36, NULL, 0),
(3311, 0, -1, 0, 0, 'Raven Corner 1', 80000, 16, 0, 0, 0, 0, 22, NULL, 0),
(3312, 0, -1, 0, 0, 'Raven Corner 3', 100000, 16, 0, 0, 0, 0, 22, NULL, 0),
(3313, 0, -1, 0, 0, 'Mammoth Belly', 1000000, 16, 0, 0, 0, 0, 404, NULL, 0),
(3314, 0, -1, 0, 0, 'Darashia 3, Flat 01', 150000, 13, 0, 0, 0, 0, 27, NULL, 0),
(3315, 0, -1, 0, 0, 'Darashia 3, Flat 05', 150000, 13, 0, 0, 0, 0, 26, NULL, 0),
(3316, 0, -1, 0, 0, 'Darashia 3, Flat 02', 200000, 13, 0, 0, 0, 0, 41, NULL, 0),
(3317, 0, -1, 0, 0, 'Darashia 3, Flat 04', 150000, 13, 0, 0, 0, 0, 39, NULL, 0),
(3318, 0, -1, 0, 0, 'Darashia 3, Flat 03', 150000, 13, 0, 0, 0, 0, 28, NULL, 0),
(3319, 0, -1, 0, 0, 'Darashia 3, Flat 12', 200000, 13, 0, 0, 0, 0, 56, NULL, 0),
(3320, 0, -1, 0, 0, 'Darashia 3, Flat 11', 100000, 13, 0, 0, 0, 0, 27, NULL, 0),
(3321, 0, -1, 0, 0, 'Darashia 3, Flat 14', 200000, 13, 0, 0, 0, 0, 59, NULL, 0),
(3322, 0, -1, 0, 0, 'Darashia 3, Flat 13', 100000, 13, 0, 0, 0, 0, 27, NULL, 0),
(3323, 0, -1, 0, 0, 'Darashia 8, Flat 01', 300000, 13, 0, 0, 0, 0, 55, NULL, 0),
(3325, 0, -1, 0, 0, 'Darashia 8, Flat 05', 300000, 13, 0, 0, 0, 0, 58, NULL, 0),
(3326, 0, -1, 0, 0, 'Darashia 8, Flat 04', 200000, 13, 0, 0, 0, 0, 63, NULL, 0),
(3327, 0, -1, 0, 0, 'Darashia 8, Flat 03', 300000, 13, 0, 0, 0, 0, 105, NULL, 0),
(3328, 0, -1, 0, 0, 'Darashia 8, Flat 12', 150000, 13, 0, 0, 0, 0, 39, NULL, 0),
(3329, 0, -1, 0, 0, 'Darashia 8, Flat 11', 200000, 13, 0, 0, 0, 0, 46, NULL, 0),
(3330, 0, -1, 0, 0, 'Darashia 8, Flat 14', 150000, 13, 0, 0, 0, 0, 42, NULL, 0),
(3331, 0, -1, 0, 0, 'Darashia 8, Flat 13', 150000, 13, 0, 0, 0, 0, 46, NULL, 0),
(3332, 0, -1, 0, 0, 'Darashia, Villa', 800000, 13, 0, 0, 0, 0, 120, NULL, 0),
(3333, 0, -1, 0, 0, 'Darashia, Eastern Guildhall', 1000000, 13, 0, 0, 0, 0, 272, NULL, 0),
(3334, 0, -1, 0, 0, 'Darashia, Western Guildhall', 500000, 13, 0, 0, 0, 0, 223, NULL, 0),
(3335, 0, -1, 0, 0, 'Darashia 2, Flat 03', 100000, 13, 0, 0, 0, 0, 31, NULL, 0),
(3336, 0, -1, 0, 0, 'Darashia 2, Flat 02', 100000, 13, 0, 0, 0, 0, 26, NULL, 0),
(3337, 0, -1, 0, 0, 'Darashia 2, Flat 01', 150000, 13, 0, 0, 0, 0, 29, NULL, 0),
(3338, 0, -1, 0, 0, 'Darashia 2, Flat 04', 80000, 13, 0, 0, 0, 0, 14, NULL, 0),
(3339, 0, -1, 0, 0, 'Darashia 2, Flat 05', 150000, 13, 0, 0, 0, 0, 31, NULL, 0),
(3340, 0, -1, 0, 0, 'Darashia 2, Flat 06', 80000, 13, 0, 0, 0, 0, 14, NULL, 0),
(3341, 0, -1, 0, 0, 'Darashia 2, Flat 07', 150000, 13, 0, 0, 0, 0, 29, NULL, 0),
(3342, 0, -1, 0, 0, 'Darashia 2, Flat 13', 100000, 13, 0, 0, 0, 0, 31, NULL, 0),
(3343, 0, -1, 0, 0, 'Darashia 2, Flat 14', 50000, 13, 0, 0, 0, 0, 14, NULL, 0),
(3344, 0, -1, 0, 0, 'Darashia 2, Flat 15', 100000, 13, 0, 0, 0, 0, 30, NULL, 0),
(3345, 0, -1, 0, 0, 'Darashia 2, Flat 16', 80000, 13, 0, 0, 0, 0, 18, NULL, 0),
(3346, 0, -1, 0, 0, 'Darashia 2, Flat 17', 100000, 13, 0, 0, 0, 0, 27, NULL, 0),
(3347, 0, -1, 0, 0, 'Darashia 2, Flat 18', 100000, 13, 0, 0, 0, 0, 17, NULL, 0),
(3348, 0, -1, 0, 0, 'Darashia 2, Flat 11', 100000, 13, 0, 0, 0, 0, 27, NULL, 0),
(3349, 0, -1, 0, 0, 'Darashia 2, Flat 12', 80000, 13, 0, 0, 0, 0, 13, NULL, 0),
(3350, 0, -1, 0, 0, 'Darashia 1, Flat 03', 300000, 13, 0, 0, 0, 0, 65, NULL, 0),
(3351, 0, -1, 0, 0, 'Darashia 1, Flat 04', 100000, 13, 0, 0, 0, 0, 28, NULL, 0),
(3352, 0, -1, 0, 0, 'Darashia 1, Flat 02', 100000, 13, 0, 0, 0, 0, 26, NULL, 0),
(3353, 0, -1, 0, 0, 'Darashia 1, Flat 01', 100000, 13, 0, 0, 0, 0, 29, NULL, 0),
(3354, 0, -1, 0, 0, 'Darashia 1, Flat 05', 100000, 13, 0, 0, 0, 0, 29, NULL, 0),
(3355, 0, -1, 0, 0, 'Darashia 1, Flat 12', 150000, 13, 0, 0, 0, 0, 46, NULL, 0),
(3356, 0, -1, 0, 0, 'Darashia 1, Flat 13', 150000, 13, 0, 0, 0, 0, 50, NULL, 0),
(3357, 0, -1, 0, 0, 'Darashia 1, Flat 14', 200000, 13, 0, 0, 0, 0, 69, NULL, 0),
(3358, 0, -1, 0, 0, 'Darashia 1, Flat 11', 100000, 13, 0, 0, 0, 0, 27, NULL, 0),
(3359, 0, -1, 0, 0, 'Darashia 5, Flat 02', 150000, 13, 0, 0, 0, 0, 41, NULL, 0),
(3360, 0, -1, 0, 0, 'Darashia 5, Flat 01', 150000, 13, 0, 0, 0, 0, 29, NULL, 0),
(3361, 0, -1, 0, 0, 'Darashia 5, Flat 05', 100000, 13, 0, 0, 0, 0, 29, NULL, 0),
(3362, 0, -1, 0, 0, 'Darashia 5, Flat 04', 150000, 13, 0, 0, 0, 0, 42, NULL, 0),
(3363, 0, -1, 0, 0, 'Darashia 5, Flat 03', 150000, 13, 0, 0, 0, 0, 27, NULL, 0),
(3364, 0, -1, 0, 0, 'Darashia 5, Flat 11', 150000, 13, 0, 0, 0, 0, 46, NULL, 0),
(3365, 0, -1, 0, 0, 'Darashia 5, Flat 12', 150000, 13, 0, 0, 0, 0, 39, NULL, 0),
(3366, 0, -1, 0, 0, 'Darashia 5, Flat 13', 150000, 13, 0, 0, 0, 0, 42, NULL, 0),
(3367, 0, -1, 0, 0, 'Darashia 5, Flat 14', 150000, 13, 0, 0, 0, 0, 38, NULL, 0),
(3368, 0, -1, 0, 0, 'Darashia 6a', 300000, 13, 0, 0, 0, 0, 67, NULL, 0),
(3369, 0, -1, 0, 0, 'Darashia 6b', 300000, 13, 0, 0, 0, 0, 80, NULL, 0),
(3370, 0, -1, 0, 0, 'Darashia 4, Flat 02', 200000, 13, 0, 0, 0, 0, 44, NULL, 0),
(3371, 0, -1, 0, 0, 'Darashia 4, Flat 03', 150000, 13, 0, 0, 0, 0, 27, NULL, 0),
(3372, 0, -1, 0, 0, 'Darashia 4, Flat 04', 200000, 13, 0, 0, 0, 0, 45, NULL, 0),
(3373, 0, -1, 0, 0, 'Darashia 4, Flat 05', 150000, 13, 0, 0, 0, 0, 30, NULL, 0),
(3374, 0, -1, 0, 0, 'Darashia 4, Flat 01', 100000, 13, 0, 0, 0, 0, 31, NULL, 0),
(3375, 0, -1, 0, 0, 'Darashia 4, Flat 12', 200000, 13, 0, 0, 0, 0, 64, NULL, 0),
(3376, 0, -1, 0, 0, 'Darashia 4, Flat 11', 100000, 13, 0, 0, 0, 0, 26, NULL, 0),
(3377, 0, -1, 0, 0, 'Darashia 4, Flat 13', 200000, 13, 0, 0, 0, 0, 44, NULL, 0),
(3378, 0, -1, 0, 0, 'Darashia 4, Flat 14', 150000, 13, 0, 0, 0, 0, 46, NULL, 0),
(3379, 0, -1, 0, 0, 'Darashia 7, Flat 01', 100000, 13, 0, 0, 0, 0, 26, NULL, 0),
(3380, 0, -1, 0, 0, 'Darashia 7, Flat 02', 100000, 13, 0, 0, 0, 0, 27, NULL, 0),
(3381, 0, -1, 0, 0, 'Darashia 7, Flat 03', 200000, 13, 0, 0, 0, 0, 65, NULL, 0),
(3382, 0, -1, 0, 0, 'Darashia 7, Flat 05', 150000, 13, 0, 0, 0, 0, 27, NULL, 0),
(3383, 0, -1, 0, 0, 'Darashia 7, Flat 04', 150000, 13, 0, 0, 0, 0, 27, NULL, 0),
(3384, 0, -1, 0, 0, 'Darashia 7, Flat 12', 200000, 13, 0, 0, 0, 0, 60, NULL, 0),
(3385, 0, -1, 0, 0, 'Darashia 7, Flat 11', 100000, 13, 0, 0, 0, 0, 26, NULL, 0),
(3386, 0, -1, 0, 0, 'Darashia 7, Flat 14', 200000, 13, 0, 0, 0, 0, 60, NULL, 0),
(3387, 0, -1, 0, 0, 'Darashia 7, Flat 13', 100000, 13, 0, 0, 0, 0, 25, NULL, 0),
(3388, 0, -1, 0, 0, 'Pirate Shipwreck 1', 800000, 13, 0, 0, 0, 0, 187, NULL, 0),
(3389, 0, -1, 0, 0, 'Pirate Shipwreck 2', 800000, 13, 0, 0, 0, 0, 276, NULL, 0),
(3390, 0, -1, 0, 0, 'The Shelter', 250000, 14, 0, 0, 0, 0, 422, NULL, 0),
(3391, 0, -1, 0, 0, 'Litter Promenade 1', 25000, 14, 0, 0, 0, 0, 15, NULL, 0),
(3392, 0, -1, 0, 0, 'Litter Promenade 2', 50000, 14, 0, 0, 0, 0, 14, NULL, 0),
(3394, 0, -1, 0, 0, 'Litter Promenade 3', 25000, 14, 0, 0, 0, 0, 21, NULL, 0),
(3395, 0, -1, 0, 0, 'Litter Promenade 4', 25000, 14, 0, 0, 0, 0, 18, NULL, 0),
(3396, 0, -1, 0, 0, 'Rum Alley 3', 25000, 14, 0, 0, 0, 0, 18, NULL, 0),
(3397, 0, -1, 0, 0, 'Straycat\'s Corner 5', 80000, 14, 0, 0, 0, 0, 25, NULL, 0),
(3398, 0, -1, 0, 0, 'Straycat\'s Corner 6', 25000, 14, 0, 0, 0, 0, 13, NULL, 0),
(3399, 0, -1, 0, 0, 'Litter Promenade 5', 25000, 14, 0, 0, 0, 0, 23, NULL, 0),
(3401, 0, -1, 0, 0, 'Straycat\'s Corner 4', 50000, 14, 0, 0, 0, 0, 23, NULL, 0),
(3402, 0, -1, 0, 0, 'Straycat\'s Corner 2', 50000, 14, 0, 0, 0, 0, 27, NULL, 0),
(3403, 0, -1, 0, 0, 'Straycat\'s Corner 1', 25000, 14, 0, 0, 0, 0, 14, NULL, 0),
(3404, 0, -1, 0, 0, 'Rum Alley 2', 25000, 14, 0, 0, 0, 0, 18, NULL, 0),
(3405, 0, -1, 0, 0, 'Rum Alley 1', 25000, 14, 0, 0, 0, 0, 25, NULL, 0),
(3406, 0, -1, 0, 0, 'Smuggler Backyard 3', 50000, 14, 0, 0, 0, 0, 27, NULL, 0),
(3407, 0, -1, 0, 0, 'Shady Trail 3', 25000, 14, 0, 0, 0, 0, 16, NULL, 0),
(3408, 0, -1, 0, 0, 'Shady Trail 1', 100000, 14, 0, 0, 0, 0, 34, NULL, 0),
(3409, 0, -1, 0, 0, 'Shady Trail 2', 25000, 14, 0, 0, 0, 0, 19, NULL, 0),
(3410, 0, -1, 0, 0, 'Smuggler Backyard 4', 25000, 14, 0, 0, 0, 0, 22, NULL, 0),
(3411, 0, -1, 0, 0, 'Smuggler Backyard 2', 25000, 14, 0, 0, 0, 0, 31, NULL, 0),
(3412, 0, -1, 0, 0, 'Smuggler Backyard 1', 25000, 14, 0, 0, 0, 0, 27, NULL, 0),
(3413, 0, -1, 0, 0, 'Smuggler Backyard 5', 25000, 14, 0, 0, 0, 0, 25, NULL, 0),
(3414, 0, -1, 0, 0, 'Sugar Street 1', 200000, 14, 0, 0, 0, 0, 60, NULL, 0),
(3415, 0, -1, 0, 0, 'Sugar Street 2', 150000, 14, 0, 0, 0, 0, 51, NULL, 0),
(3416, 0, -1, 0, 0, 'Sugar Street 3a', 100000, 14, 0, 0, 0, 0, 33, NULL, 0),
(3417, 0, -1, 0, 0, 'Sugar Street 3b', 150000, 14, 0, 0, 0, 0, 41, NULL, 0),
(3418, 0, -1, 0, 0, 'Sugar Street 4d', 50000, 14, 0, 0, 0, 0, 15, NULL, 0),
(3419, 0, -1, 0, 0, 'Sugar Street 4c', 25000, 14, 0, 0, 0, 0, 14, NULL, 0),
(3420, 0, -1, 0, 0, 'Sugar Street 4b', 100000, 14, 0, 0, 0, 0, 19, NULL, 0),
(3421, 0, -1, 0, 0, 'Sugar Street 4a', 80000, 14, 0, 0, 0, 0, 19, NULL, 0),
(3422, 0, -1, 0, 0, 'Harvester\'s Haven, Flat 01', 50000, 14, 0, 0, 0, 0, 17, NULL, 0),
(3423, 0, -1, 0, 0, 'Harvester\'s Haven, Flat 03', 50000, 14, 0, 0, 0, 0, 17, NULL, 0),
(3424, 0, -1, 0, 0, 'Harvester\'s Haven, Flat 05', 50000, 14, 0, 0, 0, 0, 17, NULL, 0),
(3425, 0, -1, 0, 0, 'Harvester\'s Haven, Flat 06', 50000, 14, 0, 0, 0, 0, 17, NULL, 0),
(3426, 0, -1, 0, 0, 'Harvester\'s Haven, Flat 04', 50000, 14, 0, 0, 0, 0, 17, NULL, 0),
(3427, 0, -1, 0, 0, 'Harvester\'s Haven, Flat 02', 50000, 14, 0, 0, 0, 0, 17, NULL, 0),
(3428, 0, -1, 0, 0, 'Harvester\'s Haven, Flat 07', 80000, 14, 0, 0, 0, 0, 19, NULL, 0),
(3429, 0, -1, 0, 0, 'Harvester\'s Haven, Flat 09', 50000, 14, 0, 0, 0, 0, 18, NULL, 0),
(3430, 0, -1, 0, 0, 'Harvester\'s Haven, Flat 11', 25000, 14, 0, 0, 0, 0, 19, NULL, 0),
(3431, 0, -1, 0, 0, 'Harvester\'s Haven, Flat 08', 50000, 14, 0, 0, 0, 0, 19, NULL, 0),
(3432, 0, -1, 0, 0, 'Harvester\'s Haven, Flat 10', 50000, 14, 0, 0, 0, 0, 18, NULL, 0),
(3433, 0, -1, 0, 0, 'Harvester\'s Haven, Flat 12', 25000, 14, 0, 0, 0, 0, 19, NULL, 0),
(3434, 0, -1, 0, 0, 'Marble Lane 3', 600000, 14, 0, 0, 0, 0, 163, NULL, 0),
(3435, 0, -1, 0, 0, 'Marble Lane 2', 400000, 14, 0, 0, 0, 0, 141, NULL, 0),
(3436, 0, -1, 0, 0, 'Marble Lane 4', 400000, 14, 0, 0, 0, 0, 134, NULL, 0),
(3437, 0, -1, 0, 0, 'Admiral\'s Avenue 1', 400000, 14, 0, 0, 0, 0, 97, NULL, 0),
(3438, 0, -1, 0, 0, 'Admiral\'s Avenue 2', 400000, 14, 0, 0, 0, 0, 111, NULL, 0),
(3439, 0, -1, 0, 0, 'Admiral\'s Avenue 3', 300000, 14, 0, 0, 0, 0, 99, NULL, 0),
(3440, 0, -1, 0, 0, 'Ivory Circle 1', 400000, 14, 0, 0, 0, 0, 101, NULL, 0),
(3441, 0, -1, 0, 0, 'Sugar Street 5', 150000, 14, 0, 0, 0, 0, 25, NULL, 0),
(3442, 0, -1, 0, 0, 'Freedom Street 1', 200000, 14, 0, 0, 0, 0, 47, NULL, 0),
(3443, 0, -1, 0, 0, 'Trader\'s Point 1', 200000, 14, 0, 0, 0, 0, 42, NULL, 0),
(3444, 0, -1, 0, 0, 'Trader\'s Point 2 (Shop)', 600000, 14, 0, 0, 0, 0, 122, NULL, 0),
(3445, 0, -1, 0, 0, 'Trader\'s Point 3 (Shop)', 600000, 14, 0, 0, 0, 0, 130, NULL, 0),
(3446, 0, -1, 0, 0, 'Ivory Mansion', 800000, 14, 0, 0, 0, 0, 319, NULL, 0),
(3447, 0, -1, 0, 0, 'Ivory Circle 2', 400000, 14, 0, 0, 0, 0, 142, NULL, 0),
(3448, 0, -1, 0, 0, 'Ivy Cottage', 500000, 14, 0, 0, 0, 0, 587, NULL, 0),
(3449, 0, -1, 0, 0, 'Marble Lane 1', 600000, 14, 0, 0, 0, 0, 228, NULL, 0),
(3450, 0, -1, 0, 0, 'Freedom Street 2', 400000, 14, 0, 0, 0, 0, 123, NULL, 0),
(3452, 0, -1, 0, 0, 'Meriana Beach', 150000, 14, 0, 0, 0, 0, 172, NULL, 0),
(3453, 0, -1, 0, 0, 'The Tavern 1a', 150000, 14, 0, 0, 0, 0, 52, NULL, 0),
(3454, 0, -1, 0, 0, 'The Tavern 1b', 100000, 14, 0, 0, 0, 0, 38, NULL, 0),
(3455, 0, -1, 0, 0, 'The Tavern 1c', 200000, 14, 0, 0, 0, 0, 85, NULL, 0),
(3456, 0, -1, 0, 0, 'The Tavern 1d', 100000, 14, 0, 0, 0, 0, 33, NULL, 0),
(3457, 0, -1, 0, 0, 'The Tavern 2a', 300000, 14, 0, 0, 0, 0, 111, NULL, 0),
(3458, 0, -1, 0, 0, 'The Tavern 2b', 100000, 14, 0, 0, 0, 0, 36, NULL, 0),
(3459, 0, -1, 0, 0, 'The Tavern 2d', 100000, 14, 0, 0, 0, 0, 27, NULL, 0),
(3460, 0, -1, 0, 0, 'The Tavern 2c', 50000, 14, 0, 0, 0, 0, 20, NULL, 0),
(3461, 0, -1, 0, 0, 'The Yeah Beach Project', 150000, 14, 0, 0, 0, 0, 157, NULL, 0),
(3462, 0, -1, 0, 0, 'Mountain Hideout', 500000, 14, 0, 0, 0, 0, 321, NULL, 0),
(3463, 0, -1, 0, 0, 'Darashia 8, Flat 02', 300000, 13, 0, 0, 0, 0, 76, NULL, 0),
(3464, 0, -1, 0, 0, 'Castle, Basement, Flat 01', 50000, 11, 0, 0, 0, 0, 13, NULL, 0),
(3465, 0, -1, 0, 0, 'Castle, Basement, Flat 02', 50000, 11, 0, 0, 0, 0, 13, NULL, 0),
(3466, 0, -1, 0, 0, 'Castle, Basement, Flat 03', 50000, 11, 0, 0, 0, 0, 13, NULL, 0),
(3467, 0, -1, 0, 0, 'Castle, Basement, Flat 05', 50000, 11, 0, 0, 0, 0, 13, NULL, 0),
(3468, 0, -1, 0, 0, 'Castle, Basement, Flat 04', 50000, 11, 0, 0, 0, 0, 13, NULL, 0),
(3469, 0, -1, 0, 0, 'Castle, Basement, Flat 06', 50000, 11, 0, 0, 0, 0, 13, NULL, 0),
(3470, 0, -1, 0, 0, 'Castle, Basement, Flat 07', 50000, 11, 0, 0, 0, 0, 13, NULL, 0),
(3471, 0, -1, 0, 0, 'Castle, Basement, Flat 09', 25000, 11, 0, 0, 0, 0, 13, NULL, 0),
(3472, 0, -1, 0, 0, 'Castle, Basement, Flat 08', 50000, 11, 0, 0, 0, 0, 13, NULL, 0),
(3473, 0, -1, 0, 0, 'Cormaya 1', 150000, 11, 0, 0, 0, 0, 30, NULL, 0),
(3474, 0, -1, 0, 0, 'Cormaya Flats, Flat 01', 25000, 11, 0, 0, 0, 0, 11, NULL, 0),
(3475, 0, -1, 0, 0, 'Cormaya Flats, Flat 02', 25000, 11, 0, 0, 0, 0, 11, NULL, 0),
(3476, 0, -1, 0, 0, 'Cormaya Flats, Flat 03', 50000, 11, 0, 0, 0, 0, 17, NULL, 0),
(3477, 0, -1, 0, 0, 'Cormaya Flats, Flat 06', 25000, 11, 0, 0, 0, 0, 11, NULL, 0),
(3478, 0, -1, 0, 0, 'Cormaya Flats, Flat 05', 25000, 11, 0, 0, 0, 0, 11, NULL, 0),
(3479, 0, -1, 0, 0, 'Cormaya Flats, Flat 04', 50000, 11, 0, 0, 0, 0, 17, NULL, 0),
(3480, 0, -1, 0, 0, 'Cormaya Flats, Flat 11', 100000, 11, 0, 0, 0, 0, 24, NULL, 0),
(3482, 0, -1, 0, 0, 'Cormaya Flats, Flat 13', 25000, 11, 0, 0, 0, 0, 17, NULL, 0),
(3483, 0, -1, 0, 0, 'Cormaya Flats, Flat 12', 100000, 11, 0, 0, 0, 0, 24, NULL, 0),
(3485, 0, -1, 0, 0, 'Cormaya Flats, Flat 14', 25000, 11, 0, 0, 0, 0, 17, NULL, 0),
(3486, 0, -1, 0, 0, 'Cormaya 2', 300000, 11, 0, 0, 0, 0, 84, NULL, 0),
(3487, 0, -1, 0, 0, 'Cormaya 4', 150000, 11, 0, 0, 0, 0, 39, NULL, 0),
(3488, 0, -1, 0, 0, 'Cormaya 3', 200000, 11, 0, 0, 0, 0, 47, NULL, 0),
(3489, 0, -1, 0, 0, 'Cormaya 6', 200000, 11, 0, 0, 0, 0, 56, NULL, 0),
(3490, 0, -1, 0, 0, 'Cormaya 7', 200000, 11, 0, 0, 0, 0, 54, NULL, 0),
(3491, 0, -1, 0, 0, 'Cormaya 8', 200000, 11, 0, 0, 0, 0, 65, NULL, 0),
(3492, 0, -1, 0, 0, 'Cormaya 5', 300000, 11, 0, 0, 0, 0, 123, NULL, 0),
(3493, 0, -1, 0, 0, 'Castle of the White Dragon', 1000000, 11, 0, 0, 0, 0, 532, NULL, 0),
(3494, 0, -1, 0, 0, 'Cormaya 9b', 150000, 11, 0, 0, 0, 0, 58, NULL, 0),
(3495, 0, -1, 0, 0, 'Cormaya 9a', 80000, 11, 0, 0, 0, 0, 28, NULL, 0),
(3496, 0, -1, 0, 0, 'Cormaya 9d', 150000, 11, 0, 0, 0, 0, 60, NULL, 0),
(3497, 0, -1, 0, 0, 'Cormaya 9c', 80000, 11, 0, 0, 0, 0, 28, NULL, 0),
(3498, 0, -1, 0, 0, 'Cormaya 10', 300000, 11, 0, 0, 0, 0, 85, NULL, 0),
(3499, 0, -1, 0, 0, 'Cormaya 11', 150000, 11, 0, 0, 0, 0, 47, NULL, 0),
(3500, 0, -1, 0, 0, 'Edron Flats, Flat 22', 50000, 11, 0, 0, 0, 0, 12, NULL, 0),
(3501, 0, -1, 0, 0, 'Magic Academy, Shop', 150000, 11, 0, 0, 0, 0, 23, NULL, 0),
(3502, 0, -1, 0, 0, 'Magic Academy, Flat 1', 100000, 11, 0, 0, 0, 0, 23, NULL, 0),
(3503, 0, -1, 0, 0, 'Magic Academy, Guild', 500000, 11, 0, 0, 0, 0, 195, NULL, 0),
(3504, 0, -1, 0, 0, 'Magic Academy, Flat 2', 80000, 11, 0, 0, 0, 0, 26, NULL, 0),
(3505, 0, -1, 0, 0, 'Magic Academy, Flat 3', 100000, 11, 0, 0, 0, 0, 26, NULL, 0),
(3506, 0, -1, 0, 0, 'Magic Academy, Flat 4', 100000, 11, 0, 0, 0, 0, 26, NULL, 0),
(3507, 0, -1, 0, 0, 'Magic Academy, Flat 5', 80000, 11, 0, 0, 0, 0, 26, NULL, 0),
(3508, 0, -1, 0, 0, 'Oskahl I f', 100000, 10, 0, 0, 0, 0, 21, NULL, 0),
(3509, 0, -1, 0, 0, 'Oskahl I g', 100000, 10, 0, 0, 0, 0, 26, NULL, 0),
(3510, 0, -1, 0, 0, 'Oskahl I h', 150000, 10, 0, 0, 0, 0, 39, NULL, 0),
(3511, 0, -1, 0, 0, 'Oskahl I i', 80000, 10, 0, 0, 0, 0, 21, NULL, 0),
(3512, 0, -1, 0, 0, 'Oskahl I j', 80000, 10, 0, 0, 0, 0, 17, NULL, 0),
(3513, 0, -1, 0, 0, 'Oskahl I b', 80000, 10, 0, 0, 0, 0, 21, NULL, 0),
(3514, 0, -1, 0, 0, 'Oskahl I d', 100000, 10, 0, 0, 0, 0, 26, NULL, 0),
(3515, 0, -1, 0, 0, 'Oskahl I e', 80000, 10, 0, 0, 0, 0, 21, NULL, 0),
(3516, 0, -1, 0, 0, 'Oskahl I c', 80000, 10, 0, 0, 0, 0, 17, NULL, 0),
(3517, 0, -1, 0, 0, 'Chameken I', 100000, 10, 0, 0, 0, 0, 17, NULL, 0),
(3518, 0, -1, 0, 0, 'Chameken II', 80000, 10, 0, 0, 0, 0, 17, NULL, 0),
(3519, 0, -1, 0, 0, 'Charsirakh III', 50000, 10, 0, 0, 0, 0, 17, NULL, 0),
(3520, 0, -1, 0, 0, 'Charsirakh II', 100000, 10, 0, 0, 0, 0, 26, NULL, 0),
(3521, 0, -1, 0, 0, 'Murkhol I a', 80000, 10, 0, 0, 0, 0, 23, NULL, 0),
(3523, 0, -1, 0, 0, 'Murkhol I c', 50000, 10, 0, 0, 0, 0, 11, NULL, 0),
(3524, 0, -1, 0, 0, 'Murkhol I b', 50000, 10, 0, 0, 0, 0, 11, NULL, 0),
(3525, 0, -1, 0, 0, 'Charsirakh I b', 150000, 10, 0, 0, 0, 0, 37, NULL, 0),
(3526, 0, -1, 0, 0, 'Harrah I', 250000, 10, 0, 0, 0, 0, 124, NULL, 0),
(3527, 0, -1, 0, 0, 'Thanah I d', 200000, 10, 0, 0, 0, 0, 52, NULL, 0),
(3528, 0, -1, 0, 0, 'Thanah I c', 200000, 10, 0, 0, 0, 0, 61, NULL, 0),
(3529, 0, -1, 0, 0, 'Thanah I b', 150000, 10, 0, 0, 0, 0, 56, NULL, 0),
(3530, 0, -1, 0, 0, 'Thanah I a', 25000, 10, 0, 0, 0, 0, 17, NULL, 0),
(3531, 0, -1, 0, 0, 'Othehothep I c', 150000, 10, 0, 0, 0, 0, 38, NULL, 0),
(3532, 0, -1, 0, 0, 'Othehothep I d', 150000, 10, 0, 0, 0, 0, 43, NULL, 0),
(3533, 0, -1, 0, 0, 'Othehothep I b', 100000, 10, 0, 0, 0, 0, 32, NULL, 0),
(3534, 0, -1, 0, 0, 'Othehothep II c', 80000, 10, 0, 0, 0, 0, 21, NULL, 0),
(3535, 0, -1, 0, 0, 'Othehothep II d', 80000, 10, 0, 0, 0, 0, 21, NULL, 0),
(3536, 0, -1, 0, 0, 'Othehothep II e', 150000, 10, 0, 0, 0, 0, 31, NULL, 0),
(3537, 0, -1, 0, 0, 'Othehothep II f', 100000, 10, 0, 0, 0, 0, 31, NULL, 0),
(3538, 0, -1, 0, 0, 'Othehothep II b', 150000, 10, 0, 0, 0, 0, 43, NULL, 0),
(3539, 0, -1, 0, 0, 'Othehothep II a', 25000, 10, 0, 0, 0, 0, 10, NULL, 0),
(3540, 0, -1, 0, 0, 'Mothrem I', 80000, 10, 0, 0, 0, 0, 26, NULL, 0),
(3541, 0, -1, 0, 0, 'Arakmehn I', 100000, 10, 0, 0, 0, 0, 28, NULL, 0),
(3542, 0, -1, 0, 0, 'Arakmehn II', 80000, 10, 0, 0, 0, 0, 26, NULL, 0),
(3543, 0, -1, 0, 0, 'Arakmehn III', 100000, 10, 0, 0, 0, 0, 26, NULL, 0),
(3544, 0, -1, 0, 0, 'Arakmehn IV', 100000, 10, 0, 0, 0, 0, 28, NULL, 0),
(3545, 0, -1, 0, 0, 'Unklath II b', 50000, 10, 0, 0, 0, 0, 17, NULL, 0),
(3546, 0, -1, 0, 0, 'Unklath II c', 50000, 10, 0, 0, 0, 0, 17, NULL, 0),
(3547, 0, -1, 0, 0, 'Unklath II d', 100000, 10, 0, 0, 0, 0, 37, NULL, 0),
(3548, 0, -1, 0, 0, 'Unklath II a', 50000, 10, 0, 0, 0, 0, 26, NULL, 0),
(3549, 0, -1, 0, 0, 'Rathal I b', 50000, 10, 0, 0, 0, 0, 17, NULL, 0),
(3550, 0, -1, 0, 0, 'Rathal I c', 25000, 10, 0, 0, 0, 0, 17, NULL, 0),
(3551, 0, -1, 0, 0, 'Rathal I d', 50000, 10, 0, 0, 0, 0, 17, NULL, 0),
(3552, 0, -1, 0, 0, 'Rathal I e', 50000, 10, 0, 0, 0, 0, 17, NULL, 0),
(3553, 0, -1, 0, 0, 'Rathal I a', 80000, 10, 0, 0, 0, 0, 26, NULL, 0),
(3554, 0, -1, 0, 0, 'Rathal II b', 50000, 10, 0, 0, 0, 0, 17, NULL, 0),
(3555, 0, -1, 0, 0, 'Rathal II c', 50000, 10, 0, 0, 0, 0, 17, NULL, 0),
(3556, 0, -1, 0, 0, 'Rathal II d', 100000, 10, 0, 0, 0, 0, 34, NULL, 0),
(3557, 0, -1, 0, 0, 'Rathal II a', 80000, 10, 0, 0, 0, 0, 26, NULL, 0),
(3558, 0, -1, 0, 0, 'Esuph I', 50000, 10, 0, 0, 0, 0, 17, NULL, 0),
(3559, 0, -1, 0, 0, 'Esuph II b', 100000, 10, 0, 0, 0, 0, 32, NULL, 0),
(3560, 0, -1, 0, 0, 'Esuph II a', 25000, 10, 0, 0, 0, 0, 7, NULL, 0),
(3561, 0, -1, 0, 0, 'Esuph III b', 100000, 10, 0, 0, 0, 0, 31, NULL, 0),
(3562, 0, -1, 0, 0, 'Esuph III a', 25000, 10, 0, 0, 0, 0, 7, NULL, 0),
(3564, 0, -1, 0, 0, 'Esuph IV c', 80000, 10, 0, 0, 0, 0, 23, NULL, 0),
(3565, 0, -1, 0, 0, 'Esuph IV d', 25000, 10, 0, 0, 0, 0, 20, NULL, 0),
(3566, 0, -1, 0, 0, 'Esuph IV a', 25000, 10, 0, 0, 0, 0, 10, NULL, 0),
(3567, 0, -1, 0, 0, 'Horakhal', 250000, 10, 0, 0, 0, 0, 205, NULL, 0),
(3568, 0, -1, 0, 0, 'Botham II d', 100000, 10, 0, 0, 0, 0, 37, NULL, 0),
(3569, 0, -1, 0, 0, 'Botham II e', 100000, 10, 0, 0, 0, 0, 31, NULL, 0),
(3570, 0, -1, 0, 0, 'Botham II f', 80000, 10, 0, 0, 0, 0, 31, NULL, 0),
(3571, 0, -1, 0, 0, 'Botham II g', 80000, 10, 0, 0, 0, 0, 26, NULL, 0),
(3572, 0, -1, 0, 0, 'Botham II c', 100000, 10, 0, 0, 0, 0, 23, NULL, 0),
(3573, 0, -1, 0, 0, 'Botham II b', 100000, 10, 0, 0, 0, 0, 30, NULL, 0),
(3574, 0, -1, 0, 0, 'Botham II a', 25000, 10, 0, 0, 0, 0, 17, NULL, 0),
(3575, 0, -1, 0, 0, 'Botham III f', 150000, 10, 0, 0, 0, 0, 43, NULL, 0),
(3576, 0, -1, 0, 0, 'Botham III h', 200000, 10, 0, 0, 0, 0, 71, NULL, 0),
(3577, 0, -1, 0, 0, 'Botham III g', 100000, 10, 0, 0, 0, 0, 31, NULL, 0),
(3578, 0, -1, 0, 0, 'Botham III b', 50000, 10, 0, 0, 0, 0, 17, NULL, 0),
(3579, 0, -1, 0, 0, 'Botham III c', 25000, 10, 0, 0, 0, 0, 17, NULL, 0),
(3581, 0, -1, 0, 0, 'Botham III e', 100000, 10, 0, 0, 0, 0, 38, NULL, 0),
(3582, 0, -1, 0, 0, 'Botham III a', 80000, 10, 0, 0, 0, 0, 26, NULL, 0),
(3583, 0, -1, 0, 0, 'Botham IV f', 100000, 10, 0, 0, 0, 0, 32, NULL, 0),
(3584, 0, -1, 0, 0, 'Botham IV h', 100000, 10, 0, 0, 0, 0, 37, NULL, 0),
(3585, 0, -1, 0, 0, 'Botham IV i', 150000, 10, 0, 0, 0, 0, 32, NULL, 0),
(3586, 0, -1, 0, 0, 'Botham IV g', 100000, 10, 0, 0, 0, 0, 31, NULL, 0),
(3587, 0, -1, 0, 0, 'Botham IV e', 100000, 10, 0, 0, 0, 0, 85, NULL, 0),
(3591, 0, -1, 0, 0, 'Botham IV a', 100000, 10, 0, 0, 0, 0, 26, NULL, 0),
(3592, 0, -1, 0, 0, 'Ramen Tah', 250000, 10, 0, 0, 0, 0, 125, NULL, 0),
(3593, 0, -1, 0, 0, 'Botham I c', 150000, 10, 0, 0, 0, 0, 32, NULL, 0),
(3594, 0, -1, 0, 0, 'Botham I e', 80000, 10, 0, 0, 0, 0, 31, NULL, 0),
(3595, 0, -1, 0, 0, 'Botham I d', 150000, 10, 0, 0, 0, 0, 57, NULL, 0),
(3596, 0, -1, 0, 0, 'Botham I b', 150000, 10, 0, 0, 0, 0, 56, NULL, 0),
(3597, 0, -1, 0, 0, 'Botham I a', 50000, 10, 0, 0, 0, 0, 19, NULL, 0),
(3598, 0, -1, 0, 0, 'Charsirakh I a', 25000, 10, 0, 0, 0, 0, 7, NULL, 0),
(3599, 0, -1, 0, 0, 'Low Waters Observatory', 400000, 10, 0, 0, 0, 0, 525, NULL, 0),
(3600, 0, -1, 0, 0, 'Oskahl I a', 150000, 10, 0, 0, 0, 0, 37, NULL, 0),
(3601, 0, -1, 0, 0, 'Othehothep I a', 25000, 10, 0, 0, 0, 0, 7, NULL, 0),
(3602, 0, -1, 0, 0, 'Othehothep III a', 25000, 10, 0, 0, 0, 0, 7, NULL, 0),
(3603, 0, -1, 0, 0, 'Othehothep III b', 80000, 10, 0, 0, 0, 0, 31, NULL, 0),
(3604, 0, -1, 0, 0, 'Othehothep III c', 80000, 10, 0, 0, 0, 0, 21, NULL, 0),
(3605, 0, -1, 0, 0, 'Othehothep III d', 80000, 10, 0, 0, 0, 0, 26, NULL, 0),
(3606, 0, -1, 0, 0, 'Othehothep III e', 50000, 10, 0, 0, 0, 0, 21, NULL, 0),
(3607, 0, -1, 0, 0, 'Othehothep III f', 50000, 10, 0, 0, 0, 0, 17, NULL, 0),
(3608, 0, -1, 0, 0, 'Unklath I f', 100000, 10, 0, 0, 0, 0, 37, NULL, 0),
(3609, 0, -1, 0, 0, 'Unklath I g', 100000, 10, 0, 0, 0, 0, 37, NULL, 0),
(3610, 0, -1, 0, 0, 'Unklath I d', 150000, 10, 0, 0, 0, 0, 37, NULL, 0),
(3611, 0, -1, 0, 0, 'Unklath I e', 150000, 10, 0, 0, 0, 0, 37, NULL, 0),
(3612, 0, -1, 0, 0, 'Unklath I b', 100000, 10, 0, 0, 0, 0, 34, NULL, 0),
(3613, 0, -1, 0, 0, 'Unklath I c', 100000, 10, 0, 0, 0, 0, 34, NULL, 0),
(3614, 0, -1, 0, 0, 'Unklath I a', 100000, 10, 0, 0, 0, 0, 26, NULL, 0),
(3615, 0, -1, 0, 0, 'Thanah II a', 25000, 10, 0, 0, 0, 0, 17, NULL, 0),
(3616, 0, -1, 0, 0, 'Thanah II b', 50000, 10, 0, 0, 0, 0, 9, NULL, 0),
(3617, 0, -1, 0, 0, 'Thanah II d', 50000, 10, 0, 0, 0, 0, 7, NULL, 0),
(3618, 0, -1, 0, 0, 'Thanah II e', 25000, 10, 0, 0, 0, 0, 7, NULL, 0),
(3619, 0, -1, 0, 0, 'Thanah II c', 25000, 10, 0, 0, 0, 0, 9, NULL, 0),
(3620, 0, -1, 0, 0, 'Thanah II f', 150000, 10, 0, 0, 0, 0, 53, NULL, 0),
(3621, 0, -1, 0, 0, 'Thanah II g', 100000, 10, 0, 0, 0, 0, 31, NULL, 0),
(3622, 0, -1, 0, 0, 'Thanah II h', 100000, 10, 0, 0, 0, 0, 26, NULL, 0),
(3623, 0, -1, 0, 0, 'Thrarhor I a (Shop)', 50000, 10, 0, 0, 0, 0, 15, NULL, 0),
(3624, 0, -1, 0, 0, 'Thrarhor I c (Shop)', 50000, 10, 0, 0, 0, 0, 15, NULL, 0),
(3625, 0, -1, 0, 0, 'Thrarhor I d (Shop)', 80000, 10, 0, 0, 0, 0, 15, NULL, 0),
(3626, 0, -1, 0, 0, 'Thrarhor I b (Shop)', 50000, 10, 0, 0, 0, 0, 15, NULL, 0),
(3627, 0, -1, 0, 0, 'Uthemath I a', 25000, 10, 0, 0, 0, 0, 10, NULL, 0),
(3628, 0, -1, 0, 0, 'Uthemath I b', 50000, 10, 0, 0, 0, 0, 20, NULL, 0),
(3629, 0, -1, 0, 0, 'Uthemath I c', 80000, 10, 0, 0, 0, 0, 20, NULL, 0),
(3630, 0, -1, 0, 0, 'Uthemath I d', 80000, 10, 0, 0, 0, 0, 21, NULL, 0),
(3631, 0, -1, 0, 0, 'Uthemath I e', 80000, 10, 0, 0, 0, 0, 21, NULL, 0),
(3632, 0, -1, 0, 0, 'Uthemath I f', 150000, 10, 0, 0, 0, 0, 56, NULL, 0),
(3633, 0, -1, 0, 0, 'Uthemath II', 250000, 10, 0, 0, 0, 0, 93, NULL, 0),
(3634, 0, -1, 0, 0, 'Marketplace 1', 400000, 22, 0, 0, 0, 0, 79, NULL, 0),
(3635, 0, -1, 0, 0, 'Marketplace 2', 400000, 22, 0, 0, 0, 0, 92, NULL, 0),
(3636, 0, -1, 0, 0, 'Quay 1', 200000, 22, 0, 0, 0, 0, 81, NULL, 0),
(3637, 0, -1, 0, 0, 'Quay 2', 200000, 22, 0, 0, 0, 0, 130, NULL, 0),
(3638, 0, -1, 0, 0, 'Halls of Sun and Sea', 1000000, 22, 0, 0, 0, 0, 423, NULL, 0),
(3639, 0, -1, 0, 0, 'Palace Vicinity', 200000, 22, 0, 0, 0, 0, 132, NULL, 0),
(3640, 0, -1, 0, 0, 'Wave Tower', 400000, 22, 0, 0, 0, 0, 212, NULL, 0),
(3641, 0, -1, 0, 0, 'Old Sanctuary of God King Qjell', 300000, 18, 0, 0, 0, 0, 699, NULL, 0),
(3642, 0, -1, 0, 0, 'Old Heritage Estate', 600000, 20, 0, 0, 0, 0, 335, NULL, 0),
(3643, 0, -1, 0, 0, 'Rathleton Plaza 4', 400000, 20, 0, 0, 0, 0, 144, NULL, 0),
(3644, 0, -1, 0, 0, 'Rathleton Plaza 3', 400000, 20, 0, 0, 0, 0, 157, NULL, 0),
(3645, 0, -1, 0, 0, 'Rathleton Plaza 2', 400000, 20, 0, 0, 0, 0, 77, NULL, 0),
(3646, 0, -1, 0, 0, 'Rathleton Plaza 1', 300000, 20, 0, 0, 0, 0, 80, NULL, 0),
(3647, 0, -1, 0, 0, 'Antimony Lane 2', 400000, 20, 0, 0, 0, 0, 127, NULL, 0),
(3648, 0, -1, 0, 0, 'Antimony Lane 1', 400000, 20, 0, 0, 0, 0, 189, NULL, 0),
(3649, 0, -1, 0, 0, 'Wallside Residence', 400000, 20, 0, 0, 0, 0, 182, NULL, 0),
(3650, 0, -1, 0, 0, 'Wallside Lane 1', 800000, 20, 0, 0, 0, 0, 216, NULL, 0),
(3651, 0, -1, 0, 0, 'Wallside Lane 2', 600000, 20, 0, 0, 0, 0, 227, NULL, 0),
(3652, 0, -1, 0, 0, 'Vanward Flats B', 400000, 20, 0, 0, 0, 0, 179, NULL, 0),
(3653, 0, -1, 0, 0, 'Vanward Flats A', 400000, 20, 0, 0, 0, 0, 189, NULL, 0),
(3654, 0, -1, 0, 0, 'Bronze Brothers Bastion', 5000000, 20, 0, 0, 0, 0, 976, NULL, 0),
(3655, 0, -1, 0, 0, 'Cistern Ave', 300000, 20, 0, 0, 0, 0, 111, NULL, 0),
(3656, 0, -1, 0, 0, 'Antimony Lane 4', 400000, 20, 0, 0, 0, 0, 159, NULL, 0),
(3657, 0, -1, 0, 0, 'Antimony Lane 3', 400000, 20, 0, 0, 0, 0, 101, NULL, 0),
(3658, 0, -1, 0, 0, 'Rathleton Hills Residence', 400000, 20, 0, 0, 0, 0, 186, NULL, 0),
(3659, 0, -1, 0, 0, 'Rathleton Hills Estate', 1000000, 20, 0, 0, 0, 0, 534, NULL, 0),
(3660, 0, -1, 0, 0, 'Lion\'s Head Reef', 400000, 25, 0, 0, 0, 0, 166, NULL, 0),
(3661, 0, -1, 0, 0, 'Shadow Caves 1', 50000, 5, 0, 0, 0, 0, 32, NULL, 0),
(3662, 0, -1, 0, 0, 'Shadow Caves 2', 50000, 5, 0, 0, 0, 0, 37, NULL, 0),
(3663, 0, -1, 0, 0, 'Shadow Caves 3', 100000, 5, 0, 0, 0, 0, 61, NULL, 0),
(3664, 0, -1, 0, 0, 'Shadow Caves 4', 100000, 5, 0, 0, 0, 0, 53, NULL, 0),
(3665, 0, -1, 0, 0, 'Shadow Caves 5', 100000, 5, 0, 0, 0, 0, 61, NULL, 0),
(3666, 0, -1, 0, 0, 'Shadow Caves 6', 100000, 5, 0, 0, 0, 0, 50, NULL, 0),
(3667, 0, -1, 0, 0, 'Northport Clanhall', 250000, 6, 0, 0, 0, 0, 172, NULL, 0),
(3668, 0, -1, 0, 0, 'The Treehouse', 250000, 15, 0, 0, 0, 0, 972, NULL, 0),
(3669, 0, -1, 0, 0, 'Frost Manor', 500000, 16, 0, 0, 0, 0, 505, NULL, 0),
(3670, 0, -1, 0, 0, 'Hare\'s Den', 150000, 7, 0, 0, 0, 0, 304, NULL, 0),
(3671, 0, -1, 0, 0, 'Lost Cavern', 200000, 7, 0, 0, 0, 0, 705, NULL, 0),
(3672, 0, -1, 1732687431, 0, 'Drakonfall #73', 0, 1, 0, 0, 0, 0, 31, NULL, 0),
(3673, 0, -1, 0, 0, 'Caveman Shelter', 150000, 12, 0, 0, 0, 0, 137, NULL, 0),
(3674, 0, -1, 0, 0, 'Eastern House of Tranquility', 200000, 12, 0, 0, 0, 0, 313, NULL, 0),
(3675, 0, -1, 0, 0, 'Lakeside Mansion', 300000, 16, 0, 0, 0, 0, 136, NULL, 0),
(3676, 0, -1, 0, 0, 'Pilchard Bin 1', 80000, 16, 0, 0, 0, 0, 14, NULL, 0),
(3677, 0, -1, 0, 0, 'Pilchard Bin 2', 50000, 16, 0, 0, 0, 0, 14, NULL, 0),
(3678, 0, -1, 0, 0, 'Pilchard Bin 3', 50000, 16, 0, 0, 0, 0, 14, NULL, 0),
(3679, 0, -1, 0, 0, 'Pilchard Bin 4', 50000, 16, 0, 0, 0, 0, 14, NULL, 0),
(3680, 0, -1, 0, 0, 'Pilchard Bin 5', 80000, 16, 0, 0, 0, 0, 14, NULL, 0),
(3681, 0, -1, 0, 0, 'Pilchard Bin 6', 25000, 16, 0, 0, 0, 0, 11, NULL, 0),
(3682, 0, -1, 0, 0, 'Pilchard Bin 7', 25000, 16, 0, 0, 0, 0, 11, NULL, 0),
(3683, 0, -1, 0, 0, 'Pilchard Bin 8', 25000, 16, 0, 0, 0, 0, 11, NULL, 0),
(3684, 0, -1, 0, 0, 'Pilchard Bin 9', 50000, 16, 0, 0, 0, 0, 11, NULL, 0),
(3685, 0, -1, 0, 0, 'Pilchard Bin 10', 0, 16, 0, 0, 0, 0, 11, NULL, 0),
(3686, 0, -1, 0, 0, 'Mammoth House', 300000, 16, 0, 0, 0, 0, 280, NULL, 0),
(3687, 0, -1, 0, 0, 'Drakonfall #88', 0, 1, 0, 0, 0, 0, 37, NULL, 0),
(3688, 0, -1, 0, 0, 'Drakonfall #89', 0, 1, 0, 0, 0, 0, 31, NULL, 0),
(3689, 0, -1, 0, 0, 'Drakonfall #90', 0, 1, 0, 0, 0, 0, 36, NULL, 0),
(3690, 0, -1, 0, 0, 'Drakonfall #91', 0, 1, 0, 0, 0, 0, 21, NULL, 0),
(3691, 0, -1, 0, 0, 'Drakonfall #92', 0, 1, 0, 0, 0, 0, 39, NULL, 0),
(3692, 0, -1, 0, 0, 'Drakonfall #93', 0, 1, 0, 0, 0, 0, 21, NULL, 0),
(3693, 0, -1, 0, 0, 'Drakonfall #94', 0, 1, 0, 0, 0, 0, 36, NULL, 0),
(3694, 0, -1, 0, 0, 'Drakonfall #95', 0, 1, 0, 0, 0, 0, 31, NULL, 0),
(3695, 0, -1, 0, 0, 'Drakonfall #96', 0, 1, 0, 0, 0, 0, 50, NULL, 0),
(3696, 0, -1, 0, 0, 'Drakonfall #97', 0, 1, 0, 0, 0, 0, 41, NULL, 0),
(3697, 0, -1, 0, 0, 'Drakonfall #98', 0, 1, 0, 0, 0, 0, 29, NULL, 0),
(3698, 0, -1, 0, 0, 'Drakonfall #99', 0, 1, 0, 0, 0, 0, 26, NULL, 0),
(3699, 0, -1, 0, 0, 'Drakonfall #100', 0, 1, 0, 0, 0, 0, 26, NULL, 0),
(3700, 0, -1, 0, 0, 'Drakonfall #101', 0, 1, 0, 0, 0, 0, 26, NULL, 0),
(3701, 0, -1, 0, 0, 'Drakonfall #102', 0, 1, 0, 0, 0, 0, 38, NULL, 0),
(3702, 0, -1, 0, 0, 'Drakonfall #103', 0, 1, 0, 0, 0, 0, 26, NULL, 0),
(3703, 0, -1, 0, 0, 'Drakonfall #104', 0, 1, 0, 0, 0, 0, 16, NULL, 0),
(3704, 0, -1, 0, 0, 'Drakonfall #105', 0, 1, 0, 0, 0, 0, 31, NULL, 0),
(3705, 0, -1, 0, 0, 'Drakonfall #106', 0, 1, 0, 0, 0, 0, 27, NULL, 0),
(3706, 0, -1, 0, 0, 'Drakonfall #107', 0, 1, 0, 0, 0, 0, 28, NULL, 0),
(3707, 0, -1, 0, 0, 'Drakonfall #108', 0, 1, 0, 0, 0, 0, 31, NULL, 0),
(3708, 0, -1, 0, 0, 'Drakonfall #109', 0, 1, 0, 0, 0, 0, 162, NULL, 0),
(3709, 0, -1, 0, 0, 'Drakonfall #110', 0, 1, 0, 0, 0, 0, 214, NULL, 0),
(3710, 0, -1, 0, 0, 'Drakonfall #111', 0, 1, 0, 0, 0, 0, 256, NULL, 0),
(3711, 0, -1, 0, 0, 'Drakonfall #112', 0, 1, 0, 0, 0, 0, 247, NULL, 0),
(3712, 0, -1, 0, 0, 'Drakonfall #113', 0, 1, 0, 0, 0, 0, 21, NULL, 0),
(3713, 0, -1, 0, 0, 'Drakonfall #114', 0, 1, 0, 0, 0, 0, 26, NULL, 0),
(3714, 0, -1, 0, 0, 'Khazad Dum #1', 0, 1, 0, 0, 0, 0, 191, NULL, 0),
(3715, 0, -1, 0, 0, 'Khazad Dum #2', 0, 1, 0, 0, 0, 0, 134, NULL, 0),
(3716, 0, -1, 0, 0, 'Khazad Dum #3', 0, 1, 0, 0, 0, 0, 183, NULL, 0),
(3717, 0, -1, 1732687431, 0, 'Khazad Dum #4', 0, 1, 0, 0, 0, 0, 17, NULL, 0),
(3718, 0, -1, 0, 0, 'Khazad Dum #5', 0, 1, 0, 0, 0, 0, 17, NULL, 0),
(3719, 0, -1, 0, 0, 'Khazad Dum #6', 0, 1, 0, 0, 0, 0, 12, NULL, 0),
(3720, 0, -1, 0, 0, 'Khazad Dum #7', 0, 1, 0, 0, 0, 0, 17, NULL, 0),
(3721, 0, -1, 0, 0, 'Khazad Dum #8', 0, 1, 0, 0, 0, 0, 17, NULL, 0),
(3722, 0, -1, 0, 0, 'Khazad Dum #9', 0, 1, 0, 0, 0, 0, 13, NULL, 0),
(3723, 0, -1, 0, 0, 'Khazad Dum #10', 0, 1, 0, 0, 0, 0, 21, NULL, 0),
(3724, 0, -1, 0, 0, 'Khazad Dum #11', 0, 1, 0, 0, 0, 0, 21, NULL, 0),
(3725, 0, -1, 0, 0, 'Khazad Dum #12', 0, 1, 0, 0, 0, 0, 21, NULL, 0),
(3726, 0, -1, 0, 0, 'Khazad Dum #13', 0, 1, 0, 0, 0, 0, 21, NULL, 0),
(3727, 0, -1, 0, 0, 'Khazad Dum #14', 0, 1, 0, 0, 0, 0, 22, NULL, 0),
(3728, 0, -1, 1732687431, 0, 'Khazad Dum #15', 0, 1, 0, 0, 0, 0, 49, NULL, 0),
(3729, 0, -1, 1732687431, 0, 'Khazad Dum #16', 0, 1, 0, 0, 0, 0, 51, NULL, 0),
(3730, 0, -1, 1732687431, 0, 'Khazad Dum #17', 0, 1, 0, 0, 0, 0, 57, NULL, 0),
(3731, 0, -1, 1732687431, 0, 'Khazad Dum #18', 0, 1, 0, 0, 0, 0, 51, NULL, 0),
(3732, 0, -1, 1732687431, 0, 'Khazad Dum #19', 0, 1, 0, 0, 0, 0, 17, NULL, 0),
(3733, 0, -1, 1732687431, 0, 'Khazad Dum #20', 0, 1, 0, 0, 0, 0, 17, NULL, 0),
(3734, 0, -1, 1732687431, 0, 'Khazad Dum #21', 0, 1, 0, 0, 0, 0, 13, NULL, 0),
(3735, 0, -1, 1732687431, 0, 'Khazad Dum #22', 0, 1, 0, 0, 0, 0, 19, NULL, 0),
(3736, 0, -1, 1732687431, 0, 'Khazad Dum #23', 0, 1, 0, 0, 0, 0, 17, NULL, 0),
(3737, 0, -1, 1732687431, 0, 'Khazad Dum #24', 0, 1, 0, 0, 0, 0, 13, NULL, 0),
(3738, 0, -1, 1732687431, 0, 'Khazad Dum #25', 0, 1, 0, 0, 0, 0, 21, NULL, 0),
(3739, 0, -1, 1732687431, 0, 'Khazad Dum #26', 0, 1, 0, 0, 0, 0, 21, NULL, 0),
(3740, 0, -1, 1732687431, 0, 'Khazad Dum #27', 0, 1, 0, 0, 0, 0, 21, NULL, 0),
(3741, 0, -1, 1732687431, 0, 'Khazad Dum #28', 0, 1, 0, 0, 0, 0, 21, NULL, 0),
(3742, 0, -1, 1732687431, 0, 'Khazad Dum #29', 0, 1, 0, 0, 0, 0, 38, NULL, 0),
(3743, 0, -1, 1732687431, 0, 'Khazad Dum #30', 0, 1, 0, 0, 0, 0, 38, NULL, 0),
(3744, 0, -1, 1732687431, 0, 'Khazad Dum #31', 0, 1, 0, 0, 0, 0, 36, NULL, 0),
(3745, 0, -1, 1732687431, 0, 'Khazad Dum #32', 0, 1, 0, 0, 0, 0, 36, NULL, 0),
(3746, 0, -1, 1732687431, 0, 'Khazad Dum #33', 0, 1, 0, 0, 0, 0, 36, NULL, 0),
(3747, 0, -1, 1732687431, 0, 'Khazad Dum #34', 0, 1, 0, 0, 0, 0, 38, NULL, 0),
(3748, 0, -1, 1732687431, 0, 'Khazad Dum #35', 0, 1, 0, 0, 0, 0, 38, NULL, 0),
(3749, 0, -1, 1732687431, 0, 'Khazad Dum #36', 0, 1, 0, 0, 0, 0, 42, NULL, 0),
(3750, 0, -1, 1732687431, 0, 'Khazad Dum #37', 0, 1, 0, 0, 0, 0, 42, NULL, 0),
(3751, 0, -1, 1732687431, 0, 'Khazad Dum #38', 0, 1, 0, 0, 0, 0, 30, NULL, 0),
(3752, 0, -1, 1732687431, 0, 'Khazad Dum #39', 0, 1, 0, 0, 0, 0, 30, NULL, 0),
(3753, 0, -1, 1732687431, 0, 'Khazad Dum #40', 0, 1, 0, 0, 0, 0, 25, NULL, 0);
INSERT INTO `houses` (`id`, `owner`, `new_owner`, `paid`, `warnings`, `name`, `rent`, `town_id`, `bid`, `bid_end`, `last_bid`, `highest_bidder`, `size`, `guildid`, `beds`) VALUES
(3754, 0, -1, 1732687431, 0, 'Khazad Dum #41', 0, 1, 0, 0, 0, 0, 31, NULL, 0),
(3755, 0, -1, 1732687431, 0, 'Khazad Dum #42', 0, 1, 0, 0, 0, 0, 25, NULL, 0),
(3756, 0, -1, 1732687431, 0, 'Khazad Dum #43', 0, 1, 0, 0, 0, 0, 37, NULL, 0),
(3757, 0, -1, 1732687431, 0, 'Khazad Dum #44', 0, 1, 0, 0, 0, 0, 93, NULL, 0),
(3758, 0, -1, 1732687431, 0, 'Khazad Dum #45', 0, 1, 0, 0, 0, 0, 7, NULL, 0),
(3759, 0, -1, 1732687431, 0, 'Khazad Dum #46', 0, 1, 0, 0, 0, 0, 13, NULL, 0),
(3760, 0, -1, 1732687431, 0, 'Khazad Dum #47', 0, 1, 0, 0, 0, 0, 13, NULL, 0),
(3761, 0, -1, 1732687431, 0, 'Khazad Dum #48', 0, 1, 0, 0, 0, 0, 13, NULL, 0),
(3762, 0, -1, 1732687431, 0, 'Khazad Dum #49', 0, 1, 0, 0, 0, 0, 13, NULL, 0),
(3763, 0, -1, 1732687431, 0, 'Khazad Dum #50', 0, 1, 0, 0, 0, 0, 7, NULL, 0),
(3764, 0, -1, 1732687431, 0, 'Khazad Dum #51', 0, 1, 0, 0, 0, 0, 103, NULL, 0),
(3765, 0, -1, 1732687431, 0, 'Drakonfall #115', 0, 1, 0, 0, 0, 0, 35, NULL, 0),
(3766, 0, -1, 1732687431, 0, 'Drakonfall #116', 0, 1, 0, 0, 0, 0, 18, NULL, 0),
(3767, 0, -1, 1732687431, 0, 'Drakonfall #117', 0, 1, 0, 0, 0, 0, 18, NULL, 0),
(3768, 0, -1, 1732687431, 0, 'Drakonfall #118', 0, 1, 0, 0, 0, 0, 17, NULL, 0),
(3769, 0, -1, 1732687431, 0, 'Drakonfall #119', 0, 1, 0, 0, 0, 0, 32, NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `house_lists`
--

CREATE TABLE `house_lists` (
  `house_id` int(11) NOT NULL,
  `listid` int(11) NOT NULL,
  `version` bigint(20) NOT NULL DEFAULT 0,
  `list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ip_bans`
--

CREATE TABLE `ip_bans` (
  `ip` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `kv_store`
--

CREATE TABLE `kv_store` (
  `key_name` varchar(191) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `value` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `kv_store`
--

INSERT INTO `kv_store` (`key_name`, `timestamp`, `value`) VALUES
('migrations.20231128213158_move_hireling_data_to_kv', 1724856320979, 0x3001),
('migrations.20241708000535_move_achievement_to_kv', 1724856321015, 0x3001),
('migrations.20241708362079_move_vip_system_to_kv', 1724856321036, 0x3001),
('migrations.20241708485868_move_some_storages_to_kv', 1724856321058, 0x3001),
('migrations.20241715984279_move_wheel_scrolls_from_storagename_to_kv', 1724856321083, 0x3001),
('migrations.20241715984294_quests_storages_to_kv', 1724856321107, 0x3001),
('player.14.account.vip-system', 1729809965216, 0x3001),
('player.14.achievements.Potion Addict-progress', 1730091390415, 0x19000000000000f03f),
('player.14.badges.unlocked.Global Player (Grade 1)', 1730092197814, 0x10a5b9fcb806),
('player.14.badges.unlocked.Global Player (Grade 2)', 1730092197814, 0x10a5b9fcb806),
('player.14.badges.unlocked.Global Player (Grade 3)', 1730092197814, 0x10a5b9fcb806),
('player.14.combat-protection', 1729218098949, 0x19000000000000f03f),
('player.14.daily-reward.streak', 1730086077343, 0x190000000000000000),
('player.14.summary.hirelings.amount', 1729218098915, 0x1000),
('player.14.titles.unlocked.Apex Predator', 1730092197815, 0x10a5b9fcb806),
('player.14.titles.unlocked.Cyclopscamper', 1730092197815, 0x10a5b9fcb806),
('player.14.titles.unlocked.Demondoom', 1730092197815, 0x10a5b9fcb806),
('player.14.titles.unlocked.Dragondouser', 1730092197815, 0x10a5b9fcb806),
('player.14.titles.unlocked.Drakenbane', 1730092197815, 0x10a5b9fcb806),
('player.14.titles.unlocked.Silencer', 1730092197815, 0x10a5b9fcb806),
('player.14.titles.unlocked.Trolltrasher', 1730092197815, 0x10a5b9fcb806),
('player.15.account.vip-system', 1729809976177, 0x3001),
('player.15.badges.unlocked.Fledegeling Hero', 1734725632960, 0x1080a097bb06),
('player.15.badges.unlocked.Global Player (Grade 1)', 1734725632960, 0x1080a097bb06),
('player.15.badges.unlocked.Global Player (Grade 2)', 1734725632960, 0x1080a097bb06),
('player.15.badges.unlocked.Global Player (Grade 3)', 1734725632960, 0x1080a097bb06),
('player.15.badges.unlocked.Senior Hero', 1734725632960, 0x1080a097bb06),
('player.15.badges.unlocked.Tibia Loyalist (Grade 1)', 1734725632960, 0x1080a097bb06),
('player.15.badges.unlocked.Tibia Loyalist (Grade 2)', 1734725632960, 0x1080a097bb06),
('player.15.badges.unlocked.Tibia Loyalist (Grade 3)', 1734725632960, 0x1080a097bb06),
('player.15.badges.unlocked.Veteran Hero', 1734725632960, 0x1080a097bb06),
('player.15.boss.cooldown.0', 1734580240807, 0x19000000542cd9d941),
('player.15.combat-protection', 1729810363194, 0x19000000000000f03f),
('player.15.daily-reward.streak', 1734725632972, 0x190000000000000000),
('player.15.summary.hirelings.amount', 1729218113842, 0x1000),
('player.15.titles.unlocked.Apex Predator', 1734725632962, 0x1080a097bb06),
('player.15.titles.unlocked.Cyclopscamper', 1734725632961, 0x1080a097bb06),
('player.15.titles.unlocked.Demondoom', 1734725632961, 0x1080a097bb06),
('player.15.titles.unlocked.Dragondouser', 1734725632961, 0x1080a097bb06),
('player.15.titles.unlocked.Drakenbane', 1734725632961, 0x1080a097bb06),
('player.15.titles.unlocked.Exalted', 1734725632961, 0x1080a097bb06),
('player.15.titles.unlocked.Legend of the Shield', 1734725632964, 0x1080a097bb06),
('player.15.titles.unlocked.Silencer', 1734725632961, 0x1080a097bb06),
('player.15.titles.unlocked.Trolltrasher', 1734725632961, 0x1080a097bb06),
('player.16.account.vip-system', 1729809954869, 0x3001),
('player.16.badges.unlocked.Global Player (Grade 1)', 1730109143503, 0x10d7bdfdb806),
('player.16.badges.unlocked.Global Player (Grade 2)', 1730109143503, 0x10d7bdfdb806),
('player.16.badges.unlocked.Global Player (Grade 3)', 1730109143503, 0x10d7bdfdb806),
('player.16.combat-protection', 1729809954870, 0x19000000000000f03f),
('player.16.daily-reward.streak', 1730085439267, 0x190000000000000000),
('player.16.summary.hirelings.amount', 1729809954860, 0x1000),
('player.17.account.vip-system', 1729810235536, 0x3001),
('player.17.badges.unlocked.Fledegeling Hero', 1734725630348, 0x10fe9f97bb06),
('player.17.badges.unlocked.Global Player (Grade 1)', 1734725630349, 0x10fe9f97bb06),
('player.17.badges.unlocked.Global Player (Grade 2)', 1734725630349, 0x10fe9f97bb06),
('player.17.badges.unlocked.Global Player (Grade 3)', 1734725630349, 0x10fe9f97bb06),
('player.17.badges.unlocked.Senior Hero', 1734725630348, 0x10fe9f97bb06),
('player.17.badges.unlocked.Tibia Loyalist (Grade 1)', 1734725630348, 0x10fe9f97bb06),
('player.17.badges.unlocked.Tibia Loyalist (Grade 2)', 1734725630348, 0x10fe9f97bb06),
('player.17.badges.unlocked.Tibia Loyalist (Grade 3)', 1734725630348, 0x10fe9f97bb06),
('player.17.badges.unlocked.Veteran Hero', 1734725630348, 0x10fe9f97bb06),
('player.17.boss.cooldown.0', 1734600866366, 0x190000807840d9d941),
('player.17.combat-protection', 1729810774263, 0x19000000000000f03f),
('player.17.daily-reward.streak', 1734725630362, 0x190000000000000000),
('player.17.summary.hirelings.amount', 1729810235522, 0x1000),
('player.17.titles.unlocked.Cyclopscamper', 1734725630350, 0x10fe9f97bb06),
('player.17.titles.unlocked.Demondoom', 1734725630350, 0x10fe9f97bb06),
('player.17.titles.unlocked.Dragondouser', 1734725630350, 0x10fe9f97bb06),
('player.17.titles.unlocked.Drakenbane', 1734725630350, 0x10fe9f97bb06),
('player.17.titles.unlocked.Exalted', 1734725630350, 0x10fe9f97bb06),
('player.17.titles.unlocked.Legend of Marksmanship', 1734725630351, 0x10fe9f97bb06),
('player.17.titles.unlocked.Silencer', 1734725630350, 0x10fe9f97bb06),
('player.17.titles.unlocked.Trolltrasher', 1734725630350, 0x10fe9f97bb06),
('player.19.combat-protection', 1733673664770, 0x19000000000000f03f),
('player.19.daily-reward.streak', 1733673664769, 0x190000000000000000),
('player.19.summary.hirelings.amount', 1733673664753, 0x1000),
('player.20.achievements.Snowbunny-progress', 1733728954713, 0x19000000000000f03f),
('player.20.badges.unlocked.Fledegeling Hero', 1733727939151, 0x10c3addaba06),
('player.20.badges.unlocked.Global Player (Grade 1)', 1733991751825, 0x10c7baeaba06),
('player.20.badges.unlocked.Global Player (Grade 2)', 1733991751825, 0x10c7baeaba06),
('player.20.badges.unlocked.Global Player (Grade 3)', 1733991751825, 0x10c7baeaba06),
('player.20.badges.unlocked.Senior Hero', 1733727939151, 0x10c3addaba06),
('player.20.badges.unlocked.Tibia Loyalist (Grade 1)', 1733727939151, 0x10c3addaba06),
('player.20.badges.unlocked.Tibia Loyalist (Grade 2)', 1733727939151, 0x10c3addaba06),
('player.20.badges.unlocked.Tibia Loyalist (Grade 3)', 1733727939151, 0x10c3addaba06),
('player.20.badges.unlocked.Veteran Hero', 1733727939151, 0x10c3addaba06),
('player.20.boss.cooldown.1336', 1733728291914, 0x190000c058ecd5d941),
('player.20.boss.cooldown.1754', 1733727834059, 0x19000080e6ebd5d941),
('player.20.combat-protection', 1733546926495, 0x19000000000000f03f),
('player.20.daily-reward.streak', 1733985039652, 0x190000000000000000),
('player.20.exhaustion.itemSellerExhaustion', 1733728603704, 0x1900000058a6d5d941),
('player.20.last-mount', 1733991751835, 0x1002),
('player.20.summary.hirelings.amount', 1733546926463, 0x1000),
('player.20.summary.xp-boosts.amount', 1733728094614, 0x1001),
('player.20.titles.unlocked.Apex Predator', 1733991751826, 0x10c7baeaba06),
('player.20.titles.unlocked.Big Boss', 1733991751827, 0x10c7baeaba06),
('player.20.titles.unlocked.Cyclopscamper', 1733991751826, 0x10c7baeaba06),
('player.20.titles.unlocked.Demondoom', 1733991751826, 0x10c7baeaba06),
('player.20.titles.unlocked.Dragondouser', 1733991751826, 0x10c7baeaba06),
('player.20.titles.unlocked.Drakenbane', 1733991751826, 0x10c7baeaba06),
('player.20.titles.unlocked.Exalted', 1733991751826, 0x10c7baeaba06),
('player.20.titles.unlocked.Legend of the Axe', 1733991751827, 0x10c7baeaba06),
('player.20.titles.unlocked.Silencer', 1733991751826, 0x10c7baeaba06),
('player.20.titles.unlocked.Trolltrasher', 1733991751826, 0x10c7baeaba06),
('player.6.badges.unlocked.Global Player (Grade 1)', 1728258232020, 0x10b8c18cb806),
('player.6.badges.unlocked.Global Player (Grade 2)', 1728258232031, 0x10b8c18cb806),
('player.6.badges.unlocked.Global Player (Grade 3)', 1728258232043, 0x10b8c18cb806),
('player.6.daily-reward.streak', 1728258232117, 0x190000000000000000),
('player.6.summary.hirelings.amount', 1728258232086, 0x1000),
('player.6.titles.unlocked.Admirer of the Crown', 1728258232085, 0x10b8c18cb806),
('player.6.titles.unlocked.Beaststrider (Grade 1)', 1728258232080, 0x10b8c18cb806),
('player.6.titles.unlocked.Beaststrider (Grade 2)', 1728258232080, 0x10b8c18cb806),
('player.6.titles.unlocked.Beaststrider (Grade 3)', 1728258232080, 0x10b8c18cb806),
('player.6.titles.unlocked.Beaststrider (Grade 4)', 1728258232080, 0x10b8c18cb806),
('player.6.titles.unlocked.Beaststrider (Grade 5)', 1728258232080, 0x10b8c18cb806),
('player.6.titles.unlocked.Big Spender', 1728258232085, 0x10b8c18cb806),
('player.6.titles.unlocked.Royal Bounacean Advisor', 1728258232085, 0x10b8c18cb806),
('player.7.account.vip-system', 1729661782678, 0x3001),
('player.7.achievements.points', 1733497701590, 0x1004),
('player.7.achievements.Ship\'s Kobold-progress', 1725814833523, 0x190000000000002a40),
('player.7.achievements.The Undertaker-progress', 1725736549464, 0x19000000000000f03f),
('player.7.achievements.unlocked.Beyonder', 1733497701590, 0x10e5a6ccba06),
('player.7.achievements.unlocked.Si, Ariki!', 1728598270988, 0x10fea1a1b806),
('player.7.badges.unlocked.Fledegeling Hero', 1735061209443, 0x10d9ddabbb06),
('player.7.badges.unlocked.Global Player (Grade 1)', 1735061209443, 0x10d9ddabbb06),
('player.7.badges.unlocked.Global Player (Grade 2)', 1735061209443, 0x10d9ddabbb06),
('player.7.badges.unlocked.Global Player (Grade 3)', 1735061209443, 0x10d9ddabbb06),
('player.7.badges.unlocked.Senior Hero', 1735061209443, 0x10d9ddabbb06),
('player.7.badges.unlocked.Tibia Loyalist (Grade 1)', 1735061209443, 0x10d9ddabbb06),
('player.7.badges.unlocked.Tibia Loyalist (Grade 2)', 1735061209443, 0x10d9ddabbb06),
('player.7.badges.unlocked.Tibia Loyalist (Grade 3)', 1735061209443, 0x10d9ddabbb06),
('player.7.badges.unlocked.Veteran Hero', 1735061209443, 0x10d9ddabbb06),
('player.7.boss.cooldown.0', 1734603865255, 0x190000406643d9d941),
('player.7.boss.cooldown.1336', 1733728926865, 0x19000080f7ecd5d941),
('player.7.boss.cooldown.1754', 1733728192467, 0x1900000040ecd5d941),
('player.7.boss.cooldown.1868', 1733497672681, 0x19000000220bd5d941),
('player.7.boss.cooldown.1872', 1733497685812, 0x19000040250bd5d941),
('player.7.boss.cooldown.1873', 1733497657064, 0x190000401e0bd5d941),
('player.7.boss.cooldown.1881', 1733497698298, 0x19000080280bd5d941),
('player.7.boss.cooldown.1890', 1733497776490, 0x190000003c0bd5d941),
('player.7.boss.cooldown.1891', 1733497785751, 0x190000403e0bd5d941),
('player.7.boss.cooldown.1892', 1733497749553, 0x19000040350bd5d941),
('player.7.boss.cooldown.231', 1734599571538, 0x190000000000000000),
('player.7.boss.cooldown.2364', 1725727744019, 0x190000005067b7d941),
('player.7.combat-protection', 1724895551380, 0x19000000000000f03f),
('player.7.daily-reward.streak', 1735045871038, 0x190000000000000000),
('player.7.exhaustion.itemSellerExhaustion', 1733547170404, 0x190000c029f5d4d941),
('player.7.features.autoloot', 1729835315811, 0x19000000000000f03f),
('player.7.npc-exhaustion', 1725814833521, 0x190000000d76b7d941),
('player.7.outfit_CONDITION_PARAM_EXP_BONUS', 1733552057854, 0x190000000000003540),
('player.7.rotten-blood-quest.access', 1725467375861, 0x190000000000001440),
('player.7.summary.hirelings.amount', 1724894605073, 0x1000),
('player.7.summary.house-items.34296.amount', 1729654652725, 0x1001),
('player.7.titles.unlocked.Admirer of the Crown', 1735061209446, 0x10d9ddabbb06),
('player.7.titles.unlocked.Beaststrider (Grade 1)', 1735061209444, 0x10d9ddabbb06),
('player.7.titles.unlocked.Beaststrider (Grade 2)', 1735061209444, 0x10d9ddabbb06),
('player.7.titles.unlocked.Beaststrider (Grade 3)', 1735061209444, 0x10d9ddabbb06),
('player.7.titles.unlocked.Beaststrider (Grade 4)', 1735061209444, 0x10d9ddabbb06),
('player.7.titles.unlocked.Beaststrider (Grade 5)', 1735061209444, 0x10d9ddabbb06),
('player.7.titles.unlocked.Big Spender', 1735061209446, 0x10d9ddabbb06),
('player.7.titles.unlocked.Crystal Hoarder', 1733496377772, 0x10b99cccba06),
('player.7.titles.unlocked.Cyclopscamper', 1735061209444, 0x10d9ddabbb06),
('player.7.titles.unlocked.Demondoom', 1735061209444, 0x10d9ddabbb06),
('player.7.titles.unlocked.Dragondouser', 1735061209444, 0x10d9ddabbb06),
('player.7.titles.unlocked.Drakenbane', 1735061209444, 0x10d9ddabbb06),
('player.7.titles.unlocked.Gold Hoarder', 1733986141996, 0x10dd8eeaba06),
('player.7.titles.unlocked.Platinum Hoarder', 1733496377772, 0x10b99cccba06),
('player.7.titles.unlocked.Royal Bounacean Advisor', 1735061209446, 0x10d9ddabbb06),
('player.7.titles.unlocked.Silencer', 1735061209444, 0x10d9ddabbb06),
('player.7.titles.unlocked.Trolltrasher', 1735061209444, 0x10d9ddabbb06),
('player.8.achievements.Potion Addict-progress', 1725823418855, 0x190000000000001840),
('player.8.achievements.Ship\'s Kobold-progress', 1725820544152, 0x19000000000000f03f),
('player.8.badges.unlocked.Global Player (Grade 1)', 1728258590762, 0x109ec48cb806),
('player.8.badges.unlocked.Global Player (Grade 2)', 1728258590774, 0x109ec48cb806),
('player.8.badges.unlocked.Global Player (Grade 3)', 1728258590787, 0x109ec48cb806),
('player.8.combat-protection', 1724949953207, 0x19000000000000f03f),
('player.8.daily-reward.streak', 1728257450313, 0x190000000000000000),
('player.8.npc-exhaustion', 1725820544150, 0x190000c0a07bb7d941),
('player.8.rotten-blood-quest.ichgahal.cooldown', 1725728325022, 0x19000040e167b7d941),
('player.8.rotten-blood-quest.taints', 1725728325022, 0x19000000000000f03f),
('player.8.summary.hirelings.amount', 1724947219100, 0x1000),
('player.8.titles.unlocked.Apex Predator', 1728258590823, 0x109ec48cb806),
('player.8.titles.unlocked.Big Boss', 1728258590824, 0x109ec48cb806),
('player.8.titles.unlocked.Cyclopscamper', 1728258590823, 0x109ec48cb806),
('player.8.titles.unlocked.Demondoom', 1728258590823, 0x109ec48cb806),
('player.8.titles.unlocked.Dragondouser', 1728258590823, 0x109ec48cb806),
('player.8.titles.unlocked.Drakenbane', 1728258590823, 0x109ec48cb806),
('player.8.titles.unlocked.Gold Hoarder', 1728258590823, 0x109ec48cb806),
('player.8.titles.unlocked.Legend of Magic', 1728258590824, 0x109ec48cb806),
('player.8.titles.unlocked.Legend of Marksmanship', 1728258590824, 0x109ec48cb806),
('player.8.titles.unlocked.Legend of the Shield', 1728258590825, 0x109ec48cb806),
('player.8.titles.unlocked.Legend of the Sword', 1728258590825, 0x109ec48cb806),
('player.8.titles.unlocked.Prince Charming', 1728258590825, 0x109ec48cb806),
('player.8.titles.unlocked.Silencer', 1728258590823, 0x109ec48cb806),
('player.8.titles.unlocked.Tibia\'s Topmodel (Grade 1)', 1725418407929, 0x10a797dfb606),
('player.8.titles.unlocked.Tibia\'s Topmodel (Grade 2)', 1725418407929, 0x10a797dfb606),
('player.8.titles.unlocked.Trolltrasher', 1728258590823, 0x109ec48cb806),
('quest.soul-war.ebb-and-flow-maps.is-active', 1735211104982, 0x3000),
('quest.soul-war.ebb-and-flow-maps.is-loaded-empty-map', 1735211104982, 0x3001),
('raids.ankrahmun.the-welter.checks-today', 1734897438709, 0x190000000080e7cf40),
('raids.ankrahmun.the-welter.failed-attempts', 1734897378700, 0x190000000000f1c840),
('raids.ankrahmun.the-welter.last-occurrence', 1728257496236, 0x1900000076c7c0d941),
('raids.ankrahmun.the-welter.trigger-when-possible', 1735211164969, 0x3001),
('raids.darashia.tyrn.checks-today', 1734642853582, 0x190000000080e3c140),
('raids.darashia.tyrn.failed-attempts', 1734642793594, 0x190000000000a6a240),
('raids.darashia.tyrn.last-occurrence', 1733985082597, 0x19000080cea0d6d941),
('raids.darashia.tyrn.trigger-when-possible', 1735211164969, 0x3001),
('raids.drefia.arachir.checks-today', 1729730332587, 0x19000000000056b640),
('raids.drefia.arachir.failed-attempts', 1729730272581, 0x190000000000449540),
('raids.drefia.arachir.last-occurrence', 1728257496223, 0x1900000076c7c0d941),
('raids.drefia.arachir.trigger-when-possible', 1735211164969, 0x3001),
('raids.drefia.the-pale-count.checks-today', 1733507305360, 0x190000000000a8bf40),
('raids.drefia.the-pale-count.failed-attempts', 1733507245366, 0x19000000000034b040),
('raids.drefia.the-pale-count.last-occurrence', 1728257496223, 0x1900000076c7c0d941),
('raids.drefia.the-pale-count.trigger-when-possible', 1735211164969, 0x3001),
('raids.edron.valorcrest.checks-today', 1729710652584, 0x19000000000014b240),
('raids.edron.valorcrest.failed-attempts', 1729710592579, 0x190000000000249040),
('raids.edron.valorcrest.last-occurrence', 1728257496236, 0x1900000076c7c0d941),
('raids.edron.valorcrest.trigger-when-possible', 1735211164969, 0x3001),
('raids.edron.weakened-shlorg.checks-today', 1730085462075, 0x1900000000004dc040),
('raids.edron.weakened-shlorg.failed-attempts', 1730085402070, 0x190000000000b0ab40),
('raids.edron.weakened-shlorg.last-occurrence', 1728257496225, 0x1900000076c7c0d941),
('raids.edron.weakened-shlorg.trigger-when-possible', 1735211164969, 0x3001),
('raids.edron.white-pale.checks-today', 1733728754508, 0x19000000008062c040),
('raids.edron.white-pale.failed-attempts', 1733728694518, 0x190000000000a4b340),
('raids.edron.white-pale.last-occurrence', 1728257496225, 0x1900000076c7c0d941),
('raids.edron.white-pale.trigger-when-possible', 1735211164969, 0x3001),
('raids.farmine.draptor.checks-today', 1734952147005, 0x190000000080f7c840),
('raids.farmine.draptor.failed-attempts', 1734952087000, 0x19000000000056ad40),
('raids.farmine.draptor.last-occurrence', 1734604033589, 0x1900004040fdd8d941),
('raids.farmine.draptor.trigger-when-possible', 1735211164969, 0x3001),
('raids.folda.yeti.checks-today', 1735211164969, 0x19000000008076d240),
('raids.folda.yeti.failed-attempts', 1735211164969, 0x190000000000eabd40),
('raids.folda.yeti.last-occurrence', 1734551812017, 0x1900000041cad8d941),
('raids.folda.yeti.trigger-when-possible', 1734551812017, 0x3000),
('raids.fury-gates.furiosa.checks-today', 1729704652577, 0x1900000000005bb240),
('raids.fury-gates.furiosa.failed-attempts', 1729704592588, 0x190000000000288d40),
('raids.fury-gates.furiosa.last-occurrence', 1728257496225, 0x1900000076c7c0d941),
('raids.fury-gates.furiosa.trigger-when-possible', 1735211164969, 0x3001),
('raids.muggy_plains.battlemaster_zunzu.checks-today', 1729987675032, 0x190000000000f8ae40),
('raids.muggy_plains.battlemaster_zunzu.failed-attempts', 1729987615032, 0x19000000000082a040),
('raids.muggy_plains.battlemaster_zunzu.last-occurrence', 1728257496224, 0x1900000076c7c0d941),
('raids.muggy_plains.battlemaster_zunzu.trigger-when-possible', 1735211164969, 0x3001),
('raids.nargor.diblis.checks-today', 1728606621973, 0x190000000000f6a740),
('raids.nargor.diblis.failed-attempts', 1728606561978, 0x190000000000804240),
('raids.nargor.diblis.last-occurrence', 1728257496225, 0x1900000076c7c0d941),
('raids.nargor.diblis.trigger-when-possible', 1735211164969, 0x3001),
('raids.roshamuul.mawhawk.checks-today', 1734766985696, 0x190000000080c5cb40),
('raids.roshamuul.mawhawk.failed-attempts', 1734766925683, 0x190000000000e5c440),
('raids.roshamuul.mawhawk.last-occurrence', 1728257496236, 0x1900000076c7c0d941),
('raids.roshamuul.mawhawk.trigger-when-possible', 1735211164969, 0x3001),
('raids.svargrond.hirintror.checks-today', 1730007774813, 0x19000000000041b540),
('raids.svargrond.hirintror.failed-attempts', 1730007714816, 0x19000000000016a240),
('raids.svargrond.hirintror.last-occurrence', 1728257496235, 0x1900000076c7c0d941),
('raids.svargrond.hirintror.trigger-when-possible', 1735211164969, 0x3001),
('raids.thais.rats.checks-today', 1735132866011, 0x1900000000003c9540),
('raids.thais.rats.failed-attempts', 1735132866011, 0x190000000000000000),
('raids.thais.rats.last-occurrence', 1735132866011, 0x19000080b001dbd941),
('raids.thais.rats.trigger-when-possible', 1735132866011, 0x3000),
('raids.thais.wild-horses.checks-today', 1725419225495, 0x190000000000000040),
('raids.thais.wild-horses.failed-attempts', 1725419225495, 0x190000000000000000),
('raids.thais.wild-horses.last-occurrence', 1725419225495, 0x19000040b6f3b5d941),
('raids.thais.wild-horses.trigger-when-possible', 1725419225495, 0x3000),
('raids.tiquanda.midnight-panther.checks-today', 1725601086692, 0x1900000000009ca340),
('raids.tiquanda.midnight-panther.failed-attempts', 1725601026692, 0x1900000000009aa340),
('raids.tiquanda.midnight-panther.trigger-when-possible', 1735211164969, 0x3001),
('raids.venore.the-old-widow.checks-today', 1735211164969, 0x19000000004094d440),
('raids.venore.the-old-widow.failed-attempts', 1735211164969, 0x19000000000051d140),
('raids.venore.the-old-widow.last-occurrence', 1728257496223, 0x1900000076c7c0d941),
('raids.venore.the-old-widow.trigger-when-possible', 1728257496223, 0x3000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `market_history`
--

CREATE TABLE `market_history` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `price` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `expires_at` bigint(20) UNSIGNED NOT NULL,
  `inserted` bigint(20) UNSIGNED NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL,
  `tier` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `market_offers`
--

CREATE TABLE `market_offers` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `created` bigint(20) UNSIGNED NOT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT 0,
  `price` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `tier` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_account_actions`
--

CREATE TABLE `myaac_account_actions` (
  `account_id` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL DEFAULT '0.0.0.0',
  `ipv6` binary(16) NOT NULL DEFAULT '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `date` int(11) NOT NULL DEFAULT 0,
  `action` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `myaac_account_actions`
--

INSERT INTO `myaac_account_actions` (`account_id`, `ip`, `ipv6`, `date`, `action`) VALUES
(2, '0', 0x00000000000000000000000000000001, 1724856389, 'Account created.'),
(2, '0', 0x00000000000000000000000000000001, 1724947162, 'Created character <b>Teste</b>.'),
(2, '769699717', 0x00000000000000000000000000000000, 1728256545, 'Generated recovery key and Updated your Real Name to <b>andre</b>, Location to <b>rua a</b>, Phone to <b>11981049632</b> and Country to <b>Brazil</b>.'),
(2, '769699717', 0x00000000000000000000000000000000, 1729218066, 'Created character <b>Andre</b>.'),
(2, '769699717', 0x00000000000000000000000000000000, 1729218076, 'Created character <b>Melado</b>.'),
(2, '769699717', 0x00000000000000000000000000000000, 1729218088, 'Created character <b>Ukimia</b>.'),
(2, '0', 0x00000000000000000000000000000001, 1729810229, 'Created character <b>Medrosa</b>.'),
(3, '3135402601', 0x00000000000000000000000000000000, 1729974924, 'Account created.'),
(3, '3135402601', 0x00000000000000000000000000000000, 1729974924, 'Created character <b>Deividi Marcos Budke</b>.'),
(3, '3135402601', 0x00000000000000000000000000000000, 1729975013, 'Created character <b>Deivi</b>.'),
(2, '2130706433', 0x00000000000000000000000000000000, 1733546906, 'Created character <b>Ukimianomuro</b>.'),
(2, '2130706433', 0x00000000000000000000000000000000, 1734717377, 'Account password changed.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_admin_menu`
--

CREATE TABLE `myaac_admin_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `page` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `flags` int(11) NOT NULL DEFAULT 0,
  `enabled` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `myaac_admin_menu`
--

INSERT INTO `myaac_admin_menu` (`id`, `name`, `page`, `ordering`, `flags`, `enabled`) VALUES
(1, 'Gifts', 'gifts', 0, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_bugtracker`
--

CREATE TABLE `myaac_bugtracker` (
  `account` varchar(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `text` text NOT NULL,
  `id` int(11) NOT NULL DEFAULT 0,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `reply` int(11) NOT NULL DEFAULT 0,
  `who` int(11) NOT NULL DEFAULT 0,
  `uid` int(11) NOT NULL,
  `tag` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_changelog`
--

CREATE TABLE `myaac_changelog` (
  `id` int(11) NOT NULL,
  `body` varchar(500) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 - added, 2 - removed, 3 - changed, 4 - fixed',
  `where` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 - server, 2 - site',
  `date` int(11) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `myaac_changelog`
--

INSERT INTO `myaac_changelog` (`id`, `body`, `type`, `where`, `date`, `player_id`, `hidden`) VALUES
(1, 'MyAAC installed. (:', 3, 2, 1724856367, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_charbazaar`
--

CREATE TABLE `myaac_charbazaar` (
  `id` int(11) NOT NULL,
  `account_old` int(11) NOT NULL,
  `account_new` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `date_end` datetime NOT NULL,
  `date_start` datetime NOT NULL,
  `bid_account` int(11) NOT NULL,
  `bid_price` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `myaac_charbazaar`
--

INSERT INTO `myaac_charbazaar` (`id`, `account_old`, `account_new`, `player_id`, `price`, `date_end`, `date_start`, `bid_account`, `bid_price`, `status`) VALUES
(1, 2, 1, 8, 500, '2024-10-11 20:17:17', '2024-10-06 20:17:17', 0, 0, 0),
(2, 2, 1, 14, 50, '2024-10-29 01:29:39', '2024-10-29 01:29:39', 0, 0, 0),
(3, 2, 1, 16, 50, '2024-11-08 01:29:54', '2024-10-29 01:29:54', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_charbazaar_bid`
--

CREATE TABLE `myaac_charbazaar_bid` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `auction_id` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_config`
--

CREATE TABLE `myaac_config` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `value` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `myaac_config`
--

INSERT INTO `myaac_config` (`id`, `name`, `value`) VALUES
(1, 'database_version', '35'),
(2, 'status_online', '1'),
(3, 'status_players', '0'),
(4, 'status_playersMax', '0'),
(5, 'status_lastCheck', '1735412528'),
(6, 'status_uptime', '35868'),
(7, 'status_monsters', '86465'),
(8, 'status_uptimeReadable', 'month, day, 06h 57m'),
(9, 'status_motd', 'Welcome to Underfox! Esse Ã© um servidor de teste para mim e amigos, seja bem vindo, caso se sinta sozinho, acesso o discorde para falar com a gente.'),
(10, 'status_mapAuthor', 'OpenTibiaBR'),
(11, 'status_mapName', 'otservbr'),
(12, 'status_mapWidth', '35143'),
(13, 'status_mapHeight', '34812'),
(14, 'status_server', 'Canary'),
(15, 'status_serverVersion', '3.0'),
(16, 'status_clientVersion', '13.40'),
(17, 'views_counter', '9604'),
(18, 'site_closed', '0'),
(19, 'site_closed_message', 'Server is under maintenance, please visit later.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_faq`
--

CREATE TABLE `myaac_faq` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` varchar(1020) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_forum`
--

CREATE TABLE `myaac_forum` (
  `id` int(11) NOT NULL,
  `first_post` int(11) NOT NULL DEFAULT 0,
  `last_post` int(11) NOT NULL DEFAULT 0,
  `section` int(3) NOT NULL DEFAULT 0,
  `replies` int(20) NOT NULL DEFAULT 0,
  `views` int(20) NOT NULL DEFAULT 0,
  `author_aid` int(20) NOT NULL DEFAULT 0,
  `author_guid` int(20) NOT NULL DEFAULT 0,
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL DEFAULT '',
  `post_smile` tinyint(1) NOT NULL DEFAULT 0,
  `post_html` tinyint(1) NOT NULL DEFAULT 0,
  `post_date` int(20) NOT NULL DEFAULT 0,
  `last_edit_aid` int(20) NOT NULL DEFAULT 0,
  `edit_date` int(20) NOT NULL DEFAULT 0,
  `post_ip` varchar(32) NOT NULL DEFAULT '0.0.0.0',
  `sticked` tinyint(1) NOT NULL DEFAULT 0,
  `closed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `myaac_forum`
--

INSERT INTO `myaac_forum` (`id`, `first_post`, `last_post`, `section`, `replies`, `views`, `author_aid`, `author_guid`, `post_text`, `post_topic`, `post_smile`, `post_html`, `post_date`, `last_edit_aid`, `edit_date`, `post_ip`, `sticked`, `closed`) VALUES
(1, 1, 1733545466, 1, 0, 0, 2, 7, '<h1 style=\"text-align: center;\"><strong>Novos Locais</strong></h1>\r\n<p style=\"text-align: center;\"><strong>Iksupan</strong>&nbsp;- Expans&atilde;o de Iksupan e implementa&ccedil;&atilde;o dos novos mobs Mitmah Scout, Mitmah Seer, Iks Yapunac, e Mystic Jaguar. Al&eacute;m disso, foram adicionados o mini boss Atab e o boss Mitmah Vanguard.</p>\r\n<p style=\"text-align: center;\"><img src=\"https://www.tibiawiki.com.br/images/e/e8/Iks_Yapunac.gif\" alt=\"\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/c/ce/Mitmah_Scout.gif\" alt=\"\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/d/d3/Mitmah_Seer.gif\" alt=\"\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/0/00/Atab.gif\" alt=\"\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/9/9b/Mitmah_Vanguard.gif\" alt=\"\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/4/46/Mystic_Jaguar.gif\" alt=\"\" width=\"64\" height=\"64\" /></p>\r\n<p style=\"text-align: center;\"><img src=\"https://static.tibia.com/images/news/line1px.png\" alt=\"\" width=\"550\" height=\"1\" /></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\"><strong>Bulltaur Lair (Venore)</strong>&nbsp;</p>\r\n<p style=\"text-align: center;\">&Aacute;rea acessada atrav&eacute;s de uma lata de lixo abaixo de um cemit&eacute;rio em Plains of Havoc, perto da entrada do atalho para Pits of Inferno, tamb&eacute;m pr&oacute;ximo ao nosso boss custom Dark GOD. Neste local, voc&ecirc; encontrar&aacute; os novos mobs: Bulltaur Brute, Bulltaur Alchemist e Bulltaur Forgepriest.</p>\r\n<p style=\"text-align: center;\"><img src=\"https://www.tibiawiki.com.br/images/6/62/Bulltaur_Alchemist.gif\" alt=\"\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/c/c9/Bulltaur_Brute.gif\" alt=\"\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/4/48/Bulltaur_Forgepriest.gif\" alt=\"\" width=\"64\" height=\"64\" /></p>\r\n<p style=\"text-align: center;\"><img src=\"https://static.tibia.com/images/news/line1px.png\" alt=\"\" width=\"550\" height=\"1\" /></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\"><strong>Nimmersatt\'s Breeding Ground</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;&Aacute;rea acessada atrav&eacute;s de uma lata de lixo localizada em Temple of Equilibrium. Neste local, voc&ecirc; encontrar&aacute; os novos mobs: Dragolisk, Mega Dragon e Wardragon. Tamb&eacute;m poder&aacute; enfretar os bosses de (The Dragon Hoard).</p>\r\n<p style=\"text-align: center;\"><img src=\"https://www.tibiawiki.com.br/images/c/c1/Dragon_Hoard.gif\" alt=\"\" width=\"40\" height=\"40\" /><img src=\"https://www.tibiawiki.com.br/images/d/d7/Dragolisk.gif\" alt=\"\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/1/14/Mega_Dragon.gif\" alt=\"\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/7/70/Wardragon.gif\" alt=\"\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/c/c1/Dragon_Hoard.gif\" alt=\"\" width=\"40\" height=\"40\" /></p>\r\n<p style=\"text-align: center;\"><img src=\"https://static.tibia.com/images/news/line1px.png\" alt=\"\" width=\"550\" height=\"1\" /></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\"><strong>Montarias/Outfits</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;<img src=\"https://www.tibiawiki.com.br/images/f/f8/Mystic_Jaguar_%28Mount%29.gif\" alt=\"\" width=\"64\" height=\"64\" />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img src=\"https://www.tibiawiki.com.br/images/8/81/Outfit_Draccoon_Herald_Male_Addon_3.gif\" alt=\"\" width=\"64\" height=\"64\" /><br />&nbsp; &nbsp; &nbsp; &nbsp;Mystic Jaguar Mout&nbsp; &nbsp; &nbsp; &nbsp; Draccoon Herald Outfit</p>', 'Novos Locais', 0, 1, 1733545466, 0, 0, '127.0.0.1', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_forum_boards`
--

CREATE TABLE `myaac_forum_boards` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `guild` int(11) NOT NULL DEFAULT 0,
  `access` int(11) NOT NULL DEFAULT 0,
  `closed` tinyint(1) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `myaac_forum_boards`
--

INSERT INTO `myaac_forum_boards` (`id`, `name`, `description`, `ordering`, `guild`, `access`, `closed`, `hidden`) VALUES
(1, 'News', 'News commenting', 0, 0, 0, 1, 0),
(2, 'Trade', 'Trade offers.', 1, 0, 0, 0, 0),
(3, 'Quests', 'Quest making.', 2, 0, 0, 0, 0),
(4, 'Pictures', 'Your pictures.', 3, 0, 0, 0, 0),
(5, 'Bug Report', 'Report bugs there.', 4, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_gallery`
--

CREATE TABLE `myaac_gallery` (
  `id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `myaac_gallery`
--

INSERT INTO `myaac_gallery` (`id`, `comment`, `image`, `thumb`, `author`, `ordering`, `hidden`) VALUES
(1, 'Demon', 'images/gallery/demon.jpg', 'images/gallery/demon_thumb.gif', 'MyAAC', 1, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_menu`
--

CREATE TABLE `myaac_menu` (
  `id` int(11) NOT NULL,
  `template` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `blank` tinyint(1) NOT NULL DEFAULT 0,
  `color` varchar(6) NOT NULL DEFAULT '',
  `category` int(11) NOT NULL DEFAULT 1,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `enabled` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `myaac_menu`
--

INSERT INTO `myaac_menu` (`id`, `template`, `name`, `link`, `blank`, `color`, `category`, `ordering`, `enabled`) VALUES
(801, 'tibiacom', 'Latest News', 'news', 0, '', 1, 0, 1),
(802, 'tibiacom', 'News Archive', 'news/archive', 0, '', 1, 1, 1),
(803, 'tibiacom', 'Event Schedule', 'eventcalendar', 0, '', 1, 2, 1),
(804, 'tibiacom', 'Vip System <img src=\"./images/new.gif\">', 'vip', 0, 'ffff00', 1, 3, 1),
(805, 'tibiacom', 'Account Management', 'account/manage', 0, '', 2, 0, 1),
(806, 'tibiacom', 'Create Account', 'account/create', 0, '', 2, 1, 1),
(807, 'tibiacom', 'Lost Account?', 'account/lost', 0, '', 2, 2, 1),
(808, 'tibiacom', 'Server Rules', 'rules', 0, '', 2, 3, 1),
(809, 'tibiacom', 'Downloads', 'downloadclient', 0, '', 2, 4, 1),
(810, 'tibiacom', 'Report Bug', 'bugtracker', 0, '', 2, 5, 1),
(811, 'tibiacom', 'Characters', 'characters', 0, '', 3, 0, 1),
(812, 'tibiacom', 'Who Is Online?', 'online', 0, '', 3, 1, 1),
(813, 'tibiacom', 'Highscores', 'highscores', 0, '', 3, 2, 1),
(814, 'tibiacom', 'Last Kills', 'lastkills', 0, '', 3, 3, 1),
(815, 'tibiacom', 'Houses', 'houses', 0, '', 3, 4, 1),
(816, 'tibiacom', 'Guilds', 'guilds', 0, '', 3, 5, 1),
(817, 'tibiacom', 'Polls', 'polls', 0, '', 3, 6, 1),
(818, 'tibiacom', 'Bans', 'bans', 0, '', 3, 7, 1),
(819, 'tibiacom', 'Support List', 'team', 0, '', 3, 8, 1),
(820, 'tibiacom', 'Forum', 'forum', 0, '', 4, 0, 1),
(821, 'tibiacom', 'Creatures', 'creatures', 0, '', 5, 0, 1),
(822, 'tibiacom', 'Spells', 'spells', 0, '', 5, 1, 1),
(823, 'tibiacom', 'Commands', 'commands', 0, '', 5, 2, 1),
(824, 'tibiacom', 'Gallery', 'gallery', 0, '', 5, 3, 1),
(825, 'tibiacom', 'Server Info', 'serverInfo', 0, '', 5, 4, 1),
(826, 'tibiacom', 'Experience Table', 'experienceTable', 0, '', 5, 5, 1),
(827, 'tibiacom', 'Roulette System <img src=\"./images/new.gif\">', 'roulettesystem', 0, 'ffff00', 5, 6, 1),
(828, 'tibiacom', 'Current Auctions', 'currentcharactertrades', 0, '', 7, 0, 1),
(829, 'tibiacom', 'Auction History', 'pastcharactertrades', 0, '', 7, 1, 1),
(830, 'tibiacom', 'My Bids', 'ownbids', 0, '', 7, 2, 1),
(831, 'tibiacom', 'My Auctions', 'owncharactertrades', 0, '', 7, 3, 1),
(832, 'tibiacom', 'Create Auction', 'createcharacterauction', 0, '', 7, 4, 1),
(833, 'tibiacom', 'Donate  <img src=\"./images/hot.gif\">', 'points', 0, 'ff0000', 6, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_monsters`
--

CREATE TABLE `myaac_monsters` (
  `id` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `mana` int(11) NOT NULL DEFAULT 0,
  `exp` int(11) NOT NULL,
  `health` int(11) NOT NULL,
  `speed_lvl` int(11) NOT NULL DEFAULT 1,
  `use_haste` tinyint(1) NOT NULL,
  `voices` text NOT NULL,
  `immunities` varchar(255) NOT NULL,
  `elements` text NOT NULL,
  `summonable` tinyint(1) NOT NULL,
  `convinceable` tinyint(1) NOT NULL,
  `pushable` tinyint(1) NOT NULL DEFAULT 0,
  `canpushitems` tinyint(1) NOT NULL DEFAULT 0,
  `canwalkonenergy` tinyint(1) NOT NULL DEFAULT 0,
  `canwalkonpoison` tinyint(1) NOT NULL DEFAULT 0,
  `canwalkonfire` tinyint(1) NOT NULL DEFAULT 0,
  `runonhealth` tinyint(1) NOT NULL DEFAULT 0,
  `hostile` tinyint(1) NOT NULL DEFAULT 0,
  `attackable` tinyint(1) NOT NULL DEFAULT 0,
  `rewardboss` tinyint(1) NOT NULL DEFAULT 0,
  `defense` int(11) NOT NULL DEFAULT 0,
  `armor` int(11) NOT NULL DEFAULT 0,
  `canpushcreatures` tinyint(1) NOT NULL DEFAULT 0,
  `race` varchar(255) NOT NULL,
  `loot` text NOT NULL,
  `summons` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_news`
--

CREATE TABLE `myaac_news` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `body` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 - news, 2 - ticker, 3 - article',
  `date` int(11) NOT NULL DEFAULT 0,
  `category` tinyint(1) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_date` int(11) NOT NULL DEFAULT 0,
  `comments` varchar(50) NOT NULL DEFAULT '',
  `article_text` varchar(300) NOT NULL DEFAULT '',
  `article_image` varchar(100) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `myaac_news`
--

INSERT INTO `myaac_news` (`id`, `title`, `body`, `type`, `date`, `category`, `player_id`, `last_modified_by`, `last_modified_date`, `comments`, `article_text`, `article_image`, `hidden`) VALUES
(1, 'Wheel of Destiny', '<fieldset><legend><img src=\"https://i.ibb.co/xqZFdwR/Lit-Rainbow-Torch.gif\" width=\"32\" height=\"32\" />Wheel of Destiny <img src=\"https://i.ibb.co/xqZFdwR/Lit-Rainbow-Torch.gif\" width=\"32\" height=\"32\" /> </legend>\r\n<p>Configurar a roda de habilidades da forma correta &eacute; muito &uacute;til para facilitar nas batalhas contra monstros e jogadores.</p>\r\n<p><strong>Knights</strong>: Como um knight, voc&ecirc; &eacute; o tanque do grupo, ent&atilde;o construa suas habilidades de forma a resistir a ataques enquanto causa dano significativo.</p>\r\n<p><strong>Paladins</strong>: Os paladins s&atilde;o conhecidos por sua precis&atilde;o e habilidades de longo alcance. Foque em suas habilidades leech e distance fighting para aumentar sua capacidade de acertar com precis&atilde;o seus ataques a dist&acirc;ncia.</p>\r\n<p><strong>Sorcerers</strong>: Como um sorcerer, seu poder est&aacute; na magia. Invista em habilidades para aumentar o dano e a efici&ecirc;ncia de seus feiti&ccedil;os.</p>\r\n<p><strong>Druids</strong>: Druids tamb&eacute;m se destacam no uso de magia, mas s&atilde;o mais voltados para cura e suporte ao grupo. Aumente suas habilidades de Magic Level para fortalecer suas curas e habilidades ofensivas.</p>\r\n<br />\r\n<table style=\"width: 780px; text-align: center;\">\r\n<tbody>\r\n<tr>\r\n<td><img src=\"https://i.ibb.co/ggQYGdp/Winter-Update-2022-Teaser-4-01.png\" alt=\"Winter-Update-2022-Teaser-4-01\" width=\"139\" height=\"139\" /><br /><img src=\"https://i.ibb.co/4g5DHhJ/Druid-Avatar-of-Nature.gif\" alt=\"Druid-Avatar-of-Nature\" /><br />Druids</td>\r\n<td><img src=\"https://i.ibb.co/ggYCcLv/225px-Winter-Update-2022-Teaser-4-03.png\" alt=\"225px-Winter-Update-2022-Teaser-4-03\" width=\"139\" height=\"139\" /><br /><img src=\"https://i.ibb.co/6JyjKR6/Paladin-Avatar-of-Light.gif\" alt=\"Paladin-Avatar-of-Light\" /><br />Paladins</td>\r\n<td><img src=\"https://i.ibb.co/ggYCcLv/225px-Winter-Update-2022-Teaser-4-03.png\" alt=\"225px-Winter-Update-2022-Teaser-4-03\" width=\"139\" height=\"139\" /><br /><img src=\"https://i.ibb.co/h9SDqVy/Knight-Avatar-of-Steel.gif\" alt=\"Knight-Avatar-of-Steel\" /><br />Knights</td>\r\n<td><img src=\"https://i.ibb.co/g99sJdX/Winter-Update-2022-Teaser-4-04.png\" alt=\"Winter-Update-2022-Teaser-4-04\" width=\"139\" height=\"139\" /><br /><img src=\"https://i.ibb.co/YjdmQv2/Sorcerer-Avatar-of-Storm.gif\" alt=\"Sorcerer-Avatar-of-Storm\" /><br />Sorcerers</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<br />\r\n<p>Al&eacute;m dessas sugest&otilde;es b&aacute;sicas, &eacute; importante lembrar que voc&ecirc; pode adaptar suas habilidades de acordo com sua prefer&ecirc;ncia e estilo de jogo. Experimente diferentes combina&ccedil;&otilde;es e encontre a que melhor se adequa ao seu personagem e estrat&eacute;gia individual. Boa sorte em sua jornada</p>\r\n</fieldset>\r\n<p>&nbsp;</p>\r\n<fieldset><legend><img src=\"https://www.tibiawiki.com.br/images/5/57/Basalt_Obelisk.gif\" alt=\"Basalt Obelisk.gif\" />&nbsp; Summer Update 2023&nbsp;<img src=\"https://www.tibiawiki.com.br/images/5/57/Basalt_Obelisk.gif\" alt=\"Basalt Obelisk.gif\" /> </legend>\r\n<p>Al&eacute;m disso, o Summer Update de 2023 traz recursos inovadores para aprimorar sua jornada<br />em nosso servidor.<br />Desafios &uacute;nicos, miss&otilde;es emocionantes e recompensas valiosas aguardam por voc&ecirc;.</p>\r\n<p>Reunimos uma equipe dedicada para garantir que o Summer Update de 2023 seja completo<br />e repleto de conte&uacute;do de primeira qualidade.<br />Nossos desenvolvedores trabalharam arduamente para criar uma experi&ecirc;ncia envolvente,<br />cheia de detalhes impressionantes e aprimoramentos t&eacute;cnicos surpreendentes.</p>\r\n<p>Convidamos voc&ecirc; a se juntar a n&oacute;s nessa jornada e descobrir tudo o que o Summer Update de 2023<br />tem a oferecer. Sinta a adrenalina enquanto se aventura por paisagens exuberantes,<br />desvenda segredos antigos e enfrenta desafios &eacute;picos. N&atilde;o perca mais tempo,<br />junte-se a n&oacute;s e seja parte dessa experi&ecirc;ncia inesquec&iacute;vel!</p>\r\n<p>Lembre-se de visitar nosso site oficial e canais de comunica&ccedil;&atilde;o para obter mais informa&ccedil;&otilde;es<br />e ficar por dentro das &uacute;ltimas atualiza&ccedil;&otilde;es. Preparado para a melhor temporada de aventuras at&eacute; agora?<br />O Summer Update de 2023 aguarda por voc&ecirc;!</p>\r\n</fieldset>\r\n<table border=\"0\" width=\"799\">\r\n<tbody>\r\n<tr>\r\n<td><center>\r\n<table cellspacing=\"2\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td><img src=\"https://www.tibiawiki.com.br/images/7/79/Sanguine_Blade.gif\" alt=\"Sanguine Blade.gif\" /></td>\r\n<td><img src=\"https://www.tibiawiki.com.br/images/f/fb/Sanguine_Razor.gif\" alt=\"Sanguine Razor.gif\" /></td>\r\n<td><img title=\"Sanguine Cudgel: Death + Physical\" src=\"https://www.tibiawiki.com.br/images/c/c4/Sanguine_Cudgel.gif\" width=\"32\" height=\"32\" hspace=\"10\" vspace=\"4\" /></td>\r\n<td><img title=\"Sanguine Bow: Earth Protection \" src=\"https://www.tibiawiki.com.br/images/f/fd/Sanguine_Bow.gif\" width=\"32\" height=\"32\" hspace=\"10\" vspace=\"4\" /></td>\r\n<td><img title=\"Sanguine Coil: Earth Protection\" src=\"https://www.tibiawiki.com.br/images/7/7a/Sanguine_Coil.gif\" width=\"32\" height=\"32\" hspace=\"10\" vspace=\"4\" /></td>\r\n<td><img title=\"Sanguine Legs: Physical + Death Protection\" src=\"https://www.tibiawiki.com.br/images/4/43/Sanguine_Legs.gif\" width=\"32\" height=\"32\" hspace=\"10\" vspace=\"4\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img title=\"Grand Sanguine Blade: Fire + Physical\" src=\"https://www.tibiawiki.com.br/images/b/b7/Grand_Sanguine_Blade.gif\" width=\"32\" height=\"32\" hspace=\"10\" vspace=\"4\" /></td>\r\n<td><img title=\"Grand Sanguine Razor: Energy + Physical\" src=\"https://www.tibiawiki.com.br/images/b/b5/Grand_Sanguine_Razor.gif\" width=\"32\" height=\"32\" hspace=\"10\" vspace=\"4\" /></td>\r\n<td><img title=\"Grand Sanguine Cudgel: Death + Physical\" src=\"https://www.tibiawiki.com.br/images/9/93/Grand_Sanguine_Cudgel.gif\" width=\"32\" height=\"32\" hspace=\"10\" vspace=\"4\" /></td>\r\n<td><img title=\"Grand Sanguine Bow: Earth Protection \" src=\"https://www.tibiawiki.com.br/images/3/3a/Grand_Sanguine_Bow.gif\" width=\"32\" height=\"32\" hspace=\"10\" vspace=\"4\" /></td>\r\n<td><img title=\"Grand Sanguine Coil: Earth Protection\" src=\"https://www.tibiawiki.com.br/images/0/08/Grand_Sanguine_Coil.gif\" width=\"32\" height=\"32\" hspace=\"10\" vspace=\"4\" /></td>\r\n<td><img title=\"Sanguine Greaves: Energy + Physical Protection\" src=\"https://www.tibiawiki.com.br/images/0/01/Sanguine_Greaves.gif\" width=\"32\" height=\"32\" hspace=\"10\" vspace=\"4\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img title=\"Sanguine Hatchet: Fire + Physical\" src=\"https://www.tibiawiki.com.br/images/3/3b/Sanguine_Hatchet.gif\" width=\"32\" height=\"32\" hspace=\"10\" vspace=\"4\" /></td>\r\n<td><img title=\"Sanguine Battleaxe: Death + Physical\" src=\"https://www.tibiawiki.com.br/images/6/6f/Sanguine_Battleaxe.gif\" width=\"32\" height=\"32\" hspace=\"10\" vspace=\"4\" /></td>\r\n<td><img title=\"Sanguine Bludgeon: Earth + Physical\" src=\"https://www.tibiawiki.com.br/images/e/e1/Sanguine_Bludgeon.gif\" width=\"32\" height=\"32\" hspace=\"10\" vspace=\"4\" /></td>\r\n<td><img title=\"Sanguine Crossbow: Fire Protection \" src=\"https://www.tibiawiki.com.br/images/b/b5/Sanguine_Crossbow.gif\" width=\"32\" height=\"32\" hspace=\"10\" vspace=\"4\" /></td>\r\n<td><img title=\"Sanguine Rod: Death Protection\" src=\"https://www.tibiawiki.com.br/images/a/ac/Sanguine_Rod.gif\" width=\"32\" height=\"32\" hspace=\"10\" vspace=\"4\" /></td>\r\n<td><img title=\"Sanguine Boots: Ice + Physical Protection\" src=\"https://www.tibiawiki.com.br/images/9/92/Sanguine_Boots.gif\" width=\"32\" height=\"32\" hspace=\"10\" vspace=\"4\" /></td>\r\n</tr>\r\n<tr>\r\n<td><img title=\"Grand Sanguine Hatchet: Fire + Physical\" src=\"https://www.tibiawiki.com.br/images/a/a0/Grand_Sanguine_Hatchet.gif\" width=\"32\" height=\"32\" hspace=\"10\" vspace=\"4\" /></td>\r\n<td><img title=\"Grand Sanguine Battleaxe: Death + Physical\" src=\"https://www.tibiawiki.com.br/images/a/af/Grand_Sanguine_Battleaxe.gif\" width=\"32\" height=\"32\" hspace=\"10\" vspace=\"4\" /></td>\r\n<td><img title=\"Grand Sanguine Bludgeon: Earth + Physical\" src=\"https://www.tibiawiki.com.br/images/8/82/Grand_Sanguine_Bludgeon.gif\" width=\"32\" height=\"32\" hspace=\"10\" vspace=\"4\" /></td>\r\n<td><img title=\"Grand Sanguine Crossbow: Fire Protection \" src=\"https://www.tibiawiki.com.br/images/3/38/Grand_Sanguine_Crossbow.gif\" width=\"32\" height=\"32\" hspace=\"10\" vspace=\"4\" /></td>\r\n<td><img title=\"Grand Sanguine Rod: Death Protection\" src=\"https://www.tibiawiki.com.br/images/c/c9/Grand_Sanguine_Rod.gif\" width=\"32\" height=\"32\" hspace=\"10\" vspace=\"4\" /></td>\r\n<td><img title=\"Sanguine Galoshes: Fire + Physical Protection\" src=\"https://www.tibiawiki.com.br/images/5/55/Sanguine_Galoshes.gif\" width=\"32\" height=\"32\" hspace=\"10\" vspace=\"4\" /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</center></td>\r\n<td style=\"font-family: Verdana, Arial, \'Times New Roman\', sans-serif; font-size: 10pt; color: #5a2800; width: 18.6875px;\">\r\n<p style=\"text-align: center;\">&nbsp; &nbsp;</p>\r\n</td>\r\n<td style=\"font-family: Verdana, Arial, \'Times New Roman\', sans-serif; font-size: 10pt; color: #5a2800; width: 363.422px;\"><img style=\"border: none; display: block; margin-left: -20px; margin-right: auto;\" src=\"https://i.postimg.cc/59TDJ4DP/itemsnovos.gif\" width=\"294\" height=\"194\" /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>', 1, 1724856390, 2, 7, 7, 1733545406, 'https://github.com/opentibiabr/myaac', '', 'images/news/announcement.jpg', 0),
(3, 'Novos Locais', '<h1 style=\"text-align: center;\"><strong>Novos Locais</strong></h1>\r\n<p style=\"text-align: center;\"><strong>Iksupan</strong>&nbsp;- Expans&atilde;o de Iksupan e implementa&ccedil;&atilde;o dos novos mobs Mitmah Scout, Mitmah Seer, Iks Yapunac, e Mystic Jaguar. Al&eacute;m disso, foram adicionados o mini boss Atab e o boss Mitmah Vanguard.</p>\r\n<p style=\"text-align: center;\"><img src=\"https://www.tibiawiki.com.br/images/e/e8/Iks_Yapunac.gif\" alt=\"\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/c/ce/Mitmah_Scout.gif\" alt=\"\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/d/d3/Mitmah_Seer.gif\" alt=\"\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/0/00/Atab.gif\" alt=\"\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/9/9b/Mitmah_Vanguard.gif\" alt=\"\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/4/46/Mystic_Jaguar.gif\" alt=\"\" width=\"64\" height=\"64\" /></p>\r\n<p style=\"text-align: center;\"><img src=\"https://static.tibia.com/images/news/line1px.png\" alt=\"\" width=\"550\" height=\"1\" /></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\"><strong>Bulltaur Lair (Venore)</strong>&nbsp;</p>\r\n<p style=\"text-align: center;\">&Aacute;rea acessada atrav&eacute;s de uma lata de lixo abaixo de um cemit&eacute;rio em Plains of Havoc, perto da entrada do atalho para Pits of Inferno, tamb&eacute;m pr&oacute;ximo ao nosso boss custom Dark GOD. Neste local, voc&ecirc; encontrar&aacute; os novos mobs: Bulltaur Brute, Bulltaur Alchemist e Bulltaur Forgepriest.</p>\r\n<p style=\"text-align: center;\"><img src=\"https://www.tibiawiki.com.br/images/6/62/Bulltaur_Alchemist.gif\" alt=\"\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/c/c9/Bulltaur_Brute.gif\" alt=\"\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/4/48/Bulltaur_Forgepriest.gif\" alt=\"\" width=\"64\" height=\"64\" /></p>\r\n<p style=\"text-align: center;\"><img src=\"https://static.tibia.com/images/news/line1px.png\" alt=\"\" width=\"550\" height=\"1\" /></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\"><strong>Nimmersatt\'s Breeding Ground</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;&Aacute;rea acessada atrav&eacute;s de uma lata de lixo localizada em Temple of Equilibrium. Neste local, voc&ecirc; encontrar&aacute; os novos mobs: Dragolisk, Mega Dragon e Wardragon. Tamb&eacute;m poder&aacute; enfretar os bosses de (The Dragon Hoard).</p>\r\n<p style=\"text-align: center;\"><img src=\"https://www.tibiawiki.com.br/images/c/c1/Dragon_Hoard.gif\" alt=\"\" width=\"40\" height=\"40\" /><img src=\"https://www.tibiawiki.com.br/images/d/d7/Dragolisk.gif\" alt=\"\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/1/14/Mega_Dragon.gif\" alt=\"\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/7/70/Wardragon.gif\" alt=\"\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/c/c1/Dragon_Hoard.gif\" alt=\"\" width=\"40\" height=\"40\" /></p>\r\n<p style=\"text-align: center;\"><img src=\"https://static.tibia.com/images/news/line1px.png\" alt=\"\" width=\"550\" height=\"1\" /></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\"><strong>Montarias/Outfits</strong></p>\r\n<p style=\"text-align: center;\">&nbsp;<img src=\"https://www.tibiawiki.com.br/images/f/f8/Mystic_Jaguar_%28Mount%29.gif\" alt=\"\" width=\"64\" height=\"64\" />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img src=\"https://www.tibiawiki.com.br/images/8/81/Outfit_Draccoon_Herald_Male_Addon_3.gif\" alt=\"\" width=\"64\" height=\"64\" /><br />&nbsp; &nbsp; &nbsp; &nbsp;Mystic Jaguar Mout&nbsp; &nbsp; &nbsp; &nbsp; Draccoon Herald Outfit</p>', 1, 1733545466, 1, 7, 0, 0, '1', '', '', 0),
(4, 'Venha fazer parte dessa equipe', '<h1 style=\"text-align: center;\">Voc&ecirc; tamb&eacute;m pode fazer parte dessa equipe</h1>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../images/fc553c0185b5f1578d4ed9339fb473b1.gif\" alt=\"Tibia wars da vis&atilde;o dos comandantes / l&iacute;deres\" width=\"358\" height=\"220\" /></p>\r\n<table style=\"width: 70%; margin-left: auto; margin-right: auto;\" border=\"0\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 212.5px;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://www.tibiawiki.com.br/images/a/a2/Outfiter.gif\" alt=\"Outfiter.gif\" /></td>\r\n<td style=\"width: 212.5px;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://www.tibiawiki.com.br/images/thumb/0/02/Icebreacher.gif/50px-Icebreacher.gif\" alt=\"Icebreacher.gif\" /></td>\r\n<td style=\"width: 212.5px;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://www.tibiawiki.com.br/images/e/eb/Energy_Spike_Sword.gif\" alt=\"Energy Spike Sword.gif\" /></td>\r\n<td style=\"width: 212.5px;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://www.tibiawiki.com.br/images/6/6b/Outfit_Ranger_Female.gif\" alt=\"Outfit Ranger Female.gif\" /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp; &nbsp;</p>\r\n<p>Amantes de Tibia, a espera acabou! Estamos empolgados em apresentar nosso mais novo OTServer, repleto de emocionantes recursos e mec&acirc;nicas que v&atilde;o revolucionar sua experi&ecirc;ncia de jogo!</p>\r\n<p>&nbsp;</p>\r\n<p>&bull; Principais Caracter&iacute;sticas:</p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>Mapa Global: Explore um vasto mundo com o mapa global, cheio de desafios e novidades.</li>\r\n<li>Mec&acirc;nicas Atuais: Introduzimos diversas mec&acirc;nicas modernas para aprimorar sua jogabilidade e conforto.</li>\r\n<li>Sistema de Trainers Online: Aprimore suas habilidades com nosso sistema de trainers online, facilitando o treinamento de seus personagens.</li>\r\n<li>Salas de Atalhos: Navegue facilmente por novos locais com salas de atalhos estrategicamente colocadas.</li>\r\n</ul>\r\n<p>&bull; Per&iacute;odo de Testes:</p>\r\n<p>Estamos atualmente em test server, o que significa que voc&ecirc; pode encontrar alguns bugs e reinicializa&ccedil;&otilde;es. Contamos com sua ajuda para contribuir com sugest&otilde;es e opini&otilde;es, ajudando a aprimorar o servidor e criar uma comunidade forte e unida.</p>\r\n<p>&nbsp;</p>\r\n<p>&bull; Contribua e Ganhe:</p>\r\n<p>Ao compartilhar suas sugest&otilde;es e opini&otilde;es, voc&ecirc; estar&aacute; contribuindo para o crescimento da comunidade. Agradecemos por ser parte desse processo! Como forma de agradecimento, realizaremos sorteios de pacotes exclusivos para os membros do grupo. N&atilde;o perca essa chance!</p>\r\n<p>Estamos ansiosos para v&ecirc;-lo! Prepare-se para uma jornada &eacute;pica e convide seus amigos para se juntarem a n&oacute;s nessa emocionante aventura. ?</p>', 1, 1733545513, 1, 7, 7, 1733616667, '0', '', 'images/news/announcement.jpg', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_news_categories`
--

CREATE TABLE `myaac_news_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(50) NOT NULL DEFAULT '',
  `icon_id` int(2) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `myaac_news_categories`
--

INSERT INTO `myaac_news_categories` (`id`, `name`, `description`, `icon_id`, `hidden`) VALUES
(1, '', '', 0, 0),
(2, '', '', 1, 0),
(3, '', '', 2, 0),
(4, '', '', 3, 0),
(5, '', '', 4, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_notepad`
--

CREATE TABLE `myaac_notepad` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_pages`
--

CREATE TABLE `myaac_pages` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `body` longtext NOT NULL,
  `date` int(11) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `php` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 - plain html, 1 - php',
  `enable_tinymce` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 - enabled, 0 - disabled',
  `access` tinyint(2) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_paypal`
--

CREATE TABLE `myaac_paypal` (
  `id` int(11) NOT NULL,
  `txn_id` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `account_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `currency` varchar(10) NOT NULL,
  `points` int(11) NOT NULL,
  `payer_status` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `myaac_paypal`
--

INSERT INTO `myaac_paypal` (`id`, `txn_id`, `email`, `account_id`, `price`, `currency`, `points`, `payer_status`, `payment_status`, `created`) VALUES
(1, '97191997622', 'andreoam@gmail.com', 2, 10, 'BRL', 1000, 'status do player', 'hahuha', '2024-12-28 14:06:51'),
(2, '[value-2]', '[value-3]', 2, 0, '[value-6]', 0, '[value-8]', '[value-9]', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_polls`
--

CREATE TABLE `myaac_polls` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `end` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `answers` int(11) NOT NULL,
  `votes_all` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_polls_answers`
--

CREATE TABLE `myaac_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_send_items`
--

CREATE TABLE `myaac_send_items` (
  `id` int(11) NOT NULL,
  `transaction_code` varchar(50) NOT NULL,
  `item_id` varchar(20) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_count` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `account_id` int(11) UNSIGNED NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '0 = pending | 1 = approved | 2 = delivered | 3 = canceled',
  `request` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_spells`
--

CREATE TABLE `myaac_spells` (
  `id` int(11) NOT NULL,
  `spell` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `words` varchar(255) NOT NULL DEFAULT '',
  `category` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 - attack, 2 - healing, 3 - summon, 4 - supply, 5 - support',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 - instant, 2 - conjure, 3 - rune',
  `level` int(11) NOT NULL DEFAULT 0,
  `maglevel` int(11) NOT NULL DEFAULT 0,
  `mana` int(11) NOT NULL DEFAULT 0,
  `soul` tinyint(3) NOT NULL DEFAULT 0,
  `conjure_id` int(11) NOT NULL DEFAULT 0,
  `conjure_count` tinyint(3) NOT NULL DEFAULT 0,
  `reagent` int(11) NOT NULL DEFAULT 0,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `premium` tinyint(1) NOT NULL DEFAULT 0,
  `vocations` varchar(100) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_videos`
--

CREATE TABLE `myaac_videos` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `youtube_id` varchar(20) NOT NULL,
  `author` varchar(50) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_visitors`
--

CREATE TABLE `myaac_visitors` (
  `ip` varchar(45) NOT NULL,
  `lastvisit` int(11) NOT NULL DEFAULT 0,
  `page` varchar(2048) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `myaac_visitors`
--

INSERT INTO `myaac_visitors` (`ip`, `lastvisit`, `page`) VALUES
('127.0.0.1', 1735412533, '/?account/manage');

-- --------------------------------------------------------

--
-- Estrutura para tabela `myaac_weapons`
--

CREATE TABLE `myaac_weapons` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `maglevel` int(11) NOT NULL DEFAULT 0,
  `vocations` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagseguro_transactions`
--

CREATE TABLE `pagseguro_transactions` (
  `id` int(11) NOT NULL,
  `transaction_code` varchar(50) NOT NULL,
  `account_id` int(11) UNSIGNED NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `coins_amount` int(11) NOT NULL,
  `bought` int(11) DEFAULT NULL,
  `delivered` char(1) NOT NULL DEFAULT '0',
  `in_double` char(1) NOT NULL DEFAULT '0',
  `request` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT 1,
  `account_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `vocation` int(11) NOT NULL DEFAULT 0,
  `health` int(11) NOT NULL DEFAULT 150,
  `healthmax` int(11) NOT NULL DEFAULT 150,
  `experience` bigint(20) NOT NULL DEFAULT 0,
  `lookbody` int(11) NOT NULL DEFAULT 0,
  `lookfeet` int(11) NOT NULL DEFAULT 0,
  `lookhead` int(11) NOT NULL DEFAULT 0,
  `looklegs` int(11) NOT NULL DEFAULT 0,
  `looktype` int(11) NOT NULL DEFAULT 136,
  `lookaddons` int(11) NOT NULL DEFAULT 0,
  `maglevel` int(11) NOT NULL DEFAULT 0,
  `mana` int(11) NOT NULL DEFAULT 0,
  `manamax` int(11) NOT NULL DEFAULT 0,
  `manaspent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `soul` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `town_id` int(11) NOT NULL DEFAULT 1,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0,
  `conditions` mediumblob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT 0,
  `sex` int(11) NOT NULL DEFAULT 0,
  `pronoun` int(11) NOT NULL DEFAULT 0,
  `lastlogin` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `lastip` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `save` tinyint(1) NOT NULL DEFAULT 1,
  `skull` tinyint(1) NOT NULL DEFAULT 0,
  `skulltime` bigint(20) NOT NULL DEFAULT 0,
  `lastlogout` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `blessings` tinyint(2) NOT NULL DEFAULT 0,
  `blessings1` tinyint(4) NOT NULL DEFAULT 0,
  `blessings2` tinyint(4) NOT NULL DEFAULT 0,
  `blessings3` tinyint(4) NOT NULL DEFAULT 0,
  `blessings4` tinyint(4) NOT NULL DEFAULT 0,
  `blessings5` tinyint(4) NOT NULL DEFAULT 0,
  `blessings6` tinyint(4) NOT NULL DEFAULT 0,
  `blessings7` tinyint(4) NOT NULL DEFAULT 0,
  `blessings8` tinyint(4) NOT NULL DEFAULT 0,
  `onlinetime` int(11) NOT NULL DEFAULT 0,
  `deletion` bigint(15) NOT NULL DEFAULT 0,
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `offlinetraining_time` smallint(5) UNSIGNED NOT NULL DEFAULT 43200,
  `offlinetraining_skill` tinyint(2) NOT NULL DEFAULT -1,
  `stamina` smallint(5) UNSIGNED NOT NULL DEFAULT 2520,
  `skill_fist` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_fist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_club` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_club_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_sword` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_sword_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_axe` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_axe_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_dist` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_dist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_shielding` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_shielding_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_fishing` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_fishing_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_critical_hit_chance` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `skill_critical_hit_chance_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_critical_hit_damage` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `skill_critical_hit_damage_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_life_leech_chance` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `skill_life_leech_chance_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_life_leech_amount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `skill_life_leech_amount_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_mana_leech_chance` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `skill_mana_leech_chance_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_mana_leech_amount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `skill_mana_leech_amount_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_criticalhit_chance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_criticalhit_damage` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_lifeleech_chance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_lifeleech_amount` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_manaleech_chance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_manaleech_amount` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `manashield` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `max_manashield` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `xpboost_stamina` smallint(5) UNSIGNED DEFAULT NULL,
  `xpboost_value` tinyint(4) UNSIGNED DEFAULT NULL,
  `marriage_status` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `marriage_spouse` int(11) NOT NULL DEFAULT -1,
  `bonus_rerolls` bigint(21) NOT NULL DEFAULT 0,
  `prey_wildcard` bigint(21) NOT NULL DEFAULT 0,
  `task_points` bigint(21) NOT NULL DEFAULT 0,
  `quickloot_fallback` tinyint(1) DEFAULT 0,
  `lookmountbody` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lookmountfeet` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lookmounthead` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lookmountlegs` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lookfamiliarstype` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `isreward` tinyint(1) NOT NULL DEFAULT 1,
  `istutorial` tinyint(1) NOT NULL DEFAULT 0,
  `ismain` tinyint(1) NOT NULL DEFAULT 0,
  `forge_dusts` bigint(21) NOT NULL DEFAULT 0,
  `forge_dust_level` bigint(21) NOT NULL DEFAULT 100,
  `randomize_mount` tinyint(1) NOT NULL DEFAULT 0,
  `boss_points` int(11) NOT NULL DEFAULT 0,
  `created` int(11) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `players`
--

INSERT INTO `players` (`id`, `name`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `pronoun`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `lastlogout`, `blessings`, `blessings1`, `blessings2`, `blessings3`, `blessings4`, `blessings5`, `blessings6`, `blessings7`, `blessings8`, `onlinetime`, `deletion`, `balance`, `offlinetraining_time`, `offlinetraining_skill`, `stamina`, `skill_fist`, `skill_fist_tries`, `skill_club`, `skill_club_tries`, `skill_sword`, `skill_sword_tries`, `skill_axe`, `skill_axe_tries`, `skill_dist`, `skill_dist_tries`, `skill_shielding`, `skill_shielding_tries`, `skill_fishing`, `skill_fishing_tries`, `skill_critical_hit_chance`, `skill_critical_hit_chance_tries`, `skill_critical_hit_damage`, `skill_critical_hit_damage_tries`, `skill_life_leech_chance`, `skill_life_leech_chance_tries`, `skill_life_leech_amount`, `skill_life_leech_amount_tries`, `skill_mana_leech_chance`, `skill_mana_leech_chance_tries`, `skill_mana_leech_amount`, `skill_mana_leech_amount_tries`, `skill_criticalhit_chance`, `skill_criticalhit_damage`, `skill_lifeleech_chance`, `skill_lifeleech_amount`, `skill_manaleech_chance`, `skill_manaleech_amount`, `manashield`, `max_manashield`, `xpboost_stamina`, `xpboost_value`, `marriage_status`, `marriage_spouse`, `bonus_rerolls`, `prey_wildcard`, `task_points`, `quickloot_fallback`, `lookmountbody`, `lookmountfeet`, `lookmounthead`, `lookmountlegs`, `lookfamiliarstype`, `isreward`, `istutorial`, `ismain`, `forge_dusts`, `forge_dust_level`, `randomize_mount`, `boss_points`, `created`, `hidden`, `comment`) VALUES
(1, 'Rook Sample', 1, 1, 2, 0, 155, 155, 100, 113, 115, 95, 39, 129, 0, 2, 60, 60, 5936, 0, 1, 17571, 17406, 7, '', 810, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 12, 155, 12, 155, 12, 155, 12, 93, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 100, 0, 0, 0, 0, ''),
(2, 'Sorcerer Sample', 1, 1, 8, 1, 185, 185, 4200, 113, 115, 95, 39, 129, 0, 0, 90, 90, 0, 0, 8, 32369, 32241, 7, '', 810, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 100, 0, 0, 0, 0, ''),
(3, 'Druid Sample', 1, 1, 8, 2, 185, 185, 4200, 113, 115, 95, 39, 129, 0, 0, 90, 90, 0, 0, 8, 32369, 32241, 7, '', 810, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 100, 0, 0, 0, 0, ''),
(4, 'Paladin Sample', 1, 1, 8, 3, 185, 185, 4200, 113, 115, 95, 39, 129, 0, 0, 90, 90, 0, 0, 8, 32369, 32241, 7, '', 810, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 100, 0, 0, 0, 0, ''),
(5, 'Knight Sample', 1, 1, 8, 4, 185, 185, 4200, 113, 115, 95, 39, 129, 0, 0, 90, 90, 0, 0, 8, 32369, 32241, 7, '', 810, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 100, 0, 0, 0, 0, ''),
(7, '[GM] Under', 6, 2, 500, 0, 2595, 2595, 2058474800, 113, 115, 95, 39, 75, 0, 10000, 2595, 2595, 0, 100, 8, 32354, 32226, 7, '', 4990, 0, 0, 1735061209, 16777343, 1, 0, 0, 1735095900, 0, 1, 1, 1, 1, 1, 1, 1, 1, 2278524, 0, 381615, 43200, -1, 2520, 0, 0, 0, 0, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 15, 101, 0, 20, 1724856390, 0, ''),
(15, 'Melado', 1, 2, 2008, 2, 10174, 10185, 134537104808, 113, 115, 95, 39, 129, 0, 2, 59762, 60090, 84, 0, 8, 32974, 32081, 8, '', 20810, 1, 0, 1734811855, 16777343, 1, 0, 0, 1734811874, 0, 1, 1, 1, 1, 1, 1, 1, 1, 11270, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 11, 5, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 993, 1, 0, 0, 0, 100, 0, 0, 1729218076, 0, ''),
(17, 'Medrosa', 2, 2, 1008, 3, 10185, 10185, 16968554200, 113, 115, 95, 39, 136, 0, 0, 15090, 15090, 0, 0, 8, 32974, 32083, 8, '', 20470, 0, 0, 1734725630, 16777343, 1, 0, 0, 1734725632, 0, 1, 1, 1, 1, 1, 1, 1, 1, 10168, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 48, 567, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 992, 1, 0, 0, 0, 100, 0, 0, 1729810229, 0, '');

--
-- Acionadores `players`
--
DELIMITER $$
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players` FOR EACH ROW BEGIN
    UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `players_online`
--

CREATE TABLE `players_online` (
  `player_id` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_bosstiary`
--

CREATE TABLE `player_bosstiary` (
  `player_id` int(11) NOT NULL,
  `bossIdSlotOne` int(11) NOT NULL DEFAULT 0,
  `bossIdSlotTwo` int(11) NOT NULL DEFAULT 0,
  `removeTimes` int(11) NOT NULL DEFAULT 1,
  `tracker` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `player_bosstiary`
--

INSERT INTO `player_bosstiary` (`player_id`, `bossIdSlotOne`, `bossIdSlotTwo`, `removeTimes`, `tracker`) VALUES
(1, 0, 0, 1, ''),
(2, 0, 0, 1, ''),
(3, 0, 0, 1, ''),
(4, 0, 0, 1, ''),
(5, 0, 0, 1, ''),
(6, 0, 0, 1, ''),
(8, 0, 0, 1, ''),
(14, 0, 0, 1, ''),
(16, 0, 0, 1, ''),
(19, 0, 0, 1, ''),
(20, 0, 0, 1, ''),
(17, 0, 0, 1, ''),
(15, 0, 0, 1, ''),
(7, 0, 0, 1, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_charms`
--

CREATE TABLE `player_charms` (
  `player_guid` int(250) NOT NULL,
  `charm_points` varchar(250) DEFAULT NULL,
  `charm_expansion` tinyint(1) DEFAULT NULL,
  `rune_wound` int(250) DEFAULT NULL,
  `rune_enflame` int(250) DEFAULT NULL,
  `rune_poison` int(250) DEFAULT NULL,
  `rune_freeze` int(250) DEFAULT NULL,
  `rune_zap` int(250) DEFAULT NULL,
  `rune_curse` int(250) DEFAULT NULL,
  `rune_cripple` int(250) DEFAULT NULL,
  `rune_parry` int(250) DEFAULT NULL,
  `rune_dodge` int(250) DEFAULT NULL,
  `rune_adrenaline` int(250) DEFAULT NULL,
  `rune_numb` int(250) DEFAULT NULL,
  `rune_cleanse` int(250) DEFAULT NULL,
  `rune_bless` int(250) DEFAULT NULL,
  `rune_scavenge` int(250) DEFAULT NULL,
  `rune_gut` int(250) DEFAULT NULL,
  `rune_low_blow` int(250) DEFAULT NULL,
  `rune_divine` int(250) DEFAULT NULL,
  `rune_vamp` int(250) DEFAULT NULL,
  `rune_void` int(250) DEFAULT NULL,
  `UsedRunesBit` varchar(250) DEFAULT NULL,
  `UnlockedRunesBit` varchar(250) DEFAULT NULL,
  `tracker list` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `player_charms`
--

INSERT INTO `player_charms` (`player_guid`, `charm_points`, `charm_expansion`, `rune_wound`, `rune_enflame`, `rune_poison`, `rune_freeze`, `rune_zap`, `rune_curse`, `rune_cripple`, `rune_parry`, `rune_dodge`, `rune_adrenaline`, `rune_numb`, `rune_cleanse`, `rune_bless`, `rune_scavenge`, `rune_gut`, `rune_low_blow`, `rune_divine`, `rune_vamp`, `rune_void`, `UsedRunesBit`, `UnlockedRunesBit`, `tracker list`) VALUES
(1, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(2, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(3, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(4, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(5, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(6, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(7, '1125', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(8, '40', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(14, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(15, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(16, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(17, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(20, '30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(19, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_deaths`
--

CREATE TABLE `player_deaths` (
  `player_id` int(11) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `killed_by` varchar(255) NOT NULL,
  `is_player` tinyint(1) NOT NULL DEFAULT 1,
  `mostdamage_by` varchar(100) NOT NULL,
  `mostdamage_is_player` tinyint(1) NOT NULL DEFAULT 0,
  `unjustified` tinyint(1) NOT NULL DEFAULT 0,
  `mostdamage_unjustified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_depotitems`
--

CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range eg 0-100 will be reserved for depot lockers and all > 100 will be then normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `player_depotitems`
--

INSERT INTO `player_depotitems` (`player_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(7, 101, 0, 60168, 1, ''),
(7, 102, 0, 60168, 1, ''),
(7, 103, 0, 60168, 1, ''),
(7, 104, 0, 60168, 1, ''),
(7, 105, 0, 60168, 1, ''),
(7, 106, 1, 30197, 1, ''),
(7, 107, 1, 21445, 1, 0x0118a9409d93010000),
(7, 108, 1, 649, 1, 0x0118a9409d930100000f01),
(7, 109, 1, 33313, 1, 0x017022509c930100002b07000000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_hirelings`
--

CREATE TABLE `player_hirelings` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `sex` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0,
  `lookbody` int(11) NOT NULL DEFAULT 0,
  `lookfeet` int(11) NOT NULL DEFAULT 0,
  `lookhead` int(11) NOT NULL DEFAULT 0,
  `looklegs` int(11) NOT NULL DEFAULT 0,
  `looktype` int(11) NOT NULL DEFAULT 136
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_inboxitems`
--

CREATE TABLE `player_inboxitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_items`
--

CREATE TABLE `player_items` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `sid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `player_items`
--

INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`, `attributes`) VALUES
(1, 11, 101, 23396, 1, ''),
(2, 11, 101, 23396, 1, ''),
(3, 11, 101, 23396, 1, ''),
(4, 11, 101, 23396, 1, ''),
(5, 11, 101, 23396, 1, ''),
(7, 3, 101, 30197, 1, 0x24022c00000080),
(7, 6, 102, 8103, 1, 0x1c9f8601002901000000000000000300353030021740190100000000),
(7, 11, 103, 23396, 1, 0x2401),
(7, 101, 104, 3045, 1, 0x160100),
(7, 101, 105, 29299, 1, 0x10c0270900),
(7, 101, 106, 25718, 1, 0x160100),
(7, 101, 107, 36741, 5, 0x0f05),
(7, 101, 108, 36725, 4, 0x0f04),
(7, 101, 109, 3734, 6, 0x0f06),
(7, 101, 110, 36734, 3, 0x0f03),
(7, 101, 111, 36735, 2, 0x0f02),
(7, 101, 112, 36732, 1, 0x0f01),
(7, 101, 113, 36738, 5, 0x0f05),
(7, 101, 114, 36740, 5, 0x0f05),
(7, 101, 115, 30197, 1, 0x2400),
(7, 101, 116, 3043, 9, 0x0f09),
(7, 101, 117, 60000, 1, ''),
(7, 101, 118, 16242, 15, 0x0f0f),
(7, 101, 119, 22516, 50, 0x0f32),
(7, 101, 120, 22152, 1, ''),
(7, 101, 121, 5710, 1, ''),
(7, 101, 122, 19371, 1, ''),
(7, 103, 123, 60168, 1, ''),
(7, 103, 124, 649, 1, 0x01a34b9bda930100000f01),
(7, 103, 125, 33313, 1, 0x010c8ca89f930100002b07000000),
(7, 103, 126, 44759, 1, 0x01f0c94f9c930100002b07000000),
(7, 103, 127, 37317, 13, 0x0102787fab910100000f0d),
(7, 103, 128, 23721, 1, 0x01653977c192010000240026000000802b07000000),
(7, 115, 129, 30197, 1, ''),
(15, 1, 101, 7992, 1, ''),
(15, 2, 102, 3572, 1, ''),
(15, 3, 103, 2854, 1, 0x240126000000802c00000080),
(15, 4, 104, 7991, 1, ''),
(15, 5, 105, 3059, 1, ''),
(15, 6, 106, 3066, 1, ''),
(15, 7, 107, 3362, 1, ''),
(15, 8, 108, 3552, 1, ''),
(15, 11, 109, 23396, 1, 0x2402),
(15, 103, 110, 268, 10, 0x0f0a),
(15, 103, 111, 5710, 1, ''),
(15, 103, 112, 3003, 1, ''),
(17, 1, 101, 3374, 1, ''),
(17, 2, 102, 3572, 1, ''),
(17, 3, 103, 2854, 1, 0x240126000000802c00000080),
(17, 4, 104, 3571, 1, ''),
(17, 5, 105, 3425, 1, ''),
(17, 6, 106, 3277, 1, 0x0f01),
(17, 7, 107, 8095, 1, ''),
(17, 8, 108, 3552, 1, ''),
(17, 11, 109, 23396, 1, ''),
(17, 103, 110, 35562, 1, ''),
(17, 103, 111, 3350, 1, ''),
(17, 103, 112, 266, 10, 0x0f0a),
(17, 103, 113, 5710, 1, ''),
(17, 103, 114, 3003, 1, ''),
(17, 110, 115, 3447, 1, 0x0f01);

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_kills`
--

CREATE TABLE `player_kills` (
  `player_id` int(11) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `target` int(11) NOT NULL,
  `unavenged` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_namelocks`
--

CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `namelocked_at` bigint(20) NOT NULL,
  `namelocked_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_prey`
--

CREATE TABLE `player_prey` (
  `player_id` int(11) NOT NULL,
  `slot` tinyint(1) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `raceid` varchar(250) NOT NULL,
  `option` tinyint(1) NOT NULL,
  `bonus_type` tinyint(1) NOT NULL,
  `bonus_rarity` tinyint(1) NOT NULL,
  `bonus_percentage` varchar(250) NOT NULL,
  `bonus_time` varchar(250) NOT NULL,
  `free_reroll` bigint(20) NOT NULL,
  `monster_list` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `player_prey`
--

INSERT INTO `player_prey` (`player_id`, `slot`, `state`, `raceid`, `option`, `bonus_type`, `bonus_rarity`, `bonus_percentage`, `bonus_time`, `free_reroll`, `monster_list`) VALUES
(6, 0, 3, '0', 0, 2, 2, '16', '0', 1728330232001, 0xc50664000f0028095506030026003f013901),
(6, 1, 3, '0', 0, 0, 5, '25', '0', 1728330232001, 0x76047c00c1061c03be016800170003024809),
(6, 2, 0, '0', 0, 3, 7, '31', '0', 1728330232001, ''),
(7, 0, 3, '0', 0, 3, 8, '34', '0', 1724966605046, 0x0f04460076047000f803000108077b03),
(7, 1, 3, '0', 0, 0, 5, '25', '0', 1724966605046, 0xe5058b0726000f00bc0678010f02fd00),
(7, 2, 0, '0', 0, 0, 2, '16', '0', 1724966605046, ''),
(8, 0, 3, '0', 0, 2, 7, '31', '0', 1725019219082, 0x0d07d600270990037a04cd017100fb001b00),
(8, 1, 3, '0', 0, 3, 2, '16', '0', 1725019219082, 0x28018a045e0093070b023b004100fa032808),
(8, 2, 0, '0', 0, 0, 6, '28', '0', 1725019219082, ''),
(14, 0, 3, '0', 0, 0, 8, '34', '0', 1729290098898, 0xf707f703fb00e80739000e022a08d8002701),
(14, 1, 3, '0', 0, 0, 6, '28', '0', 1729290098898, 0x0b022905e0053a014c097000900309061b01),
(14, 2, 0, '0', 0, 0, 6, '28', '0', 1729290098898, ''),
(15, 0, 3, '0', 0, 2, 8, '34', '0', 1729290113832, 0x4d01a2028a06210004011b04fc0012032400),
(15, 1, 3, '0', 0, 3, 2, '16', '0', 1729290113832, 0xaf070001ae07760268021b00d503f500d800),
(15, 2, 0, '0', 0, 2, 2, '16', '0', 1729290113832, ''),
(16, 0, 3, '0', 0, 1, 6, '28', '0', 1729879148836, 0xd20322011a070601040188077a0678003f00),
(16, 1, 3, '0', 0, 1, 8, '34', '0', 1729879148836, 0x000242010d07db0066023200f2004d015606),
(16, 2, 0, '0', 0, 3, 5, '25', '0', 1729879148836, ''),
(17, 0, 3, '0', 0, 0, 5, '25', '0', 1729882235505, 0x0203f5007003da00ce0544013d0075003500),
(17, 1, 3, '0', 0, 3, 2, '16', '0', 1729882235505, 0x51002007f2001403f1041f0171004709f004),
(17, 2, 0, '0', 0, 3, 2, '16', '0', 1729882235505, ''),
(19, 0, 3, '0', 0, 2, 5, '25', '0', 1733745664736, 0x0e025f09cd02ac077000da00120058071d00),
(19, 1, 3, '0', 0, 2, 3, '19', '0', 1733745664736, 0xc003df00fd007a038102b60249015f003800),
(19, 2, 0, '0', 0, 3, 2, '16', '0', 1733745664736, ''),
(20, 0, 3, '0', 0, 0, 2, '16', '0', 1733618926443, 0x45000f0030004b09f10003002d002100d203),
(20, 1, 3, '0', 0, 0, 10, '40', '0', 1733618926443, 0x3900f000bd061800ff009c03390134007b04),
(20, 2, 0, '0', 0, 0, 2, '16', '0', 1733618926443, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_rewards`
--

CREATE TABLE `player_rewards` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_spells`
--

CREATE TABLE `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_stash`
--

CREATE TABLE `player_stash` (
  `player_id` int(16) NOT NULL,
  `item_id` int(16) NOT NULL,
  `item_count` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_storage`
--

CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `key` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `value` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `player_storage`
--

INSERT INTO `player_storage` (`player_id`, `key`, `value`) VALUES
(7, 12330, 1),
(7, 12332, 13),
(7, 12333, 3),
(7, 12450, 6),
(7, 13413, 1735009500),
(7, 13414, 12),
(7, 14900, 1),
(7, 14903, 0),
(7, 15000, 60),
(7, 20001, 1),
(7, 20002, 1),
(7, 30057, 2),
(7, 30060, 2),
(7, 40430, 2),
(7, 40431, 2),
(7, 40432, 2),
(7, 40434, 0),
(7, 40435, 2),
(7, 40436, 2),
(7, 40437, 2),
(7, 40438, 3),
(7, 40439, 1),
(7, 40440, 1),
(7, 40441, 0),
(7, 40442, 3),
(7, 40443, 3),
(7, 40444, 3),
(7, 40445, 1),
(7, 40446, 1),
(7, 40612, 1),
(7, 40613, 18),
(7, 40629, 61),
(7, 40638, 2),
(7, 40788, 1),
(7, 40789, 1),
(7, 40790, 1),
(7, 40791, 1),
(7, 40822, 1),
(7, 40823, 2),
(7, 40824, 2),
(7, 40825, 12),
(7, 40827, 3),
(7, 40828, 3),
(7, 40829, 2),
(7, 40830, 1),
(7, 40831, 3),
(7, 40832, 5),
(7, 40833, 1),
(7, 40834, 1),
(7, 40835, 2),
(7, 40836, 1),
(7, 40837, 4),
(7, 41153, 1),
(7, 41174, 8),
(7, 41175, 3),
(7, 41176, 3),
(7, 41177, 3),
(7, 41276, 40),
(7, 41277, 3),
(7, 41278, 5),
(7, 41279, 3),
(7, 41280, 2),
(7, 41281, 6),
(7, 41282, 8),
(7, 41283, 3),
(7, 41284, 4),
(7, 41285, 2),
(7, 41286, 2),
(7, 41287, 2),
(7, 41288, 6),
(7, 41300, 1),
(7, 41306, 1),
(7, 41391, 2),
(7, 41392, 5),
(7, 41393, 3),
(7, 41394, 3),
(7, 41395, 3),
(7, 41396, 2),
(7, 41397, 1),
(7, 41685, 2),
(7, 41690, 5),
(7, 41691, 25),
(7, 41692, 7),
(7, 41693, 3),
(7, 41694, 6),
(7, 41695, 3),
(7, 41696, 3),
(7, 41697, 3),
(7, 41698, 1),
(7, 41700, 1),
(7, 41701, 1),
(7, 41703, 1),
(7, 41704, 1),
(7, 41705, 1),
(7, 41708, 1),
(7, 41710, 1),
(7, 41711, 2),
(7, 41712, 3),
(7, 41713, 3),
(7, 41714, 8),
(7, 41715, 2),
(7, 41716, 4),
(7, 41717, 2),
(7, 41718, 1),
(7, 41912, 1),
(7, 41950, 1),
(7, 41951, 51),
(7, 41952, 6),
(7, 41953, 8),
(7, 41954, 6),
(7, 41955, 6),
(7, 41956, 8),
(7, 41957, 5),
(7, 41958, 5),
(7, 41959, 4),
(7, 41960, 2),
(7, 41961, 1),
(7, 41962, 1),
(7, 41963, 1),
(7, 41964, 1),
(7, 41965, 1),
(7, 41966, 1),
(7, 41967, 1),
(7, 41968, 1),
(7, 41969, 1),
(7, 41970, 1),
(7, 41971, 1),
(7, 41972, 1),
(7, 41973, 1),
(7, 41974, 1),
(7, 41975, 1),
(7, 41976, 1),
(7, 41977, 1),
(7, 41978, 1),
(7, 41979, 1),
(7, 41980, 1),
(7, 41983, 1),
(7, 41984, 1),
(7, 41985, 1),
(7, 41986, 1),
(7, 41987, 1),
(7, 41988, 1),
(7, 41989, 1),
(7, 41994, 5),
(7, 41995, 1),
(7, 41996, 1),
(7, 41997, 1),
(7, 41998, 1),
(7, 41999, 1),
(7, 42000, 1),
(7, 42001, 1),
(7, 42002, 1),
(7, 42003, 1),
(7, 42004, 1),
(7, 42006, 1),
(7, 42166, 0),
(7, 42601, 21),
(7, 42602, 2),
(7, 42603, 3),
(7, 42604, 5),
(7, 42605, 3),
(7, 42606, 6),
(7, 42607, 3),
(7, 42608, 1),
(7, 42609, 1),
(7, 42610, 1),
(7, 42611, 1),
(7, 42701, 29),
(7, 42703, 3),
(7, 42704, 4),
(7, 42705, 1),
(7, 42706, 1),
(7, 42707, 1),
(7, 42708, 3),
(7, 42709, 2),
(7, 42710, 2),
(7, 42711, 1),
(7, 42712, 1),
(7, 42713, 1),
(7, 42714, 1),
(7, 42715, 1),
(7, 42716, 1),
(7, 42717, 5),
(7, 42718, 2),
(7, 42720, 2),
(7, 42721, 3),
(7, 42724, 2),
(7, 42725, 1),
(7, 42729, 12),
(7, 42731, 1),
(7, 43000, 29),
(7, 43001, 3),
(7, 43002, 3),
(7, 43003, 3),
(7, 43004, 3),
(7, 43005, 3),
(7, 43006, 4),
(7, 43007, 6),
(7, 43008, 2),
(7, 43009, 2),
(7, 43010, 1),
(7, 43026, 1),
(7, 43027, 1),
(7, 43028, 1),
(7, 43029, 2),
(7, 43030, 1),
(7, 43031, 1),
(7, 43032, 1),
(7, 43033, 1),
(7, 44956, 1),
(7, 44957, 1),
(7, 45493, 1733800368),
(7, 45511, 1733808432),
(7, 45751, 1),
(7, 45752, 16),
(7, 45764, 1),
(7, 46309, 1),
(7, 46402, 1),
(7, 46403, 1),
(7, 46404, 1),
(7, 46851, 14),
(7, 46866, 1),
(7, 46875, 1),
(7, 47012, 1),
(7, 47014, 1),
(7, 47016, 1),
(7, 47019, 1),
(7, 47020, 1),
(7, 47402, 1),
(7, 47403, 1),
(7, 47512, 1),
(7, 47514, 1),
(7, 47601, 1),
(7, 47902, 1),
(7, 47903, 1),
(7, 47904, 1),
(7, 47905, 1),
(7, 47952, 10),
(7, 47953, 1),
(7, 47955, 1735204040),
(7, 47958, 2),
(7, 47959, 2),
(7, 47960, 2),
(7, 47961, 1),
(7, 50011, 5),
(7, 50043, 1),
(7, 50052, 1),
(7, 50053, 1),
(7, 50054, 1),
(7, 50055, 1),
(7, 50063, 1),
(7, 50065, 1),
(7, 50066, 1),
(7, 50067, 1),
(7, 50068, 1),
(7, 50069, 1),
(7, 50070, 1),
(7, 50071, 1),
(7, 50072, 1),
(7, 50073, 1),
(7, 50080, 1),
(7, 50081, 10),
(7, 50082, 2),
(7, 50083, 2),
(7, 50090, 10),
(7, 50091, 2),
(7, 50092, 2),
(7, 50115, 10),
(7, 50116, 3),
(7, 50117, 2),
(7, 50118, 2),
(7, 50139, 10),
(7, 50141, 10),
(7, 50143, 30),
(7, 50200, 7),
(7, 50201, 1),
(7, 50202, 1),
(7, 50203, 1),
(7, 50204, 1),
(7, 50205, 1),
(7, 50210, 1),
(7, 50211, 1),
(7, 50212, 1),
(7, 50213, 1),
(7, 50214, 1),
(7, 50215, 1),
(7, 50225, 1),
(7, 50226, 4),
(7, 50227, 3),
(7, 50228, 3),
(7, 50230, 1),
(7, 50231, 1),
(7, 50234, 1),
(7, 50235, 1),
(7, 50236, 1),
(7, 50240, 1),
(7, 50241, 1),
(7, 50242, 1),
(7, 50243, 1),
(7, 50245, 7),
(7, 50246, 1),
(7, 50250, 1),
(7, 50251, 1),
(7, 50252, 1),
(7, 50253, 1),
(7, 50255, 1),
(7, 50256, 1),
(7, 50257, 1),
(7, 50258, 1),
(7, 50259, 1),
(7, 50260, 1),
(7, 50263, 1),
(7, 50264, 1),
(7, 50403, 1),
(7, 50404, 1),
(7, 50405, 1),
(7, 50406, 1),
(7, 50442, 1),
(7, 50443, 1),
(7, 50444, 1),
(7, 50445, 1),
(7, 50446, 1),
(7, 50453, 1),
(7, 50470, 1),
(7, 50471, 1),
(7, 50472, 1),
(7, 50473, 1),
(7, 50474, 1),
(7, 50475, 1),
(7, 50486, 1),
(7, 50488, 1),
(7, 50490, 1),
(7, 50492, 1),
(7, 50494, 1),
(7, 50496, 1),
(7, 50498, 1),
(7, 50501, 1),
(7, 50503, 1),
(7, 50506, 1),
(7, 50660, 23),
(7, 50662, 5),
(7, 50663, 2),
(7, 50672, 1440),
(7, 50699, 2),
(7, 50700, 2),
(7, 50701, 2),
(7, 50850, 1),
(7, 50851, 1),
(7, 50852, 3000),
(7, 50853, 1),
(7, 50854, 1),
(7, 50855, 1),
(7, 50856, 1),
(7, 50857, 1),
(7, 50960, 1),
(7, 51480, 1),
(7, 51487, 1),
(7, 51538, 2),
(7, 51680, 1),
(7, 51770, 1),
(7, 52030, 1),
(7, 52031, 1),
(7, 52032, 2),
(7, 52033, 1),
(7, 52146, 2),
(7, 52148, 1),
(7, 52149, 3),
(7, 55047, 1),
(7, 64002, 0),
(7, 64003, 1733550647),
(7, 64007, 1729827677),
(7, 64020, 0),
(7, 64021, 1729661775),
(7, 64022, 0),
(7, 64023, 1725332979),
(7, 100157, 1),
(7, 10001001, 16449536),
(7, 10001002, 16515072),
(7, 10001003, 83296256),
(7, 10001004, 83230720),
(7, 10002001, 2),
(7, 10002011, 0),
(7, 61305010, 70),
(7, 61305014, 10),
(7, 61305021, 26),
(7, 61305026, 35),
(7, 61305035, 4516),
(7, 61305037, 20),
(7, 61305039, 75),
(7, 61305040, 10),
(7, 61305049, 395),
(7, 61305055, 60),
(7, 61305078, 90),
(7, 61305099, 75),
(7, 61305101, 5),
(7, 61305220, 30),
(7, 61305231, 2),
(7, 61305281, 140),
(7, 61305282, 100),
(7, 61305283, 60),
(7, 61305284, 135),
(7, 61305285, 1100),
(7, 61305286, 295),
(7, 61305287, 1035),
(7, 61305288, 20),
(7, 61305289, 35),
(7, 61305291, 10),
(7, 61305292, 125),
(7, 61305294, 990),
(7, 61305295, 100),
(7, 61305296, 1140),
(7, 61305298, 100),
(7, 61305299, 125),
(7, 61305313, 10),
(7, 61305314, 205),
(7, 61305317, 115),
(7, 61305386, 15),
(7, 61305465, 550),
(7, 61305519, 425),
(7, 61305526, 15),
(7, 61305643, 30),
(7, 61306039, 285),
(7, 61306109, 16),
(7, 61306196, 2000),
(7, 61306197, 540),
(7, 61306198, 1115),
(7, 61306336, 2),
(7, 61306637, 30),
(7, 61306665, 10),
(7, 61306666, 5),
(7, 61306670, 10),
(7, 61306725, 14),
(7, 61306754, 6),
(7, 61306755, 2),
(7, 61306864, 4),
(7, 61306866, 2),
(7, 61306868, 2),
(7, 61306872, 2),
(7, 61306873, 2),
(7, 61306881, 2),
(7, 61306890, 2),
(7, 61306891, 2),
(7, 61306892, 2),
(7, 61307375, 5),
(15, 10134, 1),
(15, 10135, 1),
(15, 10136, 2),
(15, 10137, 1),
(15, 12330, 1),
(15, 12332, 13),
(15, 12333, 3),
(15, 12450, 6),
(15, 13413, 1734750300),
(15, 13414, 12),
(15, 14900, 1),
(15, 14903, 0),
(15, 15000, 60),
(15, 30057, 2),
(15, 40430, 2),
(15, 40431, 2),
(15, 40432, 2),
(15, 40434, 0),
(15, 40435, 2),
(15, 40436, 2),
(15, 40437, 2),
(15, 40438, 3),
(15, 40439, 1),
(15, 40440, 1),
(15, 40441, 0),
(15, 40442, 3),
(15, 40443, 3),
(15, 40444, 3),
(15, 40445, 1),
(15, 40446, 1),
(15, 40612, 1),
(15, 40613, 18),
(15, 40629, 61),
(15, 40638, 2),
(15, 40788, 1),
(15, 40789, 1),
(15, 40790, 1),
(15, 40791, 1),
(15, 40822, 1),
(15, 40823, 2),
(15, 40824, 2),
(15, 40825, 12),
(15, 40827, 3),
(15, 40828, 3),
(15, 40829, 2),
(15, 40830, 1),
(15, 40831, 3),
(15, 40832, 5),
(15, 40833, 1),
(15, 40834, 1),
(15, 40835, 2),
(15, 40836, 1),
(15, 40837, 4),
(15, 41153, 1),
(15, 41174, 8),
(15, 41175, 3),
(15, 41176, 3),
(15, 41177, 3),
(15, 41276, 40),
(15, 41277, 3),
(15, 41278, 5),
(15, 41279, 3),
(15, 41280, 2),
(15, 41281, 6),
(15, 41282, 8),
(15, 41283, 3),
(15, 41284, 4),
(15, 41285, 2),
(15, 41286, 2),
(15, 41287, 2),
(15, 41288, 6),
(15, 41300, 1),
(15, 41306, 1),
(15, 41472, 1),
(15, 41476, 1),
(15, 41480, 2),
(15, 41481, 5),
(15, 41482, 3),
(15, 41483, 3),
(15, 41484, 3),
(15, 41485, 2),
(15, 41486, 1),
(15, 41492, 2),
(15, 41685, 2),
(15, 41690, 5),
(15, 41691, 25),
(15, 41692, 7),
(15, 41693, 3),
(15, 41694, 6),
(15, 41695, 3),
(15, 41696, 3),
(15, 41697, 3),
(15, 41698, 1),
(15, 41700, 1),
(15, 41701, 1),
(15, 41703, 1),
(15, 41704, 1),
(15, 41705, 1),
(15, 41710, 1),
(15, 41711, 2),
(15, 41712, 3),
(15, 41713, 3),
(15, 41714, 8),
(15, 41715, 2),
(15, 41716, 4),
(15, 41717, 2),
(15, 41718, 1),
(15, 41912, 1),
(15, 41950, 1),
(15, 41951, 51),
(15, 41952, 6),
(15, 41953, 8),
(15, 41954, 6),
(15, 41955, 6),
(15, 41956, 8),
(15, 41957, 5),
(15, 41958, 5),
(15, 41959, 4),
(15, 41960, 2),
(15, 41961, 1),
(15, 41962, 1),
(15, 41963, 1),
(15, 41964, 1),
(15, 41965, 1),
(15, 41966, 1),
(15, 41967, 1),
(15, 41968, 1),
(15, 41969, 1),
(15, 41970, 1),
(15, 41971, 1),
(15, 41972, 1),
(15, 41973, 1),
(15, 41974, 1),
(15, 41975, 1),
(15, 41976, 1),
(15, 41977, 1),
(15, 41978, 1),
(15, 41979, 1),
(15, 41980, 1),
(15, 41983, 1),
(15, 41984, 1),
(15, 41985, 1),
(15, 41986, 1),
(15, 41987, 1),
(15, 41988, 1),
(15, 41989, 1),
(15, 41994, 5),
(15, 41995, 1),
(15, 41996, 1),
(15, 41997, 1),
(15, 41998, 1),
(15, 41999, 1),
(15, 42000, 1),
(15, 42001, 1),
(15, 42002, 1),
(15, 42003, 1),
(15, 42004, 1),
(15, 42006, 1),
(15, 42166, 0),
(15, 42601, 21),
(15, 42602, 2),
(15, 42603, 3),
(15, 42604, 5),
(15, 42605, 3),
(15, 42606, 6),
(15, 42607, 3),
(15, 42608, 1),
(15, 42609, 1),
(15, 42610, 1),
(15, 42611, 1),
(15, 42701, 29),
(15, 42703, 3),
(15, 42704, 4),
(15, 42705, 1),
(15, 42706, 1),
(15, 42707, 1),
(15, 42708, 3),
(15, 42709, 2),
(15, 42710, 2),
(15, 42711, 1),
(15, 42712, 1),
(15, 42713, 1),
(15, 42714, 1),
(15, 42715, 1),
(15, 42716, 1),
(15, 42717, 5),
(15, 42718, 2),
(15, 42720, 2),
(15, 42721, 3),
(15, 42724, 2),
(15, 42725, 1),
(15, 42729, 12),
(15, 42731, 1),
(15, 43000, 29),
(15, 43001, 3),
(15, 43002, 3),
(15, 43003, 3),
(15, 43004, 3),
(15, 43005, 3),
(15, 43006, 4),
(15, 43007, 6),
(15, 43008, 2),
(15, 43009, 2),
(15, 43010, 1),
(15, 43026, 1),
(15, 43027, 1),
(15, 43028, 1),
(15, 43029, 2),
(15, 43030, 1),
(15, 43031, 1),
(15, 43032, 1),
(15, 43033, 1),
(15, 43851, 23),
(15, 43853, 5),
(15, 43854, 2),
(15, 43863, 1440),
(15, 43890, 2),
(15, 43891, 2),
(15, 43892, 2),
(15, 44579, 1),
(15, 44581, 3000),
(15, 44752, 1),
(15, 44753, 1),
(15, 45150, 1),
(15, 45151, 1),
(15, 45180, 2),
(15, 45183, 3),
(15, 45215, 1),
(15, 45216, 1),
(15, 45217, 1),
(15, 45218, 1),
(15, 45219, 1),
(15, 45226, 1),
(15, 45751, 1),
(15, 45752, 16),
(15, 45764, 1),
(15, 46309, 1),
(15, 46402, 1),
(15, 46403, 1),
(15, 46404, 1),
(15, 46851, 14),
(15, 46875, 1),
(15, 47402, 1),
(15, 47403, 1),
(15, 47512, 1),
(15, 47514, 1),
(15, 47601, 1),
(15, 47902, 1),
(15, 47903, 1),
(15, 47904, 1),
(15, 47905, 1),
(15, 47952, 4),
(15, 47953, 1),
(15, 47954, 1735180247),
(15, 50011, 5),
(15, 50043, 1),
(15, 50052, 1),
(15, 50053, 1),
(15, 50054, 1),
(15, 50055, 1),
(15, 50063, 1),
(15, 50065, 1),
(15, 50066, 1),
(15, 50067, 1),
(15, 50068, 1),
(15, 50069, 1),
(15, 50070, 1),
(15, 50071, 1),
(15, 50072, 1),
(15, 50073, 1),
(15, 50080, 1),
(15, 50081, 10),
(15, 50082, 2),
(15, 50083, 2),
(15, 50090, 10),
(15, 50091, 2),
(15, 50092, 2),
(15, 50115, 10),
(15, 50116, 3),
(15, 50117, 2),
(15, 50118, 2),
(15, 50139, 10),
(15, 50141, 10),
(15, 50143, 30),
(15, 50200, 7),
(15, 50201, 1),
(15, 50202, 1),
(15, 50203, 1),
(15, 50204, 1),
(15, 50205, 1),
(15, 50210, 1),
(15, 50211, 1),
(15, 50212, 1),
(15, 50213, 1),
(15, 50214, 1),
(15, 50215, 1),
(15, 50225, 1),
(15, 50226, 4),
(15, 50227, 3),
(15, 50228, 3),
(15, 50230, 1),
(15, 50231, 1),
(15, 50234, 1),
(15, 50235, 1),
(15, 50236, 1),
(15, 50240, 1),
(15, 50241, 1),
(15, 50242, 1),
(15, 50243, 1),
(15, 50245, 7),
(15, 50246, 1),
(15, 50250, 1),
(15, 50251, 1),
(15, 50252, 1),
(15, 50253, 1),
(15, 50255, 1),
(15, 50256, 1),
(15, 50257, 1),
(15, 50258, 1),
(15, 50259, 1),
(15, 50260, 1),
(15, 50263, 1),
(15, 50264, 1),
(15, 50403, 1),
(15, 50404, 1),
(15, 50405, 1),
(15, 50406, 1),
(15, 50470, 1),
(15, 50471, 1),
(15, 50472, 1),
(15, 50473, 1),
(15, 50474, 1),
(15, 50475, 1),
(15, 50486, 1),
(15, 50488, 1),
(15, 50490, 1),
(15, 50492, 1),
(15, 50494, 1),
(15, 50496, 1),
(15, 50498, 1),
(15, 50501, 1),
(15, 50503, 1),
(15, 50506, 1),
(15, 50960, 1),
(15, 51680, 1),
(15, 52148, 1),
(15, 55047, 1),
(15, 100157, 1),
(15, 10001001, 16449536),
(15, 10001002, 16515072),
(15, 10002001, 2),
(15, 10003001, 65077248),
(15, 61305021, 4),
(15, 61305036, 4),
(15, 61305056, 4),
(17, 10134, 1),
(17, 10135, 1),
(17, 10136, 2),
(17, 10137, 1),
(17, 12330, 1),
(17, 12332, 13),
(17, 12333, 3),
(17, 12450, 6),
(17, 13413, 1734663900),
(17, 13414, 12),
(17, 14900, 1),
(17, 14903, 0),
(17, 15000, 60),
(17, 30057, 2),
(17, 40430, 2),
(17, 40431, 2),
(17, 40432, 2),
(17, 40434, 0),
(17, 40435, 2),
(17, 40436, 2),
(17, 40437, 2),
(17, 40438, 3),
(17, 40439, 1),
(17, 40440, 1),
(17, 40441, 0),
(17, 40442, 3),
(17, 40443, 3),
(17, 40444, 3),
(17, 40445, 1),
(17, 40446, 1),
(17, 40612, 1),
(17, 40613, 18),
(17, 40629, 61),
(17, 40638, 2),
(17, 40788, 1),
(17, 40789, 1),
(17, 40790, 1),
(17, 40791, 1),
(17, 40822, 1),
(17, 40823, 2),
(17, 40824, 2),
(17, 40825, 12),
(17, 40827, 3),
(17, 40828, 3),
(17, 40829, 2),
(17, 40830, 1),
(17, 40831, 3),
(17, 40832, 5),
(17, 40833, 1),
(17, 40834, 1),
(17, 40835, 2),
(17, 40836, 1),
(17, 40837, 4),
(17, 41153, 1),
(17, 41174, 8),
(17, 41175, 3),
(17, 41176, 3),
(17, 41177, 3),
(17, 41276, 40),
(17, 41277, 3),
(17, 41278, 5),
(17, 41279, 3),
(17, 41280, 2),
(17, 41281, 6),
(17, 41282, 8),
(17, 41283, 3),
(17, 41284, 4),
(17, 41285, 2),
(17, 41286, 2),
(17, 41287, 2),
(17, 41288, 6),
(17, 41300, 1),
(17, 41306, 1),
(17, 41472, 1),
(17, 41476, 1),
(17, 41480, 2),
(17, 41481, 5),
(17, 41482, 3),
(17, 41483, 3),
(17, 41484, 3),
(17, 41485, 2),
(17, 41486, 1),
(17, 41492, 2),
(17, 41685, 2),
(17, 41690, 5),
(17, 41691, 25),
(17, 41692, 7),
(17, 41693, 3),
(17, 41694, 6),
(17, 41695, 3),
(17, 41696, 3),
(17, 41697, 3),
(17, 41698, 1),
(17, 41700, 1),
(17, 41701, 1),
(17, 41703, 1),
(17, 41704, 1),
(17, 41705, 1),
(17, 41710, 1),
(17, 41711, 2),
(17, 41712, 3),
(17, 41713, 3),
(17, 41714, 8),
(17, 41715, 2),
(17, 41716, 4),
(17, 41717, 2),
(17, 41718, 1),
(17, 41912, 1),
(17, 41950, 1),
(17, 41951, 51),
(17, 41952, 6),
(17, 41953, 8),
(17, 41954, 6),
(17, 41955, 6),
(17, 41956, 8),
(17, 41957, 5),
(17, 41958, 5),
(17, 41959, 4),
(17, 41960, 2),
(17, 41961, 1),
(17, 41962, 1),
(17, 41963, 1),
(17, 41964, 1),
(17, 41965, 1),
(17, 41966, 1),
(17, 41967, 1),
(17, 41968, 1),
(17, 41969, 1),
(17, 41970, 1),
(17, 41971, 1),
(17, 41972, 1),
(17, 41973, 1),
(17, 41974, 1),
(17, 41975, 1),
(17, 41976, 1),
(17, 41977, 1),
(17, 41978, 1),
(17, 41979, 1),
(17, 41980, 1),
(17, 41983, 1),
(17, 41984, 1),
(17, 41985, 1),
(17, 41986, 1),
(17, 41987, 1),
(17, 41988, 1),
(17, 41989, 1),
(17, 41994, 5),
(17, 41995, 1),
(17, 41996, 1),
(17, 41997, 1),
(17, 41998, 1),
(17, 41999, 1),
(17, 42000, 1),
(17, 42001, 1),
(17, 42002, 1),
(17, 42003, 1),
(17, 42004, 1),
(17, 42006, 1),
(17, 42166, 0),
(17, 42601, 21),
(17, 42602, 2),
(17, 42603, 3),
(17, 42604, 5),
(17, 42605, 3),
(17, 42606, 6),
(17, 42607, 3),
(17, 42608, 1),
(17, 42609, 1),
(17, 42610, 1),
(17, 42611, 1),
(17, 42701, 29),
(17, 42703, 3),
(17, 42704, 4),
(17, 42705, 1),
(17, 42706, 1),
(17, 42707, 1),
(17, 42708, 3),
(17, 42709, 2),
(17, 42710, 2),
(17, 42711, 1),
(17, 42712, 1),
(17, 42713, 1),
(17, 42714, 1),
(17, 42715, 1),
(17, 42716, 1),
(17, 42717, 5),
(17, 42718, 2),
(17, 42720, 2),
(17, 42721, 3),
(17, 42724, 2),
(17, 42725, 1),
(17, 42729, 12),
(17, 42731, 1),
(17, 43000, 29),
(17, 43001, 3),
(17, 43002, 3),
(17, 43003, 3),
(17, 43004, 3),
(17, 43005, 3),
(17, 43006, 4),
(17, 43007, 6),
(17, 43008, 2),
(17, 43009, 2),
(17, 43010, 1),
(17, 43026, 1),
(17, 43027, 1),
(17, 43028, 1),
(17, 43029, 2),
(17, 43030, 1),
(17, 43031, 1),
(17, 43032, 1),
(17, 43033, 1),
(17, 43851, 23),
(17, 43853, 5),
(17, 43854, 2),
(17, 43863, 1440),
(17, 43890, 2),
(17, 43891, 2),
(17, 43892, 2),
(17, 44579, 1),
(17, 44581, 3000),
(17, 44752, 1),
(17, 44753, 1),
(17, 45150, 1),
(17, 45151, 1),
(17, 45180, 2),
(17, 45183, 3),
(17, 45215, 1),
(17, 45216, 1),
(17, 45217, 1),
(17, 45218, 1),
(17, 45219, 1),
(17, 45226, 1),
(17, 45751, 1),
(17, 45752, 16),
(17, 45764, 1),
(17, 46309, 1),
(17, 46402, 1),
(17, 46403, 1),
(17, 46404, 1),
(17, 46851, 14),
(17, 46875, 1),
(17, 47402, 1),
(17, 47403, 1),
(17, 47512, 1),
(17, 47514, 1),
(17, 47601, 1),
(17, 47902, 1),
(17, 47903, 1),
(17, 47904, 1),
(17, 47905, 1),
(17, 47952, 10),
(17, 47953, 1),
(17, 47954, 1735152114),
(17, 47955, 1735200886),
(17, 50011, 5),
(17, 50043, 1),
(17, 50052, 1),
(17, 50053, 1),
(17, 50054, 1),
(17, 50055, 1),
(17, 50063, 1),
(17, 50065, 1),
(17, 50066, 1),
(17, 50067, 1),
(17, 50068, 1),
(17, 50069, 1),
(17, 50070, 1),
(17, 50071, 1),
(17, 50072, 1),
(17, 50073, 1),
(17, 50080, 1),
(17, 50081, 10),
(17, 50082, 2),
(17, 50083, 2),
(17, 50090, 10),
(17, 50091, 2),
(17, 50092, 2),
(17, 50115, 10),
(17, 50116, 3),
(17, 50117, 2),
(17, 50118, 2),
(17, 50139, 10),
(17, 50141, 10),
(17, 50143, 30),
(17, 50200, 7),
(17, 50201, 1),
(17, 50202, 1),
(17, 50203, 1),
(17, 50204, 1),
(17, 50205, 1),
(17, 50210, 1),
(17, 50211, 1),
(17, 50212, 1),
(17, 50213, 1),
(17, 50214, 1),
(17, 50215, 1),
(17, 50225, 1),
(17, 50226, 4),
(17, 50227, 3),
(17, 50228, 3),
(17, 50230, 1),
(17, 50231, 1),
(17, 50234, 1),
(17, 50235, 1),
(17, 50236, 1),
(17, 50240, 1),
(17, 50241, 1),
(17, 50242, 1),
(17, 50243, 1),
(17, 50245, 7),
(17, 50246, 1),
(17, 50250, 1),
(17, 50251, 1),
(17, 50252, 1),
(17, 50253, 1),
(17, 50255, 1),
(17, 50256, 1),
(17, 50257, 1),
(17, 50258, 1),
(17, 50259, 1),
(17, 50260, 1),
(17, 50263, 1),
(17, 50264, 1),
(17, 50403, 1),
(17, 50404, 1),
(17, 50405, 1),
(17, 50406, 1),
(17, 50470, 1),
(17, 50471, 1),
(17, 50472, 1),
(17, 50473, 1),
(17, 50474, 1),
(17, 50475, 1),
(17, 50486, 1),
(17, 50488, 1),
(17, 50490, 1),
(17, 50492, 1),
(17, 50494, 1),
(17, 50496, 1),
(17, 50498, 1),
(17, 50501, 1),
(17, 50503, 1),
(17, 50506, 1),
(17, 50960, 1),
(17, 51680, 1),
(17, 52148, 1),
(17, 55047, 1),
(17, 100157, 1),
(17, 10001001, 16449536),
(17, 10001002, 16515072),
(17, 10002001, 2),
(17, 10003001, 65011712);

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_taskhunt`
--

CREATE TABLE `player_taskhunt` (
  `player_id` int(11) NOT NULL,
  `slot` tinyint(1) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `raceid` varchar(250) NOT NULL,
  `upgrade` tinyint(1) NOT NULL,
  `rarity` tinyint(1) NOT NULL,
  `kills` varchar(250) NOT NULL,
  `disabled_time` bigint(20) NOT NULL,
  `free_reroll` bigint(20) NOT NULL,
  `monster_list` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `player_taskhunt`
--

INSERT INTO `player_taskhunt` (`player_id`, `slot`, `state`, `raceid`, `upgrade`, `rarity`, `kills`, `disabled_time`, `free_reroll`, `monster_list`) VALUES
(6, 0, 2, '0', 0, 1, '0', 0, 1728330232001, 0xe0050400e205210049071a014d0007028201),
(6, 1, 2, '0', 0, 1, '0', 0, 1728330232001, 0xd5081b034000f60115023f0009003400dd00),
(6, 2, 0, '0', 0, 1, '0', 0, 1728330232001, ''),
(7, 0, 2, '0', 0, 1, '0', 0, 1724966605046, 0xe5058b06760273017900da08880150002805),
(7, 1, 2, '0', 0, 1, '0', 0, 1724966605046, 0x2701ca013b0074003308ab073000cf032f00),
(7, 2, 0, '0', 0, 1, '0', 0, 1724966605046, ''),
(8, 0, 2, '0', 0, 1, '0', 0, 1725490873402, 0x82011b0734007d00f507dc084d0196031d01),
(8, 1, 2, '0', 0, 1, '0', 0, 1725490873402, 0xcf01dd0803032b0837000903ab07d2041204),
(8, 2, 0, '0', 0, 1, '0', 0, 1725490873402, ''),
(14, 0, 2, '0', 0, 1, '0', 0, 1729290098898, 0xf50017010d02fb05ef06920348013a007301),
(14, 1, 2, '0', 0, 1, '0', 0, 1729290098898, 0xc2023200d700280578067b040b0029053b08),
(14, 2, 0, '0', 0, 1, '0', 0, 1729290098898, ''),
(15, 0, 2, '0', 0, 1, '0', 0, 1729290113832, 0x49004e001a0129006c00220915003900da00),
(15, 1, 2, '0', 0, 1, '0', 0, 1729290113832, 0x290964000e04d2083500fe014201d7004809),
(15, 2, 0, '0', 0, 1, '0', 0, 1729290113832, ''),
(16, 0, 2, '0', 0, 1, '0', 0, 1729879148836, 0xfa032a0546016400e008a102d00176004c01),
(16, 1, 2, '0', 0, 1, '0', 0, 1729879148836, 0x2609f0009f05490115005c0936000001db00),
(16, 2, 0, '0', 0, 1, '0', 0, 1729879148836, ''),
(17, 0, 2, '0', 0, 1, '0', 0, 1729882235505, 0xbb0696031700fa0097034f002a0098098b04),
(17, 1, 2, '0', 0, 1, '0', 0, 1729882235505, 0xe708e5059b052f003b08f7001a004801e005),
(17, 2, 0, '0', 0, 1, '0', 0, 1729882235505, ''),
(19, 0, 2, '0', 0, 1, '0', 0, 1733745664736, 0x22007602fe008a07be0339001b073d011a00),
(19, 1, 2, '0', 0, 1, '0', 0, 1733745664736, 0x33080a007802d50874009d05d6003e001002),
(19, 2, 0, '0', 0, 1, '0', 0, 1733745664736, ''),
(20, 0, 2, '0', 0, 1, '0', 0, 1733618926443, 0x64003d01160005007902e5084e003a012909),
(20, 1, 2, '0', 0, 1, '0', 0, 1733618926443, 0xe1009a09f6017100dd00cd02df0086062109),
(20, 2, 0, '0', 0, 1, '0', 0, 1733618926443, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_wheeldata`
--

CREATE TABLE `player_wheeldata` (
  `player_id` int(11) NOT NULL,
  `slot` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `player_wheeldata`
--

INSERT INTO `player_wheeldata` (`player_id`, `slot`) VALUES
(7, 0x0100000200000300000400000500000600000700000800000900000a00000b00000c00000d00000e00000f00001000001100001200001300001400001500001600001700001800001900001a00001b00001c00001d00001e00001f0000200000210000220000230000240000),
(15, 0x0100000200000300000400000500000600000700000800000900000a00000b00000c00000d00000e00000f00001000001100001200001300001400001500001600001700001800001900001a00001b00001c00001d00001e00001f0000200000210000220000230000240000),
(17, 0x0100000200000300000400000500000600000700000800000900000a00000b00000c00000d00000e00000f00001000001100001200001300001400001500001600001700001800001900001a00001b00001c00001d00001e00001f0000200000210000220000230000240000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `server_config`
--

CREATE TABLE `server_config` (
  `config` varchar(50) NOT NULL,
  `value` varchar(256) NOT NULL DEFAULT '',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `server_config`
--

INSERT INTO `server_config` (`config`, `value`, `timestamp`) VALUES
('db_version', '47', '2024-12-08 07:48:55'),
('motd_hash', '549967333cce7eb84b36997a7a3adf3efecdc1ef', '2024-12-08 08:20:53'),
('motd_num', '3', '2024-12-08 08:20:53'),
('players_record', '4', '2024-10-24 22:01:34');

-- --------------------------------------------------------

--
-- Estrutura para tabela `status`
--

CREATE TABLE `status` (
  `id` smallint(8) NOT NULL,
  `status` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `account` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `points` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `codigo` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `chave` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `processed` int(10) NOT NULL DEFAULT 0,
  `item` int(11) DEFAULT NULL,
  `item_status` text NOT NULL,
  `item_date` text DEFAULT NULL,
  `player_id` int(255) NOT NULL,
  `player_name` text NOT NULL,
  `referral` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `status`
--

INSERT INTO `status` (`id`, `status`, `account`, `points`, `codigo`, `chave`, `processed`, `item`, `item_status`, `item_date`, `player_id`, `player_name`, `referral`) VALUES
(433, 'delivered', '2', '0', '96768976123', '0', 1, 49461, 'approved', '1734818785', 7, '[GM] Under', ''),
(435, 'delivered', '2', '0', '96768553777', '0', 1, 60168, 'delivered', '1735050893', 7, '[GM] Under', ''),
(436, 'delivered', '2', '0', '97121067200', '0', 1, 60169, 'delivered', '1734878008', 7, '[GM] Under', ''),
(438, 'delivered', '2', '0', '96771336583', '0', 1, 60168, 'delivered', '1735050893', 7, '[GM] Under', ''),
(449, 'delivered', '2', '250', '96809595049', '0', 1, 0, 'failed', '1734891558', 7, '', ''),
(453, 'delivered', '2', '0', '96810240707', '0', 1, 60168, 'delivered', '1735050893', 7, '[GM] Under', ''),
(454, 'delivered', '2', '10', '97161582366', '0', 1, 0, 'failed', '1734891558', 7, '', ''),
(460, 'delivered', '2', '0', '97162516856', '0', 1, 60168, 'delivered', '1735050893', 7, '[GM] Under', ''),
(461, 'delivered', '2', '50', '97162984408', '0', 1, 0, 'failed', '1734891558', 7, '', ''),
(462, 'delivered', '2', '50', '97162545734', '0', 1, 0, 'failed', '1734891558', 7, '', ''),
(463, 'delivered', '2', '10', '97163277004', '0', 1, 0, 'failed', '1734891558', 7, '', ''),
(464, 'delivered', '2', '10', '96812837871', '0', 1, 0, 'failed', '1734891558', 7, '', ''),
(465, 'pending', '2', '10', '97164521296', '0', 0, 0, 'failed', '1734891558', 7, '', ''),
(466, 'delivered', '2', '10', '96813940709', '0', 1, 0, 'failed', '1734891558', 7, '', ''),
(467, 'delivered', '2', '0', '96813697541', '0', 1, 60168, 'delivered', '1735050893', 7, '[GM] Under', ''),
(469, 'delivered', '2', '0', '97168013232', '0', 1, 60168, 'delivered', '1735050893', 7, '[GM] Under', ''),
(470, 'delivered', '2', '0', '97168832870', '0', 1, 60168, 'delivered', '1735050893', 7, '[GM] Under', ''),
(471, 'delivered', '2', '0', '97169879438', '0', 1, 60168, 'delivered', '1735050893', 7, '[GM] Under', ''),
(472, 'delivered', '2', '0', '97170157252', '0', 1, 60169, 'delivered', '1734878008', 7, '[GM] Under', ''),
(473, 'delivered', '2', '0', '97170094084', '0', 1, 60168, 'delivered', '1735050893', 7, '[GM] Under', ''),
(474, 'delivered', '2', '10', '97170368012', '0', 1, 0, 'failed', '1734891558', 7, '', ''),
(475, 'delivered', '2', '10', '96819453421', '0', 1, 0, 'failed', '1734891558', 7, '', ''),
(476, 'delivered', '2', '50', '97171816138', '0', 1, 0, 'failed', '1734891558', 7, '', ''),
(477, 'delivered', '2', '10', '97182923096', '0', 1, 0, 'failed', '1734891558', 7, '', ''),
(478, 'pending', '2', '10', '97184702778', '0', 0, 0, 'failed', '1734891558', 7, '', ''),
(479, 'delivered', '2', '10', '97187983374', '0', 1, 0, 'failed', '1734891558', 7, '', ''),
(480, 'delivered', '2', '10', '97188233878', '0', 1, 0, 'failed', '1734891558', 7, '', ''),
(481, 'delivered', '2', '50', '97189124430', '0', 1, 0, 'failed', '1734891558', 7, '', ''),
(482, 'delivered', '2', '10', '97189678358', '0', 1, 0, 'failed', '1734891558', 7, '', ''),
(483, 'pending', '2', '0', '96837686003', '0', 0, 60168, 'delivered', '1735050893', 7, '[GM] Under', ''),
(484, 'pending', '2', '10', '96838353845', '0', 0, 0, 'pending', NULL, 7, '', ''),
(485, 'delivered', '2', '0', '96838455657', '0', 1, 60168, 'delivered', '1735050893', 7, '[GM] Under', ''),
(486, 'delivered', '2', '0', '97191419930', '0', 1, 60168, 'delivered', '1735050893', 7, '[GM] Under', ''),
(487, 'pending', '2', '10', '97191997622', '0', 0, 0, 'pending', NULL, 7, '', ''),
(488, 'delivered', '2', '0', '97022724955', '0', 1, 60168, 'delivered', '1735051564', 7, '[GM] Under', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `store_history`
--

CREATE TABLE `store_history` (
  `id` int(11) NOT NULL,
  `account_id` int(11) UNSIGNED NOT NULL,
  `mode` smallint(2) NOT NULL DEFAULT 0,
  `description` varchar(3500) NOT NULL,
  `coin_type` tinyint(1) NOT NULL DEFAULT 0,
  `coin_amount` int(12) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `coins` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `store_history`
--

INSERT INTO `store_history` (`id`, `account_id`, `mode`, `description`, `coin_type`, `coin_amount`, `time`, `timestamp`, `coins`) VALUES
(1, 2, 0, 'Roulette Token', 0, -10, 1724961979, 0, 0),
(2, 2, 0, 'Roulette Token', 0, -150, 1725159143, 0, 0),
(3, 1, 0, 'Great Health Potion', 1, -41, 1728257529, 0, 0),
(4, 1, 0, 'Roulette Token', 1, -10, 1728258180, 0, 0),
(5, 2, 0, 'Kitchen Chest', 1, -50, 1729654652, 0, 0),
(6, 2, 0, '360 Days of VIP', 1, -3000, 1729661782, 0, 0),
(7, 2, 0, 'Gold Pouch', 1, -900, 1729822669, 0, 0),
(8, 2, 0, 'Loot Seller', 1, -500, 1730081403, 0, 0),
(9, 2, 0, 'Loot Seller', 1, -500, 1730092205, 0, 0),
(10, 2, 0, 'Loot Seller', 1, -500, 1733494295, 0, 0),
(11, 2, 0, 'Charm', 1, -200, 1733494317, 0, 0),
(12, 2, 0, 'glass of goo gift', 1, 1500, 1733510080, 0, 0),
(13, 2, 0, 'glass of goo gift, because you already have full NAME outfit', 1, 100, 1733510080, 0, 0),
(14, 2, 0, 'glass of goo gift', 1, 1500, 1733510180, 0, 0),
(15, 2, 0, 'glass of goo gift, because you already have full NAME outfit', 1, 100, 1733510180, 0, 0),
(16, 2, 0, 'glass of goo gift', 1, 1500, 1733510251, 0, 0),
(17, 2, 0, 'glass of goo gift, because you already have full NAME outfit', 1, 100, 1733510251, 0, 0),
(18, 2, 0, 'glass of goo gift', 1, 1500, 1733510264, 0, 0),
(19, 2, 0, 'glass of goo gift, because you already have full NAME outfit', 1, 100, 1733510264, 0, 0),
(20, 2, 0, 'glass of goo gift', 1, 1500, 1733510591, 0, 0),
(21, 2, 0, 'glass of goo gift, because you already have full NAME outfit', 1, 100, 1733510591, 0, 0),
(22, 2, 0, 'glass of goo gift', 1, 1500, 1733510881, 0, 0),
(23, 2, 0, 'glass of goo gift, because you already have full NAME outfit', 1, 100, 1733510881, 0, 0),
(24, 2, 0, 'glass of goo gift', 1, 1500, 1733511066, 0, 0),
(25, 2, 0, 'glass of goo gift, because you already have full NAME outfit', 1, 100, 1733511066, 0, 0),
(26, 2, 0, 'glass of goo gift', 1, 1500, 1733511169, 0, 0),
(27, 2, 0, 'glass of goo gift, because you already have full NAME outfit', 1, 100, 1733511169, 0, 0),
(28, 2, 0, 'Portable Trader Streamer', 1, -500, 1733547640, 0, 0),
(29, 2, 0, 'glass of goo gift', 1, 1500, 1733550363, 0, 0),
(30, 2, 0, 'glass of goo gift, because you already have full NAME outfit', 1, 100, 1733550363, 0, 0),
(31, 2, 0, 'Charm', 1, -200, 1733550443, 0, 0),
(32, 2, 0, 'aurora\'s collection gift', 1, 1500, 1733550805, 0, 0),
(33, 2, 0, 'aurora\'s collection gift, because you already have full NAME outfit', 1, 100, 1733550805, 0, 0),
(34, 2, 0, 'aurora\'s collection gift', 1, 1500, 1733550965, 0, 0),
(35, 2, 0, 'aurora\'s collection gift', 1, 1500, 1733551047, 0, 0),
(36, 2, 0, 'aurora\'s backpack gift', 1, 1500, 1733627296, 0, 0),
(37, 2, 0, 'Loot Seller', 1, -500, 1733728037, 0, 0),
(38, 2, 0, 'XP Boost', 1, -30, 1733728094, 0, 0),
(39, 2, 0, 'aurora\'s collection gift', 1, 1500, 1734539430, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `stripe`
--

CREATE TABLE `stripe` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `points` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `api_version` varchar(255) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `stripe`
--

INSERT INTO `stripe` (`id`, `account_id`, `email`, `points`, `price`, `currency`, `payment_id`, `api_version`, `created`) VALUES
(1, 2, 'aa@aa.com', 1000, 50, 'USD', 'cs_test_a1kTp4mtGNq5mWmBGY0Ga1k8MXMmILxdbwYY6idpmqGUyFiQB0fse2sKPh', '2024-06-20', '2024-10-15 09:35:07'),
(2, 2, 'teste@gmaiol.ccom', 1000, 50, 'USD', 'cs_test_a1ManNggfNzWoRxoTKra2UYGw9DfpoJ76mwUN1IKViOrKJnInHNRtTHQiO', '2024-06-20', '2024-10-15 09:37:22');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tile_store`
--

CREATE TABLE `tile_store` (
  `house_id` int(11) NOT NULL,
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tile_store`
--

INSERT INTO `tile_store` (`house_id`, `data`) VALUES
(2632, 0xb47f9e7b0701000000311900),
(2632, 0xb27f9e7b0701000000371800),
(2649, 0x8e7fa77b0701000000311900),
(2650, 0x807fae7b0701000000311900),
(2651, 0x8d7fad7b0701000000311900),
(2651, 0x8d7fb37b0701000000311900),
(2652, 0x817fbe7b0701000000311900),
(2653, 0x7f7fc97b0701000000331900),
(2654, 0xb07fc67b0701000000351800),
(2655, 0xaa7fbb7b0701000000321900),
(2655, 0xa37fba7b0701000000321900),
(2822, 0x687fb37c0501000000251e00),
(2823, 0x667fad7c0501000000251e00),
(2824, 0x607fb17c0501000000271e00),
(2825, 0x647fb47c0501000000271e00),
(2826, 0x5c7fad7c0501000000251e00),
(2827, 0x5c7fb37c0501000000251e00),
(2859, 0x647fb07c0401000000271e00),
(2860, 0x5d7fb57c04010000005c0b00),
(2860, 0x5f7fb27c0401000000271e00),
(2860, 0x617fb27c04010000005e0b00),
(2860, 0x667fb27c04010000005e0b00),
(2862, 0x597faf7c0401000000251e00),
(2863, 0x527fb47c0401000000251e00),
(2880, 0x577fcd7c0401000000271e00),
(2880, 0x577fce7c0501000000271e00),
(2880, 0x587fcf7c0401000000251e00),
(2880, 0x517fd17c0401000000271e00),
(2880, 0x547fd17c0401000000271e00),
(2880, 0x4e7fd17c0501000000271e00),
(2880, 0x507fd17c0501000000260a00),
(2880, 0x517fd17c0501000000260a00),
(2880, 0x537fd17c0501000000271e00),
(2880, 0x527fd17c0601000000271e00),
(2880, 0x567fd17c0601000000271e00),
(2880, 0x4f7fd27c0601000000251e00),
(2880, 0x4c7fd37c0501000000251e00),
(2880, 0x527fd37c0601000000271e00),
(2880, 0x4e7fd47c0501000000271e00),
(2880, 0x577fd47c0501000000271e00),
(2880, 0x4c7fd67c0501000000251e00),
(2880, 0x4f7fd57c0601000000251e00),
(2881, 0x797e017e0701000000680600),
(2881, 0x7a7e017e07010000005d0b00),
(2881, 0x777e047e07010000005c0b00),
(2882, 0x7c7e047e07010000005b0b00),
(2882, 0x7e7e017e0701000000680600),
(2882, 0x7f7e017e07010000005d0b00),
(2882, 0x817e047e07010000005b0b00),
(2882, 0x7e7e067e0701000000231900),
(2883, 0x777e087e0701000000660600),
(2883, 0x777e097e07010000005b0b00),
(2883, 0x7b7e0b7e07010000005d0b00),
(2883, 0x7c7e097e0701000000241900),
(2883, 0x7a7e067e07010000005d0b00),
(2884, 0x837e037e07010000005b0b00),
(2884, 0x867e017e0701000000231900),
(2884, 0x877e017e07010000005d0b00),
(2884, 0x887e047e0701000000241900),
(2884, 0x837e057e0701000000660600),
(2885, 0x867e067e07010000005d0b00),
(2885, 0x837e087e0701000000241900),
(2885, 0x837e097e07010000005b0b00),
(2885, 0x887e097e0701000000241900),
(2885, 0x837e0a7e0701000000241900),
(2885, 0x837e0c7e0701000000660600),
(2886, 0x857e0d7e07010000005d0b00),
(2886, 0x827e0d7e0701000000680600),
(2887, 0x817e107e07010000005b0b00),
(2887, 0x7e7e0d7e0701000000680600),
(2887, 0x807e0d7e0701000000231900),
(2888, 0x777e107e07010000005b0b00),
(2888, 0x797e0d7e0701000000680600),
(2888, 0x7b7e0d7e0701000000231900),
(2888, 0x7c7e107e07010000005b0b00),
(2889, 0x7e7e017e0601000000680600),
(2889, 0x7f7e017e06010000005d0b00),
(2889, 0x817e057e06010000005b0b00),
(2889, 0x807e067e0601000000231900),
(2889, 0x7e7e067e0601000000231900),
(2890, 0x797e017e0601000000680600),
(2890, 0x7a7e017e06010000005d0b00),
(2891, 0x797e0b7e0601000000680600),
(2891, 0x7c7e0a7e0601000000241900),
(2891, 0x7c7e087e0601000000241900),
(2891, 0x7a7e067e06010000005d0b00),
(2892, 0x867e017e0601000000231900),
(2892, 0x877e017e06010000005d0b00),
(2892, 0x887e037e0601000000241900),
(2892, 0x887e047e0601000000660600),
(2892, 0x837e057e0601000000660600),
(2893, 0x867e067e06010000005d0b00),
(2893, 0x837e087e0601000000241900),
(2893, 0x887e087e0601000000241900),
(2893, 0x887e097e0601000000660600),
(2893, 0x887e0b7e0601000000241900),
(2893, 0x837e0a7e0601000000241900),
(2893, 0x837e0b7e06010000005b0b00),
(2893, 0x837e0c7e0601000000660600),
(2894, 0x867e0d7e06010000005d0b00),
(2894, 0x857e127e0601000000680600),
(2894, 0x837e127e0601000000231900),
(2894, 0x827e0d7e0601000000680600),
(2895, 0x7e7e0d7e0601000000680600),
(2895, 0x7e7e127e0601000000231900),
(2895, 0x7f7e127e0601000000680600),
(2895, 0x817e107e06010000005b0b00),
(2895, 0x7f7e0d7e06010000005d0b00),
(2895, 0x807e0d7e0601000000231900),
(2896, 0x797e0d7e0601000000680600),
(2896, 0x797e127e0601000000231900),
(2896, 0x7a7e0d7e06010000005d0b00),
(2896, 0x7a7e127e0601000000680600),
(2896, 0x7b7e0d7e0601000000231900),
(2897, 0x7e7e017e0501000000680600),
(2897, 0x7e7e067e0501000000231900),
(2897, 0x7f7e017e05010000005d0b00),
(2897, 0x817e057e05010000005b0b00),
(2897, 0x807e067e0501000000231900),
(2898, 0x797e017e0501000000680600),
(2898, 0x7a7e017e05010000005d0b00),
(2899, 0x7a7e067e05010000005d0b00),
(2899, 0x797e0b7e0501000000680600),
(2899, 0x7c7e087e0501000000241900),
(2899, 0x7c7e0a7e0501000000241900),
(2900, 0x797e127e0501000000231900),
(2900, 0x7a7e127e0501000000680600),
(2900, 0x797e0d7e0501000000680600),
(2900, 0x7a7e0d7e05010000005d0b00),
(2900, 0x7b7e0d7e0501000000231900),
(2901, 0x7e7e127e0501000000231900),
(2901, 0x7f7e127e0501000000680600),
(2901, 0x7e7e0d7e0501000000680600),
(2901, 0x7f7e0d7e05010000005d0b00),
(2901, 0x807e0d7e0501000000231900),
(2902, 0x857e127e0501000000680600),
(2902, 0x837e127e0501000000231900),
(2902, 0x817e107e05010000005b0b00),
(2902, 0x827e0d7e0501000000680600),
(2903, 0x837e087e0501000000241900),
(2903, 0x887e087e0501000000241900),
(2903, 0x887e097e0501000000660600),
(2903, 0x887e0b7e0501000000241900),
(2903, 0x867e0d7e05010000005d0b00),
(2903, 0x837e0a7e0501000000241900),
(2903, 0x837e0b7e05010000005b0b00),
(2903, 0x837e0c7e0501000000660600),
(2904, 0x837e057e0501000000660600),
(2904, 0x867e017e0501000000231900),
(2904, 0x877e017e05010000005d0b00),
(2904, 0x887e037e0501000000241900),
(2904, 0x887e047e0501000000660600),
(2904, 0x867e067e05010000005d0b00),
(2905, 0x3b7ef37d0701000000241900),
(2905, 0x3b7ef47d07010000005b0b00),
(2905, 0x3b7ef57d0701000000660600),
(2905, 0x3d7ef67d0701000000231900),
(2905, 0x3f7ef47d0701000000241900),
(2906, 0x3b7ef07d0701000000660600),
(2918, 0x7a7eeb7d0701000000231900),
(2918, 0x787eea7d07010000005b0b00),
(2918, 0x787ee77d07010000005b0b00),
(2918, 0x787ee87d07010000002d0a00),
(2918, 0x787ee97d07010000002d0a00),
(2918, 0x7b7ee87d0701000000220900),
(2918, 0x7d7ee87d0701000000660600),
(2919, 0x787ee87d06010000002d0a00),
(2919, 0x787ee97d06010000002d0a00),
(2919, 0x787eea7d06010000005b0b00),
(2919, 0x7b7ee87d0601000000220900),
(2919, 0x787ee77d06010000005b0b00),
(2919, 0x7d7ee87d06010000005c0b00),
(2919, 0x7d7ee97d0601000000660600),
(2920, 0x787ee77d08010000005b0b00),
(2920, 0x787ee87d08010000002d0a00),
(2920, 0x787ee97d08010000002d0a00),
(2920, 0x787eea7d08010000005b0b00),
(2941, 0x4f7ede7d0701000000f51300),
(2941, 0x4e7ee17d0701000000271900),
(2941, 0x4d7edf7d0701000000220900),
(2941, 0x4d7ee17d0701000000271900),
(2941, 0x4b7ede7d07010000002d0a00),
(2941, 0x4b7ee07d0701000000f51300),
(2941, 0x4b7edf7d07010000002d0a00),
(2942, 0x537ed27d0701000000220900),
(2942, 0x517ed27d0701000000660600),
(2942, 0x517ed37d07010000005b0b00),
(2942, 0x527ed07d0701000000680600),
(2942, 0x537ed07d07010000005d0b00),
(2942, 0x547ed07d0701000000260a00),
(2942, 0x557ed07d0701000000260a00),
(2942, 0x547ecc7d07010000005d0b00),
(2943, 0x477ed47d0601000000690600),
(2943, 0x4a7ed07d0701000000660600),
(2943, 0x477ecf7d0701000000680600),
(2943, 0x4d7ed07d0601000000660600),
(2943, 0x447ed17d0701000000241900),
(2944, 0x4b7e017e0701000000660600),
(2944, 0x467e007e0701000000241900),
(2944, 0x467e017e07010000005b0b00),
(2945, 0x5d7e0d7e07010000005b0b00),
(2945, 0x5f7e0e7e0601000000231900),
(2945, 0x5d7e0d7e06010000005b0b00),
(2945, 0x607e0d7e0601000000660600),
(2945, 0x5f7e0b7e0601000000680600),
(2945, 0x5d7e097e07010000005b0b00),
(2945, 0x607e077e06010000005d0b00),
(2945, 0x617e077e0601000000231900),
(2945, 0x647e077e06010000005d0b00),
(2945, 0x657e097e0701000000660600),
(2945, 0x647e077e0701000000680600),
(2945, 0x647e0a7e0701000000231900),
(2945, 0x647e0a7e0601000000231900),
(2945, 0x637e077e07010000005d0b00),
(2945, 0x627e097e0701000000660600),
(2945, 0x627e0c7e0701000000660600),
(2945, 0x627e097e0601000000660600),
(2945, 0x607e077e0701000000231900),
(2945, 0x607e0e7e0701000000231900),
(2946, 0x6c7e077e06010000005d0b00),
(2946, 0x6d7e077e0601000000231900),
(2946, 0x707e077e06010000005d0b00),
(2946, 0x6c7e077e0701000000231900),
(2946, 0x6f7e077e07010000005d0b00),
(2946, 0x707e077e0701000000680600),
(2946, 0x6e7e097e0601000000660600),
(2946, 0x707e0a7e0601000000231900),
(2946, 0x697e097e07010000005b0b00),
(2946, 0x6e7e097e0701000000660600),
(2946, 0x717e097e0701000000660600),
(2946, 0x6b7e0b7e0601000000680600),
(2946, 0x707e0a7e0701000000231900),
(2946, 0x697e0d7e06010000005b0b00),
(2946, 0x6c7e0d7e0601000000660600),
(2946, 0x6e7e0c7e0701000000660600),
(2946, 0x6b7e0e7e0601000000231900),
(2946, 0x697e0d7e07010000005b0b00),
(2946, 0x6c7e0e7e0701000000231900),
(2947, 0x7a7ee47d0701000000660600),
(2947, 0x777ee37d07010000005b0b00),
(2947, 0x7a7ee37d07010000002d0a00),
(2947, 0x7a7ee27d07010000002d0a00),
(2947, 0x7a7ee17d07010000005b0b00),
(2947, 0x7a7ee07d0701000000660600),
(2947, 0x7b7ee57d07010000005d0b00),
(2947, 0x7d7ede7d07010000005d0b00),
(2947, 0x7d7ee17d0701000000240900),
(2948, 0x7a7ede7d0601000000660600),
(2948, 0x7a7edd7d06010000005b0b00),
(2948, 0x7f7edc7d0601000000241900),
(2948, 0x7e7eda7d06010000005d0b00),
(2948, 0x7d7eda7d0601000000260a00),
(2948, 0x7d7edd7d0601000000240900),
(2948, 0x7c7eda7d0601000000260a00),
(2949, 0x7b7ee57d06010000005d0b00),
(2949, 0x7a7ee47d0601000000660600),
(2949, 0x777ee37d06010000005b0b00),
(2949, 0x7a7ee37d06010000002d0a00),
(2949, 0x7a7ee27d06010000002d0a00),
(2949, 0x7a7ee17d06010000005b0b00),
(2949, 0x7a7ee07d0601000000660600),
(2949, 0x7d7edf7d06010000005e0b00),
(2949, 0x7d7ee17d0601000000240900),
(2949, 0x7f7ee17d0601000000241900),
(2949, 0x7f7ee37d0601000000241900),
(2952, 0x9b7ebf7d0701000000231900),
(2964, 0x4c7ee87d0701000000660600),
(2964, 0x4a7ee57d0701000000251900),
(2964, 0x4b7ee57d07010000005d0b00),
(2965, 0x4c7eed7d0701000000660600),
(2965, 0x4c7eea7d07010000005b0b00),
(2965, 0x4a7eea7d07010000005e0b00),
(2965, 0x4a7eef7d07010000005d0b00),
(2966, 0x4d7ef47d0701000000660600),
(2966, 0x4d7ef27d07010000005b0b00),
(2966, 0x4b7ef17d07010000005d0b00),
(2966, 0x497ef47d0701000000241900),
(2967, 0x4c7ee87d0601000000660600),
(2968, 0x4c7eed7d0601000000660600),
(2968, 0x4c7eea7d06010000005b0b00),
(2969, 0x4d7ef47d0601000000660600),
(2969, 0x4d7ef27d06010000005b0b00),
(2969, 0x497ef57d0601000000261900),
(2970, 0x4b7efb7d0601000000231900),
(2970, 0x4c7efb7d0601000000231900),
(2970, 0x4d7ef97d0601000000660600),
(2970, 0x4d7ef77d06010000005b0b00),
(2970, 0x497ef87d0601000000241900),
(2970, 0x497ef97d06010000005b0b00),
(2970, 0x497efa7d0601000000241900),
(2971, 0x4c7ee87d0501000000660600),
(2972, 0x4c7eea7d05010000005b0b00),
(2972, 0x4c7eed7d0501000000660600),
(2973, 0x4d7ef47d0501000000660600),
(2973, 0x4d7ef27d05010000005b0b00),
(2974, 0x4c7efb7d0501000000231900),
(2974, 0x4d7ef97d0501000000660600),
(2974, 0x4d7ef77d05010000005b0b00),
(2975, 0x4f7e0c7e0601000000241900),
(2975, 0x4f7e097e0601000000241900),
(2975, 0x4f7e067e0601000000241900),
(2975, 0x4d7e0e7e0601000000231900),
(2975, 0x4f7e037e0601000000241900),
(2975, 0x4b7e007e0601000000680600),
(2975, 0x4d7e007e06010000005d0b00),
(2975, 0x4c7eff7d0601000000660600),
(2975, 0x4b7efd7d06010000005d0b00),
(2975, 0x467e037e0601000000241900),
(2975, 0x467e047e06010000005b0b00),
(2975, 0x467e067e0601000000241900),
(2975, 0x467e077e06010000005b0b00),
(2975, 0x467e097e0601000000241900),
(2975, 0x467e0b7e06010000005b0b00),
(2975, 0x467e0c7e0601000000241900),
(2975, 0x487e007e0601000000680600),
(2975, 0x497e007e06010000005d0b00),
(2975, 0x497e0e7e0601000000231900),
(2975, 0x4a7efd7d0601000000231900),
(2975, 0x497efd7d0601000000231900),
(2975, 0x487efd7d06010000005d0b00),
(2975, 0x467efe7d06010000002d0a00),
(2975, 0x467eff7d06010000002d0a00),
(2976, 0xa27ebf7d0701000000231900),
(2976, 0xa47eb97d07010000005d0b00),
(2976, 0xa57ebb7d0701000000241900),
(2980, 0xa67ec67d0701000000660600),
(2980, 0xa67ec57d0701000000241900),
(2980, 0xa47ec87d07010000005d0b00),
(2980, 0xa67ec77d0701000000241900),
(2985, 0x9d7e037e0701000000241900),
(2986, 0x8c7e037e0601000000241900),
(2986, 0x8d7e017e06010000005d0b00),
(2986, 0x8d7e027e07010000005b0b00),
(2986, 0x8e7e017e0701000000680600),
(2986, 0x8f7e017e0601000000231900),
(2986, 0x8f7e017e0701000000231900),
(2986, 0x907e037e0601000000660600),
(2986, 0x907e047e06010000005b0b00),
(2986, 0x8c7e047e0701000000660600),
(2986, 0x8e7e057e0601000000231900),
(2986, 0x8f7e057e0601000000231900),
(2986, 0x8e7e057e0701000000231900),
(2986, 0x8f7e057e0701000000231900),
(2986, 0x907e047e0701000000660600),
(2986, 0x907e067e07010000005b0b00),
(2986, 0x907e077e0701000000241900),
(2986, 0x937e017e0701000000231900),
(2986, 0x947e017e0701000000231900),
(2986, 0x927e087e0701000000231900),
(2986, 0x957e037e0701000000241900),
(2986, 0x957e057e0701000000241900),
(2987, 0x687efd7d0701000000680600),
(2987, 0x697eff7d0701000000660600),
(2987, 0x687e007e0701000000231900),
(2987, 0x677efd7d07010000005d0b00),
(2987, 0x687efd7d06010000005d0b00),
(2987, 0x687e007e0601000000231900),
(2987, 0x667eff7d0701000000660600),
(2987, 0x667e027e0701000000660600),
(2987, 0x667eff7d0601000000660600),
(2987, 0x647efd7d0701000000231900),
(2987, 0x657efd7d0601000000231900),
(2987, 0x647efd7d06010000005d0b00),
(2987, 0x647e037e0601000000660600),
(2987, 0x637e017e0601000000680600),
(2987, 0x617eff7d07010000005b0b00),
(2987, 0x617e037e06010000005b0b00),
(2987, 0x637e047e0601000000231900),
(2987, 0x617e037e07010000005b0b00),
(2987, 0x647e047e0701000000231900),
(2988, 0x587e047e0701000000231900),
(2988, 0x557e037e07010000005b0b00),
(2988, 0x577e047e0601000000231900),
(2988, 0x5a7e027e0701000000660600),
(2988, 0x557e037e06010000005b0b00),
(2988, 0x587e037e0601000000660600),
(2988, 0x577e017e0601000000680600),
(2988, 0x557eff7d07010000005b0b00),
(2988, 0x5a7eff7d0701000000660600),
(2988, 0x5c7e007e0601000000231900),
(2988, 0x5a7eff7d0601000000660600),
(2988, 0x587efd7d0701000000231900),
(2988, 0x5b7efd7d07010000005d0b00),
(2988, 0x587efd7d06010000005d0b00),
(2988, 0x597efd7d0601000000231900),
(2988, 0x5c7efd7d06010000005d0b00),
(2988, 0x5c7efd7d0701000000680600),
(2988, 0x5c7e007e0701000000231900),
(2988, 0x5d7eff7d0701000000660600),
(2989, 0xa37efc7d0701000000231900),
(2989, 0xa17efb7d07010000005b0b00),
(2994, 0x9b7ee97d0701000000241900),
(2994, 0x9d7ee77d07010000005d0b00),
(2994, 0xa07ee97d0701000000241900),
(2994, 0x9e7ee77d0701000000231900),
(2995, 0xa37eec7d0701000000680600),
(2995, 0xa17ee97d0701000000241900),
(2995, 0xa47ee77d0701000000231900),
(2996, 0xa37ef47d0701000000231900),
(2998, 0x9a7edb7d06010000005b0b00),
(2998, 0x9a7edc7d0601000000241900),
(2999, 0x9a7edf7d06010000005b0b00),
(2999, 0x9a7ee07d0601000000241900),
(3002, 0x9f7ee07d0701000000241900),
(3002, 0x9f7edf7d0701000000660600),
(3004, 0x5d7ed47d0701000000680600),
(3004, 0x5e7ed27d0601000000680600),
(3004, 0x5c7ed47d0701000000690600),
(3004, 0x5c7ed27d06010000005e0b00),
(3004, 0x5b7ed27d0601000000231900),
(3004, 0x587ece7d07010000005b0b00),
(3004, 0x5d7ed07d0601000000660600),
(3004, 0x5a7ece7d0701000000220900),
(3004, 0x5d7ecf7d06010000005c0b00),
(3004, 0x5f7ecf7d0601000000241900),
(3004, 0x577ece7d0601000000231900),
(3004, 0x5d7ecd7d0601000000660600),
(3004, 0x597ecb7d0701000000680600),
(3004, 0x5c7ecb7d0701000000680600),
(3004, 0x5d7ecb7d07010000005e0b00),
(3004, 0x5b7ed17d0701000000665b010e13ae9f93010000072b00556e7772617020697420696e20796f7572206f776e20686f75736520746f206372656174652061203c3e2e2901000000000000000800756e77726170696402000000000000000000),
(3004, 0x5b7ed07d0701000000c553010e13ae9f9301000000),
(3004, 0x5c7ed07d07010000008902010e13ae9f930100000f0100),
(3004, 0x5c7ed17d0701000000665b010e13ae9f93010000072b00556e7772617020697420696e20796f7572206f776e20686f75736520746f206372656174652061203c3e2e2901000000000000000800756e77726170696402000000000000000000),
(3004, 0x5d7ed17d0702000000f575170000000000260b2402170000000000),
(3004, 0x5b7ece7d07010000008902011b83b09f930100000f0100),
(3004, 0x5d7ece7d0703000000f575170000000000ab4b0185c2b19f930100000089020185c2b19f930100000f0100),
(3004, 0x5a7ecb7d06010000005d0b00),
(3004, 0x5f7ecb7d0601000000241900),
(3004, 0x5f7ec97d0701000000241900),
(3004, 0x577ec87d0701000000241900),
(3004, 0x5a7ec97d0601000000660600),
(3004, 0x5e7ec97d0601000000680600),
(3004, 0x5f7ec77d0701000000241900),
(3004, 0x577ec87d0601000000241900),
(3004, 0x5a7ec77d06010000005b0b00),
(3004, 0x5f7ec77d0601000000241900),
(3012, 0x897ef67d07010000005b0b00),
(3012, 0x897ef87d0701000000241900),
(3012, 0x897efa7d0701000000241900),
(3012, 0x897efc7d07010000005b0b00),
(3012, 0x8b7ef87d0601000000680600),
(3012, 0x8b7efa7d0601000000680600),
(3012, 0x8b7efd7d0601000000231900),
(3012, 0x8c7efa7d06010000005d0b00),
(3012, 0x8c7efd7d0701000000231900),
(3012, 0x8d7efd7d0701000000231900),
(3012, 0x8e7ef87d0601000000680600),
(3012, 0x8f7ef77d06010000005b0b00),
(3012, 0x8f7efa7d0601000000680600),
(3012, 0x8f7efd7d0601000000231900),
(3012, 0x8f7efa7d07010000005b0b00),
(3012, 0x8f7efb7d0701000000660600),
(3012, 0x907efa7d06010000005d0b00),
(3012, 0x917efd7d0701000000680600),
(3012, 0x937efd7d0601000000231900),
(3012, 0x937efb7d0701000000660600),
(3012, 0x937efc7d07010000005b0b00),
(3012, 0x897ef67d06010000005b0b00),
(3012, 0x8c7ef67d06010000005b0b00),
(3012, 0x957ef87d0701000000680600),
(3012, 0x917ef87d0701000000680600),
(3012, 0x927ef87d0701000000260a00),
(3014, 0x3b7e0c7e0701000000241900),
(3014, 0x3e7e0c7e07010000005b0b00),
(3014, 0x427e0c7e07010000005b0b00),
(3014, 0x457e0b7e08010000005c0b00),
(3014, 0x3d7e0d7e0701000000680600),
(3014, 0x437e0c7e08010000005b0b00),
(3014, 0x457e0c7e0801000000660600),
(3014, 0x427e0e7e0701000000660600),
(3014, 0x3b7e0c7e0601000000241900),
(3014, 0x3e7e0a7e06010000005d0b00),
(3014, 0x3f7e0c7e0601000000660600),
(3014, 0x3f7e0d7e06010000005d0b00),
(3014, 0x407e0d7e0601000000680600),
(3014, 0x427e0a7e06010000005d0b00),
(3014, 0x437e0d7e0601000000680600),
(3014, 0x447e0d7e06010000005d0b00),
(3014, 0x3b7e0f7e0601000000241900),
(3014, 0x3b7e0f7e0701000000241900),
(3014, 0x427e0f7e07010000002d0a00),
(3014, 0x457e0f7e0701000000241900),
(3014, 0x437e117e0601000000231900),
(3014, 0x3b7e107e07010000005b0b00),
(3014, 0x427e107e07010000005b0b00),
(3014, 0x457e107e0701000000660600),
(3014, 0x3b7e0f7e0501000000241900),
(3014, 0x3e7e117e0501000000231900),
(3014, 0x3f7e117e0501000000231900),
(3014, 0x447e117e0501000000231900),
(3014, 0x3e7e117e0401000000231900),
(3014, 0x437e117e0401000000231900),
(3014, 0x457e0f7e0401000000241900),
(3014, 0x437e0d7e0501000000680600),
(3014, 0x447e0d7e05010000005d0b00),
(3014, 0x457e0c7e0501000000241900),
(3014, 0x437e0d7e04010000005d0b00),
(3035, 0xcd80487d07010000005b0b00),
(3035, 0xcf80477d06010000009b4400),
(3035, 0xcf80457d0701000000274500),
(3036, 0xd380477d06010000009b4400),
(3042, 0xd2806e7d07010000005c0b00),
(3042, 0xd280747d07010000005c0b00),
(3042, 0xd6806b7d07010000005e0b00),
(3042, 0xd680717d07010000005e0b00),
(3042, 0xd8806e7d0701000000304500),
(3042, 0xd880717d07010000005c0b00),
(3042, 0xd880747d07010000005c0b00),
(3042, 0xd880757d0701000000304500),
(3042, 0xda806b7d07010000005e0b00),
(3042, 0xdb80737d0701000000274500),
(3042, 0xdc80737d07010000005e0b00),
(3042, 0xdd806b7d07010000005e0b00),
(3042, 0xd680707d0601000000a44400),
(3042, 0xd680747d0601000000a44400),
(3042, 0xd980707d0601000000a44400),
(3042, 0xd980747d0601000000a44400),
(3042, 0xdb806e7d06010000009b4400),
(3042, 0xd480717d05010000009b4400),
(3042, 0xd480737d05010000009b4400),
(3042, 0xd780717d05010000009b4400),
(3042, 0xd780737d05010000009b4400),
(3043, 0xe480707d07010000005c0b00),
(3044, 0xd480607d0601000000a44400),
(3044, 0xd6805d7d07010000005d0b00),
(3044, 0xd7805f7d0701000000304500),
(3045, 0xc7805e7d07010000005d0b00),
(3046, 0xcc805e7d07010000005e0b00),
(3220, 0x637fd37f0701000000391900),
(3220, 0x607fd37f0701000000391900),
(3362, 0xf1818e7e0701000000b71400),
(3362, 0xf181947e0701000000b71400),
(3362, 0xef818b7e0701000000b61400),
(3362, 0xef81907e07010000005e0b00),
(3368, 0xfa81907e07010000005e0b00),
(3368, 0xfe81907e07010000005e0b00),
(3368, 0xf981947e07010000008c1500),
(3368, 0xf981907e06010000005e0b00),
(3368, 0xfb81937e06010000008a1500),
(3368, 0xff81907e06010000005e0b00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `towns`
--

CREATE TABLE `towns` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `towns`
--

INSERT INTO `towns` (`id`, `name`, `posx`, `posy`, `posz`) VALUES
(1, 'Roulette', 1127, 1034, 5),
(2, 'Dawnport', 32064, 31894, 6),
(3, 'Rookgaard', 32097, 32219, 7),
(4, 'Island of Destiny', 32091, 32027, 7),
(5, 'Ab\'Dendriel', 32732, 31634, 7),
(6, 'Carlin', 32360, 31782, 7),
(7, 'Kazordoon', 32649, 31925, 11),
(8, 'Thais', 32369, 32241, 7),
(9, 'Venore', 32957, 32076, 7),
(10, 'Ankrahmun', 33194, 32853, 8),
(11, 'Edron', 33217, 31814, 8),
(12, 'Farmine', 33023, 31521, 11),
(13, 'Darashia', 33213, 32454, 1),
(14, 'Liberty Bay', 32317, 32826, 7),
(15, 'Port Hope', 32594, 32745, 7),
(16, 'Svargrond', 32212, 31132, 7),
(17, 'Yalahar', 32787, 31276, 7),
(18, 'Gray Beach', 33447, 31323, 9),
(19, 'Krailos', 33657, 31665, 8),
(20, 'Rathleton', 33594, 31899, 6),
(21, 'Roshamuul', 33513, 32363, 6),
(22, 'Issavi', 33921, 31477, 5),
(23, 'Event Room', 1062, 1024, 7),
(24, 'Cobra Bastion', 33397, 32651, 7),
(25, 'Bounac', 32424, 32445, 7),
(26, 'Feyrist', 33490, 32221, 7),
(27, 'Gnomprona', 33517, 32856, 14),
(28, 'Marapur', 33842, 32853, 7),
(29, 'Candia', 33338, 32125, 7),
(35, 'Caribbean', 17364, 17606, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `z_ots_comunication`
--

CREATE TABLE `z_ots_comunication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `action` varchar(255) NOT NULL DEFAULT '',
  `param1` varchar(255) NOT NULL DEFAULT '',
  `param2` varchar(255) NOT NULL DEFAULT '',
  `param3` varchar(255) NOT NULL DEFAULT '',
  `param4` varchar(255) NOT NULL DEFAULT '',
  `param5` varchar(255) NOT NULL DEFAULT '',
  `param6` varchar(255) NOT NULL DEFAULT '',
  `param7` varchar(255) NOT NULL DEFAULT '',
  `delete_it` int(2) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `z_polls`
--

CREATE TABLE `z_polls` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `end` int(11) NOT NULL DEFAULT 0,
  `start` int(11) NOT NULL DEFAULT 0,
  `answers` int(11) NOT NULL DEFAULT 0,
  `votes_all` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `z_polls_answers`
--

CREATE TABLE `z_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `z_shop_categories`
--

CREATE TABLE `z_shop_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `z_shop_categories`
--

INSERT INTO `z_shop_categories` (`id`, `name`, `hidden`) VALUES
(1, 'Box', 0),
(2, 'Items', 0),
(3, 'Addons', 0),
(4, 'Mounts', 0),
(5, 'Premium Account', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `z_shop_history`
--

CREATE TABLE `z_shop_history` (
  `id` int(11) NOT NULL,
  `comunication_id` int(11) NOT NULL DEFAULT 0,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT 0,
  `from_nick` varchar(255) NOT NULL DEFAULT '',
  `from_account` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `offer_id` int(11) NOT NULL DEFAULT 0,
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT 0,
  `trans_real` int(11) NOT NULL DEFAULT 0,
  `is_pacc` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `z_shop_history`
--

INSERT INTO `z_shop_history` (`id`, `comunication_id`, `to_name`, `to_account`, `from_nick`, `from_account`, `price`, `offer_id`, `trans_state`, `trans_start`, `trans_real`, `is_pacc`) VALUES
(1, 1, '[GM] Under', 2, 'Anonymous', 2, 1000, 8, 'realized', 1735049216, 1735049225, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `z_shop_offer`
--

CREATE TABLE `z_shop_offer` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `itemid1` int(11) NOT NULL DEFAULT 0,
  `count1` int(11) NOT NULL DEFAULT 0,
  `itemid2` int(11) NOT NULL DEFAULT 0,
  `count2` int(11) NOT NULL DEFAULT 0,
  `category_id` tinyint(1) NOT NULL DEFAULT 0,
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `z_shop_offer`
--

INSERT INTO `z_shop_offer` (`id`, `points`, `itemid1`, `count1`, `itemid2`, `count2`, `category_id`, `offer_type`, `offer_description`, `offer_name`, `hidden`, `ordering`) VALUES
(12, 10, 2160, 50, 0, 0, 1, 'item', '50 crystal coins. They weigh 5.00 oz.', '50 Crystal Coins', 0, 1),
(13, 10, 139, 3, 131, 3, 2, 'addon', 'This purchase will give you the full knight outfit.', 'Knight Outfit', 0, 2),
(14, 10, 22, 0, 0, 0, 3, 'mount', 'This purchase will give you the Rented Horse mount.', 'Rented Horse', 0, 3),
(15, 10, 0, 30, 0, 0, 4, 'pacc', '30 Days of Premium Account', 'PACC 30', 0, 4);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_unique` (`name`);

--
-- Índices de tabela `account_bans`
--
ALTER TABLE `account_bans`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Índices de tabela `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Índices de tabela `account_sessions`
--
ALTER TABLE `account_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `account_vipgrouplist`
--
ALTER TABLE `account_vipgrouplist`
  ADD UNIQUE KEY `account_vipgrouplist_unique` (`account_id`,`player_id`,`vipgroup_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `vipgroup_id` (`vipgroup_id`),
  ADD KEY `account_vipgrouplist_vipgroup_fk` (`vipgroup_id`,`account_id`);

--
-- Índices de tabela `account_vipgroups`
--
ALTER TABLE `account_vipgroups`
  ADD PRIMARY KEY (`id`,`account_id`);

--
-- Índices de tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD UNIQUE KEY `account_viplist_unique` (`account_id`,`player_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `boosted_boss`
--
ALTER TABLE `boosted_boss`
  ADD PRIMARY KEY (`date`);

--
-- Índices de tabela `boosted_creature`
--
ALTER TABLE `boosted_creature`
  ADD PRIMARY KEY (`date`);

--
-- Índices de tabela `coins_transactions`
--
ALTER TABLE `coins_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Índices de tabela `crypto_payments`
--
ALTER TABLE `crypto_payments`
  ADD PRIMARY KEY (`paymentID`),
  ADD UNIQUE KEY `key3` (`boxID`,`orderID`,`userID`,`txID`,`amount`,`addr`),
  ADD KEY `boxID` (`boxID`),
  ADD KEY `boxType` (`boxType`),
  ADD KEY `userID` (`userID`),
  ADD KEY `countryID` (`countryID`),
  ADD KEY `orderID` (`orderID`),
  ADD KEY `amount` (`amount`),
  ADD KEY `amountUSD` (`amountUSD`),
  ADD KEY `coinLabel` (`coinLabel`),
  ADD KEY `unrecognised` (`unrecognised`),
  ADD KEY `addr` (`addr`),
  ADD KEY `txID` (`txID`),
  ADD KEY `txDate` (`txDate`),
  ADD KEY `txConfirmed` (`txConfirmed`),
  ADD KEY `txCheckDate` (`txCheckDate`),
  ADD KEY `processed` (`processed`),
  ADD KEY `processedDate` (`processedDate`),
  ADD KEY `recordCreated` (`recordCreated`),
  ADD KEY `key1` (`boxID`,`orderID`),
  ADD KEY `key2` (`boxID`,`orderID`,`userID`);

--
-- Índices de tabela `daily_reward_history`
--
ALTER TABLE `daily_reward_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `forge_history`
--
ALTER TABLE `forge_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `global_storage`
--
ALTER TABLE `global_storage`
  ADD UNIQUE KEY `global_storage_unique` (`key`);

--
-- Índices de tabela `guilds`
--
ALTER TABLE `guilds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `guilds_name_unique` (`name`),
  ADD UNIQUE KEY `guilds_owner_unique` (`ownerid`);

--
-- Índices de tabela `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warid` (`warid`);

--
-- Índices de tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD PRIMARY KEY (`player_id`,`guild_id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Índices de tabela `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `guild_id` (`guild_id`),
  ADD KEY `rank_id` (`rank_id`);

--
-- Índices de tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Índices de tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild1` (`guild1`),
  ADD KEY `guild2` (`guild2`);

--
-- Índices de tabela `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`),
  ADD KEY `town_id` (`town_id`);

--
-- Índices de tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD PRIMARY KEY (`house_id`,`listid`),
  ADD KEY `house_id_index` (`house_id`),
  ADD KEY `version` (`version`);

--
-- Índices de tabela `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD PRIMARY KEY (`ip`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Índices de tabela `kv_store`
--
ALTER TABLE `kv_store`
  ADD PRIMARY KEY (`key_name`);

--
-- Índices de tabela `market_history`
--
ALTER TABLE `market_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`,`sale`);

--
-- Índices de tabela `market_offers`
--
ALTER TABLE `market_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale` (`sale`,`itemtype`),
  ADD KEY `created` (`created`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `myaac_account_actions`
--
ALTER TABLE `myaac_account_actions`
  ADD KEY `account_id` (`account_id`);

--
-- Índices de tabela `myaac_admin_menu`
--
ALTER TABLE `myaac_admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_bugtracker`
--
ALTER TABLE `myaac_bugtracker`
  ADD PRIMARY KEY (`uid`);

--
-- Índices de tabela `myaac_changelog`
--
ALTER TABLE `myaac_changelog`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_charbazaar`
--
ALTER TABLE `myaac_charbazaar`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_charbazaar_bid`
--
ALTER TABLE `myaac_charbazaar_bid`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_config`
--
ALTER TABLE `myaac_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices de tabela `myaac_faq`
--
ALTER TABLE `myaac_faq`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_forum`
--
ALTER TABLE `myaac_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section` (`section`);

--
-- Índices de tabela `myaac_forum_boards`
--
ALTER TABLE `myaac_forum_boards`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_gallery`
--
ALTER TABLE `myaac_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_menu`
--
ALTER TABLE `myaac_menu`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_monsters`
--
ALTER TABLE `myaac_monsters`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_news`
--
ALTER TABLE `myaac_news`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_news_categories`
--
ALTER TABLE `myaac_news_categories`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_notepad`
--
ALTER TABLE `myaac_notepad`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_pages`
--
ALTER TABLE `myaac_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices de tabela `myaac_paypal`
--
ALTER TABLE `myaac_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_polls`
--
ALTER TABLE `myaac_polls`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_send_items`
--
ALTER TABLE `myaac_send_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_code` (`transaction_code`,`payment_status`),
  ADD KEY `myaac_send_items_account_fk` (`account_id`),
  ADD KEY `status` (`status`),
  ADD KEY `payment_method` (`payment_method`),
  ADD KEY `payment_status` (`payment_status`);

--
-- Índices de tabela `myaac_spells`
--
ALTER TABLE `myaac_spells`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices de tabela `myaac_videos`
--
ALTER TABLE `myaac_videos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `myaac_visitors`
--
ALTER TABLE `myaac_visitors`
  ADD UNIQUE KEY `ip` (`ip`);

--
-- Índices de tabela `myaac_weapons`
--
ALTER TABLE `myaac_weapons`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pagseguro_transactions`
--
ALTER TABLE `pagseguro_transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_code` (`transaction_code`,`payment_status`),
  ADD KEY `pagseguro_transactions_account_fk` (`account_id`),
  ADD KEY `payment_method` (`payment_method`),
  ADD KEY `payment_status` (`payment_status`),
  ADD KEY `coins_amount` (`coins_amount`),
  ADD KEY `delivered` (`delivered`);

--
-- Índices de tabela `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `players_unique` (`name`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `vocation` (`vocation`);

--
-- Índices de tabela `players_online`
--
ALTER TABLE `players_online`
  ADD PRIMARY KEY (`player_id`);

--
-- Índices de tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD KEY `player_id` (`player_id`),
  ADD KEY `killed_by` (`killed_by`),
  ADD KEY `mostdamage_by` (`mostdamage_by`);

--
-- Índices de tabela `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD UNIQUE KEY `player_depotitems_unique` (`player_id`,`sid`);

--
-- Índices de tabela `player_hirelings`
--
ALTER TABLE `player_hirelings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD UNIQUE KEY `player_inboxitems_unique` (`player_id`,`sid`);

--
-- Índices de tabela `player_items`
--
ALTER TABLE `player_items`
  ADD PRIMARY KEY (`player_id`,`pid`,`sid`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `sid` (`sid`);

--
-- Índices de tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD UNIQUE KEY `player_namelocks_unique` (`player_id`),
  ADD KEY `namelocked_by` (`namelocked_by`);

--
-- Índices de tabela `player_prey`
--
ALTER TABLE `player_prey`
  ADD PRIMARY KEY (`player_id`,`slot`);

--
-- Índices de tabela `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD UNIQUE KEY `player_rewards_unique` (`player_id`,`sid`);

--
-- Índices de tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD PRIMARY KEY (`player_id`,`name`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `player_stash`
--
ALTER TABLE `player_stash`
  ADD PRIMARY KEY (`player_id`,`item_id`);

--
-- Índices de tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD PRIMARY KEY (`player_id`,`key`);

--
-- Índices de tabela `player_taskhunt`
--
ALTER TABLE `player_taskhunt`
  ADD PRIMARY KEY (`player_id`,`slot`);

--
-- Índices de tabela `player_wheeldata`
--
ALTER TABLE `player_wheeldata`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `server_config`
--
ALTER TABLE `server_config`
  ADD PRIMARY KEY (`config`);

--
-- Índices de tabela `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `store_history`
--
ALTER TABLE `store_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Índices de tabela `stripe`
--
ALTER TABLE `stripe`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tile_store`
--
ALTER TABLE `tile_store`
  ADD KEY `house_id` (`house_id`);

--
-- Índices de tabela `towns`
--
ALTER TABLE `towns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices de tabela `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `z_polls`
--
ALTER TABLE `z_polls`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `z_shop_categories`
--
ALTER TABLE `z_shop_categories`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `z_shop_history`
--
ALTER TABLE `z_shop_history`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de tabela `account_ban_history`
--
ALTER TABLE `account_ban_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `account_vipgroups`
--
ALTER TABLE `account_vipgroups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT de tabela `coins_transactions`
--
ALTER TABLE `coins_transactions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de tabela `crypto_payments`
--
ALTER TABLE `crypto_payments`
  MODIFY `paymentID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `daily_reward_history`
--
ALTER TABLE `daily_reward_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `forge_history`
--
ALTER TABLE `forge_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de tabela `guilds`
--
ALTER TABLE `guilds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3770;

--
-- AUTO_INCREMENT de tabela `market_history`
--
ALTER TABLE `market_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `market_offers`
--
ALTER TABLE `market_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_admin_menu`
--
ALTER TABLE `myaac_admin_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `myaac_bugtracker`
--
ALTER TABLE `myaac_bugtracker`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_changelog`
--
ALTER TABLE `myaac_changelog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `myaac_charbazaar`
--
ALTER TABLE `myaac_charbazaar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `myaac_charbazaar_bid`
--
ALTER TABLE `myaac_charbazaar_bid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_config`
--
ALTER TABLE `myaac_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `myaac_faq`
--
ALTER TABLE `myaac_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_forum`
--
ALTER TABLE `myaac_forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `myaac_forum_boards`
--
ALTER TABLE `myaac_forum_boards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `myaac_gallery`
--
ALTER TABLE `myaac_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `myaac_menu`
--
ALTER TABLE `myaac_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=834;

--
-- AUTO_INCREMENT de tabela `myaac_monsters`
--
ALTER TABLE `myaac_monsters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_news`
--
ALTER TABLE `myaac_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `myaac_news_categories`
--
ALTER TABLE `myaac_news_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `myaac_notepad`
--
ALTER TABLE `myaac_notepad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_pages`
--
ALTER TABLE `myaac_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `myaac_paypal`
--
ALTER TABLE `myaac_paypal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `myaac_send_items`
--
ALTER TABLE `myaac_send_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_spells`
--
ALTER TABLE `myaac_spells`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_videos`
--
ALTER TABLE `myaac_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagseguro_transactions`
--
ALTER TABLE `pagseguro_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `player_hirelings`
--
ALTER TABLE `player_hirelings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `status`
--
ALTER TABLE `status`
  MODIFY `id` smallint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=489;

--
-- AUTO_INCREMENT de tabela `store_history`
--
ALTER TABLE `store_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de tabela `stripe`
--
ALTER TABLE `stripe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `towns`
--
ALTER TABLE `towns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `z_polls`
--
ALTER TABLE `z_polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `z_shop_history`
--
ALTER TABLE `z_shop_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `account_bans`
--
ALTER TABLE `account_bans`
  ADD CONSTRAINT `account_bans_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_bans_player_fk` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD CONSTRAINT `account_bans_history_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_bans_history_player_fk` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `account_vipgrouplist`
--
ALTER TABLE `account_vipgrouplist`
  ADD CONSTRAINT `account_vipgrouplist_player_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_vipgrouplist_vipgroup_fk` FOREIGN KEY (`vipgroup_id`,`account_id`) REFERENCES `account_vipgroups` (`id`, `account_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_player_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `coins_transactions`
--
ALTER TABLE `coins_transactions`
  ADD CONSTRAINT `coins_transactions_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `daily_reward_history`
--
ALTER TABLE `daily_reward_history`
  ADD CONSTRAINT `daily_reward_history_player_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `forge_history`
--
ALTER TABLE `forge_history`
  ADD CONSTRAINT `forge_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `guilds`
--
ALTER TABLE `guilds`
  ADD CONSTRAINT `guilds_ownerid_fk` FOREIGN KEY (`ownerid`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD CONSTRAINT `guildwar_kills_warid_fk` FOREIGN KEY (`warid`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_guild_fk` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_player_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD CONSTRAINT `guild_membership_guild_fk` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_player_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_rank_fk` FOREIGN KEY (`rank_id`) REFERENCES `guild_ranks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_fk` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `houses_list_house_fk` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD CONSTRAINT `ip_bans_players_fk` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `market_history`
--
ALTER TABLE `market_history`
  ADD CONSTRAINT `market_history_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `market_offers`
--
ALTER TABLE `market_offers`
  ADD CONSTRAINT `market_offers_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `myaac_send_items`
--
ALTER TABLE `myaac_send_items`
  ADD CONSTRAINT `myaac_send_items_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `pagseguro_transactions`
--
ALTER TABLE `pagseguro_transactions`
  ADD CONSTRAINT `pagseguro_transactions_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD CONSTRAINT `player_deaths_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_hirelings`
--
ALTER TABLE `player_hirelings`
  ADD CONSTRAINT `player_hirelings_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD CONSTRAINT `player_inboxitems_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_players2_fk` FOREIGN KEY (`namelocked_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_namelocks_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD CONSTRAINT `player_rewards_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_wheeldata`
--
ALTER TABLE `player_wheeldata`
  ADD CONSTRAINT `player_wheeldata_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `store_history`
--
ALTER TABLE `store_history`
  ADD CONSTRAINT `store_history_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tile_store`
--
ALTER TABLE `tile_store`
  ADD CONSTRAINT `tile_store_account_fk` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
