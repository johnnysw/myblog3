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

 Date: 09/18/2016 09:47:15 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_admin`
-- ----------------------------
BEGIN;
INSERT INTO `t_admin` VALUES ('1', 'admin', '123456');
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
  `post_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `clicked` int(11) DEFAULT '0',
  `cate_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_blog`
-- ----------------------------
BEGIN;
INSERT INTO `t_blog` VALUES ('1', '今天天不好', '不爽', 'upload/pi.jpg', '2016-09-06 14:37:25', '11', '1'), ('2', 'aaa', 'bbbb', 'upload/pi2.jpg', '2016-09-14 11:44:01', '22', '1'), ('3', 'cccc', 'ddd', 'upload/pi3.jpg', '2016-09-14 11:44:09', '33', '2'), ('4', 'eeee', 'fff', 'upload/pi4.jpg', '2016-09-14 11:44:28', '44', '1'), ('5', 'gggg', 'hhhh', 'upload/pi5.jpg', '2016-09-14 11:44:35', '55', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_blog_category`
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_category`;
CREATE TABLE `t_blog_category` (
  `cate_id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_blog_category`
-- ----------------------------
BEGIN;
INSERT INTO `t_blog_category` VALUES ('1', 'Web'), ('2', 'Mobile'), ('3', 'Design');
COMMIT;

-- ----------------------------
--  Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `content` text,
  `post_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `blog_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `blog_id` (`blog_id`),
  KEY `blog_id_2` (`blog_id`),
  CONSTRAINT `fk_blog_comment` FOREIGN KEY (`blog_id`) REFERENCES `t_blog` (`blog_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_comment`
-- ----------------------------
BEGIN;
INSERT INTO `t_comment` VALUES ('1', 'lisi', 'haha', '2016-09-10 14:38:12', '1'), ('2', 'wangwu', 'hehe', '2016-09-10 14:38:21', '1'), ('3', 'ss', null, '0000-00-00 00:00:00', '1');
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
