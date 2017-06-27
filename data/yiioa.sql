-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017-06-27 18:32:23
-- 服务器版本： 5.7.18-0ubuntu0.16.04.1
-- PHP Version: 7.0.18-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yiioa`
--

-- --------------------------------------------------------

--
-- 表的结构 `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('超级管理员', '1', 1497579019);

-- --------------------------------------------------------

--
-- 表的结构 `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/*', 2, NULL, NULL, NULL, 1497843919, 1497843919),
('/admin/*', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/admin/assignment/*', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/assignment/assign', 2, NULL, NULL, NULL, 1497498064, 1497498064),
('/admin/assignment/index', 2, NULL, NULL, NULL, 1497498064, 1497498064),
('/admin/assignment/revoke', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/assignment/view', 2, NULL, NULL, NULL, 1497498064, 1497498064),
('/admin/default/*', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/default/index', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/menu/*', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/menu/create', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/menu/delete', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/menu/index', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/menu/update', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/menu/view', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/permission/*', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/permission/assign', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/permission/create', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/permission/delete', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/permission/index', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/permission/remove', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/permission/update', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/permission/view', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/role/*', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/role/assign', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/role/create', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/role/delete', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/role/index', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/role/remove', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/role/update', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/role/view', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/route/*', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/admin/route/assign', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/admin/route/create', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/admin/route/index', 2, NULL, NULL, NULL, 1497498065, 1497498065),
('/admin/route/refresh', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/admin/route/remove', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/admin/rule/*', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/admin/rule/create', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/admin/rule/delete', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/admin/rule/index', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/admin/rule/update', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/admin/rule/view', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/admin/user/*', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/admin/user/activate', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/admin/user/change-password', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/admin/user/delete', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/admin/user/index', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/admin/user/login', 2, NULL, NULL, NULL, 1497498043, 1497498043),
('/admin/user/logout', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/admin/user/request-password-reset', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/admin/user/reset-password', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/admin/user/signup', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/admin/user/view', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/debug/*', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/debug/default/*', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/debug/default/db-explain', 2, NULL, NULL, NULL, 1497843917, 1497843917),
('/debug/default/download-mail', 2, NULL, NULL, NULL, 1497843917, 1497843917),
('/debug/default/index', 2, NULL, NULL, NULL, 1497843917, 1497843917),
('/debug/default/toolbar', 2, NULL, NULL, NULL, 1497843917, 1497843917),
('/debug/default/view', 2, NULL, NULL, NULL, 1497843917, 1497843917),
('/department/*', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/department/create', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/department/delete', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/department/index', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/department/update', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/department/view', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/dynagrid/*', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/dynagrid/settings/*', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/dynagrid/settings/get-config', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/gii/*', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/gii/default/*', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/gii/default/action', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/gii/default/diff', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/gii/default/index', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/gii/default/preview', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/gii/default/view', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/gridview/*', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/gridview/export/*', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/gridview/export/download', 2, NULL, NULL, NULL, 1497498066, 1497498066),
('/news-cate/*', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/news-cate/create', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/news-cate/delete', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/news-cate/index', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/news-cate/update', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/news-cate/view', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/news/*', 2, NULL, NULL, NULL, 1497842965, 1497842965),
('/news/create', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/news/delete', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/news/editStatus', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/news/editTitle', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/news/index', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/news/update', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/news/view', 2, NULL, NULL, NULL, 1497843918, 1497843918),
('/redactor/*', 2, NULL, NULL, NULL, 1497843917, 1497843917),
('/site/*', 2, NULL, NULL, NULL, 1497843919, 1497843919),
('/site/error', 2, NULL, NULL, NULL, 1497843919, 1497843919),
('/site/index', 2, NULL, NULL, NULL, 1497843919, 1497843919),
('/site/login', 2, NULL, NULL, NULL, 1497843919, 1497843919),
('/site/logout', 2, NULL, NULL, NULL, 1497843919, 1497843919),
('/staff/*', 2, NULL, NULL, NULL, 1497843919, 1497843919),
('/staff/create', 2, NULL, NULL, NULL, 1497843919, 1497843919),
('/staff/delete', 2, NULL, NULL, NULL, 1497843919, 1497843919),
('/staff/index', 2, NULL, NULL, NULL, 1497843919, 1497843919),
('/staff/update', 2, NULL, NULL, NULL, 1497843919, 1497843919),
('/staff/view', 2, NULL, NULL, NULL, 1497843919, 1497843919),
('新闻管理', 2, NULL, NULL, NULL, 1497842892, 1497842892),
('新闻管理员', 1, NULL, NULL, NULL, 1497843023, 1497843023),
('超级管理员', 1, NULL, NULL, NULL, 1497497993, 1497497993);

-- --------------------------------------------------------

--
-- 表的结构 `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('超级管理员', '/*'),
('超级管理员', '/admin/*'),
('超级管理员', '/admin/assignment/*'),
('超级管理员', '/admin/assignment/assign'),
('超级管理员', '/admin/assignment/index'),
('超级管理员', '/admin/assignment/revoke'),
('超级管理员', '/admin/assignment/view'),
('超级管理员', '/admin/default/*'),
('超级管理员', '/admin/default/index'),
('超级管理员', '/admin/menu/*'),
('超级管理员', '/admin/menu/create'),
('超级管理员', '/admin/menu/delete'),
('超级管理员', '/admin/menu/index'),
('超级管理员', '/admin/menu/update'),
('超级管理员', '/admin/menu/view'),
('超级管理员', '/admin/permission/*'),
('超级管理员', '/admin/permission/assign'),
('超级管理员', '/admin/permission/create'),
('超级管理员', '/admin/permission/delete'),
('超级管理员', '/admin/permission/index'),
('超级管理员', '/admin/permission/remove'),
('超级管理员', '/admin/permission/update'),
('超级管理员', '/admin/permission/view'),
('超级管理员', '/admin/role/*'),
('超级管理员', '/admin/role/assign'),
('超级管理员', '/admin/role/create'),
('超级管理员', '/admin/role/delete'),
('超级管理员', '/admin/role/index'),
('超级管理员', '/admin/role/remove'),
('超级管理员', '/admin/role/update'),
('超级管理员', '/admin/role/view'),
('超级管理员', '/admin/route/*'),
('超级管理员', '/admin/route/assign'),
('超级管理员', '/admin/route/create'),
('超级管理员', '/admin/route/index'),
('超级管理员', '/admin/route/refresh'),
('超级管理员', '/admin/route/remove'),
('超级管理员', '/admin/rule/*'),
('超级管理员', '/admin/rule/create'),
('超级管理员', '/admin/rule/delete'),
('超级管理员', '/admin/rule/index'),
('超级管理员', '/admin/rule/update'),
('超级管理员', '/admin/rule/view'),
('超级管理员', '/admin/user/*'),
('超级管理员', '/admin/user/activate'),
('超级管理员', '/admin/user/change-password'),
('超级管理员', '/admin/user/delete'),
('超级管理员', '/admin/user/index'),
('超级管理员', '/admin/user/login'),
('超级管理员', '/admin/user/logout'),
('超级管理员', '/admin/user/request-password-reset'),
('超级管理员', '/admin/user/reset-password'),
('超级管理员', '/admin/user/signup'),
('超级管理员', '/admin/user/view'),
('超级管理员', '/debug/*'),
('超级管理员', '/debug/default/*'),
('超级管理员', '/debug/default/db-explain'),
('超级管理员', '/debug/default/download-mail'),
('超级管理员', '/debug/default/index'),
('超级管理员', '/debug/default/toolbar'),
('超级管理员', '/debug/default/view'),
('超级管理员', '/department/*'),
('超级管理员', '/department/create'),
('超级管理员', '/department/delete'),
('超级管理员', '/department/index'),
('超级管理员', '/department/update'),
('超级管理员', '/department/view'),
('超级管理员', '/dynagrid/*'),
('超级管理员', '/dynagrid/settings/*'),
('超级管理员', '/dynagrid/settings/get-config'),
('超级管理员', '/gii/*'),
('超级管理员', '/gii/default/*'),
('超级管理员', '/gii/default/action'),
('超级管理员', '/gii/default/diff'),
('超级管理员', '/gii/default/index'),
('超级管理员', '/gii/default/preview'),
('超级管理员', '/gii/default/view'),
('超级管理员', '/gridview/*'),
('超级管理员', '/gridview/export/*'),
('超级管理员', '/gridview/export/download'),
('超级管理员', '/news-cate/*'),
('超级管理员', '/news-cate/create'),
('超级管理员', '/news-cate/delete'),
('超级管理员', '/news-cate/index'),
('超级管理员', '/news-cate/update'),
('超级管理员', '/news-cate/view'),
('新闻管理员', '/news/*'),
('超级管理员', '/news/*'),
('超级管理员', '/news/create'),
('超级管理员', '/news/delete'),
('超级管理员', '/news/editStatus'),
('超级管理员', '/news/editTitle'),
('超级管理员', '/news/index'),
('超级管理员', '/news/update'),
('超级管理员', '/news/view'),
('超级管理员', '/redactor/*'),
('超级管理员', '/site/*'),
('超级管理员', '/site/error'),
('超级管理员', '/site/index'),
('超级管理员', '/site/login'),
('超级管理员', '/site/logout'),
('超级管理员', '/staff/*'),
('超级管理员', '/staff/create'),
('超级管理员', '/staff/delete'),
('超级管理员', '/staff/index'),
('超级管理员', '/staff/update'),
('超级管理员', '/staff/view');

