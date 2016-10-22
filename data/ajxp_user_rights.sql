use DATABASE_NAME;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `ajxp_user_rights` (
  `rid` int(11) NOT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `repo_uuid` varchar(33) COLLATE utf8_unicode_ci NOT NULL,
  `rights` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `ajxp_user_rights` (`rid`, `login`, `repo_uuid`, `rights`) VALUES
(2, 'admin', 'ajxp.admin', '1');

ALTER TABLE `ajxp_user_rights`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `login` (`login`),
  ADD KEY `repo_uuid` (`repo_uuid`);

ALTER TABLE `ajxp_user_rights`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
