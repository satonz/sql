/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : web09

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 22/11/2018 13:41:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('c001', '家电');
INSERT INTO `category` VALUES ('c002', '服饰');
INSERT INTO `category` VALUES ('c003', '化妆品');
INSERT INTO `category` VALUES ('c004', NULL);

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `oid` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pid` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  INDEX `orderitem_orders_fk`(`oid`) USING BTREE,
  INDEX `orderitem_product_fk`(`pid`) USING BTREE,
  CONSTRAINT `orderitem_orders_fk` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orderitem_product_fk` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `totalprice` double NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `pid` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `category_id` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('p001', '联想', 5000, 'c001');
INSERT INTO `product` VALUES ('p002', '海尔', 5000, 'c001');
INSERT INTO `product` VALUES ('p003', '雷神', 5000, 'c001');
INSERT INTO `product` VALUES ('p004', 'JACK JONES', 800, 'c002');
INSERT INTO `product` VALUES ('p005', '真维斯', 200, 'c002');
INSERT INTO `product` VALUES ('p006', '花花公子', 440, 'c002');
INSERT INTO `product` VALUES ('p007', '劲霸', 2000, 'c002');
INSERT INTO `product` VALUES ('p008', '香奈儿', 800, 'c003');
INSERT INTO `product` VALUES ('p009', '相宜本草', 200, 'c003');
INSERT INTO `product` VALUES ('p010', '海飞丝', 100, NULL);

SET FOREIGN_KEY_CHECKS = 1;
