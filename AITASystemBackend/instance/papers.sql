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

 Date: 25/05/2024 17:17:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for papers
-- ----------------------------
DROP TABLE IF EXISTS `papers`;
CREATE TABLE `papers`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `author` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of papers
-- ----------------------------
INSERT INTO `papers` VALUES (1, '论文1', '这是论文1的内容摘要...', '2023-05-01 18:14:20', 'person1', '/media/papers/person1.jpg');
INSERT INTO `papers` VALUES (2, '论文2', '这是论文2的内容摘要...', '2023-11-01 18:14:20', 'person2', '/media/papers/person2.jpg');
INSERT INTO `papers` VALUES (3, '论文3', '这是论文3的内容摘要...', '2024-04-23 17:16:37', 'person3', '/media/papers/person3.jpg');
INSERT INTO `papers` VALUES (4, '论文4', '这是论文4的内容摘要...', '2024-04-23 18:24:17', 'person4', '/media/papers/person4.jpg');
INSERT INTO `papers` VALUES (5, '论文5', '这是论文5的内容摘要...', '2024-04-23 19:22:10', 'person5', '/media/papers/person5.jpg');
INSERT INTO `papers` VALUES (6, '论文6', '这是论文6的内容摘要...', '2024-04-23 19:26:21', 'person6', '/media/papers/person6.jpg');
INSERT INTO `papers` VALUES (7, '论文7', '这是论文7的内容摘要...', '2024-04-23 19:45:27', 'person7', '/media/papers/person7.jpg');
INSERT INTO `papers` VALUES (8, '论文8', '这是论文8的内容摘要...', '2024-04-23 22:00:00', 'person8', '/media/papers/person8.jpg');
INSERT INTO `papers` VALUES (9, '论文9', '这是论文9的内容摘要...', '2024-04-27 18:16:40', 'person9', '/media/papers/person9.jpg');
INSERT INTO `papers` VALUES (10, '论文10', '这是论文10的内容摘要...', '2024-04-28 17:16:40', 'person10', '/media/papers/person10.jpg');
INSERT INTO `papers` VALUES (11, '论文11', '这是论文11的内容摘要...', '2024-05-02 18:14:20', 'person11', '/media/papers/person11.jpg');

SET FOREIGN_KEY_CHECKS = 1;
