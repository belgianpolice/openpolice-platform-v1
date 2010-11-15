# Sequel Pro dump
# Version 2492
# http://code.google.com/p/sequel-pro
#
# Host: 127.0.0.1 (MySQL 5.0.77)
# Database: police_default
# Generation Time: 2010-11-15 21:46:52 +0100
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table pol_banner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_banner`;

CREATE TABLE `pol_banner` (
  `bid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `type` varchar(30) NOT NULL default 'banner',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `imptotal` int(11) NOT NULL default '0',
  `impmade` int(11) NOT NULL default '0',
  `clicks` int(11) NOT NULL default '0',
  `imageurl` varchar(100) NOT NULL default '',
  `clickurl` varchar(200) NOT NULL default '',
  `date` datetime default NULL,
  `showBanner` tinyint(1) NOT NULL default '0',
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `custombannercode` text,
  `catid` int(10) unsigned NOT NULL default '0',
  `description` text NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `tags` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY  (`bid`),
  KEY `viewbanner` (`showBanner`),
  KEY `idx_banner_catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Banners from the core banner manager';



# Dump of table pol_bannerclient
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_bannerclient`;

CREATE TABLE `pol_bannerclient` (
  `cid` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `contact` varchar(255) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` time default NULL,
  `editor` varchar(50) default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Banner clients from the core banner manager';



# Dump of table pol_bannertrack
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_bannertrack`;

CREATE TABLE `pol_bannertrack` (
  `track_date` date NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_categories`;

CREATE TABLE `pol_categories` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `image` varchar(255) NOT NULL default '',
  `section` varchar(50) NOT NULL default '',
  `image_position` varchar(30) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Categories for articles and other content types';



# Dump of table pol_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_components`;

CREATE TABLE `pol_components` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '',
  `link` varchar(255) NOT NULL default '',
  `menuid` int(11) unsigned NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `admin_menu_link` varchar(255) NOT NULL default '',
  `admin_menu_alt` varchar(255) NOT NULL default '',
  `option` varchar(50) NOT NULL default '',
  `ordering` int(11) NOT NULL default '0',
  `admin_menu_img` varchar(255) NOT NULL default '',
  `iscore` tinyint(4) NOT NULL default '0',
  `params` text NOT NULL,
  `enabled` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `parent_option` (`parent`,`option`(32))
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

LOCK TABLES `pol_components` WRITE;
/*!40000 ALTER TABLE `pol_components` DISABLE KEYS */;
INSERT INTO `pol_components` (`id`,`name`,`link`,`menuid`,`parent`,`admin_menu_link`,`admin_menu_alt`,`option`,`ordering`,`admin_menu_img`,`iscore`,`params`,`enabled`)
VALUES
	(1,'Banners','',0,0,'','Banner Management','com_banners',0,'js/ThemeOffice/component.png',0,'track_impressions=0\ntrack_clicks=0\ntag_prefix=\n\n',1),
	(2,'Banners','',0,1,'option=com_banners','Active Banners','com_banners',1,'js/ThemeOffice/edit.png',0,'',1),
	(3,'Clients','',0,1,'option=com_banners&c=client','Manage Clients','com_banners',2,'js/ThemeOffice/categories.png',0,'',1),
	(4,'Web Links','option=com_weblinks',0,0,'','Manage Weblinks','com_weblinks',0,'js/ThemeOffice/component.png',0,'show_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n',1),
	(5,'Links','',0,4,'option=com_weblinks','View existing weblinks','com_weblinks',1,'js/ThemeOffice/edit.png',0,'',1),
	(6,'Categories','',0,4,'option=com_categories&section=com_weblinks','Manage weblink categories','',2,'js/ThemeOffice/categories.png',0,'',1),
	(7,'Contacts','option=com_contact',0,0,'','Edit contact details','com_contact',0,'js/ThemeOffice/component.png',1,'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n',1),
	(8,'Contacts','',0,7,'option=com_contact','Edit contact details','com_contact',0,'js/ThemeOffice/edit.png',1,'',1),
	(9,'Categories','',0,7,'option=com_categories&section=com_contact_details','Manage contact categories','',2,'js/ThemeOffice/categories.png',1,'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n',1),
	(10,'Polls','option=com_poll',0,0,'option=com_poll','Manage Polls','com_poll',0,'js/ThemeOffice/component.png',0,'',1),
	(11,'News Feeds','option=com_newsfeeds',0,0,'','News Feeds Management','com_newsfeeds',0,'js/ThemeOffice/component.png',0,'',1),
	(12,'Feeds','',0,11,'option=com_newsfeeds','Manage News Feeds','com_newsfeeds',1,'js/ThemeOffice/edit.png',0,'show_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n',1),
	(13,'Categories','',0,11,'option=com_categories&section=com_newsfeeds','Manage Categories','',2,'js/ThemeOffice/categories.png',0,'',1),
	(14,'User','option=com_user',0,0,'','','com_user',0,'',1,'',1),
	(15,'Search','option=com_search',0,0,'option=com_search','Search Statistics','com_search',0,'js/ThemeOffice/component.png',1,'enabled=0\n\n',1),
	(16,'Categories','',0,1,'option=com_categories&section=com_banner','Categories','',3,'',1,'',1),
	(17,'Wrapper','option=com_wrapper',0,0,'','Wrapper','com_wrapper',0,'',1,'',1),
	(18,'Mail To','',0,0,'','','com_mailto',0,'',1,'',1),
	(19,'Media Manager','',0,0,'option=com_media','Media Manager','com_media',0,'',1,'upload_extensions=bmp,csv,doc,epg,gif,ico,jpg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,EPG,GIF,ICO,JPG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\nupload_maxsize=10000000\nfile_path=images\nimage_path=images/stories\nrestrict_uploads=1\nallowed_media_usergroup=3\ncheck_mime=1\nimage_extensions=bmp,gif,jpg,png\nignore_extensions=\nupload_mime=image/jpeg,image/gif,image/png,image/bmp,application/x-shockwave-flash,application/msword,application/excel,application/pdf,application/powerpoint,text/plain,application/x-zip\nupload_mime_illegal=text/html\nenable_flash=0\n\n',1),
	(20,'Articles','option=com_content',0,0,'','','com_content',0,'',1,'show_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=0\n\n',1),
	(21,'Configuration Manager','',0,0,'','Configuration','com_config',0,'',1,'',1),
	(22,'Installation Manager','',0,0,'','Installer','com_installer',0,'',1,'',1),
	(23,'Language Manager','',0,0,'','Languages','com_languages',0,'',1,'site=nl-NL\nadministrator=nl-NL\n\n',1),
	(24,'Mass mail','',0,0,'','Mass Mail','com_massmail',0,'',1,'mailSubjectPrefix=\nmailBodySuffix=\n\n',1),
	(25,'Menu Editor','',0,0,'','Menu Editor','com_menus',0,'',1,'',1),
	(27,'Messaging','',0,0,'','Messages','com_messages',0,'',1,'',1),
	(28,'Modules Manager','',0,0,'','Modules','com_modules',0,'',1,'',1),
	(29,'Plugin Manager','',0,0,'','Plugins','com_plugins',0,'',1,'',1),
	(30,'Template Manager','',0,0,'','Templates','com_templates',0,'',1,'',1),
	(31,'User Manager','',0,0,'','Users','com_users',0,'',1,'allowUserRegistration=0\nnew_usertype=Registered\nuseractivation=0\nfrontend_userparams=0\n\n',1),
	(32,'Cache Manager','',0,0,'','Cache','com_cache',0,'',1,'',1),
	(33,'Control Panel','',0,0,'','Control Panel','com_cpanel',0,'',1,'',1),
	(35,'Phoca Gallery','option=com_phocagallery',0,0,'option=com_phocagallery','Phoca Gallery','com_phocagallery',0,'components/com_phocagallery/assets/images/icon-16-pg-menu.png',0,'',1),
	(36,'Control Panel','',0,35,'option=com_phocagallery','Control Panel','com_phocagallery',0,'components/com_phocagallery/assets/images/icon-16-pg-control-panel.png',0,'',1),
	(37,'Images','',0,35,'option=com_phocagallery&view=phocagallerys','Images','com_phocagallery',1,'components/com_phocagallery/assets/images/icon-16-pg-menu-gal.png',0,'',1),
	(38,'Categories','',0,35,'option=com_phocagallery&view=phocagallerycs','Categories','com_phocagallery',2,'components/com_phocagallery/assets/images/icon-16-pg-menu-cat.png',0,'',1),
	(39,'Themes','',0,35,'option=com_phocagallery&view=phocagalleryt','Themes','com_phocagallery',3,'components/com_phocagallery/assets/images/icon-16-pg-menu-theme.png',0,'',1),
	(40,'Category Rating','',0,35,'option=com_phocagallery&view=phocagalleryra','Category Rating','com_phocagallery',4,'components/com_phocagallery/assets/images/icon-16-pg-menu-vote.png',0,'',1),
	(41,'Image Rating','',0,35,'option=com_phocagallery&view=phocagalleryraimg','Image Rating','com_phocagallery',5,'components/com_phocagallery/assets/images/icon-16-pg-menu-vote-img.png',0,'',1),
	(42,'Category Comments','',0,35,'option=com_phocagallery&view=phocagallerycos','Category Comments','com_phocagallery',6,'components/com_phocagallery/assets/images/icon-16-pg-menu-comment.png',0,'',1),
	(43,'Image Comments','',0,35,'option=com_phocagallery&view=phocagallerycoimgs','Image Comments','com_phocagallery',7,'components/com_phocagallery/assets/images/icon-16-pg-menu-comment-img.png',0,'',1),
	(44,'Users','',0,35,'option=com_phocagallery&view=phocagalleryusers','Users','com_phocagallery',8,'components/com_phocagallery/assets/images/icon-16-pg-menu-users.png',0,'',1),
	(45,'Info','',0,35,'option=com_phocagallery&view=phocagalleryin','Info','com_phocagallery',9,'components/com_phocagallery/assets/images/icon-16-pg-menu-info.png',0,'',1),
	(46,'DOCman','option=com_docman',0,0,'option=com_docman','DOCman','com_docman',0,'components/com_docman/images/dm_logo_16.png',0,'',1),
	(47,'Home','',0,46,'option=com_docman&task=cpanel','Home','com_docman',0,'components/com_docman/images/dm_cpanel_16.png',0,'',1),
	(48,'Files','',0,46,'option=com_docman&section=files','Files','com_docman',1,'components/com_docman/images/dm_files_16.png',0,'',1),
	(49,'Documents','',0,46,'option=com_docman&section=documents','Documents','com_docman',2,'components/com_docman/images/dm_documents_16.png',0,'',1),
	(50,'Categories','',0,46,'option=com_docman&section=categories','Categories','com_docman',3,'components/com_docman/images/dm_categories_16.png',0,'',1),
	(51,'Groups','',0,46,'option=com_docman&section=groups','Groups','com_docman',4,'components/com_docman/images/dm_groups_16.png',0,'',1),
	(52,'Licenses','',0,46,'option=com_docman&section=licenses','Licenses','com_docman',5,'components/com_docman/images/dm_licenses_16.png',0,'',1),
	(53,'Statistics','',0,46,'option=com_docman&task=stats','Statistics','com_docman',6,'components/com_docman/images/dm_stats_16.png',0,'',1),
	(54,'Download Logs','',0,46,'option=com_docman&section=logs','Download Logs','com_docman',7,'components/com_docman/images/dm_logs_16.png',0,'',1),
	(55,'Configuration','',0,46,'option=com_docman&section=config','Configuration','com_docman',8,'components/com_docman/images/dm_config_16.png',0,'',1),
	(56,'Themes','',0,46,'option=com_docman&section=themes','Themes','com_docman',9,'components/com_docman/images/dm_templates_16.png',0,'',1),
	(57,'JCE','option=com_jce',0,0,'option=com_jce','JCE','com_jce',0,'components/com_jce/img/logo.png',0,'\npackage=1',1),
	(58,'JCE MENU CPANEL','',0,34,'option=com_jce','JCE MENU CPANEL','com_jce',0,'templates/khepri/images/menu/icon-16-cpanel.png',0,'',1),
	(59,'JCE MENU CONFIG','',0,34,'option=com_jce&type=config','JCE MENU CONFIG','com_jce',1,'templates/khepri/images/menu/icon-16-config.png',0,'',1),
	(60,'JCE MENU GROUPS','',0,34,'option=com_jce&type=group','JCE MENU GROUPS','com_jce',2,'templates/khepri/images/menu/icon-16-user.png',0,'',1),
	(61,'JCE MENU PLUGINS','',0,34,'option=com_jce&type=plugin','JCE MENU PLUGINS','com_jce',3,'templates/khepri/images/menu/icon-16-plugin.png',0,'',1),
	(62,'JCE MENU INSTALL','',0,34,'option=com_jce&type=install','JCE MENU INSTALL','com_jce',4,'templates/khepri/images/menu/icon-16-install.png',0,'',1),
	(84,'Nooku','option=com_nooku',0,0,'option=com_nooku','Nooku','com_nooku',0,'language',0,'primary_language=en-GB\n\n',1);

/*!40000 ALTER TABLE `pol_components` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pol_contact_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_contact_details`;

CREATE TABLE `pol_contact_details` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `con_position` varchar(255) default NULL,
  `address` text,
  `suburb` varchar(100) default NULL,
  `state` varchar(100) default NULL,
  `country` varchar(100) default NULL,
  `postcode` varchar(100) default NULL,
  `telephone` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `misc` mediumtext,
  `image` varchar(255) default NULL,
  `imagepos` varchar(20) default NULL,
  `email_to` varchar(255) default NULL,
  `default_con` tinyint(1) unsigned NOT NULL default '0',
  `published` tinyint(1) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL default '0',
  `catid` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `mobile` varchar(255) NOT NULL default '',
  `webpage` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contacts from the core contact manager';



# Dump of table pol_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_content`;

CREATE TABLE `pol_content` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `title_alias` varchar(255) NOT NULL default '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL default '0',
  `sectionid` int(11) unsigned NOT NULL default '0',
  `mask` int(11) unsigned NOT NULL default '0',
  `catid` int(11) unsigned NOT NULL default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL default '0',
  `created_by_alias` varchar(255) NOT NULL default '',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL default '1',
  `parentid` int(11) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0',
  `metadata` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Articles';



# Dump of table pol_content_frontpage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_content_frontpage`;

CREATE TABLE `pol_content_frontpage` (
  `content_id` int(11) NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Articles displayed on the frontpage';



# Dump of table pol_content_rating
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_content_rating`;

CREATE TABLE `pol_content_rating` (
  `content_id` int(11) NOT NULL default '0',
  `rating_sum` int(11) unsigned NOT NULL default '0',
  `rating_count` int(11) unsigned NOT NULL default '0',
  `lastip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Ratings for articles';



# Dump of table pol_core_acl_aro
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_core_acl_aro`;

CREATE TABLE `pol_core_acl_aro` (
  `id` int(11) NOT NULL auto_increment,
  `section_value` varchar(240) NOT NULL default '0',
  `value` varchar(240) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `pol_section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `pol_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

LOCK TABLES `pol_core_acl_aro` WRITE;
/*!40000 ALTER TABLE `pol_core_acl_aro` DISABLE KEYS */;
INSERT INTO `pol_core_acl_aro` (`id`,`section_value`,`value`,`order_value`,`name`,`hidden`)
VALUES
	(10,'users','62',0,'Administrator',0);

/*!40000 ALTER TABLE `pol_core_acl_aro` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pol_core_acl_aro_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_core_acl_aro_groups`;

CREATE TABLE `pol_core_acl_aro_groups` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `lft` int(11) NOT NULL default '0',
  `rgt` int(11) NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `pol_gacl_parent_id_aro_groups` (`parent_id`),
  KEY `pol_gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

LOCK TABLES `pol_core_acl_aro_groups` WRITE;
/*!40000 ALTER TABLE `pol_core_acl_aro_groups` DISABLE KEYS */;
INSERT INTO `pol_core_acl_aro_groups` (`id`,`parent_id`,`name`,`lft`,`rgt`,`value`)
VALUES
	(17,0,'ROOT',1,22,'ROOT'),
	(28,17,'USERS',2,21,'USERS'),
	(29,28,'Public Frontend',3,12,'Public Frontend'),
	(18,29,'Registered',4,11,'Registered'),
	(19,18,'Author',5,10,'Author'),
	(20,19,'Editor',6,9,'Editor'),
	(21,20,'Publisher',7,8,'Publisher'),
	(30,28,'Public Backend',13,20,'Public Backend'),
	(23,30,'Manager',14,19,'Manager'),
	(24,23,'Administrator',15,18,'Administrator'),
	(25,24,'Super Administrator',16,17,'Super Administrator');

/*!40000 ALTER TABLE `pol_core_acl_aro_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pol_core_acl_aro_map
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_core_acl_aro_map`;

CREATE TABLE `pol_core_acl_aro_map` (
  `acl_id` int(11) NOT NULL default '0',
  `section_value` varchar(230) NOT NULL default '0',
  `value` varchar(100) NOT NULL,
  PRIMARY KEY  (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_core_acl_aro_sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_core_acl_aro_sections`;

CREATE TABLE `pol_core_acl_aro_sections` (
  `id` int(11) NOT NULL auto_increment,
  `value` varchar(230) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(230) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `pol_gacl_value_aro_sections` (`value`),
  KEY `pol_gacl_hidden_aro_sections` (`hidden`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

LOCK TABLES `pol_core_acl_aro_sections` WRITE;
/*!40000 ALTER TABLE `pol_core_acl_aro_sections` DISABLE KEYS */;
INSERT INTO `pol_core_acl_aro_sections` (`id`,`value`,`order_value`,`name`,`hidden`)
VALUES
	(10,'users',1,'Users',0);

/*!40000 ALTER TABLE `pol_core_acl_aro_sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pol_core_acl_groups_aro_map
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_core_acl_groups_aro_map`;

CREATE TABLE `pol_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL default '0',
  `section_value` varchar(240) NOT NULL default '',
  `aro_id` int(11) NOT NULL default '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `pol_core_acl_groups_aro_map` WRITE;
/*!40000 ALTER TABLE `pol_core_acl_groups_aro_map` DISABLE KEYS */;
INSERT INTO `pol_core_acl_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
VALUES
	(25,'',10);

/*!40000 ALTER TABLE `pol_core_acl_groups_aro_map` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pol_core_log_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_core_log_items`;

CREATE TABLE `pol_core_log_items` (
  `time_stamp` date NOT NULL default '0000-00-00',
  `item_table` varchar(50) NOT NULL default '',
  `item_id` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_core_log_searches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_core_log_searches`;

CREATE TABLE `pol_core_log_searches` (
  `search_term` varchar(128) NOT NULL default '',
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_docman
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_docman`;

CREATE TABLE `pol_docman` (
  `id` int(11) NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '1',
  `dmname` text NOT NULL,
  `dmdescription` longtext,
  `dmdate_published` datetime NOT NULL default '0000-00-00 00:00:00',
  `dmowner` int(4) NOT NULL default '-1',
  `dmfilename` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `dmurl` text,
  `dmcounter` int(11) default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `approved` tinyint(1) NOT NULL default '0',
  `dmthumbnail` text,
  `dmlastupdateon` datetime default '0000-00-00 00:00:00',
  `dmlastupdateby` int(5) NOT NULL default '-1',
  `dmsubmitedby` int(5) NOT NULL default '-1',
  `dmmantainedby` int(5) default '0',
  `dmlicense_id` int(5) default '0',
  `dmlicense_display` tinyint(1) NOT NULL default '0',
  `access` int(11) unsigned NOT NULL default '0',
  `attribs` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `pub_appr_own_cat_name` (`published`,`approved`,`dmowner`,`catid`,`dmname`(64)),
  KEY `appr_pub_own_cat_date` (`approved`,`published`,`dmowner`,`catid`,`dmdate_published`),
  KEY `own_pub_appr_cat_count` (`dmowner`,`published`,`approved`,`catid`,`dmcounter`),
  KEY `own_pub_appr_cat_id` (`dmowner`,`published`,`approved`,`catid`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_docman_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_docman_groups`;

CREATE TABLE `pol_docman_groups` (
  `groups_id` int(11) NOT NULL auto_increment,
  `groups_name` text NOT NULL,
  `groups_description` longtext,
  `groups_access` tinyint(4) NOT NULL default '1',
  `groups_members` text,
  PRIMARY KEY  (`groups_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_docman_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_docman_history`;

CREATE TABLE `pol_docman_history` (
  `id` int(11) NOT NULL auto_increment,
  `doc_id` int(11) NOT NULL,
  `revision` int(5) NOT NULL default '1',
  `his_date` datetime NOT NULL,
  `his_who` int(11) NOT NULL,
  `his_obs` longtext,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_docman_licenses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_docman_licenses`;

CREATE TABLE `pol_docman_licenses` (
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `license` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_docman_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_docman_log`;

CREATE TABLE `pol_docman_log` (
  `id` int(11) NOT NULL auto_increment,
  `log_docid` int(11) NOT NULL,
  `log_ip` text NOT NULL,
  `log_datetime` datetime NOT NULL,
  `log_user` int(11) NOT NULL default '0',
  `log_browser` text,
  `log_os` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_groups`;

CREATE TABLE `pol_groups` (
  `id` tinyint(3) unsigned NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `pol_groups` WRITE;
/*!40000 ALTER TABLE `pol_groups` DISABLE KEYS */;
INSERT INTO `pol_groups` (`id`,`name`)
VALUES
	(0,'Public'),
	(1,'Registered'),
	(2,'Special');

/*!40000 ALTER TABLE `pol_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pol_jce_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_jce_groups`;

CREATE TABLE `pol_jce_groups` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `users` text NOT NULL,
  `types` varchar(255) NOT NULL,
  `components` text NOT NULL,
  `rows` text NOT NULL,
  `plugins` varchar(255) NOT NULL,
  `published` tinyint(3) NOT NULL,
  `ordering` int(11) NOT NULL,
  `checked_out` tinyint(3) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `pol_jce_groups` WRITE;
/*!40000 ALTER TABLE `pol_jce_groups` DISABLE KEYS */;
INSERT INTO `pol_jce_groups` (`id`,`name`,`description`,`users`,`types`,`components`,`rows`,`plugins`,`published`,`ordering`,`checked_out`,`checked_out_time`,`params`)
VALUES
	(1,'Default','Default group for all users with edit access','','19,20,21,23,24,25','','6,7,8,9,10,11,12,13,14,15,16,17,18,19;20,21,22,23,24,25,26,27,28,30,31,32,35,47;36,37,38,39,40,41,42,43,44,45,46;48,49,50,51,52,53,54,56,57','1,2,3,4,5,6,20,21,36,37,38,39,40,41,48,49,50,51,52,53,54,56,57',1,1,0,'0000-00-00 00:00:00',''),
	(2,'Front End','Sample Group for Authors, Editors, Publishers','','19,20,21','','6,7,8,9,10,13,14,15,16,17,18,19,27,28;20,21,25,26,30,31,35,42,43,44,46,47,49,50;24,32,38,39,41,45,48,51,52,53,54,56,57','6,20,21,49,50,1,3,5,38,39,41,48,51,52,53,54,56,57',0,2,0,'0000-00-00 00:00:00','');

/*!40000 ALTER TABLE `pol_jce_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pol_jce_plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_jce_plugins`;

CREATE TABLE `pol_jce_plugins` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `layout` varchar(255) NOT NULL,
  `row` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `published` tinyint(3) NOT NULL,
  `editable` tinyint(3) NOT NULL,
  `iscore` tinyint(3) NOT NULL,
  `elements` varchar(255) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `plugin` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

LOCK TABLES `pol_jce_plugins` WRITE;
/*!40000 ALTER TABLE `pol_jce_plugins` DISABLE KEYS */;
INSERT INTO `pol_jce_plugins` (`id`,`title`,`name`,`type`,`icon`,`layout`,`row`,`ordering`,`published`,`editable`,`iscore`,`elements`,`checked_out`,`checked_out_time`)
VALUES
	(1,'Context Menu','contextmenu','plugin','','',0,0,1,0,1,'',0,'0000-00-00 00:00:00'),
	(2,'File Browser','browser','plugin','','',0,0,1,1,1,'',0,'0000-00-00 00:00:00'),
	(3,'Inline Popups','inlinepopups','plugin','','',0,0,1,0,1,'',0,'0000-00-00 00:00:00'),
	(4,'Media Support','media','plugin','','',0,0,1,1,1,'',0,'0000-00-00 00:00:00'),
	(5,'Safari Browser Support','safari','plugin','','',0,0,1,0,1,'',0,'0000-00-00 00:00:00'),
	(6,'Help','help','plugin','help','help',1,1,1,0,1,'',0,'0000-00-00 00:00:00'),
	(7,'New Document','newdocument','command','newdocument','newdocument',1,2,1,0,1,'',0,'0000-00-00 00:00:00'),
	(8,'Bold','bold','command','bold','bold',1,3,1,0,1,'',0,'0000-00-00 00:00:00'),
	(9,'Italic','italic','command','italic','italic',1,4,1,0,1,'',0,'0000-00-00 00:00:00'),
	(10,'Underline','underline','command','underline','underline',1,5,1,0,1,'',0,'0000-00-00 00:00:00'),
	(11,'Font Select','fontselect','command','fontselect','fontselect',1,6,1,0,1,'',0,'0000-00-00 00:00:00'),
	(12,'Font Size Select','fontsizeselect','command','fontsizeselect','fontsizeselect',1,7,1,0,1,'',0,'0000-00-00 00:00:00'),
	(13,'Style Select','styleselect','command','styleselect','styleselect',1,8,1,0,1,'',0,'0000-00-00 00:00:00'),
	(14,'StrikeThrough','strikethrough','command','strikethrough','strikethrough',1,9,1,0,1,'',0,'0000-00-00 00:00:00'),
	(15,'Justify Full','full','command','justifyfull','justifyfull',1,10,1,0,1,'',0,'0000-00-00 00:00:00'),
	(16,'Justify Center','center','command','justifycenter','justifycenter',1,11,1,0,1,'',0,'0000-00-00 00:00:00'),
	(17,'Justify Left','left','command','justifyleft','justifyleft',1,12,1,0,1,'',0,'0000-00-00 00:00:00'),
	(18,'Justify Right','right','command','justifyright','justifyright',1,13,1,0,1,'',0,'0000-00-00 00:00:00'),
	(19,'Format Select','formatselect','command','formatselect','formatselect',1,14,1,0,1,'',0,'0000-00-00 00:00:00'),
	(20,'Paste','paste','plugin','cut,copy,paste','paste',2,1,1,1,1,'',0,'0000-00-00 00:00:00'),
	(21,'Search Replace','searchreplace','plugin','search,replace','searchreplace',2,2,1,0,1,'',0,'0000-00-00 00:00:00'),
	(22,'Font ForeColour','forecolor','command','forecolor','forecolor',2,3,1,0,1,'',0,'0000-00-00 00:00:00'),
	(23,'Font BackColour','backcolor','command','backcolor','backcolor',2,4,1,0,1,'',0,'0000-00-00 00:00:00'),
	(24,'Unlink','unlink','command','unlink','unlink',2,5,1,0,1,'',0,'0000-00-00 00:00:00'),
	(25,'Indent','indent','command','indent','indent',2,6,1,0,1,'',0,'0000-00-00 00:00:00'),
	(26,'Outdent','outdent','command','outdent','outdent',2,7,1,0,1,'',0,'0000-00-00 00:00:00'),
	(27,'Undo','undo','command','undo','undo',2,8,1,0,1,'',0,'0000-00-00 00:00:00'),
	(28,'Redo','redo','command','redo','redo',2,9,1,0,1,'',0,'0000-00-00 00:00:00'),
	(29,'HTML','html','command','code','code',2,10,1,0,1,'',0,'0000-00-00 00:00:00'),
	(30,'Numbered List','numlist','command','numlist','numlist',2,11,1,0,1,'',0,'0000-00-00 00:00:00'),
	(31,'Bullet List','bullist','command','bullist','bullist',2,12,1,0,1,'',0,'0000-00-00 00:00:00'),
	(32,'Anchor','anchor','command','anchor','anchor',2,13,1,0,1,'',0,'0000-00-00 00:00:00'),
	(33,'Image','image','command','image','image',2,14,1,0,1,'',0,'0000-00-00 00:00:00'),
	(34,'Link','link','command','link','link',2,15,1,0,1,'',0,'0000-00-00 00:00:00'),
	(35,'Code Cleanup','cleanup','command','cleanup','cleanup',2,16,1,0,1,'',0,'0000-00-00 00:00:00'),
	(36,'Directionality','directionality','plugin','ltr,rtl','directionality',3,1,1,0,1,'',0,'0000-00-00 00:00:00'),
	(37,'Emotions','emotions','plugin','emotions','emotions',3,2,1,0,1,'',0,'0000-00-00 00:00:00'),
	(38,'Fullscreen','fullscreen','plugin','fullscreen','fullscreen',3,3,1,0,1,'',0,'0000-00-00 00:00:00'),
	(39,'Preview','preview','plugin','preview','preview',3,4,1,0,1,'',0,'0000-00-00 00:00:00'),
	(40,'Tables','table','plugin','tablecontrols','buttons',3,5,1,0,1,'',0,'0000-00-00 00:00:00'),
	(41,'Print','print','plugin','print','print',3,6,1,0,1,'',0,'0000-00-00 00:00:00'),
	(42,'Horizontal Rule','hr','command','hr','hr',3,7,1,0,1,'',0,'0000-00-00 00:00:00'),
	(43,'Subscript','sub','command','sub','sub',3,8,1,0,1,'',0,'0000-00-00 00:00:00'),
	(44,'Superscript','sup','command','sup','sup',3,9,1,0,1,'',0,'0000-00-00 00:00:00'),
	(45,'Visual Aid','visualaid','command','visualaid','visualaid',3,10,1,0,1,'',0,'0000-00-00 00:00:00'),
	(46,'Character Map','charmap','command','charmap','charmap',3,11,1,0,1,'',0,'0000-00-00 00:00:00'),
	(47,'Remove Format','removeformat','command','removeformat','removeformat',2,1,1,0,1,'',0,'0000-00-00 00:00:00'),
	(48,'Styles','style','plugin','styleprops','style',4,1,1,0,1,'',0,'0000-00-00 00:00:00'),
	(49,'Non-Breaking','nonbreaking','plugin','nonbreaking','nonbreaking',4,2,1,0,1,'',0,'0000-00-00 00:00:00'),
	(50,'Visual Characters','visualchars','plugin','visualchars','visualchars',4,3,1,0,1,'',0,'0000-00-00 00:00:00'),
	(51,'XHTML Xtras','xhtmlxtras','plugin','cite,abbr,acronym,del,ins,attribs','xhtmlxtras',4,4,1,0,1,'',0,'0000-00-00 00:00:00'),
	(52,'Image Manager','imgmanager','plugin','imgmanager','imgmanager',4,5,1,1,1,'',0,'0000-00-00 00:00:00'),
	(53,'Advanced Link','advlink','plugin','advlink','advlink',4,6,1,1,1,'',0,'0000-00-00 00:00:00'),
	(54,'Spell Checker','spellchecker','plugin','spellchecker','spellchecker',4,7,1,1,1,'',0,'0000-00-00 00:00:00'),
	(55,'Layers','layer','plugin','insertlayer,moveforward,movebackward,absolute','layer',4,8,1,0,1,'',0,'0000-00-00 00:00:00'),
	(56,'Advanced Code Editor','advcode','plugin','advcode','advcode',4,9,1,0,1,'',0,'0000-00-00 00:00:00'),
	(57,'Article Breaks','article','plugin','readmore,pagebreak','article',4,10,1,0,1,'',0,'0000-00-00 00:00:00');

/*!40000 ALTER TABLE `pol_jce_plugins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pol_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_menu`;

CREATE TABLE `pol_menu` (
  `id` int(11) NOT NULL auto_increment,
  `menutype` varchar(75) default NULL,
  `name` varchar(255) default NULL,
  `alias` varchar(255) NOT NULL default '',
  `link` text,
  `type` varchar(50) NOT NULL default '',
  `published` tinyint(1) NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `componentid` int(11) unsigned NOT NULL default '0',
  `sublevel` int(11) default '0',
  `ordering` int(11) default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL default '0',
  `browserNav` tinyint(4) default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `utaccess` tinyint(3) unsigned NOT NULL default '0',
  `params` text NOT NULL,
  `lft` int(11) unsigned NOT NULL default '0',
  `rgt` int(11) unsigned NOT NULL default '0',
  `home` int(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Menu items';

LOCK TABLES `pol_menu` WRITE;
/*!40000 ALTER TABLE `pol_menu` DISABLE KEYS */;
INSERT INTO `pol_menu` (`id`,`menutype`,`name`,`alias`,`link`,`type`,`published`,`parent`,`componentid`,`sublevel`,`ordering`,`checked_out`,`checked_out_time`,`pollid`,`browserNav`,`access`,`utaccess`,`params`,`lft`,`rgt`,`home`)
VALUES
	(1,'mainmenu','Home','home','index.php?option=com_content&view=frontpage','component',1,0,20,0,1,0,'0000-00-00 00:00:00',0,0,0,3,'num_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=front\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,1);

/*!40000 ALTER TABLE `pol_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pol_menu_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_menu_types`;

CREATE TABLE `pol_menu_types` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `menutype` varchar(75) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `menutype` (`menutype`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `pol_menu_types` WRITE;
/*!40000 ALTER TABLE `pol_menu_types` DISABLE KEYS */;
INSERT INTO `pol_menu_types` (`id`,`menutype`,`title`,`description`)
VALUES
	(1,'mainmenu','Main Menu','The main menu for the site');

/*!40000 ALTER TABLE `pol_menu_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pol_messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_messages`;

CREATE TABLE `pol_messages` (
  `message_id` int(10) unsigned NOT NULL auto_increment,
  `user_id_from` int(10) unsigned NOT NULL default '0',
  `user_id_to` int(10) unsigned NOT NULL default '0',
  `folder_id` int(10) unsigned NOT NULL default '0',
  `date_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `state` int(11) NOT NULL default '0',
  `priority` int(1) unsigned NOT NULL default '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY  (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_messages_cfg
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_messages_cfg`;

CREATE TABLE `pol_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL default '0',
  `cfg_name` varchar(100) NOT NULL default '',
  `cfg_value` varchar(255) NOT NULL default '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_migration_backlinks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_migration_backlinks`;

CREATE TABLE `pol_migration_backlinks` (
  `itemid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` text NOT NULL,
  `sefurl` text NOT NULL,
  `newurl` text NOT NULL,
  PRIMARY KEY  (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_modules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_modules`;

CREATE TABLE `pol_modules` (
  `id` int(11) NOT NULL auto_increment,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL default '0',
  `position` varchar(50) default NULL,
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `module` varchar(50) default NULL,
  `numnews` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `showtitle` tinyint(3) unsigned NOT NULL default '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  `control` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='Modules';

LOCK TABLES `pol_modules` WRITE;
/*!40000 ALTER TABLE `pol_modules` DISABLE KEYS */;
INSERT INTO `pol_modules` (`id`,`title`,`content`,`ordering`,`position`,`checked_out`,`checked_out_time`,`published`,`module`,`numnews`,`access`,`showtitle`,`params`,`iscore`,`client_id`,`control`)
VALUES
	(1,'Main Menu','',1,'left',0,'0000-00-00 00:00:00',1,'mod_mainmenu',0,0,1,'menutype=mainmenu\nmoduleclass_sfx=_menu\n',1,0,''),
	(2,'Login','',1,'login',0,'0000-00-00 00:00:00',1,'mod_login',0,0,1,'',1,1,''),
	(3,'Popular','',3,'cpanel',0,'0000-00-00 00:00:00',1,'mod_popular',0,2,1,'',0,1,''),
	(4,'Recent added Articles','',4,'cpanel',0,'0000-00-00 00:00:00',1,'mod_latest',0,2,1,'ordering=c_dsc\nuser_id=0\ncache=0\n\n',0,1,''),
	(5,'Menu Stats','',5,'cpanel',0,'0000-00-00 00:00:00',1,'mod_stats',0,2,1,'',0,1,''),
	(6,'Unread Messages','',1,'header',0,'0000-00-00 00:00:00',1,'mod_unread',0,2,1,'',1,1,''),
	(7,'Online Users','',2,'header',0,'0000-00-00 00:00:00',1,'mod_online',0,2,1,'',1,1,''),
	(8,'Toolbar','',1,'toolbar',0,'0000-00-00 00:00:00',1,'mod_toolbar',0,2,1,'',1,1,''),
	(9,'Quick Icons','',1,'icon',0,'0000-00-00 00:00:00',1,'mod_quickicon',0,2,1,'',1,1,''),
	(10,'Logged in Users','',2,'cpanel',0,'0000-00-00 00:00:00',1,'mod_logged',0,2,1,'',0,1,''),
	(11,'Footer','',0,'footer',0,'0000-00-00 00:00:00',1,'mod_footer',0,0,1,'',1,1,''),
	(12,'Admin Menu','',1,'menu',0,'0000-00-00 00:00:00',1,'mod_menu',0,2,1,'',0,1,''),
	(13,'Admin SubMenu','',1,'submenu',0,'0000-00-00 00:00:00',1,'mod_submenu',0,2,1,'',0,1,''),
	(14,'User Status','',1,'status',0,'0000-00-00 00:00:00',1,'mod_status',0,2,1,'',0,1,''),
	(15,'Title','',1,'title',0,'0000-00-00 00:00:00',1,'mod_title',0,2,1,'',0,1,''),
	(18,'Latest docs','',2,'dmcpanel',0,'0000-00-00 00:00:00',1,'mod_docman_latest',0,2,1,'',2,1,''),
	(19,'Top docs','',3,'dmcpanel',0,'0000-00-00 00:00:00',1,'mod_docman_top',0,2,1,'',2,1,''),
	(20,'Latest logs','',4,'dmcpanel',0,'0000-00-00 00:00:00',1,'mod_docman_logs',0,2,1,'',2,1,''),
	(21,'News','',0,'dmcpanel',0,'0000-00-00 00:00:00',1,'mod_docman_news',0,2,1,'',2,1,''),
	(22,'Unapproved','',1,'dmcpanel',0,'0000-00-00 00:00:00',1,'mod_docman_approval',0,2,1,'',2,1,''),
	(23,'DOCman Category','',0,'left',0,'0000-00-00 00:00:00',0,'mod_docman_catdown',0,0,1,'',0,0,''),
	(24,'DOCman Latest Downloads','',0,'left',0,'0000-00-00 00:00:00',0,'mod_docman_latestdown',0,0,1,'',0,0,''),
	(25,'DOCman Lister','',0,'left',0,'0000-00-00 00:00:00',0,'mod_docman_lister',0,0,1,'',0,0,''),
	(26,'DOCman Most Downloaded','',0,'left',0,'0000-00-00 00:00:00',0,'mod_docman_mostdown',0,0,1,'',0,0,'');

/*!40000 ALTER TABLE `pol_modules` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pol_modules_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_modules_menu`;

CREATE TABLE `pol_modules_menu` (
  `moduleid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `pol_modules_menu` WRITE;
/*!40000 ALTER TABLE `pol_modules_menu` DISABLE KEYS */;
INSERT INTO `pol_modules_menu` (`moduleid`,`menuid`)
VALUES
	(1,0);

/*!40000 ALTER TABLE `pol_modules_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pol_newsfeeds
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_newsfeeds`;

CREATE TABLE `pol_newsfeeds` (
  `catid` int(11) NOT NULL default '0',
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL default '',
  `link` text NOT NULL,
  `filename` varchar(200) default NULL,
  `published` tinyint(1) NOT NULL default '0',
  `numarticles` int(11) unsigned NOT NULL default '1',
  `cache_time` int(11) unsigned NOT NULL default '3600',
  `checked_out` tinyint(3) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `rtl` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `published` (`published`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Newsfeeds';



# Dump of table pol_phocagallery
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_phocagallery`;

CREATE TABLE `pol_phocagallery` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(250) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `filename` varchar(250) NOT NULL default '',
  `description` text,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL default '0',
  `latitude` varchar(20) NOT NULL default '',
  `longitude` varchar(20) NOT NULL default '',
  `zoom` int(3) NOT NULL default '0',
  `geotitle` varchar(255) NOT NULL default '',
  `videocode` text,
  `vmproductid` int(11) NOT NULL default '0',
  `imgorigsize` int(11) NOT NULL default '0',
  `published` tinyint(1) NOT NULL default '0',
  `approved` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text,
  `metakey` text,
  `metadesc` text,
  `extlink1` text,
  `extlink2` text,
  `extid` varchar(255) NOT NULL default '',
  `extl` varchar(255) NOT NULL default '',
  `extm` varchar(255) NOT NULL default '',
  `exts` varchar(255) NOT NULL default '',
  `exto` varchar(255) NOT NULL default '',
  `extw` varchar(255) NOT NULL default '',
  `exth` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`,`published`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_phocagallery_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_phocagallery_categories`;

CREATE TABLE `pol_phocagallery_categories` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `owner_id` int(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `image` varchar(255) NOT NULL default '',
  `section` varchar(50) NOT NULL default '',
  `image_position` varchar(30) NOT NULL default '',
  `description` text,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `approved` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `hits` int(11) NOT NULL default '0',
  `accessuserid` text,
  `uploaduserid` text,
  `deleteuserid` text,
  `userfolder` text,
  `latitude` varchar(20) NOT NULL default '',
  `longitude` varchar(20) NOT NULL default '',
  `zoom` int(3) NOT NULL default '0',
  `geotitle` varchar(255) NOT NULL default '',
  `extid` varchar(255) NOT NULL default '',
  `exta` varchar(255) NOT NULL default '',
  `extu` varchar(255) NOT NULL default '',
  `extauth` varchar(255) NOT NULL default '',
  `params` text,
  `metakey` text,
  `metadesc` text,
  PRIMARY KEY  (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_phocagallery_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_phocagallery_comments`;

CREATE TABLE `pol_phocagallery_comments` (
  `id` int(11) NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `userid` int(11) NOT NULL default '0',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `title` varchar(255) NOT NULL default '',
  `comment` text,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_phocagallery_img_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_phocagallery_img_comments`;

CREATE TABLE `pol_phocagallery_img_comments` (
  `id` int(11) NOT NULL auto_increment,
  `imgid` int(11) NOT NULL default '0',
  `userid` int(11) NOT NULL default '0',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `title` varchar(255) NOT NULL default '',
  `comment` text,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_phocagallery_img_votes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_phocagallery_img_votes`;

CREATE TABLE `pol_phocagallery_img_votes` (
  `id` int(11) NOT NULL auto_increment,
  `imgid` int(11) NOT NULL default '0',
  `userid` int(11) NOT NULL default '0',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `rating` tinyint(1) NOT NULL default '0',
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_phocagallery_img_votes_statistics
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_phocagallery_img_votes_statistics`;

CREATE TABLE `pol_phocagallery_img_votes_statistics` (
  `id` int(11) NOT NULL auto_increment,
  `imgid` int(11) NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `average` float(8,6) NOT NULL default '0.000000',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_phocagallery_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_phocagallery_user`;

CREATE TABLE `pol_phocagallery_user` (
  `id` int(11) NOT NULL auto_increment,
  `userid` int(11) NOT NULL default '0',
  `avatar` varchar(40) NOT NULL default '',
  `published` tinyint(1) NOT NULL default '0',
  `approved` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text,
  PRIMARY KEY  (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_phocagallery_votes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_phocagallery_votes`;

CREATE TABLE `pol_phocagallery_votes` (
  `id` int(11) NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `userid` int(11) NOT NULL default '0',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `rating` tinyint(1) NOT NULL default '0',
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_phocagallery_votes_statistics
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_phocagallery_votes_statistics`;

CREATE TABLE `pol_phocagallery_votes_statistics` (
  `id` int(11) NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `average` float(8,6) NOT NULL default '0.000000',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_plugins`;

CREATE TABLE `pol_plugins` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `element` varchar(100) NOT NULL default '',
  `folder` varchar(100) NOT NULL default '',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `published` tinyint(3) NOT NULL default '0',
  `iscore` tinyint(3) NOT NULL default '0',
  `client_id` tinyint(3) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

LOCK TABLES `pol_plugins` WRITE;
/*!40000 ALTER TABLE `pol_plugins` DISABLE KEYS */;
INSERT INTO `pol_plugins` (`id`,`name`,`element`,`folder`,`access`,`ordering`,`published`,`iscore`,`client_id`,`checked_out`,`checked_out_time`,`params`)
VALUES
	(1,'Authentication - Joomla','joomla','authentication',0,1,1,1,0,0,'0000-00-00 00:00:00',''),
	(2,'Authentication - LDAP','ldap','authentication',0,2,0,1,0,0,'0000-00-00 00:00:00','host=\nport=389\nuse_ldapV3=0\nnegotiate_tls=0\nno_referrals=0\nauth_method=bind\nbase_dn=\nsearch_string=\nusers_dn=\nusername=\npassword=\nldap_fullname=fullName\nldap_email=mail\nldap_uid=uid\n\n'),
	(3,'Authentication - GMail','gmail','authentication',0,4,0,0,0,0,'0000-00-00 00:00:00',''),
	(4,'Authentication - OpenID','openid','authentication',0,3,0,0,0,0,'0000-00-00 00:00:00',''),
	(5,'User - Joomla!','joomla','user',0,0,1,0,0,0,'0000-00-00 00:00:00','autoregister=1\n\n'),
	(6,'Search - Content','content','search',0,1,1,1,0,0,'0000-00-00 00:00:00','search_limit=50\nsearch_content=1\nsearch_uncategorised=1\nsearch_archived=1\n\n'),
	(7,'Search - Contacts','contacts','search',0,3,1,1,0,0,'0000-00-00 00:00:00','search_limit=50\n\n'),
	(8,'Search - Categories','categories','search',0,4,1,0,0,0,'0000-00-00 00:00:00','search_limit=50\n\n'),
	(9,'Search - Sections','sections','search',0,5,1,0,0,0,'0000-00-00 00:00:00','search_limit=50\n\n'),
	(10,'Search - Newsfeeds','newsfeeds','search',0,6,1,0,0,0,'0000-00-00 00:00:00','search_limit=50\n\n'),
	(11,'Search - Weblinks','weblinks','search',0,2,1,1,0,0,'0000-00-00 00:00:00','search_limit=50\n\n'),
	(12,'Content - Pagebreak','pagebreak','content',0,10000,1,1,0,0,'0000-00-00 00:00:00','enabled=1\ntitle=1\nmultipage_toc=1\nshowall=1\n\n'),
	(13,'Content - Rating','vote','content',0,4,0,1,0,0,'0000-00-00 00:00:00',''),
	(14,'Content - Email Cloaking','emailcloak','content',0,5,1,0,0,0,'0000-00-00 00:00:00','mode=1\n\n'),
	(15,'Content - Code Hightlighter (GeSHi)','geshi','content',0,5,0,0,0,0,'0000-00-00 00:00:00',''),
	(16,'Content - Load Module','loadmodule','content',0,6,1,0,0,0,'0000-00-00 00:00:00','enabled=1\nstyle=0\n\n'),
	(17,'Content - Page Navigation','pagenavigation','content',0,2,1,1,0,0,'0000-00-00 00:00:00','position=1\n\n'),
	(18,'Editor - No Editor','none','editors',0,0,1,1,0,0,'0000-00-00 00:00:00',''),
	(19,'Editor - TinyMCE','tinymce','editors',0,0,1,1,0,0,'0000-00-00 00:00:00','mode=advanced\nskin=0\ncompressed=0\ncleanup_startup=0\ncleanup_save=2\nentity_encoding=raw\nlang_mode=0\nlang_code=en\ntext_direction=ltr\ncontent_css=1\ncontent_css_custom=\nrelative_urls=1\nnewlines=0\ninvalid_elements=applet\nextended_elements=\ntoolbar=top\ntoolbar_align=left\nhtml_height=550\nhtml_width=750\nelement_path=1\nfonts=1\npaste=1\nsearchreplace=1\ninsertdate=1\nformat_date=%Y-%m-%d\ninserttime=1\nformat_time=%H:%M:%S\ncolors=1\ntable=1\nsmilies=1\nmedia=1\nhr=1\ndirectionality=1\nfullscreen=1\nstyle=1\nlayer=1\nxhtmlxtras=1\nvisualchars=1\nnonbreaking=1\ntemplate=0\nadvimage=1\nadvlink=1\nautosave=1\ncontextmenu=1\ninlinepopups=1\nsafari=1\ncustom_plugin=\ncustom_button=\n\n'),
	(20,'Editor - XStandard Lite 2.0','xstandard','editors',0,0,0,1,0,0,'0000-00-00 00:00:00',''),
	(21,'Editor Button - Image','image','editors-xtd',0,0,1,0,0,0,'0000-00-00 00:00:00',''),
	(22,'Editor Button - Pagebreak','pagebreak','editors-xtd',0,0,1,0,0,0,'0000-00-00 00:00:00',''),
	(23,'Editor Button - Readmore','readmore','editors-xtd',0,0,1,0,0,0,'0000-00-00 00:00:00',''),
	(24,'XML-RPC - Joomla','joomla','xmlrpc',0,7,0,1,0,0,'0000-00-00 00:00:00',''),
	(25,'XML-RPC - Blogger API','blogger','xmlrpc',0,7,0,1,0,0,'0000-00-00 00:00:00','catid=1\nsectionid=0\n\n'),
	(27,'System - SEF','sef','system',0,5,1,0,0,0,'0000-00-00 00:00:00',''),
	(28,'System - Debug','debug','system',0,6,1,0,0,0,'0000-00-00 00:00:00','queries=1\nmemory=1\nlangauge=1\n\n'),
	(29,'System - Legacy','legacy','system',0,7,0,1,0,0,'0000-00-00 00:00:00','route=0\n\n'),
	(30,'System - Cache','cache','system',0,9,0,1,0,0,'0000-00-00 00:00:00','browsercache=0\ncachetime=15\n\n'),
	(31,'System - Log','log','system',0,8,0,1,0,0,'0000-00-00 00:00:00',''),
	(32,'System - Remember Me','remember','system',0,10,1,1,0,0,'0000-00-00 00:00:00',''),
	(33,'System - Backlink','backlink','system',0,11,0,1,0,0,'0000-00-00 00:00:00',''),
	(34,'System - Mootools Upgrade','mtupgrade','system',0,4,0,0,0,0,'0000-00-00 00:00:00',''),
	(39,'DOCman Standard Buttons','standardbuttons','docman',0,1,0,1,0,0,'0000-00-00 00:00:00','download=1\nview=1\ndetails=1\nedit=1\nmove=1\ndelete=1\nupdate=1\nreset=1\ncheckout=1\napprove=1\npublish=1'),
	(40,'Search DOCman','docman.searchbot','search',0,0,0,0,0,0,'0000-00-00 00:00:00','prefix=Download: \nhref=download\nsearch_name=1\nsearch_description=1\n'),
	(41,'DOCLink','doclink','editors-xtd',0,0,0,0,0,0,'0000-00-00 00:00:00',''),
	(47,'Editor - JCE','jce','editors',0,0,1,0,0,0,'0000-00-00 00:00:00',''),
	(48,'System - Koowa','koowa','system',0,2,0,0,0,0,'0000-00-00 00:00:00',''),
	(49,'System - Nooku','nooku','system',0,3,0,0,0,0,'0000-00-00 00:00:00',''),
	(53,'AllVideos (by JoomlaWorks)','jw_allvideos','content',0,0,0,0,0,0,'0000-00-00 00:00:00','vfolder=images/stories/videos\nvwidth=400\nvheight=300\ntransparency=transparent\nbackground=#010101\nbackgroundQT=black\ncontrolBarLocation=bottom\nlightboxLink=1\nlightboxWidth=800\nlightboxHeight=600\nafolder=images/stories/audio\nawidth=300\naheight=20\ndownloadLink=1\nembedForm=1\n');

/*!40000 ALTER TABLE `pol_plugins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pol_poll_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_poll_data`;

CREATE TABLE `pol_poll_data` (
  `id` int(11) NOT NULL auto_increment,
  `pollid` int(11) NOT NULL default '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Results from the polls';



# Dump of table pol_poll_date
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_poll_date`;

CREATE TABLE `pol_poll_date` (
  `id` bigint(20) NOT NULL auto_increment,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL default '0',
  `poll_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_poll_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_poll_menu`;

CREATE TABLE `pol_poll_menu` (
  `pollid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_polls
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_polls`;

CREATE TABLE `pol_polls` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `voters` int(9) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `access` int(11) NOT NULL default '0',
  `lag` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Polls from the core poll manager';



# Dump of table pol_sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_sections`;

CREATE TABLE `pol_sections` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `image` text NOT NULL,
  `scope` varchar(50) NOT NULL default '',
  `image_position` varchar(30) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Article sections';



# Dump of table pol_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_session`;

CREATE TABLE `pol_session` (
  `username` varchar(150) default '',
  `time` varchar(14) default '',
  `session_id` varchar(200) NOT NULL default '0',
  `guest` tinyint(4) default '1',
  `userid` int(11) default '0',
  `usertype` varchar(50) default '',
  `gid` tinyint(3) unsigned NOT NULL default '0',
  `client_id` tinyint(3) unsigned NOT NULL default '0',
  `data` longtext,
  PRIMARY KEY  (`session_id`(64)),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pol_session` WRITE;
/*!40000 ALTER TABLE `pol_session` DISABLE KEYS */;
INSERT INTO `pol_session` (`username`,`time`,`session_id`,`guest`,`userid`,`usertype`,`gid`,`client_id`,`data`)
VALUES
	('','1289854105','dfid5v3p4oi2otuatndjqpg0d1',1,0,'',0,0,'__default|a:8:{s:15:\"session.counter\";i:79;s:19:\"session.timer.start\";i:1289853299;s:18:\"session.timer.last\";i:1289854102;s:17:\"session.timer.now\";i:1289854103;s:22:\"session.client.browser\";s:248:\"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; GTB6.6; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; eSobiSubscriber 2.0.4.16; OfficeLiveConnector.1.5; OfficeLivePatch.1.3; .NET4.0C)\";s:8:\"registry\";O:9:\"JRegistry\":3:{s:17:\"_defaultNameSpace\";s:7:\"session\";s:9:\"_registry\";a:2:{s:7:\"session\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}s:11:\"application\";a:1:{s:4:\"data\";O:8:\"stdClass\":1:{s:4:\"site\";s:4:\"5421\";}}}s:7:\"_errors\";a:0:{}}s:4:\"user\";O:5:\"JUser\":19:{s:2:\"id\";i:0;s:4:\"name\";N;s:8:\"username\";N;s:5:\"email\";N;s:8:\"password\";N;s:14:\"password_clear\";s:0:\"\";s:8:\"usertype\";N;s:5:\"block\";N;s:9:\"sendEmail\";i:0;s:3:\"gid\";i:0;s:12:\"registerDate\";N;s:13:\"lastvisitDate\";N;s:10:\"activation\";N;s:6:\"params\";N;s:3:\"aid\";i:0;s:5:\"guest\";i:1;s:7:\"_params\";O:10:\"JParameter\":7:{s:4:\"_raw\";s:0:\"\";s:4:\"_xml\";N;s:9:\"_elements\";a:0:{}s:12:\"_elementPath\";a:1:{i:0;s:55:\"/var/www/public/libraries/joomla/html/parameter/element\";}s:17:\"_defaultNameSpace\";s:8:\"_default\";s:9:\"_registry\";a:1:{s:8:\"_default\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}}s:7:\"_errors\";a:0:{}}s:9:\"_errorMsg\";N;s:7:\"_errors\";a:0:{}}s:13:\"session.token\";s:32:\"1fae1590d36f11fa005c1bfa15f9e300\";}');

/*!40000 ALTER TABLE `pol_session` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pol_stats_agents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_stats_agents`;

CREATE TABLE `pol_stats_agents` (
  `agent` varchar(255) NOT NULL default '',
  `type` tinyint(1) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table pol_templates_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_templates_menu`;

CREATE TABLE `pol_templates_menu` (
  `template` varchar(255) NOT NULL default '',
  `menuid` int(11) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`menuid`,`client_id`,`template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `pol_templates_menu` WRITE;
/*!40000 ALTER TABLE `pol_templates_menu` DISABLE KEYS */;
INSERT INTO `pol_templates_menu` (`template`,`menuid`,`client_id`)
VALUES
	('rhuk_milkyway',0,0),
	('khepri',0,1);

/*!40000 ALTER TABLE `pol_templates_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pol_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_users`;

CREATE TABLE `pol_users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `username` varchar(150) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `password` varchar(100) NOT NULL default '',
  `usertype` varchar(25) NOT NULL default '',
  `block` tinyint(4) NOT NULL default '0',
  `sendEmail` tinyint(4) default '0',
  `gid` tinyint(3) unsigned NOT NULL default '1',
  `registerDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL default '',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `gid_block` (`gid`,`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

LOCK TABLES `pol_users` WRITE;
/*!40000 ALTER TABLE `pol_users` DISABLE KEYS */;
INSERT INTO `pol_users` (`id`,`name`,`username`,`email`,`password`,`usertype`,`block`,`sendEmail`,`gid`,`registerDate`,`lastvisitDate`,`activation`,`params`)
VALUES
	(62,'Administrator','administrator','admin@localhost.home','f4df914211f75594937e002293c0766f:9zWvbqlElCFly8U6Hajyzcb7ONjN2OcB','Super Administrator',0,1,25,'2010-10-16 22:19:31','2010-11-15 06:25:10','','admin_language=nl-NL\r\nlanguage=\r\neditor=\r\nhelpsite=\r\ntimezone=0\r\nsite=default\r\n');

/*!40000 ALTER TABLE `pol_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pol_weblinks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pol_weblinks`;

CREATE TABLE `pol_weblinks` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(250) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `url` varchar(250) NOT NULL default '',
  `description` text NOT NULL,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL default '0',
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `archived` tinyint(1) NOT NULL default '0',
  `approved` tinyint(1) NOT NULL default '1',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Weblinks from the core weblink manager';






/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
