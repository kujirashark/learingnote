/*
 Navicat Premium Data Transfer

 Source Server         : Lee
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : axf

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 08/06/2018 11:02:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (19, 'Can add food type', 7, 'add_foodtype');
INSERT INTO `auth_permission` VALUES (20, 'Can change food type', 7, 'change_foodtype');
INSERT INTO `auth_permission` VALUES (21, 'Can delete food type', 7, 'delete_foodtype');
INSERT INTO `auth_permission` VALUES (22, 'Can add main must buy', 8, 'add_mainmustbuy');
INSERT INTO `auth_permission` VALUES (23, 'Can change main must buy', 8, 'change_mainmustbuy');
INSERT INTO `auth_permission` VALUES (24, 'Can delete main must buy', 8, 'delete_mainmustbuy');
INSERT INTO `auth_permission` VALUES (25, 'Can add main nav', 9, 'add_mainnav');
INSERT INTO `auth_permission` VALUES (26, 'Can change main nav', 9, 'change_mainnav');
INSERT INTO `auth_permission` VALUES (27, 'Can delete main nav', 9, 'delete_mainnav');
INSERT INTO `auth_permission` VALUES (28, 'Can add main shop', 10, 'add_mainshop');
INSERT INTO `auth_permission` VALUES (29, 'Can change main shop', 10, 'change_mainshop');
INSERT INTO `auth_permission` VALUES (30, 'Can delete main shop', 10, 'delete_mainshop');
INSERT INTO `auth_permission` VALUES (31, 'Can add main show', 11, 'add_mainshow');
INSERT INTO `auth_permission` VALUES (32, 'Can change main show', 11, 'change_mainshow');
INSERT INTO `auth_permission` VALUES (33, 'Can delete main show', 11, 'delete_mainshow');
INSERT INTO `auth_permission` VALUES (34, 'Can add main wheel', 12, 'add_mainwheel');
INSERT INTO `auth_permission` VALUES (35, 'Can change main wheel', 12, 'change_mainwheel');
INSERT INTO `auth_permission` VALUES (36, 'Can delete main wheel', 12, 'delete_mainwheel');
INSERT INTO `auth_permission` VALUES (37, 'Can add goods', 13, 'add_goods');
INSERT INTO `auth_permission` VALUES (38, 'Can change goods', 13, 'change_goods');
INSERT INTO `auth_permission` VALUES (39, 'Can delete goods', 13, 'delete_goods');
INSERT INTO `auth_permission` VALUES (40, 'Can add order model', 14, 'add_ordermodel');
INSERT INTO `auth_permission` VALUES (41, 'Can change order model', 14, 'change_ordermodel');
INSERT INTO `auth_permission` VALUES (42, 'Can delete order model', 14, 'delete_ordermodel');
INSERT INTO `auth_permission` VALUES (43, 'Can add order goods model', 15, 'add_ordergoodsmodel');
INSERT INTO `auth_permission` VALUES (44, 'Can change order goods model', 15, 'change_ordergoodsmodel');
INSERT INTO `auth_permission` VALUES (45, 'Can delete order goods model', 15, 'delete_ordergoodsmodel');
INSERT INTO `auth_permission` VALUES (46, 'Can add cart model', 16, 'add_cartmodel');
INSERT INTO `auth_permission` VALUES (47, 'Can change cart model', 16, 'change_cartmodel');
INSERT INTO `auth_permission` VALUES (48, 'Can delete cart model', 16, 'delete_cartmodel');
INSERT INTO `auth_permission` VALUES (49, 'Can add user ticket model', 17, 'add_userticketmodel');
INSERT INTO `auth_permission` VALUES (50, 'Can change user ticket model', 17, 'change_userticketmodel');
INSERT INTO `auth_permission` VALUES (51, 'Can delete user ticket model', 17, 'delete_userticketmodel');
INSERT INTO `auth_permission` VALUES (52, 'Can add uesr model', 18, 'add_uesrmodel');
INSERT INTO `auth_permission` VALUES (53, 'Can change uesr model', 18, 'change_uesrmodel');
INSERT INTO `auth_permission` VALUES (54, 'Can delete uesr model', 18, 'delete_uesrmodel');
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for axf_cart
-- ----------------------------
DROP TABLE IF EXISTS `axf_cart`;
CREATE TABLE `axf_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_num` int(11) NOT NULL,
  `is_select` tinyint(1) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `axf_cart_goods_id_46fdd1df_fk_axf_goods_id` (`goods_id`),
  KEY `axf_cart_user_id_439bbb3d_fk_axf_users_id` (`user_id`),
  CONSTRAINT `axf_cart_goods_id_46fdd1df_fk_axf_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `axf_goods` (`id`),
  CONSTRAINT `axf_cart_user_id_439bbb3d_fk_axf_users_id` FOREIGN KEY (`user_id`) REFERENCES `axf_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for axf_foodtypes
-- ----------------------------
DROP TABLE IF EXISTS `axf_foodtypes`;
CREATE TABLE `axf_foodtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` varchar(16) NOT NULL,
  `typename` varchar(100) NOT NULL,
  `childtypenames` varchar(200) NOT NULL,
  `typesort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of axf_foodtypes
-- ----------------------------
BEGIN;
INSERT INTO `axf_foodtypes` VALUES (1, '104749', '热销榜', '全部分类:0', 1);
INSERT INTO `axf_foodtypes` VALUES (2, '104747', '新品尝鲜', '全部分类:0', 2);
INSERT INTO `axf_foodtypes` VALUES (3, '103532', '优选水果', '全部分类:0#进口水果:103534#国产水果:103533', 3);
INSERT INTO `axf_foodtypes` VALUES (4, '103581', '卤味熟食', '全部分类:0', 4);
INSERT INTO `axf_foodtypes` VALUES (5, '103536', '牛奶面包', '全部分类:0#酸奶乳酸菌:103537#牛奶豆浆:103538#面包蛋糕:103540', 5);
INSERT INTO `axf_foodtypes` VALUES (6, '103549', '饮料酒水', '全部分类:0#饮用水:103550#茶饮/咖啡:103554#功能饮料:103553#酒类:103555#果汁饮料:103551#碳酸饮料:103552#整箱购:104503#植物蛋白:104489#进口饮料:103556', 6);
INSERT INTO `axf_foodtypes` VALUES (7, '103541', '休闲零食', '全部分类:0#进口零食:103547#饼干糕点:103544#膨化食品:103543#坚果炒货:103542#肉干蜜饯:103546#糖果巧克力:103545', 7);
INSERT INTO `axf_foodtypes` VALUES (8, '103557', '方便速食', '全部分类:0#方便面:103558#火腿肠卤蛋:103559#速冻面点:103562#下饭小菜:103560#罐头食品:103561#冲调饮品:103563', 8);
INSERT INTO `axf_foodtypes` VALUES (9, '103569', '粮油调味', '全部分类:0#杂粮米面油:103570#厨房调味:103571#调味酱:103572', 9);
INSERT INTO `axf_foodtypes` VALUES (10, '103575', '生活用品', '全部分类:0#个人护理:103576#纸品:103578#日常用品:103580#家居清洁:103577', 10);
INSERT INTO `axf_foodtypes` VALUES (11, '104958', '冰激凌', '全部分类:0', 11);
COMMIT;

-- ----------------------------
-- Table structure for axf_goods
-- ----------------------------
DROP TABLE IF EXISTS `axf_goods`;
CREATE TABLE `axf_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` varchar(16) NOT NULL,
  `productimg` varchar(200) NOT NULL,
  `productname` varchar(100) NOT NULL,
  `productlongname` varchar(200) NOT NULL,
  `isxf` int(11) NOT NULL,
  `pmdesc` varchar(100) NOT NULL,
  `specifics` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `marketprice` double NOT NULL,
  `categoryid` varchar(16) NOT NULL,
  `childcid` varchar(16) NOT NULL,
  `childcidname` varchar(200) NOT NULL,
  `dealerid` varchar(16) NOT NULL,
  `storenums` int(11) NOT NULL,
  `productnum` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=831 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of axf_goods
-- ----------------------------
BEGIN;
INSERT INTO `axf_goods` VALUES (1, '11951', 'http://img01.bqstatic.com/upload/goods/000/001/1951/0000011951_63930.jpg@200w_200h_90Q', '', '乐吧薯片鲜虾味50.0g', 0, '0', '50g', 2, 2.5, '103541', '103543', '膨化食品', '4858', 200, 4);
INSERT INTO `axf_goods` VALUES (2, '2405', 'http://img01.bqstatic.com/upload/goods/000/000/2405/0000002405.jpg@200w_200h_90Q', '康师傅,3+2,葱香奶油味,休闲零食', '康师傅3+2葱香奶油125.0g', 0, '0', '125g', 5, 5, '103541', '103544', '饼干糕点', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (3, '3972', 'http://img01.bqstatic.com/upload/goods/000/000/3972/0000003972.jpg@200w_200h_90Q', '', '格力高百力滋奶咖味50.0g', 0, '0', '50g', 5, 5, '103541', '103544', '饼干糕点', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (4, '113225', 'http://img01.bqstatic.com/upload/goods/000/000/3591/0000003591_57910.jpg@200w_200h_90Q', '格力高,百力滋,蓝莓芝士味', '格力高百力滋蓝莓芝士味45g', 0, '0', '45g', 6, 5, '103541', '103544', '饼干糕点', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (5, '3590', 'http://img01.bqstatic.com/upload/goods/000/000/3590/0000003590_13280.jpg@200w_200h_90Q', '百力滋,奶油,香草味,休闲零食', '百力滋奶油香草味45.0g', 0, '0', '45g', 5, 4.5, '103541', '103544', '饼干糕点', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (6, '11538', 'http://img01.bqstatic.com/upload/goods/000/001/1538/0000011538_41480.jpg@200w_200h_90Q', '', '达利园好吃点低糖海苔饼130.0g', 0, '0', '130g', 4.5, 3.5, '103541', '103544', '饼干糕点', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (7, '9108', 'http://img01.bqstatic.com/upload/goods/000/000/9108/0000009108.jpg@200w_200h_90Q', '', '达利园好吃点香脆腰果饼208.0g', 0, '0', '208g', 8, 7, '103541', '103544', '饼干糕点', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (8, '9133', 'http://img01.bqstatic.com/upload/goods/000/000/9133/0000009133.jpg@200w_200h_90Q', '', '好丽友呀土豆滋香烤鸡味40.0g', 0, '0', '40g', 4, 4.5, '103541', '103543', '膨化食品', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (9, '7889', 'http://img01.bqstatic.com/upload/goods/000/000/7889/0000007889.jpg@200w_200h_90Q', '', '好丽友好友趣大凹凸醇香番茄味45.0g', 0, '0', '45g', 4, 3.5, '103541', '103543', '膨化食品', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (10, '4931', 'http://img01.bqstatic.com/upload/goods/000/000/4931/0000004931.jpg@200w_200h_90Q', '', '可比克薯片原味60.0g', 0, '0', '60g', 4, 3.5, '103541', '103543', '膨化食品', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (11, '4932', 'http://img01.bqstatic.com/upload/goods/000/000/4932/0000004932.jpg@200w_200h_90Q', '', '可比克薯片烧烤105.0g', 0, '0', '105g', 9, 7.5, '103541', '103543', '膨化食品', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (12, '9167', 'http://img01.bqstatic.com/upload/goods/000/000/9167/0000009167.jpg@200w_200h_90Q', '', '可比克薯片番茄味105.0g', 0, '0', '105g', 9, 9, '103541', '103543', '膨化食品', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (13, '11953', 'http://img01.bqstatic.com/upload/goods/000/001/1953/0000011953_02780.jpg@200w_200h_90Q', '', '乐吧薯片芥末味30.0g', 0, '0', '30g', 2, 1.5, '103541', '103543', '膨化食品', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (14, '7011', 'http://img01.bqstatic.com/upload/goods/201/602/2315/20160223153103_719543.jpg@200w_200h_90Q', '怡冠园,邬辣妈,脆皮,香干', '邬辣妈脆皮香干90.0g', 0, '0', '90g', 3.6, 3.5, '103541', '103546', '肉干蜜饯', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (15, '94170', 'http://img01.bqstatic.com/upload/goods/201/612/2214/20161222145223_521070.jpg@200w_200h_90Q', '益达,木糖醇,冰凉,薄荷', '益达木糖醇冰凉薄荷56g', 0, '0', '56g', 10, 10, '103541', '103545', '糖果巧克力', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (16, '5988', 'http://img01.bqstatic.com/upload/goods/000/000/5988/0000005988.jpg@200w_200h_90Q', '绿箭,无糖,薄荷糖,冰柠,薄荷味,口香糖,闪送超市,休闲零食,', '绿箭冰柠薄荷味无糖薄荷糖23.8g', 0, '0', '1盒', 9.5, 10, '103541', '103545', '糖果巧克力', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (17, '3968', 'http://img01.bqstatic.com/upload/goods/000/000/3968/0000003968.jpg@200w_200h_90Q', '', '格力高百奇牛奶草莓味45.0g', 0, '0', '45g', 6, 6, '103541', '103544', '饼干糕点', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (18, '3970', 'http://img01.bqstatic.com/upload/goods/000/000/3970/0000003970.jpg@200w_200h_90Q', '格力高百奇蓝莓树莓味', '格力高百奇蓝莓树莓味55.0g', 0, '0', '55g', 6, 6, '103541', '103544', '饼干糕点', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (19, '118479', 'http://img01.bqstatic.com/upload/goods/201/612/2811/20161228110842_023659.jpg@200w_200h_90Q', '雀巢,脆脆鲨,花生,夹心,威化', '雀巢脆脆鲨花生夹心威化640g', 0, '0', '640g', 32, 28, '103541', '103544', '饼干糕点', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (20, '6424', 'http://img01.bqstatic.com/upload/goods/000/000/6424/0000006424.jpg@200w_200h_90Q', '杏仁巧克力,西饼,杏仁,小吃,甜品,西饼,巴拿米', '巴拿米扁桃仁巧克力西饼150g', 0, '0', '150g', 12, 12, '103541', '103544', '饼干糕点', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (21, '4792', 'http://img01.bqstatic.com/upload/goods/000/000/4792/0000004792.jpg@200w_200h_90Q', '', '好丽友巧克力派46.0g', 0, '0', '46g', 4, 4, '103541', '103544', '饼干糕点', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (22, '5677', 'http://img01.bqstatic.com/upload/goods/000/000/5677/0000005677.jpg@200w_200h_90Q', '达利园,好吃点,高纤,消化饼,饼干,闪送超市,', '达利园好吃点高纤消化饼110.0g', 0, '0', '110g', 3.5, 3.5, '103541', '103544', '饼干糕点', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (23, '5676', 'http://img01.bqstatic.com/upload/goods/000/000/5676/0000005676.jpg@200w_200h_90Q', '达利园,好吃点,高纤,粗粮饼,饼干,闪送超市,', '达利园好吃点高纤粗粮饼110.0g', 0, '0', '110g', 3.5, 3.5, '103541', '103544', '饼干糕点', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (24, '4245', 'http://img01.bqstatic.com/upload/goods/000/000/4245/0000004245.jpg@200w_200h_90Q', '达利园,瑞士卷,草莓味,休闲零食,饼干蛋糕', '达利园瑞士卷草莓味160.0g', 0, '0', '160g', 7, 8, '103541', '103544', '饼干糕点', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (25, '6292', 'http://img01.bqstatic.com/upload/goods/000/000/6292/0000006292.jpg@200w_200h_90Q', '好丽友,呀土豆,里脊,牛排味,薯条,休闲零食,闪送超市,', '好丽友呀土豆里脊牛排味40.0g', 0, '0', '40g', 4, 3.5, '103541', '103543', '膨化食品', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (26, '5938', 'http://img01.bqstatic.com/upload/goods/000/000/5938/0000005938_09080.jpg@200w_200h_90Q', '好丽友,呀土豆,香焗,原味,休闲零食,闪送超市,', '好丽友呀土豆香焗原味40.0g', 0, '0', '40g', 4, 4, '103541', '103543', '膨化食品', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (27, '7908', 'http://img01.bqstatic.com/upload/goods/000/000/7908/0000007908.jpg@200w_200h_90Q', '', '好丽友好友趣大凹凸醇香番茄味75.0g', 0, '0', '75g', 6, 5.5, '103541', '103543', '膨化食品', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (28, '7020', 'http://img01.bqstatic.com/upload/goods/000/000/7020/0000007020.jpg@200w_200h_90Q', '', '怡冠园蒜蓉辣面片120.0g', 0, '0', '120g', 3.6, 3.5, '103541', '103546', '肉干蜜饯', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (29, '7016', 'http://img01.bqstatic.com/upload/goods/000/000/7016/0000007016.jpg@200w_200h_90Q', '', '怡冠园韩国烤香干85.0g', 0, '0', '85g', 3.6, 3.5, '103541', '103546', '肉干蜜饯', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (30, '118345', 'http://img01.bqstatic.com/upload/goods/201/612/2215/20161222152826_022366.jpg@200w_200h_90Q', '益达,木糖醇,无糖,口香糖,冰泡泡,薄荷味', '益达木糖醇无糖口香糖冰泡泡薄荷味56g', 0, '0', '56g', 10, 10, '103541', '103545', '糖果巧克力', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (31, '116031', 'http://img01.bqstatic.com/upload/goods/201/610/1316/20161013160648_508623.jpg@200w_200h_90Q', '绿箭,脆皮软心,薄荷糖,柠檬味', '绿箭脆皮软心薄荷糖柠檬味40g', 0, '0', '40g', 5, 5, '103541', '103545', '糖果巧克力', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (32, '3339', 'http://img01.bqstatic.com/upload/goods/000/000/3339/0000003339.jpg@200w_200h_90Q', '小老板,脆紫菜,海苔片,海鲜味,休闲零食', '小老板紫菜海鲜味36g', 0, '0', '36g', 15, 15, '103541', '103547', '进口零食', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (33, '8242', 'http://img01.bqstatic.com/upload/goods/000/000/8242/0000008242.jpg@200w_200h_90Q', '', '康师傅3+2酥松夹心饼干草莓牛奶味118.0g', 0, '0', '118g', 6, 6, '103541', '103544', '饼干糕点', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (34, '15519', 'http://img01.bqstatic.com/upload/goods/000/001/5519/0000015519_55320.jpg@200w_200h_90Q', '', '康师傅榛子巧克力味甜酥夹心饼干96.0g', 0, '0', '96g', 5, 4, '103541', '103544', '饼干糕点', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (35, '3964', 'http://img01.bqstatic.com/upload/goods/000/000/3964/0000003964.jpg@200w_200h_90Q', '', '格力高百奇巧克力味48.0g', 0, '0', '48g', 6, 6, '103541', '103544', '饼干糕点', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (36, '2313', 'http://img01.bqstatic.com/upload/goods/000/000/2313/0000002313.jpg@200w_200h_90Q', '王子饼干,牛奶味,休闲零食', '王子饼干牛奶味120.0g', 0, '0', '120g', 6, 6, '103541', '103544', '饼干糕点', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (37, '9110', 'http://img01.bqstatic.com/upload/goods/000/000/9110/0000009110.jpg@200w_200h_90Q', '', '达利园好吃点香脆杏仁饼208.0g', 0, '0', '208g', 7, 7, '103541', '103544', '饼干糕点', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (38, '5675', 'http://img01.bqstatic.com/upload/goods/000/000/5675/0000005675.jpg@200w_200h_90Q', '达利园,好吃点,高纤,煎麸饼,饼干,闪送超市,', '达利园好吃点高纤煎麸饼168.0g', 0, '0', '168g', 5.5, 5.5, '103541', '103544', '饼干糕点', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (39, '9113', 'http://img01.bqstatic.com/upload/goods/000/000/9113/0000009113.jpg@200w_200h_90Q', '', '达利园好吃点高纤蔬菜饼168.0g', 0, '0', '168g', 6.5, 5.5, '103541', '103544', '饼干糕点', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (40, '5371', 'http://img01.bqstatic.com/upload/goods/000/000/5371/0000005371.jpg@200w_200h_90Q', '上好佳,薯片,经典原味,休闲零食,闪送超市,', '上好佳薯片经典原味90.0g', 0, '0', '90g', 6, 6, '103541', '103543', '膨化食品', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (41, '7980', 'http://img01.bqstatic.com/upload/goods/000/000/7980/0000007980.jpg@200w_200h_90Q', '', '洽洽喀吱脆薯片麻辣香锅味51.0g', 0, '0', '51g', 3, 3, '103541', '103543', '膨化食品', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (42, '5248', 'http://img01.bqstatic.com/upload/goods/000/000/5248/0000005248.jpg@200w_200h_90Q', '乐事,海盐,芝士味,桶装,薯片,休闲零食,闪送超市,', '乐事海盐芝士味桶装104.0g', 0, '0', '104g', 9, 9, '103541', '103543', '膨化食品', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (43, '8451', 'http://img01.bqstatic.com/upload/goods/000/000/8451/0000008451.jpg@200w_200h_90Q', '', '旺旺雪饼520.0g', 0, '0', '520g', 23.5, 23.5, '103541', '103543', '膨化食品', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (44, '5323', 'http://img01.bqstatic.com/upload/goods/000/000/5323/0000005323.jpg@200w_200h_90Q', '可比克,牛肉味,薯片,达利园,休闲零食,闪送超市,', '可比克牛肉味60.0g', 0, '0', '60g', 4, 4, '103541', '103543', '膨化食品', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (45, '62900', 'http://img01.bqstatic.com/upload/goods/000/006/2900/0000062900_14050.jpg@200w_200h_90Q', '可比克,薯片,原滋味,闪送超市,休闲零食,', '可比克薯片原滋味105.0g', 0, '0', '105g', 9, 6.5, '103541', '103543', '膨化食品', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (46, '10705', 'http://img01.bqstatic.com/upload/goods/000/001/0705/0000010705.jpg@200w_200h_90Q', '', '可比克薯片香辣味105.0g', 0, '0', '105g', 9, 7.5, '103541', '103543', '膨化食品', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (47, '5328', 'http://img01.bqstatic.com/upload/goods/000/000/5328/0000005328.jpg@200w_200h_90Q', '可比克,香辣味,薯片,达利园,休闲零食,闪送超市,', '可比克香辣味60.0g', 0, '0', '60g', 4, 4, '103541', '103543', '膨化食品', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (48, '5329', 'http://img01.bqstatic.com/upload/goods/000/000/5329/0000005329.jpg@200w_200h_90Q', '可比克,香辣味,薯片,达利园,休闲零食,闪送超市,', '可比克香辣味薯片110.0g', 0, '0', '110g', 8, 8, '103541', '103543', '膨化食品', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (49, '5320', 'http://img01.bqstatic.com/upload/goods/000/000/5320/0000005320.jpg@200w_200h_90Q', '可比克,鸡肉味,薯片,达利园,休闲零食,闪送超市,', '可比克鸡肉味60.0g', 0, '0', '60g', 4, 4, '103541', '103543', '膨化食品', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (50, '11958', 'http://img01.bqstatic.com/upload/goods/000/001/1958/0000011958_59270.jpg@200w_200h_90Q', '', '乐吧薯片洋香葱味30.0g', 0, '0', '30g', 2, 1.5, '103541', '103543', '膨化食品', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (51, '117074', 'http://img01.bqstatic.com/upload/goods/201/611/1617/20161116170746_961610.jpg@200w_200h_90Q', '九日牌,哈密瓜,年糕条', '九日牌哈密瓜年糕条110g', 0, '0', '110g', 10, 10, '103541', '103543', '膨化食品', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (52, '117075', 'http://img01.bqstatic.com/upload/goods/201/611/1617/20161116170924_790947.jpg@200w_200h_90Q', '九日牌,草莓,年糕条,糯米脆条', '九日牌草莓味糯米脆条110g', 0, '0', '110g', 10, 10, '103541', '103543', '膨化食品', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (53, '5897', 'http://img01.bqstatic.com/upload/goods/000/000/5897/0000005897_92840.jpg@200w_200h_90Q', '同享,九制,话梅,果脯蜜饯,闪送超市,', '同享九制话梅35.0g', 0, '0', '35g', 3, 2, '103541', '103546', '肉干蜜饯', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (54, '2739', 'http://img01.bqstatic.com/upload/goods/000/000/2739/0000002739.jpg@200w_200h_90Q', '', '博发五香猪蹄200.0g', 0, '0', '200g', 12, 12, '103541', '103546', '肉干蜜饯', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (55, '118344', 'http://img01.bqstatic.com/upload/goods/201/612/2215/20161222152639_780558.jpg@200w_200h_90Q', '益达,木糖醇,无糖,口香糖,冰柠,薄荷味', '益达木糖醇无糖口香糖冰柠薄荷味56g', 0, '0', '56g', 10, 10, '103541', '103545', '糖果巧克力', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (56, '7914', 'http://img01.bqstatic.com/upload/goods/000/000/7914/0000007914.jpg@200w_200h_90Q', '', '好丽友木糖醇3热带水果味101.0g', 0, '0', '101g', 16, 16, '103541', '103545', '糖果巧克力', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (57, '3966', 'http://img01.bqstatic.com/upload/goods/000/000/3966/0000003966.jpg@200w_200h_90Q', '', '格力高百奇牛奶蓝莓味45.0g', 0, '0', '45g', 6, 6, '103541', '103544', '饼干糕点', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (58, '3593', 'http://img01.bqstatic.com/upload/goods/000/000/3593/0000003593_55590.jpg@200w_200h_90Q', '百力滋,海苔味，休闲零食', '百力滋海苔味60.0g', 0, '0', '60g', 5, 4.5, '103541', '103544', '饼干糕点', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (59, '8556', 'http://img01.bqstatic.com/upload/goods/000/000/8556/0000008556.jpg@200w_200h_90Q', '', '百力滋色拉味65.0g', 0, '0', '65g', 6, 4.5, '103541', '103544', '饼干糕点', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (60, '6426', 'http://img01.bqstatic.com/upload/goods/000/000/6426/0000006426.jpg@200w_200h_90Q', '欧式摩卡,饼,摩卡,小吃,甜品,西饼,巴拿米,零食,休闲零食', '巴拿米欧式摩卡西饼170g', 0, '0', '170g', 12, 12, '103541', '103544', '饼干糕点', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (61, '6427', 'http://img01.bqstatic.com/upload/goods/000/000/6427/0000006427.jpg@200w_200h_90Q', '巴拿米,燕麦五谷西饼,饼,摩卡,小吃,甜品,西饼,巴拿米,零食,休闲零食', '巴拿米燕麦五谷西饼170g', 0, '0', '170g', 12, 12, '103541', '103544', '饼干糕点', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (62, '5678', 'http://img01.bqstatic.com/upload/goods/000/000/5678/0000005678.jpg@200w_200h_90Q', '达利园,好吃点,高纤,煎麸饼,饼干,闪送超市,', '达利园好吃点高纤煎麸饼110.0g', 0, '0', '110g', 3.5, 3.5, '103541', '103544', '饼干糕点', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (63, '7978', 'http://img01.bqstatic.com/upload/goods/000/000/7978/0000007978.jpg@200w_200h_90Q', '', '洽洽喀吱脆薯片葱香烤翅味51.0g', 0, '0', '51g', 3, 3, '103541', '103543', '膨化食品', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (64, '7873', 'http://img01.bqstatic.com/upload/goods/000/000/7873/0000007873.jpg@200w_200h_90Q', '', '乐事无限海盐巧克力味104.0g', 0, '0', '104g', 9, 10, '103541', '103543', '膨化食品', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (65, '110581', 'http://img01.bqstatic.com/upload/goods/201/606/2317/20160623170443_292333.jpg@200w_200h_90Q', '好丽友,呀土豆,清新芒果味', '好丽友呀土豆清新芒果味40g', 0, '0', '40g', 4, 4, '103541', '103543', '膨化食品', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (66, '7905', 'http://img01.bqstatic.com/upload/goods/000/000/7905/0000007905.jpg@200w_200h_90Q', '', '好丽友好友趣香沁薯泥沙拉味凹凸薯片75.0g', 0, '0', '75g', 5.5, 5.5, '103541', '103543', '膨化食品', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (67, '5339', 'http://img01.bqstatic.com/upload/goods/000/000/5339/0000005339.jpg@200w_200h_90Q', '', '可比克原滋味110.0g', 0, '0', '110g', 7, 7, '103541', '103543', '膨化食品', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (68, '9168', 'http://img01.bqstatic.com/upload/goods/000/000/9168/0000009168.jpg@200w_200h_90Q', '', '可比克意大利香浓红烩味105.0g', 0, '0', '105g', 9, 9, '103541', '103543', '膨化食品', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (69, '10704', 'http://img01.bqstatic.com/upload/goods/000/001/0704/0000010704.jpg@200w_200h_90Q', '', '可比克薯片牛肉味105.0g', 0, '0', '105g', 9, 7.5, '103541', '103543', '膨化食品', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (70, '9086', 'http://img01.bqstatic.com/upload/goods/000/000/9086/0000009086.jpg@200w_200h_90Q', '', '可比克薯片番茄味110.0g', 0, '0', '110g', 9, 9, '103541', '103543', '膨化食品', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (71, '11952', 'http://img01.bqstatic.com/upload/goods/000/001/1952/0000011952_60230.jpg@200w_200h_90Q', '', '乐吧薯片烧烤味30.0', 0, '0', '30其他', 2, 1.5, '103541', '103543', '膨化食品', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (72, '11954', 'http://img01.bqstatic.com/upload/goods/000/001/1954/0000011954_10320.jpg@200w_200h_90Q', '', '乐吧薯片鸡肉味30.0g', 0, '0', '30g', 2, 1.5, '103541', '103543', '膨化食品', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (73, '36272', 'http://img01.bqstatic.com/upload/goods/201/604/0711/20160407110221_611797.jpg@200w_200h_90Q', '味全每日C橙汁', '味全每日C橙汁300ml', 1, '0', '300ml', 6.5, 6.9, '103549', '103551', '果汁饮料', '4858', 50, 100001033);
INSERT INTO `axf_goods` VALUES (74, '119736', 'http://img01.bqstatic.com/upload/goods/201/703/2010/20170320104049_036578.jpg@200w_200h_90Q', '格桑泉天然饮用水', '格桑泉天然饮用水550ml', 1, '1', '550ml', 3, 3, '103549', '103550', '饮用水', '4858', 50, 100000253);
INSERT INTO `axf_goods` VALUES (75, '2198', 'http://img01.bqstatic.com/upload/goods/000/000/2198/0000002198.jpg@200w_200h_90Q', '可口可乐,碳酸饮料', '「可口可乐」汽水330ml', 0, '0', '330ml', 3, 3, '103549', '103552', '碳酸饮料', '4858', 200, 1576);
INSERT INTO `axf_goods` VALUES (76, '4217', 'http://img01.bqstatic.com/upload/goods/000/000/4217/0000004217.jpg@200w_200h_90Q', '农夫山泉,天然水,酒水饮品,矿泉水,水', '农夫山泉饮用天然水550ml', 0, '0', '550ml', 2, 2, '103549', '103550', '饮用水', '4858', 200, 1411);
INSERT INTO `axf_goods` VALUES (77, '8667', 'http://img01.bqstatic.com/upload/goods/000/000/8667/0000008667.jpg@200w_200h_90Q', '农夫山泉,饮用天然水', '农夫山泉饮用天然水4L', 0, '0', '4L', 8.5, 8.5, '103549', '103550', '饮用水', '4858', 200, 1410);
INSERT INTO `axf_goods` VALUES (78, '4318', 'http://img01.bqstatic.com/upload/goods/000/000/4318/0000004318.jpg@200w_200h_90Q', '零度,可口可乐,酒水饮品,碳酸饮料', '「可口可乐」零度汽水500ml', 0, '0', '500ml', 3, 3, '103549', '103552', '碳酸饮料', '4858', 200, 1307);
INSERT INTO `axf_goods` VALUES (79, '3707', 'http://img01.bqstatic.com/upload/goods/000/000/3707/0000003707.jpg@200w_200h_90Q', '', '怡宝饮用纯净水4.5L/桶', 0, '0', '4.5L', 10, 10, '103549', '103550', '饮用水', '4858', 200, 1040);
INSERT INTO `axf_goods` VALUES (80, '5544', 'http://img01.bqstatic.com/upload/goods/000/000/5544/0000005544.jpg@200w_200h_90Q', '燕京,啤酒,瓶装,不含瓶押金,酒水,闪送超市,', '燕京啤酒瓶装（不含瓶押金）600ml', 0, '0', '600ml', 3, 3, '103549', '103555', '酒类', '4858', 200, 950);
INSERT INTO `axf_goods` VALUES (81, '4560', 'http://img01.bqstatic.com/upload/goods/000/000/4560/0000004560.jpg@200w_200h_90Q', '可口,可乐,饮料,饮品', '「可口可乐」汽水600ml', 0, '0', '600ml', 3, 3, '103549', '103552', '碳酸饮料', '4858', 200, 928);
INSERT INTO `axf_goods` VALUES (82, '2441', 'http://img01.bqstatic.com/upload/goods/000/000/2441/0000002441.jpg@200w_200h_90Q', '北冰洋,橙汁汽水,碳酸饮料', '北冰洋橙汁汽水330ml', 0, '0', '330ml', 5, 5, '103549', '103552', '碳酸饮料', '4858', 200, 902);
INSERT INTO `axf_goods` VALUES (83, '8627', 'http://img01.bqstatic.com/upload/goods/000/000/8627/0000008627.jpg@200w_200h_90Q', '', '农夫山泉饮用天然水1.5L', 0, '0', '1.5L', 4, 3.5, '103549', '103550', '饮用水', '4858', 200, 866);
INSERT INTO `axf_goods` VALUES (84, '4115', 'http://img01.bqstatic.com/upload/goods/000/000/4115/0000004115.jpg@200w_200h_90Q', '怡宝,饮用,纯净水,水', '怡宝饮用纯净水555ml', 0, '0', '555ml', 2, 2, '103549', '103550', '饮用水', '4858', 200, 863);
INSERT INTO `axf_goods` VALUES (85, '11833', 'http://img01.bqstatic.com/upload/goods/000/001/1833/0000011833_25980.jpg@200w_200h_90Q', '', '哈尔滨小麦王啤酒（听装）500ml', 0, '0', '500ml', 5, 5, '103549', '103555', '酒类', '4858', 200, 774);
INSERT INTO `axf_goods` VALUES (86, '2179', 'http://img01.bqstatic.com/upload/goods/000/000/2179/0000002179.jpg@200w_200h_90Q', '', '燕京啤酒330ml', 0, '0', '330ml', 3, 3, '103549', '103555', '酒类', '4858', 200, 713);
INSERT INTO `axf_goods` VALUES (87, '93440', 'http://img01.bqstatic.com/upload/goods/000/009/3440/0000093440_39540.jpg@200w_200h_90Q', '', '红牛维生素功能饮料250ml', 0, '0', '250ml', 6, 6, '103549', '103553', '功能饮料', '4858', 200, 634);
INSERT INTO `axf_goods` VALUES (88, '10474', 'http://img01.bqstatic.com/upload/goods/000/001/0474/0000010474.jpg@200w_200h_90Q', '', '维他柠檬茶250.0ml*6包', 0, '0', '250ml*6包', 20, 16.8, '103549', '103554', '茶饮/咖啡', '4858', 200, 597);
INSERT INTO `axf_goods` VALUES (89, '15472', 'http://img01.bqstatic.com/upload/goods/000/001/5472/0000015472_31290.jpg@200w_200h_90Q', '哈尔滨啤酒,小麦王,啤酒,酒水饮料', '哈尔滨小麦王啤酒330ml', 0, '0', '330ml', 3, 3, '103549', '103555', '酒类', '4858', 200, 538);
INSERT INTO `axf_goods` VALUES (90, '8706', 'http://img01.bqstatic.com/upload/goods/000/000/8706/0000008706.jpg@200w_200h_90Q', '', '怡宝饮用纯净水1.55L', 0, '0', '1.55L', 4, 4, '103549', '103550', '饮用水', '4858', 200, 531);
INSERT INTO `axf_goods` VALUES (91, '90326', 'http://img01.bqstatic.com/upload/goods/000/009/0326/0000090326_85980.jpg@200w_200h_90Q', '雪花,勇闯天涯,酒水饮品,啤酒', '雪花啤酒勇闯天涯听装500ml', 0, '0', '500ml', 6, 3, '103549', '103555', '酒类', '4858', 200, 491);
INSERT INTO `axf_goods` VALUES (92, '2770', 'http://img01.bqstatic.com/upload/goods/201/610/0911/20161009110838_383964.jpg@200w_200h_90Q', '景田百岁山天然矿泉水', '百岁山矿泉水570ml', 0, '0', '570ml', 3, 2.5, '103549', '103550', '饮用水', '4858', 200, 488);
INSERT INTO `axf_goods` VALUES (93, '2427', 'http://img01.bqstatic.com/upload/goods/201/608/1711/20160817115353_433821.jpg@200w_200h_90Q', '百事,可乐,碳酸饮料', '百事可乐330ml', 0, '0', '330ml', 2.5, 3, '103549', '103552', '碳酸饮料', '4858', 200, 469);
INSERT INTO `axf_goods` VALUES (94, '15447', 'http://img01.bqstatic.com/upload/goods/000/001/5447/0000015447_59790.jpg@200w_200h_90Q', '', '北冰洋桔汁汽水330ml', 0, '0', '330ml', 4.5, 4.5, '103549', '103552', '碳酸饮料', '4858', 200, 468);
INSERT INTO `axf_goods` VALUES (95, '2463', 'http://img01.bqstatic.com/upload/goods/000/000/2463/0000002463_77050.jpg@200w_200h_90Q', '雪碧,柠檬味,听装,碳酸饮料', '「雪碧」柠檬味汽水330ml', 0, '0', '330ml', 3, 3, '103549', '103552', '碳酸饮料', '4858', 200, 436);
INSERT INTO `axf_goods` VALUES (96, '2400', 'http://img01.bqstatic.com/upload/goods/000/000/2400/0000002400.jpg@200w_200h_90Q', '芬达,橙汁味,碳酸饮料', '「芬达」橙味汽水330ml', 0, '0', '330ml', 2.5, 2.5, '103549', '103552', '碳酸饮料', '4858', 200, 409);
INSERT INTO `axf_goods` VALUES (97, '66407', 'http://img01.bqstatic.com/upload/goods/000/006/6407/0000066407_69070.jpg@200w_200h_90Q', '维他罐装柠檬茶', '维他柠檬茶听装310ml', 0, '0', '310ml', 4, 3.5, '103549', '103554', '茶饮/咖啡', '4858', 200, 395);
INSERT INTO `axf_goods` VALUES (98, '65732', 'http://img01.bqstatic.com/upload/goods/000/006/5732/0000065732_38430.jpg@200w_200h_90Q', '百威,啤酒,酒水', '百威啤酒听装500ml', 0, '0', '500ml', 7, 9, '103549', '103555', '酒类', '4858', 200, 387);
INSERT INTO `axf_goods` VALUES (99, '4301', 'http://img01.bqstatic.com/upload/goods/000/000/4301/0000004301.jpg@200w_200h_90Q', '可口,可乐,饮料,饮品', '「可口可乐」汽水2L', 0, '0', '2L', 7, 7.5, '103549', '103552', '碳酸饮料', '4858', 200, 384);
INSERT INTO `axf_goods` VALUES (100, '5545', 'http://img01.bqstatic.com/upload/goods/000/000/5545/0000005545.jpg@200w_200h_90Q', '燕京,啤酒,瓶装,含瓶押金,酒,闪送超市,', '燕京啤酒瓶装（含瓶押金）600ml', 0, '0', '600ml', 3.5, 3.5, '103549', '103555', '酒类', '4858', 200, 362);
INSERT INTO `axf_goods` VALUES (101, '2172', 'http://img01.bqstatic.com/upload/goods/000/000/2172/0000002172.jpg@200w_200h_90Q', '雪花,清爽,啤酒,听装,酒水饮料', '雪花清爽听装330ml', 0, '0', '330ml', 3, 3, '103549', '103555', '酒类', '4858', 200, 347);
INSERT INTO `axf_goods` VALUES (102, '3704', 'http://img01.bqstatic.com/upload/goods/000/000/3704/0000003704.jpg@200w_200h_90Q', '农夫山泉,饮用天然水', '农夫山泉饮用天然水4L', 0, '0', '4L', 8.5, 8.5, '103549', '103550', '饮用水', '4858', 200, 325);
INSERT INTO `axf_goods` VALUES (103, '15395', 'http://img01.bqstatic.com/upload/goods/000/001/5395/0000015395_36580.jpg@200w_200h_90Q', '', '东方树叶茉莉花茶500ml', 0, '0', '500ml', 4, 3.5, '103549', '103554', '茶饮/咖啡', '4858', 200, 324);
INSERT INTO `axf_goods` VALUES (104, '15537', 'http://img01.bqstatic.com/upload/goods/000/001/5537/0000015537_19660.jpg@200w_200h_90Q', '', '维他柠檬茶饮料250ml', 0, '0', '250ml', 3.5, 4, '103549', '103554', '茶饮/咖啡', '4858', 200, 303);
INSERT INTO `axf_goods` VALUES (105, '4913', 'http://img01.bqstatic.com/upload/goods/201/702/1511/20170215113313_764950.jpg@200w_200h_90Q', '康师傅,包装,饮用水', '康师傅包装饮用水550ml', 0, '0', '550ml', 1, 1.5, '103549', '103550', '饮用水', '4858', 200, 301);
INSERT INTO `axf_goods` VALUES (106, '116817', 'http://img01.bqstatic.com/upload/goods/201/610/1310/20161013100229_225111.jpg@200w_200h_90Q', '名仁苏打水', '名仁苏打水375ml', 0, '0', '375ml', 5, 3, '103549', '103550', '饮用水', '4858', 200, 301);
INSERT INTO `axf_goods` VALUES (107, '2254', 'http://img01.bqstatic.com/upload/goods/000/000/2254/0000002254.jpg@200w_200h_90Q', '青岛,11度,听装,啤酒,酒水饮料', '青岛11度听装500ml', 0, '0', '500ml', 7, 7, '103549', '103555', '酒类', '4858', 200, 271);
INSERT INTO `axf_goods` VALUES (108, '5042', 'http://img01.bqstatic.com/upload/goods/201/603/3114/20160331144701_654122.jpg@200w_200h_90Q', '统一,阿萨姆,奶茶', '统一阿萨姆奶茶500ml', 0, '0', '500ml', 5, 5, '103549', '103554', '茶饮/咖啡', '4858', 200, 262);
INSERT INTO `axf_goods` VALUES (109, '4568', 'http://img01.bqstatic.com/upload/goods/000/000/4568/0000004568.jpg@200w_200h_90Q', '脉动,水蜜桃,饮料,饮品', '脉动维生素水蜜桃口味600ml', 0, '0', '600ml', 4, 4, '103549', '103553', '功能饮料', '4858', 200, 262);
INSERT INTO `axf_goods` VALUES (110, '5279', 'http://img01.bqstatic.com/upload/goods/000/000/5279/0000005279.jpg@200w_200h_90Q', '维他,柠檬茶,瓶装,港版,茶饮,闪送超市,', '维他柠檬茶500ml', 0, '0', '500ml', 7, 6, '103549', '103556', '进口饮料', '4858', 200, 243);
INSERT INTO `axf_goods` VALUES (111, '109297', 'http://img01.bqstatic.com/upload/goods/201/605/2417/20160524171834_441339.jpg@200w_200h_90Q', '农夫山泉,茶π,蜜桃乌龙茶,茶饮', '农夫蜜桃乌龙茶茶兀饮料500ml', 0, '0', '500ml', 6, 6, '103549', '103554', '茶饮/咖啡', '4858', 200, 221);
INSERT INTO `axf_goods` VALUES (112, '5475', 'http://img01.bqstatic.com/upload/goods/000/000/5475/0000005475.jpg@200w_200h_90Q', '康师傅，矿泉水，闪送超市,', '康师傅矿泉水箱550.0ml*24瓶', 0, '0', '550ml*24瓶', 21, 21, '103549', '104503', '整箱购', '4858', 200, 221);
INSERT INTO `axf_goods` VALUES (113, '4545', 'http://img01.bqstatic.com/upload/goods/201/602/2610/20160226100422_503506.jpg@200w_200h_90Q', '景田,百岁山,天然矿泉水,酒水饮品,矿泉水', '百岁山饮用天然矿泉水348ml', 0, '0', '348ml', 3, 2, '103549', '103550', '饮用水', '4858', 200, 209);
INSERT INTO `axf_goods` VALUES (114, '15586', 'http://img01.bqstatic.com/upload/goods/000/001/5586/0000015586_71070.jpg@200w_200h_90Q', '', '农夫山泉饮用天然水380ml', 0, '0', '380ml', 1.5, 1, '103549', '103550', '饮用水', '4858', 200, 206);
INSERT INTO `axf_goods` VALUES (115, '2178', 'http://img01.bqstatic.com/upload/goods/000/000/2178/0000002178.jpg@200w_200h_90Q', '青岛11度,听装,啤酒,酒水饮料', '青岛经典啤酒11度330ml', 0, '0', '330ml', 4.7, 5, '103549', '103555', '酒类', '4858', 200, 196);
INSERT INTO `axf_goods` VALUES (116, '5987', 'http://img01.bqstatic.com/upload/goods/000/000/5987/0000005987_07950.jpg@200w_200h_90Q', '名仁,苏打水,矿泉水,闪送超市,', '名仁苏打水360ml', 0, '0', '360ml', 3, 3, '103549', '103550', '饮用水', '4858', 200, 184);
INSERT INTO `axf_goods` VALUES (117, '2202', 'http://img01.bqstatic.com/upload/goods/000/000/2202/0000002202.jpg@200w_200h_90Q', '脉动,青柠味,饮料', '脉动青柠口味维生素饮料600ml', 0, '0', '600ml', 4, 5, '103549', '103553', '功能饮料', '4858', 200, 180);
INSERT INTO `axf_goods` VALUES (118, '5498', 'http://img01.bqstatic.com/upload/goods/000/000/5498/0000005498.jpg@200w_200h_90Q', '怡宝,纯净水,矿泉水,闪送超市,', '怡宝纯净水箱555.0ml*24瓶', 0, '0', '555ml*24瓶', 36, 36, '103549', '104503', '整箱购', '4858', 200, 177);
INSERT INTO `axf_goods` VALUES (119, '100097', 'http://img01.bqstatic.com/upload/goods/201/605/2516/20160525161740_293444.jpg@200w_200h_90Q', '农夫山泉,茶π,西柚茉莉,花茶,茶饮', '农夫西柚茉莉花茶茶兀饮料500ml', 0, '0', '500ml', 5, 5, '103549', '103554', '茶饮/咖啡', '4858', 200, 174);
INSERT INTO `axf_goods` VALUES (120, '5941', 'http://img01.bqstatic.com/upload/goods/201/605/2516/20160525162209_448693.jpg@200w_200h_90Q', '农夫山泉,茶π,柚子绿茶,茶饮', '农夫柚子绿茶茶兀饮料500ml', 0, '0', '500ml', 5, 5, '103549', '103554', '茶饮/咖啡', '4858', 200, 173);
INSERT INTO `axf_goods` VALUES (121, '4302', 'http://img01.bqstatic.com/upload/goods/000/000/4302/0000004302.jpg@200w_200h_90Q', '雪碧,饮料,饮品', '「雪碧」柠檬味汽水2L', 0, '0', '2L', 7, 7.5, '103549', '103552', '碳酸饮料', '4858', 200, 172);
INSERT INTO `axf_goods` VALUES (122, '4900', 'http://img01.bqstatic.com/upload/goods/000/000/4900/0000004900.jpg@200w_200h_90Q', '康师傅,冰红茶', '康师傅冰红茶1L', 0, '0', '1L', 4.5, 4.5, '103549', '103554', '茶饮/咖啡', '4858', 200, 164);
INSERT INTO `axf_goods` VALUES (123, '109298', 'http://img01.bqstatic.com/upload/goods/201/605/2417/20160524172025_254195.jpg@200w_200h_90Q', '农夫山泉,茶π,柠檬红茶,茶饮', '农夫柠檬红茶茶π饮料500ml', 0, '0', '500ml', 6, 6, '103549', '103554', '茶饮/咖啡', '4858', 200, 164);
INSERT INTO `axf_goods` VALUES (124, '4640', 'http://img01.bqstatic.com/upload/goods/000/000/4640/0000004640.jpg@200w_200h_90Q', '雪碧,柠檬味,酒水饮品,碳酸饮料', '「雪碧」柠檬味汽水600ml', 0, '0', '600ml', 3, 3, '103549', '103552', '碳酸饮料', '4858', 200, 159);
INSERT INTO `axf_goods` VALUES (125, '117095', 'http://img01.bqstatic.com/upload/goods/201/603/0311/20160303110537_155862.jpg@200w_200h_90Q', '农夫山泉,饮用,天然水', '农夫山泉饮用天然水4L*6', 0, '0', '4L*6', 48, 48, '103549', '104503', '整箱购', '4858', 200, 148);
INSERT INTO `axf_goods` VALUES (126, '2299', 'http://img01.bqstatic.com/upload/goods/000/000/2299/0000002299.jpg@200w_200h_90Q', '统一,绿茶,酒水饮料', '统一绿茶2L', 0, '0', '2L', 7, 8, '103549', '103554', '茶饮/咖啡', '4858', 200, 140);
INSERT INTO `axf_goods` VALUES (127, '15397', 'http://img01.bqstatic.com/upload/goods/000/001/5397/0000015397_70610.jpg@200w_200h_90Q', '', '东方树叶绿茶500ml', 0, '0', '500ml', 4, 4.5, '103549', '103554', '茶饮/咖啡', '4858', 200, 134);
INSERT INTO `axf_goods` VALUES (128, '28724', 'http://img01.bqstatic.com/upload/goods/201/604/1610/20160416100051_887085.jpg@200w_200h_90Q', '康师傅,冰红茶,茶饮', '康师傅冰红茶2L', 0, '0', '2L', 7, 7, '103549', '103554', '茶饮/咖啡', '4858', 200, 133);
INSERT INTO `axf_goods` VALUES (129, '2385', 'http://img01.bqstatic.com/upload/goods/000/000/2385/0000002385_81820.jpg@200w_200h_90Q', '汇源,橙汁,果汁,酒水饮料', '汇源100%橙汁1L', 0, '0', '1L', 15, 15, '103549', '103551', '果汁饮料', '4858', 200, 133);
INSERT INTO `axf_goods` VALUES (130, '2208', 'http://img01.bqstatic.com/upload/goods/000/000/2208/0000002208_39990.jpg@200w_200h_90Q', '水溶,C100,柠檬味,饮料', '农夫水溶C100柠檬445ml', 0, '0', '445ml', 4.5, 5, '103549', '103553', '功能饮料', '4858', 200, 130);
INSERT INTO `axf_goods` VALUES (131, '2393', 'http://img01.bqstatic.com/upload/goods/000/000/2393/0000002393.jpg@200w_200h_90Q', '健力宝,橙蜜味,听装,酒水饮料', '健力宝橙蜜味听装330ml', 0, '0', '330ml', 2.5, 4, '103549', '103553', '功能饮料', '4858', 200, 130);
INSERT INTO `axf_goods` VALUES (132, '5473', 'http://img01.bqstatic.com/upload/goods/000/000/5473/0000005473.jpg@200w_200h_90Q', '', '农夫山泉箱1.5L*12瓶', 0, '0', '1.5L*12瓶', 36, 36, '103549', '104503', '整箱购', '4858', 200, 129);
INSERT INTO `axf_goods` VALUES (133, '8839', 'http://img01.bqstatic.com/upload/goods/000/000/8839/0000008839.jpg@200w_200h_90Q', '', '百事可乐2L', 0, '0', '2L', 7, 7, '103549', '103552', '碳酸饮料', '4858', 200, 128);
INSERT INTO `axf_goods` VALUES (134, '4918', 'http://img01.bqstatic.com/upload/goods/000/000/4918/0000004918_28850.jpg@200w_200h_90Q', '', '康师傅茉莉蜜茶1L', 0, '0', '1L', 4.5, 5, '103549', '103554', '茶饮/咖啡', '4858', 200, 126);
INSERT INTO `axf_goods` VALUES (135, '8206', 'http://img01.bqstatic.com/upload/goods/000/000/8206/0000008206.jpg@200w_200h_90Q', '统一绿茶茉莉花味', '统一绿茶茉莉花味500ml', 0, '0', '500ml', 3, 3, '103549', '103554', '茶饮/咖啡', '4858', 200, 126);
INSERT INTO `axf_goods` VALUES (136, '2207', 'http://img01.bqstatic.com/upload/goods/000/000/2207/0000002207.jpg@200w_200h_90Q', '九龙斋,酸梅汤,饮料', '九龙斋酸梅汤400ml', 0, '0', '400ml', 4, 5, '103549', '103551', '果汁饮料', '4858', 200, 120);
INSERT INTO `axf_goods` VALUES (137, '15396', 'http://img01.bqstatic.com/upload/goods/000/001/5396/0000015396_95440.jpg@200w_200h_90Q', '', '东方树叶乌龙茶500ml', 0, '0', '500ml', 4, 4.5, '103549', '103554', '茶饮/咖啡', '4858', 200, 118);
INSERT INTO `axf_goods` VALUES (138, '5480', 'http://img01.bqstatic.com/upload/goods/201/601/2011/20160120115733_689624.jpg@200w_200h_90Q', '可口,可乐,汽水,碳酸饮料,闪送超市,', '「可口可乐」汽水箱装330ml*24听', 0, '0', '330ml*24听', 55, 55, '103549', '104503', '整箱购', '4858', 200, 118);
INSERT INTO `axf_goods` VALUES (139, '10471', 'http://img01.bqstatic.com/upload/goods/000/001/0471/0000010471.jpg@200w_200h_90Q', '', '统一小茗同学冷泡青柠红茶480ml', 0, '0', '480ml', 5.5, 5, '103549', '103554', '茶饮/咖啡', '4858', 200, 112);
INSERT INTO `axf_goods` VALUES (140, '8673', 'http://img01.bqstatic.com/upload/goods/000/000/8673/0000008673.jpg@200w_200h_90Q', '', '汇源100%桃汁1L', 0, '0', '1L', 15, 13, '103549', '103551', '果汁饮料', '4858', 200, 112);
INSERT INTO `axf_goods` VALUES (141, '100020', 'http://img01.bqstatic.com/upload/goods/000/001/5499/0000015499_16600.jpg@200w_200h_90Q', '', '碱法荔枝味苏打水500.0ml/瓶', 0, '0', '500ml/瓶', 4, 4, '103549', '103552', '碳酸饮料', '4858', 200, 112);
INSERT INTO `axf_goods` VALUES (142, '99995', 'http://img01.bqstatic.com/upload/goods/000/001/0473/0000010473.jpg@200w_200h_90Q', '统一,冰红茶,酒水饮料,闪送超市', '统一冰红茶(小)250ml/瓶', 0, '0', '250ml/瓶', 1.5, 1.5, '103549', '103554', '茶饮/咖啡', '4858', 200, 108);
INSERT INTO `axf_goods` VALUES (143, '5472', 'http://img01.bqstatic.com/upload/goods/000/000/5472/0000005472.jpg@200w_200h_90Q', '农夫,山泉,矿泉水,闪送超市,', '农夫山泉箱4.0L*4桶', 0, '0', '4L*4桶', 32, 32, '103549', '104503', '整箱购', '4858', 200, 104);
INSERT INTO `axf_goods` VALUES (144, '4321', 'http://img01.bqstatic.com/upload/goods/000/000/4321/0000004321.jpg@200w_200h_90Q', '雪碧,柠檬味,饮料,酒水饮品,碳酸饮料', '「雪碧」柠檬味500ml', 0, '0', '500ml', 3, 3, '103549', '103552', '碳酸饮料', '4858', 200, 103);
INSERT INTO `axf_goods` VALUES (145, '5494', 'http://img01.bqstatic.com/upload/goods/000/000/5494/0000005494.jpg@200w_200h_90Q', '', '怡宝纯净水箱1.55L*12瓶', 0, '0', '1.55L*12瓶', 36, 36, '103549', '104503', '整箱购', '4858', 200, 103);
INSERT INTO `axf_goods` VALUES (146, '118054', 'http://img01.bqstatic.com/upload/goods/201/612/1316/20161213160931_662671.jpg@200w_200h_90Q', '农夫山泉,饮用,天然水', '农夫山泉饮用天然水5L', 0, '0', '5L', 11, 11, '103549', '103550', '饮用水', '4858', 200, 100);
INSERT INTO `axf_goods` VALUES (147, '3724', 'http://img01.bqstatic.com/upload/goods/201/610/2618/20161026182018_621410.jpg@200w_200h_90Q', '维他菊花茶饮品', '维他菊花茶250ml', 0, '0', '250ml', 3, 4, '103549', '103554', '茶饮/咖啡', '4858', 200, 100);
INSERT INTO `axf_goods` VALUES (148, '2300', 'http://img01.bqstatic.com/upload/goods/000/000/2300/0000002300.jpg@200w_200h_90Q', '统一,冰红茶,酒水饮料', '统一冰红茶2L', 0, '0', '2L', 7, 8, '103549', '103554', '茶饮/咖啡', '4858', 200, 99);
INSERT INTO `axf_goods` VALUES (149, '2434', 'http://img01.bqstatic.com/upload/goods/000/000/2434/0000002434.jpg@200w_200h_90Q', '露露,杏仁露,酒水饮料', '露露杏仁露原味240ml', 0, '0', '240ml', 4, 5, '103549', '104489', '植物蛋白', '4858', 200, 98);
INSERT INTO `axf_goods` VALUES (150, '15414', 'http://img01.bqstatic.com/upload/goods/000/001/5414/0000015414_39190.jpg@200w_200h_90Q', '', '康师傅冰红茶500ml', 0, '0', '550ml', 3, 3, '103549', '103554', '茶饮/咖啡', '4858', 200, 95);
INSERT INTO `axf_goods` VALUES (151, '4623', 'http://img01.bqstatic.com/upload/goods/000/000/4623/0000004623.jpg@200w_200h_90Q', '王老吉,凉茶,酒水饮品,茶饮', '王老吉凉茶310ml', 0, '0', '310ml', 4, 4, '103549', '103554', '茶饮/咖啡', '4858', 200, 95);
INSERT INTO `axf_goods` VALUES (152, '10252', 'http://img01.bqstatic.com/upload/goods/000/001/0252/0000010252.jpg@200w_200h_90Q', '', '中沃体质能量维生素饮料580ml', 0, '0', '580ml', 4, 4, '103549', '103553', '功能饮料', '4858', 200, 94);
INSERT INTO `axf_goods` VALUES (153, '2199', 'http://img01.bqstatic.com/upload/goods/000/000/2199/0000002199_97980.jpg@200w_200h_90Q', '加多宝,凉茶,金罐,饮料', '加多宝金罐凉茶310ml', 0, '0', '310ml', 4, 5, '103549', '103554', '茶饮/咖啡', '4858', 200, 93);
INSERT INTO `axf_goods` VALUES (154, '15406', 'http://img01.bqstatic.com/upload/goods/000/001/5406/0000015406_13390.jpg@200w_200h_90Q', '', '康师傅茉莉清茶500ml', 0, '0', '550ml', 3, 3, '103549', '103554', '茶饮/咖啡', '4858', 200, 90);
INSERT INTO `axf_goods` VALUES (155, '4319', 'http://img01.bqstatic.com/upload/goods/000/000/4319/0000004319_96020.jpg@200w_200h_90Q', '美年达,橙味,汽水,饮料,饮品', '美年达橙味汽水500ml', 0, '0', '500ml', 3, 3.5, '103549', '103552', '碳酸饮料', '4858', 200, 89);
INSERT INTO `axf_goods` VALUES (156, '4614', 'http://img01.bqstatic.com/upload/goods/000/000/4614/0000004614_70350.jpg@200w_200h_90Q', '统一,冰绿茶,酒水饮品,茶饮', '统一绿茶茉莉花味1.0L', 0, '0', '1L', 4.5, 5, '103549', '103554', '茶饮/咖啡', '4858', 200, 83);
INSERT INTO `axf_goods` VALUES (157, '5489', 'http://img01.bqstatic.com/upload/goods/000/000/5489/0000005489.jpg@200w_200h_90Q', '百岁山,矿泉水,闪送超市,', '百岁山矿泉水箱570.0ml*24瓶', 0, '0', '570ml*24瓶', 55, 55, '103549', '104503', '整箱购', '4858', 200, 83);
INSERT INTO `axf_goods` VALUES (158, '100025', 'http://img01.bqstatic.com/upload/goods/000/001/5821/0000015821_06630.jpg@200w_200h_90Q', '碱法葡萄味苏打水', '碱法葡萄味苏打水500.0ml/瓶', 0, '0', '500ml/瓶', 4, 3, '103549', '103550', '饮用水', '4858', 200, 80);
INSERT INTO `axf_goods` VALUES (159, '3222', 'http://img01.bqstatic.com/upload/goods/000/000/3222/0000003222_06710.jpg@200w_200h_90Q', '统一,雅哈,冰咖啡,酒水饮品,咖啡', '统一雅哈冰咖啡450ml', 0, '0', '450ml', 5, 5, '103549', '103554', '茶饮/咖啡', '4858', 200, 80);
INSERT INTO `axf_goods` VALUES (160, '2213', 'http://img01.bqstatic.com/upload/goods/000/000/2213/0000002213_49350.jpg@200w_200h_90Q', '美汁源,果粒橙,果汁,饮料', '美汁源果粒橙1.25L', 0, '0', '1.25L', 8, 8, '103549', '103551', '果汁饮料', '4858', 200, 80);
INSERT INTO `axf_goods` VALUES (161, '5980', 'http://img01.bqstatic.com/upload/goods/000/000/5980/0000005980_09370.jpg@200w_200h_90Q', '华旗,山楂,果茶,果汁,饮料,闪送超市,', '华旗山楂果茶400ml', 0, '0', '400ml', 4, 4, '103549', '103554', '茶饮/咖啡', '4858', 200, 76);
INSERT INTO `axf_goods` VALUES (162, '5968', 'http://img01.bqstatic.com/upload/goods/000/000/5968/0000005968_92380.jpg@200w_200h_90Q', '美年达,青苹果味,碳酸饮料,汽水,闪送超市,', '美年达青苹果味600ml', 0, '0', '600ml', 3, 3, '103549', '103552', '碳酸饮料', '4858', 200, 75);
INSERT INTO `axf_goods` VALUES (163, '5474', 'http://img01.bqstatic.com/upload/goods/000/000/5474/0000005474.jpg@200w_200h_90Q', '', '农夫山泉箱550.0ml*24瓶', 0, '0', '550ml*24瓶', 36, 36, '103549', '104503', '整箱购', '4858', 200, 75);
INSERT INTO `axf_goods` VALUES (164, '100023', 'http://img01.bqstatic.com/upload/goods/000/001/5498/0000015498_21980.jpg@200w_200h_90Q', '碱法苹果味苏打水', '碱法苹果味苏打水500.0ml/瓶', 0, '0', '500ml/瓶', 4, 3, '103549', '103550', '饮用水', '4858', 200, 73);
INSERT INTO `axf_goods` VALUES (165, '4906', 'http://img01.bqstatic.com/upload/goods/000/000/4906/0000004906.jpg@200w_200h_90Q', '', '康师傅绿茶1L', 0, '0', '1L', 4.5, 4.5, '103549', '103554', '茶饮/咖啡', '4858', 200, 72);
INSERT INTO `axf_goods` VALUES (166, '5962', 'http://img01.bqstatic.com/upload/goods/000/000/5962/0000005962_50570.jpg@200w_200h_90Q', '芬达,橙汁,碳酸饮料,闪送超市,', '「芬达」橙味汽水600ml', 0, '0', '600ml', 3, 3, '103549', '103552', '碳酸饮料', '4858', 200, 70);
INSERT INTO `axf_goods` VALUES (167, '15405', 'http://img01.bqstatic.com/upload/goods/000/001/5405/0000015405_36480.jpg@200w_200h_90Q', '统一绿茶茉莉味', '统一绿茶茉莉味250ml', 0, '0', '250ml', 1.5, 2, '103549', '103554', '茶饮/咖啡', '4858', 200, 69);
INSERT INTO `axf_goods` VALUES (168, '2209', 'http://img01.bqstatic.com/upload/goods/000/000/2209/0000002209.jpg@200w_200h_90Q', '水溶,C100,西柚味,饮料', '农夫水溶C100西柚445ml', 0, '0', '445ml', 5, 5, '103549', '103553', '功能饮料', '4858', 200, 69);
INSERT INTO `axf_goods` VALUES (169, '15407', 'http://img01.bqstatic.com/upload/goods/000/001/5407/0000015407_69300.jpg@200w_200h_90Q', '', '康师傅茉莉蜜茶500ml', 0, '0', '500ml', 3, 3, '103549', '103554', '茶饮/咖啡', '4858', 200, 67);
INSERT INTO `axf_goods` VALUES (170, '8470', 'http://img01.bqstatic.com/upload/goods/000/000/8470/0000008470.jpg@200w_200h_90Q', '', '健力宝橙蜜味560ml', 0, '0', '560ml', 3.5, 4, '103549', '103553', '功能饮料', '4858', 200, 63);
INSERT INTO `axf_goods` VALUES (171, '4542', 'http://img01.bqstatic.com/upload/goods/000/000/4542/0000004542.jpg@200w_200h_90Q', '尖叫,纤维型,运动饮料,酒水饮品,机能饮料', '尖叫植物纤维饮料550ml', 0, '0', '550ml', 4, 4, '103549', '103553', '功能饮料', '4858', 200, 63);
INSERT INTO `axf_goods` VALUES (172, '2183', 'http://img01.bqstatic.com/upload/goods/000/000/2183/0000002183.jpg@200w_200h_90Q', '劲酒,35度,白酒,酒水饮料', '劲酒35度125.0ml', 0, '0', '125ml', 11, 10, '103549', '103555', '酒类', '4858', 200, 63);
INSERT INTO `axf_goods` VALUES (173, '4613', 'http://img01.bqstatic.com/upload/goods/000/000/4613/0000004613_19980.jpg@200w_200h_90Q', '统一,冰红茶,酒水饮品,茶饮', '统一冰红茶500ml', 0, '0', '500ml', 3, 3, '103549', '103554', '茶饮/咖啡', '4858', 200, 62);
INSERT INTO `axf_goods` VALUES (174, '8671', 'http://img01.bqstatic.com/upload/goods/000/000/8671/0000008671.jpg@200w_200h_90Q', '汇源,100%苹果汁,饮料', '汇源100%苹果汁200ml', 0, '0', '200ml', 4, 4, '103549', '103551', '果汁饮料', '4858', 200, 62);
INSERT INTO `axf_goods` VALUES (175, '5548', 'http://img01.bqstatic.com/upload/goods/000/000/5548/0000005548.jpg@200w_200h_90Q', '', '燕京普通听装(箱)330ml*24', 0, '0', '330ml*24', 68, 68, '103549', '104503', '整箱购', '4858', 200, 60);
INSERT INTO `axf_goods` VALUES (176, '100021', 'http://img01.bqstatic.com/upload/goods/000/001/5819/0000015819_67120.jpg@200w_200h_90Q', '碱法柠檬味苏打水', '碱法柠檬味苏打水500.0ml/瓶', 0, '0', '500ml', 4, 5, '103549', '103552', '碳酸饮料', '4858', 200, 59);
INSERT INTO `axf_goods` VALUES (177, '4914', 'http://img01.bqstatic.com/upload/goods/000/000/4914/0000004914.jpg@200w_200h_90Q', '', '康师傅矿物质水1.5L', 0, '0', '1.5L', 3, 2.5, '103549', '103550', '饮用水', '4858', 200, 58);
INSERT INTO `axf_goods` VALUES (178, '7822', 'http://img01.bqstatic.com/upload/goods/000/000/7822/0000007822.jpg@200w_200h_90Q', '统一,鲜橙多', '统一鲜橙多2L', 0, '0', '2L', 8, 7, '103549', '103551', '果汁饮料', '4858', 200, 57);
INSERT INTO `axf_goods` VALUES (179, '5818', 'http://img01.bqstatic.com/upload/goods/201/601/1517/20160115173049_097085.jpg@200w_200h_90Q', '怡宝,饮用水,纯净水，矿泉水,闪送超市,', '怡宝饮用纯净水350ml', 0, '0', '350ml', 1.5, 1.5, '103549', '103550', '饮用水', '4858', 200, 56);
INSERT INTO `axf_goods` VALUES (180, '8670', 'http://img01.bqstatic.com/upload/goods/000/000/8670/0000008670.jpg@200w_200h_90Q', '', '汇源100%桃汁200ml', 0, '0', '200ml', 4, 4, '103549', '103551', '果汁饮料', '4858', 200, 56);
INSERT INTO `axf_goods` VALUES (181, '100405', 'http://img01.bqstatic.com/upload/goods/201/603/0117/20160301174957_425008.jpg@200w_200h_90Q', '统一小茗同学溜溜哒味', '统一小茗同学溜溜哒味480ml', 0, '0', '480ml', 5.5, 5.5, '103549', '103554', '茶饮/咖啡', '4858', 200, 55);
INSERT INTO `axf_goods` VALUES (182, '4611', 'http://img01.bqstatic.com/upload/goods/000/000/4611/0000004611_54460.jpg@200w_200h_90Q', '统一,冰红茶,酒水饮品,茶饮', '统一冰红茶1.0L', 0, '0', '1L', 4.5, 5, '103549', '103554', '茶饮/咖啡', '4858', 200, 55);
INSERT INTO `axf_goods` VALUES (183, '4540', 'http://img01.bqstatic.com/upload/goods/000/000/4540/0000004540.jpg@200w_200h_90Q', '尖叫,多肽型,运动饮料,酒水饮品,机能饮料', '尖叫运动多肽饮料550ml', 0, '0', '550ml', 4, 4, '103549', '103553', '功能饮料', '4858', 200, 54);
INSERT INTO `axf_goods` VALUES (184, '100017', 'http://img01.bqstatic.com/upload/goods/000/001/4747/0000014747_02140.jpg@200w_200h_90Q', '雀巢,优活,瓶装,水,矿泉水,饮料,饮料酒水', '雀巢优活水550ml', 0, '0', '550ml', 2, 0.5, '103549', '103550', '饮用水', '4858', 200, 53);
INSERT INTO `axf_goods` VALUES (185, '8669', 'http://img01.bqstatic.com/upload/goods/000/000/8669/0000008669.jpg@200w_200h_90Q', '', '汇源100%橙汁200ml', 0, '0', '200ml', 4, 4, '103549', '103551', '果汁饮料', '4858', 200, 52);
INSERT INTO `axf_goods` VALUES (186, '2478', 'http://img01.bqstatic.com/upload/goods/000/000/2478/0000002478.jpg@200w_200h_90Q', '统一,海之言,柠檬味,酒水饮料', '统一海之言海盐柠檬饮料500.0ml', 0, '0', '500ml', 4, 5, '103549', '103551', '果汁饮料', '4858', 200, 51);
INSERT INTO `axf_goods` VALUES (187, '2214', 'http://img01.bqstatic.com/upload/goods/000/000/2214/0000002214_45570.jpg@200w_200h_90Q', '美汁源,果粒橙,果汁,饮料', '「美汁源」「果粒橙」橙汁饮料450ml', 0, '0', '450ml', 4, 4, '103549', '103551', '果汁饮料', '4858', 200, 50);
INSERT INTO `axf_goods` VALUES (188, '15527', 'http://img01.bqstatic.com/upload/goods/000/001/5527/0000015527_26530.jpg@200w_200h_90Q', '脉动,菠萝味', '脉动菠萝口味维生素饮料600ml', 0, '0', '600ml', 4, 5, '103549', '103553', '功能饮料', '4858', 200, 49);
INSERT INTO `axf_goods` VALUES (189, '118588', 'http://img01.bqstatic.com/upload/goods/201/701/0417/20170104172845_601800.jpg@200w_200h_90Q', '农夫山泉,饮用,天然水,5l', '农夫山泉饮用天然水5L*4', 0, '0', '5L*4', 45, 45, '103549', '103550', '饮用水', '4858', 200, 48);
INSERT INTO `axf_goods` VALUES (190, '2180', 'http://img01.bqstatic.com/upload/goods/000/000/2180/0000002180.jpg@200w_200h_90Q', '牛栏山,二锅头,42度,酒水饮料', '牛栏山陈酿42度白酒500.0ml', 0, '0', '500ml', 13, 12, '103549', '103555', '酒类', '4858', 200, 48);
INSERT INTO `axf_goods` VALUES (191, '5975', 'http://img01.bqstatic.com/upload/goods/000/000/5975/0000005975_05650.jpg@200w_200h_90Q', '美汁源,爽粒,葡萄,饮料,果汁饮料,闪送超市,', '「美汁源」爽粒葡萄饮料450.0ml', 0, '0', '450ml', 4.5, 3.5, '103549', '103551', '果汁饮料', '4858', 200, 46);
INSERT INTO `axf_goods` VALUES (192, '2182', 'http://img01.bqstatic.com/upload/goods/000/000/2182/0000002182.jpg@200w_200h_90Q', '牛栏山,二锅头,46度,酒水饮料', '牛栏山46度白酒500ml', 0, '0', '500ml', 7, 7, '103549', '103555', '酒类', '4858', 200, 45);
INSERT INTO `axf_goods` VALUES (193, '8676', 'http://img01.bqstatic.com/upload/goods/000/000/8676/0000008676.jpg@200w_200h_90Q', '', '汇源100%苹果汁1L', 0, '0', '1L', 15, 15, '103549', '103551', '果汁饮料', '4858', 200, 43);
INSERT INTO `axf_goods` VALUES (194, '2811', 'http://img01.bqstatic.com/upload/goods/201/610/0911/20161009111534_838956.jpg@200w_200h_90Q', '脉动荔枝味', '脉动维生素荔枝口味600ml', 0, '0', '600ml', 4, 4, '103549', '103553', '功能饮料', '4858', 200, 41);
INSERT INTO `axf_goods` VALUES (195, '7786', 'http://img01.bqstatic.com/upload/goods/000/000/7786/0000007786.jpg@200w_200h_90Q', '', '加多宝凉茶500ml', 0, '0', '500ml', 4, 5, '103549', '103554', '茶饮/咖啡', '4858', 200, 38);
INSERT INTO `axf_goods` VALUES (196, '15394', 'http://img01.bqstatic.com/upload/goods/000/001/5394/0000015394_47350.jpg@200w_200h_90Q', '', '东方树叶红茶500.0ml', 0, '0', '500ml', 4, 3.5, '103549', '103554', '茶饮/咖啡', '4858', 200, 38);
INSERT INTO `axf_goods` VALUES (197, '2979', 'http://img01.bqstatic.com/upload/goods/201/610/0911/20161009111502_255082.jpg@200w_200h_90Q', '脉动桔子味', '脉动维生素橘子口味600ml', 0, '0', '600ml', 4, 4, '103549', '103553', '功能饮料', '4858', 200, 37);
INSERT INTO `axf_goods` VALUES (198, '5476', 'http://img01.bqstatic.com/upload/goods/000/000/5476/0000005476.jpg@200w_200h_90Q', '雪碧,柠檬味,碳酸饮料,汽水,闪送超市,', '「雪碧」柠檬味箱330.0ml*24听', 0, '0', '330ml*24听', 55, 55, '103549', '104503', '整箱购', '4858', 200, 37);
INSERT INTO `axf_goods` VALUES (199, '10469', 'http://img01.bqstatic.com/upload/goods/000/001/0469/0000010469.jpg@200w_200h_90Q', '', '统一小茗同学冷泡茉莉萃茶480.0ml', 0, '0', '480ml', 5.5, 5, '103549', '103554', '茶饮/咖啡', '4858', 200, 36);
INSERT INTO `axf_goods` VALUES (200, '5392', 'http://img01.bqstatic.com/upload/goods/000/000/5392/0000005392.jpg@200w_200h_90Q', '哈尔滨,小麦王,啤酒，酒,闪送超市,', '哈尔滨小麦王箱330.0ml*24听', 0, '0', '330ml*24听', 65, 65, '103549', '104503', '整箱购', '4858', 200, 36);
INSERT INTO `axf_goods` VALUES (201, '3477', 'http://img01.bqstatic.com/upload/goods/000/000/3477/0000003477.jpg@200w_200h_90Q', '水溶C100,青皮桔味,饮料', '水溶C100青皮桔味445.0ml', 0, '0', '445ml', 4.5, 4.5, '103549', '103553', '功能饮料', '4858', 200, 34);
INSERT INTO `axf_goods` VALUES (202, '91732', 'http://img01.bqstatic.com/upload/goods/000/009/1732/0000091732_35010.jpg@200w_200h_90Q', '', '锐澳蓝玫瑰味威士忌鸡尾酒275ml', 0, '0', '275ml', 13, 13, '103549', '103555', '酒类', '4858', 200, 33);
INSERT INTO `axf_goods` VALUES (203, '5531', 'http://img01.bqstatic.com/upload/goods/000/000/5531/0000005531.jpg@200w_200h_90Q', '', '统一绿茶茉莉味箱500.0ml*15瓶', 0, '0', '500ml*15瓶', 42, 38, '103549', '104503', '整箱购', '4858', 200, 33);
INSERT INTO `axf_goods` VALUES (204, '103030', 'http://img01.bqstatic.com/upload/goods/201/607/2814/20160728144603_886952.jpg@200w_200h_90Q', '统一小茗同学冷泡冰橘绿茶', '统一小茗同学冷泡冰橘绿茶480ml', 0, '0', '480ml', 5.5, 5.5, '103549', '103554', '茶饮/咖啡', '4858', 200, 32);
INSERT INTO `axf_goods` VALUES (205, '91607', 'http://img01.bqstatic.com/upload/goods/000/009/1607/0000091607_33600.jpg@200w_200h_90Q', '', '锐澳水蜜桃味白兰地鸡尾酒275ml', 0, '0', '275ml', 13, 13, '103549', '103555', '酒类', '4858', 200, 31);
INSERT INTO `axf_goods` VALUES (206, '5483', 'http://img01.bqstatic.com/upload/goods/000/000/5483/0000005483.jpg@200w_200h_90Q', '百事,可乐,汽水,碳酸饮料,闪送超市,', '百事可乐箱330.0ml*24听', 0, '0', '330ml*24听', 55, 55, '103549', '104503', '整箱购', '4858', 200, 31);
INSERT INTO `axf_goods` VALUES (207, '9081', 'http://img01.bqstatic.com/upload/goods/000/000/9081/0000009081.jpg@200w_200h_90Q', '', '怡宝纯净水箱350.0ml*24瓶', 0, '0', '350ml*24瓶', 36, 30, '103549', '104503', '整箱购', '4858', 200, 30);
INSERT INTO `axf_goods` VALUES (208, '4810', 'http://img01.bqstatic.com/upload/goods/000/000/4810/0000004810.jpg@200w_200h_90Q', '', '恒大冰泉500.0ml', 0, '0', '500ml', 3.5, 4, '103549', '103550', '饮用水', '4858', 200, 29);
INSERT INTO `axf_goods` VALUES (209, '5485', 'http://img01.bqstatic.com/upload/goods/201/605/0517/20160505171030_110112.jpg@200w_200h_90Q', '康师傅,矿泉水,闪送超市,', '康师傅饮用水箱1.5L*8瓶', 0, '0', '1.5L*8瓶', 24, 22, '103549', '104503', '整箱购', '4858', 200, 29);
INSERT INTO `axf_goods` VALUES (210, '5429', 'http://img01.bqstatic.com/upload/goods/000/000/5429/0000005429.jpg@200w_200h_90Q', '青岛,啤酒,啤酒,酒,闪送超市,', '青岛啤酒箱500.0ml*12听', 0, '0', '500ml*12听', 70, 70, '103549', '104503', '整箱购', '4858', 200, 29);
INSERT INTO `axf_goods` VALUES (211, '13580', 'http://img01.bqstatic.com/upload/goods/000/001/3580/0000013580_96970.jpg@200w_200h_90Q', '', '脉动芒果口味维生素饮料600ml', 0, '0', '600ml', 4, 4, '103549', '103553', '功能饮料', '4858', 200, 28);
INSERT INTO `axf_goods` VALUES (212, '5963', 'http://img01.bqstatic.com/upload/goods/000/000/5963/0000005963.jpg@200w_200h_90Q', '芬达,苹果味,汽水,碳酸饮料,闪送超市,', '芬达苹果味汽水600.0ml', 0, '0', '600ml', 3, 3, '103549', '103552', '碳酸饮料', '4858', 200, 28);
INSERT INTO `axf_goods` VALUES (213, '91589', 'http://img01.bqstatic.com/upload/goods/000/009/1589/0000091589_42590.jpg@200w_200h_90Q', '', '锐澳青柠味朗姆鸡尾酒275ml', 0, '0', '275ml', 13, 13, '103549', '103555', '酒类', '4858', 200, 27);
INSERT INTO `axf_goods` VALUES (214, '4356', 'http://img01.bqstatic.com/upload/goods/000/000/4356/0000004356.jpg@200w_200h_90Q', '统一,鲜橙多,酒水饮品,果汁饮料', '统一鲜橙多450.0ml', 0, '0', '450ml', 3.5, 3.5, '103549', '103551', '果汁饮料', '4858', 200, 26);
INSERT INTO `axf_goods` VALUES (215, '91737', 'http://img01.bqstatic.com/upload/goods/000/009/1737/0000091737_42540.jpg@200w_200h_90Q', '', '锐澳紫葡萄味白兰地鸡尾酒275.0ml', 0, '0', '275ml', 13, 13, '103549', '103555', '酒类', '4858', 200, 25);
INSERT INTO `axf_goods` VALUES (216, '10253', 'http://img01.bqstatic.com/upload/goods/000/001/0253/0000010253.jpg@200w_200h_90Q', '红星,二锅头,八年陈酿,43度', '红星二锅头酒43度500ml', 0, '0', '500ml', 26, 32, '103549', '103555', '酒类', '4858', 200, 25);
INSERT INTO `axf_goods` VALUES (217, '5477', 'http://img01.bqstatic.com/upload/goods/000/000/5477/0000005477.jpg@200w_200h_90Q', '芬达,橙味,汽水,碳酸饮料,闪送超市,', '芬达橙味汽水箱330.0ml*24听', 0, '0', '330ml*24听', 55, 55, '103549', '104503', '整箱购', '4858', 200, 25);
INSERT INTO `axf_goods` VALUES (218, '99987', 'http://img01.bqstatic.com/upload/goods/000/000/2422/0000002422_07930.jpg@200w_200h_90Q', '娃哈哈,营养快线,原味,乳制品', '娃哈哈营养快线原味500ml/瓶', 0, '0', '500ml/瓶', 5, 5, '103549', '104489', '植物蛋白', '4858', 200, 25);
INSERT INTO `axf_goods` VALUES (219, '5971', 'http://img01.bqstatic.com/upload/goods/000/000/5971/0000005971_78050.jpg@200w_200h_90Q', '统一,冰糖,雪梨,果汁,饮料,闪送超市,', '统一冰糖雪梨500.0ml', 0, '0', '500ml', 3, 3, '103549', '103554', '茶饮/咖啡', '4858', 200, 24);
INSERT INTO `axf_goods` VALUES (220, '104450', 'http://img01.bqstatic.com/upload/goods/201/603/2514/20160325142605_361138.jpg@200w_200h_90Q', '统一,海之言,黑加仑味,功能饮料', '统一海之言黑加仑味500ml', 0, '0', '500ml', 4, 4, '103549', '103553', '功能饮料', '4858', 200, 24);
INSERT INTO `axf_goods` VALUES (221, '3567', 'http://img01.bqstatic.com/upload/goods/000/000/3567/0000003567.jpg@200w_200h_90Q', '统一,海之言,西柚味,饮料', '统一海之言海盐西柚果味饮料500.0ml', 0, '0', '500ml', 4, 4, '103549', '103551', '果汁饮料', '4858', 200, 24);
INSERT INTO `axf_goods` VALUES (222, '7827', 'http://img01.bqstatic.com/upload/goods/000/000/7827/0000007827.jpg@200w_200h_90Q', '统一鲜橙多(小)', '统一鲜橙多250ml', 0, '0', '250ml', 1.5, 2, '103549', '103551', '果汁饮料', '4858', 200, 23);
INSERT INTO `axf_goods` VALUES (223, '8675', 'http://img01.bqstatic.com/upload/goods/000/000/8675/0000008675.jpg@200w_200h_90Q', '', '汇源100%葡萄汁1.0L', 0, '0', '1L', 15, 15, '103549', '103551', '果汁饮料', '4858', 200, 23);
INSERT INTO `axf_goods` VALUES (224, '8672', 'http://img01.bqstatic.com/upload/goods/000/000/8672/0000008672.jpg@200w_200h_90Q', '', '汇源100%葡萄汁200ml', 0, '0', '200ml', 4, 4, '103549', '103551', '果汁饮料', '4858', 200, 22);
INSERT INTO `axf_goods` VALUES (225, '5393', 'http://img01.bqstatic.com/upload/goods/000/000/5393/0000005393.jpg@200w_200h_90Q', '哈尔滨,小麦王,啤酒，酒,闪送超市,', '哈尔滨小麦王箱500.0ml*18听', 0, '0', '500ml*18听', 78, 78, '103549', '104503', '整箱购', '4858', 200, 22);
INSERT INTO `axf_goods` VALUES (226, '2298', 'http://img01.bqstatic.com/upload/goods/000/000/2298/0000002298.jpg@200w_200h_90Q', '东方树叶,红茶,酒水饮料', '东方树叶红茶480ml', 0, '0', '480ml', 4, 4, '103549', '103554', '茶饮/咖啡', '4858', 200, 21);
INSERT INTO `axf_goods` VALUES (227, '8637', 'http://img01.bqstatic.com/upload/goods/000/000/8637/0000008637.jpg@200w_200h_90Q', '', '「芬达」水蜜桃味汽水600.0ml', 0, '0', '600ml', 3, 3, '103549', '103552', '碳酸饮料', '4858', 200, 20);
INSERT INTO `axf_goods` VALUES (228, '118140', 'http://img01.bqstatic.com/upload/goods/201/612/1616/20161216162617_162550.jpg@200w_200h_90Q', '北冰洋,橙汁味,汽水,整箱', '北冰洋橙汁味汽水整箱330ml*24听', 0, '0', '330ml*24听', 105, 105, '103549', '104503', '整箱购', '4858', 200, 20);
INSERT INTO `axf_goods` VALUES (229, '69676', 'http://img01.bqstatic.com/upload/goods/000/006/9676/0000069676_79920.jpg@200w_200h_90Q', '娃哈哈,营养快线,香草冰淇淋味,乳制品,常温乳饮料', '娃哈哈香草冰淇淋营养快线500.0ml/瓶', 0, '0', '500ml', 5, 5, '103549', '104489', '植物蛋白', '4858', 200, 19);
INSERT INTO `axf_goods` VALUES (230, '5981', 'http://img01.bqstatic.com/upload/goods/000/000/5981/0000005981_28760.jpg@200w_200h_90Q', '华旗,山楂,果茶,无蔗糖,果汁,饮料,闪送超市,', '华旗山楂果茶无蔗糖400ml', 0, '0', '400ml', 4, 4, '103549', '103554', '茶饮/咖啡', '4858', 200, 18);
INSERT INTO `axf_goods` VALUES (231, '5528', 'http://img01.bqstatic.com/upload/goods/201/601/2013/20160120135823_526794.jpg@200w_200h_90Q', '统一,冰红茶,茶,饮料,闪送超市,', '统一冰红茶箱500.0ml*15瓶', 0, '0', '500ml*15瓶', 42, 38, '103549', '104503', '整箱购', '4858', 200, 18);
INSERT INTO `axf_goods` VALUES (232, '91971', 'http://img01.bqstatic.com/upload/goods/000/009/1971/0000091971_37590.jpg@200w_200h_90Q', '', '和其正凉茶600.0ml', 0, '0', '600ml', 4.5, 5, '103549', '103554', '茶饮/咖啡', '4858', 200, 17);
INSERT INTO `axf_goods` VALUES (233, '7821', 'http://img01.bqstatic.com/upload/goods/000/000/7821/0000007821.jpg@200w_200h_90Q', '统一蜜桃多', '统一蜜桃多250ml', 0, '0', '250ml', 1.5, 2, '103549', '103551', '果汁饮料', '4858', 200, 17);
INSERT INTO `axf_goods` VALUES (234, '4907', 'http://img01.bqstatic.com/upload/goods/201/601/2312/20160123120401_901504.jpg@200w_200h_90Q', '康师傅蜂蜜柚子', '康师傅蜂蜜柚子500ml', 0, '0', '500ml', 3, 3, '103549', '103554', '茶饮/咖啡', '4858', 200, 16);
INSERT INTO `axf_goods` VALUES (235, '5502', 'http://img01.bqstatic.com/upload/goods/000/000/5502/0000005502.jpg@200w_200h_90Q', '娃哈哈,纯净水,矿泉水,闪送超市,', '娃哈哈纯净水箱596.0ml*24瓶', 0, '0', '596ml*24瓶', 36, 32, '103549', '104503', '整箱购', '4858', 200, 16);
INSERT INTO `axf_goods` VALUES (236, '5490', 'http://img01.bqstatic.com/upload/goods/000/000/5490/0000005490.jpg@200w_200h_90Q', '红牛,维生素,功能,饮料,机能饮料,闪送超市,', '红牛维生素功能饮料箱250.0ml*24罐', 0, '0', '250ml*24罐', 144, 135, '103549', '104503', '整箱购', '4858', 200, 15);
INSERT INTO `axf_goods` VALUES (237, '90372', 'http://img01.bqstatic.com/upload/goods/000/009/0372/0000090372_59260.jpg@200w_200h_90Q', '康师傅,酸梅汤,酒水饮品,果汁饮料', '康师傅酸梅汤500ml', 0, '0', '500ml', 3, 3, '103549', '103551', '果汁饮料', '4858', 200, 14);
INSERT INTO `axf_goods` VALUES (238, '2184', 'http://img01.bqstatic.com/upload/goods/000/000/2184/0000002184.jpg@200w_200h_90Q', '红星,二锅头,56度,酒水饮料', '红星二锅头56度500ml', 0, '0', '500ml', 11, 10, '103549', '103555', '酒类', '4858', 200, 13);
INSERT INTO `axf_goods` VALUES (239, '5417', 'http://img01.bqstatic.com/upload/goods/201/601/2014/20160120140113_233690.jpg@200w_200h_90Q', '雪花,10度,清爽,啤酒,酒,闪送超市,', '雪花10度清爽箱330.0ml*24听', 0, '0', '330ml*24听', 65, 60, '103549', '104503', '整箱购', '4858', 200, 12);
INSERT INTO `axf_goods` VALUES (240, '5439', 'http://img01.bqstatic.com/upload/goods/000/000/5439/0000005439.jpg@200w_200h_90Q', '青岛,经典,系列,啤酒,酒,闪送超市,', '青岛啤酒箱330.0ml*24听', 0, '0', '330ml*24听', 95, 95, '103549', '104503', '整箱购', '4858', 200, 12);
INSERT INTO `axf_goods` VALUES (241, '5525', 'http://img01.bqstatic.com/upload/goods/000/000/5525/0000005525.jpg@200w_200h_90Q', '统一,冰红茶,茶,饮料,闪送超市,', '统一冰红茶箱250.0ml*24盒', 0, '0', '250ml*24盒', 35, 35, '103549', '104503', '整箱购', '4858', 200, 12);
INSERT INTO `axf_goods` VALUES (242, '5486', 'http://img01.bqstatic.com/upload/goods/000/000/5486/0000005486.jpg@200w_200h_90Q', '露露,杏仁露,乳饮料,乳制品,闪送超市,', '露露杏仁露箱240.0ml*24罐', 0, '0', '240ml*24罐', 82, 82, '103549', '104503', '整箱购', '4858', 200, 12);
INSERT INTO `axf_goods` VALUES (243, '104451', 'http://img01.bqstatic.com/upload/goods/201/603/2514/20160325143101_199045.jpg@200w_200h_90Q', '统一,海之言,水蜜桃味,功能饮料', '统一海之言水蜜桃味500ml', 0, '0', '500ml', 4, 4, '103549', '103553', '功能饮料', '4858', 200, 11);
INSERT INTO `axf_goods` VALUES (244, '91591', 'http://img01.bqstatic.com/upload/goods/000/009/1591/0000091591_79850.jpg@200w_200h_90Q', '', '锐澳混合果味伏特加鸡尾酒275.0ml', 0, '0', '275ml', 13, 13, '103549', '103555', '酒类', '4858', 200, 11);
INSERT INTO `axf_goods` VALUES (245, '10046', 'http://img01.bqstatic.com/upload/goods/000/001/0046/0000010046.jpg@200w_200h_90Q', '统一冰糖雪梨(小)', '统一冰糖雪梨250ml/盒', 0, '0', '250ml', 1.3, 1.3, '103549', '103551', '果汁饮料', '4858', 200, 11);
INSERT INTO `axf_goods` VALUES (246, '8702', 'http://img01.bqstatic.com/upload/goods/000/000/8702/0000008702.jpg@200w_200h_90Q', '统一,海之言,卡曼橘口味', '统一海之言海盐卡曼橘果味饮料500.0ml', 0, '0', '500ml', 4, 5, '103549', '103551', '果汁饮料', '4858', 200, 10);
INSERT INTO `axf_goods` VALUES (247, '99970', 'http://img01.bqstatic.com/upload/goods/000/000/6492/0000006492.jpg@200w_200h_90Q', '台湾美馔,芒果汁,美馔,饮品,果汁', '台湾美馔芒果汁490ml', 0, '0', '490ml', 7.5, 7, '103549', '103551', '果汁饮料', '4858', 200, 10);
INSERT INTO `axf_goods` VALUES (248, '99972', 'http://img01.bqstatic.com/upload/goods/000/000/6493/0000006493.jpg@200w_200h_90Q', '台湾美馔,蜜桃汁,美馔,饮品,果汁', '台湾美馔蜜桃汁490ml', 0, '0', '490ml', 8, 7, '103549', '103551', '果汁饮料', '4858', 200, 10);
INSERT INTO `axf_goods` VALUES (249, '69677', 'http://img01.bqstatic.com/upload/goods/000/006/9677/0000069677_49540.jpg@200w_200h_90Q', '娃哈哈,营养快线,菠萝味,乳制品,常温乳饮料', '娃哈哈营养快线菠萝味500ml', 0, '0', '500ml', 5, 5, '103549', '104489', '植物蛋白', '4858', 200, 10);
INSERT INTO `axf_goods` VALUES (250, '118141', 'http://img01.bqstatic.com/upload/goods/201/612/1616/20161216162810_823891.jpg@200w_200h_90Q', '北冰洋,橙汁味,汽水,整箱', '北冰洋桔汁味汽水整箱330ml*24听', 0, '0', '330ml*24听', 105, 105, '103549', '104503', '整箱购', '4858', 200, 9);
INSERT INTO `axf_goods` VALUES (251, '91599', 'http://img01.bqstatic.com/upload/goods/000/009/1599/0000091599_50720.jpg@200w_200h_90Q', '', '锐澳橙味伏特加鸡尾酒275ml', 0, '0', '275ml', 13, 13, '103549', '103555', '酒类', '4858', 200, 8);
INSERT INTO `axf_goods` VALUES (252, '8674', 'http://img01.bqstatic.com/upload/goods/000/000/8674/0000008674.jpg@200w_200h_90Q', '', '汇源100%梨汁1.0L', 0, '0', '1L', 15, 15, '103549', '103551', '果汁饮料', '4858', 200, 8);
INSERT INTO `axf_goods` VALUES (253, '5416', 'http://img01.bqstatic.com/upload/goods/000/000/5416/0000005416.jpg@200w_200h_90Q', '雪花,8度,清爽,啤酒,酒,闪送超市,', '雪花8度清爽箱500.0ml*12听', 0, '0', '500ml*12听', 42, 50, '103549', '104503', '整箱购', '4858', 200, 8);
INSERT INTO `axf_goods` VALUES (254, '9067', 'http://img01.bqstatic.com/upload/goods/000/000/9067/0000009067.jpg@200w_200h_90Q', '', '百威啤酒箱500.0ml*12听', 0, '0', '500ml*12听', 84, 84, '103549', '104503', '整箱购', '4858', 200, 8);
INSERT INTO `axf_goods` VALUES (255, '2212', 'http://img01.bqstatic.com/upload/goods/000/000/2212/0000002212.jpg@200w_200h_90Q', '康师傅,冰绿茶,饮料,闪送超市', '康师傅冰绿茶500.0ml', 0, '0', '500ml', 3, 3, '103549', '103554', '茶饮/咖啡', '4858', 200, 7);
INSERT INTO `axf_goods` VALUES (256, '101721', 'http://img01.bqstatic.com/upload/goods/201/512/3009/20151230093825_610101.jpg@200w_200h_90Q', '哈尔滨小麦王啤酒听装(箱)', '哈尔滨小麦王啤酒听装(箱)500ml*12', 0, '0', '500ml*12', 56, 56, '103549', '104503', '整箱购', '4858', 200, 7);
INSERT INTO `axf_goods` VALUES (257, '5427', 'http://img01.bqstatic.com/upload/goods/000/000/5427/0000005427.jpg@200w_200h_90Q', '雪花,勇闯天涯,啤酒,酒,闪送超市,', '雪花勇闯天涯箱330.0ml*24听', 0, '0', '330ml*24听', 80, 79, '103549', '104503', '整箱购', '4858', 200, 6);
INSERT INTO `axf_goods` VALUES (258, '118242', 'http://img01.bqstatic.com/upload/goods/201/612/2016/20161220161959_806293.jpg@200w_200h_90Q', '娃哈哈,营养快线,草莓味', '娃哈哈营养快线草莓味500ml', 0, '0', '500ml', 5, 4.5, '103549', '104489', '植物蛋白', '4858', 200, 6);
INSERT INTO `axf_goods` VALUES (259, '4359', 'http://img01.bqstatic.com/upload/goods/000/000/4359/0000004359_65300.jpg@200w_200h_90Q', '娃哈哈,格瓦斯,酒水饮品,机能饮料', '娃哈哈格瓦斯330.0ml', 0, '0', '330ml', 4, 3.5, '103549', '103552', '碳酸饮料', '4858', 200, 4);
INSERT INTO `axf_goods` VALUES (260, '118373', 'http://img01.bqstatic.com/upload/goods/201/612/2314/20161223143230_948420.jpg@200w_200h_90Q', '统一,鲜橙多,箱', '统一鲜橙多箱250ml*24', 0, '0', '250ml*24', 33, 32, '103549', '104503', '整箱购', '4858', 200, 4);
INSERT INTO `axf_goods` VALUES (261, '115563', 'http://img01.bqstatic.com/upload/goods/201/609/2915/20160929153505_515773.jpg@200w_200h_90Q', '娃哈哈,营养快线,香蕉味', '娃哈哈营养快线香蕉味500g', 0, '0', '500g', 5, 4.5, '103549', '104489', '植物蛋白', '4858', 200, 4);
INSERT INTO `axf_goods` VALUES (262, '3693', 'http://img01.bqstatic.com/upload/goods/000/000/3693/0000003693.jpg@200w_200h_90Q', '', '牛栏山百年陈酿36度白酒400.0ml', 0, '0', '400ml', 120, 125, '103549', '103555', '酒类', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (263, '5501', 'http://img01.bqstatic.com/upload/goods/000/000/5501/0000005501.jpg@200w_200h_90Q', '', '王老吉凉茶箱310.0ml*24罐', 0, '0', '310ml*24罐', 90, 90, '103549', '104503', '整箱购', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (264, '5986', 'http://img01.bqstatic.com/upload/goods/000/000/5986/0000005986_98750.jpg@200w_200h_90Q', '燕京,至简,苏打水,矿泉水,闪送超市,', '燕京至简苏打水380.0ml', 0, '0', '380ml', 4, 3, '103549', '103550', '饮用水', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (265, '10479', 'http://img01.bqstatic.com/upload/goods/000/001/0479/0000010479.jpg@200w_200h_90Q', '', '康师傅冰红茶310.0ml', 0, '0', '310ml', 2.5, 2.5, '103549', '103554', '茶饮/咖啡', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (266, '7617', 'http://img01.bqstatic.com/upload/goods/000/000/7617/0000007617.jpg@200w_200h_90Q', '', '老村长浓香型42度450.0ml', 0, '0', '450ml', 13, 13.8, '103549', '103555', '酒类', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (267, '4349', 'http://img01.bqstatic.com/upload/goods/000/000/4349/0000004349.jpg@200w_200h_90Q', '统一,蜜桃多,酒水饮品,果汁饮料', '统一蜜桃多450.0ml', 0, '0', '450ml', 3.5, 3.5, '103549', '103551', '果汁饮料', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (268, '4928', 'http://img01.bqstatic.com/upload/goods/000/000/4928/0000004928.jpg@200w_200h_90Q', '', '康师傅水蜜桃450.0ml', 0, '0', '450ml', 3.5, 3.5, '103549', '103551', '果汁饮料', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (269, '5555', 'http://img01.bqstatic.com/upload/goods/000/000/5555/0000005555.jpg@200w_200h_90Q', '', '恒大冰泉矿泉水箱500.0ml*24瓶', 0, '0', '500ml*24瓶', 95, 100, '103549', '104503', '整箱购', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (270, '5970', 'http://img01.bqstatic.com/upload/goods/000/000/5970/0000005970_60330.jpg@200w_200h_90Q', '健力宝,柠蜜味,碳酸饮料，闪送超市,', '健力宝柠蜜味560.0ml', 0, '0', '560ml', 3.5, 4, '103549', '103553', '功能饮料', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (271, '4348', 'http://img01.bqstatic.com/upload/goods/000/000/4348/0000004348.jpg@200w_200h_90Q', '统一,芒果多,酒水饮品,果汁饮料', '统一芒果多450.0ml', 0, '0', '450ml', 3.5, 3.5, '103549', '103551', '果汁饮料', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (272, '117999', 'http://img01.bqstatic.com/upload/goods/201/612/1218/20161212180116_042848.jpg@200w_200h_90Q', '牛栏山,陈酿,白酒,42度', '牛栏山陈酿白酒42度500ml*12瓶', 0, '0', '500ml*12瓶', 160, 160, '103549', '104503', '整箱购', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (273, '7758', 'http://img01.bqstatic.com/upload/goods/201/605/1917/20160519170808_850812.jpg@200w_200h_90Q', '康师傅,冰糖柠檬,饮料酒水', '康师傅冰糖柠檬500.0ml', 0, '0', '500ml', 3, 3, '103549', '103554', '茶饮/咖啡', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (274, '5959', 'http://img01.bqstatic.com/upload/goods/000/000/5959/0000005959.jpg@200w_200h_90Q', '', '脉动金桔姜味500.0ml', 0, '0', '500ml', 4, 4, '103549', '103553', '功能饮料', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (275, '6000', 'http://img01.bqstatic.com/upload/goods/000/000/6000/0000006000.jpg@200w_200h_90Q', '小浣熊,干脆面,香辣蟹味,方便面,闪送超市,', '统一小浣熊销魂香辣蟹味50g', 0, '0', '50g', 1.5, 1, '103557', '103558', '方便面', '4858', 200, 1081);
INSERT INTO `axf_goods` VALUES (276, '2399', 'http://img01.bqstatic.com/upload/goods/000/000/2399/0000002399.jpg@200w_200h_90Q', '双汇,王中王,火腿肠,速食便当', '双汇王中王38g', 0, '0', '38g', 1.2, 1.5, '103557', '103559', '火腿肠卤蛋', '4858', 200, 670);
INSERT INTO `axf_goods` VALUES (277, '2514', 'http://img01.bqstatic.com/upload/goods/000/000/2514/0000002514.jpg@200w_200h_90Q', '小浣熊,干脆面,烤肉味', '统一小浣熊有肉任性烤味50g', 0, '0', '50g', 1.3, 2, '103557', '103558', '方便面', '4858', 200, 618);
INSERT INTO `axf_goods` VALUES (278, '6020', 'http://img01.bqstatic.com/upload/goods/000/000/6020/0000006020.jpg@200w_200h_90Q', '双汇,鸡肉,香肠,火腿肠,速食便当,闪送超市,', '双汇东北鸡肉香肠65g', 0, '0', '65g', 1.5, 1, '103557', '103559', '火腿肠卤蛋', '4858', 200, 490);
INSERT INTO `axf_goods` VALUES (279, '6001', 'http://img01.bqstatic.com/upload/goods/000/000/6001/0000006001.jpg@200w_200h_90Q', '小浣熊,干脆面,奇奇怪怪味,方便面,闪送超市,', '小浣熊干脆面奇奇怪怪味1袋', 0, '0', '1袋', 1.2, 1, '103557', '103558', '方便面', '4858', 200, 346);
INSERT INTO `axf_goods` VALUES (280, '2510', 'http://img01.bqstatic.com/upload/goods/000/000/2510/0000002510.jpg@200w_200h_90Q', '小浣熊,干脆面,麻辣香锅味,休闲零食', '小浣熊干脆面麻辣香锅味1袋', 0, '0', '1袋', 1.2, 2, '103557', '103558', '方便面', '4858', 200, 282);
INSERT INTO `axf_goods` VALUES (281, '6007', 'http://img01.bqstatic.com/upload/goods/201/603/2209/20160322094913_414234.jpg@200w_200h_90Q', '康师傅,红烧,牛肉面,袋装', '康师傅红烧牛肉面袋装103g', 0, '0', '103g', 3, 2.5, '103557', '103558', '方便面', '4858', 200, 256);
INSERT INTO `axf_goods` VALUES (282, '6009', 'http://img01.bqstatic.com/upload/goods/201/601/2616/20160126164602_843009.jpg@200w_200h_90Q', '双汇,王中王,火腿肠,速食便当,闪送超市', '双汇王中王105g', 0, '0', '105g', 3, 3.5, '103557', '103559', '火腿肠卤蛋', '4858', 200, 224);
INSERT INTO `axf_goods` VALUES (283, '3512', 'http://img01.bqstatic.com/upload/goods/000/000/3512/0000003512_63670.jpg@200w_200h_90Q', '老干妈,香辣菜,速食便当,方便菜', '老干妈香辣菜60g', 0, '0', '60g', 2, 2, '103557', '103560', '下饭小菜', '4858', 200, 213);
INSERT INTO `axf_goods` VALUES (284, '6011', 'http://img01.bqstatic.com/upload/goods/000/000/6011/0000006011_48050.jpg@200w_200h_90Q', '双汇,玉米,热狗肠,火腿肠,速食便当,闪送超市,', '双汇玉米热狗肠160g', 0, '0', '160g', 5, 5, '103557', '103559', '火腿肠卤蛋', '4858', 200, 208);
INSERT INTO `axf_goods` VALUES (285, '6664', 'http://img01.bqstatic.com/upload/goods/000/000/6664/0000006664.jpg@200w_200h_90Q', '统一，老坛酸菜，牛肉，面，速食便当', '统一100老坛酸菜(香辣味)121g', 0, '0', '121g', 3, 3, '103557', '103558', '方便面', '4858', 200, 207);
INSERT INTO `axf_goods` VALUES (286, '3212', 'http://img01.bqstatic.com/upload/goods/000/000/3212/0000003212.jpg@200w_200h_90Q', '双汇,香辣,香脆肠,4连装,香肠', '双汇香辣香脆肠4连装140g', 0, '0', '140g', 5, 5, '103557', '103559', '火腿肠卤蛋', '4858', 200, 206);
INSERT INTO `axf_goods` VALUES (287, '4924', 'http://img01.bqstatic.com/upload/goods/000/000/4924/0000004924.jpg@200w_200h_90Q', '', '康师傅开心桶香辣牛肉面105g', 0, '0', '105g', 4.5, 4, '103557', '103558', '方便面', '4858', 200, 196);
INSERT INTO `axf_goods` VALUES (288, '5557', 'http://img01.bqstatic.com/upload/goods/201/603/2209/20160322094940_927507.jpg@200w_200h_90Q', '康师傅,红烧,牛肉面,桶装,方便面,闪送超市,', '康师傅红烧牛肉面桶装106g', 0, '0', '106g', 4.5, 3.8, '103557', '103558', '方便面', '4858', 200, 196);
INSERT INTO `axf_goods` VALUES (289, '9101', 'http://img01.bqstatic.com/upload/goods/000/000/9101/0000009101.jpg@200w_200h_90Q', '', '康师傅老陈醋酸辣牛肉面桶装108.0g', 0, '0', '108g', 4.5, 5, '103557', '103558', '方便面', '4858', 200, 193);
INSERT INTO `axf_goods` VALUES (290, '6004', 'http://img01.bqstatic.com/upload/goods/000/000/6004/0000006004_88460.jpg@200w_200h_90Q', '康师傅,鲜虾,鱼板面,袋装,方便面,闪送超市,', '康师傅鲜虾鱼板面袋装95g', 0, '0', '95g', 3, 2.5, '103557', '103558', '方便面', '4858', 200, 176);
INSERT INTO `axf_goods` VALUES (291, '9887', 'http://img01.bqstatic.com/upload/goods/000/000/9887/0000009887.jpg@200w_200h_90Q', '双汇,香脆肠', '双汇香脆肠150g', 0, '0', '150g', 5, 5, '103557', '103559', '火腿肠卤蛋', '4858', 200, 167);
INSERT INTO `axf_goods` VALUES (292, '2311', 'http://img01.bqstatic.com/upload/goods/000/000/2311/0000002311.jpg@200w_200h_90Q', '统一,老坛酸菜,牛肉面,桶装,方便面', '统一来一桶香辣味老坛酸菜120g', 0, '0', '120g', 4.5, 5, '103557', '103558', '方便面', '4858', 200, 163);
INSERT INTO `axf_goods` VALUES (293, '10340', 'http://img01.bqstatic.com/upload/goods/201/612/0617/20161206175907_247758.jpg@200w_200h_90Q', '鱼泉,精制,榨菜', '鱼泉精制榨菜70g', 0, '0', '70g', 1.5, 1.3, '103557', '103560', '下饭小菜', '4858', 200, 160);
INSERT INTO `axf_goods` VALUES (294, '4272', 'http://img01.bqstatic.com/upload/goods/000/000/4272/0000004272.jpg@200w_200h_90Q', '双汇,Q趣儿,孜然,香肠,火腿肠', '双汇Q趣儿孜然风味香肠85g', 0, '0', '85g', 2.5, 2.5, '103557', '103559', '火腿肠卤蛋', '4858', 200, 155);
INSERT INTO `axf_goods` VALUES (295, '3830', 'http://img01.bqstatic.com/upload/goods/000/000/3830/0000003830_00980.jpg@200w_200h_90Q', '', '乌江榨菜芯60g', 0, '0', '60g', 1.5, 1.5, '103557', '103560', '下饭小菜', '4858', 200, 149);
INSERT INTO `axf_goods` VALUES (296, '90472', 'http://img01.bqstatic.com/upload/goods/201/601/2115/20160121152656_821394.jpg@200w_200h_90Q', '娃哈哈,桂圆,莲子,八宝粥', '娃哈哈桂圆莲子八宝粥360g', 0, '0', '360g', 4.5, 5, '103557', '103561', '罐头食品', '4858', 200, 149);
INSERT INTO `axf_goods` VALUES (297, '9881', 'http://img01.bqstatic.com/upload/goods/000/000/9881/0000009881.jpg@200w_200h_90Q', '', '雀巢咖啡1+2原味(单条)15g', 0, '0', '15g', 1.5, 1.5, '103557', '103563', '冲调饮品', '4858', 200, 146);
INSERT INTO `axf_goods` VALUES (298, '6661', 'http://img01.bqstatic.com/upload/goods/201/603/2210/20160322100208_022359.jpg@200w_200h_90Q', '康师傅,香辣牛肉,方便面,速食便当', '康师傅香辣牛肉面袋装101g', 0, '0', '101g', 3, 3, '103557', '103558', '方便面', '4858', 200, 135);
INSERT INTO `axf_goods` VALUES (299, '2693', 'http://img01.bqstatic.com/upload/goods/000/000/2693/0000002693_43310.jpg@200w_200h_90Q', '统一,汤达人,日式,豚骨拉面,方便面', '统一汤达人日式豚骨拉面130g', 0, '0', '130g', 8, 8.5, '103557', '103558', '方便面', '4858', 200, 135);
INSERT INTO `axf_goods` VALUES (300, '2409', 'http://img01.bqstatic.com/upload/goods/201/601/1617/20160116171647_008798.jpg@200w_200h_90Q', '香飘飘,奶茶,原味,酒水饮料', '香飘飘奶茶原味80g', 0, '0', '80g', 4, 5, '103557', '103563', '冲调饮品', '4858', 200, 131);
INSERT INTO `axf_goods` VALUES (301, '3517', 'http://img01.bqstatic.com/upload/goods/000/000/3517/0000003517.jpg@200w_200h_90Q', '双汇,王中王,优级,火腿肠,速食便当', '双汇王中王优级火腿肠270g', 0, '0', '270g', 9.5, 10, '103557', '103559', '火腿肠卤蛋', '4858', 200, 130);
INSERT INTO `axf_goods` VALUES (302, '4288', 'http://img01.bqstatic.com/upload/goods/000/000/4288/0000004288_21440.jpg@200w_200h_90Q', '康师傅,鲜虾鱼板,面,方便面,速食', '康师傅鲜虾鱼板桶面98g', 0, '0', '98g', 4.5, 4.5, '103557', '103558', '方便面', '4858', 200, 127);
INSERT INTO `axf_goods` VALUES (303, '6012', 'http://img01.bqstatic.com/upload/goods/000/000/6012/0000006012.jpg@200w_200h_90Q', '双汇,台式,烤香肠,火腿肠,速食便当,闪送超市,', '双汇台式烤香肠48g', 0, '0', '48g', 2.5, 2.5, '103557', '103559', '火腿肠卤蛋', '4858', 200, 125);
INSERT INTO `axf_goods` VALUES (304, '94421', 'http://img01.bqstatic.com/upload/goods/000/009/4421/0000094421_40210.jpg@200w_200h_90Q', '统一,小浣熊,意大利,红烩', '统一小浣熊系列意大利红烩袋50g', 0, '0', '1袋', 1.2, 1.5, '103557', '103558', '方便面', '4858', 200, 124);
INSERT INTO `axf_goods` VALUES (305, '9319', 'http://img01.bqstatic.com/upload/goods/000/000/9319/0000009319.jpg@200w_200h_90Q', '', '康师傅红烧牛肉面100g*5包', 0, '0', '100g*5包', 15, 12, '103557', '103558', '方便面', '4858', 200, 120);
INSERT INTO `axf_goods` VALUES (306, '2509', 'http://img01.bqstatic.com/upload/goods/000/000/2509/0000002509.jpg@200w_200h_90Q', '小浣熊,干脆面,台湾烤肠味,休闲零食', '小浣熊干脆面台湾烤肠味1袋', 0, '0', '1袋', 1.3, 2, '103557', '103558', '方便面', '4858', 200, 109);
INSERT INTO `axf_goods` VALUES (307, '8338', 'http://img01.bqstatic.com/upload/goods/000/000/8338/0000008338.jpg@200w_200h_90Q', '统一,汤达人,酸酸辣辣,豚骨面,碗装', '统一汤达人酸酸辣辣豚骨面135g', 0, '0', '135g', 8, 8, '103557', '103558', '方便面', '4858', 200, 109);
INSERT INTO `axf_goods` VALUES (308, '2502', 'http://img01.bqstatic.com/upload/goods/000/000/2502/0000002502_72960.jpg@200w_200h_90Q', '农心,兵卒一口脆,咖喱味,休闲零食', '农心兵卒咖喱味一口脆70g', 0, '0', '70g', 4, 4, '103557', '103558', '方便面', '4858', 200, 102);
INSERT INTO `axf_goods` VALUES (309, '6003', 'http://img01.bqstatic.com/upload/goods/000/000/6003/0000006003.jpg@200w_200h_90Q', '康师傅,小鸡,炖蘑菇,面,袋装,方便面,闪送超市,', '康师傅小鸡炖蘑菇面袋装95g', 0, '0', '95g', 3, 2.5, '103557', '103558', '方便面', '4858', 200, 100);
INSERT INTO `axf_goods` VALUES (310, '8319', 'http://img01.bqstatic.com/upload/goods/000/000/8319/0000008319.jpg@200w_200h_90Q', '统一,汤达人,日式豚骨,拉面,杯装', '统一汤达人日式豚骨拉面78g', 0, '0', '78g', 6, 5, '103557', '103558', '方便面', '4858', 200, 96);
INSERT INTO `axf_goods` VALUES (311, '7699', 'http://img01.bqstatic.com/upload/goods/000/000/7699/0000007699.jpg@200w_200h_90Q', '', '三全灌汤水饺猪肉大葱450g', 0, '0', '450g', 8, 8.9, '103557', '103562', '速冻面点', '4858', 200, 92);
INSERT INTO `axf_goods` VALUES (312, '2512', 'http://img01.bqstatic.com/upload/goods/000/000/2512/0000002512.jpg@200w_200h_90Q', '小浣熊,干脆面,奥尔良烤翅味,休闲零食', '小浣熊奥尔良烤翅味干脆面50g', 0, '0', '50g', 2, 2, '103557', '103558', '方便面', '4858', 200, 87);
INSERT INTO `axf_goods` VALUES (313, '4345', 'http://img01.bqstatic.com/upload/goods/000/000/4345/0000004345.jpg@200w_200h_90Q', '统一,汤达人,酸酸辣辣,豚骨面,速食便当,方便面', '统一汤达人酸酸辣辣豚骨面83.0g', 0, '0', '83g', 6.5, 5, '103557', '103558', '方便面', '4858', 200, 86);
INSERT INTO `axf_goods` VALUES (314, '6002', 'http://img01.bqstatic.com/upload/goods/000/000/6002/0000006002_41500.jpg@200w_200h_90Q', '康师傅,西红柿,鸡蛋,打卤面,袋装,方便面,闪送超市,', '康师傅西红柿鸡蛋打卤面袋装100g', 0, '0', '100g', 3, 2.5, '103557', '103558', '方便面', '4858', 200, 83);
INSERT INTO `axf_goods` VALUES (315, '4129', 'http://img01.bqstatic.com/upload/goods/000/000/4129/0000004129.jpg@200w_200h_90Q', '双汇,香辣,香脆肠,速食便当,火腿肠', '双汇香辣香脆肠35g', 0, '0', '35g', 1.5, 1.5, '103557', '103559', '火腿肠卤蛋', '4858', 200, 81);
INSERT INTO `axf_goods` VALUES (316, '101665', 'http://img01.bqstatic.com/upload/goods/000/001/4518/0000014518_54780.jpg@200w_200h_90Q', '白家,陈记,正宗,酸辣味,方便,粉丝,袋装', '白家陈记正宗酸辣味方便粉丝袋装108g', 0, '0', '108g', 3, 3, '103557', '103558', '方便面', '4858', 200, 75);
INSERT INTO `axf_goods` VALUES (317, '2469', 'http://img01.bqstatic.com/upload/goods/000/000/2469/0000002469.jpg@200w_200h_90Q', '双汇,马可波罗,火腿肠', '双汇马可波罗特级火腿肠100g', 0, '0', '100g', 3.5, 5, '103557', '103559', '火腿肠卤蛋', '4858', 200, 69);
INSERT INTO `axf_goods` VALUES (318, '4908', 'http://img01.bqstatic.com/upload/goods/000/000/4908/0000004908.jpg@200w_200h_90Q', '', '康师傅红烧牛肉干拌面碗装100g', 0, '0', '100g', 6, 5.5, '103557', '103558', '方便面', '4858', 200, 68);
INSERT INTO `axf_goods` VALUES (319, '8143', 'http://img01.bqstatic.com/upload/goods/000/000/8143/0000008143.jpg@200w_200h_90Q', '', '欢乐家黄桃罐头700g', 0, '0', '700g', 15, 14, '103557', '103561', '罐头食品', '4858', 200, 68);
INSERT INTO `axf_goods` VALUES (320, '2521', 'http://img01.bqstatic.com/upload/goods/000/000/2521/0000002521_29410.jpg@200w_200h_90Q', '农心,兵卒一口脆,辣味,休闲零食', '农心兵卒辣味一口脆70g', 0, '0', '70g', 4, 4, '103557', '103558', '方便面', '4858', 200, 66);
INSERT INTO `axf_goods` VALUES (321, '7705', 'http://img01.bqstatic.com/upload/goods/000/000/7705/0000007705.jpg@200w_200h_90Q', '', '三全灌汤水饺三鲜450.0g', 0, '0', '450g', 8.5, 8.9, '103557', '103562', '速冻面点', '4858', 200, 66);
INSERT INTO `axf_goods` VALUES (322, '3248', 'http://img01.bqstatic.com/upload/goods/201/601/2211/20160122111528_990489.jpg@200w_200h_90Q', '香飘飘,奶茶,香芋味,饮料', '香飘飘奶茶香芋味80g', 0, '0', '80g', 4, 4, '103557', '103563', '冲调饮品', '4858', 200, 66);
INSERT INTO `axf_goods` VALUES (323, '4273', 'http://img01.bqstatic.com/upload/goods/000/000/4273/0000004273.jpg@200w_200h_90Q', '双汇,Q趣儿,玉米,香肠,火腿肠', '双汇Q趣儿玉米风味香肠85g', 0, '0', '85g', 2.5, 2.5, '103557', '103559', '火腿肠卤蛋', '4858', 200, 64);
INSERT INTO `axf_goods` VALUES (324, '7689', 'http://img01.bqstatic.com/upload/goods/000/000/7689/0000007689.jpg@200w_200h_90Q', '', '三全灌汤水饺猪肉芹菜450g', 0, '0', '450g', 8.9, 8.9, '103557', '103562', '速冻面点', '4858', 200, 64);
INSERT INTO `axf_goods` VALUES (325, '14869', 'http://img01.bqstatic.com/upload/goods/000/001/4869/0000014869_55130.jpg@200w_200h_90Q', '康师傅,红烧,排骨,面,速食便当,闪送超市,', '康师傅红烧排骨面1.0袋', 0, '0', '1袋', 3, 2, '103557', '103558', '方便面', '4858', 200, 59);
INSERT INTO `axf_goods` VALUES (326, '2435', 'http://img01.bqstatic.com/upload/goods/000/000/2435/0000002435_98880.jpg@200w_200h_90Q', '银鹭,桂圆八宝粥,粥,速食便当', '银鹭桂圆八宝粥360g', 0, '0', '360g', 4.5, 5, '103557', '103561', '罐头食品', '4858', 200, 56);
INSERT INTO `axf_goods` VALUES (327, '2200', 'http://img01.bqstatic.com/upload/goods/000/000/2200/0000002200.jpg@200w_200h_90Q', '雀巢即饮咖啡香滑罐装', '雀巢香滑咖啡180ml', 0, '0', '180ml', 5, 5, '103557', '103563', '冲调饮品', '4858', 200, 51);
INSERT INTO `axf_goods` VALUES (328, '3245', 'http://img01.bqstatic.com/upload/goods/201/603/2209/20160322095553_579548.jpg@200w_200h_90Q', '康师傅,西红柿鸡蛋,打卤面,桶装,方便面', '康师傅西红柿鸡蛋打卤面桶装112g', 0, '0', '112g', 4.5, 4, '103557', '103558', '方便面', '4858', 200, 49);
INSERT INTO `axf_goods` VALUES (329, '111489', 'http://img01.bqstatic.com/upload/goods/201/607/1518/20160715181132_555137.jpg@200w_200h_90Q', '康师傅,香辣牛肉面,拌面', '康师傅香辣牛肉干拌面135g', 0, '0', '135g', 6, 6.5, '103557', '103558', '方便面', '4858', 200, 47);
INSERT INTO `axf_goods` VALUES (330, '7701', 'http://img01.bqstatic.com/upload/goods/000/000/7701/0000007701.jpg@200w_200h_90Q', '', '三全灌汤水饺猪肉韭菜450.0g', 0, '0', '450g', 8.5, 8.9, '103557', '103562', '速冻面点', '4858', 200, 46);
INSERT INTO `axf_goods` VALUES (331, '3239', 'http://img01.bqstatic.com/upload/goods/000/000/3239/0000003239.jpg@200w_200h_90Q', '今麦郎,上品,酸豆角,排骨,面,桶装,方便面', '今麦郎上品酸豆角排骨面桶装160.0g', 0, '0', '160g', 5, 5, '103557', '103558', '方便面', '4858', 200, 45);
INSERT INTO `axf_goods` VALUES (332, '9157', 'http://img01.bqstatic.com/upload/goods/000/000/9157/0000009157.jpg@200w_200h_90Q', '双汇,王中王,火腿肠,速食便当', '双汇王中王400g', 0, '0', '400g', 15, 13, '103557', '103559', '火腿肠卤蛋', '4858', 200, 45);
INSERT INTO `axf_goods` VALUES (333, '2504', 'http://img01.bqstatic.com/upload/goods/000/000/2504/0000002504_43900.jpg@200w_200h_90Q', '农心,兵卒一口脆,披萨味,休闲零食', '农心兵卒比萨味一口脆70g', 0, '0', '70g', 4, 4, '103557', '103558', '方便面', '4858', 200, 44);
INSERT INTO `axf_goods` VALUES (334, '9088', 'http://img01.bqstatic.com/upload/goods/000/000/9088/0000009088.jpg@200w_200h_90Q', '', '康师傅西红柿鸡蛋打卤面104g', 0, '0', '104g', 3, 3, '103557', '103558', '方便面', '4858', 200, 43);
INSERT INTO `axf_goods` VALUES (335, '4020', 'http://img01.bqstatic.com/upload/goods/000/000/4020/0000004020.jpg@200w_200h_90Q', '湾仔码头,玉米,蔬菜,猪肉,水饺,速食,面点', '湾仔码头玉米蔬菜猪肉水饺720g', 0, '0', '720g', 29, 35, '103557', '103562', '速冻面点', '4858', 200, 43);
INSERT INTO `axf_goods` VALUES (336, '104454', 'http://img01.bqstatic.com/upload/goods/201/603/2514/20160325143926_854904.jpg@200w_200h_90Q', '欢乐家,黄桃,罐头,水果罐头', '欢乐家黄桃罐头256g', 0, '0', '256g', 6, 5, '103557', '103561', '罐头食品', '4858', 200, 41);
INSERT INTO `axf_goods` VALUES (337, '3242', 'http://img01.bqstatic.com/upload/goods/000/000/3242/0000003242.jpg@200w_200h_90Q', '康师傅,小鸡炖蘑菇,面,桶装,方便面', '康师傅小鸡炖蘑菇面桶装100g', 0, '0', '100g', 4.5, 4, '103557', '103558', '方便面', '4858', 200, 40);
INSERT INTO `axf_goods` VALUES (338, '7694', 'http://img01.bqstatic.com/upload/goods/000/000/7694/0000007694.jpg@200w_200h_90Q', '', '三全灌汤水饺韭菜鸡蛋450g', 0, '0', '450g', 8.9, 8.9, '103557', '103562', '速冻面点', '4858', 200, 40);
INSERT INTO `axf_goods` VALUES (339, '7704', 'http://img01.bqstatic.com/upload/goods/000/000/7704/0000007704.jpg@200w_200h_90Q', '', '三全灌汤水饺猪肉荠菜450g', 0, '0', '450g', 8, 8.9, '103557', '103562', '速冻面点', '4858', 200, 34);
INSERT INTO `axf_goods` VALUES (340, '4018', 'http://img01.bqstatic.com/upload/goods/000/000/4018/0000004018.jpg@200w_200h_90Q', '湾仔码头,虾仁,白菜,猪肉,速食便当,面点', '湾仔码头白菜猪肉水饺720.0g', 0, '0', '720g', 29, 36, '103557', '103562', '速冻面点', '4858', 200, 29);
INSERT INTO `axf_goods` VALUES (341, '3249', 'http://img01.bqstatic.com/upload/goods/000/000/3249/0000003249.jpg@200w_200h_90Q', '香飘飘,奶茶,草莓味,饮料', '香飘飘奶茶草莓味80.0g', 0, '0', '80g', 4, 4, '103557', '103563', '冲调饮品', '4858', 200, 29);
INSERT INTO `axf_goods` VALUES (342, '2442', 'http://img01.bqstatic.com/upload/goods/201/603/2210/20160322100023_938443.jpg@200w_200h_90Q', '康师傅,香菇炖鸡面,桶装,方便面', '康师傅香菇炖鸡面桶装100g', 0, '0', '100g', 4.5, 5, '103557', '103558', '方便面', '4858', 200, 28);
INSERT INTO `axf_goods` VALUES (343, '4355', 'http://img01.bqstatic.com/upload/goods/000/000/4355/0000004355.jpg@200w_200h_90Q', '统一,汤达人,海鲜拉面,杯装,速食便当,方便面', '统一汤达人海鲜拉面杯装72.0g', 0, '0', '72g', 6.5, 5.5, '103557', '103558', '方便面', '4858', 200, 28);
INSERT INTO `axf_goods` VALUES (344, '6662', 'http://img01.bqstatic.com/upload/goods/000/000/6662/0000006662.jpg@200w_200h_90Q', '康师傅,香菇,炖鸡,面,方便面,速食便当', '康师傅香菇炖鸡面袋装95g', 0, '0', '95g', 3, 3, '103557', '103558', '方便面', '4858', 200, 24);
INSERT INTO `axf_goods` VALUES (345, '3250', 'http://img01.bqstatic.com/upload/goods/000/000/3250/0000003250.jpg@200w_200h_90Q', '香飘飘,奶茶,巧克力味,饮料', '香飘飘奶茶巧克力味80.0g', 0, '0', '80g', 4, 4, '103557', '103563', '冲调饮品', '4858', 200, 24);
INSERT INTO `axf_goods` VALUES (346, '3469', 'http://img01.bqstatic.com/upload/goods/000/000/3469/0000003469.jpg@200w_200h_90Q', '古龙,茄汁沙丁鱼,罐头', '古龙茄汁沙丁鱼罐头425g', 0, '0', '425g', 10, 10, '103557', '103561', '罐头食品', '4858', 200, 22);
INSERT INTO `axf_goods` VALUES (347, '9099', 'http://img01.bqstatic.com/upload/goods/201/603/2209/20160322095515_287181.jpg@200w_200h_90Q', '康师傅,西红柿,鸡蛋打卤面,方便面', '康师傅西红柿鸡蛋打卤面108.0g', 0, '0', '108g', 4.5, 5, '103557', '103558', '方便面', '4858', 200, 21);
INSERT INTO `axf_goods` VALUES (348, '8336', 'http://img01.bqstatic.com/upload/goods/201/601/1517/20160115172119_632658.jpg@200w_200h_90Q', '统一,汤达人,罗宋汤,拉面,碗装,方便面', '统一汤达人罗宋汤拉面碗装130g', 0, '0', '130g', 8, 8, '103557', '103558', '方便面', '4858', 200, 20);
INSERT INTO `axf_goods` VALUES (349, '63115', 'http://img01.bqstatic.com/upload/goods/000/006/3115/0000063115_20660.jpg@200w_200h_90Q', '今麦郎,上品,香辣,牛肉面,方便面,速食便当,闪送超市,', '今麦郎上品香辣牛肉面1桶', 0, '0', '1桶', 5, 4.5, '103557', '103558', '方便面', '4858', 200, 20);
INSERT INTO `axf_goods` VALUES (350, '4021', 'http://img01.bqstatic.com/upload/goods/201/601/1918/20160119182522_073569.jpg@200w_200h_90Q', '湾仔码头,虾仁,芹菜,猪肉,速食便当,面点', '湾仔码头韭菜猪肉水饺720.0g', 0, '0', '720g', 36, 36, '103557', '103562', '速冻面点', '4858', 200, 20);
INSERT INTO `axf_goods` VALUES (351, '7708', 'http://img01.bqstatic.com/upload/goods/000/000/7708/0000007708.jpg@200w_200h_90Q', '', '三全灌汤水饺猪肉白菜500.0g', 0, '0', '500g', 8, 10.8, '103557', '103562', '速冻面点', '4858', 200, 20);
INSERT INTO `axf_goods` VALUES (352, '8321', 'http://img01.bqstatic.com/upload/goods/000/000/8321/0000008321.jpg@200w_200h_90Q', '', '统一汤达人罗宋汤味杯装85.0g', 0, '0', '85g', 6, 5, '103557', '103558', '方便面', '4858', 200, 18);
INSERT INTO `axf_goods` VALUES (353, '8340', 'http://img01.bqstatic.com/upload/goods/000/000/8340/0000008340.jpg@200w_200h_90Q', '', '统一汤达人海鲜拉面碗装110.0g', 0, '0', '110g', 8, 8, '103557', '103558', '方便面', '4858', 200, 17);
INSERT INTO `axf_goods` VALUES (354, '4022', 'http://img01.bqstatic.com/upload/goods/000/000/4022/0000004022.jpg@200w_200h_90Q', '湾仔码头,虾仁,荠菜,猪肉,速食便当,面点', '湾仔码头荠菜猪肉水饺720.0g', 0, '0', '720g', 28, 36, '103557', '103562', '速冻面点', '4858', 200, 17);
INSERT INTO `axf_goods` VALUES (355, '4019', 'http://img01.bqstatic.com/upload/goods/000/000/4019/0000004019_30990.jpg@200w_200h_90Q', '湾仔码头,虾仁,韭菜,猪肉,速食便当,面点', '湾仔码头芹菜猪肉水饺720g', 0, '0', '720g', 29, 36, '103557', '103562', '速冻面点', '4858', 200, 16);
INSERT INTO `axf_goods` VALUES (356, '6019', 'http://img01.bqstatic.com/upload/goods/000/000/6019/0000006019.jpg@200w_200h_90Q', '双汇,王中王,火腿肠,速食便当,闪送超市,', '双汇王中王210.0g', 0, '0', '210g', 6.5, 6.5, '103557', '103559', '火腿肠卤蛋', '4858', 200, 14);
INSERT INTO `axf_goods` VALUES (357, '7714', 'http://img01.bqstatic.com/upload/goods/000/000/7714/0000007714.jpg@200w_200h_90Q', '', '三全灌汤水饺三鲜500.0g', 0, '0', '500g', 8, 10.8, '103557', '103562', '速冻面点', '4858', 200, 14);
INSERT INTO `axf_goods` VALUES (358, '9091', 'http://img01.bqstatic.com/upload/goods/201/603/2209/20160322095527_548114.jpg@200w_200h_90Q', '康师傅,西红柿,鸡蛋打卤面,方便面', '康师傅西红柿鸡蛋打卤面109g', 0, '0', '109g', 4.5, 4.5, '103557', '103558', '方便面', '4858', 200, 13);
INSERT INTO `axf_goods` VALUES (359, '10400', 'http://img01.bqstatic.com/upload/goods/000/001/0400/0000010400.jpg@200w_200h_90Q', '', '娃哈哈桂圆莲子八宝粥箱360.0g*12罐', 0, '0', '360g*12罐', 54, 47, '103557', '103561', '罐头食品', '4858', 200, 13);
INSERT INTO `axf_goods` VALUES (360, '7702', 'http://img01.bqstatic.com/upload/goods/000/000/7702/0000007702.jpg@200w_200h_90Q', '', '三全凌宁波汤圆黑糯米黑芝麻400.0g', 0, '0', '400g', 9, 10, '103557', '103562', '速冻面点', '4858', 200, 12);
INSERT INTO `axf_goods` VALUES (361, '3247', 'http://img01.bqstatic.com/upload/goods/000/000/3247/0000003247_42060.jpg@200w_200h_90Q', '香飘飘,奶茶,咖啡味,饮料', '香飘飘奶茶咖啡味80g', 0, '0', '80g', 4, 4, '103557', '103563', '冲调饮品', '4858', 200, 12);
INSERT INTO `axf_goods` VALUES (362, '8140', 'http://img01.bqstatic.com/upload/goods/000/000/8140/0000008140.jpg@200w_200h_90Q', '', '欢乐家雪梨罐头700.0g', 0, '0', '700g', 15, 14, '103557', '103561', '罐头食品', '4858', 200, 11);
INSERT INTO `axf_goods` VALUES (363, '4909', 'http://img01.bqstatic.com/upload/goods/000/000/4909/0000004909.jpg@200w_200h_90Q', '', '康师傅干拌面酸菜牛肉100.0g', 0, '0', '100g', 6, 5.5, '103557', '103558', '方便面', '4858', 200, 9);
INSERT INTO `axf_goods` VALUES (364, '4921', 'http://img01.bqstatic.com/upload/goods/000/000/4921/0000004921_20810.jpg@200w_200h_90Q', '', '康师傅珍品香茹炖鸡面袋装96g', 0, '0', '96g', 3, 2.5, '103557', '103558', '方便面', '4858', 200, 9);
INSERT INTO `axf_goods` VALUES (365, '103782', 'http://img01.bqstatic.com/upload/goods/000/001/4321/0000014321_22010.jpg@200w_200h_90Q', '', '统一来一桶老坛酸菜原味牛肉桶面120g', 0, '0', '120g', 4.5, 4.3, '103557', '103558', '方便面', '4858', 200, 9);
INSERT INTO `axf_goods` VALUES (366, '98606', 'http://img01.bqstatic.com/upload/goods/000/009/8606/0000098606_68910.jpg@200w_200h_90Q', '阿宽,四川铺盖面,番茄酸汤味,方便面,闪送超市', '白家阿宽四川铺盖面番茄酸汤味105g', 0, '0', '105g', 6.5, 7, '103557', '103558', '方便面', '4858', 200, 9);
INSERT INTO `axf_goods` VALUES (367, '8137', 'http://img01.bqstatic.com/upload/goods/000/000/8137/0000008137.jpg@200w_200h_90Q', '', '欢乐家山楂罐头700.0g', 0, '0', '700g', 15, 14, '103557', '103561', '罐头食品', '4858', 200, 9);
INSERT INTO `axf_goods` VALUES (368, '4922', 'http://img01.bqstatic.com/upload/goods/000/000/4922/0000004922.jpg@200w_200h_90Q', '', '康师傅珍品香辣牛肉面袋装100g', 0, '0', '100g', 3, 2.5, '103557', '103558', '方便面', '4858', 200, 8);
INSERT INTO `axf_goods` VALUES (369, '4923', 'http://img01.bqstatic.com/upload/goods/000/000/4923/0000004923_45730.jpg@200w_200h_90Q', '', '康师傅珍品鲜虾袋装102g', 0, '0', '102g', 3, 2.5, '103557', '103558', '方便面', '4858', 200, 6);
INSERT INTO `axf_goods` VALUES (370, '99997', 'http://img01.bqstatic.com/upload/goods/000/001/2094/0000012094_01780.jpg@200w_200h_90Q', '四川铺盖面,牛肉火锅味,速食,便当,速食便当', '四川铺盖面牛肉火锅味110g/桶', 0, '0', '110g/桶', 6.5, 7, '103557', '103558', '方便面', '4858', 200, 6);
INSERT INTO `axf_goods` VALUES (371, '6088', 'http://img01.bqstatic.com/upload/goods/000/000/6088/0000006088.jpg@200w_200h_90Q', '', '欢乐家什锦水果罐头700.0g', 0, '0', '700g', 15, 14, '103557', '103561', '罐头食品', '4858', 200, 6);
INSERT INTO `axf_goods` VALUES (372, '9330', 'http://img01.bqstatic.com/upload/goods/000/000/9330/0000009330.jpg@200w_200h_90Q', '', '康师傅红烧牛肉面箱100.0g*24袋', 0, '0', '100g*24袋', 60, 54, '103557', '103558', '方便面', '4858', 200, 5);
INSERT INTO `axf_goods` VALUES (373, '101761', 'http://img01.bqstatic.com/upload/goods/201/603/0118/20160301181046_822629.jpg@200w_200h_90Q', '思念,黑芝麻,汤圆,宁波风味,面点', '思念黑芝麻汤圆宁波风味400g', 0, '0', '400g', 10, 12, '103557', '103562', '速冻面点', '4858', 200, 4);
INSERT INTO `axf_goods` VALUES (374, '104452', 'http://img01.bqstatic.com/upload/goods/201/603/2514/20160325143411_518799.jpg@200w_200h_90Q', '欢乐家,冰糖,雪梨,罐头,水果罐头', '欢乐家冰糖雪梨罐头256g', 0, '0', '256g', 6, 5, '103557', '103561', '罐头食品', '4858', 200, 4);
INSERT INTO `axf_goods` VALUES (375, '111482', 'http://img01.bqstatic.com/upload/goods/201/607/1518/20160715181010_312189.jpg@200w_200h_90Q', '维维,维他型,豆奶粉,豆奶', '维维维他型豆奶粉460g', 0, '0', '460g', 15, 13.5, '103557', '103563', '冲调饮品', '4858', 200, 4);
INSERT INTO `axf_goods` VALUES (376, '4904', 'http://img01.bqstatic.com/upload/goods/000/000/4904/0000004904.jpg@200w_200h_90Q', '', '康师傅葱烧排骨桶面桶装105.0g', 0, '0', '105g', 4.5, 4, '103557', '103558', '方便面', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (377, '9321', 'http://img01.bqstatic.com/upload/goods/000/000/9321/0000009321.jpg@200w_200h_90Q', '', '康师傅香辣牛肉面箱106.0g*24袋', 0, '0', '106g*24袋', 60, 55, '103557', '103558', '方便面', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (378, '8315', 'http://img01.bqstatic.com/upload/goods/000/000/8315/0000008315.jpg@200w_200h_90Q', '', '统一小浣熊摇摇乐意大利红烩味50.0g', 0, '0', '1袋', 1.3, 2, '103557', '103558', '方便面', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (379, '4026', 'http://img01.bqstatic.com/upload/goods/000/000/4026/0000004026.jpg@200w_200h_90Q', '湾仔码头,木耳,白菜,猪肉,食便当,面点', '湾仔码头木耳白菜猪肉水饺720.0g', 0, '0', '720g', 28, 36, '103557', '103562', '速冻面点', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (380, '117481', 'http://img01.bqstatic.com/upload/goods/201/611/2811/20161128113424_052957.jpg@200w_200h_90Q', '广乐,下饭菜', '广乐下饭菜160g', 0, '0', '160g', 4, 3.5, '103557', '103560', '下饭小菜', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (381, '4899', 'http://img01.bqstatic.com/upload/goods/000/000/4899/0000004899.jpg@200w_200h_90Q', '', '康师傅海鲜干拌面碗装100.0g', 0, '0', '100g', 6, 5.5, '103557', '103558', '方便面', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (382, '9327', 'http://img01.bqstatic.com/upload/goods/000/000/9327/0000009327.jpg@200w_200h_90Q', '', '康师傅老坛酸菜牛肉面箱132.0g*24袋', 0, '0', '132g*24袋', 60, 50, '103557', '103558', '方便面', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (383, '4024', 'http://img01.bqstatic.com/upload/goods/000/000/4024/0000004024.jpg@200w_200h_90Q', '湾仔码头,木耳,韭菜,猪肉,速食便当,面点', '湾仔码头木耳韭菜猪肉水饺720.0g', 0, '0', '720g', 28, 36, '103557', '103562', '速冻面点', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (384, '117483', 'http://img01.bqstatic.com/upload/goods/201/611/2811/20161128114514_293370.jpg@200w_200h_90Q', '广乐,红油,虹豆', '广乐红油虹豆160g', 0, '0', '160g', 4, 4.6, '103557', '103560', '下饭小菜', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (385, '3699', 'http://img01.bqstatic.com/upload/goods/000/000/3699/0000003699_19450.jpg@200w_200h_90Q', '老干妈,风味,豆豉', '陶华碧风味豆豉老干妈280g', 0, '0', '280g', 10, 8, '103569', '103572', '调味酱', '4858', 200, 120);
INSERT INTO `axf_goods` VALUES (386, '4534', 'http://img01.bqstatic.com/upload/goods/000/000/4534/0000004534.jpg@200w_200h_90Q', '老干妈,风味鸡油,辣椒,粮油副食,调味品', '老干妈风味鸡油辣椒280g', 0, '0', '280g', 10, 12, '103569', '103572', '调味酱', '4858', 200, 71);
INSERT INTO `axf_goods` VALUES (387, '4692', 'http://img01.bqstatic.com/upload/goods/000/000/4692/0000004692_06390.jpg@200w_200h_90Q', '王致和,大块,腐乳,粮油副食,调味品', '王致和大块腐乳340g', 0, '0', '340g', 7, 6, '103569', '103572', '调味酱', '4858', 200, 47);
INSERT INTO `axf_goods` VALUES (388, '3795', 'http://img01.bqstatic.com/upload/goods/000/000/3795/0000003795.jpg@200w_200h_90Q', '', '龙门米醋480ml', 0, '0', '480ml', 6, 6, '103569', '103571', '厨房调味', '4858', 200, 37);
INSERT INTO `axf_goods` VALUES (389, '3463', 'http://img01.bqstatic.com/upload/goods/000/000/3463/0000003463_35860.jpg@200w_200h_90Q', '海天,鲜味生抽,调味品', '海天鲜味生抽500ml', 0, '0', '500ml', 7.8, 6, '103569', '103571', '厨房调味', '4858', 200, 33);
INSERT INTO `axf_goods` VALUES (390, '3491', 'http://img01.bqstatic.com/upload/goods/000/000/3491/0000003491.jpg@200w_200h_90Q', '六必居,芝麻酱,调味品', '六必居芝麻酱300g', 0, '0', '300g', 9, 9, '103569', '103572', '调味酱', '4858', 200, 30);
INSERT INTO `axf_goods` VALUES (391, '3559', 'http://img01.bqstatic.com/upload/goods/000/000/3559/0000003559.jpg@200w_200h_90Q', '六月香,豆瓣酱,调味品', '六月香豆瓣酱300g', 0, '0', '300g', 6.5, 6, '103569', '103572', '调味酱', '4858', 200, 29);
INSERT INTO `axf_goods` VALUES (392, '4463', 'http://img01.bqstatic.com/upload/goods/000/000/4463/0000004463.jpg@200w_200h_90Q', '海天,上等蚝油,粮油副食,调味品', '海天上等蚝油700g', 0, '0', '700g', 8, 8, '103569', '103571', '厨房调味', '4858', 200, 20);
INSERT INTO `axf_goods` VALUES (393, '6939', 'http://img01.bqstatic.com/upload/goods/000/000/6939/0000006939.jpg@200w_200h_90Q', '', '金龙鱼大豆油精炼一级900.0ml', 0, '0', '900ml', 15, 11, '103569', '103570', '杂粮米面油', '4858', 200, 18);
INSERT INTO `axf_goods` VALUES (394, '3504', 'http://img01.bqstatic.com/upload/goods/000/000/3504/0000003504.jpg@200w_200h_90Q', '海底捞,火锅底料,麻辣味,调味品', '海底捞清油火锅底料220g', 0, '0', '220g', 12, 12, '103569', '103571', '厨房调味', '4858', 200, 18);
INSERT INTO `axf_goods` VALUES (395, '3549', 'http://img01.bqstatic.com/upload/goods/000/000/3549/0000003549.jpg@200w_200h_90Q', '王致和,特制料酒,调味品', '王致和特制料酒500.0ml', 0, '0', '500ml', 5, 4.8, '103569', '103571', '厨房调味', '4858', 200, 18);
INSERT INTO `axf_goods` VALUES (396, '13291', 'http://img01.bqstatic.com/upload/goods/201/607/2211/20160722110543_485958.jpg@200w_200h_90Q', '六必居,干黄酱', '六必居干黄酱250g', 0, '0', '250g', 5, 5, '103569', '103572', '调味酱', '4858', 200, 16);
INSERT INTO `axf_goods` VALUES (397, '3562', 'http://img01.bqstatic.com/upload/goods/000/000/3562/0000003562.jpg@200w_200h_90Q', '丘比,沙拉酱,香甜味,调味品', '丘比沙拉酱香甜味200.0g', 0, '0', '200g', 9.5, 9.5, '103569', '103572', '调味酱', '4858', 200, 15);
INSERT INTO `axf_goods` VALUES (398, '3489', 'http://img01.bqstatic.com/upload/goods/000/000/3489/0000003489.jpg@200w_200h_90Q', '王致和,大块腐乳,调味品', '王致和大块腐乳300.0g', 0, '0', '300g', 6.5, 6, '103569', '103572', '调味酱', '4858', 200, 10);
INSERT INTO `axf_goods` VALUES (399, '12515', 'http://img01.bqstatic.com/upload/goods/201/607/2210/20160722104746_435708.jpg@200w_200h_90Q', '六必居,甜面酱', '六必居甜面酱150g', 0, '0', '150g', 2.5, 2.5, '103569', '103572', '调味酱', '4858', 200, 8);
INSERT INTO `axf_goods` VALUES (400, '3464', 'http://img01.bqstatic.com/upload/goods/000/000/3464/0000003464_25980.jpg@200w_200h_90Q', '海天,酱油,老抽王,调味品', '海天老抽王酱油500ml', 0, '0', '500ml', 8, 6, '103569', '103571', '厨房调味', '4858', 200, 6);
INSERT INTO `axf_goods` VALUES (401, '4458', 'http://img01.bqstatic.com/upload/goods/000/000/4458/0000004458.jpg@200w_200h_90Q', '海天,酱油,金标,生抽,粮油副食,调味品', '海天金标生抽500ml', 0, '0', '500ml', 8, 8, '103569', '103571', '厨房调味', '4858', 200, 6);
INSERT INTO `axf_goods` VALUES (402, '4539', 'http://img01.bqstatic.com/upload/goods/000/000/4539/0000004539.jpg@200w_200h_90Q', '老干妈,肉丝豆豉油,辣椒,粮油副食,调味品', '老干妈肉丝豆豉油辣椒280.0g', 0, '0', '280g', 9, 10, '103569', '103572', '调味酱', '4858', 200, 6);
INSERT INTO `axf_goods` VALUES (403, '99919', 'http://img01.bqstatic.com/upload/goods/000/001/3447/0000013447_46960.jpg@200w_200h_90Q', '', '海天蒸鱼豉油450ml', 0, '0', '450ml', 10, 10, '103569', '103571', '厨房调味', '4858', 200, 4);
INSERT INTO `axf_goods` VALUES (404, '117974', 'http://img01.bqstatic.com/upload/goods/201/612/1215/20161212152331_362633.jpg@200w_200h_90Q', '安琪,高活性,酵母', '安琪高活性酵母13g', 0, '0', '13g', 1.2, 1, '103569', '103571', '厨房调味', '4858', 200, 4);
INSERT INTO `axf_goods` VALUES (405, '6935', 'http://img01.bqstatic.com/upload/goods/000/000/6935/0000006935.jpg@200w_200h_90Q', '', '金龙鱼大豆油精炼一级5.0L', 0, '0', '5L', 60, 42, '103569', '103570', '杂粮米面油', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (406, '3495', 'http://img01.bqstatic.com/upload/goods/000/000/3495/0000003495.jpg@200w_200h_90Q', '海底捞,火锅底料,三鲜味,调味品', '海底捞上汤三鲜火锅底料200g', 0, '0', '200g', 12, 11, '103569', '103571', '厨房调味', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (407, '10970', 'http://img01.bqstatic.com/upload/goods/000/001/0970/0000010970_58060.jpg@200w_200h_90Q', '', '海天上等蚝油260.0g', 0, '0', '260g', 5, 4.5, '103569', '103571', '厨房调味', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (408, '3487', 'http://img01.bqstatic.com/upload/goods/000/000/3487/0000003487_51930.jpg@200w_200h_90Q', '王致和,韭花酱,调味品', '王致和韭花酱320.0g', 0, '0', '320g', 6.5, 4, '103569', '103572', '调味酱', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (409, '24135', 'http://img01.bqstatic.com/upload/goods/201/604/2209/20160422095937_334212.jpg@200w_200h_90Q', '老干妈,香辣脆油辣椒,调味酱', '老干妈香辣脆油辣椒210g', 0, '0', '210g', 8, 8, '103569', '103572', '调味酱', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (410, '3493', 'http://img01.bqstatic.com/upload/goods/000/000/3493/0000003493.jpg@200w_200h_90Q', '海天,黄豆酱,调味品', '海天黄豆酱230.0g', 0, '0', '230g', 6, 5, '103569', '103572', '调味酱', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (411, '6928', 'http://img01.bqstatic.com/upload/goods/000/000/6928/0000006928.jpg@200w_200h_90Q', '', '金龙鱼花生浓香食用调和油1.8L', 0, '0', '1.8L', 30, 22, '103569', '103570', '杂粮米面油', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (412, '6908', 'http://img01.bqstatic.com/upload/goods/000/000/6908/0000006908.jpg@200w_200h_90Q', '金龙鱼,黄金比例,食用调和油,食用油', '金龙鱼黄金比例调和油5.0L', 0, '0', '5L', 65, 62, '103569', '103570', '杂粮米面油', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (413, '4462', 'http://img01.bqstatic.com/upload/goods/000/000/4462/0000004462.jpg@200w_200h_90Q', '海天,特级,草菇,老抽,粮油副食,调味品', '海天特级草菇老抽500.0ml', 0, '0', '500ml', 10, 10, '103569', '103571', '厨房调味', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (414, '115525', 'http://img01.bqstatic.com/upload/goods/201/609/3017/20160930170751_873105.jpg@200w_200h_90Q', '爱鲜蜂打火机', '爱鲜蜂打火机1个', 1, '0', '1个', 2, 2, '103575', '103580', '日常用品', '4858', 50, 100000095);
INSERT INTO `axf_goods` VALUES (415, '2551', 'http://img01.bqstatic.com/upload/goods/201/610/2511/20161025111749_441551.jpg@200w_200h_90Q', '南孚,5号,电池', '南孚5号电池1粒', 0, '0', '1粒', 2.5, 3, '103575', '103580', '日常用品', '4858', 200, 368);
INSERT INTO `axf_goods` VALUES (416, '2550', 'http://img01.bqstatic.com/upload/goods/201/610/2511/20161025111206_309923.jpg@200w_200h_90Q', '南孚,7号,电池', '南孚7号电池1粒', 0, '0', '1粒', 2.5, 3, '103575', '103580', '日常用品', '4858', 200, 205);
INSERT INTO `axf_goods` VALUES (417, '9630', 'http://img01.bqstatic.com/upload/goods/201/601/2117/20160121171058_517931.jpg@200w_200h_90Q', '维达超韧纸面巾3层150抽（小）', '维达超韧纸抽3包/提', 0, '0', '3包', 13.8, 13.8, '103575', '103578', '纸品', '4858', 200, 123);
INSERT INTO `axf_goods` VALUES (418, '119563', 'http://img01.bqstatic.com/upload/goods/000/001/5093/0000015093_11240.jpg@200w_200h_90Q', '维达天然洁肤卫生湿巾', '维达天然洁肤卫生湿巾10片', 0, '0', '10片', 4.2, 4.2, '103575', '103578', '纸品', '4858', 200, 64);
INSERT INTO `axf_goods` VALUES (419, '3871', 'http://img01.bqstatic.com/upload/goods/201/601/2616/20160126161959_260035.jpg@200w_200h_90Q', 'ABC,超极薄,棉柔,日用,卫生巾 ,生活用品', 'ABC超极薄棉柔日用卫生巾8片', 0, '0', '8片', 12, 12, '103575', '103576', '个人护理', '4858', 200, 62);
INSERT INTO `axf_goods` VALUES (420, '3719', 'http://img01.bqstatic.com/upload/goods/000/000/3719/0000003719.jpg@200w_200h_90Q', '', '苏菲熟睡290夜用棉柔5片', 0, '0', '5片', 8, 8, '103575', '103576', '个人护理', '4858', 200, 58);
INSERT INTO `axf_goods` VALUES (421, '3870', 'http://img01.bqstatic.com/upload/goods/000/000/3870/0000003870_43840.jpg@200w_200h_90Q', '苏菲,超熟睡,290,柔棉感,夜用,卫生巾,生活用品', '苏菲超熟睡290棉柔感5.0片', 0, '0', '5片', 9, 7, '103575', '103576', '个人护理', '4858', 200, 57);
INSERT INTO `axf_goods` VALUES (422, '3548', 'http://img01.bqstatic.com/upload/goods/000/000/3548/0000003548.jpg@200w_200h_90Q', 'ABC,日用,绵柔表层,卫生用品', 'ABC日用绵柔表层纤薄8片', 0, '0', '8片', 12, 9, '103575', '103576', '个人护理', '4858', 200, 53);
INSERT INTO `axf_goods` VALUES (423, '3550', 'http://img01.bqstatic.com/upload/goods/000/000/3550/0000003550.jpg@200w_200h_90Q', 'ABC,夜用,绵柔表层,卫生用品', 'ABC夜用绵柔表层纤薄8片', 0, '0', '8片', 12, 12, '103575', '103576', '个人护理', '4858', 200, 45);
INSERT INTO `axf_goods` VALUES (424, '3542', 'http://img01.bqstatic.com/upload/goods/000/000/3542/0000003542.jpg@200w_200h_90Q', '七度空间,丝柔表层,日用,卫生用品', '七度空间丝柔表层日用245mm5.0片', 0, '0', '5片', 6, 6, '103575', '103576', '个人护理', '4858', 200, 42);
INSERT INTO `axf_goods` VALUES (425, '94589', 'http://img01.bqstatic.com/upload/goods/000/009/4589/0000094589_60670.jpg@200w_200h_90Q', '七度空间少女纯棉夜用卫生巾', '七度空间少女纯棉卫生巾(夜)10片/包', 0, '0', '10片', 11, 10, '103575', '103576', '个人护理', '4858', 200, 42);
INSERT INTO `axf_goods` VALUES (426, '3552', 'http://img01.bqstatic.com/upload/goods/000/000/3552/0000003552.jpg@200w_200h_90Q', '苏菲,超熟睡,410,柔棉感,夜用,生活用品,卫生巾', '苏菲410立体柔棉超长卫生巾4片/包', 0, '0', '4片', 11, 11, '103575', '103576', '个人护理', '4858', 200, 40);
INSERT INTO `axf_goods` VALUES (427, '5997', 'http://img01.bqstatic.com/upload/goods/000/000/5997/0000005997_48260.jpg@200w_200h_90Q', '黑人,超白,牙膏,日化用品,闪送超市,', '黑人超白矿物盐牙膏90.0g', 0, '0', '90g', 11, 12, '103575', '103576', '个人护理', '4858', 200, 34);
INSERT INTO `axf_goods` VALUES (428, '9411', 'http://img01.bqstatic.com/upload/goods/000/000/9411/0000009411.jpg@200w_200h_90Q', '', '蓝月亮芦荟抑菌洗手液500.0g', 0, '0', '500g', 15, 14, '103575', '103576', '个人护理', '4858', 200, 25);
INSERT INTO `axf_goods` VALUES (429, '101274', 'http://img01.bqstatic.com/upload/goods/201/602/2415/20160224151239_997154.jpg@200w_200h_90Q', '蓝月亮,深层洁净,自然清香,洗衣液', '蓝月亮深层洁净自然清香洗衣液500g', 0, '0', '500g', 9, 9, '103575', '103577', '家居清洁', '4858', 200, 25);
INSERT INTO `axf_goods` VALUES (430, '2318', 'http://img01.bqstatic.com/upload/goods/000/000/2318/0000002318.jpg@200w_200h_90Q', 'ABC,夜用,超薄,卫生用品', 'ABC夜用棉柔超级薄8.0片', 0, '0', '8片', 12.5, 10, '103575', '103576', '个人护理', '4858', 200, 23);
INSERT INTO `axf_goods` VALUES (431, '3825', 'http://img01.bqstatic.com/upload/goods/000/000/3825/0000003825.jpg@200w_200h_90Q', '3M口罩9001V', '3M口罩9001V1.0个', 0, '0', '1个', 12, 10, '103575', '103580', '日常用品', '4858', 200, 23);
INSERT INTO `axf_goods` VALUES (432, '116391', 'http://img01.bqstatic.com/upload/goods/201/605/2610/20160526103026_568320.jpg@200w_200h_90Q', '维达超韧三层无芯卷纸', '维达超韧三层无芯卷纸12卷', 0, '0', '12卷', 28, 29, '103575', '103578', '纸品', '4858', 200, 20);
INSERT INTO `axf_goods` VALUES (433, '9439', 'http://img01.bqstatic.com/upload/goods/000/000/9439/0000009439.jpg@200w_200h_90Q', '', '蓝月亮亮白增艳洗衣液自然清香500.0g', 0, '0', '500g', 9.5, 8, '103575', '103577', '家居清洁', '4858', 200, 20);
INSERT INTO `axf_goods` VALUES (434, '4196', 'http://img01.bqstatic.com/upload/goods/000/000/4196/0000004196.jpg@200w_200h_90Q', '七度空间,丝柔,卫生巾,日用薄型,生活用品,卫生用品', '七度空间丝柔卫生巾(日用薄型)10.0片', 0, '0', '10片', 10, 10, '103575', '103576', '个人护理', '4858', 200, 19);
INSERT INTO `axf_goods` VALUES (435, '3546', 'http://img01.bqstatic.com/upload/goods/000/000/3546/0000003546.jpg@200w_200h_90Q', '七度空间,丝柔表层,夜用,卫生用品', '七度空间丝柔表层夜用275mm5.0片', 0, '0', '5片', 7, 7, '103575', '103576', '个人护理', '4858', 200, 18);
INSERT INTO `axf_goods` VALUES (436, '3471', 'http://img01.bqstatic.com/upload/goods/000/000/3471/0000003471.jpg@200w_200h_90Q', '舒肤佳,纯白,清香,香皂,生活用品', '舒肤佳纯白清香型香皂115g', 0, '0', '115g', 5, 5, '103575', '103576', '个人护理', '4858', 200, 18);
INSERT INTO `axf_goods` VALUES (437, '100069', 'http://img01.bqstatic.com/upload/goods/000/004/1034/0000041034_40820.jpg@200w_200h_90Q', '维达,倍韧,蓝色经典空芯,软抽,纸巾,卫生纸,日用品,生活用品', '维达蓝色经典空芯2卷*150g/包', 0, '0', '150g*2卷', 7, 7, '103575', '103578', '纸品', '4858', 200, 17);
INSERT INTO `axf_goods` VALUES (438, '3868', 'http://img01.bqstatic.com/upload/goods/000/000/3868/0000003868_38790.jpg@200w_200h_90Q', '', '苏菲超熟睡410柔棉感8.0片', 0, '0', '8片', 16.8, 15, '103575', '103576', '个人护理', '4858', 200, 16);
INSERT INTO `axf_goods` VALUES (439, '94801', 'http://img01.bqstatic.com/upload/goods/201/604/1817/20160418171550_034261.jpg@200w_200h_90Q', '心相印,花语系列,抽纸,生活用品', '心相印花语系列抽纸200抽*3包', 0, '0', '200抽*3包', 20, 20, '103575', '103578', '纸品', '4858', 200, 16);
INSERT INTO `axf_goods` VALUES (440, '3473', 'http://img01.bqstatic.com/upload/goods/000/000/3473/0000003473.jpg@200w_200h_90Q', '舒肤佳,柠檬,清新型,香皂,生活用品', '舒肤佳柠檬清新型香皂115.0g', 0, '0', '115g', 5, 5, '103575', '103576', '个人护理', '4858', 200, 15);
INSERT INTO `axf_goods` VALUES (441, '3869', 'http://img01.bqstatic.com/upload/goods/000/000/3869/0000003869.jpg@200w_200h_90Q', '', '苏菲超熟睡350棉柔感8.0片', 0, '0', '8片', 15.8, 15.8, '103575', '103576', '个人护理', '4858', 200, 14);
INSERT INTO `axf_goods` VALUES (442, '100071', 'http://img01.bqstatic.com/upload/goods/000/003/7329/0000037329_15080.jpg@200w_200h_90Q', '', '维达小花手帕纸12包/条', 0, '0', '12包/条', 7, 6, '103575', '103578', '纸品', '4858', 200, 14);
INSERT INTO `axf_goods` VALUES (443, '3810', 'http://img01.bqstatic.com/upload/goods/000/000/3810/0000003810.jpg@200w_200h_90Q', '', '碧浪清雅茉莉洗衣粉300.0g', 0, '0', '300g', 4, 4, '103575', '103577', '家居清洁', '4858', 200, 11);
INSERT INTO `axf_goods` VALUES (444, '4274', 'http://img01.bqstatic.com/upload/goods/000/000/4274/0000004274.jpg@200w_200h_90Q', '佳洁士,炫白双效,牙膏,生活用品,日化', '佳洁士炫白双效牙膏90g', 0, '0', '120g', 12.8, 9.5, '103575', '103576', '个人护理', '4858', 200, 10);
INSERT INTO `axf_goods` VALUES (445, '4013', 'http://img01.bqstatic.com/upload/goods/000/000/4013/0000004013.jpg@200w_200h_90Q', '舒肤佳,芦荟,香皂,生活用品,日用品', '舒肤佳芦荟香皂115.0g', 0, '0', '115g', 5, 5, '103575', '103576', '个人护理', '4858', 200, 10);
INSERT INTO `axf_goods` VALUES (446, '3981', 'http://img01.bqstatic.com/upload/goods/000/000/3981/0000003981.jpg@200w_200h_90Q', '海飞丝，洗发水，清爽去油,生活用品,日用品', '海飞丝洗发水清爽去油200.0ml', 0, '0', '200ml', 24, 23, '103575', '103576', '个人护理', '4858', 200, 10);
INSERT INTO `axf_goods` VALUES (447, '118880', 'http://img01.bqstatic.com/upload/goods/201/701/2013/20170120133520_570729.jpg@200w_200h_90Q', '高洁丝,经典系,夜安裤,M-L码', '高洁丝经典系夜安裤M-L码2条', 0, '0', '2条', 13, 13, '103575', '103576', '个人护理', '4858', 200, 9);
INSERT INTO `axf_goods` VALUES (448, '110056', 'http://img01.bqstatic.com/upload/goods/201/606/1416/20160614163349_746320.jpg@200w_200h_90Q', '洁能竹牙签', '洁能竹牙签500支', 0, '0', '500支', 3.8, 3.8, '103575', '103580', '日常用品', '4858', 200, 8);
INSERT INTO `axf_goods` VALUES (449, '5998', 'http://img01.bqstatic.com/upload/goods/201/610/1718/20161017180202_946190.jpg@200w_200h_90Q', '高露洁,固齿,清新,美白,牙膏,', '高露洁固齿清新美白牙膏90.0g', 0, '0', '90g', 5, 5, '103575', '103576', '个人护理', '4858', 200, 5);
INSERT INTO `axf_goods` VALUES (450, '8487', 'http://img01.bqstatic.com/upload/goods/000/000/8487/0000008487.jpg@200w_200h_90Q', '', '云南白药薄荷香型牙膏150g', 0, '0', '150g', 28.5, 30, '103575', '103576', '个人护理', '4858', 200, 4);
INSERT INTO `axf_goods` VALUES (451, '4201', 'http://img01.bqstatic.com/upload/goods/201/604/1817/20160418170743_853318.jpg@200w_200h_90Q', '七度空间,绢爽网面,夜用,超薄,生活用品,卫生用品', '七度空间绢爽网面夜用超薄10.0片', 0, '0', '10片', 11, 11, '103575', '103576', '个人护理', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (452, '4197', 'http://img01.bqstatic.com/upload/goods/000/000/4197/0000004197.jpg@200w_200h_90Q', '七度空间,网面,卫生巾,日用薄型,生活用品,卫生用品', '七度空间网面卫生巾(日用薄型)10.0片', 0, '0', '10片', 10, 10, '103575', '103576', '个人护理', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (453, '4014', 'http://img01.bqstatic.com/upload/goods/000/000/4014/0000004014.jpg@200w_200h_90Q', '舒肤佳,金银花,菊香,香皂,生活用品,日化', '舒肤佳金银花菊花香皂115.0g', 0, '0', '115g', 5, 5, '103575', '103576', '个人护理', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (454, '3975', 'http://img01.bqstatic.com/upload/goods/000/000/3975/0000003975.jpg@200w_200h_90Q', '', '海飞丝洗发露止痒呵护200.0ml', 0, '0', '200ml', 24, 23, '103575', '103576', '个人护理', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (455, '117059', 'http://img01.bqstatic.com/upload/goods/201/611/1614/20161116145450_645866.jpg@200w_200h_90Q', '南孚,丰蓝,1号,燃气灶,电池', '南孚丰蓝1号燃气灶电池2粒', 0, '0', '2粒', 12, 10, '103575', '103580', '日常用品', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (456, '109970', 'http://img01.bqstatic.com/upload/goods/201/606/1416/20160614162218_954728.jpg@200w_200h_90Q', '高露洁贝齿鲜果薄荷漱口水', '高露洁贝齿鲜果薄荷漱口水500ml', 0, '0', '500ml', 29.9, 29.9, '103575', '103576', '个人护理', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (457, '3976', 'http://img01.bqstatic.com/upload/goods/000/000/3976/0000003976.jpg@200w_200h_90Q', '', '海飞丝洗发露深层洁净200.0ml', 0, '0', '200ml', 24, 23, '103575', '103576', '个人护理', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (458, '9284', 'http://img01.bqstatic.com/upload/goods/000/000/9284/0000009284.jpg@200w_200h_90Q', '碧浪,专业去渍,清雅茉莉,洗衣粉', '碧浪专业去渍清雅茉莉洗衣粉1.7kg', 0, '0', '1.7kg', 21, 18, '103575', '103577', '家居清洁', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (459, '4333', 'http://img01.bqstatic.com/upload/goods/000/000/4333/0000004333.jpg@200w_200h_90Q', '苏菲,瞬吸干爽,纤巧,夜用,生活用品,卫生用品', '苏菲瞬吸干爽纤巧夜用10.0片', 0, '0', '10片', 13.5, 13.5, '103575', '103576', '个人护理', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (460, '4012', 'http://img01.bqstatic.com/upload/goods/000/000/4012/0000004012.jpg@200w_200h_90Q', '舒肤佳,维他命E,香皂,生活用品,日化', '舒肤佳维他命E香皂115.0g', 0, '0', '115g', 5, 5, '103575', '103576', '个人护理', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (461, '10615', 'http://img01.bqstatic.com/upload/goods/000/001/0615/0000010615.jpg@200w_200h_90Q', '', '舒肤佳薄荷冰怡舒爽型香皂115.0g', 0, '0', '115g', 5, 4.5, '103575', '103576', '个人护理', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (462, '3979', 'http://img01.bqstatic.com/upload/goods/000/000/3979/0000003979.jpg@200w_200h_90Q', '海飞丝,洗发露,怡神,冰凉,生活用品,日化', '海飞丝洗发露怡神冰凉200.0ml', 0, '0', '200ml', 24, 23, '103575', '103576', '个人护理', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (463, '3978', 'http://img01.bqstatic.com/upload/goods/000/000/3978/0000003978.jpg@200w_200h_90Q', '', '海飞丝洗发露防掉发200.0ml', 0, '0', '200ml', 24, 22, '103575', '103576', '个人护理', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (464, '103250', 'http://img01.bqstatic.com/upload/goods/201/603/2214/20160322142742_122134.jpg@200w_200h_90Q', '', '海氏海诺酒精医用消毒棉片50片/盒', 0, '0', '50片/盒', 8.5, 8.5, '103575', '103576', '个人护理', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (465, '41223', 'http://img01.bqstatic.com/upload/goods/201/604/1818/20160418184030_862197.jpg@200w_200h_90Q', '冷酸灵,抗敏牙膏,生活用品', '冷酸灵金银花清爽薄荷牙膏110g', 0, '0', '110g', 9, 7, '103575', '103576', '个人护理', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (466, '117057', 'http://img01.bqstatic.com/upload/goods/201/611/1614/20161116145311_875370.jpg@200w_200h_90Q', '南孚,丰蓝,1号,燃气灶,电池', '南孚丰蓝1号燃气灶电池1粒', 0, '0', '1粒', 6, 6, '103575', '103580', '日常用品', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (467, '10616', 'http://img01.bqstatic.com/upload/goods/000/001/0616/0000010616.jpg@200w_200h_90Q', '', '舒肤佳蜂蜜润护香皂115.0g', 0, '0', '115g', 5, 4.5, '103575', '103576', '个人护理', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (468, '3980', 'http://img01.bqstatic.com/upload/goods/000/000/3980/0000003980.jpg@200w_200h_90Q', '海飞丝,洗发露,水润,护理,生活用品,日化', '海飞丝洗发露水润护理200.0ml', 0, '0', '200ml', 24, 23, '103575', '103576', '个人护理', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (469, '3974', 'http://img01.bqstatic.com/upload/goods/000/000/3974/0000003974.jpg@200w_200h_90Q', '', '海飞丝洗发露黑亮强韧200.0ml', 0, '0', '200ml', 24, 23, '103575', '103576', '个人护理', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (470, '9302', 'http://img01.bqstatic.com/upload/goods/000/000/9302/0000009302.jpg@200w_200h_90Q', '', '六神冰莲香型驱蚊花露水195.0ml', 0, '0', '195ml', 13.5, 12, '103575', '103576', '个人护理', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (471, '101554', 'http://img01.bqstatic.com/upload/goods/201/602/2716/20160227161747_652283.jpg@200w_200h_90Q', '大宝,SOD蜜,生活用品,日用品', '大宝SOD蜜90ml', 0, '0', '90ml', 10, 10, '103575', '103576', '个人护理', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (472, '9202', 'http://img01.bqstatic.com/upload/goods/000/000/9202/0000009202.jpg@200w_200h_90Q', '', '奥妙净蓝全效百花凝萃洗衣粉1.1kg', 0, '0', '1.1kg', 16, 12, '103575', '103577', '家居清洁', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (473, '94611', 'http://img01.bqstatic.com/upload/goods/000/009/4611/0000094611_99870.jpg@200w_200h_90Q', '飘香,鸭锁骨,卤味,哈哈镜,鸭锁骨,容先生', '飘香鸭锁骨(微辣)220g', 1, '0', '220g', 16, 20, '103581', '103582', '卤味熟食', '4858', 50, 100000915);
INSERT INTO `axf_goods` VALUES (474, '97190', 'http://img01.bqstatic.com/upload/goods/000/009/7190/0000097190_52090.jpg@200w_200h_90Q', '飘香鸭翅微辣', '飘香鸭翅微辣168g', 1, '0', '168g', 15, 26, '103581', '103582', '卤味熟食', '4858', 50, 100000565);
INSERT INTO `axf_goods` VALUES (475, '97189', 'http://img01.bqstatic.com/upload/goods/000/009/7189/0000097189_29190.jpg@200w_200h_90Q', '飘香鸭脖微辣', '飘香鸭脖微辣168g', 1, '0', '168g', 15, 18, '103581', '103582', '卤味熟食', '4858', 50, 100000579);
INSERT INTO `axf_goods` VALUES (476, '94613', 'http://img01.bqstatic.com/upload/goods/000/009/4613/0000094613_74910.jpg@200w_200h_90Q', '飘香,鸡翅尖,卤味,翅尖,哈哈镜,鸭锁骨,容先生', '飘香鸡翅尖(熏卤原味)160g', 1, '0', '160g', 12, 18, '103581', '103582', '卤味熟食', '4858', 50, 100000334);
INSERT INTO `axf_goods` VALUES (477, '94612', 'http://img01.bqstatic.com/upload/goods/000/009/4612/0000094612_91200.jpg@200w_200h_90Q', '飘香,心肝,卤味,鸡心肝,哈哈镜,鸭锁骨,容先生', '飘香鸡心肝(熏卤原味)170g', 1, '0', '170g', 12, 18, '103581', '103582', '卤味熟食', '4858', 50, 100000333);
INSERT INTO `axf_goods` VALUES (478, '104245', 'http://img01.bqstatic.com/upload/goods/201/603/2309/20160323095454_766037.jpg@200w_200h_90Q', '飘香卤鸭板肠(微辣)', '飘香卤鸭板肠(微辣)140g', 1, '0', '140g', 12, 24, '103581', '103582', '卤味熟食', '4858', 50, 100000832);
INSERT INTO `axf_goods` VALUES (479, '109196', 'http://img01.bqstatic.com/upload/goods/201/605/2409/20160524095244_729759.jpg@200w_200h_90Q', '飘香卤鱼豆腐(微辣)', '飘香卤鱼豆腐(微辣)138g/盒', 1, '0', '138g/盒', 10, 18, '103581', '103582', '卤味熟食', '4858', 50, 100000531);
INSERT INTO `axf_goods` VALUES (480, '115886', 'http://img01.bqstatic.com/upload/goods/201/610/1310/20161013101524_951590.jpg@200w_200h_90Q', '飘香熏鹌鹑蛋', '飘香熏鹌鹑蛋155g/盒', 1, '0', '155g/盒', 12, 12, '103581', '103582', '卤味熟食', '4858', 50, 100000411);
INSERT INTO `axf_goods` VALUES (481, '112352', 'http://img01.bqstatic.com/upload/goods/201/607/2217/20160722171730_421643.jpg@200w_200h_90Q', '飘香卤鸭脆微辣', '飘香卤鸭肠微辣108g/盒', 1, '0', '108g/盒', 18, 30, '103581', '103582', '卤味熟食', '4858', 50, 100000406);
INSERT INTO `axf_goods` VALUES (482, '101658', 'http://img01.bqstatic.com/upload/goods/201/603/0115/20160301151130_430076.jpg@200w_200h_90Q', '飘香卤水冒莲藕(微辣)', '飘香卤水冒莲藕(微辣)140g', 1, '0', '140g', 10, 16, '103581', '103582', '卤味熟食', '4858', 50, 100000378);
INSERT INTO `axf_goods` VALUES (483, '104246', 'http://img01.bqstatic.com/upload/goods/201/606/1416/20160614164502_667013.jpg@200w_200h_90Q', '飘香卤鸡脆肚(微辣)', '飘香卤鸡脆肚(微辣)140g', 1, '0', '140g', 14, 20, '103581', '103582', '卤味熟食', '4858', 50, 100000312);
INSERT INTO `axf_goods` VALUES (484, '99761', 'http://img01.bqstatic.com/upload/goods/201/601/1810/20160118101522_346128.jpg@200w_200h_90Q', '哈肉联精制红肠', '哈肉联精制红肠125g', 1, '0', '125g', 12.8, 18, '103581', '103582', '卤味熟食', '4858', 50, 100000250);
INSERT INTO `axf_goods` VALUES (485, '99762', 'http://img01.bqstatic.com/upload/goods/201/601/1810/20160118101214_743907.jpg@200w_200h_90Q', '哈肉联精红肠', '哈肉联精红肠85g', 1, '0', '85g', 8.9, 12, '103581', '103582', '卤味熟食', '4858', 50, 100000187);
INSERT INTO `axf_goods` VALUES (486, '99765', 'http://img01.bqstatic.com/upload/goods/201/601/1810/20160118101653_705563.jpg@200w_200h_90Q', '哈肉联蜜汁肉枣', '哈肉联蜜汁肉枣200g', 1, '0', '200g', 14.8, 21, '103581', '103582', '卤味熟食', '4858', 50, 100000146);
INSERT INTO `axf_goods` VALUES (487, '119691', 'http://img01.bqstatic.com/upload/goods/201/703/1514/20170315145408_082657.jpg@200w_200h_90Q', '', '辉山十天风味酸乳', 1, '1', '185g', 8.9, 8.9, '104747', '104748', '新品尝鲜', '4858', 50, 100000000);
INSERT INTO `axf_goods` VALUES (488, '119692', 'http://img01.bqstatic.com/upload/goods/201/703/1617/20170316174537_358131.jpg@200w_200h_90Q', '', '辉山十天风味酸乳氧气森林（草莓+蔓越莓）', 1, '1', '210g', 9.9, 9.9, '104747', '104748', '新品尝鲜', '4858', 50, 100000000);
INSERT INTO `axf_goods` VALUES (489, '119730', 'http://img01.bqstatic.com/upload/goods/201/703/1617/20170316171449_847041.jpg@200w_200h_90Q', '', '爱鲜蜂·东方蜜瓜', 1, '0', '600-800g/粒g/粒', 17.8, 19.9, '104747', '104748', '新品尝鲜', '4858', 50, 100000000);
INSERT INTO `axf_goods` VALUES (490, '119731', 'http://img01.bqstatic.com/upload/goods/201/703/1617/20170316171624_642937.jpg@200w_200h_90Q', '', '爱鲜蜂·四川安岳柠檬', 1, '0', '180-220g2粒/袋', 5.9, 6.8, '104747', '104748', '新品尝鲜', '4858', 50, 100000000);
INSERT INTO `axf_goods` VALUES (491, '119727', 'http://img01.bqstatic.com/upload/goods/201/703/1617/20170316170833_267676.jpg@200w_200h_90Q', '', '爱鲜蜂·水果黄瓜', 1, '0', '400-500g/盒', 9.9, 11.8, '104747', '104748', '新品尝鲜', '4858', 50, 100000000);
INSERT INTO `axf_goods` VALUES (492, '119605', 'http://img01.bqstatic.com/upload/goods/201/703/0918/20170309185525_528068.jpg@200w_200h_90Q', '', '爱鲜蜂·泰国椰青800g以上/个', 1, '0', '800g以上/个', 19.9, 21.8, '104747', '104748', '新品尝鲜', '4858', 50, 100000000);
INSERT INTO `axf_goods` VALUES (493, '119728', 'http://img01.bqstatic.com/upload/goods/201/703/1617/20170316171200_503821.jpg@200w_200h_90Q', '', '爱鲜蜂·黄油桃260-330g/盒', 1, '0', '260-330g/盒', 10.9, 12.8, '104747', '104748', '新品尝鲜', '4858', 50, 100000000);
INSERT INTO `axf_goods` VALUES (494, '119793', 'http://img01.bqstatic.com/upload/goods/201/703/2017/20170320173852_318713.jpg@200w_200h_90Q', '', '格桑泉天然饮用水', 1, '1', '550ml', 3, 3, '104747', '104748', '新品尝鲜', '4858', 50, 100000000);
INSERT INTO `axf_goods` VALUES (495, '119570', 'http://img01.bqstatic.com/upload/goods/201/703/1318/20170313185620_821516.jpg@200w_200h_90Q', '麻辣味鲅鱼', '麻辣味鲅鱼32g', 1, '1', '32g', 1, 1, '104749', '103543', '膨化食品', '4858', 50, 100003541);
INSERT INTO `axf_goods` VALUES (496, '109108', 'http://img01.bqstatic.com/upload/goods/201/605/3109/20160531095221_551975.jpg@200w_200h_90Q', '三元轻能黄桃+大麦优酪乳', '三元轻能黄桃+大麦优酪乳250g', 1, '1', '250g', 8.9, 15, '104749', '103537', '酸奶乳酸菌', '4858', 50, 100003903);
INSERT INTO `axf_goods` VALUES (497, '113619', 'http://img01.bqstatic.com/upload/goods/201/608/2618/20160826185419_023449.jpg@200w_200h_90Q', '骑士1992酸牛奶', '骑士1992酸牛奶180g', 1, '1', '180g', 6.8, 9.9, '104749', '103537', '酸奶乳酸菌', '4858', 50, 100002542);
INSERT INTO `axf_goods` VALUES (498, '5590', 'http://img01.bqstatic.com/upload/goods/000/000/5590/0000005590.jpg@200w_200h_90Q', '中街,糯米糍,冰淇淋,中街冰点', '中街糯米糍1个', 0, '0', '1个', 0.7, 0.5, '104958', '104959', '冰激凌', '4858', 200, 1050);
INSERT INTO `axf_goods` VALUES (499, '10775', 'http://img01.bqstatic.com/upload/goods/000/001/0775/0000010775.jpg@200w_200h_90Q', '', '中街冰点老中街冰棍1支', 0, '0', '1支', 1, 1, '104958', '104959', '冰激凌', '4858', 200, 913);
INSERT INTO `axf_goods` VALUES (500, '2320', 'http://img01.bqstatic.com/upload/goods/201/605/1911/20160519111000_910578.jpg@200w_200h_90Q', '可爱多,巧克力味,冰淇淋', '可爱多巧克力味1支', 0, '0', '1支', 5, 5, '104958', '104959', '冰激凌', '4858', 200, 545);
INSERT INTO `axf_goods` VALUES (501, '2381', 'http://img01.bqstatic.com/upload/goods/000/000/2381/0000002381.jpg@200w_200h_90Q', '雀巢,牛奶棒,牛奶味,冰淇淋', '雀巢牛奶棒原味1支', 0, '0', '1支', 4, 4, '104958', '104959', '冰激凌', '4858', 200, 337);
INSERT INTO `axf_goods` VALUES (502, '107806', 'http://img01.bqstatic.com/upload/goods/201/605/1318/20160513180914_331658.jpg@200w_200h_90Q', '伊利巧乐兹经典巧脆棒雪糕', '伊利巧乐兹经典巧脆棒雪糕80g/支', 0, '0', '80g/支', 3, 4, '104958', '104959', '冰激凌', '4858', 200, 327);
INSERT INTO `axf_goods` VALUES (503, '2332', 'http://img01.bqstatic.com/upload/goods/000/000/2332/0000002332.jpg@200w_200h_90Q', '八喜,朗姆味,纸杯,冰淇淋', '八喜朗姆味（纸杯）90g', 0, '0', '90g', 8, 8, '104958', '104959', '冰激凌', '4858', 200, 311);
INSERT INTO `axf_goods` VALUES (504, '11948', 'http://img01.bqstatic.com/upload/goods/000/001/1948/0000011948_55310.jpg@200w_200h_90Q', '', '八喜香草味（纸杯）90g', 0, '0', '90g', 8, 8, '104958', '104959', '冰激凌', '4858', 200, 300);
INSERT INTO `axf_goods` VALUES (505, '2328', 'http://img01.bqstatic.com/upload/goods/000/000/2328/0000002328.jpg@200w_200h_90Q', '梦龙,松露巧克力口味,冰淇淋', '梦龙松露巧克力口味冰淇淋65g', 0, '0', '65g', 8, 8, '104958', '104959', '冰激凌', '4858', 200, 274);
INSERT INTO `axf_goods` VALUES (506, '13583', 'http://img01.bqstatic.com/upload/goods/201/601/1516/20160115165251_959356.jpg@200w_200h_90Q', '可爱多,非常草莓味,冰淇淋', '可爱多非常草莓味1支', 0, '0', '67g', 5, 5, '104958', '104959', '冰激凌', '4858', 200, 273);
INSERT INTO `axf_goods` VALUES (507, '107807', 'http://img01.bqstatic.com/upload/goods/201/605/1318/20160513181210_059651.jpg@200w_200h_90Q', '伊利巧乐兹蛋奶巧克力雪糕', '伊利巧乐兹蛋奶巧克力雪糕75g/支', 0, '0', '75g/支', 3, 2, '104958', '104959', '冰激凌', '4858', 200, 245);
INSERT INTO `axf_goods` VALUES (508, '2333', 'http://img01.bqstatic.com/upload/goods/000/000/2333/0000002333.jpg@200w_200h_90Q', '八喜,绿茶味,纸杯,冰淇淋', '八喜绿茶味（纸杯）90g', 0, '0', '90g', 8, 8, '104958', '104959', '冰激凌', '4858', 200, 228);
INSERT INTO `axf_goods` VALUES (509, '13582', 'http://img01.bqstatic.com/upload/goods/201/601/1516/20160115165735_248375.jpg@200w_200h_90Q', '可爱多,非常,香草味,甜筒,冰淇淋', '可爱多非常香草味1支', 0, '0', '67g', 5, 5, '104958', '104959', '冰激凌', '4858', 200, 225);
INSERT INTO `axf_goods` VALUES (510, '11957', 'http://img01.bqstatic.com/upload/goods/201/601/1516/20160115165903_240445.jpg@200w_200h_90Q', '梦龙,香草,冰淇淋,雪糕', '梦龙香草口味冰淇淋64g', 0, '0', '64g', 8, 8, '104958', '104959', '冰激凌', '4858', 200, 172);
INSERT INTO `axf_goods` VALUES (511, '2326', 'http://img01.bqstatic.com/upload/goods/000/000/2326/0000002326.jpg@200w_200h_90Q', '梦龙,卡布基诺口味,冰淇淋', '梦龙卡布基诺口味冰淇淋64g', 0, '0', '64g', 8, 8, '104958', '104959', '冰激凌', '4858', 200, 157);
INSERT INTO `axf_goods` VALUES (512, '2331', 'http://img01.bqstatic.com/upload/goods/000/000/2331/0000002331.jpg@200w_200h_90Q', '八喜,草莓味,纸杯,冰淇淋', '八喜草莓味（纸杯）90g', 0, '0', '90g', 8, 8, '104958', '104959', '冰激凌', '4858', 200, 123);
INSERT INTO `axf_goods` VALUES (513, '5586', 'http://img01.bqstatic.com/upload/goods/000/000/5586/0000005586.jpg@200w_200h_90Q', '', '德华原味奶1支', 0, '0', '1支', 2, 2, '104958', '104959', '冰激凌', '4858', 200, 123);
INSERT INTO `axf_goods` VALUES (514, '11960', 'http://img01.bqstatic.com/upload/goods/201/601/1516/20160115164731_058968.jpg@200w_200h_90Q', '和路雪,千层雪,香草味,冰淇淋,雪糕', '和路雪千层雪香草味62g', 0, '0', '62g', 5, 5, '104958', '104959', '冰激凌', '4858', 200, 120);
INSERT INTO `axf_goods` VALUES (515, '6504', 'http://img01.bqstatic.com/upload/goods/000/000/6504/0000006504.jpg@200w_200h_90Q', '梦龙,白巧克力,坚果,冰淇淋', '梦龙白巧克力坚果味65g', 0, '0', '65g', 8, 8, '104958', '104959', '冰激凌', '4858', 200, 120);
INSERT INTO `axf_goods` VALUES (516, '5583', 'http://img01.bqstatic.com/upload/goods/000/000/5583/0000005583.jpg@200w_200h_90Q', '宏宝莱,沙皇枣,枣,休闲零食,果脯蜜饯,闪送超市,', '宏宝莱沙皇枣1支', 0, '0', '1支', 1.5, 1.5, '104958', '104959', '冰激凌', '4858', 200, 118);
INSERT INTO `axf_goods` VALUES (517, '4266', 'http://img01.bqstatic.com/upload/goods/201/605/1911/20160519110940_584464.jpg@200w_200h_90Q', '和路雪,麦酷狮,奶昔杯,香草口味雪糕,冰激凌', '和路雪奶昔杯香草口味90g', 0, '0', '90g', 4.5, 4, '104958', '104959', '冰激凌', '4858', 200, 102);
INSERT INTO `axf_goods` VALUES (518, '13584', 'http://img01.bqstatic.com/upload/goods/201/602/2217/20160222174913_264680.jpg@200w_200h_90Q', '可爱多,芒果酸奶味,冰激凌', '和路雪可爱多芒果酸奶口味冰淇淋62g', 0, '0', '62g', 5, 4.5, '104958', '104959', '冰激凌', '4858', 200, 90);
INSERT INTO `axf_goods` VALUES (519, '4804', 'http://img01.bqstatic.com/upload/goods/000/000/4804/0000004804.jpg@200w_200h_90Q', '', '和路雪奇彩旋1支', 0, '0', '1支', 2.5, 2.5, '104958', '104959', '冰激凌', '4858', 200, 81);
INSERT INTO `axf_goods` VALUES (520, '2335', 'http://img01.bqstatic.com/upload/goods/000/000/2335/0000002335.jpg@200w_200h_90Q', '八喜,芒果味,纸杯,冰淇淋', '八喜芒果味（纸杯）90g', 0, '0', '90g', 8, 8, '104958', '104959', '冰激凌', '4858', 200, 61);
INSERT INTO `axf_goods` VALUES (521, '103392', 'http://img01.bqstatic.com/upload/goods/201/601/1516/20160115165903_240445.jpg@200w_200h_90Q', '和路雪梦龙香草口味冰淇淋', '和路雪梦龙香草口味冰淇淋64g', 0, '0', '64g', 8, 8, '104958', '104959', '冰激凌', '4858', 200, 61);
INSERT INTO `axf_goods` VALUES (522, '2336', 'http://img01.bqstatic.com/upload/goods/000/000/2336/0000002336.jpg@200w_200h_90Q', '八喜,摩卡,杏仁味,纸杯,冰淇淋', '八喜摩卡杏仁味（纸杯）90g', 0, '0', '90g', 8, 8, '104958', '104959', '冰激凌', '4858', 200, 36);
INSERT INTO `axf_goods` VALUES (523, '2321', 'http://img01.bqstatic.com/upload/goods/000/000/2321/0000002321.jpg@200w_200h_90Q', '可爱多,蓝莓味,冰淇淋', '可爱多蓝莓味1支', 0, '0', '1支', 5, 5, '104958', '104959', '冰激凌', '4858', 200, 27);
INSERT INTO `axf_goods` VALUES (524, '6547', 'http://img01.bqstatic.com/upload/goods/000/000/6547/0000006547.jpg@200w_200h_90Q', '和路雪,迷你,千层雪,香草,冰淇淋', '和路雪迷你千层雪香草味80g', 0, '0', '80g', 6, 4.5, '104958', '104959', '冰激凌', '4858', 200, 24);
INSERT INTO `axf_goods` VALUES (525, '8925', 'http://img01.bqstatic.com/upload/goods/000/000/8925/0000008925.jpg@200w_200h_90Q', '', '蒙牛蒂兰圣雪无蔗糖牛奶冰淇淋1.0支', 0, '0', '1支', 6, 5, '104958', '104959', '冰激凌', '4858', 200, 20);
INSERT INTO `axf_goods` VALUES (526, '8256', 'http://img01.bqstatic.com/upload/goods/000/000/8256/0000008256.jpg@200w_200h_90Q', '', '巧乐兹雪糕经典香奶棒1.0支', 0, '0', '1支', 3, 3, '104958', '104959', '冰激凌', '4858', 200, 9);
INSERT INTO `axf_goods` VALUES (527, '6528', 'http://img01.bqstatic.com/upload/goods/000/000/6528/0000006528.jpg@200w_200h_90Q', '', '可爱多黑白巧克力味1.0支', 0, '0', '1支', 5, 4.5, '104958', '104959', '冰激凌', '4858', 200, 5);
INSERT INTO `axf_goods` VALUES (528, '8912', 'http://img01.bqstatic.com/upload/goods/000/000/8912/0000008912.jpg@200w_200h_90Q', '', '蒙牛随变随芯脆雪糕1.0支', 0, '0', '1支', 3, 2, '104958', '104959', '冰激凌', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (529, '6495', 'http://img01.bqstatic.com/upload/goods/000/000/6495/0000006495.jpg@200w_200h_90Q', '和路雪,奇彩旋,草莓,水蜜桃,冰淇淋', '和路雪奇彩旋草莓水蜜桃味1.0支', 0, '0', '1支', 2.5, 2.5, '104958', '104959', '冰激凌', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (530, '6500', 'http://img01.bqstatic.com/upload/goods/000/000/6500/0000006500.jpg@200w_200h_90Q', '和路雪,奇彩旋,菠萝,青苹果,冰淇淋', '和路雪奇彩旋菠萝青苹果味1.0支', 0, '0', '1支', 2.5, 2.5, '104958', '104959', '冰激凌', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (531, '118826', 'http://img01.bqstatic.com/upload/goods/201/701/1916/20170119164119_550363.jpg@200w_200h_90Q', '爱鲜蜂·海南千禧果', '爱鲜蜂·海南千禧果400-450g/盒', 1, '0', '400-450g/盒', 9.9, 13.8, '103532', '103533', '国产水果', '4858', 50, 100002467);
INSERT INTO `axf_goods` VALUES (532, '119080', 'http://img01.bqstatic.com/upload/goods/201/702/1617/20170216172658_800441.jpg@200w_200h_90Q', '爱鲜蜂·金太阳圣女果', '爱鲜蜂·金太阳圣女果400-450g/盒', 1, '0', '400-450g/盒', 9.9, 13.8, '103532', '103533', '国产水果', '4858', 50, 100001169);
INSERT INTO `axf_goods` VALUES (533, '119404', 'http://img01.bqstatic.com/upload/goods/201/703/0218/20170302182510_737957.jpg@200w_200h_90Q', '爱鲜蜂·不知火丑柑', '爱鲜蜂·不知火丑柑400-500g 2粒/盒', 1, '0', '400-500g 2粒/盒', 13.8, 13.8, '103532', '103533', '国产水果', '4858', 50, 100002996);
INSERT INTO `axf_goods` VALUES (534, '96599', 'http://img01.bqstatic.com/upload/goods/201/601/1210/20160112102806_216252.jpg@200w_200h_90Q', '蜂觅·新疆库尔勒香梨', '蜂觅·新疆库尔勒香梨300-360g 3粒/盒', 1, '1', '300-360g 3粒/盒', 14.8, 18, '103532', '103533', '国产水果', '4858', 50, 100002849);
INSERT INTO `axf_goods` VALUES (535, '119082', 'http://img01.bqstatic.com/upload/goods/201/702/1617/20170216172921_193193.jpg@200w_200h_90Q', '爱鲜蜂·进口超甜香蕉', '爱鲜蜂·进口超甜香蕉500-550g/袋', 1, '0', '500-550g/袋', 7.99, 15.8, '103532', '103534', '进口水果', '4858', 50, 100002139);
INSERT INTO `axf_goods` VALUES (536, '118963', 'http://img01.bqstatic.com/upload/goods/201/702/0815/20170208150222_184681.jpg@200w_200h_90Q', '爱鲜蜂·小台农芒果', '爱鲜蜂·小台农芒果350-450g/盒', 1, '0', '350-450g/盒', 10.9, 14.9, '103532', '103533', '国产水果', '4858', 50, 100001519);
INSERT INTO `axf_goods` VALUES (537, '116950', 'http://img01.bqstatic.com/upload/goods/201/611/1617/20161116173544_219028.jpg@200w_200h_90Q', '蜂觅·越南直采红心火龙果', '蜂觅·越南直采红心火龙果350-450g/盒', 1, '0', '350-450g/盒', 15.3, 15.8, '103532', '103534', '进口水果', '4858', 50, 100001475);
INSERT INTO `axf_goods` VALUES (538, '102028', 'http://img01.bqstatic.com/upload/goods/201/603/1109/20160311092214_940185.jpg@200w_200h_90Q', '爱鲜蜂·百香果', '爱鲜蜂·百香果120g 2粒/袋', 1, '1', '140g 2粒/袋', 11.8, 19, '103532', '103533', '国产水果', '4858', 50, 100001417);
INSERT INTO `axf_goods` VALUES (539, '107465', 'http://img01.bqstatic.com/upload/goods/201/607/1817/20160718171055_871587.jpg@200w_200h_90Q', '爱鲜蜂·高原红富士', '爱鲜蜂·高原红富士420-520g 2粒/盒', 1, '1', '420-520g 2粒/盒', 17.9, 17.9, '103532', '103533', '国产水果', '4858', 50, 100001312);
INSERT INTO `axf_goods` VALUES (540, '91669', 'http://img01.bqstatic.com/upload/goods/201/609/0618/20160906184434_648929.jpg@200w_200h_90Q', '爱鲜蜂·黄元帅苹果', '爱鲜蜂·黄元帅苹果350-450g 2粒/盒', 1, '1', '350-450g 2粒/盒', 11.9, 15, '103532', '103533', '国产水果', '4858', 50, 100001223);
INSERT INTO `axf_goods` VALUES (541, '94470', 'http://img01.bqstatic.com/upload/goods/201/607/1817/20160718171121_113340.jpg@200w_200h_90Q', '蜂觅·精品富士', '蜂觅·精品富士380-480g 2粒/盒', 1, '1', '380-480g 2粒/盒', 17.6, 28, '103532', '103533', '国产水果', '4858', 50, 100001104);
INSERT INTO `axf_goods` VALUES (542, '119408', 'http://img01.bqstatic.com/upload/goods/201/703/0218/20170302182636_950048.jpg@200w_200h_90Q', '爱鲜蜂·甜沃柑', '爱鲜蜂·甜沃柑430-530g/盒', 1, '0', '430-530g/盒', 19.8, 19.8, '103532', '103533', '国产水果', '4858', 50, 100000725);
INSERT INTO `axf_goods` VALUES (543, '111802', 'http://img01.bqstatic.com/upload/goods/201/607/1517/20160715173505_187514.jpg@200w_200h_90Q', '爱鲜蜂·泰国龙眼', '爱鲜蜂·泰国龙眼400g/盒', 1, '0', '400g/盒', 14.9, 21, '103532', '103534', '进口水果', '4858', 50, 100000689);
INSERT INTO `axf_goods` VALUES (544, '119676', 'http://img01.bqstatic.com/upload/goods/201/703/1616/20170316164656_755738.jpg@200w_200h_90Q', '爱鲜蜂·水果黄瓜', '爱鲜蜂·水果黄瓜400-500g/盒', 1, '0', '400-500g/盒', 9.9, 11.8, '103532', '103533', '国产水果', '4858', 50, 100000651);
INSERT INTO `axf_goods` VALUES (545, '119678', 'http://img01.bqstatic.com/upload/goods/201/703/1616/20170316164756_899607.jpg@200w_200h_90Q', '爱鲜蜂·黄油桃，水果', '爱鲜蜂·黄油桃260-330g/盒', 1, '0', '260-330g/盒', 10.9, 12.8, '103532', '103533', '国产水果', '4858', 50, 100000634);
INSERT INTO `axf_goods` VALUES (546, '119411', 'http://img01.bqstatic.com/upload/goods/201/703/0218/20170302182717_283096.jpg@200w_200h_90Q', '爱鲜蜂·皇冠梨', '爱鲜蜂·皇冠梨530-630g 2粒/盒', 1, '0', '530-630g 2粒/盒', 9.9, 11.9, '103532', '103533', '国产水果', '4858', 50, 100000526);
INSERT INTO `axf_goods` VALUES (547, '119684', 'http://img01.bqstatic.com/upload/goods/201/703/1616/20170316164958_369428.jpg@200w_200h_90Q', '爱鲜蜂·四川安岳柠檬，水果', '爱鲜蜂·四川安岳柠檬180-220g 2粒/袋', 1, '0', '180-220g2粒/袋', 5.9, 6.8, '103532', '103533', '国产水果', '4858', 50, 100000419);
INSERT INTO `axf_goods` VALUES (548, '119405', 'http://img01.bqstatic.com/upload/goods/201/703/0218/20170302182550_215300.jpg@200w_200h_90Q', '爱鲜蜂·徐香猕猴桃', '爱鲜蜂·徐香猕猴桃280-360g 3粒/盒', 1, '0', '280-360g 3粒/盒', 13.2, 13.2, '103532', '103533', '国产水果', '4858', 50, 100000318);
INSERT INTO `axf_goods` VALUES (549, '119403', 'http://img01.bqstatic.com/upload/goods/201/703/0218/20170302182359_933145.jpg@200w_200h_90Q', '爱鲜蜂·黑美人西瓜', '爱鲜蜂·黑美人西瓜2.5-3.5kg/粒', 1, '0', '2.5-3.5kg/粒', 33.8, 33.8, '103532', '103534', '进口水果', '4858', 50, 100000314);
INSERT INTO `axf_goods` VALUES (550, '118824', 'http://img01.bqstatic.com/upload/goods/201/701/1916/20170119164159_996462.jpg@200w_200h_90Q', '爱鲜蜂·特小凤西瓜', '爱鲜蜂·特小凤西瓜1.5-2.5kg/粒', 1, '0', '1.5-2.5kg/粒', 25.8, 25.8, '103532', '103533', '国产水果', '4858', 50, 100000312);
INSERT INTO `axf_goods` VALUES (551, '119577', 'http://img01.bqstatic.com/upload/goods/201/703/0916/20170309163740_072802.jpg@200w_200h_90Q', '爱鲜蜂·泰国椰青', '爱鲜蜂·泰国椰青800g/个', 1, '0', '800g/个', 19.9, 21.8, '103532', '103534', '进口水果', '4858', 50, 100000239);
INSERT INTO `axf_goods` VALUES (552, '119682', 'http://img01.bqstatic.com/upload/goods/201/703/1616/20170316164933_657888.jpg@200w_200h_90Q', '爱鲜蜂·东方蜜瓜,水果', '爱鲜蜂·东方蜜瓜600-800g/粒', 1, '0', '600-800g/粒', 17.8, 19.9, '103532', '103533', '国产水果', '4858', 50, 100000175);
INSERT INTO `axf_goods` VALUES (553, '107766', 'http://img01.bqstatic.com/upload/goods/201/703/1514/20170315143238_098620.jpg@200w_200h_90Q', '爱鲜蜂·开椰器', '爱鲜蜂·开椰器1个', 1, '0', '1个', 2.5, 3, '103532', '103533', '国产水果', '4858', 50, 100000107);
INSERT INTO `axf_goods` VALUES (554, '109108', 'http://img01.bqstatic.com/upload/goods/201/605/3109/20160531095221_551975.jpg@200w_200h_90Q', '三元轻能黄桃+大麦优酪乳', '三元轻能黄桃+大麦优酪乳250g', 1, '1', '250g', 8.9, 15, '103536', '103537', '酸奶乳酸菌', '4858', 50, 100003903);
INSERT INTO `axf_goods` VALUES (555, '113619', 'http://img01.bqstatic.com/upload/goods/201/608/2618/20160826185419_023449.jpg@200w_200h_90Q', '骑士1992酸牛奶', '骑士1992酸牛奶180g', 1, '1', '180g', 6.8, 9.9, '103536', '103537', '酸奶乳酸菌', '4858', 50, 100002542);
INSERT INTO `axf_goods` VALUES (556, '117540', 'http://img01.bqstatic.com/upload/goods/201/611/2918/20161129183212_287528.jpg@200w_200h_90Q', 'go够轻松原味酸牛奶', 'go够轻松原味酸牛奶 235g/瓶', 1, '1', '235g/瓶', 8.9, 10.9, '103536', '103537', '酸奶乳酸菌', '4858', 50, 100004018);
INSERT INTO `axf_goods` VALUES (557, '119598', 'http://img01.bqstatic.com/upload/goods/201/703/1018/20170310182402_028186.jpg@200w_200h_90Q', '辉山十天风味酸乳', '辉山十天风味酸乳185g', 1, '1', '185g', 8.9, 8.9, '103536', '103537', '酸奶乳酸菌', '4858', 50, 100002115);
INSERT INTO `axf_goods` VALUES (558, '82158', 'http://img01.bqstatic.com/upload/goods/201/602/2309/20160223093221_476028.jpg@200w_200h_90Q', '伊利益消原味活性乳酸菌', '伊利益消原味活性乳酸菌160g', 1, '1', '160g', 2.9, 3.5, '103536', '103537', '酸奶乳酸菌', '4858', 50, 100001529);
INSERT INTO `axf_goods` VALUES (559, '35680', 'http://img01.bqstatic.com/upload/goods/201/602/2309/20160223093015_058280.jpg@200w_200h_90Q', '伊利大果粒芒果+黄桃', '伊利大果粒芒果+黄桃260g', 1, '1', '260g', 6.8, 7.5, '103536', '103537', '酸奶乳酸菌', '4858', 50, 100001360);
INSERT INTO `axf_goods` VALUES (560, '6366', 'http://img01.bqstatic.com/upload/goods/201/602/2309/20160223092904_206423.jpg@200w_200h_90Q', '精选,伊利,大果粒,酸奶,黄桃,草莓,低温酸奶,闪送超市,', '伊利大果粒黄桃+草莓260.0g/盒', 1, '1', '260g', 6.8, 7.5, '103536', '103537', '酸奶乳酸菌', '4858', 50, 100001248);
INSERT INTO `axf_goods` VALUES (561, '115399', 'http://img01.bqstatic.com/upload/goods/201/609/2917/20160929173613_377504.jpg@200w_200h_90Q', '骑士老酸奶', '骑士老酸奶150g', 1, '1', '150g', 6, 7.6, '103536', '103537', '酸奶乳酸菌', '4858', 50, 100001054);
INSERT INTO `axf_goods` VALUES (562, '10896', 'http://img01.bqstatic.com/upload/goods/000/001/0896/0000010896.jpg@200w_200h_90Q', '精品,伊利,畅轻风味发酵乳,草莓,燕麦,酸奶,乳制品', '伊利畅轻发酵乳草莓+燕麦250g', 1, '1', '250g', 6.8, 8, '103536', '103537', '酸奶乳酸菌', '4858', 50, 100001004);
INSERT INTO `axf_goods` VALUES (563, '119618', 'http://img01.bqstatic.com/upload/goods/201/703/1018/20170310182521_915109.jpg@200w_200h_90Q', '辉山十天风味酸乳氧气森林（草莓+蔓越莓）', '辉山十天风味酸乳氧气森林（草莓+蔓越莓）210g', 1, '1', '210g', 9.9, 9.9, '103536', '103537', '酸奶乳酸菌', '4858', 50, 100000874);
INSERT INTO `axf_goods` VALUES (564, '10901', 'http://img01.bqstatic.com/upload/goods/000/001/0901/0000010901_26880.jpg@200w_200h_90Q', '味全,活性乳酸菌,饮料,原味,乳酸菌饮料,饮料酒水', '味全活性乳酸菌饮料原味435.0ml', 1, '0', '435ml', 6.9, 6.9, '103536', '103537', '酸奶乳酸菌', '4858', 50, 100000817);
INSERT INTO `axf_goods` VALUES (565, '9866', 'http://img01.bqstatic.com/upload/goods/000/000/9866/0000009866.jpg@200w_200h_90Q', '精品,三元,雪凝茯苓酸奶,酸奶,雪凝茯苓,饮品,乳制品,三元牛奶', '三元雪凝茯苓酸奶150.0g*4', 1, '0', '4*150g', 10.9, 11.9, '103536', '103537', '酸奶乳酸菌', '4858', 50, 100000354);
INSERT INTO `axf_goods` VALUES (566, '110703', 'http://img01.bqstatic.com/upload/goods/201/607/0111/20160701114205_596338.jpg@200w_200h_90Q', '活润蓝莓山药果粒酸牛奶', '活润蓝莓山药果粒酸牛奶370g', 1, '0', '370g', 11.8, 11.8, '103536', '103537', '酸奶乳酸菌', '4858', 50, 100000253);
INSERT INTO `axf_goods` VALUES (567, '103168', 'http://img01.bqstatic.com/upload/goods/201/611/2414/20161124143051_066107.jpg@200w_200h_90Q', '活润燕麦+杏果粒风味酸奶', '活润燕麦+杏果粒风味酸奶370g', 1, '0', '370g', 11.8, 11.8, '103536', '103537', '酸奶乳酸菌', '4858', 50, 100000214);
INSERT INTO `axf_goods` VALUES (568, '117316', 'http://img01.bqstatic.com/upload/goods/201/611/2417/20161124171552_008043.jpg@200w_200h_90Q', '活润玫瑰+樱桃果粒酸牛奶', '活润玫瑰+樱桃果粒酸牛奶370g', 1, '0', '370g', 11.8, 11.8, '103536', '103537', '酸奶乳酸菌', '4858', 50, 100000199);
INSERT INTO `axf_goods` VALUES (569, '106899', 'http://img01.bqstatic.com/upload/goods/201/604/2918/20160429183140_699460.jpg@200w_200h_90Q', '维他香草味', '维他香草味250ml', 1, '0', '250ml', 2.9, 3, '103536', '103537', '酸奶乳酸菌', '4858', 50, 100000063);
INSERT INTO `axf_goods` VALUES (570, '114413', 'http://img01.bqstatic.com/upload/goods/201/611/0215/20161102153755_652510.jpg@200w_200h_90Q', '喜乐菌优多乳酸菌饮品', '喜乐菌优多乳酸菌饮品330ml', 1, '0', '330ml', 5, 5, '103536', '103537', '酸奶乳酸菌', '4858', 50, 100000012);
INSERT INTO `axf_goods` VALUES (571, '2218', 'http://img01.bqstatic.com/upload/goods/000/000/2218/0000002218.jpg@200w_200h_90Q', '有', '养乐多五连装500ml', 0, '0', '500ml', 13, 13, '103536', '103537', '酸奶乳酸菌', '4858', 200, 522);
INSERT INTO `axf_goods` VALUES (572, '2398', 'http://img01.bqstatic.com/upload/goods/000/000/2398/0000002398.jpg@200w_200h_90Q', '娃哈哈,AD钙奶,4支装,乳制品', '娃哈哈AD钙奶220g*4支', 0, '0', '220ml*4支', 8, 8, '103536', '103537', '酸奶乳酸菌', '4858', 200, 351);
INSERT INTO `axf_goods` VALUES (573, '2238', 'http://img01.bqstatic.com/upload/goods/000/000/2238/0000002238.jpg@200w_200h_90Q', '康师傅,妙芙,奶油味,休闲零食', '康师傅妙芙欧式蛋糕奶油味96g', 0, '0', '96g', 6, 7, '103536', '103540', '面包蛋糕', '4858', 200, 264);
INSERT INTO `axf_goods` VALUES (574, '6090', 'http://img01.bqstatic.com/upload/goods/000/000/6090/0000006090.jpg@200w_200h_90Q', '康师傅,妙芙,巧克力味,糕点,休闲零食,闪送超市,', '康师傅妙芙欧式巧克力蛋糕96g', 0, '0', '96g', 6, 7, '103536', '103540', '面包蛋糕', '4858', 200, 197);
INSERT INTO `axf_goods` VALUES (575, '3234', 'http://img01.bqstatic.com/upload/goods/000/000/3234/0000003234.jpg@200w_200h_90Q', '旺仔,复原乳,牛奶,4连装,乳制品,常温奶', '旺仔复原乳牛奶125ml*4', 0, '0', '125ml*4', 9, 9, '103536', '103538', '牛奶豆浆', '4858', 200, 192);
INSERT INTO `axf_goods` VALUES (576, '3192', 'http://img01.bqstatic.com/upload/goods/000/000/3192/0000003192.jpg@200w_200h_90Q', '乐安天天,手撕面包,面包', '乐安天天手撕面包165g', 0, '0', '165g', 6, 6, '103536', '103540', '面包蛋糕', '4858', 200, 181);
INSERT INTO `axf_goods` VALUES (577, '2289', 'http://img01.bqstatic.com/upload/goods/000/000/2289/0000002289.jpg@200w_200h_90Q', '旺仔,牛奶,乳制品', '旺仔牛奶245ml', 0, '0', '245ml', 6, 6, '103536', '103538', '牛奶豆浆', '4858', 200, 160);
INSERT INTO `axf_goods` VALUES (578, '15539', 'http://img01.bqstatic.com/upload/goods/201/610/2617/20161026174013_932661.jpg@200w_200h_90Q', '维他奶,原味,豆奶', '维他奶原味豆奶250.0ml', 0, '0', '250ml', 3.5, 4, '103536', '103538', '牛奶豆浆', '4858', 200, 92);
INSERT INTO `axf_goods` VALUES (579, '4119', 'http://img01.bqstatic.com/upload/goods/000/000/4119/0000004119_00080.jpg@200w_200h_90Q', '伊利,优酸乳,原味,乳制品,低温酸奶', '伊利优酸乳原味250ml', 0, '0', '250ml', 2.5, 2.5, '103536', '103537', '酸奶乳酸菌', '4858', 200, 91);
INSERT INTO `axf_goods` VALUES (580, '33445', 'http://img01.bqstatic.com/upload/goods/201/604/2210/20160422104644_729436.jpg@200w_200h_90Q', '伊利,谷粒多,燕麦牛奶,牛奶面包', '伊利谷粒多燕麦牛奶200ml', 0, '0', '200ml', 4.5, 4.5, '103536', '103538', '牛奶豆浆', '4858', 200, 84);
INSERT INTO `axf_goods` VALUES (581, '6372', 'http://img01.bqstatic.com/upload/goods/000/000/6372/0000006372.jpg@200w_200h_90Q', '伊利,畅轻,燕麦,黄桃,低温酸奶,闪送超市,', '伊利畅轻发酵乳黄桃+燕麦250g', 0, '0', '250g', 6.8, 8, '103536', '103537', '酸奶乳酸菌', '4858', 200, 72);
INSERT INTO `axf_goods` VALUES (582, '3891', 'http://img01.bqstatic.com/upload/goods/000/000/3891/0000003891.jpg@200w_200h_90Q', '', '乐安天天红豆酥派100.0g', 0, '0', '100g', 4, 3.5, '103536', '103540', '面包蛋糕', '4858', 200, 69);
INSERT INTO `axf_goods` VALUES (583, '10376', 'http://img01.bqstatic.com/upload/goods/000/001/0376/0000010376.jpg@200w_200h_90Q', '', '娃哈哈AD钙奶220g', 0, '0', '220g', 2, 2, '103536', '103537', '酸奶乳酸菌', '4858', 200, 62);
INSERT INTO `axf_goods` VALUES (584, '101670', 'http://img01.bqstatic.com/upload/goods/201/602/2918/20160229184619_206151.jpg@200w_200h_90Q', '伊利,大果粒,黄桃,草莓,酸奶', '伊利大果粒黄桃+草莓260g', 0, '0', '260g', 7, 7, '103536', '103537', '酸奶乳酸菌', '4858', 200, 59);
INSERT INTO `axf_goods` VALUES (585, '66404', 'http://img01.bqstatic.com/upload/goods/201/612/1510/20161215102945_846008.jpg@200w_200h_90Q', '维他巧克力豆奶', '维他巧克力豆奶250ml', 0, '0', '250ml', 4, 5, '103536', '103538', '牛奶豆浆', '4858', 200, 59);
INSERT INTO `axf_goods` VALUES (586, '5488', 'http://img01.bqstatic.com/upload/goods/000/000/5488/0000005488_29710.jpg@200w_200h_90Q', '', '伊利利乐枕牛奶240ml*16', 0, '0', '240ml*16', 36, 43, '103536', '103538', '牛奶豆浆', '4858', 200, 50);
INSERT INTO `axf_goods` VALUES (587, '7132', 'http://img01.bqstatic.com/upload/goods/000/000/7132/0000007132.jpg@200w_200h_90Q', '', '三元利乐枕纯牛奶227ml*16', 0, '0', '227ml*16包', 38, 38, '103536', '103538', '牛奶豆浆', '4858', 200, 44);
INSERT INTO `axf_goods` VALUES (588, '111420', 'http://img01.bqstatic.com/upload/goods/201/607/1518/20160715180049_376787.jpg@200w_200h_90Q', '康师傅,妙芙,奶油味,蛋糕', '康师傅妙芙奶油味192g', 0, '0', '192g', 12, 12, '103536', '103540', '面包蛋糕', '4858', 200, 26);
INSERT INTO `axf_goods` VALUES (589, '101153', 'http://img01.bqstatic.com/upload/goods/201/602/2317/20160223173808_624547.jpg@200w_200h_90Q', '娃哈哈,爽歪歪', '娃哈哈爽歪歪200ml*4瓶', 0, '0', '200ml*4瓶', 9, 8, '103536', '103537', '酸奶乳酸菌', '4858', 200, 20);
INSERT INTO `axf_goods` VALUES (590, '10405', 'http://img01.bqstatic.com/upload/goods/000/001/0405/0000010405.jpg@200w_200h_90Q', '', '娃哈哈AD钙奶饮料箱220.0g*24瓶', 0, '0', '220g*24瓶', 48, 48, '103536', '103537', '酸奶乳酸菌', '4858', 200, 17);
INSERT INTO `axf_goods` VALUES (591, '4230', 'http://img01.bqstatic.com/upload/goods/000/000/4230/0000004230.jpg@200w_200h_90Q', '美汁源,果粒,奶优,草莓味,乳制品,常温乳饮料', '「美汁源」果粒奶优草莓味450.0ml', 0, '0', '450ml', 4.5, 4.5, '103536', '103538', '牛奶豆浆', '4858', 200, 14);
INSERT INTO `axf_goods` VALUES (592, '4229', 'http://img01.bqstatic.com/upload/goods/000/000/4229/0000004229.jpg@200w_200h_90Q', '美汁源,果粒,奶优,蜜桃味,乳制品,常温乳饮料', '「美汁源」果粒奶优蜜桃味450.0ml', 0, '0', '450ml', 4.5, 4.5, '103536', '103538', '牛奶豆浆', '4858', 200, 11);
INSERT INTO `axf_goods` VALUES (593, '37912', 'http://img01.bqstatic.com/upload/goods/201/604/1618/20160416181616_289148.jpg@200w_200h_90Q', '达利园,瑞士卷,草莓味', '达利园瑞士卷草莓味200g', 0, '0', '200g', 6.5, 8.5, '103536', '103540', '面包蛋糕', '4858', 200, 10);
INSERT INTO `axf_goods` VALUES (594, '100337', 'http://img01.bqstatic.com/upload/goods/201/601/2716/20160127162845_980208.jpg@200w_200h_90Q', '伊利,金典,纯牛奶,乳制品,整箱奶', '伊利金典纯牛奶箱250ml*12盒', 0, '0', '250ml*12盒', 65, 65, '103536', '103538', '牛奶豆浆', '4858', 200, 8);
INSERT INTO `axf_goods` VALUES (595, '5872', 'http://img01.bqstatic.com/upload/goods/000/000/5872/0000005872_10620.jpg@200w_200h_90Q', '伊利,红枣,风味,酸乳,低温酸奶,闪送超市,', '伊利红枣风味酸乳150g', 0, '0', '150g', 2, 2, '103536', '103537', '酸奶乳酸菌', '4858', 200, 3);
INSERT INTO `axf_goods` VALUES (596, '7754', 'http://img01.bqstatic.com/upload/goods/201/602/1916/20160219163802_847787.jpg@200w_200h_90Q', '', '「美汁源」果粒奶优原味450.0ml', 0, '0', '450ml', 5, 4.5, '103536', '103538', '牛奶豆浆', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (597, '4231', 'http://img01.bqstatic.com/upload/goods/000/000/4231/0000004231.jpg@200w_200h_90Q', '美汁源,果粒,奶优,菠萝味,乳制品,常温乳饮料', '「美汁源」果粒奶优菠萝味450.0ml', 0, '0', '450ml', 4.5, 4.5, '103536', '103538', '牛奶豆浆', '4858', 200, 2);
INSERT INTO `axf_goods` VALUES (598, '5822', 'http://img01.bqstatic.com/upload/goods/000/000/5822/0000005822.jpg@200w_200h_90Q', '娃哈哈,锌,爽歪歪,酸奶,乳饮料,闪送超市', '娃哈哈锌爽歪歪酸奶200.0g', 0, '0', '200g', 2.2, 2, '103536', '103537', '酸奶乳酸菌', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (599, '7117', 'http://img01.bqstatic.com/upload/goods/000/000/7117/0000007117.jpg@200w_200h_90Q', '', '三元大红枣牛奶180.0g', 0, '0', '180g', 2.5, 2.5, '103536', '103538', '牛奶豆浆', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (600, '5524', 'http://img01.bqstatic.com/upload/goods/000/000/5524/0000005524.jpg@200w_200h_90Q', '蒙牛,特仑苏,醇纤,调制乳,常温乳制品,闪送超市,', '蒙牛特仑苏醇纤调制乳箱250.0ml*12盒', 0, '0', '250ml*12盒', 63, 63, '103536', '103538', '牛奶豆浆', '4858', 200, 1);
INSERT INTO `axf_goods` VALUES (601, '7752', 'http://img01.bqstatic.com/upload/goods/000/000/7752/0000007752.jpg@200w_200h_90Q', '', '「美汁源」果粒奶优芒果味450.0ml', 0, '0', '450ml', 4.5, 4.5, '103536', '103538', '牛奶豆浆', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (602, '9070', 'http://img01.bqstatic.com/upload/goods/000/000/9070/0000009070.jpg@200w_200h_90Q', '', '旺仔牛奶箱145.0ml*20罐', 0, '0', '145ml*20罐', 52, 52, '103536', '103538', '牛奶豆浆', '4858', 200, 0);
INSERT INTO `axf_goods` VALUES (603, '119570', 'http://img01.bqstatic.com/upload/goods/201/703/1318/20170313185620_821516.jpg@200w_200h_90Q', '麻辣味鲅鱼', '麻辣味鲅鱼32g', 1, '1', '32g', 1, 1, '103541', '103543', '膨化食品', '4858', 50, 100003541);
INSERT INTO `axf_goods` VALUES (604, '110418', 'http://img01.bqstatic.com/upload/goods/201/606/2810/20160628101132_097878.jpg@200w_200h_90Q', '迎丰,瓜子,焦糖味', '迎丰瓜子焦糖味219g', 0, '0', '219g', 12, 12, '103541', '103542', '坚果炒货', '4858', 200, 145);
INSERT INTO `axf_goods` VALUES (605, '110420', 'http://img01.bqstatic.com/upload/goods/201/606/2810/20160628101251_585825.jpg@200w_200h_90Q', '迎丰,瓜子,核桃味', '迎丰瓜子核桃味219g', 0, '0', '219g', 11, 12, '103541', '103542', '坚果炒货', '4858', 200, 83);
INSERT INTO `axf_goods` VALUES (606, '119571', 'http://img01.bqstatic.com/upload/goods/201/703/1318/20170313185647_852777.jpg@200w_200h_90Q', '麻辣味带鱼', '麻辣味带鱼32g', 1, '1', '32g', 1, 1, '103541', '103543', '膨化食品', '4858', 50, 100003321);
INSERT INTO `axf_goods` VALUES (607, '119572', 'http://img01.bqstatic.com/upload/goods/201/703/1318/20170313185518_250319.jpg@200w_200h_90Q', '黑胡椒风味鱼豆腐', '黑胡椒风味鱼豆腐22g', 1, '1', '22g', 1, 1, '103541', '103543', '膨化食品', '4858', 50, 100004225);
INSERT INTO `axf_goods` VALUES (608, '119573', 'http://img01.bqstatic.com/upload/goods/201/703/1318/20170313185721_456061.jpg@200w_200h_90Q', '香辣味手撕素肉排', '香辣味手撕素肉排22g', 1, '1', '22g', 1, 1, '103541', '103543', '膨化食品', '4858', 50, 100004151);
INSERT INTO `axf_goods` VALUES (609, '12884', 'http://img01.bqstatic.com/upload/goods/201/604/2516/20160425161640_531752.jpg@200w_200h_90Q', '卫龙,亲嘴烧,红烧,牛肉味', '卫龙亲嘴烧红烧牛肉味22g', 0, '0', '22g', 0.8, 1, '103541', '103546', '肉干蜜饯', '4858', 200, 1152);
INSERT INTO `axf_goods` VALUES (610, '4222', 'http://img01.bqstatic.com/upload/goods/000/000/4222/0000004222.jpg@200w_200h_90Q', '咪咪,虾条,休闲零食,零食小吃', '咪咪虾味条20g', 0, '0', '20g', 0.8, 1, '103541', '103543', '膨化食品', '4858', 200, 900);
INSERT INTO `axf_goods` VALUES (611, '16788', 'http://img01.bqstatic.com/upload/goods/201/604/2516/20160425161237_869847.jpg@200w_200h_90Q', '卫龙,亲嘴烧,川香,风味', '卫龙亲嘴烧川香风味22g', 0, '0', '22g', 0.8, 1, '103541', '103546', '肉干蜜饯', '4858', 200, 554);
INSERT INTO `axf_goods` VALUES (612, '3207', 'http://img01.bqstatic.com/upload/goods/201/601/2012/20160120120101_970607.jpg@200w_200h_90Q', '梁丰,麦丽素,休闲零食,零食小吃', '梁丰麦丽素80g', 0, '0', '80g', 4, 3, '103541', '103545', '糖果巧克力', '4858', 200, 486);
INSERT INTO `axf_goods` VALUES (613, '111510', 'http://img01.bqstatic.com/upload/goods/201/607/1815/20160718154652_421536.jpg@200w_200h_90Q', '卫龙,亲嘴烧,麦辣鸡汁味', '卫龙亲嘴烧麦辣鸡汁味22g', 0, '0', '22g', 0.8, 0.5, '103541', '103546', '肉干蜜饯', '4858', 200, 441);
INSERT INTO `axf_goods` VALUES (614, '100048', 'http://img01.bqstatic.com/upload/goods/000/009/8055/0000098055_73470.jpg@200w_200h_90Q', '洽洽焦糖瓜子', '洽洽焦糖瓜子108g', 0, '0', '108g', 7, 5, '103541', '103542', '坚果炒货', '4858', 200, 426);
INSERT INTO `axf_goods` VALUES (615, '4601', 'http://img01.bqstatic.com/upload/goods/201/610/2616/20161026160157_179729.jpg@200w_200h_90Q', '上好佳,鲜虾片,零食,小吃', '上好佳鲜虾片40g', 0, '0', '40g', 4, 4, '103541', '103543', '膨化食品', '4858', 200, 411);
INSERT INTO `axf_goods` VALUES (616, '11628', 'http://img01.bqstatic.com/upload/goods/000/001/1628/0000011628_23140.jpg@200w_200h_90Q', '金鸽,葵花子,瓜子,休闲零食', '金鸽多味葵花子260g', 0, '0', '260g', 8, 9, '103541', '103542', '坚果炒货', '4858', 200, 390);
INSERT INTO `axf_goods` VALUES (617, '115291', 'http://img01.bqstatic.com/upload/goods/201/609/2215/20160922153553_377116.jpg@200w_200h_90Q', '乐事,薯片,经典原味,休闲零食,零食小吃', '乐事美国经典原味薯片70g', 0, '0', '70g', 7, 7, '103541', '103543', '膨化食品', '4858', 200, 370);
INSERT INTO `axf_goods` VALUES (618, '9911', 'http://img01.bqstatic.com/upload/goods/000/000/9911/0000009911.jpg@200w_200h_90Q', '', '新家园烤馍锅巴孜然风味63g', 0, '0', '63g', 2, 2, '103541', '103543', '膨化食品', '4858', 200, 338);
INSERT INTO `axf_goods` VALUES (619, '2232', 'http://img01.bqstatic.com/upload/goods/000/000/2232/0000002232_65560.jpg@200w_200h_90Q', '洽洽,香瓜子,休闲零食,瓜子', '洽洽香瓜子260g', 0, '0', '260g', 9, 9, '103541', '103542', '坚果炒货', '4858', 200, 295);
INSERT INTO `axf_goods` VALUES (620, '6025', 'http://img01.bqstatic.com/upload/goods/000/000/6025/0000006025_63530.jpg@200w_200h_90Q', '家缘,好吃点,锅巴,五香味,休闲零食,闪送超市,', '家缘好吃点锅巴五香味102g', 0, '0', '102g', 2.5, 2.5, '103541', '103543', '膨化食品', '4858', 200, 264);
INSERT INTO `axf_goods` VALUES (621, '100049', 'http://img01.bqstatic.com/upload/goods/000/009/8054/0000098054_46710.jpg@200w_200h_90Q', '洽洽山核桃味瓜子', '洽洽山核桃味瓜子108g', 0, '0', '108g', 6.5, 5, '103541', '103542', '坚果炒货', '4858', 200, 258);
INSERT INTO `axf_goods` VALUES (622, '2474', 'http://img01.bqstatic.com/upload/goods/000/000/2474/0000002474_99350.jpg@200w_200h_90Q', '旺旺雪饼,原味,休闲零食', '旺旺雪饼84g', 0, '0', '84g', 4.5, 5, '103541', '103543', '膨化食品', '4858', 200, 245);
INSERT INTO `axf_goods` VALUES (623, '5928', 'http://img01.bqstatic.com/upload/goods/000/000/5928/0000005928_60850.jpg@200w_200h_90Q', '新家园,烤馍,锅巴,烧烤味,饼干,闪送超市', '新家园烤馍锅巴烧烤味63g', 0, '0', '63g', 2, 2, '103541', '103543', '膨化食品', '4858', 200, 242);
INSERT INTO `axf_goods` VALUES (624, '9856', 'http://img01.bqstatic.com/upload/goods/000/000/9856/0000009856.jpg@200w_200h_90Q', '', '家缘锅巴麻辣味102g', 0, '0', '102g', 3, 2.3, '103541', '103543', '膨化食品', '4858', 200, 231);
INSERT INTO `axf_goods` VALUES (625, '3253', 'http://img01.bqstatic.com/upload/goods/000/000/3253/0000003253.jpg@200w_200h_90Q', '老奶奶,花生米,干果,休闲零食', '老奶奶花生米122g', 0, '0', '122g', 4, 4, '103541', '103542', '坚果炒货', '4858', 200, 213);
INSERT INTO `axf_goods` VALUES (626, '6023', 'http://img01.bqstatic.com/upload/goods/000/000/6023/0000006023_16780.jpg@200w_200h_90Q', '家缘,好吃点,锅巴,牛肉味,休闲零食,闪送超市,', '家缘好吃点锅巴牛肉味102g', 0, '0', '102g', 2.5, 2.5, '103541', '103543', '膨化食品', '4858', 200, 210);
INSERT INTO `axf_goods` VALUES (627, '2439', 'http://img01.bqstatic.com/upload/goods/000/000/2439/0000002439.jpg@200w_200h_90Q', '康师傅,蛋酥卷,奶油味,休闲零食', '康师傅蛋酥卷（奶油味）90g', 0, '0', '90g', 6.5, 7.5, '103541', '103544', '饼干糕点', '4858', 200, 208);
INSERT INTO `axf_goods` VALUES (628, '2548', 'http://img01.bqstatic.com/upload/goods/000/000/2548/0000002548.jpg@200w_200h_90Q', '有友,泡凤爪,山椒味,休闲零食', '有友泡椒凤爪180g', 0, '0', '180g', 10.3, 12, '103541', '103546', '肉干蜜饯', '4858', 200, 193);
INSERT INTO `axf_goods` VALUES (629, '2547', 'http://img01.bqstatic.com/upload/goods/201/612/2814/20161228140838_630847.jpg@200w_200h_90Q', '有友,泡凤爪,山椒味,休闲零食', '有友泡凤爪山椒味80g', 0, '0', '80g', 5.2, 5, '103541', '103546', '肉干蜜饯', '4858', 200, 192);
INSERT INTO `axf_goods` VALUES (630, '5943', 'http://img01.bqstatic.com/upload/goods/000/000/5943/0000005943_47910.jpg@200w_200h_90Q', '好丽友,呀土豆,番茄酱味,休闲零食,闪送超市,', '好丽友呀土豆番茄酱味70g', 0, '0', '70g', 6, 6, '103541', '103543', '膨化食品', '4858', 200, 188);
INSERT INTO `axf_goods` VALUES (631, '4602', 'http://img01.bqstatic.com/upload/goods/000/000/4602/0000004602_51160.jpg@200w_200h_90Q', '上好佳,鲜虾条,零食,小吃', '上好佳鲜虾条40g', 0, '0', '40g', 4, 4, '103541', '103543', '膨化食品', '4858', 200, 178);
INSERT INTO `axf_goods` VALUES (632, '115292', 'http://img01.bqstatic.com/upload/goods/201/609/2215/20160922153758_730370.jpg@200w_200h_90Q', '乐事,薯片,意大利,香浓红烩', '乐事意大利香浓红烩味薯片70g', 0, '0', '70g', 6.5, 7, '103541', '103543', '膨化食品', '4858', 200, 173);
INSERT INTO `axf_goods` VALUES (633, '116816', 'http://img01.bqstatic.com/upload/goods/201/604/0809/20160408092706_678944.jpg@200w_200h_90Q', '乐事黄瓜味薯片', '乐事黄瓜味薯片70g', 0, '0', '70g', 7, 7, '103541', '103543', '膨化食品', '4858', 200, 169);
INSERT INTO `axf_goods` VALUES (634, '6024', 'http://img01.bqstatic.com/upload/goods/000/000/6024/0000006024_61300.jpg@200w_200h_90Q', '家缘,好吃点,锅巴,孜然味,休闲零食,闪送超市,', '家缘好吃点锅巴孜然味102g', 0, '0', '102g', 2.5, 2.5, '103541', '103543', '膨化食品', '4858', 200, 161);
INSERT INTO `axf_goods` VALUES (635, '2307', 'http://img01.bqstatic.com/upload/goods/201/601/2916/20160129162957_900948.jpg@200w_200h_90Q', '奥利奥,巧克力夹心,休闲零食,零食小吃', '奥利奥夹心饼干原味130g/袋', 0, '0', '130g', 6.5, 7, '103541', '103544', '饼干糕点', '4858', 200, 152);
INSERT INTO `axf_goods` VALUES (636, '7882', 'http://img01.bqstatic.com/upload/goods/000/000/7882/0000007882.jpg@200w_200h_90Q', '', '好丽友好友趣薯片韩国泡菜味75g', 0, '0', '75g', 6, 6, '103541', '103543', '膨化食品', '4858', 200, 150);
INSERT INTO `axf_goods` VALUES (637, '101264', 'http://img01.bqstatic.com/upload/goods/201/602/2414/20160224144033_296822.jpg@200w_200h_90Q', '乐事,大波浪薯片,香脆烤鸡翅味,休闲零食', '乐事大波浪薯片香脆烤鸡翅味70g', 0, '0', '70g', 7, 6.8, '103541', '103543', '膨化食品', '4858', 200, 149);
INSERT INTO `axf_goods` VALUES (638, '3564', 'http://img01.bqstatic.com/upload/goods/000/000/3564/0000003564.jpg@200w_200h_90Q', '甘源牌,蟹黄味,瓜子仁,休闲零食', '甘源牌蟹黄味瓜子仁75g', 0, '0', '75g', 4, 3.5, '103541', '103542', '坚果炒货', '4858', 200, 149);
INSERT INTO `axf_goods` VALUES (639, '9906', 'http://img01.bqstatic.com/upload/goods/000/000/9906/0000009906.jpg@200w_200h_90Q', '', '新家园烤馍锅巴咖喱牛肉风味63g', 0, '0', '63g', 2, 2, '103541', '103543', '膨化食品', '4858', 200, 147);
INSERT INTO `axf_goods` VALUES (640, '2421', 'http://img01.bqstatic.com/upload/goods/000/000/2421/0000002421.jpg@200w_200h_90Q', '德芙,士力架,花生夹心巧克力,休闲零食', '士力架花生夹心巧克力51g', 0, '0', '51g', 5, 5, '103541', '103545', '糖果巧克力', '4858', 200, 144);
INSERT INTO `axf_goods` VALUES (641, '8104', 'http://img01.bqstatic.com/upload/goods/000/000/8104/0000008104.jpg@200w_200h_90Q', '', '金大州金针菇香辣味35g', 0, '0', '35g', 3, 3, '103541', '103546', '肉干蜜饯', '4858', 200, 140);
INSERT INTO `axf_goods` VALUES (642, '8645', 'http://img01.bqstatic.com/upload/goods/000/000/8645/0000008645.jpg@200w_200h_90Q', '', '乖乖脆果炼乳味70g', 0, '0', '70g', 4.8, 4.8, '103541', '103543', '膨化食品', '4858', 200, 139);
INSERT INTO `axf_goods` VALUES (643, '4246', 'http://img01.bqstatic.com/upload/goods/000/000/4246/0000004246.jpg@200w_200h_90Q', '达利园,软面包,面包', '达利园法式香奶味软面包200g', 0, '0', '200g', 7, 7, '103541', '103544', '饼干糕点', '4858', 200, 135);
INSERT INTO `axf_goods` VALUES (644, '2394', 'http://img01.bqstatic.com/upload/goods/000/000/2394/0000002394_05870.jpg@200w_200h_90Q', '卡夫,太平梳打饼,干奶盐味,休闲零食', '卡夫太平梳打饼干奶盐100g', 0, '0', '100g', 4, 4, '103541', '103544', '饼干糕点', '4858', 200, 131);
INSERT INTO `axf_goods` VALUES (645, '5933', 'http://img01.bqstatic.com/upload/goods/000/000/5933/0000005933_56900.jpg@200w_200h_90Q', '上好佳,洋葱圈,零食,小吃', '上好佳洋葱圈40g', 0, '0', '40g', 3.8, 4, '103541', '103543', '膨化食品', '4858', 200, 128);
INSERT INTO `axf_goods` VALUES (646, '2406', 'http://img01.bqstatic.com/upload/goods/000/000/2406/0000002406_07670.jpg@200w_200h_90Q', '正林,瓜子,西瓜子,休闲零食', '正林瓜子225g', 0, '0', '225g', 10, 10, '103541', '103542', '坚果炒货', '4858', 200, 128);
INSERT INTO `axf_goods` VALUES (647, '5577', 'http://img01.bqstatic.com/upload/goods/000/000/5577/0000005577.jpg@200w_200h_90Q', '洽洽,原香,瓜子,休闲零食,闪送超市,', '洽洽原香瓜子285g', 0, '0', '285g', 10.5, 9, '103541', '103542', '坚果炒货', '4858', 200, 120);
INSERT INTO `axf_goods` VALUES (648, '9905', 'http://img01.bqstatic.com/upload/goods/000/000/9905/0000009905.jpg@200w_200h_90Q', '', '新家园烤馍锅巴椒盐风味63g', 0, '0', '63g', 2, 2, '103541', '103543', '膨化食品', '4858', 200, 116);
INSERT INTO `axf_goods` VALUES (649, '3565', 'http://img01.bqstatic.com/upload/goods/000/000/3565/0000003565.jpg@200w_200h_90Q', '甘源牌,蟹黄味,蚕豆,休闲零食', '甘源牌蟹黄味蚕豆75g', 0, '0', '75g', 4, 3.5, '103541', '103542', '坚果炒货', '4858', 200, 116);
INSERT INTO `axf_goods` VALUES (650, '6027', 'http://img01.bqstatic.com/upload/goods/000/000/6027/0000006027_52170.jpg@200w_200h_90Q', '旺旺,小小酥,原味,休闲零食,闪送超市,', '旺旺小小酥原味60g', 0, '0', '60g', 3, 3, '103541', '103543', '膨化食品', '4858', 200, 115);
INSERT INTO `axf_goods` VALUES (651, '3214', 'http://img01.bqstatic.com/upload/goods/201/601/2011/20160120115307_709762.jpg@200w_200h_90Q', '家缘,好吃点,锅巴,鸡汁味,休闲零食', '家缘好吃点锅巴鸡汁味102g', 0, '0', '102g', 3, 3, '103541', '103543', '膨化食品', '4858', 200, 115);
INSERT INTO `axf_goods` VALUES (652, '8832', 'http://img01.bqstatic.com/upload/goods/000/000/8832/0000008832.jpg@200w_200h_90Q', '金鸽,葵花子,瓜子', '金鸽多味葵花子160g', 0, '0', '160g', 5, 5, '103541', '103542', '坚果炒货', '4858', 200, 115);
INSERT INTO `axf_goods` VALUES (653, '2396', 'http://img01.bqstatic.com/upload/goods/000/000/2396/0000002396_11760.jpg@200w_200h_90Q', '卡夫,太平梳打饼干,香葱味,休闲零食', '太平香葱味梳打饼干100g', 0, '0', '100g', 4, 4, '103541', '103544', '饼干糕点', '4858', 200, 114);
INSERT INTO `axf_goods` VALUES (654, '3501', 'http://img01.bqstatic.com/upload/goods/000/000/3501/0000003501.jpg@200w_200h_90Q', '乖媳妇,泡椒,凤爪,零食小吃', '乖媳妇泡椒凤爪90g', 0, '0', '90g', 4.5, 4.5, '103541', '103546', '肉干蜜饯', '4858', 200, 114);
INSERT INTO `axf_goods` VALUES (655, '4603', 'http://img01.bqstatic.com/upload/goods/000/000/4603/0000004603.jpg@200w_200h_90Q', '上好佳,芝士条,休闲零食,零食小吃', '上好佳芝士条40g', 0, '0', '40g', 4, 4, '103541', '103543', '膨化食品', '4858', 200, 110);
INSERT INTO `axf_goods` VALUES (656, '5896', 'http://img01.bqstatic.com/upload/goods/000/000/5896/0000005896_07880.jpg@200w_200h_90Q', '波力,海苔,原味,休闲零食,闪送超市,', '波力海苔原味4.5g', 0, '0', '4.5g', 4.5, 3.5, '103541', '103543', '膨化食品', '4858', 200, 104);
INSERT INTO `axf_goods` VALUES (657, '5229', 'http://img01.bqstatic.com/upload/goods/000/000/5229/0000005229.jpg@200w_200h_90Q', '', '乐事意大利香浓红烩味40.0g', 0, '0', '40g', 4, 3, '103541', '103543', '膨化食品', '4858', 200, 100);
INSERT INTO `axf_goods` VALUES (658, '9907', 'http://img01.bqstatic.com/upload/goods/000/000/9907/0000009907.jpg@200w_200h_90Q', '', '新家园烤馍锅巴麻辣风味63g', 0, '0', '63g', 2, 2, '103541', '103543', '膨化食品', '4858', 200, 100);
INSERT INTO `axf_goods` VALUES (659, '2412', 'http://img01.bqstatic.com/upload/goods/000/000/2412/0000002412.jpg@200w_200h_90Q', '薯愿薯片,红酒牛排味,休闲零食', '薯愿薯片红酒牛排味104g', 0, '0', '104g', 9, 9, '103541', '103543', '膨化食品', '4858', 200, 99);
INSERT INTO `axf_goods` VALUES (660, '2415', 'http://img01.bqstatic.com/upload/goods/000/000/2415/0000002415.jpg@200w_200h_90Q', '薯愿薯片,香烤原味,休闲零食', '薯愿薯片香烤原味104g', 0, '0', '104g', 9, 9, '103541', '103543', '膨化食品', '4858', 200, 95);
INSERT INTO `axf_goods` VALUES (661, '9909', 'http://img01.bqstatic.com/upload/goods/000/000/9909/0000009909.jpg@200w_200h_90Q', '', '新家园烤馍锅巴香辣鸡肉味63g', 0, '0', '63g', 2, 2, '103541', '103543', '膨化食品', '4858', 200, 94);
INSERT INTO `axf_goods` VALUES (662, '101262', 'http://img01.bqstatic.com/upload/goods/201/602/2414/20160224143719_460188.jpg@200w_200h_90Q', '乐事,大波浪薯片,铁板鱿鱼味,休闲零食', '乐事大波浪铁板鱿鱼味薯片70g', 0, '0', '70g', 7.5, 6.8, '103541', '103543', '膨化食品', '4858', 200, 89);
INSERT INTO `axf_goods` VALUES (663, '3853', 'http://img01.bqstatic.com/upload/goods/000/000/3853/0000003853.jpg@200w_200h_90Q', '', '金大洲香辣金针菇（香辣味）35g', 0, '0', '35g', 3, 3, '103541', '103546', '肉干蜜饯', '4858', 200, 89);
INSERT INTO `axf_goods` VALUES (664, '7012', 'http://img01.bqstatic.com/upload/goods/000/000/7012/0000007012.jpg@200w_200h_90Q', '', '邬辣妈酒鬼豆筋80g', 0, '0', '80g', 3, 3.5, '103541', '103546', '肉干蜜饯', '4858', 200, 84);
INSERT INTO `axf_goods` VALUES (665, '6029', 'http://img01.bqstatic.com/upload/goods/000/000/6029/0000006029_00320.jpg@200w_200h_90Q', '旺旺,小小酥,黑胡椒味,休闲零食,闪送超市,', '旺旺黑胡椒味小小酥60g', 0, '0', '60g', 3, 3, '103541', '103543', '膨化食品', '4858', 200, 83);
INSERT INTO `axf_goods` VALUES (666, '116393', 'http://img01.bqstatic.com/upload/goods/000/009/8090/0000098090_23170.jpg@200w_200h_90Q', '丽芝士纳宝帝奶酪威化饼干', '丽芝士纳宝帝奶酪威化饼干58g', 0, '0', '58g', 3, 4, '103541', '103547', '进口零食', '4858', 200, 80);
INSERT INTO `axf_goods` VALUES (667, '8449', 'http://img01.bqstatic.com/upload/goods/000/000/8449/0000008449.jpg@200w_200h_90Q', '好丽友,派,巧克力味', '好丽友派巧克力味204g', 0, '0', '204g', 12, 12, '103541', '103544', '饼干糕点', '4858', 200, 80);
INSERT INTO `axf_goods` VALUES (668, '13610', 'http://img01.bqstatic.com/upload/goods/000/001/3610/0000013610_94000.jpg@200w_200h_90Q', '', '乐事无限翡翠黄瓜味薯片104g', 0, '0', '104g', 9, 8, '103541', '103543', '膨化食品', '4858', 200, 77);
INSERT INTO `axf_goods` VALUES (669, '2239', 'http://img01.bqstatic.com/upload/goods/000/000/2239/0000002239_24470.jpg@200w_200h_90Q', '卡夫,富丽,饼干,休闲零食', '卡夫富丽饼干100g', 0, '0', '100g', 6, 6, '103541', '103544', '饼干糕点', '4858', 200, 75);
INSERT INTO `axf_goods` VALUES (670, '3215', 'http://img01.bqstatic.com/upload/goods/000/000/3215/0000003215.jpg@200w_200h_90Q', '众望,小麻花,葱油,咸味,休闲零食', '众望小麻花葱油咸味112g', 0, '0', '112g', 4, 4, '103541', '103544', '饼干糕点', '4858', 200, 75);
INSERT INTO `axf_goods` VALUES (671, '5247', 'http://img01.bqstatic.com/upload/goods/000/000/5247/0000005247.jpg@200w_200h_90Q', '乐事,薯片,原味,桶装,休闲零食,闪送超市,', '乐事无限忠于原味薯片104g', 0, '0', '104g', 9, 9, '103541', '103543', '膨化食品', '4858', 200, 74);
INSERT INTO `axf_goods` VALUES (672, '115293', 'http://img01.bqstatic.com/upload/goods/201/609/2215/20160922153939_433971.jpg@200w_200h_90Q', '乐事,鸡汁番茄味,休闲零食', '乐事墨西哥鸡汁番茄味薯片70g', 0, '0', '70g', 7, 7, '103541', '103543', '膨化食品', '4858', 200, 72);
INSERT INTO `axf_goods` VALUES (673, '6028', 'http://img01.bqstatic.com/upload/goods/000/000/6028/0000006028_95620.jpg@200w_200h_90Q', '旺旺,小小酥,葱香,鸡肉味,休闲零食,闪送超市,', '旺旺葱香鸡肉味小小酥60g', 0, '0', '60g', 3, 3, '103541', '103543', '膨化食品', '4858', 200, 72);
INSERT INTO `axf_goods` VALUES (674, '6058', 'http://img01.bqstatic.com/upload/goods/000/000/6058/0000006058.jpg@200w_200h_90Q', '康师傅,蛋酥卷,醇香,芝麻口味,饼干,休闲零食,闪送超市,', '康师傅蛋酥卷醇香芝麻口味90g', 0, '0', '90g', 6.5, 6, '103541', '103544', '饼干糕点', '4858', 200, 71);
INSERT INTO `axf_goods` VALUES (675, '2229', 'http://img01.bqstatic.com/upload/goods/000/000/2229/0000002229_35860.jpg@200w_200h_90Q', '好丽友,蛋黄派,6枚,休闲零食', '好丽友蛋黄派6枚', 0, '0', '6枚', 12, 10.5, '103541', '103544', '饼干糕点', '4858', 200, 69);
INSERT INTO `axf_goods` VALUES (676, '3573', 'http://img01.bqstatic.com/upload/goods/000/000/3573/0000003573_49880.jpg@200w_200h_90Q', '百醇,抹茶,慕斯味,休闲零食', '格力高百醇抹茶慕斯味饼干48g', 0, '0', '48g', 6.5, 6.5, '103541', '103544', '饼干糕点', '4858', 200, 68);
INSERT INTO `axf_goods` VALUES (677, '8511', 'http://img01.bqstatic.com/upload/goods/000/000/8511/0000008511.jpg@200w_200h_90Q', '', '乖媳妇山椒凤爪90g', 0, '0', '90g', 4.5, 5, '103541', '103546', '肉干蜜饯', '4858', 200, 66);
INSERT INTO `axf_goods` VALUES (678, '5898', 'http://img01.bqstatic.com/upload/goods/000/000/5898/0000005898_86480.jpg@200w_200h_90Q', '同享,九制,话梅,果脯蜜饯,闪送超市,', '同享九制话梅120g', 0, '0', '120g', 7, 6, '103541', '103546', '肉干蜜饯', '4858', 200, 64);
INSERT INTO `axf_goods` VALUES (679, '2404', 'http://img01.bqstatic.com/upload/goods/000/000/2404/0000002404.jpg@200w_200h_90Q', '康师傅,3+2,清新柠檬味,休闲零食', '康师傅清新柠檬味苏打饼干125g', 0, '0', '125g', 5.5, 5, '103541', '103544', '饼干糕点', '4858', 200, 63);
INSERT INTO `axf_goods` VALUES (680, '2230', 'http://img01.bqstatic.com/upload/goods/000/000/2230/0000002230_76050.jpg@200w_200h_90Q', '好丽友,提拉米苏,6枚,休闲零食,派', '好丽友提拉米苏6枚138g', 0, '0', '138g', 12, 11, '103541', '103544', '饼干糕点', '4858', 200, 63);
INSERT INTO `axf_goods` VALUES (681, '3230', 'http://img01.bqstatic.com/upload/goods/000/000/3230/0000003230.jpg@200w_200h_90Q', '张二嘎,兰花豆,休闲零食,零食小吃', '张二嘎兰花豆130g', 0, '0', '130g', 4, 3.5, '103541', '103542', '坚果炒货', '4858', 200, 62);
INSERT INTO `axf_goods` VALUES (682, '4304', 'http://img01.bqstatic.com/upload/goods/000/000/4304/0000004304.jpg@200w_200h_90Q', '达利园,法式,软面包,原味,休闲零食,饼干蛋糕', '达利园法式香橙味软面包200g', 0, '0', '200g', 7, 7, '103541', '103544', '饼干糕点', '4858', 200, 58);
INSERT INTO `axf_goods` VALUES (683, '116819', 'http://img01.bqstatic.com/upload/goods/201/604/0809/20160408092603_063211.jpg@200w_200h_90Q', '乐事得克萨斯烧烤味薯片', '乐事得克萨斯烧烤味薯片70g', 0, '0', '70g', 6.8, 7, '103541', '103543', '膨化食品', '4858', 200, 58);
INSERT INTO `axf_goods` VALUES (684, '3661', 'http://img01.bqstatic.com/upload/goods/000/000/3661/0000003661.jpg@200w_200h_90Q', '', '好丽友蘑古力牛奶巧克力味48g', 0, '0', '48g', 4.5, 4.5, '103541', '103544', '饼干糕点', '4858', 200, 57);
INSERT INTO `axf_goods` VALUES (685, '5944', 'http://img01.bqstatic.com/upload/goods/000/000/5944/0000005944_02910.jpg@200w_200h_90Q', '好丽友,呀土豆,滋香,烤鸡味,休闲零食,闪送超市,', '好丽友呀土豆滋香烤鸡味70g', 0, '0', '70g', 6, 6, '103541', '103543', '膨化食品', '4858', 200, 56);
INSERT INTO `axf_goods` VALUES (686, '7886', 'http://img01.bqstatic.com/upload/goods/000/000/7886/0000007886.jpg@200w_200h_90Q', '', '好丽友好友趣薯片多汁牛排味75g', 0, '0', '75g', 6, 6, '103541', '103543', '膨化食品', '4858', 200, 56);
INSERT INTO `axf_goods` VALUES (687, '3582', 'http://img01.bqstatic.com/upload/goods/000/000/3582/0000003582.jpg@200w_200h_90Q', '百奇,巧克力味,休闲零食', '格力高百奇巧克力味60g', 0, '0', '60g', 6, 6, '103541', '103544', '饼干糕点', '4858', 200, 54);
INSERT INTO `axf_goods` VALUES (688, '2749', 'http://img01.bqstatic.com/upload/goods/000/000/2749/0000002749.jpg@200w_200h_90Q', '', '金猪脆泡猪皮90g', 0, '0', '90g', 4, 4.5, '103541', '103546', '肉干蜜饯', '4858', 200, 52);
INSERT INTO `axf_goods` VALUES (689, '6340', 'http://img01.bqstatic.com/upload/goods/000/000/6340/0000006340.jpg@200w_200h_90Q', '好丽友,Q蒂,蛋糕,糕点,休闲零食,闪送超市,', '好丽友Q蒂蛋糕摩卡巧克力味6枚168g', 0, '0', '168g', 12, 12, '103541', '103544', '饼干糕点', '4858', 200, 51);
INSERT INTO `axf_goods` VALUES (690, '3570', 'http://img01.bqstatic.com/upload/goods/000/000/3570/0000003570.jpg@200w_200h_90Q', '张二嘎,怪味豆,休闲零食,零食小吃', '张二嘎怪味豆130g', 0, '0', '130g', 4, 3.5, '103541', '103542', '坚果炒货', '4858', 200, 51);
INSERT INTO `axf_goods` VALUES (691, '5945', 'http://img01.bqstatic.com/upload/goods/000/000/5945/0000005945_93070.jpg@200w_200h_90Q', '好丽友,呀土豆,里脊,牛排味,休闲零食,闪送超市,', '好丽友呀土豆里脊牛排味70g', 0, '0', '70g', 6, 6, '103541', '103543', '膨化食品', '4858', 200, 50);
INSERT INTO `axf_goods` VALUES (692, '5313', 'http://img01.bqstatic.com/upload/goods/000/000/5313/0000005313.jpg@200w_200h_90Q', '好丽友,好友趣,加勒比烤翅味,薯片,零食', '好丽友好友趣加勒比烤翅味75g', 0, '0', '75g', 6, 5, '103541', '103543', '膨化食品', '4858', 200, 50);
INSERT INTO `axf_goods` VALUES (693, '11942', 'http://img01.bqstatic.com/upload/goods/000/001/1942/0000011942_11500.jpg@200w_200h_90Q', '', '乐吧薯片芥末味50g', 0, '0', '50g', 2, 2.5, '103541', '103543', '膨化食品', '4858', 200, 50);
INSERT INTO `axf_goods` VALUES (694, '3584', 'http://img01.bqstatic.com/upload/goods/000/000/3584/0000003584.jpg@200w_200h_90Q', '百奇,抹茶味,休闲零食', '百奇抹茶味50g', 0, '0', '50g', 6, 6, '103541', '103544', '饼干糕点', '4858', 200, 48);
INSERT INTO `axf_goods` VALUES (695, '2436', 'http://img01.bqstatic.com/upload/goods/000/000/2436/0000002436_15730.jpg@200w_200h_90Q', '达利园,好吃点,香脆杏仁饼,休闲零食', '达利园好吃点香脆杏仁饼108g', 0, '0', '108g', 5, 5, '103541', '103544', '饼干糕点', '4858', 200, 48);
INSERT INTO `axf_goods` VALUES (696, '6053', 'http://img01.bqstatic.com/upload/goods/000/000/6053/0000006053_11340.jpg@200w_200h_90Q', '咪咪,蟹味,酥,休闲零食,闪送超市,', '咪咪蟹味酥82.0g', 0, '0', '82g', 3, 2.5, '103541', '103543', '膨化食品', '4858', 200, 48);
INSERT INTO `axf_goods` VALUES (697, '5952', 'http://img01.bqstatic.com/upload/goods/000/000/5952/0000005952.jpg@200w_200h_90Q', '乐事,薯片,鲜浓,番茄味,休闲零食,闪送超市,', '乐事无限鲜浓番茄味薯片104g', 0, '0', '104g', 9, 9, '103541', '103543', '膨化食品', '4858', 200, 46);
INSERT INTO `axf_goods` VALUES (698, '5236', 'http://img01.bqstatic.com/upload/goods/000/000/5236/0000005236.jpg@200w_200h_90Q', '', '乐事墨西哥鸡汁番茄40.0g', 0, '0', '40g', 4, 3, '103541', '103543', '膨化食品', '4858', 200, 45);
INSERT INTO `axf_goods` VALUES (699, '5310', 'http://img01.bqstatic.com/upload/goods/000/000/5310/0000005310.jpg@200w_200h_90Q', '好丽友,好友趣,纯香,原味,薯片,休闲零食,闪送超市,', '好丽友好友趣纯香原味75g', 0, '0', '75g', 6, 5, '103541', '103543', '膨化食品', '4858', 200, 45);
INSERT INTO `axf_goods` VALUES (700, '3228', 'http://img01.bqstatic.com/upload/goods/000/000/3228/0000003228.jpg@200w_200h_90Q', '吴记,吴奶奶,花生米,休闲零食,干果', '吴记吴奶奶花生米120g', 0, '0', '120g', 4, 4.5, '103541', '103542', '坚果炒货', '4858', 200, 45);
INSERT INTO `axf_goods` VALUES (701, '11936', 'http://img01.bqstatic.com/upload/goods/000/001/1936/0000011936_45320.jpg@200w_200h_90Q', '', '乐吧薯片烧烤味50g', 0, '0', '50g', 2, 2.5, '103541', '103543', '膨化食品', '4858', 200, 44);
INSERT INTO `axf_goods` VALUES (702, '5895', 'http://img01.bqstatic.com/upload/goods/000/000/5895/0000005895.jpg@200w_200h_90Q', '好丽友,派,2枚装,糕点,闪送超市,', '好丽友派巧克力味2枚装68g', 0, '0', '68g', 4, 4, '103541', '103544', '饼干糕点', '4858', 200, 43);
INSERT INTO `axf_goods` VALUES (703, '3982', 'http://img01.bqstatic.com/upload/goods/000/000/3982/0000003982.jpg@200w_200h_90Q', '好丽友,好多鱼,浓香茄汁味,休闲零食,零食小吃', '好丽友浓香茄汁味好多鱼33g', 0, '0', '33g', 5, 4, '103541', '103544', '饼干糕点', '4858', 200, 43);
INSERT INTO `axf_goods` VALUES (704, '2305', 'http://img01.bqstatic.com/upload/goods/000/000/2305/0000002305_49120.jpg@200w_200h_90Q', '乐事,薯片,原味,休闲零食', '乐事美国经典原味45g', 0, '0', '45g', 5, 6, '103541', '103543', '膨化食品', '4858', 200, 43);
INSERT INTO `axf_goods` VALUES (705, '3577', 'http://img01.bqstatic.com/upload/goods/000/000/3577/0000003577_21000.jpg@200w_200h_90Q', '百醇,牛奶味,休闲零食,饼干', '格力高百醇牛奶味48g', 0, '0', '48g', 6.5, 6.5, '103541', '103544', '饼干糕点', '4858', 200, 42);
INSERT INTO `axf_goods` VALUES (706, '2438', 'http://img01.bqstatic.com/upload/goods/000/000/2438/0000002438_91970.jpg@200w_200h_90Q', '达利园,好吃点,香脆核桃饼,休闲零食', '达利园好吃点香脆核桃饼108g', 0, '0', '108g', 5, 5, '103541', '103544', '饼干糕点', '4858', 200, 42);
INSERT INTO `axf_goods` VALUES (707, '8044', 'http://img01.bqstatic.com/upload/goods/000/000/8044/0000008044.jpg@200w_200h_90Q', '', '徐福记沙琪玛香酥全蛋味160.0g', 0, '0', '160g', 6, 6, '103541', '103544', '饼干糕点', '4858', 200, 42);
INSERT INTO `axf_goods` VALUES (708, '7844', 'http://img01.bqstatic.com/upload/goods/000/000/7844/0000007844.jpg@200w_200h_90Q', '', '乐事薯片意大利香浓红烩味中包75g', 0, '0', '75g', 7, 7, '103541', '103543', '膨化食品', '4858', 200, 41);
INSERT INTO `axf_goods` VALUES (709, '7847', 'http://img01.bqstatic.com/upload/goods/000/000/7847/0000007847.jpg@200w_200h_90Q', '', '乐事黄瓜味45g', 0, '0', '45g', 4.5, 4, '103541', '103543', '膨化食品', '4858', 200, 41);
INSERT INTO `axf_goods` VALUES (710, '62912', 'http://img01.bqstatic.com/upload/goods/000/006/2912/0000062912_80980.jpg@200w_200h_90Q', '好丽友,好有趣,蜂蜜,黄油味,薯片,闪送超市,休闲零食,', '好丽友好友趣蜂蜜黄油味75g', 0, '0', '75g', 6, 5.5, '103541', '103543', '膨化食品', '4858', 200, 41);
INSERT INTO `axf_goods` VALUES (711, '3586', 'http://img01.bqstatic.com/upload/goods/000/000/3586/0000003586.jpg@200w_200h_90Q', '百奇,草莓口味,休闲零食', '格力高百奇草莓味55g', 0, '0', '55g', 6, 6, '103541', '103544', '饼干糕点', '4858', 200, 40);
INSERT INTO `axf_goods` VALUES (712, '13188', 'http://img01.bqstatic.com/upload/goods/201/606/2010/20160620101114_095547.jpg@200w_200h_90Q', '好丽友,呀土豆,蜂蜜黄油味', '好丽友呀土豆蜂蜜黄油味70g', 0, '0', '70g', 6, 6, '103541', '103543', '膨化食品', '4858', 200, 40);
INSERT INTO `axf_goods` VALUES (713, '5312', 'http://img01.bqstatic.com/upload/goods/000/000/5312/0000005312.jpg@200w_200h_90Q', '好丽友,好友趣,韩国,泡菜味,薯片,休闲零食,闪送超市,', '好丽友好友趣韩国泡菜味45.0g', 0, '0', '45g', 4, 3.5, '103541', '103543', '膨化食品', '4858', 200, 40);
INSERT INTO `axf_goods` VALUES (714, '115565', 'http://img01.bqstatic.com/upload/goods/201/609/2915/20160929153812_717495.jpg@200w_200h_90Q', '乐事,大波浪,薯片,碳烤五花肉味', '乐事大波浪薯片碳烤五花肉味70g', 0, '0', '70g', 7, 6, '103541', '103543', '膨化食品', '4858', 200, 39);
INSERT INTO `axf_goods` VALUES (715, '100095', 'http://img01.bqstatic.com/upload/goods/000/000/5249/0000005249.jpg@200w_200h_90Q', '乐事无限吮指红烧肉味桶装', '乐事无限吮指红烧肉味薯片104g', 0, '0', '104g', 9, 9, '103541', '103543', '膨化食品', '4858', 200, 39);
INSERT INTO `axf_goods` VALUES (716, '100615', 'http://img01.bqstatic.com/upload/goods/201/602/2516/20160225164435_189535.jpg@200w_200h_90Q', '徐福记八庄鸡蛋沙琪玛', '徐福记鸡蛋沙琪玛160g*2', 0, '0', '160g*2', 11, 10.5, '103541', '103544', '饼干糕点', '4858', 200, 38);
INSERT INTO `axf_goods` VALUES (717, '3588', 'http://img01.bqstatic.com/upload/goods/000/000/3588/0000003588.jpg@200w_200h_90Q', '百奇,牛奶口味,休闲零食', '格力高百奇牛奶味60g', 0, '0', '60g', 6.5, 6, '103541', '103544', '饼干糕点', '4858', 200, 36);
INSERT INTO `axf_goods` VALUES (718, '2310', 'http://img01.bqstatic.com/upload/goods/201/601/2011/20160120114955_017265.jpg@200w_200h_90Q', '格力高,百醇,红酒巧克力棒,休闲零食,零食小吃', '格力高百醇注心饼干红酒巧克力味48g', 0, '0', '48g', 6.8, 8, '103541', '103544', '饼干糕点', '4858', 200, 36);
INSERT INTO `axf_goods` VALUES (719, '5939', 'http://img01.bqstatic.com/upload/goods/000/000/5939/0000005939_63510.jpg@200w_200h_90Q', '好丽友,呀土豆,番茄酱味,休闲零食,闪送超市,', '好丽友呀土豆番茄酱味40g', 0, '0', '40g', 4, 4, '103541', '103543', '膨化食品', '4858', 200, 35);
INSERT INTO `axf_goods` VALUES (720, '3574', 'http://img01.bqstatic.com/upload/goods/000/000/3574/0000003574_68050.jpg@200w_200h_90Q', '百醇,巧克力味,休闲零食,饼干', '格力高百醇巧克力味48.0g', 0, '0', '48g', 6.5, 6.5, '103541', '103544', '饼干糕点', '4858', 200, 34);
INSERT INTO `axf_goods` VALUES (721, '5343', 'http://img01.bqstatic.com/upload/goods/000/000/5343/0000005343.jpg@200w_200h_90Q', '乐事,经典,美味,得克萨斯,烧烤味,薯片,休闲零食,闪送超市,', '乐事经典美味得克萨斯烧烤味40.0g', 0, '0', '40g', 4, 3, '103541', '103543', '膨化食品', '4858', 200, 34);
INSERT INTO `axf_goods` VALUES (722, '9522', 'http://img01.bqstatic.com/upload/goods/000/000/9522/0000009522.jpg@200w_200h_90Q', '精品,多力多滋,玉米片,芝士味,零食', '多力多滋超浓芝士味玉米片(小)65.0g', 0, '0', '65g', 10, 9, '103541', '103547', '进口零食', '4858', 200, 33);
INSERT INTO `axf_goods` VALUES (723, '9884', 'http://img01.bqstatic.com/upload/goods/000/000/9884/0000009884.jpg@200w_200h_90Q', '', '家缘黄豆脆孜然味102g', 0, '0', '102g', 3, 2.5, '103541', '103543', '膨化食品', '4858', 200, 33);
INSERT INTO `axf_goods` VALUES (724, '115567', 'http://img01.bqstatic.com/upload/goods/201/609/2915/20160929154542_267497.jpg@200w_200h_90Q', '乐事,大波浪,薯片,辛辣味', '乐事大波浪薯片辛辣味70g', 0, '0', '70g', 6.8, 6, '103541', '103543', '膨化食品', '4858', 200, 31);
INSERT INTO `axf_goods` VALUES (725, '117090', 'http://img01.bqstatic.com/upload/goods/201/611/1618/20161116182305_249135.jpg@200w_200h_90Q', '好丽友,派,清新,抹茶,本味', '好丽友派清新抹茶本味216g', 0, '0', '216g', 12, 13, '103541', '103544', '饼干糕点', '4858', 200, 30);
INSERT INTO `axf_goods` VALUES (726, '2395', 'http://img01.bqstatic.com/upload/goods/000/000/2395/0000002395_36550.jpg@200w_200h_90Q', '卡夫,太平梳打饼,芝麻味,休闲零食', '卡夫太平梳打饼芝麻100g', 0, '0', '100g', 4, 4, '103541', '103544', '饼干糕点', '4858', 200, 30);
INSERT INTO `axf_goods` VALUES (727, '2473', 'http://img01.bqstatic.com/upload/goods/000/000/2473/0000002473.jpg@200w_200h_90Q', '能量99棒,蛋黄,休闲零食', '北田能量99棒蛋黄味180g', 0, '0', '180g', 10, 10, '103541', '103547', '进口零食', '4858', 200, 29);
INSERT INTO `axf_goods` VALUES (728, '2414', 'http://img01.bqstatic.com/upload/goods/000/000/2414/0000002414.jpg@200w_200h_90Q', '薯愿薯片,香焗番茄味,休闲零食', '薯愿薯片香焗番茄味104g', 0, '0', '104g', 9, 9, '103541', '103543', '膨化食品', '4858', 200, 29);
INSERT INTO `axf_goods` VALUES (729, '6026', 'http://img01.bqstatic.com/upload/goods/000/000/6026/0000006026_22390.jpg@200w_200h_90Q', '旺旺,挑豆,休闲零食,闪送超市,', '旺旺挑豆50.0g', 0, '0', '50g', 3, 2.5, '103541', '103542', '坚果炒货', '4858', 200, 29);
INSERT INTO `axf_goods` VALUES (730, '10244', 'http://img01.bqstatic.com/upload/goods/000/001/0244/0000010244.jpg@200w_200h_90Q', '', '康师傅3+2苏打夹心香草巧克力味125.0g', 0, '0', '125g', 5.5, 5, '103541', '103544', '饼干糕点', '4858', 200, 27);
INSERT INTO `axf_goods` VALUES (731, '6089', 'http://img01.bqstatic.com/upload/goods/000/000/6089/0000006089.jpg@200w_200h_90Q', '康师傅,妙芙,香芋,牛奶味,糕点,休闲零食,闪送超市,', '康师傅妙芙香芋牛奶味96g', 0, '0', '96g', 6, 7, '103541', '103544', '饼干糕点', '4858', 200, 27);
INSERT INTO `axf_goods` VALUES (732, '5311', 'http://img01.bqstatic.com/upload/goods/000/000/5311/0000005311.jpg@200w_200h_90Q', '好丽友,好友趣,多汁,牛排味,薯片,休闲零食,闪送超市,', '好丽友好友趣多汁牛排味45g', 0, '0', '45g', 4, 4, '103541', '103543', '膨化食品', '4858', 200, 27);
INSERT INTO `axf_goods` VALUES (733, '4574', 'http://img01.bqstatic.com/upload/goods/000/000/4574/0000004574.jpg@200w_200h_90Q', '洽洽,香瓜子,休闲零食,干果炒货', '洽洽香瓜子110g', 0, '0', '110g', 5, 5, '103541', '103542', '坚果炒货', '4858', 200, 27);
INSERT INTO `axf_goods` VALUES (734, '4041', 'http://img01.bqstatic.com/upload/goods/000/000/4041/0000004041.jpg@200w_200h_90Q', '怡达,果丹皮,休闲零食,零食小吃', '怡达果丹皮150.0g', 0, '0', '150g', 8, 8, '103541', '103546', '肉干蜜饯', '4858', 200, 27);
INSERT INTO `axf_goods` VALUES (735, '101256', 'http://img01.bqstatic.com/upload/goods/201/602/2414/20160224142258_193211.jpg@200w_200h_90Q', '乐事,大波浪薯片,香脆烤鸡翅味,休闲零食', '乐事大波浪薯片香脆烤鸡翅味40g', 0, '0', '40g', 4.5, 4.5, '103541', '103543', '膨化食品', '4858', 200, 26);
INSERT INTO `axf_goods` VALUES (736, '2227', 'http://img01.bqstatic.com/upload/goods/000/000/2227/0000002227.jpg@200w_200h_90Q', '好丽友,可可派,6枚,休闲零食', '好丽友可可派6枚180g', 0, '0', '180g', 12, 12, '103541', '103544', '饼干糕点', '4858', 200, 25);
INSERT INTO `axf_goods` VALUES (737, '5927', 'http://img01.bqstatic.com/upload/goods/000/000/5927/0000005927_99730.jpg@200w_200h_90Q', '新家园,烤馍,锅巴,奶油味,饼干,闪送超市,', '新家园烤馍锅巴奶油味63.0g', 0, '0', '63g', 2, 2, '103541', '103543', '膨化食品', '4858', 200, 25);
INSERT INTO `axf_goods` VALUES (738, '3718', 'http://img01.bqstatic.com/upload/goods/000/000/3718/0000003718.jpg@200w_200h_90Q', '', '同享九制话梅125g', 0, '0', '125g', 7, 7, '103541', '103546', '肉干蜜饯', '4858', 200, 25);
INSERT INTO `axf_goods` VALUES (739, '7017', 'http://img01.bqstatic.com/upload/goods/000/000/7017/0000007017.jpg@200w_200h_90Q', '', '怡冠园红烧辣面条120.0g', 0, '0', '120g', 3.6, 3.5, '103541', '103546', '肉干蜜饯', '4858', 200, 25);
INSERT INTO `axf_goods` VALUES (740, '8574', 'http://img01.bqstatic.com/upload/goods/000/000/8574/0000008574.jpg@200w_200h_90Q', '', '奥利奥草莓夹心130g', 0, '0', '130g', 6.5, 6.5, '103541', '103544', '饼干糕点', '4858', 200, 22);
INSERT INTO `axf_goods` VALUES (741, '4247', 'http://img01.bqstatic.com/upload/goods/000/000/4247/0000004247.jpg@200w_200h_90Q', '达利园,蛋黄派,休闲零食,饼干蛋糕', '达利园蛋黄派250.0g', 0, '0', '250g', 8.5, 9.5, '103541', '103544', '饼干糕点', '4858', 200, 22);
INSERT INTO `axf_goods` VALUES (742, '5250', 'http://img01.bqstatic.com/upload/goods/000/000/5250/0000005250.jpg@200w_200h_90Q', '乐事,黑椒,牛扒味,桶装,薯片,休闲零食,闪送超市,', '乐事黑椒牛扒味桶装104.0g', 0, '0', '104g', 9, 9, '103541', '103543', '膨化食品', '4858', 200, 22);
INSERT INTO `axf_goods` VALUES (743, '100394', 'http://img01.bqstatic.com/upload/goods/201/601/2917/20160129175709_722657.jpg@200w_200h_90Q', '好丽友,薯愿,蜂蜜牛奶味,休闲零食,零食小吃', '好丽友薯愿蜂蜜牛奶味104g', 0, '0', '104g', 9, 9, '103541', '103543', '膨化食品', '4858', 200, 22);
INSERT INTO `axf_goods` VALUES (744, '3984', 'http://img01.bqstatic.com/upload/goods/000/000/3984/0000003984.jpg@200w_200h_90Q', '好丽友,好多鱼,脆香,烧烤味,零食,小吃', '好丽友脆香烧烤味好多鱼33g', 0, '0', '33g', 5, 4, '103541', '103544', '饼干糕点', '4858', 200, 21);
INSERT INTO `axf_goods` VALUES (745, '4638', 'http://img01.bqstatic.com/upload/goods/000/000/4638/0000004638.jpg@200w_200h_90Q', '徐福记,凤梨酥,休闲零食,饼干蛋糕', '徐福记凤梨酥182.0g', 0, '0', '182g', 10, 10, '103541', '103544', '饼干糕点', '4858', 200, 21);
INSERT INTO `axf_goods` VALUES (746, '12920', 'http://img01.bqstatic.com/upload/goods/201/607/1216/20160712165650_709702.jpg@200w_200h_90Q', '咪咪世界正宗马来西亚风味虾味条', '咪咪世界正宗马来西亚风味虾味条82g', 0, '0', '82g', 3, 3, '103541', '103544', '饼干糕点', '4858', 200, 21);
INSERT INTO `axf_goods` VALUES (747, '5285', 'http://img01.bqstatic.com/upload/goods/000/000/5285/0000005285_42920.jpg@200w_200h_90Q', '乖媳妇,野山椒,土鸡爪,休闲零食,闪送超市,', '乖媳妇野山椒土鸡爪238.0g', 0, '0', '238g', 14, 10, '103541', '103546', '肉干蜜饯', '4858', 200, 21);
INSERT INTO `axf_goods` VALUES (748, '99957', 'http://img01.bqstatic.com/upload/goods/000/000/9524/0000009524.jpg@200w_200h_90Q', '多力多滋,玉米片,烧烤味,零食', '多力多滋烟熏烧烤味玉米片65g', 0, '0', '65g', 10, 9, '103541', '103547', '进口零食', '4858', 200, 20);
INSERT INTO `axf_goods` VALUES (749, '3581', 'http://img01.bqstatic.com/upload/goods/000/000/3581/0000003581_44960.jpg@200w_200h_90Q', '百醇,提拉米苏味,休闲零食', '百醇提拉米苏味48.0g', 0, '0', '48g', 6.5, 6.5, '103541', '103544', '饼干糕点', '4858', 200, 20);
INSERT INTO `axf_goods` VALUES (750, '12186', 'http://img01.bqstatic.com/upload/goods/201/604/0716/20160407161741_978226.jpg@200w_200h_90Q', '鲜引力,柠檬片,休闲零', '鲜引力即食柠檬片16g', 0, '0', '16g', 3, 3, '103541', '103546', '肉干蜜饯', '4858', 200, 20);
INSERT INTO `axf_goods` VALUES (751, '4788', 'http://img01.bqstatic.com/upload/goods/000/000/4788/0000004788.jpg@200w_200h_90Q', '', '好丽友Q蒂蛋糕摩卡巧克力味56g', 0, '0', '56g', 5, 5, '103541', '103544', '饼干糕点', '4858', 200, 19);
INSERT INTO `axf_goods` VALUES (752, '5647', 'http://img01.bqstatic.com/upload/goods/000/000/5647/0000005647.jpg@200w_200h_90Q', '伍子醉,槟榔,休闲零食,闪送超市,', '伍子醉槟榔25.0g', 0, '0', '25g', 5, 5, '103541', '103546', '肉干蜜饯', '4858', 200, 19);
INSERT INTO `axf_goods` VALUES (753, '4270', 'http://img01.bqstatic.com/upload/goods/000/000/4270/0000004270.jpg@200w_200h_90Q', '阿尔卑斯,棒棒糖,牛奶味,休闲零食,零食小吃', '阿尔卑斯棒棒糖牛奶味10g', 0, '0', '10g', 0.5, 0.5, '103541', '103545', '糖果巧克力', '4858', 200, 19);
INSERT INTO `axf_goods` VALUES (754, '3572', 'http://img01.bqstatic.com/upload/goods/000/000/3572/0000003572_20420.jpg@200w_200h_90Q', '百醇,草莓,香草味,休闲零食', '百醇草莓香草味48g', 0, '0', '48g', 6.8, 6.5, '103541', '103544', '饼干糕点', '4858', 200, 18);
INSERT INTO `axf_goods` VALUES (755, '3663', 'http://img01.bqstatic.com/upload/goods/000/000/3663/0000003663.jpg@200w_200h_90Q', '', '好丽友鲜香海苔味好多鱼33g', 0, '0', '33g', 5, 5, '103541', '103544', '饼干糕点', '4858', 200, 18);
INSERT INTO `axf_goods` VALUES (756, '63092', 'http://img01.bqstatic.com/upload/goods/000/006/3092/0000063092_62630.jpg@200w_200h_90Q', '邬辣妈,素羊肉串', '邬辣妈素羊肉串90.0g', 0, '0', '90g', 3.6, 5, '103541', '103546', '肉干蜜饯', '4858', 200, 18);
INSERT INTO `axf_goods` VALUES (757, '4048', 'http://img01.bqstatic.com/upload/goods/000/000/4048/0000004048_23700.jpg@200w_200h_90Q', '怡达,山楂酪,休闲零食,零食小吃', '怡达山楂酪200.0g', 0, '0', '200g', 10, 10, '103541', '103546', '肉干蜜饯', '4858', 200, 17);
INSERT INTO `axf_goods` VALUES (758, '8264', 'http://img01.bqstatic.com/upload/goods/000/000/8264/0000008264.jpg@200w_200h_90Q', '', '乖媳妇风味豆干五香味80.0g', 0, '0', '80g', 4, 4, '103541', '103546', '肉干蜜饯', '4858', 200, 17);
INSERT INTO `axf_goods` VALUES (759, '3969', 'http://img01.bqstatic.com/upload/goods/000/000/3969/0000003969.jpg@200w_200h_90Q', '', '格力高百奇抹茶味50g', 0, '0', '48g', 6.5, 6, '103541', '103544', '饼干糕点', '4858', 200, 16);
INSERT INTO `axf_goods` VALUES (760, '8646', 'http://img01.bqstatic.com/upload/goods/000/000/8646/0000008646.jpg@200w_200h_90Q', '', '乖乖脆果草莓炼乳味70.0g', 0, '0', '70g', 4.8, 4.8, '103541', '103543', '膨化食品', '4858', 200, 16);
INSERT INTO `axf_goods` VALUES (761, '11949', 'http://img01.bqstatic.com/upload/goods/000/001/1949/0000011949_85700.jpg@200w_200h_90Q', '', '乐吧薯片泡菜味50g', 0, '0', '50g', 2, 2.5, '103541', '103543', '膨化食品', '4858', 200, 16);
INSERT INTO `axf_goods` VALUES (762, '113616', 'http://img01.bqstatic.com/upload/goods/201/609/1418/20160914181725_727527.jpg@200w_200h_90Q', '啪啪通烤番茄味虾片', '啪啪通烤番茄味虾片85g', 0, '0', '85g', 16.8, 16.8, '103541', '103547', '进口零食', '4858', 200, 15);
INSERT INTO `axf_goods` VALUES (763, '100981', 'http://img01.bqstatic.com/upload/goods/000/001/7044/0000017044_88590.jpg@200w_200h_90Q', '小老板香脆紫菜经典原味袋装', '小老板经典原味香脆紫菜36g', 0, '0', '36g', 9.5, 9.5, '103541', '103547', '进口零食', '4858', 200, 15);
INSERT INTO `axf_goods` VALUES (764, '7913', 'http://img01.bqstatic.com/upload/goods/000/000/7913/0000007913.jpg@200w_200h_90Q', '', '好丽友蛋黄派2枚46g', 0, '0', '46g', 4, 4, '103541', '103544', '饼干糕点', '4858', 200, 15);
INSERT INTO `axf_goods` VALUES (765, '4248', 'http://img01.bqstatic.com/upload/goods/000/000/4248/0000004248.jpg@200w_200h_90Q', '达利园,草莓派,休闲零食,饼干蛋糕', '达利园草莓派250.0g', 0, '0', '250g', 7, 8, '103541', '103544', '饼干糕点', '4858', 200, 15);
INSERT INTO `axf_goods` VALUES (766, '101087', 'http://img01.bqstatic.com/upload/goods/201/602/2315/20160223153617_075939.jpg@200w_200h_90Q', '好丽友,呀土豆,蜂蜜黄油味', '好丽友呀土豆蜂蜜黄油味40g', 0, '0', '40g', 4, 4, '103541', '103543', '膨化食品', '4858', 200, 15);
INSERT INTO `axf_goods` VALUES (767, '6324', 'http://img01.bqstatic.com/upload/goods/000/000/6324/0000006324.jpg@200w_200h_90Q', '乖媳妇,风味,豆干,麻辣味,休闲零食,闪送超市,', '乖媳妇风味豆干麻辣味80.0g', 0, '0', '80g', 3, 2.5, '103541', '103546', '肉干蜜饯', '4858', 200, 15);
INSERT INTO `axf_goods` VALUES (768, '63065', 'http://img01.bqstatic.com/upload/goods/000/006/3065/0000063065_77170.jpg@200w_200h_90Q', '邬辣妈,蒜蓉,素牛排', '邬辣妈蒜蓉素牛排110.0g', 0, '0', '110g', 4, 3, '103541', '103546', '肉干蜜饯', '4858', 200, 15);
INSERT INTO `axf_goods` VALUES (769, '7912', 'http://img01.bqstatic.com/upload/goods/000/000/7912/0000007912.jpg@200w_200h_90Q', '', '好丽友Q蒂榛子巧克力味6枚168.0g', 0, '0', '168g', 12, 12, '103541', '103544', '饼干糕点', '4858', 200, 14);
INSERT INTO `axf_goods` VALUES (770, '3662', 'http://img01.bqstatic.com/upload/goods/000/000/3662/0000003662.jpg@200w_200h_90Q', '好丽友,蘑古力,红豆,巧克力', '好丽友蘑古力红豆巧克力味48g', 0, '0', '48g', 4.5, 4.5, '103541', '103544', '饼干糕点', '4858', 200, 14);
INSERT INTO `axf_goods` VALUES (771, '94168', 'http://img01.bqstatic.com/upload/goods/201/612/2215/20161222150029_741582.jpg@200w_200h_90Q', '益达,无糖,口香糖,清爽,西瓜味', '益达无糖口香糖清爽西瓜味56g', 0, '0', '56g', 10, 10, '103541', '103545', '糖果巧克力', '4858', 200, 14);
INSERT INTO `axf_goods` VALUES (772, '4271', 'http://img01.bqstatic.com/upload/goods/000/000/4271/0000004271.jpg@200w_200h_90Q', '阿尔卑斯,棒棒糖,香蕉,牛奶味,休闲零食,零食小吃', '阿尔卑斯棒棒糖香蕉牛奶味10.5g', 0, '0', '10.5g', 0.5, 0.5, '103541', '103545', '糖果巧克力', '4858', 200, 14);
INSERT INTO `axf_goods` VALUES (773, '113618', 'http://img01.bqstatic.com/upload/goods/201/609/1316/20160913164625_570519.jpg@200w_200h_90Q', '啪啪通切达奶酪味虾片', '啪啪通切达奶酪味虾片85g', 0, '0', '85g', 16.8, 16.8, '103541', '103547', '进口零食', '4858', 200, 13);
INSERT INTO `axf_goods` VALUES (774, '113617', 'http://img01.bqstatic.com/upload/goods/201/609/1316/20160913164543_996466.jpg@200w_200h_90Q', '啪啪通咖喱鸡味虾片', '啪啪通咖喱鸡味虾片85g', 0, '0', '85g', 15.8, 16.8, '103541', '103547', '进口零食', '4858', 200, 13);
INSERT INTO `axf_goods` VALUES (775, '4221', 'http://img01.bqstatic.com/upload/goods/000/000/4221/0000004221.jpg@200w_200h_90Q', '好丽友,蘑古力,榛子,巧克力味,休闲零食,零食小吃', '好丽友蘑古力榛子巧克力味48g', 0, '0', '48g', 5, 5, '103541', '103544', '饼干糕点', '4858', 200, 13);
INSERT INTO `axf_goods` VALUES (776, '100065', 'http://img01.bqstatic.com/upload/goods/000/000/5935/0000005935_79670.jpg@200w_200h_90Q', '乐事,德克萨斯,烧烤味,薯片,休闲零食,闪送超市,', '乐事得克萨斯烧烤味45g', 0, '0', '45g', 4.5, 4.5, '103541', '103543', '膨化食品', '4858', 200, 13);
INSERT INTO `axf_goods` VALUES (777, '5325', 'http://img01.bqstatic.com/upload/goods/000/000/5325/0000005325.jpg@200w_200h_90Q', '可比克,烧烤味,薯片,休闲零食,闪送超市', '可比克烧烤味60.0g', 0, '0', '60g', 4, 4, '103541', '103543', '膨化食品', '4858', 200, 13);
INSERT INTO `axf_goods` VALUES (778, '11944', 'http://img01.bqstatic.com/upload/goods/000/001/1944/0000011944_69810.jpg@200w_200h_90Q', '', '乐吧薯片番茄味50g', 0, '0', '50g', 2, 2.5, '103541', '103543', '膨化食品', '4858', 200, 13);
INSERT INTO `axf_goods` VALUES (779, '3592', 'http://img01.bqstatic.com/upload/goods/000/000/3592/0000003592_92750.jpg@200w_200h_90Q', '百力滋,微辣,比萨味,休闲零食', '百力滋微辣比萨味65.0g', 0, '0', '65g', 5, 4.5, '103541', '103544', '饼干糕点', '4858', 200, 12);
INSERT INTO `axf_goods` VALUES (780, '115524', 'http://img01.bqstatic.com/upload/goods/201/609/2814/20160928145459_626270.jpg@200w_200h_90Q', '好丽友多汁牛排味好友趣', '好丽友多汁牛排味好友趣75g', 0, '0', '75g', 6, 7.5, '103541', '103543', '膨化食品', '4858', 200, 12);
INSERT INTO `axf_goods` VALUES (781, '62913', 'http://img01.bqstatic.com/upload/goods/000/006/2913/0000062913_46030.jpg@200w_200h_90Q', '好丽友,薯愿,清新,番茄味,薯片,闪送超市,休闲零食,', '薯愿清新番茄味104.0g', 0, '0', '104g', 9, 8, '103541', '103543', '膨化食品', '4858', 200, 12);
INSERT INTO `axf_goods` VALUES (782, '6038', 'http://img01.bqstatic.com/upload/goods/000/000/6038/0000006038.jpg@200w_200h_90Q', '泡吧,小脆,芥末味,休闲零食,闪送超市,', '泡吧小脆芥末味50.0g', 0, '0', '50g', 3, 3, '103541', '103543', '膨化食品', '4858', 200, 12);
INSERT INTO `axf_goods` VALUES (783, '11943', 'http://img01.bqstatic.com/upload/goods/000/001/1943/0000011943_44390.jpg@200w_200h_90Q', '', '乐吧薯片鸡肉味50g', 0, '0', '50g', 2, 2.5, '103541', '103543', '膨化食品', '4858', 200, 12);
INSERT INTO `axf_goods` VALUES (784, '63090', 'http://img01.bqstatic.com/upload/goods/000/006/3090/0000063090_93990.jpg@200w_200h_90Q', '邬辣妈,酒鬼鱼,香辣味', '邬辣妈酒鬼鱼香辣味45.0g', 0, '0', '45g', 4, 5, '103541', '103546', '肉干蜜饯', '4858', 200, 12);
INSERT INTO `axf_goods` VALUES (785, '5680', 'http://img01.bqstatic.com/upload/goods/000/000/5680/0000005680.jpg@200w_200h_90Q', '达利园,好吃点,核桃,酥饼,饼干,闪送超市,', '达利园好吃点核桃酥饼146.0g', 0, '0', '146g', 5, 5, '103541', '103544', '饼干糕点', '4858', 200, 11);
INSERT INTO `axf_goods` VALUES (786, '5937', 'http://img01.bqstatic.com/upload/goods/000/000/5937/0000005937_76580.jpg@200w_200h_90Q', '好丽友,好有趣,原味,休闲零食,闪送超市,', '好丽友好友趣原味45.0g', 0, '0', '45g', 4, 4, '103541', '103543', '膨化食品', '4858', 200, 11);
INSERT INTO `axf_goods` VALUES (787, '111507', 'http://img01.bqstatic.com/upload/goods/201/607/1518/20160715181343_539262.jpg@200w_200h_90Q', '乐事,清爽,酸奶味,薯片', '乐事清爽酸奶味70g', 0, '0', '70g', 7, 6, '103541', '103543', '膨化食品', '4858', 200, 10);
INSERT INTO `axf_goods` VALUES (788, '11945', 'http://img01.bqstatic.com/upload/goods/000/001/1945/0000011945_50340.jpg@200w_200h_90Q', '', '乐吧薯片海苔味50.0g', 0, '0', '50g', 2, 2.5, '103541', '103543', '膨化食品', '4858', 200, 10);
INSERT INTO `axf_goods` VALUES (789, '3591', 'http://img01.bqstatic.com/upload/goods/000/000/3591/0000003591_57910.jpg@200w_200h_90Q', '百力滋,蓝莓,芝士味,休闲零食', '百力滋蓝莓芝士味45.0g', 0, '0', '45g', 6, 4.5, '103541', '103544', '饼干糕点', '4858', 200, 9);
INSERT INTO `axf_goods` VALUES (790, '3983', 'http://img01.bqstatic.com/upload/goods/000/000/3983/0000003983.jpg@200w_200h_90Q', '好丽友,好多鱼,蜜香鸡翅味,休闲零食,零食小吃', '好丽友好多鱼蜜香鸡翅味33.0g', 0, '0', '33g', 5, 4, '103541', '103544', '饼干糕点', '4858', 200, 9);
INSERT INTO `axf_goods` VALUES (791, '7875', 'http://img01.bqstatic.com/upload/goods/000/000/7875/0000007875.jpg@200w_200h_90Q', '', '好丽友蛋黄派12枚276.0g', 0, '0', '276g', 21, 20, '103541', '103544', '饼干糕点', '4858', 200, 9);
INSERT INTO `axf_goods` VALUES (792, '8571', 'http://img01.bqstatic.com/upload/goods/000/000/8571/0000008571.jpg@200w_200h_90Q', '', '康师傅3+2苏打夹心饼干蓝莓味125.0g', 0, '0', '125g', 6, 6, '103541', '103544', '饼干糕点', '4858', 200, 8);
INSERT INTO `axf_goods` VALUES (793, '5679', 'http://img01.bqstatic.com/upload/goods/000/000/5679/0000005679.jpg@200w_200h_90Q', '达利园,好吃点,榛仁,酥饼,饼干,闪送超市,', '达利园好吃点榛仁酥饼146.0g', 0, '0', '146g', 6, 5, '103541', '103544', '饼干糕点', '4858', 200, 8);
INSERT INTO `axf_goods` VALUES (794, '8616', 'http://img01.bqstatic.com/upload/goods/000/000/8616/0000008616.jpg@200w_200h_90Q', '', '达利园法式软面包香奶味360.0g', 0, '0', '360g', 12.5, 12.5, '103541', '103544', '饼干糕点', '4858', 200, 8);
INSERT INTO `axf_goods` VALUES (795, '8558', 'http://img01.bqstatic.com/upload/goods/000/000/8558/0000008558.jpg@200w_200h_90Q', '', '上好佳田园薯片烤肉口味50.0g', 0, '0', '50g', 4.5, 4.5, '103541', '103543', '膨化食品', '4858', 200, 8);
INSERT INTO `axf_goods` VALUES (796, '110403', 'http://img01.bqstatic.com/upload/goods/201/606/2013/20160620131906_159241.jpg@200w_200h_90Q', '好丽友,呀土豆,清新芒果味', '好丽友呀土豆清新芒果味70g', 0, '0', '70g', 6, 6, '103541', '103543', '膨化食品', '4858', 200, 8);
INSERT INTO `axf_goods` VALUES (797, '9136', 'http://img01.bqstatic.com/upload/goods/000/000/9136/0000009136.jpg@200w_200h_90Q', '', '好丽友薯片加勒比烤翅味45.0g', 0, '0', '45g', 4.5, 4.5, '103541', '103543', '膨化食品', '4858', 200, 8);
INSERT INTO `axf_goods` VALUES (798, '8265', 'http://img01.bqstatic.com/upload/goods/000/000/8265/0000008265.jpg@200w_200h_90Q', '', '乖媳妇风味豆干山椒味80.0g', 0, '0', '80g', 4, 4, '103541', '103546', '肉干蜜饯', '4858', 200, 8);
INSERT INTO `axf_goods` VALUES (799, '2471', 'http://img01.bqstatic.com/upload/goods/000/000/2471/0000002471.jpg@200w_200h_90Q', '', '能量99棒花生巧克力180.0g', 0, '0', '180g', 8, 8, '103541', '103547', '进口零食', '4858', 200, 7);
INSERT INTO `axf_goods` VALUES (800, '2472', 'http://img01.bqstatic.com/upload/goods/000/000/2472/0000002472.jpg@200w_200h_90Q', '能量99棒,香芋,休闲零食', '能量99棒香芋180.0g', 0, '0', '180g', 8, 8, '103541', '103547', '进口零食', '4858', 200, 7);
INSERT INTO `axf_goods` VALUES (801, '6008', 'http://img01.bqstatic.com/upload/goods/000/000/6008/0000006008.jpg@200w_200h_90Q', '达利园,好吃点,杏仁,酥饼,饼干,闪送超市,', '达利园好吃点杏仁酥饼146.0g', 0, '0', '146g', 6, 5, '103541', '103544', '饼干糕点', '4858', 200, 7);
INSERT INTO `axf_goods` VALUES (802, '8266', 'http://img01.bqstatic.com/upload/goods/000/000/8266/0000008266.jpg@200w_200h_90Q', '', '乖媳妇风味豆干泡椒味80.0g', 0, '0', '80g', 4, 4, '103541', '103546', '肉干蜜饯', '4858', 200, 7);
INSERT INTO `axf_goods` VALUES (803, '3595', 'http://img01.bqstatic.com/upload/goods/000/000/3595/0000003595_19780.jpg@200w_200h_90Q', '百力滋,草莓,牛奶味,休闲零食', '百力滋草莓牛奶味45.0g', 0, '0', '45g', 5, 4.5, '103541', '103544', '饼干糕点', '4858', 200, 6);
INSERT INTO `axf_goods` VALUES (804, '7874', 'http://img01.bqstatic.com/upload/goods/000/000/7874/0000007874.jpg@200w_200h_90Q', '', '好丽友Q蒂摩卡巧克力味12枚336.0g', 0, '0', '336g', 22, 22, '103541', '103544', '饼干糕点', '4858', 200, 6);
INSERT INTO `axf_goods` VALUES (805, '7872', 'http://img01.bqstatic.com/upload/goods/000/000/7872/0000007872.jpg@200w_200h_90Q', '', '好丽友Q蒂榛子巧克力味12枚336.0g', 0, '0', '336g', 22, 22, '103541', '103544', '饼干糕点', '4858', 200, 6);
INSERT INTO `axf_goods` VALUES (806, '118665', 'http://img01.bqstatic.com/upload/goods/201/701/0909/20170109095555_270487.jpg@200w_200h_90Q', '好丽友,巧克力,派', '好丽友巧克力派408g', 0, '0', '408g', 21, 22, '103541', '103544', '饼干糕点', '4858', 200, 6);
INSERT INTO `axf_goods` VALUES (807, '5674', 'http://img01.bqstatic.com/upload/goods/000/000/5674/0000005674.jpg@200w_200h_90Q', '达利园,好吃点,高纤,消化饼,饼干,闪送超市,', '达利园好吃点高纤消化饼168.0g', 0, '0', '168g', 5.5, 5.5, '103541', '103544', '饼干糕点', '4858', 200, 6);
INSERT INTO `axf_goods` VALUES (808, '111687', 'http://img01.bqstatic.com/upload/goods/201/607/1910/20160719105403_020772.jpg@200w_200h_90Q', '达利园,法式,软面包,香橙味', '达利园法式软面包香橙味360g', 0, '0', '360g', 12, 9, '103541', '103544', '饼干糕点', '4858', 200, 6);
INSERT INTO `axf_goods` VALUES (809, '3216', 'http://img01.bqstatic.com/upload/goods/000/000/3216/0000003216.jpg@200w_200h_90Q', '徐福记,凤梨酥,休闲零食', '徐福记凤梨酥184.0g', 0, '0', '184g', 10, 10, '103541', '103544', '饼干糕点', '4858', 200, 6);
INSERT INTO `axf_goods` VALUES (810, '63095', 'http://img01.bqstatic.com/upload/goods/000/006/3095/0000063095_57820.jpg@200w_200h_90Q', '邬辣妈,素牛肉丸', '邬辣妈素牛肉丸85.0g', 0, '0', '85g', 3.6, 5, '103541', '103546', '肉干蜜饯', '4858', 200, 6);
INSERT INTO `axf_goods` VALUES (811, '117670', 'http://img01.bqstatic.com/upload/goods/201/612/0217/20161202171149_405732.jpg@200w_200h_90Q', '流口水,酸奶棒,糖', '流口水酸奶棒糖380g', 0, '0', '380g', 10, 9, '103541', '103545', '糖果巧克力', '4858', 200, 6);
INSERT INTO `axf_goods` VALUES (812, '114087', 'http://img01.bqstatic.com/upload/goods/201/608/3017/20160830175528_450339.jpg@200w_200h_90Q', '格力高,百醇,柠檬挞味', '格力高百醇柠檬挞味48g', 0, '0', '48g', 6.5, 6, '103541', '103544', '饼干糕点', '4858', 200, 5);
INSERT INTO `axf_goods` VALUES (813, '3589', 'http://img01.bqstatic.com/upload/goods/000/000/3589/0000003589_11980.jpg@200w_200h_90Q', '百力滋,微辣,虾味,休闲零食', '百力滋微辣虾味65.0g', 0, '0', '65g', 6, 4.5, '103541', '103544', '饼干糕点', '4858', 200, 5);
INSERT INTO `axf_goods` VALUES (814, '3594', 'http://img01.bqstatic.com/upload/goods/000/000/3594/0000003594_93440.jpg@200w_200h_90Q', '百力滋,抹茶,香草味,休闲零食', '百力滋抹茶香草味45.0g', 0, '0', '45g', 5, 4.5, '103541', '103544', '饼干糕点', '4858', 200, 5);
INSERT INTO `axf_goods` VALUES (815, '3587', 'http://img01.bqstatic.com/upload/goods/000/000/3587/0000003587_30690.jpg@200w_200h_90Q', '百奇,蜜桃味,休闲零食', '百奇蜜桃味55.0g', 0, '0', '55g', 6, 6, '103541', '103544', '饼干糕点', '4858', 200, 5);
INSERT INTO `axf_goods` VALUES (816, '116419', 'http://img01.bqstatic.com/upload/goods/000/000/6423/0000006423.jpg@200w_200h_90Q', '蔓越莓,西饼,饼,小吃,甜品,西饼,巴拿米', '巴拿米蔓越莓西饼170g', 0, '0', '170g', 12, 12, '103541', '103544', '饼干糕点', '4858', 200, 5);
INSERT INTO `axf_goods` VALUES (817, '7880', 'http://img01.bqstatic.com/upload/goods/000/000/7880/0000007880.jpg@200w_200h_90Q', '', '好丽友提拉米苏12枚276.0g', 0, '0', '276g', 22, 20, '103541', '103544', '饼干糕点', '4858', 200, 5);
INSERT INTO `axf_goods` VALUES (818, '8614', 'http://img01.bqstatic.com/upload/goods/000/000/8614/0000008614.jpg@200w_200h_90Q', '达利园,法式,软面包,香奶味', '达利园法式软面包香奶味160.0g', 0, '0', '160g', 6, 6, '103541', '103544', '饼干糕点', '4858', 200, 5);
INSERT INTO `axf_goods` VALUES (819, '5318', 'http://img01.bqstatic.com/upload/goods/000/000/5318/0000005318.jpg@200w_200h_90Q', '可比克,番茄味,薯片,休闲零食,闪送超市', '可比克番茄味60.0g', 0, '0', '60g', 4, 4, '103541', '103543', '膨化食品', '4858', 200, 5);
INSERT INTO `axf_goods` VALUES (820, '6037', 'http://img01.bqstatic.com/upload/goods/000/000/6037/0000006037.jpg@200w_200h_90Q', '泡吧,小脆,番茄味,休闲零食,闪送超市,', '泡吧小脆番茄味50.0g', 0, '0', '50g', 3, 3, '103541', '103543', '膨化食品', '4858', 200, 5);
INSERT INTO `axf_goods` VALUES (821, '11946', 'http://img01.bqstatic.com/upload/goods/000/001/1946/0000011946_58080.jpg@200w_200h_90Q', '', '乐吧薯片洋香葱味50.0g', 0, '0', '50g', 2, 2.5, '103541', '103543', '膨化食品', '4858', 200, 5);
INSERT INTO `axf_goods` VALUES (822, '90440', 'http://img01.bqstatic.com/upload/goods/201/603/2616/20160326161613_846034.jpg@200w_200h_90Q', '洽洽喀吱脆珍品原味', '洽洽喀吱脆珍品原味45g', 0, '1', '45g', 4.2, 4.2, '103541', '103544', '饼干糕点', '4858', 200, 4);
INSERT INTO `axf_goods` VALUES (823, '114085', 'http://img01.bqstatic.com/upload/goods/201/608/3017/20160830174317_617743.jpg@200w_200h_90Q', '格力高,百奇,超细,草莓味,饼干', '格力高百奇超细草莓味饼干55g', 0, '0', '55g', 6.5, 7, '103541', '103544', '饼干糕点', '4858', 200, 4);
INSERT INTO `axf_goods` VALUES (824, '6277', 'http://img01.bqstatic.com/upload/goods/000/000/6277/0000006277.jpg@200w_200h_90Q', '奥利奥,抹茶味,饼干,休闲零食,闪送超市,', '奥利奥抹茶味106.0g', 0, '0', '106g', 6.5, 5.7, '103541', '103544', '饼干糕点', '4858', 200, 4);
INSERT INTO `axf_goods` VALUES (825, '9124', 'http://img01.bqstatic.com/upload/goods/000/000/9124/0000009124.jpg@200w_200h_90Q', '', '奥利奥金装香草慕斯味饼干106.0g', 0, '0', '106g', 7, 7, '103541', '103544', '饼干糕点', '4858', 200, 4);
INSERT INTO `axf_goods` VALUES (826, '7896', 'http://img01.bqstatic.com/upload/goods/000/000/7896/0000007896.jpg@200w_200h_90Q', '', '好丽友呀土豆香焗原味70g', 0, '0', '70g', 6, 6, '103541', '103543', '膨化食品', '4858', 200, 4);
INSERT INTO `axf_goods` VALUES (827, '114527', 'http://img01.bqstatic.com/upload/goods/201/609/1214/20160912144434_042321.jpg@200w_200h_90Q', '好丽友,薯愿,沁翠沙拉味,薯片', '好丽友薯愿沁翠沙拉味薯片104g', 0, '0', '104g', 9, 9, '103541', '103543', '膨化食品', '4858', 200, 4);
INSERT INTO `axf_goods` VALUES (828, '2413', 'http://img01.bqstatic.com/upload/goods/000/000/2413/0000002413.jpg@200w_200h_90Q', '薯愿薯片,烤鸡沙拉味,休闲零食', '薯愿薯片烤鸡沙拉味104.0g', 0, '0', '104g', 9, 9, '103541', '103543', '膨化食品', '4858', 200, 4);
INSERT INTO `axf_goods` VALUES (829, '11950', 'http://img01.bqstatic.com/upload/goods/000/001/1950/0000011950_07840.jpg@200w_200h_90Q', '', '乐吧薯片烤牛排味50.0g', 0, '0', '50g', 2, 2.5, '103541', '103543', '膨化食品', '4858', 200, 4);
INSERT INTO `axf_goods` VALUES (830, '11947', 'http://img01.bqstatic.com/upload/goods/000/001/1947/0000011947_38410.jpg@200w_200h_90Q', '', '乐吧薯片芝士味50.0g', 0, '0', '50g', 2, 2.5, '103541', '103543', '膨化食品', '4858', 200, 4);
COMMIT;

-- ----------------------------
-- Table structure for axf_mainshow
-- ----------------------------
DROP TABLE IF EXISTS `axf_mainshow`;
CREATE TABLE `axf_mainshow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `trackid` varchar(16) NOT NULL,
  `categoryid` varchar(16) NOT NULL,
  `brandname` varchar(100) NOT NULL,
  `img1` varchar(200) NOT NULL,
  `childcid1` varchar(16) NOT NULL,
  `productid1` varchar(16) NOT NULL,
  `longname1` varchar(100) NOT NULL,
  `price1` double NOT NULL,
  `marketprice1` double NOT NULL,
  `img2` varchar(200) NOT NULL,
  `childcid2` varchar(16) NOT NULL,
  `productid2` varchar(16) NOT NULL,
  `longname2` varchar(100) NOT NULL,
  `price2` double NOT NULL,
  `marketprice2` double NOT NULL,
  `img3` varchar(200) NOT NULL,
  `childcid3` varchar(16) NOT NULL,
  `productid3` varchar(16) NOT NULL,
  `longname3` varchar(100) NOT NULL,
  `price3` double NOT NULL,
  `marketprice3` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of axf_mainshow
-- ----------------------------
BEGIN;
INSERT INTO `axf_mainshow` VALUES (1, 'http://img01.bqstatic.com//upload/activity/2017031018205492.jpg@90Q.jpg', '优选水果', '21782', '103532', '爱鲜蜂', 'http://img01.bqstatic.com/upload/goods/201/701/1916/20170119164159_996462.jpg@200w_200h_90Q', '103533', '118824', '爱鲜蜂·特小凤西瓜1.5-2.5kg/粒', 25.8, 25.8, 'http://img01.bqstatic.com/upload/goods/201/611/1617/20161116173544_219028.jpg@200w_200h_90Q', '103534', '116950', '蜂觅·越南直采红心火龙果350-450g/盒', 15.3, 15.8, 'http://img01.bqstatic.com/upload/goods/201/701/1916/20170119164119_550363.jpg@200w_200h_90Q', '103533', '118826', '爱鲜蜂·海南千禧果400-450g/盒', 9.9, 13.8);
INSERT INTO `axf_mainshow` VALUES (2, 'http://img01.bqstatic.com//upload/activity/2017031018205492.jpg@90Q.jpg', '牛奶面包', '21782', '103532', '爱鲜蜂', 'http://img01.bqstatic.com/upload/goods/201/701/1916/20170119164159_996462.jpg@200w_200h_90Q', '103533', '118824', '爱鲜蜂·特小凤西瓜1.5-2.5kg/粒', 25.8, 25.8, 'http://img01.bqstatic.com/upload/goods/201/611/1617/20161116173544_219028.jpg@200w_200h_90Q', '103534', '116950', '蜂觅·越南直采红心火龙果350-450g/盒', 15.3, 15.8, 'http://img01.bqstatic.com/upload/goods/201/701/1916/20170119164119_550363.jpg@200w_200h_90Q', '103533', '118826', '爱鲜蜂·海南千禧果400-450g/盒', 9.9, 13.8);
INSERT INTO `axf_mainshow` VALUES (3, 'http://img01.bqstatic.com//upload/activity/2017031018205492.jpg@90Q.jpg', '卤味熟食', '21782', '103532', '爱鲜蜂', 'http://img01.bqstatic.com/upload/goods/201/701/1916/20170119164159_996462.jpg@200w_200h_90Q', '103533', '118824', '爱鲜蜂·特小凤西瓜1.5-2.5kg/粒', 25.8, 25.8, 'http://img01.bqstatic.com/upload/goods/201/611/1617/20161116173544_219028.jpg@200w_200h_90Q', '103534', '116950', '蜂觅·越南直采红心火龙果350-450g/盒', 15.3, 15.8, 'http://img01.bqstatic.com/upload/goods/201/701/1916/20170119164119_550363.jpg@200w_200h_90Q', '103533', '118826', '爱鲜蜂·海南千禧果400-450g/盒', 9.9, 13.8);
INSERT INTO `axf_mainshow` VALUES (4, 'http://img01.bqstatic.com//upload/activity/2017031018205492.jpg@90Q.jpg', '饮料酒水', '21782', '103532', '爱鲜蜂', 'http://img01.bqstatic.com/upload/goods/201/701/1916/20170119164159_996462.jpg@200w_200h_90Q', '103533', '118824', '爱鲜蜂·特小凤西瓜1.5-2.5kg/粒', 25.8, 25.8, 'http://img01.bqstatic.com/upload/goods/201/611/1617/20161116173544_219028.jpg@200w_200h_90Q', '103534', '116950', '蜂觅·越南直采红心火龙果350-450g/盒', 15.3, 15.8, 'http://img01.bqstatic.com/upload/goods/201/701/1916/20170119164119_550363.jpg@200w_200h_90Q', '103533', '118826', '爱鲜蜂·海南千禧果400-450g/盒', 9.9, 13.8);
INSERT INTO `axf_mainshow` VALUES (5, 'http://img01.bqstatic.com//upload/activity/2017031018205492.jpg@90Q.jpg', '零食大趴', '21782', '103532', '爱鲜蜂', 'http://img01.bqstatic.com/upload/goods/201/701/1916/20170119164159_996462.jpg@200w_200h_90Q', '103533', '118824', '爱鲜蜂·特小凤西瓜1.5-2.5kg/粒', 25.8, 25.8, 'http://img01.bqstatic.com/upload/goods/201/611/1617/20161116173544_219028.jpg@200w_200h_90Q', '103534', '116950', '蜂觅·越南直采红心火龙果350-450g/盒', 15.3, 15.8, 'http://img01.bqstatic.com/upload/goods/201/701/1916/20170119164119_550363.jpg@200w_200h_90Q', '103533', '118826', '爱鲜蜂·海南千禧果400-450g/盒', 9.9, 13.8);
INSERT INTO `axf_mainshow` VALUES (6, 'http://img01.bqstatic.com//upload/activity/2017031018205492.jpg@90Q.jpg', '方便速食', '21782', '103532', '爱鲜蜂', 'http://img01.bqstatic.com/upload/goods/201/701/1916/20170119164159_996462.jpg@200w_200h_90Q', '103533', '118824', '爱鲜蜂·特小凤西瓜1.5-2.5kg/粒', 25.8, 25.8, 'http://img01.bqstatic.com/upload/goods/201/611/1617/20161116173544_219028.jpg@200w_200h_90Q', '103534', '116950', '蜂觅·越南直采红心火龙果350-450g/盒', 15.3, 15.8, 'http://img01.bqstatic.com/upload/goods/201/701/1916/20170119164119_550363.jpg@200w_200h_90Q', '103533', '118826', '爱鲜蜂·海南千禧果400-450g/盒', 9.9, 13.8);
COMMIT;

-- ----------------------------
-- Table structure for axf_mustbuy
-- ----------------------------
DROP TABLE IF EXISTS `axf_mustbuy`;
CREATE TABLE `axf_mustbuy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `trackid` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of axf_mustbuy
-- ----------------------------
BEGIN;
INSERT INTO `axf_mustbuy` VALUES (1, 'http://img01.bqstatic.com//upload/activity/2017031715194326.jpg@90Q.jpg', '酸奶女王', '21870');
INSERT INTO `axf_mustbuy` VALUES (2, 'http://img01.bqstatic.com//upload/activity/cms_118826_1489742316.jpg@90Q', '鲜果女王', '21861');
INSERT INTO `axf_mustbuy` VALUES (3, 'http://img01.bqstatic.com//upload/activity/2017031011044918.jpg@90Q.jpg', '麻辣女王', '21866');
INSERT INTO `axf_mustbuy` VALUES (4, 'http://img01.bqstatic.com//upload/activity/2017022318314545.jpg@90Q.jpg', '鲜货直供－果析', '21858');
COMMIT;

-- ----------------------------
-- Table structure for axf_nav
-- ----------------------------
DROP TABLE IF EXISTS `axf_nav`;
CREATE TABLE `axf_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `trackid` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of axf_nav
-- ----------------------------
BEGIN;
INSERT INTO `axf_nav` VALUES (1, 'http://img01.bqstatic.com//upload/activity/2017032016495169.png', '每日必抢', '21851');
INSERT INTO `axf_nav` VALUES (2, 'http://img01.bqstatic.com//upload/activity/2016121920130294.png', '每日签到', '21753');
INSERT INTO `axf_nav` VALUES (3, 'http://img01.bqstatic.com//upload/activity/2017010517013925.png', '鲜货直供', '21749');
INSERT INTO `axf_nav` VALUES (4, 'http://img01.bqstatic.com//upload/activity/2017031518404137.png', '鲜蜂力荐', '21854');
COMMIT;

-- ----------------------------
-- Table structure for axf_order
-- ----------------------------
DROP TABLE IF EXISTS `axf_order`;
CREATE TABLE `axf_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `o_num` varchar(64) NOT NULL,
  `o_status` int(11) NOT NULL,
  `o_create` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `axf_order_user_id_65d915f1_fk_axf_users_id` (`user_id`),
  CONSTRAINT `axf_order_user_id_65d915f1_fk_axf_users_id` FOREIGN KEY (`user_id`) REFERENCES `axf_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of axf_order
-- ----------------------------
BEGIN;
INSERT INTO `axf_order` VALUES (1, 'ca7746897961', 1, '2018-06-07 15:14:24.769789', 1);
INSERT INTO `axf_order` VALUES (2, 'ca8422295314', 0, '2018-06-08 00:46:55.133424', 1);
INSERT INTO `axf_order` VALUES (3, 'ca2784568855', 0, '2018-06-08 01:08:04.087038', 1);
COMMIT;

-- ----------------------------
-- Table structure for axf_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `axf_order_goods`;
CREATE TABLE `axf_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_num` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `axf_order_goods_goods_id_b77fcc9f_fk_axf_goods_id` (`goods_id`),
  KEY `axf_order_goods_order_id_f101af67_fk_axf_order_id` (`order_id`),
  CONSTRAINT `axf_order_goods_goods_id_b77fcc9f_fk_axf_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `axf_goods` (`id`),
  CONSTRAINT `axf_order_goods_order_id_f101af67_fk_axf_order_id` FOREIGN KEY (`order_id`) REFERENCES `axf_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of axf_order_goods
-- ----------------------------
BEGIN;
INSERT INTO `axf_order_goods` VALUES (1, 1, 496, 1);
INSERT INTO `axf_order_goods` VALUES (2, 1, 495, 1);
INSERT INTO `axf_order_goods` VALUES (3, 1, 531, 2);
INSERT INTO `axf_order_goods` VALUES (4, 1, 532, 2);
INSERT INTO `axf_order_goods` VALUES (5, 1, 533, 2);
INSERT INTO `axf_order_goods` VALUES (6, 1, 534, 2);
INSERT INTO `axf_order_goods` VALUES (7, 1, 2, 2);
INSERT INTO `axf_order_goods` VALUES (8, 1, 75, 2);
INSERT INTO `axf_order_goods` VALUES (9, 1, 74, 2);
INSERT INTO `axf_order_goods` VALUES (10, 1, 387, 2);
COMMIT;

-- ----------------------------
-- Table structure for axf_shop
-- ----------------------------
DROP TABLE IF EXISTS `axf_shop`;
CREATE TABLE `axf_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `trackid` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of axf_shop
-- ----------------------------
BEGIN;
INSERT INTO `axf_shop` VALUES (1, 'http://img01.bqstatic.com//upload/activity/2016121616565087.png@90Q.png', '闪送超市', '1464');
INSERT INTO `axf_shop` VALUES (2, 'http://img01.bqstatic.com//upload/activity/2017031018405396.png@90Q.png', '热销榜', '104749');
INSERT INTO `axf_shop` VALUES (3, 'http://img01.bqstatic.com//upload/activity/2017031018403438.png@90Q.png', '新品尝鲜', '104747');
INSERT INTO `axf_shop` VALUES (4, 'http://img01.bqstatic.com//upload/activity/2016121618424334.png@90Q.png', '牛奶面包', '103536');
INSERT INTO `axf_shop` VALUES (5, 'http://img01.bqstatic.com//upload/activity/2016121617150246.png@90Q.png', '饮料酒水', '103549');
INSERT INTO `axf_shop` VALUES (6, 'http://img01.bqstatic.com//upload/activity/201612161714501.png@90Q.png', '优选水果', '103532');
INSERT INTO `axf_shop` VALUES (7, 'http://img01.bqstatic.com//upload/activity/2016121618550639.png@90Q.png', '更多', '100001');
INSERT INTO `axf_shop` VALUES (8, 'http://img01.bqstatic.com//upload/activity/2017031318520359.jpg@90Q.jpg', '鲜蜂力荐', '21854');
INSERT INTO `axf_shop` VALUES (9, 'http://img01.bqstatic.com//upload/activity/2016121618233839.png@90Q.png', '卤味-鸭货不能停', '21742');
INSERT INTO `axf_shop` VALUES (10, 'http://img01.bqstatic.com//upload/activity/2016121618232773.png@90Q.png', '零食轰趴', '21142');
INSERT INTO `axf_shop` VALUES (11, 'http://img01.bqstatic.com//upload/activity/2016121618235123.png@90Q.png', '整箱购', '20581');
COMMIT;

-- ----------------------------
-- Table structure for axf_users
-- ----------------------------
DROP TABLE IF EXISTS `axf_users`;
CREATE TABLE `axf_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(64) NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of axf_users
-- ----------------------------
BEGIN;
INSERT INTO `axf_users` VALUES (1, 'coco', 'pbkdf2_sha256$36000$jDcjtgdg5aH6$M2TDLtZITZS9Bc0mvEcP/+ApX2KZXA4DrsaAw35xdi0=', '111@12.com', 0, 'icons/avatar_wZ77AQR.png', 0);
COMMIT;

-- ----------------------------
-- Table structure for axf_users_ticket
-- ----------------------------
DROP TABLE IF EXISTS `axf_users_ticket`;
CREATE TABLE `axf_users_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket` varchar(256) NOT NULL,
  `out_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `axf_users_ticket_user_id_0070db57_fk_axf_users_id` (`user_id`),
  CONSTRAINT `axf_users_ticket_user_id_0070db57_fk_axf_users_id` FOREIGN KEY (`user_id`) REFERENCES `axf_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of axf_users_ticket
-- ----------------------------
BEGIN;
INSERT INTO `axf_users_ticket` VALUES (1, 'TK_LteOMbXwOZzESrZL1JQFas7ieNJbbv', '2018-06-08 15:13:12.056777', 1);
COMMIT;

-- ----------------------------
-- Table structure for axf_wheel
-- ----------------------------
DROP TABLE IF EXISTS `axf_wheel`;
CREATE TABLE `axf_wheel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `trackid` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of axf_wheel
-- ----------------------------
BEGIN;
INSERT INTO `axf_wheel` VALUES (1, 'http://img01.bqstatic.com//upload/activity/2017031716035274.jpg@90Q.jpg', '酸奶女王', '21870');
INSERT INTO `axf_wheel` VALUES (2, 'http://img01.bqstatic.com//upload/activity/2017031710450787.jpg@90Q.jpg', '优选圣女果', '21869');
INSERT INTO `axf_wheel` VALUES (3, 'http://img01.bqstatic.com//upload/activity/2017030714522982.jpg@90Q.jpg', '伊利酸奶大放价', '21862');
INSERT INTO `axf_wheel` VALUES (4, 'http://img01.bqstatic.com//upload/activity/2017032116081698.jpg@90Q.jpg', '鲜货直供－窝夫小子', '21770');
INSERT INTO `axf_wheel` VALUES (5, 'http://img01.bqstatic.com//upload/activity/2017032117283348.jpg@90Q.jpg', '鲜货直供－狼博森食品', '21874');
COMMIT;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (16, 'app', 'cartmodel');
INSERT INTO `django_content_type` VALUES (7, 'app', 'foodtype');
INSERT INTO `django_content_type` VALUES (13, 'app', 'goods');
INSERT INTO `django_content_type` VALUES (8, 'app', 'mainmustbuy');
INSERT INTO `django_content_type` VALUES (9, 'app', 'mainnav');
INSERT INTO `django_content_type` VALUES (10, 'app', 'mainshop');
INSERT INTO `django_content_type` VALUES (11, 'app', 'mainshow');
INSERT INTO `django_content_type` VALUES (12, 'app', 'mainwheel');
INSERT INTO `django_content_type` VALUES (15, 'app', 'ordergoodsmodel');
INSERT INTO `django_content_type` VALUES (14, 'app', 'ordermodel');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (18, 'user', 'uesrmodel');
INSERT INTO `django_content_type` VALUES (17, 'user', 'userticketmodel');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2018-06-07 15:08:18.451671');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2018-06-07 15:08:18.713942');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2018-06-07 15:08:18.777141');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2018-06-07 15:08:18.802960');
INSERT INTO `django_migrations` VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2018-06-07 15:08:18.850733');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2018-06-07 15:08:18.868927');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0003_alter_user_email_max_length', '2018-06-07 15:08:18.894604');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0004_alter_user_username_opts', '2018-06-07 15:08:18.903898');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0005_alter_user_last_login_null', '2018-06-07 15:08:18.924548');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0006_require_contenttypes_0002', '2018-06-07 15:08:18.926905');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2018-06-07 15:08:18.937759');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0008_alter_user_username_max_length', '2018-06-07 15:08:18.961384');
INSERT INTO `django_migrations` VALUES (13, 'sessions', '0001_initial', '2018-06-07 15:08:18.990458');
INSERT INTO `django_migrations` VALUES (14, 'user', '0001_initial', '2018-06-07 15:10:41.148212');
INSERT INTO `django_migrations` VALUES (15, 'app', '0001_initial', '2018-06-07 15:10:41.389538');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
