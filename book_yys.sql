/*
 Navicat Premium Data Transfer

 Source Server         : bookstore
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : book_yys

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 06/04/2020 14:40:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for author
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author`  (
  `auther_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `auther_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bank_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gener` int(255) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` double(255, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`auther_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of author
-- ----------------------------
INSERT INTO `author` VALUES ('1', 'Pearson Education (US)', '85185451', 1, 'usa', 205);
INSERT INTO `author` VALUES ('10', 'Little, Brown Book Group', '1451811', 1, 'uk', 1500);
INSERT INTO `author` VALUES ('11', 'Ebury Publishing', '1818117', 0, 'usa', 400);
INSERT INTO `author` VALUES ('12', 'Yale University Press', '0818184', 0, 'usa', 970);
INSERT INTO `author` VALUES ('13', 'WW Norton & Co', '1964858', 1, 'uk', 200);
INSERT INTO `author` VALUES ('14', 'SIMON & SCHUSTER', '6481871', 1, 'usa', 1000);
INSERT INTO `author` VALUES ('15', 'Worth Publishers Inc.,U.S.', '982848', 1, 'usa', 700);
INSERT INTO `author` VALUES ('16', 'Vintage Publishing', '1818448', 1, 'usa', 550);
INSERT INTO `author` VALUES ('17', 'BRILLIANCE AUDIO', '98471818', 1, 'usa', 1500);
INSERT INTO `author` VALUES ('18', 'Farrar, Straus and Giroux', '185844', 0, 'usa', 1000);
INSERT INTO `author` VALUES ('2', 'Microsoft Press,U.S.', '8211541', 1, 'usa', 500);
INSERT INTO `author` VALUES ('3', 'MIT Press Ltd', '151871', 1, 'usa', 1500);
INSERT INTO `author` VALUES ('4', 'Pearson Education Limited', '9748118', 0, 'usa', 400);
INSERT INTO `author` VALUES ('5', 'CAMBRIDGE UNIVERSITY PRESS', '2818715', 1, 'uk', 500);
INSERT INTO `author` VALUES ('6', 'Springer London Ltd', '1964858', 1, 'uk', 200);
INSERT INTO `author` VALUES ('7', 'Dorset House Publishing Co Inc.,U.S.', '285184', 1, 'usa', 1000);
INSERT INTO `author` VALUES ('8', 'Avery Publishing Group', '48184451', 1, 'usa', 1000);
INSERT INTO `author` VALUES ('9', 'HarperCollins Publishers Inc', '181544', 1, 'usa', 500);

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `bid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double(10, 2) NULL DEFAULT NULL,
  `bimage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del` int(255) NULL DEFAULT NULL,
  `page` int(255) NULL DEFAULT NULL,
  `ISBN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stock` int(255) NULL DEFAULT NULL,
  `sales` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', 'Design Patterns : Elements of Reusable Object-Oriented Software', 80.00, 'book_img/1.jpg', '1', 0, 416, '9780201633610', '1', 498, 0);
INSERT INTO `book` VALUES ('10', 'Before Happiness : Five Actionable Strategies to Create a Positive Path to Success', 25.00, 'book_img/10.jpg', '2', 0, 272, '9780753541852', '11', 500, 0);
INSERT INTO `book` VALUES ('11', 'Being Wrong : Adventures in the Margin of Error', 25.00, 'book_img/11.jpg', '2', 0, 405, '9780061176050', '9', 500, 0);
INSERT INTO `book` VALUES ('12', 'Aging as a Spiritual Practice : A Contemplative Guide to Growing Older and Wiser', 30.00, 'book_img/12.jpg', '2', 0, 256, '9781592407477', '8', 500, 0);
INSERT INTO `book` VALUES ('13', 'Against the Grain : A Deep History of the Earliest States', 30.00, 'book_img/13.jpg', '3', 0, 336, '9780300240214', '12', 500, 0);
INSERT INTO `book` VALUES ('14', 'American Eclipse : A Nations Epic Race to Catch the Shadow of the Moon and Win the Glory of the World', 35.00, 'book_img/14.jpg', '3', 0, 352, '9781631490163', '13', 500, 0);
INSERT INTO `book` VALUES ('15', 'Army of None : Autonomous Weapons and the Future of War', 30.00, 'book_img/15.jpg', '3', 0, 448, '9780393356588', '13', 500, 0);
INSERT INTO `book` VALUES ('16', 'Barons of the Sea : And Their Race to Build the Worlds Fastest Clipper Ship', 25.00, 'book_img/16.jpg', '3', 0, 448, '9781476745978', '14', 500, 0);
INSERT INTO `book` VALUES ('17', 'Short Guide to a Long Life', 27.00, 'book_img/17.jpg', '4', 0, 190, '9781476730950', '14', 500, 0);
INSERT INTO `book` VALUES ('18', 'Abnormal Psychology', 110.00, 'book_img/18.jpg', '4', 0, 784, '9781319170301', '15', 500, 0);
INSERT INTO `book` VALUES ('19', 'Against Empathy : The Case for Rational Compassion', 17.00, 'book_img/19.jpg', '4', 0, 304, '9780099597827', '16', 500, 0);
INSERT INTO `book` VALUES ('2', 'Code Complete', 50.00, 'book_img/2.jpg', '1', 0, 960, '9780735619678', '2', 500, 0);
INSERT INTO `book` VALUES ('20', 'Anatomy of an Epidemic : Magic Bullets, Psychiatric Drugs, and the Astonishing Rise of Mental Illness in America', 170.00, 'book_img/20.jpg', '4', 0, 471, '9783731619278', '17', 500, 0);
INSERT INTO `book` VALUES ('3', 'Introduction to Algorithms', 150.00, 'book_img/3.jpg', '1', 0, 1320, '9780262033848', '3', 500, 0);
INSERT INTO `book` VALUES ('4', 'Compilers: Pearson New International Edition : Principles, Techniques, and Tools', 140.00, '/book_img/4.jpg', '1', 0, 952, '9781292024349', '4', 500, 0);
INSERT INTO `book` VALUES ('5', 'Purely Functional Data Structures', 65.00, 'book_img/5.jpg', '1', 0, 232, '9780521663502', '5', 500, 0);
INSERT INTO `book` VALUES ('6', 'Applying UML and Patterns : An Introduction to Object-Oriented Analysis and Design and Iterative Development', 130.00, 'book_img/6.jpg', '1', 0, 736, '9780131489066', '1', 500, 0);
INSERT INTO `book` VALUES ('7', 'The Algorithm Design Manual', 60.00, 'book_img/7.jpg', '1', 0, 746, '9781848000698', '6', 500, 0);
INSERT INTO `book` VALUES ('9', 'Ballerina Body : Dancing and Eating Your Way to a Lighter, Stronger, and More Graceful You', 30.00, 'book_img/9.jpg', '2', 0, 240, '9780751565669', '10', 500, 0);
INSERT INTO `book` VALUES ('cbe6b6b17ea4435ca9312addb1b1c778', 'Advanced Programming in the UNIX Environment', 87.00, '/book_img/22.jpg', '1', 0, 1032, '9780321637734', '1', 480, 0);
INSERT INTO `book` VALUES ('e78ab423edc74833921d428f39bdde88', 'Bad Pharma : How Drug Companies Mislead Doctors and Harm Patients', 35.00, '/book_img/21.jpg', '4', 0, 456, '9780865478060', '18', 350, 0);
INSERT INTO `book` VALUES ('fe44f30edddc4e7fad7e67f046098d24', 'Aging Backwards : Reverse the Aging Process and Look 10 Years Younger in 30 Minutes a Day', 35.00, '/book_img/8.jpg', '2', 0, 304, '9780062313348', '9', 480, 0);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'Computer Science');
INSERT INTO `category` VALUES ('2', 'Health and Fitness');
INSERT INTO `category` VALUES ('3', 'History');
INSERT INTO `category` VALUES ('4', 'Medical');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `itemID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `count` int(255) NULL DEFAULT NULL,
  `subtotal` double(255, 0) NULL DEFAULT NULL,
  `oid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`itemID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('300ed8547937446cb523ddcc7b2fc690', 1, 80, 'fba2c47b78a741bfa3e8f57588b20b15', '1');
INSERT INTO `orderitem` VALUES ('3d46d86725424063a59179303dd1c393', 1, 80, '27dd25f3dec04dfc87b1e9e19e677c30', '1');
INSERT INTO `orderitem` VALUES ('51fc85f3abd744dd8d17fc3bc7b1b1ec', 18, 1233, '2299098087bc4beb9dea221459aef657', '2');
INSERT INTO `orderitem` VALUES ('56d00a93957a48f585de86f7c10e3ff8', 11, 753, 'f9bed048b5f84a12800ae031ef15f21b', '2');
INSERT INTO `orderitem` VALUES ('a94367e9b93748b4b69cea81d5b10658', 15, 1249, 'f9bed048b5f84a12800ae031ef15f21b', '5');
INSERT INTO `orderitem` VALUES ('b44106e9fc384fbe9c6c387ec644d772', 11, 753, 'a368ed3054e349d18467e493f84a69fe', '2');
INSERT INTO `orderitem` VALUES ('ca46a3a7632742068f28718067c302a6', 15, 450, '2299098087bc4beb9dea221459aef657', '7');
INSERT INTO `orderitem` VALUES ('cf1b78b2d0e84825bbc179ef2953e2b9', 10, 756, '0ec0b44810204c0cb1ebda35270ba739', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ordertime` date NULL DEFAULT NULL,
  `alltotal` double(255, 0) NULL DEFAULT NULL,
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('0ec0b44810204c0cb1ebda35270ba739', '2020-03-25', 756, '1', 'nj', '2');
INSERT INTO `orders` VALUES ('2299098087bc4beb9dea221459aef657', '2020-03-25', 1683, '1', 'nj', '4');
INSERT INTO `orders` VALUES ('27dd25f3dec04dfc87b1e9e19e677c30', '2020-04-06', 80, '1', 'nj', '2');
INSERT INTO `orders` VALUES ('a368ed3054e349d18467e493f84a69fe', '2020-03-24', 753, '1', 'nj', '1');
INSERT INTO `orders` VALUES ('f9bed048b5f84a12800ae031ef15f21b', '2020-03-24', 2003, '1', 'nj', '1');
INSERT INTO `orders` VALUES ('fba2c47b78a741bfa3e8f57588b20b15', '2020-03-28', 80, '1', 'nj', '2');

-- ----------------------------
-- Table structure for pe_permission
-- ----------------------------
DROP TABLE IF EXISTS `pe_permission`;
CREATE TABLE `pe_permission`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '权限描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pe_permission
-- ----------------------------
INSERT INTO `pe_permission` VALUES ('1', 'add user', 'user:add', NULL);
INSERT INTO `pe_permission` VALUES ('2', 'query user', 'user:find', NULL);
INSERT INTO `pe_permission` VALUES ('3', 'update user', 'user:update', NULL);
INSERT INTO `pe_permission` VALUES ('4', 'delete user', 'user:delete', NULL);

-- ----------------------------
-- Table structure for pe_role
-- ----------------------------
DROP TABLE IF EXISTS `pe_role`;
CREATE TABLE `pe_role`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键ID',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_k3beff7qglfn58qsf2yvbg41i`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pe_role
-- ----------------------------
INSERT INTO `pe_role` VALUES ('1', 'admin', 'admin');
INSERT INTO `pe_role` VALUES ('2', 'customer', 'customer');

-- ----------------------------
-- Table structure for pe_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `pe_role_permission`;
CREATE TABLE `pe_role_permission`  (
  `role_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  `permission_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE,
  INDEX `FK74qx7rkbtq2wqms78gljv87a0`(`permission_id`) USING BTREE,
  INDEX `FKee9dk0vg99shvsytflym6egxd`(`role_id`) USING BTREE,
  CONSTRAINT `fk-p-rid` FOREIGN KEY (`role_id`) REFERENCES `pe_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk-pid` FOREIGN KEY (`permission_id`) REFERENCES `pe_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pe_role_permission
-- ----------------------------
INSERT INTO `pe_role_permission` VALUES ('1', '1');
INSERT INTO `pe_role_permission` VALUES ('1', '2');
INSERT INTO `pe_role_permission` VALUES ('2', '2');
INSERT INTO `pe_role_permission` VALUES ('1', '3');
INSERT INTO `pe_role_permission` VALUES ('1', '4');

-- ----------------------------
-- Table structure for pe_user
-- ----------------------------
DROP TABLE IF EXISTS `pe_user`;
CREATE TABLE `pe_user`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pe_user
-- ----------------------------
INSERT INTO `pe_user` VALUES ('1', 'yinyisong', '123456');
INSERT INTO `pe_user` VALUES ('2', 'yys', '123456');
INSERT INTO `pe_user` VALUES ('3', 'wangwu', '123456');
INSERT INTO `pe_user` VALUES ('f6a449d2ca9b47cfa7654752bc4123c5', 'zhuzhu', 'jibudele1');

-- ----------------------------
-- Table structure for pe_user_role
-- ----------------------------
DROP TABLE IF EXISTS `pe_user_role`;
CREATE TABLE `pe_user_role`  (
  `role_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  `user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限ID',
  INDEX `FK74qx7rkbtq2wqms78gljv87a1`(`role_id`) USING BTREE,
  INDEX `FKee9dk0vg99shvsytflym6egx1`(`user_id`) USING BTREE,
  CONSTRAINT `fk-rid` FOREIGN KEY (`role_id`) REFERENCES `pe_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk-uid` FOREIGN KEY (`user_id`) REFERENCES `pe_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pe_user_role
-- ----------------------------
INSERT INTO `pe_user_role` VALUES ('1', '1');

-- ----------------------------
-- Table structure for store_user
-- ----------------------------
DROP TABLE IF EXISTS `store_user`;
CREATE TABLE `store_user`  (
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gener` int(255) NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store_user
-- ----------------------------
INSERT INTO `store_user` VALUES ('1', 'yinyisong', 'yinyisong', 1, '17802585935', 'aaa', 'nj');
INSERT INTO `store_user` VALUES ('2', 'lisi', 'lisi', 1, '13913898586', 'qq', 'bj');
INSERT INTO `store_user` VALUES ('3', 'wangwu', 'wangwu', 0, '18913898284', 'qqq', 'shanghai');
INSERT INTO `store_user` VALUES ('f6a449d2ca9b47cfa7654752bc4123c5', 'zhuzhu', 'zhuzhu', 1, '158154564', '1551651655', 'asdqsddsq');

SET FOREIGN_KEY_CHECKS = 1;
