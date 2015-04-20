/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : musicsdb

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2015-04-20 19:30:14
*/

CREATE DATABASE `musicsdb`;
USE `musicsdb`;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for album
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `year` year(4) DEFAULT NULL,
  `artist` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `artist` (`artist`),
  KEY `name` (`name`),
  CONSTRAINT `artist` FOREIGN KEY (`artist`) REFERENCES `artist` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of album
-- ----------------------------
INSERT INTO `album` VALUES ('1', 'Bad', '1987', 'Michael Jackson');
INSERT INTO `album` VALUES ('2', 'Dangerous', '1991', 'Michael Jackson');
INSERT INTO `album` VALUES ('3', 'Beyonce', '2013', 'Beyonce');
INSERT INTO `album` VALUES ('4', 'Survivor', '2001', 'Beyonce');
INSERT INTO `album` VALUES ('5', 'Double Fantasy', '1980', 'John Lennon');
INSERT INTO `album` VALUES ('6', 'Imagine', '1971', 'John Lennon');
INSERT INTO `album` VALUES ('7', 'Fearless', '2008', 'Taylor Swift');
INSERT INTO `album` VALUES ('8', 'Speak Now', '2010', 'Taylor Swift');

-- ----------------------------
-- Table structure for artist
-- ----------------------------
DROP TABLE IF EXISTS `artist`;
CREATE TABLE `artist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of artist
-- ----------------------------
INSERT INTO `artist` VALUES ('1', 'Michael Jackson', 'male');
INSERT INTO `artist` VALUES ('2', 'Beyonce', 'female');
INSERT INTO `artist` VALUES ('3', 'John Lennon', 'male');
INSERT INTO `artist` VALUES ('4', 'Taylor Swift', 'female');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'Blues');
INSERT INTO `category` VALUES ('2', 'Classical');
INSERT INTO `category` VALUES ('3', 'Country');
INSERT INTO `category` VALUES ('4', 'Dance');
INSERT INTO `category` VALUES ('5', 'Electronic');
INSERT INTO `category` VALUES ('6', 'Folk');
INSERT INTO `category` VALUES ('7', 'Hip Hop');
INSERT INTO `category` VALUES ('8', 'J-Pop/K-Pop');
INSERT INTO `category` VALUES ('9', 'Jazz');
INSERT INTO `category` VALUES ('10', 'Latin');
INSERT INTO `category` VALUES ('11', 'New Age');
INSERT INTO `category` VALUES ('12', 'Opera');
INSERT INTO `category` VALUES ('13', 'Pop');
INSERT INTO `category` VALUES ('14', 'R&B');
INSERT INTO `category` VALUES ('15', 'Reggae');
INSERT INTO `category` VALUES ('16', 'Rock');

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `user_name` varchar(255) NOT NULL,
  `music_name` varchar(255) NOT NULL,
  PRIMARY KEY (`user_name`,`music_name`),
  KEY `musicname` (`music_name`),
  CONSTRAINT `username` FOREIGN KEY (`user_name`) REFERENCES `user` (`userName`) ON DELETE CASCADE,
  CONSTRAINT `musicname` FOREIGN KEY (`music_name`) REFERENCES `music` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favorite
-- ----------------------------
INSERT INTO `favorite` VALUES ('greatwall', 'Back to December');
INSERT INTO `favorite` VALUES ('test1', 'Dangerous');
INSERT INTO `favorite` VALUES ('greatwall', 'Heal the World');
INSERT INTO `favorite` VALUES ('test1', 'Heal the World');
INSERT INTO `favorite` VALUES ('greatwall', 'Love Story');

-- ----------------------------
-- Table structure for music
-- ----------------------------
DROP TABLE IF EXISTS `music`;
CREATE TABLE `music` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `artist` varchar(255) DEFAULT NULL,
  `album` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  `lyric` longtext,
  `resource` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `artist` (`artist`) USING BTREE,
  KEY `album` (`album`) USING BTREE,
  KEY `category` (`category`),
  KEY `name` (`name`),
  CONSTRAINT `category` FOREIGN KEY (`category`) REFERENCES `category` (`name`) ON DELETE CASCADE,
  CONSTRAINT `music_ibfk_1` FOREIGN KEY (`artist`) REFERENCES `artist` (`name`) ON DELETE CASCADE,
  CONSTRAINT `music_ibfk_2` FOREIGN KEY (`album`) REFERENCES `album` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of music
-- ----------------------------
INSERT INTO `music` VALUES ('1', 'Love Story', '3:55', 'Taylor Swift', 'Fearless', 'Pop', '2008', 'awergaeg aseg', '/storage/lovestory.mp3');
INSERT INTO `music` VALUES ('2', 'Back to December', '4:54', 'Taylor Swift', 'Speak Now', 'Country', '2010', 'asdf rth', '/storage/backtodecember.mp3');
INSERT INTO `music` VALUES ('3', 'Bad', '4:07', 'Michael Jackson', 'Bad', 'Pop', '1987', 'arsga asrgae', '/storage/bad.mp3');
INSERT INTO `music` VALUES ('4', 'Heal the World', '6:24', 'Michael Jackson', 'Dangerous', 'Pop', '1991', 'drth srth', '/storage/healtheworld.mp3');
INSERT INTO `music` VALUES ('5', 'Dangerous', '6:59', 'Michael Jackson', 'Dangerous', 'R&B', '1991', 'esrth stjh', '/storage/dangerous.mp3');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userID` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `userPassword` varchar(20) NOT NULL,
  `createTime` date DEFAULT NULL,
  `isAdmin` tinyint(4) DEFAULT NULL,
  `loginCount` int(11) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userName` (`userName`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'test1', 'Awefh@me.com', '131415', '2014-01-01', '1', '1', 'admin');
INSERT INTO `user` VALUES ('2', 'test2', 'sdweiyfr@123.com', '512356', '2014-07-06', '0', '0', 'user');
INSERT INTO `user` VALUES ('3', 'test3', 'seiuf@sod.com', '123456', '2014-03-25', '0', '2', 'user');
INSERT INTO `user` VALUES ('4', 'ooof', 'krisud@af.com', '1234', '2014-07-05', '0', '0', 'user');
INSERT INTO `user` VALUES ('5', 'xiwang', 'xiwag@qq.com', '1234', '2014-07-05', '1', '1', 'admin');
INSERT INTO `user` VALUES ('6', 'MMY', 'mmy@qq.com', '1234', '2014-07-06', '0', '1', 'user');
INSERT INTO `user` VALUES ('7', 'wZ', 'wz@qq.com', '1234', '2014-07-06', '0', '1', 'user');
INSERT INTO `user` VALUES ('8', 'huanqian', 'hq@qq.com', '1234', '2014-07-06', '0', '1', 'user');
INSERT INTO `user` VALUES ('9', 'hzf', 'hzf@qq.com', '1234', '2014-07-07', '0', '0', 'user');
INSERT INTO `user` VALUES ('10', 'greatwall', 'http://192.168.1.5:8080/MusicCMS/test.mp3', '1234', '2014-07-06', '0', '1', 'user');
INSERT INTO `user` VALUES ('11', 'aa', 'aa@qq.com', '1234', '2014-07-06', '0', '1', 'user');
INSERT INTO `user` VALUES ('12', 'iiii', 'iii@qq.com', '1234', '2014-07-06', '0', '1', 'user');
INSERT INTO `user` VALUES ('13', 'ww', 'ww.@qq.com', '1234', '2014-07-06', '0', '0', 'user');
INSERT INTO `user` VALUES ('14', 'kk', 'jjj@qq.com', '1234', '2014-07-07', '0', '1', 'user');
