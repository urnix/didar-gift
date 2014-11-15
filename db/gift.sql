DROP TABLE IF EXISTS `gift_categories`, `gift_measures`, `gift_products`, `gift_sessions`, `gift_certificates`;

-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 15 2014 г., 06:00
-- Версия сервера: 5.6.15-log
-- Версия PHP: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `gift`
--

-- --------------------------------------------------------

--
-- Структура таблицы `gift_categories`
--

CREATE TABLE IF NOT EXISTS `gift_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `desc` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `gift_categories`
--

INSERT INTO `gift_categories` (`id`, `name`, `desc`) VALUES
(1, 'ca1', 'de1'),
(2, 'ca2', 'de2'),
(3, 'ca3', 'de3');

-- --------------------------------------------------------

--
-- Структура таблицы `gift_certificates`
--

CREATE TABLE IF NOT EXISTS `gift_certificates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sert_identifier` varchar(255) NOT NULL,
  `paid_up` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sert_id` (`sert_identifier`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `gift_certificates`
--

INSERT INTO `gift_certificates` (`id`, `sert_identifier`, `paid_up`) VALUES
(1, '000001', 0),
(2, '000002', 0),
(3, '000003', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `gift_measures`
--

CREATE TABLE IF NOT EXISTS `gift_measures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `desc` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `gift_measures`
--

INSERT INTO `gift_measures` (`id`, `name`, `desc`) VALUES
(1, 'me1', 'de1'),
(2, 'me2', 'de2'),
(3, 'me3', 'de3');

-- --------------------------------------------------------

--
-- Структура таблицы `gift_products`
--

CREATE TABLE IF NOT EXISTS `gift_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `gift_products`
--

INSERT INTO `gift_products` (`id`, `name`, `amount`) VALUES
(1, 'pr1', 100),
(2, 'pr2', 200),
(3, 'pr3', 300);

-- --------------------------------------------------------

--
-- Структура таблицы `gift_sessions`
--

CREATE TABLE IF NOT EXISTS `gift_sessions` (
  `sert_id` int(10) unsigned NOT NULL,
  `token` varchar(255) NOT NULL,
  `expiration_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `sert_id` (`sert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `gift_sessions`
--
ALTER TABLE `gift_sessions`
  ADD CONSTRAINT `FK_SERT` FOREIGN KEY (`sert_id`) REFERENCES `gift_certificates` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
