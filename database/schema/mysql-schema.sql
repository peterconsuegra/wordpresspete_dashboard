/*M!999999\- enable the sandbox mode */ 
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `oupdates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oupdates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_version` double(8,2) NOT NULL,
  `version` double(8,2) NOT NULL,
  `mac_script` text NOT NULL,
  `olinux_script` text NOT NULL,
  `win_script` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `pete_installers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pete_installers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `darwin` text DEFAULT NULL,
  `linux` text DEFAULT NULL,
  `windows` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `git_url` varchar(255) DEFAULT NULL,
  `git_branch` varchar(255) DEFAULT NULL,
  `development` text DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `script_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `pete_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pete_plugins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `script` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uninstall_script` text DEFAULT NULL,
  `install_script` text DEFAULT NULL,
  `update_script` text DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `win_uninstall_script` text DEFAULT NULL,
  `win_install_script` text DEFAULT NULL,
  `win_update_script` text DEFAULT NULL,
  `mac_uninstall_script` text DEFAULT NULL,
  `mac_install_script` text DEFAULT NULL,
  `mac_update_script` text DEFAULT NULL,
  `olinux_uninstall_script` text DEFAULT NULL,
  `olinux_install_script` text DEFAULT NULL,
  `olinux_update_script` text DEFAULT NULL,
  `config_file` text DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `plugin_name` varchar(255) DEFAULT NULL,
  `package_folder` varchar(255) DEFAULT NULL,
  `redirect_after_install` varchar(255) DEFAULT NULL,
  `development_script` text DEFAULT NULL,
  `option_name` varchar(255) DEFAULT NULL,
  `supported_os` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `pete_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pete_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `os` varchar(255) DEFAULT NULL,
  `os_distribution` varchar(255) DEFAULT NULL,
  `os_version` varchar(255) DEFAULT NULL,
  `installs` int(11) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `contact_me_again` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_actionscheduler_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_actions` (
  `action_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hook` varchar(191) NOT NULL,
  `status` varchar(20) NOT NULL,
  `scheduled_date_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime DEFAULT '0000-00-00 00:00:00',
  `args` varchar(191) DEFAULT NULL,
  `schedule` longtext DEFAULT NULL,
  `group_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `last_attempt_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `extended_args` varchar(8000) DEFAULT NULL,
  `priority` tinyint(3) unsigned NOT NULL DEFAULT 10,
  PRIMARY KEY (`action_id`),
  KEY `hook` (`hook`),
  KEY `status` (`status`),
  KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  KEY `args` (`args`),
  KEY `group_id` (`group_id`),
  KEY `last_attempt_gmt` (`last_attempt_gmt`),
  KEY `claim_id` (`claim_id`),
  KEY `claim_id_status_scheduled_date_gmt` (`claim_id`,`status`,`scheduled_date_gmt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_actionscheduler_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_claims` (
  `claim_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`claim_id`),
  KEY `date_created_gmt` (`date_created_gmt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_actionscheduler_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_groups` (
  `group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `slug` (`slug`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_actionscheduler_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_logs` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action_id` bigint(20) unsigned NOT NULL,
  `message` text NOT NULL,
  `log_date_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`log_id`),
  KEY `action_id` (`action_id`),
  KEY `log_date_gmt` (`log_date_gmt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_chaty_contact_form_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_chaty_contact_form_leads` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `widget_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `message` text NOT NULL,
  `ref_page` text NOT NULL,
  `ip_address` varchar(30) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT 0,
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10)),
  KEY `woo_idx_comment_type` (`comment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_et_divi_ab_testing_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_et_divi_ab_testing_stats` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `test_id` varchar(20) NOT NULL,
  `subject_id` varchar(20) NOT NULL,
  `record_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `event` varchar(10) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_et_social_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_et_social_stats` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `sharing_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `network` varchar(20) NOT NULL,
  `action` varchar(10) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `media_url` varchar(2083) NOT NULL,
  `location` varchar(20) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_global_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_global_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(255) DEFAULT NULL,
  `option_value` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_icl_cms_nav_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_icl_cms_nav_cache` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cache_key` varchar(128) NOT NULL,
  `type` varchar(128) NOT NULL,
  `data` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_icl_content_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_icl_content_status` (
  `rid` bigint(20) NOT NULL,
  `nid` bigint(20) NOT NULL,
  `timestamp` datetime NOT NULL,
  `md5` varchar(32) NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_icl_core_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_icl_core_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) NOT NULL,
  `module` varchar(16) NOT NULL,
  `origin` varchar(64) NOT NULL,
  `target` varchar(64) NOT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_icl_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_icl_flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_code` varchar(10) NOT NULL,
  `flag` varchar(32) NOT NULL,
  `from_template` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lang_code` (`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_icl_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_icl_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(7) NOT NULL,
  `english_name` varchar(128) NOT NULL,
  `major` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL,
  `default_locale` varchar(35) DEFAULT NULL,
  `tag` varchar(35) DEFAULT NULL,
  `encode_url` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `english_name` (`english_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_icl_languages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_icl_languages_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_code` varchar(7) NOT NULL,
  `display_language_code` varchar(7) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `language_code` (`language_code`,`display_language_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_icl_locale_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_icl_locale_map` (
  `code` varchar(7) NOT NULL,
  `locale` varchar(35) NOT NULL,
  UNIQUE KEY `code` (`code`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_icl_message_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_icl_message_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) unsigned NOT NULL,
  `object_id` bigint(20) unsigned NOT NULL,
  `from_language` varchar(10) NOT NULL,
  `to_language` varchar(10) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `md5` varchar(32) NOT NULL,
  `object_type` varchar(64) NOT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rid` (`rid`),
  KEY `object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_icl_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_icl_node` (
  `nid` bigint(20) NOT NULL,
  `md5` varchar(32) NOT NULL,
  `links_fixed` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_icl_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_icl_reminders` (
  `id` bigint(20) NOT NULL,
  `message` text NOT NULL,
  `url` text NOT NULL,
  `can_delete` tinyint(4) NOT NULL,
  `show` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_icl_string_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_icl_string_packages` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kind_slug` varchar(160) NOT NULL,
  `kind` varchar(160) NOT NULL,
  `name` varchar(160) NOT NULL,
  `title` varchar(160) NOT NULL,
  `edit_link` text NOT NULL,
  `view_link` text NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_icl_string_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_icl_string_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `string_id` bigint(20) NOT NULL,
  `url_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `string_to_url_id` (`url_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_icl_string_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_icl_string_positions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `string_id` bigint(20) NOT NULL,
  `kind` tinyint(4) DEFAULT NULL,
  `position_in_page` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `string_id` (`string_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_icl_string_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_icl_string_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) NOT NULL,
  `string_translation_id` bigint(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `md5` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `string_translation_id` (`string_translation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_icl_string_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_icl_string_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `string_id` bigint(20) unsigned NOT NULL,
  `language` varchar(10) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `value` text DEFAULT NULL,
  `translator_id` bigint(20) unsigned DEFAULT NULL,
  `translation_service` varchar(16) NOT NULL DEFAULT '',
  `batch_id` int(11) NOT NULL DEFAULT 0,
  `translation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `string_language` (`string_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_icl_string_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_icl_string_urls` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(7) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `string_string_lang_url` (`language`,`url`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_icl_strings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_icl_strings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(7) NOT NULL,
  `context` varchar(160) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name` varchar(160) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `value` text NOT NULL,
  `string_package_id` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(40) NOT NULL DEFAULT 'LINE',
  `title` varchar(160) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `gettext_context` text NOT NULL,
  `domain_name_context_md5` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_domain_name_context_md5` (`domain_name_context_md5`),
  KEY `language_context` (`language`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_icl_translate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_icl_translate` (
  `tid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) unsigned NOT NULL,
  `content_id` bigint(20) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `field_type` varchar(160) NOT NULL,
  `field_format` varchar(16) NOT NULL,
  `field_translate` tinyint(4) NOT NULL,
  `field_data` longtext NOT NULL,
  `field_data_translated` longtext NOT NULL,
  `field_finished` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`tid`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_icl_translate_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_icl_translate_job` (
  `job_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) unsigned NOT NULL,
  `translator_id` int(10) unsigned NOT NULL,
  `translated` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `manager_id` int(10) unsigned NOT NULL,
  `revision` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`job_id`),
  KEY `rid` (`rid`,`translator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_icl_translation_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_icl_translation_batches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_name` text NOT NULL,
  `tp_id` int(11) DEFAULT NULL,
  `ts_url` text DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_icl_translation_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_icl_translation_status` (
  `rid` bigint(20) NOT NULL AUTO_INCREMENT,
  `translation_id` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `translator_id` bigint(20) NOT NULL,
  `needs_update` tinyint(4) NOT NULL,
  `md5` varchar(32) NOT NULL,
  `translation_service` varchar(16) NOT NULL,
  `batch_id` int(11) NOT NULL DEFAULT 0,
  `translation_package` longtext NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `links_fixed` tinyint(4) NOT NULL DEFAULT 0,
  `_prevstate` longtext DEFAULT NULL,
  PRIMARY KEY (`rid`),
  UNIQUE KEY `translation_id` (`translation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_icl_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_icl_translations` (
  `translation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `element_type` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post_post',
  `element_id` bigint(20) DEFAULT NULL,
  `trid` bigint(20) NOT NULL,
  `language_code` varchar(7) NOT NULL,
  `source_language_code` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`translation_id`),
  UNIQUE KEY `trid_lang` (`trid`,`language_code`),
  UNIQUE KEY `el_type_id` (`element_type`,`element_id`),
  KEY `trid` (`trid`),
  KEY `id_type_language` (`element_id`,`element_type`,`language_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_login_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_login_redirects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rul_type` varchar(100) NOT NULL,
  `rul_value` varchar(191) DEFAULT NULL,
  `rul_url` longtext DEFAULT NULL,
  `rul_url_logout` longtext DEFAULT NULL,
  `rul_order` int(2) NOT NULL DEFAULT 0,
  `meta_data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_oanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_oanswers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(255) DEFAULT NULL,
  `oticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `body` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_otickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_otickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `summary` varchar(255) DEFAULT NULL,
  `regarding` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `body` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `opened_by` datetime DEFAULT NULL,
  `updated_by` datetime DEFAULT NULL,
  `opened_by_login` varchar(255) DEFAULT NULL,
  `updated_by_login` varchar(255) DEFAULT NULL,
  `ticket_id` varchar(255) DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `closed_at_login` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_pete_oupdates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_pete_oupdates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `branch` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_pete_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_pete_plugins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `script` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_pete_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_pete_sites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL,
  `key` text NOT NULL,
  `user_email` text NOT NULL,
  `api_key` text NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `validated` tinyint(1) DEFAULT NULL,
  `token` text DEFAULT NULL,
  `created_at_string` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_plugins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` varchar(255) DEFAULT NULL,
  `supported_os` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_post_smtp_logmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_post_smtp_logmeta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `log_id` bigint(20) NOT NULL,
  `meta_key` longtext DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_post_smtp_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_post_smtp_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `solution` longtext DEFAULT NULL,
  `success` longtext DEFAULT NULL,
  `from_header` longtext DEFAULT NULL,
  `to_header` longtext DEFAULT NULL,
  `cc_header` longtext DEFAULT NULL,
  `bcc_header` longtext DEFAULT NULL,
  `reply_to_header` longtext DEFAULT NULL,
  `transport_uri` longtext DEFAULT NULL,
  `original_to` longtext DEFAULT NULL,
  `original_subject` longtext DEFAULT NULL,
  `original_message` longtext DEFAULT NULL,
  `original_headers` longtext DEFAULT NULL,
  `session_transcript` longtext DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(255) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) NOT NULL DEFAULT '',
  `api_key` text DEFAULT NULL,
  `last_subscription_id` int(11) DEFAULT NULL,
  `remember_token` text NOT NULL,
  `updated_at` text NOT NULL,
  `validated` tinyint(1) NOT NULL,
  `dashboard_lang` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wc_admin_note_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_admin_note_actions` (
  `action_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `note_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  `status` varchar(255) NOT NULL,
  `actioned_text` varchar(255) NOT NULL,
  `nonce_action` varchar(255) DEFAULT NULL,
  `nonce_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  KEY `note_id` (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wc_admin_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_admin_notes` (
  `note_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `locale` varchar(20) NOT NULL,
  `title` longtext NOT NULL,
  `content` longtext NOT NULL,
  `content_data` longtext DEFAULT NULL,
  `status` varchar(200) NOT NULL,
  `source` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_reminder` datetime DEFAULT NULL,
  `is_snoozable` tinyint(1) NOT NULL DEFAULT 0,
  `layout` varchar(20) NOT NULL DEFAULT '',
  `image` varchar(200) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `icon` varchar(200) NOT NULL DEFAULT 'info',
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wc_category_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_category_lookup` (
  `category_tree_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`category_tree_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wc_customer_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_customer_lookup` (
  `customer_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `username` varchar(60) NOT NULL DEFAULT '',
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date_last_active` timestamp NULL DEFAULT NULL,
  `date_registered` timestamp NULL DEFAULT NULL,
  `country` char(2) NOT NULL DEFAULT '',
  `postcode` varchar(20) NOT NULL DEFAULT '',
  `city` varchar(100) NOT NULL DEFAULT '',
  `state` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wc_download_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_download_log` (
  `download_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `permission_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `user_ip_address` varchar(100) DEFAULT '',
  PRIMARY KEY (`download_log_id`),
  KEY `permission_id` (`permission_id`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wc_order_coupon_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_order_coupon_lookup` (
  `order_id` bigint(20) unsigned NOT NULL,
  `coupon_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `discount_amount` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`order_id`,`coupon_id`),
  KEY `coupon_id` (`coupon_id`),
  KEY `date_created` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wc_order_product_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_order_product_lookup` (
  `order_item_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `variation_id` bigint(20) unsigned NOT NULL,
  `customer_id` bigint(20) unsigned DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_qty` int(11) NOT NULL,
  `product_net_revenue` double NOT NULL DEFAULT 0,
  `product_gross_revenue` double NOT NULL DEFAULT 0,
  `coupon_amount` double NOT NULL DEFAULT 0,
  `tax_amount` double NOT NULL DEFAULT 0,
  `shipping_amount` double NOT NULL DEFAULT 0,
  `shipping_tax_amount` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `customer_id` (`customer_id`),
  KEY `date_created` (`date_created`),
  KEY `customer_product_date` (`customer_id`,`product_id`,`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wc_order_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_order_stats` (
  `order_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `num_items_sold` int(11) NOT NULL DEFAULT 0,
  `total_sales` double NOT NULL DEFAULT 0,
  `tax_total` double NOT NULL DEFAULT 0,
  `shipping_total` double NOT NULL DEFAULT 0,
  `net_total` double NOT NULL DEFAULT 0,
  `returning_customer` tinyint(1) DEFAULT NULL,
  `status` varchar(200) NOT NULL,
  `customer_id` bigint(20) unsigned NOT NULL,
  `date_paid` datetime DEFAULT '0000-00-00 00:00:00',
  `date_completed` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`),
  KEY `date_created` (`date_created`),
  KEY `customer_id` (`customer_id`),
  KEY `status` (`status`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wc_order_tax_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_order_tax_lookup` (
  `order_id` bigint(20) unsigned NOT NULL,
  `tax_rate_id` bigint(20) unsigned NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shipping_tax` double NOT NULL DEFAULT 0,
  `order_tax` double NOT NULL DEFAULT 0,
  `total_tax` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`order_id`,`tax_rate_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `date_created` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wc_product_attributes_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_product_attributes_lookup` (
  `product_id` bigint(20) NOT NULL,
  `product_or_parent_id` bigint(20) NOT NULL,
  `taxonomy` varchar(32) NOT NULL,
  `term_id` bigint(20) NOT NULL,
  `is_variation_attribute` tinyint(1) NOT NULL,
  `in_stock` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_or_parent_id`,`term_id`,`product_id`,`taxonomy`),
  KEY `is_variation_attribute_term_id` (`is_variation_attribute`,`term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wc_product_download_directories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_product_download_directories` (
  `url_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(256) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`url_id`),
  KEY `url` (`url`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wc_product_meta_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_product_meta_lookup` (
  `product_id` bigint(20) NOT NULL,
  `sku` varchar(100) DEFAULT '',
  `virtual` tinyint(1) DEFAULT 0,
  `downloadable` tinyint(1) DEFAULT 0,
  `min_price` decimal(19,4) DEFAULT NULL,
  `max_price` decimal(19,4) DEFAULT NULL,
  `onsale` tinyint(1) DEFAULT 0,
  `stock_quantity` double DEFAULT NULL,
  `stock_status` varchar(100) DEFAULT 'instock',
  `rating_count` bigint(20) DEFAULT 0,
  `average_rating` decimal(3,2) DEFAULT 0.00,
  `total_sales` bigint(20) DEFAULT 0,
  `tax_status` varchar(100) DEFAULT 'taxable',
  `tax_class` varchar(100) DEFAULT '',
  `global_unique_id` varchar(100) DEFAULT '',
  PRIMARY KEY (`product_id`),
  KEY `virtual` (`virtual`),
  KEY `downloadable` (`downloadable`),
  KEY `stock_status` (`stock_status`),
  KEY `stock_quantity` (`stock_quantity`),
  KEY `onsale` (`onsale`),
  KEY `min_max_price` (`min_price`,`max_price`),
  KEY `sku` (`sku`(50))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wc_rate_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_rate_limits` (
  `rate_limit_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rate_limit_key` varchar(200) NOT NULL,
  `rate_limit_expiry` bigint(20) unsigned NOT NULL,
  `rate_limit_remaining` smallint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rate_limit_id`),
  UNIQUE KEY `rate_limit_key` (`rate_limit_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wc_reserved_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_reserved_stock` (
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `stock_quantity` double NOT NULL DEFAULT 0,
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expires` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wc_tax_rate_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_tax_rate_classes` (
  `tax_rate_class_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_class_id`),
  UNIQUE KEY `slug` (`slug`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wc_webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_webhooks` (
  `webhook_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(200) NOT NULL,
  `name` text NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `delivery_url` text NOT NULL,
  `secret` text NOT NULL,
  `topic` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_version` smallint(4) NOT NULL,
  `failure_count` smallint(10) NOT NULL DEFAULT 0,
  `pending_delivery` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`webhook_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfAuditEvents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfAuditEvents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  `event_time` double(14,4) NOT NULL,
  `request_id` bigint(20) unsigned NOT NULL,
  `state` enum('new','sending','sent') NOT NULL DEFAULT 'new',
  `state_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfBlockedIPLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfBlockedIPLog` (
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `countryCode` varchar(2) NOT NULL,
  `blockCount` int(10) unsigned NOT NULL DEFAULT 0,
  `unixday` int(10) unsigned NOT NULL,
  `blockType` varchar(50) NOT NULL DEFAULT 'generic',
  PRIMARY KEY (`IP`,`unixday`,`blockType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfBlocks7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfBlocks7` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL DEFAULT 0,
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `blockedTime` bigint(20) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `lastAttempt` int(10) unsigned DEFAULT 0,
  `blockedHits` int(10) unsigned DEFAULT 0,
  `expiration` bigint(20) unsigned NOT NULL DEFAULT 0,
  `parameters` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `IP` (`IP`),
  KEY `expiration` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfConfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfConfig` (
  `name` varchar(100) NOT NULL,
  `val` longblob DEFAULT NULL,
  `autoload` enum('no','yes') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfCrawlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfCrawlers` (
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `patternSig` binary(16) NOT NULL,
  `status` char(8) NOT NULL,
  `lastUpdate` int(10) unsigned NOT NULL,
  `PTR` varchar(255) DEFAULT '',
  PRIMARY KEY (`IP`,`patternSig`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfFileChanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfFileChanges` (
  `filenameHash` char(64) NOT NULL,
  `file` varchar(1000) NOT NULL,
  `md5` char(32) NOT NULL,
  PRIMARY KEY (`filenameHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfFileMods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfFileMods` (
  `filenameMD5` binary(16) NOT NULL,
  `filename` varchar(1000) NOT NULL,
  `real_path` text NOT NULL,
  `knownFile` tinyint(3) unsigned NOT NULL,
  `oldMD5` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `newMD5` binary(16) NOT NULL,
  `SHAC` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `stoppedOnSignature` varchar(255) NOT NULL DEFAULT '',
  `stoppedOnPosition` int(10) unsigned NOT NULL DEFAULT 0,
  `isSafeFile` varchar(1) NOT NULL DEFAULT '?',
  PRIMARY KEY (`filenameMD5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfHits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfHits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attackLogTime` double(17,6) unsigned NOT NULL,
  `ctime` double(17,6) unsigned NOT NULL,
  `IP` binary(16) DEFAULT NULL,
  `jsRun` tinyint(4) DEFAULT 0,
  `statusCode` int(11) NOT NULL DEFAULT 200,
  `isGoogle` tinyint(4) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `newVisit` tinyint(3) unsigned NOT NULL,
  `URL` text DEFAULT NULL,
  `referer` text DEFAULT NULL,
  `UA` text DEFAULT NULL,
  `action` varchar(64) NOT NULL DEFAULT '',
  `actionDescription` text DEFAULT NULL,
  `actionData` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `k1` (`ctime`),
  KEY `k2` (`IP`,`ctime`),
  KEY `attackLogTime` (`attackLogTime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfHoover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfHoover` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` text DEFAULT NULL,
  `host` text DEFAULT NULL,
  `path` text DEFAULT NULL,
  `hostKey` varbinary(124) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `k2` (`hostKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfIssues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfIssues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(10) unsigned NOT NULL,
  `lastUpdated` int(10) unsigned NOT NULL,
  `status` varchar(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `severity` tinyint(3) unsigned NOT NULL,
  `ignoreP` char(32) NOT NULL,
  `ignoreC` char(32) NOT NULL,
  `shortMsg` varchar(255) NOT NULL,
  `longMsg` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lastUpdated` (`lastUpdated`),
  KEY `status` (`status`),
  KEY `ignoreP` (`ignoreP`),
  KEY `ignoreC` (`ignoreC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfKnownFileList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfKnownFileList` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `path` text NOT NULL,
  `wordpress_path` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfLiveTrafficHuman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfLiveTrafficHuman` (
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `identifier` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `expiration` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IP`,`identifier`),
  KEY `expiration` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfLocs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfLocs` (
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ctime` int(10) unsigned NOT NULL,
  `failed` tinyint(3) unsigned NOT NULL,
  `city` varchar(255) DEFAULT '',
  `region` varchar(255) DEFAULT '',
  `countryName` varchar(255) DEFAULT '',
  `countryCode` char(2) DEFAULT '',
  `lat` float(10,7) DEFAULT 0.0000000,
  `lon` float(10,7) DEFAULT 0.0000000,
  PRIMARY KEY (`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfLogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfLogins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hitID` int(11) DEFAULT NULL,
  `ctime` double(17,6) unsigned NOT NULL,
  `fail` tinyint(3) unsigned NOT NULL,
  `action` varchar(40) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `IP` binary(16) DEFAULT NULL,
  `UA` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `k1` (`IP`,`fail`),
  KEY `hitID` (`hitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfNotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfNotifications` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `new` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `category` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 1000,
  `ctime` int(10) unsigned NOT NULL,
  `html` text NOT NULL,
  `links` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfPendingIssues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfPendingIssues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(10) unsigned NOT NULL,
  `lastUpdated` int(10) unsigned NOT NULL,
  `status` varchar(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `severity` tinyint(3) unsigned NOT NULL,
  `ignoreP` char(32) NOT NULL,
  `ignoreC` char(32) NOT NULL,
  `shortMsg` varchar(255) NOT NULL,
  `longMsg` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lastUpdated` (`lastUpdated`),
  KEY `status` (`status`),
  KEY `ignoreP` (`ignoreP`),
  KEY `ignoreC` (`ignoreC`),
  KEY `lastUpdated_2` (`lastUpdated`),
  KEY `status_2` (`status`),
  KEY `ignoreP_2` (`ignoreP`),
  KEY `ignoreC_2` (`ignoreC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfReverseCache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfReverseCache` (
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `host` varchar(255) NOT NULL,
  `lastUpdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfSNIPCache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfSNIPCache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IP` varchar(45) NOT NULL DEFAULT '',
  `expiration` timestamp NOT NULL DEFAULT current_timestamp(),
  `body` varchar(255) NOT NULL DEFAULT '',
  `count` int(10) unsigned NOT NULL DEFAULT 0,
  `type` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `expiration` (`expiration`),
  KEY `IP` (`IP`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfSecurityEvents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfSecurityEvents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  `event_time` double(14,4) NOT NULL,
  `state` enum('new','sending','sent') NOT NULL DEFAULT 'new',
  `state_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfStatus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` double(17,6) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `type` char(5) NOT NULL,
  `msg` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `k1` (`ctime`),
  KEY `k2` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfTrafficRates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfTrafficRates` (
  `eMin` int(10) unsigned NOT NULL,
  `IP` binary(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `hitType` enum('hit','404') NOT NULL DEFAULT 'hit',
  `hits` int(10) unsigned NOT NULL,
  PRIMARY KEY (`eMin`,`IP`,`hitType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfWafFailures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfWafFailures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `throwable` text NOT NULL,
  `rule_id` int(10) unsigned DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfls_2fa_secrets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfls_2fa_secrets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `secret` tinyblob NOT NULL,
  `recovery` blob NOT NULL,
  `ctime` int(10) unsigned NOT NULL,
  `vtime` int(10) unsigned NOT NULL,
  `mode` enum('authenticator') NOT NULL DEFAULT 'authenticator',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfls_role_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfls_role_counts` (
  `serialized_roles` varbinary(255) NOT NULL,
  `two_factor_inactive` tinyint(1) NOT NULL,
  `user_count` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`serialized_roles`,`two_factor_inactive`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wfls_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wfls_settings` (
  `name` varchar(191) NOT NULL DEFAULT '',
  `value` longblob DEFAULT NULL,
  `autoload` enum('no','yes') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_woocommerce_api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_api_keys` (
  `key_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `permissions` varchar(10) NOT NULL,
  `consumer_key` char(64) NOT NULL,
  `consumer_secret` char(43) NOT NULL,
  `nonces` longtext DEFAULT NULL,
  `truncated_key` char(7) NOT NULL,
  `last_access` datetime DEFAULT NULL,
  PRIMARY KEY (`key_id`),
  KEY `consumer_key` (`consumer_key`),
  KEY `consumer_secret` (`consumer_secret`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_woocommerce_attribute_taxonomies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(200) NOT NULL,
  `attribute_label` varchar(200) DEFAULT NULL,
  `attribute_type` varchar(20) NOT NULL,
  `attribute_orderby` varchar(20) NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`attribute_id`),
  KEY `attribute_name` (`attribute_name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_woocommerce_downloadable_product_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `download_id` varchar(36) NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `order_key` varchar(200) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `downloads_remaining` varchar(9) DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`permission_id`),
  KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(191),`download_id`),
  KEY `download_order_product` (`download_id`,`order_id`,`product_id`),
  KEY `order_id` (`order_id`),
  KEY `user_order_remaining_expires` (`user_id`,`order_id`,`downloads_remaining`,`access_expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_woocommerce_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_log` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `level` smallint(4) NOT NULL,
  `source` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `context` longtext DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_woocommerce_order_itemmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_item_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `order_item_id` (`order_item_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_woocommerce_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_order_items` (
  `order_item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_item_name` longtext NOT NULL,
  `order_item_type` varchar(200) NOT NULL DEFAULT '',
  `order_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_woocommerce_payment_tokenmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_payment_tokenmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_token_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `payment_token_id` (`payment_token_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_woocommerce_payment_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_payment_tokens` (
  `token_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gateway_id` varchar(200) NOT NULL,
  `token` text NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `type` varchar(200) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`token_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_woocommerce_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_sessions` (
  `session_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `session_key` char(32) NOT NULL,
  `session_value` longtext NOT NULL,
  `session_expiry` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`session_id`),
  UNIQUE KEY `session_key` (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_woocommerce_shipping_zone_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_shipping_zone_locations` (
  `location_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zone_id` bigint(20) unsigned NOT NULL,
  `location_code` varchar(200) NOT NULL,
  `location_type` varchar(40) NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `location_id` (`location_id`),
  KEY `location_type` (`location_type`),
  KEY `location_type_code` (`location_type`,`location_code`(90)),
  KEY `zone_id` (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_woocommerce_shipping_zone_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_shipping_zone_methods` (
  `zone_id` bigint(20) unsigned NOT NULL,
  `instance_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `method_id` varchar(200) NOT NULL,
  `method_order` bigint(20) unsigned NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_woocommerce_shipping_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_shipping_zones` (
  `zone_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(200) NOT NULL,
  `zone_order` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_woocommerce_tax_rate_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_code` varchar(200) NOT NULL,
  `tax_rate_id` bigint(20) unsigned NOT NULL,
  `location_type` varchar(40) NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `location_type` (`location_type`),
  KEY `location_type_code` (`location_type`,`location_code`(90))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_woocommerce_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tax_rate_country` varchar(2) NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) NOT NULL DEFAULT '',
  `tax_rate` varchar(8) NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) unsigned NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT 0,
  `tax_rate_shipping` int(1) NOT NULL DEFAULT 1,
  `tax_rate_order` bigint(20) unsigned NOT NULL,
  `tax_rate_class` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_id`),
  KEY `tax_rate_country` (`tax_rate_country`),
  KEY `tax_rate_state` (`tax_rate_state`(191)),
  KEY `tax_rate_class` (`tax_rate_class`(191)),
  KEY `tax_rate_priority` (`tax_rate_priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wpforms_payment_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wpforms_payment_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payment_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_id` (`payment_id`),
  KEY `meta_key` (`meta_key`(191)),
  KEY `meta_value` (`meta_value`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wpforms_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wpforms_payments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `form_id` bigint(20) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT '',
  `subtotal_amount` decimal(26,8) NOT NULL DEFAULT 0.00000000,
  `discount_amount` decimal(26,8) NOT NULL DEFAULT 0.00000000,
  `total_amount` decimal(26,8) NOT NULL DEFAULT 0.00000000,
  `currency` varchar(3) NOT NULL DEFAULT '',
  `entry_id` bigint(20) NOT NULL DEFAULT 0,
  `gateway` varchar(20) NOT NULL DEFAULT '',
  `type` varchar(12) NOT NULL DEFAULT '',
  `mode` varchar(4) NOT NULL DEFAULT '',
  `transaction_id` varchar(40) NOT NULL DEFAULT '',
  `customer_id` varchar(40) NOT NULL DEFAULT '',
  `subscription_id` varchar(40) NOT NULL DEFAULT '',
  `subscription_status` varchar(10) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `date_created_gmt` datetime NOT NULL,
  `date_updated_gmt` datetime NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `status` (`status`(8)),
  KEY `total_amount` (`total_amount`),
  KEY `type` (`type`(8)),
  KEY `transaction_id` (`transaction_id`(32)),
  KEY `customer_id` (`customer_id`(32)),
  KEY `subscription_id` (`subscription_id`(32)),
  KEY `subscription_status` (`subscription_status`(8)),
  KEY `title` (`title`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wpforms_tasks_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wpforms_tasks_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `data` longtext NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wpmailsmtp_debug_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wpmailsmtp_debug_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` text DEFAULT NULL,
  `initiator` text DEFAULT NULL,
  `event_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_wpmailsmtp_tasks_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wpmailsmtp_tasks_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `data` longtext NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_yoast_indexable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_yoast_indexable` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `permalink` longtext DEFAULT NULL,
  `permalink_hash` varchar(40) DEFAULT NULL,
  `object_id` bigint(20) DEFAULT NULL,
  `object_type` varchar(32) NOT NULL,
  `object_sub_type` varchar(32) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `post_parent` bigint(20) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `breadcrumb_title` text DEFAULT NULL,
  `post_status` varchar(20) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `is_protected` tinyint(1) DEFAULT 0,
  `has_public_posts` tinyint(1) DEFAULT NULL,
  `number_of_pages` int(11) unsigned DEFAULT NULL,
  `canonical` longtext DEFAULT NULL,
  `primary_focus_keyword` varchar(191) DEFAULT NULL,
  `primary_focus_keyword_score` int(3) DEFAULT NULL,
  `readability_score` int(3) DEFAULT NULL,
  `is_cornerstone` tinyint(1) DEFAULT 0,
  `is_robots_noindex` tinyint(1) DEFAULT 0,
  `is_robots_nofollow` tinyint(1) DEFAULT 0,
  `is_robots_noarchive` tinyint(1) DEFAULT 0,
  `is_robots_noimageindex` tinyint(1) DEFAULT 0,
  `is_robots_nosnippet` tinyint(1) DEFAULT 0,
  `twitter_title` text DEFAULT NULL,
  `twitter_image` longtext DEFAULT NULL,
  `twitter_description` longtext DEFAULT NULL,
  `twitter_image_id` varchar(191) DEFAULT NULL,
  `twitter_image_source` text DEFAULT NULL,
  `open_graph_title` text DEFAULT NULL,
  `open_graph_description` longtext DEFAULT NULL,
  `open_graph_image` longtext DEFAULT NULL,
  `open_graph_image_id` varchar(191) DEFAULT NULL,
  `open_graph_image_source` text DEFAULT NULL,
  `open_graph_image_meta` mediumtext DEFAULT NULL,
  `link_count` int(11) DEFAULT NULL,
  `incoming_link_count` int(11) DEFAULT NULL,
  `prominent_words_version` int(11) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `blog_id` bigint(20) NOT NULL DEFAULT 1,
  `language` varchar(32) DEFAULT NULL,
  `region` varchar(32) DEFAULT NULL,
  `schema_page_type` varchar(64) DEFAULT NULL,
  `schema_article_type` varchar(64) DEFAULT NULL,
  `has_ancestors` tinyint(1) DEFAULT 0,
  `estimated_reading_time_minutes` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT 1,
  `object_last_modified` datetime DEFAULT NULL,
  `object_published_at` datetime DEFAULT NULL,
  `inclusive_language_score` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_type_and_sub_type` (`object_type`,`object_sub_type`),
  KEY `object_id_and_type` (`object_id`,`object_type`),
  KEY `permalink_hash_and_object_type` (`permalink_hash`,`object_type`),
  KEY `subpages` (`post_parent`,`object_type`,`post_status`,`object_id`),
  KEY `prominent_words` (`prominent_words_version`,`object_type`,`object_sub_type`,`post_status`),
  KEY `published_sitemap_index` (`object_published_at`,`is_robots_noindex`,`object_type`,`object_sub_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_yoast_indexable_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_yoast_indexable_hierarchy` (
  `indexable_id` int(11) unsigned NOT NULL,
  `ancestor_id` int(11) unsigned NOT NULL,
  `depth` int(11) unsigned DEFAULT NULL,
  `blog_id` bigint(20) NOT NULL DEFAULT 1,
  PRIMARY KEY (`indexable_id`,`ancestor_id`),
  KEY `indexable_id` (`indexable_id`),
  KEY `ancestor_id` (`ancestor_id`),
  KEY `depth` (`depth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_yoast_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_yoast_migrations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wp_yoast_migrations_version` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_yoast_primary_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_yoast_primary_term` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) DEFAULT NULL,
  `term_id` bigint(20) DEFAULT NULL,
  `taxonomy` varchar(32) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `blog_id` bigint(20) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `post_taxonomy` (`post_id`,`taxonomy`),
  KEY `post_term` (`post_id`,`term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_yoast_prominent_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_yoast_prominent_words` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `stem` varchar(191) DEFAULT NULL,
  `indexable_id` int(11) unsigned DEFAULT NULL,
  `weight` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stem` (`stem`),
  KEY `indexable_id` (`indexable_id`),
  KEY `indexable_id_and_stem` (`indexable_id`,`stem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_yoast_seo_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_yoast_seo_links` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL,
  `target_post_id` bigint(20) unsigned NOT NULL,
  `type` varchar(8) NOT NULL,
  `indexable_id` int(11) unsigned DEFAULT NULL,
  `target_indexable_id` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `width` int(11) unsigned DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `language` varchar(32) DEFAULT NULL,
  `region` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `link_direction` (`post_id`,`type`),
  KEY `indexable_link_direction` (`indexable_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `wp_yoast_seo_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_yoast_seo_meta` (
  `object_id` bigint(20) unsigned NOT NULL,
  `internal_link_count` int(10) unsigned DEFAULT NULL,
  `incoming_link_count` int(10) unsigned DEFAULT NULL,
  UNIQUE KEY `object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

/*M!999999\- enable the sandbox mode */ 
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2014_10_12_000000_create_users_table',1);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2014_10_12_100000_create_password_resets_table',1);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2017_01_08_170728_create_sites_table',2);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2017_01_08_171802_add_user_id_to_sites',3);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2017_05_07_150730_add_key_to_sites',4);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2017_05_13_163335_add_user_keys_to_sites',4);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2017_06_18_135430_create_oupdates_table',4);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2017_06_18_192711_add_branch_to_oupdates',4);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2018_07_02_164251_add_subscription_id_to_sites',5);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2018_07_02_174134_add_product_id_to_sites',6);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2018_07_02_224128_add_remember_token_to_users',7);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2018_07_02_224253_add_remember_updated_at_to_users',8);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2018_07_02_231518_add_validated_to_sites',9);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2018_07_02_232022_add_validated_to_sites2',10);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2018_07_11_221113_add_token_to_sites',11);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2018_07_11_234230_add_created_at_string',11);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2018_07_12_130733_add_tickets_table',12);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2018_07_12_130742_add_answers_table',12);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2018_07_12_193840_add_open_and_closed_by_to_otickets',12);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2018_07_12_194230_add_fiedls_to_tickets',12);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2018_07_13_235038_add_closed_fields_to_o_otickets',12);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2018_07_17_114626_create_wpglobaloptions_table',12);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2018_07_19_191315_add_dashboard_lang_to_wp_users',13);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2020_05_18_033517_create_pete_plugins',14);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2020_05_18_034923_create_peteplugins_table',14);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2020_05_19_125552_add_aditional_fields_to_plugins',14);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2020_05_22_130515_add_os_scripts_fields',14);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2020_06_12_131528_create_oupdates_table',14);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2020_07_27_103627_add_config_file_to_pete_plugins',14);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2020_07_27_124829_add_icon_to_pete_plugins',14);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2020_07_28_135041_add_plugin_name_to_plugins',14);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2020_07_28_182437_add_package_folder_to_pete_plugins',14);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2020_08_17_133022_create_wp_plugins_table',14);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2020_08_17_153959_add_version_to_wp_plugins',14);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2020_08_18_011644_add_redirect_after_install',14);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2020_08_28_163647_create_ads_table',15);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2020_08_30_144655_add_development_script_in_pete_plugins',15);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2020_09_01_002134_add_option_name_to_pete_plugins',15);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2020_10_15_194911_create_peteinstallers_table',16);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2020_10_15_200852_add_git_fields_to_pete_install_table',16);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2020_10_15_202716_create_peteusers_table',16);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2020_10_15_213714_add_os_installs',16);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2020_10_15_214428_add_os_installs_last_name',16);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2020_10_23_155018_add_development_to_pete_installers',17);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2020_11_03_161112_add_supported_os',18);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2021_05_24_194820_add_contact_me_again_field',19);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2021_06_10_185850_add_url_to_pete_installers',20);
INSERT INTO `migrations` (`migration`, `batch`) VALUES ('2022_07_29_123510_add_script_name_pete_installers',21);
