use DATABASE_NAME;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `ajxp_mail_queue` (
  `id` int(11) NOT NULL,
  `recipient` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `date_event` int(11) NOT NULL,
  `notification_object` longblob NOT NULL,
  `html` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DELIMITER $$
CREATE TRIGGER `mail_queue_go_to_sent` BEFORE DELETE ON `ajxp_mail_queue` FOR EACH ROW INSERT INTO ajxp_mail_sent (recipient,url,date_event,notification_object,html) VALUES (old.recipient,old.url,old.date_event,old.notification_object,old.html)
$$
DELIMITER ;

ALTER TABLE `ajxp_mail_queue`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `ajxp_mail_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
