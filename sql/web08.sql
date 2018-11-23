/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : web08

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 22/11/2018 13:41:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` double NULL DEFAULT NULL,
  `pdate` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `cid` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '谭妮平', 0.01, '2018-11-18 15:21:14', '1');
INSERT INTO `product` VALUES (2, '李士雪', 38, '2018-11-18 15:21:14', '1');
INSERT INTO `product` VALUES (3, '左慈', -998, '2018-11-18 15:21:14', '1');
INSERT INTO `product` VALUES (4, '黄迎', 99999, '2018-11-18 15:21:14', '1');
INSERT INTO `product` VALUES (5, '南国强', 99998, '2018-11-18 15:21:16', '2');
INSERT INTO `product` VALUES (6, '士兵', 1, '2018-11-18 15:21:16', '2');
INSERT INTO `product` VALUES (7, '李士兵', 698, '2018-11-18 15:21:16', '2');
INSERT INTO `product` VALUES (8, '李士雪', 38, '2018-11-18 15:21:14', '1');

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `uid` int(32) NOT NULL AUTO_INCREMENT,
  `uname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `upassword` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES (1, 'zhangsan', '123');
INSERT INTO `tbl_user` VALUES (2, 'lisi', 'hehe');
INSERT INTO `tbl_user` VALUES (3, 'lisi', 'hehe');
INSERT INTO `tbl_user` VALUES (4, '??3', '??3');

SET FOREIGN_KEY_CHECKS = 1;
