DROP TABLE IF EXISTS `gift_products_categories`, `gift_categories`, `gift_products_measures`, `gift_measures`, `gift_products_images`, `gift_products`, `gift_sessions`, `gift_certificates`, `gift_images`;

-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 26 2014 г., 10:28
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
(4, 'Бытовая техника', 'Техника, используемая в быту.', 7),
(5, 'Продукты питания', 'Вещество, пригодное для еды и питья живым организмам для пополнения запасов энергии и необходимых ингредиентов для нормального течения химических реакций обмена веществ.', 8),
(6, 'Продукты питания', 'Вещество, пригодное для еды и питья живым организмам для пополнения запасов энергии и необходимых ингредиентов для нормального течения химических реакций обмена веществ.', 8),
(7, 'Продукты питания', 'Вещество, пригодное для еды и питья живым организмам для пополнения запасов энергии и необходимых ингредиентов для нормального течения химических реакций обмена веществ.', 8),
(8, 'Продукты питания', 'Вещество, пригодное для еды и питья живым организмам для пополнения запасов энергии и необходимых ингредиентов для нормального течения химических реакций обмена веществ.', 8),
(9, 'Продукты питания', 'Вещество, пригодное для еды и питья живым организмам для пополнения запасов энергии и необходимых ингредиентов для нормального течения химических реакций обмена веществ.', 8);

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
(1, '000001', 1),
(2, '000002', 0),
(3, '000003', 0);

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
(2, 'imgs/sushi.png'),
(3, 'imgs/tv.jpg'),
(4, 'imgs/tv.jpg'),
(5, 'imgs/tv.jpg'),
(6, 'imgs/tv.jpg'),
(7, 'imgs/home_appliance.jpg'),
(8, 'imgs/food.jpg'),
(9, 'imgs/tv.jpg'),
(10, 'imgs/tv.jpg'),
(11, 'imgs/tv.jpg'),
(12, 'imgs/tv.jpg'),
(13, 'imgs/new_year.jpg'),
(14, 'imgs/wedding.png'),
(15, 'imgs/birthday.jpg'),
(16, 'imgs/tv.jpg'),
(17, 'imgs/tv.jpg'),
(18, 'imgs/tv.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `gift_measures`
--

CREATE TABLE IF NOT EXISTS `gift_measures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_MES_IMAGE` (`image_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `gift_measures`
--

INSERT INTO `gift_measures` (`id`, `name`, `description`, `image_id`) VALUES
(4, 'Новый год', 'Праздник, отмечаемый многими народами в соответствии с принятым календарём, наступающий в момент перехода с последнего дня года в первый день следующего года.', 13),
(5, 'Свадьба', 'Oбряды, сопровождающие заключение брака.', 14),
(6, 'День рождения', 'День года, в который родился тот или иной человек.', 15),
(7, 'День рождения', 'День года, в который родился тот или иной человек.', 15),
(8, 'День рождения', 'День года, в который родился тот или иной человек.', 15),
(9, 'День рождения', 'День года, в который родился тот или иной человек.', 15);

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
(1, 'Телевизор T1', 'Электронное устройство для приёма и отображения изображения и звука, передаваемых по беспроводным каналам или по кабелю', 1000),
(2, 'Суши S1', 'Блюдо традиционной японской кухни, приготовленное из риса с уксусной приправой и различных морепродуктов, а также других ингредиентов', 200),
(3, 'Суши S1', 'Блюдо традиционной японской кухни, приготовленное из риса с уксусной приправой и различных морепродуктов, а также других ингредиентов', 200),
(4, 'Суши S1', 'Блюдо традиционной японской кухни, приготовленное из риса с уксусной приправой и различных морепродуктов, а также других ингредиентов', 200),
(5, 'Суши S1', 'Блюдо традиционной японской кухни, приготовленное из риса с уксусной приправой и различных морепродуктов, а также других ингредиентов', 200),
(6, 'Суши S1', 'Блюдо традиционной японской кухни, приготовленное из риса с уксусной приправой и различных морепродуктов, а также других ингредиентов', 200),
(7, 'Суши S1', 'Блюдо традиционной японской кухни, приготовленное из риса с уксусной приправой и различных морепродуктов, а также других ингредиентов', 200);

-- --------------------------------------------------------

--
-- Структура таблицы `gift_products_categories`
--

CREATE TABLE IF NOT EXISTS `gift_products_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PC_PRODUCT` (`product_id`),
  KEY `FK_PC_CATEGORY` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `gift_products_categories`
--

INSERT INTO `gift_products_categories` (`id`, `product_id`, `category_id`) VALUES
(1, 1, 4),
(2, 1, 5),
(3, 2, 4),
(4, 2, 5),
(5, 2, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `gift_products_images`
--

CREATE TABLE IF NOT EXISTS `gift_products_images` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `image_id` int(10) unsigned NOT NULL,
  `is_primary` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_IMAGE` (`image_id`),
  KEY `FK_PI_PRODUCT` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `gift_products_images`
--

INSERT INTO `gift_products_images` (`id`, `product_id`, `image_id`, `is_primary`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 2, 1),
(4, 4, 2, 1),
(5, 5, 2, 1),
(6, 6, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `gift_products_measures`
--

CREATE TABLE IF NOT EXISTS `gift_products_measures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `measure_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PM_PRODUCT` (`product_id`),
  KEY `FK_PM_MEASURE` (`measure_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `gift_products_measures`
--

INSERT INTO `gift_products_measures` (`id`, `product_id`, `measure_id`) VALUES
(1, 1, 4),
(2, 1, 5),
(3, 1, 6),
(4, 2, 4),
(5, 2, 5);

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
(1, 'EXizFw', '2014-11-26 09:42:43');

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
-- Ограничения внешнего ключа таблицы `gift_products_categories`
--
ALTER TABLE `gift_products_categories`
  ADD CONSTRAINT `FK_PC_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `gift_categories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_PC_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `gift_products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `gift_products_images`
--
ALTER TABLE `gift_products_images`
  ADD CONSTRAINT `FK_PI_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `gift_products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_PI_IMAGE` FOREIGN KEY (`image_id`) REFERENCES `gift_images` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `gift_products_measures`
--
ALTER TABLE `gift_products_measures`
  ADD CONSTRAINT `FK_PM_MEASURE` FOREIGN KEY (`measure_id`) REFERENCES `gift_measures` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_PM_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `gift_products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `gift_sessions`
--
ALTER TABLE `gift_sessions`
  ADD CONSTRAINT `FK_SERT` FOREIGN KEY (`sert_id`) REFERENCES `gift_certificates` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
