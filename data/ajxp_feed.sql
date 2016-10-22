use DATABASE_NAME;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `ajxp_feed` (
  `id` int(11) NOT NULL,
  `edate` int(11) NOT NULL,
  `etype` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `htype` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `index_path` mediumtext COLLATE utf8_unicode_ci,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `repository_id` varchar(33) COLLATE utf8_unicode_ci NOT NULL,
  `user_group` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `repository_scope` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `repository_owner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `ajxp_feed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `edate` (`edate`,`etype`,`htype`,`user_id`,`repository_id`),
  ADD KEY `index_path` (`index_path`(40));

ALTER TABLE `ajxp_feed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
