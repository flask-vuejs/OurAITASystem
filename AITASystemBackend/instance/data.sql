/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80300
 Source Host           : localhost:3306
 Source Schema         : mydb1

 Target Server Type    : MySQL
 Target Server Version : 80300
 File Encoding         : 65001

 Date: 25/05/2024 19:51:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for data
-- ----------------------------
DROP TABLE IF EXISTS `data`;
CREATE TABLE `data`  (
  `data_id` int(0) NOT NULL AUTO_INCREMENT,
  `data_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `data_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `data_date` date NULL DEFAULT NULL,
  `data_author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `data_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `data_read_count` int(0) NULL DEFAULT 0,
  `data_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `data_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data
-- ----------------------------
INSERT INTO `data` VALUES (1, '测试数据集1', '1', '2024-05-01', '1', '1', 0, '1', 'correlationprediction');
INSERT INTO `data` VALUES (2, '测试数据集2', '2', '2024-05-04', '2', '2', 0, '2', 'medicalimage');
INSERT INTO `data` VALUES (3, '测试数据集3', '3', '2024-05-02', '3', '3', 0, '3', 'multiomicsanalysis');
INSERT INTO `data` VALUES (4, '自动驾驶技术的发展相关数据集', '自动驾驶技术的最新动态，包括感知、决策和控制等关键技术。', '2024-05-04', '赵六', 'https://img2.baidu.com/it/u=2015327666,2660446070&fm=253&fmt=auto&app=120&f=JPEG?w=962&h=500', 200, 'https://img2.baidu.com/it/u=2015327666,2660446070&fm=253&fmt=auto&app=120&f=JPEG?w=962&h=500', 'correlationprediction');
INSERT INTO `data` VALUES (5, '人工智能在教育中的应用相关数据集', '探讨人工智能如何改变教育行业，包括个性化学习、智能辅导等。', '2024-05-05', '孙七', 'http://example.com/ai-education', 180, 'http://example.com/images/ai_education.jpg', 'multiomicsanalysis');
INSERT INTO `data` VALUES (6, '机器视觉在工业自动化中的角色相关数据集', '机器视觉技术在提高工业自动化效率和质量方面的应用。', '2024-05-06', '周八', 'http://example.com/machine-vision', 160, 'http://example.com/images/machine_vision.jpg', 'medicalimage');
INSERT INTO `data` VALUES (7, '人工智能伦理问题探讨相关数据集', '讨论人工智能发展中的伦理问题，如隐私保护、算法偏见等。', '2024-05-07', '吴九', 'http://example.com/ai-ethics', 145, 'http://example.com/images/ai_ethics.jpg', 'medicalimage');
INSERT INTO `data` VALUES (8, '智能语音助手的发展相关数据集', '智能语音助手技术的发展，以及它们如何改善人们的生活。', '2024-05-08', '郑十', 'http://example.com/voice-assistant', 130, 'http://example.com/images/voice_assistant.jpg', 'multiomicsanalysis');
INSERT INTO `data` VALUES (9, '人工智能与艺术创作相关数据集', '人工智能在音乐、绘画等艺术创作领域的应用和影响。', '2024-05-09', '王十一', 'http://example.com/ai-art', 100, 'http://example.com/images/ai_art.jpg', 'correlationprediction');
INSERT INTO `data` VALUES (10, '人工智能在金融领域的创新相关数据集', '人工智能技术在风险管理、算法交易等金融领域的创新应用。', '2024-05-10', '陈十二', 'http://example.com/ai-finance', 165, 'http://example.com/images/ai_finance.jpg', 'correlationprediction');
INSERT INTO `data` VALUES (11, '人工智能的未来趋势相关数据集', '本文探讨了人工智能技术的未来发展方向，包括机器学习、自然语言处理等前沿领域。', '2024-05-01', '张三', 'http://example.com/ai-future', 150, 'http://example.com/images/ai_future.jpg', 'multiomicsanalysis');
INSERT INTO `data` VALUES (21, '深度学习在医疗领域的应用相关数据集', '深度学习技术在医疗影像分析、疾病预测等方面的应用案例分析。', '2024-05-02', '李四', 'http://example.com/deep-learning-medical', 120, 'http://example.com/images/deep_learning_medical.jpg', 'medicalimage');
INSERT INTO `data` VALUES (31, '自然语言处理的最新进展相关数据集', '介绍自然语言处理技术的最新研究进展，包括情感分析、机器翻译等。', '2024-05-03', '王五', 'http://example.com/nlp-progress', 95, 'http://example.com/images/nlp_progress.jpg', 'correlationprediction');

SET FOREIGN_KEY_CHECKS = 1;
