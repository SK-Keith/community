/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50719
Source Host           : 127.0.0.1:3306
Source Database       : community

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-04-20 14:38:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for c_adminuser
-- ----------------------------
DROP TABLE IF EXISTS `c_adminuser`;
CREATE TABLE `c_adminuser` (
  `uid` char(32) NOT NULL,
  `loginname` varchar(50) DEFAULT NULL,
  `loginpass` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `activationCode` char(64) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_adminuser
-- ----------------------------
INSERT INTO `c_adminuser` VALUES ('0739B531DFD144B18766A82EDAEE8A32', 'ymx', '123', '15815403421@163.com', '1', '21B9C71084FF4C1D9E1FDF5D60229724ED8E4CFB53D4404AACF922CB9A7C9B6A');
INSERT INTO `c_adminuser` VALUES ('23BCCB16F6C24423913727D833B40659', 'yyy', '123', '1581540342@163.com', '1', 'A683E73A320446E382EACFA484BDA33F6C2201EACDD54E6D93AF805855DF7A85');
INSERT INTO `c_adminuser` VALUES ('25CDD0B065F24EEDB1AFCF071535AF69', 'ymx2', '123', '269039241@qq.com', '0', '63AC2B5EAC5E435D9F5FDBEA1BC545C3408534F98C974570A9E3CB8EDA470C1F');
INSERT INTO `c_adminuser` VALUES ('9D947E8269B44C4FBACB1819861D529A', 'ymx1', '123', '2690399241@qq.com', '0', 'BB8C0FB35E3C4D8D805C1507F3ACE049AE574CB1A8BE4CA98FBD889028543E33');

-- ----------------------------
-- Table structure for c_cartitem
-- ----------------------------
DROP TABLE IF EXISTS `c_cartitem`;
CREATE TABLE `c_cartitem` (
  `cartItemId` char(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `gid` char(32) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  `orderBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`cartItemId`),
  KEY `gid` (`gid`),
  KEY `uid6` (`uid`),
  CONSTRAINT `gid` FOREIGN KEY (`gid`) REFERENCES `c_good` (`gid`),
  CONSTRAINT `uid6` FOREIGN KEY (`uid`) REFERENCES `c_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_cartitem
-- ----------------------------

-- ----------------------------
-- Table structure for c_community
-- ----------------------------
DROP TABLE IF EXISTS `c_community`;
CREATE TABLE `c_community` (
  `aid` char(32) NOT NULL,
  `community` varchar(255) DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  `image_c` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `uid` (`uid`),
  KEY `community` (`community`),
  CONSTRAINT `aid` FOREIGN KEY (`aid`) REFERENCES `c_user` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_community
-- ----------------------------

-- ----------------------------
-- Table structure for c_cost
-- ----------------------------
DROP TABLE IF EXISTS `c_cost`;
CREATE TABLE `c_cost` (
  `pid` char(32) NOT NULL,
  `electric` decimal(8,2) DEFAULT NULL,
  `water` decimal(8,2) DEFAULT NULL,
  `car` decimal(8,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `uid7` (`uid`),
  CONSTRAINT `uid7` FOREIGN KEY (`uid`) REFERENCES `c_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_cost
-- ----------------------------

-- ----------------------------
-- Table structure for c_good
-- ----------------------------
DROP TABLE IF EXISTS `c_good`;
CREATE TABLE `c_good` (
  `gid` char(32) NOT NULL,
  `gname` varchar(200) DEFAULT NULL,
  `gprice` decimal(10,2) DEFAULT NULL,
  `image_g` varchar(100) DEFAULT NULL,
  `orderBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_good
-- ----------------------------

-- ----------------------------
-- Table structure for c_information
-- ----------------------------
DROP TABLE IF EXISTS `c_information`;
CREATE TABLE `c_information` (
  `iid` char(32) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `image_i` varchar(100) DEFAULT NULL,
  `abstracts` varchar(255) DEFAULT NULL,
  `content` varchar(10240) DEFAULT NULL,
  `writer` varchar(100) DEFAULT NULL,
  `time` char(50) DEFAULT NULL,
  `orderBy` int(10) NOT NULL,
  `uid` char(32) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `uid4` (`uid`),
  CONSTRAINT `uid4` FOREIGN KEY (`uid`) REFERENCES `c_adminuser` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_information
-- ----------------------------
INSERT INTO `c_information` VALUES ('0739B531DFD144B18766A82EDAddfA53', '真情连你我 和谐进万家', 'Act1.jpg', '展示自我、情牵社区', '			<!-- 正文开始 -->\n		<div id=\"sina_keyword_ad_area2\" class=\"articalContent   \">\n			<p STYLE=\"TEXT-INDENT: 2em\"><a HREF=\"http://www.gywygl.com/\" TARGET=\"_blank\"></A><a HREF=\"http://photo.blog.sina.com.cn/showpic.html#blogid=5e428a2d0100cbla&url=http://s9.sinaimg.cn/orignal/5e428a2dg6107e7ac61f8\" TARGET=\"_blank\"></A></P>\n<p STYLE=\"TEXT-INDENT: 2em\">&nbsp;<wbr></P>\n<p STYLE=\"TEXT-INDENT: 2em\">\n为办好社区“邻居节”，密切社区居民的邻里关系，营造相识、相知、互助、团结、文明、和谐的邻里氛围，努力构建和谐新社区，制定本方案。</P>\n<p STYLE=\"TEXT-INDENT: 2em\">一、指导思想</P>\n<p STYLE=\"TEXT-INDENT: 2em\">\n以培育市民文明行为习惯为宗旨，倡导和谐理念、培育和谐精神，传播和谐文化，建设人际和谐、管理有序、文明祥和的和谐新社区，为建设富裕、开放、文明、和谐的海林创造良好的社会环境。</P>\n<p STYLE=\"TEXT-INDENT: 2em\">二、活动主题及原则<br />\n　　（一）主题:真情连你我 和谐进万家</P>\n<p STYLE=\"TEXT-INDENT: 2em\">（二）原则:<br />\n　　1、以人为本，突出参与性。举办“邻居节”要以社区为龙头，以居民小组、楼院为单元，以居民为主体，广泛宣传发动，增强认同感，激发参与活动的热情和积极性。<br />\n\n　　2、把握主题，突出创新性。围绕“邻居节”活动主题，根据邻里之间的意愿和实际情况，自主创新活动形式和内容，实行居民自我教育、自我娱乐、自我管理。<br />\n\n&nbsp;<wbr>&nbsp;<wbr>&nbsp;<wbr>\n3、贴近生活，突出时代性。从实际出发，通过开展贴近生活、贴近时代、贴近群众的活动，提高居民文明素质，增进邻里之情，营造诚实友爱、与时俱进的社会风气。<br />\n\n　　4、资源共享，突出和谐性。发动和吸引驻社区的机关、企事业单位和其它社会团体以“邻居”的身份融入到活动中，发挥自身优势，对活动给予支持，使社区内的单位和居民共驻共建、互相支持、和谐相处。</P>\n<p STYLE=\"TEXT-INDENT: 2em\">三、活动目的</P>\n<p STYLE=\"TEXT-INDENT: 2em\">\n（一）通过全市各党政机关、企事业单位、社会团体、驻社区单位及广大居民的共同参与，调动全市上下建设社区的积极性，为建设和谐社区创造良好氛围，为构建和谐海林奠定基础。</P>\n<p STYLE=\"TEXT-INDENT: 2em\">\n（二）通过开展面向全体社区居民，特别是弱势群体的服务活动，进一步密切党和政府与人民群众的联系，实现为民、利民、惠民目标。</P>\n<p STYLE=\"TEXT-INDENT: 2em\">\n（三）通过丰富多彩的文化活动，让先进文化走进社区、贴近百姓、融入生活，进一步丰富全市广大居民群众的精神文化生活，展现广大社区居民群众的才华和智慧，提高广大居民的文明素质，形成和谐的大邻里关系，提高我市精神文明建设水平。</P>\n<p STYLE=\"TEXT-INDENT: 2em\">\n（四）通过社区邻居节期间的各项宣传及各种活动，使全市居民充分了解我市改革开放和现代化建设取得的成绩，充分感受海林的发展变化，充分传递上下一心的创业热情，使广大居民群众以更饱满的精神风貌积极参与我市经济建设和社会发展的各项事业。<br />\n\n　　四、活动内容及时间安排</P>\n<p STYLE=\"TEXT-INDENT: 2em\">邻居节时间&nbsp;<wbr>\n月&nbsp;<wbr> － 月&nbsp;<wbr> 日，共分三个阶段<br />\n　　（一）宣传发动阶段（ 月&nbsp;<wbr> 日— 月&nbsp;<wbr> 日）<br />\n　　1、建立“邻居节”活动组织领导机构和工作网络，市委、市政府成立第二届“邻居节”组委会，城区街道办事处成立领导小组和办公室，各社区要相应成立组织机构，制定活动方案；2、做好“邻居节”活动的准备工作，召开专门会议，研究“邻居节”具体实施方案，各社区要利用召开党员会、居民座谈会、民主听政会的形式，面向社区居民征集活动“金点子”；3、做好“邻居节”的宣传发动和组织策划工作，使“邻居节”成为广大居民生活中一个不可或缺的节日，做到家喻户晓，人人皆知，人人参与。</P>\n<p STYLE=\"TEXT-INDENT: 2em\">（二）活动实施阶段（ 月&nbsp;<wbr>\n日—&nbsp;<wbr> 月&nbsp;<wbr> 日）</P>\n<p STYLE=\"TEXT-INDENT: 2em\">开展四大主题活动：<br />\n&nbsp;<wbr> 　1、“邻居节”启动仪式<br />\n　　主题：“邻里和谐、团结友爱”</P>\n<p STYLE=\"TEXT-INDENT: 2em\">时间：&nbsp;<wbr>&nbsp;<wbr>\n年&nbsp;<wbr> 月&nbsp;<wbr> 日</P>\n<p STYLE=\"TEXT-INDENT: 2em\">地点：**广场（8时－9时）</P>\n<p STYLE=\"TEXT-INDENT: 2em\">（1）市领导宣布第二届社区“邻居节”开幕，</P>\n<p STYLE=\"TEXT-INDENT: 2em\">（2）邻里牵手，共创“三城”签字仪式；</P>\n<p STYLE=\"TEXT-INDENT: 2em\">（3）党员志愿者誓师仪式（3000多名党员参加 ，佩戴标志）；</P>\n<p STYLE=\"TEXT-INDENT: 2em\">（4）市领导讲话；</P>\n<p STYLE=\"TEXT-INDENT: 2em\">（5）开展“爱心传递”系列活动；</P>\n<p STYLE=\"TEXT-INDENT: 2em\">\n&#9312;先锋行动：市委组织部、城区街道党工委组织城区在职党员干部及社区党员开展党员岗活动。</P>\n<p STYLE=\"TEXT-INDENT: 2em\">\n&#9313;天使行动：市卫生局组织医务工作者走进社区讲授医疗保健、和开展义诊活动。市计生局组织工作人员进入社区讲授生殖保健和计划生育知识</P>\n<p STYLE=\"TEXT-INDENT: 2em\">\n&#9314;绿色行动：市环保局组织开展“绿色消费”、“绿色生活”为主题的绿色环保行动</P>\n<p STYLE=\"TEXT-INDENT: 2em\">&#9315;法律行动：市司法局组织涉法单位开展“法律大集”、“法律广场”宣传活动</P>\n<p STYLE=\"TEXT-INDENT: 2em\">&#9316;春风行动：市就业局举办“劳动就业大集”</P>\n<p STYLE=\"TEXT-INDENT: 2em\">\n&#9317;科技行动：市科协组织开展“科技广场”、“科普知识讲座”、“全民健身科学知识讲座”、“科普展览”等活动</P>\n<p STYLE=\"TEXT-INDENT: 2em\">&#9318;自强行动：市残联组织残疾人志愿者开展公益活动</P>\n<p STYLE=\"TEXT-INDENT: 2em\">&#9319;感恩行动：市民政局组织低保对象参与社区公益活动</P>\n<p STYLE=\"TEXT-INDENT: 2em\">&#9320;爱心行动：市民政局、市城区街道办事处组织开展“广场爱心募捐活动”</P>\n<p STYLE=\"TEXT-INDENT: 2em\">\n&#9321;公益行动：市教委、民政局在节日期间图书馆、革命烈士陵园免费向居民开放。</P>\n<p STYLE=\"TEXT-INDENT: 2em\">\n（6）散发致城区居民一封信，即招商亲商爱商，创新创业创优倡议书，旨在宣传招商引资和发展民营企业政策，鼓励居民招商创业，力求形成全民招商、全民创业的良好氛围。</P>\n<p STYLE=\"TEXT-INDENT: 2em\">2、“广场邻里情”<br />\n　　主题：展示自我、情牵社区</P>\n<p STYLE=\"TEXT-INDENT: 2em\">时间：9月18日—23日</P>\n<p STYLE=\"TEXT-INDENT: 2em\">地点：**广场</P>\n<p STYLE=\"TEXT-INDENT: 2em\">（1）“邻里一家亲”家庭才艺大赛</P>\n<p STYLE=\"TEXT-INDENT: 2em\">（2）邻里趣味运动会（以社区为单位）</P>\n<p STYLE=\"TEXT-INDENT: 2em\">3、邻里才技擂台赛</P>\n<p STYLE=\"TEXT-INDENT: 2em\">主题: 邻里友爱、欢乐一家</P>\n<p STYLE=\"TEXT-INDENT: 2em\">时间：&nbsp;<wbr>\n月&nbsp;<wbr> 日—&nbsp;<wbr> 月&nbsp;<wbr> 日</P>\n<p STYLE=\"TEXT-INDENT: 2em\">地点：各社区、各小区</P>\n<p STYLE=\"TEXT-INDENT: 2em\">（1）邻里百家宴</P>\n<p STYLE=\"TEXT-INDENT: 2em\">（2）远亲不如近邻演讲比赛</P>\n<p STYLE=\"TEXT-INDENT: 2em\">4、情系邻里、共建家园</P>\n<p STYLE=\"TEXT-INDENT: 2em\">主题：扶贫济困、邻里互助</P>\n<p STYLE=\"TEXT-INDENT: 2em\">时间：月&nbsp;<wbr> 日— 日</P>\n<p STYLE=\"TEXT-INDENT: 2em\">地点：各社区</P>\n<p STYLE=\"TEXT-INDENT: 2em\">组织党团员志愿者服务队开展扶贫济困，邻里互助活动。</P>\n<p STYLE=\"TEXT-INDENT: 2em\">（三）总结表彰阶段</P>\n<p STYLE=\"TEXT-INDENT: 2em\">\n邻居节结束后，市委宣传部、城区党工委、市妇联通过评比，评出“最佳活动社区”3个；“社区优秀组织奖”5个；“好邻里奖”16户。好家庭奖16户，并进行表彰。</P>							\n		</div>\n						<!-- 正文结束 -->', 'ymx', '2018/04/07 09:00', '1', null);

-- ----------------------------
-- Table structure for c_new
-- ----------------------------
DROP TABLE IF EXISTS `c_new`;
CREATE TABLE `c_new` (
  `nid` char(32) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `image_n` varchar(100) DEFAULT NULL,
  `abstracts` varchar(255) DEFAULT NULL,
  `content` varchar(10240) DEFAULT NULL,
  `writer` varchar(100) NOT NULL,
  `time` char(10) DEFAULT NULL,
  `orderBy` int(11) NOT NULL,
  `uid` char(32) DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `uid5` (`uid`),
  CONSTRAINT `uid5` FOREIGN KEY (`uid`) REFERENCES `c_adminuser` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_new
-- ----------------------------
INSERT INTO `c_new` VALUES ('0739B531DFD144B18766A82EDAddfA53', '<h3>《温州物业管理条例》</h3>', 'n0.jpg', '<p class=\"gray-5 pt10\">温州网11月20日讯(记者 潘涌燚 实习记者 杨潇)今年5月1日，千呼万唤的《温州市物业管理条例》...</p>', '<p>\r\n		温州网11月20日讯(记者 潘涌燚 实习记者 杨潇)今年5月1日，千呼万唤的《温州市<a\r\n			href=\"http://baike.iwuye.com/wiki/%CE%EF%D2%B5%B9%DC%C0%ED%CC%F5%C0%FD\"\r\n			target=\"_blank\" class=\"keylink\">物业管理条例</a>》(以下简称《条例》)终于正式实施。市区的5个小区被选为实施示范点。至今，条例实施已经超过了6个多月。这部“土生土长”的地方性法规将为温州这座城市带来了哪些改变呢?\r\n	</p>\r\n	<p>日前，《代表在线》栏目邀请温州市人大法制委主任委员、常委会法工委主任王旭东，温州市人大代表、鹿城区南汇街道春秋社区党委书记、主任胡美珠，温州市住建委物业修建管理处副处长荣万能，温州市鹿城区矮凳桥社区党委书记、主任叶俏等嘉宾，就此进行探讨，支招条例如何更好落地。</p>\r\n	<p>\r\n		<strong>鹿城区矮凳桥社区主任叶俏</strong>\r\n	</p>\r\n	<p>\r\n		<strong>将召集垟儿小区业主代表商议小区管理</strong>\r\n	</p>\r\n	<p>前不久，有市民反映，她所居住的市区垟儿小区原本由业主自管，但近来由于部分业主拒绝交纳物业费，导致资金短缺。前不久，小区业委会宣布解散。</p>\r\n	<p>对此，温州市鹿城区矮凳桥社区主任叶俏说，对于垟儿小区的下一步管理，已经在小区业主群里发布了征求意见书。接下来，将动员热心的业主积极参与小区自治管理。</p>\r\n	<p>“我们还将召集业主代表针对小区的后续管理召开商议会，解决业主比较关心的小区环境卫生和安全问题。待条件成熟以后，将组建新一届的业主会。”叶俏说。</p>\r\n	<p>\r\n		她说，《条例》实施以来，越来越多的业主积极参与小区管理，督促<a href=\"http://www.iwuye.com/\"\r\n			target=\"_blank\" class=\"keylink\">物业管理</a>更加完善，提供更好的服务。其次，业主委员会可以申请设立开户账户，让业主共有的资金和经营性的收益可以更加规范。\r\n	</p>\r\n	<p>“从目前来看，部分业主经常会因为各种理由拒缴物业缴，另外新老业委会在交接过程中也没有具体的期限。”她说，这些难题仍有待解决。</p>\r\n	<p>\r\n		<strong>市住建委物业修建管理处副处长荣万能</strong>\r\n	</p>\r\n	<p>\r\n		<strong>条例六大配套措施正在制定中</strong>\r\n	</p>\r\n	<p>关于业主拒缴物业费问题，荣万能说，《条例》中明确把拖欠物业费纳入到个人诚信系统，这也是比较有力的措施。目前，法律依据已经具备，接下里就是要推动这项事情，正在和市信用办进行对接。</p>\r\n	<p>《物业条例》实施后，鹿城、龙湾、瓯海三区的5个小区被选为法规实施示范点。荣万能说，通过试点情况来看，业主，业主委员会和物业公司的法制意识逐步得到提升，停车难等矛盾也得到了及时调节。整个小区的物业管理面貌得到很大的改善。</p>\r\n	<p>荣万能认为，整个条例实施以后，乡镇和街道对物业管理的机构设置仍不够规范，还不是特别健全。另一方面，物业管理工作是一个综合性的工作，不单单涉及到住建部门以及街道、乡镇还有社区，还涉及到很多相关的部门，相关职能部门的执法要形成常态化。</p>\r\n	<p>\r\n		此外，荣万能介绍说，从今年五月份起，《条例》相关的配套制度、规范和办法就已经在制定中。目前，已建立物业公司招投标库，接下去还将建立<a\r\n			href=\"http://baike.iwuye.com/wiki/%CE%EF%D2%B5%B7%FE%CE%F1\"\r\n			target=\"_blank\" class=\"keylink\">物业服务</a>企业信用信息管理平台，以及业主大会运行制度、物业合同规范等六大配套措施。\r\n	</p>\r\n	<p>\r\n		<strong>市人大代表、春秋社区主任胡美珠</strong>\r\n	</p>\r\n	<p>\r\n		<strong>要加强《条例》的知识<a href=\"http://xuetang.iwuye.com/PeiXun/\"\r\n			target=\"_blank\" class=\"keylink\">培训</a>\r\n		</strong>\r\n	</p>\r\n	<p>胡美珠既是市人大代表，也是一名社区工作者。对此，她颇有感触。</p>\r\n	<p>\r\n		她说，温州市物业管理条例给小区业主提供了一个法律的武器，“比如今年金河大厦业主们要解除物业的服务合同，但物业根本不理睬。但(条例)推出后，业主拿出条例，<a\r\n			href=\"http://www.iwuye.com/QiYeKu/\" target=\"_blank\" class=\"keylink\">物业公司</a>看了以后也就自行退出了。”\r\n	</p>\r\n	<p>胡美珠提到，小区物业的管理越来越正规化，但也存在着不少的问题。“现在不少业主不满意物业的服务，但物业觉得自己收过来的费用难以维持开支，相关部门一定要重视物业管理。”</p>\r\n	<p>胡美珠建议，对小区业主和物业公司要加强《条例》的知识培训。如果合同中已经规定的，住建部门就要督促物业公司服务到位、管理到位。</p>\r\n	<p>\r\n		<strong>市人大法制委主任委员、常委会法工委主任王旭东</strong>\r\n	</p>\r\n	<p>\r\n		<strong>物业管理从不规范走向规范必须经历阵痛</strong>\r\n	</p>\r\n	<p>王旭东认为，物业管理条例出来以后，物业管理正在从原来的不规范逐渐走向规范，就是要通过这样一段阵痛期。“我们选定市区5个示范小区检验《温州市物业管理条例》落地情况和效果，希望借此形成示范效应。。”</p>\r\n	<p>他提到，之前业主拖欠物业费只能选择诉讼这么一个路径来解决，由于周期比较长，支付的成本也是相对比较高。“通过物业管理条例，实际上就是提供了一个除了司法路径以外的更多的一种选择。比如说，对物业的拖欠就可以纳入到个人征信系统，实际上是比较有前瞻性、引领性的一个条款。”</p>\r\n	<p>他说，拖欠物业费也有很多情况，有的是收费本身不合理，有的则是物业服务企业在进入市场时就恶意压低价格造成的后果。</p>\r\n	<p>“很多人以物业服务不到位，从而拖欠物业费。其实在立法的过程中就关注到了这个问题。”王旭东说，解决这个问题的关键是自我管理的意识不强，没有对服务的条款进行明确约定。</p>', 'ymx', '20180316', '3', null);
INSERT INTO `c_new` VALUES ('0739B531DFD144B18766A82EDAEE8A53', '<h3> 后双十一丨物业加班送快递</h3>', 'n1.jpg', '<p class=\"gray-5 pt10\">图源网络“各位业主，这两天进入双十一快递高峰期，自11月11日起至月底，物业前台加班至晚上9:00...</p>', '<center style=\"text-indent: 0px;\"><p><img alt=\"后双十一丨物业加班送快递 你们小区如何应对快递爆仓\" src=\"http://up-img.iwuye.com/2017/1117/20171117024400927.jpg\" width=\"550\" height=\"400\"/></p></center><p style=\"text-align: center;\">图源网络</p><p>“各位业主，这两天进入双十一快递高峰期，自11月11日起至月底，物业前台加班至晚上9:00。晚上我们会上门送，请各位业主方便的话尽快领取包裹。”</p><p>11月13日19:21，城西银泰旁的上尚庭小区物业在业主群发了这则通知，并立即展开行动。</p><p>这赢得了业主好评：“咱们物业实在太敬业了，大晚上的冒雨给业主们送快递，辛苦了!”“谢谢!物业深夜上门送包裹，点赞!”“进电梯，刚好碰见物业小哥在送快递!”……</p><p>14日中午，记者来到上尚庭小区。东门保安站在岗亭上，微笑着问：“先生，您去哪里，请登记一下!”记者说找物业。保安右手一指，说直接去吧，不用登记。</p><p>物业办公点就在小区东门外。三个客服在前台大厅工作，再进去是10 多个平方米的快递用房，已堆了一百多件快递。</p><p>工作人员在快递房放置了架子，对每个快递按所属楼幢分组摆放。快递房边上摆了温馨提示：“我们是最美金科快递小哥，我们已准备好为您的‘宝贝儿’幸福接力最后100米!”</p><p>不时有业主来认领。</p><p>7号楼有个女业主抱着小萝莉来拿包裹，找到了，蛮大一个电器。物业小伙看她不方便拿，放下手头工作，推了个推车，帮女业主把包裹送至家里。</p><p>有个男业主，找了四五分钟包裹没找到。物业小姑娘问他是什么东西，他说买得多了分不清啥东西，快递小哥通知他放物业了。小姑娘说：“不要急，先回家吧，傍晚找到了，我们会给您送上去的。”男业主“哦”了一声，就放心回去了。</p><p>工作人员说，小区南门原本有两个E邮柜，但都已经满了，所以现在快递多往物业放。14日中午，有申通快递小哥在E邮柜旁打电话，让业主赶紧下来取走，但业主们大多不在家，他无奈地走向物业办公室。</p><p>记者问快递小哥，为什么不直接送去业主家里?他朝满车的快递摊开双手，苦笑着说：“这么多快递，我们哪有时间挨家挨户去送!”</p><p>上尚庭的物业是金科物业，今年初入驻该小区。物业经理叫吕俊超，31岁帅小伙。他说小区有10幢楼，696户业主，目前房价是4万多一平方米，大户型居多，物业费2.5元(另收公摊能耗费0.6元)。</p><center style=\"text-indent:0px;\"><p><img alt=\"后双十一丨物业加班送快递 你们小区如何应对快递爆仓\" src=\"http://up-img.iwuye.com/2017/1117/20171117024401735.jpg\" width=\"640\" height=\"345\"/></p></center><p>为什么要加班加点给业主送快递?</p><p>“因为怕爆仓啊!”吕俊超笑说，估算了下，大概有3000个快递会进来。一到傍晚快递就堆满了，如果不清理就没法再多放了，所以需要“清仓”。“而且，时间一长，怕弄混、弄丢。”</p><p>他也坦承，推出这一举措，是想让刚接手的物业给业主们留下好印象，盼更多人来交物业费。</p><p>“第一年进来，不能砸了公司的招牌。我们前期投入很大，第一年可能亏损80万元。像草坪，我们要求重新种双季草，以前是单季的，地下管道也重新改造。我们最怕业主说‘我不知道享受了你们什么服务’，我听了会寒心。”</p><p>“这两天，我们很多员工要工作15个小时，集团公司规定8:30上班，我们8:00前就来了，就是想做好晨迎。我们早晨迎接业主出门，跟业主打招呼，‘张先生好，您去上班呀’，混个脸熟，让业主知道我就是您的管家。”</p><p>“规定下班时间是18:00，所有人下班后回到办公室整理快递，然后上门送。我们通知加班到21：00，但送完快递，实际下班时间会更晚。”</p><p>“我们的物业费收缴率是82%，而前物业收缴率只有30%-40%，一个天一个地，我相信是因为服务有差别。物业这个行业真的要把员工、业主当家人一样。”</p><p>吕俊超认为，这么做确实方便了业主。</p><p>他体谅业主，“比如我们这里有几个阿里巴巴的高管，非常辛苦，加班到凌晨一两点，很正常。他们房子大、房价高，但都是辛苦得来的。等他们下班后再来拿快递，已经很晚了……”</p><p>那么具体怎么上门送?</p><p>“责任到人，将快递分组分楼栋后，集中出发。”吕俊超说，因快递太多，一般不事先打电话给业主，直接送上门。“业主收到包裹后都很客气的。”</p><p>业主不在家时，如果是边套，本身是有两道门的，其中外门是防火门，要求虚掩，这样他们会把快递放在外门里面的楼廊，然后打电话通知业主。</p><p>如果是中间套，没有人的话，他们会把快递带回去。“10个里面有一两个会带回来，第二天再送。”吕俊超说。</p><p>吕俊超还说，公司很多90后员工，这次送快递都比想象中尽责。</p><p>90后物业小伙王朝这两天都在送快递。“我送了很多，送到了先敲门，不在家的话打电话，业主让我们放家门口时，我们会看情况，如果被别人拿走就不好了。”</p><p>“昨晚我每一幢都送了一遍，最后一车送到晚上10点，是8幢了。这个点业主都要休息了，我就没再往下送了，然后下班了。我住得远，到家是11点多。”</p><p>14日，记者采访了好几位业主，他们所有人对物业此举都持肯定态度，有些还赞不绝口。</p><p>6幢业主孙先生：我们觉得非常好，他们主动去做这个事情，不是被动地去做的。这是新换的物业，对业主很用心。我买了三十个快递，陆陆续续在到。物业跟我说，如果有比较急的东西，可以让他们放在有人值班的地方。我们9点下班的，自己开公司，很忙，很多时候忘记去取快递。事实上，整个小区很少有五六点到家的，一般都很晚到家的。</p><p>5幢业主郑先生：我平时放E邮柜的，双十一E邮柜放不下了，快递小哥放到物业去了。13日他们来我家送了两次，晚上7点多一次，8点多一次，第二次来的那个比较大。我本来想下去拿的，回家已经晚上7点半左右了，我想他们关门了，就没下去，没想到他们送上来了。我大概有十来个快递。我觉得能拿过来蛮意外的，下雨嘛，还送，蛮贴心的。</p><center style=\"text-indent:0px;\"><p><img alt=\"后双十一丨物业加班送快递 你们小区如何应对快递爆仓\" src=\"http://up-img.iwuye.com/2017/1117/20171117024401506.jpg\" width=\"500\" height=\"360\"/></p></center><p>你们小区如何应对双十一后快递爆仓?</p><p>记者采访8个小区八种处理方式</p><p>双十一之后面对爆仓的快递，面对业主们翘首盼望的快递，小区物业如何处理?</p><p>11月14日，记者采访了8个小区，整理出8种物业处理业主快递的方式。记者的感受是，处理业主快递是<a href=\"http://baike.iwuye.com/wiki/%CE%EF%D2%B5%B7%FE%CE%F1\" target=\"_blank\" class=\"keylink\">物业服务</a>水平的标志之一，有的小区几乎件件都帮业主送到家里，而有的小区却完全不管。快递处理方式和物业费高低，有着十分密切的关系。</p><p>快递员不进小区</p><p>全部交给物业管家</p><p>代表：绿城兰园(绿城物业，物业费每平方米每月3.8元)</p><p>绿城物业给业主发了一条温馨提示：为方便业主第一时间拿到网购的宝贝，只要在幸福绿城App“便民服务”免费下个订单，所有大件快递送到你家。</p><p>兰园原本有一间快递代收室，为了这次双十一，物业又在地下自行车库专门开辟了200平方米的快递临时堆放点，安上监控，还专门准备了一台生鲜冷柜，存放业主网购的水果、鲜奶等生鲜品。</p><p>园区内人车分流，快递员的车不进小区地面，直接开进地下自行车库，卸下快递包裹，全部交给物业管家。快递员不进园区，既保护了业主个人隐私，也省去了业主不少麻烦。</p><p>物业管家们最近延长了上班时间。他们会主动问业主，您的快递到了，要不要帮您送到家里?13日一个女管家用行李车送了八车包裹。</p><p>假如业主自己来领，包裹又多，物业还准备了20辆超市小推车和4个行李车。</p><p>增加快递柜</p><p>不方便的送上门</p><p>代表：万家星城(滨江物业，物业费每平方米每月2.2元，含能耗费)</p><p>整个万家星城一二三期加起来四千多户、一万多人。去年物业服务中心快递爆仓，为应战今年的双十一，物业将快递柜增设到20个。户数最多的三期，15幢楼一共设了8个快递柜，能放近700个快递，业主凭密码提取。</p><p>物业服务中心代收，只要业主打个电话给物业就行，14日服务中心堆放了100多个包裹。有些业主回家晚，或家里只有老人小孩不方便拿，物业管家会把快递送上门。</p><p>有快递直接找物业经理</p><p>他微信加了1400多个业主好友</p><p>代表：南岸晶都(绿升物业，物业费每平方米每月1.8元，含能耗费)</p><p>小区1538户。以前双十一过后，物业服务中心都堆满了，快递还放不下。今年小区提前做好了快递分流，设置了四个邮柜，能放六七百个快递。有大件送来，跟物业讲一声，可以放在<a href=\"http://xuetang.iwuye.com/baoanzhidu/\" target=\"_blank\" class=\"keylink\">保安</a>门岗里，女业主或带小孩的大伯大妈来拿快递，物业人员会主动帮忙送上门。</p><p>快递公司电动三轮车一律不准进入小区，门岗提供四个手拉小推车，快递员推着车到单元门里，再每家每户送货上门。这样既可以防止快递员偷懒，一股脑儿把快件扔到物业，也能让快递及时送到业主家中。</p><p>物业经理王伟手机微信里有1500多个好友，1400多个都是小区业主。有人会把快递柜取件码发给他，“帮我一起放物业吧，谢谢哦”!有人发微信叫他帮忙送下快递。他都是秒回，自己送或者叫保安送。目前服务中心放的都是大件，物业会动用推车或者人力主动送到业主家里。</p><p>保安室里堆得整整齐齐</p><p>代表：恩济花苑(自管8年的小区，物业费每平方米每月0.5元)</p><p>小区458户，2012年3月，曾有媒体报道过，这个小区代业主收取包裹，每件要向快递员收1元钱。这项措施只坚持了两个半月就中途流产。物业主任尤文佳来到小区后，反对这项措施：“我们本来就是为业主服务的，既然业主有需求，帮忙代收是理所应当的。”</p><p>14日，小区西门保安室，保安的私人物品都清理掉了，专门堆放业主快递，有好几百个，按幢堆放，整整齐齐，看起来舒服，找起来也方便。小区保安在小区做得时间都比较长，最长的做了8年，对住户都熟悉，谁有包裹，保安都及时叫他们领掉。没人来领，业主又在家，物业人员当天会送上门去，以免造成保安室快递堆积如山的情况。</p><center style=\"text-indent:0px;\"><p><img alt=\"后双十一丨物业加班送快递 你们小区如何应对快递爆仓\" src=\"http://up-img.iwuye.com/2017/1117/20171117024401390.jpg\" width=\"630\" height=\"420\"/></p></center><p style=\"text-align: center;\">图源网络</p><p>不管熟的不熟的，现在一律不收</p><p>代表：湖墅新村(准物业)</p><p>“物业帮忙代收快递吗?”14日，记者向一位物业人员询问。</p><p>“物业办公室怎么能收快递?不接收的，都是叫快递员直接送到家里。”</p><p>记者再问：为啥啊?</p><p>“早几年前代收过，还是帮熟人代收的，放在保安岗亭，不愉快的事情还是发生了。保安有时候要走出去上厕所，快递被人顺手牵羊拿走了，弄得很尴尬。所以现在，不管熟的不熟的，一律不收了。”</p><p>代收，先下载App</p><p>代表：万泰新语(南都物业，物业费每平方米每月2.1元，含能耗费)</p><p>物业工作人员说，快递要放物业服务中心可以，就是要下载一个App。物业内部文件下达了，要求无纸化办公。以前是在一个本子上登记，有人来拿快递，在本子上签字。现在要下载的App，是物业跟阿里巴巴合作的，收快递都要在App上面操作，包括你领了快递后，物业要在App上消单。14日，物业服务中心堆了上百件快递。</p><p>小区超市代收 一件一块钱</p><p>代表：三里亭东苑</p><p>14日19:33，王先生反映：我住三里亭东苑，现在快递多，物业不代收。快递员把东西送到小区超市代收点，也不打个电话或发个短信跟我们说一声，还要我们自己联系快递员，寻问快递下落。超市代收点收一个快递一块钱，钱不多，但是感觉强行让我们掏这个钱，总之很不舒服啊。</p><p>王先生双十一有16个快递，主要是书和衣服，还买了茶叶，茶叶订单显示已签收。但他并没有收到，打快递员电话，说放到超市了。</p><p>超市在居民楼下，王先生去取快递，报上名，店员告诉他在哪一堆货架上找，找到了，一个快递付一块钱，不需要登记核实，可以让别人代领。</p><p>“我们小区还有一家干洗店，是问快递员收费的，也是一件一块钱，所以快递员更愿意把包裹放在这家超市。”王先生说，现在超市里起码有上百件快递，不断有人送进来，不断有人拿走。一个双十一下来，估计能赚不少钱。</p><p>14日晚上，记者打电话到这家超市，一位男店员说，2014年就开始这么做了，老板特地租了个房子放快递。“现在房租多少贵啦!至于要不要放我这里，是他们跟快递员的事，跟我们不搭界，反正放我这里肯定要收费的。”</p><p>全部到架空层自取</p><p>快递员晚上跟快递睡在一起</p><p>代表：城东某小区(应报料人要求隐去小区名)</p><p>14日，城东某小区业主王女士发了条朋友圈：爆仓!小区的各个快递联合起来了，全部拉进来放在一起，分幢成堆，两个人守着，晚上也睡在那。</p><p>王女士14日提了一只大麻袋去装快递，双十一当天下了29单，之后几天，她一共要收29只包裹。14日，她又去架空层拿包裹，那里的包裹看来不止五六百只，邮柜全塞满了，这些快递按幢分成一堆一堆，只要跟快递员说是几幢的，他就会告诉你在哪一堆里找。</p><p>“我听快递员说，他弄了个棉被，晚上睡在那里看着快递，怕丢。”</p> ', 'ymx', '20180309', '1', null);
INSERT INTO `c_new` VALUES ('0739B531DFD144B18766A82EDAEE8ddf', '<h3>小区封闭管理快递当街\"摆摊\"</h3>', 'n2.jpg', '<p class=\"gray-5 pt10\">图源网络&ldquo;各位业主，这两天进入双十一快递高峰期，自11月11日起至月底，物业前台加班至晚上9:00...</p>', '<p><strong>小区封闭管理 快递员当街“摆摊”</strong></p><p><strong>物业将再次升级送货车 安全与方便可以兼得</strong></p><p style=\"text-align:center;text-indent: 0px;\"><img src=\"http://up-img.iwuye.com/2017/1115/20171115071736832.jpg\"/></p><p>双11刚过，这几天，对于家住望京利泽西园一区的居民来说，这个收“货”季可不太好过：快递包裹不能送货上门，需要到小区大门口自行领取；如果过时未领，大件包裹会被重新送回物流公司的分发部门；小区门口的便道上被大大小小的包裹占得满满当当。</p><p>这样的情况让小区业主抱怨纷纷。记者了解到，利泽西园一区今年下半年更换新物业后，于11月正式实行封闭式管理，非小区车辆被禁止进入小区，其中就包括快递车和送餐车。新办法得到了小区居民的认可，但遭到了几家快递公司的抵触。</p><p><strong>矛盾</strong></p><p><strong>快递只能送到小区门口</strong></p><p>“实行封闭管理，小区秩序大有改善，没想到收快递却添了麻烦。其实，小区准备了超市用的手推车，但快递员依然拒绝送货到家。”这是一位小区业主的帖子，里面提到的快递公司指的是“四通一达”——申通、圆通、中通、汇通、韵达。双11刚过，正是包裹派送的高峰期，这个帖子立即引起了大家的共鸣。</p><p>昨天下午，记者来到利泽西园一区一看究竟。刚到小区南门，就看到两侧人行道上铺满了各式各样的包裹，几辆快递车停放在一旁，快递员们正忙着分拣包裹，他们按楼号和包裹的大小，将成堆的快件大致分成了几小堆。</p><p>仅这分拣包裹的工夫，已有不少居民来取快件了。瑟瑟寒风中，居民们裹紧了棉衣。“小物件也就算了，我买的是一大箱苹果，真是扛不动。”一位上了岁数的老阿姨抱怨说，利泽西园一区面积不小，对于老人来说扛着一大箱东西回家实在有些艰难。而快递员给出的回复是，快递车不让进小区，所以只能大家自行领取包裹了。</p><p><strong>追问</strong></p><p><strong>管理和方便能否兼得？</strong></p><p>和很多老旧小区面临的问题一样，1998年左右入住的利泽西园一区有约900个停车位，可小区车辆超过1600辆，停车难一直以来都困扰着居民和物业。</p><p>“这么紧张的车位，经常会有快递车占用车位的情况出现。”物业的李经理告诉记者，他们今年7月16日接管小区后，多次收到了业主投诉，反映停车位被占、车辆被剐蹭。从剐蹭痕迹可以明显看出是非机动车所为。所以，新物业的第一步就是改善小区管理模式，增设门禁，从过去的开放式变成封闭管理。同时，启用车辆电子管理系统，非小区车辆一律严格禁进，包括快递车。</p><p>“我们的整改措施得到了街道、居委会、小区业委会的大力支持，大多数居民也十分认可，改造后小区安全有保障了。当然，也有一些居民认为收取快递不方便。”李经理说，考虑到这一点，他们在两个多月前发出了快递车禁入小区的通知，“问题还在于疏导，为了方便快递员送货，我们专门投入资金，购进12辆超市手推车。快递员到小区大门后，可以用手推车送货上门。”</p><p>利泽西园一区居民也证实了这一点。一位居民说，老物业一直是僵尸物业，他们的不作为令居民怨声载道。通过多方努力，小区成立业主委员会，启动更换物业的程序，所以才有了新物业的接管。小区现在打造的是花园式管理，街道、居委会为此也投入了大量资金和支持，改造了<a href=\"http://xuetang.iwuye.com/lvhuazhidu/\" target=\"_blank\" class=\"keylink\">绿化</a>、步道、太阳能节能灯等。</p><p>小区的封闭式管理也得到了多数快递公司的支持，比如京东、顺丰等，这些公司的快递员进入小区时严格遵守规定，有的还自己配备送货手推车。目前，确实只有“四通一达”五家公司的快递员不肯使用手推车，他们说手推车没有盖子，容易丢快件。</p><p><strong>解决</strong></p><p><strong>物业将再次升级送货车</strong></p><p>对于门口摊着的大堆包裹，快递员们也很无奈。一位快递员告诉记者：“我们进去要花更多时间了，上头也不让。”“上头”指的是公司区域经理， “其实我们也想送货上门，只不过上头觉得浪费时间。”快递员表示，现在只能看看物业能否适当放宽管理。</p><p>李先生解释，周边其他封闭式管理的小区也采用了同样的模式和做法，要想彻底改变利泽西园一区过去的乱象，需要严格的管理。虽然至今这几家快递公司的负责人都未与他沟通接洽此事，但物业方面还是决定把能提供的便利，尽最大可能提供给快递员，这样也是方便业主。经过业委会的认可，物业将准备购进可上锁的小型推货车，同时再配备一辆大型的电动车，方便快递员运送大件包裹。</p> ', 'ymx', '20180316', '2', null);

-- ----------------------------
-- Table structure for c_order
-- ----------------------------
DROP TABLE IF EXISTS `c_order`;
CREATE TABLE `c_order` (
  `oid` char(32) NOT NULL,
  `ordertime` char(19) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `uid8` (`uid`),
  CONSTRAINT `uid8` FOREIGN KEY (`uid`) REFERENCES `c_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_order
-- ----------------------------

-- ----------------------------
-- Table structure for c_orderitem
-- ----------------------------
DROP TABLE IF EXISTS `c_orderitem`;
CREATE TABLE `c_orderitem` (
  `orderItemId` char(32) NOT NULL,
  `quantity` int(255) DEFAULT NULL,
  `subtotal` decimal(8,2) DEFAULT NULL,
  `gid` char(32) DEFAULT NULL,
  `gname` varchar(200) DEFAULT NULL,
  `currPrice` decimal(8,2) DEFAULT NULL,
  `image_b` varchar(100) DEFAULT NULL,
  `oid` char(32) DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `oid` (`oid`),
  KEY `gid3` (`gid`),
  CONSTRAINT `gid3` FOREIGN KEY (`gid`) REFERENCES `c_good` (`gid`),
  CONSTRAINT `oid` FOREIGN KEY (`oid`) REFERENCES `c_order` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_orderitem
-- ----------------------------

-- ----------------------------
-- Table structure for c_user
-- ----------------------------
DROP TABLE IF EXISTS `c_user`;
CREATE TABLE `c_user` (
  `uid` char(32) NOT NULL,
  `loginname` varchar(50) DEFAULT NULL,
  `loginpass` varchar(50) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `cid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `activationCode` char(64) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_user
-- ----------------------------
INSERT INTO `c_user` VALUES ('21212', 'ymx', '111', null, null, null, null, null, '1', null);
