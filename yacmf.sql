/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : yacmf

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-09-27 14:51:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'wangszh@163.com', '$2y$10$69OGBUPXlis1yrPUsaCLNeAWmwkG5jDF1FZ4pkPaspgrS4FnUVh3e', null, '2016-06-29 15:01:17', '2016-06-29 15:01:17');

-- ----------------------------
-- Table structure for yascmf_contents
-- ----------------------------
DROP TABLE IF EXISTS `yascmf_contents`;
CREATE TABLE `yascmf_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `flag` varchar(15) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '推荐位',
  `title` varchar(80) COLLATE utf8_unicode_ci NOT NULL COMMENT '文章/单页/碎片/备忘标题',
  `thumb` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文章/单页缩略图',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '文章/单页/碎片/备忘正文',
  `slug` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '网址缩略名，文章、单页与碎片模型有缩略名，其它模型暂无',
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'article' COMMENT '内容类型：article文章模型 page单页模型 fragment碎片模型 memo备忘模型',
  `user_id` int(12) NOT NULL DEFAULT '0' COMMENT '文章编辑用户id',
  `is_top` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否置顶：1置顶，0不置顶',
  `owner_id` int(12) unsigned DEFAULT '0' COMMENT '归属用户id:一般备忘有归属用户id，0表示无任何归属',
  `outer_link` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外链地址',
  `category_id` int(10) NOT NULL COMMENT '文章分类id',
  `deleted_at` datetime DEFAULT NULL COMMENT '被软删除时间',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改更新时间',
  `tag_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_slug_unique` (`slug`),
  KEY `content_title_index` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='内容数据（文章/单页/碎片/备忘）表';

-- ----------------------------
-- Records of yascmf_contents
-- ----------------------------
INSERT INTO `yascmf_contents` VALUES ('2', '', '关于', '', '&lt;blockquote&gt;&nbsp;&lt;/blockquote&gt;\r\n\r\n&lt;blockquote&gt;&lt;span style=&quot;font-family:sans-serif,arial,verdana,trebuchet ms; line-height:1.6&quot;&gt;如需反馈问题、提出意见或建议，请通过以下方式联系作者。&lt;/span&gt;&lt;/blockquote&gt;\r\n\r\n&lt;p&gt;&nbsp; &nbsp; &nbsp; Email：430009621@qq.com&nbsp;(请将#换成@，&amp;换成.)&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp; &nbsp; &nbsp;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp; &nbsp; &nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&nbsp;&lt;/p&gt;\r\n', 'about', 'page', '1', '0', '0', '', '0', null, '2015-02-09 15:48:58', '2016-09-22 09:58:08', null);
INSERT INTO `yascmf_contents` VALUES ('14', 'l,h,', '妖精的尾巴', '', '&lt;p&gt;&lt;a&gt;http://music.163.com/#/playlist?id=2061063&lt;/a&gt;&lt;/p&gt;\r\n', '14', 'article', '1', '0', '0', '', '3', null, '2016-09-22 10:14:53', '2016-09-22 10:34:27', null);
INSERT INTO `yascmf_contents` VALUES ('15', 'l,h,', 'PHPhub', '', '&lt;p&gt;&lt;a&gt;https://laravel-china.org/&lt;/a&gt;&lt;/p&gt;\r\n', '15', 'article', '1', '0', '0', '', '1', null, '2016-09-22 10:15:49', '2016-09-22 10:36:04', null);
INSERT INTO `yascmf_contents` VALUES ('16', 'l,', '[更新啦] PHP 5.4+ 后台开发脚手架，求 star ；)', '', '&lt;p&gt;&lt;a&gt;https://laravel-china.org/topics/2363&lt;/a&gt;&lt;/p&gt;\r\n', '16', 'article', '1', '0', '0', '', '1', null, '2016-09-22 10:16:59', '2016-09-22 10:35:46', null);
INSERT INTO `yascmf_contents` VALUES ('17', 'h,', '使用 Laravel-Administrator 快速生成数据模型管理员后台教程', '', '&lt;p&gt;说明&lt;/p&gt;\r\n\r\n&lt;p&gt;不久前开源了团队内部&nbsp;改良过的Administrator&nbsp;，很多朋友在集成的时候遇到问题，这里写一个简单的教程，演示如何一步步集成 Administrator 到现有的项目中。&lt;/p&gt;\r\n\r\n&lt;p&gt;Demo 代码：https://github.com/summerblue/administrator-demo&lt;/p&gt;\r\n\r\n&lt;p&gt;准备&lt;/p&gt;\r\n\r\n&lt;p&gt;假设有一套博客程序，博客程序有数据模型&nbsp;User&nbsp;和&nbsp;Topic&nbsp;，我们需要为这两个数据模型开启后台编辑功能。&lt;/p&gt;\r\n\r\n&lt;p&gt;为了方便演示，做了一份&nbsp;实例代码，可以跟着做，这个提交&nbsp;2eb50160dd&nbsp;的状态是已经创建好&nbsp;User&nbsp;和&nbsp;Topic&nbsp;数据模型、迁移文件，并且有对应的&nbsp;数据填充。&lt;/p&gt;\r\n\r\n&lt;p&gt;使用以下命令安装即可：&lt;/p&gt;\r\n\r\n&lt;p&gt;composer install&lt;br /&gt;\r\nphp artisan migrate&lt;br /&gt;\r\nphp artisan db:seed&lt;/p&gt;\r\n\r\n&lt;p&gt;简要步骤&lt;/p&gt;\r\n\r\n&lt;p&gt;安装 administrator；&lt;br /&gt;\r\n配置；&lt;br /&gt;\r\nModel 配置信息。&lt;/p&gt;\r\n\r\n&lt;p&gt;1. 安装 administrator&lt;/p&gt;\r\n\r\n&lt;p&gt;composer require &quot;summerblue/administrator:^1.0&quot;&lt;/p&gt;\r\n\r\n&lt;p&gt;[file]&lt;/p&gt;\r\n\r\n&lt;p&gt;2. 配置&lt;br /&gt;\r\n1). 编辑&nbsp;config/app.php&nbsp;在&nbsp;providers&nbsp;数组里面增加:&lt;/p&gt;\r\n\r\n&lt;p&gt;&#39;providers&#39; =&gt; [ Frozennode\\Administrator\\AdministratorServiceProvider::class, ]&lt;/p&gt;\r\n\r\n&lt;p&gt;2). 执行以下命令生成 config 信息：&lt;/p&gt;\r\n\r\n&lt;p&gt;php artisan vendor:publish&lt;/p&gt;\r\n\r\n&lt;p&gt;3). 创建 Administrator 配置信息存放文件夹&lt;/p&gt;\r\n\r\n&lt;p&gt;创建以下两个文件夹：&lt;/p&gt;\r\n\r\n&lt;p&gt;config/administrator&nbsp;- 数据模型配置信息存放目录&lt;br /&gt;\r\nconfig/administrator/settings&nbsp;- 设置信息存放目录&lt;/p&gt;\r\n\r\n&lt;p&gt;3. Model 配置信息&lt;br /&gt;\r\n1). administrator.php 文件夹中增加数据模型入口&lt;/p&gt;\r\n\r\n&lt;p&gt;找到 menu 选项：&lt;/p&gt;\r\n\r\n&lt;p&gt;&#39;menu&#39; =&gt; [ &#39;用户管理&#39; =&gt; [ &#39;users&#39; // 对应需要创建的文件：`config/administrator/users.php` ], &#39;内容管理&#39; =&gt; [ &#39;posts&#39; // 对应需要创建的文件：`config/administrator/posts.php` ] ],&lt;/p&gt;\r\n\r\n&lt;p&gt;为了方便演示，找到&nbsp;permission&nbsp;选项，retuen true，注意上线必须修改过来，这里是后台访问权限控制。&lt;/p&gt;\r\n\r\n&lt;p&gt;&#39;permission&#39; =&gt; function () { // return Auth::check(); return true; },&lt;/p&gt;\r\n\r\n&lt;p&gt;如下图:&lt;br /&gt;\r\n[file]&lt;/p&gt;\r\n\r\n&lt;p&gt;还有一个选项也是必填的，如下填入即可，这个选项是用来配置进入后台默认的页面：&lt;/p&gt;\r\n\r\n&lt;p&gt;&#39;home_page&#39; =&gt; &#39;posts&#39;,&lt;/p&gt;\r\n\r\n&lt;p&gt;2). 数据模型配置选项&lt;/p&gt;\r\n\r\n&lt;p&gt;创建与模型对应的配置文件：&lt;/p&gt;\r\n\r\n&lt;p&gt;config/administrator/posts.php&nbsp;内容见下面&lt;br /&gt;\r\nconfig/administrator/users.php&nbsp;篇幅原因，内容请见 GitHub 项目&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;?php use App\\Post; return [ &#39;title&#39; =&gt; &#39;文章&#39;, &#39;heading&#39; =&gt; &#39;文章管理&#39;, &#39;single&#39; =&gt; &#39;文章&#39;, &#39;model&#39; =&gt; Post::class, &#39;columns&#39; =&gt; [ &#39;id&#39; =&gt; [ &#39;title&#39; =&gt; &#39;ID&#39; ], &#39;title&#39; =&gt; [ &#39;title&#39; =&gt; &#39;Title&#39;, ], &#39;body&#39; =&gt; [ &#39;title&#39; =&gt; &#39;Content&#39;, &#39;sortable&#39; =&gt; false, &#39;output&#39; =&gt; function($value) { return str_limit($value); }, ], &#39;user_name&#39; =&gt; [ &#39;title&#39; =&gt; &quot;Author&quot;, &#39;relationship&#39; =&gt; &#39;user&#39;, //this is the name of the Eloquent relationship method! &#39;select&#39; =&gt; &quot;(:table).name&quot;, ], &#39;created_at&#39;, &#39;operation&#39; =&gt; [ &#39;title&#39; =&gt; &#39;管理&#39;, &#39;output&#39; =&gt; function ($value, $model) { return $value; }, &#39;sortable&#39; =&gt; false, ], ], &#39;edit_fields&#39; =&gt; [ &#39;title&#39; =&gt; [ &#39;title&#39; =&gt; &#39;标题&#39;, &#39;type&#39; =&gt; &#39;text&#39; ], &#39;body&#39; =&gt; [ &#39;title&#39; =&gt; &#39;内容&#39;, &#39;type&#39; =&gt; &#39;textarea&#39; ], &#39;user&#39; =&gt; array( &#39;type&#39; =&gt; &#39;relationship&#39;, &#39;title&#39; =&gt; &#39;Author&#39;, &#39;name_field&#39; =&gt; &#39;name&#39;, ) ], &#39;filters&#39; =&gt; [ &#39;title&#39; =&gt; [ &#39;title&#39; =&gt; &#39;标题&#39;, ] ], ];&lt;/p&gt;\r\n\r\n&lt;p&gt;这时候访问后台：&lt;/p&gt;\r\n\r\n&lt;p&gt;[file]&lt;/p&gt;\r\n\r\n&lt;p&gt;一些信息&lt;/p&gt;\r\n\r\n&lt;p&gt;administrator 支持多语言，修改&nbsp;config/app.php&nbsp;的 &#39;locale&#39; =&gt; &#39;zh-CN&#39; 可使用中文；&lt;br /&gt;\r\n文档就在项目的 docs 里，也可以&nbsp;点击这里&nbsp;查看，&nbsp;实例文件&nbsp;知道一看；&lt;br /&gt;\r\n想要灵活使用 administrator，文档&nbsp;至少得多过几遍；&lt;br /&gt;\r\n想要查看更多的用例，PHPHub&nbsp;的后台就是使用 administrator 构建，请参阅。&lt;/p&gt;\r\n', null, 'article', '1', '0', '0', '', '1', null, '2016-09-22 10:18:38', '2016-09-22 10:18:38', null);
INSERT INTO `yascmf_contents` VALUES ('18', 'l,', 'Git 那些事儿', '', '&lt;p&gt;&lt;a&gt;https://laravel-china.org/topics/2228&lt;/a&gt;&lt;/p&gt;\r\n', '18', 'article', '1', '0', '0', '', '1', null, '2016-09-22 10:19:39', '2016-09-22 10:35:16', null);
INSERT INTO `yascmf_contents` VALUES ('20', '', '分享一个基于 Laravel5.1 开发的后台管理框架', '', '&lt;p&gt;&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a&gt;https://laravel-china.org/topics/2309&lt;/a&gt;&lt;/p&gt;\r\n', null, 'article', '1', '0', '0', '', '1', null, '2016-09-22 10:37:51', '2016-09-22 10:37:51', null);

-- ----------------------------
-- Table structure for yascmf_flags
-- ----------------------------
DROP TABLE IF EXISTS `yascmf_flags`;
CREATE TABLE `yascmf_flags` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `attr` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT '属性名',
  `attr_full_name` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '属性全称名',
  `display_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '展示名',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of yascmf_flags
