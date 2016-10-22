use DATABASE_NAME;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `ajxp_changes` (
  `seq` int(20) NOT NULL,
  `repository_identifier` text COLLATE utf8_unicode_ci NOT NULL,
  `node_id` bigint(20) NOT NULL,
  `type` enum('create','delete','path','content') COLLATE utf8_unicode_ci NOT NULL,
  `source` text COLLATE utf8_unicode_ci NOT NULL,
  `target` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


ALTER TABLE `ajxp_changes`
  ADD PRIMARY KEY (`seq`),
  ADD KEY `node_id` (`node_id`,`type`);

ALTER TABLE `ajxp_changes`
  MODIFY `seq` int(20) NOT NULL AUTO_INCREMENT;
