use DATABASE_NAME;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `ajxp_repo_options` (
  `oid` int(11) NOT NULL,
  `uuid` varchar(33) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `val` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `ajxp_repo_options`
  ADD PRIMARY KEY (`oid`),
  ADD KEY `uuid` (`uuid`);

ALTER TABLE `ajxp_repo_options`
  MODIFY `oid` int(11) NOT NULL AUTO_INCREMENT;
