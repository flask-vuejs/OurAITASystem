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

 Date: 08/05/2024 17:07:39
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
INSERT INTO `papers` VALUES (1, 'world', '3e4234', '2023-05-01 18:14:20', 'main', '4');
INSERT INTO `papers` VALUES (2, 'xiao', '23423', '2023-11-01 18:14:20', 'main', '5');
INSERT INTO `papers` VALUES (3, 'test', '这是测试内容', '2024-04-23 17:16:37', 'chl', '1');
INSERT INTO `papers` VALUES (4, 'test1', '这是测试内容', '2024-04-23 18:24:17', 'chl', '1');
INSERT INTO `papers` VALUES (5, '111', '111', '2024-04-23 19:22:10', '111', '1');
INSERT INTO `papers` VALUES (6, '123', '<p>模拟 Ajax 异步设置内容</p>', '2024-04-23 19:26:21', '123', '1');
INSERT INTO `papers` VALUES (7, '1234', '<p><u><strong>模拟 Ajax 异步设置内容</strong></u></p>', '2024-04-23 19:45:27', '1234', '1');
INSERT INTO `papers` VALUES (8, '123', '<p>模拟 Ajax 异步设置内容</p>', '2024-04-23 22:00:00', 'root', '1');
INSERT INTO `papers` VALUES (9, '英语语法的第一个坑if从句，你掉进去了吗？（二）', '<p><br></p><p style=\"text-align: start;\"><strong>上一篇我们说了if条件句是触发主线动作的一个开关，即满足了条件就触发动作，没满足就不触发，条件本身是个客观存在，没有时间属性，所以用一般现在时。</strong><br></p><p style=\"text-align: start;\"><u>接下来就要开始复杂起来了：因为有时候if条件句也可以加上时间属性。</u></p><p style=\"text-align: start;\"><br></p><p style=\"text-align: start;\">中国学生学习时态有个很大的<u>误区</u>，就是会把语法书当作公式来背，比如“看到already就要用现在完成时”，“since前面是完成时后面是过去时”。这样无脑背诵对于初学者来说确实是最快的方法，<strong>但是长远来说只会增加记忆负担，没有任何好处</strong>。因为<strong>理解时态绝对不能脱离语境和表达者的意图</strong>。说到底，<strong>时态完全是为了表达意思才存在的，而不是机械遵循某个死板的语法规则</strong>。</p><p style=\"text-align: start;\">比如这句话： if you have read this book, you can write a report about it. 如果你已经看过这本书了，可以写一篇报告。这里if后面也是条件从句，但说话的人为它赋予了时态（现在完成时），因为他要<u>强调</u>的是“书已经看完了”这个条件。</p><p style=\"text-align: start;\">可以把if you have read this book与if you read this book（现在时）做个对比，这两句话强调了不同的重点，第一句强调的是“看书这个动作已经完成了”，后一句强调的是看书这件事本身，而并没有说明什么时候看的。If you read this book,you will find it very interesting. <strong>看这本书是条件，触发的动作是\"觉得书有趣\"。只要看了，就会觉得有趣</strong>。这是这句话的根本逻辑，除此之外不包含其他的意思。</p><p style=\"text-align: start;\">再比如：if you liked the food you had in my house last time, here’s some more for you. 如果你喜欢上次在我家吃的食物，这里还有更多给你吃。如果你是死记硬背时态公式，现在应该已经开始头晕了。但如果你将自己代入说话人的角色理解时态，就一目了然了。这里说话人强调的是<u><strong>上次</strong></u>你在我家吃东西然后觉得很喜欢，所以like这个动作是过去发生的，用一般过去时。</p><p style=\"text-align: start;\">再比如:if you were also watching this channel this time yesterday, you would see the new Pepsi commercial. 如果你昨天这个时候也在看这个频道，你会看到新的百事可乐广告。这里的if条件强调的是“昨天这个时候<u>正在</u>看这个频道”。</p><p style=\"text-align: start;\"><strong>我说了这么多，只是想说明一个道理：时态存在的价值是为了让句子意思产生微妙的差别，让说话的人强调不同的重点。语法书是语言学家根据大多数人的表达习惯总结出来的规律，并不是凭空产生指导大家怎么说话的金科玉律，所以在学习时态的时候一定要把自己带入对话的语境。如果有人告诉你，if后面只能跟什么时态，那未免过于武断了，到底应该用什么时态应该取决于上下文，也就是表达者到底想要表达什么意思。</strong></p><p style=\"text-align: start;\"><br></p><p style=\"text-align: start;\">欢迎关注我的公众号英语小黑课，第一时间获得最新文章推送。</p>', '2024-04-27 18:16:40', 'chl', '1');
INSERT INTO `papers` VALUES (10, '你好', '123445', '2024-04-28 17:16:40', 'chl', '2');
INSERT INTO `papers` VALUES (11, 'hello', '3423223', '2024-05-02 18:14:20', 'root', '3');

SET FOREIGN_KEY_CHECKS = 1;
