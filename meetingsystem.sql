/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : meetingsystem

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2018-08-28 10:32:53
*/

use meetingsystem;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `meeting`
-- ----------------------------
DROP TABLE IF EXISTS `meeting`;
CREATE TABLE `meeting` (
  `mid` int(255) NOT NULL auto_increment,
  `title` varchar(5000) default NULL,
  `introduce` varchar(5000) default NULL,
  `address` varchar(5000) default NULL,
  `time` date default NULL,
  `status` int(255) default NULL,
  `type` int(255) default NULL,
  `meetingimage` varchar(2000) default NULL,
  `createUimage` varchar(255) default NULL,
  `createUsername` varchar(2000) default NULL,
  PRIMARY KEY  (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meeting
-- ----------------------------
INSERT INTO `meeting` VALUES ('1', '人工智能会议', '人工智能会议，会议讲解最新的AI技术，引导全世界年轻人学习', '南京邮电大学教三', '2018-08-30', '0', '1', '1.jpg', 'http://www.gx8899.com/uploads/allimg/2016062221/2425gvasjz2.jpg', '向死而生');
INSERT INTO `meeting` VALUES ('2', '谷歌年会', '总结过去一年中谷歌公司的会议模式以及未来的发展方向', '谷歌总部办公室201', '2018-09-14', '0', '1', '2.jpg', 'http://www.gx8899.com/uploads/allimg/2017092012/0c353duwsjl-lp.jpg', '璀错');
INSERT INTO `meeting` VALUES ('3', '腾讯算术会议', '腾讯算法大赛的评选以及颁奖方案选取', '深圳腾讯大厦', '2018-08-25', '0', '1', '3.jpg', 'https://wx.qlogo.cn/mmopen/vi_32/2Wn9yHJT3F9YAmOYUBrvtFDqblHej16EvzMt5mVswnUZRGbZOVm4Eia8RibNRm6ibuqcxn01zhenibdoro9Q5QGOcg/132', '幸福着你的幸福');
INSERT INTO `meeting` VALUES ('6', '世界互联网会议', '集聚了大量中国互联网的讲师，了解最新的科技产品，提升自己的能力', '背景互联网中心', '2016-08-23', null, null, '393627cd-0b4a-4051-b4dc-8582f932b3a2.jpg', 'http://www.gx8899.com/uploads/allimg/2016062221/2425gvasjz2.jpg', '向死而生');

-- ----------------------------
-- Table structure for `relations`
-- ----------------------------
DROP TABLE IF EXISTS `relations`;
CREATE TABLE `relations` (
  `rid` int(255) NOT NULL auto_increment,
  `uid` int(255) default NULL,
  `mid` int(255) default NULL,
  PRIMARY KEY  (`rid`),
  KEY `uid` (`uid`),
  KEY `mid` (`mid`),
  CONSTRAINT `mid` FOREIGN KEY (`mid`) REFERENCES `meeting` (`mid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of relations
-- ----------------------------
INSERT INTO `relations` VALUES ('1', '3', '1');
INSERT INTO `relations` VALUES ('2', '3', '2');
INSERT INTO `relations` VALUES ('3', '3', '3');
INSERT INTO `relations` VALUES ('4', '1', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(255) NOT NULL auto_increment,
  `username` varchar(5000) default NULL,
  `company` varchar(5000) default NULL,
  `statement` varchar(5000) default NULL,
  `telephone` int(255) default NULL,
  `avator` varchar(5000) default NULL,
  `position` varchar(1000) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '向死而生', '谷歌', '我就是我', '123213214', 'http://www.gx8899.com/uploads/allimg/2016062221/2425gvasjz2.jpg', '经理');
INSERT INTO `user` VALUES ('2', '璀错', '腾讯', '生如夏花，脚踏实地', '314234214', 'http://www.gx8899.com/uploads/allimg/2017092012/0c353duwsjl-lp.jpg', '主席');
INSERT INTO `user` VALUES ('3', '幸福着你的幸福', null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/2Wn9yHJT3F9YAmOYUBrvtFDqblHej16EvzMt5mVswnUZRGbZOVm4Eia8RibNRm6ibuqcxn01zhenibdoro9Q5QGOcg/132', '职员');

-- 以下为通讯和会议模块的数据库设计

-- ----------------------------
-- Table structure for meeting
-- ----------------------------
DROP TABLE IF EXISTS `meeting`;
CREATE TABLE `meeting`  (
  `m_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目类型',
  `vContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目数据',
  `e_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结束时间',
  `s_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实际开始时间',
  `msign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会议标识符',
  `m_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会议主题',
  `c_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `b_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `m_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会议地点',
  `m_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会议内容',
  `mCreator_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `mLabel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会议标签',
  PRIMARY KEY (`m_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meeting
-- ----------------------------
INSERT INTO `meeting` VALUES (1, '5555', '555', '44', '777', NULL, '11', '22', '233', '3444', '555', '666', '专业性会议');
INSERT INTO `meeting` VALUES (2, NULL, NULL, NULL, '777', NULL, '11', '22', '233', '3444', '555', '666', '专业性会议');
INSERT INTO `meeting` VALUES (3, NULL, NULL, NULL, NULL, NULL, 'eduction', '2018-04-07 10:34:45', '2018-4-9', 'nanjing', 'gsbxgjdncbd', '4', '专业性会议');
INSERT INTO `meeting` VALUES (4, NULL, NULL, NULL, NULL, 'sdg5', '人工智能', '2018-04-07 13:06:30', '2018-4-8', 'beijing', '..........dhdbxbsjsbxggw', '554', '专业性会议');
INSERT INTO `meeting` VALUES (5, NULL, NULL, NULL, NULL, 'rr3', '人工智能', '2018-04-07 17:57:59', '2018-4-8', 'beijing', '........dhdbxbsjsbxggw', '554', '专业性会议');
INSERT INTO `meeting` VALUES (6, NULL, NULL, NULL, NULL, 'gg3', '互联网', '2018-04-07 17:59:49', '2018-4-8', 'beijing', '........dhdbxbsjsbxggw', '554', '专业性会议');
INSERT INTO `meeting` VALUES (7, NULL, NULL, NULL, NULL, NULL, 'it', '2018-04-07 18:01:24', '2018-4-8', 'beijing', '........dhdbxbsjsbxggw', '554', '专业性会议');
INSERT INTO `meeting` VALUES (8, 'sssss', 'nsjdbysd', '2018-04-17 21:50:36', '2018-04-17 21:51:51', '334nhhsji', 'my', '2018-04-07 18:19:03', '2018-4-8', 'beijing', '........dhdbxbsjsbxggw', '8', '');
INSERT INTO `meeting` VALUES (9, NULL, NULL, NULL, NULL, NULL, 'msy', '2018-04-07 18:45:27', '2018-4-8', 'beijing', '........dhdbxbsjsbxggw', '554', NULL);
INSERT INTO `meeting` VALUES (10, NULL, NULL, NULL, NULL, NULL, 'ww', 'ggd', 'mj', 'mshs', '234', 'dbcgn', '商务性会议');
INSERT INTO `meeting` VALUES (11, NULL, NULL, NULL, NULL, '351923e9-64f5-4256-96e3-7f0c986c128c', 'ww', 'ggd', 'mj', 'mshs', '234', 'dbcgn', '商务性会议');
INSERT INTO `meeting` VALUES (12, NULL, NULL, NULL, NULL, NULL, 'ww', 'ggd', 'mj', 'mshs', '234', 'dbcgn', '商务性会议');
INSERT INTO `meeting` VALUES (13, NULL, NULL, NULL, NULL, NULL, 'ww', 'ggd', 'mj', 'mshs', '234', 'dbcgn', '商务性会议');
INSERT INTO `meeting` VALUES (14, NULL, NULL, NULL, NULL, '243eebec-2962-4819-83ae-f1689e9e1ef7', 'ww', 'ggd', 'mj', 'mshs', '234', 'dbcgn', '商务性会议');
INSERT INTO `meeting` VALUES (15, NULL, NULL, NULL, NULL, NULL, 'ww', 'ggd', 'mj', 'mshs', '234', 'dbcgn', '商务性会议');
INSERT INTO `meeting` VALUES (16, NULL, NULL, NULL, NULL, '5302c9a7-cb6f-4d20-9db8-55ab83e2a578', 'confident', '2018-04-16 16:45:42', '2018-3-6', 'guangzhou', 'find it', '7', NULL);
INSERT INTO `meeting` VALUES (17, NULL, NULL, NULL, NULL, '165a27fa-3c0d-4db0-8bd6-70d048acb018', 'confident', '2018-04-16 16:49:58', '2018-3-7', 'guangzhou', 'find it', '7', NULL);
INSERT INTO `meeting` VALUES (18, NULL, NULL, NULL, NULL, '6e771a48-1fde-4a9c-98ed-ed373d8594ec', 'sss', '2018-04-17 16:11:03', '1234', 'ssss', 'ggss', '123', '联谊性会议');
INSERT INTO `meeting` VALUES (19, NULL, NULL, NULL, NULL, '165eafac-c864-44ea-a90b-23d69a9a460c', 'sss', '2018-04-17 16:12:28', '1234', 'ssss', 'ggss', '123', '联谊性会议');
INSERT INTO `meeting` VALUES (20, NULL, NULL, NULL, NULL, '9ebcb2c0-b42b-48a4-a688-f9e27618c00d', 'ss地点', '2018-04-17 16:17:17', '1234', 'ssss', 'ggss', '123', '联谊性会议');
INSERT INTO `meeting` VALUES (21, NULL, NULL, NULL, NULL, '2f0e1a42-e41f-4ca4-907c-670b0f3aaf21', 'ss地点', '2018-04-17 16:50:44', '1234', 'ssss', 'ggss', '123', '联谊性会议');
INSERT INTO `meeting` VALUES (22, NULL, NULL, NULL, NULL, '7ec316d3-4515-49cd-ad90-2ca5c0fa603e', 'ss地点', '2018-04-17 16:52:21', '1234', 'ssss', 'ggss', '123', '联谊性会议');
INSERT INTO `meeting` VALUES (23, NULL, NULL, NULL, NULL, '700f8080-173c-4ee6-ba16-4c2f698affc7', 'ss地点', '2018-04-17 17:17:51', '1234', 'ssss', 'ggss', '123', NULL);

-- ----------------------------
-- Table structure for meeting_user
-- ----------------------------
DROP TABLE IF EXISTS `meeting_user`;
CREATE TABLE `meeting_user`  (
  `m_id` int(11) NOT NULL COMMENT '会议id',
  `cu_id` int(11) NOT NULL COMMENT '用户id',
  `sign` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '签到标记',
  `admin` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '管理员标记',
  `vote` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投票结果记录',
  `grade` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评分结果记录',
  PRIMARY KEY (`m_id`, `cu_id`) USING BTREE,
  INDEX `cu_id`(`cu_id`) USING BTREE,
  CONSTRAINT `meeting_user_ibfk_1` FOREIGN KEY (`m_id`) REFERENCES `meeting` (`m_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meeting_user
-- ----------------------------
INSERT INTO `meeting_user` VALUES (3, 4, 1, NULL, NULL, NULL);
INSERT INTO `meeting_user` VALUES (3, 5, 1, 5, NULL, NULL);
INSERT INTO `meeting_user` VALUES (3, 6, NULL, NULL, NULL, NULL);
INSERT INTO `meeting_user` VALUES (3, 7, NULL, NULL, NULL, NULL);
INSERT INTO `meeting_user` VALUES (6, 4, 1, 4, NULL, NULL);
INSERT INTO `meeting_user` VALUES (6, 5, NULL, NULL, NULL, NULL);
INSERT INTO `meeting_user` VALUES (8, 2, 1, 2, 'A', NULL);
INSERT INTO `meeting_user` VALUES (8, 4, 1, 4, 'A', '4*');
INSERT INTO `meeting_user` VALUES (8, 6, 1, 6, 'A', '4*');
INSERT INTO `meeting_user` VALUES (8, 8, 1, 8, '4*', '8*');
INSERT INTO `meeting_user` VALUES (8, 9, NULL, NULL, NULL, '8*');
INSERT INTO `meeting_user` VALUES (8, 50, NULL, NULL, NULL, NULL);
INSERT INTO `meeting_user` VALUES (14, 2, NULL, NULL, NULL, NULL);
INSERT INTO `meeting_user` VALUES (16, 7, NULL, 7, NULL, NULL);
INSERT INTO `meeting_user` VALUES (17, 7, NULL, 7, NULL, NULL);
INSERT INTO `meeting_user` VALUES (18, 123, NULL, 123, NULL, NULL);
INSERT INTO `meeting_user` VALUES (19, 123, NULL, 123, NULL, NULL);
INSERT INTO `meeting_user` VALUES (20, 123, NULL, 123, NULL, NULL);
INSERT INTO `meeting_user` VALUES (21, 123, NULL, 123, NULL, NULL);
INSERT INTO `meeting_user` VALUES (22, 123, NULL, 123, NULL, NULL);
INSERT INTO `meeting_user` VALUES (23, 123, NULL, 123, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
