-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_demo_default
-- ------------------------------------------------------
-- Server version	5.5.41-0+wheezy1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `perch2_categories`
--

DROP TABLE IF EXISTS `perch2_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_categories` (
  `catID` int(10) NOT NULL AUTO_INCREMENT,
  `setID` int(10) unsigned NOT NULL,
  `catParentID` int(10) unsigned NOT NULL DEFAULT '0',
  `catTitle` char(64) NOT NULL DEFAULT '',
  `catSlug` char(64) NOT NULL DEFAULT '',
  `catPath` char(255) NOT NULL DEFAULT '',
  `catDisplayPath` char(255) NOT NULL DEFAULT '',
  `catOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `catTreePosition` char(255) NOT NULL DEFAULT '000',
  `catDynamicFields` text NOT NULL,
  PRIMARY KEY (`catID`),
  KEY `idx_set` (`setID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_categories`
--

LOCK TABLES `perch2_categories` WRITE;
/*!40000 ALTER TABLE `perch2_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_category_counts`
--

DROP TABLE IF EXISTS `perch2_category_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_category_counts` (
  `countID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catID` int(10) unsigned NOT NULL,
  `countType` char(64) NOT NULL DEFAULT '',
  `countValue` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`countID`),
  KEY `idx_cat` (`catID`),
  KEY `idx_cat_type` (`countType`,`catID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_category_counts`
--

LOCK TABLES `perch2_category_counts` WRITE;
/*!40000 ALTER TABLE `perch2_category_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_category_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_category_sets`
--

DROP TABLE IF EXISTS `perch2_category_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_category_sets` (
  `setID` int(10) NOT NULL AUTO_INCREMENT,
  `setTitle` char(64) NOT NULL DEFAULT '',
  `setSlug` char(64) NOT NULL DEFAULT '',
  `setTemplate` char(255) NOT NULL DEFAULT 'set.html',
  `setCatTemplate` char(255) NOT NULL DEFAULT 'category.html',
  `setDynamicFields` text,
  PRIMARY KEY (`setID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_category_sets`
--

LOCK TABLES `perch2_category_sets` WRITE;
/*!40000 ALTER TABLE `perch2_category_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_category_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_content_index`
--

DROP TABLE IF EXISTS `perch2_content_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_content_index` (
  `indexID` int(10) NOT NULL AUTO_INCREMENT,
  `itemID` int(10) NOT NULL DEFAULT '0',
  `regionID` int(10) NOT NULL DEFAULT '0',
  `pageID` int(10) NOT NULL DEFAULT '0',
  `itemRev` int(10) NOT NULL DEFAULT '0',
  `indexKey` char(64) NOT NULL DEFAULT '-',
  `indexValue` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`indexID`),
  KEY `idx_key` (`indexKey`),
  KEY `idx_val` (`indexValue`),
  KEY `idx_rev` (`itemRev`),
  KEY `idx_item` (`itemID`),
  KEY `idx_keyval` (`indexKey`,`indexValue`),
  KEY `idx_regrev` (`regionID`,`itemRev`)
) ENGINE=MyISAM AUTO_INCREMENT=1768 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_content_index`
--

LOCK TABLES `perch2_content_index` WRITE;
/*!40000 ALTER TABLE `perch2_content_index` DISABLE KEYS */;
INSERT INTO `perch2_content_index` VALUES (1759,1,3,2,3,'_order','1000'),(1758,1,3,2,3,'_id','1'),(1757,1,3,2,3,'text','Demo website'),(1594,2,4,2,2,'_order','1000'),(1593,2,4,2,2,'_id','2'),(1592,2,4,2,2,'text','Perch CMS'),(1610,3,5,2,4,'_order','1000'),(1609,3,5,2,4,'_id','3'),(1608,3,5,2,4,'text_processed','<p>You can start off by editing this text. <a href=\"/perch\">Log in</a> to the Perch control panel, and you&#8217;ll find this as <em>Welcome message</em> on the <em>Home page</em>.</p>\n\n<p>For this text, we&#8217;ve chosen to edit it using the Textile for'),(1607,3,5,2,4,'text_raw','You can start off by editing this text. \"Log in\":/perch to the Perch control panel, and you\'ll find this as _Welcome message_ on the _Home page_.\r\n\r\nFor this text, we\'ve chosen to edit it using the Textile formatting language. It\'s text-based and easier t'),(1606,3,5,2,4,'text','<p>You can start off by editing this text. <a href=\"/perch\">Log in</a> to the Perch control panel, and you&#8217;ll find this as <em>Welcome message</em> on the <em>Home page</em>.</p>\n\n<p>For this text, we&#8217;ve chosen to edit it using the Textile for'),(1605,3,5,2,4,'heading','Welcome to your Perch demo site!'),(1680,4,6,2,7,'_order','1000'),(1679,4,6,2,7,'_id','4'),(1678,4,6,2,7,'caption_processed','<p>This is an image displayed using the HTML5 <code>figure</code> element. It&#8217;s been set at a width of 680px so any image uploades will be scaled to match. It&#8217;s also set to double pixel density, which makes it perfect for high-<span class=\"cap'),(1677,4,6,2,7,'caption_raw','This is an image displayed using the HTML5 @figure@ element. It\'s been set at a width of 680px so any image uploades will be scaled to match. It\'s also set to double pixel density, which makes it perfect for high-DPI screens. Content managed, retina-ready'),(1676,4,6,2,7,'caption','<p>This is an image displayed using the HTML5 <code>figure</code> element. It&#8217;s been set at a width of 680px so any image uploades will be scaled to match. It&#8217;s also set to double pixel density, which makes it perfect for high-<span class=\"cap'),(1675,4,6,2,7,'heading','Streamers everywhere!'),(1674,4,6,2,7,'image_h','933'),(1673,4,6,2,7,'image_w','1400'),(1672,4,6,2,7,'image_bucket','default'),(1671,4,6,2,7,'image_size','384001'),(1670,4,6,2,7,'image_path','img1896.jpg'),(1669,4,6,2,7,'image__default','/perch/resources/img1896.jpg'),(1668,4,6,2,7,'image','/perch/resources/img1896.jpg'),(1752,8,9,2,7,'_order','1002'),(1751,8,9,2,7,'_id','8'),(1750,8,9,2,7,'text_processed','<p>Have some fun! You can add as many of these as you want. And they&#8217;re totally free! Aren&#8217;t we generous?</p>'),(1749,8,9,2,7,'text_raw','Have some fun! You can add as many of these as you want. And they\'re totally free! Aren\'t we generous?'),(1748,8,9,2,7,'text','<p>Have some fun! You can add as many of these as you want. And they&#8217;re totally free! Aren&#8217;t we generous?</p>'),(1747,8,9,2,7,'heading','Add some boxes'),(1746,7,9,2,7,'_order','1001'),(1745,7,9,2,7,'_id','7'),(1744,7,9,2,7,'text_processed','<p>This box links to the video tutorial. We try to provide both text and videos, as different people like to learn in different ways.</p>'),(1743,7,9,2,7,'text_raw','This box links to the video tutorial. We try to provide both text and videos, as different people like to learn in different ways.'),(1742,7,9,2,7,'text','<p>This box links to the video tutorial. We try to provide both text and videos, as different people like to learn in different ways.</p>'),(1741,7,9,2,7,'url','http://docs.grabaperch.com/video/'),(1740,7,9,2,7,'heading','See our video tutorial'),(1739,6,9,2,7,'_order','1000'),(1738,6,9,2,7,'_id','6'),(1737,6,9,2,7,'text_processed','<p>I can add lots of these boxes, optionally with a link on the heading. It uses Textile, so I can do <strong>bold</strong> and <em>italic</em> and so on.</p>'),(1736,6,9,2,7,'text_raw','I can add lots of these boxes, optionally with a link on the heading. It uses Textile, so I can do *bold* and _italic_ and so on.'),(1735,6,9,2,7,'text','<p>I can add lots of these boxes, optionally with a link on the heading. It uses Textile, so I can do <strong>bold</strong> and <em>italic</em> and so on.</p>'),(1734,6,9,2,7,'heading','This is a feature!'),(1604,9,10,2,4,'_order','1000'),(1603,9,10,2,4,'_id','9'),(1602,9,10,2,4,'alt','Your Logo Here'),(1601,9,10,2,4,'image_h','55'),(1600,9,10,2,4,'image_w','260'),(1599,9,10,2,4,'image_bucket','default'),(1598,9,10,2,4,'image_size','3675'),(1597,9,10,2,4,'image_path','logo.png'),(1596,9,10,2,4,'image__default','/perch/resources/logo.png'),(1595,9,10,2,4,'image','/perch/resources/logo.png'),(1756,10,11,2,12,'_order','1000'),(1755,10,11,2,12,'_id','10'),(1754,10,11,2,12,'facebook','grabaperch'),(1753,10,11,2,12,'twitter','@grabaperch'),(1616,11,12,3,9,'_order','1000'),(1615,11,12,3,9,'_id','11'),(1614,11,12,3,9,'text_processed','<p>Perch is really big on what we call <em>structured content</em>. This is what makes Perch different from other small <span class=\"caps\">CMS</span> options. We recognise that not all content is the shape of a blog post &#8212; most things have finer det'),(1613,11,12,3,9,'text_raw','Perch is really big on what we call _structured content_. This is what makes Perch different from other small CMS options. We recognise that not all content is the shape of a blog post -- most things have finer detail than that.\r\n\r\nTake the example of a l'),(1612,11,12,3,9,'text','<p>Perch is really big on what we call <em>structured content</em>. This is what makes Perch different from other small <span class=\"caps\">CMS</span> options. We recognise that not all content is the shape of a blog post &#8212; most things have finer det'),(1611,11,12,3,9,'heading','Let\'s talk about templates'),(1721,14,13,3,22,'_order','1002'),(1720,14,13,3,22,'_id','14'),(1719,14,13,3,22,'bio_processed','<p>That\'s you! Try adding some more, it\'s fun! <i>(It may not actually be fun.)</i></p>'),(1718,14,13,3,22,'bio_raw','<p>That\'s you! Try adding some more, it\'s fun! <i>(It may not actually be fun.)</i></p>'),(1717,14,13,3,22,'bio','<p>That\'s you! Try adding some more, it\'s fun! <i>(It may not actually be fun.)</i></p>'),(1716,14,13,3,22,'email','{email}'),(1715,14,13,3,22,'jobtitle','Intern'),(1714,14,13,3,22,'lastname','{lastname}'),(1713,14,13,3,22,'firstname','{firstname}'),(1712,12,13,3,22,'_order','1001'),(1711,12,13,3,22,'_id','12'),(1710,12,13,3,22,'image_h','320'),(1709,12,13,3,22,'image_w','320'),(1708,12,13,3,22,'image_bucket','default'),(1707,12,13,3,22,'image_size','17064'),(1706,12,13,3,22,'image_path','drewm.jpg'),(1705,12,13,3,22,'image__default','/perch/resources/drewm.jpg'),(1704,12,13,3,22,'image','/perch/resources/drewm.jpg'),(1703,12,13,3,22,'bio_processed','<p>This is a brief bio, using the Redactor editor. It has <b>bold</b>&nbsp;and <i>italic </i>and so on.</p>'),(1702,12,13,3,22,'bio_raw','<p>This is a brief bio, using the Redactor editor. It has <b>bold</b>&nbsp;and <i>italic </i>and so on.</p>'),(1701,12,13,3,22,'bio','<p>This is a brief bio, using the Redactor editor. It has <b>bold</b>&nbsp;and <i>italic </i>and so on.</p>'),(1700,12,13,3,22,'email','hello@grabaperch.com'),(1699,12,13,3,22,'jobtitle','Director'),(1698,12,13,3,22,'lastname','McLellan'),(1697,12,13,3,22,'firstname','Drew'),(1696,13,13,3,22,'_order','1000'),(1695,13,13,3,22,'_id','13'),(1694,13,13,3,22,'image_h','320'),(1693,13,13,3,22,'image_w','320'),(1692,13,13,3,22,'image_bucket','default'),(1691,13,13,3,22,'image_size','23652'),(1690,13,13,3,22,'image_path','rachel.jpg'),(1689,13,13,3,22,'image__default','/perch/resources/rachel.jpg'),(1688,13,13,3,22,'image','/perch/resources/rachel.jpg'),(1687,13,13,3,22,'bio_processed','<p>This is another brief biography. It\'s very exciting, you have to admit.</p>'),(1686,13,13,3,22,'bio_raw','<p>This is another brief biography. It\'s very exciting, you have to admit.</p>'),(1685,13,13,3,22,'bio','<p>This is another brief biography. It\'s very exciting, you have to admit.</p>'),(1684,13,13,3,22,'email','info@edgeofmyseat.com'),(1683,13,13,3,22,'jobtitle','Managing Director'),(1682,13,13,3,22,'lastname','Andrew'),(1681,13,13,3,22,'firstname','Rachel'),(1622,15,14,4,8,'_order','1000'),(1621,15,14,4,8,'_id','15'),(1620,15,14,4,8,'text_processed','<p>Although it can be used in lots of different ways, Perch is at its best when critical decisions about site structure and information architecture are made by the web designer, and then set up for the client to work with. Adding new pages to a site is g'),(1619,15,14,4,8,'text_raw','Although it can be used in lots of different ways, Perch is at its best when critical decisions about site structure and information architecture are made by the web designer, and then set up for the client to work with. Adding new pages to a site is grea'),(1618,15,14,4,8,'text','<p>Although it can be used in lots of different ways, Perch is at its best when critical decisions about site structure and information architecture are made by the web designer, and then set up for the client to work with. Adding new pages to a site is g'),(1617,15,14,4,8,'heading','Work with us'),(1733,18,15,4,3,'_order','1002'),(1732,18,15,4,3,'_id','18'),(1731,18,15,4,3,'slug','paris'),(1730,18,15,4,3,'title','Paris'),(1729,17,15,4,3,'_order','1001'),(1728,17,15,4,3,'_id','17'),(1727,17,15,4,3,'slug','new-york'),(1726,17,15,4,3,'title','New York'),(1725,16,15,4,3,'_order','1000'),(1724,16,15,4,3,'_id','16'),(1723,16,15,4,3,'slug','london'),(1722,16,15,4,3,'title','London'),(1637,19,16,5,7,'_order','1000'),(1636,19,16,5,7,'_id','19'),(1635,19,16,5,7,'howtoapply_processed','<p>Email a CV and covering letter to <a href=\"mailto:jobs@grabaperch.com\">jobs@grabaperch.com</a>.&nbsp;</p><p><b>Do not call in person.</b></p>'),(1634,19,16,5,7,'howtoapply_raw','<p>Email a CV and covering letter to <a href=\"mailto:jobs@grabaperch.com\">jobs@grabaperch.com</a>.&nbsp;</p><p><b>Do not call in person.</b></p>'),(1633,19,16,5,7,'howtoapply','<p>Email a CV and covering letter to <a href=\"mailto:jobs@grabaperch.com\">jobs@grabaperch.com</a>.&nbsp;</p><p><b>Do not call in person.</b></p>'),(1632,19,16,5,7,'deadline','2014-11-24'),(1631,19,16,5,7,'salary','6,000'),(1630,19,16,5,7,'office','London'),(1629,19,16,5,7,'requirements_processed','<p><ul><li>12 months experience with websites</li><li>Knowledge of website content</li><li>A team player <i>(you don\'t have to play in any teams)</i></li></ul></p>'),(1628,19,16,5,7,'requirements_raw','<p><ul><li>12 months experience with websites</li><li>Knowledge of website content</li><li>A team player <i>(you don\'t have to play in any teams)</i></li></ul></p>'),(1627,19,16,5,7,'requirements','<p><ul><li>12 months experience with websites</li><li>Knowledge of website content</li><li>A team player <i>(you don\'t have to play in any teams)</i></li></ul></p>'),(1626,19,16,5,7,'description_processed','<p>You\'ll be required to edit content on a number of websites. If you\'re the sort of person who likes websites, loves content and wishes that there was some way that they could be combined into the perfect job for you, then this may be the perfect job for'),(1625,19,16,5,7,'description_raw','<p>You\'ll be required to edit content on a number of websites. If you\'re the sort of person who likes websites, loves content and wishes that there was some way that they could be combined into the perfect job for you, then this may be the perfect job for'),(1624,19,16,5,7,'description','<p>You\'ll be required to edit content on a number of websites. If you\'re the sort of person who likes websites, loves content and wishes that there was some way that they could be combined into the perfect job for you, then this may be the perfect job for'),(1623,19,16,5,7,'title','Content Editor'),(1652,20,17,6,1,'_order','1000'),(1651,20,17,6,1,'_id','20'),(1650,20,17,6,1,'howtoapply_processed','<p>Hand deliver your CV to the 18th floor of our Paris office. We\'ve left the window open, so just pop it through.</p>'),(1649,20,17,6,1,'howtoapply_raw','<p>Hand deliver your CV to the 18th floor of our Paris office. We\'ve left the window open, so just pop it through.</p>'),(1648,20,17,6,1,'howtoapply','<p>Hand deliver your CV to the 18th floor of our Paris office. We\'ve left the window open, so just pop it through.</p>'),(1647,20,17,6,1,'deadline','2014-06-24'),(1646,20,17,6,1,'salary','2,000'),(1645,20,17,6,1,'office','Paris'),(1644,20,17,6,1,'requirements_processed','<p><ul><li>A ladder</li><li>A squeegee</li><li>Mustn\'t be afraid of heights</li></ul></p>'),(1643,20,17,6,1,'requirements_raw','<p><ul><li>A ladder</li><li>A squeegee</li><li>Mustn\'t be afraid of heights</li></ul></p>'),(1642,20,17,6,1,'requirements','<p><ul><li>A ladder</li><li>A squeegee</li><li>Mustn\'t be afraid of heights</li></ul></p>'),(1641,20,17,6,1,'description_processed','<p>You\'ll be required to clean the windows of our extensive Paris office, which is entirely glazed. Working hours are 8am to 8pm with a 20 minute break for lunch.</p><p>The views are spectacular! (Or they will be, once you\'ve cleaned the windows.)</p>'),(1640,20,17,6,1,'description_raw','<p>You\'ll be required to clean the windows of our extensive Paris office, which is entirely glazed. Working hours are 8am to 8pm with a 20 minute break for lunch.</p><p>The views are spectacular! (Or they will be, once you\'ve cleaned the windows.)</p>'),(1639,20,17,6,1,'description','<p>You\'ll be required to clean the windows of our extensive Paris office, which is entirely glazed. Working hours are 8am to 8pm with a 20 minute break for lunch.</p><p>The views are spectacular! (Or they will be, once you\'ve cleaned the windows.)</p>'),(1638,20,17,6,1,'title','Window Cleaner'),(1667,21,18,7,1,'_order','1000'),(1666,21,18,7,1,'_id','21'),(1665,21,18,7,1,'howtoapply_processed','<p>Apply in person by delivering your CV to our current doorman. It\'ll cheer him up no end!</p>'),(1664,21,18,7,1,'howtoapply_raw','<p>Apply in person by delivering your CV to our current doorman. It\'ll cheer him up no end!</p>'),(1663,21,18,7,1,'howtoapply','<p>Apply in person by delivering your CV to our current doorman. It\'ll cheer him up no end!</p>'),(1662,21,18,7,1,'deadline','2015-10-26'),(1661,21,18,7,1,'salary','3,000'),(1660,21,18,7,1,'office','London'),(1659,21,18,7,1,'requirements_processed','<p><ul><li>2-3 experience with doors</li><li>Ability to stand for long periods</li><li>Look good in a hat</li></ul></p>'),(1658,21,18,7,1,'requirements_raw','<p><ul><li>2-3 experience with doors</li><li>Ability to stand for long periods</li><li>Look good in a hat</li></ul></p>'),(1657,21,18,7,1,'requirements','<p><ul><li>2-3 experience with doors</li><li>Ability to stand for long periods</li><li>Look good in a hat</li></ul></p>'),(1656,21,18,7,1,'description_processed','<p>You\'ll be required to greet and welcome guests as they arrive at our London office.&nbsp;</p><p>There\'s no hiding it, this job requires a lot of standing around.</p>'),(1655,21,18,7,1,'description_raw','<p>You\'ll be required to greet and welcome guests as they arrive at our London office.&nbsp;</p><p>There\'s no hiding it, this job requires a lot of standing around.</p>'),(1654,21,18,7,1,'description','<p>You\'ll be required to greet and welcome guests as they arrive at our London office.&nbsp;</p><p>There\'s no hiding it, this job requires a lot of standing around.</p>'),(1653,21,18,7,1,'title','Doorman'),(1760,22,19,8,1,'_id','22'),(1761,22,19,8,1,'_order','1000'),(1762,22,19,8,2,'_id','22'),(1763,22,19,8,2,'_order','1000'),(1764,22,19,8,3,'_id','22'),(1765,22,19,8,3,'_order','1000'),(1766,22,19,8,4,'_id','22'),(1767,22,19,8,4,'_order','1000');
/*!40000 ALTER TABLE `perch2_content_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_content_items`
--

DROP TABLE IF EXISTS `perch2_content_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_content_items` (
  `itemRowID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemID` int(10) unsigned NOT NULL DEFAULT '0',
  `regionID` int(10) unsigned NOT NULL DEFAULT '0',
  `pageID` int(10) unsigned NOT NULL DEFAULT '0',
  `itemRev` int(10) unsigned NOT NULL DEFAULT '0',
  `itemOrder` int(10) unsigned NOT NULL DEFAULT '1000',
  `itemJSON` mediumtext NOT NULL,
  `itemSearch` mediumtext NOT NULL,
  `itemUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `itemUpdatedBy` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemRowID`),
  KEY `idx_item` (`itemID`),
  KEY `idx_rev` (`itemRev`),
  KEY `idx_region` (`regionID`),
  KEY `idx_regrev` (`itemID`,`regionID`,`itemRev`),
  KEY `idx_order` (`itemOrder`),
  FULLTEXT KEY `idx_search` (`itemSearch`)
) ENGINE=MyISAM AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_content_items`
--

LOCK TABLES `perch2_content_items` WRITE;
/*!40000 ALTER TABLE `perch2_content_items` DISABLE KEYS */;
INSERT INTO `perch2_content_items` VALUES (6,2,4,2,2,1000,'{\"_id\":\"2\",\"text\":\"Perch CMS\",\"_title\":\"Perch CMS\"}',' Perch CMS ','0000-00-00 00:00:00',''),(40,8,9,2,7,1002,'{\"_id\":\"8\",\"heading\":\"Add some boxes\",\"_title\":\"Add some boxes\",\"text\":{\"raw\":\"Have some fun! You can add as many of these as you want. And they\'re totally free! Aren\'t we generous?\",\"processed\":\"<p>Have some fun! You can add as many of these as you want. And they&#8217;re totally free! Aren&#8217;t we generous?<\\/p>\"}}',' Add some boxes  Have some fun! You can add as many of these as you want. And they&#8217;re totally free! Aren&#8217;t we generous? ','0000-00-00 00:00:00',''),(20,4,6,2,7,1000,'{\"_id\":\"4\",\"image\":{\"_default\":\"\\/perch\\/resources\\/img1896.jpg\",\"path\":\"img1896.jpg\",\"size\":384001,\"bucket\":\"default\",\"w\":1400,\"h\":933,\"sizes\":{\"thumb\":{\"w\":150,\"h\":99,\"path\":\"img1896-thumb.jpg\",\"size\":9213,\"mime\":\"image\\/jpeg\"},\"w680hc0@2x\":{\"w\":680,\"h\":453,\"density\":\"2\",\"path\":\"img1896-w680@2x.jpg\",\"size\":198084,\"mime\":\"image\\/jpeg\"}}},\"heading\":\"Streamers everywhere!\",\"_title\":\"Streamers everywhere!\",\"caption\":{\"raw\":\"This is an image displayed using the HTML5 @figure@ element. It\'s been set at a width of 680px so any image uploades will be scaled to match. It\'s also set to double pixel density, which makes it perfect for high-DPI screens. Content managed, retina-ready images - if you want them.\",\"processed\":\"<p>This is an image displayed using the HTML5 <code>figure<\\/code> element. It&#8217;s been set at a width of 680px so any image uploades will be scaled to match. It&#8217;s also set to double pixel density, which makes it perfect for high-<span class=\\\"caps\\\">DPI<\\/span> screens. Content managed, retina-ready images &#8211; if you want them.<\\/p>\"}}','  Streamers everywhere! This is an image displayed using the HTML5 figure element. It&#8217;s been set at a width of 680px so any image uploades will be scaled to match. It&#8217;s also set to double pixel density, which makes it perfect for high-DPI screens. Content managed, retina-ready images &#8211; if you want them. ','0000-00-00 00:00:00',''),(121,15,14,4,8,1000,'{\"_id\":\"15\",\"heading\":\"Work with us\",\"_title\":\"Work with us\",\"text\":{\"raw\":\"Although it can be used in lots of different ways, Perch is at its best when critical decisions about site structure and information architecture are made by the web designer, and then set up for the client to work with. Adding new pages to a site is great, but it\'s usually best done within a framework and not haphazardly.\\r\\n\\r\\nThis section has been set up with this approach in mind. Add a new subpage to the Careers page (hover over Careers in the page listing, and click _New subpage_) to add a new job listing page. The pages will then be summarised below.\",\"processed\":\"<p>Although it can be used in lots of different ways, Perch is at its best when critical decisions about site structure and information architecture are made by the web designer, and then set up for the client to work with. Adding new pages to a site is great, but it&#8217;s usually best done within a framework and not haphazardly.<\\/p>\\n\\n<p>This section has been set up with this approach in mind. Add a new subpage to the Careers page (hover over Careers in the page listing, and click <em>New subpage<\\/em>) to add a new job listing page. The pages will then be summarised below.<\\/p>\"}}',' Work with us Although it can be used in lots of different ways, Perch is at its best when critical decisions about site structure and information architecture are made by the web designer, and then set up for the client to work with. Adding new pages to a site is great, but it&#8217;s usually best done within a framework and not haphazardly.\n\nThis section has been set up with this approach in mind. Add a new subpage to the Careers page (hover over Careers in the page listing, and click New subpage) to add a new job listing page. The pages will then be summarised below. ','0000-00-00 00:00:00',''),(38,6,9,2,7,1000,'{\"_id\":\"6\",\"heading\":\"This is a feature!\",\"_title\":\"This is a feature!\",\"text\":{\"raw\":\"I can add lots of these boxes, optionally with a link on the heading. It uses Textile, so I can do *bold* and _italic_ and so on.\",\"processed\":\"<p>I can add lots of these boxes, optionally with a link on the heading. It uses Textile, so I can do <strong>bold<\\/strong> and <em>italic<\\/em> and so on.<\\/p>\"}}',' This is a feature!  I can add lots of these boxes, optionally with a link on the heading. It uses Textile, so I can do bold and italic and so on. ','0000-00-00 00:00:00',''),(13,3,5,2,4,1000,'{\"_id\":\"3\",\"heading\":\"Welcome to your Perch demo site!\",\"_title\":\"Welcome to your Perch demo site!\",\"text\":{\"raw\":\"You can start off by editing this text. \\\"Log in\\\":\\/perch to the Perch control panel, and you\'ll find this as _Welcome message_ on the _Home page_.\\r\\n\\r\\nFor this text, we\'ve chosen to edit it using the Textile formatting language. It\'s text-based and easier to write than HTML, but still enables you to do text formatting, links, headings and so on. It\'s good at focussing the user on the _content_ and not on the _presentation_.\\r\\n\\r\\nPerch also supports Markdown, and has add-ons for common WYSIWYG editors such as:\\r\\n\\r\\n* CKEditor\\r\\n* Redactor\\r\\n* TinyMCE\\r\\n* Ace\\r\\n\\r\\nWe\'ll look at some of those later. First, how about some images.\",\"processed\":\"<p>You can start off by editing this text. <a href=\\\"\\/perch\\\">Log in<\\/a> to the Perch control panel, and you&#8217;ll find this as <em>Welcome message<\\/em> on the <em>Home page<\\/em>.<\\/p>\\n\\n<p>For this text, we&#8217;ve chosen to edit it using the Textile formatting language. It&#8217;s text-based and easier to write than <span class=\\\"caps\\\">HTML<\\/span>, but still enables you to do text formatting, links, headings and so on. It&#8217;s good at focussing the user on the <em>content<\\/em> and not on the <em>presentation<\\/em>.<\\/p>\\n\\n<p>Perch also supports Markdown, and has add-ons for common <span class=\\\"caps\\\">WYSIWYG<\\/span> editors such as:<\\/p>\\n\\n\\t<ul>\\n\\t\\t<li><span class=\\\"caps\\\">CKE<\\/span>ditor<\\/li>\\n\\t\\t<li>Redactor<\\/li>\\n\\t\\t<li>TinyMCE<\\/li>\\n\\t\\t<li>Ace<\\/li>\\n\\t<\\/ul>\\n\\n<p>We&#8217;ll look at some of those later. First, how about some images.<\\/p>\"}}',' Welcome to your Perch demo site! You can start off by editing this text. Log in to the Perch control panel, and you&#8217;ll find this as Welcome message on the Home page.\n\nFor this text, we&#8217;ve chosen to edit it using the Textile formatting language. It&#8217;s text-based and easier to write than HTML, but still enables you to do text formatting, links, headings and so on. It&#8217;s good at focussing the user on the content and not on the presentation.\n\nPerch also supports Markdown, and has add-ons for common WYSIWYG editors such as:\n\n	\n		CKEditor\n		Redactor\n		TinyMCE\n		Ace\n	\n\nWe&#8217;ll look at some of those later. First, how about some images. ','0000-00-00 00:00:00',''),(143,1,3,2,3,1000,'{\"_id\":\"1\",\"text\":\"Demo website\",\"_title\":\"Demo website\"}',' Demo website ','0000-00-00 00:00:00',''),(45,9,10,2,4,1000,'{\"_id\":\"9\",\"image\":{\"_default\":\"\\/perch\\/resources\\/logo.png\",\"path\":\"logo.png\",\"size\":3675,\"bucket\":\"default\",\"w\":260,\"h\":55,\"sizes\":{\"thumb\":{\"w\":150,\"h\":31,\"path\":\"logo-thumb.png\",\"size\":7039,\"mime\":\"image\\/png\"}}},\"alt\":\"Your Logo Here\",\"_title\":\"Your Logo Here\"}','  Your Logo Here ','0000-00-00 00:00:00',''),(39,7,9,2,7,1001,'{\"_id\":\"7\",\"heading\":\"See our video tutorial\",\"_title\":\"See our video tutorial\",\"url\":\"http:\\/\\/docs.grabaperch.com\\/video\\/\",\"text\":{\"raw\":\"This box links to the video tutorial. We try to provide both text and videos, as different people like to learn in different ways.\",\"processed\":\"<p>This box links to the video tutorial. We try to provide both text and videos, as different people like to learn in different ways.<\\/p>\"}}',' See our video tutorial http://docs.grabaperch.com/video/ This box links to the video tutorial. We try to provide both text and videos, as different people like to learn in different ways. ','0000-00-00 00:00:00',''),(109,13,13,3,22,1000,'{\"_id\":\"13\",\"firstname\":\"Rachel\",\"_title\":\"Rachel Andrew\",\"lastname\":\"Andrew\",\"jobtitle\":\"Managing Director\",\"email\":\"info@edgeofmyseat.com\",\"bio\":{\"raw\":\"<p>This is another brief biography. It\'s very exciting, you have to admit.<\\/p>\",\"processed\":\"<p>This is another brief biography. It\'s very exciting, you have to admit.<\\/p>\"},\"image\":{\"_default\":\"\\/perch\\/resources\\/rachel.jpg\",\"path\":\"rachel.jpg\",\"size\":23652,\"bucket\":\"default\",\"w\":320,\"h\":320,\"sizes\":{\"thumb\":{\"w\":150,\"h\":150,\"path\":\"rachel-thumb.jpg\",\"size\":6552,\"mime\":\"image\\/jpeg\"},\"w80h80c1@2x\":{\"w\":80,\"h\":80,\"density\":\"2\",\"path\":\"rachel-w80h80@2x.jpg\",\"size\":7231,\"mime\":\"image\\/jpeg\"}}}}',' Rachel Andrew Managing Director info@edgeofmyseat.com This is another brief biography. It\'s very exciting, you have to admit.  ','0000-00-00 00:00:00',''),(58,10,11,2,12,1000,'{\"_id\":\"10\",\"twitter\":\"@grabaperch\",\"facebook\":\"grabaperch\"}',' @grabaperch grabaperch   ','0000-00-00 00:00:00',''),(111,14,13,3,22,1002,'{\"_id\":\"14\",\"firstname\":\"{firstname}\",\"_title\":\"{firstname} {lastname}\",\"lastname\":\"{lastname}\",\"jobtitle\":\"Intern\",\"email\":\"{email}\",\"bio\":{\"raw\":\"<p>That\'s you! Try adding some more, it\'s fun! <i>(It may not actually be fun.)<\\/i><\\/p>\",\"processed\":\"<p>That\'s you! Try adding some more, it\'s fun! <i>(It may not actually be fun.)<\\/i><\\/p>\"}}',' {firstname} {lastname} Intern {email} That\'s you! Try adding some more, it\'s fun! (It may not actually be fun.)  ','0000-00-00 00:00:00',''),(110,12,13,3,22,1001,'{\"_id\":\"12\",\"firstname\":\"Drew\",\"_title\":\"Drew McLellan\",\"lastname\":\"McLellan\",\"jobtitle\":\"Director\",\"email\":\"hello@grabaperch.com\",\"bio\":{\"raw\":\"<p>This is a brief bio, using the Redactor editor. It has <b>bold<\\/b>&nbsp;and <i>italic <\\/i>and so on.<\\/p>\",\"processed\":\"<p>This is a brief bio, using the Redactor editor. It has <b>bold<\\/b>&nbsp;and <i>italic <\\/i>and so on.<\\/p>\"},\"image\":{\"_default\":\"\\/perch\\/resources\\/drewm.jpg\",\"path\":\"drewm.jpg\",\"size\":17064,\"bucket\":\"default\",\"w\":320,\"h\":320,\"sizes\":{\"thumb\":{\"w\":150,\"h\":150,\"path\":\"drewm-thumb.jpg\",\"size\":4534,\"mime\":\"image\\/jpeg\"},\"w80h80c1@2x\":{\"w\":80,\"h\":80,\"density\":\"2\",\"path\":\"drewm-w80h80@2x.jpg\",\"size\":5024,\"mime\":\"image\\/jpeg\"}}}}',' Drew McLellan Director hello@grabaperch.com This is a brief bio, using the Redactor editor. It has bold&nbsp;and italic and so on.  ','0000-00-00 00:00:00',''),(112,11,12,3,9,1000,'{\"_id\":\"11\",\"heading\":\"Let\'s talk about templates\",\"_title\":\"Let\'s talk about templates\",\"text\":{\"raw\":\"Perch is really big on what we call _structured content_. This is what makes Perch different from other small CMS options. We recognise that not all content is the shape of a blog post -- most things have finer detail than that.\\r\\n\\r\\nTake the example of a list of employee profiles. Each person will have a first and last name, a photo, a job title, an email address and maybe a short biography. In Perch, we like to capture each of those bits of information separately, for a few reasons:\\r\\n\\r\\n# It helps the user who has to enter the content. They can fill out fields without worrying about how it should look - they just put the right data in the right boxes. Because it\'s easy, it avoids mistakes.\\r\\n# If you want to reuse that content in a different form somewhere else on the site, you can.\\r\\n# If you change the design of your site, you can update the markup and content separately - you don\'t have content and HTML intermingled.\\r\\n\\r\\nWe do this by creating a template. A template is just an HTML snippet, with Perch tags dropped in as placeholders for the content. When you go to edit the region, Perch creates form fields for each of the placeholders.\\r\\n\\r\\nYou can \\\"see what the template looks like\\\":https:\\/\\/github.com\\/PerchCMS\\/perchdemo-default\\/blob\\/master\\/public_html\\/perch\\/templates\\/content\\/staff_profiles.html on Github.\",\"processed\":\"<p>Perch is really big on what we call <em>structured content<\\/em>. This is what makes Perch different from other small <span class=\\\"caps\\\">CMS<\\/span> options. We recognise that not all content is the shape of a blog post &#8212; most things have finer detail than that.<\\/p>\\n\\n<p>Take the example of a list of employee profiles. Each person will have a first and last name, a photo, a job title, an email address and maybe a short biography. In Perch, we like to capture each of those bits of information separately, for a few reasons:<\\/p>\\n\\n\\t<ol>\\n\\t\\t<li>It helps the user who has to enter the content. They can fill out fields without worrying about how it should look &#8211; they just put the right data in the right boxes. Because it&#8217;s easy, it avoids mistakes.<\\/li>\\n\\t\\t<li>If you want to reuse that content in a different form somewhere else on the site, you can.<\\/li>\\n\\t\\t<li>If you change the design of your site, you can update the markup and content separately &#8211; you don&#8217;t have content and <span class=\\\"caps\\\">HTML<\\/span> intermingled.<\\/li>\\n\\t<\\/ol>\\n\\n<p>We do this by creating a template. A template is just an <span class=\\\"caps\\\">HTML<\\/span> snippet, with Perch tags dropped in as placeholders for the content. When you go to edit the region, Perch creates form fields for each of the placeholders.<\\/p>\\n\\n<p>You can <a href=\\\"https:\\/\\/github.com\\/PerchCMS\\/perchdemo-default\\/blob\\/master\\/public_html\\/perch\\/templates\\/content\\/staff_profiles.html\\\">see what the template looks like<\\/a> on Github.<\\/p>\"}}',' Let\'s talk about templates Perch is really big on what we call structured content. This is what makes Perch different from other small CMS options. We recognise that not all content is the shape of a blog post &#8212; most things have finer detail than that.\n\nTake the example of a list of employee profiles. Each person will have a first and last name, a photo, a job title, an email address and maybe a short biography. In Perch, we like to capture each of those bits of information separately, for a few reasons:\n\n	\n		It helps the user who has to enter the content. They can fill out fields without worrying about how it should look &#8211; they just put the right data in the right boxes. Because it&#8217;s easy, it avoids mistakes.\n		If you want to reuse that content in a different form somewhere else on the site, you can.\n		If you change the design of your site, you can update the markup and content separately &#8211; you don&#8217;t have content and HTML intermingled.\n	\n\nWe do this by creating a template. A template is just an HTML snippet, with Perch tags dropped in as placeholders for the content. When you go to edit the region, Perch creates form fields for each of the placeholders.\n\nYou can see what the template looks like on Github. ','0000-00-00 00:00:00',''),(142,21,18,7,1,1000,'{\"_id\":\"21\",\"title\":\"Doorman\",\"_title\":\"Doorman\",\"description\":{\"raw\":\"<p>You\'ll be required to greet and welcome guests as they arrive at our London office.&nbsp;<\\/p><p>There\'s no hiding it, this job requires a lot of standing around.<\\/p>\",\"processed\":\"<p>You\'ll be required to greet and welcome guests as they arrive at our London office.&nbsp;<\\/p><p>There\'s no hiding it, this job requires a lot of standing around.<\\/p>\"},\"requirements\":{\"raw\":\"<p><ul><li>2-3 experience with doors<\\/li><li>Ability to stand for long periods<\\/li><li>Look good in a hat<\\/li><\\/ul><\\/p>\",\"processed\":\"<p><ul><li>2-3 experience with doors<\\/li><li>Ability to stand for long periods<\\/li><li>Look good in a hat<\\/li><\\/ul><\\/p>\"},\"office\":\"London\",\"salary\":\"3,000\",\"deadline\":\"2015-10-26\",\"howtoapply\":{\"raw\":\"<p>Apply in person by delivering your CV to our current doorman. It\'ll cheer him up no end!<\\/p>\",\"processed\":\"<p>Apply in person by delivering your CV to our current doorman. It\'ll cheer him up no end!<\\/p>\"}}',' Doorman You\'ll be required to greet and welcome guests as they arrive at our London office.&nbsp;There\'s no hiding it, this job requires a lot of standing around. 2-3 experience with doorsAbility to stand for long periodsLook good in a hat London 3,000 Monday 26 October 2015 Apply in person by delivering your CV to our current doorman. It\'ll cheer him up no end! ','0000-00-00 00:00:00',''),(128,16,15,4,3,1000,'{\"_id\":\"16\",\"title\":\"London\",\"_title\":\"London\",\"slug\":\"london\"}',' London london ','0000-00-00 00:00:00',''),(129,17,15,4,3,1001,'{\"_id\":\"17\",\"title\":\"New York\",\"_title\":\"New York\",\"slug\":\"new-york\"}',' New York new york ','0000-00-00 00:00:00',''),(130,18,15,4,3,1002,'{\"_id\":\"18\",\"title\":\"Paris\",\"_title\":\"Paris\",\"slug\":\"paris\"}',' Paris paris ','0000-00-00 00:00:00',''),(140,20,17,6,1,1000,'{\"_id\":\"20\",\"title\":\"Window Cleaner\",\"_title\":\"Window Cleaner\",\"description\":{\"raw\":\"<p>You\'ll be required to clean the windows of our extensive Paris office, which is entirely glazed. Working hours are 8am to 8pm with a 20 minute break for lunch.<\\/p><p>The views are spectacular! (Or they will be, once you\'ve cleaned the windows.)<\\/p>\",\"processed\":\"<p>You\'ll be required to clean the windows of our extensive Paris office, which is entirely glazed. Working hours are 8am to 8pm with a 20 minute break for lunch.<\\/p><p>The views are spectacular! (Or they will be, once you\'ve cleaned the windows.)<\\/p>\"},\"requirements\":{\"raw\":\"<p><ul><li>A ladder<\\/li><li>A squeegee<\\/li><li>Mustn\'t be afraid of heights<\\/li><\\/ul><\\/p>\",\"processed\":\"<p><ul><li>A ladder<\\/li><li>A squeegee<\\/li><li>Mustn\'t be afraid of heights<\\/li><\\/ul><\\/p>\"},\"office\":\"Paris\",\"salary\":\"2,000\",\"deadline\":\"2014-06-24\",\"howtoapply\":{\"raw\":\"<p>Hand deliver your CV to the 18th floor of our Paris office. We\'ve left the window open, so just pop it through.<\\/p>\",\"processed\":\"<p>Hand deliver your CV to the 18th floor of our Paris office. We\'ve left the window open, so just pop it through.<\\/p>\"}}',' Window Cleaner You\'ll be required to clean the windows of our extensive Paris office, which is entirely glazed. Working hours are 8am to 8pm with a 20 minute break for lunch.The views are spectacular! (Or they will be, once you\'ve cleaned the windows.) A ladderA squeegeeMustn\'t be afraid of heights Paris 2,000 Tuesday 24 June 2014 Hand deliver your CV to the 18th floor of our Paris office. We\'ve left the window open, so just pop it through. ','0000-00-00 00:00:00',''),(138,19,16,5,7,1000,'{\"_id\":\"19\",\"title\":\"Content Editor\",\"_title\":\"Content Editor\",\"description\":{\"raw\":\"<p>You\'ll be required to edit content on a number of websites. If you\'re the sort of person who likes websites, loves content and wishes that there was some way that they could be combined into the perfect job for you, then this may be the perfect job for you.<\\/p><p>You\'ll be based in our London office, which is close to the Thames. It\'s open plan and a bit drab, but don\'t let that put you off.<\\/p>\",\"processed\":\"<p>You\'ll be required to edit content on a number of websites. If you\'re the sort of person who likes websites, loves content and wishes that there was some way that they could be combined into the perfect job for you, then this may be the perfect job for you.<\\/p><p>You\'ll be based in our London office, which is close to the Thames. It\'s open plan and a bit drab, but don\'t let that put you off.<\\/p>\"},\"requirements\":{\"raw\":\"<p><ul><li>12 months experience with websites<\\/li><li>Knowledge of website content<\\/li><li>A team player <i>(you don\'t have to play in any teams)<\\/i><\\/li><\\/ul><\\/p>\",\"processed\":\"<p><ul><li>12 months experience with websites<\\/li><li>Knowledge of website content<\\/li><li>A team player <i>(you don\'t have to play in any teams)<\\/i><\\/li><\\/ul><\\/p>\"},\"office\":\"London\",\"salary\":\"6,000\",\"deadline\":\"2014-11-24\",\"howtoapply\":{\"raw\":\"<p>Email a CV and covering letter to <a href=\\\"mailto:jobs@grabaperch.com\\\">jobs@grabaperch.com<\\/a>.&nbsp;<\\/p><p><b>Do not call in person.<\\/b><\\/p>\",\"processed\":\"<p>Email a CV and covering letter to <a href=\\\"mailto:jobs@grabaperch.com\\\">jobs@grabaperch.com<\\/a>.&nbsp;<\\/p><p><b>Do not call in person.<\\/b><\\/p>\"}}',' Content Editor You\'ll be required to edit content on a number of websites. If you\'re the sort of person who likes websites, loves content and wishes that there was some way that they could be combined into the perfect job for you, then this may be the perfect job for you.You\'ll be based in our London office, which is close to the Thames. It\'s open plan and a bit drab, but don\'t let that put you off. 12 months experience with websitesKnowledge of website contentA team player (you don\'t have to play in any teams) London 6,000 Monday 24 November 2014 Email a CV and covering letter to jobs@grabaperch.com.&nbsp;Do not call in person. ','0000-00-00 00:00:00',''),(144,22,19,8,0,1000,'','','2015-03-01 17:46:03',''),(145,22,19,8,1,1000,'{\"_id\":\"22\",\"_blocks\":[{\"text\":{\"raw\":\"h1. Blocks and Repeaters\\r\\n\\r\\nOur structured content approach means that you can give your content editors as much or as little freedom as appropriate. When creating very flexible content such as photo essays and blog posts Perch Blocks let you give the editor a choice of template to use. Perch Repeaters manage the addition of multiple images or content areas within one Region.\",\"processed\":\"<h1>Blocks and Repeaters<\\/h1>\\n\\n<p>Our structured content approach means that you can give your content editors as much or as little freedom as appropriate. When creating very flexible content such as photo essays and blog posts Perch Blocks let you give the editor a choice of template to use. Perch Repeaters manage the addition of multiple images or content areas within one Region.<\\/p>\"},\"_block_type\":\"textblock\",\"_block_id\":\"nkjo0u\"}]}',' Blocks and Repeaters\n\nOur structured content approach means that you can give your content editors as much or as little freedom as appropriate. When creating very flexible content such as photo essays and blog posts Perch Blocks let you give the editor a choice of template to use. Perch Repeaters manage the addition of multiple images or content areas within one Region. textblock nkjo0u  ','2015-03-01 17:48:26','1'),(146,22,19,8,2,1000,'{\"_id\":\"22\",\"_blocks\":[{\"text\":{\"raw\":\"h1. Blocks and Repeaters\\r\\n\\r\\nOur structured content approach means that you can give your content editors as much or as little freedom as appropriate. When creating very flexible content such as photo essays and blog posts Perch Blocks let you give the editor a choice of template to use. Perch Repeaters manage the addition of multiple images or content areas within one Region.\",\"processed\":\"<h1>Blocks and Repeaters<\\/h1>\\n\\n<p>Our structured content approach means that you can give your content editors as much or as little freedom as appropriate. When creating very flexible content such as photo essays and blog posts Perch Blocks let you give the editor a choice of template to use. Perch Repeaters manage the addition of multiple images or content areas within one Region.<\\/p>\"},\"_block_type\":\"textblock\",\"_block_id\":\"nkjo0u\",\"_block_index\":\"0\"},{\"heading\":\"Repeating Modules\",\"_title\":\"Repeating Modules\",\"modulelist\":[{\"heading\":\"Blocks\",\"_title\":\"Blocks\",\"url\":null,\"text\":{\"raw\":\"Create flexible, freeform content maintaining a structured content approach.\",\"processed\":\"<p>Create flexible, freeform content maintaining a structured content approach.<\\/p>\"}},{\"heading\":\"Repeaters\",\"_title\":\"Repeaters\",\"url\":null,\"text\":{\"raw\":\"Repeating anything you need to repeat - add images, media, content like these elements.\",\"processed\":\"<p>Repeating anything you need to repeat &#8211; add images, media, content like these elements.<\\/p>\"}},{\"heading\":\"Reorder, add and delete content\",\"_title\":\"Reorder, add and delete content\",\"url\":null,\"text\":{\"raw\":\"Blocks are flexible and the markup is completely under your control!\",\"processed\":\"<p>Blocks are flexible and the markup is completely under your control!<\\/p>\"}}],\"_block_type\":\"modules\",\"_block_id\":\"nkjo53\",\"_block_index\":\"1\"}]}',' Blocks and Repeaters\n\nOur structured content approach means that you can give your content editors as much or as little freedom as appropriate. When creating very flexible content such as photo essays and blog posts Perch Blocks let you give the editor a choice of template to use. Perch Repeaters manage the addition of multiple images or content areas within one Region. textblock nkjo0u 0 Repeating Modules Blocks  Create flexible, freeform content maintaining a structured content approach. Repeaters  Repeating anything you need to repeat &#8211; add images, media, content like these elements. Reorder, add and delete content  Blocks are flexible and the markup is completely under your control! modules nkjo53 1 ','2015-03-01 17:51:37','1'),(147,22,19,8,3,1000,'{\"_id\":\"22\",\"_blocks\":[{\"text\":{\"raw\":\"h1. Blocks and Repeaters\\r\\n\\r\\nOur structured content approach means that you can give your content editors as much or as little freedom as appropriate. When creating very flexible content such as photo essays and blog posts Perch Blocks let you give the editor a choice of template to use. Perch Repeaters manage the addition of multiple images or content areas within one Region.\",\"processed\":\"<h1>Blocks and Repeaters<\\/h1>\\n\\n<p>Our structured content approach means that you can give your content editors as much or as little freedom as appropriate. When creating very flexible content such as photo essays and blog posts Perch Blocks let you give the editor a choice of template to use. Perch Repeaters manage the addition of multiple images or content areas within one Region.<\\/p>\"},\"_block_type\":\"textblock\",\"_block_id\":\"nkjo0u\",\"_block_index\":\"0\"},{\"heading\":\"Repeating Modules\",\"_title\":\"Repeating Modules\",\"modulelist\":[{\"heading\":\"Blocks\",\"_title\":\"Blocks\",\"url\":null,\"text\":{\"raw\":\"Create flexible, freeform content maintaining a structured content approach.\",\"processed\":\"<p>Create flexible, freeform content maintaining a structured content approach.<\\/p>\"}},{\"heading\":\"Repeaters\",\"_title\":\"Repeaters\",\"url\":null,\"text\":{\"raw\":\"Repeating anything you need to repeat - add images, media, content like these boxes.\",\"processed\":\"<p>Repeating anything you need to repeat &#8211; add images, media, content like these boxes.<\\/p>\"}},{\"heading\":\"Reorder, add and delete content\",\"_title\":\"Reorder, add and delete content\",\"url\":null,\"text\":{\"raw\":\"Blocks are flexible and the markup is completely under your control! To add an additional content template for your editor to choose from you add an additional perch:block to the template.\",\"processed\":\"<p>Blocks are flexible and the markup is completely under your control! To add an additional content template for your editor to choose from you add an additional perch:block to the template.<\\/p>\"}}],\"_block_type\":\"modules\",\"_block_id\":\"nkjo53\",\"_block_index\":\"1\"}]}',' Blocks and Repeaters\n\nOur structured content approach means that you can give your content editors as much or as little freedom as appropriate. When creating very flexible content such as photo essays and blog posts Perch Blocks let you give the editor a choice of template to use. Perch Repeaters manage the addition of multiple images or content areas within one Region. textblock nkjo0u 0 Repeating Modules Blocks  Create flexible, freeform content maintaining a structured content approach. Repeaters  Repeating anything you need to repeat &#8211; add images, media, content like these boxes. Reorder, add and delete content  Blocks are flexible and the markup is completely under your control! To add an additional content template for your editor to choose from you add an additional perch:block to the template. modules nkjo53 1 ','2015-03-01 17:55:22','1'),(148,22,19,8,4,1000,'{\"_id\":\"22\",\"_blocks\":[{\"text\":{\"raw\":\"h1. Blocks and Repeaters\\r\\n\\r\\nOur structured content approach means that you can give your content editors as much or as little freedom as appropriate. When creating very flexible content such as photo essays and blog posts Perch Blocks let you give the editor a choice of template to use. Perch Repeaters manage the addition of multiple images or content areas within one Region.\\r\\n\\r\\nCheck out this page in the Perch Admin. You\'ll see that you can choose from a text block or \\\"Modules\\\".\",\"processed\":\"<h1>Blocks and Repeaters<\\/h1>\\n\\n<p>Our structured content approach means that you can give your content editors as much or as little freedom as appropriate. When creating very flexible content such as photo essays and blog posts Perch Blocks let you give the editor a choice of template to use. Perch Repeaters manage the addition of multiple images or content areas within one Region.<\\/p>\\n\\n<p>Check out this page in the Perch Admin. You&#8217;ll see that you can choose from a text block or &#8220;Modules&#8221;.<\\/p>\"},\"_block_type\":\"textblock\",\"_block_id\":\"nkjo0u\",\"_block_index\":\"0\"},{\"heading\":\"Repeating Modules\",\"_title\":\"Repeating Modules\",\"modulelist\":[{\"heading\":\"Blocks\",\"_title\":\"Blocks\",\"url\":null,\"text\":{\"raw\":\"Create flexible, freeform content maintaining a structured content approach.\",\"processed\":\"<p>Create flexible, freeform content maintaining a structured content approach.<\\/p>\"}},{\"heading\":\"Repeaters\",\"_title\":\"Repeaters\",\"url\":null,\"text\":{\"raw\":\"Repeating anything you need to repeat - add images, media, content like these boxes.\",\"processed\":\"<p>Repeating anything you need to repeat &#8211; add images, media, content like these boxes.<\\/p>\"}},{\"heading\":\"Reorder, add and delete content\",\"_title\":\"Reorder, add and delete content\",\"url\":null,\"text\":{\"raw\":\"Blocks are flexible and the markup is completely under your control! To add an additional content template for your editor to choose from you add an additional perch:block to the template.\",\"processed\":\"<p>Blocks are flexible and the markup is completely under your control! To add an additional content template for your editor to choose from you add an additional perch:block to the template.<\\/p>\"}}],\"_block_type\":\"modules\",\"_block_id\":\"nkjo53\",\"_block_index\":\"1\"}]}',' Blocks and Repeaters\n\nOur structured content approach means that you can give your content editors as much or as little freedom as appropriate. When creating very flexible content such as photo essays and blog posts Perch Blocks let you give the editor a choice of template to use. Perch Repeaters manage the addition of multiple images or content areas within one Region.\n\nCheck out this page in the Perch Admin. You&#8217;ll see that you can choose from a text block or &#8220;Modules&#8221;. textblock nkjo0u 0 Repeating Modules Blocks  Create flexible, freeform content maintaining a structured content approach. Repeaters  Repeating anything you need to repeat &#8211; add images, media, content like these boxes. Reorder, add and delete content  Blocks are flexible and the markup is completely under your control! To add an additional content template for your editor to choose from you add an additional perch:block to the template. modules nkjo53 1 ','2015-03-01 17:56:43','1');
/*!40000 ALTER TABLE `perch2_content_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_content_regions`
--

DROP TABLE IF EXISTS `perch2_content_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_content_regions` (
  `regionID` int(10) NOT NULL AUTO_INCREMENT,
  `pageID` int(10) unsigned NOT NULL,
  `regionKey` varchar(255) NOT NULL DEFAULT '',
  `regionPage` varchar(255) NOT NULL DEFAULT '',
  `regionHTML` longtext NOT NULL,
  `regionNew` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `regionOrder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `regionTemplate` varchar(255) NOT NULL DEFAULT '',
  `regionMultiple` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `regionOptions` text NOT NULL,
  `regionSearchable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `regionRev` int(10) unsigned NOT NULL DEFAULT '0',
  `regionLatestRev` int(10) unsigned NOT NULL DEFAULT '0',
  `regionEditRoles` varchar(255) NOT NULL DEFAULT '*',
  `regionUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`regionID`),
  KEY `idx_key` (`regionKey`) USING BTREE,
  KEY `idx_path` (`regionPage`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_content_regions`
--

LOCK TABLES `perch2_content_regions` WRITE;
/*!40000 ALTER TABLE `perch2_content_regions` DISABLE KEYS */;
INSERT INTO `perch2_content_regions` VALUES (3,2,'Site title','*','Demo website',0,0,'text.html',0,'{\"edit_mode\":\"listdetail\",\"searchURL\":\"\",\"title_delimit\":\"\",\"adminOnly\":0,\"addToTop\":0,\"limit\":false}',0,3,3,'*','0000-00-00 00:00:00'),(4,2,'Company name','*','Perch CMS',0,1,'text.html',0,'{\"edit_mode\":\"listdetail\",\"searchURL\":\"\",\"title_delimit\":\"\",\"adminOnly\":0,\"addToTop\":0,\"limit\":false}',0,2,2,'*','0000-00-00 00:00:00'),(5,2,'Welcome message','/index.php','<h1>Welcome to your Perch demo site!</h1>\n<p>You can start off by editing this text. <a href=\"/perch\">Log in</a> to the Perch control panel, and you&#8217;ll find this as <em>Welcome message</em> on the <em>Home page</em>.</p>\n\n<p>For this text, we&#8217;ve chosen to edit it using the Textile formatting language. It&#8217;s text-based and easier to write than <span class=\"caps\">HTML</span>, but still enables you to do text formatting, links, headings and so on. It&#8217;s good at focussing the user on the <em>content</em> and not on the <em>presentation</em>.</p>\n\n<p>Perch also supports Markdown, and has add-ons for common <span class=\"caps\">WYSIWYG</span> editors such as:</p>\n\n	<ul>\n		<li><span class=\"caps\">CKE</span>ditor</li>\n		<li>Redactor</li>\n		<li>TinyMCE</li>\n		<li>Ace</li>\n	</ul>\n\n<p>We&#8217;ll look at some of those later. First, how about some images.</p>',0,3,'intro_block.html',0,'{\"edit_mode\":\"singlepage\"}',1,4,4,'*','0000-00-00 00:00:00'),(6,2,'Feature image','/index.php','<figure>\n	<img alt=\"Streamers everywhere!\" src=\"/perch/resources/img1896-w680@2x.jpg\" width=\"680\" />\n	<figcaption>\n		<h4>Streamers everywhere!</h4>\n		<p>This is an image displayed using the HTML5 <code>figure</code> element. It&#8217;s been set at a width of 680px so any image uploades will be scaled to match. It&#8217;s also set to double pixel density, which makes it perfect for high-<span class=\"caps\">DPI</span> screens. Content managed, retina-ready images &#8211; if you want them.</p>\n	</figcaption>\n</figure>\n',0,4,'figure.html',1,'{\"edit_mode\":\"singlepage\"}',1,7,7,'*','0000-00-00 00:00:00'),(10,2,'Logo','*','<img src=\"/perch/resources/logo.png\" alt=\"Your Logo Here\" class=\"logo\" />',0,2,'logo.html',0,'{\"edit_mode\":\"listdetail\",\"searchURL\":\"\",\"title_delimit\":\"\",\"adminOnly\":0,\"addToTop\":0,\"limit\":false}',0,4,4,'*','0000-00-00 00:00:00'),(9,2,'Feature boxes','/index.php','\n<div class=\"modules\">\n\n	<div class=\"module\">\n		<h3>\n			\n			This is a feature!\n			\n		</h3>\n		<p>I can add lots of these boxes, optionally with a link on the heading. It uses Textile, so I can do <strong>bold</strong> and <em>italic</em> and so on.</p>\n	</div>\n\n\n	<div class=\"module\">\n		<h3>\n			<a href=\"http://docs.grabaperch.com/video/\">\n			See our video tutorial\n			</a>\n		</h3>\n		<p>This box links to the video tutorial. We try to provide both text and videos, as different people like to learn in different ways.</p>\n	</div>\n\n\n	<div class=\"module\">\n		<h3>\n			\n			Add some boxes\n			\n		</h3>\n		<p>Have some fun! You can add as many of these as you want. And they&#8217;re totally free! Aren&#8217;t we generous?</p>\n	</div>\n\n</div>\n\n',0,5,'modules.html',1,'{\"edit_mode\":\"singlepage\",\"sortOrder\":\"ASC\",\"sortField\":\"\",\"limit\":\"\",\"searchURL\":\"\",\"addToTop\":\"\",\"column_ids\":\"heading, url\",\"title_delimit\":\"\",\"adminOnly\":0}',1,7,7,'*','0000-00-00 00:00:00'),(11,2,'Social links','*','\n<ul class=\"social-links\">\n	<li class=\"twitter\"><a href=\"http://twitter.com/grabaperch\" rel=\"me\">Twitter</a></li>\n	<li class=\"facebook\"><a href=\"http://facebook.com/grabaperch\" rel=\"me\">Facebook</a></li>\n	\n	\n</ul>\n',0,6,'social_links.html',0,'{\"edit_mode\":\"listdetail\",\"searchURL\":\"\",\"title_delimit\":\"\",\"adminOnly\":0,\"addToTop\":0,\"limit\":false}',0,12,12,'*','0000-00-00 00:00:00'),(12,3,'Intro','/about/index.php','<h1>Let\'s talk about templates</h1>\n<p>Perch is really big on what we call <em>structured content</em>. This is what makes Perch different from other small <span class=\"caps\">CMS</span> options. We recognise that not all content is the shape of a blog post &#8212; most things have finer detail than that.</p>\n\n<p>Take the example of a list of employee profiles. Each person will have a first and last name, a photo, a job title, an email address and maybe a short biography. In Perch, we like to capture each of those bits of information separately, for a few reasons:</p>\n\n	<ol>\n		<li>It helps the user who has to enter the content. They can fill out fields without worrying about how it should look &#8211; they just put the right data in the right boxes. Because it&#8217;s easy, it avoids mistakes.</li>\n		<li>If you want to reuse that content in a different form somewhere else on the site, you can.</li>\n		<li>If you change the design of your site, you can update the markup and content separately &#8211; you don&#8217;t have content and <span class=\"caps\">HTML</span> intermingled.</li>\n	</ol>\n\n<p>We do this by creating a template. A template is just an <span class=\"caps\">HTML</span> snippet, with Perch tags dropped in as placeholders for the content. When you go to edit the region, Perch creates form fields for each of the placeholders.</p>\n\n<p>You can <a href=\"https://github.com/PerchCMS/perchdemo-default/blob/master/public_html/perch/templates/content/staff_profiles.html\">see what the template looks like</a> on Github.</p>',0,3,'intro_block.html',0,'{\"edit_mode\":\"singlepage\"}',1,9,9,'*','0000-00-00 00:00:00'),(13,3,'Staff profiles','/about/index.php','\n<h2>Our People</h2>\n<div class=\"modules\">\n\n\n<div class=\"module staff-profile\">\n	\n		<img src=\"/perch/resources/rachel-w80h80@2x.jpg\" width=\"80\" height=\"80\" class=\"photo\" />\n	\n	<h3>\n		Rachel\n		Andrew\n	</h3>\n	<p class=\"job-title\">\n		Managing Director\n	</p>\n	<p class=\"email\">\n		<a href=\"mailto:info@edgeofmyseat.com\">Email Rachel</a>\n	</p>\n	<div class=\"bio\">\n		<p>This is another brief biography. It\'s very exciting, you have to admit.</p>\n	</div>\n</div>\n\n\n\n\n<div class=\"module staff-profile\">\n	\n		<img src=\"/perch/resources/drewm-w80h80@2x.jpg\" width=\"80\" height=\"80\" class=\"photo\" />\n	\n	<h3>\n		Drew\n		McLellan\n	</h3>\n	<p class=\"job-title\">\n		Director\n	</p>\n	<p class=\"email\">\n		<a href=\"mailto:hello@grabaperch.com\">Email Drew</a>\n	</p>\n	<div class=\"bio\">\n		<p>This is a brief bio, using the Redactor editor. It has <b>bold</b>&nbsp;and <i>italic </i>and so on.</p>\n	</div>\n</div>\n\n\n\n\n<div class=\"module staff-profile\">\n	\n		<img class=\"photo\" src=\"http://www.gravatar.com/avatar/12a6d4d069cd56cfddaa391c24eb7042?s=160&amp;d=mm\" width=\"80\" height=\"80\" />\n	\n	<h3>\n		{firstname}\n		{lastname}\n	</h3>\n	<p class=\"job-title\">\n		Intern\n	</p>\n	<p class=\"email\">\n		<a href=\"mailto:{email}\">Email {firstname}</a>\n	</p>\n	<div class=\"bio\">\n		<p>That\'s you! Try adding some more, it\'s fun! <i>(It may not actually be fun.)</i></p>\n	</div>\n</div>\n\n\n</div>\n\n',0,4,'staff_profiles.html',1,'{\"edit_mode\":\"listdetail\",\"sortOrder\":\"ASC\",\"sortField\":\"\",\"limit\":\"\",\"searchURL\":\"\",\"addToTop\":\"\",\"column_ids\":\"image[tag], firstname, lastname, jobtitle, email\",\"title_delimit\":\" \",\"adminOnly\":0}',1,22,22,'*','0000-00-00 00:00:00'),(14,4,'Intro','/careers/index.php','<h1>Work with us</h1>\n<p>Although it can be used in lots of different ways, Perch is at its best when critical decisions about site structure and information architecture are made by the web designer, and then set up for the client to work with. Adding new pages to a site is great, but it&#8217;s usually best done within a framework and not haphazardly.</p>\n\n<p>This section has been set up with this approach in mind. Add a new subpage to the Careers page (hover over Careers in the page listing, and click <em>New subpage</em>) to add a new job listing page. The pages will then be summarised below.</p>',0,3,'intro_block.html',0,'{\"edit_mode\":\"singlepage\"}',1,8,8,'*','0000-00-00 00:00:00'),(15,4,'Offices','/careers/index.php','London\nlondonNew York\nnew-yorkParis\nparis',0,4,'office.html',1,'{\"edit_mode\":\"singlepage\"}',1,3,3,'*','0000-00-00 00:00:00'),(16,5,'Job','/careers/content-editor.php','<div class=\"wrapper cols2-nav-right\">\n	<nav class=\"sidebar\">\n		<h3>How to apply</h3>\n		<p>Email a CV and covering letter to <a href=\"mailto:jobs@grabaperch.com\">jobs@grabaperch.com</a>.&nbsp;</p><p><b>Do not call in person.</b></p>\n	</nav>\n	<div class=\"primary-content\">		\n 		<h1>Content Editor</h1>\n\n 		<p>You\'ll be required to edit content on a number of websites. If you\'re the sort of person who likes websites, loves content and wishes that there was some way that they could be combined into the perfect job for you, then this may be the perfect job for you.</p><p>You\'ll be based in our London office, which is close to the Thames. It\'s open plan and a bit drab, but don\'t let that put you off.</p>\n		\n		\n	 		<h2>Requirements</h2>\n	 		<p><ul><li>12 months experience with websites</li><li>Knowledge of website content</li><li>A team player <i>(you don\'t have to play in any teams)</i></li></ul></p>\n	 	\n\n	 	<h2>Details</h2>\n\n		<ul>\n			<li><strong>Office:</strong> London</li>\n			<li><strong>Salary:</strong> &pound;6,000 per annum</li>\n			<li><strong>Application closing date:</strong> 24th November 2014</li>\n		</ul>\n	</div>\n</div>',0,3,'job.html',0,'[]',1,7,7,'*','0000-00-00 00:00:00'),(17,6,'Job','/careers/window-cleaner.php','<div class=\"wrapper cols2-nav-right\">\n	<nav class=\"sidebar\">\n		<h3>How to apply</h3>\n		<p>Hand deliver your CV to the 18th floor of our Paris office. We\'ve left the window open, so just pop it through.</p>\n	</nav>\n	<div class=\"primary-content\">		\n 		<h1>Window Cleaner</h1>\n\n 		<p>You\'ll be required to clean the windows of our extensive Paris office, which is entirely glazed. Working hours are 8am to 8pm with a 20 minute break for lunch.</p><p>The views are spectacular! (Or they will be, once you\'ve cleaned the windows.)</p>\n		\n		\n	 		<h2>Requirements</h2>\n	 		<p><ul><li>A ladder</li><li>A squeegee</li><li>Mustn\'t be afraid of heights</li></ul></p>\n	 	\n\n	 	<h2>Details</h2>\n\n		<ul>\n			<li><strong>Office:</strong> Paris</li>\n			<li><strong>Salary:</strong> &pound;2,000 per annum</li>\n			<li><strong>Application closing date:</strong> 24th June 2014</li>\n		</ul>\n	</div>\n</div>',0,3,'job.html',0,'[]',1,1,1,'*','0000-00-00 00:00:00'),(18,7,'Job','/careers/doorman.php','<div class=\"wrapper cols2-nav-right\">\n	<nav class=\"sidebar\">\n		<h3>How to apply</h3>\n		<p>Apply in person by delivering your CV to our current doorman. It\'ll cheer him up no end!</p>\n	</nav>\n	<div class=\"primary-content\">		\n 		<h1>Doorman</h1>\n\n 		<p>You\'ll be required to greet and welcome guests as they arrive at our London office.&nbsp;</p><p>There\'s no hiding it, this job requires a lot of standing around.</p>\n		\n		\n	 		<h2>Requirements</h2>\n	 		<p><ul><li>2-3 experience with doors</li><li>Ability to stand for long periods</li><li>Look good in a hat</li></ul></p>\n	 	\n\n	 	<h2>Details</h2>\n\n		<ul>\n			<li><strong>Office:</strong> London</li>\n			<li><strong>Salary:</strong> &pound;3,000 per annum</li>\n			<li><strong>Application closing date:</strong> 26th October 2015</li>\n		</ul>\n	</div>\n</div>',0,3,'job.html',0,'[]',1,1,1,'*','0000-00-00 00:00:00'),(19,8,'Content','/blocks/index.php',' \n  \n     <h1>Blocks and Repeaters</h1>\n\n<p>Our structured content approach means that you can give your content editors as much or as little freedom as appropriate. When creating very flexible content such as photo essays and blog posts Perch Blocks let you give the editor a choice of template to use. Perch Repeaters manage the addition of multiple images or content areas within one Region.</p>\n\n<p>Check out this page in the Perch Admin. You&#8217;ll see that you can choose from a text block or &#8220;Modules&#8221;.</p>\n  \n\n  \n\n\n\n  \n    <h2>Repeating Modules</h2>\n\n    \n      \n        <div class=\"modules\">\n      \n        <div class=\"module\">\n        <h3>\n          \n          Blocks\n          \n        </h3>\n        <p>Create flexible, freeform content maintaining a structured content approach.</p>\n      </div>\n      \n    \n      \n        <div class=\"module\">\n        <h3>\n          \n          Repeaters\n          \n        </h3>\n        <p>Repeating anything you need to repeat &#8211; add images, media, content like these boxes.</p>\n      </div>\n      \n    \n      \n        <div class=\"module\">\n        <h3>\n          \n          Reorder, add and delete content\n          \n        </h3>\n        <p>Blocks are flexible and the markup is completely under your control! To add an additional content template for your editor to choose from you add an additional perch:block to the template.</p>\n      </div>\n      \n        </div>\n      \n    \n\n  \n\n  \n\n\n',0,3,'blocks.html',0,'{\"edit_mode\":\"singlepage\"}',1,4,4,'*','2015-03-01 17:56:43');
/*!40000 ALTER TABLE `perch2_content_regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_navigation`
--

DROP TABLE IF EXISTS `perch2_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_navigation` (
  `groupID` int(10) NOT NULL AUTO_INCREMENT,
  `groupTitle` varchar(255) NOT NULL DEFAULT '',
  `groupSlug` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`groupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_navigation`
--

LOCK TABLES `perch2_navigation` WRITE;
/*!40000 ALTER TABLE `perch2_navigation` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_navigation_pages`
--

DROP TABLE IF EXISTS `perch2_navigation_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_navigation_pages` (
  `navpageID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pageID` int(10) unsigned NOT NULL DEFAULT '0',
  `groupID` int(10) unsigned NOT NULL DEFAULT '0',
  `pageParentID` int(10) unsigned NOT NULL DEFAULT '0',
  `pageOrder` int(10) unsigned NOT NULL DEFAULT '1',
  `pageDepth` tinyint(10) unsigned NOT NULL,
  `pageTreePosition` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`navpageID`),
  KEY `idx_group` (`groupID`),
  KEY `idx_page_group` (`pageID`,`groupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_navigation_pages`
--

LOCK TABLES `perch2_navigation_pages` WRITE;
/*!40000 ALTER TABLE `perch2_navigation_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_navigation_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_page_templates`
--

DROP TABLE IF EXISTS `perch2_page_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_page_templates` (
  `templateID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `templateTitle` varchar(255) NOT NULL DEFAULT '',
  `templatePath` varchar(255) NOT NULL DEFAULT '',
  `optionsPageID` int(10) unsigned NOT NULL DEFAULT '0',
  `templateReference` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `templateNavGroups` varchar(255) DEFAULT '',
  PRIMARY KEY (`templateID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_page_templates`
--

LOCK TABLES `perch2_page_templates` WRITE;
/*!40000 ALTER TABLE `perch2_page_templates` DISABLE KEYS */;
INSERT INTO `perch2_page_templates` VALUES (1,'Default','default.php',0,1,''),(2,'Job Listing','job_listing.php',0,1,'');
/*!40000 ALTER TABLE `perch2_page_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_pages`
--

DROP TABLE IF EXISTS `perch2_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_pages` (
  `pageID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pageParentID` int(10) unsigned NOT NULL DEFAULT '0',
  `pagePath` varchar(255) NOT NULL DEFAULT '',
  `pageTitle` varchar(255) NOT NULL DEFAULT '',
  `pageNavText` varchar(255) NOT NULL DEFAULT '',
  `pageNew` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `pageOrder` int(10) unsigned NOT NULL DEFAULT '1',
  `pageDepth` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `pageSortPath` varchar(255) NOT NULL DEFAULT '',
  `pageTreePosition` varchar(64) NOT NULL DEFAULT '',
  `pageSubpageRoles` varchar(255) NOT NULL DEFAULT '',
  `pageSubpagePath` varchar(255) NOT NULL DEFAULT '',
  `pageHidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pageNavOnly` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pageAccessTags` varchar(255) NOT NULL DEFAULT '',
  `pageCreatorID` int(10) unsigned NOT NULL DEFAULT '0',
  `pageModified` datetime NOT NULL DEFAULT '2014-01-01 00:00:00',
  `pageAttributes` text NOT NULL,
  `pageAttributeTemplate` varchar(255) NOT NULL DEFAULT 'default.html',
  `pageTemplate` char(255) NOT NULL DEFAULT '',
  `templateID` int(10) unsigned NOT NULL DEFAULT '0',
  `pageSubpageTemplates` varchar(255) NOT NULL DEFAULT '',
  `pageCollections` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`pageID`),
  KEY `idx_parent` (`pageParentID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_pages`
--

LOCK TABLES `perch2_pages` WRITE;
/*!40000 ALTER TABLE `perch2_pages` DISABLE KEYS */;
INSERT INTO `perch2_pages` VALUES (2,0,'/index.php','Home page','Home page',0,1,1,'','000-001','','',0,0,'',0,'2014-02-11 10:38:03','{\"description\":{\"raw\":\"\",\"processed\":\"\"},\"keywords\":{\"raw\":\"\",\"processed\":\"\"},\"nofollow\":\"nofollow\"}','default.html','',0,'',''),(3,0,'/about/index.php','About','About',0,2,1,'//about','000-002','','/about',0,0,'',0,'2014-01-01 00:00:00','','default.html','',0,'',''),(4,0,'/careers/index.php','Careers','Careers',0,3,1,'/careers','000-003','','/careers',0,0,'',0,'2014-01-01 00:00:00','','default.html','',0,'',''),(5,4,'/careers/content-editor.php','Content Editor','Content Editor',0,5,2,'/careers/content-editor','000-003-005','','',0,0,'',0,'2014-01-01 00:00:00','','default.html','',0,'',''),(6,4,'/careers/window-cleaner.php','Window Cleaner','Window Cleaner',0,6,2,'/careers/window-cleaner','000-003-006','','',0,0,'',0,'2014-01-01 00:00:00','','default.html','',0,'',''),(7,4,'/careers/doorman.php','Doorman','Doorman',0,4,2,'/careers/doorman','000-003-004','*','/careers',0,0,'',0,'2014-01-01 00:00:00','','default.html','',0,'',''),(8,0,'/blocks/index.php','Blocks','Blocks',0,4,1,'/blocks','000-004','','',0,0,'',0,'2015-03-01 17:56:43','','default.html','',0,'','');
/*!40000 ALTER TABLE `perch2_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_resource_log`
--

DROP TABLE IF EXISTS `perch2_resource_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_resource_log` (
  `logID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `appID` char(32) NOT NULL DEFAULT 'content',
  `itemFK` char(32) NOT NULL DEFAULT 'itemRowID',
  `itemRowID` int(10) unsigned NOT NULL,
  `resourceID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`logID`),
  UNIQUE KEY `idx_uni` (`appID`,`itemFK`,`itemRowID`,`resourceID`),
  KEY `idx_fk` (`itemFK`,`itemRowID`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_resource_log`
--

LOCK TABLES `perch2_resource_log` WRITE;
/*!40000 ALTER TABLE `perch2_resource_log` DISABLE KEYS */;
INSERT INTO `perch2_resource_log` VALUES (1,'content','itemRowID',20,1),(2,'content','itemRowID',20,2),(3,'content','itemRowID',20,4),(4,'content','itemRowID',45,7),(5,'content','itemRowID',45,8),(6,'content','itemRowID',109,12),(7,'content','itemRowID',109,13),(8,'content','itemRowID',109,14),(9,'content','itemRowID',110,9),(10,'content','itemRowID',110,10),(11,'content','itemRowID',110,11);
/*!40000 ALTER TABLE `perch2_resource_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_resource_tags`
--

DROP TABLE IF EXISTS `perch2_resource_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_resource_tags` (
  `tagID` int(10) NOT NULL AUTO_INCREMENT,
  `tagTitle` varchar(255) NOT NULL DEFAULT '',
  `tagSlug` varchar(255) NOT NULL DEFAULT '',
  `tagCount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tagID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_resource_tags`
--

LOCK TABLES `perch2_resource_tags` WRITE;
/*!40000 ALTER TABLE `perch2_resource_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_resource_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_resources`
--

DROP TABLE IF EXISTS `perch2_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_resources` (
  `resourceID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resourceApp` char(32) NOT NULL DEFAULT 'content',
  `resourceBucket` char(16) NOT NULL DEFAULT 'default',
  `resourceFile` char(255) NOT NULL DEFAULT '',
  `resourceKey` enum('orig','thumb') DEFAULT NULL,
  `resourceParentID` int(10) NOT NULL DEFAULT '0',
  `resourceType` char(4) NOT NULL DEFAULT '',
  `resourceCreated` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `resourceUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `resourceAWOL` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `resourceTitle` char(255) DEFAULT NULL,
  `resourceFileSize` int(10) unsigned DEFAULT NULL,
  `resourceWidth` int(10) unsigned DEFAULT NULL,
  `resourceHeight` int(10) unsigned DEFAULT NULL,
  `resourceCrop` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `resourceDensity` float NOT NULL DEFAULT '1',
  `resourceTargetWidth` int(10) unsigned DEFAULT NULL,
  `resourceTargetHeight` int(10) unsigned DEFAULT NULL,
  `resourceMimeType` char(64) DEFAULT NULL,
  `resourceInLibrary` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`resourceID`),
  UNIQUE KEY `idx_file` (`resourceBucket`,`resourceFile`),
  KEY `idx_app` (`resourceApp`),
  KEY `idx_key` (`resourceKey`),
  KEY `idx_type` (`resourceType`),
  KEY `idx_awol` (`resourceAWOL`),
  KEY `idx_library` (`resourceInLibrary`),
  FULLTEXT KEY `idx_search` (`resourceTitle`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_resources`
--

LOCK TABLES `perch2_resources` WRITE;
/*!40000 ALTER TABLE `perch2_resources` DISABLE KEYS */;
INSERT INTO `perch2_resources` VALUES (1,'content','default','img1896.jpg','orig',0,'jpg','2000-01-01 00:00:00','2014-07-10 16:56:28',0,'Img1896',384001,1400,933,0,1,NULL,NULL,'image/jpeg',0),(2,'content','default','img1896-thumb.jpg','thumb',1,'jpg','2000-01-01 00:00:00','2014-07-10 16:56:28',0,NULL,9213,150,99,0,1,150,150,'image/jpeg',0),(10,'content','default','drewm-thumb.jpg','thumb',9,'jpg','2000-01-01 00:00:00','2014-07-10 16:56:28',0,NULL,4534,150,150,1,1,150,150,'image/jpeg',0),(4,'content','default','img1896-w680@2x.jpg','',1,'jpg','2000-01-01 00:00:00','2014-07-10 16:56:28',0,NULL,198084,680,453,0,2,680,NULL,'image/jpeg',0),(9,'content','default','drewm.jpg','orig',0,'jpg','2000-01-01 00:00:00','2014-07-10 16:56:28',0,'Drewm',17064,320,320,0,1,NULL,NULL,'image/jpeg',0),(7,'content','default','logo.png','orig',0,'png','2000-01-01 00:00:00','2014-07-10 16:56:28',0,'Logo',3675,260,55,0,1,NULL,NULL,'image/png',0),(8,'content','default','logo-thumb.png','thumb',7,'png','2000-01-01 00:00:00','2014-07-10 16:56:28',0,NULL,7039,150,31,0,1,150,150,'image/png',0),(11,'content','default','drewm-w80h80@2x.jpg','',9,'jpg','2000-01-01 00:00:00','2014-07-10 16:56:28',0,NULL,5024,80,80,1,2,80,80,'image/jpeg',0),(12,'content','default','rachel.jpg','orig',0,'jpg','2000-01-01 00:00:00','2014-07-10 16:56:28',0,'Rachel',23652,320,320,0,1,NULL,NULL,'image/jpeg',0),(13,'content','default','rachel-thumb.jpg','thumb',12,'jpg','2000-01-01 00:00:00','2014-07-10 16:56:28',0,NULL,6552,150,150,1,1,150,150,'image/jpeg',0),(14,'content','default','rachel-w80h80@2x.jpg','',12,'jpg','2000-01-01 00:00:00','2014-07-10 16:56:28',0,NULL,7231,80,80,1,2,80,80,'image/jpeg',0);
/*!40000 ALTER TABLE `perch2_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_resources_to_tags`
--

DROP TABLE IF EXISTS `perch2_resources_to_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_resources_to_tags` (
  `resourceID` int(10) NOT NULL DEFAULT '0',
  `tagID` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`resourceID`,`tagID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_resources_to_tags`
--

LOCK TABLES `perch2_resources_to_tags` WRITE;
/*!40000 ALTER TABLE `perch2_resources_to_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_resources_to_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_scheduled_tasks`
--

DROP TABLE IF EXISTS `perch2_scheduled_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_scheduled_tasks` (
  `taskID` int(10) NOT NULL AUTO_INCREMENT,
  `taskStartTime` datetime NOT NULL,
  `taskEndTime` datetime DEFAULT NULL,
  `taskApp` varchar(64) NOT NULL DEFAULT '',
  `taskKey` varchar(64) DEFAULT NULL,
  `taskResult` enum('OK','WARNING','FAILED') NOT NULL DEFAULT 'FAILED',
  `taskMessage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`taskID`),
  KEY `idx_app` (`taskApp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_scheduled_tasks`
--

LOCK TABLES `perch2_scheduled_tasks` WRITE;
/*!40000 ALTER TABLE `perch2_scheduled_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `perch2_scheduled_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_settings`
--

DROP TABLE IF EXISTS `perch2_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_settings` (
  `settingID` varchar(60) NOT NULL DEFAULT '',
  `userID` int(10) unsigned NOT NULL DEFAULT '0',
  `settingValue` text NOT NULL,
  PRIMARY KEY (`settingID`,`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_settings`
--

LOCK TABLES `perch2_settings` WRITE;
/*!40000 ALTER TABLE `perch2_settings` DISABLE KEYS */;
INSERT INTO `perch2_settings` VALUES ('headerColour',0,'#ffffff'),('content_singlePageEdit',0,'1'),('helpURL',0,''),('siteURL',0,'/'),('hideBranding',0,'0'),('content_collapseList',0,'1'),('lang',0,'en-gb'),('update_2.2.9',0,'done'),('latest_version',0,'2.7.10'),('update_2.3.1',0,'done'),('update_2.4.4',0,'done'),('headerScheme',0,'light'),('content_frontend_edit',0,'0'),('dashboard',0,'0'),('content_hideNonEditableRegions',0,'0'),('on_sale_version',0,'2.7.10'),('update_2.5.3',0,'done'),('update_2.6.4',0,'done'),('update_2.6.5',0,'done'),('update_2.7.10',0,'done'),('update_2.8',0,'done');
/*!40000 ALTER TABLE `perch2_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_user_privileges`
--

DROP TABLE IF EXISTS `perch2_user_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_user_privileges` (
  `privID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `privKey` varchar(255) NOT NULL DEFAULT '',
  `privTitle` varchar(255) NOT NULL DEFAULT '',
  `privOrder` int(10) unsigned NOT NULL DEFAULT '99',
  PRIMARY KEY (`privID`),
  UNIQUE KEY `idx_key` (`privKey`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_user_privileges`
--

LOCK TABLES `perch2_user_privileges` WRITE;
/*!40000 ALTER TABLE `perch2_user_privileges` DISABLE KEYS */;
INSERT INTO `perch2_user_privileges` VALUES (1,'perch.login','Log in',1),(2,'perch.settings','Change settings',2),(3,'perch.users.manage','Manage users',3),(4,'perch.updatenotices','View update notices',4),(5,'content.regions.delete','Delete regions',1),(6,'content.regions.options','Edit region options',2),(7,'content.pages.edit','Edit page details',1),(8,'content.pages.reorder','Reorder pages',2),(9,'content.pages.create','Add new pages',3),(10,'content.pages.configure','Configure page settings',5),(11,'content.pages.delete','Delete pages',4),(12,'content.templates.delete','Delete master pages',6),(13,'content.navgroups.configure','Configure navigation groups',7),(14,'content.navgroups.create','Create navigation groups',8),(15,'content.navgroups.delete','Delete navigation groups',9),(16,'content.pages.create.toplevel','Add new top-level pages',3),(17,'content.pages.delete.own','Delete pages they created themselves',4),(18,'content.templates.configure','Configure master pages',6),(19,'content.pages.republish','Republish pages',12),(20,'content.pages.attributes','Edit page titles and attributes',6),(21,'assets.create','Upload assets',1),(22,'categories.create','Create new categories',1),(23,'categories.delete','Delete categories',2),(24,'categories.manage','Manage categories',3),(25,'categories.sets.create','Create category sets',4),(26,'categories.sets.delete','Delete category sets',5);
/*!40000 ALTER TABLE `perch2_user_privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_user_role_privileges`
--

DROP TABLE IF EXISTS `perch2_user_role_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_user_role_privileges` (
  `roleID` int(10) unsigned NOT NULL,
  `privID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`roleID`,`privID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_user_role_privileges`
--

LOCK TABLES `perch2_user_role_privileges` WRITE;
/*!40000 ALTER TABLE `perch2_user_role_privileges` DISABLE KEYS */;
INSERT INTO `perch2_user_role_privileges` VALUES (1,1),(1,7),(1,8),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12);
/*!40000 ALTER TABLE `perch2_user_role_privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_user_roles`
--

DROP TABLE IF EXISTS `perch2_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_user_roles` (
  `roleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleTitle` varchar(255) NOT NULL DEFAULT '',
  `roleSlug` varchar(255) NOT NULL DEFAULT '',
  `roleMasterAdmin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_user_roles`
--

LOCK TABLES `perch2_user_roles` WRITE;
/*!40000 ALTER TABLE `perch2_user_roles` DISABLE KEYS */;
INSERT INTO `perch2_user_roles` VALUES (1,'Editor','editor',0),(2,'Admin','admin',1);
/*!40000 ALTER TABLE `perch2_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perch2_users`
--

DROP TABLE IF EXISTS `perch2_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perch2_users` (
  `userID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userUsername` varchar(255) NOT NULL DEFAULT '',
  `userPassword` varchar(255) NOT NULL DEFAULT '',
  `userCreated` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `userUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userLastLogin` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `userGivenName` varchar(255) NOT NULL DEFAULT '',
  `userFamilyName` varchar(255) NOT NULL DEFAULT '',
  `userEmail` varchar(255) NOT NULL DEFAULT '',
  `userEnabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userHash` char(32) NOT NULL DEFAULT '',
  `roleID` int(10) unsigned NOT NULL DEFAULT '1',
  `userMasterAdmin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`),
  KEY `idx_enabled` (`userEnabled`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perch2_users`
--

LOCK TABLES `perch2_users` WRITE;
/*!40000 ALTER TABLE `perch2_users` DISABLE KEYS */;
INSERT INTO `perch2_users` VALUES (1,'{username}','$P$BkeZrexrpIKOp64CFuJIjGTSbFBhe51','2013-06-23 12:14:42','2015-03-01 17:56:43','2015-03-01 17:29:53','{firstname}','{lastname}','{email}',1,'5be82270be73603d659f28a4916c7508',2,1);
/*!40000 ALTER TABLE `perch2_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-01 23:17:16
