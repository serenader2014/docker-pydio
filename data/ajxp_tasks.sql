use DATABASE_NAME;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `ajxp_tasks` (
  `uid` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `parent_uid` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flags` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ws_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `status_msg` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `progress` int(11) NOT NULL,
  `schedule` int(11) NOT NULL,
  `schedule_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parameters` mediumblob NOT NULL,
  `creation_date` int(11) NOT NULL DEFAULT '0',
  `status_update` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `ajxp_tasks`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `ajxp_task_usr_idx` (`user_id`),
  ADD KEY `ajxp_task_status_idx` (`status`),
  ADD KEY `ajxp_task_type` (`type`),
  ADD KEY `ajxp_task_schedule` (`schedule`);
