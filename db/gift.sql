DROP TABLE IF EXISTS `gift_cert_orders`, `gift_orders`, `gift_products_categories`, `gift_categories`, `gift_products_measures`, `gift_measures`, `gift_products_images`, `gift_products`, `gift_sessions`,
 `gift_certificates`, `gift_images`;

-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Дек 03 2014 г., 22:53
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
  `status` varchar(255) NOT NULL DEFAULT '0' COMMENT 'ready (готов к продаже), paid(куплен, оплачен), ordered(сделан заказ), received(товар получен, получение подтверждено)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sert_id` (`sert_identifier`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `gift_certificates`
--

INSERT INTO `gift_certificates` (`id`, `sert_identifier`, `status`) VALUES
(1, 'auuuuuuuuuuuuuuu', 'paid'),
(2, 'ecpbVoyO5omX5xFG', 'paid'),
(3, 'vWl1YiVo0N4nmehO', 'ready');

-- --------------------------------------------------------

--
-- Структура таблицы `gift_cert_orders`
--

CREATE TABLE IF NOT EXISTS `gift_cert_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(256) NOT NULL,
  `source` varchar(256) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `gift_cert_orders`
--

INSERT INTO `gift_cert_orders` (`id`, `email`, `source`, `created`) VALUES
(1, '1@1', 'vk_adv_iter1', '2014-12-01 17:56:25'),
(2, 'ghjkff@ddd', 'vk_adv_iter1', '2014-12-01 17:57:07'),
(3, '', 'vk_adv_iter1', '2014-12-01 18:04:16'),
(4, 'hh@d', 'vk_adv_iter1', '2014-12-01 18:09:12'),
(5, 'g@s', 'vk_adv_iter1', '2014-12-01 18:17:34'),
(6, 'd@d', 'vk_adv_iter1', '2014-12-01 18:17:39'),
(7, 'd@d', 'vk_adv_iter1', '2014-12-01 18:17:41');

-- --------------------------------------------------------

--
-- Структура таблицы `gift_images`
--

CREATE TABLE IF NOT EXISTS `gift_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

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
(18, 'imgs/tv.jpg'),
(19, 'imgs/p1.jpg'),
(20, 'imgs/p2.jpg'),
(21, 'imgs/p3.jpg'),
(22, 'imgs/womens_day.jpg'),
(23, 'imgs/p4.jpg'),
(24, 'imgs/p5.jpg'),
(25, 'imgs/p6.png'),
(26, 'imgs/valentines_day.jpg'),
(27, 'imgs/valentines_day.jpg'),
(28, 'imgs/defender_of_fatherland_day.jpg');

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
(7, 'Международный ж. день', 'Праздник, отмечаемый ежегодно 8 марта в ряде стран как «женский день»', 22),
(8, 'День всех влюблённых', 'Праздник, который 14 февраля отмечают многие люди по всему миру', 27),
(9, 'День защитника Отечества', 'Праздник, отмечаемый 23 февраля в России, Белоруссии, Киргизии', 28);

-- --------------------------------------------------------

--
-- Структура таблицы `gift_orders`
--

CREATE TABLE IF NOT EXISTS `gift_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `certificate_id` int(11) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `name` varchar(256) NOT NULL,
  `address` varchar(2048) NOT NULL,
  `phone` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `certificate_id` (`certificate_id`),
  KEY `FK_O_CERTIFICATE` (`certificate_id`),
  KEY `FK_O_PRODUCT` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `gift_products`
--

CREATE TABLE IF NOT EXISTS `gift_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `active` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `description` varchar(2048) NOT NULL,
  `price` int(11) NOT NULL,
  `serve_desc` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Дамп данных таблицы `gift_products`
--

