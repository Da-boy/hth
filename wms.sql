-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-12-01 16:13:04
-- 服务器版本： 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wms`
--

-- --------------------------------------------------------

--
-- 表的结构 `w_category`
--

CREATE TABLE `w_category` (
  `id` mediumint(9) UNSIGNED NOT NULL,
  `pid` mediumint(9) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `desc` mediumtext,
  `add_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `w_category`
--

INSERT INTO `w_category` (`id`, `pid`, `name`, `status`, `desc`, `add_time`) VALUES
(1, 0, '食品', 0, '', 1514456685),
(2, 0, '酒类', 0, '', 1514457825),
(3, 0, '礼品', 0, '', 1514554550);

-- --------------------------------------------------------

--
-- 表的结构 `w_company`
--

CREATE TABLE `w_company` (
  `id` mediumint(9) UNSIGNED NOT NULL,
  `name` varchar(40) NOT NULL,
  `tel` varchar(12) NOT NULL,
  `email` varchar(40) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `address` varchar(100) DEFAULT NULL,
  `desc` mediumtext,
  `add_time` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='公司管理';

--
-- 转存表中的数据 `w_company`
--

INSERT INTO `w_company` (`id`, `name`, `tel`, `email`, `status`, `address`, `desc`, `add_time`) VALUES
(1, '大帝王朝', '110', 'dadi@qq.com', 0, '北京市', '', 1515753231);

-- --------------------------------------------------------

--
-- 表的结构 `w_customer`
--

CREATE TABLE `w_customer` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `sn` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `address` varchar(40) NOT NULL,
  `desc` mediumtext,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客户';

--
-- 转存表中的数据 `w_customer`
--

INSERT INTO `w_customer` (`id`, `sn`, `name`, `contact`, `phone`, `email`, `fax`, `address`, `desc`, `status`, `add_time`) VALUES
(1, '5a44a4f6f1f18', '苏州牧冬光电有限公司', '测试', '15069900798', '30024167@qq.com', '15069900798', '江苏省苏州市长阳街', '苏州牧冬光电有限公司...', 0, 1514448252),
(2, '5a44b3f23a31c', '爱美克空气过滤器', '测试', '1705280089', '30024167@qq.com', '0312-56777890', '苏州市工业园区长阳街', '爱美克空气过滤器', 0, 1514452007);

-- --------------------------------------------------------

--
-- 表的结构 `w_goods`
--

CREATE TABLE `w_goods` (
  `goods_id` mediumint(8) UNSIGNED NOT NULL,
  `cat_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `ent_id` int(10) NOT NULL DEFAULT '0',
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `product_no` varchar(30) DEFAULT '' COMMENT '产品编码',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `brand` varchar(64) DEFAULT '' COMMENT '品牌',
  `goods_spec` varchar(255) NOT NULL DEFAULT '',
  `goods_weight` decimal(10,3) UNSIGNED NOT NULL DEFAULT '0.000',
  `market_price` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `goods_price` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `unit` varchar(15) DEFAULT '' COMMENT '申报单位',
  `goods_sn_cus` varchar(60) DEFAULT NULL COMMENT '海关备案号',
  `goods_sn_ciq` varchar(60) DEFAULT NULL COMMENT '商检备案号',
  `customs_tax_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '关税税率',
  `consumption_tax_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '消费税税率',
  `valueadded_tax_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '增值税税率',
  `code_ts` varchar(50) DEFAULT '',
  `g_weight` decimal(18,5) NOT NULL DEFAULT '0.00000',
  `r_weight` decimal(18,5) NOT NULL DEFAULT '0.00000',
  `for_orgin` varchar(50) DEFAULT '' COMMENT '原产国',
  `qty1` decimal(18,5) NOT NULL DEFAULT '0.00000' COMMENT '法定数量',
  `unit1` varchar(12) DEFAULT '' COMMENT '法定单位',
  `qty2` decimal(18,5) NOT NULL DEFAULT '0.00000' COMMENT '法定第二数量',
  `unit2` varchar(12) DEFAULT '' COMMENT '法定第二单位',
  `qty1_ratio` decimal(10,2) UNSIGNED DEFAULT '1.00' COMMENT '第一法定单位对应申报单位的换算系数',
  `qty2_ratio` decimal(10,2) UNSIGNED DEFAULT '1.00' COMMENT '第二法定单位对应申报单位的换算系数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `w_location`
--

CREATE TABLE `w_location` (
  `id` mediumint(9) UNSIGNED NOT NULL,
  `sn` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `storage` mediumint(5) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '0',
  `desc` varchar(200) DEFAULT NULL COMMENT '备注',
  `add_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='库位管理';

--
-- 转存表中的数据 `w_location`
--

INSERT INTO `w_location` (`id`, `sn`, `name`, `storage`, `status`, `desc`, `add_time`) VALUES
(1, '17122705595244343', 'B区', 1, 0, '', 1514368943),
(2, '17122706022839995', 'A区', 3, 0, '', 1514368959);

-- --------------------------------------------------------

--
-- 表的结构 `w_menu`
--

CREATE TABLE `w_menu` (
  `id` mediumint(9) UNSIGNED NOT NULL,
  `pid` mediumint(9) UNSIGNED DEFAULT '0',
  `name` varchar(40) DEFAULT NULL,
  `ico` varchar(20) DEFAULT NULL,
  `level` tinyint(1) UNSIGNED DEFAULT '0',
  `controller` varchar(20) DEFAULT NULL,
  `action` varchar(20) DEFAULT NULL,
  `status` tinyint(1) UNSIGNED DEFAULT '0',
  `add_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='菜单';

--
-- 转存表中的数据 `w_menu`
--

INSERT INTO `w_menu` (`id`, `pid`, `name`, `ico`, `level`, `controller`, `action`, `status`, `add_time`) VALUES
(1, 0, '首页', 'linecons-cog', 0, 'Index', 'index', 0, NULL),
(2, 0, '系统设置', 'linecons-desktop', 0, '', NULL, 0, NULL),
(3, 2, '员工管理', NULL, 1, 'User', 'index', 0, NULL),
(4, 0, '仓库作业', 'linecons-tag', 0, NULL, NULL, 0, NULL),
(5, 4, '入库管理', NULL, 1, 'Instorage', 'index', 0, 5),
(6, 4, '出库管理', NULL, 1, 'Outstorage', 'index', 0, NULL),
(7, 4, '查询管理', NULL, 1, 'Product', 'lists', 0, NULL),
(8, 0, '基本设置', 'linecons-cog', 0, NULL, NULL, 0, NULL),
(9, 8, '仓库管理', NULL, 1, 'Storage', 'index', 0, NULL),
(13, 8, '计量单位', NULL, 1, 'Unit', 'index', 0, NULL),
(15, 8, '产品管理', NULL, 1, 'Product', 'index', 0, NULL),
(16, 2, '角色管理', NULL, 1, 'Role', 'index', 0, NULL),
(20, 0, '订单管理', 'linecons-note', 0, '', NULL, 0, NULL),
(21, 20, '订单查询', NULL, 1, 'Order', 'index', 0, NULL),
(22, 4, '预出库', NULL, 1, 'Preoutstorage', 'index', 0, NULL),
(23, 4, '盘点管理', NULL, 1, 'Goodtop', 'index', 0, NULL),
(24, 4, '盘点记录', NULL, 1, 'Allot', 'index', 0, NULL),
(25, 4, '出库审批', NULL, 1, 'Appoutstorage', 'index', 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `w_order`
--

CREATE TABLE `w_order` (
  `id` mediumint(9) UNSIGNED NOT NULL,
  `sn` varchar(40) DEFAULT NULL,
  `product_id` varchar(40) DEFAULT NULL COMMENT '相关商品',
  `unit` varchar(10) DEFAULT '' COMMENT '单位',
  `author` varchar(20) DEFAULT NULL,
  `local` varchar(40) DEFAULT NULL COMMENT '货架',
  `state` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1',
  `desc` mediumtext,
  `add_time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `w_order`
--

INSERT INTO `w_order` (`id`, `sn`, `product_id`, `unit`, `author`, `local`, `state`, `desc`, `add_time`) VALUES
(40, 'SN20181121084735246', NULL, '', '王朝', NULL, 1, '', 1542804483),
(39, 'SN20181121084643224', NULL, '', '王朝', NULL, 1, '', 1542804446),
(41, 'SN20181125035915130', NULL, '', '王朝', NULL, 1, '', 1543132772),
(42, 'SN20181125040008890', NULL, '', '王朝', NULL, 1, '', 1543132813),
(43, 'SN20181126094011164', NULL, '11', '王朝', '11', 1, '', 1543239632),
(44, 'SN20181127070033797', NULL, '2222', '王朝', '2222', 1, '', 1543316471),
(45, 'SN20181127071915607', NULL, '6', '王朝', '66', 1, '', 1543317580);

-- --------------------------------------------------------

--
-- 表的结构 `w_order_good`
--

CREATE TABLE `w_order_good` (
  `rec_id` mediumint(8) UNSIGNED NOT NULL,
  `order_sn` varchar(40) DEFAULT NULL,
  `batch_no` varchar(20) DEFAULT NULL COMMENT '导入批号',
  `referer` varchar(40) DEFAULT NULL COMMENT '订单来源',
  `identify_no` varchar(20) DEFAULT NULL COMMENT '身份证',
  `author` varchar(20) DEFAULT NULL COMMENT '订单作者',
  `waybillno` varchar(40) DEFAULT NULL COMMENT '物流编号',
  `delivery` varchar(40) NOT NULL DEFAULT '第三方物流' COMMENT '送货方式',
  `receiver_name` varchar(20) DEFAULT NULL COMMENT '收件人',
  `receiver_phone` varchar(12) DEFAULT NULL COMMENT '收件人电话',
  `receiver_province` varchar(20) DEFAULT NULL COMMENT '收件省份',
  `receiver_city` varchar(20) DEFAULT NULL COMMENT '收件城市',
  `receiver_district` varchar(20) DEFAULT NULL COMMENT '收件县区',
  `receiver_address` mediumtext COMMENT '收件地址',
  `sender_name` varchar(20) DEFAULT NULL COMMENT '发件人',
  `sender_phone` varchar(12) DEFAULT NULL COMMENT '发件电话',
  `sender_address` mediumtext COMMENT '发件地址',
  `is_print` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否打印：0：未打印 1：已打印',
  `pick_status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '拣货状态0：未拣货 1：拣货',
  `tally_status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '理货状态0：未理货 1：挂起 2：理货完成',
  `out_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '出库状态0：未出库1：已出库',
  `shipping_fee` decimal(4,2) UNSIGNED DEFAULT '0.00' COMMENT '运费',
  `desc` mediumtext,
  `add_time` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `w_order_good`
--

INSERT INTO `w_order_good` (`rec_id`, `order_sn`, `batch_no`, `referer`, `identify_no`, `author`, `waybillno`, `delivery`, `receiver_name`, `receiver_phone`, `receiver_province`, `receiver_city`, `receiver_district`, `receiver_address`, `sender_name`, `sender_phone`, `sender_address`, `is_print`, `pick_status`, `tally_status`, `out_status`, `shipping_fee`, `desc`, `add_time`) VALUES
(1, 'AD888013016NY', '20180122092551', '导入', '11010119971218402X', '', '9977937396691', '第三方物流', '刘如忆', '13705009875', '福建省', '福州市', '鼓楼区', '东泰路竹林镜新村27号401', 'BOBO', '9294347911', '312bay ridge ave brooklyn NY', 0, 1, 0, 0, '0.00', NULL, 1516627551),
(2, 'AD888013017NY', '20180122092642', '导入', '51012519820402002X', '', '9977937396692', '第三方物流', '陈莉', '13799983277', '福建省', '福州市', '台江区', '洋中路178号文景苑514', 'BOBO', 'BOBO', '312bay ridge ave brooklyn NY', 0, 1, 0, 0, '0.00', NULL, 1516627602),
(3, 'AD888013018NY', '20180122092652', '导入', '51012519820402002X', '布尔', '9977937396693', '第三方物流', '布尔', '13799983275', '福建省', '福州市', '台江区', '洋中路178号文景苑514', 'BOBO', 'BOBO', 'ge ave brooklyn NY', 0, 0, 0, 0, '0.00', NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `w_order_goods`
--

CREATE TABLE `w_order_goods` (
  `rec_id` mediumint(8) UNSIGNED NOT NULL,
  `order_sn` varchar(40) DEFAULT NULL,
  `order_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品货号',
  `goods_name` varchar(128) DEFAULT '' COMMENT '品名',
  `brand` varchar(64) DEFAULT '' COMMENT '品牌',
  `goods_spec` varchar(128) DEFAULT '' COMMENT '规格',
  `currency` varchar(50) DEFAULT '' COMMENT '币值',
  `product_no` varchar(50) DEFAULT '' COMMENT '产品编码',
  `goods_number` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tax_price` float(10,2) NOT NULL DEFAULT '0.00',
  `note` varchar(256) DEFAULT NULL,
  `unit` varchar(50) DEFAULT '0' COMMENT '申报计量单位 3位代码',
  `unit2` varchar(12) DEFAULT '' COMMENT '法定第二单位',
  `g_weight` decimal(18,5) DEFAULT NULL COMMENT '毛重',
  `r_weight` decimal(18,5) DEFAULT NULL COMMENT '净重',
  `qty1` decimal(18,5) DEFAULT '0.00000' COMMENT '法定数量',
  `unit1` varchar(12) DEFAULT '' COMMENT '法定单位',
  `qty2` decimal(18,5) DEFAULT '0.00000' COMMENT '法定第二数量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `w_order_info`
--

CREATE TABLE `w_order_info` (
  `order_id` mediumint(8) UNSIGNED NOT NULL,
  `o_id` mediumint(9) UNSIGNED DEFAULT NULL COMMENT '关联id',
  `ent_id` int(11) DEFAULT '0' COMMENT '所属企业ID',
  `batch_no` varchar(64) DEFAULT NULL COMMENT '导入批次号',
  `order_sn` varchar(64) DEFAULT '' COMMENT '电商内部订单号',
  `referer` varchar(64) DEFAULT '' COMMENT '订单来源',
  `waybillno` varchar(64) DEFAULT '' COMMENT '物流单号',
  `product_no` varchar(64) DEFAULT '' COMMENT '产品编码(必填)',
  `identify_no` varchar(60) DEFAULT '' COMMENT '身份证号码',
  `receiver_name` varchar(60) DEFAULT '' COMMENT '收件人姓名',
  `receiver_phone` varchar(60) DEFAULT '' COMMENT '收件人电话',
  `receiver_province` varchar(60) DEFAULT '' COMMENT '收件人省份',
  `receiver_city` varchar(60) DEFAULT '' COMMENT '收件人市',
  `receiver_district` varchar(60) DEFAULT '' COMMENT '收件人区县',
  `receiver_address` varchar(255) DEFAULT '' COMMENT '收件人地址',
  `sender_name` varchar(60) DEFAULT '' COMMENT '发件人姓名',
  `sender_phone` varchar(60) DEFAULT '' COMMENT '发件人电话',
  `sender_address` varchar(255) DEFAULT '' COMMENT '发件人地址',
  `g_weight` decimal(18,5) DEFAULT NULL COMMENT '毛重',
  `r_weight` decimal(18,5) DEFAULT NULL COMMENT '净重',
  `goods_number` smallint(5) UNSIGNED DEFAULT '1',
  `goods_amount` decimal(10,2) DEFAULT '0.00',
  `currency` varchar(50) DEFAULT '' COMMENT '币值',
  `shipping_fee` decimal(10,2) DEFAULT '0.00' COMMENT '运费',
  `remark` varchar(255) DEFAULT '' COMMENT '订单备注',
  `is_print` varchar(1) NOT NULL DEFAULT '0' COMMENT '是否打印：0：未打印 1：已打印',
  `pick_status` varchar(1) NOT NULL DEFAULT '0' COMMENT '拣货状态0：未拣货 1：拣货',
  `tally_status` varchar(1) NOT NULL DEFAULT '0' COMMENT '理货状态0：未理货 1：挂起 2：理货完成',
  `out_status` varchar(1) NOT NULL DEFAULT '0' COMMENT '出库状态0：未出库1：已出库',
  `add_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='发货';

--
-- 转存表中的数据 `w_order_info`
--

INSERT INTO `w_order_info` (`order_id`, `o_id`, `ent_id`, `batch_no`, `order_sn`, `referer`, `waybillno`, `product_no`, `identify_no`, `receiver_name`, `receiver_phone`, `receiver_province`, `receiver_city`, `receiver_district`, `receiver_address`, `sender_name`, `sender_phone`, `sender_address`, `g_weight`, `r_weight`, `goods_number`, `goods_amount`, `currency`, `shipping_fee`, `remark`, `is_print`, `pick_status`, `tally_status`, `out_status`, `add_time`) VALUES
(1, 1, 0, '20180122093010', 'AD888013016NY', NULL, '9977937396691', '5a450753a97ee', '11010119971218402X', '刘如忆', '13705009875', '福建省', '福州市', '鼓楼区', '东泰路竹林镜新村27号401', 'BOBO', '9294347911', '312bay ridge ave brooklyn NY', NULL, '2.10000', 4, '200.00', '50', '0.00', NULL, '0', '0', '0', '0', 1516627810),
(2, 2, 0, '20180122093010', 'AD888013017NY', NULL, '9977937396692', '5a450753a97ee', '51012519820402002X', '陈莉', '13799983277', '福建省', '福州市', '台江区', '洋中路178号文景苑514', 'BOBO', '9294347911', '312bay ridge ave brooklyn NY', NULL, '5.30000', 6, '439.80', '73.3', '0.00', NULL, '0', '0', '0', '0', 1516627810),
(3, 2, 0, '20180122093010', 'AD888013017NY', NULL, '9977937396692', '5a450753a97ee', '51012519820402002X', '陈莉', '13799983277', '福建省', '福州市', '台江区', '洋中路178号文景苑514', 'BOBO', '9294347911', '312bay ridge ave brooklyn NY', NULL, '2.10000', 4, '200.00', '50', '0.00', NULL, '0', '0', '0', '0', 1516627810),
(4, 1, 0, '20180122094305', 'AD888013016NY', NULL, '9977937396691', '5a47110d39206', '11010119971218402X', '刘如忆', '13705009875', '福建省', '福州市', '鼓楼区', '东泰路竹林镜新村27号401', 'BOBO', '9294347911', '312bay ridge ave brooklyn NY', NULL, '2.10000', 4, '200.00', '50', '0.00', NULL, '0', '0', '0', '0', 1516628585),
(5, 2, 0, '20180122094305', 'AD888013017NY', NULL, '9977937396692', '5a47110d39206', '51012519820402002X', '陈莉', '13799983277', '福建省', '福州市', '台江区', '洋中路178号文景苑514', 'BOBO', '9294347911', '312bay ridge ave brooklyn NY', NULL, '5.30000', 6, '439.80', '73.3', '0.00', NULL, '0', '0', '0', '0', 1516628585),
(6, 2, 0, '20180122094305', 'AD888013017NY', NULL, '9977937396692', '5a47110d39206', '51012519820402002X', '陈莉', '13799983277', '福建省', '福州市', '台江区', '洋中路178号文景苑514', 'BOBO', '9294347911', '312bay ridge ave brooklyn NY', NULL, '2.10000', 4, '200.00', '50', '0.00', NULL, '0', '0', '0', '0', 1516628585);

-- --------------------------------------------------------

--
-- 表的结构 `w_order_infow`
--

CREATE TABLE `w_order_infow` (
  `order_id` mediumint(8) UNSIGNED NOT NULL,
  `o_id` mediumint(9) UNSIGNED DEFAULT NULL COMMENT '关联id',
  `ent_id` int(11) DEFAULT '0' COMMENT '所属企业ID',
  `product_no` varchar(40) DEFAULT NULL,
  `g_weight` decimal(18,5) DEFAULT NULL COMMENT '毛重',
  `r_weight` decimal(18,5) DEFAULT NULL COMMENT '净重',
  `goods_number` smallint(5) UNSIGNED DEFAULT '1',
  `goods_amount` decimal(10,2) DEFAULT '0.00',
  `currency` varchar(50) DEFAULT '' COMMENT '币值',
  `remark` varchar(255) DEFAULT '' COMMENT '订单备注',
  `add_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='发货';

--
-- 转存表中的数据 `w_order_infow`
--

INSERT INTO `w_order_infow` (`order_id`, `o_id`, `ent_id`, `product_no`, `g_weight`, `r_weight`, `goods_number`, `goods_amount`, `currency`, `remark`, `add_time`) VALUES
(1, 1, 0, '5a450753a97ee', NULL, '2.10000', 4, '200.00', '50', NULL, 1516627602),
(2, 2, 0, '5a450753a97ee', NULL, '5.30000', 6, '439.80', '73.3', NULL, 1516627602),
(3, 2, 0, '5a450753a97ee', NULL, '2.10000', 4, '200.00', '50', NULL, 1516627602);

-- --------------------------------------------------------

--
-- 表的结构 `w_order_list`
--

CREATE TABLE `w_order_list` (
  `id` mediumint(9) UNSIGNED NOT NULL,
  `good_id` mediumint(9) UNSIGNED DEFAULT NULL COMMENT '关联商品id',
  `order_id` mediumint(9) UNSIGNED DEFAULT NULL COMMENT '入库订单id',
  `num` mediumint(9) UNSIGNED DEFAULT NULL COMMENT '入库数量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单关联表';

--
-- 转存表中的数据 `w_order_list`
--

INSERT INTO `w_order_list` (`id`, `good_id`, `order_id`, `num`) VALUES
(1, 1, 1, 1),
(2, 3, 1, 10),
(3, 6, 2, 1),
(4, 5, 2, 10),
(5, 4, 3, 1),
(6, 3, 3, 10),
(7, 6, 2, 5),
(8, 3, 5, 12),
(9, 5, 5, 12),
(10, 4, 6, 9),
(11, 4, 7, 9),
(12, 6, 7, 9),
(13, 3, 8, 3),
(14, 4, 9, 1),
(15, 1, 10, 10),
(16, 2, 10, 10),
(17, 10, 11, 21),
(18, 2, 13, 12),
(19, 1, 15, 8),
(20, 13, 16, 20),
(21, 13, 17, 10),
(22, 2, 18, 10),
(23, 13, 18, 2),
(24, 1, 19, 9),
(25, 15, 20, 20),
(26, 2, 21, 20),
(27, 15, 21, 10),
(28, 12, 22, 8),
(29, 1, 23, 6),
(30, 1, 24, 4),
(31, 1, 25, 4),
(32, 1, 26, 45),
(33, 1, 27, 2),
(34, 1, 28, 2),
(35, 1, 29, 3),
(36, 1, 32, 9),
(37, 1, 34, 1),
(38, 1, 35, 1),
(39, 1, 36, 1),
(40, 1, 37, 22),
(41, 13, 37, 11),
(42, 1, 38, 2),
(43, 12, 38, 7),
(44, 1, 39, 100),
(45, 1, 40, 123),
(46, 1, 43, 11),
(47, 1, 44, 22),
(48, 10, 44, 2222),
(49, 1, 45, 6),
(50, 11, 45, 6),
(51, 1, 46, 4);

-- --------------------------------------------------------

--
-- 表的结构 `w_product`
--

CREATE TABLE `w_product` (
  `id` mediumint(9) UNSIGNED NOT NULL,
  `sn` varchar(40) NOT NULL,
  `name` varchar(20) NOT NULL,
  `category` varchar(20) DEFAULT NULL,
  `storage` varchar(20) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `keeptime` int(40) DEFAULT NULL COMMENT '保质日期',
  `sctime` date DEFAULT NULL COMMENT '生产日期',
  `shelve` mediumint(9) DEFAULT NULL,
  `spec` varchar(40) DEFAULT NULL COMMENT '规格',
  `price` decimal(10,2) UNSIGNED DEFAULT NULL,
  `num` mediumint(9) UNSIGNED NOT NULL DEFAULT '0' COMMENT '数量',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `desc` mediumtext,
  `add_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品';

--
-- 转存表中的数据 `w_product`
--

INSERT INTO `w_product` (`id`, `sn`, `name`, `category`, `storage`, `location`, `unit`, `keeptime`, `sctime`, `shelve`, `spec`, `price`, `num`, `status`, `desc`, `add_time`) VALUES
(1, '5a450753a97ee', '华夫饼', '0', '1号食品仓库', 'A区', '箱', 0, '0000-00-00', NULL, '500g/包*6包/箱', '99.00', 498, 0, '111', 1514473336),
(16, '5bfe10bc19d5d', '可乐', NULL, '一号货架', NULL, '箱', 300, '2018-09-01', NULL, '200ml/瓶', '200.00', 0, 0, '', 1543377119),
(10, '5bd130036cdfa', '茅台', '0', '1号食品仓库', 'B区', '箱', 0, '0000-00-00', NULL, '500ML/瓶*6瓶/箱', '100.00', 2222, 0, '', 1540435998),
(11, '5bd1305bb9ca5', '恰恰瓜子', '数码', '1号食品仓库', 'B区', '包', 0, '0000-00-00', NULL, '500g/包', '12.00', 6, 0, '', 1540436109);

-- --------------------------------------------------------

--
-- 表的结构 `w_productup`
--

CREATE TABLE `w_productup` (
  `id` mediumint(9) UNSIGNED NOT NULL,
  `gid` mediumint(9) DEFAULT NULL,
  `storage` varchar(20) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `shelve` mediumint(9) DEFAULT NULL,
  `shelve_list` varchar(20) DEFAULT NULL,
  `num` mediumint(9) UNSIGNED NOT NULL DEFAULT '0',
  `desc` mediumtext,
  `add_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品';

--
-- 转存表中的数据 `w_productup`
--

INSERT INTO `w_productup` (`id`, `gid`, `storage`, `location`, `shelve`, `shelve_list`, `num`, `desc`, `add_time`) VALUES
(1, 1, '华中地区', 'A区', 1, '2', 15, '111', 1514473336),
(15, 16, '一号货架', NULL, NULL, NULL, 0, '', 1543377119),
(10, 10, '酒水仓库', 'B区', NULL, NULL, 0, '', 1540435998),
(11, 11, '1号食品仓库', 'B区', NULL, NULL, 0, '', 1540436109);

-- --------------------------------------------------------

--
-- 表的结构 `w_role`
--

CREATE TABLE `w_role` (
  `id` mediumint(9) UNSIGNED NOT NULL,
  `name` varchar(40) NOT NULL,
  `ids` mediumtext,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `desc` mediumtext,
  `add_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `w_role`
--

INSERT INTO `w_role` (`id`, `name`, `ids`, `status`, `desc`, `add_time`) VALUES
(1, '系统管理员', '1,2,3,16', 0, '1111111111111', 1515743511),
(2, '仓库管理员', '1,2,3,4,5,6,7,22,23,24,25,8,15', 0, '', 1515743749),
(3, '审核员', '1,4,5,6,7,23,24,8,9', 0, '', 1540384258),
(4, '经办人', '1,4,6,7', 0, '', 1540384281),
(5, '会计', '1,4,7,24', 0, '', 1540384301),
(6, '经理', '1,2,3,16', 0, '', 1540384949);

-- --------------------------------------------------------

--
-- 表的结构 `w_shelve`
--

CREATE TABLE `w_shelve` (
  `id` mediumint(9) UNSIGNED NOT NULL,
  `sn` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `location` mediumint(5) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '0',
  `list` mediumtext,
  `desc` varchar(200) DEFAULT NULL COMMENT '备注',
  `add_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='货架管理';

--
-- 转存表中的数据 `w_shelve`
--

INSERT INTO `w_shelve` (`id`, `sn`, `name`, `location`, `status`, `list`, `desc`, `add_time`) VALUES
(1, '17122705595244343', 'A1', 2, 0, '1,2,3,4,5', '111', 1514368943),
(2, '17122706022839995', 'A2', 2, 0, '1,2,3,4,5', '', 1514368959),
(3, '18011302055978362', 'B1', 2, 0, '1,2,3,4,5', '', 1515823705);

-- --------------------------------------------------------

--
-- 表的结构 `w_storage`
--

CREATE TABLE `w_storage` (
  `id` mediumint(9) UNSIGNED NOT NULL,
  `sn` varchar(40) NOT NULL COMMENT '编号',
  `name` varchar(40) NOT NULL COMMENT '名字',
  `contact` varchar(16) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `desc` mediumtext,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态： 0正常 1禁用',
  `address` varchar(40) DEFAULT NULL,
  `add_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='仓库管理';

--
-- 转存表中的数据 `w_storage`
--

INSERT INTO `w_storage` (`id`, `sn`, `name`, `contact`, `phone`, `desc`, `status`, `address`, `add_time`) VALUES
(1, 'SN2017122704160191249', '1号食品仓库', '王朝', '15052850085', '', 0, '北京市丰台区', 1514350644),
(5, 'SN2018102510471694441', '杂支仓库', '李四', '18922626666', '', 0, '北京市海淀区', 1540435662),
(6, 'SN2018102510481867715', '礼品仓库', '王五', '17688888888', '', 0, '北京市海淀区', 1540435722),
(2, 'SN2017122704171789530', '2号食品仓库', '贾志强', '17052850083', '', 0, '北京市朝阳区', 1514351653),
(4, 'SN2018102510435222920', '酒水仓库', '张三', '15322890753', '', 0, '北京市海淀区', 1540435474),
(3, 'SN2018102510394958542', '3号食品仓库', '李鑫克', '14567897622', '', 0, '北京市海淀区', 1540435229);

-- --------------------------------------------------------

--
-- 表的结构 `w_unit`
--

CREATE TABLE `w_unit` (
  `id` mediumint(9) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `desc` mediumtext,
  `add_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `w_unit`
--

INSERT INTO `w_unit` (`id`, `name`, `status`, `desc`, `add_time`) VALUES
(1, '箱', 0, '箱', 1514454975),
(2, '个', 0, '', 1514455204),
(3, '包', 0, '', 1514455226),
(4, '片', 0, '', 1514455232),
(5, '双', 0, '', 1516544029);

-- --------------------------------------------------------

--
-- 表的结构 `w_user`
--

CREATE TABLE `w_user` (
  `id` mediumint(9) NOT NULL,
  `sn` mediumtext,
  `username` varchar(16) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `phone` varchar(12) DEFAULT NULL COMMENT '手机号',
  `eamil` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `truename` varchar(16) DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态 0:正常 1:禁用',
  `desc` mediumtext,
  `add_time` int(11) UNSIGNED DEFAULT NULL,
  `role` mediumint(10) UNSIGNED DEFAULT NULL,
  `company` mediumint(10) UNSIGNED DEFAULT NULL COMMENT '公司'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `w_user`
--

INSERT INTO `w_user` (`id`, `sn`, `username`, `password`, `phone`, `eamil`, `truename`, `status`, `desc`, `add_time`, `role`, `company`) VALUES
(1, '18011401143519201', 'bool', '21232f297a57a5a743894a0e4a801fc3', '17052850083', '30024167', '王朝', 0, NULL, 1515908045, 1, 1),
(6, '18102408342579092', 'chenyb', '21232f297a57a5a743894a0e4a801fc3', NULL, NULL, '程玉彬', 0, '', 1540384506, 3, 1),
(5, '18102408321211484', 'lixk', '21232f297a57a5a743894a0e4a801fc3', NULL, NULL, '李鑫克', 0, '', 1540384360, 2, 1),
(7, '18102408362139562', 'jiazq', '21232f297a57a5a743894a0e4a801fc3', NULL, NULL, '贾志强', 0, '', 1540384608, 4, 1),
(8, '18102408365153154', 'zhangkj', '21232f297a57a5a743894a0e4a801fc3', NULL, NULL, '张会计', 0, '', 1540384647, 5, 1),
(9, '18102408423877832', 'guocq', '21232f297a57a5a743894a0e4a801fc3', NULL, NULL, '郭经理', 0, '', 1540384981, 6, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `w_category`
--
ALTER TABLE `w_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `w_company`
--
ALTER TABLE `w_company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- Indexes for table `w_customer`
--
ALTER TABLE `w_customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE,
  ADD UNIQUE KEY `sn` (`sn`) USING BTREE;

--
-- Indexes for table `w_goods`
--
ALTER TABLE `w_goods`
  ADD PRIMARY KEY (`goods_id`);

--
-- Indexes for table `w_location`
--
ALTER TABLE `w_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_menu`
--
ALTER TABLE `w_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `w_order`
--
ALTER TABLE `w_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sn` (`sn`),
  ADD KEY `product_id` (`product_id`) USING BTREE;

--
-- Indexes for table `w_order_good`
--
ALTER TABLE `w_order_good`
  ADD PRIMARY KEY (`rec_id`);

--
-- Indexes for table `w_order_goods`
--
ALTER TABLE `w_order_goods`
  ADD PRIMARY KEY (`rec_id`),
  ADD KEY `order_id` (`order_id`) USING BTREE,
  ADD KEY `goods_id` (`goods_id`) USING BTREE,
  ADD KEY `goods_sn` (`goods_sn`) USING BTREE;

--
-- Indexes for table `w_order_info`
--
ALTER TABLE `w_order_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `order_sn` (`order_sn`) USING BTREE,
  ADD KEY `waybillno` (`waybillno`) USING BTREE;

--
-- Indexes for table `w_order_infow`
--
ALTER TABLE `w_order_infow`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `w_order_list`
--
ALTER TABLE `w_order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_product`
--
ALTER TABLE `w_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_productup`
--
ALTER TABLE `w_productup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_role`
--
ALTER TABLE `w_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- Indexes for table `w_shelve`
--
ALTER TABLE `w_shelve`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_storage`
--
ALTER TABLE `w_storage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `sn` (`sn`);

--
-- Indexes for table `w_unit`
--
ALTER TABLE `w_unit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- Indexes for table `w_user`
--
ALTER TABLE `w_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `w_category`
--
ALTER TABLE `w_category`
  MODIFY `id` mediumint(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `w_company`
--
ALTER TABLE `w_company`
  MODIFY `id` mediumint(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `w_customer`
--
ALTER TABLE `w_customer`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `w_goods`
--
ALTER TABLE `w_goods`
  MODIFY `goods_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `w_location`
--
ALTER TABLE `w_location`
  MODIFY `id` mediumint(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `w_menu`
--
ALTER TABLE `w_menu`
  MODIFY `id` mediumint(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- 使用表AUTO_INCREMENT `w_order`
--
ALTER TABLE `w_order`
  MODIFY `id` mediumint(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- 使用表AUTO_INCREMENT `w_order_good`
--
ALTER TABLE `w_order_good`
  MODIFY `rec_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `w_order_goods`
--
ALTER TABLE `w_order_goods`
  MODIFY `rec_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `w_order_info`
--
ALTER TABLE `w_order_info`
  MODIFY `order_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `w_order_infow`
--
ALTER TABLE `w_order_infow`
  MODIFY `order_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `w_order_list`
--
ALTER TABLE `w_order_list`
  MODIFY `id` mediumint(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- 使用表AUTO_INCREMENT `w_product`
--
ALTER TABLE `w_product`
  MODIFY `id` mediumint(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- 使用表AUTO_INCREMENT `w_productup`
--
ALTER TABLE `w_productup`
  MODIFY `id` mediumint(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `w_role`
--
ALTER TABLE `w_role`
  MODIFY `id` mediumint(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `w_shelve`
--
ALTER TABLE `w_shelve`
  MODIFY `id` mediumint(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `w_storage`
--
ALTER TABLE `w_storage`
  MODIFY `id` mediumint(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `w_unit`
--
ALTER TABLE `w_unit`
  MODIFY `id` mediumint(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `w_user`
--
ALTER TABLE `w_user`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
