DROP TABLE IF EXISTS `gift_categories`, `gift_measures`, `gift_products`, `gift_sessions`, `gift_certificates`;

-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 17 2014 г., 16:22
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
  `description` varchar(255) NOT NULL,
  `image_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CAT_IMAGE` (`image_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `gift_categories`
--

INSERT INTO `gift_categories` (`id`, `name`, `description`, `image_id`) VALUES
(4, 'name1', 'desc1', 7),
(5, 'name2', 'desc2', 8),
(6, 'name3', 'desc3', 9),
(7, 'name4', 'desc4', 10),
(8, 'name5', 'desc5', 11),
(9, 'name6', 'desc6', 12);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `gift_certificates`
--

INSERT INTO `gift_certificates` (`id`, `sert_identifier`, `paid_up`) VALUES
(1, '000001', 0),
(2, '000002', 0),
(3, '000003', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `gift_images`
--

CREATE TABLE IF NOT EXISTS `gift_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Дамп данных таблицы `gift_images`
--

INSERT INTO `gift_images` (`id`, `path`) VALUES
(1, 'imgs/tv.jpg'),
(2, 'imgs/tv.jpg'),
(3, 'imgs/tv.jpg'),
(4, 'imgs/tv.jpg'),
(5, 'imgs/tv.jpg'),
(6, 'imgs/tv.jpg'),
(7, 'imgs/tv.jpg'),
(8, 'imgs/tv.jpg'),
(9, 'imgs/tv.jpg'),
(10, 'imgs/tv.jpg'),
(11, 'imgs/tv.jpg'),
(12, 'imgs/tv.jpg'),
(13, 'imgs/tv.jpg'),
(14, 'imgs/tv.jpg'),
(15, 'imgs/tv.jpg'),
(16, 'imgs/tv.jpg'),
(17, 'imgs/tv.jpg'),
(18, 'imgs/tv.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `gift_measures`
--

CREATE TABLE IF NOT EXISTS `gift_measures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_MES_IMAGE` (`image_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `gift_measures`
--

INSERT INTO `gift_measures` (`id`, `image_id`, `name`, `description`) VALUES
(4, 13, 'name1', 'desc1'),
(5, 14, 'name2', 'desc2'),
(6, 15, 'name3', 'desc3'),
(7, 16, 'name4', 'desc4'),
(8, 17, 'name5', 'desc5'),
(9, 18, 'name6', 'desc6');

-- --------------------------------------------------------

--
-- Структура таблицы `gift_products`
--

CREATE TABLE IF NOT EXISTS `gift_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(2048) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `gift_products`
--

INSERT INTO `gift_products` (`id`, `name`, `description`, `price`) VALUES
(1, 'pr1', 'desc1', 100),
(2, 'pr2', 'desc2', 200),
(3, 'pr3', 'desc3', 300),
(4, 'pr4', 'desc4', 400),
(5, 'pr5', 'desc5', 500),
(6, 'pr6', 'desc6', 600),
(7, 'pr7', 'desc7', 700);

-- --------------------------------------------------------

--
-- Структура таблицы `gift_products_images`
--

CREATE TABLE IF NOT EXISTS `gift_products_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `image_id` int(10) unsigned NOT NULL,
  `is_primary` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_PRODUCT` (`product_id`),
  KEY `FK_IMAGE` (`image_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `gift_products_images`
--

INSERT INTO `gift_products_images` (`id`, `product_id`, `image_id`, `is_primary`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 1),
(4, 4, 4, 1),
(5, 5, 5, 1),
(6, 6, 6, 1);

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
-- Дамп данных таблицы `gift_sessions`
--

INSERT INTO `gift_sessions` (`sert_id`, `token`, `expiration_time`) VALUES
(3, 'lHixED', '2014-11-17 15:37:18');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `gift_categories`
--
ALTER TABLE `gift_categories`
  ADD CONSTRAINT `FK_CAT_IMAGE` FOREIGN KEY (`image_id`) REFERENCES `gift_images` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `gift_measures`
--
ALTER TABLE `gift_measures`
  ADD CONSTRAINT `FK_MES_IMAGE` FOREIGN KEY (`image_id`) REFERENCES `gift_images` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `gift_products_images`
--
ALTER TABLE `gift_products_images`
  ADD CONSTRAINT `FK_PI_IMAGE` FOREIGN KEY (`image_id`) REFERENCES `gift_images` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `gift_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `gift_sessions`
--
ALTER TABLE `gift_sessions`
  ADD CONSTRAINT `FK_SERT` FOREIGN KEY (`sert_id`) REFERENCES `gift_certificates` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
