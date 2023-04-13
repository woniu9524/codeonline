/*
 Navicat Premium Data Transfer

 Source Server         : zzl腾讯云
 Source Server Type    : MySQL
 Source Server Version : 50741 (5.7.41)
 Source Host           : 127.0.0.1:3306
 Source Schema         : ry-cloud

 Target Server Type    : MySQL
 Target Server Version : 50741 (5.7.41)
 File Encoding         : 65001

 Date: 18/03/2023 00:37:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for README
-- ----------------------------
DROP TABLE IF EXISTS `README`;
CREATE TABLE `README`  (
  `id` int(11) NOT NULL,
  `readme` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `BTC_address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `email` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for business_affair
-- ----------------------------
DROP TABLE IF EXISTS `business_affair`;
CREATE TABLE `business_affair`  (
  `affair_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '事务id',
  `handle_people_id` bigint(20) NULL DEFAULT NULL COMMENT '处理人',
  `affair_people_id` bigint(20) NULL DEFAULT NULL COMMENT '事务发起人id',
  `affair_people_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事务发起人昵称',
  `affair_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事务类型',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事务内容',
  `affair_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事务状态',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `access_id` bigint(20) NULL DEFAULT NULL COMMENT '关联具体事务的id',
  `reply` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核回复',
  PRIMARY KEY (`affair_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of business_affair
-- ----------------------------

-- ----------------------------
-- Table structure for business_course
-- ----------------------------
DROP TABLE IF EXISTS `business_course`;
CREATE TABLE `business_course`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `teacher_id` bigint(20) NULL DEFAULT NULL COMMENT '教师id',
  `teacher_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教师名',
  `course_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名',
  `course_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程状态(未开始,进行中,已结束)',
  `introduction` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '课程简介',
  `course_start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `course_end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `course_week` int(11) NULL DEFAULT NULL COMMENT '课程周数',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of business_course
-- ----------------------------
INSERT INTO `business_course` VALUES (3, 1, 'admin', 'python程序设计', NULL, '好好学习，天天向上', '2023-01-01 02:34:00', '2023-01-01 00:00:00', 16, 'admin', '2023-02-09 02:34:21', 'admin', '2023-02-09 02:34:21');
INSERT INTO `business_course` VALUES (4, 1, 'admin', 'java程序设计', NULL, 'java是世界上最好的语言', '2023-01-01 02:42:44', '2023-01-01 02:42:50', 16, 'admin', '2023-02-09 02:43:02', NULL, '2023-02-09 02:53:08');

-- ----------------------------
-- Table structure for business_identity
-- ----------------------------
DROP TABLE IF EXISTS `business_identity`;
CREATE TABLE `business_identity`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '注册用户',
  `identity_id` bigint(20) NULL DEFAULT NULL COMMENT '注册的身份(100是老师，101是学生)',
  `university_id` bigint(20) NULL DEFAULT NULL COMMENT '大学id',
  `college_id` bigint(20) NULL DEFAULT NULL COMMENT '学院id',
  `class_id` bigint(20) NULL DEFAULT NULL COMMENT '班级id',
  `university_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大学名',
  `college_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学院名',
  `class_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级名',
  `approver_id` bigint(20) NULL DEFAULT NULL COMMENT '审批人id',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `has_finished` tinyint(4) NULL DEFAULT NULL COMMENT '是否完成',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目前状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of business_identity
-- ----------------------------
INSERT INTO `business_identity` VALUES (17, 1, 101, 100, 101, 103, '扬州大学', '信息工程学院', '计科1901', 100, 'admin', '2023-02-08 05:10:55', 'zhangsan', '2023-02-08 19:28:09', '啊啊', 1, '已拒绝');
INSERT INTO `business_identity` VALUES (18, 105, 101, 100, 101, 103, '扬州大学', '信息工程学院', '计科1901', 100, 'student', '2023-02-08 20:11:41', 'zhangsan', '2023-02-08 20:15:04', '通过一下', 1, '已通过');

-- ----------------------------
-- Table structure for business_lab
-- ----------------------------
DROP TABLE IF EXISTS `business_lab`;
CREATE TABLE `business_lab`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `lab_id` bigint(32) NOT NULL COMMENT '实验id',
  `course_id` bigint(20) NOT NULL COMMENT '课程id',
  `lab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实验名称',
  `lab_content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '实验内容',
  `lab_start_time` datetime NULL DEFAULT NULL COMMENT '实验开始时间',
  `lab_end_time` datetime NULL DEFAULT NULL COMMENT '实验结束时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `lab_id_sy`(`lab_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '实验信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of business_lab
-- ----------------------------
INSERT INTO `business_lab` VALUES (1, 1678556268265, 3, '实验一', '在vscode中写一段python代码', '2023-03-12 01:37:19', '2023-03-25 00:00:00', 'admin', '2023-03-12 01:37:48', 'admin', '2023-03-17 23:55:45');
INSERT INTO `business_lab` VALUES (2, 1678943372804, 3, '实验二', '用jupyter写python', '2023-03-16 13:08:05', '2023-04-28 00:00:00', 'admin', '2023-03-16 13:09:34', 'admin', '2023-03-16 17:33:50');

-- ----------------------------
-- Table structure for business_user_and_course_relation
-- ----------------------------
DROP TABLE IF EXISTS `business_user_and_course_relation`;
CREATE TABLE `business_user_and_course_relation`  (
  `relation_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '关联id',
  `user_id` bigint(20) NOT NULL COMMENT '学生id',
  `course_id` bigint(20) NOT NULL COMMENT '课程id',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`relation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生和课程关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of business_user_and_course_relation
-- ----------------------------
INSERT INTO `business_user_and_course_relation` VALUES (1, 102, 3, 'admin', '2023-03-10 11:54:58', 'admin', '2023-03-10 11:54:58', NULL);
INSERT INTO `business_user_and_course_relation` VALUES (2, 103, 3, 'admin', '2023-03-10 11:55:02', 'admin', '2023-03-10 11:55:02', NULL);
INSERT INTO `business_user_and_course_relation` VALUES (3, 105, 3, 'admin', '2023-03-10 11:55:07', 'admin', '2023-03-10 11:55:07', NULL);
INSERT INTO `business_user_and_course_relation` VALUES (4, 104, 3, 'admin', '2023-03-10 11:55:12', 'admin', '2023-03-10 11:55:12', NULL);

-- ----------------------------
-- Table structure for business_user_lab_score
-- ----------------------------
DROP TABLE IF EXISTS `business_user_lab_score`;
CREATE TABLE `business_user_lab_score`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) NULL DEFAULT NULL,
  `student_id` bigint(20) NULL DEFAULT NULL,
  `teacher_id` bigint(20) NULL DEFAULT NULL,
  `lab_id` bigint(20) NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of business_user_lab_score
-- ----------------------------
INSERT INTO `business_user_lab_score` VALUES (1, 3, 103, 1, 1678943372804, 95, '还行');

-- ----------------------------
-- Table structure for course_lab_file
-- ----------------------------
DROP TABLE IF EXISTS `course_lab_file`;
CREATE TABLE `course_lab_file`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) NULL DEFAULT NULL,
  `lab_id` bigint(20) NULL DEFAULT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `file_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1636759124500885507 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_lab_file
-- ----------------------------
INSERT INTO `course_lab_file` VALUES (1634609495944482817, 3, 1678556268265, 1, 'http://127.0.0.1:9300/statics/2023/03/12/22年 毕业实习需要完成的文档_20230312013728A010.docx', '22年 毕业实习需要完成的文档.docx');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for harbor_upload
-- ----------------------------
DROP TABLE IF EXISTS `harbor_upload`;
CREATE TABLE `harbor_upload`  (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传镜像id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `image_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '镜像名',
  `image_tag` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '镜像版本',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镜像路径',
  `is_public` tinyint(4) NULL DEFAULT NULL COMMENT '是否公开',
  `introduce` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '镜像介绍',
  `create_by` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of harbor_upload
-- ----------------------------
INSERT INTO `harbor_upload` VALUES (31, 1, '1_python-base-vscode', '1.0.0', 'http://127.0.0.1:9300/statics/2023/03/16/22年 毕业实习需要完成的文档_20230316120636A009.docx', 1, 'python的vscode的基础环境', 'admin', '2023-03-15 12:11:58', 'admin', '2023-03-15 12:11:58');
INSERT INTO `harbor_upload` VALUES (32, 1, '1_jupyter-base', '1.0.0', 'http://127.0.0.1:9300/statics/2023/03/16/22年 毕业实习需要完成的文档_20230316120636A009.docx', 1, 'jupyter基础环境', 'admin', '2023-03-16 12:11:58', 'admin', '2023-03-16 12:11:58');

-- ----------------------------
-- Table structure for k8s_configure
-- ----------------------------
DROP TABLE IF EXISTS `k8s_configure`;
CREATE TABLE `k8s_configure`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `configure` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '配置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'k8s配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of k8s_configure
-- ----------------------------
INSERT INTO `k8s_configure` VALUES (1, '{\"sourceFrom\":\"harbor\",\"imageName\":\"1_python-base-vscode:1.0.0\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"startCmd\":\"\",\"envs\":[{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"PUID\",\"value\":\"1000\"},{\"key\":\"SUDO_PASSWORD\",\"value\":\"123456\"}],\"volume\":\"\",\"description\":\"sudo密码是123456\",\"privilege\":true}');
INSERT INTO `k8s_configure` VALUES (2, '{\"sourceFrom\":\"harbor\",\"imageName\":\"1_jupyter-base:1.0.0\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"startCmd\":\"start.sh\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token\\u003d\\u0027\\u0027,--NotebookApp.allow_origin\\u003d\\\"*\\\",--NotebookApp.open_browser\\u003dFalse\",\"envs\":[{\"key\":\"a\",\"value\":\"a\"}],\"volume\":\"/home/jovyan/\",\"privilege\":true}');

-- ----------------------------
-- Table structure for k8s_configure_relation
-- ----------------------------
DROP TABLE IF EXISTS `k8s_configure_relation`;
CREATE TABLE `k8s_configure_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `lab_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '实验id',
  `configure_id` bigint(20) NULL DEFAULT NULL COMMENT '配置文件id',
  `has_public` tinyint(4) NULL DEFAULT NULL COMMENT '是否公开',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of k8s_configure_relation
-- ----------------------------
INSERT INTO `k8s_configure_relation` VALUES (1, 1, '1678556268265', 1, 1);
INSERT INTO `k8s_configure_relation` VALUES (2, 1, '1678943372804', 2, 1);

-- ----------------------------
-- Table structure for k8s_user_and_deploy_relation
-- ----------------------------
DROP TABLE IF EXISTS `k8s_user_and_deploy_relation`;
CREATE TABLE `k8s_user_and_deploy_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `teacher_id` bigint(20) NULL DEFAULT NULL COMMENT '教师id',
  `lab_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实验id',
  `deploy_namespace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'deploy命名空间',
  `deployment_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'deploy名称',
  `service_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'service名称',
  `destroy_time` datetime NULL DEFAULT NULL,
  `has_destroy` tinyint(4) NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户创建deploy之后的关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of k8s_user_and_deploy_relation
-- ----------------------------
INSERT INTO `k8s_user_and_deploy_relation` VALUES (1, 1, 1, '1678556268265', 'codeonline-all', 'codeonline-deployment-1678556268265-1', 'codeonline-service-1678556268265-1', '2023-03-16 17:50:59', 1, 'admin', '2023-03-16 12:47:19', 'admin', '2023-03-16 17:36:55');
INSERT INTO `k8s_user_and_deploy_relation` VALUES (2, 1, 1, '1678943372804', 'codeonline-all', 'codeonline-deployment-1678943372804-1', 'codeonline-service-1678943372804-1', NULL, 0, 'admin', '2023-03-16 13:09:52', 'admin', '2023-03-16 19:01:02');
INSERT INTO `k8s_user_and_deploy_relation` VALUES (3, 103, 1, '1678943372804', 'codeonline-all', 'codeonline-deployment-1678943372804-103', 'codeonline-service-1678943372804-103', '2023-03-16 18:26:18', 1, '10002', '2023-03-16 18:25:03', '10002', '2023-03-16 18:25:20');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-02-07 16:17:23', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-02-07 16:17:23', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-02-07 16:17:23', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2023-02-07 16:17:23', 'admin', '2023-02-07 20:04:49', '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 204 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '扬州大学', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-22 18:03:32', 'admin', '2022-11-22 18:03:32');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '信息工程学院', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-22 18:03:32', 'admin', '2022-11-22 18:03:32');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '计科1901', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-22 18:03:32', 'admin', '2022-11-22 18:03:32');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '计科1902', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-22 18:03:32', 'admin', '2022-11-22 18:03:32');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '软工1901', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-22 18:03:32', 'admin', '2022-11-22 18:03:32');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '软工1902', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-22 18:03:32', 'admin', '2022-11-22 18:03:32');
INSERT INTO `sys_dept` VALUES (200, 100, '0,100', '文学院', 2, NULL, NULL, NULL, '0', '0', 'admin', '2023-02-08 20:31:12', '', NULL);
INSERT INTO `sys_dept` VALUES (201, 200, '0,100,200', '中文1901', 1, NULL, NULL, NULL, '0', '0', 'admin', '2023-02-08 20:31:36', '', NULL);
INSERT INTO `sys_dept` VALUES (202, 200, '0,100,200', '中文1902', 2, NULL, NULL, NULL, '0', '0', 'admin', '2023-02-08 20:32:01', '', NULL);
INSERT INTO `sys_dept` VALUES (203, 200, '0,100,200', '秘书1901', 3, NULL, NULL, NULL, '0', '0', 'admin', '2023-02-08 20:32:14', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-02-07 16:17:23', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 222 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '0', '登录成功', '2023-02-07 16:26:52');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '0', '登录成功', '2023-02-07 17:36:49');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '0', '退出成功', '2023-02-07 19:26:21');
INSERT INTO `sys_logininfor` VALUES (103, 'zhangsan', '127.0.0.1', '0', '登录成功', '2023-02-07 19:26:33');
INSERT INTO `sys_logininfor` VALUES (104, 'zhangsan', '127.0.0.1', '0', '退出成功', '2023-02-07 19:26:42');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '0', '登录成功', '2023-02-07 19:26:47');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '0', '退出成功', '2023-02-07 19:33:04');
INSERT INTO `sys_logininfor` VALUES (107, 'zhangsan', '127.0.0.1', '0', '登录成功', '2023-02-07 19:33:14');
INSERT INTO `sys_logininfor` VALUES (108, 'zhangsan', '127.0.0.1', '0', '退出成功', '2023-02-07 19:34:22');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '0', '登录成功', '2023-02-07 19:34:28');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '0', '退出成功', '2023-02-07 19:40:24');
INSERT INTO `sys_logininfor` VALUES (111, 'zc', '127.0.0.1', '0', '注册成功', '2023-02-07 19:42:59');
INSERT INTO `sys_logininfor` VALUES (112, 'zc', '127.0.0.1', '0', '登录成功', '2023-02-07 19:48:10');
INSERT INTO `sys_logininfor` VALUES (113, 'zc', '127.0.0.1', '0', '退出成功', '2023-02-07 19:48:17');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '0', '登录成功', '2023-02-07 19:50:39');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '0', '退出成功', '2023-02-07 20:07:58');
INSERT INTO `sys_logininfor` VALUES (116, '10001', '127.0.0.1', '0', '注册成功', '2023-02-07 20:08:15');
INSERT INTO `sys_logininfor` VALUES (117, '10001', '127.0.0.1', '0', '登录成功', '2023-02-07 20:08:28');
INSERT INTO `sys_logininfor` VALUES (118, '10001', '127.0.0.1', '0', '退出成功', '2023-02-07 20:09:48');
INSERT INTO `sys_logininfor` VALUES (119, '10002', '127.0.0.1', '0', '注册成功', '2023-02-07 20:10:03');
INSERT INTO `sys_logininfor` VALUES (120, '10004', '127.0.0.1', '0', '注册成功', '2023-02-07 20:10:53');
INSERT INTO `sys_logininfor` VALUES (121, '10004', '127.0.0.1', '0', '登录成功', '2023-02-07 20:11:03');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '0', '登录成功', '2023-02-07 21:00:20');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '0', '登录成功', '2023-02-08 06:14:58');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '0', '退出成功', '2023-02-08 15:55:26');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '0', '登录成功', '2023-02-08 15:55:35');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '0', '退出成功', '2023-02-08 16:55:40');
INSERT INTO `sys_logininfor` VALUES (127, 'zhangsan', '127.0.0.1', '0', '登录成功', '2023-02-08 16:55:54');
INSERT INTO `sys_logininfor` VALUES (128, 'zhangsan', '127.0.0.1', '0', '退出成功', '2023-02-08 16:56:07');
INSERT INTO `sys_logininfor` VALUES (129, 'zc', '127.0.0.1', '0', '登录成功', '2023-02-08 16:57:15');
INSERT INTO `sys_logininfor` VALUES (130, 'zc', '127.0.0.1', '0', '退出成功', '2023-02-08 16:57:24');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '0', '登录成功', '2023-02-08 16:57:29');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '0', '退出成功', '2023-02-08 16:58:33');
INSERT INTO `sys_logininfor` VALUES (133, 'zc', '127.0.0.1', '0', '登录成功', '2023-02-08 16:58:43');
INSERT INTO `sys_logininfor` VALUES (134, 'zc', '127.0.0.1', '0', '退出成功', '2023-02-08 17:00:32');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '0', '登录成功', '2023-02-08 17:01:36');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '0', '退出成功', '2023-02-08 17:17:20');
INSERT INTO `sys_logininfor` VALUES (137, 'zc', '127.0.0.1', '0', '登录成功', '2023-02-08 17:17:33');
INSERT INTO `sys_logininfor` VALUES (138, 'zc', '127.0.0.1', '0', '退出成功', '2023-02-08 17:20:04');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '0', '登录成功', '2023-02-08 17:20:17');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '0', '退出成功', '2023-02-08 17:44:55');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '0', '登录成功', '2023-02-08 17:45:01');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '0', '退出成功', '2023-02-08 18:27:49');
INSERT INTO `sys_logininfor` VALUES (143, 'zhangsan', '127.0.0.1', '0', '登录成功', '2023-02-08 18:28:04');
INSERT INTO `sys_logininfor` VALUES (144, 'zhangsan', '127.0.0.1', '0', '退出成功', '2023-02-08 18:28:26');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '0', '登录成功', '2023-02-08 18:28:31');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '0', '退出成功', '2023-02-08 18:29:31');
INSERT INTO `sys_logininfor` VALUES (147, 'zhangsan', '127.0.0.1', '0', '登录成功', '2023-02-08 18:29:42');
INSERT INTO `sys_logininfor` VALUES (148, 'zhangsan', '127.0.0.1', '0', '退出成功', '2023-02-08 19:32:41');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '0', '登录成功', '2023-02-08 19:32:47');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '0', '退出成功', '2023-02-08 20:10:41');
INSERT INTO `sys_logininfor` VALUES (151, 'student', '127.0.0.1', '0', '注册成功', '2023-02-08 20:11:06');
INSERT INTO `sys_logininfor` VALUES (152, 'student', '127.0.0.1', '0', '登录成功', '2023-02-08 20:11:20');
INSERT INTO `sys_logininfor` VALUES (153, 'student', '127.0.0.1', '0', '退出成功', '2023-02-08 20:11:51');
INSERT INTO `sys_logininfor` VALUES (154, 'zhangsan', '127.0.0.1', '0', '登录成功', '2023-02-08 20:12:05');
INSERT INTO `sys_logininfor` VALUES (155, 'zhangsan', '127.0.0.1', '0', '退出成功', '2023-02-08 20:15:09');
INSERT INTO `sys_logininfor` VALUES (156, 'student', '127.0.0.1', '0', '登录成功', '2023-02-08 20:15:23');
INSERT INTO `sys_logininfor` VALUES (157, 'student', '127.0.0.1', '0', '退出成功', '2023-02-08 20:17:41');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '0', '登录成功', '2023-02-08 20:17:47');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '0', '退出成功', '2023-02-08 21:17:26');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '0', '登录成功', '2023-02-08 21:17:31');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '0', '退出成功', '2023-02-09 14:30:14');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '0', '登录成功', '2023-02-09 14:30:20');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '0', '登录成功', '2023-02-12 06:49:12');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '0', '登录成功', '2023-02-13 04:57:24');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '0', '退出成功', '2023-02-14 09:18:35');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '0', '登录成功', '2023-02-14 09:18:47');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '0', '登录成功', '2023-02-19 03:30:36');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-10 10:21:50');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-10 11:47:20');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '0', '退出成功', '2023-03-10 14:05:12');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '0', '退出成功', '2023-03-10 17:13:37');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-10 17:13:42');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-11 10:05:51');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-11 10:42:48');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '0', '退出成功', '2023-03-11 18:18:09');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-11 18:18:13');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '0', '退出成功', '2023-03-11 18:18:27');
INSERT INTO `sys_logininfor` VALUES (178, 'zhangsan', '127.0.0.1', '0', '登录成功', '2023-03-11 18:18:46');
INSERT INTO `sys_logininfor` VALUES (179, 'zhangsan', '127.0.0.1', '0', '退出成功', '2023-03-11 18:20:58');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-11 18:21:04');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '0', '退出成功', '2023-03-11 18:21:11');
INSERT INTO `sys_logininfor` VALUES (182, '10004', '127.0.0.1', '0', '登录成功', '2023-03-11 18:21:32');
INSERT INTO `sys_logininfor` VALUES (183, '10004', '127.0.0.1', '0', '退出成功', '2023-03-11 18:23:57');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-11 18:24:09');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '0', '退出成功', '2023-03-11 20:13:30');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-11 20:13:37');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '0', '退出成功', '2023-03-11 20:47:23');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-11 20:47:38');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '0', '退出成功', '2023-03-12 00:53:17');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-12 00:53:24');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '0', '退出成功', '2023-03-12 01:29:25');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-12 01:29:37');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-15 12:44:48');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '0', '退出成功', '2023-03-16 00:06:22');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-16 00:06:27');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '0', '退出成功', '2023-03-16 00:42:10');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-16 00:42:16');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '0', '退出成功', '2023-03-16 00:51:24');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-16 00:51:32');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '0', '退出成功', '2023-03-16 01:27:28');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-16 01:27:35');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '0', '退出成功', '2023-03-16 02:05:02');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-16 02:08:51');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '0', '退出成功', '2023-03-16 02:15:01');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-16 02:15:07');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '0', '退出成功', '2023-03-16 02:29:25');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-16 02:29:35');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '0', '退出成功', '2023-03-16 11:39:33');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-16 12:05:30');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '0', '退出成功', '2023-03-16 13:00:54');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-16 13:01:00');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '0', '退出成功', '2023-03-16 17:08:35');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-16 17:08:39');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '0', '退出成功', '2023-03-16 17:13:50');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-16 17:13:56');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '0', '退出成功', '2023-03-16 18:18:44');
INSERT INTO `sys_logininfor` VALUES (217, '10002', '127.0.0.1', '0', '登录成功', '2023-03-16 18:19:03');
INSERT INTO `sys_logininfor` VALUES (218, '10002', '127.0.0.1', '0', '退出成功', '2023-03-16 18:26:24');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-16 18:26:31');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '0', '退出成功', '2023-03-17 06:34:01');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '0', '登录成功', '2023-03-17 23:53:34');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2025 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-02-07 16:17:23', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-02-07 16:17:23', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '1', '', 'tool', 'admin', '2023-02-07 16:17:23', 'admin', '2023-03-11 10:49:41', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 2002, 2, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-02-07 16:17:23', 'admin', '2023-02-08 06:20:29', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-02-07 16:17:23', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-02-07 16:17:23', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-02-07 16:17:23', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-02-07 16:17:23', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-02-07 16:17:23', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-02-07 16:17:23', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-02-07 16:17:23', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-02-07 16:17:23', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-02-07 16:17:23', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-02-07 16:17:23', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, 'Sentinel控制台', 2, 3, 'http://localhost:8718', '', '', 0, 0, 'C', '0', '0', 'monitor:sentinel:list', 'sentinel', 'admin', '2023-02-07 16:17:23', '', NULL, '流量控制菜单');
INSERT INTO `sys_menu` VALUES (112, 'Nacos控制台', 2, 4, 'http://localhost:8848/nacos', '', '', 0, 0, 'C', '0', '0', 'monitor:nacos:list', 'nacos', 'admin', '2023-02-07 16:17:23', '', NULL, '服务治理菜单');
INSERT INTO `sys_menu` VALUES (113, 'Admin控制台', 2, 5, 'http://localhost:9100/login', '', '', 0, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-02-07 16:17:23', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-02-07 16:17:23', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-02-07 16:17:23', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'http://localhost:8080/swagger-ui/index.html', '', '', 0, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-02-07 16:17:23', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', '', 1, 0, 'C', '0', '0', 'system:operlog:list', 'form', 'admin', '2023-02-07 16:17:23', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/logininfor/index', '', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', 'admin', '2023-02-07 16:17:23', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:unlock', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '用户管理', 0, 6, 'user', NULL, NULL, 1, 0, 'M', '0', '0', '', 'peoples', 'admin', '2023-02-07 16:50:31', 'admin', '2023-02-07 17:42:28', '');
INSERT INTO `sys_menu` VALUES (2003, '课程管理', 0, 7, 'course', NULL, NULL, 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-02-07 16:50:56', 'admin', '2023-02-08 20:34:01', '');
INSERT INTO `sys_menu` VALUES (2004, '消息中心', 0, 8, 'message', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'message', 'admin', '2023-02-07 16:51:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '数据统计', 0, 9, 'statistics', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'chart', 'admin', '2023-02-07 16:52:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '通讯录', 2002, 1, 'address', 'user/address/index', NULL, 1, 0, 'C', '0', '1', 'user:address:list', 'documentation', 'admin', '2023-02-07 16:56:24', 'admin', '2023-03-11 10:49:16', '');
INSERT INTO `sys_menu` VALUES (2008, '身份绑定批准', 2002, 4, 'approval', 'user/approval/index', NULL, 1, 0, 'C', '0', '0', 'user:approval:list', 'button', 'admin', '2023-02-07 17:00:19', 'admin', '2023-02-08 17:46:24', '');
INSERT INTO `sys_menu` VALUES (2009, '班级管理', 2002, 3, 'room', 'user/room/index', NULL, 1, 0, 'C', '0', '1', 'user:room:list', 'dashboard', 'admin', '2023-02-07 17:09:21', 'admin', '2023-03-11 10:48:53', '');
INSERT INTO `sys_menu` VALUES (2012, '个人中心', 0, 5, 'personal', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'people', 'admin', '2023-02-07 18:28:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '我的课程', 2012, 1, 'curriculum', 'personal/curriculum/index', NULL, 1, 0, 'C', '0', '0', 'personal:curriculum:list', 'education', 'admin', '2023-02-07 18:30:08', 'admin', '2023-02-12 06:51:41', '');
INSERT INTO `sys_menu` VALUES (2014, '我的实验', 2012, 2, 'laboratory', 'personal/laboratory/index', NULL, 1, 0, 'C', '0', '0', 'personal:laboratory:list', 'color', 'admin', '2023-02-07 18:40:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '个人设置', 2012, 3, 'setting', 'system/user/profile/index', NULL, 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-02-07 18:42:32', 'admin', '2023-02-08 20:22:36', '');
INSERT INTO `sys_menu` VALUES (2016, '课程列表', 2003, 1, 'index', 'course/index', NULL, 1, 0, 'C', '0', '0', 'course:list', 'cascader', 'admin', '2023-02-07 18:45:16', 'admin', '2023-02-09 03:25:27', '');
INSERT INTO `sys_menu` VALUES (2017, '实验批改', 2003, 2, 'check', 'course/check/index', NULL, 1, 0, 'C', '0', '0', 'course:check:list', 'checkbox', 'admin', '2023-02-07 18:46:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '镜像市场', 2003, 3, 'market', 'course/market/index', NULL, 1, 0, 'C', '0', '0', 'course:market:list', 'client', 'admin', '2023-02-07 18:48:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '消息管理', 2004, 1, 'manage', 'message/manage/index', NULL, 1, 0, 'C', '0', '0', 'message:manage:list', 'build', 'admin', '2023-02-07 18:49:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '我的消息', 2004, 2, 'my', 'message/my/index', NULL, 1, 0, 'C', '0', '0', 'message:my:list', 'eye-open', 'admin', '2023-02-07 18:50:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '消息模板', 2004, 3, 'template', 'message/template/index', NULL, 1, 0, 'C', '0', '0', 'message:template:list', 'documentation', 'admin', '2023-02-07 18:51:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '教学数据', 2005, 1, 'teach', 'statistics/teach/index', NULL, 1, 0, 'C', '0', '0', 'statistics:teach:index', 'excel', 'admin', '2023-02-07 18:52:16', 'admin', '2023-02-07 18:52:52', '');
INSERT INTO `sys_menu` VALUES (2023, '学习记录', 2005, 2, 'learn', 'statistics/learn/index', NULL, 1, 0, 'C', '0', '0', 'statistics:learn:list', 'log', 'admin', '2023-02-07 18:53:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '身份绑定', 0, 11, 'identity', 'identity/index', NULL, 1, 0, 'C', '0', '0', 'identity:list', 'button', 'admin', '2023-02-07 19:02:02', 'admin', '2023-02-08 17:02:45', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-02-07 16:17:23', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-02-07 16:17:23', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 504 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 3, 'com.codeonline.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/4', '127.0.0.1', '', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-02-07 16:28:13');
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"个人中心\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"personal\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 16:41:15');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 3, 'com.codeonline.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2000', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 16:44:12');
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"\",\"createBy\":\"admin\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"个人中心\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"personal\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 16:49:33');
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用户管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"user\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 16:50:31');
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"课程管理\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"classroom\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 16:50:56');
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"消息中心\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"message\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 16:51:19');
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"数据统计\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"statistics\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 16:52:28');
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2023-02-07 16:50:31\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"用户管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"user\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 16:52:45');
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/user/index\",\"createBy\":\"admin\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"user\",\"perms\":\"system:user:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 16:54:21');
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"user/address/index\",\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"通讯录\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2002,\"path\":\"address\",\"perms\":\"user:address:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 16:56:24');
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"user/identify\",\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"身份绑定批准\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2002,\"path\":\"identify\",\"perms\":\"user:identify:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 17:00:19');
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"user/classroom/index\",\"createBy\":\"admin\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"班级管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2002,\"path\":\"classroom\",\"perms\":\"user:classroom:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 17:09:21');
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 3, 'com.codeonline.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2001', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 17:34:39');
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-02-07 16:54:21\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"user\",\"perms\":\"system:user:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 17:37:32');
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2023-02-07 16:54:21\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"用户管理1\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"user\",\"perms\":\"system:user:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 17:38:05');
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2023-02-07 16:50:31\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"用户管理1\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"user\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 17:39:07');
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2023-02-07 16:54:21\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"用户管理1\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"user\",\"perms\":\"system:user:list\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 17:39:42');
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2023-02-07 16:17:23\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 17:40:07');
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 3, 'com.codeonline.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2006', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 17:40:35');
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2023-02-07 16:17:23\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 17:41:58');
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2023-02-07 16:50:31\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"用户管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"user\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 17:42:28');
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"个人中心\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"personal\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 18:21:31');
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"我的课程\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2010,\"path\":\"course\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 18:22:23');
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 3, 'com.codeonline.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2010', '127.0.0.1', '', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2023-02-07 18:25:43');
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 3, 'com.codeonline.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2011', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 18:25:47');
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 3, 'com.codeonline.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2010', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 18:25:49');
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"个人中心\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"personal\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 18:28:50');
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"personal/course/index\",\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"我的课程\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2012,\"path\":\"course\",\"perms\":\"personal:course:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 18:30:08');
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 3, 'com.codeonline.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/4', '127.0.0.1', '', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-02-07 18:32:35');
INSERT INTO `sys_oper_log` VALUES (130, '角色管理', 2, 'com.codeonline.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-02-07 16:17:23\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2002,1,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116,100,1000,1001,1002,1003,1004,1005,1006],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 18:32:58');
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 3, 'com.codeonline.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/4', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 18:33:08');
INSERT INTO `sys_oper_log` VALUES (132, '角色管理', 1, 'com.codeonline.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2012,2013,2002,100,1000,1001,1002,1003,1004,1005,1006,2007,2008,2009,2003,2004,2005],\"params\":{},\"remark\":\"老师\",\"roleId\":100,\"roleKey\":\"teacher\",\"roleName\":\"老师\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 18:33:50');
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"personal/laboratory/index\",\"createBy\":\"admin\",\"icon\":\"color\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"我的实验\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2012,\"path\":\"laboratory\",\"perms\":\"personal:laboratory:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 18:40:52');
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"personal/setting/index\",\"createBy\":\"admin\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"个人设置\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2012,\"path\":\"setting\",\"perms\":\"personal:setting:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 18:42:32');
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"course/manage/index\",\"createBy\":\"admin\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"path\":\"manage\",\"perms\":\"course:manage:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 18:45:16');
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"course/check/index\",\"createBy\":\"admin\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"实验批改\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2003,\"path\":\"check\",\"perms\":\"course:check:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 18:46:54');
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"course/market/index\",\"createBy\":\"admin\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"镜像市场\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2003,\"path\":\"market\",\"perms\":\"course:market:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 18:48:46');
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"message/manage/index\",\"createBy\":\"admin\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"消息管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"manage\",\"perms\":\"message:manage:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 18:49:39');
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"message/my/index\",\"createBy\":\"admin\",\"icon\":\"eye-open\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"我的消息\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2004,\"path\":\"my\",\"perms\":\"message:my:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 18:50:35');
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"message/template/index\",\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"消息模板\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2004,\"path\":\"template\",\"perms\":\"message:template:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 18:51:31');
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"教学数据\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"path\":\"teach\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 18:52:16');
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"statistics/teach/index\",\"createTime\":\"2023-02-07 18:52:16\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"教学数据\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"path\":\"teach\",\"perms\":\"statistics:teach:index\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 18:52:52');
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"statistics/learn/index\",\"createBy\":\"admin\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学习记录\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2005,\"path\":\"learn\",\"perms\":\"statistics:learn:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 18:53:41');
INSERT INTO `sys_oper_log` VALUES (144, '角色管理', 2, 'com.codeonline.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-02-07 16:17:23\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2012,2013,2014,2015,2002,100,1000,1001,1002,1003,1004,1005,1006,2007,2008,2009,2003,2016,2017,2018,2004,2019,2020,2021,2005,2022,2023],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"common_admin\",\"roleName\":\"管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 18:55:23');
INSERT INTO `sys_oper_log` VALUES (145, '角色管理', 2, 'com.codeonline.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-02-07 18:33:50\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2012,2015,2002,100,1000,1001,1002,1003,1004,1005,1006,2007,2008,2009,2003,2016,2017,2018,2004,2019,2020,2021,2005,2022,2023],\"params\":{},\"remark\":\"老师\",\"roleId\":100,\"roleKey\":\"teacher\",\"roleName\":\"老师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 18:56:16');
INSERT INTO `sys_oper_log` VALUES (146, '角色管理', 1, 'com.codeonline.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2005,2012,2013,2014,2015,2004,2019,2020,2021,2023],\"params\":{},\"remark\":\"学生\",\"roleId\":101,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 18:57:23');
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 1, 'com.codeonline.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"identify/index\",\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"身份绑定\",\"menuType\":\"C\",\"orderNum\":11,\"params\":{},\"parentId\":0,\"path\":\"identify\",\"perms\":\"identify:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 19:02:02');
INSERT INTO `sys_oper_log` VALUES (148, '角色管理', 1, 'com.codeonline.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2024],\"params\":{},\"roleId\":102,\"roleKey\":\"common\",\"roleName\":\"注册用户\",\"roleSort\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 19:02:38');
INSERT INTO `sys_oper_log` VALUES (149, '用户管理', 1, 'com.codeonline.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"张三\",\"params\":{},\"postIds\":[],\"roleIds\":[101],\"status\":\"0\",\"userId\":100,\"userName\":\"zhangsan\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 19:25:16');
INSERT INTO `sys_oper_log` VALUES (150, '角色管理', 4, 'com.codeonline.system.controller.SysRoleController.selectAuthUserAll()', 'PUT', 1, 'admin', NULL, '/role/authUser/selectAll', '127.0.0.1', '', '102 [100]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 19:25:59');
INSERT INTO `sys_oper_log` VALUES (151, '角色管理', 4, 'com.codeonline.system.controller.SysRoleController.cancelAuthUser()', 'PUT', 1, 'admin', NULL, '/role/authUser/cancel', '127.0.0.1', '', '{\"roleId\":102,\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 19:27:23');
INSERT INTO `sys_oper_log` VALUES (152, '角色管理', 2, 'com.codeonline.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-02-07 18:57:23\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2005,2012,2013,2014,2015,2004,2019,2020,2021,2023],\"params\":{},\"remark\":\"学生\",\"roleId\":101,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 19:32:22');
INSERT INTO `sys_oper_log` VALUES (153, '用户管理', 2, 'com.codeonline.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-02-07 19:25:16\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"张三\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":101,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":4,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"zhangsan\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 19:32:55');
INSERT INTO `sys_oper_log` VALUES (154, '参数管理', 2, 'com.codeonline.system.controller.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/config', '127.0.0.1', '', '{\"configId\":4,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2023-02-07 16:17:23\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 19:40:17');
INSERT INTO `sys_oper_log` VALUES (155, '参数管理', 2, 'com.codeonline.system.controller.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/config', '127.0.0.1', '', '{\"configId\":4,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2023-02-07 16:17:23\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-07 19:40:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 19:50:59');
INSERT INTO `sys_oper_log` VALUES (156, '参数管理', 2, 'com.codeonline.system.controller.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/config', '127.0.0.1', '', '{\"configId\":4,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2023-02-07 16:17:23\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-07 19:50:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 19:52:24');
INSERT INTO `sys_oper_log` VALUES (157, '参数管理', 2, 'com.codeonline.system.controller.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/config', '127.0.0.1', '', '{\"configId\":4,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2023-02-07 16:17:23\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-07 19:52:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 20:04:03');
INSERT INTO `sys_oper_log` VALUES (158, '参数管理', 2, 'com.codeonline.system.controller.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/config', '127.0.0.1', '', '{\"configId\":4,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2023-02-07 16:17:23\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-07 20:04:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 20:04:49');
INSERT INTO `sys_oper_log` VALUES (159, '用户管理', 2, 'com.codeonline.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-02-07 16:17:23\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"软工1901\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":100,\"email\":\"ry@qq.com\",\"loginDate\":\"2023-02-07 16:17:23\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common_admin\",\"roleName\":\"管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 03:47:18');
INSERT INTO `sys_oper_log` VALUES (160, '用户管理', 2, 'com.codeonline.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-02-07 19:25:16\",\"delFlag\":\"0\",\"deptId\":101,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"张三\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":101,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":4,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"zhangsan\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 03:47:38');
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"user/identify\",\"createTime\":\"2023-02-07 17:00:19\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"身份绑定批准\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2002,\"path\":\"identify\",\"perms\":\"user:identify:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 06:17:07');
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"user/classroom/index\",\"createTime\":\"2023-02-07 17:09:21\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"班级管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2002,\"path\":\"classroom\",\"perms\":\"user:classroom:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 06:17:12');
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"user/identify/index\",\"createTime\":\"2023-02-07 17:00:19\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"身份绑定批准\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2002,\"path\":\"identify\",\"perms\":\"user:identify:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 06:17:37');
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"user/address/index\",\"createTime\":\"2023-02-07 16:56:24\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"通讯录\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2002,\"path\":\"address\",\"perms\":\"user:address:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 06:19:40');
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"user/classroom/index\",\"createTime\":\"2023-02-07 17:09:21\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"班级管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2002,\"path\":\"classroom\",\"perms\":\"user:classroom:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 06:19:46');
INSERT INTO `sys_oper_log` VALUES (166, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"user/address/index\",\"createTime\":\"2023-02-07 16:56:24\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"通讯录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"address\",\"perms\":\"user:address:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 06:20:23');
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2023-02-07 16:17:23\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2002,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 06:20:29');
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"user/classroom/index\",\"createTime\":\"2023-02-07 17:09:21\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"班级管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2002,\"path\":\"classroom\",\"perms\":\"user:classroom:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 06:20:34');
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"user/classroom/index\",\"createTime\":\"2023-02-07 17:09:21\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"班级管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2002,\"path\":\"classroom\",\"perms\":\"user:classroom:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 06:21:09');
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"user/room/index\",\"createTime\":\"2023-02-07 17:09:21\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"班级管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2002,\"path\":\"room\",\"perms\":\"user:room:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 06:22:20');
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"user/identity/index\",\"createTime\":\"2023-02-07 17:00:19\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"身份绑定批准\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2002,\"path\":\"identity\",\"perms\":\"user:identity:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 06:23:26');
INSERT INTO `sys_oper_log` VALUES (172, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"identity/index\",\"createTime\":\"2023-02-07 19:02:02\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"身份绑定\",\"menuType\":\"C\",\"orderNum\":11,\"params\":{},\"parentId\":0,\"path\":\"identity\",\"perms\":\"identity:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 16:27:09');
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"identity/index\",\"createTime\":\"2023-02-07 19:02:02\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"身份绑定\",\"menuType\":\"C\",\"orderNum\":11,\"params\":{},\"parentId\":0,\"path\":\"identity1\",\"perms\":\"identity:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 16:31:42');
INSERT INTO `sys_oper_log` VALUES (174, '用户管理', 2, 'com.codeonline.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-02-07 19:42:59\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"zc\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[102],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"zc\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 16:58:29');
INSERT INTO `sys_oper_log` VALUES (175, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"identity/index\",\"createTime\":\"2023-02-07 19:02:02\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"身份绑定\",\"menuType\":\"C\",\"orderNum\":11,\"params\":{},\"parentId\":0,\"path\":\"identity\",\"perms\":\"identity:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 17:02:45');
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"user/approval/index\",\"createTime\":\"2023-02-07 17:00:19\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"身份绑定批准\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2002,\"path\":\"approval\",\"perms\":\"user:approval:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 17:46:24');
INSERT INTO `sys_oper_log` VALUES (177, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"user/profile/index\",\"createTime\":\"2023-02-07 18:42:32\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"个人设置\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2012,\"path\":\"setting\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 20:21:19');
INSERT INTO `sys_oper_log` VALUES (178, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/user/profile/index\",\"createTime\":\"2023-02-07 18:42:32\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"个人设置\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2012,\"path\":\"setting\",\"perms\":\"system:user:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 20:22:36');
INSERT INTO `sys_oper_log` VALUES (179, '部门管理', 1, 'com.codeonline.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"文学院\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 20:31:12');
INSERT INTO `sys_oper_log` VALUES (180, '部门管理', 1, 'com.codeonline.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,200\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"中文1901\",\"orderNum\":1,\"params\":{},\"parentId\":200,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 20:31:36');
INSERT INTO `sys_oper_log` VALUES (181, '部门管理', 1, 'com.codeonline.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,200\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"中文1902\",\"orderNum\":2,\"params\":{},\"parentId\":200,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 20:32:01');
INSERT INTO `sys_oper_log` VALUES (182, '部门管理', 1, 'com.codeonline.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,200\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"秘书1901\",\"orderNum\":3,\"params\":{},\"parentId\":200,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 20:32:14');
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2023-02-07 16:50:56\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"课程管理\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"course\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 20:34:01');
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"course/management/index\",\"createTime\":\"2023-02-07 18:45:16\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2016,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"path\":\"management\",\"perms\":\"course:management:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 21:19:13');
INSERT INTO `sys_oper_log` VALUES (185, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"course/index\",\"createTime\":\"2023-02-07 18:45:16\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2016,\"menuName\":\"课程列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"path\":\"index\",\"perms\":\"course:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-09 03:25:28');
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"personal/curriculum/index\",\"createTime\":\"2023-02-07 18:30:08\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"我的课程\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2012,\"path\":\"curriculum\",\"perms\":\"personal:curriculum:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 06:51:41');
INSERT INTO `sys_oper_log` VALUES (187, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadFilde()', 'POST', 1, 'admin', NULL, '/harbor/upload/file', '127.0.0.1', '', '', '{\"msg\":\"上传文件失败:[503] during [POST] to [http://codeonline-file/upload] [RemoteFileService#upload(MultipartFile)]: [Load balancer does not contain an instance for the service codeonline-file]\",\"code\":500}', 0, NULL, '2023-02-13 16:30:11');
INSERT INTO `sys_oper_log` VALUES (188, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadFilde()', 'POST', 1, 'admin', NULL, '/harbor/upload/file', '127.0.0.1', '', '', '{\"msg\":\"上传文件失败:[503] during [POST] to [http://codeonline-file/upload] [RemoteFileService#upload(MultipartFile)]: [Load balancer does not contain an instance for the service codeonline-file]\",\"code\":500}', 0, NULL, '2023-02-13 16:53:39');
INSERT INTO `sys_oper_log` VALUES (189, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadFilde()', 'POST', 1, 'admin', NULL, '/harbor/upload/file', '127.0.0.1', '', '', '{\"msg\":\"filename : [test.svg], extension : [svg], allowed extension : [[bmp, gif, jpg, jpeg, png, doc, docx, xls, xlsx, ppt, pptx, html, htm, txt, rar, zip, gz, bz2, mp4, avi, rmvb, pdf]]\",\"code\":500}', 0, NULL, '2023-02-13 17:15:50');
INSERT INTO `sys_oper_log` VALUES (190, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadFilde()', 'POST', 1, 'admin', NULL, '/harbor/upload/file', '127.0.0.1', '', '', '{\"msg\":\"filename : [codeServer-dockerfile], extension : [], allowed extension : [[bmp, gif, jpg, jpeg, png, doc, docx, xls, xlsx, ppt, pptx, html, htm, txt, rar, zip, gz, bz2, mp4, avi, rmvb, pdf]]\",\"code\":500}', 0, NULL, '2023-02-13 17:16:23');
INSERT INTO `sys_oper_log` VALUES (191, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadFilde()', 'POST', 1, 'admin', NULL, '/harbor/upload/file', '127.0.0.1', '', '', '{\"msg\":\"3360c06b777c47659046c56ad2ca8f88\",\"code\":200}', 0, NULL, '2023-02-13 17:18:43');
INSERT INTO `sys_oper_log` VALUES (192, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadTable()', 'POST', 1, 'admin', NULL, '/harbor/upload/table', '127.0.0.1', '', '{\"environmentName\":\"test0\",\"introduce\":\"测试\",\"isPublic\":true,\"tag\":\"1.0.0\",\"uploadType\":\"dockerfile\",\"url\":\"http://127.0.0.1:9300/statics/2023/02/13/codeServer-dockerfile_20230213171843A001.\",\"uuid\":\"3360c06b777c47659046c56ad2ca8f88\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"uploadToken\":\"b6b4696b095343f7bb8c814179e1a454\"}}', 0, NULL, '2023-02-13 17:18:44');
INSERT INTO `sys_oper_log` VALUES (193, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:18:44');
INSERT INTO `sys_oper_log` VALUES (194, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:18:54');
INSERT INTO `sys_oper_log` VALUES (195, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:19:05');
INSERT INTO `sys_oper_log` VALUES (196, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:19:15');
INSERT INTO `sys_oper_log` VALUES (197, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:19:25');
INSERT INTO `sys_oper_log` VALUES (198, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:19:35');
INSERT INTO `sys_oper_log` VALUES (199, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:19:45');
INSERT INTO `sys_oper_log` VALUES (200, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:19:56');
INSERT INTO `sys_oper_log` VALUES (201, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:20:07');
INSERT INTO `sys_oper_log` VALUES (202, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:20:18');
INSERT INTO `sys_oper_log` VALUES (203, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:20:28');
INSERT INTO `sys_oper_log` VALUES (204, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:20:38');
INSERT INTO `sys_oper_log` VALUES (205, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:20:49');
INSERT INTO `sys_oper_log` VALUES (206, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:21:00');
INSERT INTO `sys_oper_log` VALUES (207, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:21:11');
INSERT INTO `sys_oper_log` VALUES (208, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:21:21');
INSERT INTO `sys_oper_log` VALUES (209, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:21:31');
INSERT INTO `sys_oper_log` VALUES (210, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:21:41');
INSERT INTO `sys_oper_log` VALUES (211, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:21:51');
INSERT INTO `sys_oper_log` VALUES (212, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:22:01');
INSERT INTO `sys_oper_log` VALUES (213, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:22:11');
INSERT INTO `sys_oper_log` VALUES (214, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:22:21');
INSERT INTO `sys_oper_log` VALUES (215, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:22:31');
INSERT INTO `sys_oper_log` VALUES (216, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:22:41');
INSERT INTO `sys_oper_log` VALUES (217, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:22:51');
INSERT INTO `sys_oper_log` VALUES (218, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-02-13 17:23:01');
INSERT INTO `sys_oper_log` VALUES (219, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b6b4696b095343f7bb8c814179e1a454', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传失败\"}}', 0, NULL, '2023-02-13 17:23:12');
INSERT INTO `sys_oper_log` VALUES (220, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadFilde()', 'POST', 1, 'admin', NULL, '/harbor/upload/file', '127.0.0.1', '', '', '{\"msg\":\"f33b1154e11540a9a8b7fba7a93bb26b\",\"code\":200}', 0, NULL, '2023-02-13 17:25:26');
INSERT INTO `sys_oper_log` VALUES (221, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadTable()', 'POST', 1, 'admin', NULL, '/harbor/upload/table', '127.0.0.1', '', '{\"environmentName\":\"test0\",\"introduce\":\"测试\",\"isPublic\":true,\"tag\":\"1.0.0\",\"uploadType\":\"container\",\"url\":\"http://127.0.0.1:9300/statics/2023/02/13/codeServer-dockerfile_20230213172526A002.\",\"uuid\":\"f33b1154e11540a9a8b7fba7a93bb26b\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"uploadToken\":\"0334bc68c293487492bcb061e4503e49\"}}', 0, NULL, '2023-02-13 17:25:33');
INSERT INTO `sys_oper_log` VALUES (222, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/0334bc68c293487492bcb061e4503e49', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传失败\"}}', 0, NULL, '2023-02-13 17:25:33');
INSERT INTO `sys_oper_log` VALUES (223, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadFilde()', 'POST', 1, 'admin', NULL, '/harbor/upload/file', '127.0.0.1', '', '', '{\"msg\":\"b897b403a5a445e0802038104ce42184\",\"code\":200}', 0, NULL, '2023-02-13 17:28:38');
INSERT INTO `sys_oper_log` VALUES (224, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadTable()', 'POST', 1, 'admin', NULL, '/harbor/upload/table', '127.0.0.1', '', '{\"environmentName\":\"test0\",\"introduce\":\"测试\",\"isPublic\":true,\"tag\":\"1.0.0\",\"uploadType\":\"container\",\"url\":\"http://127.0.0.1:9300/statics/2023/02/13/codeServer-dockerfile_20230213172838A003.\",\"uuid\":\"b897b403a5a445e0802038104ce42184\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"uploadToken\":\"f2ec5a1c704d4194b827033fb75feb93\"}}', 0, NULL, '2023-02-13 17:28:42');
INSERT INTO `sys_oper_log` VALUES (225, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/f2ec5a1c704d4194b827033fb75feb93', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传失败\"}}', 0, NULL, '2023-02-13 17:28:42');
INSERT INTO `sys_oper_log` VALUES (226, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadFilde()', 'POST', 1, 'admin', NULL, '/harbor/upload/file', '127.0.0.1', '', '', '{\"msg\":\"aabc1a70f0e343de93f3177b34e2fc4f\",\"code\":200}', 0, NULL, '2023-02-13 17:29:11');
INSERT INTO `sys_oper_log` VALUES (227, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadTable()', 'POST', 1, 'admin', NULL, '/harbor/upload/table', '127.0.0.1', '', '{\"environmentName\":\"test0\",\"introduce\":\"测试\",\"isPublic\":true,\"tag\":\"1.0.0\",\"uploadType\":\"container\",\"url\":\"http://127.0.0.1:9300/statics/2023/02/13/codeServer-dockerfile_20230213172911A004.\",\"uuid\":\"aabc1a70f0e343de93f3177b34e2fc4f\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"uploadToken\":\"afbc24f636d64e8983e4d049f64a22c6\"}}', 0, NULL, '2023-02-13 17:31:49');
INSERT INTO `sys_oper_log` VALUES (228, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadFilde()', 'POST', 1, 'admin', NULL, '/harbor/upload/file', '127.0.0.1', '', '', '{\"msg\":\"adada667a0704bca92fe2edaa1fde4af\",\"code\":200}', 0, NULL, '2023-02-13 17:32:02');
INSERT INTO `sys_oper_log` VALUES (229, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadTable()', 'POST', 1, 'admin', NULL, '/harbor/upload/table', '127.0.0.1', '', '{\"environmentName\":\"test0\",\"introduce\":\"测试\",\"isPublic\":true,\"tag\":\"1.0.0\",\"uploadType\":\"container\",\"url\":\"http://127.0.0.1:9300/statics/2023/02/13/codeServer-dockerfile_20230213173201A005.\",\"uuid\":\"adada667a0704bca92fe2edaa1fde4af\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"uploadToken\":\"0fa774cab53846408cc82bc7047940b2\"}}', 0, NULL, '2023-02-13 17:37:20');
INSERT INTO `sys_oper_log` VALUES (230, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadFilde()', 'POST', 1, 'admin', NULL, '/harbor/upload/file', '127.0.0.1', '', '', '{\"msg\":\"37d318a1db06435e919a96a32a1c02c3\",\"code\":200}', 0, NULL, '2023-02-13 17:38:07');
INSERT INTO `sys_oper_log` VALUES (231, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadTable()', 'POST', 1, 'admin', NULL, '/harbor/upload/table', '127.0.0.1', '', '{\"environmentName\":\"test0\",\"introduce\":\"测试\",\"isPublic\":true,\"tag\":\"1.0.0\",\"uploadType\":\"container\",\"url\":\"http://127.0.0.1:9300/statics/2023/02/13/codeServer-dockerfile_20230213173807A006.\",\"uuid\":\"37d318a1db06435e919a96a32a1c02c3\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"uploadToken\":\"73f863471bd8457e8f0b8c2d2bfd4cbc\"}}', 0, NULL, '2023-02-13 17:38:59');
INSERT INTO `sys_oper_log` VALUES (232, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadFilde()', 'POST', 1, 'admin', NULL, '/harbor/upload/file', '127.0.0.1', '', '', '{\"msg\":\"db3fb88ab7874adbbe83bda840186dfc\",\"code\":200}', 0, NULL, '2023-02-13 17:40:15');
INSERT INTO `sys_oper_log` VALUES (233, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadTable()', 'POST', 1, 'admin', NULL, '/harbor/upload/table', '127.0.0.1', '', '{\"environmentName\":\"test0\",\"introduce\":\"测试\",\"isPublic\":true,\"tag\":\"1.0.0\",\"uploadType\":\"container\",\"url\":\"http://127.0.0.1:9300/statics/2023/02/13/codeServer-dockerfile_20230213174015A007.\",\"uuid\":\"db3fb88ab7874adbbe83bda840186dfc\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"uploadToken\":\"33896e71a8bd4b75afe7732fca28f602\"}}', 0, NULL, '2023-02-13 17:43:19');
INSERT INTO `sys_oper_log` VALUES (234, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadFilde()', 'POST', 1, 'admin', NULL, '/harbor/upload/file', '127.0.0.1', '', '', '{\"msg\":\"29c36c5a0fd546dc95e798b8e8aea5a1\",\"code\":200}', 0, NULL, '2023-02-13 17:50:37');
INSERT INTO `sys_oper_log` VALUES (235, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadTable()', 'POST', 1, 'admin', NULL, '/harbor/upload/table', '127.0.0.1', '', '{\"environmentName\":\"test0\",\"introduce\":\"测试\",\"isPublic\":true,\"tag\":\"1.0.0\",\"uploadType\":\"container\",\"url\":\"http://127.0.0.1:9300/statics/2023/02/13/codeServer-dockerfile_20230213175037A008.\",\"uuid\":\"29c36c5a0fd546dc95e798b8e8aea5a1\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"uploadToken\":\"edd41914362b4a94b71bcb3905724b06\"}}', 0, NULL, '2023-02-13 17:50:45');
INSERT INTO `sys_oper_log` VALUES (236, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/edd41914362b4a94b71bcb3905724b06', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传成功\"}}', 0, NULL, '2023-02-13 17:50:45');
INSERT INTO `sys_oper_log` VALUES (237, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'ry-cloud.harbor_upload.upload_id\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\r\n### The error may exist in com/codeonline/cloud/harbor/mapper/MarketMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select * from harbor_upload where is_public = 1 group by image_name order by create_time desc\r\n### Cause: java.sql.SQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'ry-cloud.harbor_upload.upload_id\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'ry-cloud.harbor_upload.upload_id\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by', '2023-02-13 20:05:07');
INSERT INTO `sys_oper_log` VALUES (238, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'ry-cloud.harbor_upload.upload_id\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\r\n### The error may exist in com/codeonline/cloud/harbor/mapper/MarketMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select * from harbor_upload where is_public = 1 group by image_name order by create_time desc\r\n### Cause: java.sql.SQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'ry-cloud.harbor_upload.upload_id\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'ry-cloud.harbor_upload.upload_id\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by', '2023-02-13 20:21:26');
INSERT INTO `sys_oper_log` VALUES (239, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'ry-cloud.harbor_upload.upload_id\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\r\n### The error may exist in com/codeonline/cloud/harbor/mapper/MarketMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select * from harbor_upload where is_public = 1 group by image_name order by create_time desc\r\n### Cause: java.sql.SQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'ry-cloud.harbor_upload.upload_id\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'ry-cloud.harbor_upload.upload_id\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by', '2023-02-13 20:42:14');
INSERT INTO `sys_oper_log` VALUES (240, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'ry-cloud.harbor_upload.upload_id\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\r\n### The error may exist in com/codeonline/cloud/harbor/mapper/MarketMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select * from harbor_upload where is_public = 1 group by image_name order by create_time desc\r\n### Cause: java.sql.SQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'ry-cloud.harbor_upload.upload_id\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'ry-cloud.harbor_upload.upload_id\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by', '2023-02-13 20:42:26');
INSERT INTO `sys_oper_log` VALUES (241, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'ry-cloud.harbor_upload.upload_id\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\r\n### The error may exist in com/codeonline/cloud/harbor/mapper/MarketMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select * from harbor_upload where is_public = 1 group by image_name order by create_time desc\r\n### Cause: java.sql.SQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'ry-cloud.harbor_upload.upload_id\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'ry-cloud.harbor_upload.upload_id\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by', '2023-02-13 20:42:34');
INSERT INTO `sys_oper_log` VALUES (242, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'image_size\' in \'field list\'\r\n### The error may exist in com/codeonline/cloud/harbor/mapper/MarketMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select user_id, image_name, image_tag, image_size, image_description, image_type, image_status, image_url, create_time, update_time from harbor_upload where is_public = 1 group by image_name order by create_time desc\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'image_size\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'image_size\' in \'field list\'', '2023-02-13 20:47:46');
INSERT INTO `sys_oper_log` VALUES (243, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"artifactCount\":2,\"createBy\":\"admin\",\"createTime\":\"2023-02-13 17:38:59\",\"imageName\":\"1_test0\",\"imageTag\":\"1.0.0\",\"imageUrl\":\"http://127.0.0.1:9300/statics/2023/02/13/codeServer-dockerfile_20230213173807A006.\",\"introduce\":\"测试\",\"params\":{},\"public\":false,\"pullCount\":0,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-13 17:38:59\",\"userId\":1}]}', 0, NULL, '2023-02-13 20:50:26');
INSERT INTO `sys_oper_log` VALUES (244, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"artifactCount\":2,\"createBy\":\"admin\",\"createTime\":\"2023-02-13 17:38:59\",\"imageName\":\"1_test0\",\"imageTag\":\"1.0.0\",\"imageUrl\":\"http://127.0.0.1:9300/statics/2023/02/13/codeServer-dockerfile_20230213173807A006.\",\"introduce\":\"测试\",\"params\":{},\"public\":false,\"pullCount\":0,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-13 17:38:59\",\"userId\":1}]}', 0, NULL, '2023-02-13 20:50:36');
INSERT INTO `sys_oper_log` VALUES (245, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"artifactCount\":2,\"createBy\":\"admin\",\"createTime\":\"2023-02-13 17:38:59\",\"imageName\":\"1_test0\",\"imageTag\":\"1.0.0\",\"imageUrl\":\"http://127.0.0.1:9300/statics/2023/02/13/codeServer-dockerfile_20230213173807A006.\",\"introduce\":\"测试\",\"params\":{},\"public\":false,\"pullCount\":0,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-13 17:38:59\",\"userId\":1}]}', 0, NULL, '2023-02-13 20:52:35');
INSERT INTO `sys_oper_log` VALUES (246, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"artifactCount\":2,\"createBy\":\"admin\",\"createTime\":\"2023-02-13 17:38:59\",\"imageName\":\"1_test0\",\"imageTag\":\"1.0.0\",\"imageUrl\":\"http://127.0.0.1:9300/statics/2023/02/13/codeServer-dockerfile_20230213173807A006.\",\"introduce\":\"测试\",\"params\":{},\"public\":false,\"pullCount\":0,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-13 17:38:59\",\"userId\":1}]}', 0, NULL, '2023-02-13 20:53:05');
INSERT INTO `sys_oper_log` VALUES (247, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"artifactCount\":2,\"createBy\":\"admin\",\"createTime\":\"2023-02-13 17:38:59\",\"imageName\":\"1_test0\",\"imageTag\":\"1.0.0\",\"imageUrl\":\"http://127.0.0.1:9300/statics/2023/02/13/codeServer-dockerfile_20230213173807A006.\",\"introduce\":\"测试\",\"params\":{},\"public\":false,\"pullCount\":0,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-13 17:38:59\",\"userId\":1}]}', 0, NULL, '2023-02-13 20:59:40');
INSERT INTO `sys_oper_log` VALUES (248, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"artifactCount\":2,\"createBy\":\"admin\",\"createTime\":\"2023-02-13 17:38:59\",\"imageName\":\"1_test0\",\"imageTag\":\"1.0.0\",\"imageUrl\":\"http://127.0.0.1:9300/statics/2023/02/13/codeServer-dockerfile_20230213173807A006.\",\"introduce\":\"测试\",\"params\":{},\"public\":false,\"pullCount\":0,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-13 17:38:59\",\"userId\":1}]}', 0, NULL, '2023-02-13 21:01:01');
INSERT INTO `sys_oper_log` VALUES (249, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"artifactCount\":2,\"createBy\":\"admin\",\"createTime\":\"2023-02-13 17:38:59\",\"imageName\":\"1_test0\",\"imageTag\":\"1.0.0\",\"imageUrl\":\"http://127.0.0.1:9300/statics/2023/02/13/codeServer-dockerfile_20230213173807A006.\",\"introduce\":\"测试\",\"params\":{},\"public\":false,\"pullCount\":0,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-13 17:38:59\",\"userId\":1}]}', 0, NULL, '2023-02-13 21:06:11');
INSERT INTO `sys_oper_log` VALUES (250, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', NULL, 1, '', '2023-02-14 09:19:37');
INSERT INTO `sys_oper_log` VALUES (251, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', NULL, 1, '', '2023-02-14 09:20:30');
INSERT INTO `sys_oper_log` VALUES (252, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', NULL, 1, '', '2023-02-14 09:21:22');
INSERT INTO `sys_oper_log` VALUES (253, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"artifactCount\":2,\"createBy\":\"admin\",\"createTime\":\"2023-02-13 17:38:59\",\"imageName\":\"1_test0\",\"imageTag\":\"1.0.0\",\"imageUrl\":\"http://127.0.0.1:9300/statics/2023/02/13/codeServer-dockerfile_20230213173807A006.\",\"introduce\":\"测试\",\"params\":{},\"public\":false,\"pullCount\":0,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-13 17:38:59\",\"userId\":1}]}', 0, NULL, '2023-02-14 09:25:56');
INSERT INTO `sys_oper_log` VALUES (254, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"artifactCount\":2,\"createBy\":\"admin\",\"createTime\":\"2023-02-13 17:38:59\",\"imageName\":\"1_test0\",\"imageTag\":\"1.0.0\",\"imageUrl\":\"http://127.0.0.1:9300/statics/2023/02/13/codeServer-dockerfile_20230213173807A006.\",\"introduce\":\"测试\",\"params\":{},\"public\":false,\"pullCount\":0,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-13 17:38:59\",\"userId\":1}]}', 0, NULL, '2023-02-14 09:26:13');
INSERT INTO `sys_oper_log` VALUES (255, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', NULL, 1, '', '2023-03-10 11:55:42');
INSERT INTO `sys_oper_log` VALUES (256, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', NULL, 1, '', '2023-03-10 11:56:14');
INSERT INTO `sys_oper_log` VALUES (257, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', NULL, 1, '', '2023-03-10 17:14:27');
INSERT INTO `sys_oper_log` VALUES (258, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', NULL, 1, '', '2023-03-10 17:15:05');
INSERT INTO `sys_oper_log` VALUES (259, '用户管理', 2, 'com.codeonline.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-02-07 19:42:59\",\"delFlag\":\"0\",\"deptId\":103,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"zc\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"common\",\"roleName\":\"注册用户\",\"roleSort\":5,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"zc\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-11 10:46:40');
INSERT INTO `sys_oper_log` VALUES (260, '用户管理', 2, 'com.codeonline.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-02-07 20:08:15\",\"delFlag\":\"0\",\"deptId\":104,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"10001\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[101],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":102,\"userName\":\"10001\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-11 10:46:53');
INSERT INTO `sys_oper_log` VALUES (261, '用户管理', 2, 'com.codeonline.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-02-07 20:10:03\",\"delFlag\":\"0\",\"deptId\":103,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"10002\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[102],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"common\",\"roleName\":\"注册用户\",\"roleSort\":5,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":103,\"userName\":\"10002\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-11 10:47:03');
INSERT INTO `sys_oper_log` VALUES (262, '用户管理', 2, 'com.codeonline.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-02-07 20:10:53\",\"delFlag\":\"0\",\"deptId\":103,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"10004\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"common\",\"roleName\":\"注册用户\",\"roleSort\":5,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":104,\"userName\":\"10004\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-11 10:47:15');
INSERT INTO `sys_oper_log` VALUES (263, '用户管理', 2, 'com.codeonline.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-02-07 20:10:03\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"计科1901\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"10002\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"common\",\"roleName\":\"注册用户\",\"roleSort\":5,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":103,\"userName\":\"10002\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-11 10:47:27');
INSERT INTO `sys_oper_log` VALUES (264, '用户管理', 2, 'com.codeonline.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-02-08 20:11:06\",\"delFlag\":\"0\",\"deptId\":201,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"student\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":101,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":4,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":105,\"userName\":\"student\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-11 10:47:41');
INSERT INTO `sys_oper_log` VALUES (265, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"user/room/index\",\"createTime\":\"2023-02-07 17:09:21\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"班级管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2002,\"path\":\"room\",\"perms\":\"user:room:list\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-11 10:48:53');
INSERT INTO `sys_oper_log` VALUES (266, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"user/address/index\",\"createTime\":\"2023-02-07 16:56:24\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"通讯录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"address\",\"perms\":\"user:address:list\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-11 10:49:16');
INSERT INTO `sys_oper_log` VALUES (267, '菜单管理', 2, 'com.codeonline.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2023-02-07 16:17:23\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-11 10:49:42');
INSERT INTO `sys_oper_log` VALUES (268, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sConfigure()', 'POST', 1, 'admin', NULL, '/k8s/configures/1678556268265', '127.0.0.1', '', '\"1678556268265\" {\"envs\":[{}],\"hasPublic\":true,\"imageName\":\"test0:1.0.0\",\"labId\":\"1678556268265\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-12 01:37:51');
INSERT INTO `sys_oper_log` VALUES (269, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678556268265', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"envs\":[{}],\"imageName\":\"test0:1.0.0\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\"}}', 0, NULL, '2023-03-12 01:39:40');
INSERT INTO `sys_oper_log` VALUES (270, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678556268265', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"envs\":[{}],\"imageName\":\"test0:1.0.0\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\"}}', 0, NULL, '2023-03-16 00:42:45');
INSERT INTO `sys_oper_log` VALUES (271, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-03-16 00:43:34');
INSERT INTO `sys_oper_log` VALUES (272, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-03-16 00:44:21');
INSERT INTO `sys_oper_log` VALUES (273, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678556268265', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"envs\":[{}],\"imageName\":\"test0:1.0.0\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\"}}', 0, NULL, '2023-03-16 00:51:55');
INSERT INTO `sys_oper_log` VALUES (274, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-03-16 00:52:24');
INSERT INTO `sys_oper_log` VALUES (275, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadFilde()', 'POST', 1, 'admin', NULL, '/harbor/upload/file', '127.0.0.1', '', '', '{\"msg\":\"ca4ae8d36cd34b0e814c689336e311fc\",\"code\":200}', 0, NULL, '2023-03-16 01:00:26');
INSERT INTO `sys_oper_log` VALUES (276, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadTable()', 'POST', 1, 'admin', NULL, '/harbor/upload/table', '127.0.0.1', '', '{\"environmentName\":\"base-python-vscode\",\"introduce\":\"python的vscode环境镜像\",\"isPublic\":true,\"tag\":\"1.0.0\",\"uploadType\":\"dockerfile\",\"url\":\"http://127.0.0.1:9300/statics/2023/03/16/22年 毕业实习需要完成的文档_20230316010025A001.docx\",\"uuid\":\"ca4ae8d36cd34b0e814c689336e311fc\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"uploadToken\":\"b3eef434e0d6475b909d8a9d8be6c7f9\"}}', 0, NULL, '2023-03-16 01:00:27');
INSERT INTO `sys_oper_log` VALUES (277, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:00:27');
INSERT INTO `sys_oper_log` VALUES (278, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:00:37');
INSERT INTO `sys_oper_log` VALUES (279, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:00:48');
INSERT INTO `sys_oper_log` VALUES (280, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:00:59');
INSERT INTO `sys_oper_log` VALUES (281, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:01:10');
INSERT INTO `sys_oper_log` VALUES (282, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:01:21');
INSERT INTO `sys_oper_log` VALUES (283, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:01:32');
INSERT INTO `sys_oper_log` VALUES (284, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:01:43');
INSERT INTO `sys_oper_log` VALUES (285, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:01:54');
INSERT INTO `sys_oper_log` VALUES (286, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:02:05');
INSERT INTO `sys_oper_log` VALUES (287, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:02:16');
INSERT INTO `sys_oper_log` VALUES (288, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:02:27');
INSERT INTO `sys_oper_log` VALUES (289, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:02:38');
INSERT INTO `sys_oper_log` VALUES (290, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:02:49');
INSERT INTO `sys_oper_log` VALUES (291, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:03:00');
INSERT INTO `sys_oper_log` VALUES (292, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:03:11');
INSERT INTO `sys_oper_log` VALUES (293, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:03:22');
INSERT INTO `sys_oper_log` VALUES (294, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:03:33');
INSERT INTO `sys_oper_log` VALUES (295, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:03:44');
INSERT INTO `sys_oper_log` VALUES (296, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:03:55');
INSERT INTO `sys_oper_log` VALUES (297, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:04:06');
INSERT INTO `sys_oper_log` VALUES (298, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:04:17');
INSERT INTO `sys_oper_log` VALUES (299, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:04:28');
INSERT INTO `sys_oper_log` VALUES (300, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:04:39');
INSERT INTO `sys_oper_log` VALUES (301, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:04:50');
INSERT INTO `sys_oper_log` VALUES (302, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:05:01');
INSERT INTO `sys_oper_log` VALUES (303, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:05:12');
INSERT INTO `sys_oper_log` VALUES (304, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:05:23');
INSERT INTO `sys_oper_log` VALUES (305, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:05:34');
INSERT INTO `sys_oper_log` VALUES (306, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:05:45');
INSERT INTO `sys_oper_log` VALUES (307, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:05:56');
INSERT INTO `sys_oper_log` VALUES (308, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:06:07');
INSERT INTO `sys_oper_log` VALUES (309, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:06:18');
INSERT INTO `sys_oper_log` VALUES (310, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:06:29');
INSERT INTO `sys_oper_log` VALUES (311, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:06:40');
INSERT INTO `sys_oper_log` VALUES (312, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:06:51');
INSERT INTO `sys_oper_log` VALUES (313, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:07:02');
INSERT INTO `sys_oper_log` VALUES (314, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:07:13');
INSERT INTO `sys_oper_log` VALUES (315, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:07:24');
INSERT INTO `sys_oper_log` VALUES (316, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:07:35');
INSERT INTO `sys_oper_log` VALUES (317, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:07:46');
INSERT INTO `sys_oper_log` VALUES (318, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:07:57');
INSERT INTO `sys_oper_log` VALUES (319, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:08:08');
INSERT INTO `sys_oper_log` VALUES (320, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:08:19');
INSERT INTO `sys_oper_log` VALUES (321, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:08:30');
INSERT INTO `sys_oper_log` VALUES (322, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:08:41');
INSERT INTO `sys_oper_log` VALUES (323, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:08:52');
INSERT INTO `sys_oper_log` VALUES (324, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:09:03');
INSERT INTO `sys_oper_log` VALUES (325, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:09:14');
INSERT INTO `sys_oper_log` VALUES (326, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:09:25');
INSERT INTO `sys_oper_log` VALUES (327, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:09:36');
INSERT INTO `sys_oper_log` VALUES (328, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:09:47');
INSERT INTO `sys_oper_log` VALUES (329, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:09:58');
INSERT INTO `sys_oper_log` VALUES (330, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:10:09');
INSERT INTO `sys_oper_log` VALUES (331, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:10:20');
INSERT INTO `sys_oper_log` VALUES (332, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:10:31');
INSERT INTO `sys_oper_log` VALUES (333, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:10:42');
INSERT INTO `sys_oper_log` VALUES (334, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:10:53');
INSERT INTO `sys_oper_log` VALUES (335, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:11:04');
INSERT INTO `sys_oper_log` VALUES (336, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:11:15');
INSERT INTO `sys_oper_log` VALUES (337, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:11:26');
INSERT INTO `sys_oper_log` VALUES (338, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:11:37');
INSERT INTO `sys_oper_log` VALUES (339, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:11:48');
INSERT INTO `sys_oper_log` VALUES (340, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:11:59');
INSERT INTO `sys_oper_log` VALUES (341, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:12:10');
INSERT INTO `sys_oper_log` VALUES (342, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:12:21');
INSERT INTO `sys_oper_log` VALUES (343, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:12:32');
INSERT INTO `sys_oper_log` VALUES (344, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:12:43');
INSERT INTO `sys_oper_log` VALUES (345, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:12:54');
INSERT INTO `sys_oper_log` VALUES (346, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:13:05');
INSERT INTO `sys_oper_log` VALUES (347, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:13:16');
INSERT INTO `sys_oper_log` VALUES (348, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:13:27');
INSERT INTO `sys_oper_log` VALUES (349, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:13:38');
INSERT INTO `sys_oper_log` VALUES (350, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:13:48');
INSERT INTO `sys_oper_log` VALUES (351, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:13:58');
INSERT INTO `sys_oper_log` VALUES (352, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:14:08');
INSERT INTO `sys_oper_log` VALUES (353, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:14:18');
INSERT INTO `sys_oper_log` VALUES (354, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:14:28');
INSERT INTO `sys_oper_log` VALUES (355, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:14:39');
INSERT INTO `sys_oper_log` VALUES (356, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:14:49');
INSERT INTO `sys_oper_log` VALUES (357, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:14:59');
INSERT INTO `sys_oper_log` VALUES (358, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:15:09');
INSERT INTO `sys_oper_log` VALUES (359, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:15:19');
INSERT INTO `sys_oper_log` VALUES (360, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:15:30');
INSERT INTO `sys_oper_log` VALUES (361, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:15:40');
INSERT INTO `sys_oper_log` VALUES (362, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:15:51');
INSERT INTO `sys_oper_log` VALUES (363, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:16:02');
INSERT INTO `sys_oper_log` VALUES (364, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:16:13');
INSERT INTO `sys_oper_log` VALUES (365, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:16:24');
INSERT INTO `sys_oper_log` VALUES (366, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:16:35');
INSERT INTO `sys_oper_log` VALUES (367, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:16:46');
INSERT INTO `sys_oper_log` VALUES (368, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:16:57');
INSERT INTO `sys_oper_log` VALUES (369, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:17:08');
INSERT INTO `sys_oper_log` VALUES (370, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:17:19');
INSERT INTO `sys_oper_log` VALUES (371, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:17:30');
INSERT INTO `sys_oper_log` VALUES (372, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:17:41');
INSERT INTO `sys_oper_log` VALUES (373, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:17:52');
INSERT INTO `sys_oper_log` VALUES (374, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:18:03');
INSERT INTO `sys_oper_log` VALUES (375, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:18:14');
INSERT INTO `sys_oper_log` VALUES (376, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:18:25');
INSERT INTO `sys_oper_log` VALUES (377, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:18:36');
INSERT INTO `sys_oper_log` VALUES (378, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/b3eef434e0d6475b909d8a9d8be6c7f9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 01:18:47');
INSERT INTO `sys_oper_log` VALUES (379, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-03-16 01:29:52');
INSERT INTO `sys_oper_log` VALUES (380, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadFilde()', 'POST', 1, 'admin', NULL, '/harbor/upload/file', '127.0.0.1', '', '', '{\"msg\":\"1fdfd91d4298444da5c1d09086d88f54\",\"code\":200}', 0, NULL, '2023-03-16 01:30:31');
INSERT INTO `sys_oper_log` VALUES (381, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-03-16 02:09:05');
INSERT INTO `sys_oper_log` VALUES (382, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadFilde()', 'POST', 1, 'admin', NULL, '/harbor/upload/file', '127.0.0.1', '', '', '{\"msg\":\"d6f80e31c52343748cd11be032103c59\",\"code\":200}', 0, NULL, '2023-03-16 02:09:23');
INSERT INTO `sys_oper_log` VALUES (383, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadFilde()', 'POST', 1, 'admin', NULL, '/harbor/upload/file', '127.0.0.1', '', '', '{\"msg\":\"3bcfb663bb5b4cf09846f82d076fc6f2\",\"code\":200}', 0, NULL, '2023-03-16 02:12:35');
INSERT INTO `sys_oper_log` VALUES (384, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadTable()', 'POST', 1, 'admin', NULL, '/harbor/upload/table', '127.0.0.1', '', '{\"environmentName\":\"python-base-vscode\",\"introduce\":\"python的vscode开发环境\",\"isPublic\":true,\"tag\":\"1.0.0\",\"uploadType\":\"container\",\"url\":\"http://127.0.0.1:9300/statics/2023/03/16/22年 毕业实习需要完成的文档_20230316021234A004.docx\",\"uuid\":\"3bcfb663bb5b4cf09846f82d076fc6f2\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"uploadToken\":\"bca26cfa99d1495bb1fa19b0e8d04d68\"}}', 0, NULL, '2023-03-16 02:12:42');
INSERT INTO `sys_oper_log` VALUES (385, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/bca26cfa99d1495bb1fa19b0e8d04d68', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传失败\"}}', 0, NULL, '2023-03-16 02:12:42');
INSERT INTO `sys_oper_log` VALUES (386, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-03-16 02:15:15');
INSERT INTO `sys_oper_log` VALUES (387, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadFilde()', 'POST', 1, 'admin', NULL, '/harbor/upload/file', '127.0.0.1', '', '', '{\"msg\":\"b397c9d3d6384fa49761ce23dfd8b02a\",\"code\":200}', 0, NULL, '2023-03-16 02:15:51');
INSERT INTO `sys_oper_log` VALUES (388, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadTable()', 'POST', 1, 'admin', NULL, '/harbor/upload/table', '127.0.0.1', '', '{\"environmentName\":\"python-base-vscode\",\"introduce\":\"python的vscode开发环境\",\"isPublic\":true,\"tag\":\"1.0.0\",\"uploadType\":\"image\",\"url\":\"http://127.0.0.1:9300/statics/2023/03/16/22年 毕业实习需要完成的文档_20230316021550A005.docx\",\"uuid\":\"b397c9d3d6384fa49761ce23dfd8b02a\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"uploadToken\":\"5f93f9fc9421472e9afd3f8c485c955b\"}}', 0, NULL, '2023-03-16 02:15:51');
INSERT INTO `sys_oper_log` VALUES (389, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/5f93f9fc9421472e9afd3f8c485c955b', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 02:15:51');
INSERT INTO `sys_oper_log` VALUES (390, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/5f93f9fc9421472e9afd3f8c485c955b', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传失败\"}}', 0, NULL, '2023-03-16 02:16:01');
INSERT INTO `sys_oper_log` VALUES (391, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadFilde()', 'POST', 1, 'admin', NULL, '/harbor/upload/file', '127.0.0.1', '', '', '{\"msg\":\"001c7bc0c99147828134754f1fbf8d41\",\"code\":200}', 0, NULL, '2023-03-16 02:16:42');
INSERT INTO `sys_oper_log` VALUES (392, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadTable()', 'POST', 1, 'admin', NULL, '/harbor/upload/table', '127.0.0.1', '', '{\"environmentName\":\"python-base-vscode\",\"introduce\":\"python的vscode开发环境\",\"isPublic\":true,\"tag\":\"1.0.0\",\"uploadType\":\"container\",\"url\":\"http://127.0.0.1:9300/statics/2023/03/16/22年 毕业实习需要完成的文档_20230316021642A006.docx\",\"uuid\":\"001c7bc0c99147828134754f1fbf8d41\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"uploadToken\":\"50cbf16fce424f2582b7bc2a905a1a26\"}}', 0, NULL, '2023-03-16 02:17:20');
INSERT INTO `sys_oper_log` VALUES (393, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadFilde()', 'POST', 1, 'admin', NULL, '/harbor/upload/file', '127.0.0.1', '', '', '{\"msg\":\"621d987ddd034b47af0d7a060adbaff6\",\"code\":200}', 0, NULL, '2023-03-16 02:17:57');
INSERT INTO `sys_oper_log` VALUES (394, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadTable()', 'POST', 1, 'admin', NULL, '/harbor/upload/table', '127.0.0.1', '', '{\"environmentName\":\"python-base-vscode\",\"introduce\":\"python的vscode开发环境\",\"isPublic\":true,\"tag\":\"1.0.0\",\"uploadType\":\"container\",\"url\":\"http://127.0.0.1:9300/statics/2023/03/16/22年 毕业实习需要完成的文档_20230316021757A007.docx\",\"uuid\":\"621d987ddd034b47af0d7a060adbaff6\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"uploadToken\":\"1808813d3f31404a98e1c13400fa5869\"}}', 0, NULL, '2023-03-16 02:20:38');
INSERT INTO `sys_oper_log` VALUES (395, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadFilde()', 'POST', 1, 'admin', NULL, '/harbor/upload/file', '127.0.0.1', '', '', '{\"msg\":\"0e6db2ea06924fe4b5bc3611dffec0b1\",\"code\":200}', 0, NULL, '2023-03-16 02:20:50');
INSERT INTO `sys_oper_log` VALUES (396, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadTable()', 'POST', 1, 'admin', NULL, '/harbor/upload/table', '127.0.0.1', '', '{\"environmentName\":\"python-base-vscode\",\"introduce\":\"python的vscode开发环境\",\"isPublic\":true,\"tag\":\"1.0.0\",\"uploadType\":\"container\",\"url\":\"http://127.0.0.1:9300/statics/2023/03/16/22年 毕业实习需要完成的文档_20230316022050A008.docx\",\"uuid\":\"0e6db2ea06924fe4b5bc3611dffec0b1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\xB9\\xB4 \\xE6\\xAF...\' for column \'image_url\' at row 1\r\n### The error may exist in file [E:\\Web\\OnlineCodeLearnPlatform\\codeonline\\codeonline-modules\\codeonline-cloud\\target\\classes\\mapper\\cloud\\HarborUploadMapper.xml]\r\n### The error may involve com.codeonline.cloud.harbor.mapper.HarborUploadMapper.insertHarborUpload-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into harbor_upload (user_id,image_name,image_tag,image_url,is_public,introduce, create_by, create_time, update_by, update_time)         values (?,?,?,?,?,?, ?, sysdate(), ?, sysdate())\r\n### Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\xB9\\xB4 \\xE6\\xAF...\' for column \'image_url\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect string value: \'\\xE5\\xB9\\xB4 \\xE6\\xAF...\' for column \'image_url\' at row 1; nested exception is java.sql.SQLException: Incorrect string value: \'\\xE5\\xB9\\xB4 \\xE6\\xAF...\' for column \'image_url\' at row 1', '2023-03-16 02:22:50');
INSERT INTO `sys_oper_log` VALUES (397, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-03-16 02:29:43');
INSERT INTO `sys_oper_log` VALUES (398, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-03-16 02:37:34');
INSERT INTO `sys_oper_log` VALUES (399, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2023-03-16 12:06:25');
INSERT INTO `sys_oper_log` VALUES (400, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadFilde()', 'POST', 1, 'admin', NULL, '/harbor/upload/file', '127.0.0.1', '', '', '{\"msg\":\"e21c39cc06174cc69b907201b352c32e\",\"code\":200}', 0, NULL, '2023-03-16 12:06:39');
INSERT INTO `sys_oper_log` VALUES (401, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.uploadTable()', 'POST', 1, 'admin', NULL, '/harbor/upload/table', '127.0.0.1', '', '{\"environmentName\":\"jupyter-base\",\"introduce\":\"jupyter基础环境\",\"isPublic\":true,\"tag\":\"1.0.0\",\"uploadType\":\"image\",\"url\":\"http://127.0.0.1:9300/statics/2023/03/16/22年 毕业实习需要完成的文档_20230316120636A009.docx\",\"uuid\":\"e21c39cc06174cc69b907201b352c32e\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"uploadToken\":\"f0955531a4e747d3910464980c301f89\"}}', 0, NULL, '2023-03-16 12:06:46');
INSERT INTO `sys_oper_log` VALUES (402, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/f0955531a4e747d3910464980c301f89', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 12:06:47');
INSERT INTO `sys_oper_log` VALUES (403, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/f0955531a4e747d3910464980c301f89', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 12:06:57');
INSERT INTO `sys_oper_log` VALUES (404, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/f0955531a4e747d3910464980c301f89', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 12:07:07');
INSERT INTO `sys_oper_log` VALUES (405, 'harbor上传', 1, 'com.codeonline.cloud.harbor.controller.UploadController.getUploadStatus()', 'GET', 1, 'admin', NULL, '/harbor/upload/status/f0955531a4e747d3910464980c301f89', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"status\":\"上传中\"}}', 0, NULL, '2023-03-16 12:07:42');
INSERT INTO `sys_oper_log` VALUES (406, '应用市场', 1, 'com.codeonline.cloud.harbor.controller.MarketController.getAllMarketImages()', 'GET', 1, 'admin', NULL, '/harbor/market/images', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"artifactCount\":1,\"createBy\":\"admin\",\"createTime\":\"2023-03-16 12:11:58\",\"imageName\":\"1_jupyter-base\",\"imageTag\":\"1.0.0\",\"imageUrl\":\"http://127.0.0.1:9300/statics/2023/03/16/22年 毕业实习需要完成的文档_20230316120636A009.docx\",\"introduce\":\"jupyter基础环境\",\"params\":{},\"public\":false,\"pullCount\":0,\"updateBy\":\"admin\",\"updateTime\":\"2023-03-16 12:11:58\",\"userId\":1},{\"artifactCount\":1,\"createBy\":\"admin\",\"createTime\":\"2023-03-15 12:11:58\",\"imageName\":\"1_python-base-vscode\",\"imageTag\":\"1.0.0\",\"imageUrl\":\"http://127.0.0.1:9300/statics/2023/03/16/22年 毕业实习需要完成的文档_20230316120636A009.docx\",\"introduce\":\"python的vscode的基础环境\",\"params\":{},\"public\":false,\"pullCount\":0,\"updateBy\":\"admin\",\"updateTime\":\"2023-03-15 12:11:58\",\"userId\":1}]}', 0, NULL, '2023-03-16 12:14:48');
INSERT INTO `sys_oper_log` VALUES (407, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678556268265', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"envs\":[{}],\"imageName\":\"test0:1.0.0\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\"}}', 0, NULL, '2023-03-16 12:15:40');
INSERT INTO `sys_oper_log` VALUES (408, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.updateK8sConfigureByLabId()', 'PUT', 1, 'admin', NULL, '/k8s/configures/1678556268265', '127.0.0.1', '', '\"1678556268265\" {\"description\":\"sudo密码是123456\",\"envs\":[{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"SUDO_PASSWORD\",\"value\":\"123456\"}],\"hasPublic\":true,\"imageName\":\"1_python-base-vscode:1.0.0\",\"labId\":\"1678556268265\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startCmd\":\"/init\",\"volume\":\"/config/workspace\"}', '{\"msg\":\"更新成功\",\"code\":200}', 0, NULL, '2023-03-16 12:21:20');
INSERT INTO `sys_oper_log` VALUES (409, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, 'admin', NULL, '/k8s/deployments/1678556268265/-1', '127.0.0.1', '', '\"1678556268265\" -1', NULL, 1, 'An error has occurred.', '2023-03-16 12:23:48');
INSERT INTO `sys_oper_log` VALUES (410, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, 'admin', NULL, '/k8s/deployments/1678556268265/-1', '127.0.0.1', '', '\"1678556268265\" -1', NULL, 1, 'Failure executing: POST at: https://10.135.128.18:6443/apis/apps/v1/namespaces/codeonline-all/deployments. Message: Deployment.apps \"codeonline-deployment-1678556268265-1\" is invalid: [spec.template.spec.volumes[0].nfs.path: Invalid value: \"root/data/nfs/1/1678556268265/1\": must be an absolute path, spec.template.spec.containers[0].volumeMounts[0].name: Not found: \"code-volume-1678556268265-1\"]. Received status: Status(apiVersion=v1, code=422, details=StatusDetails(causes=[StatusCause(field=spec.template.spec.volumes[0].nfs.path, message=Invalid value: \"root/data/nfs/1/1678556268265/1\": must be an absolute path, reason=FieldValueInvalid, additionalProperties={}), StatusCause(field=spec.template.spec.containers[0].volumeMounts[0].name, message=Not found: \"code-volume-1678556268265-1\", reason=FieldValueNotFound, additionalProperties={})], group=apps, kind=Deployment, name=codeonline-deployment-1678556268265-1, retryAfterSeconds=null, uid=null, additionalProperties={}), kind=Status, message=Deployment.apps \"codeonline-deployment-1678556268265-1\" is invalid: [spec.template.spec.volumes[0].nfs.path: Invalid value: \"root/data/nfs/1/1678556268265/1\": must be an absolute path, spec.template.spec.containers[0].volumeMounts[0].name: Not found: \"code-volume-1678556268265-1\"], metadata=ListMeta(_continue=null, remainingItemCount=null, resourceVersion=null, selfLink=null, additionalProperties={}), reason=Invalid, status=Failure, additionalProperties={}).', '2023-03-16 12:28:35');
INSERT INTO `sys_oper_log` VALUES (411, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, 'admin', NULL, '/k8s/deployments/1678556268265/-1', '127.0.0.1', '', '\"1678556268265\" -1', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createBy\":\"admin\",\"deployNamespace\":\"codeonline-all\",\"deploymentName\":\"codeonline-deployment-1678556268265-1\",\"hasDestroy\":false,\"k8sConfigure\":{\"description\":\"sudo密码是123456\",\"envs\":[{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"SUDO_PASSWORD\",\"value\":\"123456\"}],\"imageName\":\"10.135.128.18:30002/codeonline-all/1_python-base-vscode:1.0.0\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startCmd\":\"/init\",\"volume\":\"/config/workspace\"},\"labId\":\"1678556268265\",\"params\":{},\"serviceName\":\"codeonline-service-1678556268265-1\",\"teacherId\":1,\"updateBy\":\"admin\",\"userId\":1}}', 0, NULL, '2023-03-16 12:47:19');
INSERT INTO `sys_oper_log` VALUES (412, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.labStart()', 'GET', 1, 'admin', NULL, '/k8s/labStart/1678556268265/-1', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"port\":8443,\"service\":\"vscode\",\"targetPort\":8443,\"nodePort\":30500,\"url\":\"http://10.135.128.18:30500\"}]}', 0, NULL, '2023-03-16 12:47:26');
INSERT INTO `sys_oper_log` VALUES (413, 'k8s控制', 3, 'com.codeonline.cloud.k8s.controller.K8sController.labDelete()', 'DELETE', 1, 'admin', NULL, '/k8s/labDelete/1678556268265/-1', '127.0.0.1', '', '{}', '{\"msg\":\"删除成功\",\"code\":200}', 0, NULL, '2023-03-16 12:50:28');
INSERT INTO `sys_oper_log` VALUES (414, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, 'admin', NULL, '/k8s/deployments/1678556268265/-1', '127.0.0.1', '', '\"1678556268265\" -1', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createBy\":\"admin\",\"deployNamespace\":\"codeonline-all\",\"deploymentName\":\"codeonline-deployment-1678556268265-1\",\"hasDestroy\":false,\"k8sConfigure\":{\"description\":\"sudo密码是123456\",\"envs\":[{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"SUDO_PASSWORD\",\"value\":\"123456\"}],\"imageName\":\"10.135.128.18:30002/codeonline-all/1_python-base-vscode:1.0.0\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startCmd\":\"/init\",\"volume\":\"/config/workspace\"},\"labId\":\"1678556268265\",\"params\":{},\"serviceName\":\"codeonline-service-1678556268265-1\",\"teacherId\":1,\"updateBy\":\"admin\",\"userId\":1}}', 0, NULL, '2023-03-16 12:50:37');
INSERT INTO `sys_oper_log` VALUES (415, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sConfigure()', 'POST', 1, 'admin', NULL, '/k8s/configures/1678943372804', '127.0.0.1', '', '\"1678943372804\" {\"envs\":[{}],\"hasPublic\":true,\"imageName\":\"1_jupyter-base:1.0.0\",\"labId\":\"1678943372804\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\'\",\"startCmd\":\"start.sh\",\"userId\":1,\"volume\":\"/home/jovyan/\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-16 13:09:35');
INSERT INTO `sys_oper_log` VALUES (416, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, 'admin', NULL, '/k8s/deployments/1678943372804/-1', '127.0.0.1', '', '\"1678943372804\" -1', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createBy\":\"admin\",\"deployNamespace\":\"codeonline-all\",\"deploymentName\":\"codeonline-deployment-1678943372804-1\",\"hasDestroy\":false,\"k8sConfigure\":{\"envs\":[{}],\"imageName\":\"10.135.128.18:30002/codeonline-all/1_jupyter-base:1.0.0\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\'\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"},\"labId\":\"1678943372804\",\"params\":{},\"serviceName\":\"codeonline-service-1678943372804-1\",\"teacherId\":1,\"updateBy\":\"admin\",\"userId\":1}}', 0, NULL, '2023-03-16 13:09:53');
INSERT INTO `sys_oper_log` VALUES (417, 'k8s控制', 3, 'com.codeonline.cloud.k8s.controller.K8sController.labDelete()', 'DELETE', 1, 'admin', NULL, '/k8s/labDelete/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"删除成功\",\"code\":200}', 0, NULL, '2023-03-16 13:46:52');
INSERT INTO `sys_oper_log` VALUES (418, 'k8s控制', 3, 'com.codeonline.cloud.k8s.controller.K8sController.labDelete()', 'DELETE', 1, 'admin', NULL, '/k8s/labDelete/1678556268265/-1', '127.0.0.1', '', '{}', '{\"msg\":\"删除成功\",\"code\":200}', 0, NULL, '2023-03-16 13:47:10');
INSERT INTO `sys_oper_log` VALUES (419, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678943372804', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"envs\":[{}],\"imageName\":\"1_jupyter-base:1.0.0\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\'\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"}}', 0, NULL, '2023-03-16 13:53:09');
INSERT INTO `sys_oper_log` VALUES (420, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.updateK8sConfigureByLabId()', 'PUT', 1, 'admin', NULL, '/k8s/configures/1678943372804', '127.0.0.1', '', '\"1678943372804\" {\"envs\":[{}],\"hasPublic\":false,\"imageName\":\"1_jupyter-base:1.0.0\",\"labId\":\"1678943372804\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"\",\"startCmd\":\"\",\"volume\":\"/home/jovyan/\"}', '{\"msg\":\"更新成功\",\"code\":200}', 0, NULL, '2023-03-16 13:53:16');
INSERT INTO `sys_oper_log` VALUES (421, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, 'admin', NULL, '/k8s/deployments/1678943372804/-1', '127.0.0.1', '', '\"1678943372804\" -1', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createBy\":\"admin\",\"deployNamespace\":\"codeonline-all\",\"deploymentName\":\"codeonline-deployment-1678943372804-1\",\"hasDestroy\":false,\"k8sConfigure\":{\"envs\":[{}],\"imageName\":\"10.135.128.18:30002/codeonline-all/1_jupyter-base:1.0.0\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"\",\"startCmd\":\"\",\"volume\":\"/home/jovyan/\"},\"labId\":\"1678943372804\",\"params\":{},\"serviceName\":\"codeonline-service-1678943372804-1\",\"teacherId\":1,\"updateBy\":\"admin\",\"userId\":1}}', 0, NULL, '2023-03-16 13:53:23');
INSERT INTO `sys_oper_log` VALUES (422, 'k8s控制', 3, 'com.codeonline.cloud.k8s.controller.K8sController.labDelete()', 'DELETE', 1, 'admin', NULL, '/k8s/labDelete/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"删除成功\",\"code\":200}', 0, NULL, '2023-03-16 13:54:38');
INSERT INTO `sys_oper_log` VALUES (423, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, 'admin', NULL, '/k8s/deployments/1678943372804/-1', '127.0.0.1', '', '\"1678943372804\" -1', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createBy\":\"admin\",\"deployNamespace\":\"codeonline-all\",\"deploymentName\":\"codeonline-deployment-1678943372804-1\",\"hasDestroy\":false,\"k8sConfigure\":{\"envs\":[{}],\"imageName\":\"10.135.128.18:30002/codeonline-all/1_jupyter-base:1.0.0\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"\",\"startCmd\":\"\",\"volume\":\"/home/jovyan/\"},\"labId\":\"1678943372804\",\"params\":{},\"serviceName\":\"codeonline-service-1678943372804-1\",\"teacherId\":1,\"updateBy\":\"admin\",\"userId\":1}}', 0, NULL, '2023-03-16 14:05:49');
INSERT INTO `sys_oper_log` VALUES (424, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.labStart()', 'GET', 1, 'admin', NULL, '/k8s/labStart/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"port\":8888,\"service\":\"jupyter\",\"targetPort\":8888,\"nodePort\":30500,\"url\":\"http://10.135.128.18:30500/lab\"}]}', 0, NULL, '2023-03-16 14:07:06');
INSERT INTO `sys_oper_log` VALUES (425, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.labStart()', 'GET', 1, 'admin', NULL, '/k8s/labStart/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"port\":8888,\"service\":\"jupyter\",\"targetPort\":8888,\"nodePort\":30500,\"url\":\"http://10.135.128.18:30500/lab\"}]}', 0, NULL, '2023-03-16 14:07:49');
INSERT INTO `sys_oper_log` VALUES (426, 'k8s控制', 3, 'com.codeonline.cloud.k8s.controller.K8sController.labDelete()', 'DELETE', 1, 'admin', NULL, '/k8s/labDelete/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"删除成功\",\"code\":200}', 0, NULL, '2023-03-16 14:09:07');
INSERT INTO `sys_oper_log` VALUES (427, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678943372804', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"envs\":[{}],\"imageName\":\"1_jupyter-base:1.0.0\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"\",\"startCmd\":\"\",\"volume\":\"/home/jovyan/\"}}', 0, NULL, '2023-03-16 14:09:23');
INSERT INTO `sys_oper_log` VALUES (428, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.updateK8sConfigureByLabId()', 'PUT', 1, 'admin', NULL, '/k8s/configures/1678943372804', '127.0.0.1', '', '\"1678943372804\" {\"envs\":[{\"key\":\"\"}],\"hasPublic\":true,\"imageName\":\"1_jupyter-base:1.0.0\",\"labId\":\"1678943372804\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\'\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"}', '{\"msg\":\"更新成功\",\"code\":200}', 0, NULL, '2023-03-16 14:10:14');
INSERT INTO `sys_oper_log` VALUES (429, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, 'admin', NULL, '/k8s/deployments/1678556268265/-1', '127.0.0.1', '', '\"1678556268265\" -1', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createBy\":\"admin\",\"deployNamespace\":\"codeonline-all\",\"deploymentName\":\"codeonline-deployment-1678556268265-1\",\"hasDestroy\":false,\"k8sConfigure\":{\"description\":\"sudo密码是123456\",\"envs\":[{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"SUDO_PASSWORD\",\"value\":\"123456\"}],\"imageName\":\"10.135.128.18:30002/codeonline-all/1_python-base-vscode:1.0.0\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startCmd\":\"/init\",\"volume\":\"/config/workspace\"},\"labId\":\"1678556268265\",\"params\":{},\"serviceName\":\"codeonline-service-1678556268265-1\",\"teacherId\":1,\"updateBy\":\"admin\",\"userId\":1}}', 0, NULL, '2023-03-16 14:10:19');
INSERT INTO `sys_oper_log` VALUES (430, 'k8s控制', 3, 'com.codeonline.cloud.k8s.controller.K8sController.labDelete()', 'DELETE', 1, 'admin', NULL, '/k8s/labDelete/1678556268265/-1', '127.0.0.1', '', '{}', '{\"msg\":\"删除成功\",\"code\":200}', 0, NULL, '2023-03-16 14:14:32');
INSERT INTO `sys_oper_log` VALUES (431, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678943372804', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"envs\":[{\"key\":\"\"}],\"imageName\":\"1_jupyter-base:1.0.0\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\'\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"}}', 0, NULL, '2023-03-16 14:14:45');
INSERT INTO `sys_oper_log` VALUES (432, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.updateK8sConfigureByLabId()', 'PUT', 1, 'admin', NULL, '/k8s/configures/1678943372804', '127.0.0.1', '', '\"1678943372804\" {\"envs\":[{\"key\":\"\"}],\"hasPublic\":false,\"imageName\":\"1_jupyter-base:1.0.0\",\"labId\":\"1678943372804\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\',--NotebookApp.allow_origin=\\\"*\\\",--NotebookApp.open_browser=False\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"}', '{\"msg\":\"更新成功\",\"code\":200}', 0, NULL, '2023-03-16 14:15:23');
INSERT INTO `sys_oper_log` VALUES (433, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, 'admin', NULL, '/k8s/deployments/1678943372804/-1', '127.0.0.1', '', '\"1678943372804\" -1', NULL, 1, 'Failure executing: POST at: https://10.135.128.18:6443/apis/apps/v1/namespaces/codeonline-all/deployments. Message: Deployment.apps \"codeonline-deployment-1678943372804-1\" is invalid: spec.template.spec.containers[0].env[0].name: Required value. Received status: Status(apiVersion=v1, code=422, details=StatusDetails(causes=[StatusCause(field=spec.template.spec.containers[0].env[0].name, message=Required value, reason=FieldValueRequired, additionalProperties={})], group=apps, kind=Deployment, name=codeonline-deployment-1678943372804-1, retryAfterSeconds=null, uid=null, additionalProperties={}), kind=Status, message=Deployment.apps \"codeonline-deployment-1678943372804-1\" is invalid: spec.template.spec.containers[0].env[0].name: Required value, metadata=ListMeta(_continue=null, remainingItemCount=null, resourceVersion=null, selfLink=null, additionalProperties={}), reason=Invalid, status=Failure, additionalProperties={}).', '2023-03-16 14:15:27');
INSERT INTO `sys_oper_log` VALUES (434, 'k8s控制', 3, 'com.codeonline.cloud.k8s.controller.K8sController.labDelete()', 'DELETE', 1, 'admin', NULL, '/k8s/labDelete/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"已销毁，不需要删除\",\"code\":500}', 0, NULL, '2023-03-16 14:15:50');
INSERT INTO `sys_oper_log` VALUES (435, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678943372804', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"envs\":[{\"key\":\"\"}],\"imageName\":\"1_jupyter-base:1.0.0\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\',--NotebookApp.allow_origin=\\\"*\\\",--NotebookApp.open_browser=False\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"}}', 0, NULL, '2023-03-16 14:16:19');
INSERT INTO `sys_oper_log` VALUES (436, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.updateK8sConfigureByLabId()', 'PUT', 1, 'admin', NULL, '/k8s/configures/1678943372804', '127.0.0.1', '', '\"1678943372804\" {\"envs\":[{\"key\":\"\"}],\"hasPublic\":false,\"imageName\":\"1_jupyter-base:1.0.0\",\"labId\":\"1678943372804\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\',--NotebookApp.allow_origin=\'*\',--NotebookApp.open_browser=False\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"}', '{\"msg\":\"更新成功\",\"code\":200}', 0, NULL, '2023-03-16 14:16:40');
INSERT INTO `sys_oper_log` VALUES (437, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, 'admin', NULL, '/k8s/deployments/1678943372804/-1', '127.0.0.1', '', '\"1678943372804\" -1', NULL, 1, 'Failure executing: POST at: https://10.135.128.18:6443/apis/apps/v1/namespaces/codeonline-all/deployments. Message: Deployment.apps \"codeonline-deployment-1678943372804-1\" is invalid: spec.template.spec.containers[0].env[0].name: Required value. Received status: Status(apiVersion=v1, code=422, details=StatusDetails(causes=[StatusCause(field=spec.template.spec.containers[0].env[0].name, message=Required value, reason=FieldValueRequired, additionalProperties={})], group=apps, kind=Deployment, name=codeonline-deployment-1678943372804-1, retryAfterSeconds=null, uid=null, additionalProperties={}), kind=Status, message=Deployment.apps \"codeonline-deployment-1678943372804-1\" is invalid: spec.template.spec.containers[0].env[0].name: Required value, metadata=ListMeta(_continue=null, remainingItemCount=null, resourceVersion=null, selfLink=null, additionalProperties={}), reason=Invalid, status=Failure, additionalProperties={}).', '2023-03-16 14:16:44');
INSERT INTO `sys_oper_log` VALUES (438, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678943372804', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"envs\":[{\"key\":\"\"}],\"imageName\":\"1_jupyter-base:1.0.0\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\',--NotebookApp.allow_origin=\'*\',--NotebookApp.open_browser=False\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"}}', 0, NULL, '2023-03-16 14:17:00');
INSERT INTO `sys_oper_log` VALUES (439, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.updateK8sConfigureByLabId()', 'PUT', 1, 'admin', NULL, '/k8s/configures/1678943372804', '127.0.0.1', '', '\"1678943372804\" {\"envs\":[{\"key\":\"\"}],\"hasPublic\":false,\"imageName\":\"1_jupyter-base:1.0.0\",\"labId\":\"1678943372804\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\'\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"}', '{\"msg\":\"更新成功\",\"code\":200}', 0, NULL, '2023-03-16 14:17:07');
INSERT INTO `sys_oper_log` VALUES (440, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678556268265', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"description\":\"sudo密码是123456\",\"envs\":[{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"SUDO_PASSWORD\",\"value\":\"123456\"}],\"imageName\":\"1_python-base-vscode:1.0.0\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startCmd\":\"/init\",\"volume\":\"/config/workspace\"}}', 0, NULL, '2023-03-16 14:17:11');
INSERT INTO `sys_oper_log` VALUES (441, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.updateK8sConfigureByLabId()', 'PUT', 1, 'admin', NULL, '/k8s/configures/1678556268265', '127.0.0.1', '', '\"1678556268265\" {\"description\":\"sudo密码是123456\",\"envs\":[{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"SUDO_PASSWORD\",\"value\":\"123456\"}],\"hasPublic\":true,\"imageName\":\"1_python-base-vscode:1.0.0\",\"labId\":\"1678556268265\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startCmd\":\"/init\",\"volume\":\"/config/workspace\"}', '{\"msg\":\"更新成功\",\"code\":200}', 0, NULL, '2023-03-16 14:17:51');
INSERT INTO `sys_oper_log` VALUES (442, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, 'admin', NULL, '/k8s/deployments/1678556268265/-1', '127.0.0.1', '', '\"1678556268265\" -1', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createBy\":\"admin\",\"deployNamespace\":\"codeonline-all\",\"deploymentName\":\"codeonline-deployment-1678556268265-1\",\"hasDestroy\":false,\"k8sConfigure\":{\"description\":\"sudo密码是123456\",\"envs\":[{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"SUDO_PASSWORD\",\"value\":\"123456\"}],\"imageName\":\"10.135.128.18:30002/codeonline-all/1_python-base-vscode:1.0.0\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startCmd\":\"/init\",\"volume\":\"/config/workspace\"},\"labId\":\"1678556268265\",\"params\":{},\"serviceName\":\"codeonline-service-1678556268265-1\",\"teacherId\":1,\"updateBy\":\"admin\",\"userId\":1}}', 0, NULL, '2023-03-16 14:17:56');
INSERT INTO `sys_oper_log` VALUES (443, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678556268265', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"description\":\"sudo密码是123456\",\"envs\":[{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"SUDO_PASSWORD\",\"value\":\"123456\"}],\"imageName\":\"1_python-base-vscode:1.0.0\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startCmd\":\"/init\",\"volume\":\"/config/workspace\"}}', 0, NULL, '2023-03-16 14:19:12');
INSERT INTO `sys_oper_log` VALUES (444, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.updateK8sConfigureByLabId()', 'PUT', 1, 'admin', NULL, '/k8s/configures/1678556268265', '127.0.0.1', '', '\"1678556268265\" {\"description\":\"sudo密码是123456\",\"envs\":[{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"PUID\",\"value\":\"1000\"},{\"key\":\"SUDO_PASSWORD\",\"value\":\"123456\"}],\"hasPublic\":false,\"imageName\":\"1_python-base-vscode:1.0.0\",\"labId\":\"1678556268265\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startCmd\":\"/init\",\"volume\":\"/config/workspace\"}', '{\"msg\":\"更新成功\",\"code\":200}', 0, NULL, '2023-03-16 14:19:23');
INSERT INTO `sys_oper_log` VALUES (445, 'k8s控制', 3, 'com.codeonline.cloud.k8s.controller.K8sController.labDelete()', 'DELETE', 1, 'admin', NULL, '/k8s/labDelete/1678556268265/-1', '127.0.0.1', '', '{}', '{\"msg\":\"删除成功\",\"code\":200}', 0, NULL, '2023-03-16 14:20:30');
INSERT INTO `sys_oper_log` VALUES (446, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678943372804', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"envs\":[{\"key\":\"\"}],\"imageName\":\"1_jupyter-base:1.0.0\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\'\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"}}', 0, NULL, '2023-03-16 17:08:56');
INSERT INTO `sys_oper_log` VALUES (447, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.updateK8sConfigureByLabId()', 'PUT', 1, 'admin', NULL, '/k8s/configures/1678943372804', '127.0.0.1', '', '\"1678943372804\" {\"envs\":[{\"key\":\"\"}],\"hasPublic\":false,\"imageName\":\"1_jupyter-base:1.0.0\",\"labId\":\"1678943372804\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"\",\"startCmd\":\"\",\"volume\":\"/home/jovyan/\"}', '{\"msg\":\"更新成功\",\"code\":200}', 0, NULL, '2023-03-16 17:09:04');
INSERT INTO `sys_oper_log` VALUES (448, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, 'admin', NULL, '/k8s/deployments/1678943372804/-1', '127.0.0.1', '', '\"1678943372804\" -1', NULL, 1, 'Failure executing: POST at: https://10.135.128.18:6443/apis/apps/v1/namespaces/codeonline-all/deployments. Message: Deployment.apps \"codeonline-deployment-1678943372804-1\" is invalid: spec.template.spec.containers[0].env[0].name: Required value. Received status: Status(apiVersion=v1, code=422, details=StatusDetails(causes=[StatusCause(field=spec.template.spec.containers[0].env[0].name, message=Required value, reason=FieldValueRequired, additionalProperties={})], group=apps, kind=Deployment, name=codeonline-deployment-1678943372804-1, retryAfterSeconds=null, uid=null, additionalProperties={}), kind=Status, message=Deployment.apps \"codeonline-deployment-1678943372804-1\" is invalid: spec.template.spec.containers[0].env[0].name: Required value, metadata=ListMeta(_continue=null, remainingItemCount=null, resourceVersion=null, selfLink=null, additionalProperties={}), reason=Invalid, status=Failure, additionalProperties={}).', '2023-03-16 17:09:15');
INSERT INTO `sys_oper_log` VALUES (449, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678943372804', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"envs\":[{\"key\":\"\"}],\"imageName\":\"1_jupyter-base:1.0.0\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"\",\"startCmd\":\"\",\"volume\":\"/home/jovyan/\"}}', 0, NULL, '2023-03-16 17:09:45');
INSERT INTO `sys_oper_log` VALUES (450, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.updateK8sConfigureByLabId()', 'PUT', 1, 'admin', NULL, '/k8s/configures/1678943372804', '127.0.0.1', '', '\"1678943372804\" {\"envs\":[{\"key\":\"\"}],\"hasPublic\":false,\"imageName\":\"1_jupyter-base:1.0.0\",\"labId\":\"1678943372804\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"\",\"startCmd\":\"\",\"volume\":\"\"}', '{\"msg\":\"更新成功\",\"code\":200}', 0, NULL, '2023-03-16 17:09:53');
INSERT INTO `sys_oper_log` VALUES (451, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, 'admin', NULL, '/k8s/deployments/1678943372804/-1', '127.0.0.1', '', '\"1678943372804\" -1', NULL, 1, 'Failure executing: POST at: https://10.135.128.18:6443/apis/apps/v1/namespaces/codeonline-all/deployments. Message: Deployment.apps \"codeonline-deployment-1678943372804-1\" is invalid: spec.template.spec.containers[0].env[0].name: Required value. Received status: Status(apiVersion=v1, code=422, details=StatusDetails(causes=[StatusCause(field=spec.template.spec.containers[0].env[0].name, message=Required value, reason=FieldValueRequired, additionalProperties={})], group=apps, kind=Deployment, name=codeonline-deployment-1678943372804-1, retryAfterSeconds=null, uid=null, additionalProperties={}), kind=Status, message=Deployment.apps \"codeonline-deployment-1678943372804-1\" is invalid: spec.template.spec.containers[0].env[0].name: Required value, metadata=ListMeta(_continue=null, remainingItemCount=null, resourceVersion=null, selfLink=null, additionalProperties={}), reason=Invalid, status=Failure, additionalProperties={}).', '2023-03-16 17:09:56');
INSERT INTO `sys_oper_log` VALUES (452, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678943372804', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"envs\":[{\"key\":\"\"}],\"imageName\":\"1_jupyter-base:1.0.0\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"\",\"startCmd\":\"\",\"volume\":\"\"}}', 0, NULL, '2023-03-16 17:10:36');
INSERT INTO `sys_oper_log` VALUES (453, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.updateK8sConfigureByLabId()', 'PUT', 1, 'admin', NULL, '/k8s/configures/1678943372804', '127.0.0.1', '', '\"1678943372804\" {\"envs\":[{\"key\":\"\"}],\"hasPublic\":false,\"imageName\":\"jupyter/base-notebook:2023-02-28\",\"labId\":\"1678943372804\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"dockerhub\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\'\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"}', '{\"msg\":\"更新成功\",\"code\":200}', 0, NULL, '2023-03-16 17:11:48');
INSERT INTO `sys_oper_log` VALUES (454, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, 'admin', NULL, '/k8s/deployments/1678943372804/-1', '127.0.0.1', '', '\"1678943372804\" -1', NULL, 1, 'Failure executing: POST at: https://10.135.128.18:6443/apis/apps/v1/namespaces/codeonline-all/deployments. Message: Deployment.apps \"codeonline-deployment-1678943372804-1\" is invalid: spec.template.spec.containers[0].env[0].name: Required value. Received status: Status(apiVersion=v1, code=422, details=StatusDetails(causes=[StatusCause(field=spec.template.spec.containers[0].env[0].name, message=Required value, reason=FieldValueRequired, additionalProperties={})], group=apps, kind=Deployment, name=codeonline-deployment-1678943372804-1, retryAfterSeconds=null, uid=null, additionalProperties={}), kind=Status, message=Deployment.apps \"codeonline-deployment-1678943372804-1\" is invalid: spec.template.spec.containers[0].env[0].name: Required value, metadata=ListMeta(_continue=null, remainingItemCount=null, resourceVersion=null, selfLink=null, additionalProperties={}), reason=Invalid, status=Failure, additionalProperties={}).', '2023-03-16 17:11:56');
INSERT INTO `sys_oper_log` VALUES (455, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678943372804', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"envs\":[{\"key\":\"\"}],\"imageName\":\"jupyter/base-notebook:2023-02-28\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"dockerhub\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\'\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"}}', 0, NULL, '2023-03-16 17:14:18');
INSERT INTO `sys_oper_log` VALUES (456, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.updateK8sConfigureByLabId()', 'PUT', 1, 'admin', NULL, '/k8s/configures/1678943372804', '127.0.0.1', '', '\"1678943372804\" {\"envs\":[{\"key\":\"a\",\"value\":\"a\"}],\"hasPublic\":false,\"imageName\":\"1_jupyter-base:1.0.0\",\"labId\":\"1678943372804\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\'\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"}', '{\"msg\":\"更新成功\",\"code\":200}', 0, NULL, '2023-03-16 17:15:00');
INSERT INTO `sys_oper_log` VALUES (457, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, 'admin', NULL, '/k8s/deployments/1678943372804/-1', '127.0.0.1', '', '\"1678943372804\" -1', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createBy\":\"admin\",\"deployNamespace\":\"codeonline-all\",\"deploymentName\":\"codeonline-deployment-1678943372804-1\",\"hasDestroy\":false,\"k8sConfigure\":{\"envs\":[{\"key\":\"a\",\"value\":\"a\"}],\"imageName\":\"10.135.128.18:30002/codeonline-all/1_jupyter-base:1.0.0\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\'\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"},\"labId\":\"1678943372804\",\"params\":{},\"serviceName\":\"codeonline-service-1678943372804-1\",\"teacherId\":1,\"updateBy\":\"admin\",\"userId\":1}}', 0, NULL, '2023-03-16 17:15:05');
INSERT INTO `sys_oper_log` VALUES (458, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.labStart()', 'GET', 1, 'admin', NULL, '/k8s/labStart/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"port\":8888,\"service\":\"jupyter\",\"targetPort\":8888,\"nodePort\":30500,\"url\":\"http://10.135.128.18:30500/lab\"}]}', 0, NULL, '2023-03-16 17:15:44');
INSERT INTO `sys_oper_log` VALUES (459, 'k8s控制', 3, 'com.codeonline.cloud.k8s.controller.K8sController.labDelete()', 'DELETE', 1, 'admin', NULL, '/k8s/labDelete/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"删除成功\",\"code\":200}', 0, NULL, '2023-03-16 17:16:33');
INSERT INTO `sys_oper_log` VALUES (460, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678943372804', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"envs\":[{\"key\":\"a\",\"value\":\"a\"}],\"imageName\":\"1_jupyter-base:1.0.0\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\'\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"}}', 0, NULL, '2023-03-16 17:17:15');
INSERT INTO `sys_oper_log` VALUES (461, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.updateK8sConfigureByLabId()', 'PUT', 1, 'admin', NULL, '/k8s/configures/1678943372804', '127.0.0.1', '', '\"1678943372804\" {\"envs\":[{\"key\":\"a\",\"value\":\"a\"}],\"hasPublic\":false,\"imageName\":\"1_jupyter-base:1.0.0\",\"labId\":\"1678943372804\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\',--NotebookApp.allow_origin=\\\"*\\\",--NotebookApp.open_browser=False\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"}', '{\"msg\":\"更新成功\",\"code\":200}', 0, NULL, '2023-03-16 17:17:44');
INSERT INTO `sys_oper_log` VALUES (462, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, 'admin', NULL, '/k8s/deployments/1678943372804/-1', '127.0.0.1', '', '\"1678943372804\" -1', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createBy\":\"admin\",\"deployNamespace\":\"codeonline-all\",\"deploymentName\":\"codeonline-deployment-1678943372804-1\",\"hasDestroy\":false,\"k8sConfigure\":{\"envs\":[{\"key\":\"a\",\"value\":\"a\"}],\"imageName\":\"10.135.128.18:30002/codeonline-all/1_jupyter-base:1.0.0\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\',--NotebookApp.allow_origin=\\\"*\\\",--NotebookApp.open_browser=False\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"},\"labId\":\"1678943372804\",\"params\":{},\"serviceName\":\"codeonline-service-1678943372804-1\",\"teacherId\":1,\"updateBy\":\"admin\",\"userId\":1}}', 0, NULL, '2023-03-16 17:17:50');
INSERT INTO `sys_oper_log` VALUES (463, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.labStart()', 'GET', 1, 'admin', NULL, '/k8s/labStart/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"port\":8888,\"service\":\"jupyter\",\"targetPort\":8888,\"nodePort\":30500,\"url\":\"http://10.135.128.18:30500/lab\"}]}', 0, NULL, '2023-03-16 17:17:51');
INSERT INTO `sys_oper_log` VALUES (464, 'k8s控制', 3, 'com.codeonline.cloud.k8s.controller.K8sController.labDelete()', 'DELETE', 1, 'admin', NULL, '/k8s/labDelete/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"删除成功\",\"code\":200}', 0, NULL, '2023-03-16 17:17:59');
INSERT INTO `sys_oper_log` VALUES (465, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678943372804', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"envs\":[{\"key\":\"a\",\"value\":\"a\"}],\"imageName\":\"1_jupyter-base:1.0.0\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\',--NotebookApp.allow_origin=\\\"*\\\",--NotebookApp.open_browser=False\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"}}', 0, NULL, '2023-03-16 17:18:12');
INSERT INTO `sys_oper_log` VALUES (466, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.updateK8sConfigureByLabId()', 'PUT', 1, 'admin', NULL, '/k8s/configures/1678943372804', '127.0.0.1', '', '\"1678943372804\" {\"envs\":[{\"key\":\"a\",\"value\":\"a\"}],\"hasPublic\":false,\"imageName\":\"1_jupyter-base:1.0.0\",\"labId\":\"1678943372804\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\' --NotebookApp.allow_origin=\\\"*\\\" --NotebookApp.open_browser=False\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"}', '{\"msg\":\"更新成功\",\"code\":200}', 0, NULL, '2023-03-16 17:19:20');
INSERT INTO `sys_oper_log` VALUES (467, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, 'admin', NULL, '/k8s/deployments/1678943372804/-1', '127.0.0.1', '', '\"1678943372804\" -1', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createBy\":\"admin\",\"deployNamespace\":\"codeonline-all\",\"deploymentName\":\"codeonline-deployment-1678943372804-1\",\"hasDestroy\":false,\"k8sConfigure\":{\"envs\":[{\"key\":\"a\",\"value\":\"a\"}],\"imageName\":\"10.135.128.18:30002/codeonline-all/1_jupyter-base:1.0.0\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\' --NotebookApp.allow_origin=\\\"*\\\" --NotebookApp.open_browser=False\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"},\"labId\":\"1678943372804\",\"params\":{},\"serviceName\":\"codeonline-service-1678943372804-1\",\"teacherId\":1,\"updateBy\":\"admin\",\"userId\":1}}', 0, NULL, '2023-03-16 17:19:25');
INSERT INTO `sys_oper_log` VALUES (468, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.labStart()', 'GET', 1, 'admin', NULL, '/k8s/labStart/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"port\":8888,\"service\":\"jupyter\",\"targetPort\":8888,\"nodePort\":30500,\"url\":\"http://10.135.128.18:30500/lab\"}]}', 0, NULL, '2023-03-16 17:19:27');
INSERT INTO `sys_oper_log` VALUES (469, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.labStart()', 'GET', 1, 'admin', NULL, '/k8s/labStart/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"port\":8888,\"service\":\"jupyter\",\"targetPort\":8888,\"nodePort\":30500,\"url\":\"http://10.135.128.18:30500/lab\"}]}', 0, NULL, '2023-03-16 17:19:35');
INSERT INTO `sys_oper_log` VALUES (470, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678943372804', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"envs\":[{\"key\":\"a\",\"value\":\"a\"}],\"imageName\":\"1_jupyter-base:1.0.0\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\' --NotebookApp.allow_origin=\\\"*\\\" --NotebookApp.open_browser=False\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"}}', 0, NULL, '2023-03-16 17:28:30');
INSERT INTO `sys_oper_log` VALUES (471, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.updateK8sConfigureByLabId()', 'PUT', 1, 'admin', NULL, '/k8s/configures/1678943372804', '127.0.0.1', '', '\"1678943372804\" {\"envs\":[{\"key\":\"a\",\"value\":\"a\"}],\"hasPublic\":false,\"imageName\":\"1_jupyter-base:1.0.0\",\"labId\":\"1678943372804\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\',--NotebookApp.allow_origin=\\\"*\\\",--NotebookApp.open_browser=False\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"}', '{\"msg\":\"更新成功\",\"code\":200}', 0, NULL, '2023-03-16 17:33:51');
INSERT INTO `sys_oper_log` VALUES (472, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678556268265', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"description\":\"sudo密码是123456\",\"envs\":[{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"PUID\",\"value\":\"1000\"},{\"key\":\"SUDO_PASSWORD\",\"value\":\"123456\"}],\"imageName\":\"1_python-base-vscode:1.0.0\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startCmd\":\"/init\",\"volume\":\"/config/workspace\"}}', 0, NULL, '2023-03-16 17:33:57');
INSERT INTO `sys_oper_log` VALUES (473, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.updateK8sConfigureByLabId()', 'PUT', 1, 'admin', NULL, '/k8s/configures/1678556268265', '127.0.0.1', '', '\"1678556268265\" {\"description\":\"sudo密码是123456\",\"envs\":[{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"PUID\",\"value\":\"1000\"},{\"key\":\"SUDO_PASSWORD\",\"value\":\"123456\"}],\"hasPublic\":false,\"imageName\":\"1_python-base-vscode:1.0.0\",\"labId\":\"1678556268265\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startCmd\":\"/init\",\"volume\":\"/config/workspace\"}', '{\"msg\":\"更新成功\",\"code\":200}', 0, NULL, '2023-03-16 17:34:12');
INSERT INTO `sys_oper_log` VALUES (474, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, 'admin', NULL, '/k8s/deployments/1678556268265/-1', '127.0.0.1', '', '\"1678556268265\" -1', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createBy\":\"admin\",\"deployNamespace\":\"codeonline-all\",\"deploymentName\":\"codeonline-deployment-1678556268265-1\",\"hasDestroy\":false,\"k8sConfigure\":{\"description\":\"sudo密码是123456\",\"envs\":[{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"PUID\",\"value\":\"1000\"},{\"key\":\"SUDO_PASSWORD\",\"value\":\"123456\"}],\"imageName\":\"10.135.128.18:30002/codeonline-all/1_python-base-vscode:1.0.0\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startCmd\":\"/init\",\"volume\":\"/config/workspace\"},\"labId\":\"1678556268265\",\"params\":{},\"serviceName\":\"codeonline-service-1678556268265-1\",\"teacherId\":1,\"updateBy\":\"admin\",\"userId\":1}}', 0, NULL, '2023-03-16 17:34:17');
INSERT INTO `sys_oper_log` VALUES (475, 'k8s控制', 3, 'com.codeonline.cloud.k8s.controller.K8sController.labDelete()', 'DELETE', 1, 'admin', NULL, '/k8s/labDelete/1678556268265/-1', '127.0.0.1', '', '{}', '{\"msg\":\"删除成功\",\"code\":200}', 0, NULL, '2023-03-16 17:35:31');
INSERT INTO `sys_oper_log` VALUES (476, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678556268265', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"description\":\"sudo密码是123456\",\"envs\":[{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"PUID\",\"value\":\"1000\"},{\"key\":\"SUDO_PASSWORD\",\"value\":\"123456\"}],\"imageName\":\"1_python-base-vscode:1.0.0\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startCmd\":\"/init\",\"volume\":\"/config/workspace\"}}', 0, NULL, '2023-03-16 17:35:40');
INSERT INTO `sys_oper_log` VALUES (477, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.updateK8sConfigureByLabId()', 'PUT', 1, 'admin', NULL, '/k8s/configures/1678556268265', '127.0.0.1', '', '\"1678556268265\" {\"description\":\"sudo密码是123456\",\"envs\":[{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"PUID\",\"value\":\"1000\"},{\"key\":\"SUDO_PASSWORD\",\"value\":\"123456\"}],\"hasPublic\":false,\"imageName\":\"1_python-base-vscode:1.0.0\",\"labId\":\"1678556268265\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startCmd\":\"/init\",\"volume\":\"\"}', '{\"msg\":\"更新成功\",\"code\":200}', 0, NULL, '2023-03-16 17:36:02');
INSERT INTO `sys_oper_log` VALUES (478, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, 'admin', NULL, '/k8s/deployments/1678556268265/-1', '127.0.0.1', '', '\"1678556268265\" -1', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createBy\":\"admin\",\"deployNamespace\":\"codeonline-all\",\"deploymentName\":\"codeonline-deployment-1678556268265-1\",\"hasDestroy\":false,\"k8sConfigure\":{\"description\":\"sudo密码是123456\",\"envs\":[{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"PUID\",\"value\":\"1000\"},{\"key\":\"SUDO_PASSWORD\",\"value\":\"123456\"}],\"imageName\":\"10.135.128.18:30002/codeonline-all/1_python-base-vscode:1.0.0\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startCmd\":\"/init\",\"volume\":\"\"},\"labId\":\"1678556268265\",\"params\":{},\"serviceName\":\"codeonline-service-1678556268265-1\",\"teacherId\":1,\"updateBy\":\"admin\",\"userId\":1}}', 0, NULL, '2023-03-16 17:36:06');
INSERT INTO `sys_oper_log` VALUES (479, 'k8s控制', 3, 'com.codeonline.cloud.k8s.controller.K8sController.labDelete()', 'DELETE', 1, 'admin', NULL, '/k8s/labDelete/1678556268265/-1', '127.0.0.1', '', '{}', '{\"msg\":\"删除成功\",\"code\":200}', 0, NULL, '2023-03-16 17:36:27');
INSERT INTO `sys_oper_log` VALUES (480, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678556268265', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"description\":\"sudo密码是123456\",\"envs\":[{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"PUID\",\"value\":\"1000\"},{\"key\":\"SUDO_PASSWORD\",\"value\":\"123456\"}],\"imageName\":\"1_python-base-vscode:1.0.0\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startCmd\":\"/init\",\"volume\":\"\"}}', 0, NULL, '2023-03-16 17:36:42');
INSERT INTO `sys_oper_log` VALUES (481, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.updateK8sConfigureByLabId()', 'PUT', 1, 'admin', NULL, '/k8s/configures/1678556268265', '127.0.0.1', '', '\"1678556268265\" {\"description\":\"sudo密码是123456\",\"envs\":[{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"PUID\",\"value\":\"1000\"},{\"key\":\"SUDO_PASSWORD\",\"value\":\"123456\"}],\"hasPublic\":false,\"imageName\":\"1_python-base-vscode:1.0.0\",\"labId\":\"1678556268265\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startCmd\":\"\",\"volume\":\"\"}', '{\"msg\":\"更新成功\",\"code\":200}', 0, NULL, '2023-03-16 17:36:49');
INSERT INTO `sys_oper_log` VALUES (482, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, 'admin', NULL, '/k8s/deployments/1678556268265/-1', '127.0.0.1', '', '\"1678556268265\" -1', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createBy\":\"admin\",\"deployNamespace\":\"codeonline-all\",\"deploymentName\":\"codeonline-deployment-1678556268265-1\",\"hasDestroy\":false,\"k8sConfigure\":{\"description\":\"sudo密码是123456\",\"envs\":[{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"PUID\",\"value\":\"1000\"},{\"key\":\"SUDO_PASSWORD\",\"value\":\"123456\"}],\"imageName\":\"10.135.128.18:30002/codeonline-all/1_python-base-vscode:1.0.0\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startCmd\":\"\",\"volume\":\"\"},\"labId\":\"1678556268265\",\"params\":{},\"serviceName\":\"codeonline-service-1678556268265-1\",\"teacherId\":1,\"updateBy\":\"admin\",\"userId\":1}}', 0, NULL, '2023-03-16 17:36:55');
INSERT INTO `sys_oper_log` VALUES (483, 'k8s控制', 3, 'com.codeonline.cloud.k8s.controller.K8sController.labDelete()', 'DELETE', 1, 'admin', NULL, '/k8s/labDelete/1678556268265/-1', '127.0.0.1', '', '{}', '{\"msg\":\"删除成功\",\"code\":200}', 0, NULL, '2023-03-16 17:50:59');
INSERT INTO `sys_oper_log` VALUES (484, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678943372804', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"envs\":[{\"key\":\"a\",\"value\":\"a\"}],\"imageName\":\"1_jupyter-base:1.0.0\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\',--NotebookApp.allow_origin=\\\"*\\\",--NotebookApp.open_browser=False\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"}}', 0, NULL, '2023-03-16 18:05:31');
INSERT INTO `sys_oper_log` VALUES (485, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, 'admin', NULL, '/k8s/deployments/1678943372804/-1', '127.0.0.1', '', '\"1678943372804\" -1', '{\"msg\":\"已经创建过了\",\"code\":500}', 0, NULL, '2023-03-16 18:05:37');
INSERT INTO `sys_oper_log` VALUES (486, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.labStart()', 'GET', 1, 'admin', NULL, '/k8s/labStart/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"port\":8888,\"service\":\"jupyter\",\"targetPort\":8888,\"nodePort\":30500,\"url\":\"http://10.135.128.18:30500\"}]}', 0, NULL, '2023-03-16 18:05:39');
INSERT INTO `sys_oper_log` VALUES (487, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.labStart()', 'GET', 1, 'admin', NULL, '/k8s/labStart/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"port\":8888,\"service\":\"jupyter\",\"targetPort\":8888,\"nodePort\":30500,\"url\":\"http://10.135.128.18:30500\"}]}', 0, NULL, '2023-03-16 18:08:42');
INSERT INTO `sys_oper_log` VALUES (488, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.labStart()', 'GET', 1, 'admin', NULL, '/k8s/labStart/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"port\":8888,\"service\":\"jupyter\",\"targetPort\":8888,\"nodePort\":30500,\"url\":\"http://10.135.128.18:30500\"}]}', 0, NULL, '2023-03-16 18:09:16');
INSERT INTO `sys_oper_log` VALUES (489, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.labStart()', 'GET', 1, 'admin', NULL, '/k8s/labStart/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"port\":8888,\"service\":\"jupyter\",\"targetPort\":8888,\"nodePort\":30500,\"url\":\"http://10.135.128.18:30500\"}]}', 0, NULL, '2023-03-16 18:10:48');
INSERT INTO `sys_oper_log` VALUES (490, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.labStart()', 'GET', 1, 'admin', NULL, '/k8s/labStart/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"port\":8888,\"service\":\"jupyter\",\"targetPort\":8888,\"nodePort\":30500,\"url\":\"http://10.135.128.18:30500\"}]}', 0, NULL, '2023-03-16 18:11:50');
INSERT INTO `sys_oper_log` VALUES (491, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.labStart()', 'GET', 1, 'admin', NULL, '/k8s/labStart/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"port\":8888,\"service\":\"jupyter\",\"targetPort\":8888,\"nodePort\":30500,\"url\":\"http://10.135.128.18:30500\"}]}', 0, NULL, '2023-03-16 18:12:02');
INSERT INTO `sys_oper_log` VALUES (492, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.labStart()', 'GET', 1, 'admin', NULL, '/k8s/labStart/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"port\":8888,\"service\":\"jupyter\",\"targetPort\":8888,\"nodePort\":30500,\"url\":\"http://10.135.128.18:30500\"}]}', 0, NULL, '2023-03-16 18:12:23');
INSERT INTO `sys_oper_log` VALUES (493, 'k8s控制', 3, 'com.codeonline.cloud.k8s.controller.K8sController.labDelete()', 'DELETE', 1, 'admin', NULL, '/k8s/labDelete/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"删除成功\",\"code\":200}', 0, NULL, '2023-03-16 18:18:02');
INSERT INTO `sys_oper_log` VALUES (494, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, '10002', NULL, '/k8s/deployments/1678943372804/-1', '127.0.0.1', '', '\"1678943372804\" -1', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createBy\":\"10002\",\"deployNamespace\":\"codeonline-all\",\"deploymentName\":\"codeonline-deployment-1678943372804-103\",\"hasDestroy\":false,\"k8sConfigure\":{\"envs\":[{\"key\":\"a\",\"value\":\"a\"}],\"imageName\":\"10.135.128.18:30002/codeonline-all/1_jupyter-base:1.0.0\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\',--NotebookApp.allow_origin=\\\"*\\\",--NotebookApp.open_browser=False\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"},\"labId\":\"1678943372804\",\"params\":{},\"serviceName\":\"codeonline-service-1678943372804-103\",\"teacherId\":1,\"updateBy\":\"10002\",\"userId\":103}}', 0, NULL, '2023-03-16 18:25:03');
INSERT INTO `sys_oper_log` VALUES (495, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.labStart()', 'GET', 1, '10002', NULL, '/k8s/labStart/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"port\":8888,\"service\":\"jupyter\",\"targetPort\":8888,\"nodePort\":30500,\"url\":\"http://10.135.128.18:30500\"}]}', 0, NULL, '2023-03-16 18:25:04');
INSERT INTO `sys_oper_log` VALUES (496, 'k8s控制', 3, 'com.codeonline.cloud.k8s.controller.K8sController.labDelete()', 'DELETE', 1, '10002', NULL, '/k8s/labDelete/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"删除成功\",\"code\":200}', 0, NULL, '2023-03-16 18:25:07');
INSERT INTO `sys_oper_log` VALUES (497, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, '10002', NULL, '/k8s/deployments/1678943372804/-1', '127.0.0.1', '', '\"1678943372804\" -1', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createBy\":\"10002\",\"deployNamespace\":\"codeonline-all\",\"deploymentName\":\"codeonline-deployment-1678943372804-103\",\"hasDestroy\":false,\"k8sConfigure\":{\"envs\":[{\"key\":\"a\",\"value\":\"a\"}],\"imageName\":\"10.135.128.18:30002/codeonline-all/1_jupyter-base:1.0.0\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\',--NotebookApp.allow_origin=\\\"*\\\",--NotebookApp.open_browser=False\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"},\"labId\":\"1678943372804\",\"params\":{},\"serviceName\":\"codeonline-service-1678943372804-103\",\"teacherId\":1,\"updateBy\":\"10002\",\"userId\":103}}', 0, NULL, '2023-03-16 18:25:21');
INSERT INTO `sys_oper_log` VALUES (498, 'k8s控制', 3, 'com.codeonline.cloud.k8s.controller.K8sController.labDelete()', 'DELETE', 1, '10002', NULL, '/k8s/labDelete/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"删除成功\",\"code\":200}', 0, NULL, '2023-03-16 18:26:18');
INSERT INTO `sys_oper_log` VALUES (499, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.createK8sDeploy()', 'POST', 1, 'admin', NULL, '/k8s/deployments/1678943372804/-1', '127.0.0.1', '', '\"1678943372804\" -1', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createBy\":\"admin\",\"deployNamespace\":\"codeonline-all\",\"deploymentName\":\"codeonline-deployment-1678943372804-1\",\"hasDestroy\":false,\"k8sConfigure\":{\"envs\":[{\"key\":\"a\",\"value\":\"a\"}],\"imageName\":\"10.135.128.18:30002/codeonline-all/1_jupyter-base:1.0.0\",\"ports\":[{\"port\":\"8888\",\"targetPort\":\"8888\",\"service\":\"jupyter\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startArgs\":\"jupyter,notebook,--NotebookApp.token=\'\',--NotebookApp.allow_origin=\\\"*\\\",--NotebookApp.open_browser=False\",\"startCmd\":\"start.sh\",\"volume\":\"/home/jovyan/\"},\"labId\":\"1678943372804\",\"params\":{},\"serviceName\":\"codeonline-service-1678943372804-1\",\"teacherId\":1,\"updateBy\":\"admin\",\"userId\":1}}', 0, NULL, '2023-03-16 19:01:03');
INSERT INTO `sys_oper_log` VALUES (500, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.labStart()', 'GET', 1, 'admin', NULL, '/k8s/labStart/1678943372804/-1', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"port\":8888,\"service\":\"jupyter\",\"targetPort\":8888,\"nodePort\":30500,\"url\":\"http://10.135.128.18:30500\"}]}', 0, NULL, '2023-03-16 19:01:03');
INSERT INTO `sys_oper_log` VALUES (501, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678556268265', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"description\":\"sudo密码是123456\",\"envs\":[{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"PUID\",\"value\":\"1000\"},{\"key\":\"SUDO_PASSWORD\",\"value\":\"123456\"}],\"imageName\":\"1_python-base-vscode:1.0.0\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startCmd\":\"\",\"volume\":\"\"}}', 0, NULL, '2023-03-17 23:55:25');
INSERT INTO `sys_oper_log` VALUES (502, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.updateK8sConfigureByLabId()', 'PUT', 1, 'admin', NULL, '/k8s/configures/1678556268265', '127.0.0.1', '', '\"1678556268265\" {\"description\":\"sudo密码是123456\",\"envs\":[{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"PUID\",\"value\":\"1000\"},{\"key\":\"SUDO_PASSWORD\",\"value\":\"123456\"}],\"hasPublic\":false,\"imageName\":\"1_python-base-vscode:1.0.0\",\"labId\":\"1678556268265\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startCmd\":\"\",\"volume\":\"\"}', '{\"msg\":\"更新成功\",\"code\":200}', 0, NULL, '2023-03-17 23:55:46');
INSERT INTO `sys_oper_log` VALUES (503, 'k8s控制', 1, 'com.codeonline.cloud.k8s.controller.K8sController.getK8sConfigureByLabId()', 'GET', 1, 'admin', NULL, '/k8s/configures/lab/1678556268265', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"description\":\"sudo密码是123456\",\"envs\":[{\"key\":\"PGID\",\"value\":\"1000\"},{\"key\":\"PUID\",\"value\":\"1000\"},{\"key\":\"SUDO_PASSWORD\",\"value\":\"123456\"}],\"imageName\":\"1_python-base-vscode:1.0.0\",\"ports\":[{\"port\":\"8443\",\"targetPort\":\"8443\",\"service\":\"vscode\"}],\"privilege\":true,\"sourceFrom\":\"harbor\",\"startCmd\":\"\",\"volume\":\"\"}}', 0, NULL, '2023-03-17 23:57:51');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-02-07 16:17:23', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-02-07 16:17:23', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-02-07 16:17:23', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '管理员', 'common_admin', 2, '2', 1, 1, '0', '0', 'admin', '2023-02-07 16:17:23', 'admin', '2023-02-07 18:55:23', '管理员');
INSERT INTO `sys_role` VALUES (100, '老师', 'teacher', 3, '1', 1, 1, '0', '0', 'admin', '2023-02-07 18:33:50', 'admin', '2023-02-07 18:56:15', '老师');
INSERT INTO `sys_role` VALUES (101, '学生', 'student', 4, '1', 1, 1, '0', '0', 'admin', '2023-02-07 18:57:23', 'admin', '2023-02-07 19:32:22', '学生');
INSERT INTO `sys_role` VALUES (102, '注册用户', 'common', 5, '1', 1, 1, '0', '0', 'admin', '2023-02-07 19:02:38', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2012);
INSERT INTO `sys_role_menu` VALUES (2, 2013);
INSERT INTO `sys_role_menu` VALUES (2, 2014);
INSERT INTO `sys_role_menu` VALUES (2, 2015);
INSERT INTO `sys_role_menu` VALUES (2, 2016);
INSERT INTO `sys_role_menu` VALUES (2, 2017);
INSERT INTO `sys_role_menu` VALUES (2, 2018);
INSERT INTO `sys_role_menu` VALUES (2, 2019);
INSERT INTO `sys_role_menu` VALUES (2, 2020);
INSERT INTO `sys_role_menu` VALUES (2, 2021);
INSERT INTO `sys_role_menu` VALUES (2, 2022);
INSERT INTO `sys_role_menu` VALUES (2, 2023);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 1000);
INSERT INTO `sys_role_menu` VALUES (100, 1001);
INSERT INTO `sys_role_menu` VALUES (100, 1002);
INSERT INTO `sys_role_menu` VALUES (100, 1003);
INSERT INTO `sys_role_menu` VALUES (100, 1004);
INSERT INTO `sys_role_menu` VALUES (100, 1005);
INSERT INTO `sys_role_menu` VALUES (100, 1006);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2017);
INSERT INTO `sys_role_menu` VALUES (100, 2018);
INSERT INTO `sys_role_menu` VALUES (100, 2019);
INSERT INTO `sys_role_menu` VALUES (100, 2020);
INSERT INTO `sys_role_menu` VALUES (100, 2021);
INSERT INTO `sys_role_menu` VALUES (100, 2022);
INSERT INTO `sys_role_menu` VALUES (100, 2023);
INSERT INTO `sys_role_menu` VALUES (101, 2004);
INSERT INTO `sys_role_menu` VALUES (101, 2005);
INSERT INTO `sys_role_menu` VALUES (101, 2012);
INSERT INTO `sys_role_menu` VALUES (101, 2013);
INSERT INTO `sys_role_menu` VALUES (101, 2014);
INSERT INTO `sys_role_menu` VALUES (101, 2015);
INSERT INTO `sys_role_menu` VALUES (101, 2019);
INSERT INTO `sys_role_menu` VALUES (101, 2020);
INSERT INTO `sys_role_menu` VALUES (101, 2021);
INSERT INTO `sys_role_menu` VALUES (101, 2023);
INSERT INTO `sys_role_menu` VALUES (102, 2024);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-02-07 16:17:23', 'admin', '2023-02-07 16:17:23', '', NULL, '管理员');
INSERT INTO `sys_user` VALUES (2, 100, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-02-07 16:17:23', 'admin', '2023-02-07 16:17:23', 'admin', '2023-02-08 03:47:17', '测试员');
INSERT INTO `sys_user` VALUES (100, 101, 'zhangsan', '张三', '00', '', '', '0', '', '$2a$10$DIyu6UTyXtwQqnp5KPR8Ue7cYJ2rpPqOiYJ75yqbPdPC9JSOHU8uy', '0', '0', '', NULL, 'admin', '2023-02-07 19:25:16', 'admin', '2023-02-08 03:47:38', NULL);
INSERT INTO `sys_user` VALUES (101, 103, 'zc', 'zc', '00', '', '', '0', '', '$2a$10$3BiCFx8FJkehq8pSb1w6luIQgFOzqoVBMmvYkTGuRQuTI1r7XtgAW', '0', '0', '', NULL, '', '2023-02-07 19:42:59', 'admin', '2023-03-11 10:46:40', NULL);
INSERT INTO `sys_user` VALUES (102, 104, '10001', '10001', '00', '', '', '0', '', '$2a$10$/.uZjQUUYlvIE.vgD52VDeZyqa99X1P2KZgsQL.svzVjKig6Oy/zy', '0', '0', '', NULL, '', '2023-02-07 20:08:15', 'admin', '2023-03-11 10:46:53', NULL);
INSERT INTO `sys_user` VALUES (103, 103, '10002', '10002', '00', '', '', '0', '', '$2a$10$0XfhFHvnL997480HpW05ce9mfyz9K/KgVfEx2DTV51yVm9Nm5yM7e', '0', '0', '', NULL, '', '2023-02-07 20:10:03', 'admin', '2023-03-11 10:47:27', NULL);
INSERT INTO `sys_user` VALUES (104, 103, '10004', '10004', '00', '', '', '0', '', '$2a$10$SvGwiHiH2zcZ2VpoRP9rVOt1l44GbIWoWcOtEkri.Z8DiJAjwVyHO', '0', '0', '', NULL, '', '2023-02-07 20:10:53', 'admin', '2023-03-11 10:47:15', NULL);
INSERT INTO `sys_user` VALUES (105, 201, 'student', 'student', '00', '', '', '0', '', '$2a$10$/2YevNMGelSBorcMOSNa8useeNAk8Jssu0njhKOjgjZD5yxwrlnHi', '0', '0', '', NULL, '', '2023-02-08 20:11:06', 'admin', '2023-03-11 10:47:41', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 100);
INSERT INTO `sys_user_role` VALUES (101, 101);
INSERT INTO `sys_user_role` VALUES (102, 101);
INSERT INTO `sys_user_role` VALUES (103, 101);
INSERT INTO `sys_user_role` VALUES (104, 101);
INSERT INTO `sys_user_role` VALUES (105, 101);

SET FOREIGN_KEY_CHECKS = 1;
