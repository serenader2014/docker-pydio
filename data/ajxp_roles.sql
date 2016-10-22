use DATABASE_NAME;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `ajxp_roles` (
  `role_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `serial_role` text COLLATE utf8_unicode_ci NOT NULL,
  `last_updated` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `ajxp_roles` (`role_id`, `serial_role`, `last_updated`) VALUES
('AJXP_GRP_/', 'O:9:"AJXP_Role":8:{s:12:"\0*\0groupPath";N;s:9:"\0*\0roleId";s:10:"AJXP_GRP_/";s:7:"\0*\0acls";a:4:{i:1;s:2:"rw";s:9:"ajxp_user";s:2:"rw";s:9:"ajxp_home";s:2:"rw";s:5:"inbox";s:2:"rw";}s:13:"\0*\0parameters";a:1:{s:19:"AJXP_REPO_SCOPE_ALL";a:4:{s:9:"core.conf";a:3:{s:17:"ROLE_DISPLAY_NAME";s:10:"Root Group";s:19:"ROLE_FORCE_OVERRIDE";s:5:"false";s:24:"DEFAULT_START_REPOSITORY";s:9:"ajxp_home";}s:17:"action.disclaimer";a:1:{s:19:"DISCLAIMER_ACCEPTED";s:2:"no";}s:13:"meta.syncable";a:1:{s:13:"REPO_SYNCABLE";s:4:"true";}s:11:"core.mailer";a:4:{s:23:"NOTIFICATIONS_EMAIL_GET";s:4:"true";s:29:"NOTIFICATIONS_EMAIL_FREQUENCY";s:1:"M";s:34:"NOTIFICATIONS_EMAIL_FREQUENCY_USER";s:1:"5";s:29:"NOTIFICATIONS_EMAIL_SEND_HTML";s:4:"true";}}}s:10:"\0*\0actions";a:0:{}s:14:"\0*\0autoApplies";a:0:{}s:8:"\0*\0masks";a:0:{}s:14:"\0*\0lastUpdated";i:0;}', 1477044205),
('AJXP_USR_/admin', 'O:9:"AJXP_Role":8:{s:12:"\0*\0groupPath";N;s:9:"\0*\0roleId";s:15:"AJXP_USR_/admin";s:7:"\0*\0acls";a:7:{i:0;s:2:"rw";i:1;s:2:"rw";s:9:"ajxp_user";s:2:"rw";s:9:"ajxp_home";s:2:"rw";s:5:"inbox";s:2:"rw";s:9:"ajxp_conf";s:2:"rw";s:11:"fs_template";s:2:"rw";}s:13:"\0*\0parameters";a:1:{s:19:"AJXP_REPO_SCOPE_ALL";a:1:{s:9:"core.conf";a:1:{s:17:"USER_DISPLAY_NAME";s:5:"admin";}}}s:10:"\0*\0actions";a:0:{}s:14:"\0*\0autoApplies";a:0:{}s:8:"\0*\0masks";a:0:{}s:14:"\0*\0lastUpdated";i:1477044195;}', 1477044195),
('GUEST', 'O:9:"AJXP_Role":8:{s:12:"\0*\0groupPath";N;s:9:"\0*\0roleId";s:5:"GUEST";s:7:"\0*\0acls";a:0:{}s:13:"\0*\0parameters";a:1:{s:19:"AJXP_REPO_SCOPE_ALL";a:1:{s:9:"core.conf";a:1:{s:17:"ROLE_DISPLAY_NAME";s:15:"Guest user role";}}}s:10:"\0*\0actions";a:1:{s:19:"AJXP_REPO_SCOPE_ALL";a:3:{s:9:"access.fs";a:1:{s:5:"purge";s:8:"disabled";}s:10:"meta.watch";a:1:{s:12:"toggle_watch";s:8:"disabled";}s:12:"index.lucene";a:1:{s:5:"index";s:8:"disabled";}}}s:14:"\0*\0autoApplies";a:1:{i:0;s:5:"guest";}s:8:"\0*\0masks";a:0:{}s:14:"\0*\0lastUpdated";i:0;}', 1477044205),
('MINISITE', 'O:9:"AJXP_Role":8:{s:12:"\0*\0groupPath";N;s:9:"\0*\0roleId";s:8:"MINISITE";s:7:"\0*\0acls";a:0:{}s:13:"\0*\0parameters";a:1:{s:19:"AJXP_REPO_SCOPE_ALL";a:1:{s:9:"core.conf";a:1:{s:17:"ROLE_DISPLAY_NAME";s:14:"Minisite Users";}}}s:10:"\0*\0actions";a:1:{s:22:"AJXP_REPO_SCOPE_SHARED";a:9:{s:9:"access.fs";a:3:{s:9:"ajxp_link";b:0;s:5:"chmod";b:0;s:5:"purge";b:0;}s:10:"meta.watch";a:1:{s:12:"toggle_watch";b:0;}s:11:"conf.serial";a:1:{s:13:"get_bookmarks";b:0;}s:8:"conf.sql";a:1:{s:13:"get_bookmarks";b:0;}s:12:"index.lucene";a:1:{s:5:"index";b:0;}s:12:"action.share";a:6:{s:5:"share";b:0;s:17:"share-edit-shared";b:0;s:22:"share-folder-workspace";b:0;s:19:"share-file-minisite";b:0;s:24:"share-selection-minisite";b:0;s:28:"share-folder-minisite-public";b:0;}s:8:"gui.ajax";a:1:{s:8:"bookmark";b:0;}s:11:"auth.serial";a:1:{s:11:"pass_change";b:0;}s:8:"auth.sql";a:1:{s:11:"pass_change";b:0;}}}s:14:"\0*\0autoApplies";a:0:{}s:8:"\0*\0masks";a:0:{}s:14:"\0*\0lastUpdated";i:0;}', 1477044205),
('MINISITE_NODOWNLOAD', 'O:9:"AJXP_Role":8:{s:12:"\0*\0groupPath";N;s:9:"\0*\0roleId";s:19:"MINISITE_NODOWNLOAD";s:7:"\0*\0acls";a:0:{}s:13:"\0*\0parameters";a:1:{s:19:"AJXP_REPO_SCOPE_ALL";a:1:{s:9:"core.conf";a:1:{s:17:"ROLE_DISPLAY_NAME";s:28:"Minisite Users - No Download";}}}s:10:"\0*\0actions";a:1:{s:22:"AJXP_REPO_SCOPE_SHARED";a:1:{s:9:"access.fs";a:4:{s:8:"download";b:0;s:14:"download_chunk";b:0;s:16:"prepare_chunk_dl";b:0;s:12:"download_all";b:0;}}}s:14:"\0*\0autoApplies";a:0:{}s:8:"\0*\0masks";a:0:{}s:14:"\0*\0lastUpdated";i:0;}', 1477044205);

ALTER TABLE `ajxp_roles`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `last_updated` (`last_updated`);
