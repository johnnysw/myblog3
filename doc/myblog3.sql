/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50624
 Source Host           : localhost
 Source Database       : myblog3

 Target Server Type    : MySQL
 Target Server Version : 50624
 File Encoding         : utf-8

 Date: 09/21/2016 16:18:48 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_admin`
-- ----------------------------
BEGIN;
INSERT INTO `t_admin` VALUES ('1', 'admin', '123456'), ('2', 'lisi', '1234'), ('3', 'wangwu', '1234');
COMMIT;

-- ----------------------------
--  Table structure for `t_blog`
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog` (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `img` varchar(255) DEFAULT NULL,
  `big_img` varchar(255) DEFAULT NULL,
  `post_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `clicked` int(11) DEFAULT '0',
  `cate_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_blog`
-- ----------------------------
BEGIN;
INSERT INTO `t_blog` VALUES ('1', '今天天不好', '不爽', 'upload/pi.jpg', 'upload/pi.jpg', '2016-09-06 14:37:25', '11', '1'), ('2', 'aaa', 'bbbb', 'upload/pi2.jpg', 'upload/pi2.jpg', '2016-09-14 11:44:01', '22', '1'), ('3', 'cccc', 'ddd', 'upload/pi3.jpg', 'upload/pi3.jpg', '2016-09-14 11:44:09', '33', '2'), ('4', 'eeee', 'fff', 'upload/pi4.jpg', 'upload/pi4.jpg', '2016-09-14 11:44:28', '44', '1'), ('5', 'gggg', 'hhhh', 'upload/pi5.jpg', 'upload/pi5.jpg', '2016-09-14 11:44:35', '55', '1'), ('6', '今天天不好', '不爽', 'upload/pi.jpg', 'upload/pi.jpg', '2016-09-06 14:37:25', '11', '1'), ('7', 'aaa', 'bbbb', 'upload/pi2.jpg', 'upload/pi2.jpg', '2016-09-14 11:44:01', '22', '3'), ('8', 'cccc', 'ddd', 'upload/pi3.jpg', 'upload/pi3.jpg', '2016-09-14 11:44:09', '33', '2'), ('9', 'eeee', 'fff', 'upload/pi4.jpg', 'upload/pi4.jpg', '2016-09-14 11:44:28', '44', '1'), ('10', 'gggg', 'hhhh', 'upload/pi5.jpg', 'upload/pi5.jpg', '2016-09-14 11:44:35', '55', '1'), ('11', '今天天不好', '不爽', 'upload/pi.jpg', 'upload/pi.jpg', '2016-09-06 14:37:25', '11', '1'), ('12', 'aaa', 'bbbb', 'upload/pi2.jpg', 'upload/pi2.jpg', '2016-09-14 11:44:01', '22', '1'), ('13', 'cccc', 'ddd', 'upload/pi3.jpg', 'upload/pi3.jpg', '2016-09-14 11:44:09', '33', '2'), ('14', 'eeee', 'fff', 'upload/pi4.jpg', 'upload/pi4.jpg', '2016-09-14 11:44:28', '44', '3'), ('15', 'gggg', 'hhhh', 'upload/pi5.jpg', 'upload/pi5.jpg', '2016-09-14 11:44:35', '55', '3'), ('16', 'opopopop', '<span style=\"font-size:24px;color:#006600;\">afasdf</span>', null, null, '2016-09-21 15:07:51', '345', '1'), ('17', '88989', '<span style=\"color:#E56600;\">dadad</span>', null, null, '2016-09-21 15:19:45', '323', '1'), ('18', 'uuuu', '', 'upload/20160921092231_65947.jpg', null, '2016-09-21 15:22:31', '464', '3'), ('19', 'yy', '', 'upload/20160921092604_64513.jpg', null, '2016-09-21 15:26:04', '23423', '1'), ('20', '67567', '', 'upload/20160921093149_93548.jpg', null, '2016-09-21 15:31:49', '567', '1'), ('21', 'qeqew', '', 'upload/20160921093332_85708.jpg', null, '2016-09-21 15:33:32', '1212', '1'), ('22', '78787', '', 'upload/20160921093730_84619_thumb.jpg', 'upload/20160921093730_84619.jpg', '2016-09-21 15:37:30', '0', '1'), ('23', 'sdsd', 'sfsf', 'upload/20160921093931_44923_thumb.jpg', 'upload/20160921093931_44923.jpg', '2016-09-21 15:39:31', '323', '1'), ('24', '这是真正的文章了', '<p style=\"text-align:center;\">\n	<span style=\"font-size:16px;\">hahaha</span>\n</p>\n<p style=\"text-align:center;\">\n	<span style=\"font-size:16px;\"><img src=\"/myblog3/assets/kindeditor/attached/image/20160921/20160921094124_17449.jpg\" alt=\"\" /><br />\n</span>\n</p>\n<p>\n	<br />\n</p>', 'upload/20160921094126_36323_thumb.jpg', 'upload/20160921094126_36323.jpg', '2016-09-21 15:41:26', '111', '1'), ('26', '&lt;script&gt;alert(\'hahahhohoho\');&lt;/script&gt;', 'eqew', 'upload/20160921094632_25696_thumb.jpg', 'upload/20160921094632_25696.jpg', '2016-09-21 15:46:32', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_blog_category`
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_category`;
CREATE TABLE `t_blog_category` (
  `cate_id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(100) DEFAULT NULL,
  `is_delete` varchar(1) DEFAULT '0',
  PRIMARY KEY (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_blog_category`
-- ----------------------------
BEGIN;
INSERT INTO `t_blog_category` VALUES ('1', 'Web', '0'), ('2', 'Mobile', '1'), ('3', 'Design', '0'), ('4', 'yyyyyy', '0');
COMMIT;

-- ----------------------------
--  Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `message` text,
  `post_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `blog_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `blog_id` (`blog_id`),
  KEY `blog_id_2` (`blog_id`),
  CONSTRAINT `fk_blog_comment` FOREIGN KEY (`blog_id`) REFERENCES `t_blog` (`blog_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_comment`
-- ----------------------------
BEGIN;
INSERT INTO `t_comment` VALUES ('1', 'lisi', null, null, 'haha', '2016-09-10 14:38:12', '1'), ('2', 'wangwu', null, null, 'hehe', '2016-09-10 14:38:21', '1'), ('3', 'ss', null, null, null, '2016-09-06 11:43:00', '1'), ('4', 'lisi', 'lisi@163.com', '111111', '1221212', '2016-09-18 15:36:19', null), ('5', '555555', '55533', '434343', '43434', '2016-09-18 15:36:49', null), ('6', '5555559999', '55533', '434343', '43434', '2016-09-18 15:37:05', null), ('7', 'adadada', 'adads', 'adadad', 'ad', '2016-09-18 15:38:12', null), ('8', '8888567567576', '888', '557', '567', '2016-09-18 15:39:18', null), ('9', '67676', '67676', '767676', '76', '2016-09-18 15:44:33', '4'), ('10', '22222', '22222', '', '22', '2016-09-18 15:48:59', '4'), ('11', 'rrrr', 'rrr', 'rrrrr', 'rrr', '2016-09-18 15:50:22', '4'), ('12', '888', '8787', '787878', '8778', '2016-09-18 15:55:28', '4'), ('13', '565', '56565', '6565', '656', '2016-09-18 16:00:06', '4');
COMMIT;

-- ----------------------------
--  Table structure for `t_message`
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
