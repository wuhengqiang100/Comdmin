/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50642
Source Host           : localhost:3306
Source Database       : comadmin

Target Server Type    : MYSQL
Target Server Version : 50642
File Encoding         : 65001

Date: 2019-01-07 14:24:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(36) NOT NULL,
  `name` varchar(40) DEFAULT NULL COMMENT '角色名称',
  `identity` varchar(100) DEFAULT NULL,
  `request_place` varchar(50) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `age` varchar(10) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(36) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(36) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('4132f0579ae54d7399c4337cc3fe44bd', '温度', '温度管理员', '', '', '', '20', '2018-12-25 16:51:54', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-25 16:51:54', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '', '0');
INSERT INTO `sys_role` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', '访客', '访客', '', '13013013013', '', '', '2017-11-02 14:19:07', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-25 15:47:39', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '', '0');
INSERT INTO `sys_role` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '超级管理员(开发者账号)', 'root', '', '110', '', '', '2017-11-29 19:36:37', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-24 13:06:54', 'e426acc3cf434635a9cbf8c90902e314', '', '0');
INSERT INTO `sys_role` VALUES ('8332ea7322704faa8a0fdfc9726d587c', '农田主', '农田主', '十陵11', '', '', '40', '2018-12-21 21:18:55', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-25 15:48:34', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '', '0');
INSERT INTO `sys_role` VALUES ('c600d2c3320f4685b8d75cb8a6518409', '管理员', 'root', '', '120', '', '', '2018-12-24 13:03:08', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-24 13:03:08', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '', '0');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(36) NOT NULL COMMENT '用户ID',
  `login_name` varchar(36) DEFAULT NULL COMMENT '登录名',
  `nick_name` varchar(40) DEFAULT NULL COMMENT '昵称',
  `icon` varchar(2000) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL COMMENT '密码',
  `salt` varchar(40) DEFAULT NULL COMMENT 'shiro加密盐',
  `identity` varchar(50) DEFAULT NULL,
  `request_place` varchar(100) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱地址',
  `age` varchar(10) DEFAULT NULL,
  `locked` tinyint(2) DEFAULT NULL COMMENT '是否锁定',
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(36) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(36) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(4) NOT NULL,
  `is_admin` tinyint(2) DEFAULT NULL,
  `credit` int(3) DEFAULT '10',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('18b8b543-9ad7-11e8-aebe-1368d4ec24eb', 'java', '我是管理员', '/static/upload/7276118e-5ca3-4ab3-8188-e7d39a39b91b.jpg', '9c5feb7aba88c7c87bc047c7cec7c6e3b63e1894', '08c5900125b80cd2', 'root', null, '110', 'b@qq.com', null, '0', '2017-11-27 22:19:39', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-23 15:12:58', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '测试', '0', '1', '10');
INSERT INTO `sys_user` VALUES ('244ed8a411b3464996a6cab8c16048e4', '我是农民', 'I\'m农民', null, 'f3f94fa171a1808edad4cdc9a2bcebae2fa2a234', '8fc3ac51cde539ab', '农田主', '十陵', '13313313313', '133@qq.com', '40', '0', '2018-12-21 21:19:59', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-23 20:03:43', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', null, '0', '1', '10');
INSERT INTO `sys_user` VALUES ('a9062e572631452498a721f2f4ec033c', '温度管理员', '温度管理员', null, '05428c3fca02ca2798425d7e691427424c4809cb', 'd771a49c37122490', '温度管理员', '当当', '11011011011', '110@qq.com', '20', '0', '2018-12-25 16:52:47', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-25 16:52:47', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', null, '0', '1', '4');
INSERT INTO `sys_user` VALUES ('e426acc3cf434635a9cbf8c90902e314', 'root', 'root', null, '71aac362b022fbbb09b210454fbedf3add5409eb', 'c0989633f21daf66', 'root', '十陵', '120', '120@qq.com', '60', '0', '2018-12-24 13:02:24', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-24 13:03:22', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', null, '0', '1', '10');
INSERT INTO `sys_user` VALUES ('fcd3c425a4d54d13976f758b8545dff8', '风法师', 'as', null, '05e478d540778388d9708a5b90abb07065cdf955', 'e0e1dac7f508a616', '安抚', '安抚', '15915915915', '159@qq.com', '45', '0', '2018-12-23 18:33:13', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-23 18:33:20', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', null, '1', '1', '10');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(36) NOT NULL,
  `role_id` varchar(36) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '706e0195-9ad7-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_user_role` VALUES ('244ed8a411b3464996a6cab8c16048e4', '8332ea7322704faa8a0fdfc9726d587c');
INSERT INTO `sys_user_role` VALUES ('a9062e572631452498a721f2f4ec033c', '4132f0579ae54d7399c4337cc3fe44bd');
INSERT INTO `sys_user_role` VALUES ('e426acc3cf434635a9cbf8c90902e314', 'c600d2c3320f4685b8d75cb8a6518409');
INSERT INTO `sys_user_role` VALUES ('fcd3c425a4d54d13976f758b8545dff8', '70689483-9ad7-11e8-aebe-1368d4ec24eb');
