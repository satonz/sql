/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : space_sm

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 22/11/2018 13:41:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_action
-- ----------------------------
DROP TABLE IF EXISTS `tb_action`;
CREATE TABLE `tb_action`  (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `action_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `action_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`action_id`) USING BTREE,
  INDEX `action_user_fk`(`user_id`) USING BTREE,
  CONSTRAINT `action_user_fk` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_action
-- ----------------------------
INSERT INTO `tb_action` VALUES (1, '登录', '0:0:0:0:0:0:0:1', '2018-11-10 19:47:04', 1);
INSERT INTO `tb_action` VALUES (2, '退出登录', '0:0:0:0:0:0:0:1', '2018-11-10 19:47:14', 1);
INSERT INTO `tb_action` VALUES (3, '登录', '0:0:0:0:0:0:0:1', '2018-11-10 20:05:37', 1);
INSERT INTO `tb_action` VALUES (4, '退出登录', '0:0:0:0:0:0:0:1', '2018-11-10 20:09:36', 1);
INSERT INTO `tb_action` VALUES (5, '登录', '0:0:0:0:0:0:0:1', '2018-11-10 20:31:24', 1);
INSERT INTO `tb_action` VALUES (6, '退出登录', '0:0:0:0:0:0:0:1', '2018-11-10 20:31:42', 1);
INSERT INTO `tb_action` VALUES (7, '注册', '0:0:0:0:0:0:0:1', '2018-11-10 20:32:03', 2);
INSERT INTO `tb_action` VALUES (8, '退出登录', '0:0:0:0:0:0:0:1', '2018-11-10 20:32:09', 2);
INSERT INTO `tb_action` VALUES (9, '登录', '0:0:0:0:0:0:0:1', '2018-11-17 18:16:57', 2);
INSERT INTO `tb_action` VALUES (10, '登录', '0:0:0:0:0:0:0:1', '2018-11-17 18:28:57', 2);
INSERT INTO `tb_action` VALUES (11, '退出登录', '0:0:0:0:0:0:0:1', '2018-11-17 18:29:33', 2);
INSERT INTO `tb_action` VALUES (12, '登录', '0:0:0:0:0:0:0:1', '2018-11-17 18:29:35', 2);

