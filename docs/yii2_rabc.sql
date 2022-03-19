/*
 Navicat Premium Data Transfer

 Source Server         : 120.25.227.106
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : 120.25.227.106:3306
 Source Schema         : yii2_rabc

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 19/03/2022 13:59:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for access
-- ----------------------------
DROP TABLE IF EXISTS `access`;
CREATE TABLE `access`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限名称',
  `urls` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'json 数组',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1：有效 0：无效',
  `updated_time` timestamp(0) NOT NULL COMMENT '最后一次更新时间',
  `created_time` timestamp(0) NOT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of access
-- ----------------------------
INSERT INTO `access` VALUES (1, '测试页面一', '[\"test\\/page1\"]', 1, '2022-03-19 11:10:27', '2022-03-19 11:10:27');
INSERT INTO `access` VALUES (2, '首页', '[\"default\\/index\"]', 1, '2022-03-19 11:10:51', '2022-03-19 11:10:51');
INSERT INTO `access` VALUES (3, '测试页面二', '[\"test\\/page2\"]', 1, '2022-03-19 11:11:14', '2022-03-19 11:11:14');

-- ----------------------------
-- Table structure for app_access_log
-- ----------------------------
DROP TABLE IF EXISTS `app_access_log`;
CREATE TABLE `app_access_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL DEFAULT 0 COMMENT '品牌UID',
  `target_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访问的url',
  `query_params` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'get和post参数',
  `ua` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访问ua',
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访问ip',
  `note` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'json格式备注字段',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户操作记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1：有效 0：无效',
  `updated_time` timestamp(0) NOT NULL COMMENT '最后一次更新时间',
  `created_time` timestamp(0) NOT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'PHP开发组', 1, '2022-03-19 11:09:10', '2022-03-19 11:09:10');
INSERT INTO `role` VALUES (2, '测试组', 1, '2022-03-19 11:09:20', '2022-03-19 11:09:20');

-- ----------------------------
-- Table structure for role_access
-- ----------------------------
DROP TABLE IF EXISTS `role_access`;
CREATE TABLE `role_access`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT 0 COMMENT '角色id',
  `access_id` int(11) NOT NULL DEFAULT 0 COMMENT '权限id',
  `created_time` timestamp(0) NOT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_access
-- ----------------------------
INSERT INTO `role_access` VALUES (1, 2, 2, '2022-03-19 11:26:22');
INSERT INTO `role_access` VALUES (2, 1, 3, '2022-03-19 11:26:32');
INSERT INTO `role_access` VALUES (3, 1, 2, '2022-03-19 11:26:32');
INSERT INTO `role_access` VALUES (4, 1, 1, '2022-03-19 11:26:32');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `is_admin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是超级管理员 1表示是 0 表示不是',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1：有效 0：无效',
  `updated_time` timestamp(0) NOT NULL COMMENT '最后一次更新时间',
  `created_time` timestamp(0) NOT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '超级管理员', 'apanly@163.com', 1, 1, '2016-11-15 13:36:30', '2016-11-15 13:36:30');
INSERT INTO `user` VALUES (2, 'admin', '941192051@qq.com', 0, 1, '2022-03-19 11:09:39', '2022-03-19 11:09:39');
INSERT INTO `user` VALUES (3, '测试1', '649122412@qq.com', 0, 1, '2022-03-19 11:09:57', '2022-03-19 11:09:57');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `role_id` int(11) NOT NULL DEFAULT 0 COMMENT '角色ID',
  `created_time` timestamp(0) NOT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 2, 1, '2022-03-19 11:09:39');
INSERT INTO `user_role` VALUES (2, 3, 2, '2022-03-19 11:09:57');

SET FOREIGN_KEY_CHECKS = 1;
