/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50642
Source Host           : localhost:3306
Source Database       : comadmin

Target Server Type    : MYSQL
Target Server Version : 50642
File Encoding         : 65001

Date: 2018-12-23 23:41:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(36) NOT NULL,
  `name` varchar(40) DEFAULT NULL COMMENT '菜单名称',
  `parent_id` varchar(36) DEFAULT NULL COMMENT '父菜单',
  `level` bigint(2) DEFAULT NULL COMMENT '菜单层级',
  `parent_ids` varchar(2000) DEFAULT NULL COMMENT '父菜单联集',
  `sort` smallint(6) DEFAULT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接地址',
  `target` varchar(20) DEFAULT NULL COMMENT '打开方式',
  `icon` varchar(100) DEFAULT NULL COMMENT '菜单图标',
  `bg_color` varchar(255) DEFAULT NULL COMMENT '显示背景色',
  `is_show` tinyint(2) DEFAULT NULL COMMENT '是否显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(36) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(36) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('154e56abaf494269943d4e40015c9ad0', '农田管理', null, '1', '154e56abaf494269943d4e40015c9ad0,', '2', '', null, '', '', '1', '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 13:48:36', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 14:33:07', null, '0');
INSERT INTO `sys_menu` VALUES ('1d0b04f75a3b4bb0a7f5bf3c01126424', '转发消息', '89787ef46fe94bc5a470d35d4a4daf05', '3', '316277d2d6fa47b2b27265f2ba669846,89787ef46fe94bc5a470d35d4a4daf05,1d0b04f75a3b4bb0a7f5bf3c01126424,', '1', '', null, null, '', '0', 'user:message:add', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-23 16:40:56', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-23 22:05:43', null, '0');
INSERT INTO `sys_menu` VALUES ('20af27585ca641f1879358fd1bb4f218', '修改农田', '99c78288bf7d43f09b439ab00239ae86', '3', '154e56abaf494269943d4e40015c9ad0,99c78288bf7d43f09b439ab00239ae86,20af27585ca641f1879358fd1bb4f218,', '2', '', null, null, '', '0', 'farm:user:edit', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 19:08:35', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 19:08:54', null, '0');
INSERT INTO `sys_menu` VALUES ('316277d2d6fa47b2b27265f2ba669846', '消息管理', null, '1', '316277d2d6fa47b2b27265f2ba669846,', '4', '', null, '', '', '1', '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-23 15:56:33', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-23 15:56:33', null, '0');
INSERT INTO `sys_menu` VALUES ('3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', '用户管理', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb', '2', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,', '9', '/admin/system/user/list', null, '', '#47e69c', '1', 'sys:user:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-16 11:31:18', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-20 05:59:20', null, '0');
INSERT INTO `sys_menu` VALUES ('3b58e01e-9adb-11e8-aebe-1368d4ec24eb', '令牌管理', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb', '2', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,', '10', '/admin/system/role/list', null, '', '#c23ab9', '1', 'sys:role:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-16 11:32:33', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 13:55:40', null, '0');
INSERT INTO `sys_menu` VALUES ('3b5cb607-9adb-11e8-aebe-1368d4ec24eb', '权限管理', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb', '2', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,', '20', '/admin/system/menu/list', null, '', '#d4573b', '1', 'sys:menu:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-16 11:33:19', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:49:28', null, '0');
INSERT INTO `sys_menu` VALUES ('3c7f0aa572d648349c594f572af1d97f', '温度管理', '679ef59d6f30441ba57a5eb051eb917e', '2', '679ef59d6f30441ba57a5eb051eb917e,3c7f0aa572d648349c594f572af1d97f,', '3', '/admin/farm/temper/list', null, '', '', '1', 'farm:temper:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 13:50:31', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 14:32:20', null, '0');
INSERT INTO `sys_menu` VALUES ('3e0b86a3-9adc-11e8-aebe-1368d4ec24eb', '新增用户', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', '3', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,3e0b86a3-9adc-11e8-aebe-1368d4ec24eb,', '0', '', null, null, null, '0', 'sys:user:add', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:10:32', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:10:32', null, '0');
INSERT INTO `sys_menu` VALUES ('3e2fa8b6-9adc-11e8-aebe-1368d4ec24eb', '编辑用户', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', '3', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,3e2fa8b6-9adc-11e8-aebe-1368d4ec24eb,', '10', '', null, null, null, '0', 'sys:user:edit', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:11:49', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:11:49', null, '0');
INSERT INTO `sys_menu` VALUES ('3e36cf2f-9adc-11e8-aebe-1368d4ec24eb', '删除用户', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', '3', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,3e36cf2f-9adc-11e8-aebe-1368d4ec24eb,', '20', '', null, null, null, '0', 'sys:user:delete', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:12:43', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:12:43', null, '0');
INSERT INTO `sys_menu` VALUES ('493f9cc85a284e098c047000d59d81f4', '新增农田', '99c78288bf7d43f09b439ab00239ae86', '3', '154e56abaf494269943d4e40015c9ad0,99c78288bf7d43f09b439ab00239ae86,493f9cc85a284e098c047000d59d81f4,', '1', '', null, null, '', '0', 'farm:user:add', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 19:07:38', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 19:08:07', null, '0');
INSERT INTO `sys_menu` VALUES ('563f189b651b42168ee6e12b9ff115e4', '光照管理', '679ef59d6f30441ba57a5eb051eb917e', '2', '679ef59d6f30441ba57a5eb051eb917e,563f189b651b42168ee6e12b9ff115e4,', '1', '/admin/farm/sun/list', null, '', '', '1', 'farm:sun:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 13:53:03', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 14:32:11', null, '0');
INSERT INTO `sys_menu` VALUES ('679ef59d6f30441ba57a5eb051eb917e', '当前请求', null, '1', '679ef59d6f30441ba57a5eb051eb917e,', '3', '', null, '', '', '1', '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 13:49:41', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 14:32:57', null, '0');
INSERT INTO `sys_menu` VALUES ('7d1020ee-9ad9-11e8-aebe-1368d4ec24eb', '系统管理', null, '1', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,', '1', '', null, '', null, '1', '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-16 11:29:46', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-20 03:09:26', null, '0');
INSERT INTO `sys_menu` VALUES ('89787ef46fe94bc5a470d35d4a4daf05', '我的消息', '316277d2d6fa47b2b27265f2ba669846', '2', '316277d2d6fa47b2b27265f2ba669846,89787ef46fe94bc5a470d35d4a4daf05,', '1', '/admin/user/message/list', null, '', '', '1', 'user:message:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-23 15:57:34', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-23 20:42:19', null, '0');
INSERT INTO `sys_menu` VALUES ('96fd6a5a-9adb-11e8-aebe-1368d4ec24eb', '新增权限', '3b5cb607-9adb-11e8-aebe-1368d4ec24eb', '3', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,96fd6a5a-9adb-11e8-aebe-1368d4ec24eb,', '0', '', null, null, null, '0', 'sys:menu:add', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:49:15', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:49:38', null, '0');
INSERT INTO `sys_menu` VALUES ('9703ccf2-9adb-11e8-aebe-1368d4ec24eb', '编辑权限', '3b5cb607-9adb-11e8-aebe-1368d4ec24eb', '3', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,9703ccf2-9adb-11e8-aebe-1368d4ec24eb,', '10', '', null, null, null, '0', 'sys:menu:edit', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:50:16', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:50:25', null, '0');
INSERT INTO `sys_menu` VALUES ('9707cf58-9adb-11e8-aebe-1368d4ec24eb', '删除权限', '3b5cb607-9adb-11e8-aebe-1368d4ec24eb', '3', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,9707cf58-9adb-11e8-aebe-1368d4ec24eb,', '20', '', null, null, null, '0', 'sys:menu:delete', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:51:53', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:53:42', null, '0');
INSERT INTO `sys_menu` VALUES ('99c78288bf7d43f09b439ab00239ae86', '我的农田', '154e56abaf494269943d4e40015c9ad0', '2', '154e56abaf494269943d4e40015c9ad0,99c78288bf7d43f09b439ab00239ae86,', '1', '/admin/farm/user/list', null, '', '', '1', 'farm:user:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 13:49:25', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 14:28:49', null, '0');
INSERT INTO `sys_menu` VALUES ('a27863352b9a44c19cf521ba2d56667b', '湿度管理', '679ef59d6f30441ba57a5eb051eb917e', '2', '679ef59d6f30441ba57a5eb051eb917e,a27863352b9a44c19cf521ba2d56667b,', '2', '/admin/farm/hum/list', null, '', '', '1', 'farm:hum:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 13:52:24', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 14:29:46', null, '0');
INSERT INTO `sys_menu` VALUES ('e90afb6c6e6c4d0fa4e935517bcc47ef', '删除农田', '99c78288bf7d43f09b439ab00239ae86', '3', '154e56abaf494269943d4e40015c9ad0,99c78288bf7d43f09b439ab00239ae86,e90afb6c6e6c4d0fa4e935517bcc47ef,', '3', '', null, null, '', '0', 'farm:user:delete', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 19:09:19', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 20:37:28', null, '0');
INSERT INTO `sys_menu` VALUES ('ed63866b30cf46bfb6797a1d31ae930c', '锁定用户', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', '3', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,ed63866b30cf46bfb6797a1d31ae930c,', '21', '', null, null, '', '0', 'sys:user:lock', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-08-21 17:44:05', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-08-21 17:44:05', null, '0');
INSERT INTO `sys_menu` VALUES ('f65cf5c7392c4f79a745fe4776d8f160', '发送消息', '316277d2d6fa47b2b27265f2ba669846', '2', '316277d2d6fa47b2b27265f2ba669846,f65cf5c7392c4f79a745fe4776d8f160,', '2', '/admin/user/message/add', null, '', '', '1', 'user:message:send', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-23 22:06:25', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-23 22:07:07', null, '0');
INSERT INTO `sys_menu` VALUES ('faf7229edfcf4172a33d3f3fd44948e7', '删除消息', '89787ef46fe94bc5a470d35d4a4daf05', '3', '316277d2d6fa47b2b27265f2ba669846,89787ef46fe94bc5a470d35d4a4daf05,faf7229edfcf4172a33d3f3fd44948e7,', '2', '', null, null, '', '0', 'user:message:delete', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-23 16:41:32', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-23 16:41:32', null, '0');
INSERT INTO `sys_menu` VALUES ('ff619e04-9adb-11e8-aebe-1368d4ec24eb', '新增令牌', '3b58e01e-9adb-11e8-aebe-1368d4ec24eb', '3', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,ff619e04-9adb-11e8-aebe-1368d4ec24eb,', '0', '', null, null, null, '0', 'sys:role:add', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:58:11', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:58:11', null, '0');
INSERT INTO `sys_menu` VALUES ('ff9477c9-9adb-11e8-aebe-1368d4ec24eb', '编辑权限', '3b58e01e-9adb-11e8-aebe-1368d4ec24eb', '3', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,ff9477c9-9adb-11e8-aebe-1368d4ec24eb,', '10', '', null, null, null, '0', 'sys:role:edit', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:59:01', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:59:01', null, '0');
INSERT INTO `sys_menu` VALUES ('ff9ad846-9adb-11e8-aebe-1368d4ec24eb', '删除令牌', '3b58e01e-9adb-11e8-aebe-1368d4ec24eb', '3', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,ff9ad846-9adb-11e8-aebe-1368d4ec24eb,', '20', '', null, null, null, '0', 'sys:role:delete', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:59:56', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:59:56', null, '0');

-- ----------------------------
-- Table structure for `sys_rescource`
-- ----------------------------
DROP TABLE IF EXISTS `sys_rescource`;
CREATE TABLE `sys_rescource` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `source` varchar(255) DEFAULT NULL COMMENT '来源',
  `web_url` varchar(500) DEFAULT NULL COMMENT '资源网络地址',
  `hash` varchar(255) DEFAULT NULL COMMENT '文件标识',
  `file_size` varchar(50) DEFAULT NULL COMMENT '文件大小',
  `file_type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `original_net_url` text,
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(36) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(36) DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统资源';

-- ----------------------------
-- Records of sys_rescource
-- ----------------------------
INSERT INTO `sys_rescource` VALUES ('88852c24b8ed4190b883a4be0e0d3248', '7276118e-5ca3-4ab3-8188-e7d39a39b91b.jpg', 'local', '/static/upload/7276118e-5ca3-4ab3-8188-e7d39a39b91b.jpg', 'Fluz0NHAakDjZqPPX3XoD68lj55u', '9kb', 'image/jpeg', null, '2018-12-21 13:54:39', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 13:54:39', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', null, '0');

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
INSERT INTO `sys_role` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', '访客', null, null, null, null, null, '2017-11-02 14:19:07', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-08-21 20:04:02', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '', '0');
INSERT INTO `sys_role` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '系统管理员', '管理员', '', '110', '', '', '2017-11-29 19:36:37', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-23 22:07:20', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '', '0');
INSERT INTO `sys_role` VALUES ('8332ea7322704faa8a0fdfc9726d587c', '农田主', '农田主', '十陵', '', '', '40', '2018-12-21 21:18:55', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-23 18:02:23', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '', '0');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(36) NOT NULL,
  `menu_id` varchar(36) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '154e56abaf494269943d4e40015c9ad0');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '1d0b04f75a3b4bb0a7f5bf3c01126424');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '20af27585ca641f1879358fd1bb4f218');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '316277d2d6fa47b2b27265f2ba669846');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3b58e01e-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3b5cb607-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3c7f0aa572d648349c594f572af1d97f');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3e0b86a3-9adc-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3e2fa8b6-9adc-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3e36cf2f-9adc-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '493f9cc85a284e098c047000d59d81f4');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '563f189b651b42168ee6e12b9ff115e4');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '679ef59d6f30441ba57a5eb051eb917e');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '89787ef46fe94bc5a470d35d4a4daf05');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '96fd6a5a-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '9703ccf2-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '9707cf58-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '99c78288bf7d43f09b439ab00239ae86');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'a27863352b9a44c19cf521ba2d56667b');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'e90afb6c6e6c4d0fa4e935517bcc47ef');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'ed63866b30cf46bfb6797a1d31ae930c');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'f65cf5c7392c4f79a745fe4776d8f160');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'faf7229edfcf4172a33d3f3fd44948e7');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'ff619e04-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'ff9477c9-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'ff9ad846-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('8332ea7322704faa8a0fdfc9726d587c', '154e56abaf494269943d4e40015c9ad0');
INSERT INTO `sys_role_menu` VALUES ('8332ea7322704faa8a0fdfc9726d587c', '1d0b04f75a3b4bb0a7f5bf3c01126424');
INSERT INTO `sys_role_menu` VALUES ('8332ea7322704faa8a0fdfc9726d587c', '20af27585ca641f1879358fd1bb4f218');
INSERT INTO `sys_role_menu` VALUES ('8332ea7322704faa8a0fdfc9726d587c', '316277d2d6fa47b2b27265f2ba669846');
INSERT INTO `sys_role_menu` VALUES ('8332ea7322704faa8a0fdfc9726d587c', '3c7f0aa572d648349c594f572af1d97f');
INSERT INTO `sys_role_menu` VALUES ('8332ea7322704faa8a0fdfc9726d587c', '493f9cc85a284e098c047000d59d81f4');
INSERT INTO `sys_role_menu` VALUES ('8332ea7322704faa8a0fdfc9726d587c', '563f189b651b42168ee6e12b9ff115e4');
INSERT INTO `sys_role_menu` VALUES ('8332ea7322704faa8a0fdfc9726d587c', '679ef59d6f30441ba57a5eb051eb917e');
INSERT INTO `sys_role_menu` VALUES ('8332ea7322704faa8a0fdfc9726d587c', '89787ef46fe94bc5a470d35d4a4daf05');
INSERT INTO `sys_role_menu` VALUES ('8332ea7322704faa8a0fdfc9726d587c', '99c78288bf7d43f09b439ab00239ae86');
INSERT INTO `sys_role_menu` VALUES ('8332ea7322704faa8a0fdfc9726d587c', 'a27863352b9a44c19cf521ba2d56667b');
INSERT INTO `sys_role_menu` VALUES ('8332ea7322704faa8a0fdfc9726d587c', 'e90afb6c6e6c4d0fa4e935517bcc47ef');
INSERT INTO `sys_role_menu` VALUES ('8332ea7322704faa8a0fdfc9726d587c', 'faf7229edfcf4172a33d3f3fd44948e7');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('18b8b543-9ad7-11e8-aebe-1368d4ec24eb', 'java', '我是管理员', '/static/upload/7276118e-5ca3-4ab3-8188-e7d39a39b91b.jpg', '9c5feb7aba88c7c87bc047c7cec7c6e3b63e1894', '08c5900125b80cd2', '管理员', null, '110', 'b@qq.com', null, '0', '2017-11-27 22:19:39', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-23 15:12:58', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '测试', '0', '1');
INSERT INTO `sys_user` VALUES ('244ed8a411b3464996a6cab8c16048e4', '我是农民', 'I\'m农民', null, 'f3f94fa171a1808edad4cdc9a2bcebae2fa2a234', '8fc3ac51cde539ab', '农田主', '十陵', '13313313313', '133@qq.com', '40', '0', '2018-12-21 21:19:59', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-23 20:03:43', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', null, '0', '1');
INSERT INTO `sys_user` VALUES ('fcd3c425a4d54d13976f758b8545dff8', '风法师', 'as', null, '05e478d540778388d9708a5b90abb07065cdf955', 'e0e1dac7f508a616', '安抚', '安抚', '15915915915', '159@qq.com', '45', '0', '2018-12-23 18:33:13', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-23 18:33:20', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', null, '1', '1');

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
INSERT INTO `sys_user_role` VALUES ('fcd3c425a4d54d13976f758b8545dff8', '70689483-9ad7-11e8-aebe-1368d4ec24eb');

-- ----------------------------
-- Table structure for `t_farm`
-- ----------------------------
DROP TABLE IF EXISTS `t_farm`;
CREATE TABLE `t_farm` (
  `id` varchar(255) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` varchar(10) DEFAULT '0',
  `userId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_farm
-- ----------------------------
INSERT INTO `t_farm` VALUES ('1', '管理员测试农田01', '成大一期', '100', null, '2018-12-21 15:26:09', null, null, '测试', '0', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb');
INSERT INTO `t_farm` VALUES ('2c144638ee5e4c559b26e7ec31ca08ca', 'afa', 'asfas3', '33', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 20:40:40', null, null, 'fasf', '1', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb');
INSERT INTO `t_farm` VALUES ('36ef3adf887a47bfb356d1b7af0bedcd', '十陵一期01', '十陵一期', '20', '244ed8a411b3464996a6cab8c16048e4', '2018-12-21 21:50:00', null, null, '', '0', '244ed8a411b3464996a6cab8c16048e4');
INSERT INTO `t_farm` VALUES ('4104f76bcd524a2c87e02b21905a7ac7', 'asd', 'asd', '22', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 20:40:30', null, null, 'ad', '1', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb');
INSERT INTO `t_farm` VALUES ('757f7d27c4324656826265155557998f', 'ads', 'asagadg', '44', '244ed8a411b3464996a6cab8c16048e4', '2018-12-22 17:15:59', null, null, '', '1', '244ed8a411b3464996a6cab8c16048e4');
INSERT INTO `t_farm` VALUES ('81ed896f91f043268ef03a943b80c050', 'asdaf', 'faf', '11', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 20:50:00', null, null, 'fa', '1', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb');
INSERT INTO `t_farm` VALUES ('b294dddd9e8740688ae43ba52bd36fb1', 'adasd', 'asdasd', '34', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 19:40:51', null, null, '', '1', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb');
INSERT INTO `t_farm` VALUES ('cae735bf65e04b97a0f95050488e3449', '测试添加农田02', '十陵', '23', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-21 20:10:58', null, null, '阿达', '0', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb');

-- ----------------------------
-- Table structure for `t_message`
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` varchar(255) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `message_type` varchar(50) DEFAULT NULL,
  `to_user` varchar(255) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_name` varchar(100) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` varchar(10) DEFAULT '0',
  `is_look` varchar(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES ('1858263a07554150bdebeb93ed1725be', 'aasd', 'ff', 'ff', '244ed8a411b3464996a6cab8c16048e4', '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', 'I\'m农民', '2018-12-23 22:32:59', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-23 22:32:59', '0', '0');
INSERT INTO `t_message` VALUES ('25ff0debf573414bb1f13a8838b659d1', '申请修改属性值', '我是管理员申请修改属性值', '属性更改', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', null, '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '我是管理员', '2018-12-23 15:11:10', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-23 23:21:19', '0', '1');
INSERT INTO `t_message` VALUES ('82484b9bf4f7403ea61939c3accf5531', '申请修改属性值', '我是管理员申请修改属性值', '属性更改', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', null, '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '我是管理员', '2018-12-23 18:34:04', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-23 18:34:04', '1', '1');
INSERT INTO `t_message` VALUES ('ba9c22bb66584162829f77d9a678cd38', '来来来', '啦啦啦啦啦啦', '啦啦啦啦啦', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '我是管理员', null, null, '2018-12-23 20:24:35', '1', '0');
INSERT INTO `t_message` VALUES ('dd3ebaacc72d458eb1071ba9d037582d', 'afa', 'asf', 'assf', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '我是管理员', '2018-12-23 22:33:34', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-23 23:33:35', '0', '1');
INSERT INTO `t_message` VALUES ('dd9c4d925c734d9eb9db2a4f1136b504', 'ad', 'asfaf', 'asd', '244ed8a411b3464996a6cab8c16048e4', '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', 'I\'m农民', null, null, '2018-12-23 17:28:42', '0', '1');
INSERT INTO `t_message` VALUES ('edc6a9ed641b440790d4d5f17cb48e81', '申请修改属性值', '我是管理员申请修改属性值', '属性更改', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', null, '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '我是管理员', '2018-12-23 21:21:26', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-12-23 23:33:37', '0', '1');
INSERT INTO `t_message` VALUES ('fa225461a1ae4fddba0fa79fc94b3780', 'afasf', 'sdg', 'gdsg', '244ed8a411b3464996a6cab8c16048e4', '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', 'I\'m农民', null, null, '2018-12-23 17:59:48', '0', '0');
