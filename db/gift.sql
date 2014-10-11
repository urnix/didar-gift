-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Сен 23 2014 г., 10:26
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
