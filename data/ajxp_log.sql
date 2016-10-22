use DATABASE_NAME;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `ajxp_log` (
  `id` int(11) NOT NULL,
  `logdate` datetime DEFAULT NULL,
  `remote_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `severity` enum('DEBUG','INFO','NOTICE','WARNING','ERROR') COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `params` text COLLATE utf8_unicode_ci,
  `repository_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dirname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `basename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `ajxp_log` (`id`, `logdate`, `remote_ip`, `severity`, `user`, `source`, `message`, `params`, `repository_id`, `device`, `dirname`, `basename`) VALUES
(1, '2016-10-21 10:45:24', '172.17.0.3', 'INFO', 'admin', 'AuthService', 'Log In', 'context=WebUI', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', '', '');

ALTER TABLE `ajxp_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `source` (`source`),
  ADD KEY `repository_id` (`repository_id`),
  ADD KEY `logdate` (`logdate`),
  ADD KEY `severity` (`severity`),
  ADD KEY `dirname` (`dirname`),
  ADD KEY `basename` (`basename`);

ALTER TABLE `ajxp_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