-- --------------------------------------------------------

--
-- 表的结构 `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '部门名',
  `pid` smallint(6) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级部门',
  `sort_order` smallint(6) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序值',
  `status` smallint(6) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `department`
--

INSERT INTO `department` (`id`, `name`, `pid`, `sort_order`, `status`) VALUES
(1, '总部', 0, 0, 1),
(2, '分部', 1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `menu`
--

INSERT INTO `menu` (`id`, `name`, `parent`, `route`, `order`, `data`) VALUES
(1, '权限管理', NULL, NULL, NULL, 0x7b2269636f6e223a2266612066612d617574686f72227d),
(2, '菜单', 1, '/admin/menu/index', 6, 0x7b2269636f6e223a2266612d66696c652d636f64652d6f227d);

-- --------------------------------------------------------

--
-- 表的结构 `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1497493907),
('m130524_201442_init', 1497493909),
('m140506_102106_rbac_init', 1497495025),
('m140602_111327_create_menu_table', 1497495974),
('m170615_025816_c_news_table', 1497500350),
('m170615_061228_create_news_cate', 1497584984),
('m170616_032458_update_user_add', 1497584987),
('m170616_080912_creat_department', 1497600803);

-- --------------------------------------------------------

--
-- 表的结构 `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '文章标题',
  `category` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类',
  `content` text COLLATE utf8_unicode_ci COMMENT '内容',
  `tags` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '标签',
  `author` int(11) UNSIGNED NOT NULL DEFAULT '1' COMMENT '作者',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `status` smallint(6) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态',
  `click` smallint(6) UNSIGNED NOT NULL DEFAULT '0' COMMENT '点击量',
  `star` smallint(6) UNSIGNED NOT NULL DEFAULT '0' COMMENT '星数',
  `share` smallint(6) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分享数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `news`
--

INSERT INTO `news` (`id`, `title`, `category`, `content`, `tags`, `author`, `create_time`, `update_time`, `status`, `click`, `star`, `share`) VALUES
(1, '测试14', 1, '<p>231</p>', 'tag', 1, 1497517351, 1497842805, 0, 0, 0, 0),
(2, '测试2', 2, '<p>你好</p><p><img src="http://uploads.oa.com/1/240dae9c41-logo.png"></p>', 'test', 1, 1497520117, 1497842809, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `news_cate`
--

CREATE TABLE `news_cate` (
  `id` int(11) NOT NULL,
  `name` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名',
  `sort_order` smallint(6) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序值',
  `status` smallint(6) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `true_name` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '真实姓名',
  `phone` int(11) NOT NULL DEFAULT '0' COMMENT '联系电话',
  `province` smallint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '省份',
  `city` smallint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '城市',
  `county` smallint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '县/区',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ' ' COMMENT '具体地址',
  `id_number` char(18) COLLATE utf8_unicode_ci NOT NULL DEFAULT '00000000000000000' COMMENT '身份证号',
  `enter_time` int(11) NOT NULL DEFAULT '0' COMMENT '入职时间',
  `probation` tinyint(3) UNSIGNED NOT NULL DEFAULT '3' COMMENT '试用期',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '性别',
  `nation` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '汉族' COMMENT '民族',
  `department` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '部门'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `true_name`, `phone`, `province`, `city`, `county`, `address`, `id_number`, `enter_time`, `probation`, `gender`, `nation`, `department`) VALUES
(1, 'admin', 'Cqw6bQtXwDrclTYj4m-XTMVupQ9-8dN3', '$2y$13$bsKahPeY1DOCD8O3BWuwmOLQnYHlnah3H8q/NtaQ987g04YOC4HQa', NULL, '211@qq.com', 10, 1497495208, 1497495208, '', 0, 0, 0, 0, ' ', '00000000000000000', 0, 3, 0, '汉族', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`),
  ADD KEY `status` (`status`),
  ADD KEY `author` (`author`);

--
-- Indexes for table `news_cate`
--
ALTER TABLE `news_cate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- 使用表AUTO_INCREMENT `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `news_cate`
--
ALTER TABLE `news_cate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 限制导出的表
--

--
-- 限制表 `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- 限制表 `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
