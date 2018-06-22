/*
 Navicat Premium Data Transfer

 Source Server         : Lee
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : aj

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 20/06/2018 16:15:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ihome_area
-- ----------------------------
DROP TABLE IF EXISTS `ihome_area`;
CREATE TABLE `ihome_area` (
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ihome_area
-- ----------------------------
BEGIN;
INSERT INTO `ihome_area` VALUES (NULL, NULL, 1, '锦江区');
INSERT INTO `ihome_area` VALUES (NULL, NULL, 2, '金牛区');
INSERT INTO `ihome_area` VALUES (NULL, NULL, 3, '青羊区');
INSERT INTO `ihome_area` VALUES (NULL, NULL, 4, '高新区');
INSERT INTO `ihome_area` VALUES (NULL, NULL, 5, '武侯区');
INSERT INTO `ihome_area` VALUES (NULL, NULL, 6, '天府新区');
INSERT INTO `ihome_area` VALUES (NULL, NULL, 7, '双流县');
INSERT INTO `ihome_area` VALUES (NULL, NULL, 8, '成华区');
INSERT INTO `ihome_area` VALUES (NULL, NULL, 9, '青白江区');
INSERT INTO `ihome_area` VALUES (NULL, NULL, 10, '新都区');
INSERT INTO `ihome_area` VALUES (NULL, NULL, 11, '温江区');
INSERT INTO `ihome_area` VALUES (NULL, NULL, 12, '温江区');
INSERT INTO `ihome_area` VALUES (NULL, NULL, 13, '郫县');
INSERT INTO `ihome_area` VALUES (NULL, NULL, 14, '蒲江县');
INSERT INTO `ihome_area` VALUES (NULL, NULL, 15, '大邑县');
INSERT INTO `ihome_area` VALUES (NULL, NULL, 16, '新津县');
COMMIT;

-- ----------------------------
-- Table structure for ihome_facility
-- ----------------------------
DROP TABLE IF EXISTS `ihome_facility`;
CREATE TABLE `ihome_facility` (
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `css` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ihome_house
-- ----------------------------
DROP TABLE IF EXISTS `ihome_house`;
CREATE TABLE `ihome_house` (
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `address` varchar(512) DEFAULT NULL,
  `room_count` int(11) DEFAULT NULL,
  `acreage` int(11) DEFAULT NULL,
  `unit` varchar(32) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `beds` varchar(64) DEFAULT NULL,
  `deposit` int(11) DEFAULT NULL,
  `min_days` int(11) DEFAULT NULL,
  `max_days` int(11) DEFAULT NULL,
  `order_count` int(11) DEFAULT NULL,
  `index_image_url` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `area_id` (`area_id`),
  CONSTRAINT `ihome_house_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ihome_user` (`id`),
  CONSTRAINT `ihome_house_ibfk_2` FOREIGN KEY (`area_id`) REFERENCES `ihome_area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ihome_house_facility
-- ----------------------------
DROP TABLE IF EXISTS `ihome_house_facility`;
CREATE TABLE `ihome_house_facility` (
  `house_id` int(11) NOT NULL,
  `facility_id` int(11) NOT NULL,
  PRIMARY KEY (`house_id`,`facility_id`),
  KEY `facility_id` (`facility_id`),
  CONSTRAINT `ihome_house_facility_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `ihome_house` (`id`),
  CONSTRAINT `ihome_house_facility_ibfk_2` FOREIGN KEY (`facility_id`) REFERENCES `ihome_facility` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ihome_house_image
-- ----------------------------
DROP TABLE IF EXISTS `ihome_house_image`;
CREATE TABLE `ihome_house_image` (
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` int(11) NOT NULL,
  `url` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `house_id` (`house_id`),
  CONSTRAINT `ihome_house_image_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `ihome_house` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ihome_order
-- ----------------------------
DROP TABLE IF EXISTS `ihome_order`;
CREATE TABLE `ihome_order` (
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `house_id` int(11) NOT NULL,
  `begin_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `days` int(11) NOT NULL,
  `house_price` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` enum('WAIT_ACCEPT','WAIT_PAYMENT','PAID','WAIT_COMMENT','COMPLETE','CANCELED','REJECTED') DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `house_id` (`house_id`),
  KEY `ix_ihome_order_status` (`status`),
  CONSTRAINT `ihome_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ihome_user` (`id`),
  CONSTRAINT `ihome_order_ibfk_2` FOREIGN KEY (`house_id`) REFERENCES `ihome_house` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ihome_user
-- ----------------------------
DROP TABLE IF EXISTS `ihome_user`;
CREATE TABLE `ihome_user` (
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) DEFAULT NULL,
  `pwd_hash` varchar(200) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `id_name` varchar(30) DEFAULT NULL,
  `id_card` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `id_card` (`id_card`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ihome_user
-- ----------------------------
BEGIN;
INSERT INTO `ihome_user` VALUES ('2018-06-20 15:33:45', '2018-06-20 15:38:06', 1, '13212341234', 'pbkdf2:sha256:50000$XI3ArjmK$298ed35d6b51c6d067f0ca3546264d065ed683f0ef1a0f577dc59630e2bd5162', '鲁大师', 'upload/avatar.png', '鲁大师', '123456789012345678');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
