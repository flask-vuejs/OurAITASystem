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

 Date: 20/05/2024 20:38:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group`  (
  `group_id` int NOT NULL AUTO_INCREMENT,
  `group_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `group_role` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `group_person_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `group_person_description` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `group_person_image_url` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `group_person_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `group_person_papers` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES (1, 'bioinformatic', 'student', '生物信息学学生1', '三进团队成员', '/media/group/person1.jpg', '大二学生', '无');
INSERT INTO `group` VALUES (2, 'bioinformatic', 'student', '生物信息学学生2', '三进团队成员', '/media/group/person2.jpg', '大二学生', '无');
INSERT INTO `group` VALUES (3, 'cloudcomputing', 'student', '云计算学生1', '三进团队成员', '/media/group/person3.jpg', '大二学生', '无');
INSERT INTO `group` VALUES (4, 'petroleumsoftware', 'student', '石油工业软件学生1', '三进团队成员', '/media/group/person4.jpg', '大二学生', '无');
INSERT INTO `group` VALUES (5, 'petroleumsoftware', 'student', '石油工业软件学生2', '三进团队成员', '/media/group/person5.jpg', '大二学生', '无');
INSERT INTO `group` VALUES (6, 'cloudcomputing', 'student', '云计算学生2', '三进团队成员', '/media/group/person6.jpg', '大二学生', '无');
INSERT INTO `group` VALUES (7, 'cloudcomputing', 'teacher', '云计算老师1', '三进团队成员', '/media/group/person7.jpg', '老师', '无');
INSERT INTO `group` VALUES (8, 'cloudcomputing', 'teacher', '云计算老师2', '三进团队成员', '/media/group/person8.jpg', '老师', '无');
INSERT INTO `group` VALUES (9, 'bioinformatic', 'teacher', '生物信息学老师1', '三进团队成员', '/media/group/person9.jpg', '老师', '无');
INSERT INTO `group` VALUES (10, 'bioinformatic', 'teacher', '生物信息学老师2', '三进团队成员', '/media/group/person10.jpg', '老师', '无');
INSERT INTO `group` VALUES (11, 'petroleumsoftware', 'teacher', '石油工业软件老师1', '三进团队成员', '/media/group/person2.jpg', '老师', '无');
INSERT INTO `group` VALUES (12, 'petroleumsoftware', 'teacher', '石油工业软件老师2', '三进团队成员', '/media/group/person3.jpg', '老师', '无');

SET FOREIGN_KEY_CHECKS = 1;
