use DATABASE_NAME;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `ajxp_index` (
  `node_id` int(20) NOT NULL,
  `node_path` text COLLATE utf8_unicode_ci NOT NULL,
  `bytesize` bigint(20) NOT NULL,
  `md5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `mtime` int(11) NOT NULL,
  `repository_identifier` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DELIMITER $$
CREATE TRIGGER `LOG_DELETE` AFTER DELETE ON `ajxp_index` FOR EACH ROW INSERT INTO ajxp_changes (repository_identifier, node_id,source,target,type)
  VALUES (old.repository_identifier, old.node_id, old.node_path, 'NULL', 'delete')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `LOG_INSERT` AFTER INSERT ON `ajxp_index` FOR EACH ROW INSERT INTO ajxp_changes (repository_identifier, node_id,source,target,type)
  VALUES (new.repository_identifier, new.node_id, 'NULL', new.node_path, 'create')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `LOG_UPDATE` AFTER UPDATE ON `ajxp_index` FOR EACH ROW INSERT INTO ajxp_changes (repository_identifier, node_id,source,target,type)
  VALUES (new.repository_identifier, new.node_id, old.node_path, new.node_path, CASE old.node_path = new.node_path WHEN true THEN 'content' ELSE 'path' END)
$$
DELIMITER ;

ALTER TABLE `ajxp_index`
  ADD PRIMARY KEY (`node_id`);

ALTER TABLE `ajxp_index`
  MODIFY `node_id` int(20) NOT NULL AUTO_INCREMENT;
