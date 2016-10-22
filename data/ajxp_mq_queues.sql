use DATABASE_NAME;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `ajxp_mq_queues` (
  `channel_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `ajxp_mq_queues`
  ADD PRIMARY KEY (`channel_name`);