-- ----------------------------
-- Table structure for tb_activity
-- ----------------------------
DROP TABLE IF EXISTS `tb_activity`;
CREATE TABLE `tb_activity`  (
  `act_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `act_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动标题',
  `act_introduce` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `act_start_time` datetime(0) NOT NULL,
  `act_end_time` datetime(0) NOT NULL,
  `act_img_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `act_ticket` int(11) NOT NULL DEFAULT 0,
  `act_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `act_add_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `room_id` int(11) NOT NULL,
  PRIMARY KEY (`act_id`) USING BTREE,
  INDEX `room_act_fk`(`room_id`) USING BTREE,
  CONSTRAINT `room_act_fk` FOREIGN KEY (`room_id`) REFERENCES `tb_room` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin`  (
  `admin_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES (1, 'admin', 'admin@163.com', 'E10ADC3949BA59ABBE56E057F20F883E');
INSERT INTO `tb_admin` VALUES (2, '张廷强', '123@qq.com', 'E10ADC3949BA59ABBE56E057F20F883E');

-- ----------------------------
-- Table structure for tb_application
-- ----------------------------
DROP TABLE IF EXISTS `tb_application`;
CREATE TABLE `tb_application`  (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `app_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `app_start_time` datetime(0) NOT NULL,
  `app_end_time` datetime(0) NOT NULL,
  `app_status` tinyint(1) NOT NULL DEFAULT 1,
  `app_is_dealed` tinyint(1) NOT NULL DEFAULT 1,
  `room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`app_id`) USING BTREE,
  INDEX `room_app_fk`(`room_id`) USING BTREE,
  INDEX `user_app_fk`(`user_id`) USING BTREE,
  CONSTRAINT `room_app_fk` FOREIGN KEY (`room_id`) REFERENCES `tb_room` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_app_fk` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_authentication
-- ----------------------------
DROP TABLE IF EXISTS `tb_authentication`;
CREATE TABLE `tb_authentication`  (
  `inf_id` int(11) NOT NULL AUTO_INCREMENT,
  `inf_type` tinyint(4) NOT NULL,
  `inf_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `inf_introduce` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `inf_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `user_id` int(11) NOT NULL,
  `inf_status` tinyint(1) NOT NULL DEFAULT 1,
  `inf_is_dealed` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`inf_id`) USING BTREE,
  INDEX `user_auth_fk`(`user_id`) USING BTREE,
  CONSTRAINT `user_auth_fk` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_barrage
-- ----------------------------
DROP TABLE IF EXISTS `tb_barrage`;
CREATE TABLE `tb_barrage`  (
  `barr_id` int(11) NOT NULL AUTO_INCREMENT,
  `barr_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `barr_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `user_id` int(11) NOT NULL,
  `act_id` int(11) NOT NULL,
  PRIMARY KEY (`barr_id`) USING BTREE,
  INDEX `barr_act_fk`(`act_id`) USING BTREE,
  INDEX `barr_user_fk`(`user_id`) USING BTREE,
  CONSTRAINT `barr_act_fk` FOREIGN KEY (`act_id`) REFERENCES `tb_activity` (`act_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `barr_user_fk` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_building
-- ----------------------------
DROP TABLE IF EXISTS `tb_building`;
CREATE TABLE `tb_building`  (
  `bui_id` int(11) NOT NULL AUTO_INCREMENT,
  `bui_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bui_introduce` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `bui_type` tinyint(4) NOT NULL,
  PRIMARY KEY (`bui_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_building
-- ----------------------------
INSERT INTO `tb_building` VALUES (1, '一号楼', '计算机（软件）学院', 0);
INSERT INTO `tb_building` VALUES (2, '网络实验室', '计算机（软件学院）', 1);
INSERT INTO `tb_building` VALUES (4, '中心会议室', '可以容纳多人进行会议或其他活动', 2);

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment`  (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_content` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `act_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `comm_act_fk`(`act_id`) USING BTREE,
  INDEX `comm_user_fk`(`user_id`) USING BTREE,
  CONSTRAINT `comm_act_fk` FOREIGN KEY (`act_id`) REFERENCES `tb_activity` (`act_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comm_user_fk` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_comminform
-- ----------------------------
DROP TABLE IF EXISTS `tb_comminform`;
CREATE TABLE `tb_comminform`  (
  `comminform_id` int(11) NOT NULL AUTO_INCREMENT,
  `comminform_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_readed` tinyint(4) NOT NULL,
  PRIMARY KEY (`comminform_id`) USING BTREE,
  INDEX `comminf_comm_fk`(`comment_id`) USING BTREE,
  INDEX `comminf_user_fk`(`user_id`) USING BTREE,
  CONSTRAINT `comminf_comm_fk` FOREIGN KEY (`comment_id`) REFERENCES `tb_comment` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comminf_user_fk` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_image
-- ----------------------------
DROP TABLE IF EXISTS `tb_image`;
CREATE TABLE `tb_image`  (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `img_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `inf_id` int(11) NOT NULL,
  PRIMARY KEY (`img_id`) USING BTREE,
  INDEX `inf_img_fk`(`inf_id`) USING BTREE,
  CONSTRAINT `inf_img_fk` FOREIGN KEY (`inf_id`) REFERENCES `tb_authentication` (`inf_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_notice
-- ----------------------------
DROP TABLE IF EXISTS `tb_notice`;
CREATE TABLE `tb_notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `notice_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `notice_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_profile
-- ----------------------------
DROP TABLE IF EXISTS `tb_profile`;
CREATE TABLE `tb_profile`  (
  `pf_id` int(11) NOT NULL AUTO_INCREMENT,
  `pf_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pf_birth` date NULL DEFAULT NULL,
  `pf_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pf_qq` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pf_sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pf_realname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pf_is_active` tinyint(1) NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`pf_id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_pf_fk` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_profile
-- ----------------------------
INSERT INTO `tb_profile` VALUES (1, NULL, NULL, '/upload/image/default1.jpg', NULL, NULL, NULL, 0, 1);
INSERT INTO `tb_profile` VALUES (2, NULL, NULL, '/upload/image/154245056007012603_cut.jpg', NULL, NULL, NULL, 0, 2);

-- ----------------------------
-- Table structure for tb_reply
-- ----------------------------
DROP TABLE IF EXISTS `tb_reply`;
CREATE TABLE `tb_reply`  (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_content` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reply_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`reply_id`) USING BTREE,
  INDEX `reply_comm_fk`(`comment_id`) USING BTREE,
  INDEX `reply_user_fk`(`user_id`) USING BTREE,
  CONSTRAINT `reply_comm_fk` FOREIGN KEY (`comment_id`) REFERENCES `tb_comment` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reply_user_fk` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_room
-- ----------------------------
DROP TABLE IF EXISTS `tb_room`;
CREATE TABLE `tb_room`  (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_number` int(11) NOT NULL,
  `room_capacity` int(11) NOT NULL,
  `bui_id` int(11) NOT NULL,
  PRIMARY KEY (`room_id`) USING BTREE,
  INDEX `room_building_fk`(`bui_id`) USING BTREE,
  CONSTRAINT `room_building_fk` FOREIGN KEY (`bui_id`) REFERENCES `tb_building` (`bui_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_room
-- ----------------------------
INSERT INTO `tb_room` VALUES (1, 101, 50, 1);
INSERT INTO `tb_room` VALUES (2, 102, 50, 1);
INSERT INTO `tb_room` VALUES (3, 103, 50, 1);
INSERT INTO `tb_room` VALUES (4, 104, 100, 1);
INSERT INTO `tb_room` VALUES (5, 101, 50, 2);
INSERT INTO `tb_room` VALUES (6, 1, 500, 4);

-- ----------------------------
-- Table structure for tb_sysinform
-- ----------------------------
DROP TABLE IF EXISTS `tb_sysinform`;
CREATE TABLE `tb_sysinform`  (
  `sysinform_id` int(11) NOT NULL AUTO_INCREMENT,
  `sysinform_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sysinform_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `user_id` int(11) NOT NULL,
  `is_readed` tinyint(4) NOT NULL,
  PRIMARY KEY (`sysinform_id`) USING BTREE,
  INDEX `sysinf_user_fk`(`user_id`) USING BTREE,
  CONSTRAINT `sysinf_user_fk` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_ticket
-- ----------------------------
DROP TABLE IF EXISTS `tb_ticket`;
CREATE TABLE `tb_ticket`  (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `act_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`ticket_id`) USING BTREE,
  INDEX `ticket_act_fk`(`act_id`) USING BTREE,
  INDEX `ticket_user_fk`(`user_id`) USING BTREE,
  CONSTRAINT `ticket_act_fk` FOREIGN KEY (`act_id`) REFERENCES `tb_activity` (`act_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ticket_user_fk` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'test', '113199060@qq.com', 'E10ADC3949BA59ABBE56E057F20F883E');
INSERT INTO `tb_user` VALUES (2, '15937552155', 'admin@163.com', '1C29B011231FEB173A384A3645EDC2FC');

SET FOREIGN_KEY_CHECKS = 1;
