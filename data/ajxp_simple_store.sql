use DATABASE_NAME;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `ajxp_simple_store` (
  `object_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `store_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `serialized_data` longtext COLLATE utf8_unicode_ci,
  `binary_data` longblob,
  `related_object_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insertion_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `ajxp_simple_store`
  ADD PRIMARY KEY (`object_id`,`store_id`);
