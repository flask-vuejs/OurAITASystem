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

 Date: 20/07/2024 10:22:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version`  (
  `version_num` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`version_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of alembic_version
-- ----------------------------
INSERT INTO `alembic_version` VALUES ('a8191143b272');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `papers_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `papers_id`(`papers_id` ASC) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`papers_id`) REFERENCES `papers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for data
-- ----------------------------
DROP TABLE IF EXISTS `data`;
CREATE TABLE `data`  (
  `data_id` int NOT NULL AUTO_INCREMENT,
  `data_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `data_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `data_date` datetime NULL DEFAULT NULL,
  `data_author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `data_link` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `data_read_count` int NULL DEFAULT 0,
  `data_image_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `data_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `data_abstract` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of data
-- ----------------------------
INSERT INTO `data` VALUES (1, '😞😞抑郁症检测数据集', '背景描述\r\n抑郁症是最常见的抑郁障碍，以显著而持久的心境低落为主要临床特征，是心境障碍的主要类型。\r\n临床可见心境低落与其处境不相称，情绪的消沉可以从闷闷不乐到悲痛欲绝，自卑抑郁，甚至悲观厌世，可有自杀企图或行为；甚至发生木僵；部分病例有明显的焦虑和运动性激越；严重者可出现幻觉、妄想等精神病性症状。每次发作持续至少2周以上、长者甚或数年，多数病例有反复发作的倾向，每次发作大多数可以缓解，部分可有残留症状或转为慢性。\r\n抑郁症与环境扰动引起的生物节律紊乱有关，例如白天的季节变化，由于轮班或经纬度旅行而引起的社会节律的改变。除了与昼夜节律不一致的生活方式有关外，昼夜节律也与自然日光周期不一致。抑郁症状的出现还与身体健康问题，医学副作用，生活事件和社会因素有关，除了酗酒和滥用药物外，这些因素还可能潜在地导致全人类的抑郁症状。\r\n全球抑郁症的终生患病率约为15％，但是严重程度不符合抑郁症诊断要求的发作的发生率要高得多。肌电记录运动活动被认为是观察抑郁症的一种客观方法，尽管在精神病学研究中这个话题还远远不够。\r\n数据说明\r\n数据集包含以下内容：两个文件夹，而一个包含控件的数据，一个包含条件组的数据。\r\n已为每位患者提供了一个csv文件，其中包含随时间推移收集的活动记录仪数据。\r\n这些列是：\r\ntimestamp-时间戳记（一分钟间隔）\r\ndate-日期（测量日期）\r\nactivity-活动（活动记录仪的活动测量）。\r\n此外，文件\\emph{scores.csv中提供的MADRS分数。\r\n它包含以下各列；\r\nnumber-🔢（患者标识符）\r\ndays-天数（测量的天数）\r\ngender-性别（女性或男性为1或2）\r\nage-年龄（年龄段的年龄）\r\nafftype-类型（1：双相情感障碍II，2：单相抑郁症，3：双相I ）\r\nmelanch-忧郁（1：抑郁症，2：无抑郁症）\r\ninpatient-住院（1：住院，2：门诊）\r\nedu-教育（按年分组的教育）\r\nmarriage-婚姻（1：已婚或同居，2：单身）\r\nwork-（1：工作或学习，2：失业/病假/养老金）\r\nmadrs1-记录开始时的MADRS得分\r\nmadrs2-记录结束时的MADRS得分\r\n数据来源\r\nhttps://www.kaggle.com/arashnic/the-depression-dataset\r\n问题描述\r\n可用的数据最终可以帮助研究人员开发能够基于传感器数据自动检测抑郁状态的系统。\r\n该数据集可能适用于（但不限于）以下：\r\n（i）将机器学习用于抑郁状态分类；\r\n（ii）根据运动活动数据预测MADRS得分，\r\n（iii）抑郁与非抑郁参与者的睡眠模式分析。\r\n该数据集可以用作评估不同机器学习方法和方法的基础，例如：成本敏感的分类和针对不平衡类问题的过采样技术。\r\n该数据集还适用于比较不同的机器学习分类方法，例如基于特征的方法和基于深度学习的方法，例如卷积神经网络和递归神经网络的时间序列。\r\n', '2024-05-01 00:00:00', 'sosososo', 'https://www.heywhale.com/mw/dataset/6030daf9891f960015d22262', 0, '/media/datasets/qotmy24ojj.jpeg', 'correlationprediction', '😞😞抑郁症检测数据集\n');
INSERT INTO `data` VALUES (2, '良性乳腺肿瘤数据集', '数据说明\n该数据集包含来自印度的 83 名患者的信息。该数据集包含患者的临床病史、组织病理学特征和乳房 X 线照片。该数据集的独特之处在于它收集了具有良性肿瘤的乳房 X 光照片，并用于良性肿瘤的亚分类。\n该数据包含一个包含 80 张乳房 X 光照片的 zip 文件夹和一个 excel 文件，其中包含所有患者的乳房 X 线摄影特征、组织病理学特征和临床特征。\n\n数据来源\nhttps://www.kaggle.com/datasets/mexwell/benign-breast-tumor-dataset', '2024-05-04 00:00:00', '吃饭睡觉样样精', 'https://www.heywhale.com/mw/dataset/6613d2bebb80e3616f252155', 0, '/media/datasets/08.png', 'medicalimage', '80 张乳房 X 光照片和一个具有多个功能的 csv 文件');
INSERT INTO `data` VALUES (3, '骨科患者的生物力学特征数据集', '背景介绍\n本数据集分为两个CSV文件：\n\ncolumn_3C_weka.csv (三类标签)\n本文件是将患者分为三类:正常(100例)、椎间盘突出(60例)或脊柱滑脱(150例)。\ncolumn_2C_weka.csv (两类标签)\n本文件将椎间盘突出和脊椎滑脱这两个类别合并到一个单独的类别中，称为“异常”。因此，第二个任务是将患者分为两类:正常(100例)和异常(210例)。', '2024-05-02 00:00:00', 'Vivian', 'https://www.heywhale.com/mw/dataset/5bfe52ce954d6e0010682abf', 0, '/media/datasets/ppmvwoh4cu.jpg', 'multiomicsanalysis', '根据6个特征对患者进行分类');
INSERT INTO `data` VALUES (4, '自动驾驶技术的发展相关数据集', '自动驾驶技术的最新动态，包括感知、决策和控制等关键技术。', '2024-05-04 00:00:00', '赵六', 'https://img2.baidu.com/it/u=2015327666,2660446070&fm=253&fmt=auto&app=120&f=JPEG?w=962&h=500', 200, 'https://img2.baidu.com/it/u=2015327666,2660446070&fm=253&fmt=auto&app=120&f=JPEG?w=962&h=500', 'correlationprediction', '自动驾驶技术的最新动态，包括感知、决策和控制等关键技术。');
INSERT INTO `data` VALUES (5, '人工智能在教育中的应用相关数据集', '探讨人工智能如何改变教育行业，包括个性化学习、智能辅导等。', '2024-05-05 00:00:00', '孙七', 'http://example.com/ai-education', 180, 'http://img.qiniu.shujujishi.com/47777131-e916-4070-ab01-bcb5ff87186b.png?imageView2/1/w/300/h/300/format/webp/interlace/1/q/100', 'multiomicsanalysis', '探讨人工智能如何改变教育行业，包括个性化学习、智能辅导等。');
INSERT INTO `data` VALUES (6, '机器视觉在工业自动化中的角色相关数据集', '机器视觉技术在提高工业自动化效率和质量方面的应用。', '2024-05-06 00:00:00', '周八', 'http://example.com/machine-vision', 160, 'http://img.qiniu.shujujishi.com/47777131-e916-4070-ab01-bcb5ff87186b.png?imageView2/1/w/300/h/300/format/webp/interlace/1/q/100', 'medicalimage', '机器视觉技术在提高工业自动化效率和质量方面的应用。');
INSERT INTO `data` VALUES (7, '人工智能伦理问题探讨相关数据集', '讨论人工智能发展中的伦理问题，如隐私保护、算法偏见等。', '2024-05-07 00:00:00', '吴九', 'http://example.com/ai-ethics', 145, 'http://img.qiniu.shujujishi.com/47777131-e916-4070-ab01-bcb5ff87186b.png?imageView2/1/w/300/h/300/format/webp/interlace/1/q/100', 'medicalimage', '讨论人工智能发展中的伦理问题，如隐私保护、算法偏见等。');
INSERT INTO `data` VALUES (8, '智能语音助手的发展相关数据集', '智能语音助手技术的发展，以及它们如何改善人们的生活。', '2024-05-08 00:00:00', '郑十', 'http://example.com/voice-assistant', 130, 'http://img.qiniu.shujujishi.com/47777131-e916-4070-ab01-bcb5ff87186b.png?imageView2/1/w/300/h/300/format/webp/interlace/1/q/100', 'multiomicsanalysis', '智能语音助手技术的发展，以及它们如何改善人们的生活。');
INSERT INTO `data` VALUES (9, '人工智能与艺术创作相关数据集', '人工智能在音乐、绘画等艺术创作领域的应用和影响。', '2024-05-09 00:00:00', '王十一', 'http://example.com/ai-art', 100, 'http://img.qiniu.shujujishi.com/47777131-e916-4070-ab01-bcb5ff87186b.png?imageView2/1/w/300/h/300/format/webp/interlace/1/q/100', 'correlationprediction', '人工智能在音乐、绘画等艺术创作领域的应用和影响。');
INSERT INTO `data` VALUES (10, '人工智能在金融领域的创新相关数据集', '人工智能技术在风险管理、算法交易等金融领域的创新应用。', '2024-05-10 00:00:00', '陈十二', 'http://example.com/ai-finance', 165, 'http://img.qiniu.shujujishi.com/47777131-e916-4070-ab01-bcb5ff87186b.png?imageView2/1/w/300/h/300/format/webp/interlace/1/q/100', 'correlationprediction', '人工智能技术在风险管理、算法交易等金融领域的创新应用。');
INSERT INTO `data` VALUES (11, '人工智能的未来趋势相关数据集', '本文探讨了人工智能技术的未来发展方向，包括机器学习、自然语言处理等前沿领域。', '2024-05-01 00:00:00', '张三', 'http://example.com/ai-future', 150, 'http://img.qiniu.shujujishi.com/47777131-e916-4070-ab01-bcb5ff87186b.png?imageView2/1/w/300/h/300/format/webp/interlace/1/q/100', 'multiomicsanalysis', '本文探讨了人工智能技术的未来发展方向，包括机器学习、自然语言处理等前沿领域。');
INSERT INTO `data` VALUES (21, '深度学习在医疗领域的应用相关数据集', '深度学习技术在医疗影像分析、疾病预测等方面的应用案例分析。', '2024-05-02 00:00:00', '李四', 'http://example.com/deep-learning-medical', 120, 'http://img.qiniu.shujujishi.com/47777131-e916-4070-ab01-bcb5ff87186b.png?imageView2/1/w/300/h/300/format/webp/interlace/1/q/100', 'medicalimage', '深度学习技术在医疗影像分析、疾病预测等方面的应用案例分析。');
INSERT INTO `data` VALUES (31, '自然语言处理的最新进展相关数据集', '介绍自然语言处理技术的最新研究进展，包括情感分析、机器翻译等。', '2024-05-03 00:00:00', '王五', 'http://example.com/nlp-progress', 95, 'http://img.qiniu.shujujishi.com/47777131-e916-4070-ab01-bcb5ff87186b.png?imageView2/1/w/300/h/300/format/webp/interlace/1/q/100', 'correlationprediction', '介绍自然语言处理技术的最新研究进展，包括情感分析、机器翻译等。');
INSERT INTO `data` VALUES (33, 'dc', 'dc', '2024-07-14 00:00:00', 'csdd', 'wed', 0, '', 'cds', 'dc');

-- ----------------------------
-- Table structure for data_label
-- ----------------------------
DROP TABLE IF EXISTS `data_label`;
CREATE TABLE `data_label`  (
  `label_id` int NOT NULL AUTO_INCREMENT,
  `label_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `label_description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  PRIMARY KEY (`label_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_label
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES (1, 'bioinformatic', 'student1', '生物信息学学生1', '三进团队成员，大三学生', '/media/group/person1.jpg', '本人性格开朗，热情大方，为人谦虚谨慎，细心周到，工作中勤于思考，积极进取。工作之余，始终把学习、培训和提高自身综合素质放在首位，具备良好的人际交往、工作协调及语言表达能力。对待工作认真、踏实、负责，能与同事融洽相处，具有优秀的团队合作精神及耐力。', '无');
INSERT INTO `group` VALUES (2, 'bioinformatic', 'student', '生物信息学学生2', '三进团队成员，大二学生', '/media/group/person2.jpg', '本人性格开朗，热情大方，为人谦虚谨慎，细心周到，工作中勤于思考，积极进取。工作之余，始终把学习、培训和提高自身综合素质放在首位，具备良好的人际交往、工作协调及语言表达能力。对待工作认真、踏实、负责，能与同事融洽相处，具有优秀的团队合作精神及耐力。', '无');
INSERT INTO `group` VALUES (3, 'cloudcomputing', 'student', '云计算学生1', '三进团队成员，大二学生', '/media/group/person3.jpg', '本人性格开朗，热情大方，为人谦虚谨慎，细心周到，工作中勤于思考，积极进取。工作之余，始终把学习、培训和提高自身综合素质放在首位，具备良好的人际交往、工作协调及语言表达能力。对待工作认真、踏实、负责，能与同事融洽相处，具有优秀的团队合作精神及耐力。', '无');
INSERT INTO `group` VALUES (4, 'petroleumsoftware', 'student', '石油工业软件学生1', '三进团队成员', '/media/group/person4.jpg', '大二学生', '无');
INSERT INTO `group` VALUES (5, 'petroleumsoftware', 'student', '石油工业软件学生2', '三进团队成员，学生', '/media/group/person5.jpg', '本人性格开朗，热情大方，为人谦虚谨慎，细心周到，工作中勤于思考，积极进取。工作之余，始终把学习、培训和提高自身综合素质放在首位，具备良好的人际交往、工作协调及语言表达能力。对待工作认真、踏实、负责，能与同事融洽相处，具有优秀的团队合作精神及耐力。', '无');
INSERT INTO `group` VALUES (6, 'cloudcomputing', 'student', '云计算学生2', '三进团队成员', '/media/group/person6.jpg', '大二学生', '无');
INSERT INTO `group` VALUES (7, 'cloudcomputing', 'teacher', '云计算老师1', '三进团队成员，老师', '/media/group/person7.jpg', '本人性格开朗，热情大方，为人谦虚谨慎，细心周到，工作中勤于思考，积极进取。工作之余，始终把学习、培训和提高自身综合素质放在首位，具备良好的人际交往、工作协调及语言表达能力。对待工作认真、踏实、负责，能与同事融洽相处，具有优秀的团队合作精神及耐力。', '无');
INSERT INTO `group` VALUES (8, 'cloudcomputing', 'teacher', '云计算老师2', '三进团队成员，老师', '/media/group/person8.jpg', '本人性格开朗，热情大方，为人谦虚谨慎，细心周到，工作中勤于思考，积极进取。工作之余，始终把学习、培训和提高自身综合素质放在首位，具备良好的人际交往、工作协调及语言表达能力。对待工作认真、踏实、负责，能与同事融洽相处，具有优秀的团队合作精神及耐力。', '无');
INSERT INTO `group` VALUES (9, 'bioinformatic', 'teacher', '生物信息学老师1', '三进团队成员，老师', '/media/group/person9.jpg', '本人性格开朗，热情大方，为人谦虚谨慎，细心周到，工作中勤于思考，积极进取。工作之余，始终把学习、培训和提高自身综合素质放在首位，具备良好的人际交往、工作协调及语言表达能力。对待工作认真、踏实、负责，能与同事融洽相处，具有优秀的团队合作精神及耐力。', '无');
INSERT INTO `group` VALUES (10, 'bioinformatic', 'teacher', '生物信息学老师2', '三进团队成员', '/media/group/person10.jpg', '老师', '无');
INSERT INTO `group` VALUES (11, 'petroleumsoftware', 'teacher', '石油工业软件老师1', '三进团队成员，副教授', '/media/group/person2.jpg', '本人性格开朗，热情大方，为人谦虚谨慎，细心周到，工作中勤于思考，积极进取。工作之余，始终把学习、培训和提高自身综合素质放在首位，具备良好的人际交往、工作协调及语言表达能力。对待工作认真、踏实、负责，能与同事融洽相处，具有优秀的团队合作精神及耐力。', '无');
INSERT INTO `group` VALUES (12, 'petroleumsoftware', 'teacher', '石油工业软件老师2', '三进团队成员', '/media/group/person3.jpg', '老师', '无');
INSERT INTO `group` VALUES (13, 'asvaw', 'vwgrr', 'vwvw', 'vwrfev', '/media/group/person1.jpg', 'vefrberbvf', NULL);
INSERT INTO `group` VALUES (14, 'asvaw', 'vwgrr', 'vwvw', 'vwrfev', '/media/group/person1.jpg', 'vefrberbvf', NULL);

-- ----------------------------
-- Table structure for hxxm
-- ----------------------------
DROP TABLE IF EXISTS `hxxm`;
CREATE TABLE `hxxm`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `client` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `project_manager` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `budget` float NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hxxm
-- ----------------------------
INSERT INTO `hxxm` VALUES (1, '企业级大数据分析平台开发', '本项目将为企业开发一款大数据分析平台，帮助企业实现对海量数据的快速处理和分析。平台将采用分布式计算框架，支持多种数据源接入和数据可视化展示，提升企业数据驱动决策的能力。', '某大型企业', '2023-05-01 00:00:00', '2024-04-30 00:00:00', '王五', 1000000);
INSERT INTO `hxxm` VALUES (2, '智能家居控制系统设计与实现', '本项目旨在为家庭用户提供一套智能家居控制系统解决方案，实现家居设备的智能化管理和控制。系统将支持多种智能家居设备的接入和控制，提供友好的用户界面和丰富的功能，提升家居生活的便捷性和舒适度。', '某智能家居公司', '2023-06-15 00:00:00', '2023-12-31 00:00:00', '赵六', 200000);
INSERT INTO `hxxm` VALUES (3, '智慧医疗信息管理系统建设', '本项目旨在为医疗机构开发一套智慧医疗信息管理系统，实现医疗资源的优化配置和医疗服务的数字化管理。系统将支持电子病历管理、医疗设备监控、药品管理等功能，提升医疗服务质量和效率。', '某三甲医院', '2023-07-01 00:00:00', '2024-06-30 00:00:00', '孙七', 800000);
INSERT INTO `hxxm` VALUES (4, '智慧城市交通管理系统开发', '本项目将开发一套智慧城市交通管理系统，实现城市交通的智能化调度和管理。系统将采用先进的交通流分析和预测算法，为交通管理部门提供科学的交通管理决策支持，提升城市交通的流畅性和安全性。', '某市政府', '2023-08-15 00:00:00', '2025-08-14 00:00:00', '李八', 1500000);
INSERT INTO `hxxm` VALUES (5, '在线教育平台优化与升级', '本项目将针对现有在线教育平台进行优化和升级，提升平台的稳定性和用户体验。项目将采用最新的云计算和人工智能技术，加强平台的教学资源管理和个性化学习推荐，助力在线教育行业的创新发展。', '某在线教育公司', '2023-09-01 00:00:00', '2024-02-29 00:00:00', '周九', 350000);

-- ----------------------------
-- Table structure for models
-- ----------------------------
DROP TABLE IF EXISTS `models`;
CREATE TABLE `models`  (
  `models_id` int NOT NULL AUTO_INCREMENT,
  `models_disease` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `models_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `models_input_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `models_input_num` int NULL DEFAULT NULL,
  `models_path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `models_parameters` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`models_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of models
-- ----------------------------

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `news_id` int NOT NULL AUTO_INCREMENT,
  `news_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `news_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `news_author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `news_date` datetime NULL DEFAULT NULL,
  `news_link` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `news_read_count` int NULL DEFAULT NULL,
  `news_image_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `label_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`news_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, '专家访谈：打造人工智能创新生态圈  积蓄高质量发展新动能', 'QMG青岛广电4月15日讯  凭借强大的对话能力和以假乱真的视觉表现，人工智能成为当今科技领域最受瞩目的一颗明珠。人工智能的迭代日新月异，会给生活带来哪些改变？面对时代的机遇和挑战，青岛的人工智能产业该从哪些方面发力？本台记者专访了中国石油大学计算机科学与技术学院副教授曹绍华。\r\n\r\n中国石油大学计算机科学与技术学院副教授 曹绍华：人工智能能够使计算机或机器以类似于人类的方式理解、学习、判断和解决问题，它延伸和扩展了人类智能，是引领未来的战略性技术，也是新质生产力的典型代表。\r\n\r\n我在2001年开始接触人工智能，在中国石油大学工作之后，主要从事边缘智能以及通过人工智能在石油相关领域预测与解释等方面的研究，比如在研的课题有一项是通过深度学习模型对钻井过程中地层孔隙压力进行预测，该项技术成熟应用后，可以有效减少钻井事故的发生。\r\n\r\n人工智能会给我们的生活带来什么变化？\r\n\r\n人工智能是全球新一轮科技革命和产业变革的核心驱动力，出现了像ChatGPT、Sora等大批生成式AI的新技术和新业态。眼下，人工智能正在逐步改变我们的生活方式，比如在医疗领域，帮助医生进行疾病诊断，提高治疗的精准性；在交通领域，自动驾驶和智能交通将减少交通拥堵和事故；在教育领域，可以为学生提供个性化学习计划……总之，AI将使我们的生活更加便捷、高效和安全。\r\n\r\n青岛发展人工智能有哪些优势？\r\n\r\n青岛是中国的重要工业基地之一，尤其在高端制造业、海洋科技、生物技术等领域有着坚实的基础，并且拥有多所知名高校和研究机构，在人工智能及相关领域具有较强的研发能力和人才培养优势。青岛市高度重视人工智能产业发展，出台了系列扶持政策，并将人工智能列为24条重点发展的产业链之一。2019年，青岛获批全国第二个人工智能创新应用先导区，同时借助“打造工业互联网之都”“工赋青岛 智造强市”等一系列活动，已在多个维度上取得突破性发展。\r\n\r\n青岛发展人工智能应该从哪些方面发力？\r\n\r\n目前青岛拥有青岛海洋国家超算中心，中国移动智算中心（青岛）等大量的算力资源，可以进一步统筹整合，同时加强人工智能产业园区建设，加强人才培养与国际交流，建立产学研用紧密结合的合作机制，形成人工智能创新生态圈。特别是要运用人工智能技术，推动制造业、港口物流、海洋科技等传统优势行业的转型升级，提高交通、教育、医疗、城市管理等公共服务领域的服务质效，从而进一步巩固和扩大青岛在人工智能领域的领先地位，推动发展新质生产力，促进整个城市经济社会的高质量发展。', '蓝睛', '2024-04-15 20:05:00', 'https://lanjingshare.qtvnews.com/share-html/lanjing/share/newsDetailsLj.html?id=16189031', 29348, '/media/news/1.png', 1);
INSERT INTO `news` VALUES (2, '学院举办新进教师发展座谈会', '为加强学院教师队伍建设，促进青年教师成长发展，加强对新进教师教学和科研能力的指导，4月9日上午学院举办新进教师发展座谈会。会议由建设办公室主任兼副院长刘培勇主持，学院领导班子成员、指导教师、2020-2023年新进青年教师参加会议。\r\n\r\n\r\n\r\n新进教师逐一汇报了来院后在教学科研、学科和专业建设、服务学院发展等方面开展的工作，谈到了在课堂教学、科研方向探索、研究生培养等方面遇到的问题和困惑，以及下一步的工作计划。陈程立诏分享了他在主讲《机器学习》课程中的心得体会，并将深入挖掘专业课程中所蕴含的思想政治教育资源，做好育人工作；感谢学院提供良好的工作环境，提升了青年教师的幸福感和荣誉感。\r\n\r\n\r\n\r\n与会院领导和指导教师逐项回应了发言教师提出的问题，结合自身成长经历给出了建设性意见。副院长宋弢提到，青年教师在关注所在岗位的职责和聘期任务的同时，也要注重全面发展，在人才培养、科学研究、社会服务过程中实现职业生涯的长远发展。李克文教授讲述了自己进校初期的教学科研经历，鼓励青年教师积极参与学院工作，将自身发展与学院发展紧密相连，充分利用学院提供的优质平台和资源，和学院一起成长、和学院一起发展。\r\n\r\n\r\n\r\n院长庞善臣在座谈会上首先感谢新进教师对学院的热爱和所做的贡献，承诺学院将尽全力支持和保障青年教师的发展与进步，并对青年教师提出了期许。一是既要“走出去”，也要“请进来”，主动加强学术交流，扩展研究视野和方法，找准自身的科研定位；二是作为课堂的第一责任人，青年教师要以高度责任感和使命感投身课堂教学工作，营造良好的教学氛围，做好教学研究，提升教育教学能力；三是要把握新时代大学生成长发展规律，注重育人实效，激发学生学习的内生动力，共同促进学院学风建设；四是青年教师要做到“人岗适配”，深入了解学校学院政策以及发展规划，为自己做好长远的职业规划。\r\n\r\n\r\n\r\n刘培勇在总结中指出，本次座谈会搭建了学院与青年教师双向沟通的交流平台，今后将定期举行，持续为青年教师提供相互切磋、相互学习、共同发展的大平台，实现青年教师综合能力的大发展；青年教师是学院发展的主力军和生力军，是学院发展的可见未来，希望青年教师把自身发展融入学院发展大局，在全面推进软件学院的内涵建设中贡献智慧与力量。', '杨素琴', '2024-04-10 11:30:00', 'https://computer.upc.edu.cn/2024/0410/c6277a427996/page.htm', 150, '/media/news/2.jpg', 2);
INSERT INTO `news` VALUES (4, '青岛软件园来校对接争创“中国软件名园”工作', '4月3日，青岛市市南区工业和信息化局党组成员、区化工专项行动办专职副主任陆晗，青岛海诺投资发展有限公司（青岛软件园）副总经理贺长泽一行来校对接争创“中国软件名园”工作。青岛软件学院、计算机科学与技术学院副院长宋弢，青岛软件学院建设办公室副主任王林富，产学研合作办公室主任刘培刚，学院办公室主任张玮参会。\r\n\r\n\r\n\r\n双方主要围绕建设“中国软件名园”重点指标中的开源能力指标，针对目前开源项目孵化少、人才和技术缺乏的现状，就组织专题研讨会、开展开源战略与创新管理培训、设立开源人才培训班等活动的必要性和可行性进行深入讨论，表达了进一步推动市南区政府、青岛软件园、青岛软件学院与开源基金会开展实质性合作的强烈意愿。下一步，双方将共同探索与开源基金会的合作机制，汇聚“政产学研”各界力量，全力营造区域性的良性开源生态。\r\n\r\n此外，双方还围绕组织学生入园实习实训，助力就业创业和人才留青、组织举办第三届“东方杯”大赛等内容进行交流，持续深化校企合作和院园合作，携手为青岛市软件和信息服务产业高质量发展做出更大贡献。', '张爱艳', '2024-04-03 02:00:00', 'https://computer.upc.edu.cn/2024/0403/c6277a427526/page.htm', 240, '/media/news/3.jpg', 2);
INSERT INTO `news` VALUES (7, '中共中央举行新闻发布会解读党的二十届三中全会精神', '坚定不移高举改革开放旗帜、紧紧围绕推进中国式现代化进一步全面深化改革\n\n——中共中央举行新闻发布会解读党的二十届三中全会精神\n\n7月15日至18日，党的二十届三中全会在北京召开。此次全会是在新时代新征程上，中国共产党坚定不移高举改革开放旗帜、紧紧围绕推进中国式现代化进一步全面深化改革召开的一次十分重要的会议。\n\n7月19日，中共中央举行新闻发布会，介绍和解读党的二十届三中全会精神。\n\n全会最重要的成果是审议通过了《中共中央关于进一步全面深化改革、推进中国式现代化的决定》\n\n中央政策研究室副主任唐方裕介绍说，全会最重要的成果，就是审议通过了《中共中央关于进一步全面深化改革、推进中国式现代化的决定》。全会《决定》的起草，是在党中央领导下进行的。习近平总书记亲自担任文件起草组组长，全程擘画、组织调研、精心指导、把脉定向，发挥了决定性作用。\n\n“把进一步全面深化改革、推进中国式现代化作为全会主题，抓住了事业发展的核心和关键，意义十分重大。”唐方裕说。\n\n“党中央确定以此为全会主题，是经过深思熟虑的。”唐方裕表示，一方面，推进中国式现代化面临许多复杂矛盾和问题，必须克服种种困难和阻力，需要通过进一步全面深化改革，推动生产关系和生产力、上层建筑和经济基础、国家治理和社会发展更好相适应，为中国式现代化提供强大动力和制度保障。另一方面，中国式现代化作为新时代新征程党的中心任务，包括进一步全面深化改革在内的党和国家一切重大战略部署，都必须紧紧围绕推进中国式现代化来谋划和展开。\n\n“全会召开期间，与会同志对《决定》稿讨论热烈，给予高度评价。普遍认为，《决定》既是党的十八届三中全会以来全面深化改革的实践续篇，也是新征程推进中国式现代化的时代新篇，是我们党历史上又一重要纲领性文献。”他说。\n\n党中央总结新时代以来全面深化改革重大成就作出重要判断\n\n全国政协副主席、中央改革办分管日常工作的副主任穆虹介绍说，《决定》开篇指出，党的十一届三中全会是划时代的，开启了改革开放和社会主义现代化建设新时期。党的十八届三中全会也是划时代的，开启了新时代全面深化改革、系统整体设计推进改革新征程，开创了我国改革开放全新局面。\n\n“这是党中央总结新时代以来全面深化改革重大成就作出的重要判断。”他表示，这些历史性成就的取得，根本在于以习近平同志为核心的党中央领航掌舵，在于习近平新时代中国特色社会主义思想科学指引。', '新华社', '2024-07-19 22:03:16', 'https://finance.sina.com.cn/tech/roll/2024-07-19/doc-incesnuz7823909.shtml', 0, '/media/news/th.jpg', 3);

-- ----------------------------
-- Table structure for news_label
-- ----------------------------
DROP TABLE IF EXISTS `news_label`;
CREATE TABLE `news_label`  (
  `label_id` int NOT NULL AUTO_INCREMENT,
  `label_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `label_description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  PRIMARY KEY (`label_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news_label
-- ----------------------------

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
  `abstract` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `keywords` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of papers
-- ----------------------------
INSERT INTO `papers` VALUES (1, '论文1', '3.3 显示博客详情\r\n如果没有前后端分离，即 Flask 使用 Jinja2 模版引擎来渲染页面的话，我会考虑用户输入 Markdown 原文，后台 Python 自动转换成 HTML 文档（使用 Python-Markdown 和 bleach）后存储到数据库中，然后展示时 Jinja2 使用过滤器 content_html | safe 直接解析 HTML 文档\r\n\r\n(1) vue-markdown\r\n但是，按照这个思路，由于转换后的 HTML 文档中包含很多 \\n 字符，Vue.js 的 v-html 指令并不能解析！！！ 所以，换种方式，数据库中只保存 Markdown 原文，前端渲染使用 vue-markdown 插件：', '2023-05-01 18:14:20', 'person1', '/media/papers/person1.jpg', '本文探讨了HTML内容在论文表示中的应用，包括加粗、斜体、下划线等标签的使用，以及列表、表格和图片的插入。这些HTML元素能够丰富论文的表达方式，提升可读性和视觉效果。', 'HTML, 论文模型, 内容表示, 可读性');
INSERT INTO `papers` VALUES (2, '论文2', '3.3 显示博客详情\r\n如果没有前后端分离，即 Flask 使用 Jinja2 模版引擎来渲染页面的话，我会考虑用户输入 Markdown 原文，后台 Python 自动转换成 HTML 文档（使用 Python-Markdown 和 bleach）后存储到数据库中，然后展示时 Jinja2 使用过滤器 content_html | safe 直接解析 HTML 文档\r\n\r\n(1) vue-markdown\r\n但是，按照这个思路，由于转换后的 HTML 文档中包含很多 \\n 字符，Vue.js 的 v-html 指令并不能解析！！！ 所以，换种方式，数据库中只保存 Markdown 原文，前端渲染使用 vue-markdown 插件：', '2023-11-01 18:14:20', 'person2', '/media/papers/person2.jpg', '本文探讨了HTML内容在论文表示中的应用，包括加粗、斜体、下划线等标签的使用，以及列表、表格和图片的插入。这些HTML元素能够丰富论文的表达方式，提升可读性和视觉效果。', 'HTML, 论文模型, 内容表示, 可读性');
INSERT INTO `papers` VALUES (3, '论文3', '这是论文3的内容摘要...', '2024-04-23 17:16:37', 'person3', '/media/papers/person3.jpg', '本文探讨了HTML内容在论文表示中的应用，包括加粗、斜体、下划线等标签的使用，以及列表、表格和图片的插入。这些HTML元素能够丰富论文的表达方式，提升可读性和视觉效果。', 'HTML, 论文模型, 内容表示, 可读性');
INSERT INTO `papers` VALUES (4, '论文4', '这是论文4的内容摘要...', '2024-04-23 18:24:17', 'person4', '/media/papers/person4.jpg', '本文探讨了HTML内容在论文表示中的应用，包括加粗、斜体、下划线等标签的使用，以及列表、表格和图片的插入。这些HTML元素能够丰富论文的表达方式，提升可读性和视觉效果。', 'HTML, 论文模型, 内容表示, 可读性');
INSERT INTO `papers` VALUES (5, '论文5', '这是论文5的内容摘要...', '2024-04-23 19:22:10', 'person5', '/media/papers/person5.jpg', '本文探讨了HTML内容在论文表示中的应用，包括加粗、斜体、下划线等标签的使用，以及列表、表格和图片的插入。这些HTML元素能够丰富论文的表达方式，提升可读性和视觉效果。', 'HTML, 论文模型, 内容表示, 可读性');
INSERT INTO `papers` VALUES (6, '论文6', '3.3 显示博客详情\r\n如果没有前后端分离，即 Flask 使用 Jinja2 模版引擎来渲染页面的话，我会考虑用户输入 Markdown 原文，后台 Python 自动转换成 HTML 文档（使用 Python-Markdown 和 bleach）后存储到数据库中，然后展示时 Jinja2 使用过滤器 content_html | safe 直接解析 HTML 文档\r\n\r\n(1) vue-markdown\r\n但是，按照这个思路，由于转换后的 HTML 文档中包含很多 \\n 字符，Vue.js 的 v-html 指令并不能解析！！！ 所以，换种方式，数据库中只保存 Markdown 原文，前端渲染使用 vue-markdown 插件：\r\n\r\nD:\\python-code\\flask-vuejs-madblog\\front-end>cnpm install vue-markdown --save\r\n创建 front-end/src/components/Post.vue，引入子组件 vue-markdown：\r\n\r\n<template>\r\n  <div class=\"container\">\r\n    ...\r\n           <!-- vue-markdown 开始解析markdown，它是子组件，通过 props 给它传值即可 -->\r\n            <vue-markdown\r\n              :source=\"post.body\"\r\n              :toc=\"showToc\"\r\n              :toc-first-level=\"1\"\r\n              :toc-last-level=\"3\"\r\n              v-on:toc-rendered=\"tocAllRight\"\r\n              toc-id=\"toc\"\r\n              class=\"markdown-body\">\r\n            </vue-markdown>\r\n    ...\r\n  </div>\r\n</template>\r\n\r\n<script>\r\n// 导入 vue-markdown 组件解析 markdown 原文为　HTML\r\nimport VueMarkdown from \'vue-markdown\'\r\n\r\nexport default {\r\n  name: \'Post\',\r\n  components: {\r\n    VueMarkdown\r\n  },\r\n  data() {\r\n    return {\r\n      sharedState: store.state,\r\n      post: {},\r\n      editForm: {\r\n        title: \'\',\r\n        summary: \'\',\r\n        body: \'\',\r\n        errors: 0,  // 表单是否在前端验证通过，0 表示没有错误，验证通过\r\n        titleError: null,\r\n        bodyError: null\r\n      },\r\n      showToc: true\r\n    }\r\n  },\r\n  ...\r\n</script>\r\n此时，你看到的页面是这样子的：\r\n\r\npost detail 01\r\n\r\n(2) highlight.js\r\n使用 highlight.js 语法高亮：\r\n\r\nD:\\python-code\\flask-vuejs-madblog\\front-end>cnpm install highlight.js --save\r\n在 Post.vue 组件中：\r\n\r\n<script>\r\n// vue-router 从 Home 页路由到 Post 页后，会重新渲染并且会移除事件，自定义的指令 v-highlight 也不生效了\r\n// 所以，这个页面，在 mounted() 和 updated() 方法中调用 highlightCode() 可以解决代码不高亮问题\r\nimport hljs from \'highlight.js\'\r\nconst highlightCode = () => {\r\n  let blocks = document.querySelectorAll(\'pre code\');\r\n  blocks.forEach((block)=>{\r\n    hljs.highlightBlock(block)\r\n  })\r\n}\r\n\r\nexport default {\r\n  ...\r\n  mounted () {\r\n    highlightCode()\r\n  },\r\n  updated () {\r\n    highlightCode()\r\n  }\r\n}\r\n</script>\r\n先选中一款模版，在 front-end/src/main.js 中导入 css 文件：\r\n\r\n// 样式文件，浅色：default, atelier-dune-light  深色：atom-one-dark, atom-one-dark-reasonable, monokai\r\nimport \'highlight.js/styles/atom-one-dark-reasonable.css\'\r\n现在你看到的页面如下：', '2024-04-23 19:26:21', 'person6', '/media/papers/person6.jpg', '本文探讨了HTML内容在论文表示中的应用，包括加粗、斜体、下划线等标签的使用，以及列表、表格和图片的插入。这些HTML元素能够丰富论文的表达方式，提升可读性和视觉效果。', 'HTML, 论文模型, 内容表示, 可读性');
INSERT INTO `papers` VALUES (7, '论文7', '3.3 显示博客详情\r\n如果没有前后端分离，即 Flask 使用 Jinja2 模版引擎来渲染页面的话，我会考虑用户输入 Markdown 原文，后台 Python 自动转换成 HTML 文档（使用 Python-Markdown 和 bleach）后存储到数据库中，然后展示时 Jinja2 使用过滤器 content_html | safe 直接解析 HTML 文档\r\n\r\n(1) vue-markdown\r\n但是，按照这个思路，由于转换后的 HTML 文档中包含很多 \\n 字符，Vue.js 的 v-html 指令并不能解析！！！ 所以，换种方式，数据库中只保存 Markdown 原文，前端渲染使用 vue-markdown 插件：\r\n\r\nD:\\python-code\\flask-vuejs-madblog\\front-end>cnpm install vue-markdown --save\r\n创建 front-end/src/components/Post.vue，引入子组件 vue-markdown：\r\n\r\n<template>\r\n  <div class=\"container\">\r\n    ...\r\n           <!-- vue-markdown 开始解析markdown，它是子组件，通过 props 给它传值即可 -->\r\n            <vue-markdown\r\n              :source=\"post.body\"\r\n              :toc=\"showToc\"\r\n              :toc-first-level=\"1\"\r\n              :toc-last-level=\"3\"\r\n              v-on:toc-rendered=\"tocAllRight\"\r\n              toc-id=\"toc\"\r\n              class=\"markdown-body\">\r\n            </vue-markdown>\r\n    ...\r\n  </div>\r\n</template>\r\n\r\n<script>\r\n// 导入 vue-markdown 组件解析 markdown 原文为　HTML\r\nimport VueMarkdown from \'vue-markdown\'\r\n\r\nexport default {\r\n  name: \'Post\',\r\n  components: {\r\n    VueMarkdown\r\n  },\r\n  data() {\r\n    return {\r\n      sharedState: store.state,\r\n      post: {},\r\n      editForm: {\r\n        title: \'\',\r\n        summary: \'\',\r\n        body: \'\',\r\n        errors: 0,  // 表单是否在前端验证通过，0 表示没有错误，验证通过\r\n        titleError: null,\r\n        bodyError: null\r\n      },\r\n      showToc: true\r\n    }\r\n  },\r\n  ...\r\n</script>\r\n此时，你看到的页面是这样子的：\r\n\r\npost detail 01\r\n\r\n(2) highlight.js\r\n使用 highlight.js 语法高亮：\r\n\r\nD:\\python-code\\flask-vuejs-madblog\\front-end>cnpm install highlight.js --save\r\n在 Post.vue 组件中：\r\n\r\n<script>\r\n// vue-router 从 Home 页路由到 Post 页后，会重新渲染并且会移除事件，自定义的指令 v-highlight 也不生效了\r\n// 所以，这个页面，在 mounted() 和 updated() 方法中调用 highlightCode() 可以解决代码不高亮问题\r\nimport hljs from \'highlight.js\'\r\nconst highlightCode = () => {\r\n  let blocks = document.querySelectorAll(\'pre code\');\r\n  blocks.forEach((block)=>{\r\n    hljs.highlightBlock(block)\r\n  })\r\n}\r\n\r\nexport default {\r\n  ...\r\n  mounted () {\r\n    highlightCode()\r\n  },\r\n  updated () {\r\n    highlightCode()\r\n  }\r\n}\r\n</script>\r\n先选中一款模版，在 front-end/src/main.js 中导入 css 文件：\r\n\r\n// 样式文件，浅色：default, atelier-dune-light  深色：atom-one-dark, atom-one-dark-reasonable, monokai\r\nimport \'highlight.js/styles/atom-one-dark-reasonable.css\'\r\n现在你看到的页面如下：', '2024-04-23 19:45:27', 'person7', '/media/papers/person7.jpg', '本文探讨了HTML内容在论文表示中的应用，包括加粗、斜体、下划线等标签的使用，以及列表、表格和图片的插入。这些HTML元素能够丰富论文的表达方式，提升可读性和视觉效果。', 'HTML, 论文模型, 内容表示, 可读性');
INSERT INTO `papers` VALUES (8, '论文8', '3.3 显示博客详情\r\n如果没有前后端分离，即 Flask 使用 Jinja2 模版引擎来渲染页面的话，我会考虑用户输入 Markdown 原文，后台 Python 自动转换成 HTML 文档（使用 Python-Markdown 和 bleach）后存储到数据库中，然后展示时 Jinja2 使用过滤器 content_html | safe 直接解析 HTML 文档\r\n\r\n(1) vue-markdown\r\n但是，按照这个思路，由于转换后的 HTML 文档中包含很多 \\n 字符，Vue.js 的 v-html 指令并不能解析！！！ 所以，换种方式，数据库中只保存 Markdown 原文，前端渲染使用 vue-markdown 插件：\r\n\r\nD:\\python-code\\flask-vuejs-madblog\\front-end>cnpm install vue-markdown --save\r\n创建 front-end/src/components/Post.vue，引入子组件 vue-markdown：\r\n\r\n<template>\r\n  <div class=\"container\">\r\n    ...\r\n           <!-- vue-markdown 开始解析markdown，它是子组件，通过 props 给它传值即可 -->\r\n            <vue-markdown\r\n              :source=\"post.body\"\r\n              :toc=\"showToc\"\r\n              :toc-first-level=\"1\"\r\n              :toc-last-level=\"3\"\r\n              v-on:toc-rendered=\"tocAllRight\"\r\n              toc-id=\"toc\"\r\n              class=\"markdown-body\">\r\n            </vue-markdown>\r\n    ...\r\n  </div>\r\n</template>\r\n\r\n<script>\r\n// 导入 vue-markdown 组件解析 markdown 原文为　HTML\r\nimport VueMarkdown from \'vue-markdown\'\r\n\r\nexport default {\r\n  name: \'Post\',\r\n  components: {\r\n    VueMarkdown\r\n  },\r\n  data() {\r\n    return {\r\n      sharedState: store.state,\r\n      post: {},\r\n      editForm: {\r\n        title: \'\',\r\n        summary: \'\',\r\n        body: \'\',\r\n        errors: 0,  // 表单是否在前端验证通过，0 表示没有错误，验证通过\r\n        titleError: null,\r\n        bodyError: null\r\n      },\r\n      showToc: true\r\n    }\r\n  },\r\n  ...\r\n</script>\r\n此时，你看到的页面是这样子的：\r\n\r\npost detail 01\r\n\r\n(2) highlight.js\r\n使用 highlight.js 语法高亮：\r\n\r\nD:\\python-code\\flask-vuejs-madblog\\front-end>cnpm install highlight.js --save\r\n在 Post.vue 组件中：\r\n\r\n<script>\r\n// vue-router 从 Home 页路由到 Post 页后，会重新渲染并且会移除事件，自定义的指令 v-highlight 也不生效了\r\n// 所以，这个页面，在 mounted() 和 updated() 方法中调用 highlightCode() 可以解决代码不高亮问题\r\nimport hljs from \'highlight.js\'\r\nconst highlightCode = () => {\r\n  let blocks = document.querySelectorAll(\'pre code\');\r\n  blocks.forEach((block)=>{\r\n    hljs.highlightBlock(block)\r\n  })\r\n}\r\n\r\nexport default {\r\n  ...\r\n  mounted () {\r\n    highlightCode()\r\n  },\r\n  updated () {\r\n    highlightCode()\r\n  }\r\n}\r\n</script>\r\n先选中一款模版，在 front-end/src/main.js 中导入 css 文件：\r\n\r\n// 样式文件，浅色：default, atelier-dune-light  深色：atom-one-dark, atom-one-dark-reasonable, monokai\r\nimport \'highlight.js/styles/atom-one-dark-reasonable.css\'\r\n现在你看到的页面如下：', '2024-04-23 22:00:00', 'person8', '/media/papers/person8.jpg', '本文探讨了HTML内容在论文表示中的应用，包括加粗、斜体、下划线等标签的使用，以及列表、表格和图片的插入。这些HTML元素能够丰富论文的表达方式，提升可读性和视觉效果。', 'HTML, 论文模型, 内容表示, 可读性');
INSERT INTO `papers` VALUES (9, '论文9', '### 3.3 显示博客详情\n   如果没有前后端分离，即 Flask 使用 Jinja2 模版引擎来渲染页面的话，我会考虑用户输入 Markdown 原文，后台 Python 自动转换成 HTML 文档（使用 Python-Markdown 和 bleach）后存储到数据库中，然后展示时 Jinja2 使用过滤器 content_html | safe 直接解析 HTML 文档\n\n(1) vue-markdown\n但是，按照这个思路，由于转换后的 HTML 文档中包含很多 \\n 字符，Vue.js 的 v-html 指令并不能解析！！！ 所以，换种方式，数据库中只保存 Markdown 原文，前端渲染使用 vue-markdown 插件：\n\n> D:\\python-code\\flask-vuejs-madblog\\front-end>cnpm install vue-markdown --save\n> 创建 front-end/src/components/Post.vue，引入子组件 vue-markdown：\n\n				<template>\n					<div class=\"container\">\n						...\n									 <!-- vue-markdown 开始解析markdown，它是子组件，通过 props 给它传值即可 -->\n										<vue-markdown\n											:source=\"post.body\"\n											:toc=\"showToc\"\n											:toc-first-level=\"1\"\n											:toc-last-level=\"3\"\n											v-on:toc-rendered=\"tocAllRight\"\n											toc-id=\"toc\"\n											class=\"markdown-body\">\n										</vue-markdown>\n						...\n					</div>\n				</template>\n\n				<script>\n				// 导入 vue-markdown 组件解析 markdown 原文为　HTML\n				import VueMarkdown from \'vue-markdown\'\n\n				export default {\n					name: \'Post\',\n					components: {\n						VueMarkdown\n					},\n					data() {\n						return {\n							sharedState: store.state,\n							post: {},\n							editForm: {\n								title: \'\',\n								summary: \'\',\n								body: \'\',\n								errors: 0,  // 表单是否在前端验证通过，0 表示没有错误，验证通过\n								titleError: null,\n								bodyError: null\n							},\n							showToc: true\n						}\n					},\n					...\n				</script>\n此时，你看到的页面是这样子的：\n\n>post detail 01\n\n(2) highlight.js\n使用 highlight.js 语法高亮：\n\n> D:\\python-code\\flask-vuejs-madblog\\front-end>cnpm install highlight.js --save\n> 在 Post.vue 组件中：\n\n				<script>\n				// vue-router 从 Home 页路由到 Post 页后，会重新渲染并且会移除事件，自定义的指令 v-highlight 也不生效了\n				// 所以，这个页面，在 mounted() 和 updated() 方法中调用 highlightCode() 可以解决代码不高亮问题\n				import hljs from \'highlight.js\'\n				const highlightCode = () => {\n					let blocks = document.querySelectorAll(\'pre code\');\n					blocks.forEach((block)=>{\n						hljs.highlightBlock(block)\n					})\n				}\n\n				export default {\n					...\n					mounted () {\n						highlightCode()\n					},\n					updated () {\n						highlightCode()\n					}\n				}\n				</script>\n先选中一款模版，在 front-end/src/main.js 中导入 css 文件：\n\n// 样式文件，浅色：default, atelier-dune-light  深色：atom-one-dark, atom-one-dark-reasonable, monokai\nimport \'highlight.js/styles/atom-one-dark-reasonable.css\'\n现在你看到的页面如下：', '2024-04-27 18:16:40', 'person9', '/media/papers/person9.jpg', '本文探讨了HTML内容在论文表示中的应用，包括加粗、斜体、下划线等标签的使用，以及列表、表格和图片的插入。这些HTML元素能够丰富论文的表达方式，提升可读性和视觉效果。', 'HTML, 论文模型, 内容表示, 可读性');
INSERT INTO `papers` VALUES (10, '论文10', '### 3.3 显示博客详情\n   如果没有前后端分离，即 Flask 使用 Jinja2 模版引擎来渲染页面的话，我会考虑用户输入 Markdown 原文，后台 Python 自动转换成 HTML 文档（使用 Python-Markdown 和 bleach）后存储到数据库中，然后展示时 Jinja2 使用过滤器 content_html | safe 直接解析 HTML 文档\n\n(1) vue-markdown\n但是，按照这个思路，由于转换后的 HTML 文档中包含很多 \\n 字符，Vue.js 的 v-html 指令并不能解析！！！ 所以，换种方式，数据库中只保存 Markdown 原文，前端渲染使用 vue-markdown 插件：\n\n> D:\\python-code\\flask-vuejs-madblog\\front-end>cnpm install vue-markdown --save\n> 创建 front-end/src/components/Post.vue，引入子组件 vue-markdown：\n\n				<template>\n					<div class=\"container\">\n						...\n									 <!-- vue-markdown 开始解析markdown，它是子组件，通过 props 给它传值即可 -->\n										<vue-markdown\n											:source=\"post.body\"\n											:toc=\"showToc\"\n											:toc-first-level=\"1\"\n											:toc-last-level=\"3\"\n											v-on:toc-rendered=\"tocAllRight\"\n											toc-id=\"toc\"\n											class=\"markdown-body\">\n										</vue-markdown>\n						...\n					</div>\n				</template>\n\n				<script>\n				// 导入 vue-markdown 组件解析 markdown 原文为　HTML\n				import VueMarkdown from \'vue-markdown\'\n\n				export default {\n					name: \'Post\',\n					components: {\n						VueMarkdown\n					},\n					data() {\n						return {\n							sharedState: store.state,\n							post: {},\n							editForm: {\n								title: \'\',\n								summary: \'\',\n								body: \'\',\n								errors: 0,  // 表单是否在前端验证通过，0 表示没有错误，验证通过\n								titleError: null,\n								bodyError: null\n							},\n							showToc: true\n						}\n					},\n					...\n				</script>\n此时，你看到的页面是这样子的：\n\n>post detail 01\n\n(2) highlight.js\n使用 highlight.js 语法高亮：\n\n> D:\\python-code\\flask-vuejs-madblog\\front-end>cnpm install highlight.js --save\n> 在 Post.vue 组件中：\n\n				<script>\n				// vue-router 从 Home 页路由到 Post 页后，会重新渲染并且会移除事件，自定义的指令 v-highlight 也不生效了\n				// 所以，这个页面，在 mounted() 和 updated() 方法中调用 highlightCode() 可以解决代码不高亮问题\n				import hljs from \'highlight.js\'\n				const highlightCode = () => {\n					let blocks = document.querySelectorAll(\'pre code\');\n					blocks.forEach((block)=>{\n						hljs.highlightBlock(block)\n					})\n				}\n\n				export default {\n					...\n					mounted () {\n						highlightCode()\n					},\n					updated () {\n						highlightCode()\n					}\n				}\n				</script>\n先选中一款模版，在 front-end/src/main.js 中导入 css 文件：\n\n// 样式文件，浅色：default, atelier-dune-light  深色：atom-one-dark, atom-one-dark-reasonable, monokai\nimport \'highlight.js/styles/atom-one-dark-reasonable.css\'\n现在你看到的页面如下：', '2024-04-28 17:16:40', 'person10', '/media/papers/person10.jpg', '本文探讨了HTML内容在论文表示中的应用，包括加粗、斜体、下划线等标签的使用，以及列表、表格和图片的插入。这些HTML元素能够丰富论文的表达方式，提升可读性和视觉效果。', 'HTML, 论文模型, 内容表示, 可读性');
INSERT INTO `papers` VALUES (11, '论文11', '### 3.3 显示博客详情\n   如果没有前后端分离，即 Flask 使用 Jinja2 模版引擎来渲染页面的话，我会考虑用户输入 Markdown 原文，后台 Python 自动转换成 HTML 文档（使用 Python-Markdown 和 bleach）后存储到数据库中，然后展示时 Jinja2 使用过滤器 content_html | safe 直接解析 HTML 文档\n\n(1) vue-markdown\n但是，按照这个思路，由于转换后的 HTML 文档中包含很多 \\n 字符，Vue.js 的 v-html 指令并不能解析！！！ 所以，换种方式，数据库中只保存 Markdown 原文，前端渲染使用 vue-markdown 插件：\n\n> D:\\python-code\\flask-vuejs-madblog\\front-end>cnpm install vue-markdown --save\n> 创建 front-end/src/components/Post.vue，引入子组件 vue-markdown：\n\n				<template>\n					<div class=\"container\">\n						...\n									 <!-- vue-markdown 开始解析markdown，它是子组件，通过 props 给它传值即可 -->\n										<vue-markdown\n											:source=\"post.body\"\n											:toc=\"showToc\"\n											:toc-first-level=\"1\"\n											:toc-last-level=\"3\"\n											v-on:toc-rendered=\"tocAllRight\"\n											toc-id=\"toc\"\n											class=\"markdown-body\">\n										</vue-markdown>\n						...\n					</div>\n				</template>\n\n				<script>\n				// 导入 vue-markdown 组件解析 markdown 原文为　HTML\n				import VueMarkdown from \'vue-markdown\'\n\n				export default {\n					name: \'Post\',\n					components: {\n						VueMarkdown\n					},\n					data() {\n						return {\n							sharedState: store.state,\n							post: {},\n							editForm: {\n								title: \'\',\n								summary: \'\',\n								body: \'\',\n								errors: 0,  // 表单是否在前端验证通过，0 表示没有错误，验证通过\n								titleError: null,\n								bodyError: null\n							},\n							showToc: true\n						}\n					},\n					...\n				</script>\n此时，你看到的页面是这样子的：\n\n>post detail 01\n\n(2) highlight.js\n使用 highlight.js 语法高亮：\n\n> D:\\python-code\\flask-vuejs-madblog\\front-end>cnpm install highlight.js --save\n> 在 Post.vue 组件中：\n\n				<script>\n				// vue-router 从 Home 页路由到 Post 页后，会重新渲染并且会移除事件，自定义的指令 v-highlight 也不生效了\n				// 所以，这个页面，在 mounted() 和 updated() 方法中调用 highlightCode() 可以解决代码不高亮问题\n				import hljs from \'highlight.js\'\n				const highlightCode = () => {\n					let blocks = document.querySelectorAll(\'pre code\');\n					blocks.forEach((block)=>{\n						hljs.highlightBlock(block)\n					})\n				}\n\n				export default {\n					...\n					mounted () {\n						highlightCode()\n					},\n					updated () {\n						highlightCode()\n					}\n				}\n				</script>\n先选中一款模版，在 front-end/src/main.js 中导入 css 文件：\n\n// 样式文件，浅色：default, atelier-dune-light  深色：atom-one-dark, atom-one-dark-reasonable, monokai\nimport \'highlight.js/styles/atom-one-dark-reasonable.css\'\n现在你看到的页面如下：', '2024-05-02 18:14:20', 'person11', '/media/papers/person11.jpg', '本文探讨了HTML内容在论文表示中的应用，包括加粗、斜体、下划线等标签的使用，以及列表、表格和图片的插入。这些HTML元素能够丰富论文的表达方式，提升可读性和视觉效果。', 'HTML, 论文模型, 内容表示, 可读性');
INSERT INTO `papers` VALUES (13, '人工智能促进医学影像临床应用与研究', '       在当今临床工作实践中,医学影像技术已成为日常诊断重要工具。从X射线到CT、MRI,再到超声和核医学影像,这些影像技术不仅帮助医生进行疾病诊断,还在病情的监测和治效评估中发挥着至关重要的作用。但是医生的阅片精准度、操作效率以及定量分析方面仍然存在局限性,往往依赖于放射科医生的经验、专业知识以及医生所处工作状态。这些主观因素均可能导致诊断结果的不稳定,从而影响患者的疾病诊断、手术治疗以及预后监测，\n     近年来随着医学影像成像技术的规范及其广泛使用,基于数据驱动和端到端学习的人工智能(artificaintelligence,AI)算法逐渐在医学影像辅助诊断中大放异彩。人工智能的医学影像分析算法在海量数据中学习训练,自适应地匹配不同的影像决策任务,这些技术不仅提高了疾病诊断的精确性和效率,还减少了放射科医生的工作负担,使他们能够更专注于复杂案例的分析。其中基于人工智能算法的诊断和分割是其应用在医学影像领域的两个重要研究方向,本文将重点介绍人工智能算法在医学影像自动分割、诊断中的研究现状以及未来的应用前景。\n### AI算法发展与介绍\n     21世纪以来,随着计算机软件、互联网技术以及微电子集成电路的发展,困扰AI领域多年的数据以及算力等问题得到了很大程度的解决,2006年图灵奖获得者 Geoffrey Hinton 利用深度神经网络训练自编码器以降低数据维度,文章中提出的很多思想为后续的研究提供了新的视角和方法。2012年Hinton 和他的学生 Alex Krizhevsky 设计 AlexNet 获得 Ima-geNet 图像分类的冠军。相比传统机器学习特征的浅层判别,卷积神经网络通过不断堆叠的卷积层和池化层对原始数据进行自主地特征提取和筛选,由浅层图像纹理特征到深层语义特征转变，“深度学习”(deeplearning,DL)由此得名。从2012年开始,在算法层面,数据科学家们在深度学习基础网络的理论研究,计算机视觉以及自然语言的应用等方面有了重大突破，深度学习算法能够适配越来越多的落地应用场景,特别是医学影像领域;在硬件层面,以 NVIDIA 公司、Intel 公司为代表的 AI芯片公司在人工智能模型的训练端芯片、云服务器的推理芯片以及边缘计算的部署芯片等取得了多样性的发展,在硬件的加持下，人工智能产品和解决方案能够更快发展;在数据层面,万物互联理念和大数据技术的发展将越来越多的图像数据以及文本分享到互联网上，进一步推动深度学习技术的发展。2022年,openAI公司分别在 GPT-3[3]的基础上提出智能对话机器人 chatGPT,在 CLIP[4]和扩散模型(diffusion model)[]的基础上提出了多模态绘图产品DALLE系列,这些产品极大地推动了大模型以及弱人工智能模型向强人工智能模型的发展。在过去的十年里,这些技术也逐渐应用到医学影像领域中,给放射科医生的工作模式以及疾病的诊疗预后优化带了巨大的革新。\n#### 人工智能在医学影像中的研究进展\n##### 1.影像组学的应用\n      影像组学作为一种高通量的影像特征提取建模方法,能够将高维的原始影像学数据转换为所研究区域的影像学特征,主要包括形态学特征、一阶特征、纹理特征以及高阶特征。相比于传统放射学参数,影像组学特征通过客观的图像描述以及信息论原理等方法更加全面地体现所研究区域的形态学参数、影像信号强度分布、统计学参量、影像纹理定量指标、影像变换的全局-局部特征以及频域变换的特征等。机器学习作为人工智能的重要分支，在影像组学的后续研究中起到了关键性的作用。目前影像组学作为一种无创的疾病评估方法,在疾病诊疗与预后的全流程中都有泛研究和应用。\n##### 2.智能诊断\n      相比基于机器学习的影像组学方法,基于深度学习的智能诊断能够通过端到端数据驱动的方式自主学习特征,进行医学影像诊断分析。深度学习智能诊断研究的标准流程包括:\n			①数据集:建立标准化的医学影像数据集,包含配对的图像数据、勾画 ROI数据以及患者匿名化的临床数据;\n			②图像预处理:通过 Z-score以及重采样的方法对医学影像数据进行灰度和空间归一化,减小设备、扫描方式的差异性;\n			③模型选择:根据数据量情况，选择合适的深度学习模型，包括ResNet[2、VGGNet[a1、InceptionNet[z]及 3DConv等[23];\n			④模型训练:根据数据量情况,基于 ImageNet预训练参数对模型部分或全部权重使用较小的学习率进行微调[4];\n			⑤模型验证:将微调好的模型在训练集、测试集以及外部验证集中测试验证并与其他传统诊断结果(如人工诊断及影像组学模型等)对比其性能优劣。在多项基于深度学习的医学影像诊断研究中发现基于深度学习的影像学模型拥有更好的诊断效能并且在多个外部验证集得到充分验证[25-28]。在医学影像临床实践中,多任务的医学影像分析也是目前研究的热点,研究表明基于多任务的深度学习模型在提高单一任务的预测效能、减缓模型的过拟合现象以及提高深度学习可解释性方面有独特优势[29-31]。', '2024-07-16 13:32:27', '陈冲,陈俊,夏黎明', '/media/papers/_人工智能促进医学影像临床应用与研究_00.jpg', '基于人工智能(AI)的医学影像分析技术被应用于疾病病灶的自动分割、辅助诊断以及治疗规划等方面,在深化医学影像临床研究与应用,减轻放射科医生临床读片负担以及挖掘新的影像学生物标志物等方面起到了重要作用。尽管 AI在医学影像中的应用取得了显著进展,但仍面临一些挑战，包括算法的泛化能力、模型可解释性以及大规模临床验证等。因此,医学影像在拥抱 AI技术的同时也需要加强人工专家最终环节的审核和把控。为了促进 AI在医学影像领域的进一步发展,需要医学、工程和研究领域的紧密合作。', '医学影像学;人工智能;影像组学;自动分割;深度学习');

-- ----------------------------
-- Table structure for software
-- ----------------------------
DROP TABLE IF EXISTS `software`;
CREATE TABLE `software`  (
  `software_id` int NOT NULL AUTO_INCREMENT,
  `software_belong` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `software_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `software_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`software_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of software
-- ----------------------------

-- ----------------------------
-- Table structure for zxxm
-- ----------------------------
DROP TABLE IF EXISTS `zxxm`;
CREATE TABLE `zxxm`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `funding_agency` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `principal_investigator` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `budget` float NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zxxm
-- ----------------------------
INSERT INTO `zxxm` VALUES (1, '基于深度学习的医学影像分析系统研发', '本项目旨在研发一款基于深度学习的医学影像分析系统，用于辅助医生进行疾病诊断和治疗方案制定。系统将采用最新的深度学习算法，对医学影像数据进行自动分析和解读，提高诊断准确性和效率。', '国家自然科学基金委员会', '2022-01-01 00:00:00', '2024-12-31 00:00:00', '张三', 500000, 'Ongoing');
INSERT INTO `zxxm` VALUES (2, '智能物联网在环境监测中的应用研究', '本项目将研究智能物联网技术在环境监测领域的应用，通过搭建物联网平台，实现对环境数据的实时采集、传输和分析。项目旨在提高环境监测的智能化水平，为环境保护和污染治理提供有力支持。', '国家科技部', '2023-03-01 00:00:00', '2025-09-30 00:00:00', '李四', 300000, 'Ongoing');
INSERT INTO `zxxm` VALUES (3, '人工智能在农业智能决策系统中的应用', '本项目将研究人工智能技术在农业智能决策系统中的应用，通过构建基于大数据和AI的决策模型，为农业生产提供精准化、智能化的决策支持，提升农业生产效率和可持续性。', '农业农村部', '2023-07-01 00:00:00', '2026-06-30 00:00:00', '王五', 450000, 'Ongoing');
INSERT INTO `zxxm` VALUES (4, '新型能源材料研发及产业化', '本项目致力于研发新型高效、环保的能源材料，并推动其产业化进程。通过材料科学、化学和物理等多学科的交叉融合，开发具有高性能和广泛应用前景的能源材料，为能源革命和可持续发展贡献力量。', '工业和信息化部', '2022-10-01 00:00:00', '2025-09-30 00:00:00', '赵六', 600000, 'Ongoing');
INSERT INTO `zxxm` VALUES (5, '虚拟现实技术在教育教学中的应用研究', '本项目旨在探索虚拟现实技术在教育教学领域的应用，通过构建虚拟学习环境，提供沉浸式的学习体验，激发学生的学习兴趣和积极性，提高教学效果和学习质量。', '教育部', '2023-02-01 00:00:00', '2025-01-29 16:00:00', '孙七', 280000, 'Ongoing');

SET FOREIGN_KEY_CHECKS = 1;
