-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2014 at 10:24 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hosmos2`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_booking`
--

CREATE TABLE IF NOT EXISTS `wp_booking` (
  `booking_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `is_new` bigint(10) NOT NULL DEFAULT '1',
  `status` varchar(200) NOT NULL DEFAULT '',
  `sort_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `form` text,
  `booking_type` bigint(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_booking`
--

INSERT INTO `wp_booking` (`booking_id`, `is_new`, `status`, `sort_date`, `modification_date`, `form`, `booking_type`) VALUES
(1, 1, '', '2014-07-15 00:00:00', '2014-07-13 11:58:03', 'text^name1^Jony~text^secondname1^Smith~text^email1^example-free@wpbookingcalendar.com~text^phone1^8(038)458-77-77~textarea^details1^Reserve a room with sea view', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookingdates`
--

CREATE TABLE IF NOT EXISTS `wp_bookingdates` (
  `booking_id` bigint(20) unsigned NOT NULL,
  `booking_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `approved` bigint(20) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `booking_id_dates` (`booking_id`,`booking_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_bookingdates`
--

INSERT INTO `wp_bookingdates` (`booking_id`, `booking_date`, `approved`) VALUES
(1, '2014-07-15 00:00:00', 0),
(1, '2014-07-16 00:00:00', 0),
(1, '2014-07-17 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bs_bookings`
--

CREATE TABLE IF NOT EXISTS `wp_bs_bookings` (
  `bookingID` int(10) NOT NULL AUTO_INCREMENT,
  `calendarID` int(10) NOT NULL DEFAULT '0',
  `formID` int(10) NOT NULL DEFAULT '0',
  `startDate` int(11) NOT NULL DEFAULT '0',
  `endDate` int(11) NOT NULL DEFAULT '0',
  `createdDate` int(11) NOT NULL DEFAULT '0',
  `bookingData` text NOT NULL,
  `bookingStatus` tinytext NOT NULL,
  `bookingRead` varchar(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bookingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WP Booking System - Bookings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bs_calendars`
--

CREATE TABLE IF NOT EXISTS `wp_bs_calendars` (
  `calendarID` int(10) NOT NULL AUTO_INCREMENT,
  `calendarTitle` text,
  `createdDate` int(11) DEFAULT NULL,
  `modifiedDate` int(11) DEFAULT NULL,
  `calendarData` text,
  `calendarLegend` text,
  PRIMARY KEY (`calendarID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WP Booking System - Calendars' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bs_forms`
--

CREATE TABLE IF NOT EXISTS `wp_bs_forms` (
  `formID` int(10) NOT NULL AUTO_INCREMENT,
  `formTitle` text,
  `formData` text,
  `formOptions` text,
  PRIMARY KEY (`formID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WP Booking System - Forms' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Мистер WordPress', '', 'https://wordpress.org/', '', '2014-07-13 08:38:43', '2014-07-13 08:38:43', 'Привет! Это комментарий.\nЧтобы удалить его, авторизуйтесь и просмотрите комментарии к записи. Там будут ссылки для их изменения или удаления.', 0, 'post-trashed', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_dex_reservations`
--

CREATE TABLE IF NOT EXISTS `wp_dex_reservations` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `calendar` int(11) NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `booked_time_s` varchar(250) NOT NULL DEFAULT '',
  `booked_time_e` varchar(250) NOT NULL DEFAULT '',
  `booked_time_unformatted_s` varchar(250) NOT NULL DEFAULT '',
  `booked_time_unformatted_e` varchar(250) NOT NULL DEFAULT '',
  `name` varchar(250) NOT NULL DEFAULT '',
  `email` varchar(250) NOT NULL DEFAULT '',
  `phone` varchar(250) NOT NULL DEFAULT '',
  `question` text,
  `buffered_date` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_dex_reservations_discount_codes`
--

CREATE TABLE IF NOT EXISTS `wp_dex_reservations_discount_codes` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `cal_id` mediumint(9) NOT NULL DEFAULT '1',
  `code` varchar(250) NOT NULL DEFAULT '',
  `discount` varchar(250) NOT NULL DEFAULT '',
  `expires` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `availability` int(10) unsigned NOT NULL DEFAULT '0',
  `used` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_dopbs_calendars`
--

CREATE TABLE IF NOT EXISTS `wp_dopbs_calendars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_dopbs_calendars`
--

INSERT INTO `wp_dopbs_calendars` (`id`, `name`) VALUES
(1, 'Booking Calendar');

-- --------------------------------------------------------

--
-- Table structure for table `wp_dopbs_days`
--

CREATE TABLE IF NOT EXISTS `wp_dopbs_days` (
  `calendar_id` int(11) NOT NULL,
  `day` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `year` int(11) NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wp_dopbs_forms`
--

CREATE TABLE IF NOT EXISTS `wp_dopbs_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_dopbs_forms`
--

INSERT INTO `wp_dopbs_forms` (`id`, `name`) VALUES
(1, 'Default Form');

-- --------------------------------------------------------

--
-- Table structure for table `wp_dopbs_forms_fields`
--

CREATE TABLE IF NOT EXISTS `wp_dopbs_forms_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `position` int(11) NOT NULL,
  `multiple_select` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `allowed_characters` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL DEFAULT '0',
  `is_email` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `required` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `translation` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `wp_dopbs_forms_fields`
--

INSERT INTO `wp_dopbs_forms_fields` (`id`, `form_id`, `type`, `position`, `multiple_select`, `allowed_characters`, `size`, `is_email`, `required`, `translation`) VALUES
(1, 1, 'text', 0, 'false', '', 0, 'false', 'true', '{"af": "First Name","al": "First Name","ar": "First Name","az": "First Name","bs": "First Name","by": "First Name","bg": "First Name","ca": "First Name","cn": "First Name","cr": "First Name","cz": "First Name","dk": "First Name","du": "First Name","en": "First Name","eo": "First Name","et": "First Name","fl": "First Name","fi": "First Name","fr": "First Name","gl": "First Name","de": "First Name","gr": "First Name","ha": "First Name","he": "First Name","hi": "First Name","hu": "First Name","is": "First Name","id": "First Name","ir": "First Name","it": "First Name","ja": "First Name","ko": "First Name","lv": "First Name","lt": "First Name","mk": "First Name","mg": "First Name","ma": "First Name","no": "First Name","pe": "First Name","pl": "First Name","pt": "First Name","ro": "First Name","ru": "First Name","sr": "First Name","sk": "First Name","sl": "First Name","sp": "First Name","sw": "First Name","se": "First Name","th": "First Name","tr": "First Name","uk": "First Name","ur": "First Name","vi": "First Name","we": "First Name","yi": "First Name"}'),
(2, 1, 'text', 0, 'false', '', 0, 'false', 'true', '{"af": "Last Name","al": "Last Name","ar": "Last Name","az": "Last Name","bs": "Last Name","by": "Last Name","bg": "Last Name","ca": "Last Name","cn": "Last Name","cr": "Last Name","cz": "Last Name","dk": "Last Name","du": "Last Name","en": "Last Name","eo": "Last Name","et": "Last Name","fl": "Last Name","fi": "Last Name","fr": "Last Name","gl": "Last Name","de": "Last Name","gr": "Last Name","ha": "Last Name","he": "Last Name","hi": "Last Name","hu": "Last Name","is": "Last Name","id": "Last Name","ir": "Last Name","it": "Last Name","ja": "Last Name","ko": "Last Name","lv": "Last Name","lt": "Last Name","mk": "Last Name","mg": "Last Name","ma": "Last Name","no": "Last Name","pe": "Last Name","pl": "Last Name","pt": "Last Name","ro": "Last Name","ru": "Last Name","sr": "Last Name","sk": "Last Name","sl": "Last Name","sp": "Last Name","sw": "Last Name","se": "Last Name","th": "Last Name","tr": "Last Name","uk": "Last Name","ur": "Last Name","vi": "Last Name","we": "Last Name","yi": "Last Name"}'),
(3, 1, 'text', 0, 'false', '', 0, 'true', 'true', '{"af": "Email","al": "Email","ar": "Email","az": "Email","bs": "Email","by": "Email","bg": "Email","ca": "Email","cn": "Email","cr": "Email","cz": "Email","dk": "Email","du": "Email","en": "Email","eo": "Email","et": "Email","fl": "Email","fi": "Email","fr": "Email","gl": "Email","de": "Email","gr": "Email","ha": "Email","he": "Email","hi": "Email","hu": "Email","is": "Email","id": "Email","ir": "Email","it": "Email","ja": "Email","ko": "Email","lv": "Email","lt": "Email","mk": "Email","mg": "Email","ma": "Email","no": "Email","pe": "Email","pl": "Email","pt": "Email","ro": "Email","ru": "Email","sr": "Email","sk": "Email","sl": "Email","sp": "Email","sw": "Email","se": "Email","th": "Email","tr": "Email","uk": "Email","ur": "Email","vi": "Email","we": "Email","yi": "Email"}'),
(4, 1, 'text', 0, 'false', '0123456789+-().', 0, 'false', 'true', '{"af": "Phone","al": "Phone","ar": "Phone","az": "Phone","bs": "Phone","by": "Phone","bg": "Phone","ca": "Phone","cn": "Phone","cr": "Phone","cz": "Phone","dk": "Phone","du": "Phone","en": "Phone","eo": "Phone","et": "Phone","fl": "Phone","fi": "Phone","fr": "Phone","gl": "Phone","de": "Phone","gr": "Phone","ha": "Phone","he": "Phone","hi": "Phone","hu": "Phone","is": "Phone","id": "Phone","ir": "Phone","it": "Phone","ja": "Phone","ko": "Phone","lv": "Phone","lt": "Phone","mk": "Phone","mg": "Phone","ma": "Phone","no": "Phone","pe": "Phone","pl": "Phone","pt": "Phone","ro": "Phone","ru": "Phone","sr": "Phone","sk": "Phone","sl": "Phone","sp": "Phone","sw": "Phone","se": "Phone","th": "Phone","tr": "Phone","uk": "Phone","ur": "Phone","vi": "Phone","we": "Phone","yi": "Phone"}'),
(5, 1, 'textarea', 0, 'false', '', 0, 'false', 'true', '{"af": "Message","al": "Message","ar": "Message","az": "Message","bs": "Message","by": "Message","bg": "Message","ca": "Message","cn": "Message","cr": "Message","cz": "Message","dk": "Message","du": "Message","en": "Message","eo": "Message","et": "Message","fl": "Message","fi": "Message","fr": "Message","gl": "Message","de": "Message","gr": "Message","ha": "Message","he": "Message","hi": "Message","hu": "Message","is": "Message","id": "Message","ir": "Message","it": "Message","ja": "Message","ko": "Message","lv": "Message","lt": "Message","mk": "Message","mg": "Message","ma": "Message","no": "Message","pe": "Message","pl": "Message","pt": "Message","ro": "Message","ru": "Message","sr": "Message","sk": "Message","sl": "Message","sp": "Message","sw": "Message","se": "Message","th": "Message","tr": "Message","uk": "Message","ur": "Message","vi": "Message","we": "Message","yi": "Message"}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_dopbs_forms_select_options`
--

CREATE TABLE IF NOT EXISTS `wp_dopbs_forms_select_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `translation` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_dopbs_reservations`
--

CREATE TABLE IF NOT EXISTS `wp_dopbs_reservations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendar_id` int(11) NOT NULL,
  `check_in` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `check_out` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `start_hour` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `end_hour` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `no_items` int(11) NOT NULL DEFAULT '1',
  `currency` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `currency_code` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `total_price` int(11) NOT NULL DEFAULT '0',
  `discount` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `deposit` int(11) NOT NULL DEFAULT '0',
  `language` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `no_people` int(11) NOT NULL DEFAULT '1',
  `no_children` int(11) NOT NULL DEFAULT '0',
  `payment_method` int(11) NOT NULL DEFAULT '0',
  `paypal_transaction_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_dopbs_settings`
--

CREATE TABLE IF NOT EXISTS `wp_dopbs_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendar_id` int(11) NOT NULL,
  `available_days` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'true,true,true,true,true,true,true',
  `first_day` int(11) NOT NULL DEFAULT '1',
  `currency` int(11) NOT NULL DEFAULT '108',
  `date_type` int(11) NOT NULL DEFAULT '1',
  `template` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `template_email` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `min_stay` int(11) NOT NULL DEFAULT '1',
  `max_stay` int(11) NOT NULL DEFAULT '0',
  `no_items_enabled` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'true',
  `view_only` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `page_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `notifications_email` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `smtp_enabled` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `smtp_host_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `smtp_host_port` int(11) NOT NULL DEFAULT '25',
  `smtp_ssl` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `smtp_user` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `smtp_password` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `multiple_days_select` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'true',
  `morning_check_out` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `hours_enabled` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `hours_definitions` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `multiple_hours_select` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'true',
  `hours_ampm` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `last_hour_to_total_price` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'true',
  `hours_interval_enabled` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `discounts_no_days` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0',
  `deposit` float NOT NULL DEFAULT '0',
  `form` int(11) NOT NULL DEFAULT '1',
  `instant_booking` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `no_people_enabled` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'true',
  `min_no_people` int(11) NOT NULL DEFAULT '1',
  `max_no_people` int(11) NOT NULL DEFAULT '4',
  `no_children_enabled` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'true',
  `min_no_children` int(11) NOT NULL DEFAULT '0',
  `max_no_children` int(11) NOT NULL DEFAULT '2',
  `terms_and_conditions_enabled` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `terms_and_conditions_link` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_arrival_enabled` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'true',
  `payment_paypal_enabled` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `payment_paypal_username` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_paypal_password` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_paypal_signature` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_paypal_credit_card` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `payment_paypal_sandbox_enabled` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `max_year` int(11) NOT NULL DEFAULT '2014',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_dopbs_settings`
--

INSERT INTO `wp_dopbs_settings` (`id`, `calendar_id`, `available_days`, `first_day`, `currency`, `date_type`, `template`, `template_email`, `min_stay`, `max_stay`, `no_items_enabled`, `view_only`, `page_url`, `notifications_email`, `smtp_enabled`, `smtp_host_name`, `smtp_host_port`, `smtp_ssl`, `smtp_user`, `smtp_password`, `multiple_days_select`, `morning_check_out`, `hours_enabled`, `hours_definitions`, `multiple_hours_select`, `hours_ampm`, `last_hour_to_total_price`, `hours_interval_enabled`, `discounts_no_days`, `deposit`, `form`, `instant_booking`, `no_people_enabled`, `min_no_people`, `max_no_people`, `no_children_enabled`, `min_no_children`, `max_no_children`, `terms_and_conditions_enabled`, `terms_and_conditions_link`, `payment_arrival_enabled`, `payment_paypal_enabled`, `payment_paypal_username`, `payment_paypal_password`, `payment_paypal_signature`, `payment_paypal_credit_card`, `payment_paypal_sandbox_enabled`, `max_year`) VALUES
(1, 1, 'true,true,true,true,true,true,true', 1, 108, 1, 'default', 'default', 1, 0, 'true', 'false', '', '', 'false', '', 25, 'false', '', '', 'true', 'false', 'false', '[{"value": "00:00"}]', 'true', 'false', 'true', 'false', '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', 0, 1, 'false', 'true', 1, 4, 'true', 0, 2, 'false', '', 'true', 'false', '', '', '', 'false', 'false', 2014);

-- --------------------------------------------------------

--
-- Table structure for table `wp_hotelclub_cities`
--

CREATE TABLE IF NOT EXISTS `wp_hotelclub_cities` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `country_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `country` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_hotelclub_cities`
--

INSERT INTO `wp_hotelclub_cities` (`id`, `name`, `country_id`) VALUES
(1, 'Sydney', 3),
(3, 'Melbourne', 3),
(5, 'Canberra', 3),
(7, 'New York City', 0),
(17, 'Washington DC', 5),
(19, 'Auckland', 15),
(21, 'Rotorua', 15),
(24, 'Christchurch', 15),
(25, 'Cairns', 3),
(26, 'Amsterdam', 27),
(27, 'London', 28),
(29, 'Lisbon', 29),
(41, 'Barcelona', 30),
(43, 'Madrid', 30),
(44, 'Brisbane', 3),
(45, 'Adelaide', 3),
(57, 'Budapest', 31),
(58, 'Perth', 3),
(59, 'Gold Coast', 3),
(65, 'Zurich', 32),
(69, 'Lausanne', 32),
(71, 'Davos', 32),
(115, 'Paris', 45),
(116, 'Phuket', 48),
(117, 'Chiang Mai', 48),
(118, 'Bangkok', 48),
(120, 'Krabi', 48),
(121, 'Pattaya', 48),
(123, 'Samui', 48),
(141, 'Singapore', 152),
(142, 'Hong Kong', 97),
(143, 'Moscow', 147),
(144, 'Stockholm', 160),
(145, 'Prague', 79),
(146, 'Rome', 104),
(147, 'Vienna', 58),
(149, 'Orlando / Kissimmee', 5),
(152, 'San Francisco', 0),
(154, 'Las Vegas', 0),
(155, 'Los Angeles', 5),
(156, 'Chiang Rai', 48),
(157, 'Vichy', 45),
(158, 'Hua Hin', 48),
(159, 'Cha-Am', 48),
(160, 'Lyon', 45),
(161, 'Bordeaux', 45),
(163, 'Seoul', 157),
(164, 'Blue Mountains', 3),
(165, 'Noosa Heads', 3),
(177, 'Port Macquarie', 3),
(178, 'Snowy Mountains', 3),
(179, 'Hobart', 3),
(180, 'Sunshine Coast', 3),
(181, 'Townsville', 3),
(182, 'Mount Isa', 3),
(183, 'Launceston', 3),
(184, 'Broome', 3),
(185, 'Geraldton', 3),
(186, 'Darwin', 3),
(188, 'Alice Springs', 3),
(189, 'Kununurra', 3),
(190, 'Ayers Rock', 3),
(191, 'Kalgoorlie', 3),
(192, 'Avoca Beach', 3),
(193, 'Coffs Harbour', 3),
(195, 'Dubbo', 3),
(196, 'Ettalong Beach', 3),
(197, 'Gladstone', 3),
(198, 'Karratha', 3),
(199, 'Hunter Valley', 3),
(201, 'Pemberton', 3),
(202, 'Port Hedland', 3),
(203, 'Port Stephens', 3),
(204, 'Terrigal', 3),
(205, 'The Entrance', 3),
(206, 'Tom Price', 3),
(216, 'Busan', 157),
(221, 'Vasteras', 160),
(222, 'Uppsala', 160),
(225, 'Wellington', 15),
(226, 'Vaxjo', 160),
(227, 'Helsingborg', 160),
(228, 'Queenstown', 15),
(229, 'Malmo', 160),
(233, 'Ostersund', 160),
(234, 'Bali', 101),
(235, 'Nice', 45),
(236, 'Innsbruck', 58),
(239, 'Salzburg', 58),
(243, 'Bay of Islands', 15),
(244, 'Tauranga', 15),
(245, 'Taupo', 15),
(246, 'Masterton', 15),
(247, 'Whangarei', 15),
(248, 'Hamilton', 15),
(250, 'Palmerston North', 15),
(251, 'Greymouth', 15),
(252, 'Oamaru', 15),
(253, 'Florence', 104),
(254, 'Milan', 104),
(258, 'Venice', 104),
(259, 'Dunedin', 15),
(261, 'Stratford Upon Avon', 28),
(262, 'Birmingham', 28),
(263, 'Bath', 28),
(264, 'Brighton', 28),
(266, 'Lombok', 101),
(269, 'Jakarta', 101),
(272, 'Berlin', 91),
(273, 'Duesseldorf', 91),
(274, 'Freiburg', 91),
(276, 'Bonn', 91),
(280, 'Dresden', 91),
(282, 'Dortmund', 91),
(283, 'Potsdam', 91),
(285, 'Rothenburg', 91),
(286, 'Ulm', 91),
(287, 'Stuttgart', 91),
(288, 'Bremen', 91),
(293, 'Hannover', 91),
(299, 'Hamburg', 91),
(300, 'Leipzig', 91),
(301, 'Essen', 91),
(302, 'Frankfurt', 91),
(304, 'Algarve', 29),
(305, 'Azores', 29),
(306, 'Madeira', 29),
(309, 'Cologne', 91),
(312, 'Macau', 183),
(315, 'Cannes', 45),
(316, 'Antibes - Juan les Pins', 45),
(321, 'Lille', 45),
(324, 'Lund', 160),
(325, 'Umea', 160),
(326, 'Oslo', 137),
(334, 'Copenhagen', 80),
(335, 'Helsinki', 88),
(336, 'Bielefeld', 91),
(340, 'Basel', 32),
(341, 'Amalfi', 104),
(344, 'Montreux', 32),
(345, 'Lugano', 32),
(346, 'Interlaken', 32),
(349, 'Marseille', 45),
(355, 'Reims', 45),
(356, 'Darmstadt', 91),
(357, 'Kuala Lumpur', 121),
(358, 'Sorrento', 104),
(364, 'Bristol', 28),
(365, 'San Sebastian', 30),
(366, 'Positano', 104),
(367, 'Lucerne', 32),
(368, 'Costa Del Sol', 30),
(369, 'Alicante', 30),
(371, 'Capri Island', 104),
(372, 'Manchester', 28),
(373, 'Chester', 28),
(374, 'Liverpool', 28),
(375, 'Newcastle Upon Tyne', 28),
(376, 'Cardiff', 28),
(377, 'Edinburgh', 28),
(380, 'Geneva', 32),
(381, 'Sicily', 104),
(382, 'Berne', 32),
(383, 'Bergen', 137),
(384, 'Lillehammer', 137),
(386, 'Longyearbyen', 137),
(387, 'Stavanger', 137),
(388, 'Naples', 104),
(389, 'Katherine', 3),
(390, 'Palermo', 104),
(391, 'Taormina', 104),
(392, 'Queenstown (AU)', 3),
(393, 'Graz', 58),
(394, 'Linz', 58),
(395, 'Bregenz', 58),
(396, 'Strasbourg', 45),
(397, 'Grindelwald', 32),
(399, 'Avignon', 45),
(400, 'Nantes', 45),
(403, 'St. Moritz', 32),
(404, 'Zermatt', 32),
(405, 'Rotterdam', 27),
(406, 'Ibiza Island', 30),
(410, 'Mallorca Island', 30),
(412, 'Poitiers', 45),
(413, 'Chambery', 45),
(419, 'Nuremberg', 91),
(420, 'Munich', 91),
(421, 'Valencia', 30),
(422, 'Limoges', 45),
(423, 'Bayonne', 45),
(424, 'Bilbao', 30),
(425, 'Marbella - Costa del Sol', 30),
(426, 'Annecy', 45),
(427, 'Grenoble', 45),
(428, 'La Rochelle', 45),
(429, 'Caen', 45),
(430, 'Cherbourg', 45),
(431, 'Dijon', 45),
(432, 'Evian-les-Bains', 45),
(434, 'Mulhouse', 45),
(435, 'Metz', 45),
(436, 'Miami', 0),
(438, 'New Orleans', 0),
(446, 'Dunk Island', 3),
(447, 'Philadelphia', 0),
(450, 'Lizard Island', 3),
(451, 'Chicago', 0),
(456, 'San Diego', 0),
(458, 'Boston', 0),
(461, 'Whitsundays', 3),
(462, 'Fraser Island', 3),
(463, 'Atlanta', 0),
(464, 'Seattle', 0),
(465, 'Dallas / Fort Worth', 5),
(466, 'Denver', 0),
(467, 'Palm Springs', 0),
(468, 'Houston', 0),
(470, 'Imatra', 88),
(471, 'Kajaani', 88),
(481, 'Kuopio', 88),
(482, 'Tampere', 88),
(483, 'Turku', 88),
(484, 'Rovaniemi', 88),
(486, 'Luosto', 88),
(487, 'Arendal', 137),
(488, 'Tromso', 137),
(489, 'Trondheim', 137),
(490, 'Alesund', 137),
(491, 'Odense', 80),
(493, 'Aalborg', 80),
(494, 'Esbjerg', 80),
(495, 'Roskilde', 80),
(496, 'Sonderborg', 80),
(497, 'Gavle', 160),
(498, 'Kalmar', 160),
(500, 'Cradle Mountain', 3),
(501, 'Karlstad', 160),
(502, 'Norrkoping', 160),
(503, 'Sundsvall', 160),
(504, 'Estavayer-le-Lac', 32),
(506, 'Orebro', 160),
(507, 'Rockhampton', 3),
(508, 'Heidelberg', 91),
(509, 'Erfurt', 91),
(511, 'Dublin', 102),
(512, 'Cork', 102),
(513, 'Killarney', 102),
(514, 'Porto', 29),
(518, 'Galway', 102),
(519, 'Limerick', 102),
(520, 'Waterford', 102),
(521, 'Kilkenny', 102),
(522, 'Kenmare', 102),
(523, 'Shannon', 102),
(526, 'The Hague / Scheveningen', 27),
(527, 'Utrecht', 27),
(533, 'Dieppe', 45),
(535, 'Maastricht', 27),
(538, 'Brussels', 63),
(539, 'Antwerp', 63),
(540, 'Brugge', 63),
(541, 'Namur', 63),
(542, 'Ghent', 63),
(543, 'Glasgow', 28),
(547, 'Inverness', 28),
(548, 'Aberdeen', 28),
(549, 'Belfast', 28),
(550, 'Kings Canyon', 3),
(551, 'Magnetic Island', 3),
(552, 'Penang', 121),
(556, 'Langkawi', 121),
(560, 'Kota Kinabalu', 121),
(564, 'Kuching', 121),
(568, 'Sandakan', 121),
(581, 'Monte Carlo', 126),
(585, 'Te Anau', 15),
(589, 'Hanmer Springs', 15),
(593, 'Batemans Bay', 3),
(597, 'Mudgee', 3),
(601, 'Wagga Wagga', 3),
(612, 'Eger', 31),
(628, 'Pecs', 31),
(632, 'Siofok', 31),
(636, 'Liege', 63),
(647, 'Ostende', 63),
(651, 'Newcastle', 3),
(652, 'Kakadu National Park', 3),
(661, 'Corsica', 45),
(687, 'Karlovy Vary', 79),
(688, 'Ceske Budejovice', 79),
(689, 'Bologna', 104),
(690, 'Pisa', 104),
(692, 'Verona', 104),
(707, 'Umbria Countryside', 104),
(720, 'Turin', 104),
(725, 'Tokyo', 106),
(733, 'Pokolbin', 3),
(742, 'Nakhon Pathom', 48),
(751, 'Tenerife Island', 30),
(758, 'Athens', 93),
(766, 'Bodo', 137),
(767, 'Osaka', 106),
(771, 'Courchevel', 45),
(772, 'Fukuoka', 106),
(773, 'Nagoya', 106),
(774, 'Wollongong', 3),
(775, 'Sapporo', 106),
(776, 'Hiroshima', 106),
(777, 'Nagasaki', 106),
(778, 'Kyoto', 106),
(782, 'Siracusa', 104),
(786, 'Vicenza', 104),
(790, 'Bournemouth', 28),
(794, 'Coventry', 28),
(798, 'Lancaster', 28),
(802, 'Frejus', 45),
(806, 'Montpellier', 45),
(810, 'Biarritz', 45),
(814, 'Deauville - Trouville', 45),
(818, 'Toulouse', 45),
(825, 'Tours', 45),
(829, 'Amiens', 45),
(833, 'Angers', 45),
(837, 'Orleans', 45),
(841, 'Aix-en-Provence', 45),
(845, 'Menton', 45),
(853, 'Compiegne', 45),
(857, 'Thessaloniki', 93),
(861, 'Le Lavandou', 45),
(865, 'Nevers', 45),
(876, 'Clermont-Ferrand', 45),
(880, 'Toulon', 45),
(884, 'Ballarat', 3),
(888, 'Bendigo', 3),
(892, 'Dandenong', 3),
(896, 'Geelong', 3),
(907, 'Phillip Island', 3),
(911, 'Cap d''Agde', 45),
(916, 'Piraeus', 93),
(920, 'Vouliagmeni', 93),
(921, 'Santorini Island', 93),
(927, 'Mykonos Island', 93),
(931, 'Frederikshavn', 80),
(935, 'Kolding', 80),
(941, 'Brest', 45),
(943, 'Quimper', 45),
(944, 'Roscoff', 45),
(945, 'Saint Malo', 45),
(946, 'Vannes', 45),
(954, 'Rennes', 45),
(963, 'Ios Island', 93),
(967, 'Crete Island', 93),
(974, 'Paros Island', 93),
(989, 'Zakynthos Island', 93),
(993, 'Naxos Island', 93),
(997, 'Orpheus Island', 3),
(1002, 'Pamplona', 30),
(1008, 'Menorca Island', 30),
(1013, 'Rhodes Island', 93),
(1019, 'Gaillard', 45),
(1024, 'Corfu Island', 93),
(1028, 'Le Havre', 45),
(1032, 'Pau', 45),
(1041, 'Oviedo', 30),
(1045, 'Malaga', 30),
(1053, 'Whistler', 70),
(1057, 'Calgary', 70),
(1061, 'Edmonton', 70),
(1066, 'Quebec City', 70),
(1070, 'Vitoria', 30),
(1072, 'Byron Bay', 3),
(1084, 'Richmond', 3),
(1097, 'Alentejo', 29),
(1144, 'Braganca', 29),
(1152, 'Stanley', 3),
(1156, 'Warwick (AU)', 3),
(1163, 'Bundaberg', 3),
(1167, 'Manteigas', 29),
(1195, 'Bari', 104),
(1199, 'Faro', 29),
(1222, 'Asker', 137),
(1226, 'Harstad', 137),
(1230, 'Kristiansund', 137),
(1234, 'Mo I Rana', 137),
(1268, 'Molde', 137),
(1280, 'Sandnes', 137),
(1284, 'Skien', 137),
(1289, 'Steinkjer', 137),
(1304, 'Santa Margherita Ligure', 104),
(1308, 'Bergamo', 104),
(1312, 'Brescia', 104),
(1320, 'Pompei', 104),
(1344, 'Strahan', 3),
(1356, 'Burnie', 3),
(1360, 'Lanzarote Island', 30),
(1364, 'Gran Canaria Island', 30),
(1378, 'Fuerteventura Island', 30),
(1382, 'La Palma Island', 30),
(1386, 'Mornington Peninsula', 3),
(1390, 'Angouleme', 45),
(1394, 'Saint Nazaire', 45),
(1398, 'Berck Sur Mer', 45),
(1402, 'Mont St. Michel', 45),
(1418, 'Carcassonne', 45),
(1426, 'Tonsberg', 137),
(1430, 'Carentan', 45),
(1434, 'Cognac', 45),
(1438, 'Dinan', 45),
(1449, 'Lourdes', 45),
(1461, 'Rochefort Sur Mer', 45),
(1465, 'Tamworth', 3),
(1469, 'Brno', 79),
(1473, 'Rouen', 45),
(1477, 'Tioman Island', 121),
(1482, 'Cesky Krumlov', 79),
(1486, 'Les Sables d''Olonne', 45),
(1490, 'Saintes', 45),
(1494, 'Saint Lo', 45),
(1502, 'Tregastel', 45),
(1506, 'Redang Island', 121),
(1511, 'Breda', 27),
(1521, 'Cameron Highlands', 121),
(1525, 'Eindhoven', 27),
(1529, 'Groningen', 27),
(1533, 'Worcester', 28),
(1537, 'Nijmegen', 27),
(1541, 'Tilburg', 27),
(1545, 'Arnhem', 27),
(1549, 'Zwolle', 27),
(1553, 'Busselton', 3),
(1565, 'La Baule', 45),
(1577, 'Bargara', 3),
(1581, 'Barossa Valley', 3),
(1585, 'Agen', 45),
(1595, 'Ales', 45),
(1599, 'Annonay', 45),
(1603, 'Arcachon', 45),
(1611, 'Arles', 45),
(1623, 'Airlie Beach', 3),
(1627, 'Aurillac', 45),
(1631, 'Auxerre', 45),
(1635, 'Swansea', 28),
(1643, 'Beaune', 45),
(1647, 'Beziers', 45),
(1654, 'Canet-en-Roussillon', 45),
(1662, 'Chinon', 45),
(1666, 'Draguignan', 45),
(1670, 'Evreux', 45),
(1693, 'Fontainebleau', 45),
(1705, 'Greoux-les-Bains', 45),
(1714, 'Royan', 45),
(1718, 'Lorient', 45),
(1723, 'Albufeira', 29),
(1727, 'Lagos', 29),
(1731, 'Vilamoura', 29),
(1735, 'Cabourg', 45),
(1739, 'Eu-Le Treport', 45),
(1751, 'Le Touquet', 45),
(1755, 'Montreuil-sur-Mer', 45),
(1759, 'Hervey Bay', 3),
(1764, 'Szekesfehervar', 31),
(1772, 'Le Mans', 45),
(1776, 'Gosford', 3),
(1792, 'Beja', 29),
(1804, 'Estremoz', 29),
(1832, 'Portimao', 29),
(1844, 'Tavira', 29),
(1884, 'Aveiro', 29),
(1892, 'Coimbra', 29),
(1916, 'Amares', 29),
(1920, 'Braga', 29),
(1924, 'Espinho', 29),
(1932, 'Guimaraes', 29),
(1978, 'Leiria', 29),
(1982, 'Obidos', 29),
(1994, 'Setubal', 29),
(2001, 'Nancy', 45),
(2015, 'Nimes', 45),
(2019, 'Perpignan', 45),
(2023, 'Kota Bharu', 121),
(2036, 'Saint-Etienne', 45),
(2046, 'Sete', 45),
(2050, 'Valence', 45),
(2054, 'Valenciennes', 45),
(2067, 'Bicheno', 3),
(2071, 'Port Arthur', 3),
(2075, 'Mount Roland', 3),
(2079, 'Riana', 3),
(2091, 'Swansea (AU)', 3),
(2095, 'Ulverstone', 3),
(2099, 'Colmar', 45),
(2103, 'Albany', 3),
(2107, 'Santiago de Compostela', 30),
(2111, 'Scamander', 3),
(2119, 'Echternach', 119),
(2124, 'Anaheim / Orange County', 5),
(2165, 'Saint Laurent du Var', 45),
(2169, 'Devonport', 3),
(2173, 'Zeehan', 3),
(2188, 'Luxembourg', 119),
(2201, 'Sitges (Barcelona)', 30),
(2205, 'Gyor', 31),
(2209, 'Saint Raphael', 45),
(2213, 'Toowoomba', 3),
(2218, 'Saint Tropez', 45),
(2222, 'Etretat', 45),
(2247, 'Crewe', 28),
(2251, 'Widnes', 28),
(2259, 'Doncaster', 28),
(2263, 'Beverley', 28),
(2267, 'Darlington', 28),
(2271, 'Grimsby', 28),
(2275, 'Halifax', 28),
(2279, 'Harrogate', 28),
(2283, 'Huddersfield', 28),
(2284, 'Milton Keynes', 28),
(2288, 'Nottingham', 28),
(2292, 'Retford', 28),
(2296, 'Sheffield', 28),
(2304, 'Cannock', 28),
(2311, 'Derby (UK)', 28),
(2315, 'Debrecen', 31),
(2319, 'Leicester', 28),
(2328, 'Ronda', 30),
(2333, 'Stafford', 28),
(2337, 'Bedford', 28),
(2341, 'Slough', 28),
(2345, 'Cheltenham', 28),
(2359, 'Birkenhead', 28),
(2367, 'Rugby', 28),
(2375, 'Harpenden', 28),
(2379, 'Newbury', 28),
(2383, 'Oxford', 28),
(2391, 'Stevenage', 28),
(2398, 'Swindon', 28),
(2402, 'Tewkesbury', 28),
(2410, 'Shrewsbury', 28),
(2414, 'Telford', 28),
(2422, 'Ipswich', 28),
(2426, 'King''s Lynn', 28),
(2430, 'Norwich', 28),
(2432, 'Harlow', 28),
(2436, 'Exeter', 28),
(2440, 'Canterbury (UK)', 28),
(2444, 'Crawley', 28),
(2448, 'Dover', 28),
(2452, 'Maidstone', 28),
(2456, 'Southampton', 28),
(2460, 'Salisbury', 28),
(2472, 'Messina', 104),
(2476, 'Montreal', 0),
(2477, 'Hanoi', 176),
(2481, 'Sopron', 31),
(2486, 'Ho Chi Minh City (Saigon)', 176),
(2490, 'Winnipeg', 0),
(2494, 'Napier', 15),
(2498, 'Mandurah', 3),
(2504, 'Salt Lake City / Park City', 5),
(2508, 'Dinard', 45),
(2517, 'Niagara Falls', 70),
(2521, 'Ottawa', 70),
(2529, 'Toronto', 70),
(2533, 'Bergerac', 45),
(2537, 'Bourges', 45),
(2541, 'Brive', 45),
(2549, 'Cahors', 45),
(2556, 'Cambrai', 45),
(2560, 'Castres', 45),
(2572, 'Cholet', 45),
(2580, 'Dax', 45),
(2585, 'Douai', 45),
(2589, 'Gap', 45),
(2605, 'Laval', 45),
(2620, 'Atlantic City', 0),
(2624, 'Macon', 45),
(2632, 'Maussac', 45),
(2636, 'Montauban', 45),
(2640, 'Montbard', 45),
(2648, 'Baltimore', 0),
(2656, 'Niort', 45),
(2660, 'Nogent-le-Rotrou', 45),
(2664, 'Noirmoutier', 45),
(2672, 'Paray-le-Monial', 45),
(2680, 'Roanne', 45),
(2684, 'Saint Flour', 45),
(2692, 'Saumur', 45),
(2697, 'Danang', 176),
(2705, 'Vancouver', 70),
(2712, 'Dalat', 176),
(2713, 'Nha Trang', 176),
(2721, 'Luneville', 45),
(2740, 'Lake Louise', 70),
(2742, 'New Plymouth', 15),
(2765, 'Vung Tau', 176),
(2769, 'Mandelieu-La-Napoule', 45),
(2773, 'Hull', 28),
(2780, 'York', 28),
(2784, 'Leeds', 28),
(2788, 'Blois', 45),
(2792, 'Bracknell', 28),
(2796, 'Warwick', 28),
(2805, 'Halong', 176),
(2815, 'Santander', 30),
(2835, 'Kaiserslautern', 91),
(2839, 'Oberhausen', 91),
(2868, 'Beechworth', 3),
(2872, 'Kristiansand', 137),
(2876, 'Haugesund', 137),
(2884, 'Hue', 176),
(2892, 'Vila Real', 29),
(2939, 'Mackay', 3),
(2943, 'Port Douglas', 3),
(2960, 'Wels', 58),
(2968, 'Bad Ischl', 58),
(3009, 'Farnham', 28),
(3013, 'London - Gatwick Airport', 28),
(3017, 'Gloucester', 28),
(3021, 'Johor Bahru', 121),
(3029, 'Pahang', 121),
(3037, 'Ayr', 28),
(3045, 'Kingscliff', 3),
(3060, 'Sintra', 29),
(3064, 'Whangamata', 15),
(3068, 'Waitomo', 15),
(3072, 'Mount Ruapehu', 15),
(3076, 'Mission Beach', 3),
(3096, 'Gore', 15),
(3103, 'Franz Josef', 15),
(3107, 'Fox Glacier', 15),
(3111, 'Punakaiki', 15),
(3115, 'Blenheim', 15),
(3119, 'Seez', 45),
(3127, 'Picton', 15),
(3131, 'Nelson', 15),
(3139, 'Zandvoort', 27),
(3162, 'Annemasse', 45),
(3166, 'Wanaka', 15),
(3176, 'Avila', 30),
(3180, 'Invercargill', 15),
(3200, 'Embrun', 45),
(3204, 'Honfleur', 45),
(3208, 'Megeve', 45),
(3218, 'St-Jean-de-Braye', 45),
(3227, 'Wavre', 63),
(3231, 'Aubagne', 45),
(3239, 'Besancon', 45),
(3269, 'Marignane', 45),
(3280, 'Plancoet', 45),
(3292, 'Saintes-Maries-de-la-Mer', 45),
(3333, 'Dessau', 91),
(3337, 'Calais', 45),
(3377, 'Meribel Mottaret', 45),
(3381, 'Igls', 58),
(3389, 'Mt Buller', 3),
(3393, 'Grasse', 45),
(3397, 'Hawaii - Oahu', 5),
(3409, 'Halls Gap', 3),
(3413, 'Aix-les-Bains', 45),
(3417, 'Bunbury', 3),
(3421, 'Bernay', 45),
(3425, 'Armidale', 3),
(3429, 'Murwillumbah', 3),
(3433, 'Naaldwijk', 27),
(3437, 'Trento', 104),
(3441, 'Treviso', 104),
(3445, 'Catania', 104),
(3453, 'Baden-Baden', 91),
(3457, 'Bad Neuenahr', 91),
(3461, 'Bad Pyrmont', 91),
(3465, 'Eisenach', 91),
(3480, 'Jena', 91),
(3484, 'Kiel', 91),
(3494, 'Konigswinter', 91),
(3502, 'Stirling', 28),
(3506, 'Konstanz', 91),
(3517, 'Troon', 28),
(3521, 'Ayrshire', 28),
(3525, 'Chalon Sur Saone', 45),
(3529, 'Blackpool', 28),
(3533, 'Mannheim', 91),
(3537, 'Derbyshire', 28),
(3548, 'Cheshire', 28),
(3556, 'Stralsund', 91),
(3560, 'North Yorkshire', 28),
(3564, 'Bintan Island (Indonesia)', 152),
(3572, 'Devon', 28),
(3580, 'Ischia Island', 104),
(3597, 'Carpi', 104),
(3601, 'Aachen', 91),
(3605, 'Deggendorf', 91),
(3609, 'Goettingen', 91),
(3618, 'Moenchengladbach', 91),
(3622, 'Wolfsburg', 91),
(3630, 'Benidorm', 30),
(3641, 'South Molle Island', 3),
(3645, 'Cape Town', 156),
(3650, 'Durban', 156),
(3655, 'Johannesburg', 156),
(3664, 'George', 156),
(3672, 'Hawaii - Kauai', 5),
(3676, 'Ballito', 156),
(3680, 'Mpumalanga', 156),
(3684, 'Hawaii - Hawaii (Big Island)', 5),
(3688, 'Sandton', 156),
(3692, 'Hawaii - Maui', 5),
(3704, 'White River', 156),
(3712, 'Hazyview', 156),
(3732, 'Alencon', 45),
(3756, 'La Grande Motte', 45),
(3760, 'Plettenberg Bay', 156),
(3764, 'Troyes', 45),
(3777, 'Bagnoles-de-l''Orne', 45),
(3781, 'Drakensberg', 156),
(3789, 'Epernay', 45),
(3804, 'Saint Omer', 45),
(3815, 'Western Cape', 156),
(3837, 'Mildura', 3),
(3841, 'Mossel Bay', 156),
(3845, 'Tarragona', 30),
(3853, 'Parma', 104),
(3873, 'Praiano', 104),
(3877, 'Pforzheim', 91),
(3889, 'Agrigento', 104),
(3906, 'Northampton', 28),
(3910, 'Cambridge (UK)', 28),
(3914, 'Peterborough', 28),
(3918, 'Plymouth', 28),
(3929, 'Solihull', 28),
(3933, 'St. Albans', 28),
(3937, 'Stoke on Trent', 28),
(3941, 'Winchester', 28),
(3945, 'Watford', 28),
(3949, 'Dartford', 28),
(3962, 'Ile de Re', 45),
(3966, 'Kortrijk', 63),
(3970, 'Szeged', 31),
(3984, 'Wild Coast', 156),
(3989, 'Sun City', 156),
(4000, 'Saint Maximin', 45),
(4004, 'Le Creusot', 45),
(4027, 'Windsor', 28),
(4031, 'Montecatini Terme', 104),
(4035, 'Perth (UK)', 28),
(4043, 'Les Arcs', 45),
(4047, 'Carnac', 45),
(4051, 'Cumbria', 28),
(4067, 'Argyll', 28),
(4083, 'Chantilly', 45),
(4095, 'Vigo', 30),
(4107, 'Yangon', 240),
(4115, 'Makassar', 101),
(4127, 'Grosseto', 104),
(4131, 'Versilia', 104),
(4193, 'Daylesford', 3),
(4201, 'Lleida', 30),
(4209, 'Ferrara', 104),
(4213, 'Reading', 28),
(4217, 'Cagnes Sur Mer', 45),
(4233, 'Poole', 28),
(4241, 'Orange', 45),
(4249, 'Irvine', 28),
(4254, 'Rimini', 104),
(4272, 'Innisfail', 3),
(4292, 'Maratea', 104),
(4296, 'Sardinia', 104),
(4300, 'Ordino', 53),
(4304, 'Lleida - Vielha', 30),
(4308, 'Vall d''Incles', 53),
(4312, 'Pas de la Casa', 53),
(4316, 'Canillo', 53),
(4320, 'Andorra la Vella', 53),
(4324, 'Les Escaldes', 53),
(4328, 'Arinsal', 53),
(4332, 'Soldeu', 53),
(4365, 'Hereford', 28),
(4391, 'La Tour de Salvagny', 45),
(4402, 'Mechelen', 63),
(4406, 'La Roche Sur Yon', 45),
(4421, 'Genk', 63),
(4425, 'Yarrawonga', 3),
(4430, 'Ceuta', 30),
(4434, 'Thredbo Village', 3),
(4442, 'Hawaii - Molokai', 5),
(4454, 'Augsburg', 91),
(4455, 'Chemnitz', 91),
(4458, 'Celle', 91),
(4461, 'Ostsee', 91),
(4463, 'Luebeck', 91),
(4464, 'Juist', 91),
(4466, 'Regensburg', 91),
(4468, 'Schleswig', 91),
(4472, 'Sylt', 91),
(4475, 'Lake Balaton', 31),
(4489, 'Echuca', 3),
(4490, 'Phoenix', 0),
(4494, 'Barcelona Province', 30),
(4505, 'Arosa', 32),
(4514, 'Flims', 32),
(4518, 'Davos-Platz', 32),
(4526, 'Bukfurdo', 31),
(4532, 'Lenzerheide', 32),
(4536, 'Wengen', 32),
(4540, 'Alicante Province', 30),
(4541, 'Tapolca', 31),
(4544, 'Huelva Province', 30),
(4553, 'Brandenburg', 91),
(4554, 'Waterloo', 63),
(4555, 'Tournai', 63),
(4559, 'Heviz', 31),
(4578, 'Rio de Janeiro', 66),
(4579, 'Oranjestad', 186),
(4580, 'Fortaleza', 66),
(4581, 'Sao Paulo', 66),
(4582, 'Thunder Bay', 70),
(4583, 'Santiago', 72),
(4584, 'Zagreb', 77),
(4585, 'Larnaca', 78),
(4587, 'Randers', 80),
(4588, 'Cairo', 83),
(4589, 'Espoo', 88),
(4590, 'Wiesbaden', 91),
(4591, 'Winterberg', 91),
(4625, 'Istanbul', 166),
(4626, 'Abu Dhabi', 172),
(4627, 'Dubai', 172),
(4628, 'Ludwigshafen', 91),
(4629, 'Charlevoix', 70),
(4632, 'Halifax', 0),
(4633, 'Jasper', 70),
(4634, 'Banff', 0),
(4635, 'Cuxhaven', 91),
(4639, 'Lacanau', 45),
(4649, 'Breisach', 91),
(4650, 'Hohwacht', 91),
(4652, 'Usedom Island', 91),
(4653, 'Bad Salzuflen', 91),
(4659, 'Saarbruecken', 91),
(4660, 'Slenaken', 27),
(4661, 'Olympia', 93),
(4665, 'Middlesbrough', 28),
(4670, 'Smithton', 3),
(4695, 'New Delhi', 100),
(4697, 'Mumbai (Bombay)', 100),
(4701, 'Sabah', 121),
(4706, 'Schwerin', 91),
(4718, 'Taree', 3),
(4720, 'Sheffield (AU)', 3),
(4728, 'Harrow', 28),
(4729, 'Egerkingen', 32),
(4731, 'Kassel', 91),
(4732, 'Marianske Lazne', 79),
(4741, 'Lesvos Island', 93),
(4746, 'Rostock', 91),
(4748, 'Kaprun', 58),
(4749, 'Krems', 58),
(4750, 'Tampa / St. Petersburg', 5),
(4755, 'San Antonio', 0),
(4756, 'Austin', 0),
(4757, 'Liberec', 79),
(4760, 'Eretria', 93),
(4765, 'Shizuoka', 106),
(4766, 'Kagoshima', 106),
(4767, 'Sendai', 106),
(4768, 'Fort Lauderdale / Hollywood', 5),
(4769, 'Yokohama', 106),
(4787, 'Noordwijk', 27),
(4791, 'Naarden', 27),
(4808, 'Zutphen', 27),
(4811, 'Southern Highlands', 3),
(4812, 'Gisborne', 15),
(4813, 'Ohakune', 15),
(4814, 'Orewa Beach', 15),
(4819, 'Turangi', 15),
(4821, 'Wanganui', 15),
(4823, 'Whitianga', 15),
(4836, 'Ashburton', 15),
(4841, 'Leiden', 27),
(4842, 'Cromwell', 15),
(4843, 'Haast', 15),
(4844, 'Kaikoura', 15),
(4845, 'Hokitika', 15),
(4846, 'Omarama', 15),
(4847, 'Timaru', 15),
(4848, 'Twizel', 15),
(4849, 'Westport', 15),
(4857, 'Hamilton (AU)', 3),
(4875, 'Minneapolis / St. Paul', 5),
(4876, 'Cincinnati', 0),
(4878, 'St. Louis', 0),
(4879, 'Nashville', 0),
(4883, 'Modena', 104),
(4888, 'Piacenza', 104),
(4892, 'Trieste', 104),
(4893, 'Ostrava', 79),
(4894, 'Beijing', 73),
(4895, 'Sun Peaks', 70),
(4903, 'Victoria', 0),
(4904, 'London', 0),
(4905, 'Saskatoon', 70),
(4907, 'Cranbrook', 70);

-- --------------------------------------------------------

--
-- Table structure for table `wp_hotelclub_countries`
--

CREATE TABLE IF NOT EXISTS `wp_hotelclub_countries` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_hotelclub_countries`
--

INSERT INTO `wp_hotelclub_countries` (`id`, `name`) VALUES
(52, 'Algeria'),
(53, 'Andorra'),
(191, 'Antigua & Barbuda'),
(55, 'Argentina'),
(186, 'Aruba'),
(3, 'Australia'),
(58, 'Austria'),
(189, 'Bahamas'),
(60, 'Bahrain'),
(61, 'Bangladesh'),
(190, 'Barbados'),
(63, 'Belgium'),
(192, 'Belize'),
(194, 'Bermuda'),
(64, 'Bolivia'),
(65, 'Bosnia & Herzegovina'),
(66, 'Brazil'),
(67, 'Brunei'),
(68, 'Bulgaria'),
(108, 'Cambodia'),
(70, 'Canada'),
(202, 'Cayman Islands'),
(72, 'Chile'),
(73, 'China'),
(74, 'Colombia'),
(206, 'Cook Islands'),
(76, 'Costa Rica'),
(77, 'Croatia'),
(78, 'Cyprus'),
(79, 'Czech Republic'),
(80, 'Denmark'),
(210, 'Dominica'),
(81, 'Dominican Republic'),
(82, 'Ecuador'),
(83, 'Egypt'),
(85, 'Estonia'),
(87, 'Fiji'),
(88, 'Finland'),
(45, 'France'),
(274, 'French Polynesia'),
(91, 'Germany'),
(93, 'Greece'),
(220, 'Grenada'),
(221, 'Guadeloupe'),
(343, 'Guam'),
(97, 'Hong Kong'),
(31, 'Hungary'),
(99, 'Iceland'),
(100, 'India'),
(101, 'Indonesia'),
(102, 'Ireland'),
(103, 'Israel'),
(104, 'Italy'),
(105, 'Jamaica'),
(106, 'Japan'),
(107, 'Jordan'),
(109, 'Kazakhstan'),
(110, 'Kenya'),
(111, 'Kuwait'),
(113, 'Laos'),
(114, 'Latvia'),
(115, 'Lebanon'),
(118, 'Lithuania'),
(119, 'Luxembourg'),
(183, 'Macau'),
(121, 'Malaysia'),
(233, 'Maldives'),
(123, 'Malta'),
(234, 'Martinique'),
(236, 'Mauritius'),
(124, 'Mexico'),
(126, 'Monaco'),
(348, 'Montenegro'),
(128, 'Morocco'),
(240, 'Myanmar'),
(130, 'Namibia'),
(131, 'Nepal'),
(27, 'Netherlands'),
(242, 'Netherlands Antilles'),
(182, 'New Caledonia'),
(15, 'New Zealand'),
(134, 'Nicaragua'),
(243, 'Norfolk Island'),
(276, 'Northern Mariana Islands'),
(137, 'Norway'),
(244, 'Oman'),
(138, 'Pakistan'),
(245, 'Palau'),
(139, 'Panama'),
(140, 'Papua New Guinea'),
(141, 'Paraguay'),
(142, 'Peru'),
(143, 'Philippines'),
(144, 'Poland'),
(29, 'Portugal'),
(312, 'Puerto Rico'),
(248, 'Qatar'),
(249, 'Reunion'),
(146, 'Romania'),
(147, 'Russia'),
(257, 'Saint Kitts & Nevis'),
(258, 'Saint Lucia'),
(346, 'Saint Martin / Sint Maarten'),
(263, 'Saint Vincent & The Grenadines'),
(289, 'Samoa'),
(265, 'San Marino'),
(149, 'Saudi Arabia'),
(178, 'Serbia'),
(268, 'Seychelles'),
(152, 'Singapore'),
(153, 'Slovakia'),
(154, 'Slovenia'),
(270, 'Solomon Islands'),
(156, 'South Africa'),
(157, 'South Korea'),
(30, 'Spain'),
(271, 'Sri Lanka'),
(160, 'Sweden'),
(32, 'Switzerland'),
(291, 'Syria'),
(162, 'Taiwan'),
(275, 'Tanzania'),
(48, 'Thailand'),
(280, 'Trinidad & Tobago'),
(165, 'Tunisia'),
(166, 'Turkey'),
(283, 'Turks & Caicos Islands'),
(171, 'Ukraine'),
(172, 'United Arab Emirates'),
(28, 'United Kingdom'),
(5, 'United States'),
(173, 'Uruguay'),
(174, 'Uzbekistan'),
(286, 'Vanuatu'),
(175, 'Venezuela'),
(176, 'Vietnam'),
(198, 'Virgin Islands'),
(285, 'Virgin Islands'),
(177, 'Yemen');

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=400 ;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/hosmos2', 'yes'),
(2, 'blogname', 'Отель &quot;Хосмос&quot;', 'yes'),
(3, 'blogdescription', 'Ещё один сайт на WordPress', 'yes'),
(4, 'users_can_register', '0', 'yes'),
(5, 'admin_email', 'arhibober@gmail.com', 'yes'),
(6, 'start_of_week', '1', 'yes'),
(7, 'use_balanceTags', '0', 'yes'),
(8, 'use_smilies', '1', 'yes'),
(9, 'require_name_email', '1', 'yes'),
(10, 'comments_notify', '1', 'yes'),
(11, 'posts_per_rss', '10', 'yes'),
(12, 'rss_use_excerpt', '0', 'yes'),
(13, 'mailserver_url', 'mail.example.com', 'yes'),
(14, 'mailserver_login', 'login@example.com', 'yes'),
(15, 'mailserver_pass', 'password', 'yes'),
(16, 'mailserver_port', '110', 'yes'),
(17, 'default_category', '1', 'yes'),
(18, 'default_comment_status', 'open', 'yes'),
(19, 'default_ping_status', 'open', 'yes'),
(20, 'default_pingback_flag', '1', 'yes'),
(21, 'posts_per_page', '10', 'yes'),
(22, 'date_format', 'd.m.Y', 'yes'),
(23, 'time_format', 'H:i', 'yes'),
(24, 'links_updated_date_format', 'd.m.Y H:i', 'yes'),
(25, 'comment_moderation', '0', 'yes'),
(26, 'moderation_notify', '1', 'yes'),
(27, 'permalink_structure', '', 'yes'),
(28, 'gzipcompression', '0', 'yes'),
(29, 'hack_file', '0', 'yes'),
(30, 'blog_charset', 'UTF-8', 'yes'),
(31, 'moderation_keys', '', 'no'),
(32, 'active_plugins', 'a:2:{i:9;s:17:"hostel/hostel.php";i:13;s:29:"openitaly4wp/openitaly4wp.php";}', 'yes'),
(33, 'home', 'http://localhost/hosmos2', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'advanced_edit', '0', 'yes'),
(37, 'comment_max_links', '2', 'yes'),
(38, 'gmt_offset', '4', 'yes'),
(39, 'default_email_category', '1', 'yes'),
(40, 'recently_edited', '', 'no'),
(41, 'template', 'twentythirteen', 'yes'),
(42, 'stylesheet', 'twentythirteen', 'yes'),
(43, 'comment_whitelist', '1', 'yes'),
(44, 'blacklist_keys', '', 'no'),
(45, 'comment_registration', '0', 'yes'),
(46, 'html_type', 'text/html', 'yes'),
(47, 'use_trackback', '0', 'yes'),
(48, 'default_role', 'subscriber', 'yes'),
(49, 'db_version', '27916', 'yes'),
(50, 'uploads_use_yearmonth_folders', '1', 'yes'),
(51, 'upload_path', '', 'yes'),
(52, 'blog_public', '1', 'yes'),
(53, 'default_link_category', '2', 'yes'),
(54, 'show_on_front', 'page', 'yes'),
(55, 'tag_base', '', 'yes'),
(56, 'show_avatars', '1', 'yes'),
(57, 'avatar_rating', 'G', 'yes'),
(58, 'upload_url_path', '', 'yes'),
(59, 'thumbnail_size_w', '150', 'yes'),
(60, 'thumbnail_size_h', '150', 'yes'),
(61, 'thumbnail_crop', '1', 'yes'),
(62, 'medium_size_w', '300', 'yes'),
(63, 'medium_size_h', '300', 'yes'),
(64, 'avatar_default', 'mystery', 'yes'),
(65, 'large_size_w', '1024', 'yes'),
(66, 'large_size_h', '1024', 'yes'),
(67, 'image_default_link_type', 'file', 'yes'),
(68, 'image_default_size', '', 'yes'),
(69, 'image_default_align', '', 'yes'),
(70, 'close_comments_for_old_posts', '0', 'yes'),
(71, 'close_comments_days_old', '14', 'yes'),
(72, 'thread_comments', '1', 'yes'),
(73, 'thread_comments_depth', '5', 'yes'),
(74, 'page_comments', '0', 'yes'),
(75, 'comments_per_page', '50', 'yes'),
(76, 'default_comments_page', 'newest', 'yes'),
(77, 'comment_order', 'asc', 'yes'),
(78, 'sticky_posts', 'a:0:{}', 'yes'),
(79, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_text', 'a:0:{}', 'yes'),
(81, 'widget_rss', 'a:0:{}', 'yes'),
(82, 'uninstall_plugins', 'a:2:{s:21:"guestapp/guestapp.php";s:9:"uninstall";s:24:"booking-system/dopbs.php";s:25:"DOPBookingSystemUninstall";}', 'no'),
(83, 'timezone_string', '', 'yes'),
(84, 'page_for_posts', '0', 'yes'),
(85, 'page_on_front', '8', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'initial_db_version', '27916', 'yes'),
(89, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:62:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(90, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(91, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(92, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(93, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'sidebars_widgets', 'a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:13:"array_version";i:3;}', 'yes'),
(96, 'cron', 'a:6:{i:1405456727;a:1:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1405456728;a:2:{s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1405481220;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1405500328;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1405525219;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(98, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:2:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:65:"https://downloads.wordpress.org/release/ru_RU/wordpress-3.9.1.zip";s:6:"locale";s:5:"ru_RU";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:65:"https://downloads.wordpress.org/release/ru_RU/wordpress-3.9.1.zip";s:10:"no_content";b:0;s:11:"new_bundled";b:0;s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"3.9.1";s:7:"version";s:5:"3.9.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"3.8";s:15:"partial_version";s:0:"";}i:1;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-3.9.1.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-3.9.1.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-3.9.1-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-3.9.1-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"3.9.1";s:7:"version";s:5:"3.9.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"3.8";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1405438029;s:15:"version_checked";s:5:"3.9.1";s:12:"translations";a:0:{}}', 'yes'),
(103, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1405438030;s:7:"checked";a:4:{s:9:"theme1943";s:0:"";s:14:"twentyfourteen";s:3:"1.1";s:14:"twentythirteen";s:3:"1.2";s:12:"twentytwelve";s:3:"1.4";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'yes'),
(104, '_site_transient_timeout_browser_48249c808fd6667d37bfc0e0b286867c', '1405845542', 'yes'),
(105, '_site_transient_browser_48249c808fd6667d37bfc0e0b286867c', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"30.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(106, 'can_compress_scripts', '1', 'yes'),
(123, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1405251929', 'yes'),
(124, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'a:40:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";s:4:"4463";}s:4:"post";a:3:{s:4:"name";s:4:"Post";s:4:"slug";s:4:"post";s:5:"count";s:4:"2778";}s:6:"plugin";a:3:{s:4:"name";s:6:"plugin";s:4:"slug";s:6:"plugin";s:5:"count";s:4:"2683";}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";s:4:"2196";}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";s:4:"2110";}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";s:4:"1756";}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";s:4:"1553";}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";s:4:"1513";}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";s:4:"1465";}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";s:4:"1449";}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";s:4:"1401";}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";s:4:"1340";}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";s:4:"1308";}s:8:"facebook";a:3:{s:4:"name";s:8:"Facebook";s:4:"slug";s:8:"facebook";s:5:"count";s:4:"1157";}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";s:4:"1116";}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";s:4:"1096";}s:9:"wordpress";a:3:{s:4:"name";s:9:"wordpress";s:4:"slug";s:9:"wordpress";s:5:"count";s:3:"999";}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";s:3:"955";}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";s:3:"955";}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";s:3:"789";}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";s:3:"782";}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";s:3:"781";}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";s:3:"769";}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";s:3:"766";}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";s:3:"703";}s:4:"ajax";a:3:{s:4:"name";s:4:"AJAX";s:4:"slug";s:4:"ajax";s:5:"count";s:3:"678";}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";s:3:"662";}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";s:3:"651";}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";s:3:"619";}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";s:3:"610";}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";s:3:"592";}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";s:3:"583";}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";s:3:"579";}s:5:"login";a:3:{s:4:"name";s:5:"login";s:4:"slug";s:5:"login";s:5:"count";s:3:"579";}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";s:3:"568";}s:8:"category";a:3:{s:4:"name";s:8:"category";s:4:"slug";s:8:"category";s:5:"count";s:3:"532";}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";s:3:"525";}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";s:3:"524";}s:8:"security";a:3:{s:4:"name";s:8:"security";s:4:"slug";s:8:"security";s:5:"count";s:3:"510";}s:5:"share";a:3:{s:4:"name";s:5:"Share";s:4:"slug";s:5:"share";s:5:"count";s:3:"507";}}', 'yes'),
(126, 'wphostel_currency', 'USD', 'yes'),
(127, 'wphostel_version', '0.72', 'yes'),
(128, 'recently_activated', 'a:19:{s:57:"wp-simple-booking-calendar/wp-simple-booking-calendar.php";i:1405438951;s:47:"igumbi-online-booking/igumbi-online-booking.php";i:1405438943;s:41:"guestcentric-booking-gadget/gcbooking.php";i:1405438937;s:21:"guestapp/guestapp.php";i:1405438936;s:37:"easyreservations/easyReservations.php";i:1405438935;s:22:"chotcal/wp_chotcal.php";i:1405438930;s:39:"wp-booking-system/wp-booking-system.php";i:1405438929;s:31:"travel-search/travel-search.php";i:1405438928;s:60:"simple-booking-form-wordpress-plugin/simple-booking-form.php";i:1405438922;s:33:"sb-hotel-rooms/sb_hotel_rooms.php";i:1405438921;s:21:"resaline/resaline.php";i:1405438919;s:41:"paltscom-hotel-booking-calendar/palts.php";i:1405438918;s:30:"mp-booking/mp-booking-form.php";i:1405438917;s:17:"jomres/jomres.php";i:1405438916;s:44:"cp-reservation-calendar/dex_reservations.php";i:1405438907;s:24:"booking-system/dopbs.php";i:1405438898;s:25:"booking/wpdev-booking.php";i:1405438897;s:55:"bookingcom-affiliate-plugin/booking-com-affiliation.php";i:1405438896;s:64:"bookcottages-availability-calendar/availability-BookCottages.php";i:1405438894;}', 'yes'),
(131, '_transient_twentyfourteen_category_count', '1', 'yes'),
(132, 'theme_mods_twentyfourteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1405241214;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(133, 'current_theme', 'Twenty Thirteen', 'yes'),
(134, 'theme_mods_twentythirteen', 'a:2:{i:0;b:0;s:18:"nav_menu_locations";a:0:{}}', 'yes'),
(135, 'theme_switched', '', 'yes'),
(137, 'reservations_main_permission', 'a:4:{s:9:"dashboard";s:10:"edit_posts";s:10:"statistics";s:10:"edit_posts";s:9:"resources";s:10:"edit_posts";s:8:"settings";s:10:"edit_posts";}', 'yes'),
(138, 'reservations_email_to_user', 'a:3:{s:3:"msg";s:313:"We''ve got your reservaion and treat it as soon as possible.<br><br>\r\nReservation Details:<br>\r\nID: [ID]<br>Name: [thename] <br>Email: [email] <br>From: [arrival] <br>To: [departure] <br>Persons: [adults] <br>Children: [childs] <br>Resource: [resource] <br>Price: [price]<br><br>edit your reservation on [editlink]";s:4:"subj";s:55:"Your Reservation on Отель &quot;Хосмос&quot;";s:6:"active";i:1;}', 'no'),
(139, 'reservations_email_to_userapp', 'a:3:{s:3:"msg";s:317:"Your Reservation on Blogname has been approved.<br>\r\n[adminmessage]<br><br>\r\nReservation Details:<br>\r\nID: [ID]<br>Name: [thename] <br>Email: [email] <br>From: [arrival] <br>To: [departure] <br>Persons: [adults] <br>Children: [childs] <br>Resource: [resource] <br>Price: [price]<br>edit your reservation on [editlink]";s:4:"subj";s:73:"Your Reservation on Отель &quot;Хосмос&quot; has been approved";s:6:"active";i:1;}', 'no'),
(140, 'reservations_email_to_userdel', 'a:3:{s:3:"msg";s:300:"Your Reservation on Blogname has been rejected.<br>\r\n[adminmessage]<br> <br>\r\nReservation Details:<br>\r\nID: [ID]<br>Name: [thename] <br>Email: [email] <br>From: [arrival] <br>To: [departure] <br>Persons: [adults] <br>Children: [childs] <br>Resource: [resource] <br>edit your reservation on [editlink]";s:4:"subj";s:73:"Your Reservation on Отель &quot;Хосмос&quot; has been rejected";s:6:"active";i:1;}', 'no'),
(141, 'reservations_email_to_admin', 'a:3:{s:3:"msg";s:213:"New Reservation on Blogname from<br>\r\nID: [ID]<br>Name: [thename] <br>Email: [email] <br>From: [arrival] <br>To: [departure] <br>Persons: [adults] <br>Children: [childs] <br>Resource: [resource] <br>Price: [price]";s:4:"subj";s:54:"New Reservation at Отель &quot;Хосмос&quot;";s:6:"active";i:1;}', 'no'),
(142, 'reservations_email_to_user_edited', 'a:3:{s:3:"msg";s:379:"Your reservation got edited from you. If this wasnt you, please contact us through this email address.<br><br>\r\nNew Reservation Details:<br>\r\nID: [ID]<br>Name: [thename] <br>Email: [email] <br>From: [arrival] <br>To: [departure] <br>Persons: [adults] <br>Children: [childs] <br>Resource: [resource] <br>Price: [price]<br><br>edit your reservation on [editlink]<br><br>[changelog]";s:4:"subj";s:66:"Your Reservation on Отель &quot;Хосмос&quot; got edited";s:6:"active";i:1;}', 'no'),
(143, 'reservations_email_to_admin_edited', 'a:3:{s:3:"msg";s:266:"Reservation got edited by Guest.<br><br>\r\nNew Reservation Details:<br>\r\nID: [ID]<br>Name: [thename] <br>Email: [email] <br>From: [arrival] <br>To: [departure] <br>Persons: [adults] <br>Children: [childs] <br>Resource: [resource] <br>Price: [price]<br><br>[changelog]";s:4:"subj";s:69:"Reservation on Отель &quot;Хосмос&quot; got edited by user";s:6:"active";i:1;}', 'no'),
(144, 'reservations_email_to_user_admin_edited', 'a:3:{s:3:"msg";s:334:"Your reservation got edited by admin.<br><br>\r\n[adminmessage]<br>\r\nNew Reservation Details:<br>\r\nID: [ID]<br>Name: [thename] <br>Email: [email] <br>From: [arrival] <br>To: [departure] <br>Persons: [adults] <br>Children: [childs] <br>Resource: [resource] <br>Price: [price]<br><br>edit your reservation on [editlink]<br><br>[changelog]";s:4:"subj";s:70:"Reservation on Отель &quot;Хосмос&quot; got edited by admin";s:6:"active";i:1;}', 'no'),
(145, 'reservations_email_sendmail', 'a:3:{s:3:"msg";s:264:"[adminmessage]<br><br>\r\nReservation Details:<br>\r\nID: [ID]<br>Name: [thename] <br>Email: [email] <br>From: [arrival] <br>To: [departure] <br>Persons: [adults] <br>Children: [childs] <br>Resource: [resource] <br>Price: [price]<br>edit your reservation on [editlink]";s:4:"subj";s:48:"Message from Отель &quot;Хосмос&quot;";s:6:"active";i:1;}', 'no'),
(146, 'reservations_uninstall', '1', 'no'),
(147, 'reservations_form', '[error]\r\n<h1>Reserve now![show_price style="float:right;"]</h1>\r\n<h2>General information</h2>\r\n\r\n<label>Arrival Date\r\n<span class="small">When will you come?</span>\r\n</label><span class="row">[date-from style="width:75px"] [date-from-hour style="width:50px" value="12"]:[date-from-min style="width:50px"]</span>\r\n\r\n<label>Departure Date\r\n<span class="small">When will you go?</span>\r\n</label><span class="row">[date-to style="width:75px"] [date-to-hour style="width:50px" value="12"]:[date-to-min style="width:50px"]</span>\r\n\r\n<label>Resource\r\n<span class="small">What do you want?</span>\r\n</label>[resources]\r\n\r\n<label>Adults\r\n<span class="small">How many guests?</span>\r\n</label>[adults 1 10]\r\n\r\n<label>Children&rsquo;s	\r\n<span class="small">With children?</span>\r\n</label>[childs 0 10]\r\n\r\n<h2>Personal information</h2>\r\n\r\n<label>Name\r\n<span class="small">What is your name?</span>\r\n</label>[thename]\r\n\r\n<label>Email\r\n<span class="small">What is your email?</span>\r\n</label>[email]\r\n\r\n<label>Country\r\n<span class="small">Your country?</span>\r\n</label>[country]\r\n\r\n<label>Captcha\r\n<span class="small">Type in code</span>\r\n</label>[captcha]\r\n\r\n<div style="text-align:center;">[submit Send]</div>', 'no'),
(148, 'reservations_regular_guests', '', 'no'),
(149, 'reservations_edit_url', '', 'yes'),
(150, 'reservations_price_per_persons', '1', 'yes'),
(151, 'reservations_on_page', '10', 'no'),
(152, 'reservations_support_mail', '', 'yes'),
(153, 'reservations_db_version', '3.2.1', 'yes'),
(154, 'reservations_main_options', 'a:3:{s:4:"show";a:6:{s:13:"show_overview";i:1;s:10:"show_table";i:1;s:13:"show_upcoming";i:1;s:8:"show_new";i:1;s:11:"show_export";i:1;s:10:"show_today";i:1;}s:5:"table";a:28:{s:11:"table_color";i:1;s:8:"table_id";i:0;s:10:"table_name";i:1;s:10:"table_from";i:1;s:8:"table_to";i:1;s:12:"table_nights";i:1;s:11:"table_email";i:1;s:9:"table_fav";i:1;s:10:"table_room";i:1;s:13:"table_exactly";i:1;s:11:"table_offer";i:1;s:13:"table_persons";i:1;s:12:"table_childs";i:1;s:13:"table_country";i:1;s:13:"table_message";i:0;s:12:"table_custom";i:0;s:13:"table_customp";i:0;s:10:"table_paid";i:0;s:11:"table_price";i:1;s:18:"table_filter_month";i:1;s:17:"table_filter_room";i:1;s:18:"table_filter_offer";i:1;s:17:"table_filter_days";i:1;s:12:"table_search";i:1;s:10:"table_bulk";i:1;s:17:"table_onmouseover";i:1;s:16:"table_reservated";i:0;s:12:"table_status";i:1;}s:8:"overview";a:5:{s:20:"overview_onmouseover";i:1;s:19:"overview_autoselect";i:1;s:18:"overview_show_days";i:30;s:19:"overview_show_rooms";s:0:"";s:19:"overview_show_avail";i:1;}}', 'no'),
(155, 'reservations_edit_options', 'a:8:{s:10:"login_text";s:0:"";s:9:"edit_text";s:0:"";s:11:"submit_text";s:31:"Reservation successfully edited";s:11:"table_infos";a:4:{i:0;s:4:"date";i:1;s:6:"status";i:2;s:5:"price";i:3;s:4:"room";}s:12:"table_status";a:3:{i:0;s:0:"";i:1;s:3:"yes";i:2;s:2:"no";}s:10:"table_time";a:3:{i:0;s:4:"past";i:1;s:7:"current";i:2;s:6:"future";}s:11:"table_style";i:1;s:10:"table_more";i:1;}', 'no'),
(156, 'reservations_settings', 'a:6:{s:5:"style";s:7:"greyfat";s:8:"interval";i:86400;s:8:"currency";s:3:"#36";s:11:"date_format";s:5:"d.m.Y";s:4:"time";i:1;s:8:"tutorial";i:1;}', 'yes'),
(160, 'booking_version_num', '5.1.5', 'yes'),
(161, 'booking_admin_cal_count', '2', 'yes'),
(162, 'booking_skin', '/css/skins/traditional.css', 'yes'),
(163, 'bookings_num_per_page', '10', 'yes'),
(164, 'booking_sort_order', '', 'yes'),
(165, 'booking_default_toolbar_tab', 'filter', 'yes'),
(166, 'bookings_listing_default_view_mode', 'vm_calendar', 'yes'),
(167, 'booking_view_days_num', '90', 'yes'),
(168, 'booking_max_monthes_in_calendar', '1y', 'yes'),
(169, 'booking_client_cal_count', '1', 'yes'),
(170, 'booking_start_day_weeek', '0', 'yes'),
(171, 'booking_title_after_reservation', 'Thank you for your online booking.  We will send confirmation of your booking as soon as possible.', 'yes'),
(172, 'booking_title_after_reservation_time', '7000', 'yes'),
(173, 'booking_type_of_thank_you_message', 'message', 'yes'),
(174, 'booking_thank_you_page_URL', '/thank-you', 'yes'),
(175, 'booking_is_use_autofill_4_logged_user', 'Off', 'yes'),
(176, 'booking_date_format', 'd.m.Y', 'yes'),
(177, 'booking_date_view_type', 'short', 'yes'),
(178, 'booking_is_delete_if_deactive', 'Off', 'yes'),
(179, 'booking_dif_colors_approval_pending', 'On', 'yes'),
(180, 'booking_is_use_hints_at_admin_panel', 'On', 'yes'),
(181, 'booking_is_not_load_bs_script_in_client', 'Off', 'yes'),
(182, 'booking_is_not_load_bs_script_in_admin', 'Off', 'yes'),
(183, 'booking_type_of_day_selections', 'multiple', 'yes'),
(184, 'booking_form_is_using_bs_css', 'On', 'yes'),
(185, 'booking_form_format_type', 'vertical', 'yes'),
(186, 'booking_form_field_active1', 'On', 'yes'),
(187, 'booking_form_field_required1', 'On', 'yes'),
(188, 'booking_form_field_label1', 'First Name', 'yes'),
(189, 'booking_form_field_active2', 'On', 'yes'),
(190, 'booking_form_field_required2', 'On', 'yes'),
(191, 'booking_form_field_label2', 'Last Name', 'yes'),
(192, 'booking_form_field_active3', 'On', 'yes'),
(193, 'booking_form_field_required3', 'On', 'yes'),
(194, 'booking_form_field_label3', 'Email', 'yes'),
(195, 'booking_form_field_active4', 'On', 'yes'),
(196, 'booking_form_field_required4', 'Off', 'yes'),
(197, 'booking_form_field_label4', 'Phone', 'yes'),
(198, 'booking_form_field_active5', 'On', 'yes'),
(199, 'booking_form_field_required5', 'Off', 'yes'),
(200, 'booking_form_field_label5', 'Details', 'yes'),
(201, 'booking_unavailable_days_num_from_today', '0', 'yes'),
(202, 'booking_unavailable_day0', 'Off', 'yes'),
(203, 'booking_unavailable_day1', 'Off', 'yes'),
(204, 'booking_unavailable_day2', 'Off', 'yes'),
(205, 'booking_unavailable_day3', 'Off', 'yes'),
(206, 'booking_unavailable_day4', 'Off', 'yes'),
(207, 'booking_unavailable_day5', 'Off', 'yes'),
(208, 'booking_unavailable_day6', 'Off', 'yes'),
(209, 'booking_user_role_booking', 'editor', 'yes'),
(210, 'booking_user_role_addbooking', 'editor', 'yes'),
(211, 'booking_user_role_resources', 'editor', 'yes'),
(212, 'booking_user_role_settings', 'administrator', 'yes'),
(213, 'booking_email_reservation_adress', '&quot;Booking system&quot; &lt;arhibober@gmail.com&gt;', 'yes'),
(214, 'booking_email_reservation_from_adress', '[visitoremail]', 'yes'),
(215, 'booking_email_reservation_subject', 'New booking', 'yes'),
(216, 'booking_email_reservation_content', 'You need to approve a new booking [bookingtype] for: [dates]&lt;br/&gt;&lt;br/&gt; Person detail information:&lt;br/&gt; [content]&lt;br/&gt;&lt;br/&gt; Currently a new booking is waiting for approval. Please visit the moderation panel [moderatelink]&lt;br/&gt;&lt;br/&gt;Thank you, Отель &amp;quot;Хосмос&amp;quot;&lt;br/&gt;[siteurl]', 'yes'),
(217, 'booking_email_approval_adress', '&quot;Booking system&quot; &lt;arhibober@gmail.com&gt;', 'yes'),
(218, 'booking_email_approval_subject', 'Your booking has been approved', 'yes'),
(219, 'booking_email_approval_content', 'Your booking [bookingtype] for: [dates] has been approved.&lt;br/&gt;&lt;br/&gt;[content]&lt;br/&gt;&lt;br/&gt;Thank you, Отель &amp;quot;Хосмос&amp;quot;&lt;br/&gt;[siteurl]', 'yes'),
(220, 'booking_email_deny_adress', '&quot;Booking system&quot; &lt;arhibober@gmail.com&gt;', 'yes'),
(221, 'booking_email_deny_subject', 'Your booking has been declined', 'yes'),
(222, 'booking_email_deny_content', 'Your booking [bookingtype] for: [dates] has been  canceled. &lt;br/&gt;&lt;br/&gt;[denyreason]&lt;br/&gt;&lt;br/&gt;[content]&lt;br/&gt;&lt;br/&gt;Thank you, Отель &amp;quot;Хосмос&amp;quot;&lt;br/&gt;[siteurl]', 'yes'),
(223, 'booking_is_email_reservation_adress', 'On', 'yes'),
(224, 'booking_is_email_approval_adress', 'On', 'yes'),
(225, 'booking_is_email_deny_adress', 'On', 'yes'),
(226, 'booking_widget_title', 'Форма бронирования', 'yes'),
(227, 'booking_widget_show', 'booking_form', 'yes'),
(228, 'booking_widget_type', '1', 'yes'),
(229, 'booking_widget_calendar_count', '1', 'yes'),
(230, 'booking_widget_last_field', '', 'yes'),
(231, 'booking_wpdev_copyright_adminpanel', 'On', 'yes'),
(232, 'booking_is_show_powered_by_notice', 'On', 'yes'),
(233, 'booking_is_use_captcha', 'Off', 'yes'),
(234, 'booking_is_show_legend', 'Off', 'yes'),
(235, 'booking_legend_is_show_item_available', 'On', 'yes'),
(236, 'booking_legend_text_for_item_available', 'Доступо ', 'yes'),
(237, 'booking_legend_is_show_item_pending', 'On', 'yes'),
(238, 'booking_legend_text_for_item_pending', 'Ожидающие утверждения', 'yes'),
(239, 'booking_legend_is_show_item_approved', 'On', 'yes'),
(240, 'booking_legend_text_for_item_approved', 'Забронировано ', 'yes'),
(245, 'wpbs_db_version', '1.0', 'yes'),
(246, 'wpbs-languages', '{"en":"English"}', 'yes'),
(247, 'wpbs-options', '{"selectedColor":"#3399cc","selectedBorder":"#336699","dateFormat":"j F Y","historyColor":"#E4E4E4"}', 'yes'),
(248, 'wpbs-default-legend', '{"default":{"name":{"default":"Available","hr":"Slobodno","cs":"Volno","da":"Ledigt","nl":"Vrij","en":"Available","fr":"Libre","de":"Frei","hu":"Szabad","it":"Libero","ro":"Disponobil","ru":"\\u0414\\u043e\\u0441\\u0442\\u0443\\u043f\\u043d\\u043e","sk":"Vo\\u013en\\u00fd","es":"Libre","sv":"Ledigt","uk":"B\\u0456\\u043b\\u044c\\u043d\\u043e","no":""},"color":"#DDFFCC","splitColor":false,"bookable":"yes"},"1":{"name":{"default":"Booked","hr":"Zauzeto","cs":"Obsazeno","da":"Booket","nl":"Bezet","en":"Booked","fr":"Occup\\u00e9","de":"Belegt","hu":"Foglalt","it":"Prenotato","ro":"Rezervat","ru":"\\u0417\\u0430\\u043d\\u044f\\u0442\\u043e","sk":"Obsaden\\u00fd","es":"Reservado","sv":"Bokat","uk":"\\u0417\\u0430\\u0439\\u043d\\u044f\\u0442\\u043e","no":""},"color":"#FFC0BD","splitColor":false,"bookable":false}}', 'yes'),
(254, 'DOPBS_backend_language', 'en', 'yes'),
(255, 'DOPBS_db_version', '1', 'yes'),
(273, 'hotelclub_affiliate_id', '', 'yes'),
(274, 'hotelclub_affiliate_password', '', 'yes'),
(275, 'hotelclub_cache_duration', '2592000', 'yes'),
(276, 'hotelclub_city_id', '1', 'yes'),
(277, 'hotelclub_country_id', '3', 'yes'),
(278, 'hotelclub_currency_code', 'AUD', 'yes'),
(279, 'hotelclub_domain', 'http://www.hotelclub.com/', 'yes'),
(280, 'hotelclub_language_code', 'EN', 'yes'),
(281, 'hotelclub_protocol', 'https', 'yes'),
(282, 'hotelclub_theme', 'default', 'yes'),
(285, 'openitaly4wp_username', '', 'yes'),
(286, 'openitaly4wp_password', '', 'yes'),
(287, 'openitaly4wp_regione', '', 'yes'),
(288, 'openitaly4wp_provincia', '', 'yes'),
(289, 'openitaly4wp_comune', '', 'yes'),
(290, 'openitaly4wp_type', '', 'yes'),
(291, 'openitaly4wp_show', 'random', 'yes'),
(292, 'openitaly4wp_title', 'Alcune risorse in %COMUNE%', 'yes'),
(293, 'openitaly4wp_results', '5', 'yes'),
(294, 'openitaly4wp_css', '0', 'yes'),
(295, 'openitaly4wp_csstitle', 'openitaly4wp-title', 'yes'),
(296, 'openitaly4wp_csssidebar', 'openitaly4wp-box', 'yes'),
(299, 'widget_booking-pluginbox-single', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(300, 'gcBookingGadget', 'a:1:{s:4:"none";a:4:{s:9:"titleText";s:14:"Booking Gadget";s:11:"orientation";s:10:"horizontal";s:8:"linkText";s:12:"BOOK ONLINE!";s:6:"apiKey";s:0:"";}}', 'yes'),
(301, 'widget_widget_chotcal', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(302, 'widget_easyreservations_form_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(309, 'widget_guestapp_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(316, 'widget_igumbi_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(317, 'widget_palts_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(318, 'widget_tgsbwidget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(319, 'widget_wpbs_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(320, 'widget_wpsimplebookingcalendar_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(325, 'theme_mods_theme1943', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1405265131;s:4:"data";a:12:{s:19:"wp_inactive_widgets";a:0:{}s:12:"extra-area-1";a:7:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";i:6;s:30:"easyreservations_form_widget-3";}s:12:"extra-area-2";a:0:{}s:12:"extra-area-3";N;s:12:"extra-area-4";N;s:12:"extra-area-5";N;s:14:"content-area-1";N;s:14:"content-area-2";N;s:14:"content-area-3";N;s:12:"main-sidebar";N;s:13:"footer-area-1";N;s:13:"footer-area-2";N;}}}', 'yes'),
(326, 'optionsframework', 'a:2:{s:2:"id";s:9:"theme1943";s:12:"knownoptions";a:1:{i:0;s:9:"theme1943";}}', 'yes'),
(327, 'theme1943', 'a:38:{s:15:"body_background";a:5:{s:5:"color";s:0:"";s:5:"image";s:0:"";s:6:"repeat";s:6:"repeat";s:8:"position";s:10:"top center";s:10:"attachment";s:6:"scroll";}s:12:"header_color";s:0:"";s:11:"links_color";s:0:"";s:14:"google_mixed_3";a:5:{s:4:"size";s:4:"12px";s:4:"face";s:0:"";s:5:"style";s:6:"Normal";s:10:"lineheight";s:4:"18px";s:5:"color";s:0:"";}s:10:"h1_heading";a:5:{s:4:"size";s:4:"32px";s:4:"face";s:0:"";s:5:"style";s:6:"Normal";s:10:"lineheight";s:4:"32px";s:5:"color";s:0:"";}s:10:"h2_heading";a:5:{s:4:"size";s:4:"24px";s:4:"face";s:0:"";s:5:"style";s:6:"Normal";s:10:"lineheight";s:4:"24px";s:5:"color";s:0:"";}s:10:"h3_heading";a:5:{s:4:"size";s:4:"18px";s:4:"face";s:0:"";s:5:"style";s:6:"Normal";s:10:"lineheight";s:4:"18px";s:5:"color";s:0:"";}s:10:"h4_heading";a:5:{s:4:"size";s:4:"14px";s:4:"face";s:0:"";s:5:"style";s:6:"Normal";s:10:"lineheight";s:4:"18px";s:5:"color";s:0:"";}s:10:"h5_heading";a:5:{s:4:"size";s:4:"12px";s:4:"face";s:0:"";s:5:"style";s:6:"Normal";s:10:"lineheight";s:4:"18px";s:5:"color";s:0:"";}s:10:"h6_heading";a:5:{s:4:"size";s:4:"10px";s:4:"face";s:0:"";s:5:"style";s:6:"Normal";s:10:"lineheight";s:4:"18px";s:5:"color";s:0:"";}s:15:"g_search_box_id";s:3:"yes";s:21:"g_gallery_lightbox_id";s:2:"no";s:10:"custom_css";s:0:"";s:9:"logo_type";s:10:"image_logo";s:8:"sf_delay";s:4:"1000";s:14:"sf_f_animation";s:4:"show";s:15:"sf_sl_animation";s:4:"show";s:8:"sf_speed";s:6:"normal";s:9:"sl_effect";s:6:"random";s:9:"sl_slices";s:2:"15";s:14:"sl_box_columns";s:1:"8";s:11:"sl_box_rows";s:1:"8";s:18:"sl_animation_speed";s:3:"500";s:12:"sl_pausetime";s:4:"5000";s:10:"sl_dir_nav";s:4:"true";s:15:"sl_dir_nav_hide";s:5:"false";s:18:"sl_caption_opacity";s:3:"0.8";s:9:"blog_text";s:4:"Blog";s:12:"blog_related";s:13:"Related Posts";s:16:"blog_sidebar_pos";s:5:"right";s:15:"post_image_size";s:6:"normal";s:17:"single_image_size";s:6:"normal";s:9:"post_meta";s:4:"true";s:12:"post_excerpt";s:4:"true";s:11:"footer_text";s:0:"";s:7:"ga_code";s:0:"";s:8:"feed_url";s:0:"";s:11:"footer_menu";s:4:"true";}', 'yes'),
(350, 'guestapp_review_error_data', 'null', 'yes'),
(353, '_transient_timeout_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1405461959', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(354, '_transient_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:51:"\n	\n	\n	\n	\n	\n	\n		\n		\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WordPress News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:25:"http://wordpress.org/news";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:14:"WordPress News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 10 Jul 2014 10:27:22 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/?v=4.0-beta1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 4.0 Beta 1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/news/2014/07/wordpress-4-0-beta-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wordpress.org/news/2014/07/wordpress-4-0-beta-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 10 Jul 2014 10:17:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3248";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:329:"WordPress 4.0 Beta 1 is now available! This software is still in development, so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.0, try the WordPress Beta Tester plugin (you’ll want “bleeding edge nightlies”). Or you can [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Helen Hou-Sandi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4025:"<p>WordPress 4.0 Beta 1 is now available!</p>\n<p><strong>This software is still in development,</strong> so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.0, try the <a href="http://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”). Or you can <a href="https://wordpress.org/wordpress-4.0-beta1.zip">download the beta here</a> (zip).</p>\n<p>4.0 is due out next month, but to get there, we need your help testing what we&#8217;ve been working on:</p>\n<ul>\n<li><strong>Previews of <a href="http://codex.wordpress.org/Embeds">embedding via URLs</a></strong> in the visual editor and the &#8220;Insert from URL&#8221; tab in the media modal. Try pasting a URL (such as a <a href="http://wordpress.tv/">WordPress.tv</a> or YouTube video) onto its own line in the visual editor. (<a href="https://core.trac.wordpress.org/ticket/28195">#28195</a>, <a href="https://core.trac.wordpress.org/ticket/15490">#15490</a>)</li>\n<li>The <strong>Media Library</strong> now has a &#8220;grid&#8221; view in addition to the existing list view. Clicking on an item takes you into a modal where you can see a larger preview and edit information about that attachment, and you can navigate between items right from the modal without closing it. (<a href="https://core.trac.wordpress.org/ticket/24716">#24716</a>)</li>\n<li>We&#8217;re freshening up the <strong>plugin install experience</strong>. You&#8217;ll see some early visual changes as well as more information when searching for plugins and viewing details. (<a href="https://core.trac.wordpress.org/ticket/28785">#28785</a>, <a href="https://core.trac.wordpress.org/ticket/27440">#27440</a>)</li>\n<li><strong>Selecting a language</strong> when you run the installation process. (<a href="https://core.trac.wordpress.org/ticket/28577">#28577</a>)</li>\n<li>The <strong>editor</strong> intelligently resizes and its top and bottom bars pin when needed. Browsers don&#8217;t like to agree on where to put things like cursors, so if you find a bug here, please also let us know your browser and operating system. (<a href="https://core.trac.wordpress.org/ticket/28328">#28328</a>)</li>\n<li>We&#8217;ve made some improvements to how your keyboard and cursor interact with <strong>TinyMCE views</strong> such as the gallery preview. Much like the editor resizing and scrolling improvements, knowing about your setup is particularly important for bug reports here. (<a href="https://core.trac.wordpress.org/ticket/28595">#28595</a>)</li>\n<li><strong>Widgets in the Customizer</strong> are now loaded in a separate panel. (<a href="https://core.trac.wordpress.org/ticket/27406">#27406</a>)</li>\n<li>We&#8217;ve also made some changes to some <strong>formatting</strong> functions, so if you see quotes curling in the wrong direction, please file a bug report.</li>\n</ul>\n<p><strong>If you think you’ve found a bug</strong>, you can post to the <a href="http://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. We’d love to hear from you! If you’re comfortable writing a reproducible bug report, <a href="https://make.wordpress.org/core/reports/">file one on the WordPress Trac</a>. There, you can also find <a href="http://core.trac.wordpress.org/tickets/major">a list of known bugs</a> and <a href="http://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=4.0">everything we’ve fixed</a> so far.</p>\n<p><strong>Developers:</strong> Never fear, we haven&#8217;t forgotten you. There&#8217;s plenty for you, too &#8211; more on that in upcoming posts. In the meantime, check out the <a href="http://make.wordpress.org/core/2014/07/08/customizer-improvements-in-4-0/#customizer-panels">API for panels in the Customizer</a>.</p>\n<p>Happy testing!</p>\n<p><em>Plugins, editor</em><br />\n<em>Media, things in between</em><br />\n<em>Please help look for bugs</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wordpress.org/news/2014/07/wordpress-4-0-beta-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"WordPress 3.9.1 Maintenance Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:50:"http://wordpress.org/news/2014/05/wordpress-3-9-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:59:"http://wordpress.org/news/2014/05/wordpress-3-9-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 08 May 2014 18:40:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3241";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:385:"After three weeks and more than 9 million downloads of WordPress 3.9, we&#8217;re pleased to announce that WordPress 3.9.1 is now available. This maintenance release fixes 34 bugs in 3.9, including numerous fixes for multisite networks, customizing widgets while previewing themes, and the updated visual editor. We&#8217;ve also made some improvements to the new audio/video [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3077:"<p>After three weeks and more than 9 million downloads of <a title="WordPress 3.9 “Smith”" href="http://wordpress.org/news/2014/04/smith/">WordPress 3.9</a>, we&#8217;re pleased to announce that WordPress 3.9.1 is now available.</p>\n<p>This maintenance release fixes 34 bugs in 3.9, including numerous fixes for multisite networks, customizing widgets while previewing themes, and the updated visual editor. We&#8217;ve also made some improvements to the new audio/video playlists feature and made some adjustments to improve performance. For a full list of changes, consult the <a href="https://core.trac.wordpress.org/query?milestone=3.9.1">list of tickets</a> and the <a href="https://core.trac.wordpress.org/log/branches/3.9?rev=28353&amp;stop_rev=28154">changelog</a>.</p>\n<p>If you are one of the millions already running WordPress 3.9, we&#8217;ve started rolling out automatic background updates for 3.9.1. For sites <a href="http://wordpress.org/plugins/background-update-tester/">that support them</a>, of course.</p>\n<p><a href="http://wordpress.org/download/">Download WordPress 3.9.1</a> or venture over to <strong>Dashboard → Updates</strong> and simply click &#8220;Update Now.&#8221;</p>\n<p>Thanks to all of these fine individuals for contributing to 3.9.1: <a href="http://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="http://profiles.wordpress.org/nacin">Andrew Nacin</a>, <a href="http://profiles.wordpress.org/azaozz">Andrew Ozz</a>, <a href="http://profiles.wordpress.org/rzen">Brian Richards</a>, <a href="http://profiles.wordpress.org/ehg">Chris Blower</a>, <a href="http://profiles.wordpress.org/jupiterwise">Corey McKrill</a>, <a href="http://profiles.wordpress.org/danielbachhuber">Daniel Bachhuber</a>, <a href="http://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="http://profiles.wordpress.org/feedmeastraycat">feedmeastraycat</a>, <a href="http://profiles.wordpress.org/gcorne">Gregory Cornelius</a>, <a href="http://profiles.wordpress.org/helen">Helen Hou-Sandi</a>, <a href="http://profiles.wordpress.org/imath">imath</a>, <a href="http://profiles.wordpress.org/avryl">Janneke Van Dorpe</a>, <a href="http://profiles.wordpress.org/jeremyfelt">Jeremy Felt</a>, <a href="http://profiles.wordpress.org/johnbillion">John Blackbourn</a>, <a href="http://profiles.wordpress.org/obenland">Konstantin Obenland</a>, <a href="http://profiles.wordpress.org/lancewillett">Lance Willett</a>, <a href="http://profiles.wordpress.org/m_i_n">m_i_n</a>, <a href="http://profiles.wordpress.org/clorith">Marius Jensen</a>, <a href="http://profiles.wordpress.org/markjaquith">Mark Jaquith</a>, <a href="http://profiles.wordpress.org/dimadin">Milan Dinić</a>, <a href="http://profiles.wordpress.org/celloexpressions">Nick Halsey</a>, <a href="http://profiles.wordpress.org/pavelevap">pavelevap</a>, <a href="http://profiles.wordpress.org/wonderboymusic">Scott Taylor</a>, <a href="http://profiles.wordpress.org/SergeyBiryukov">Sergey Biryukov</a>, and <a href="http://profiles.wordpress.org/westonruter">Weston Ruter</a>.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/news/2014/05/wordpress-3-9-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"WordPress 3.9 “Smith”";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:40:"http://wordpress.org/news/2014/04/smith/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:49:"http://wordpress.org/news/2014/04/smith/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 16 Apr 2014 18:33:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3154";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:411:"Version 3.9 of WordPress, named &#8220;Smith&#8221; in honor of jazz organist Jimmy Smith, is available for download or update in your WordPress dashboard. This release features a number of refinements that we hope you&#8217;ll love. A smoother media editing experience Improved visual editing The updated visual editor has improved speed, accessibility, and mobile support. You can paste into the [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:23298:"<p>Version 3.9 of WordPress, named &#8220;Smith&#8221; in honor of jazz organist <a href="http://en.wikipedia.org/wiki/Jimmy_Smith_(musician)">Jimmy Smith</a>, is available <a href="http://wordpress.org/download/">for download</a> or update in your WordPress dashboard. This release features a number of refinements that we hope you&#8217;ll love.</p>\n<embed src="//v0.wordpress.com/player.swf?v=1.03" type="application/x-shockwave-flash" width="640" height="360" wmode="direct" seamlesstabbing="true" allowfullscreen="true" allowscriptaccess="always" overstretch="true" flashvars="guid=sAiXhCfV&amp;isDynamicSeeking=true" title=""></embed>\n<h2 class="about-headline-callout" style="text-align: center">A smoother media editing experience</h2>\n<div>\n<p><img class="alignright wp-image-3168" src="//wordpress.org/news/files/2014/04/editor1-300x233.jpg" alt="editor" width="228" height="177" /></p>\n<h3>Improved visual editing</h3>\n<p>The updated visual editor has improved speed, accessibility, and mobile support. You can paste into the visual editor from your word processor without wasting time to clean up messy styling. (Yeah, we’re talking about you, Microsoft Word.)</p>\n</div>\n<div style="clear: both"></div>\n<div>\n<p><img class="alignright wp-image-3170" src="//wordpress.org/news/files/2014/04/image1-300x233.jpg" alt="image" width="228" height="178" /></p>\n<h3>Edit images easily</h3>\n<p>With quicker access to crop and rotation tools, it’s now much easier to edit your images while editing posts. You can also scale images directly in the editor to find just the right fit.</p>\n</div>\n<div style="clear: both"></div>\n<div>\n<p><img class="alignright wp-image-3187" src="//wordpress.org/news/files/2014/04/dragdrop1-300x233.jpg" alt="dragdrop" width="228" height="178" /></p>\n<h3>Drag and drop your images</h3>\n<p>Uploading your images is easier than ever. Just grab them from your desktop and drop them in the editor.</p>\n</div>\n<div style="clear: both"></div>\n<hr />\n<h2 style="text-align: center">Gallery previews</h2>\n<p><img class="aligncenter size-full wp-image-3169" src="//wordpress.org/news/files/2014/04/gallery1.jpg" alt="gallery" width="980" height="550" /></p>\n<p>Galleries display a beautiful grid of images right in the editor, just like they do in your published post.</p>\n<hr />\n<h2 style="text-align: center">Do more with audio and video</h2>\n\n<a href=''http://wordpress.org/news/files/2014/04/AintMisbehavin.mp3''>Ain''t Misbehavin''</a>\n<a href=''http://wordpress.org/news/files/2014/04/DavenportBlues.mp3''>Davenport Blues</a>\n<a href=''http://wordpress.org/news/files/2014/04/JellyRollMorton-BuddyBoldensBlues.mp3''>Buddy Bolden''s Blues</a>\n<a href=''http://wordpress.org/news/files/2014/04/Johnny_Hodges_Orchestra-Squaty_Roo-1941.mp3''>Squaty Roo</a>\n<a href=''http://wordpress.org/news/files/2014/04/Louisiana_Five-Dixie_Blues-1919.mp3''>Dixie Blues</a>\n<a href=''http://wordpress.org/news/files/2014/04/WolverineBlues.mp3''>Wolverine Blues</a>\n\n<p>Images have galleries; now we’ve added simple audio and video playlists, so you can showcase your music and clips.</p>\n<hr />\n<h2 style="text-align: center">Live widget and header previews</h2>\n<div style="width: 692px; max-width: 100%;" class="wp-video"><!--[if lt IE 9]><script>document.createElement(''video'');</script><![endif]-->\n<video class="wp-video-shortcode" id="video-3154-1" width="692" height="448" preload="metadata" controls="controls"><source type="video/mp4" src="//wordpress.org/news/files/2014/04/widgets.mp4?_=1" /><a href="//wordpress.org/news/files/2014/04/widgets.mp4">//wordpress.org/news/files/2014/04/widgets.mp4</a></video></div>\n<p>Add, edit, and rearrange your site’s widgets right in the theme customizer. No “save and surprise” — preview your changes live and only save them when you’re ready.</p>\n<p>The improved header image tool also lets you upload, crop, and manage headers while customizing your theme.</p>\n<hr />\n<h2 style="text-align: center">Stunning new theme browser</h2>\n<p><img class="aligncenter size-full wp-image-3172" src="//wordpress.org/news/files/2014/04/theme1.jpg" alt="theme" width="1003" height="558" /><br />\nLooking for a new theme should be easy and fun. Lose yourself in the boundless supply of free WordPress.org themes with the beautiful new theme browser.</p>\n<hr />\n<h2 style="text-align: center">The Crew</h2>\n<p>This release was led by <a href="http://nacin.com/">Andrew Nacin</a> and <a href="http://www.getsource.net/">Mike Schroder</a>, with the help of these fine individuals. There are 267 contributors with props in this release, a new high:</p>\n<p><a href="http://profiles.wordpress.org/aaroncampbell">Aaron D. Campbell</a>, <a href="http://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="http://profiles.wordpress.org/kawauso">Adam Harley</a>, <a href="http://profiles.wordpress.org/adamsilverstein">Adam Silverstein</a>, <a href="http://profiles.wordpress.org/adelval">adelval</a>, <a href="http://profiles.wordpress.org/ajay">Ajay</a>, <a href="http://profiles.wordpress.org/akeda">Akeda Bagus</a>, <a href="http://profiles.wordpress.org/xknown">Alex Concha</a>, <a href="http://profiles.wordpress.org/tellyworth">Alex Shiels</a>, <a href="http://profiles.wordpress.org/aliso">Alison Barrett</a>, <a href="http://profiles.wordpress.org/collinsinternet">Allan Collins</a>, <a href="http://profiles.wordpress.org/sabreuse">Amy Hendrix (sabreuse)</a>, <a href="http://profiles.wordpress.org/afercia">Andrea Fercia</a>, <a href="http://profiles.wordpress.org/nacin">Andrew Nacin</a>, <a href="http://profiles.wordpress.org/norcross">Andrew Norcross</a>, <a href="http://profiles.wordpress.org/azaozz">Andrew Ozz</a>, <a href="http://profiles.wordpress.org/rarst">Andrey "Rarst" Savchenko</a>, <a href="http://profiles.wordpress.org/andykeith">Andy Keith</a>, <a href="http://profiles.wordpress.org/andy">Andy Skelton</a>, <a href="http://profiles.wordpress.org/atimmer">Anton Timmermans</a>, <a href="http://profiles.wordpress.org/aubreypwd">Aubrey Portwood</a>, <a href="http://profiles.wordpress.org/barry">Barry</a>, <a href="http://profiles.wordpress.org/toszcze">Bartosz Romanowski</a>, <a href="http://profiles.wordpress.org/bassgang">bassgang</a>, <a href="http://profiles.wordpress.org/bcworkz">bcworkz</a>, <a href="http://profiles.wordpress.org/empireoflight">Ben Dunkle</a>, <a href="http://profiles.wordpress.org/neoxx">Bernhard Riedl</a>, <a href="http://profiles.wordpress.org/bigdawggi">bigdawggi</a>, <a href="http://profiles.wordpress.org/bobbravo2">Bob Gregor</a>, <a href="http://profiles.wordpress.org/bobbingwide">bobbingwide</a>, <a href="http://profiles.wordpress.org/bradt">Brad Touesnard</a>, <a href="http://profiles.wordpress.org/bradparbs">bradparbs</a>, <a href="http://profiles.wordpress.org/bramd">bramd</a>, <a href="http://profiles.wordpress.org/kraftbj">Brandon Kraft</a>, <a href="http://profiles.wordpress.org/brasofilo">brasofilo</a>, <a href="http://profiles.wordpress.org/bravokeyl">bravokeyl</a>, <a href="http://profiles.wordpress.org/bpetty">Bryan Petty</a>, <a href="http://profiles.wordpress.org/cgaffga">cgaffga</a>, <a href="http://profiles.wordpress.org/chiragswadia">Chirag Swadia</a>, <a href="http://profiles.wordpress.org/chouby">Chouby</a>, <a href="http://profiles.wordpress.org/ehg">Chris Blower</a>, <a href="http://profiles.wordpress.org/cmmarslender">Chris Marslender</a>, <a href="http://profiles.wordpress.org/c3mdigital">Chris Olbekson</a>, <a href="http://profiles.wordpress.org/chrisscott">Chris Scott</a>, <a href="http://profiles.wordpress.org/chriseverson">chriseverson</a>, <a href="http://profiles.wordpress.org/chrisguitarguy">chrisguitarguy</a>, <a href="http://profiles.wordpress.org/cfinke">Christopher Finke</a>, <a href="http://profiles.wordpress.org/ciantic">ciantic</a>, <a href="http://profiles.wordpress.org/antorome">Comparativa de Bancos</a>, <a href="http://profiles.wordpress.org/cojennin">Connor Jennings</a>, <a href="http://profiles.wordpress.org/corvannoorloos">Cor van Noorloos</a>, <a href="http://profiles.wordpress.org/corphi">Corphi</a>, <a href="http://profiles.wordpress.org/cramdesign">cramdesign</a>, <a href="http://profiles.wordpress.org/danielbachhuber">Daniel Bachhuber</a>, <a href="http://profiles.wordpress.org/redsweater">Daniel Jalkut (Red Sweater)</a>, <a href="http://profiles.wordpress.org/dannydehaan">Danny de Haan</a>, <a href="http://profiles.wordpress.org/koop">Daryl Koopersmith</a>, <a href="http://profiles.wordpress.org/eightface">Dave Kellam (eightface)</a>, <a href="http://profiles.wordpress.org/dpe415">DaveE</a>, <a href="http://profiles.wordpress.org/davidakennedy">David A. Kennedy</a>, <a href="http://profiles.wordpress.org/davidanderson">David Anderson</a>, <a href="http://profiles.wordpress.org/davidmarichal">David Marichal</a>, <a href="http://profiles.wordpress.org/denis-de-bernardy">Denis de Bernardy</a>, <a href="http://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="http://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="http://profiles.wordpress.org/dougwollison">Doug Wollison</a>, <a href="http://profiles.wordpress.org/drewapicture">Drew Jaynes</a>, <a href="http://profiles.wordpress.org/drprotocols">DrProtocols</a>, <a href="http://profiles.wordpress.org/dustyf">Dustin Filippini</a>, <a href="http://profiles.wordpress.org/eatingrules">eatingrules</a>, <a href="http://profiles.wordpress.org/plocha">edik</a>, <a href="http://profiles.wordpress.org/eliorivero">Elio Rivero</a>, <a href="http://profiles.wordpress.org/enej">enej</a>, <a href="http://profiles.wordpress.org/ericlewis">Eric Andrew Lewis</a>, <a href="http://profiles.wordpress.org/ericmann">Eric Mann</a>, <a href="http://profiles.wordpress.org/evarlese">Erica Varlese</a>, <a href="http://profiles.wordpress.org/ethitter">Erick Hitter</a>, <a href="http://profiles.wordpress.org/ejdanderson">Evan Anderson</a>, <a href="http://profiles.wordpress.org/fahmiadib">Fahmi Adib</a>, <a href="http://profiles.wordpress.org/fboender">fboender</a>, <a href="http://profiles.wordpress.org/frank-klein">Frank Klein</a>, <a href="http://profiles.wordpress.org/garyc40">Gary Cao</a>, <a href="http://profiles.wordpress.org/garyj">Gary Jones</a>, <a href="http://profiles.wordpress.org/pento">Gary Pendergast</a>, <a href="http://profiles.wordpress.org/genkisan">genkisan</a>, <a href="http://profiles.wordpress.org/soulseekah">Gennady Kovshenin</a>, <a href="http://profiles.wordpress.org/georgestephanis">George Stephanis</a>, <a href="http://profiles.wordpress.org/grahamarmfield">Graham Armfield</a>, <a href="http://profiles.wordpress.org/vancoder">Grant Mangham</a>, <a href="http://profiles.wordpress.org/gcorne">Gregory Cornelius</a>, <a href="http://profiles.wordpress.org/tivnet">Gregory Karpinsky (@tivnet)</a>, <a href="http://profiles.wordpress.org/hakre">hakre</a>, <a href="http://profiles.wordpress.org/hanni">hanni</a>, <a href="http://profiles.wordpress.org/helen">Helen Hou-Sandí</a>, <a href="http://profiles.wordpress.org/ippetkov">ippetkov</a>, <a href="http://profiles.wordpress.org/ipstenu">Ipstenu (Mika Epstein)</a>, <a href="http://profiles.wordpress.org/jdgrimes">J.D. Grimes</a>, <a href="http://profiles.wordpress.org/jackreichert">Jack Reichert</a>, <a href="http://profiles.wordpress.org/_jameslee">jameslee</a>, <a href="http://profiles.wordpress.org/avryl">Janneke Van Dorpe</a>, <a href="http://profiles.wordpress.org/janrenn">janrenn</a>, <a href="http://profiles.wordpress.org/jaycc">JayCC</a>, <a href="http://profiles.wordpress.org/jeffsebring">Jeff Sebring</a>, <a href="http://profiles.wordpress.org/jenmylo">Jen Mylo</a>, <a href="http://profiles.wordpress.org/jeremyfelt">Jeremy Felt</a>, <a href="http://profiles.wordpress.org/jesin">Jesin A</a>, <a href="http://profiles.wordpress.org/jayjdk">Jesper Johansen (jayjdk)</a>, <a href="http://profiles.wordpress.org/jnielsendotnet">jnielsendotnet</a>, <a href="http://profiles.wordpress.org/jartes">Joan Artes</a>, <a href="http://profiles.wordpress.org/joedolson">Joe Dolson</a>, <a href="http://profiles.wordpress.org/joehoyle">Joe Hoyle</a>, <a href="http://profiles.wordpress.org/johnbillion">John Blackbourn</a>, <a href="http://profiles.wordpress.org/johnjamesjacoby">John James Jacoby</a>, <a href="http://profiles.wordpress.org/johnpbloch">John P. Bloch</a>, <a href="http://profiles.wordpress.org/johnregan3">John Regan</a>, <a href="http://profiles.wordpress.org/duck_">Jon Cave</a>, <a href="http://profiles.wordpress.org/jond3r">Jonas Bolinder (jond3r)</a>, <a href="http://profiles.wordpress.org/joostdevalk">Joost de Valk</a>, <a href="http://profiles.wordpress.org/shelob9">Josh Pollock</a>, <a href="http://profiles.wordpress.org/joshuaabenazer">Joshua Abenazer</a>, <a href="http://profiles.wordpress.org/jstraitiff">jstraitiff</a>, <a href="http://profiles.wordpress.org/juliobox">Julio Potier</a>, <a href="http://profiles.wordpress.org/kopepasah">Justin Kopepasah</a>, <a href="http://profiles.wordpress.org/justinsainton">Justin Sainton</a>, <a href="http://profiles.wordpress.org/kadamwhite">K.Adam White</a>, <a href="http://profiles.wordpress.org/trepmal">Kailey (trepmal)</a>, <a href="http://profiles.wordpress.org/kasparsd">Kaspars</a>, <a href="http://profiles.wordpress.org/ryelle">Kelly Dwan</a>, <a href="http://profiles.wordpress.org/kerikae">kerikae</a>, <a href="http://profiles.wordpress.org/kworthington">Kevin Worthington</a>, <a href="http://profiles.wordpress.org/kpdesign">Kim Parsell</a>, <a href="http://profiles.wordpress.org/kwight">Kirk Wight</a>, <a href="http://profiles.wordpress.org/kitchin">kitchin</a>, <a href="http://profiles.wordpress.org/klihelp">klihelp</a>, <a href="http://profiles.wordpress.org/knutsp">Knut Sparhell</a>, <a href="http://profiles.wordpress.org/kovshenin">Konstantin Kovshenin</a>, <a href="http://profiles.wordpress.org/obenland">Konstantin Obenland</a>, <a href="http://profiles.wordpress.org/drozdz">Krzysiek Drozdz</a>, <a href="http://profiles.wordpress.org/lancewillett">Lance Willett</a>, <a href="http://profiles.wordpress.org/leewillis77">Lee Willis</a>, <a href="http://profiles.wordpress.org/lpointet">lpointet</a>, <a href="http://profiles.wordpress.org/ldebrouwer">Luc De Brouwer</a>, <a href="http://profiles.wordpress.org/spmlucas">Lucas Karpiuk</a>, <a href="http://profiles.wordpress.org/lkwdwrd">Luke Woodward</a>, <a href="http://profiles.wordpress.org/mark8barnes">Mark Barnes</a>, <a href="http://profiles.wordpress.org/markjaquith">Mark Jaquith</a>, <a href="http://profiles.wordpress.org/markoheijnen">Marko Heijnen</a>, <a href="http://profiles.wordpress.org/marventus">Marventus</a>, <a href="http://profiles.wordpress.org/iammattthomas">Matt (Thomas) Miklic</a>, <a href="http://profiles.wordpress.org/mjbanks">Matt Banks</a>, <a href="http://profiles.wordpress.org/matt">Matt Mullenweg</a>, <a href="http://profiles.wordpress.org/mboynes">Matthew Boynes</a>, <a href="http://profiles.wordpress.org/mdbitz">Matthew Denton</a>, <a href="http://profiles.wordpress.org/mattheu">Matthew Haines-Young</a>, <a href="http://profiles.wordpress.org/mattonomics">mattonomics</a>, <a href="http://profiles.wordpress.org/mattyrob">mattyrob</a>, <a href="http://profiles.wordpress.org/matveb">Matías Ventura</a>, <a href="http://profiles.wordpress.org/maxcutler">Max Cutler</a>, <a href="http://profiles.wordpress.org/mcadwell">mcadwell</a>, <a href="http://profiles.wordpress.org/melchoyce">Mel Choyce</a>, <a href="http://profiles.wordpress.org/meloniq">meloniq</a>, <a href="http://profiles.wordpress.org/michael-arestad">Michael Arestad</a>, <a href="http://profiles.wordpress.org/michelwppi">Michel - xiligroup dev</a>, <a href="http://profiles.wordpress.org/mcsf">Miguel Fonseca</a>, <a href="http://profiles.wordpress.org/gradyetc">Mike Burns</a>, <a href="http://profiles.wordpress.org/mikehansenme">Mike Hansen</a>, <a href="http://profiles.wordpress.org/mikemanger">Mike Manger</a>, <a href="http://profiles.wordpress.org/mikeschinkel">Mike Schinkel</a>, <a href="http://profiles.wordpress.org/dh-shredder">Mike Schroder</a>, <a href="http://profiles.wordpress.org/mikecorkum">mikecorkum</a>, <a href="http://profiles.wordpress.org/mitchoyoshitaka">mitcho (Michael Yoshitaka Erlewine)</a>, <a href="http://profiles.wordpress.org/batmoo">Mohammad Jangda</a>, <a href="http://profiles.wordpress.org/morganestes">Morgan Estes</a>, <a href="http://profiles.wordpress.org/mor10">Morten Rand-Hendriksen</a>, <a href="http://profiles.wordpress.org/Nao">Naoko Takano</a>, <a href="http://profiles.wordpress.org/alex-ye">Nashwan Doaqan</a>, <a href="http://profiles.wordpress.org/nendeb55">nendeb55</a>, <a href="http://profiles.wordpress.org/celloexpressions">Nick Halsey</a>, <a href="http://profiles.wordpress.org/nicolealleyinteractivecom">Nicole Arnold</a>, <a href="http://profiles.wordpress.org/nikv">Nikhil Vimal (NikV)</a>, <a href="http://profiles.wordpress.org/nivijah">Nivi Jah</a>, <a href="http://profiles.wordpress.org/nofearinc">nofearinc</a>, <a href="http://profiles.wordpress.org/nunomorgadinho">Nuno Morgadinho</a>, <a href="http://profiles.wordpress.org/olivm">olivM</a>, <a href="http://profiles.wordpress.org/jbkkd">Omer Korner</a>, <a href="http://profiles.wordpress.org/originalexe">OriginalEXE</a>, <a href="http://profiles.wordpress.org/oso96_2000">oso96_2000</a>, <a href="http://profiles.wordpress.org/patricknami">patricknami</a>, <a href="http://profiles.wordpress.org/pbearne">Paul Bearne</a>, <a href="http://profiles.wordpress.org/djpaul">Paul Gibbs</a>, <a href="http://profiles.wordpress.org/paulwilde">Paul Wilde</a>, <a href="http://profiles.wordpress.org/pavelevap">pavelevap</a>, <a href="http://profiles.wordpress.org/westi">Peter Westwood</a>, <a href="http://profiles.wordpress.org/philiparthurmoore">Philip Arthur Moore</a>, <a href="http://profiles.wordpress.org/mordauk">Pippin Williamson</a>, <a href="http://profiles.wordpress.org/nprasath002">Prasath Nadarajah</a>, <a href="http://profiles.wordpress.org/prettyboymp">prettyboymp</a>, <a href="http://profiles.wordpress.org/raamdev">Raam Dev</a>, <a href="http://profiles.wordpress.org/rachelbaker">Rachel Baker</a>, <a href="http://profiles.wordpress.org/mauryaratan">Ram Ratan Maurya</a>, <a href="http://profiles.wordpress.org/ramonchiara">ramonchiara</a>, <a href="http://profiles.wordpress.org/ounziw">Rescuework Support</a>, <a href="http://profiles.wordpress.org/rhyswynne">Rhys Wynne</a>, <a href="http://profiles.wordpress.org/ricardocorreia">Ricardo Correia</a>, <a href="http://profiles.wordpress.org/theorboman">Richard Sweeney</a>, <a href="http://profiles.wordpress.org/iamfriendly">Richard Tape</a>, <a href="http://profiles.wordpress.org/richard2222">richard2222</a>, <a href="http://profiles.wordpress.org/rickalee">Ricky Lee Whittemore</a>, <a href="http://profiles.wordpress.org/miqrogroove">Robert Chapin</a>, <a href="http://profiles.wordpress.org/robmiller">robmiller</a>, <a href="http://profiles.wordpress.org/rodrigosprimo">Rodrigo Primo</a>, <a href="http://profiles.wordpress.org/romaimperator">romaimperator</a>, <a href="http://profiles.wordpress.org/roothorick">roothorick</a>, <a href="http://profiles.wordpress.org/ruudjoyo">ruud@joyo</a>, <a href="http://profiles.wordpress.org/ryan">Ryan Boren</a>, <a href="http://profiles.wordpress.org/rmccue">Ryan McCue</a>, <a href="http://profiles.wordpress.org/salcode">Sal Ferrarello</a>, <a href="http://profiles.wordpress.org/otto42">Samuel Wood (Otto)</a>, <a href="http://profiles.wordpress.org/sandyr">Sandeep</a>, <a href="http://profiles.wordpress.org/scottlee">Scott Lee</a>, <a href="http://profiles.wordpress.org/coffee2code">Scott Reilly</a>, <a href="http://profiles.wordpress.org/wonderboymusic">Scott Taylor</a>, <a href="http://profiles.wordpress.org/greglone">ScreenfeedFr</a>, <a href="http://profiles.wordpress.org/scribu">scribu</a>, <a href="http://profiles.wordpress.org/sdasse">sdasse</a>, <a href="http://profiles.wordpress.org/bootsz">Sean Butze</a>, <a href="http://profiles.wordpress.org/seanchayes">Sean Hayes</a>, <a href="http://profiles.wordpress.org/nessworthy">Sean Nessworthy</a>, <a href="http://profiles.wordpress.org/sergeybiryukov">Sergey Biryukov</a>, <a href="http://profiles.wordpress.org/shahpranaf">shahpranaf</a>, <a href="http://profiles.wordpress.org/shaunandrews">Shaun Andrews</a>, <a href="http://profiles.wordpress.org/shinichin">ShinichiN</a>, <a href="http://profiles.wordpress.org/pross">Simon Prosser</a>, <a href="http://profiles.wordpress.org/simonwheatley">Simon Wheatley</a>, <a href="http://profiles.wordpress.org/siobhan">Siobhan</a>, <a href="http://profiles.wordpress.org/siobhyb">Siobhan Bamber (siobhyb)</a>, <a href="http://profiles.wordpress.org/sirzooro">sirzooro</a>, <a href="http://profiles.wordpress.org/solarissmoke">solarissmoke</a>, <a href="http://profiles.wordpress.org/sonjanyc">sonjanyc</a>, <a href="http://profiles.wordpress.org/spencerfinnell">Spencer Finnell</a>, <a href="http://profiles.wordpress.org/piontkowski">Spencer Piontkowski</a>, <a href="http://profiles.wordpress.org/stephcook22">stephcook22</a>, <a href="http://profiles.wordpress.org/netweb">Stephen Edgar</a>, <a href="http://profiles.wordpress.org/stephenharris">Stephen Harris</a>, <a href="http://profiles.wordpress.org/sbruner">Steve Bruner</a>, <a href="http://profiles.wordpress.org/stevenkword">Steven Word</a>, <a href="http://profiles.wordpress.org/miyauchi">Takayuki Miyauchi</a>, <a href="http://profiles.wordpress.org/tanner-m">Tanner Moushey</a>, <a href="http://profiles.wordpress.org/tlovett1">Taylor Lovett</a>, <a href="http://profiles.wordpress.org/tbrams">tbrams</a>, <a href="http://profiles.wordpress.org/tobiasbg">TobiasBg</a>, <a href="http://profiles.wordpress.org/tomauger">Tom Auger</a>, <a href="http://profiles.wordpress.org/willmot">Tom Willmot</a>, <a href="http://profiles.wordpress.org/topher1kenobe">Topher</a>, <a href="http://profiles.wordpress.org/topquarky">topquarky</a>, <a href="http://profiles.wordpress.org/zodiac1978">Torsten Landsiedel</a>, <a href="http://profiles.wordpress.org/toru">Toru</a>, <a href="http://profiles.wordpress.org/wpsmith">Travis Smith</a>, <a href="http://profiles.wordpress.org/umeshsingla">Umesh Kumar</a>, <a href="http://profiles.wordpress.org/undergroundnetwork">undergroundnetwork</a>, <a href="http://profiles.wordpress.org/varunagw">VarunAgw</a>, <a href="http://profiles.wordpress.org/wawco">wawco</a>, <a href="http://profiles.wordpress.org/westonruter">Weston Ruter</a>, <a href="http://profiles.wordpress.org/wokamoto">wokamoto</a>, <a href="http://profiles.wordpress.org/xsonic">xsonic</a>, <a href="http://profiles.wordpress.org/yoavf">Yoav Farhi</a>, <a href="http://profiles.wordpress.org/yurivictor">Yuri Victor</a>, <a href="http://profiles.wordpress.org/zbtirrell">Zach Tirrell</a>, and <a href="http://profiles.wordpress.org/vanillalounge">Ze Fontainhas</a>. Also thanks to <a href="http://michaelpick.wordpress.com/">Michael Pick</a> for producing the release video.</p>\n<p>If you want to follow along or help out, check out <a href="http://make.wordpress.org/">Make WordPress</a> and our <a href="http://make.wordpress.org/core/">core development blog</a>. Thanks for choosing WordPress. See you soon for version 4.0!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:45:"http://wordpress.org/news/2014/04/smith/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WordPress 3.9 Release Candidate 2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"http://wordpress.org/news/2014/04/wordpress-3-9-release-candidate-2/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"http://wordpress.org/news/2014/04/wordpress-3-9-release-candidate-2/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 15 Apr 2014 09:47:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3151";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:356:"The second release candidate for WordPress 3.9 is now available for testing. If you haven&#8217;t tested 3.9 yet, you&#8217;re running out of time! We made about five dozen changes since the first release candidate, and those changes are all helpfully summarized in our weekly post on the development blog. Probably the biggest fixes are to live [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2273:"<p>The second release candidate for WordPress 3.9 is now available for testing.</p>\n<p>If you haven&#8217;t tested 3.9 yet, you&#8217;re running out of time! We made about five dozen changes since the <a title="WordPress 3.9 Release Candidate" href="//wordpress.org/news/2014/04/wordpress-3-9-release-candidate/">first release candidate</a>, and those changes are all helpfully summarized <a href="//make.wordpress.org/core/?p=10237">in our weekly post</a> on the development blog. Probably the biggest fixes are to live widget previews and the new theme browser, along with some extra TinyMCE compatibility and some RTL fixes.</p>\n<p><strong>Plugin authors:</strong> Could you test your plugins against 3.9, and if they&#8217;re compatible, make sure they are marked as tested up to 3.9? It only takes a few minutes and this really helps make launch easier. Be sure to follow along the core development blog; we&#8217;ve been posting <a href="//make.wordpress.org/core/tag/3-9-dev-notes/">notes for developers for 3.9</a>. (For example: <a href="//make.wordpress.org/core/2014/04/15/html5-galleries-captions-in-wordpress-3-9/">HTML5</a>, <a href="//make.wordpress.org/core/2014/04/14/symlinked-plugins-in-wordpress-3-9/">symlinks</a>, <a href="//make.wordpress.org/core/2014/04/07/mysql-in-wordpress-3-9/">MySQL</a>, <a href="//make.wordpress.org/core/2014/04/11/plupload-2-x-in-wordpress-3-9/">Plupload</a>.)</p>\n<p>To test WordPress 3.9 RC2, try the <a href="//wordpress.org/extend/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”). Or you can <a href="//wordpress.org/wordpress-3.9-RC2.zip">download the release candidate here</a> (zip). If you’d like to learn more about what’s new in WordPress 3.9, visit the nearly complete About screen in your dashboard (<strong><img src="//i0.wp.com/core.svn.wordpress.org/branches/3.6/wp-content/themes/twentyten/images/wordpress.png?w=692" alt="" width="16" height="16" /> → About</strong> in the toolbar) and also check out <a title="WordPress 3.9 Beta 1" href="//wordpress.org/news/2014/03/wordpress-3-9-beta-1/">the Beta 1 post</a>.</p>\n<p><em>This is for testing,</em><br />\n<em>so not recommended for<br />\nproduction sites—yet.</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"http://wordpress.org/news/2014/04/wordpress-3-9-release-candidate-2/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"WordPress 3.8.3 Maintenance Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:50:"http://wordpress.org/news/2014/04/wordpress-3-8-3/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:59:"http://wordpress.org/news/2014/04/wordpress-3-8-3/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 14 Apr 2014 19:29:13 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3145";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:338:"WordPress 3.8.3 is now available to fix a small but unfortunate bug in the WordPress 3.8.2 security release. The &#8220;Quick Draft&#8221; tool on the dashboard screen was broken in the 3.8.2 update. If you tried to use it, your draft would disappear and it wouldn&#8217;t save. While we doubt anyone was writing a novella using [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2339:"<p>WordPress 3.8.3 is now available to fix a small but unfortunate bug in the <a title="WordPress 3.8.2 Security Release" href="http://wordpress.org/news/2014/04/wordpress-3-8-2/">WordPress 3.8.2 security release</a>.</p>\n<p>The &#8220;Quick Draft&#8221; tool on the dashboard screen was broken in the 3.8.2 update. If you tried to use it, your draft would disappear and it wouldn&#8217;t save. While we doubt anyone was writing a novella using this tool, <em>any</em> loss of content is unacceptable to us.</p>\n<p>We recognize how much trust you place in us to safeguard your content, and we take this responsibility very seriously. We&#8217;re sorry we let you down.</p>\n<p>We&#8217;ve all lost words we&#8217;ve written before, like an email thanks to a cat on the keyboard or a term paper to a blue screen of death. Over the last few WordPress releases, we&#8217;ve made a number of improvements to features like autosaves and revisions. With revisions, an old edit can always be restored. We&#8217;re trying our hardest to save your content somewhere even if your power goes out or your browser crashes. We even monitor your internet connection and prevent you from hitting that &#8220;Publish&#8221; button at the exact moment the coffee shop Wi-Fi has a hiccup.</p>\n<p>It&#8217;s <em>possible</em> that the quick draft you lost last week is still in the database, and just hidden from view. As an added complication, these &#8220;discarded drafts&#8221; normally get deleted after seven days, and it&#8217;s already been six days since the release. If we were able to rescue your draft, you&#8217;ll see it on the &#8220;All Posts&#8221; screen after you update to 3.8.3. (We&#8217;ll also be pushing 3.8.3 out as a background update, so you may just see a draft appear.)</p>\n<p>So, if you tried to jot down a quick idea last week, I hope WordPress has recovered it for you. Maybe it&#8217;ll turn into that novella.</p>\n<p><a href="http://wordpress.org/download/">Download WordPress 3.8.3</a> or click &#8220;Update Now&#8221; on Dashboard → Updates.</p>\n<p><em>This affected version 3.7.2 as well, so we&#8217;re pushing a 3.7.3 to these installs, but we&#8217;d encourage you to update to the latest and greatest.</em></p>\n<hr />\n<p><em>Now for some good news:<br />\nWordPress 3.9 is near.<br />\nExpect it this week</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/news/2014/04/wordpress-3-8-3/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"WordPress 3.9 Release Candidate";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:66:"http://wordpress.org/news/2014/04/wordpress-3-9-release-candidate/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:75:"http://wordpress.org/news/2014/04/wordpress-3-9-release-candidate/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 08 Apr 2014 21:05:21 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3129";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:338:"As teased earlier, the first release candidate for WordPress 3.9 is now available for testing! We hope to ship WordPress 3.9 next week, but we need your help to get there. If you haven’t tested 3.9 yet, there’s no time like the present. (Please, not on a production site, unless you’re adventurous.) To test WordPress 3.9 [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2967:"<p><a href="//wordpress.org/news/2014/04/wordpress-3-8-2/">As teased earlier</a>, the first release candidate for WordPress 3.9 is now available for testing!</p>\n<p>We hope to ship WordPress 3.9 <em>next week</em>, but we need your help to get there. If you haven’t tested 3.9 yet, there’s no time like the present. (Please, not on a production site, unless you’re adventurous.)</p>\n<p>To test WordPress 3.9 RC1, try the <a href="//wordpress.org/extend/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”). Or you can <a href="//wordpress.org/wordpress-3.9-RC1.zip">download the release candidate here</a> (zip). If you’d like to learn more about what’s new in WordPress 3.9, visit the work-in-progress About screen in your dashboard (<strong><img src="//i0.wp.com/core.svn.wordpress.org/branches/3.6/wp-content/themes/twentyten/images/wordpress.png?w=692" alt="" width="16" height="16" /> → About</strong> in the toolbar) and check out <a title="WordPress 3.9 Beta 1" href="//wordpress.org/news/2014/03/wordpress-3-9-beta-1/">the Beta 1 post</a>.</p>\n<p><strong>Think you’ve found a bug? </strong>Please post to the <a href="//wordpress.org/support/forum/alphabeta/">Alpha/Beta area in the support forums</a>. If any known issues come up, you’ll be able to <a href="//core.trac.wordpress.org/report/5">find them here</a>.</p>\n<p><strong>If you&#8217;re a plugin author</strong>, there are two important changes in particular to be aware of:</p>\n<ul>\n<li>TinyMCE received a major update, to version 4.0. Any editor plugins written for TinyMCE 3.x might require some updates. (If things broke, we&#8217;d like to hear about them so we can make adjustments.) For more, see TinyMCE&#8217;s <a href="http://www.tinymce.com/wiki.php/Tutorial:Migration_guide_from_3.x">migration guide</a> and <a href="http://www.tinymce.com/wiki.php/api4:index">API documentation</a>, and the notes on the <a href="//make.wordpress.org/core/2014/01/18/tinymce-4-0-is-in-core/">core development blog</a>.</li>\n<li>WordPress 3.9 now uses the MySQLi Improved extension for sites running PHP 5.5. Any plugins that made direct calls to <code>mysql_*</code> functions will experience some problems on these sites. For more information, see the notes on the <a href="//make.wordpress.org/core/2014/04/07/mysql-in-wordpress-3-9/">core development blog</a>.</li>\n</ul>\n<p>Be sure to follow along the core development blog, where we will be continuing to post <a href="//make.wordpress.org/core/tag/3-9-dev-notes/">notes for developers for 3.9</a>. (For example, read <a href="//make.wordpress.org/core/2014/03/27/masonry-in-wordpress-3-9/">this</a> if you are using Masonry in your theme.) And please, please update your plugin&#8217;s <em>Tested up to</em> version in the readme to 3.9 before April 16.</p>\n<p><em>Release candidate<br />\nThis haiku&#8217;s the easy one<br />\n3.9 is near</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:71:"http://wordpress.org/news/2014/04/wordpress-3-9-release-candidate/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:32:"WordPress 3.8.2 Security Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:50:"http://wordpress.org/news/2014/04/wordpress-3-8-2/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:59:"http://wordpress.org/news/2014/04/wordpress-3-8-2/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 08 Apr 2014 19:04:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3124";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:355:"WordPress 3.8.2 is now available. This is an important security release for all previous versions and we strongly encourage you to update your sites immediately. This releases fixes a weakness that could let an attacker force their way into your site by forging authentication cookies. This was discovered and fixed by Jon Cave of the WordPress [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2272:"<p>WordPress 3.8.2 is now available. This is an important security release for all previous versions and we strongly encourage you to update your sites immediately.</p>\n<p>This releases fixes a weakness that could let an attacker force their way into your site by forging authentication cookies. This was discovered and fixed by <a href="http://joncave.co.uk/">Jon Cave</a> of the WordPress security team.</p>\n<p>It also contains a fix to prevent a user with the Contributor role from improperly publishing posts. Reported by <a href="http://edik.ch/">edik</a>.</p>\n<p>This release also fixes nine bugs and contains three other security hardening changes:</p>\n<ul>\n<li>Pass along additional information when processing pingbacks to help hosts identify potentially abusive requests.</li>\n<li>Fix a low-impact SQL injection by trusted users. Reported by <a href="http://www.dxw.com/">Tom Adams</a> of dxw.</li>\n<li>Prevent possible cross-domain scripting through Plupload, the third-party library WordPress uses for uploading files. Reported by <a href="http://szgru.website.pl/">Szymon Gruszecki</a>.</li>\n</ul>\n<p>We appreciated <a href="http://codex.wordpress.org/FAQ_Security">responsible disclosure</a> of these security issues directly to our security team. For more information on all of the changes, see the <a href="http://codex.wordpress.org/Version_3.8.2">release notes</a> or consult <a href="https://core.trac.wordpress.org/log/branches/3.8?rev=28057&amp;stop_rev=27024">the list of changes</a>.</p>\n<p><a href="http://wordpress.org/download/">Download WordPress 3.8.2</a> or venture over to <strong>Dashboard → Updates</strong> and simply click &#8220;Update Now.&#8221;</p>\n<p>Sites that support automatic background updates will be updated to WordPress 3.8.2 within 12 hours. If you are still on WordPress 3.7.1, you will be updated to 3.7.2, which contains the same security fixes as 3.8.2. We don&#8217;t support older versions, so please update to 3.8.2 for the latest and greatest.</p>\n<p>Already testing WordPress 3.9? The first release candidate is <a href="https://wordpress.org/wordpress-3.9-RC1.zip">now available</a> (zip) and it contains these security fixes. Look for a full announcement later today; we expect to release 3.9 next week.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/news/2014/04/wordpress-3-8-2/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 3.9 Beta 3";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/news/2014/03/wordpress-3-9-beta-3/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wordpress.org/news/2014/03/wordpress-3-9-beta-3/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 29 Mar 2014 13:15:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3106";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:373:"The third (and maybe last) beta of WordPress 3.9 is now available for download. Beta 3 includes more than 200 changes, including: New features like live widget previews and the new theme installer are now more ready for prime time, so check &#8216;em out. UI refinements when editing images and when working with media in the editor. We&#8217;ve also brought [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2668:"<p>The third (and maybe last) beta of WordPress 3.9 is now available for download.</p>\n<p>Beta 3 includes more than 200 <a href="https://core.trac.wordpress.org/log?rev=27850&amp;stop_rev=27639&amp;limit=300">changes</a>, including:</p>\n<ul>\n<li>New features like live widget previews and the new theme installer are now more ready for prime time, so check &#8216;em out.</li>\n<li>UI refinements when editing images and when working with media in the editor. We&#8217;ve also brought back some of the advanced display settings for images.</li>\n<li>If you want to test out audio and video playlists, the links will appear in the media manager once you&#8217;ve uploaded an audio or video file.</li>\n<li>For theme developers, we&#8217;ve added HTML5 caption support (<a class="reopened ticket" title="task (blessed): HTML5 captions (reopened)" href="https://core.trac.wordpress.org/ticket/26642">#26642</a>) to match the new gallery support (<a class="closed ticket" title="enhancement: HTML5 Galleries (closed: fixed)" href="https://core.trac.wordpress.org/ticket/26697">#26697</a>).</li>\n<li>The formatting function that turns straight quotes into smart quotes (among other things) underwent some changes to drastically speed it up, so let us know if you see anything weird.</li>\n</ul>\n<p><strong>We need your help</strong>. We&#8217;re still aiming for an April release, which means the next week will be critical for identifying and squashing bugs. If you&#8217;re just joining us, please see <a href="https://wordpress.org/news/2014/03/wordpress-3-9-beta-1/">the Beta 1 announcement post</a> for what to look out for.</p>\n<p><strong>If you think you’ve found a bug</strong>, you can post to the <a href="http://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums, where friendly moderators are standing by. <b>Plugin developers</b><strong>,</strong> if you haven&#8217;t tested WordPress 3.9 yet, now is the time — and be sure to update the &#8220;tested up to&#8221; version for your plugins so they&#8217;re listed as compatible with 3.9.</p>\n<p><strong>This software is still in development,</strong> so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 3.9, try the <a href="http://wordpress.org/extend/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”). Or you can <a href="http://wordpress.org/wordpress-3.9-beta3.zip">download the beta here</a> (zip).</p>\n<p><em>WordPress 3.9<br />\nLet&#8217;s make the date official<br />\nIt&#8217;s April 16</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wordpress.org/news/2014/03/wordpress-3-9-beta-3/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 3.9 Beta 2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/news/2014/03/wordpress-3-9-beta-2/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wordpress.org/news/2014/03/wordpress-3-9-beta-2/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Mar 2014 05:01:25 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3101";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:309:"WordPress 3.9 Beta 2 is now available for testing! We&#8217;ve made more than a hundred changes since Beta 1, but we still need your help if we&#8217;re going to hit our goal of an April release. For what to look out for, please head on over to the Beta 1 announcement post. Some of the changes in [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1901:"<p>WordPress 3.9 Beta 2 is now available for testing!</p>\n<p>We&#8217;ve made more than a hundred <a href="https://core.trac.wordpress.org/log?rev=27639&amp;stop_rev=27500&amp;limit=200">changes</a> since Beta 1, but we still need your help if we&#8217;re going to hit our goal of an April release. For what to look out for, please head on over to <a href="https://wordpress.org/news/2014/03/wordpress-3-9-beta-1/">the Beta 1 announcement post</a>. Some of the changes in Beta 2 include:</p>\n<ul>\n<li>Rendering of embedded audio and video players directly in the visual editor.</li>\n<li>Visual and functional improvements to the editor, the media manager, and theme installer.</li>\n<li>Various bug fixes to TinyMCE, the software behind the visual editor.</li>\n<li>Lots of fixes to widget management in the theme customizer.</li>\n</ul>\n<p>As always,<strong> if you think you’ve found a bug</strong>, you can post to the <a href="http://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. Or, if you’re comfortable writing a reproducible bug report, <a href="https://make.wordpress.org/core/reports/">file one on the WordPress Trac</a>. There, you can also find <a href="http://core.trac.wordpress.org/tickets/major">a list of known bugs</a> and <a href="http://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=3.9">everything we’ve fixed</a> so far.</p>\n<p><strong>This software is still in development,</strong> so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 3.9, try the <a href="http://wordpress.org/extend/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”). Or you can <a href="http://wordpress.org/wordpress-3.9-beta2.zip">download the beta here</a> (zip).</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wordpress.org/news/2014/03/wordpress-3-9-beta-2/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 3.9 Beta 1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/news/2014/03/wordpress-3-9-beta-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wordpress.org/news/2014/03/wordpress-3-9-beta-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 11 Mar 2014 13:42:19 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3083";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:329:"I&#8217;m excited to announce that the first beta of WordPress 3.9 is now available for testing. WordPress 3.9 is due out next month &#8212; but in order to hit that goal, we need your help testing all of the goodies we&#8217;ve added: We updated TinyMCE, the software powering the visual editor, to the latest version. [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:6065:"<p>I&#8217;m excited to announce that the <strong>first beta of WordPress 3.9</strong> is now available for testing.</p>\n<p>WordPress 3.9 is due out next month &#8212; but in order to hit that goal, <strong>we need your help</strong> testing all of the goodies we&#8217;ve added:</p>\n<ul>\n<li>We updated TinyMCE, the software powering the visual editor, to the latest version. Be on the lookout for cleaner markup. Also try the new paste handling &#8212; if you paste in a block of text from Microsoft Word, for example, it will no longer come out terrible. (The &#8220;Paste from Word&#8221; button you probably never noticed has been removed.) It&#8217;s possible some plugins that added stuff to the visual editor (like a new toolbar button) no longer work, so we&#8217;d like to hear about them (<a href="https://core.trac.wordpress.org/ticket/24067">#24067</a>). (And be sure to <a href="http://wordpress.org/support/">open a support thread</a> for the plugin author.)</li>\n<li>We&#8217;ve added <strong>widget management to live previews</strong> (the customizer). Please test editing, adding, and rearranging widgets! (<a href="https://core.trac.wordpress.org/ticket/27112">#27112</a>) We&#8217;ve also added the ability to upload, crop, and manage header images, without needing to leave the preview. (<a href="https://core.trac.wordpress.org/ticket/21785">#21785</a>)</li>\n<li>We brought 3.8&#8217;s beautiful new theme browsing experience to the <strong>theme installer</strong>. Check it out! (<a title="View ticket" href="https://core.trac.wordpress.org/ticket/27055">#27055</a>)</li>\n<li><strong>Galleries</strong> now receive a live preview in the editor. Upload some photos and insert a gallery to see this in action. (<a href="https://core.trac.wordpress.org/ticket/26959">#26959</a>)</li>\n<li>You can now <strong>drag-and-drop</strong> images directly onto the editor to upload them. It can be a bit finicky, so try it and help us work out the kinks. (<a href="https://core.trac.wordpress.org/ticket/19845">#19845</a>)</li>\n<li>Some things got improved around <strong>editing images</strong>. It&#8217;s a lot easier to make changes to an image after you insert it into a post (<a class="closed" title="View ticket" href="https://core.trac.wordpress.org/ticket/24409">#24409</a>) and you no longer get kicked to a new window when you need to crop or rotate an image (<a href="https://core.trac.wordpress.org/ticket/21811">#21811</a>).</li>\n<li>New <strong>audio/video playlists</strong>. Upload a few audio or video files to test these. (<a href="https://core.trac.wordpress.org/ticket/26631">#26631</a>)</li>\n</ul>\n<p><strong>If you think you’ve found a bug</strong>, you can post to the <a href="http://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. We&#8217;d love to hear from you! If you’re comfortable writing a reproducible bug report, <a href="https://make.wordpress.org/core/reports/">file one on the WordPress Trac</a>. There, you can also find <a href="http://core.trac.wordpress.org/tickets/major">a list of known bugs</a> and <a href="http://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=3.9">everything we’ve fixed</a> so far.</p>\n<p><strong>This software is still in development,</strong> so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 3.9, try the <a href="http://wordpress.org/extend/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”). Or you can <a href="http://wordpress.org/wordpress-3.9-beta1.zip">download the beta here</a> (zip).</p>\n<hr />\n<p><strong>DEVELOPERS!</strong> Hello! There&#8217;s lots for you, too.</p>\n<p><strong>Please test your plugins and themes!</strong> There&#8217;s a lot of great stuff under the hood in 3.9 and we hope to blog a bit about them in the coming days. If you haven&#8217;t been reading the awesome <a href="http://make.wordpress.org/core/tag/week-in-core/">weekly summaries</a> on the <a href="http://make.wordpress.org/core/">main core development blog</a>, that&#8217;s a great place to start. (You should definitely follow that blog.) For now, here are some things to watch out for when testing:</p>\n<ul>\n<li>The <strong>load process in multisite</strong> got rewritten. If you notice any issues with your network, see <a href="https://core.trac.wordpress.org/ticket/27003">#27003</a>.</li>\n<li>We now use the <strong>MySQL Improved (mysqli) database extension</strong> if you&#8217;re running a recent version of PHP (<a href="https://core.trac.wordpress.org/ticket/21663">#21663</a>). Please test your plugins and see that everything works well, and please make sure you&#8217;re not calling <code>mysql_*</code> functions directly.</li>\n<li><strong>Autosave</strong> was refactored, so if you see any issues related to autosaving, heartbeat, etc., let us know (<a href="https://core.trac.wordpress.org/ticket/25272">#25272</a>).</li>\n<li>Library updates, in particular Backbone 1.1 and Underscore 1.6 (<a href="https://core.trac.wordpress.org/ticket/26799">#26799</a>). Also Masonry 3 (<a href="https://core.trac.wordpress.org/ticket/25351">#25351</a>), PHPMailer (<a href="https://core.trac.wordpress.org/ticket/25560">#25560</a>), Plupload (<a href="https://core.trac.wordpress.org/ticket/25663">#25663</a>), and TinyMCE (<a href="https://core.trac.wordpress.org/ticket/24067">#24067</a>).</li>\n<li>TinyMCE 4.0 is a <em>major</em> update. Please see TinyMCE&#8217;s <a href="http://www.tinymce.com/wiki.php/Tutorial:Migration_guide_from_3.x">upgrade guide</a> and our <a href="https://core.trac.wordpress.org/ticket/24067">implementation ticket</a> for more. If you have any questions or problems, please <a href="http://wordpress.org/support/forum/alphabeta">open a thread in the support forums</a>.</li>\n</ul>\n<p>Happy testing!</p>\n<p><em><em>Lots of improvements<br />\nLittle things go a long way</em><br />\nPlease test beta one<br />\n</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wordpress.org/news/2014/03/wordpress-3-9-beta-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:31:"http://wordpress.org/news/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:8:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Tue, 15 Jul 2014 10:05:51 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:10:"x-pingback";s:36:"http://wordpress.org/news/xmlrpc.php";s:13:"last-modified";s:29:"Thu, 10 Jul 2014 10:27:22 GMT";s:4:"x-nc";s:11:"HIT lax 249";}s:5:"build";s:14:"20130911010210";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(355, '_transient_timeout_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1405461959', 'no'),
(356, '_transient_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1405418759', 'no'),
(357, '_transient_timeout_feed_867bd5c64f85878d03a060509cd2f92c', '1405461960', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(358, '_transient_feed_867bd5c64f85878d03a060509cd2f92c', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:61:"\n	\n	\n	\n	\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"WordPress Planet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:28:"http://planet.wordpress.org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:2:"en";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:47:"WordPress Planet - http://planet.wordpress.org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:50:{i:0;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:79:"WPTavern: Hybrid Core 2.0 Adds Composer Support, Removes Widgets From Framework";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=26332";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:200:"http://wptavern.com/hybrid-core-2-0-adds-composer-support-removes-widgets-from-framework?utm_source=rss&utm_medium=rss&utm_campaign=hybrid-core-2-0-adds-composer-support-removes-widgets-from-framework";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5132:"<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2014/07/hybrid-core1.png" rel="prettyphoto[26332]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2014/07/hybrid-core1.png?resize=700%2C285" alt="hybrid-core" class="aligncenter size-full wp-image-26407" /></a></p>\n<p>Theme Hybrid released <a href="http://themehybrid.com/weblog/hybrid-core-version-2-0" target="_blank">Hybrid Core 2.0</a> today after many months in development. The framework, created by Justin Tadlock, powers this site and many other WordPress sites on the web. <a href="http://themehybrid.com/weblog/hybrid-core-theme-framework-version-1-0" target="_blank">Version 1.0</a> was first released in October 2010, built from the engine that made up the base of Tadlock&#8217;s popular Hybrid Theme.</p>\n<p>Since that time, <a href="http://themehybrid.com/hybrid-core" target="_blank">Hybrid Core</a> has been downloaded hundreds of thousands of times. Version 2.0 includes <a href="https://github.com/justintadlock/hybrid-core/commits/2.0.0" target="_blank">more than 200 commits</a> and several major changes that will be important for users and theme developers to know about.</p>\n<h3>Composer Support</h3>\n<p>Tadlock credits Andrey Savchenko (<a href="http://www.rarst.net/" target="_blank">@Rarst</a>) with helping to add <a href="https://getcomposer.org/" target="_blank">Composer</a> support to Hybrid Core. Composer is a dependency manager for PHP that operates on a project-by-project basis by pulling in all the required libraries to manage them in one place.</p>\n<p>Hybrid Core now includes a <a href="https://github.com/justintadlock/hybrid-core/blob/master/composer.json" target="_blank">composer.json</a> file and those familiar with Composer can find the <a href="https://packagist.org/packages/justintadlock/hybrid-core" target="_blank">package link</a> on Packagist. Please note that using Composer is optional and not required for using Hybrid Core. For more information on getting started, check out @Rarst&#8217;s mini guide on using <a href="http://composer.rarst.net/" target="_blank">Composer with WordPress</a>.</p>\n<h3>Trimming the Framework</h3>\n<p>Hybrid Core 2.0 is a return to the basics of WordPress theme development in that it further separates functionality from presentation. Tadlock took a blade to framework and sliced out a sizeable chunk of legacy code, opting to support accompanying plugins to keep the core lean.</p>\n<p>Widgets have been <a href="http://themehybrid.com/weblog/where-oh-where-have-my-widgets-gone" target="_blank">completely removed</a> in favor of the <a href="http://themehybrid.com/plugins/widgets-reloaded" target="_blank">Widgets Reloaded</a> plugin, which Tadlock recommends users install if they want to keep their widgets. Entry Views was converted into a WordPress <a href="http://themehybrid.com/weblog/entry-views-wordpress-plugin" target="_blank">plugin</a> in order to help keep the framework more modular. Several extensions were dropped entirely, along with post and comment-related template shortcodes and deprecated functions prior to 2.0.</p>\n<p>Theme developers will be particularly interested in the new attribute system which allows for more flexibility than using body_class(). It includes built-in support for ARIA and <a href="http://schema.org/" target="_blank">Schema.org microdata</a>.</p>\n<p>Hybrid Core 2.0 also organizes all of the framework&#8217;s template tags into a /functions directory and introduces many new tags for theme authors. &#8220;Most of them are on my WordPress &#8216;wish list,&#8217;&#8221; Tadlock said. &#8220;So I hope to eventually see them added to core WordPress. They are functions that I believe are hugely beneficial to theme authors.&#8221;</p>\n<p>Overall, Tadlock was able reduce 66 KB from the Hybrid Core zip file, while adding new features for theme developers at the same time. Naturally, if your site was making use of anything that was removed, an update to 2.0 may require you to add a new plugin or make transitions in your theme&#8217;s code. You&#8217;ll want to review the specifics outlined in the release <a href="http://themehybrid.com/weblog/hybrid-core-version-2-0" target="_blank">announcement</a>.</p>\n<p>Theme Hybrid has always been on the forefront of defining and redefining WordPress theme frameworks and the relationship between parent/child themes. Tadlock is a purist when it comes to WordPress theme development best practices and his commitment to <a href="http://wptavern.com/why-wordpress-theme-developers-are-moving-functionality-into-plugins" target="_blank">data portability</a> is admirable in a theme market where many of the largest sellers are only there to make a buck.</p>\n<p>Hybrid Core 2.0 is a much leaner version of the framework that theme developers have been working with for years. As documentation is still being written, you&#8217;ll need to take it out of the box and explore the code to find all the new goodies. <a href="http://themehybrid.com/hybrid-core" target="_blank">Hybrid Core 2.0</a>, like all Theme Hybrid plugins and themes, is available to download for free.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 15 Jul 2014 03:45:19 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:93:"WPTavern: WP Quick Install Script Offers a Fast Way to Install WordPress, Plugins, and Themes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=26103";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:226:"http://wptavern.com/wp-quick-install-script-offers-a-fast-way-to-install-wordpress-plugins-and-themes?utm_source=rss&utm_medium=rss&utm_campaign=wp-quick-install-script-offers-a-fast-way-to-install-wordpress-plugins-and-themes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4958:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/wp-quick-install.jpeg" rel="prettyphoto[26103]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/wp-quick-install.jpeg?resize=300%2C263" alt="wp-quick-install" class="alignright size-medium wp-image-26338" /></a></p>\n<p><a href="http://wp-quick-install.com/" target="_blank">WP Quick Install</a> is an interesting new tool from Julio Potier, Jonathan Buttigieg, and Jean-Baptiste Marchand-Arvier, the folks behind <a href="http://wptavern.com/wp-rocket-launches-commercial-caching-plugin-for-wordpress" target="_blank">WP Rocket</a>. As part of supporting their commercial caching plugin, the WP Rocket team works extensively with clients. WP Quick Install is a tool they use internally and decided to share with the community.</p>\n<p>Its creators claim that the script is the easiest way to install WordPress. You download the tiny script and then upload it to where you want your installation. The new installation screen allows you to add themes and plugins to your site as well as configure some of the most common settings. It even allows you to do a few extra handy things like auto-remove the default content created by WordPress, ie. page, post, comment, themes, etc.</p>\n<p>&#8220;We set up a fresh WordPress installation almost every week, both for our clients and for testing purposes,&#8221; Marchand-Arvier told the Tavern. &#8220;It&#8217;s always the same (when we don&#8217;t have SSH): download the zip, unzip, upload via ftp, install our favorites plugins, remove the default content, etc. So we developed a tool to do this for us.&#8221;</p>\n<p>Marchand-Arvier said that the team created the tool for the sake of convenience and wanted to share it to give back to the community. He confirmed that they have no plans to build a commercial product around it but simply want to release as many free plugins and scripts as they can while developing for WordPress.</p>\n<h3>Bulk Install Plugins and Themes While Installing WordPress</h3>\n<p>In addition to all the usual database details, WP Quick Install allows you to select search engine privacy settings, media thumbnail sizes, revision and autosave settings, enable debug mode, and disable the theme and plugin editors.  Any theme that you include in the install folder can also be automatically activated:</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/theme-info.png" rel="prettyphoto[26103]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/theme-info.png?resize=736%2C298" alt="theme-info" class="aligncenter size-full wp-image-26345" /></a></p>\n<p>The automatic plugin installation part of the script is likely to save users the most time. It allows you to specify extensions by their slugs and automatically activate them upon installation:</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/extensions-information.png" rel="prettyphoto[26103]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/extensions-information.png?resize=721%2C337" alt="extensions-information" class="aligncenter size-full wp-image-26347" /></a></p>\n<p>WP Quick Install may seem like a long installation form to fill out, but the good news is that you can include a data.ini file to pre-populate the installation form or to generate content (posts, pages, etc).</p>\n<h3>Multisite Support Coming Soon</h3>\n<p>In the future, the WP Rocket team plans to add network creation to the script. &#8220;We want to keep it simple, but of course we definitely want to improve this tool,&#8221; Marchand-Arvier said. &#8220;We are currently working on multisite deployment. The script is on <a href="https://github.com/GeekPress/WP-Quick-Install" target="_blank">GitHub</a> and it&#8217;s open to contributions.&#8221;</p>\n<p>The tool is convenient if you prepare a data.ini file to pre-populate the installation form, but its primary shortcoming is that it doesn&#8217;t let you select the language before doing anything else. The script uses the WordPress 4.0 language API to manage the dropdown selection, allowing you to install in any language. However, it doesn&#8217;t automatically change the language in the installation process. This forces the user to complete the lengthy form in English. Hopefully, this aspect of the script will be improved in the next version.</p>\n<p>The WP Rocket team created <a href="http://wp-quick-install.com/" target="_blank">WP Quick Install</a> chiefly for novice developers. &#8220;We aren&#8217;t pretending to replace the classic WordPress installation,&#8221; Marchand-Arvier said. &#8220;But today we believe that it&#8217;s the easiest way to install WordPress, especially if you don&#8217;t use WP-CLI or wget to install.&#8221; Check out the demo video below and let us know in the comments if you think the script can help you speed up your installations.</p>\n<p><span class="embed-youtube"></span></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 14 Jul 2014 20:48:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:79:"WPTavern: Critical Security Update For WPTouch, Users Should Update Immediately";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=26304";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:200:"http://wptavern.com/critical-security-update-for-wptouch-users-should-update-immediately?utm_source=rss&utm_medium=rss&utm_campaign=critical-security-update-for-wptouch-users-should-update-immediately";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2209:"<p>First <a title="http://blog.sucuri.net/2014/07/disclosure-insecure-nonce-generation-in-wptouch.html" href="http://blog.sucuri.net/2014/07/disclosure-insecure-nonce-generation-in-wptouch.html">reported by Sucuri</a>, the <a title="https://wordpress.org/plugins/wptouch/" href="https://wordpress.org/plugins/wptouch/">WPTouch plugin</a> has a dangerous security vulnerability and users are encouraged to update immediately. WPTouch is used to quickly add mobile support to websites and has over 5 million downloads making it one of the most popular plugins in the WordPress plugin directory.</p>\n<div id="attachment_26317" class="wp-caption aligncenter"><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2014/07/WPTouchFeaturedImage.png" rel="prettyphoto[26304]"><img class="size-full wp-image-26317" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2014/07/WPTouchFeaturedImage.png?resize=739%2C243" alt="WPTouch Plugin Header" /></a><p class="wp-caption-text">WPTouch Plugin Header</p></div>\n<p>&nbsp;</p>\n<p>According to Sucuri, WPTouch incorrectly uses the &#8220;<em>admin_init</em>&#8221; hook which can lead to users without the correct capabilities to upload malicious files to the server. Mailpoet, another popular plugin <a title="http://wptavern.com/wordpress-mailpoet-plugin-security-vulnerability-immediate-update-recommended" href="http://wptavern.com/wordpress-mailpoet-plugin-security-vulnerability-immediate-update-recommended">recently suffered</a> from the same type of security issue. Taking advantage of the bug is a simple two-step process.</p>\n<blockquote><p>All an attacker had to do in order to compromise a vulnerable website was to:</p>\n<ol>\n<li>Log­in and get his nonce via wp-admin</li>\n<li>Send an AJAX file upload request containing the leaked nonce and his backdoor</li>\n</ol>\n<p>So long story short – don’t only use nonces to protect sensitive methods, always add functions such as “current_user_can()” or the likes to confirm a user’s right to do something.</p></blockquote>\n<p>The vulnerability only affects sites that have registration enabled but you should update regardless. Users should already see an upgrade notification in the dashboard.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 14 Jul 2014 16:45:09 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:58:"WPTavern: Baskerville: A Free WordPress Theme for Hoarders";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=26215";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:158:"http://wptavern.com/baskerville-a-free-wordpress-theme-for-hoarders?utm_source=rss&utm_medium=rss&utm_campaign=baskerville-a-free-wordpress-theme-for-hoarders";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3177:"<p><a href="http://wordpress.org/themes/baskerville" target="_blank">Baskerville</a> is a new masonry grid style WordPress theme available from designer <a href="http://wptavern.com/anders-noren-on-achieving-simplicity-in-wordpress-theme-design" target="_blank">Anders Norén</a>. His popular <a href="http://wordpress.org/themes/hemingway" target="_blank">Hemingway</a> theme has received more than 60,000 downloads on WordPress.org and is also offered on <a href="http://theme.wordpress.com/themes/hemingway-rewritten/" target="_blank">WordPress.com</a>. Baskerville was created to showcase many different types of content, hence its tagline: &#8220;A WordPress Theme for Hoarders.&#8221;</p>\n<p>The theme bears Norén&#8217;s trademark minimalist style, is responsive and retina-ready. It includes support for all nine post formats with content-specific styles for videos, galleries, images, quotes, links, etc.</p>\n<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2014/07/baskerville.png" rel="prettyphoto[26215]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2014/07/baskerville.png?resize=880%2C660" alt="baskerville" class="aligncenter size-full wp-image-26276" /></a></p>\n<p>Post meta is attractively styled and placed at the bottom of the content, so it doesn&#8217;t clutter up the page and detract from the main event. It also includes an author box with social links.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/quote-format.jpg" rel="prettyphoto[26215]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/quote-format.jpg?resize=725%2C845" alt="quote-format" class="aligncenter size-full wp-image-26297" /></a></p>\n<p>Baskerville customization options can be found in the customizer, including:</p>\n<ul>\n<li>Custom logo upload</li>\n<li>Background color</li>\n<li>Custom header image(s) and ability to randomize the display</li>\n<li>Background image</li>\n<li>Two widget areas (sidebar and footer)</li>\n</ul>\n<p>Check out a <a href="http://andersnoren.se/themes/baskerville/" target="_blank">live demo</a> of Baskerville to resize your browser window to see how smoothly it responds to different screen sizes.</p>\n<p>The theme also adds three custom widgets to display videos, Flickr, Dribbble shots and like functionality via the <a href="http://www.themezilla.com/plugins/zillalikes/" target="_blank">ZillaLikes</a> plugin. Pages can be customized via four different templates, including full-width, no sidebar, archives and a contributors template which showcases writers with avatars, descriptions and social links.</p>\n<p>Baskerville includes a Swedish/svenska translation but the code is translation-ready so you can easily translate it into your own language.</p>\n<p>If you&#8217;re enthusiastic about using post formats, then <a href="http://wordpress.org/themes/baskerville" target="_blank">Baskerville</a> may be the theme for you. It works nicely for magazines or personal blogs that regularly post multimedia content. Install it via your WordPress admin theme browser or <a href="http://wordpress.org/themes/baskerville" target="_blank">download</a> it directly from WordPress.org.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 14 Jul 2014 16:15:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:58:"WordPress.tv: Peter Lauge: Avancerede WordPress-løsninger";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=36605";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:76:"http://wordpress.tv/2014/07/14/peter-lauge-avancerede-wordpress-losninger-2/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:665:"<div id="v-RaLiPRyJ-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/36605/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/36605/" /></a> <img alt="" border="0" src="http://pixel.wp.com/b.gif?host=wordpress.tv&blog=5089392&post=36605&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2014/07/14/peter-lauge-avancerede-wordpress-losninger-2/"><img alt="Peter Lauge: Avancerede WordPress-løsninger" src="http://videos.videopress.com/RaLiPRyJ/video-45325fb52b_scruberthumbnail_0.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 14 Jul 2014 15:57:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:46:"WordPress.tv: K.Adam White: Modular JavaScript";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=36418";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:63:"http://wordpress.tv/2014/07/14/k-adam-white-modular-javascript/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:640:"<div id="v-GmWlWodu-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/36418/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/36418/" /></a> <img alt="" border="0" src="http://pixel.wp.com/b.gif?host=wordpress.tv&blog=5089392&post=36418&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2014/07/14/k-adam-white-modular-javascript/"><img alt="K.Adam White: Modular JavaScript" src="http://videos.videopress.com/GmWlWodu/video-d0b589ff3e_scruberthumbnail_0.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 14 Jul 2014 15:53:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:71:"WordPress.tv: Ján Bočínec: Frameworky, Pods a skrytá sila WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=19160";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:85:"http://wordpress.tv/2014/07/14/jan-bocinec-frameworky-pods-a-skryta-sila-wordpress-2/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:681:"<div id="v-NUGbwKm3-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/19160/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/19160/" /></a> <img alt="" border="0" src="http://pixel.wp.com/b.gif?host=wordpress.tv&blog=5089392&post=19160&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2014/07/14/jan-bocinec-frameworky-pods-a-skryta-sila-wordpress-2/"><img alt="Ján Bočínec: Frameworky, Pods a skrytá sila WordPress" src="http://videos.videopress.com/NUGbwKm3/video-440eea2f8b_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 14 Jul 2014 15:49:15 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:70:"Post Status: Chris Coyier on WordPress, business, and building the web";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:30:"http://www.poststat.us/?p=6874";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:112:"http://www.poststat.us/chris-coyier-interview/?utm_source=rss&utm_medium=rss&utm_campaign=chris-coyier-interview";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:12629:"<p><img class="aligncenter size-large wp-image-6881" src="http://www.poststat.us/wp-content/uploads/2014/07/chris-coyier-752x406.jpg" alt="chris-coyier" width="752" height="406" />Chris Coyier is not a stranger to most of us web workers. He&#8217;s a designer at <a title="CodePen" href="http://codepen.io">CodePen</a>, a writer at <a title="CSS-Tricks" href="http://css-tricks.com">CSS-Tricks</a>, and a podcaster at <a title="ShopTalk Podcast" href="http://shoptalkshow.com">ShopTalk</a>.</p>\n<p>He uses WordPress on all three of his primary projects. For years, Chris has been a consistent advocate for the platform. He develops his own websites with WordPress, but his day-to-day interactions are as a user.</p>\n<p>Chris brings a unique perspective, I believe. He did some client work early in his career, but he&#8217;s been more involved in SaaS projects and membership websites; his current membership websites are on WordPress (CSS-Tricks) and Ruby on Rails (CodePen).</p>\n<p>I asked Chris about his projects, his perspective on various aspects of WordPress, and the community around it. I enjoyed learning from him, and I hope you do too:</p>\n<!--[if lt IE 9]><script>document.createElement(''audio'');</script><![endif]-->\n<a href="http://s3.amazonaws.com/PostStatus/DraftPodcast/chris-coyier-post-status-draft.mp3">http://s3.amazonaws.com/PostStatus/DraftPodcast/chris-coyier-post-status-draft.mp3</a>\n<p><a href="http://s3.amazonaws.com/PostStatus/DraftPodcast/chris-coyier-post-status-draft.mp3">Direct Download</a></p>\n<h3>What have you learned from working on membership websites?</h3>\n<blockquote><p> It&#8217;s just a good dang business idea.</p></blockquote>\n<p>Chris was sold on the idea of membership websites from his tenure at <a title="Wufoo" href="http://www.wufoo.com/">Wufoo</a> and <a title="SurveyMonkey" href="https://www.surveymonkey.com/">SurveyMonkey</a> (where he worked once they acquired Wufoo).</p>\n<p>He uses Pippin Williamson&#8217;s <a href="https://pippinsplugins.com/restrict-content-pro-premium-content-plugin/">Restrict Content Pro</a> for managing <a title="The Lodge" href="http://css-tricks.com/lodge/">The Lodge</a> on CSS-Tricks. At CodePen, they spend time thinking about pricing, churn, and other membership metrics.</p>\n<p>They talk about some of these things (and much more) on the <a title="CodePen Radio" href="http://blog.codepen.io/radio/">CodePen Radio</a> podcast &#8212; an awesome podcast for anyone interested in SaaS, not just CodePen.</p>\n<h4>Delivering value</h4>\n<p>Another aspect Chris noted about membership websites is how it makes you want to continually deliver value for customers. He always wants to make people feel like they&#8217;re getting excellent features and value for the price of their membership.</p>\n<p>Another thing he and the CodePen team are learning is prioritizing feature requests. When you are building for members, you want to build features members want; and sometimes that goes against other fixes that are less glamorous. So they are consistently trying to balance time spent on customer-facing features versus behind the scenes development.</p>\n<h4>Build the feature, get the reward</h4>\n<p>Chris talked about how important it is for him to build something, then be rewarded for the work he does, versus selling something and then having to build the feature for it.</p>\n<p>He experience this with his big <a href="https://www.kickstarter.com/projects/chriscoyier/screencasting-a-complete-redesign">Kickstarter</a> project for a CSS-Tricks redesign a couple of years ago, and said that mentality was really difficult for him.</p>\n<h3>What do you appreciate more now about WordPress, after using other software?</h3>\n<p>WordPress comes with a lot of built-in features that many of us (I do at least) may take for granted. Need a user system? Check. Need comments? Check. Need categorization? Check.</p>\n<p>Building CodePen, Chris is able to appreciate (even more than before) just how powerful WordPress is and how much thought goes into every feature.</p>\n<p>We dove into something seemingly simple as an example: tags. It turns out that something even that simple takes a lot of thought, consideration, and user experience considerations.</p>\n<blockquote><p>What it ends up as, is something you&#8217;ll have to iterate on for years to get anywhere close to how good the WordPress one works already. And that&#8217;s like the tiniest thing we could think about. Think about the login system, or something else.</p></blockquote>\n<p>So his advice was to focus on simplicity and decisions when building features, because required effort grows rapidly as a feature gets more complicated.</p>\n<h3>How would you compare the WordPress community to other web communities?</h3>\n<p>Chris has exposure to a much broader web community than I do. I&#8217;m pretty locked into the WordPress bubble. He sees the Ruby on Rails world, the more generic web world, and attends and speaks at a slew of non-WordPress conferences every year.</p>\n<p>Even though he says he&#8217;s mostly in a WordPress bubble himself (he&#8217;s not exactly attending Drupal conferences, he notes), he thinks that the WordPress community is pretty top-notch, and hasn&#8217;t seen other communities that are &#8220;better&#8221; than the WordPress community.</p>\n<blockquote><p>There&#8217;s definitely no other CMS that I&#8217;m jealous of that community.</p></blockquote>\n<h3>What questions about WordPress are you always seeing on the ShopTalk Podcast</h3>\n<p>Chris and his co-host Dave Rupert (seriously, <a href="https://twitter.com/davatron5000">follow Dave</a> and gain laughs and knowledge in life) get a lot of questions about WordPress on the ShopTalk Podcast. Some of these questions are repeated pretty frequently, and they see trends of common issues.</p>\n<h4>Working locally and syncing remotely</h4>\n<p><span id="more-6874"></span></p>\n<p>For WordPress, the most common questions tend to come around syncing the local development environment with the live environment. They&#8217;ve been recommending <a title="WP Migrate DB Pro" href="https://deliciousbrains.com/wp-migrate-db-pro/">WP Migrate DB Pro</a> for people trying to get around that, though Chris says he doesn&#8217;t think it&#8217;s perfect for huge websites like CSS-Tricks.</p>\n<p>I think, to a degree, the common confusion is logical. WordPress development is really centered around three different layers of &#8220;stuff&#8221;: the content (posts, pages, etc), the files in the directory, and the site management database options. I think there is plenty of room for confusion when it&#8217;s not easy to decouple website management with website content, from a database perspective.</p>\n<h4>Learning more about WordPress through the lens of a different audience</h4>\n<p>I used this segment to talk about other confusing aspects of WordPress. We talked about database management, the degree of PHP knowledge required for WordPress theming, using pre-processors in distributed versus custom themes, responsive images, and the asset-itis of many WordPress websites that utilize plugins that each load their own scripts and styles.</p>\n<p>Regardless of the specific issues people are having, I find tremendous value listening to ShopTalk &#8212; which is not as hardcore of a WordPress audience as I have here &#8212; where the trends of people&#8217;s struggles help reveal real struggles that perhaps we could build better tools for in WordPress.</p>\n<p>It&#8217;s also worth noting that some of the &#8220;struggles&#8221; we talked about are very modern struggles, and WordPress has been around for over eleven years. WordPress iterates pretty quickly and does a great job of supporting modern web features, but it&#8217;s rarely immediate, especially in terms of core support. But plugin support and the shear number of people innovating on top of WordPress is significant and awesome.</p>\n<h3>Just build websites!</h3>\n<blockquote><p>So many people want to be told what to do and what to learn next. That&#8217;s for sure the #1 question on ShopTalk.</p></blockquote>\n<p>In the face of lots of new and changing technology, Chris is often asked about what to do first, or what to do next. He and Dave have a core <a href="http://shoptalkshow.com/mantra/">mantra at ShopTalk</a> to encourage people to &#8220;just build websites!&#8221;</p>\n<blockquote><p>The things that you learn will happen as a result of building those websites and things for other people.</p></blockquote>\n<p>The degree of paralysis by analysis they see is significant, and Chris and Dave hope that people will let their experiences guide them versus a to-do list of things they must learn today.</p>\n<h4>You&#8217;re desirable</h4>\n<p>Another note is that pretty much everyone has something they can do to provide value to others. People surely know something from a tooling perspective that&#8217;s worthwhile; even sans-modern tools, basic knowledge of HTML and CSS &#8212; the building blocks of the web &#8212; could be a great asset to lots of business.</p>\n<p>Even more important than tooling though, is the ability to solve problems. Chris used an example of a business that sells wrenches. If you can help a business that sells wrenches to sell more wrenches, then you are able to provide that business a lot of value; so focus on helping businesses do what they do better.</p>\n<h4>Learn by sharing</h4>\n<p>I admire Chris&#8217; degree of sharing what he&#8217;s learning, through ShopTalk, CodePen Radio, and for years on CSS-Tricks.</p>\n<p>He doesn&#8217;t do anything special to write about what he learns. He keeps his drafts right there in WordPress. He doesn&#8217;t take special notes. He just writes, and he often writes about what he&#8217;s learning.</p>\n<p>Over time he&#8217;s been able to refine his writing and learn what to expect, as far as feedback goes. But at the core he just writes, and through that writing he&#8217;s been able to grow his own audience and get better at everything else he&#8217;s doing professionally.</p>\n<h3>Staying consistent and avoiding burnout</h3>\n<p>I was curious what Chris has done to stay so consistent online and avoid burnout. It seems to me that a lot of people get temporarily motivated and quickly disenchanted.</p>\n<p>I&#8217;ve learned in my own experience with the web that any measure of success takes lots and lots of consistent effort. Chris hasn&#8217;t done a lot to think about avoiding burnout, but figures there are some things he subconsciously does to stay motivated.</p>\n<p>That may be taking extended breaks from the web and disconnecting for a trip to the woods, or shorter breaks just in the day like stopping and playing the banjo for a few minutes.</p>\n<h3>Stay in touch with Chris</h3>\n<p>At the end of every episode of ShopTalk, Chris and Dave give guests an opportunity to plug whatever they want.</p>\n<p>Chris&#8217; plug for our interview was to advise folks to take some time off from building their own product and instead go into their issues list and clean up after themselves and their project &#8212; which is what Chris and team are doing at CodePen right now.</p>\n<p>He also noted that nothing would make him happier than folks going <a href="http://codepen.io/pro">Pro on CodePen</a>. If you teach, interact with others, or want a way to store private pens, you should definitely check it out. And it&#8217;s affordable too, at only $75 for the year.</p>\n<p>While he didn&#8217;t take the opportunity to plug much of his own stuff, you should definitely still check out his various projects. I&#8217;ve learned a ton from Chris since I started my own journey on the web. If my learning journey on the web were a university, I&#8217;ve definitely taken multiple classes from CSS-Tricks and the ShopTalk Show. Chris&#8217; business is built on a three-legged stool right now. Check them out:</p>\n<ul>\n<li><a href="http://codepen.io">CodePen</a> &#8211; a playground for the front-end side of the web.</li>\n<li><a href="http://shoptalkshow.com/">ShopTalk Show</a> &#8211; a podcast about front-end web design (and sound effects).</li>\n<li><a href="http://css-tricks.com/">CSS-Tricks</a> &#8211; where the whole internet learns CSS.</li>\n</ul>\n<p>Also check out <a href="http://chriscoyier.net/about/">Chris&#8217; fun about page</a> with his life&#8217;s timeline and <a href="https://twitter.com/chriscoyier">follow him on Twitter</a>.</p>\n<hr />\n<p>I&#8217;d like to thank Chris for the time he spent with me, and I hope that if you enjoyed this interview and write-up, that you&#8217;ll share it!</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 14 Jul 2014 15:43:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Brian Krogsgard";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Matt: Ibrahim Maalouf Wowed Me";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=43926";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:37:"http://ma.tt/2014/07/ibrahim-maalouf/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2219:"<p>One of the most surprising performances I saw at the North Sea Jazz festival was a French-Lebanese trumpet player named Ibrahim Maalouf. He plays a trumpet with a special additional fourth valve &#8212; three is standard &#8212; that allows him to more easily play <a href="http://en.wikipedia.org/wiki/Arabic_maqam">Arabic maqams</a> or scales with quarter tone and three quarter tone intervals along with <a href="http://en.wikipedia.org/wiki/Equal_temperament">equal temperament western ones</a>, like <a href="http://en.wikipedia.org/wiki/Don_Ellis">Don Ellis</a>. He also has a way of playing that sounds most like singing in his inflections and vibrato.</p>\n<p>This is the best video I could find of one song he did called &#8220;Beirut,&#8221; and I&#8217;m amazed it only has 475 views. It&#8217;s worth 12 minutes out of your day, especially when it amps up at the end.</p>\n<p><span class="embed-youtube"></span></p>\n<p class="p1"><span class="s1">The only word for the crowd was &#8220;pandemonium&#8221; &#8212; I’ve never seen a jazz audience react to music like that; it reminded me of the</span> <a href="http://en.wikipedia.org/wiki/Ellington_at_Newport#The_Gonsalves_solo">famous Duke Ellington / Paul Gonsalves performance and the riot that followed</a>.</p>\n<p>The audience on Saturday went totally bonkers, and the band did some even wilder songs to close including with jazz bagpipe (gaita?), which reminded me of <a href="http://www.cristinapato.com/en/">Cristina Pato</a>. Here&#8217;s a video of a similar end, but it&#8217;s a much more subdued crowd:</p>\n<p><span class="embed-youtube"></span></p>\n<p>Amazing music, and also a good reminder of the power of a live performance, where a great artist can feed off the audience and vice versa. I wouldn&#8217;t mind going to a few more jazz shows where people are unafraid to hoot and holler and move a bit.</p>\n<p>If you ever have a chance to see <a href="http://www.ibrahimmaalouf.com/en/">Ibrahim Maalouf</a> live, I  recommend it. It looks like he uses WordPress for his site, too, which makes him doubly cool. <img src="http://i1.wp.com/s.ma.tt/blog/wp-includes/images/smilies/icon_smile.gif?w=604" alt=":)" class="wp-smiley" /></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 14 Jul 2014 14:56:09 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:91:"WPTavern: FooGallery – A Free WordPress Gallery Plugin Built For Developers and Designers";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=26279";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:218:"http://wptavern.com/foogallery-a-free-wordpress-gallery-plugin-built-for-developers-and-designers?utm_source=rss&utm_medium=rss&utm_campaign=foogallery-a-free-wordpress-gallery-plugin-built-for-developers-and-designers";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3054:"<p><a title="http://wordpress.org/plugins/foogallery/" href="http://wordpress.org/plugins/foogallery/">FooGallery</a> is a new free WordPress plugin aimed squarely at developers and designers. <a title="http://fooplugins.com/wordpress-gallery-plugin/" href="http://fooplugins.com/wordpress-gallery-plugin/">Developed by FooPlugins</a>, FooGallery utilizes much of the same image and gallery handling found within WordPress, providing an intuitive content creation and management experience. While the plugin is simple, it offers developers a <a title="http://docs.fooplugins.com/foogallery/actions-filters/" href="http://docs.fooplugins.com/foogallery/actions-filters/">ton of filters and hooks</a> to extend its functionality. Some of the core features include:</p>\n<ul>\n<li>Gallery custom post type</li>\n<li>Use built-in media library to manage images</li>\n<li>Drag-and-drop reordering of images</li>\n<li>Built-in gallery templates</li>\n<li>Built-in support for FooBox</li>\n<li>NextGen importer tool</li>\n</ul>\n<p>FooGallery runs on an extension framework where different functionality is separated into different areas of the codebase. This keeps the core plugin lightweight, but still allows for the most flexibility. A built-in extension boilerplate generator makes it easy to create template or lightbox extensions. Although extensions can be hosted on the WordPress plugin directory, you&#8217;ll want to <a title="http://foo.gallery/submit-extension/" href="http://foo.gallery/submit-extension/">submit them</a> to them to the FooGallery website as well. Extensions that are accepted into the FooGallery directory will be listed in the Extensions tab within the plugin. Extensions can either be free or commercial.</p>\n<div id="attachment_26283" class="wp-caption aligncenter"><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2014/07/FooGalleryExtensionBoilerplate.png" rel="prettyphoto[26279]"><img class="size-full wp-image-26283" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2014/07/FooGalleryExtensionBoilerplate.png?resize=1025%2C756" alt="FooGallery Boilerplate Generator" /></a><p class="wp-caption-text">FooGallery Boilerplate Generator</p></div>\n<p><a title="http://docs.fooplugins.com/foogallery/foogallery-101/" href="http://docs.fooplugins.com/foogallery/foogallery-101/">Documentation for users</a> and <a title="http://docs.fooplugins.com/foogallery/foogallery-developers-101/" href="http://docs.fooplugins.com/foogallery/foogallery-developers-101/">developers</a> is available for free on the FooPlugins website. Since it&#8217;s a free plugin, support is handled via <a title="http://wordpress.org/support/plugin/foogallery" href="http://wordpress.org/support/plugin/foogallery">the WordPress.org support forums.</a> For those who want to contribute back to the project, you can find it <a title="https://github.com/fooplugins/foogallery" href="https://github.com/fooplugins/foogallery">on Github</a>.</p>\n<p>If you need something lightweight compared to NextGen 2, you may want to consider using FooGallery.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 14 Jul 2014 14:47:19 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"Matt: Founding Fathers";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=43934";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:38:"http://ma.tt/2014/07/founding-fathers/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:502:"<p>Kottke: <a href="http://kottke.org/13/08/the-surprising-ages-of-the-founding-fathers-on-july-4-1776">The surprising ages of the Founding Fathers on July 4, 1776</a>. While we&#8217;re talking about the Founding Fathers, Marc Andreessen thinks that the <a href="http://pmarcasays.golaun.ch/2014/07/14/founding-fathers-arguably-designed-us-system-specifically-to-be-dominated-by-moneyed-interests/">Founding Fathers Arguably Designed US System Specifically To Be Dominated By Moneyed Interests</a></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 14 Jul 2014 13:18:02 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"Akismet: Congratulations, Germany!";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:31:"http://blog.akismet.com/?p=1618";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"http://blog.akismet.com/2014/07/14/congratulations-germany/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:789:"<p>The Akismet team would like to send a hearty congratulations to the Germany national football team for their victory over Argentina yesterday in the 2014 FIFA World Cup. Our own Akisbot was busy celebrating and showing his support last night.</p>\n<p><img class="alignnone size-full wp-image-1621" src="http://akismet.files.wordpress.com/2014/07/akisbot-germany.jpg?w=700&h=525" alt="akisbot-germany" width="700" height="525" /></p><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/akismet.wordpress.com/1618/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/akismet.wordpress.com/1618/" /></a> <img alt="" border="0" src="http://pixel.wp.com/b.gif?host=blog.akismet.com&blog=116920&post=1618&subd=akismet&ref=&feed=1" width="1" height="1" />";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 14 Jul 2014 11:55:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"Dan Hauk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:78:"Post Status: Week in review: Beta 1, WooThemes is seeing double, and much more";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:30:"http://www.poststat.us/?p=6863";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:130:"http://www.poststat.us/week-in-review-wordpress-beta-1/?utm_source=rss&utm_medium=rss&utm_campaign=week-in-review-wordpress-beta-1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:6295:"<p><img class="aligncenter size-large wp-image-6769" src="http://www.poststat.us/wp-content/uploads/2014/06/week-in-review1-752x300.jpg" alt="week-in-review" width="752" height="300" />Welcome to the third “<a href="http://www.poststat.us/category/week-in-review/">Week in Review</a>” on Post Status, where I hope to offer up some of the things you may have missed in the last week or so. It&#8217;s been a busy week, and there&#8217;s a lot to share, so let&#8217;s do it.</p>\n<h3>WordPress 4.0 beta 1 is out</h3>\n<p><a title="WordPress 4.0 Beta 1" href="http://wordpress.org/news/2014/07/wordpress-4-0-beta-1/">Beta 1 of WordPress 4.0</a> is out. This means that the feature list is frozen, and testing is underway. If you haven&#8217;t tested WordPress 4.0, now is a great time to be involved.</p>\n<p>WordPress 4.0 is going to be an excellent release. There are a number of nice new features slated, including language selection upon install (a huge feature), an <a href="http://make.wordpress.org/core/2014/07/08/customizer-improvements-in-4-0/">improved customizer experience</a>, new media views, a new plugins experience in the admin, and an awesome scroll effect in the editor that makes writing so much better.</p>\n<p>I just have to tease the scrolling:</p>\n<div class="wp-video"><!--[if lt IE 9]><script>document.createElement(''video'');</script><![endif]-->\n<a href="https://i.cloudup.com/2ndNE9tCzE.mp4">https://i.cloudup.com/2ndNE9tCzE.mp4</a></div>\n<p>Thanks to <a href="https://twitter.com/kovshenin/status/487176276055056384">Konstantin Kovshenin</a> for the video.</p>\n<p>You can check out more about <a title="WordPress 4.0 Beta 1" href="http://wordpress.org/news/2014/07/wordpress-4-0-beta-1/">Beta 1 on the WordPress release post</a>, and do give it a spin with your themes and plugins to help test for bugs.</p>\n<h3>WooThemes has doubled revenues in the last year</h3>\n<p>WooThemes celebrated their sixth birthday last week. But I think they <a title="Six Years of Woo" href="http://www.woothemes.com/2014/07/six-years/">buried the lede in the post</a>. Included in the celebratory post was the note that they&#8217;ve gone from 30 to 40 employees, doubled their revenues, and tripled their profit rates in the last year.</p>\n<p>That&#8217;s some serious growth, and I&#8217;m sure mostly on the back of WooCommerce. As readers know (I love linking this post), WooCommerce is <a title="Interview with Mark Forrester, co-founder of WooThemes" href="http://www.poststat.us/interview-mark-forrester-co-founder-woothemes/">now over 80% of their revenue</a>, and probably more now.</p>\n<h3>Bye bye, bacon</h3>\n<p>Sadly, <a href="http://wpbacon.com/">WP Bacon</a> is done for. The podcast was a fun one, and the blog was pretty good too, but Rob and Ozzy are moving on. The domain got hammered a while back, and the effort to recover the site&#8217;s value just wasn&#8217;t worth the effort, so the Bacon is gone.</p>\n<p>No fear though, the folks behind it aren&#8217;t going anywhere. You can follow <a href="http://twitter.com/rob_neu">Rob</a> and <a href="http://twitter.com/ozzyr">Ozzy</a> on Twitter to catch them in their new antics.</p>\n<h3>The history of WordPress, abridged edition</h3>\n<p>Kinsta is a WordPress hosting company, and they spent some serious time putting together a <a href="https://kinsta.com/learn/wordpress-history/">pretty in-depth post</a> about the history of WordPress.</p>\n<p>This is a good read, but it&#8217;s honestly (even with a post this size) really hard to capture the complete scope of WordPress and its history. There&#8217;s a good book on the way that will really tell the story, but for now, Kinsta&#8217;s post is quite the achievement, and you should definitely <a href="https://kinsta.com/learn/wordpress-history/">check it out</a>.</p>\n<h3>iThemes Sync has an app for that</h3>\n<p><span id="more-6863"></span></p>\n<p>As <a href="http://chrislema.com/update-multiple-wordpress-sites/">Chris Lema highlights</a> with a video review, iThemes <a href="http://ithemes.com/2014/07/10/new-ithemes-sync-iphone-app/">has released an iOS app</a> for their Sync website management service.</p>\n<p>Sync is looking really great, and might be worth checking out if you&#8217;re looking for new options in this changing space.</p>\n<h3>The building blocks of responsive web design</h3>\n<p>The Theme Foundry (a Post Status sponsor, for what it&#8217;s worth) did a nice <a title="RWD" href="https://thethemefoundry.com/blog/responsive-website-design/">write-up on the building blocks of responsive design</a>.</p>\n<p>I especially liked this post because Drew focused on some things we forget some times, like scaling calls to action, line height, and font weights. There are also other good resources linked within.</p>\n<h3>Design (more than just pixels) for your audience</h3>\n<p>I read a lot of stuff that&#8217;s not strictly WordPress related. On Medium, Quartz strategist Mia Mabanta <a href="https://medium.com/@mia/getting-real-survey-answers-out-of-smart-busy-people-778f5a98e4c6">gives an in-depth look</a> at how the financial news website got excellent conversion numbers getting executive-level folks to fill out a survey.</p>\n<p>The degree of strategic thinking and testing goes to show how well something can do if we put some real effort into it. This is a great case study that any consultant or product maker could learn from.</p>\n<p>Another good read that&#8217;s not strictly WordPress is Brad Miller&#8217;s post on the <a href="http://liftux.com/posts/connection-customer-service-user-experience-design/">connection between customer service and user experience design</a>.</p>\n<hr />\n<p>&nbsp;</p>\n<p>That&#8217;s it for the last week. Of course, these are all posts other folks have created. We also had a great week here at Post Status, including some guest posts from <a title="Automating i18n in WordPress themes" href="http://www.poststat.us/automating-i18n-wordpress-themes/">Brady Vercher</a> and <a title="Tips for local WordPress development with Varying Vagrant Vagrants (VVV)" href="http://www.poststat.us/vvv-tips-every-day/">Jason Resnick</a> I hope you&#8217;ll check out.</p>\n<p>The days ahead are also shaping up nicely for Post Status. I hope you are all refreshed and ready as I am for a new week.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 14 Jul 2014 00:28:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Brian Krogsgard";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:59:"WordPress.tv: Dan Beil: How NOT to Develop (With WordPress)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=36416";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:74:"http://wordpress.tv/2014/07/13/dan-beil-how-not-to-develop-with-wordpress/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:664:"<div id="v-mwFhKpDW-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/36416/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/36416/" /></a> <img alt="" border="0" src="http://pixel.wp.com/b.gif?host=wordpress.tv&blog=5089392&post=36416&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2014/07/13/dan-beil-how-not-to-develop-with-wordpress/"><img alt="Dan Beil: How NOT to Develop (With WordPress)" src="http://videos.videopress.com/mwFhKpDW/video-09ce81fb50_scruberthumbnail_0.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 13 Jul 2014 15:55:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:63:"WordPress.tv: Andrei Chira: Cum mi-a schimbat WordPress viața";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=36533";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:84:"http://wordpress.tv/2014/07/13/andrei-chira-cum-mi-a-schimbat-wordpress-viat%cc%a6a/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:672:"<div id="v-aSN3u5nN-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/36533/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/36533/" /></a> <img alt="" border="0" src="http://pixel.wp.com/b.gif?host=wordpress.tv&blog=5089392&post=36533&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2014/07/13/andrei-chira-cum-mi-a-schimbat-wordpress-viat%cc%a6a/"><img alt="Andrei Chira: Cum mi-a schimbat WordPress viața" src="http://videos.videopress.com/aSN3u5nN/video-cfa4d6f800_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 13 Jul 2014 15:28:24 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:15;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:45:"WordPress.tv: Ivan Potančok: Less, Bootstrap";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=36481";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wordpress.tv/2014/07/13/ivan-potancok-less-bootstrap/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:630:"<div id="v-NjK2dLXJ-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/36481/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/36481/" /></a> <img alt="" border="0" src="http://pixel.wp.com/b.gif?host=wordpress.tv&blog=5089392&post=36481&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2014/07/13/ivan-potancok-less-bootstrap/"><img alt="Ivan Potančok: Less, Bootstrap" src="http://videos.videopress.com/NjK2dLXJ/video-be1dc90ddf_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 13 Jul 2014 15:15:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:16;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:48:"WordPress.tv: Martin Viceník: Video a WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=36310";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wordpress.tv/2014/07/12/martin-vicenik-video-a-wordpress/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:643:"<div id="v-Hxbb4DLf-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/36310/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/36310/" /></a> <img alt="" border="0" src="http://pixel.wp.com/b.gif?host=wordpress.tv&blog=5089392&post=36310&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2014/07/12/martin-vicenik-video-a-wordpress/"><img alt="Martin Viceník: Video a WordPress" src="http://videos.videopress.com/Hxbb4DLf/video-4c0e0f61b6_scruberthumbnail_0.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 12 Jul 2014 15:58:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:17;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:81:"WordPress.tv: Yoav Farhi: Language Packs and the Future of WordPress Translations";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=36412";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:98:"http://wordpress.tv/2014/07/12/yoav-farhi-language-packs-and-the-future-of-wordpress-translations/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:704:"<div id="v-mUPafAmJ-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/36412/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/36412/" /></a> <img alt="" border="0" src="http://pixel.wp.com/b.gif?host=wordpress.tv&blog=5089392&post=36412&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2014/07/12/yoav-farhi-language-packs-and-the-future-of-wordpress-translations/"><img alt="Yoav Farhi: Language Packs and the Future of WordPress Translations" src="http://videos.videopress.com/mUPafAmJ/video-2813feab06_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 12 Jul 2014 15:58:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:18;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:75:"WordPress.tv: Almog Baku: Optimizing and Improving Performance in WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=19153";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:92:"http://wordpress.tv/2014/07/12/almog-baku-optimizing-and-improving-performance-in-wordpress/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:698:"<div id="v-Jl4CDEqK-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/19153/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/19153/" /></a> <img alt="" border="0" src="http://pixel.wp.com/b.gif?host=wordpress.tv&blog=5089392&post=19153&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2014/07/12/almog-baku-optimizing-and-improving-performance-in-wordpress/"><img alt="Almog Baku: Optimizing and Improving Performance in WordPress" src="http://videos.videopress.com/Jl4CDEqK/video-813f1ede0d_scruberthumbnail_1.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 12 Jul 2014 15:42:02 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:19;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:90:"WPTavern: A Proposed Enhancement That Saves A Mouse Click When Upgrading WordPress Plugins";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=26203";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:224:"http://wptavern.com/a-proposed-enhancement-that-saves-a-mouse-click-when-upgrading-wordpress-plugins?utm_source=rss&utm_medium=rss&utm_campaign=a-proposed-enhancement-that-saves-a-mouse-click-when-upgrading-wordpress-plugins";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1940:"<p>Four months ago, WordPress user <a title="https://profiles.wordpress.org/Fredelig" href="https://profiles.wordpress.org/Fredelig">Fredelig</a> <a title="https://core.trac.wordpress.org/ticket/27303" href="https://core.trac.wordpress.org/ticket/27303">created a new ticket</a> on WordPress trac suggesting the plugin update notification bubble load the page listing all of the plugins with pending upgrades.</p>\n<p>In WordPress 3.9, clicking the notification loads Plugins.php which lists all of the activated plugins, including the ones with upgrades. This requires a second mouse click to show only the plugins that have an update available. Although it was too late to include in WordPress 3.9, it&#8217;s also missed the boat for 4.0.</p>\n<div id="attachment_26260" class="wp-caption aligncenter"><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/MoreUsefulPluginUpgradeBubble.png" rel="prettyphoto[26203]"><img class="size-full wp-image-26260" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/MoreUsefulPluginUpgradeBubble.png?resize=621%2C131" alt="Better Plugin Upgrade Notification Bubbles" /></a><p class="wp-caption-text">Better Plugin Upgrade Notification Bubbles</p></div>\n<p>On a related note, I&#8217;d like to propose an enhancement to the comment notification bubble. Clicking on the notification currently loads edit-comments.php which displays both approved and moderated comments. Ninety-nine percent of the time when I click on the notification link, it&#8217;s because I want to approve a comment pending moderation.</p>\n<p>Although the task can be accomplished with the way it works now, sometimes the comment I need to approve is not on the first page and I have to click the Pending comments link. Having the notifications bubble load the pending comments first would save me a mouse click.</p>\n<p><strong>Do you have any pros or cons regarding the suggested enhancements?</strong></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 12 Jul 2014 06:37:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:20;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:59:"WPTavern: WPWeekly Episode 154 – All About The Customizer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:44:"http://wptavern.com?p=26192&preview_id=26192";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:154:"http://wptavern.com/wpweekly-episode-154-all-about-the-customizer?utm_source=rss&utm_medium=rss&utm_campaign=wpweekly-episode-154-all-about-the-customizer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2656:"<p>On this episode of WordPress Weekly, we give you the low down on all the new features in WordPress 4.0 beta 1. Later in the show, <a href="http://wp.mattwie.be/" title="http://wp.mattwie.be/">Matt Wiebe</a> who works for Automattic as a design engineer, joins us to discuss his thoughts on the WordPress customizer. Most of what we talked about stems from his <a href="http://wp.mattwie.be/2014/06/27/evolving-the-customizer/" title="http://wp.mattwie.be/2014/06/27/evolving-the-customizer/">recent blog post</a> highlighting some of the roadblocks the customizer has in its current state. Near the end of the show, we have a candid conversation on how the feature may evolve in the next 2-3 years. After the interview, I&#8217;m more optimistic of what the future holds for the customizer.</p>\n<h2>Stories Discussed:</h2>\n<p><a href="http://wptavern.com/preview-wordpress-4-0-features-beta-1-now-available-for-testing" title="http://wptavern.com/preview-wordpress-4-0-features-beta-1-now-available-for-testing">Preview WordPress 4.0 Features, Beta 1 Now Available for Testing</a><br />\n<a href="http://wptavern.com/wordpress-tv-adds-its-first-german-presentation-konstantin-obenland-on-underscores" title="http://wptavern.com/wordpress-tv-adds-its-first-german-presentation-konstantin-obenland-on-underscores">WordPress.tv Adds Its First German Presentation: Konstantin Obenland on Underscores</a><br />\n<a href="http://wptavern.com/wordpress-feature-plugin-planned-to-improve-image-editing-experience" title="http://wptavern.com/wordpress-feature-plugin-planned-to-improve-image-editing-experience">WordPress Feature Plugin Planned to Improve Image Editing Experience</a><br />\n<a href="http://wptavern.com/wpbeginner-turns-5-celebrates-with-campaign-to-build-two-new-schools-in-guatemala" title="http://wptavern.com/wpbeginner-turns-5-celebrates-with-campaign-to-build-two-new-schools-in-guatemala">WPBeginner Turns 5, Celebrates With Campaign To Build Two New Schools In Guatemala</a></p>\n<h2>WPWeekly Meta:</h2>\n<p><strong>Next Episode:</strong> Friday, July 18th 3 P.M. Eastern</p>\n<p><strong>Subscribe To WPWeekly Via Itunes: </strong><a href="https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738" target="_blank">Click here to subscribe</a></p>\n<p><strong>Subscribe To WPWeekly Via RSS: </strong><a href="http://www.wptavern.com/feed/podcast" target="_blank">Click here to subscribe</a></p>\n<p><strong>Subscribe To WPWeekly Via Stitcher Radio: </strong><a href="http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr" target="_blank">Click here to subscribe</a></p>\n<p><strong>Listen To Episode #154:</strong><br />\n</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 12 Jul 2014 02:34:56 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:21;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:88:"WPTavern: Gust Plugin Adds Support for Categories, Featured Images and Custom Post Types";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=26217";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:218:"http://wptavern.com/gust-plugin-adds-support-for-categories-featured-images-and-custom-post-types?utm_source=rss&utm_medium=rss&utm_campaign=gust-plugin-adds-support-for-categories-featured-images-and-custom-post-types";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3760:"<p>The <a href="http://wordpress.org/plugins/gust/" target="_blank">Gust</a> plugin aims to provide a <a href="https://ghost.org/" target="_blank">Ghost</a>-style publishing experience within the WordPress admin. It was released at the end of last year by developer Arūnas Liuiza. He was disappointed that Ghost didn&#8217;t end up being a fork of WordPress, so he decided to package its best publishing features into a plugin. Gust adds a Ghost-style editor with a live preview pane to WordPress and includes support for Markdown.</p>\n<p>Liuiza has been gradually improving the plugin and the 0.4.0 release is a total rewrite with several new features since the last time we <a href="http://wptavern.com/gust-plugin-brings-the-ghost-admin-panel-into-wordpress" target="_blank">featured</a> it on the Tavern. It&#8217;s now PHP 5.2 compatible. In addition to media upload capabilities, Gust now supports adding and assigning a featured image.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/edit-featured-image.jpg" rel="prettyphoto[26217]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/edit-featured-image.jpg?resize=1025%2C585" alt="edit-featured-image" class="aligncenter size-full wp-image-26224" /></a></p>\n<p>The latest version includes the ability to create and add categories in addition to tags.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/category-support.jpg" rel="prettyphoto[26217]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/category-support.jpg?resize=1004%2C643" alt="category-support" class="aligncenter size-full wp-image-26218" /></a></p>\n<p>Gust 0.4.0 adds autosave support so you don&#8217;t have to worry about saving your drafts as you are composing. This release includes support for custom fields (post meta) and adds experimental support for custom post types. You can enable that feature via the plugin&#8217;s settings page.</p>\n<p>In the past, the Gust dashboard was difficult to find unless you knew how to navigate there. The latest release improves the discoverability of the Gust dashboard by adding tighter integration with the WordPress admin bar and post edit links.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/gust-dashboard.jpg" rel="prettyphoto[26217]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/gust-dashboard.jpg?resize=640%2C168" alt="gust-dashboard" class="aligncenter size-full wp-image-26219" /></a></p>\n<p>You can easily edit any of your content in the Gust dashboard by clicking on the new link in the hover menu below posts/pages/CPTs.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/edit-posts.jpg" rel="prettyphoto[26217]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/edit-posts.jpg?resize=833%2C276" alt="edit-posts" class="aligncenter size-full wp-image-26221" /></a></p>\n<p>Gust is by no means a perfect of full-featured editing experience, but it is a solid option for adding Markdown support with a live preview. Not every user likes the same flavor of WordPress and Gust adds an interesting alternative to the current publishing experience. In the future, we may see many more variations of the WordPress editor as the platform adds better support for interfacing with external apps.</p>\n<p>If you like where the plugin is headed and want to help contribute, you can find Gust on <a href="https://github.com/ideag/gust" target="_blank">GitHub</a>. So far, it has received excellent ratings on WordPress.org and Liuiza has been adding regular improvements. You can download <a href="http://wordpress.org/plugins/gust/" target="_blank">Gust</a> for free via the plugin installer in the WordPress admin.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 12 Jul 2014 00:09:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:22;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:72:"WPTavern: THBusiness: A Free WordPress Business Theme Based on Bootstrap";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=26181";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:186:"http://wptavern.com/thbusiness-a-free-wordpress-business-theme-based-on-bootstrap?utm_source=rss&utm_medium=rss&utm_campaign=thbusiness-a-free-wordpress-business-theme-based-on-bootstrap";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3206:"<p>If you&#8217;re looking for a clean, customizable business theme for WordPress, <a href="http://wordpress.org/themes/thbusiness" target="_blank">THBusiness</a> just landed in the official Themes Directory. While most free themes are dedicated to blogging, THBusiness is focused on providing all of the basic elements you need to display featured content, services, testimonials, and more.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/THbusiness.png" rel="prettyphoto[26181]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/THbusiness.png?resize=880%2C660" alt="THbusiness" class="aligncenter size-full wp-image-26186" /></a></p>\n<p>It was designed by the folks at <a href="http://www.themezhut.com/" target="_blank">THEMEZHUT</a> to have a big visual impact on the homepage. The theme is based on <a href="http://getbootstrap.com/" target="_blank">Bootstrap</a> and includes a full width Flexslider, which can be easily configured in the options panel.</p>\n<p>Most of the layout is managed by widgets. THBusiness includes a total of eight different widget areas, with four of them located on the homepage.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/widgets.jpg" rel="prettyphoto[26181]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/widgets.jpg?resize=944%2C256" alt="widgets" class="aligncenter size-full wp-image-26183" /></a></p>\n<p>It also includes six business-specific widgets that make it easy to set up featured images, services, testimonials, a call to action, and recent work. THBusiness has support for <a href="http://fortawesome.github.io/Font-Awesome/" target="_blank">Font Awesome</a> icons and adding them to the widgets doesn&#8217;t require adding any extra markup.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/recent-work-testimonials.jpg" rel="prettyphoto[26181]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/recent-work-testimonials.jpg?resize=805%2C784" alt="recent-work-testimonials" class="aligncenter size-full wp-image-26198" /></a></p>\n<p>The options panel lets you easily add a custom logo, favicon, and footer description. Check out a <a href="http://www.themezhut.com/demo/thbusiness/" target="_blank">live demo of THBusiness</a> to see it in action.</p>\n<p>Using THBusiness means that you can take advantage of any of the Bootstrap components such as labels, alerts, thumbnails, buttons, badges and more. While not everyone is a fan of reusable UI components, they can help to keep a website&#8217;s look consistent. If you&#8217;re not a designer, working with a frontend framework like <a href="http://getbootstrap.com/" target="_blank">Bootstrap</a> makes it easy to mix in different UI elements without having to reinvent the wheel.</p>\n<p><a href="http://wordpress.org/themes/thbusiness" target="_blank">THBusiness</a> is a clean business theme that doesn&#8217;t pack in a lot of complicated options. It&#8217;s easy to setup by dropping widgets into the homepage widget areas and you can have your site looking like the demo in a matter of minutes. Download it for free through your WordPress admin theme browser.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 11 Jul 2014 18:13:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:23;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:85:"Post Status: Tips for local WordPress development with Varying Vagrant Vagrants (VVV)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:30:"http://www.poststat.us/?p=6848";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:104:"http://www.poststat.us/vvv-tips-every-day/?utm_source=rss&utm_medium=rss&utm_campaign=vvv-tips-every-day";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:6721:"<p><img class="aligncenter size-large wp-image-6861" src="http://www.poststat.us/wp-content/uploads/2014/07/vvv-tips-752x300.jpg" alt="vvv-tips" width="752" height="300" />I’ve used local development environments for as long as I can remember.  They’ve always been a fluid part of being a developer.  The biggest pain point was keeping everything upgraded at all times and switching from one stack to another.</p>\n<p>In case you didn’t notice, I said ”was”.  This is because in the Spring of 2013 I found Varying Vagrant Vagrants, or <a href="https://github.com/Varying-Vagrant-Vagrants/VVV">VVV</a>.  With VVV you can have your local WordPress development environment virtually silo’d in it’s own container.</p>\n<p>There are many tutorials out there explaining the <a href="http://chriswiegman.com/2013/08/virtual-machines-the-holy-grail-of-local-web-development/">what and why you should use a virtualized development environment</a>, <a href="https://docs.vagrantup.com/v2/getting-started/">how to setup Vagrant</a>, and <a href="http://wptavern.com/wordpress-theme-review-vvv-a-quick-vagrant-setup-for-testing-and-reviewing-themes">how to setup VVV</a> so I won’t dive deep there.</p>\n<p>My take away is just that I want to be able to have an environment that’s flexible, quick, and not so dependent upon the hardware and software installed on my computer.</p>\n<p>With that, here are my most used tips for everyday usage of VVV.  I do mention some of the initial pain points I had with VVV, but with some digging around I found solutions that I would like to share with you.</p>\n<h3>1. Creating a new site</h3>\n<p>TL;DR <code>vvv new mysite.dev -v 3.9.1</code></p>\n<p>I’m not a systems engineer by any means.  I know enough to be helpful, but not enough to build a full stack.  So when I jumped into VVV for the first time, I had an issue with trying to get my existing sites into the /www root directory.</p>\n<p>The way I work is that I have a /Sites directory, then under that is each website that I am working on.  When I installed VVV for the first time, I installed it in that /Sites folder only to realize that I probably should’ve installed it outside of that.</p>\n<p>But that was an easy fix.  <code>vagrant destroy</code> and start again where I wanted.</p>\n<p>Once I created a site or two I realized that I wanted to automate this process a bit more than the <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/wiki/Auto-site-Setup">Auto site Setup</a> that VVV has built in.  After a quick search I found <a href="https://github.com/aliso/vvv-site-wizard">VVV Site Wizard</a>.</p>\n<p>This great script allowed me to create a new site with any version of WP I wanted simply by typing <code>vvv new mysite.dev -v 3.9.1</code> where the -v grabs the version of WordPress I want and installs it.  If left off, then it’ll grab the latest.</p>\n<p>I didn’t have to mess with database or nginx files, or provision scripts either.  After typing in that simple command, I had a brand new site installed and ready to go in seconds.</p>\n<h3>2. Connecting to MySQL</h3>\n<p>At first glance, I was unsure on using MySQL as I had in the past since I didn’t like using phpMyAdmin for database work.  I like to use Sequel Pro (on OS X) to run queries and look at the data.</p>\n<p>I wasn’t sure how I was going to connect to MySQL since normally I would just put in my connection string with the host information and it would connect.  With VVV I wouldn’t be able to put in localhost and the user credentials and have it connect, since technically my sites were no longer on my localhost.</p>\n<p>The way to do it is via <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/wiki/Connecting-to-MySQL#ssh-tunnel">SSH Tunnel</a>.  In layman&#8217;s terms, that’s just relaying the information via SSH.</p>\n<p>So whether you are using Sequel Pro or some other MySQL application, look for SSH Tunnel when setting up your connection.</p>\n<p>Here&#8217;s what mine looks like:</p>\n<div id="attachment_6852" class="wp-caption aligncenter"><img class="wp-image-6852 size-full" src="http://www.poststat.us/wp-content/uploads/2014/07/sequel-pro-vvv.png" alt="sequel-pro-vvv" width="454" height="470" /><p class="wp-caption-text">Yes I know it&#8217;s bad practice to have root user, but if you have my laptop, then it doesn&#8217;t matter what the password is.</p></div>\n<h3>3. Restarting Services</h3>\n<p>This isn’t something that I do all that often, but there are times that I will need to do this often enough that I wanted to share it.</p>\n<p>Sometimes when I run <code>vagrant up</code> MySQL doesn’t start and I’ll get the WordPress “Error Establishing a Database Connection”.</p>\n<p>With two commands, this is easily fixed.  First type <code>vagrant ssh</code> and then type <code>sudo service mysql start</code>.  After a few seconds, you should be good to go.</p>\n<p>One of the great features of VVV is that unless you destroy your setup, any changes you make within the instance will persist.  So there are times when I have to setup custom nginx directives and restart the service.</p>\n<p><code>sudo service nginx restart</code> does the trick.</p>\n<h4>Clean slate</h4>\n<p>After a long day of WordPress development, it’s great to just type <code>vagrant halt</code>, watch my resources come back available, and know that my laptop is free of any development environment burden.</p>\n<p>Since 2013 when I really went neck deep into virtualizing my development environment, I can’t tell you how awesome it is to see the WordPress community embracing this as well.  This only serves us as developers more ability to push forward with the latest and greatest plugins, themes, and core as the architectures we work on mature.</p>\n<div id="single-hcard-jasonresnick" class="loop-meta vcard"><h4 class="author-bio fn n">Jason Resnick</h4><div class="author-description"><img alt="Jason Resnick" src="http://0.gravatar.com/avatar/022e1ac79e7186ee6ef38c3916388aa0?s=150&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D150&r=G" class="avatar avatar-150 photo" height="150" width="150" /><div class="user-bio author-bio">Jason Resnick is a WordPress developer, founder of <a href="http://rezzz.com">rezzz.com</a> &amp; <a href="http://www.rezzz.com/wp-field-guides">WP Field Guides</a> and is a co-host of the WordPress development podcast <a href="http://wpdevtable.com">WP Dev Table</a>. Jason is a sports nut, even if all the teams he follows seem to lose.  Follow Jason on Twitter <a href="https://twitter.com/rezzz">@rezzz</a></div><!-- .user-bio .author-bio --></div><!-- .loop-description --></div><!-- .loop-meta -->";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 11 Jul 2014 17:45:16 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jason Resnick";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:24;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:82:"WordPress.tv: Zac Gordon: Why Setting Up Themes Is a Niche in Itself, What to Know";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=36328";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:98:"http://wordpress.tv/2014/07/11/zac-gordon-why-setting-up-themes-is-a-niche-in-itself-what-to-know/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:711:"<div id="v-CWraOJk1-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/36328/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/36328/" /></a> <img alt="" border="0" src="http://pixel.wp.com/b.gif?host=wordpress.tv&blog=5089392&post=36328&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2014/07/11/zac-gordon-why-setting-up-themes-is-a-niche-in-itself-what-to-know/"><img alt="Zac Gordon: Why Setting Up Themes Is a Niche in Itself, What to Know" src="http://videos.videopress.com/CWraOJk1/video-898f08d1db_scruberthumbnail_0.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 11 Jul 2014 15:53:46 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:25;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:48:"WordPress.tv: Kelly Dwan: A Walk Around the Loop";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=36414";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:65:"http://wordpress.tv/2014/07/11/kelly-dwan-a-walk-around-the-loop/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:644:"<div id="v-Gkb8CYeW-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/36414/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/36414/" /></a> <img alt="" border="0" src="http://pixel.wp.com/b.gif?host=wordpress.tv&blog=5089392&post=36414&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2014/07/11/kelly-dwan-a-walk-around-the-loop/"><img alt="Kelly Dwan: A Walk Around the Loop" src="http://videos.videopress.com/Gkb8CYeW/video-2bc80f3c10_scruberthumbnail_2.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 11 Jul 2014 15:31:01 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:26;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:73:"WordPress.tv: Gloria Antonelli: Information Architecture Strategy Session";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=36324";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:90:"http://wordpress.tv/2014/07/11/gloria-antonelli-information-architecture-strategy-session/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:694:"<div id="v-HdYmQ5Yt-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/36324/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/36324/" /></a> <img alt="" border="0" src="http://pixel.wp.com/b.gif?host=wordpress.tv&blog=5089392&post=36324&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2014/07/11/gloria-antonelli-information-architecture-strategy-session/"><img alt="Gloria Antonelli: Information Architecture Strategy Session" src="http://videos.videopress.com/HdYmQ5Yt/video-e4ee1f9bf5_scruberthumbnail_0.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 11 Jul 2014 15:04:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:27;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:70:"WPTavern: Nantes, France to Host a WordCamp for Developers in November";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=26144";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:182:"http://wptavern.com/nantes-france-to-host-a-wordcamp-for-developers-in-november?utm_source=rss&utm_medium=rss&utm_campaign=nantes-france-to-host-a-wordcamp-for-developers-in-november";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3339:"<div id="attachment_26166" class="wp-caption aligncenter"><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/nantes.jpg" rel="prettyphoto[26144]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/nantes.jpg?resize=1025%2C681" alt="Nantes" class="size-full wp-image-26166" /></a><p class="wp-caption-text">Nantes</p></div>\n<p>France is getting its second official WordCamp. The event is called <a href="http://2014.wptech.fr/" target="_blank">WordCamp Nantes WP Tech</a> and will be held in Nantes on Saturday, November 29, 2014. Unlike your traditional WordCamp, WP Tech will be devoted entirely to developers.</p>\n<p><strong>&#8220;The idea is to share knowledge, ideas and best practices about WordPress development,&#8221;</strong> organizer Daniel Roch told the Tavern. &#8220;It&#8217;s slightly different from a basic WordCamp because there will only be one track about development.&#8221;</p>\n<p>Roch is joined by four others on the organization team and they are expecting 100-300 attendees at <a href="http://www.epitech.eu/" target="_blank">Epitech</a>, a school for computer innovation. &#8220;All of us thought that there weren&#8217;t enough technical conferences about WordPress. In fact, we spoke with many developers, and all of them were enjoying the idea of a WordCamp Developer Edition.&#8221;</p>\n<div id="attachment_26151" class="wp-caption alignright"><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/venue-nantes.jpg" rel="prettyphoto[26144]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/venue-nantes.jpg?resize=300%2C225" alt="La salle de l’Epitech Nantes" class="size-medium wp-image-26151" /></a><p class="wp-caption-text">La salle de l’Epitech Nantes</p></div>\n<p>The selected venue is located in the center of downtown Nantes, as the event was born out of <a href="http://www.wp-nantes.org/" target="_blank">WP Nantes</a>, a thriving local meetup group. The organizers are looking for passionate speakers to present on technical topics. &#8220;It doesn&#8217;t matter if you&#8217;re an expert about your topic,&#8221; Roch said. &#8220;You must be passionate! Concerning the topics, we&#8217;re looking for presentations on coding best practices, security, performance, APIs, etc.&#8221;</p>\n<p>WP Tech organizers are considering adding a contributor day, but Roch said they don&#8217;t wish to stretch themselves too thin for the first event. &#8220;It would be great for us to have a contributor day, but we are afraid to bite off more than we can chew. We think it&#8217;s better to have a smaller yet well organized event, rather than a disappointing one.&#8221; They remain undecided about adding a contributor day.</p>\n<p>The call for speakers is already open and those selected will be paid for travel and hotel. Presentations will be given in both English and French. Applications to speak will be closed Tuesday, July 15, at midnight.  <a href="http://2014.wptech.fr/appel-orateurs/" target="_blank">Contact the organizers</a> if you wish to participate. Developers, designers and project managers are all encouraged to attend WP Tech to learn more about mastering WordPress. Sign up on the event&#8217;s <a href="http://2014.nantes.wordcamp.org/" target="_blank">WordCamp site</a> (coming soon) to be notified of updates.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 10 Jul 2014 21:37:40 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:28;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:59:"WPTavern: Blue Steel: A Free WordPress Theme Based on Roots";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=26074";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:160:"http://wptavern.com/blue-steel-a-free-wordpress-theme-based-on-roots?utm_source=rss&utm_medium=rss&utm_campaign=blue-steel-a-free-wordpress-theme-based-on-roots";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3325:"<p><a href="http://roots.io/" target="_blank">Roots</a> is a WordPress starter theme that makes use of HTML5 Boilerplate, Bootstrap, and Grunt. Over the years Roots has garnered somewhat of a cult following and is still going strong with the release of <a href="http://roots.io/roots-7-0-0-updates/" target="_blank">version 7.0.0</a> last week. This release moves some of the theme&#8217;s trademark features into a plugin called <a href="http://wptavern.com/soil-roots-framework-features-that-can-be-used-with-any-wordpress-theme" target="_blank">Soil</a> and adds Bower for front-end package management.</p>\n<p>Blue Steel is a new open source theme built to run on top of Roots. It was inspired by the design of <a href="http://www.theverge.com/" target="_blank">The Verge</a> and, of course, the film <a href="https://www.youtube.com/watch?v=D519hT7-ytY" target="_blank">Zoolander</a>. <a href="https://twitter.com/dhawalhshah" target="_blank">Dhawal Shah</a> introduced his new theme on the Roots discussion boards under a <a href="http://discourse.roots.io/t/new-roots-theme-blue-steel-mit-license/1905" target="_blank">thread</a> titled: <strong>&#8220;Is there more to a blog than being really really really ridiculously good looking?&#8221;</strong></p>\n<p>Blue Steel is the answer to that question. It was originally created for use on <a href="https://www.class-central.com/" target="_blank">Class Central</a>, a website dedicated to helping people discover free online classes (MOOCs) from top universities such as Stanford, MIT, and Harvard.</p>\n<p>The theme is responsive and resizes down nicely to use mobile-friendly navigation. The <a href="https://www.class-central.com/report/" target="_blank">homepage</a> sports a flat, minimalist style with bold colors and features your latest content with room for a sidebar.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/homepage.jpg" rel="prettyphoto[26074]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/homepage.jpg?resize=764%2C626" alt="homepage" class="aligncenter size-full wp-image-26135" /></a></p>\n<p>Blue Steel <a href="https://www.class-central.com/report/udacity-kunal-chawla/" target="_blank">blog posts</a> are styled with readable typography and attractive pullquotes.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/blue-steel-blog-posts.jpg" rel="prettyphoto[26074]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/blue-steel-blog-posts.jpg?resize=1025%2C698" alt="blue-steel-blog-posts" class="aligncenter size-full wp-image-26131" /></a></p>\n<p>This is not exactly your average plug-and-play style WordPress theme. In order to use it you must be familiar with both <a href="http://roots.io/" target="_blank">Roots</a> and <a href="https://getcomposer.org/" target="_blank">Composer</a>. You will also be required to modify it to suit your own needs, but it does provide an excellent starting place for creating your own Roots-powered theme.</p>\n<p>Blue Steel is released under a GPL-compatible MIT license. Many thanks to the folks at <a href="http://codelight.eu/" target="_blank">Codelight</a> who decided to make it available on <a href="https://github.com/classcentral/blue-steel" target="_blank">GitHub</a> so anyone can fork it for an easy start.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 10 Jul 2014 20:09:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:29;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:88:"WPTavern: WordPress Mini Conference “East Meets Press” Set For September 17-21, 2014";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=26058";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:206:"http://wptavern.com/wordpress-mini-conference-east-meets-press-set-for-september-17-21-2014?utm_source=rss&utm_medium=rss&utm_campaign=wordpress-mini-conference-east-meets-press-set-for-september-17-21-2014";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2444:"<p><a title="http://eastmeetspress.com/" href="http://eastmeetspress.com/">East Meets Press</a> is a business focused WordPress event organized by Ben Fox that will be held on <strong>September 17-21</strong> (Wednesday to Sunday – 4 nights). Not to be outdone by BeachPress which was recently held on the West Coast of the US, East Meets Press will take place on the East Coast in Kure Beach, North Carolina.</p>\n<div id="attachment_26110" class="wp-caption aligncenter"><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/EastMeetsPressVenue.jpg" rel="prettyphoto[26058]"><img class="size-full wp-image-26110" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/EastMeetsPressVenue.jpg?resize=550%2C365" alt="The Venue For East Meets Press" /></a><p class="wp-caption-text">The Venue For East Meets Press</p></div>\n<p>Individual tickets are <strong>$600.</strong> The tickets are all-inclusive so they cover lodging, internet, food, and beverages. Companies that can&#8217;t attend but want to support the event can do so with the <strong>$400</strong> sponsor ticket.</p>\n<p>Without the hustle and bustle of attending sessions and having limited networking time at a WordCamp, this event gives attendees a chance to get to know each another while discussing the business of WordPress in a relaxing atmosphere. There will be set meal times with a given topic of discussion as well as one 15 minute lightning talk each day. Outside of that, attendees will be free to do whatever they want.</p>\n<p>It&#8217;s nice to see these type of events unfold within the WordPress community. They&#8217;re like miniature versions of <a title="http://wptavern.com/dates-announced-for-pressnomics-3-jan-22nd-24th-2015" href="http://wptavern.com/dates-announced-for-pressnomics-3-jan-22nd-24th-2015">PressNomics</a>. If you plan on going, let us know in the comments and be sure to <a title="http://eastmeetspress.com/?espresso_events=east-coast-press-2014" href="http://eastmeetspress.com/?espresso_events=east-coast-press-2014">register your tickets</a> as space is limited.</p>\n<p>If you attended <a title="http://zao.is/2013/10/beachpress-2-0/" href="http://zao.is/2013/10/beachpress-2-0/">BeachPress 2014</a> or <a title="http://bigsnowtinyconf.com/" href="http://bigsnowtinyconf.com/">Big Snow Tiny Conference 2014,</a> I&#8217;d love to hear about your experience in the comments, especially if it improved your business.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 10 Jul 2014 18:40:20 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:30;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:50:"Akismet: Akismet 3.0.1 for WordPress Now Available";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:31:"http://blog.akismet.com/?p=1615";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:77:"http://blog.akismet.com/2014/07/10/akismet-3-0-1-for-wordpress-now-available/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1574:"<p>Extry, extry, read all about it! Version 3.0.1 of <a href="http://wordpress.org/plugins/akismet/">the Akismet plugin for WordPress</a> is now available!</p>\n<p>Even though it&#8217;s not a big round number like our 3.0 release, we&#8217;ve worked hard to make Akismet even better in 3.0.1:</p>\n<ul>\n<li>We&#8217;ve reduced the amount of data we store in the <code>akismet_as_submitted</code> comment meta value for each comment.</li>\n<li>Akismet no longer depends on the <code>fsockopen</code> PHP function.</li>\n<li>jQuery is no longer required for Akismet&#8217;s frontend JavaScript.</li>\n<li>We fixed a bug that was causing spam reports from outside of the dashboard (the iOS app, for example) to be ignored.</li>\n<li>If an API key is suspended for any reason, comments will now all be sent to the Pending queue instead of the Spam folder.</li>\n<li>&#8230;and lots of other improvements to performance and error-handling.</li>\n</ul>\n<p>To upgrade, visit the Plugins or Updates page of your WordPress dashboard and follow the instructions. If you need to download the zip file directly, links to all versions are available in <a href="http://wordpress.org/plugins/akismet/">the WordPress plugins directory</a>.</p><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/akismet.wordpress.com/1615/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/akismet.wordpress.com/1615/" /></a> <img alt="" border="0" src="http://pixel.wp.com/b.gif?host=blog.akismet.com&blog=116920&post=1615&subd=akismet&ref=&feed=1" width="1" height="1" />";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 10 Jul 2014 17:45:56 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Christopher Finke";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:31;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Matt: 4 Years Working Remotely";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=43867";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"http://ma.tt/2014/07/4-years-working-remotely/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:245:"<p>Sara Rosso writes <a href="http://whenihavetime.com/2014/07/08/10-lessons-from-4-years-working-remotely/">10 Lessons from 4 Years Working Remotely at Automattic</a>. (Lesson 11, left out: Always give list articles an odd number of items.)</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 10 Jul 2014 16:13:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:32;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:74:"WPTavern: Preview WordPress 4.0 Features, Beta 1 Now Available for Testing";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=26019";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:190:"http://wptavern.com/preview-wordpress-4-0-features-beta-1-now-available-for-testing?utm_source=rss&utm_medium=rss&utm_campaign=preview-wordpress-4-0-features-beta-1-now-available-for-testing";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4630:"<p><a href="http://wordpress.org/news/2014/07/wordpress-4-0-beta-1/" target="_blank">WordPress 4.0 Beta 1</a> is now available for download and testing. This means that core developers are now onto the stage of bug fixes and inline documentation in preparation for the official release in <a href="http://make.wordpress.org/core/version-4-0-project-schedule/" target="_blank">August</a>.</p>\n<p>Helen Hou-Sandí, the release lead, announced the beta with an outline of user-facing features that need testing. The list offers a good summary of some of the exciting changes and improvements coming in WordPress 4.0:</p>\n<ul>\n<li>Previews of oEmbed URLs in the visual editor and via the &#8220;Insert from URL&#8221; tab in the media modal.</li>\n<li>Media library &#8220;grid view&#8221; added in addition to the &#8220;list view&#8221;</li>\n<li>Refreshed plugin <a href="https://core.trac.wordpress.org/ticket/27440" target="_blank">install</a> and <a href="https://core.trac.wordpress.org/ticket/28785" target="_blank">search</a> experience</li>\n<li>Select a language when installing WordPress</li>\n<li>Improvements to editor resizing its top and bottom bars pin when needed</li>\n<li>Improvements to keyboard and cursor interaction with <a href="https://core.trac.wordpress.org/ticket/28595" target="_blank">TinyMCE views</a></li>\n<li>Widgets in the Customizer are now loaded in a separate panel</li>\n<li>Improvements to formatting functions</li>\n</ul>\n<p>When testing the beta, you&#8217;ll find that the grid view for the media library is on by default. You have the option to toggle back to the list view, but I&#8217;m not sure why you ever would. The new grid view is truly a thing of beauty and has evolved considerably since last October when we <a href="http://wptavern.com/new-grid-view-coming-to-the-wordpress-media-library" target="_blank">featured</a> it during its initial development.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/grid-view.jpg" rel="prettyphoto[26019]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/grid-view.jpg?resize=966%2C582" alt="grid-view" class="aligncenter size-full wp-image-26087" /></a></p>\n<p>The bulk edit option allows you to quickly delete multiple images. Clicking on individual items launches a details modal where you can edit an attachment and even navigate between items directly in the modal.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/details-modal.jpg" rel="prettyphoto[26019]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/details-modal.jpg?resize=718%2C542" alt="details-modal" class="aligncenter size-full wp-image-26089" /></a></p>\n<p>There are a lot of changes packed into WordPress media in the upcoming release and any help testing would be beneficial to the core team.</p>\n<p>The plugin search and installation process is another highly visible feature with a fresh new look. Check out the new <a href="http://wptavern.com/first-look-at-the-new-plugin-details-screen-coming-to-wordpress-4-0" target="_blank">plugin details modal</a> as well as the new grid view when searching for an extension.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/search-plugins.jpg" rel="prettyphoto[26019]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/search-plugins.jpg?resize=951%2C338" alt="search-plugins" class="aligncenter size-full wp-image-26091" /></a></p>\n<p>You can help by testing the plugin modals and cards on as many screens and accessibility devices as possible in order to hunt down any bugs with the new display.</p>\n<p>As this is a major release of WordPress, developers would do well to test their sites, themes and plugins against the beta while it&#8217;s still early. Hou-Sandí encourages anyone who has found a bug to post in the <a href="http://wordpress.org/support/forum/alphabeta" target="_blank">Alpha/Beta forum</a> or <a href="https://make.wordpress.org/core/reports/" target="_blank">file a ticket on trac</a>. The <a href="http://core.trac.wordpress.org/tickets/major" target="_blank">list of known bugs</a> will show you what testers have already identified so far. Some of those bugs may have already been <a href="http://core.trac.wordpress.org/query?status=closed&group=component&milestone=4.0" target="_blank">fixed</a>. Your bug reports and patches will help to make WordPress 4.0 shiny and polished when it&#8217;s officially released in August. Download Beta 1 from the <a href="http://wordpress.org/news/2014/07/wordpress-4-0-beta-1/" target="_blank">release announcement</a> on WordPress.org.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 10 Jul 2014 16:07:09 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:33;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:76:"WordPress.tv: Troy Dean: 101 Ways to Elevate Yourself and Demand Higher Fees";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=36426";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:95:"http://wordpress.tv/2014/07/10/troy-dean-101-ways-to-elevate-yourself-and-demand-higher-fees-3/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:696:"<div id="v-fi1ObGks-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/36426/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/36426/" /></a> <img alt="" border="0" src="http://pixel.wp.com/b.gif?host=wordpress.tv&blog=5089392&post=36426&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2014/07/10/troy-dean-101-ways-to-elevate-yourself-and-demand-higher-fees-3/"><img alt="Troy Dean: 101 Ways to Elevate Yourself and Demand Higher Fees" src="http://videos.videopress.com/fi1ObGks/video-96bf3eaf39_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 10 Jul 2014 15:56:55 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:34;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:48:"WordPress.tv: Kyle Maurer: Shortcode Shenanigans";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=36330";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:65:"http://wordpress.tv/2014/07/10/kyle-maurer-shortcode-shenanigans/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:644:"<div id="v-ZgmKpbhK-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/36330/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/36330/" /></a> <img alt="" border="0" src="http://pixel.wp.com/b.gif?host=wordpress.tv&blog=5089392&post=36330&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2014/07/10/kyle-maurer-shortcode-shenanigans/"><img alt="Kyle Maurer: Shortcode Shenanigans" src="http://videos.videopress.com/ZgmKpbhK/video-60a7186e41_scruberthumbnail_1.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 10 Jul 2014 15:51:47 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:35;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:56:"WordPress.tv: Tammie Lister: The Theme Is In The Details";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=36381";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:73:"http://wordpress.tv/2014/07/10/tammie-lister-the-theme-is-in-the-details/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:660:"<div id="v-cWkmumEQ-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/36381/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/36381/" /></a> <img alt="" border="0" src="http://pixel.wp.com/b.gif?host=wordpress.tv&blog=5089392&post=36381&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2014/07/10/tammie-lister-the-theme-is-in-the-details/"><img alt="Tammie Lister: The Theme Is In The Details" src="http://videos.videopress.com/cWkmumEQ/video-32fc4193a4_scruberthumbnail_0.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 10 Jul 2014 15:27:52 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:36;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Dev Blog: WordPress 4.0 Beta 1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3248";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/news/2014/07/wordpress-4-0-beta-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4016:"<p>WordPress 4.0 Beta 1 is now available!</p>\n<p><strong>This software is still in development,</strong> so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.0, try the <a href="http://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”). Or you can <a href="https://wordpress.org/wordpress-4.0-beta1.zip">download the beta here</a> (zip).</p>\n<p>4.0 is due out next month, but to get there, we need your help testing what we&#8217;ve been working on:</p>\n<ul>\n<li><strong>Previews of <a href="http://codex.wordpress.org/Embeds">embedding via URLs</a></strong> in the visual editor and the &#8220;Insert from URL&#8221; tab in the media modal. Try pasting a URL (such as a <a href="http://wordpress.tv/">WordPress.tv</a> or YouTube video) onto its own line in the visual editor. (<a href="https://core.trac.wordpress.org/ticket/28195">#28195</a>, <a href="https://core.trac.wordpress.org/ticket/15490">#15490</a>)</li>\n<li>The <strong>Media Library</strong> now has a &#8220;grid&#8221; view in addition to the existing list view. Clicking on an item takes you into a modal where you can see a larger preview and edit information about that attachment, and you can navigate between items right from the modal without closing it. (<a href="https://core.trac.wordpress.org/ticket/24716">#24716</a>)</li>\n<li>We&#8217;re freshening up the <strong>plugin install experience</strong>. You&#8217;ll see some early visual changes as well as more information when searching for plugins and viewing details. (<a href="https://core.trac.wordpress.org/ticket/28785">#28785</a>, <a href="https://core.trac.wordpress.org/ticket/27440">#27440</a>)</li>\n<li><strong>Selecting a language</strong> when you run the installation process. (<a href="https://core.trac.wordpress.org/ticket/28577">#28577</a>)</li>\n<li>The <strong>editor</strong> intelligently resizes and its top and bottom bars pin when needed. Browsers don&#8217;t like to agree on where to put things like cursors, so if you find a bug here, please also let us know your browser and operating system. (<a href="https://core.trac.wordpress.org/ticket/28328">#28328</a>)</li>\n<li>We&#8217;ve made some improvements to how your keyboard and cursor interact with <strong>TinyMCE views</strong> such as the gallery preview. Much like the editor resizing and scrolling improvements, knowing about your setup is particularly important for bug reports here. (<a href="https://core.trac.wordpress.org/ticket/28595">#28595</a>)</li>\n<li><strong>Widgets in the Customizer</strong> are now loaded in a separate panel. (<a href="https://core.trac.wordpress.org/ticket/27406">#27406</a>)</li>\n<li>We&#8217;ve also made some changes to some <strong>formatting</strong> functions, so if you see quotes curling in the wrong direction, please file a bug report.</li>\n</ul>\n<p><strong>If you think you’ve found a bug</strong>, you can post to the <a href="http://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. We’d love to hear from you! If you’re comfortable writing a reproducible bug report, <a href="https://make.wordpress.org/core/reports/">file one on the WordPress Trac</a>. There, you can also find <a href="http://core.trac.wordpress.org/tickets/major">a list of known bugs</a> and <a href="http://core.trac.wordpress.org/query?status=closed&group=component&milestone=4.0">everything we’ve fixed</a> so far.</p>\n<p><strong>Developers:</strong> Never fear, we haven&#8217;t forgotten you. There&#8217;s plenty for you, too &#8211; more on that in upcoming posts. In the meantime, check out the <a href="http://make.wordpress.org/core/2014/07/08/customizer-improvements-in-4-0/#customizer-panels">API for panels in the Customizer</a>.</p>\n<p>Happy testing!</p>\n<p><em>Plugins, editor</em><br />\n<em>Media, things in between</em><br />\n<em>Please help look for bugs</em></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 10 Jul 2014 10:17:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Helen Hou-Sandi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:37;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:73:"WPTavern: WP Engine Becomes The First Large Partner To Integrate Sidekick";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=26052";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:190:"http://wptavern.com/wp-engine-becomes-the-first-large-partner-to-integrate-sidekick?utm_source=rss&utm_medium=rss&utm_campaign=wp-engine-becomes-the-first-large-partner-to-integrate-sidekick";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2152:"<div id="attachment_26073" class="wp-caption alignright"><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/WP-Engine-SIDEKICK-Portal.png" rel="prettyphoto[26052]"><img class="wp-image-26073 size-full" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/WP-Engine-SIDEKICK-Portal.png?resize=296%2C457" alt="WP Engine User Portal" /></a><p class="wp-caption-text">WP Engine User Portal</p></div>\n<p>WP Engine has <a title="http://wpengine.com/blog/#/2014/07/09/introducing-interactive-tutorials-within-user-portal/" href="http://wpengine.com/blog/#/2014/07/09/introducing-interactive-tutorials-within-user-portal/">revamped their user portal</a> and is the first large partner to integrate <a title="http://www.sidekick.pro/" href="http://www.sidekick.pro/">Sidekick</a> into its service. Sidekick provides WP Engine customers access to guided tours for understanding how different components of the User Portal work together. Sidekick is a product created by FlowPress to create interactive, narrated, guided walkthroughs. The new user portal has guides to learn about the WP Engine platform, managing your account, setting up your site, etc.</p>\n<p>I was granted access to a WP Engine staging server to experience the benefits these guides offer and I&#8217;m impressed. They&#8217;re a helping hand at the click of a button. The walkthroughs are clear and to the point. Unlike reading tutorials or watching videos, it was nice to be guided through the process of managing my account.</p>\n<p>The magic behind the walkthroughs is <a title="http://www.sidekick.pro/composer/" href="http://www.sidekick.pro/composer/">Sidekick Composer</a>. Although not available to the public yet, I consider it the Camtasia studio for WordPress. After watching a demo of what this plugin is capable of, I think plugin authors are going to love it. Instead of using pointers, they&#8217;ll be able to create interactive tours with narrated explanations on how to configure or use their plugin.</p>\n<p>Keep an eye on the Tavern as rumor has it, the beta period for Sidekick Composer will open soon. When it happens, we&#8217;ll let you know.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 10 Jul 2014 05:36:22 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:38;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:64:"WPTavern: Create Your Own Custom Pointers in the WordPress Admin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=26025";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:172:"http://wptavern.com/create-your-own-custom-pointers-in-the-wordpress-admin?utm_source=rss&utm_medium=rss&utm_campaign=create-your-own-custom-pointers-in-the-wordpress-admin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4358:"<p>Admin pointers were first added in <a href="http://codex.wordpress.org/Version_3.3" target="_blank">WordPress 3.3</a> for the purpose of helping users discover and navigate new features in major releases. For example, when widgets were added to the customizer, an admin pointer displayed to highlight live widget previews on the themes page.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/new-feature-admin-pointer.jpg" rel="prettyphoto[26025]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/new-feature-admin-pointer.jpg?resize=743%2C495" alt="new-feature-admin-pointer" class="aligncenter size-full wp-image-26034" /></a></p>\n<p>The friendly pointers, when used sparingly, can draw attention to important items and help new users more effectively navigate the admin. Ordinarily, creating your own pointers requires a bit of custom coding. Fortunately, the admin pointers feature is easy to extend, so plugin developers have been able to harness it for unique uses.</p>\n<p><a href="http://wordpress.org/plugins/better-admin-pointers/" target="_blank">Better Admin Pointers</a> is a plugin that makes it possible for anyone to create custom pointers and add them to any screen in the admin. The plugin saves the new pointers as a custom post type. Pointers will display until they are dismissed by the user.</p>\n<p>Here&#8217;s an example of a pointer created to identify which plugin you&#8217;re editing:</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/edit-plugin.png" rel="prettyphoto[26025]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/edit-plugin.png?resize=1025%2C681" alt="edit-plugin" class="aligncenter size-full wp-image-26045" /></a></p>\n<h3>Pointer Customization Options</h3>\n<p>Better Admin Pointers allows you to customize every aspect of your custom pointers, including:</p>\n<ul>\n<li>Main content area</li>\n<li>Pointer id &#8211; A unique id so that it can be tracked in the WP DB as dismissed</li>\n<li>Screen &#8211; What page/screen it should appear on</li>\n<li>Target &#8211; CSS id or class we want the pointer to attach to on the screen above</li>\n<li>Position Edge &#8211; Which edge should be adjacent to the target? (left, right, top, or bottom)</li>\n<li>Position Align &#8211; How should the pointer be aligned on this edge, relative to the target? (top, bottom, left, right, or middle)</li>\n</ul>\n<p>The plugin&#8217;s settings page has a checkbox option to &#8220;show current screen,&#8221; which will display the value you need for the screen ID when creating a new pointer.</p>\n<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2014/07/screen-id.jpg" rel="prettyphoto[26025]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2014/07/screen-id.jpg?resize=656%2C361" alt="screen-id" class="aligncenter size-full wp-image-26048" /></a></p>\n<p>The WordPress Plugin API also has a handy <a href="http://codex.wordpress.org/Plugin_API/Admin_Screen_Reference" target="_blank">Admin Screen Reference</a> where you can easily locate IDs for the screens.</p>\n<p><strong>A point of caution here:</strong> It&#8217;s easy to go overboard creating too many admin pointers. Some popular plugins annoy users to no end with their ever-present pointers. Don&#8217;t make this mistake if you decide to customize your own.</p>\n<p>While testing the plugin, I was able to create and customize pointers faster than I imagined. The custom post type essentially guides you through the process with an explanation of the values expected in each box. For the average user, the most difficult aspect of customizing a pointer might be setting the target. If you&#8217;re not familiar with using your browser to inspect elements, it may be frustrating to determine the right CSS class or ID to use. However, the plugin&#8217;s most typical use case is most likely to be a developer setting up pointers for a client website or for someone who is new to WordPress.</p>\n<p>I can see pointers being very useful for helping clients navigate custom features that a developer has built into the admin. <a href="http://wordpress.org/plugins/better-admin-pointers/" target="_blank">Better Admin Pointers</a> provides a quick way to write up a few friendly pointers to accompany new or confusing screens. Download it for free from WordPress.org.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 09 Jul 2014 23:03:29 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:39;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:77:"WPTavern: First Look At The New Plugin Details Screen Coming To WordPress 4.0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=26010";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:198:"http://wptavern.com/first-look-at-the-new-plugin-details-screen-coming-to-wordpress-4-0?utm_source=rss&utm_medium=rss&utm_campaign=first-look-at-the-new-plugin-details-screen-coming-to-wordpress-4-0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2472:"<p>In the past two weeks, a lot of work has been done to improve the various plugin installer modals in the backend of WordPress. A <a title="http://en.wikipedia.org/wiki/Modal_window" href="http://en.wikipedia.org/wiki/Modal_window">modal</a> is a fancy way of saying a dialog or popup box. One of the modals revamped is the <a title="https://core.trac.wordpress.org/ticket/27440" href="https://core.trac.wordpress.org/ticket/27440">plugin details view</a>. When users click on the details link when searching for plugins to install from the backend of WordPress, a dialog box appears showing detailed plugin information. Here is what the current implementation looks like.</p>\n<div id="attachment_26039" class="wp-caption aligncenter"><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/WPPluginInstallModelBefore.png" rel="prettyphoto[26010]"><img class="size-full wp-image-26039" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/WPPluginInstallModelBefore.png?resize=866%2C878" alt="Current Plugin Details Modal View" /></a><p class="wp-caption-text">Current Plugin Details Modal View</p></div>\n<p>Here&#8217;s what the new view looks like. Keep in mind that it&#8217;s a work in progress.</p>\n<div id="attachment_26043" class="wp-caption aligncenter"><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2014/07/WPPluginInstallModelAfter.png" rel="prettyphoto[26010]"><img class="size-full wp-image-26043" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2014/07/WPPluginInstallModelAfter.png?resize=837%2C852" alt="The Detailed Modal View For WordPress 4.0" /></a><p class="wp-caption-text">The Detailed Modal View For WordPress 4.0</p></div>\n<p>As you can see, the plugin&#8217;s banner image is displayed at the top. A reviews tab has been added making it easy to read the latest reviews. In addition to the average rating, you can now see how the average is determined. All contributors to the plugin are listed along with their Gravatars. When the modal view shrinks, the detailed information is displayed above the description text.</p>\n<p>I found the reviews hard to read in chronological order because it&#8217;s difficult to determine where a review begins and ends. Showing Gravatars is neat but I question their usefulness if they are the size of favicons. Overall, I like the improvements and can&#8217;t wait to see what the finished product looks like.</p>\n<p><strong>What do you think of the new look?</strong></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 09 Jul 2014 22:19:25 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:40;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:45:"Alex King: Custom Taxonomy as “Post Meta”";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://alexking.org/?p=14416";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"http://alexking.org/blog/2014/07/09/custom-taxonomy-as-post-meta";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1135:"<p><em>I found this post while sorting through my old drafts and decided to go ahead and publish it rather than trashing it. Hopefully the code samples don&#8217;t break too badly in WordPress 3.9.</em></p>\n<p>I&#8217;ve talked a bit about <a href="http://alexking.org/blog/2011/08/29/wordpress-post-meta-taxonomies">when to use custom taxonomies and when to use custom fields/post meta</a> (and how they can be used virtually interchangeably in some situations). If you want to use taxonomies, you&#8217;ll probably also want to:</p>\n<ul>\n<li>make sure that the terms you want to use exist in your custom taxonomy</li>\n<li>limit the ability for these terms to be altered</li>\n</ul>\n<p>This Gist is a good start:</p>\n<p><p>View the code on <a href="https://gist.github.com/3723819">Gist</a>.</p></p>\n<p>You&#8217;ll probably also want to specify:</p>\n<p><code>''public'' =&gt; false,<br />\n''show_ui'' =&gt; true,</code></p>\n<p>when defining your custom taxonomy. This makes the UI box for the taxonomy appear in the post/page editing interface as expected, but hides the admin forms for editing the taxonomy terms from the admin menu.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 09 Jul 2014 21:33:02 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Alex";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:41;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Matt: Pitchforks for Plutocrats";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=43859";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:47:"http://ma.tt/2014/07/pitchforks-for-plutocrats/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:322:"<p>Nick Hanauer advocates for $15 minimum wage in <a href="http://www.politico.com/magazine/story/2014/06/the-pitchforks-are-coming-for-us-plutocrats-108014.html">The Pitchforks Are Coming&#8230; For Us Plutocrats</a>. He was the first non-family investor in Amazon.com, and as he puts it, a &#8220;zillionaire.&#8221;</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 09 Jul 2014 20:54:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:42;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:90:"WPTavern: Kinsta Publishes Guide On The History Of WordPress, Its Ecosystem, and Community";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=26008";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:220:"http://wptavern.com/kinsta-publishes-guide-on-the-history-of-wordpress-its-ecosystem-and-community?utm_source=rss&utm_medium=rss&utm_campaign=kinsta-publishes-guide-on-the-history-of-wordpress-its-ecosystem-and-community";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1316:"<p>Mark Gavalda, CEO of <a title="https://kinsta.com/" href="https://kinsta.com/">Kinsta WordPress Hosting</a>, has <a title="https://kinsta.com/learn/wordpress-history/" href="https://kinsta.com/learn/wordpress-history/">published an in-depth guide</a> covering the history of WordPress, its vast ecosystem, and the community surrounding it. Gavalda does a great job explaining the impact WordPress has had on so many individuals and businesses with quotes from notable members of the community.</p>\n<p>The largest take away for me is that despite taking over an hour to read, it only scratches the surface. One of my favorite parts is a quote from Matt Mullenweg on contributing to WordPress.</p>\n<blockquote><p>Just remember, every contribution counts, no matter what it looks like. It takes every one of us to make WordPress better.</p></blockquote>\n<p>If you&#8217;d like to know more about the history of the project before it became WordPress, check out <a title="https://hakre.wordpress.com/2011/01/25/milestones-of-wordpress-early-project-timeline-ca-2000-to-2005/" href="https://hakre.wordpress.com/2011/01/25/milestones-of-wordpress-early-project-timeline-ca-2000-to-2005/">this list of milestones by Hakre</a>. His post covers the events in the 2000-2005 timeline that include the birth of WordPress.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 09 Jul 2014 20:07:48 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:43;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:93:"WPTavern: WordPress.tv Adds Its First German Presentation: Konstantin Obenland on Underscores";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=25985";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:228:"http://wptavern.com/wordpress-tv-adds-its-first-german-presentation-konstantin-obenland-on-underscores?utm_source=rss&utm_medium=rss&utm_campaign=wordpress-tv-adds-its-first-german-presentation-konstantin-obenland-on-underscores";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3139:"<p><a href="http://wordpress.tv/" target="_blank">WordPress.tv</a> added its first <a href="http://wordpress.tv/language/german/" target="_blank">German language video</a> today. Konstantin Obenland&#8217;s &#8220;<a href="http://wordpress.tv/2014/07/09/konstantin-obenland-underscores-ein-startertheme-fu%CC%88r-jeden/" target="_blank">Underscores: Ein Startertheme Für Alle</a>&#8221; presentation from WordCamp Hamburg is, surprisingly, the only German video to make it to WordPress.tv so far. Obenland is a code wrangler at Automattic and has also worked extensively with the default WordPress themes. His presentation covers the history and future of <a href="http://underscores.me/" target="_blank">Underscores</a> and its influence on theme development.</p>\n<p></p>\n<p>The <a href="http://de.slideshare.net/obenland/underscores-de" target="_blank">slides</a> for the presentation are also linked from its listing on WordPress.tv.</p>\n<p>If you&#8217;re multilingual, one of the ways you can contribute to WordPress is by <a href="http://blog.wordpress.tv/2013/10/16/caption-and-subtitle/" target="_blank">captioning and subtitling videos</a>. Each video on WordPress.tv has a unique URL labeled &#8220;Subtitle this Video,&#8221; which lets you add subtitles in one of nine available languages. For example, if you click on Obenland&#8217;s video subtitles <a href="http://wordpress.tv/subtitle/?video=36369" target="_blank">link</a>, you&#8217;ll find the guided process for using the tools at <a href="http://www.amara.org/" target="_blank">amara.org</a> to add your subtitles. This is a little-known way that you can contribute to WordPress and help the community share its knowledge across languages.</p>\n<p>WordPress.tv doesn&#8217;t appear to have an easy way to search for videos by language, as the search bar isn&#8217;t an effect way of narrowing them down. While guessing at the URLs, I found that WordPress.tv has 61 videos in <a href="http://wordpress.tv/language/japanese/" target="_blank">Japanese</a>, 56 in <a href="http://wordpress.tv/2014/06/20/tony-archambeau-accessibilite-wordpress-creer-des-sites-pour-tous-les-utilisateurs/" target="_blank">French</a>, 38 in <a href="http://wordpress.tv/language/spanish/" target="_blank">Spanish</a>, eight in <a href="http://wordpress.tv/language/russian/" target="_blank">Russian</a>, two in <a href="http://wordpress.tv/language/norwegian/" target="_blank">Norwegian</a>. There are likely many more languages represented there but they&#8217;re not easy to discover.</p>\n<p>As the WordPress project is adding major <a href="http://wptavern.com/major-internationalization-improvements-planned-for-wordpress-4-0" target="_blank">internationalization improvements to the 4.0 release</a>, users who are new to the software will have an easier time getting on board. They will be in search for resources to help them get started and learn more. Right now, the vast majority of official WordPress learning resources are in English. In the future it will be exciting to see how the project adapts and changes to accommodate a growing international, multilingual community.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 09 Jul 2014 18:09:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:44;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:79:"WordPress.tv: Konstantin Obenland: Underscores — Ein Startertheme für jeden";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=36370";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:96:"http://wordpress.tv/2014/07/09/konstantin-obenland-underscores-ein-startertheme-fu%cc%88r-jeden/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:700:"<div id="v-DnH1fCIN-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/36370/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/36370/" /></a> <img alt="" border="0" src="http://pixel.wp.com/b.gif?host=wordpress.tv&blog=5089392&post=36370&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2014/07/09/konstantin-obenland-underscores-ein-startertheme-fu%cc%88r-jeden/"><img alt="Konstantin Obenland: Underscores — Ein Startertheme für jeden" src="http://videos.videopress.com/DnH1fCIN/video-e6cddbef07_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 09 Jul 2014 15:20:01 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:45;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:47:"WordPress.tv: Michele Butcher: Intro To Jetpack";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=36326";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wordpress.tv/2014/07/09/michele-butcher-intro-to-jetpack/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:642:"<div id="v-FPGL7Wlq-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/36326/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/36326/" /></a> <img alt="" border="0" src="http://pixel.wp.com/b.gif?host=wordpress.tv&blog=5089392&post=36326&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2014/07/09/michele-butcher-intro-to-jetpack/"><img alt="Michele Butcher: Intro To Jetpack" src="http://videos.videopress.com/FPGL7Wlq/video-746566fa95_scruberthumbnail_1.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 09 Jul 2014 15:05:20 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:46;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:62:"Post Status: Syed Balkhi and Thomas Griffin are joining forces";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:30:"http://www.poststat.us/?p=6836";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:150:"http://www.poststat.us/syed-balkhi-thomas-griffin-awesome-motive/?utm_source=rss&utm_medium=rss&utm_campaign=syed-balkhi-thomas-griffin-awesome-motive";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4997:"<p><img class="aligncenter size-large wp-image-6842" src="http://www.poststat.us/wp-content/uploads/2014/07/syed-balkhi-thomas-griffin-awesome-motive-752x283.jpg" alt="syed-balkhi-thomas-griffin-awesome-motive" width="752" height="283" />Syed Balkhi and Thomas Griffin first partnered together when they created <a href="https://wordpress.org/plugins/floating-social-bar/">Floating Social Bar</a>, a free WordPress social sharing plugin. They decided to collaborate after meeting and getting along at WordCamp Raleigh.</p>\n<p>From there, their relationship blossomed, and they decided to create a second product together. Syed specializes in marketing and business development, and Thomas specializes in development. Their second product was <a title="OptinMonster aims to be the dominant WordPress conversion plugin" href="http://www.poststat.us/optinmonster-wordpress-conversion-plugin/">OptinMonster</a>.</p>\n<p>Both Syed and Thomas have successful WordPress-based businesses already. Syed&#8217;s company, <a href="http://awesomemotive.com/">Awesome Motive</a>, is behind the popular site <a href="http://wpbeginner.com">WP Beginner</a>, <a href="http://list25.com">List 25</a>, and more recently products like <a href="http://optinmonster.com">OptinMonster</a> and <a href="http://themelab.com">ThemeLab</a>. Thomas, through his company Griffin Media, is the creator of the popular <a href="http://soliloquywp.com/">Soliloquy</a> slider and <a href="http://enviragallery.com/">Envira Gallery</a> plugins.</p>\n<p>Due to the success of OptinMonster, and their aligning views on business, ideals, and their complementary skillsets, the two have decided to merge their businesses. Thomas is now Awesome Motive&#8217;s Chief Technical Officer.</p>\n<p>The deal was made in stock and cash. Awesome Motive operates as a management firm, and each project is its own entity. With Syed continuing on as President of Awesome Motive, and Thomas as CTO, they will now partner and collaborate across the spectrum of Awesome Motive projects.</p>\n<p>Current active Awesome Motive projects are WP Beginner, List 25, ThemeLab, OptinMonster, Soliloquy, and Envira Gallery.</p>\n<p>Since Syed and Thomas were already working together, it was a natural fit for the two to join across the board. Now Awesome Motive will benefit from Thomas&#8217; technical insight and expertise, and Thomas&#8217; projects will benefit from the network of products in the company, and Syed&#8217;s affiliate marketing and business help.</p>\n<p>I talked to Syed and Thomas about the new relationship, which I&#8217;d encourage you to listen to. We talk about the structure of Awesome Motive, what&#8217;s coming down the pipeline, status of their current projects, and more.</p>\n<p><a href="http://s3.amazonaws.com/PostStatus/DraftPodcast/post-status-draft-thomas-griffin-syed-balkhi-awesome-motive.mp3">http://s3.amazonaws.com/PostStatus/DraftPodcast/post-status-draft-thomas-griffin-syed-balkhi-awesome-motive.mp3</a><br />\n<a href="http://s3.amazonaws.com/PostStatus/DraftPodcast/post-status-draft-thomas-griffin-syed-balkhi-awesome-motive.mp3">Direct Download</a></p>\n<h3>A partnership that makes sense</h3>\n<p>I think this partnership makes sense. It seems like a good move to both parties, and it&#8217;s clear that Syed and Thomas enjoy working together.</p>\n<p>With OptinMonster, ThemeLab, Soliloquy, and Envira Gallery under one roof, it makes for a pretty impressive commercial plugin portfolio &#8212; not to mention the website communities Syed has built in List 25 and WP Beginner. And of course, they have more up their sleeves that they are working on as we speak.</p>\n<p>Awesome Motive was already probably larger than you would think before Thomas and his team joined, but now they are more than 15 people and enjoy multi-million dollar per year revenues.</p>\n<p>I look forward to seeing how Awesome Motive further defines itself in the WordPress space. Syed and Thomas have both definitely left impressions individually, and I think together we&#8217;ll see a serious company and player in the WordPress product space further mature.</p>\n<h3>Giving back</h3>\n<p>Another thing I like about Syed and Awesome Motive is they like to give back. They currently <a href="http://www.wpbeginner.com/wpbeginner-5th-birthday-giveaway-help-build-a-school/">have a giveaway</a> going that&#8217;s aimed to raise money for <a href="http://fundraise.pencilsofpromise.org/fundraise?fcid=324942">Pencils of Promise</a> to build schools for kids in need in Guatemala.</p>\n<p>They built one last year, this year they&#8217;re aiming to raise $50,000 to build two schools. You can donate and <a href="http://www.wpbeginner.com/wpbeginner-5th-birthday-giveaway-help-build-a-school/">enter the giveaway</a> to help.</p>\n<hr />\n<p>You can stay in touch with <a href="https://twitter.com/syedbalkhi">Syed</a> and <a href="https://twitter.com/jthomasgriffin">Thomas</a> on Twitter to learn more about this partnership as it unfolds.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 09 Jul 2014 05:55:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Brian Krogsgard";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:47;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:91:"WordPress.tv: WordCamp Kansai 2014デザイナーが感じたGPLライセンスとWordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=36117";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:199:"http://wordpress.tv/2014/07/08/wordcamp-kansai-2014%e3%83%87%e3%82%b6%e3%82%a4%e3%83%8a%e3%83%bc%e3%81%8c%e6%84%9f%e3%81%98%e3%81%9fgpl%e3%83%a9%e3%82%a4%e3%82%bb%e3%83%b3%e3%82%b9%e3%81%a8wordpress/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:759:"<div id="v-9vwIuA0H-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/36117/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/36117/" /></a> <img alt="" border="0" src="http://pixel.wp.com/b.gif?host=wordpress.tv&blog=5089392&post=36117&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2014/07/08/wordcamp-kansai-2014%e3%83%87%e3%82%b6%e3%82%a4%e3%83%8a%e3%83%bc%e3%81%8c%e6%84%9f%e3%81%98%e3%81%9fgpl%e3%83%a9%e3%82%a4%e3%82%bb%e3%83%b3%e3%82%b9%e3%81%a8wordpress/"><img alt="ayakasumida.wmv" src="http://videos.videopress.com/9vwIuA0H/video-cbe243037d_scruberthumbnail_0.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 08 Jul 2014 22:23:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:48;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:118:"WPTavern: Proposed Customizer Improvements for WordPress 4.0 Land Amid Concerns Over Underlying Architectural Problems";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=25913";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:280:"http://wptavern.com/proposed-customizer-improvements-for-wordpress-4-0-land-amid-concerns-over-underlying-architectural-problems?utm_source=rss&utm_medium=rss&utm_campaign=proposed-customizer-improvements-for-wordpress-4-0-land-amid-concerns-over-underlying-architectural-problems";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:6579:"<div id="attachment_25972" class="wp-caption aligncenter"><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/hammer.jpg" rel="prettyphoto[25913]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/hammer.jpg?resize=742%2C316" alt="photo credit: beccaplusmolly - cc" class="size-full wp-image-25972" /></a><p class="wp-caption-text">photo credit: <a href="https://www.flickr.com/photos/beccaplusmolly/3054399737/">beccaplusmolly</a> &#8211; <a href="http://creativecommons.org/licenses/by-nc-sa/2.0/">cc</a></p></div>\n<p>When widgets were <a href="http://wptavern.com/widget-customizer-approved-for-wordpress-3-9" target="_blank">added to the customizer</a> in 3.9, WordPress users were generally surprised and delighted. Live previews are so beneficial to the editing experience that contributors are starting to pursue an expansion of the role of the customizer into all aspects of WordPress.</p>\n<p>Nick Halsey has been working extensively with the customizer as part of his <a href="http://make.wordpress.org/core/tag/menu-customizer" target="_blank">Google Summer of Code project</a> and recently published an <a href="http://make.wordpress.org/core/2014/07/08/customizer-improvements-in-4-0/" target="_blank">update</a> detailing the planned improvements for the upcoming 4.0 release. The Appearance <a href="http://make.wordpress.org/core/components/" target="_blank">trac component</a> has now been renamed to Customize. Halsey&#8217;s clarifications of the terminology reveal where the project is heading in terms of prioritizing the customizer:</p>\n<blockquote><p>We’re shifting toward using &#8216;Customizer&#8217; rather than &#8216;Theme Customizer&#8217;, as it isn’t necessarily theme-specific (though most of its uses currently are)&#8230;&#8217;Customize&#8217; could refer to anything. That’s the point; it could be used to customize any part of a site. The Customizer can be used for anything, and we’d like to encourage more experimentation with different uses of the Customizer.</p></blockquote>\n<p>WordPress 4.0 will include a number of UI changes to the customizer along with a new <a href="https://core.trac.wordpress.org/ticket/27406" target="_blank">Panels API</a> that enables developers to group controls into sections.</p>\n<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2014/07/panels-ui.gif" rel="prettyphoto[25913]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2014/07/panels-ui.gif?resize=1025%2C579" alt="panels-ui" class="aligncenter size-full wp-image-25938" /></a></p>\n<p>The proposed customizer changes for 4.0 provide <a href="https://core.trac.wordpress.org/ticket/28477" target="_blank">support for a wider array of controls</a> and parameters to help developers extend it for more varied uses beyond themes. <a href="https://core.trac.wordpress.org/ticket/27993" target="_blank">Contextual controls</a> are also on the list of proposed changes, which allow the controls to be visible or hidden based on the page the user is viewing.</p>\n<h3>Is WordPress putting all its eggs in one basket with the customizer?</h3>\n<p>Improvements to the customizer are expanding on all fronts. WordPress developers will soon be able to use it in many more ways after this iteration is complete. But are we putting a lot of effort into rapidly expanding a feature that may not be able to evolve as the web changes?</p>\n<p>Matt Wiebe, design Engineer at Automattic, recently wrote a piece, enumerating some of the most critical issues in <a href="http://wp.mattwie.be/2014/06/27/evolving-the-customizer/" target="_blank">evolving the customizer</a> as it currently stands. His article highlights the difficulty of using the customizer on mobile devices, performance issues, a confusing UI and the fundamental limitations of its architecture:</p>\n<blockquote><p>It’s also a JS-driven app wrapped around a PHP-only public API, which is I guess about what you’d expect from an early WP foray into something JS-driven. But this fundamental PHP dependency makes it basically impossible to account for a seamless switching of state while changing a previewed theme: a full page reload has to happen.</p></blockquote>\n<p>Wiebe believes that some of the smaller issues he outlined can be addressed with core changes, but the underlying architectural issues may be impossible to address in a backwards-compatible manner. He is hopeful that eventually the customizer could make use of the upcoming WP API, though that would require a massive overhaul:</p>\n<blockquote><p>Also, looking forward, the Customizer itself should be a client app of WP-API. Everything related to site appearance should be an API call away, rather than the tightly coupled thing that is the Customizer. This will open the door for, say, a native Customizer on Android or iOS or some other platform that doesn’t exist yet but will be important.</p></blockquote>\n<p>The WP API is <a href="http://wptavern.com/json-rest-api-slated-for-wordpress-4-1-release" target="_blank">slated for inclusion in WordPress 4.1</a> which should arrive later this year. Meanwhile, development with the current customizer architecture charges forward.</p>\n<p>Halsey briefly mentions a few of these issues in the conclusion of his <a href="http://make.wordpress.org/core/2014/07/08/customizer-improvements-in-4-0/" target="_blank">proposal</a> under the &#8220;future work&#8221; section. He cites tickets that recognize <a href="https://core.trac.wordpress.org/ticket/28784" target="_blank">the customizer is not intuitive on mobile</a> and needs some help in terms of <a href="https://core.trac.wordpress.org/ticket/28580" target="_blank">performance</a>. Customizer-related <a href="https://core.trac.wordpress.org/query?status=!closed&component=Customize&milestone=Future+Release&desc=1&order=id" target="_blank">tickets</a> tagged for a future release address a few of the issues that can be improved with core changes.</p>\n<p>It&#8217;s easy to nitpick problems with a relatively new feature in WordPress that hasn&#8217;t had time to develop. Many contributors have put a great deal of hard work into all of the upcoming improvements to the customizer. But the question here is whether or not this feature, with its current architecture, is a dead end until it is completely refactored to be able to provide users on all devices a better and more seamless editing experience. Are we sweeping too many concerns under the rug for future work? Or will the customizer be able to evolve and find a path forward through the roadblocks?</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 08 Jul 2014 22:10:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:49;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:87:"WPTavern: In The Next Few Years, 90% Of WordPress Development Could Be JavaScript Based";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=25916";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:214:"http://wptavern.com/in-the-next-few-years-90-of-wordpress-development-could-be-javascript-based?utm_source=rss&utm_medium=rss&utm_campaign=in-the-next-few-years-90-of-wordpress-development-could-be-javascript-based";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4898:"<p>In March of 2013, Matt Mullenweg <a title="http://memeburn.com/2013/03/in-the-future-we-will-only-need-five-computers-says-matt-mullenweg/" href="http://memeburn.com/2013/03/in-the-future-we-will-only-need-five-computers-says-matt-mullenweg/">stopped by the Memeburn office</a> to talk about how WordPress went from being just another blogging platform to becoming the CMS of choice for the majority of the web. The author of the article infers that Mullenweg thinks 90% of WordPress will be JavaScript based in the next few years.</p>\n<blockquote><p>In the future, the platform will also feature a lot more JavaScript. In fact, he reckons that 90% of WordPress will be JavaScript-based within the next few years.</p></blockquote>\n<p>When Eric Lewis recently asked Mullenweg on Twitter if he said the quote, his response clarified that he thinks the majority of PHP will be used for infrastructure such as updates, API&#8217;s, and the database layer. Meanwhile, user-facing improvements will be JavaScript driven. Most already are such as the editor, media, customizer and menus.</p>\n<blockquote class="twitter-tweet" width="550"><p><a href="https://twitter.com/nacin">@nacin</a> <a href="https://twitter.com/ericandrewlewis">@ericandrewlewis</a> I''d agree with <a href="https://twitter.com/nacin">@nacin</a> &#8211; 1/ Infrastructure stuff will likely remain majority PHP (updates, APIs, auth, DB layer)</p>\n<p>&mdash; Matt Mullenweg (@photomatt) <a href="https://twitter.com/photomatt/statuses/475258697073979393">June 7, 2014</a></p></blockquote>\n<p></p>\n<blockquote class="twitter-tweet" width="550"><p><a href="https://twitter.com/nacin">@nacin</a> <a href="https://twitter.com/ericandrewlewis">@ericandrewlewis</a> 2/ Most interesting user-facing improvements will be JS-driven, most already are. (editor, media, customizer, menus)</p>\n<p>&mdash; Matt Mullenweg (@photomatt) <a href="https://twitter.com/photomatt/statuses/475259028465917953">June 7, 2014</a></p></blockquote>\n<p></p>\n<p>Spurred on by the discussion, <a href="http://neliosoftware.com/javascript-taking-wordpress/">Jordi Cabot of NelioSoftware.com</a> dove into the WordPress source code. Using graphs, Cabot shows how many JavaScript files and lines of code have been added to WordPress since 0.7 was released. He then compares the number of PHP and JavaScript lines within the source code.</p>\n<div id="attachment_25931" class="wp-caption aligncenter"><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/PHPvsJavascriptInWordPressCodeOverTime.png" rel="prettyphoto[25916]"><img class="size-full wp-image-25931" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/07/PHPvsJavascriptInWordPressCodeOverTime.png?resize=832%2C613" alt="PHP vs JavaScript Lines Of Code in WordPress" /></a><p class="wp-caption-text">Image Courtesy of <a title="http://neliosoftware.com/javascript-taking-wordpress/" href="http://neliosoftware.com/javascript-taking-wordpress/">Nelio.com</a></p></div>\n<p>The numbers show that JavaScript is only 16.6% of the total source code of WordPress with PHP representing 83.4%. So while JavaScript isn&#8217;t taking over WordPress development any time soon, it&#8217;s definitely a valuable skill worth knowing.</p>\n<blockquote class="twitter-tweet" width="550"><p><a href="https://twitter.com/photomatt">@photomatt</a> <a href="https://twitter.com/nacin">@nacin</a> <a href="https://twitter.com/ericandrewlewis">@ericandrewlewis</a> Amazing how the web has gone from "just say no to javascript!" &#8211; to &#8211; "we need more javascript!"</p>\n<p>&mdash; Greg Rickaby (@GregRickaby) <a href="https://twitter.com/GregRickaby/statuses/475266879758811136">June 7, 2014</a></p></blockquote>\n<p></p>\n<p>Like Greg Rickaby, I find it fascinating that JavaScript has seen a resurgence. At one point, JavaScript seemed to be one of those poisonous things on the web that caused nothing but problems for browsers.</p>\n<p>I think various libraries like <a title="http://mootools.net/" href="http://mootools.net/">MooTools</a>, <a title="http://jquery.com/" href="http://jquery.com/">jQuery</a>, and <a title="http://nodejs.org/" href="http://nodejs.org/">Node.js</a> are largely responsible for the renewed interest in the language. I also think the <a title="http://en.wikipedia.org/wiki/Ajax_%28programming%29" href="http://en.wikipedia.org/wiki/Ajax_%28programming%29">introduction of Ajax</a> played a role as well, going back to 2004 when Google used it for Gmail and then Google Maps. Neil Taylor of Myplanet.io <a title="http://myplanet.io/article/a-brief-history-of-javascript/" href="http://myplanet.io/article/a-brief-history-of-javascript/">has a great article</a> covering the brief history of the JavaScript language.</p>\n<p>What factors can you come up with that explain the renewed interest in JavaScript? What advice would you give people wanting to learn JavaScript?</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 08 Jul 2014 21:59:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:9:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Tue, 15 Jul 2014 10:05:52 GMT";s:12:"content-type";s:8:"text/xml";s:14:"content-length";s:6:"165909";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:13:"last-modified";s:29:"Tue, 15 Jul 2014 10:00:17 GMT";s:4:"x-nc";s:11:"HIT lax 249";s:13:"accept-ranges";s:5:"bytes";}s:5:"build";s:14:"20130911010210";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(359, '_transient_timeout_feed_mod_867bd5c64f85878d03a060509cd2f92c', '1405461960', 'no'),
(360, '_transient_feed_mod_867bd5c64f85878d03a060509cd2f92c', '1405418760', 'no'),
(361, '_transient_timeout_feed_b9388c83948825c1edaef0d856b7b109', '1405461961', 'no'),
(362, '_transient_feed_b9388c83948825c1edaef0d856b7b109', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n	\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:72:"\n		\n		\n		\n		\n		\n		\n				\n\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:39:"WordPress Plugins » View: Most Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:44:"http://wordpress.org/plugins/browse/popular/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:39:"WordPress Plugins » View: Most Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 15 Jul 2014 09:58:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:25:"http://bbpress.org/?v=1.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:15:{i:0;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"Akismet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"http://wordpress.org/plugins/akismet/#post-15";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:11:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"15@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:98:"Akismet checks your comments against the Akismet Web service to see if they look like spam or not.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Contact Form 7";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"http://wordpress.org/plugins/contact-form-7/#post-2141";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 02 Aug 2007 12:45:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"2141@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:54:"Just another contact form plugin. Simple but flexible.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Jetpack by WordPress.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"http://wordpress.org/plugins/jetpack/#post-23862";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Jan 2011 02:21:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"23862@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:104:"Supercharge your WordPress site with powerful features previously only available to WordPress.com users.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Tim Moore";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Google XML Sitemaps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:63:"http://wordpress.org/plugins/google-sitemap-generator/#post-132";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:31:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"132@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:105:"This plugin will generate a special XML sitemap which will help search engines to better index your blog.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:5:"arnee";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"WordPress SEO by Yoast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"http://wordpress.org/plugins/wordpress-seo/#post-8321";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 Jan 2009 20:34:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"8321@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:131:"Improve your WordPress SEO: Write better content and have a fully optimized WordPress site using the WordPress SEO plugin by Yoast.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"MailPoet Newsletters";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"http://wordpress.org/plugins/wysija-newsletters/#post-32629";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 02 Dec 2011 17:09:16 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"32629@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:94:"Send newsletters, post notifications or autoresponders from WordPress easily, and beautifully.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"MailPoet Staff";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WooCommerce - excelling eCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"http://wordpress.org/plugins/woocommerce/#post-29860";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Sep 2011 08:13:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"29860@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:97:"WooCommerce is a powerful, extendable eCommerce plugin that helps you sell anything. Beautifully.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"WooThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"All in One SEO Pack";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"http://wordpress.org/plugins/all-in-one-seo-pack/#post-753";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 30 Mar 2007 20:08:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"753@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:126:"All in One SEO Pack is a WordPress SEO plugin to automatically optimize your WordPress blog for Search Engines such as Google.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"uberdose";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WordPress Importer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"http://wordpress.org/plugins/wordpress-importer/#post-18101";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 May 2010 17:42:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"18101@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:101:"Import posts, pages, comments, custom fields, categories, tags and more from a WordPress export file.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Brian Colinger";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"Wordfence Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:50:"http://wordpress.org/plugins/wordfence/#post-29832";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 04 Sep 2011 03:13:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"29832@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:137:"Wordfence Security is a free enterprise class security and performance plugin that makes your site up to 50 times faster and more secure.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Wordfence";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"WPtouch Mobile Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:47:"http://wordpress.org/plugins/wptouch/#post-5468";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 May 2008 04:58:09 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"5468@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:63:"Create a slick mobile WordPress website with just a few clicks.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"BraveNewCode Inc.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:46:"iThemes Security (formerly Better WP Security)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"http://wordpress.org/plugins/better-wp-security/#post-21738";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 22 Oct 2010 22:06:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"21738@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:63:"The easiest, most effective way to secure WordPress in seconds.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Chris Wiegman";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"Google Analytics Dashboard for WP";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:74:"http://wordpress.org/plugins/google-analytics-dashboard-for-wp/#post-50539";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 10 Mar 2013 17:07:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"50539@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:148:"Displays Google Analytics Reports and Real-Time Statistics in your Dashboard. Automatically inserts the tracking code in every page of your website.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Alin Marcu";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:27:"Black Studio TinyMCE Widget";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"http://wordpress.org/plugins/black-studio-tinymce-widget/#post-31973";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 10 Nov 2011 15:06:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"31973@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:76:"Adds a WYSIWYG widget based on the standard TinyMCE WordPress visual editor.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Marco Chiesi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"NextGEN Gallery";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/plugins/nextgen-gallery/#post-1169";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Apr 2007 20:08:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"1169@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:121:"The most popular WordPress gallery plugin and one of the most popular plugins of all time with over 10 million downloads.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Alex Rabe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:45:"http://wordpress.org/plugins/rss/view/popular";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:10:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Tue, 15 Jul 2014 10:05:54 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:7:"expires";s:29:"Tue, 15 Jul 2014 10:33:57 GMT";s:13:"cache-control";s:0:"";s:6:"pragma";s:0:"";s:13:"last-modified";s:31:"Tue, 15 Jul 2014 09:58:57 +0000";s:4:"x-nc";s:11:"HIT lax 249";}s:5:"build";s:14:"20130911010210";}', 'no'),
(363, '_transient_timeout_feed_mod_b9388c83948825c1edaef0d856b7b109', '1405461961', 'no'),
(364, '_transient_feed_mod_b9388c83948825c1edaef0d856b7b109', '1405418761', 'no'),
(365, '_transient_timeout_plugin_slugs', '1405525352', 'no'),
(366, '_transient_plugin_slugs', 'a:24:{i:0;s:19:"akismet/akismet.php";i:1;s:64:"bookcottages-availability-calendar/availability-BookCottages.php";i:2;s:55:"bookingcom-affiliate-plugin/booking-com-affiliation.php";i:3;s:25:"booking/wpdev-booking.php";i:4;s:24:"booking-system/dopbs.php";i:5;s:44:"cp-reservation-calendar/dex_reservations.php";i:6;s:37:"easyreservations/easyReservations.php";i:7;s:21:"guestapp/guestapp.php";i:8;s:41:"guestcentric-booking-gadget/gcbooking.php";i:9;s:9:"hello.php";i:10;s:17:"hostel/hostel.php";i:11;s:23:"hotelclub/hotelclub.php";i:12;s:47:"igumbi-online-booking/igumbi-online-booking.php";i:13;s:17:"jomres/jomres.php";i:14;s:30:"mp-booking/mp-booking-form.php";i:15;s:29:"openitaly4wp/openitaly4wp.php";i:16;s:41:"paltscom-hotel-booking-calendar/palts.php";i:17;s:21:"resaline/resaline.php";i:18;s:33:"sb-hotel-rooms/sb_hotel_rooms.php";i:19;s:60:"simple-booking-form-wordpress-plugin/simple-booking-form.php";i:20;s:31:"travel-search/travel-search.php";i:21;s:39:"wp-booking-system/wp-booking-system.php";i:22;s:57:"wp-simple-booking-calendar/wp-simple-booking-calendar.php";i:23;s:22:"chotcal/wp_chotcal.php";}', 'no'),
(367, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1405461961', 'no'),
(368, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><ul><li><a class=''rsswidget'' href=''http://wordpress.org/news/2014/07/wordpress-4-0-beta-1/''>WordPress 4.0 Beta 1</a> <span class="rss-date">10.07.2014</span><div class="rssSummary">WordPress 4.0 Beta 1 is now available! This software is still in development, so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.0, try the WordPress Beta Tester plugin (you’ll want “bleeding edge nightlies”). Or you can […]</div></li></ul></div><div class="rss-widget"><ul><li><a class=''rsswidget'' href=''http://wptavern.com/hybrid-core-2-0-adds-composer-support-removes-widgets-from-framework?utm_source=rss&#038;utm_medium=rss&#038;utm_campaign=hybrid-core-2-0-adds-composer-support-removes-widgets-from-framework'' title=''Theme Hybrid released Hybrid Core 2.0 today after many months in development. The framework, created by Justin Tadlock, powers this site and many other WordPress sites on the web. Version 1.0 was first released in October 2010, built from the engine that made up the base of Tadlock’s popular Hybrid Theme. Since that time, Hybrid Core has been downloaded hund''>WPTavern: Hybrid Core 2.0 Adds Composer Support, Removes Widgets From Framework</a></li><li><a class=''rsswidget'' href=''http://wptavern.com/wp-quick-install-script-offers-a-fast-way-to-install-wordpress-plugins-and-themes?utm_source=rss&#038;utm_medium=rss&#038;utm_campaign=wp-quick-install-script-offers-a-fast-way-to-install-wordpress-plugins-and-themes'' title=''WP Quick Install is an interesting new tool from Julio Potier, Jonathan Buttigieg, and Jean-Baptiste Marchand-Arvier, the folks behind WP Rocket. As part of supporting their commercial caching plugin, the WP Rocket team works extensively with clients. WP Quick Install is a tool they use internally and decided to share with the community. Its creators claim t''>WPTavern: WP Quick Install Script Offers a Fast Way to Install WordPress, Plugins, and Themes</a></li><li><a class=''rsswidget'' href=''http://wptavern.com/critical-security-update-for-wptouch-users-should-update-immediately?utm_source=rss&#038;utm_medium=rss&#038;utm_campaign=critical-security-update-for-wptouch-users-should-update-immediately'' title=''First reported by Sucuri, the WPTouch plugin has a dangerous security vulnerability and users are encouraged to update immediately. WPTouch is used to quickly add mobile support to websites and has over 5 million downloads making it one of the most popular plugins in the WordPress plugin directory. WPTouch Plugin Header   According to Sucuri, WPTouch incorre''>WPTavern: Critical Security Update For WPTouch, Users Should Update Immediately</a></li></ul></div><div class="rss-widget"><ul><li class=''dashboard-news-plugin''><span>Популярный плагин:</span> <a href=''http://wordpress.org/plugins/wordfence/'' class=''dashboard-news-plugin-link''>Wordfence Security</a>&nbsp;<span>(<a href=''plugin-install.php?tab=plugin-information&amp;plugin=wordfence&amp;_wpnonce=3c2f4cd128&amp;TB_iframe=true&amp;width=600&amp;height=800'' class=''thickbox'' title=''Wordfence Security''>Установить</a>)</span></li></ul></div>', 'no'),
(371, 'wphostel_booking_mode', 'manual', 'yes'),
(372, 'wphostel_email_options', 'a:7:{s:14:"do_email_admin";s:1:"1";s:11:"admin_email";s:19:"arhibober@gmail.com";s:13:"do_email_user";N;s:19:"email_admin_subject";s:25:"Заказ комнаты";s:19:"email_admin_message";s:43:"Я хочу заказать комнату";s:18:"email_user_subject";s:0:"";s:18:"email_user_message";s:0:"";}', 'yes'),
(373, 'wphostel_paypal', '', 'yes'),
(374, 'wphostel_booking_url', '', 'yes'),
(381, 'guestapp_widget__amount', '', 'yes'),
(382, 'guestapp_widget__lang', '', 'yes'),
(383, 'guestapp_widget__type', '', 'yes'),
(384, 'guestapp_widget__color', '', 'yes'),
(385, 'guestapp_widget__note', '', 'yes'),
(386, 'guestapp_widget__noavg', '', 'yes'),
(389, '_site_transient_timeout_theme_roots', '1405439826', 'yes'),
(390, '_site_transient_theme_roots', 'a:4:{s:9:"theme1943";s:7:"/themes";s:14:"twentyfourteen";s:7:"/themes";s:14:"twentythirteen";s:7:"/themes";s:12:"twentytwelve";s:7:"/themes";}', 'yes'),
(391, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1405438873;s:7:"checked";a:24:{s:19:"akismet/akismet.php";s:5:"3.0.0";s:64:"bookcottages-availability-calendar/availability-BookCottages.php";s:3:"1.0";s:55:"bookingcom-affiliate-plugin/booking-com-affiliation.php";s:5:"1.6.1";s:25:"booking/wpdev-booking.php";s:5:"5.1.5";s:24:"booking-system/dopbs.php";s:5:"1.3.1";s:44:"cp-reservation-calendar/dex_reservations.php";s:4:"1.01";s:37:"easyreservations/easyReservations.php";s:5:"3.4.2";s:21:"guestapp/guestapp.php";s:5:"1.1.5";s:41:"guestcentric-booking-gadget/gcbooking.php";s:4:"1.0b";s:9:"hello.php";s:3:"1.6";s:17:"hostel/hostel.php";s:5:"0.7.7";s:23:"hotelclub/hotelclub.php";s:3:"1.0";s:47:"igumbi-online-booking/igumbi-online-booking.php";s:3:"1.6";s:17:"jomres/jomres.php";s:1:"8";s:30:"mp-booking/mp-booking-form.php";s:5:"1.0.1";s:29:"openitaly4wp/openitaly4wp.php";s:5:"0.0.6";s:41:"paltscom-hotel-booking-calendar/palts.php";s:3:"1.1";s:21:"resaline/resaline.php";s:3:"1.2";s:33:"sb-hotel-rooms/sb_hotel_rooms.php";s:5:"1.0.0";s:60:"simple-booking-form-wordpress-plugin/simple-booking-form.php";s:5:"1.0.1";s:31:"travel-search/travel-search.php";s:3:"1.3";s:39:"wp-booking-system/wp-booking-system.php";s:3:"1.1";s:57:"wp-simple-booking-calendar/wp-simple-booking-calendar.php";s:3:"1.3";s:22:"chotcal/wp_chotcal.php";s:3:"1.1";}s:8:"response";a:1:{s:19:"akismet/akismet.php";O:8:"stdClass":6:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"3.0.1";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.3.0.1.zip";}}s:12:"translations";a:0:{}}', 'yes'),
(393, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(399, '_transient_is_multi_author', '0', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=106 ;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(6, 6, 'roomcount', '4'),
(7, 6, 'reservations_groundprice', '120'),
(8, 6, 'reservations_child_price', '10'),
(9, 7, 'roomcount', '7'),
(10, 7, 'reservations_groundprice', '250.57'),
(11, 7, 'reservations_child_price', '20'),
(12, 1, '_edit_lock', '1405449193:1'),
(13, 1, '_edit_last', '1'),
(15, 1, '_encloseme', '1'),
(16, 1, 'booking_plugin_AID', ''),
(17, 1, 'booking_plugin_TRACKING', ''),
(18, 1, 'booking_plugin_DESTINATION', ''),
(19, 1, 'booking_plugin_DESTINATION_RESTRICTION', ''),
(20, 1, 'booking_plugin_DESTINATION_UI', ''),
(21, 1, 'booking_plugin_bbg_color', ''),
(22, 1, 'booking_plugin_bt_color', ''),
(23, 1, 'booking_plugin_sbbbg_color', ''),
(24, 1, 'booking_plugin_sbbt_color', ''),
(25, 1, 'booking_plugin_box_language', ''),
(26, 1, 'booking_plugin_box_currency', ''),
(27, 1, 'booking_plugin_TARGET', ''),
(28, 1, 'booking_plugin_FORMAT', ''),
(29, 1, 'booking_plugin_FLEX', ''),
(30, 1, 'booking_plugin_CSS_override', ''),
(31, 1, 'booking_plugin_jqtheme', ''),
(33, 1, '_encloseme', '1'),
(34, 8, 'booking_plugin_AID', ''),
(35, 8, 'booking_plugin_TRACKING', ''),
(36, 8, 'booking_plugin_DESTINATION', ''),
(37, 8, 'booking_plugin_DESTINATION_RESTRICTION', ''),
(38, 8, 'booking_plugin_DESTINATION_UI', ''),
(39, 8, 'booking_plugin_bbg_color', ''),
(40, 8, 'booking_plugin_bt_color', ''),
(41, 8, 'booking_plugin_sbbbg_color', ''),
(42, 8, 'booking_plugin_sbbt_color', ''),
(43, 8, 'booking_plugin_box_language', ''),
(44, 8, 'booking_plugin_box_currency', ''),
(45, 8, 'booking_plugin_TARGET', ''),
(46, 8, 'booking_plugin_FORMAT', ''),
(47, 8, 'booking_plugin_FLEX', ''),
(48, 8, 'booking_plugin_CSS_override', ''),
(49, 8, 'booking_plugin_jqtheme', ''),
(50, 8, '_edit_last', '1'),
(51, 8, '_edit_lock', '1405441032:1'),
(52, 9, '_edit_last', '1'),
(53, 9, '_edit_lock', '1405438855:1'),
(54, 11, '_edit_last', '1'),
(55, 11, '_edit_lock', '1405438926:1'),
(56, 1, '_wp_trash_meta_status', 'publish'),
(57, 1, '_wp_trash_meta_time', '1405439074'),
(58, 1, '_wp_trash_meta_comments_status', 'a:1:{i:1;s:1:"1";}'),
(59, 15, '_menu_item_type', 'custom'),
(60, 15, '_menu_item_menu_item_parent', '0'),
(61, 15, '_menu_item_object_id', '15'),
(62, 15, '_menu_item_object', 'custom'),
(63, 15, '_menu_item_target', ''),
(64, 15, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(65, 15, '_menu_item_xfn', ''),
(66, 15, '_menu_item_url', 'http://localhost/hosmos2/'),
(68, 16, '_menu_item_type', 'post_type'),
(69, 16, '_menu_item_menu_item_parent', '0'),
(70, 16, '_menu_item_object_id', '8'),
(71, 16, '_menu_item_object', 'page'),
(72, 16, '_menu_item_target', ''),
(73, 16, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(74, 16, '_menu_item_xfn', ''),
(75, 16, '_menu_item_url', ''),
(76, 16, '_menu_item_orphaned', '1405439079'),
(77, 17, '_menu_item_type', 'post_type'),
(78, 17, '_menu_item_menu_item_parent', '0'),
(79, 17, '_menu_item_object_id', '9'),
(80, 17, '_menu_item_object', 'page'),
(81, 17, '_menu_item_target', ''),
(82, 17, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(83, 17, '_menu_item_xfn', ''),
(84, 17, '_menu_item_url', ''),
(86, 18, '_menu_item_type', 'post_type'),
(87, 18, '_menu_item_menu_item_parent', '0'),
(88, 18, '_menu_item_object_id', '2'),
(89, 18, '_menu_item_object', 'page'),
(90, 18, '_menu_item_target', ''),
(91, 18, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(92, 18, '_menu_item_xfn', ''),
(93, 18, '_menu_item_url', ''),
(94, 18, '_menu_item_orphaned', '1405439080'),
(95, 19, '_menu_item_type', 'post_type'),
(96, 19, '_menu_item_menu_item_parent', '0'),
(97, 19, '_menu_item_object_id', '11'),
(98, 19, '_menu_item_object', 'page'),
(99, 19, '_menu_item_target', ''),
(100, 19, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(101, 19, '_menu_item_xfn', ''),
(102, 19, '_menu_item_url', ''),
(104, 2, '_wp_trash_meta_status', 'publish'),
(105, 2, '_wp_trash_meta_time', '1405441147');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2014-07-13 08:38:43', '2014-07-13 08:38:43', 'Добро пожаловать в WordPress. Это ваша первая запись. Отредактируйте или удалите её, затем пишите!\r\n[wphostel-booking]\r\n[wphostel-list]', 'Привет, мир!', '', 'trash', 'open', 'open', '', '%d0%bf%d1%80%d0%b8%d0%b2%d0%b5%d1%82-%d0%bc%d0%b8%d1%80', '', '', '2014-07-15 19:44:34', '2014-07-15 15:44:34', '', 0, 'http://localhost/hosmos2/?p=1', 0, 'post', '', 1),
(2, 1, '2014-07-13 08:38:43', '2014-07-13 08:38:43', 'Это пример страницы. От записей в блоге она отличается тем, что остаётся на одном месте и отображается в меню сайта (в большинстве тем). На странице &laquo;Детали&raquo; владельцы сайтов обычно рассказывают о себе потенциальным посетителям. Например, так:\n\n<blockquote>Привет! Днём я курьер, а вечером &#8212; подающий надежды актёр. Это мой блог. Я живу в Ростове-на-Дону, люблю своего пса Джека и пинаколаду. (И ещё попадать под дождь.)</blockquote>\n\n...или так:\n\n<blockquote>Компания &laquo;Штучки XYZ&raquo; была основана в 1971 году и с тех пор производит качественные штучки. Компания находится в Готэм-сити, имеет штат из более чем 2000 сотрудников и приносит много пользы жителям Готэма.</blockquote>\n\nПерейдите <a href="http://localhost/hosmos2/wp-admin/">в консоль</a>, чтобы удалить эту страницу и создать новые. Успехов!', 'Пример страницы', '', 'trash', 'open', 'open', '', 'sample-page', '', '', '2014-07-15 20:19:07', '2014-07-15 16:19:07', '', 0, 'http://localhost/hosmos2/?page_id=2', 0, 'page', '', 0),
(3, 1, '2014-07-13 12:39:02', '0000-00-00 00:00:00', '', 'Черновик', '', 'auto-draft', 'open', 'open', '', '', '', '', '2014-07-13 12:39:02', '0000-00-00 00:00:00', '', 0, 'http://localhost/hosmos2/?p=3', 0, 'post', '', 0),
(6, 1, '2014-07-13 12:50:31', '2014-07-13 08:50:31', 'This is a Sample Resource.', 'Sample Resource One', '', 'private', 'open', 'open', '', 'sample-resource-one', '', '', '2014-07-13 12:50:31', '2014-07-13 08:50:31', '', 0, 'http://localhost/hosmos2/?p=6', 0, 'easy-rooms', '', 0),
(7, 1, '2014-07-13 12:50:32', '2014-07-13 08:50:32', 'This is a Sample Resource.', 'Sample Resource Two', '', 'private', 'open', 'open', '', 'sample-resource-two', '', '', '2014-07-13 12:50:32', '2014-07-13 08:50:32', '', 0, 'http://localhost/hosmos2/?p=7', 0, 'easy-rooms', '', 0),
(8, 1, '2014-07-15 19:41:03', '2014-07-15 15:41:03', 'Отель "Хосмос" приветствует Вас!', 'Главная', '', 'publish', 'open', 'closed', '', '%d0%b3%d0%bb%d0%b0%d0%b2%d0%bd%d0%b0%d1%8f', '', '', '2014-07-15 20:19:23', '2014-07-15 16:19:23', '', 0, 'http://localhost/hosmos2/?page_id=8', 0, 'page', '', 0),
(9, 1, '2014-07-15 19:43:16', '2014-07-15 15:43:16', '[wphostel-booking]', 'Заказать номер для забронирования', '', 'publish', 'open', 'open', '', '%d0%b7%d0%b0%d0%ba%d0%b0%d0%b7%d0%b0%d1%82%d1%8c-%d0%bd%d0%be%d0%bc%d0%b5%d1%80-%d0%b4%d0%bb%d1%8f-%d0%b7%d0%b0%d0%b1%d1%80%d0%be%d0%bd%d0%b8%d1%80%d0%be%d0%b2%d0%b0%d0%bd%d0%b8%d1%8f', '', '', '2014-07-15 19:43:16', '2014-07-15 15:43:16', '', 0, 'http://localhost/hosmos2/?page_id=9', 0, 'page', '', 0),
(10, 1, '2014-07-15 19:43:16', '2014-07-15 15:43:16', '[wphostel-booking]', 'Заказать номер для забронирования', '', 'inherit', 'open', 'open', '', '9-revision-v1', '', '', '2014-07-15 19:43:16', '2014-07-15 15:43:16', '', 9, 'http://localhost/hosmos2/?p=10', 0, 'revision', '', 0),
(11, 1, '2014-07-15 19:44:21', '2014-07-15 15:44:21', '[wphostel-list]', 'Список свободных номеров', '', 'publish', 'open', 'open', '', '%d1%81%d0%bf%d0%b8%d1%81%d0%be%d0%ba-%d1%81%d0%b2%d0%be%d0%b1%d0%be%d0%b4%d0%bd%d1%8b%d1%85-%d0%bd%d0%be%d0%bc%d0%b5%d1%80%d0%be%d0%b2', '', '', '2014-07-15 19:44:28', '2014-07-15 15:44:28', '', 0, 'http://localhost/hosmos2/?page_id=11', 0, 'page', '', 0),
(12, 1, '2014-07-15 19:44:21', '2014-07-15 15:44:21', '[wphostel-дшые]', 'Список свободных номеров', '', 'inherit', 'open', 'open', '', '11-revision-v1', '', '', '2014-07-15 19:44:21', '2014-07-15 15:44:21', '', 11, 'http://localhost/hosmos2/?p=12', 0, 'revision', '', 0),
(13, 1, '2014-07-15 19:44:28', '2014-07-15 15:44:28', '[wphostel-list]', 'Список свободных номеров', '', 'inherit', 'open', 'open', '', '11-revision-v1', '', '', '2014-07-15 19:44:28', '2014-07-15 15:44:28', '', 11, 'http://localhost/hosmos2/?p=13', 0, 'revision', '', 0),
(14, 1, '2014-07-15 19:44:34', '2014-07-15 15:44:34', 'Добро пожаловать в WordPress. Это ваша первая запись. Отредактируйте или удалите её, затем пишите!\r\n[wphostel-booking]\r\n[wphostel-list]', 'Привет, мир!', '', 'inherit', 'open', 'open', '', '1-revision-v1', '', '', '2014-07-15 19:44:34', '2014-07-15 15:44:34', '', 1, 'http://localhost/hosmos2/?p=14', 0, 'revision', '', 0),
(15, 1, '2014-07-15 19:45:09', '2014-07-15 15:45:09', '', 'Главная', '', 'publish', 'open', 'open', '', '%d0%b3%d0%bb%d0%b0%d0%b2%d0%bd%d0%b0%d1%8f', '', '', '2014-07-15 20:18:57', '2014-07-15 16:18:57', '', 0, 'http://localhost/hosmos2/?p=15', 1, 'nav_menu_item', '', 0),
(16, 1, '2014-07-15 19:44:39', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2014-07-15 19:44:39', '0000-00-00 00:00:00', '', 0, 'http://localhost/hosmos2/?p=16', 1, 'nav_menu_item', '', 0),
(17, 1, '2014-07-15 19:45:09', '2014-07-15 15:45:09', ' ', '', '', 'publish', 'open', 'open', '', '17', '', '', '2014-07-15 20:18:57', '2014-07-15 16:18:57', '', 0, 'http://localhost/hosmos2/?p=17', 2, 'nav_menu_item', '', 0),
(18, 1, '2014-07-15 19:44:40', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2014-07-15 19:44:40', '0000-00-00 00:00:00', '', 0, 'http://localhost/hosmos2/?p=18', 1, 'nav_menu_item', '', 0),
(19, 1, '2014-07-15 19:45:09', '2014-07-15 15:45:09', ' ', '', '', 'publish', 'open', 'open', '', '19', '', '', '2014-07-15 20:18:57', '2014-07-15 16:18:57', '', 0, 'http://localhost/hosmos2/?p=19', 3, 'nav_menu_item', '', 0),
(20, 1, '2014-07-15 20:19:07', '2014-07-15 16:19:07', 'Это пример страницы. От записей в блоге она отличается тем, что остаётся на одном месте и отображается в меню сайта (в большинстве тем). На странице &laquo;Детали&raquo; владельцы сайтов обычно рассказывают о себе потенциальным посетителям. Например, так:\n\n<blockquote>Привет! Днём я курьер, а вечером &#8212; подающий надежды актёр. Это мой блог. Я живу в Ростове-на-Дону, люблю своего пса Джека и пинаколаду. (И ещё попадать под дождь.)</blockquote>\n\n...или так:\n\n<blockquote>Компания &laquo;Штучки XYZ&raquo; была основана в 1971 году и с тех пор производит качественные штучки. Компания находится в Готэм-сити, имеет штат из более чем 2000 сотрудников и приносит много пользы жителям Готэма.</blockquote>\n\nПерейдите <a href="http://localhost/hosmos2/wp-admin/">в консоль</a>, чтобы удалить эту страницу и создать новые. Успехов!', 'Пример страницы', '', 'inherit', 'open', 'open', '', '2-revision-v1', '', '', '2014-07-15 20:19:07', '2014-07-15 16:19:07', '', 2, 'http://localhost/hosmos2/?p=20', 0, 'revision', '', 0),
(21, 1, '2014-07-15 20:19:23', '2014-07-15 16:19:23', 'Отель "Хосмос" приветствует Вас!', 'Главная', '', 'inherit', 'open', 'open', '', '8-revision-v1', '', '', '2014-07-15 20:19:23', '2014-07-15 16:19:23', '', 8, 'http://localhost/hosmos2/?p=21', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_reservations`
--

CREATE TABLE IF NOT EXISTS `wp_reservations` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `arrival` datetime NOT NULL,
  `departure` datetime NOT NULL,
  `user` int(10) NOT NULL,
  `name` varchar(35) NOT NULL,
  `email` varchar(50) NOT NULL,
  `country` varchar(4) NOT NULL,
  `approve` varchar(3) NOT NULL,
  `room` varchar(8) DEFAULT NULL,
  `roomnumber` varchar(8) NOT NULL,
  `number` int(4) NOT NULL,
  `childs` int(4) NOT NULL,
  `price` varchar(20) NOT NULL,
  `custom` longtext NOT NULL,
  `customp` longtext NOT NULL,
  `reservated` datetime NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_reservation_calendars`
--

CREATE TABLE IF NOT EXISTS `wp_reservation_calendars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `uname` varchar(100) DEFAULT NULL,
  `passwd` varchar(100) DEFAULT NULL,
  `lang` varchar(5) DEFAULT NULL,
  `cpages` tinyint(3) unsigned DEFAULT NULL,
  `msg` varchar(255) NOT NULL DEFAULT '',
  `caldeleted` tinyint(3) unsigned DEFAULT NULL,
  `conwer` int(11) NOT NULL,
  `calendar_language` varchar(10) NOT NULL DEFAULT '',
  `calendar_mode` varchar(10) NOT NULL DEFAULT '',
  `calendar_dateformat` varchar(10) DEFAULT '',
  `calendar_pages` varchar(10) NOT NULL DEFAULT '',
  `calendar_weekday` varchar(10) NOT NULL DEFAULT '',
  `calendar_mindate` varchar(255) NOT NULL DEFAULT '',
  `calendar_maxdate` varchar(255) NOT NULL DEFAULT '',
  `enable_paypal` varchar(10) NOT NULL DEFAULT '',
  `paypal_email` varchar(255) NOT NULL DEFAULT '',
  `request_cost` varchar(255) NOT NULL DEFAULT '',
  `paypal_product_name` varchar(255) NOT NULL DEFAULT '',
  `currency` varchar(10) NOT NULL DEFAULT '',
  `url_ok` text,
  `url_cancel` text,
  `paypal_language` varchar(10) NOT NULL DEFAULT '',
  `notification_from_email` text,
  `notification_destination_email` text,
  `email_subject_confirmation_to_user` text,
  `email_confirmation_to_user` text,
  `email_subject_notification_to_admin` text,
  `email_notification_to_admin` text,
  `dexcv_enable_captcha` varchar(10) NOT NULL DEFAULT '',
  `dexcv_width` varchar(10) NOT NULL DEFAULT '',
  `dexcv_height` varchar(10) NOT NULL DEFAULT '',
  `dexcv_chars` varchar(10) NOT NULL DEFAULT '',
  `dexcv_min_font_size` varchar(10) NOT NULL DEFAULT '',
  `dexcv_max_font_size` varchar(10) NOT NULL DEFAULT '',
  `dexcv_noise` varchar(10) NOT NULL DEFAULT '',
  `dexcv_noise_length` varchar(10) NOT NULL DEFAULT '',
  `dexcv_background` varchar(10) NOT NULL DEFAULT '',
  `dexcv_border` varchar(10) NOT NULL DEFAULT '',
  `dexcv_font` varchar(100) NOT NULL DEFAULT '',
  `cp_cal_checkboxes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_reservation_calendars`
--

INSERT INTO `wp_reservation_calendars` (`id`, `title`, `uname`, `passwd`, `lang`, `cpages`, `msg`, `caldeleted`, `conwer`, `calendar_language`, `calendar_mode`, `calendar_dateformat`, `calendar_pages`, `calendar_weekday`, `calendar_mindate`, `calendar_maxdate`, `enable_paypal`, `paypal_email`, `request_cost`, `paypal_product_name`, `currency`, `url_ok`, `url_cancel`, `paypal_language`, `notification_from_email`, `notification_destination_email`, `email_subject_confirmation_to_user`, `email_confirmation_to_user`, `email_subject_notification_to_admin`, `email_notification_to_admin`, `dexcv_enable_captcha`, `dexcv_width`, `dexcv_height`, `dexcv_chars`, `dexcv_min_font_size`, `dexcv_max_font_size`, `dexcv_noise`, `dexcv_noise_length`, `dexcv_background`, `dexcv_border`, `dexcv_font`, `cp_cal_checkboxes`) VALUES
(1, 'cal1', 'Calendar Item 1', '', 'ENG', 1, 'Please, select your reservation.', 0, 0, '', 'true', '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_reservation_calendars_data`
--

CREATE TABLE IF NOT EXISTS `wp_reservation_calendars_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reservation_calendar_id` int(10) unsigned DEFAULT NULL,
  `datatime_s` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `datatime_e` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(250) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Без рубрики', '%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8', 0),
(2, 'Меню 1', '%d0%bc%d0%b5%d0%bd%d1%8e-1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(15, 2, 0),
(17, 2, 0),
(19, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'nav_menu', '', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'first_name', ''),
(2, 1, 'last_name', ''),
(3, 1, 'nickname', 'admin'),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp350_media,wp360_revisions,wp360_locks,wp390_widgets'),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'wp_dashboard_quick_press_last_post_id', '3'),
(15, 1, 'wp_user-settings', 'editor=html'),
(16, 1, 'wp_user-settings-time', '1405418788'),
(17, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}'),
(18, 1, 'metaboxhidden_nav-menus', 'a:3:{i:0;s:8:"add-post";i:1;s:12:"add-post_tag";i:2;s:15:"add-post_format";}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BbwwzuY9XX5HvlamFc0ciYY40ZzCxk.', 'admin', 'arhibober@gmail.com', '', '2014-07-13 08:38:43', '', 0, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphostel_bookings`
--

CREATE TABLE IF NOT EXISTS `wp_wphostel_bookings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned NOT NULL DEFAULT '0',
  `from_date` date NOT NULL DEFAULT '2000-01-01',
  `to_date` date NOT NULL DEFAULT '2000-01-01',
  `beds` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `amount_paid` decimal(8,2) NOT NULL DEFAULT '0.00',
  `amount_due` decimal(8,2) NOT NULL DEFAULT '0.00',
  `is_static` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `contact_name` varchar(255) NOT NULL DEFAULT '',
  `contact_email` varchar(255) NOT NULL DEFAULT '',
  `contact_phone` varchar(255) NOT NULL DEFAULT '',
  `contact_type` varchar(255) NOT NULL DEFAULT '',
  `timestamp` datetime DEFAULT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_wphostel_bookings`
--

INSERT INTO `wp_wphostel_bookings` (`id`, `room_id`, `from_date`, `to_date`, `beds`, `amount_paid`, `amount_due`, `is_static`, `contact_name`, `contact_email`, `contact_phone`, `contact_type`, `timestamp`, `status`) VALUES
(1, 2, '2014-07-16', '2014-07-17', 1, 50.00, 0.00, 0, 'cccc', 'dddd@mail.ru', '2468', 'male', '2014-07-15 13:22:26', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphostel_payments`
--

CREATE TABLE IF NOT EXISTS `wp_wphostel_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '2001-01-01',
  `amount` decimal(8,2) DEFAULT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'failed',
  `paycode` varchar(100) NOT NULL DEFAULT '',
  `paytype` varchar(100) NOT NULL DEFAULT 'paypal',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wphostel_rooms`
--

CREATE TABLE IF NOT EXISTS `wp_wphostel_rooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT 'room',
  `rtype` varchar(100) NOT NULL DEFAULT 'dorm',
  `beds` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `bathroom` varchar(100) NOT NULL DEFAULT 'standard',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `description` text,
  `price_type` varchar(100) NOT NULL DEFAULT 'per-bed',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `wp_wphostel_rooms`
--

INSERT INTO `wp_wphostel_rooms` (`id`, `title`, `rtype`, `beds`, `bathroom`, `price`, `description`, `price_type`) VALUES
(1, 'Маленький принц', 'private', 2, 'ensuite', 100.00, '', 'per-bed'),
(2, 'Белка и Стрелка', 'private', 1, 'ensuite', 50.00, '', 'per-bed'),
(3, 'Гагарин', 'private', 3, 'ensuite', 150.00, '', 'per-bed');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
