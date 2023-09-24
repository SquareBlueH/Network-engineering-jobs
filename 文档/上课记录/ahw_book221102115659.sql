/*
 Navicat Premium Data Transfer

 Source Server         : xulf
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : b

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 02/11/2022 11:21:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bbi
-- ----------------------------
DROP TABLE IF EXISTS `bbi`;
CREATE TABLE `bbi`  (
  `BNO` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `RNO` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cno` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BORROWDATE` datetime NOT NULL,
  `RETURNDATE` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`BNO`, `RNO`, `BORROWDATE`) USING BTREE,
  INDEX `RNO`(`RNO`) USING BTREE,
  CONSTRAINT `bbi_ibfk_1` FOREIGN KEY (`BNO`) REFERENCES `books` (`bno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bbi_ibfk_2` FOREIGN KEY (`RNO`) REFERENCES `readers` (`rno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bbi
-- ----------------------------
INSERT INTO `bbi` VALUES ('978700873729', '201910090001', '01', '2022-11-01 15:00:00', NULL);
INSERT INTO `bbi` VALUES ('978700873729', '201910090002', '01', '2022-11-02 09:05:03', NULL);
INSERT INTO `bbi` VALUES ('978700873729', '202109201001', '01', '2022-11-02 10:00:00', NULL);
INSERT INTO `bbi` VALUES ('9787030489100', '201910090001', '01', '2022-11-02 11:00:00', NULL);
INSERT INTO `bbi` VALUES ('9787111304265', '201910090001', '01', '2022-11-02 09:00:05', NULL);
INSERT INTO `bbi` VALUES ('9787673647631', '201605010001', '01', '2020-09-10 10:00:00', '2020-09-10 10:00:00');
INSERT INTO `bbi` VALUES ('9787673647631', '201910090002', '02', '2020-10-10 10:00:00', '2020-12-01 08:30:00');
INSERT INTO `bbi` VALUES ('9787673647631', '202210101001', '01', '2020-10-10 10:00:00', '2020-12-02 11:20:03');
INSERT INTO `bbi` VALUES ('978767737281', '201910090002', '01', '2020-10-10 10:00:00', '2020-12-01 08:30:00');

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `BNO` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BNAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BAUTHOR` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BPUBLISH` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BPDATE` date NOT NULL,
  `BPRICE` decimal(5, 2) NOT NULL,
  PRIMARY KEY (`BNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('978700873729', '数据库原理及应用', '王丽艳', '人民邮电出版社', '2016-05-01', 49.80);
INSERT INTO `books` VALUES ('9787030489100', '算法与数据结构', '江世宏', '科学出版社', '2016-05-01', 39.80);
INSERT INTO `books` VALUES ('978709987803', '见字如面', '关正文', '湖南文艺出版社', '2016-05-01', 39.80);
INSERT INTO `books` VALUES ('9787111185260', '软件测试', '（美）佩腾', '机械工业出版社', '2006-04-01', 30.00);
INSERT INTO `books` VALUES ('9787111304265', '操作系统', '（美）斯托林斯', '机械工业出版社', '2010-09-01', 69.00);
INSERT INTO `books` VALUES ('9787115183392', 'HTML网页设计', '温谦', '人民邮电出版社', '2008-08-01', 49.00);
INSERT INTO `books` VALUES ('9787115330246', 'GOOGLE软件测试之道', '（美）惠特克', '人民邮电出版社', '2013-09-27', 59.00);
INSERT INTO `books` VALUES ('9787115344816', 'AutoCAD技术大全', '周芳', '人们邮电出版社', '2014-04-01', 85.30);
INSERT INTO `books` VALUES ('9787123443209', '平凡的世界', '路遥', '北京十月文艺出版社', '2017-06-01', 108.00);
INSERT INTO `books` VALUES ('9787123987574', '计算机网络', '谢希仁', '电子工业出版社', '2016-12-01', 45.00);
INSERT INTO `books` VALUES ('9787302408307', 'C语言程序设计', '谭浩强', '清华大学出版社', '2015-08-01', 49.50);
INSERT INTO `books` VALUES ('978765367821', '活着', '余华', '北京十月文艺出版社', '2017-06-01', 35.00);
INSERT INTO `books` VALUES ('978765371921', 'JAVA程序设计', '朱庆生，古平 ', '清华大学出版社', '2011-09-01', 36.00);
INSERT INTO `books` VALUES ('9787673647631', 'WEB编程技术', '刘秋菊，刘书伦', '北京师范大学出版社', '2011-09-01', 33.00);
INSERT INTO `books` VALUES ('978767737281', 'PHP程序设计', '李英梅', '北京交通大学出版社', '2011-05-01', 33.00);
INSERT INTO `books` VALUES ('978776351321', '堂吉诃德', '塞万提斯', '西安交通大学出版社', '2011-06-01', 21.60);

-- ----------------------------
-- Table structure for readers
-- ----------------------------
DROP TABLE IF EXISTS `readers`;
CREATE TABLE `readers`  (
  `RNO` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `RNAME` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `RTEL` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `RSEX` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RAGE` int(11) NULL DEFAULT NULL,
  `rhcarddate` date NOT NULL DEFAULT '2022-10-10',
  PRIMARY KEY (`RNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of readers
-- ----------------------------
INSERT INTO `readers` VALUES ('201605010001', '李洋', '18098439892', '男', 26, '2016-05-01');
INSERT INTO `readers` VALUES ('201910090001', '王平', '16782312322', '男', 28, '2019-10-09');
INSERT INTO `readers` VALUES ('201910090002', '张雪', '15678659872', '女', 25, '2019-10-09');
INSERT INTO `readers` VALUES ('202109190001', '李二莎', '18198400882', '女', 20, '2021-09-19');
INSERT INTO `readers` VALUES ('202109201001', '薛小依', '15673821293', '女', 20, '2021-09-20');
INSERT INTO `readers` VALUES ('202109201002', '许军', '17649367203', '男', 18, '2019-09-20');
INSERT INTO `readers` VALUES ('202210101001', '张晓', '17493672032', '男', 18, '2022-10-10');

SET FOREIGN_KEY_CHECKS = 1;