-- ----------------------------
INSERT INTO `yascmf_flags` VALUES ('1', 'l', 'link', '链接', '可用于友情链接');
INSERT INTO `yascmf_flags` VALUES ('2', 'f', 'flash', '幻灯', '可用于页面幻灯片模型');
INSERT INTO `yascmf_flags` VALUES ('3', 's', 'scrolling', '滚动', '可用于页面滚动效果的文章');
INSERT INTO `yascmf_flags` VALUES ('4', 'h', 'hot', '热门', '可用于页面推荐性文章');

-- ----------------------------
-- Table structure for yascmf_metas
-- ----------------------------
DROP TABLE IF EXISTS `yascmf_metas`;
CREATE TABLE `yascmf_metas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'meta名',
  `thumb` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'meta缩略图',
  `slug` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'meta缩略名',
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'category' COMMENT 'meta类型: [category]-分类，[tag]-标签',
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'meta描述',
  `count` int(10) unsigned DEFAULT '0' COMMENT 'meta被使用的次数',
  `sort` int(6) unsigned DEFAULT '0' COMMENT 'meta排序，数字越大排序越靠前',
  `pid` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name_index` (`name`),
  KEY `slug_index` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='META元数据（分类|标签） 表';

-- ----------------------------
-- Records of yascmf_metas
-- ----------------------------
INSERT INTO `yascmf_metas` VALUES ('1', 'PHP', null, 'default', 'category', '默认', '0', '0', '0');
INSERT INTO `yascmf_metas` VALUES ('2', 'LINUX', null, 'soft', 'category', '收录个人开发的软件或脚本', '0', '0', '0');
INSERT INTO `yascmf_metas` VALUES ('3', '文档', null, 'docs', 'category', '这里收录自己开发过程中所撰写的文档', '0', '0', '0');
INSERT INTO `yascmf_metas` VALUES ('11', 'Delphi', null, 'delphi', 'category', 'Delphi', '0', '0', '0');

