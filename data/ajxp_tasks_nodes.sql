use DATABASE_NAME;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `ajxp_tasks_nodes` (
  `id` int(11) NOT NULL,
  `task_uid` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `node_base_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `node_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `ajxp_tasks_nodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ajxp_taskn_tuid_idx` (`task_uid`),
  ADD KEY `ajxp_taskn_base_idx` (`node_base_url`),
  ADD KEY `ajxp_taskn_path_idx` (`node_path`);

ALTER TABLE `ajxp_tasks_nodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
