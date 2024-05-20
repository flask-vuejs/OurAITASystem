/*
 Navicat Premium Data Transfer

 Source Server         : chl
 Source Server Type    : MySQL
 Source Server Version : 80200 (8.2.0)
 Source Host           : localhost:3306
 Source Schema         : mydb1

 Target Server Type    : MySQL
 Target Server Version : 80200 (8.2.0)
 File Encoding         : 65001

 Date: 20/05/2024 20:38:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `link_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (1, 'title1', '/media/papers/personal.jpg', 'https://cloud.tencent.com/developer/article/1613238', '2024-05-12 17:15:47');
INSERT INTO `banner` VALUES (2, 'title2', '/media/papers/Figure_1.png', 'https://www.bilibili.com/video/BV1ps4y1d73V?p=37&vd_source=36c1c2ebfa7e5054b164ff785ef49dbd', '2024-05-12 17:14:28');
INSERT INTO `banner` VALUES (3, 'title4', '/media/papers/下载.jpg', 'https://cloud.tencent.com/developer/article/1613238', '2024-05-12 12:15:47');
INSERT INTO `banner` VALUES (5, 'title3', '/media/papers/personal.jpg', 'https://cloud.tencent.com/developer/article/1613238', '2024-05-20 12:12:11');

SET FOREIGN_KEY_CHECKS = 1;