-- ----------------------------
-- Table structure for yascmf_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `yascmf_password_resets`;
CREATE TABLE `yascmf_password_resets` (
  `email` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `token` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT '会话token',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of yascmf_password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for yascmf_permissions
-- ----------------------------
DROP TABLE IF EXISTS `yascmf_permissions`;
CREATE TABLE `yascmf_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '权限名',
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '权限展示名',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='权限信息表';

-- ----------------------------
-- Records of yascmf_permissions
-- ----------------------------
INSERT INTO `yascmf_permissions` VALUES ('1', 'manage_contents', '管理内容', null, '2014-12-22 02:30:59', '2014-12-22 02:30:59');
INSERT INTO `yascmf_permissions` VALUES ('2', 'manage_users', '管理用户', null, '2014-12-22 02:30:59', '2014-12-22 02:30:59');
INSERT INTO `yascmf_permissions` VALUES ('3', 'manage_system', '管理系统', null, '2015-02-04 09:40:56', '2015-02-04 09:40:59');

-- ----------------------------
-- Table structure for yascmf_permission_role
-- ----------------------------
DROP TABLE IF EXISTS `yascmf_permission_role`;
CREATE TABLE `yascmf_permission_role` (
  `permission_id` int(10) unsigned NOT NULL COMMENT '权限id',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色id',
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='权限与用户组角色对应关系表';

-- ----------------------------
-- Records of yascmf_permission_role
-- ----------------------------
INSERT INTO `yascmf_permission_role` VALUES ('1', '2');
INSERT INTO `yascmf_permission_role` VALUES ('1', '3');
INSERT INTO `yascmf_permission_role` VALUES ('2', '1');
INSERT INTO `yascmf_permission_role` VALUES ('2', '2');
INSERT INTO `yascmf_permission_role` VALUES ('3', '1');
INSERT INTO `yascmf_permission_role` VALUES ('3', '2');

-- ----------------------------
-- Table structure for yascmf_relationships
-- ----------------------------
DROP TABLE IF EXISTS `yascmf_relationships`;
CREATE TABLE `yascmf_relationships` (
  `cid` int(10) unsigned NOT NULL COMMENT '内容数据id',
  `mid` int(10) unsigned NOT NULL COMMENT 'meta元数据id',
  PRIMARY KEY (`cid`,`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='内容与元数据关系联系表[考虑查询复杂度，目前只存储文章单页跟标签的关系]';

-- ----------------------------
-- Records of yascmf_relationships
-- ----------------------------

-- ----------------------------
-- Table structure for yascmf_roles
-- ----------------------------
DROP TABLE IF EXISTS `yascmf_roles`;
CREATE TABLE `yascmf_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色名',
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色展示名',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色描述',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户组角色表';

-- ----------------------------
-- Records of yascmf_roles
-- ----------------------------
INSERT INTO `yascmf_roles` VALUES ('1', 'Founder', '创始人', null, '2014-12-22 02:30:59', '2014-12-22 02:30:59');
INSERT INTO `yascmf_roles` VALUES ('2', 'Admin', '超级管理员', null, '2014-12-22 02:30:59', '2014-12-22 02:30:59');
INSERT INTO `yascmf_roles` VALUES ('3', 'Editor', '编辑', null, '2015-02-04 17:12:22', '2015-02-04 17:12:22');
INSERT INTO `yascmf_roles` VALUES ('4', 'Demo', '演示', null, '2015-02-04 17:13:03', '2015-02-04 17:13:03');

-- ----------------------------
-- Table structure for yascmf_role_user
-- ----------------------------
DROP TABLE IF EXISTS `yascmf_role_user`;
CREATE TABLE `yascmf_role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id_foreign` (`role_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of yascmf_role_user
-- ----------------------------
INSERT INTO `yascmf_role_user` VALUES ('1', '2');

-- ----------------------------
-- Table structure for yascmf_settings
-- ----------------------------
DROP TABLE IF EXISTS `yascmf_settings`;
CREATE TABLE `yascmf_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '设置项名',
  `value` text COLLATE utf8_unicode_ci COMMENT '设置项值',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 0未启用 1启用 其它数字表示异常',
  `type_id` int(12) DEFAULT '0' COMMENT '设置所属类型id 0表示无任何归属类型',
  `sort` int(6) unsigned DEFAULT '0' COMMENT '设置排序，数字越大排序越靠前',
  PRIMARY KEY (`id`),
  KEY `setting_name_index` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='动态设置表';

-- ----------------------------
-- Records of yascmf_settings
-- ----------------------------
INSERT INTO `yascmf_settings` VALUES ('1', 'default_setting', '默认设置', '1', '1', '999');
INSERT INTO `yascmf_settings` VALUES ('2', 'system', '系统', '1', '2', '0');
INSERT INTO `yascmf_settings` VALUES ('3', 'manager', '管理员', '1', '2', '0');
INSERT INTO `yascmf_settings` VALUES ('4', 'content', '内容', '1', '2', '0');
INSERT INTO `yascmf_settings` VALUES ('5', 'upload', '上传', '1', '2', '0');
INSERT INTO `yascmf_settings` VALUES ('6', 'article', '文章', '1', '3', '0');
INSERT INTO `yascmf_settings` VALUES ('7', 'page', '单页', '1', '3', '0');
INSERT INTO `yascmf_settings` VALUES ('8', 'fragment', '碎片', '1', '3', '0');
INSERT INTO `yascmf_settings` VALUES ('9', 'memo', '备忘', '1', '3', '0');
INSERT INTO `yascmf_settings` VALUES ('10', 'Founder', '创始人', '1', '4', '0');
INSERT INTO `yascmf_settings` VALUES ('11', 'Admin', '超级管理员', '1', '4', '0');
INSERT INTO `yascmf_settings` VALUES ('12', 'Editor', '编辑', '1', '4', '0');
INSERT INTO `yascmf_settings` VALUES ('13', 'Demo', '演示', '1', '4', '0');

-- ----------------------------
-- Table structure for yascmf_setting_type
-- ----------------------------
DROP TABLE IF EXISTS `yascmf_setting_type`;
CREATE TABLE `yascmf_setting_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '设置类型项名',
  `value` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '设置类型项值',
  `sort` int(6) unsigned DEFAULT '0' COMMENT '设置类型排序，数字越大排序越靠前',
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting_type_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='动态设置类型表';

-- ----------------------------
-- Records of yascmf_setting_type
-- ----------------------------
INSERT INTO `yascmf_setting_type` VALUES ('1', 'default', '默认', '0');
INSERT INTO `yascmf_setting_type` VALUES ('2', 'system_operation', '系统操作类型', '0');
INSERT INTO `yascmf_setting_type` VALUES ('3', 'content_type', '内容类型', '0');
INSERT INTO `yascmf_setting_type` VALUES ('4', 'role_type', '角色类型', '0');

-- ----------------------------
-- Table structure for yascmf_system_log
-- ----------------------------
DROP TABLE IF EXISTS `yascmf_system_log`;
CREATE TABLE `yascmf_system_log` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '系统日志id',
  `user_id` int(12) DEFAULT '0' COMMENT '用户id（为0表示系统级操作，其它一般为管理型用户操作）',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'system' COMMENT '操作类型',
  `url` varchar(200) COLLATE utf8_unicode_ci DEFAULT '-' COMMENT '操作发起的url',
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作内容',
  `operator_ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作者ip',
  `deleted_at` datetime DEFAULT NULL COMMENT '被软删除时间',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统日志表';

-- ----------------------------
-- Records of yascmf_system_log
-- ----------------------------
INSERT INTO `yascmf_system_log` VALUES ('1', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '127.0.0.1', null, '2016-05-19 14:21:38', '2016-05-19 14:21:38');
INSERT INTO `yascmf_system_log` VALUES ('2', '1', 'upload', 'http://localhost:8000/admin/upload', '管理员：上传了图片文件，图片原始文件名：Chrysanthemum.jpg，上传之后保存在服务器路径为http://localhost:8000/uploads/content/20160519/573d5bdf76183_27o.jpg。', '127.0.0.1', null, '2016-05-19 14:23:27', '2016-05-19 14:23:27');
INSERT INTO `yascmf_system_log` VALUES ('3', '1', 'manager', 'http://localhost:8000/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '127.0.0.1', null, '2016-05-19 14:29:10', '2016-05-19 14:29:10');
INSERT INTO `yascmf_system_log` VALUES ('4', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '127.0.0.1', null, '2016-05-19 14:30:43', '2016-05-19 14:30:43');
INSERT INTO `yascmf_system_log` VALUES ('5', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '127.0.0.1', null, '2016-05-24 15:08:11', '2016-05-24 15:08:11');
INSERT INTO `yascmf_system_log` VALUES ('6', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '127.0.0.1', null, '2016-05-25 09:37:27', '2016-05-25 09:37:27');
INSERT INTO `yascmf_system_log` VALUES ('7', '1', 'manager', 'http://localhost:8000/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '127.0.0.1', null, '2016-05-25 10:02:46', '2016-05-25 10:02:46');
INSERT INTO `yascmf_system_log` VALUES ('8', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '127.0.0.1', null, '2016-05-25 10:02:56', '2016-05-25 10:02:56');
INSERT INTO `yascmf_system_log` VALUES ('9', '1', 'manager', 'http://localhost:8000/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '127.0.0.1', null, '2016-05-25 10:03:59', '2016-05-25 10:03:59');
INSERT INTO `yascmf_system_log` VALUES ('10', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '127.0.0.1', null, '2016-05-25 10:04:08', '2016-05-25 10:04:08');
INSERT INTO `yascmf_system_log` VALUES ('11', '1', 'manager', 'http://localhost:8000/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '127.0.0.1', null, '2016-05-25 10:05:42', '2016-05-25 10:05:42');
INSERT INTO `yascmf_system_log` VALUES ('12', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '127.0.0.1', null, '2016-05-25 10:05:51', '2016-05-25 10:05:51');
INSERT INTO `yascmf_system_log` VALUES ('13', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '127.0.0.1', null, '2016-05-25 13:08:43', '2016-05-25 13:08:43');
INSERT INTO `yascmf_system_log` VALUES ('14', '1', 'manager', 'http://localhost:8000/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '127.0.0.1', null, '2016-05-25 14:01:23', '2016-05-25 14:01:23');
INSERT INTO `yascmf_system_log` VALUES ('15', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '127.0.0.1', null, '2016-05-25 14:02:35', '2016-05-25 14:02:35');
INSERT INTO `yascmf_system_log` VALUES ('16', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '127.0.0.1', null, '2016-05-26 09:15:24', '2016-05-26 09:15:24');
INSERT INTO `yascmf_system_log` VALUES ('17', '1', 'manager', 'http://localhost:8000/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '127.0.0.1', null, '2016-05-26 11:01:25', '2016-05-26 11:01:25');
INSERT INTO `yascmf_system_log` VALUES ('18', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '127.0.0.1', null, '2016-05-26 11:01:46', '2016-05-26 11:01:46');
INSERT INTO `yascmf_system_log` VALUES ('19', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '127.0.0.1', null, '2016-06-07 09:27:57', '2016-06-07 09:27:57');
INSERT INTO `yascmf_system_log` VALUES ('20', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '127.0.0.1', null, '2016-06-07 14:29:47', '2016-06-07 14:29:47');
INSERT INTO `yascmf_system_log` VALUES ('21', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '127.0.0.1', null, '2016-06-08 09:38:03', '2016-06-08 09:38:03');
INSERT INTO `yascmf_system_log` VALUES ('22', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '127.0.0.1', null, '2016-06-13 15:01:10', '2016-06-13 15:01:10');
INSERT INTO `yascmf_system_log` VALUES ('23', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '127.0.0.1', null, '2016-06-14 09:29:26', '2016-06-14 09:29:26');
INSERT INTO `yascmf_system_log` VALUES ('24', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '127.0.0.1', null, '2016-06-14 13:20:40', '2016-06-14 13:20:40');
INSERT INTO `yascmf_system_log` VALUES ('25', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '127.0.0.1', null, '2016-06-15 09:16:47', '2016-06-15 09:16:47');
INSERT INTO `yascmf_system_log` VALUES ('26', '1', 'upload', 'http://localhost:8000/admin/upload', '管理员：上传了图片文件，图片原始文件名：Desert.jpg，上传之后保存在服务器路径为http://localhost:8000/uploads/content/20160615/5760b8a582176_37o.jpg。', '127.0.0.1', null, '2016-06-15 10:08:37', '2016-06-15 10:08:37');
INSERT INTO `yascmf_system_log` VALUES ('27', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '127.0.0.1', null, '2016-06-15 14:58:36', '2016-06-15 14:58:36');
INSERT INTO `yascmf_system_log` VALUES ('28', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '127.0.0.1', null, '2016-06-28 15:01:24', '2016-06-28 15:01:24');
INSERT INTO `yascmf_system_log` VALUES ('29', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '127.0.0.1', null, '2016-07-01 13:32:20', '2016-07-01 13:32:20');
INSERT INTO `yascmf_system_log` VALUES ('30', '1', 'manager', 'http://localhost:8000/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '127.0.0.1', null, '2016-07-01 13:32:44', '2016-07-01 13:32:44');
INSERT INTO `yascmf_system_log` VALUES ('31', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '127.0.0.1', null, '2016-07-06 13:42:31', '2016-07-06 13:42:31');
INSERT INTO `yascmf_system_log` VALUES ('32', '1', 'manager', 'http://localhost/yascmf/public/index.php/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-07-20 15:35:51', '2016-07-20 15:35:51');
INSERT INTO `yascmf_system_log` VALUES ('33', '1', 'manager', 'http://localhost/yascmf1/public/index.php/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-07-20 15:36:51', '2016-07-20 15:36:51');
INSERT INTO `yascmf_system_log` VALUES ('34', '1', 'manager', 'http://localhost/yascmf1/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-07-26 11:09:02', '2016-07-26 11:09:02');
INSERT INTO `yascmf_system_log` VALUES ('35', '1', 'manager', 'http://localhost/yascmf1/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-07-26 14:05:49', '2016-07-26 14:05:49');
INSERT INTO `yascmf_system_log` VALUES ('36', '1', 'manager', 'http://localhost/yascmf1/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-07-26 14:26:16', '2016-07-26 14:26:16');
INSERT INTO `yascmf_system_log` VALUES ('37', '1', 'manager', 'http://localhost/yascmf1/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-07-26 14:32:02', '2016-07-26 14:32:02');
INSERT INTO `yascmf_system_log` VALUES ('38', '1', 'manager', 'http://localhost/yascmf1/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-07-26 15:23:04', '2016-07-26 15:23:04');
INSERT INTO `yascmf_system_log` VALUES ('39', '1', 'manager', 'http://localhost/yascmf1/public/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-07-27 13:57:41', '2016-07-27 13:57:41');
INSERT INTO `yascmf_system_log` VALUES ('40', '1', 'manager', 'http://localhost/yascmf1/public/index.php/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-07-28 10:37:13', '2016-07-28 10:37:13');
INSERT INTO `yascmf_system_log` VALUES ('41', '1', 'manager', 'http://localhost/yascmf1/public/index.php/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-07-29 10:40:06', '2016-07-29 10:40:06');
INSERT INTO `yascmf_system_log` VALUES ('42', '1', 'manager', 'http://localhost/yascmf1/public/index.php/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-07-29 14:02:38', '2016-07-29 14:02:38');
INSERT INTO `yascmf_system_log` VALUES ('43', '1', 'manager', 'http://localhost/yascmf1/public/index.php/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-08-01 15:08:10', '2016-08-01 15:08:10');
INSERT INTO `yascmf_system_log` VALUES ('44', '1', 'manager', 'http://localhost/yascmf1/public/index.php/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-08-02 09:46:50', '2016-08-02 09:46:50');
INSERT INTO `yascmf_system_log` VALUES ('45', '1', 'manager', 'http://localhost/yascmf1/public/index.php/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-08-02 14:52:32', '2016-08-02 14:52:32');
INSERT INTO `yascmf_system_log` VALUES ('46', '1', 'manager', 'http://localhost/yascmf1/public/index.php/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-08-03 09:58:48', '2016-08-03 09:58:48');
INSERT INTO `yascmf_system_log` VALUES ('47', '1', 'manager', 'http://localhost/yascmf1/public/index.php/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-08-04 14:36:37', '2016-08-04 14:36:37');
INSERT INTO `yascmf_system_log` VALUES ('48', '1', 'upload', 'http://localhost/yascmf1/public/index.php/admin/upload', '管理员：上传了图片文件，图片原始文件名：vcredist.bmp，上传之后保存在服务器路径为http://localhost/yascmf1/public/index.php/uploads/content/20160804/57a2e42f032eb_59o.bmp。', '::1', null, '2016-08-04 14:43:59', '2016-08-04 14:43:59');
INSERT INTO `yascmf_system_log` VALUES ('49', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-08-11 14:56:22', '2016-08-11 14:56:22');
INSERT INTO `yascmf_system_log` VALUES ('50', '1', 'upload', 'http://localhost:8000/admin/upload', '管理员：上传了图片文件，图片原始文件名：2.jpg，上传之后保存在服务器路径为http://localhost:8000/uploads/content/20160811/57ac21ade5913_45o.jpg。', '::1', null, '2016-08-11 14:56:45', '2016-08-11 14:56:45');
INSERT INTO `yascmf_system_log` VALUES ('51', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-08-12 10:52:35', '2016-08-12 10:52:35');
INSERT INTO `yascmf_system_log` VALUES ('52', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-08-12 10:54:32', '2016-08-12 10:54:32');
INSERT INTO `yascmf_system_log` VALUES ('53', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-08-12 11:13:51', '2016-08-12 11:13:51');
INSERT INTO `yascmf_system_log` VALUES ('54', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-08-15 13:29:22', '2016-08-15 13:29:22');
INSERT INTO `yascmf_system_log` VALUES ('55', '1', 'upload', 'http://localhost:8000/admin/upload', '管理员：上传了图片文件，图片原始文件名：3.jpg，上传之后保存在服务器路径为http://localhost:8000/uploads/content/20160815/57b1535dcc327_05o.jpg。', '::1', null, '2016-08-15 13:30:05', '2016-08-15 13:30:05');
INSERT INTO `yascmf_system_log` VALUES ('56', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-09-22 09:55:39', '2016-09-22 09:55:39');
INSERT INTO `yascmf_system_log` VALUES ('57', '1', 'manager', 'http://localhost:8000/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '::1', null, '2016-09-22 09:59:33', '2016-09-22 09:59:33');
INSERT INTO `yascmf_system_log` VALUES ('58', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-09-22 10:00:21', '2016-09-22 10:00:21');
INSERT INTO `yascmf_system_log` VALUES ('59', '1', 'manager', 'http://localhost:8000/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '::1', null, '2016-09-22 10:00:39', '2016-09-22 10:00:39');
INSERT INTO `yascmf_system_log` VALUES ('60', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-09-22 10:00:52', '2016-09-22 10:00:52');
INSERT INTO `yascmf_system_log` VALUES ('61', '1', 'manager', 'http://localhost:8000/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '::1', null, '2016-09-22 10:01:38', '2016-09-22 10:01:38');
INSERT INTO `yascmf_system_log` VALUES ('62', '1', 'manager', 'http://localhost:8000/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '::1', null, '2016-09-22 10:01:39', '2016-09-22 10:01:39');
INSERT INTO `yascmf_system_log` VALUES ('63', '1', 'manager', 'http://localhost:8000/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '::1', null, '2016-09-22 10:01:39', '2016-09-22 10:01:39');
INSERT INTO `yascmf_system_log` VALUES ('64', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-09-22 10:01:50', '2016-09-22 10:01:50');
INSERT INTO `yascmf_system_log` VALUES ('65', '1', 'manager', 'http://localhost:8000/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '::1', null, '2016-09-22 10:19:50', '2016-09-22 10:19:50');
INSERT INTO `yascmf_system_log` VALUES ('66', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-09-22 10:24:06', '2016-09-22 10:24:06');
INSERT INTO `yascmf_system_log` VALUES ('67', '1', 'manager', 'http://localhost:8000/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '::1', null, '2016-09-22 10:24:42', '2016-09-22 10:24:42');
INSERT INTO `yascmf_system_log` VALUES ('68', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-09-22 10:32:42', '2016-09-22 10:32:42');
INSERT INTO `yascmf_system_log` VALUES ('69', '1', 'manager', 'http://localhost:8000/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '::1', null, '2016-09-22 10:34:31', '2016-09-22 10:34:31');
INSERT INTO `yascmf_system_log` VALUES ('70', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-09-22 10:34:48', '2016-09-22 10:34:48');
INSERT INTO `yascmf_system_log` VALUES ('71', '1', 'manager', 'http://localhost:8000/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '::1', null, '2016-09-22 10:37:57', '2016-09-22 10:37:57');
INSERT INTO `yascmf_system_log` VALUES ('72', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-09-22 10:38:15', '2016-09-22 10:38:15');
INSERT INTO `yascmf_system_log` VALUES ('73', '1', 'manager', 'http://localhost:8000/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '::1', null, '2016-09-22 11:19:17', '2016-09-22 11:19:17');
INSERT INTO `yascmf_system_log` VALUES ('74', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-09-22 11:21:18', '2016-09-22 11:21:18');
INSERT INTO `yascmf_system_log` VALUES ('75', '1', 'manager', 'http://localhost:8000/admin/me', '管理员：更新了我的账户 - 个人资料。', '::1', null, '2016-09-22 11:21:48', '2016-09-22 11:21:48');
INSERT INTO `yascmf_system_log` VALUES ('76', '1', 'manager', 'http://localhost:8000/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '::1', null, '2016-09-22 11:21:54', '2016-09-22 11:21:54');
INSERT INTO `yascmf_system_log` VALUES ('77', '1', 'manager', 'http://localhost:8000/auth/login', '管理员：Admin[admin@example.com] 登录系统。', '::1', null, '2016-09-22 11:22:03', '2016-09-22 11:22:03');
INSERT INTO `yascmf_system_log` VALUES ('78', '1', 'manager', 'http://localhost:8000/auth/logout', '管理员：Admin[admin@example.com] 登出系统。', '::1', null, '2016-09-22 11:22:17', '2016-09-22 11:22:17');

-- ----------------------------
-- Table structure for yascmf_system_options
-- ----------------------------
DROP TABLE IF EXISTS `yascmf_system_options`;
CREATE TABLE `yascmf_system_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '配置选项名',
  `value` text COLLATE utf8_unicode_ci COMMENT '配置选项值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_option_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统配置选项表';

-- ----------------------------
-- Records of yascmf_system_options
-- ----------------------------
INSERT INTO `yascmf_system_options` VALUES ('1', 'website_keywords', 'Wangszhblog');
INSERT INTO `yascmf_system_options` VALUES ('2', 'company_address', '');
INSERT INTO `yascmf_system_options` VALUES ('3', 'website_title', 'Wangszhblog');
INSERT INTO `yascmf_system_options` VALUES ('4', 'company_telephone', '');
INSERT INTO `yascmf_system_options` VALUES ('5', 'company_full_name', 'Wangszh内容管理框架');
INSERT INTO `yascmf_system_options` VALUES ('6', 'website_icp', '');
INSERT INTO `yascmf_system_options` VALUES ('7', 'system_version', 'yascmf_alpha_1.0');
INSERT INTO `yascmf_system_options` VALUES ('8', 'page_size', '10');
INSERT INTO `yascmf_system_options` VALUES ('9', 'system_logo', 'http://cmf.yas.so/assets/img/yas_logo.png');
INSERT INTO `yascmf_system_options` VALUES ('10', 'picture_watermark', 'http://cmf.yas.so/assets/img/yas_logo.png');
INSERT INTO `yascmf_system_options` VALUES ('11', 'company_short_name', 'Wangszhblog');
INSERT INTO `yascmf_system_options` VALUES ('12', 'system_author', '豆芽丝');
INSERT INTO `yascmf_system_options` VALUES ('13', 'system_author_website', 'http://douyasi.com');
INSERT INTO `yascmf_system_options` VALUES ('14', 'is_watermark', '0');

-- ----------------------------
-- Table structure for yascmf_tags
-- ----------------------------
DROP TABLE IF EXISTS `yascmf_tags`;
CREATE TABLE `yascmf_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'meta名',
  `thumb` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'meta缩略图',
  `slug` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'meta缩略名',
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'category' COMMENT 'meta类型: [category]-分类，[tag]-标签',
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'meta描述',
  `count` int(10) unsigned DEFAULT '0' COMMENT 'meta被使用的次数',
  `sort` int(6) unsigned DEFAULT '0' COMMENT 'meta排序，数字越大排序越靠前',
  PRIMARY KEY (`id`),
  KEY `name_index` (`name`) USING BTREE,
  KEY `slug_index` (`slug`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='META元数据（分类|标签） 表';

-- ----------------------------
-- Records of yascmf_tags
-- ----------------------------
INSERT INTO `yascmf_tags` VALUES ('1', '默认', '', 'default', 'tag', '默认', '0', '0');
INSERT INTO `yascmf_tags` VALUES ('2', '软件', '', 'soft', 'tag', '收录个人开发的软件或脚本', '0', '0');
INSERT INTO `yascmf_tags` VALUES ('3', '文档', '', 'docs', 'tag', '这里收录自己开发过程中所撰写的文档', '0', '0');
INSERT INTO `yascmf_tags` VALUES ('4', 'Laravel', '', 'laravel', 'tag', '分享一些Laravel相关文章', '0', '0');
INSERT INTO `yascmf_tags` VALUES ('5', 'Javascript', '', 'javascript', 'tag', '前端Javascript相关知识', '0', '0');
INSERT INTO `yascmf_tags` VALUES ('6', '测试', '', '', 'tag', '测试内容', '0', '0');
INSERT INTO `yascmf_tags` VALUES ('7', 'fddfdf', null, null, 'tag', 'dfdfdf', '0', '0');
INSERT INTO `yascmf_tags` VALUES ('8', 'vbvbvbv', null, null, 'tag', 'bvbvbv', '0', '0');

-- ----------------------------
-- Table structure for yascmf_users
-- ----------------------------
DROP TABLE IF EXISTS `yascmf_users`;
CREATE TABLE `yascmf_users` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户登录名',
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户密码',
  `nickname` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户屏显昵称，可以不同用户登录名',
  `email` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户邮箱',
  `realname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户真实姓名',
  `pid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户身份证号',
  `pid_card_thumb1` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '身份证证件正面（印有国徽图案、签发机关和有效期限）照片',
  `pid_card_thumb2` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '身份证证件反面（印有个人基本信息和照片）照片',
  `avatar` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户个人图像',
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '固定/移动电话',
  `address` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系地址',
  `emergency_contact` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '紧急联系人信息',
  `servicer_id` int(12) DEFAULT '0' COMMENT '专属客服id，（为0表示其为无专属客服的管理用户）',
  `deleted_at` datetime DEFAULT NULL COMMENT '被软删除时间',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改更新时间',
  `is_lock` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否锁定限制用户登录，1锁定,0正常',
  `user_type` enum('visitor','customer','manager') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'visitor' COMMENT '用户类型：visitor 游客, customer 投资客户, manager 管理型用户',
  `confirmation_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '确认码',
  `confirmed` tinyint(1) DEFAULT '0' COMMENT '是否已通过验证 0：未通过 1：通过',
  `remember_token` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Laravel 追加的记住令牌',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_username_unique` (`username`),
  UNIQUE KEY `user_email_unique` (`email`),
  UNIQUE KEY `user_pid_unique` (`pid`),
  KEY `user_nickname_index` (`nickname`),
  KEY `user_realname_index` (`realname`),
  KEY `user_phone_index` (`phone`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户表';

-- ----------------------------
-- Records of yascmf_users
-- ----------------------------
INSERT INTO `yascmf_users` VALUES ('1', 'admin', '$2y$10$bPKoEq5xAVDg8eNCfhsQ4.8qZ4aetBM8nzYbhLIEGZ9FJFWtiQOOW', 'Admin', 'admin@example.com', '王善斋', null, null, null, null, null, null, null, null, null, '2014-12-22 02:30:59', '2016-09-22 11:22:17', '0', 'manager', '161590b511f23a7aca43e785ba037d4f', '1', 'jH10GaeprxyCzIwARQ3MxRFFGXEC65pIRppWf42N5iqVE29DsLiwcdaNqjvI');
INSERT INTO `yascmf_users` VALUES ('2', '', '', '', 'wangszh@163.com', null, null, null, null, null, null, null, null, '0', null, '2016-07-07 16:03:24', '2016-07-07 16:03:24', '0', 'visitor', '', '0', null);