INSERT INTO `gift_products` (`id`, `active`, `name`, `description`, `price`, `serve_desc`) VALUES
(1, 0, 'Телевизор T1', 'Электронное устройство для приёма и отображения изображения и звука, передаваемых по беспроводным каналам или по кабелю', 1000, ''),
(2, 0, 'Суши S1', 'Блюдо традиционной японской кухни, приготовленное из риса с уксусной приправой и различных морепродуктов, а также других ингредиентов', 200, ''),
(3, 0, 'Суши S1', 'Блюдо традиционной японской кухни, приготовленное из риса с уксусной приправой и различных морепродуктов, а также других ингредиентов', 200, ''),
(4, 0, 'Суши S1', 'Блюдо традиционной японской кухни, приготовленное из риса с уксусной приправой и различных морепродуктов, а также других ингредиентов', 200, ''),
(5, 0, 'Суши S1', 'Блюдо традиционной японской кухни, приготовленное из риса с уксусной приправой и различных морепродуктов, а также других ингредиентов', 200, ''),
(6, 0, 'Суши S1', 'Блюдо традиционной японской кухни, приготовленное из риса с уксусной приправой и различных морепродуктов, а также других ингредиентов', 200, ''),
(7, 0, 'Суши S1', 'Блюдо традиционной японской кухни, приготовленное из риса с уксусной приправой и различных морепродуктов, а также других ингредиентов', 200, ''),
(8, 1, 'Кольцо', 'Золотое кольцо с топазом', 3782, 'http://www.gold585.ru/catalog/rings_with_colored_stones/20781183642062309/#ad-image-0'),
(9, 1, 'Вечер в деревне BAUNTY', 'Более двух десятков приятных SPA-процедур на Ваш выбор\n', 3000, 'http://baunty-spa.ru/about/podarochnyjj-sertifikat/'),
(10, 1, '3 месяца тренировок', 'Безлимитный абонемент на 3 мес. посещения фитнес-клуба', 3100, 'http://www.spartak-vrn.ru/prices/'),
(11, 1, '2 прыжка с парашутом', 'Вы можете прыгнуть два раза или разделить подарок на двоих', 3600, 'http://www.dosaaf36region.ru/home/2012-10-25-10-51-59'),
(12, 1, 'Минимойка Karcher K 2 Basic', 'Многофункциональная бесконтактная мойка высокого давления для быстрой и качественной очистки различных поверхностей от разных видов загрязнений.', 2590, 'http://www.ulmart.ru/goods/816248#'),
(13, 1, 'Наушники Sennheiser HD 518', 'Профессиональные полноразмерные мониторные наушники от Sennheiser с открытым типом акустического оформления, диапазоном воспроизводимых частот 14-26000 Гц, чувствительностью 108 дБ.', 3990, 'http://www.enter.ru/product/electronics/naushniki-sennheiser-hd-518-2060508017052?utm_campaign=yandex_market_elec_n&utm_content=163771&utm_medium=cpc&utm_source=yandexmarketvr&utm_term=elec_Sennheiser_HD518#.VH93rdKsUvk');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Дамп данных таблицы `gift_products_images`
--

INSERT INTO `gift_products_images` (`id`, `product_id`, `image_id`, `is_primary`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 2, 1),
(4, 4, 2, 1),
(5, 5, 2, 1),
(6, 6, 2, 1),
(7, 8, 19, 1),
(8, 9, 20, 1),
(9, 10, 21, 1),
(10, 11, 23, 1),
(11, 12, 24, 1),
(12, 13, 25, 1);

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
(1, '32Xlub', '2014-11-28 16:13:19');

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
-- Ограничения внешнего ключа таблицы `gift_orders`
--
ALTER TABLE `gift_orders`
  ADD CONSTRAINT `FK_O_CERTIFICATE` FOREIGN KEY (`certificate_id`) REFERENCES `gift_certificates` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_O_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `gift_products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `FK_PI_IMAGE` FOREIGN KEY (`image_id`) REFERENCES `gift_images` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_PI_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `gift_products` (`id`) ON DELETE CASCADE;

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
