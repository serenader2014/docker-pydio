use DATABASE_NAME;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `ajxp_repo` (
  `uuid` varchar(33) COLLATE utf8_unicode_ci NOT NULL,
  `parent_uuid` varchar(33) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `child_user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accessType` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recycle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bcreate` tinyint(1) DEFAULT NULL,
  `writeable` tinyint(1) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `isTemplate` tinyint(1) DEFAULT NULL,
  `inferOptionsFromParent` tinyint(1) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupPath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `ajxp_repo`
  ADD PRIMARY KEY (`uuid`);
