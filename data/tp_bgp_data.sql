/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : tp_bgp_data

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 21/11/2019 22:33:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for as_rel
-- ----------------------------
DROP TABLE IF EXISTS `as_rel`;
CREATE TABLE `as_rel`  (
  `as1` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `as2` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rel` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`as1`, `as2`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for asinfo
-- ----------------------------
DROP TABLE IF EXISTS `asinfo`;
CREATE TABLE `asinfo`  (
  `asn` bigint(20) NOT NULL,
  `degree` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `asname` varchar(600) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `country` varchar(600) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`asn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for asnames
-- ----------------------------
DROP TABLE IF EXISTS `asnames`;
CREATE TABLE `asnames`  (
  `asnum` int(11) NOT NULL,
  `name` varchar(600) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`asnum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for asset
-- ----------------------------
DROP TABLE IF EXISTS `asset`;
CREATE TABLE `asset`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for changelog
-- ----------------------------
DROP TABLE IF EXISTS `changelog`;
CREATE TABLE `changelog`  (
  `date` int(11) NOT NULL,
  `c_links` int(11) DEFAULT NULL,
  `c_monitors` int(11) DEFAULT NULL,
  `c_origins` int(11) DEFAULT NULL,
  `n_links` int(11) DEFAULT NULL,
  `n_monitors` int(11) DEFAULT NULL,
  `n_origins` int(11) DEFAULT NULL,
  `ases` int(11) DEFAULT NULL,
  `prefixes` int(11) DEFAULT NULL,
  `a_mons` int(11) DEFAULT NULL,
  `o_link` int(11) DEFAULT NULL,
  `l_link` int(11) DEFAULT NULL,
  `o_mon` int(11) DEFAULT NULL,
  `l_mon` int(11) DEFAULT NULL,
  `o_orig` int(11) DEFAULT NULL,
  `l_orig` int(11) DEFAULT NULL,
  `oldest` int(11) DEFAULT NULL,
  `latest` int(11) DEFAULT NULL,
  `n_ases` int(11) DEFAULT NULL,
  PRIMARY KEY (`date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for links
-- ----------------------------
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links`  (
  `as1` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `as2` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `type` int(1) NOT NULL,
  `monitors` int(11) DEFAULT NULL,
  `d_monitors` int(11) DEFAULT NULL,
  `msg_md5` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `first` int(10) DEFAULT NULL,
  `last` int(10) DEFAULT NULL,
  PRIMARY KEY (`as1`, `as2`, `type`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for monitors
-- ----------------------------
DROP TABLE IF EXISTS `monitors`;
CREATE TABLE `monitors`  (
  `nexthop` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `asn` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `peer` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `peerasn` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `type` int(1) NOT NULL,
  `prefixes` int(11) NOT NULL,
  `d_prefixes` bigint(20) DEFAULT NULL,
  `msg_md5` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `first` int(10) DEFAULT NULL,
  `last` int(10) DEFAULT NULL,
  PRIMARY KEY (`nexthop`, `asn`, `peer`, `peerasn`, `type`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for originss
-- ----------------------------
DROP TABLE IF EXISTS `originss`;
CREATE TABLE `originss`  (
  `prefix` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `origin` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `type` int(1) NOT NULL,
  `monitors` int(11) DEFAULT NULL,
  `d_monitors` int(11) DEFAULT NULL,
  `msg_md5` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `first` int(10) DEFAULT NULL,
  `last` int(10) DEFAULT NULL,
  PRIMARY KEY (`prefix`, `origin`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
