use DATABASE_NAME;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `ajxp_mail_sent` (
  `id` int(11) NOT NULL,
  `recipient` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `date_event` int(11) NOT NULL,
  `notification_object` longblob NOT NULL,
  `html` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `ajxp_mail_sent`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `ajxp_mail_sent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
