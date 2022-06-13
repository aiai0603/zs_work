/*
Navicat MySQL Data Transfer

Source Server         : aliyun
Source Server Version : 50732
Source Host           : 47.100.136.15:3306
Source Database       : manager

Target Server Type    : MYSQL
Target Server Version : 50732
File Encoding         : 65001

Date: 2021-01-06 09:56:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) DEFAULT NULL,
  `passage` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for equipment
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `ename` varchar(128) DEFAULT NULL,
  `state` int(1) DEFAULT NULL,
  `deleteflag` int(1) DEFAULT NULL,
  `lowert` int(32) DEFAULT NULL,
  `hight` int(32) DEFAULT NULL,
  `lowerh` int(32) DEFAULT NULL,
  `highh` int(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manager_equip
-- ----------------------------
DROP TABLE IF EXISTS `manager_equip`;
CREATE TABLE `manager_equip` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `eid` int(32) DEFAULT NULL,
  `deleteflag` int(1) DEFAULT NULL,
  `uid` int(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for recover
-- ----------------------------
DROP TABLE IF EXISTS `recover`;
CREATE TABLE `recover` (
  `id` int(128) NOT NULL AUTO_INCREMENT,
  `eid` int(32) DEFAULT NULL,
  `temp` int(32) DEFAULT NULL,
  `humi` int(32) DEFAULT NULL,
  `send_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for warning
-- ----------------------------
DROP TABLE IF EXISTS `warning`;
CREATE TABLE `warning` (
  `id` int(128) NOT NULL AUTO_INCREMENT,
  `eid` int(32) DEFAULT NULL,
  `msg` varchar(128) DEFAULT NULL,
  `send_time` timestamp NULL DEFAULT NULL,
  `deal` int(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8;
