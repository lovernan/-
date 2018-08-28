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
