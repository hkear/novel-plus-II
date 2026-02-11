
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint DEFAULT NULL COMMENT '会员ID',
  `invite_code` varchar(20) DEFAULT NULL COMMENT '邀请码',
  `pen_name` varchar(20) DEFAULT NULL COMMENT '编撰',
  `tel_phone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `chat_account` varchar(50) DEFAULT NULL COMMENT 'QQ或微信账号',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `work_direction` tinyint DEFAULT NULL COMMENT '作品方向，0：书籍，1：文件',
  `status` tinyint DEFAULT '0' COMMENT '0：正常，1：封禁',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='编撰表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,NULL,'reerer','abc','13560487656','23484388','23484388@qq.com',0,0,NULL),(2,1255060328322027520,'rwrr445554','梦入神机','13560421324','1179705413','reerer@qq.com',0,0,'2025-05-13 14:01:31');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_code`
--

DROP TABLE IF EXISTS `author_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_code` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `invite_code` varchar(100) DEFAULT NULL COMMENT '邀请码',
  `validity_time` datetime DEFAULT NULL COMMENT '有效时间',
  `is_use` tinyint(1) DEFAULT '0' COMMENT '是否使用过，0：未使用，1:使用过',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_code` (`invite_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='编撰者邀请码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_code`
--

LOCK TABLES `author_code` WRITE;
/*!40000 ALTER TABLE `author_code` DISABLE KEYS */;
INSERT INTO `author_code` VALUES (3,'reerer','2025-05-27 22:43:45',1,'2025-05-13 11:40:56',1),(4,'123456','2025-05-28 00:00:00',0,'2025-05-13 14:09:55',1),(5,'ww34343','2025-05-21 00:00:00',0,'2025-05-13 14:18:58',1);
/*!40000 ALTER TABLE `author_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_income`
--

DROP TABLE IF EXISTS `author_income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_income` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '会员ID',
  `author_id` bigint NOT NULL COMMENT '编撰者ID',
  `book_id` bigint NOT NULL COMMENT '作品ID',
  `income_month` date NOT NULL COMMENT '收入月份',
  `pre_tax_income` bigint NOT NULL DEFAULT '0' COMMENT '税前收入（分）',
  `after_tax_income` bigint NOT NULL DEFAULT '0' COMMENT '税后收入（分）',
  `pay_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付状态，0：待支付，1：已支付',
  `confirm_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '稿费确认状态，0：待确认，1：已确认',
  `detail` varchar(255) DEFAULT NULL COMMENT '详情',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='稿费收入统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_income`
--

LOCK TABLES `author_income` WRITE;
/*!40000 ALTER TABLE `author_income` DISABLE KEYS */;
/*!40000 ALTER TABLE `author_income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_income_detail`
--

DROP TABLE IF EXISTS `author_income_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_income_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '会员ID',
  `author_id` bigint NOT NULL COMMENT '编撰者ID',
  `book_id` bigint NOT NULL DEFAULT '0' COMMENT '作品ID,0表示全部作品',
  `income_date` date NOT NULL COMMENT '收入日期',
  `income_account` int NOT NULL DEFAULT '0' COMMENT '订阅总额',
  `income_count` int NOT NULL DEFAULT '0' COMMENT '订阅次数',
  `income_number` int NOT NULL DEFAULT '0' COMMENT '订阅人数',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='稿费收入明细统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_income_detail`
--

LOCK TABLES `author_income_detail` WRITE;
/*!40000 ALTER TABLE `author_income_detail` DISABLE KEYS */;
INSERT INTO `author_income_detail` VALUES (1,2021117750151385088,3,2021117999511146496,'2026-02-10',0,0,0,'2026-02-11 00:00:00'),(2,2021117750151385088,3,0,'2026-02-10',0,0,0,'2026-02-11 00:00:00'),(3,1255060328322027520,2,0,'2026-02-10',0,0,0,'2026-02-11 00:00:00');
/*!40000 ALTER TABLE `author_income_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `work_direction` tinyint(1) DEFAULT NULL COMMENT '作品方向，0：书籍，1：文件''',
  `cat_id` int DEFAULT NULL COMMENT '分类ID',
  `cat_name` varchar(50) DEFAULT NULL COMMENT '分类名',
  `pic_url` varchar(200) NOT NULL COMMENT '书籍封面',
  `book_name` varchar(50) NOT NULL COMMENT '书籍名',
  `author_id` bigint DEFAULT NULL COMMENT '编撰id',
  `author_name` varchar(50) NOT NULL COMMENT '编撰名',
  `book_desc` varchar(2000) NOT NULL COMMENT '书籍描述',
  `score` float NOT NULL COMMENT '评分，预留字段',
  `book_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '书籍状态，0：连载中，1：已完结',
  `visit_count` bigint DEFAULT '103' COMMENT '点击量',
  `word_count` int DEFAULT NULL COMMENT '总字数',
  `comment_count` int DEFAULT '0' COMMENT '评论数',
  `yesterday_buy` int DEFAULT '0' COMMENT '昨日订阅数',
  `last_index_id` bigint DEFAULT NULL COMMENT '最新目录ID',
  `last_index_name` varchar(50) DEFAULT NULL COMMENT '最新目录名',
  `last_index_update_time` datetime DEFAULT NULL COMMENT '最新目录更新时间',
  `is_vip` tinyint(1) DEFAULT '0' COMMENT '是否收费，1：收费，0：免费',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态，0：入库，1：上架',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `crawl_source_id` int DEFAULT NULL COMMENT '爬虫源站ID',
  `crawl_book_id` varchar(32) DEFAULT NULL COMMENT '抓取的源站书籍ID',
  `crawl_last_time` datetime DEFAULT NULL COMMENT '最后一次的抓取时间',
  `crawl_is_stop` tinyint(1) DEFAULT '0' COMMENT '是否已停止更新，0：未停止，1：已停止',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_bookName_authorName` (`book_name`,`author_name`) USING BTREE,
  KEY `key_lastIndexUpdateTime` (`last_index_update_time`) USING BTREE,
  KEY `key_createTime` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1262260513468559361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='书籍表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_author`
--

DROP TABLE IF EXISTS `book_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_author` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `invite_code` varchar(20) DEFAULT NULL COMMENT '邀请码',
  `pen_name` varchar(20) DEFAULT NULL COMMENT '编撰',
  `tel_phone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `chat_account` varchar(50) DEFAULT NULL COMMENT 'QQ或微信账号',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `work_direction` tinyint DEFAULT NULL COMMENT '作品方向，0：书籍，1：文件',
  `status` tinyint DEFAULT NULL COMMENT '0：待审核，1：审核通过，正常，2：审核不通过',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint DEFAULT NULL COMMENT '申请人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user_id` bigint DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1254957873655066625 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='编撰表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_author`
--

LOCK TABLES `book_author` WRITE;
/*!40000 ALTER TABLE `book_author` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_category`
--

DROP TABLE IF EXISTS `book_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `direction_id` bigint DEFAULT NULL COMMENT '作品方向ID',
  `sort` int DEFAULT '10' COMMENT '排序',
  `custom_css` varchar(2000) DEFAULT NULL COMMENT '分类自定义CSS',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_category`
--

LOCK TABLES `book_category` WRITE;
/*!40000 ALTER TABLE `book_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_comment`
--

DROP TABLE IF EXISTS `book_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `book_id` bigint DEFAULT NULL COMMENT '书籍ID',
  `comment_content` varchar(512) DEFAULT NULL COMMENT '评价内容',
  `location` varchar(50) DEFAULT NULL COMMENT '地理位置',
  `reply_count` int DEFAULT '0' COMMENT '回复数量',
  `audit_status` tinyint(1) DEFAULT '0' COMMENT '审核状态，0：待审核，1：审核通过，2：审核不通过',
  `create_time` datetime DEFAULT NULL COMMENT '评价时间',
  `create_user_id` bigint DEFAULT NULL COMMENT '评价人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_bookid_userid` (`book_id`,`create_user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='书籍评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_comment`
--

LOCK TABLES `book_comment` WRITE;
/*!40000 ALTER TABLE `book_comment` DISABLE KEYS */;
INSERT INTO `book_comment` VALUES (11,1254678892443795456,'好书',NULL,0,0,'2025-04-28 17:04:56',1255060328322027520),(12,1254954626689150976,'ffgfgfffffffffff',NULL,0,0,'2025-04-30 08:35:53',1255060328322027520);
/*!40000 ALTER TABLE `book_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_comment_reply`
--

DROP TABLE IF EXISTS `book_comment_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_comment_reply` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `comment_id` bigint DEFAULT NULL COMMENT '评论ID',
  `reply_content` varchar(512) DEFAULT NULL COMMENT '回复内容',
  `location` varchar(50) DEFAULT NULL COMMENT '地理位置',
  `audit_status` tinyint(1) DEFAULT '0' COMMENT '审核状态，0：待审核，1：审核通过，2：审核不通过',
  `create_time` datetime DEFAULT NULL COMMENT '回复会员ID',
  `create_user_id` bigint DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='书籍评论回复表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_comment_reply`
--

LOCK TABLES `book_comment_reply` WRITE;
/*!40000 ALTER TABLE `book_comment_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_comment_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_content`
--

DROP TABLE IF EXISTS `book_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_content` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint DEFAULT NULL COMMENT '目录ID',
  `content` mediumtext COMMENT '书籍章节内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_indexId` (`index_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3347665 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='书籍内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_content`
--

LOCK TABLES `book_content` WRITE;
/*!40000 ALTER TABLE `book_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_content0`
--

DROP TABLE IF EXISTS `book_content0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_content0` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint DEFAULT NULL COMMENT '目录ID',
  `content` mediumtext COMMENT '书籍章节内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_indexId` (`index_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='书籍内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_content0`
--

LOCK TABLES `book_content0` WRITE;
/*!40000 ALTER TABLE `book_content0` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_content0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_content1`
--

DROP TABLE IF EXISTS `book_content1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_content1` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint DEFAULT NULL COMMENT '目录ID',
  `content` mediumtext COMMENT '书籍章节内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_indexId` (`index_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=406 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='书籍内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_content1`
--

LOCK TABLES `book_content1` WRITE;
/*!40000 ALTER TABLE `book_content1` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_content1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_content2`
--

DROP TABLE IF EXISTS `book_content2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_content2` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint DEFAULT NULL COMMENT '目录ID',
  `content` mediumtext COMMENT '书籍章节内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_indexId` (`index_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1222 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='书籍内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_content2`
--

LOCK TABLES `book_content2` WRITE;
/*!40000 ALTER TABLE `book_content2` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_content2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_content3`
--

DROP TABLE IF EXISTS `book_content3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_content3` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint DEFAULT NULL COMMENT '目录ID',
  `content` mediumtext COMMENT '书籍章节内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_indexId` (`index_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=410 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='书籍内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_content3`
--

LOCK TABLES `book_content3` WRITE;
/*!40000 ALTER TABLE `book_content3` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_content3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_content4`
--

DROP TABLE IF EXISTS `book_content4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_content4` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint DEFAULT NULL COMMENT '目录ID',
  `content` mediumtext COMMENT '书籍章节内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_indexId` (`index_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1188 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='书籍内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_content4`
--

LOCK TABLES `book_content4` WRITE;
/*!40000 ALTER TABLE `book_content4` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_content4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_content5`
--

DROP TABLE IF EXISTS `book_content5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_content5` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint DEFAULT NULL COMMENT '目录ID',
  `content` mediumtext COMMENT '书籍章节内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_indexId` (`index_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='书籍内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_content5`
--

LOCK TABLES `book_content5` WRITE;
/*!40000 ALTER TABLE `book_content5` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_content5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_content6`
--

DROP TABLE IF EXISTS `book_content6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_content6` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint DEFAULT NULL COMMENT '目录ID',
  `content` mediumtext COMMENT '书籍章节内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_indexId` (`index_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1180 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='书籍内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_content6`
--

LOCK TABLES `book_content6` WRITE;
/*!40000 ALTER TABLE `book_content6` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_content6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_content7`
--

DROP TABLE IF EXISTS `book_content7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_content7` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint DEFAULT NULL COMMENT '目录ID',
  `content` mediumtext COMMENT '书籍章节内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_indexId` (`index_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=404 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='书籍内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_content7`
--

LOCK TABLES `book_content7` WRITE;
/*!40000 ALTER TABLE `book_content7` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_content7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_content8`
--

DROP TABLE IF EXISTS `book_content8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_content8` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint DEFAULT NULL COMMENT '目录ID',
  `content` mediumtext COMMENT '书籍章节内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_indexId` (`index_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='书籍内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_content8`
--

LOCK TABLES `book_content8` WRITE;
/*!40000 ALTER TABLE `book_content8` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_content8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_content9`
--

DROP TABLE IF EXISTS `book_content9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_content9` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint DEFAULT NULL COMMENT '目录ID',
  `content` mediumtext COMMENT '书籍章节内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_indexId` (`index_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='书籍内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_content9`
--

LOCK TABLES `book_content9` WRITE;
/*!40000 ALTER TABLE `book_content9` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_content9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_index`
--

DROP TABLE IF EXISTS `book_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_index` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `book_id` bigint NOT NULL COMMENT '书籍ID',
  `index_num` int NOT NULL COMMENT '目录号',
  `index_name` varchar(100) DEFAULT NULL COMMENT '目录名',
  `word_count` int DEFAULT NULL COMMENT '字数',
  `is_vip` tinyint DEFAULT '0' COMMENT '是否收费，1：收费，0：免费',
  `book_price` int DEFAULT '0' COMMENT '章节费用（屋币）',
  `storage_type` varchar(10) NOT NULL DEFAULT 'db' COMMENT '存储方式',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_bookId_indexNum` (`book_id`,`index_num`) USING BTREE,
  KEY `key_bookId` (`book_id`) USING BTREE,
  KEY `key_indexNum` (`index_num`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1262260612777095169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='书籍目录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_index`
--

LOCK TABLES `book_index` WRITE;
/*!40000 ALTER TABLE `book_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_screen_bullet`
--

DROP TABLE IF EXISTS `book_screen_bullet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_screen_bullet` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content_id` bigint NOT NULL COMMENT '书籍内容ID',
  `screen_bullet` varchar(512) NOT NULL COMMENT '书籍弹幕内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `key_contentId` (`content_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='书籍弹幕表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_screen_bullet`
--

LOCK TABLES `book_screen_bullet` WRITE;
/*!40000 ALTER TABLE `book_screen_bullet` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_screen_bullet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_setting`
--

DROP TABLE IF EXISTS `book_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_setting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `book_id` bigint DEFAULT NULL COMMENT '书籍ID',
  `sort` tinyint DEFAULT NULL COMMENT '排序号',
  `type` tinyint(1) DEFAULT NULL COMMENT '类型，0：轮播图，1：顶部书籍栏设置，2：本周强推，3：热门推荐，4：精品推荐',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user_id` bigint DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='首页书籍设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_setting`
--

LOCK TABLES `book_setting` WRITE;
/*!40000 ALTER TABLE `book_setting` DISABLE KEYS */;
INSERT INTO `book_setting` VALUES (32,1254674114481422336,1,0,'2025-04-27 15:45:58',NULL,'2025-04-27 15:46:03',NULL),(33,1254674171310047232,2,0,'2025-04-27 15:46:21',NULL,'2025-04-27 15:46:24',NULL),(34,1254674255883993088,3,0,'2025-04-27 15:47:06',NULL,'2025-04-27 15:47:09',NULL),(35,1254674396451897344,4,0,'2025-04-27 15:47:24',NULL,'2025-04-27 15:47:27',NULL),(36,1254674613117059072,1,1,NULL,NULL,NULL,NULL),(37,1254680030366859264,2,1,NULL,NULL,NULL,NULL),(38,1254677251162308608,3,1,NULL,NULL,NULL,NULL),(39,1254677745226153984,4,1,NULL,NULL,NULL,NULL),(40,1254677887534694400,5,1,NULL,NULL,NULL,NULL),(41,1254675594315759616,1,2,NULL,NULL,NULL,NULL),(42,1254675739140882432,2,2,NULL,NULL,NULL,NULL),(43,1254675826696978432,3,2,NULL,NULL,NULL,NULL),(44,1254676309448785920,4,2,NULL,NULL,NULL,NULL),(45,1254676443012202496,5,2,NULL,NULL,NULL,NULL),(46,1254676564366000128,6,2,NULL,NULL,NULL,NULL),(47,1254676970567565312,1,3,NULL,NULL,NULL,NULL),(48,1254677251162308608,2,3,NULL,NULL,NULL,NULL),(49,1254677745226153984,3,3,NULL,NULL,NULL,NULL),(50,1254677887534694400,4,3,NULL,NULL,NULL,NULL),(51,1254675826696978432,5,3,NULL,NULL,NULL,NULL),(52,1254676970567565312,6,3,NULL,NULL,NULL,NULL),(53,1254681827219275776,1,4,NULL,NULL,NULL,NULL),(54,1254681178427555840,2,4,NULL,NULL,NULL,NULL),(55,1254681827219275776,3,4,NULL,NULL,NULL,NULL),(56,1254681753466634240,4,4,NULL,NULL,NULL,NULL),(57,1254682148440047616,5,4,NULL,NULL,NULL,NULL),(58,1254682422076440576,6,4,NULL,NULL,NULL,NULL),(59,1254674794009001984,6,1,NULL,NULL,NULL,NULL),(60,1254678892443795456,7,1,NULL,NULL,NULL,NULL),(61,1254681753466634240,8,1,NULL,NULL,NULL,NULL),(62,1254681071191785472,9,1,NULL,NULL,NULL,NULL),(63,1254677745226153984,10,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `book_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crawl_batch_task`
--

DROP TABLE IF EXISTS `crawl_batch_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crawl_batch_task` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `source_id` int DEFAULT NULL COMMENT '爬虫源ID',
  `crawl_count_success` int DEFAULT NULL COMMENT '成功抓取数量',
  `crawl_count_target` int DEFAULT NULL COMMENT '目标抓取数量',
  `task_status` tinyint(1) DEFAULT '1' COMMENT '任务状态，1：正在运行，0已停止',
  `start_time` datetime DEFAULT NULL COMMENT '任务开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '任务结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='批量抓取任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crawl_batch_task`
--

LOCK TABLES `crawl_batch_task` WRITE;
/*!40000 ALTER TABLE `crawl_batch_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `crawl_batch_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crawl_single_task`
--

DROP TABLE IF EXISTS `crawl_single_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crawl_single_task` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `source_id` int DEFAULT NULL COMMENT '爬虫源ID',
  `source_name` varchar(50) DEFAULT NULL COMMENT '爬虫源名',
  `source_book_id` varchar(255) DEFAULT NULL COMMENT '源站书籍ID',
  `cat_id` int DEFAULT NULL COMMENT '分类ID',
  `book_name` varchar(50) DEFAULT NULL COMMENT '爬取的书籍名',
  `author_name` varchar(50) DEFAULT NULL COMMENT '爬取的书籍编撰名',
  `task_status` tinyint(1) DEFAULT '2' COMMENT '任务状态，0：失败，1：成功，2；未执行',
  `exc_count` tinyint DEFAULT '0' COMMENT '已经执行次数，最多执行5次',
  `crawl_chapters` int DEFAULT '0' COMMENT '采集章节数量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='抓取单本书籍任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crawl_single_task`
--

LOCK TABLES `crawl_single_task` WRITE;
/*!40000 ALTER TABLE `crawl_single_task` DISABLE KEYS */;
INSERT INTO `crawl_single_task` VALUES (6,2,'百书斋','1',1,'1','1',0,5,0,'2025-06-15 14:36:07'),(7,5,'笔趣阁','108_108291',1,'衍天志之不朽仙','白衣少年丶',1,1,0,'2025-06-15 14:46:08');
/*!40000 ALTER TABLE `crawl_single_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crawl_source`
--

DROP TABLE IF EXISTS `crawl_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crawl_source` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `source_name` varchar(50) DEFAULT NULL COMMENT '源站名',
  `crawl_rule` text COMMENT '爬取规则（json串）',
  `source_status` tinyint(1) DEFAULT '0' COMMENT '爬虫源状态，0：关闭，1：开启',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='爬虫源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crawl_source`
--

LOCK TABLES `crawl_source` WRITE;
/*!40000 ALTER TABLE `crawl_source` DISABLE KEYS */;
INSERT INTO `crawl_source` VALUES (2,'百书斋','{\r\n	\"bookListUrl\": \"https://m.baishuzhai.com/blhb/{catId}/{page}.html\",\r\n	\"catIdRule\": {\r\n		\"catId1\": \"1\",\r\n		\"catId2\": \"2\",\r\n		\"catId3\": \"3\",\r\n		\"catId4\": \"4\",\r\n		\"catId5\": \"5\",\r\n		\"catId6\": \"6\",\r\n		\"catId7\": \"7\"\r\n	},\r\n	\"bookIdPatten\": \"href=\\\"/ibook/(\\\\d+/\\\\d+)/\\\"\",\r\n	\"pagePatten\": \"value=\\\"(\\\\d+)/\\\\d+\\\"\",\r\n	\"totalPagePatten\": \"value=\\\"\\\\d+/(\\\\d+)\\\"\",\r\n	\"bookDetailUrl\": \"https://m.baishuzhai.com/ibook/{bookId}/\",\r\n	\"bookNamePatten\": \"<span class=\\\"title\\\">([^/]+)</span>\",\r\n	\"authorNamePatten\": \">编撰：([^/]+)<\",\r\n	\"picUrlPatten\": \"<img src=\\\"([^>]+)\\\"\\\\s+onerror=\\\"this.src=\",\r\n	\"statusPatten\": \"状态：([^/]+)</li>\",\r\n	\"bookStatusRule\": {\r\n		\"连载\": 0,\r\n		\"完成\": 1\r\n	},\r\n	\"scorePatten\": \"<em>([^<]+)</em>\",\r\n	\"descStart\": \"<p class=\\\"review\\\">\",\r\n	\"descEnd\": \"</p>\",\r\n	\"upadateTimePatten\": \"更新：(\\\\d+-\\\\d+-\\\\d+)</li>\",\r\n	\"upadateTimeFormatPatten\": \"yy-MM-dd\",\r\n	\"bookIndexUrl\": \"https://m.baishuzhai.com/ibook/{bookId}/all.html\",\r\n	\"indexIdPatten\": \"<a\\\\s+style=\\\"\\\"\\\\s+href=\\\"/ibook/\\\\d+/\\\\d+/(\\\\d+)\\\\.html\\\">[^/]+</a>\",\r\n	\"indexNamePatten\": \"<a\\\\s+style=\\\"\\\"\\\\s+href=\\\"/ibook/\\\\d+/\\\\d+/\\\\d+\\\\.html\\\">([^/]+)</a>\",\r\n	\"bookContentUrl\": \"https://baishuzhai.com/ibook/{bookId}/{indexId}.html\",\r\n	\"contentStart\": \"id=\\\"content\\\">\",\r\n	\"contentEnd\": \"<script>\"\r\n}',0,'2025-05-01 14:22:50','2025-05-01 14:22:50'),(3,'书包网','{\r\n	\"bookListUrl\": \"https://www.bookbao8.com/booklist-p_{page}-c_{catId}-t_0-o_0.html\",\r\n	\"catIdRule\": {\r\n		\"catId1\": \"5\",\r\n		\"catId2\": \"4\",\r\n		\"catId3\": \"8\",\r\n		\"catId4\": \"9\",\r\n		\"catId5\": \"3\",\r\n		\"catId6\": \"7\"\r\n	},\r\n	\"bookIdPatten\": \"href=\\\"/book/(\\\\d+/\\\\d+/id_[^.]+).html\\\"\",\r\n	\"pagePatten\": \"<span\\\\s+class=\\\"current\\\">([^<]+)</span>\",\r\n	\"totalPagePatten\": \"/共(\\\\d+)页\",\r\n	\"bookDetailUrl\": \"https://www.bookbao8.com/book/{bookId}.html\",\r\n	\"bookNamePatten\": \"<div\\\\s+id=\\\"info\\\">\\\\s*<h1>([^<]+)</h1>\",\r\n	\"authorNamePatten\": \"<p>编撰：<a\\\\s+href=\\\"/Search/[^\\\"]+\\\"\\\\s+target=\\\"_blank\\\">([^<]+)</a></p>\",\r\n	\"picUrlPatten\": \"<div\\\\s+id=\\\"fmimg\\\">\\\\s*<img\\\\s+alt=\\\"[^\\\"]+\\\"\\\\s+src=\\\"([^\\\"]+)\\\"\",\r\n	\"statusPatten\": \"<p>状态：([^<]+)</p>\",\r\n	\"bookStatusRule\": {\r\n		\"连载中\": 0,\r\n		\"已完结\": 1\r\n	},\r\n	\"visitCountPatten\": \"<em\\\\s+id=\\\"hits\\\">(\\\\d+)</em>\",\r\n	\"descStart\": \"<div class=\\\"infocontent\\\">\",\r\n	\"descEnd\": \"</div>\",\r\n	\"upadateTimePatten\": \"<p>更新时间：(\\\\d+-\\\\d+-\\\\d+\\\\s\\\\d+:\\\\d+:\\\\d+)</p>\",\r\n	\"upadateTimeFormatPatten\": \"yyyy-MM-dd HH:mm:ss\",\r\n	\"bookIndexUrl\": \"https://www.bookbao8.com/book/{bookId}.html\",\r\n	\"indexIdPatten\": \"<li>\\\\s*<a\\\\s+href=\\\"/views/\\\\d+/\\\\d+/id_[^_]+_(\\\\d+).html\\\"\\\\s+target=\\\"_blank\\\">\",\r\n	\"indexNamePatten\": \"<li>\\\\s*<a\\\\s+href=\\\"/views/\\\\d+/\\\\d+/id_[^_]+_\\\\d+.html\\\"\\\\s+target=\\\"_blank\\\">([^<]+)</a>\",\r\n	\"bookContentUrl\": \"https://www.bookbao8.com/views/{bookId}_{indexId}.html\",\r\n	\"contentStart\": \"<dd id=\\\"contents\\\">\",\r\n	\"contentEnd\": \"</dd>\"\r\n}',0,'2025-05-04 17:42:22','2025-05-04 17:42:22'),(4,'书趣阁','{\n	\"bookListUrl\": \"http://m.shuquge.com/sort/{catId}/0_{page}.html\",\n	\"catIdRule\": {\n		\"catId1\": \"1\",\n		\"catId2\": \"2\",\n		\"catId3\": \"3\",\n		\"catId4\": \"4\",\n		\"catId5\": \"7\",\n		\"catId6\": \"6\",\n		\"catId7\": \"8\"\n	},\n	\"bookIdPatten\": \"href=\\\"/s/(\\\\d+)\\\\.html\\\"\",\n	\"pagePatten\": \"第(\\\\d+)/\\\\d+页\",\n	\"totalPagePatten\": \"第\\\\d+/(\\\\d+)页\",\n	\"bookDetailUrl\": \"http://m.shuquge.com/s/{bookId}.html\",\n	\"bookNamePatten\": \"<a\\\\s+href=\\\"/s/\\\\d+\\\\.html\\\"><h2>([^/]+)</h2></a>\",\n	\"authorNamePatten\": \"<p>编撰：([^/]+)</p>\",\n	\"picUrlPatten\": \"src=\\\"(http://www.shuquge.com/files/article/image/\\\\d+/\\\\d+/\\\\d+s\\\\.jpg)\\\"\",\n	\"statusPatten\": \"<p>状态：([^/]+)</p>\",\n	\"bookStatusRule\": {\n		\"连载中\": 0,\n		\"完本\": 1\n	},\n	\"descStart\": \"<div class=\\\"intro_info\\\">\",\n	\"descEnd\": \"最新章节推荐地址\",\n	\"bookIndexUrl\": \"http://www.shuquge.com/txt/{bookId}/index.html\",\n	\"bookIndexStart\": \"<dt>《\",\n	\"indexIdPatten\": \"<dd><a\\\\s+href=\\\"(\\\\d+)\\\\.html\\\">[^/]+</a></dd>\",\n	\"indexNamePatten\": \"<dd><a\\\\s+href=\\\"\\\\d+\\\\.html\\\">([^/]+)</a></dd>\",\n	\"bookContentUrl\": \"http://www.shuquge.com/txt/{bookId}/{indexId}.html\",\n	\"contentStart\": \"<div id=\\\"content\\\" class=\\\"showtxt\\\">\",\n	\"contentEnd\": \"http://www.shuquge.com\"\n}',1,'2025-05-18 12:02:34','2025-05-18 12:02:34'),(5,'笔趣阁','{\"bookListUrl\":\"http://m.mcmssc.com/xclass/{catId}/{page}.html\",\"catIdRule\":{\"catId1\":\"1\",\"catId2\":\"2\",\"catId3\":\"3\",\"catId4\":\"4\",\"catId5\":\"5\",\"catId6\":\"6\",\"catId7\":\"7\"},\"bookIdPatten\":\"href=\\\"/(\\\\d+_\\\\d+)/\\\"\",\"pagePatten\":\"class=\\\"page_txt\\\"\\\\s+value=\\\"(\\\\d+)/\\\\d+\\\"\\\\s+size=\",\"totalPagePatten\":\"class=\\\"page_txt\\\"\\\\s+value=\\\"\\\\d+/(\\\\d+)\\\"\\\\s+size=\",\"bookDetailUrl\":\"http://m.mcmssc.com/{bookId}/\",\"bookNamePatten\":\"<span\\\\s+class=\\\"title\\\">([^/]+)</span>\",\"authorNamePatten\":\"<a\\\\s+href=\\\"/author/\\\\d+/\\\">([^/]+)</a>\",\"picUrlPatten\":\"<img\\\\s+src=\\\"([^>]+)\\\"\\\\s+onerror=\",\"picUrlPrefix\":\"http://m.mcmssc.com/\",\"statusPatten\":\">状态：([^/]+)<\",\"bookStatusRule\":{\"连载\":0,\"全本\":1},\"visitCountPatten\":\">点击：(\\\\d+)<\",\"descStart\":\"<p class=\\\"review\\\">\",\"descEnd\":\"</p>\",\"bookIndexUrl\":\"http://m.mcmssc.com/{bookId}/all.html\",\"indexIdPatten\":\"<a\\\\s+href=\\\"/\\\\d+_\\\\d+/(\\\\d+)\\\\.html\\\">[^/]+</a>\",\"indexNamePatten\":\"<a\\\\s+href=\\\"/\\\\d+_\\\\d+/\\\\d+\\\\.html\\\">([^/]+)</a>\",\"bookContentUrl\":\"http://www.mcmssc.com/{bookId}/{indexId}.html\",\"contentStart\":\"</p>\",\"contentEnd\":\"<div align=\\\"center\\\">\"}',1,'2025-05-18 15:57:41','2025-05-18 15:57:41'),(16,'i笔趣阁','{\"bookListUrl\":\"http://m.biquxs.info/xclass/{catId}/{page}.html\",\"catIdRule\":{\"catId1\":\"1\",\"catId2\":\"2\",\"catId3\":\"3\",\"catId4\":\"4\",\"catId5\":\"6\",\"catId6\":\"5\",\"catId7\":\"7\"},\"bookIdPatten\":\"href=\\\"/(\\\\d+_\\\\d+)/\\\"\",\"pagePatten\":\"value=\\\"(\\\\d+)/\\\\d+\\\"\",\"totalPagePatten\":\"value=\\\"\\\\d+/(\\\\d+)\\\"\",\"bookDetailUrl\":\"http://m.biquxs.info/{bookId}/\",\"bookNamePatten\":\"<span class=\\\"title\\\">([^/]+)</span>\",\"authorNamePatten\":\"<a href=\\\"/author/\\\\d+/\\\">([^/]+)</a>\",\"picUrlPatten\":\"<img src=\\\"([^>]+)\\\"\\\\s+onerror=\\\"this.src=\",\"picUrlPrefix\":\"http://m.biquxs.info\",\"statusPatten\":\">状态：([^/]+)</li>\",\"bookStatusRule\":{\"连载\":0,\"完结\":1},\"visitCountPatten\":\">点击：(\\\\d+)</li>\",\"descStart\":\"<p class=\\\"review\\\">\",\"descEnd\":\"</p>\",\"bookIndexUrl\":\"http://www.biquxs.info/{bookId}/\",\"bookIndexStart\":\"正文</dt>\",\"indexIdPatten\":\"<a\\\\s+style=\\\"\\\"\\\\s+href=\\\"/\\\\d+_\\\\d+/(\\\\d+)\\\\.html\\\">[^/]+</a>\",\"indexNamePatten\":\"<a\\\\s+style=\\\"\\\"\\\\s+href=\\\"/\\\\d+_\\\\d+/\\\\d+\\\\.html\\\">([^/]+)</a>\",\"bookContentUrl\":\"http://www.biquxs.info/{bookId}/{indexId}.html\",\"contentStart\":\"</p>\",\"contentEnd\":\"<div align=\\\"center\\\">\"}',0,'2021-02-04 21:31:23','2021-02-04 21:31:23'),(17,'香书书籍网','{\n  \"bookListUrl\": \"http://www.xbiqugu.la/fenlei/{catId}_{page}.html\",\n  \"catIdRule\": {\n    \"catId1\": \"1\",\n    \"catId2\": \"2\",\n    \"catId3\": \"3\",\n    \"catId4\": \"4\",\n    \"catId5\": \"6\",\n    \"catId6\": \"5\"\n  },\n  \"bookIdPatten\": \"<a\\\\s+href=\\\"http://www.xbiqugu.la/(\\\\d+/\\\\d+)/\\\"\\\\s+target=\\\"_blank\\\">\",\n  \"pagePatten\": \"<em\\\\s+id=\\\"pagestats\\\">(\\\\d+)/\\\\d+</em>\",\n  \"totalPagePatten\": \"<em\\\\s+id=\\\"pagestats\\\">\\\\d+/(\\\\d+)</em>\",\n  \"bookDetailUrl\": \"http://www.xbiqugu.la/{bookId}/\",\n  \"bookNamePatten\": \"<h1>([^/]+)</h1>\",\n  \"authorNamePatten\": \"者：([^/]+)</p>\",\n  \"picUrlPatten\": \"src=\\\"(http://www.xbiqugu.la/files/article/image/\\\\d+/\\\\d+/\\\\d+s\\\\.jpg)\\\"\",\n  \"bookStatusRule\": {},\n  \"descStart\": \"<div id=\\\"intro\\\">\",\n  \"descEnd\": \"</div>\",\n  \"upadateTimePatten\": \"<p>最后更新：(\\\\d+-\\\\d+-\\\\d+\\\\s\\\\d+:\\\\d+:\\\\d+)</p>\",\n  \"upadateTimeFormatPatten\": \"yyyy-MM-dd HH:mm:ss\",\n  \"bookIndexUrl\": \"http://www.xbiqugu.la/{bookId}/\",\n  \"indexIdPatten\": \"<a\\\\s+href=\'/\\\\d+/\\\\d+/(\\\\d+)\\\\.html\'\\\\s+>[^/]+</a>\",\n  \"indexNamePatten\": \"<a\\\\s+href=\'/\\\\d+/\\\\d+/\\\\d+\\\\.html\'\\\\s+>([^/]+)</a>\",\n  \"bookContentUrl\": \"http://www.xbiqugu.la/{bookId}/{indexId}.html\",\n  \"contentStart\": \"<div id=\\\"content\\\">\",\n  \"contentEnd\": \"<p>\",\n  \"filterContent\":\"<div\\\\s+id=\\\"content_tip\\\">\\\\s*<b>([^/]+)</b>\\\\s*</div>\"\n}',0,'2024-06-01 10:11:39','2024-06-01 10:11:39'),(18,'飘天文学网（海外专用）','{\n    \"bookListUrl\": \"https://www.piaotia.com/booksort{catId}/{page}.html\",\n    \"catIdRule\": {\n        \"catId1\": \"1/0\",\n        \"catId2\": \"2/0\",\n        \"catId3\": \"3/0\",\n        \"catId4\": \"4/0\",\n        \"catId5\": \"6/0\",\n        \"catId6\": \"5/0\"\n    },\n    \"bookIdPatten\": \"href=\\\"https://www.piaotia.com/bookinfo/(\\\\d+/\\\\d+).html\\\"\",\n    \"pagePatten\": \"<em\\\\s+id=\\\"pagestats\\\">(\\\\d+)/\\\\d+</em>\",\n    \"totalPagePatten\": \"<em\\\\s+id=\\\"pagestats\\\">\\\\d+/(\\\\d+)</em>\",\n    \"bookDetailUrl\": \"https://www.piaotia.com/bookinfo/{bookId}.html\",\n    \"bookNamePatten\": \"<h1>([^/]+)</h1>\",\n    \"authorNamePatten\": \"<td\\\\s+width=\\\"\\\\d+%\\\">作&nbsp;&nbsp;&nbsp; 者：([^/]+)<\",\n    \"picUrlPatten\": \"<img\\\\s+src=\\\"(https://www.piaotia.com/files/article/image/[^\\\"]+)\\\"\",\n    \"statusPatten\": \"<td>文章状态：([^/]+)</td>\",\n    \"bookStatusRule\": {\n        \"连载中\": 0,\n        \"已完成\": 1\n    },\n    \"descStart\": \" <span class=\\\"hottext\\\">内容简介：</span><br />\",\n    \"descEnd\": \"</td>\",\n    \"filterDesc\": \"\",\n    \"bookIndexUrl\": \"https://www.piaotia.com/html/{bookId}/index.html\",\n    \"indexIdPatten\": \"<li><a href=\\\"(\\\\d+).html\\\">[^/]+</a></li>\",\n    \"indexNamePatten\": \"<li><a href=\\\"\\\\d+.html\\\">([^/]+)</a></li>\",\n    \"bookContentUrl\": \"https://www.piaotia.com/html/{bookId}/{indexId}.html\",\n    \"contentStart\": \"<br>\",\n    \"contentEnd\": \"</div>\",\n    \"filterContent\": \"\",\n    \"charset\": \"gbk\"\n}',0,'2025-07-13 18:57:39','2025-07-13 18:57:39');
/*!40000 ALTER TABLE `crawl_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_link`
--

DROP TABLE IF EXISTS `friend_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_link` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `link_name` varchar(50) NOT NULL COMMENT '链接名',
  `link_url` varchar(100) NOT NULL COMMENT '链接url',
  `sort` tinyint NOT NULL DEFAULT '11' COMMENT '排序号',
  `is_open` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否开启，0：不开启，1：开启',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint DEFAULT NULL COMMENT '更新者会员id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_link`
--

LOCK TABLES `friend_link` WRITE;
/*!40000 ALTER TABLE `friend_link` DISABLE KEYS */;
INSERT INTO `friend_link` VALUES (5,'书籍精品屋','https://novel.xxyopen.com',11,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `friend_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cat_id` int DEFAULT NULL COMMENT '类别ID',
  `cat_name` varchar(50) DEFAULT NULL COMMENT '分类名',
  `source_name` varchar(50) DEFAULT NULL COMMENT '来源',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `read_count` bigint NOT NULL DEFAULT '0' COMMENT '阅读量',
  `create_time` datetime DEFAULT NULL COMMENT '发布时间',
  `create_user_id` bigint DEFAULT NULL COMMENT '发布人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user_id` bigint DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='新闻表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,1,'行业','未知','阅文推“单本可选新合同”：授权分级、免费或付费自选','阅文推“单本可选新合同”：授权分级、免费或付费自选',0,'2025-04-27 15:42:21',NULL,'2025-04-27 15:42:26',NULL),(2,3,'资讯','全媒派公众号','AI书籍悄然流行：人类特有的创作力，已经被AI复制？','AI书籍悄然流行：人类特有的创作力，已经被AI复制？',0,'2025-04-28 15:44:07',NULL,'2025-04-28 15:44:12',NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_category`
--

DROP TABLE IF EXISTS `news_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_category` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) NOT NULL COMMENT '分类名',
  `sort` tinyint NOT NULL DEFAULT '10' COMMENT '排序',
  `create_user_id` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_user_id` bigint DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='新闻类别表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_category`
--

LOCK TABLES `news_category` WRITE;
/*!40000 ALTER TABLE `news_category` DISABLE KEYS */;
INSERT INTO `news_category` VALUES (1,'行业',10,NULL,NULL,NULL,NULL),(3,'资讯',11,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `news_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_pay`
--

DROP TABLE IF EXISTS `order_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_pay` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `out_trade_no` bigint NOT NULL COMMENT '商户订单号',
  `trade_no` varchar(64) DEFAULT NULL COMMENT '支付宝/微信交易号',
  `pay_channel` tinyint(1) NOT NULL DEFAULT '1' COMMENT '支付渠道，1：支付宝，2：微信',
  `total_amount` int NOT NULL COMMENT '交易金额(单位元)',
  `user_id` bigint NOT NULL COMMENT '支付会员ID',
  `pay_status` tinyint(1) DEFAULT '2' COMMENT '支付状态：0：支付失败，1：支付成功，2：待支付',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='充值订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_pay`
--

LOCK TABLES `order_pay` WRITE;
/*!40000 ALTER TABLE `order_pay` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_data_perm`
--

DROP TABLE IF EXISTS `sys_data_perm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_data_perm` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '权限名称',
  `table_name` varchar(50) DEFAULT NULL COMMENT '数据表名称',
  `module_name` varchar(50) DEFAULT NULL COMMENT '所属模块',
  `crl_attr_name` varchar(50) DEFAULT NULL COMMENT '会员权限控制属性名',
  `crl_column_name` varchar(50) DEFAULT NULL COMMENT '数据表权限控制列名',
  `perm_code` varchar(50) DEFAULT NULL COMMENT '权限code，all_开头表示查看所有数据的权限，sup_开头表示查看下级数据的权限，own_开头表示查看本级数据的权限',
  `order_num` int DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb3 COMMENT='数据权限管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_data_perm`
--

LOCK TABLES `sys_data_perm` WRITE;
/*!40000 ALTER TABLE `sys_data_perm` DISABLE KEYS */;
INSERT INTO `sys_data_perm` VALUES (210,'查看会员表全部数据','sys_user','会员管理','deptId','dept_id','all_dept_sys_user',1,NULL,NULL),(211,'查看会员表下级部门数据','sys_user','会员管理','deptId','dept_id','sup_dept_sys_user',2,NULL,NULL),(212,'查看会员表本部门数据','sys_user','会员管理','deptId','dept_id','own_dept_sys_user',3,NULL,NULL),(213,'查看会员表个人数据','sys_user','会员管理','userId','user_id','own_user_sys_user',4,NULL,NULL),(214,'查看下级部门订单数据','fb_order','订单管理','deptId','dept_id','sup_dept_fb_order',2,NULL,NULL),(215,'查看本部门订单数据','fb_order','订单管理','deptId','dept_id','own_dept_fb_order',3,NULL,NULL);
/*!40000 ALTER TABLE `sys_data_perm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COMMENT='部门管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (13,0,'三洞四辅',5,1),(14,13,'编撰',1,1),(15,13,'辅助',2,1),(16,13,'后台',13,1);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `parent_id` bigint DEFAULT '0' COMMENT '父级编号',
  `create_by` int DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`name`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict`
--

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` VALUES (1,'正常','0','del_flag','删除标记',10,0,1,NULL,1,NULL,NULL,'0'),(3,'显示','1','show_hide','显示/隐藏',10,0,1,NULL,1,NULL,NULL,'0'),(4,'隐藏','0','show_hide','显示/隐藏',20,0,1,NULL,1,NULL,NULL,'0'),(5,'是','1','yes_no','是/否',10,0,1,NULL,1,NULL,NULL,'0'),(6,'否','0','yes_no','是/否',20,0,1,NULL,1,NULL,NULL,'0'),(7,'红色','red','color','颜色值',10,0,1,NULL,1,NULL,NULL,'0'),(8,'绿色','green','color','颜色值',20,0,1,NULL,1,NULL,NULL,'0'),(9,'蓝色','blue','color','颜色值',30,0,1,NULL,1,NULL,NULL,'0'),(10,'黄色','yellow','color','颜色值',40,0,1,NULL,1,NULL,NULL,'0'),(11,'橙色','orange','color','颜色值',50,0,1,NULL,1,NULL,NULL,'0'),(12,'默认主题','default','theme','主题方案',10,0,1,NULL,1,NULL,NULL,'0'),(13,'天蓝主题','cerulean','theme','主题方案',20,0,1,NULL,1,NULL,NULL,'0'),(14,'橙色主题','readable','theme','主题方案',30,0,1,NULL,1,NULL,NULL,'0'),(15,'红色主题','united','theme','主题方案',40,0,1,NULL,1,NULL,NULL,'0'),(16,'Flat主题','flat','theme','主题方案',60,0,1,NULL,1,NULL,NULL,'0'),(17,'国家','1','sys_area_type','区域类型',10,0,1,NULL,1,NULL,NULL,'0'),(18,'省份、直辖市','2','sys_area_type','区域类型',20,0,1,NULL,1,NULL,NULL,'0'),(19,'地市','3','sys_area_type','区域类型',30,0,1,NULL,1,NULL,NULL,'0'),(20,'区县','4','sys_area_type','区域类型',40,0,1,NULL,1,NULL,NULL,'0'),(21,'公司','1','sys_office_type','机构类型',60,0,1,NULL,1,NULL,NULL,'0'),(22,'部门','2','sys_office_type','机构类型',70,0,1,NULL,1,NULL,NULL,'0'),(23,'小组','3','sys_office_type','机构类型',80,0,1,NULL,1,NULL,NULL,'0'),(24,'其它','4','sys_office_type','机构类型',90,0,1,NULL,1,NULL,NULL,'0'),(25,'综合部','1','sys_office_common','快捷通用部门',30,0,1,NULL,1,NULL,NULL,'0'),(26,'开发部','2','sys_office_common','快捷通用部门',40,0,1,NULL,1,NULL,NULL,'0'),(27,'人力部','3','sys_office_common','快捷通用部门',50,0,1,NULL,1,NULL,NULL,'0'),(28,'一级','1','sys_office_grade','机构等级',10,0,1,NULL,1,NULL,NULL,'0'),(29,'二级','2','sys_office_grade','机构等级',20,0,1,NULL,1,NULL,NULL,'0'),(30,'三级','3','sys_office_grade','机构等级',30,0,1,NULL,1,NULL,NULL,'0'),(31,'四级','4','sys_office_grade','机构等级',40,0,1,NULL,1,NULL,NULL,'0'),(32,'所有数据','1','sys_data_scope','数据范围',10,0,1,NULL,1,NULL,NULL,'0'),(33,'所在公司及以下数据','2','sys_data_scope','数据范围',20,0,1,NULL,1,NULL,NULL,'0'),(34,'所在公司数据','3','sys_data_scope','数据范围',30,0,1,NULL,1,NULL,NULL,'0'),(35,'所在部门及以下数据','4','sys_data_scope','数据范围',40,0,1,NULL,1,NULL,NULL,'0'),(36,'所在部门数据','5','sys_data_scope','数据范围',50,0,1,NULL,1,NULL,NULL,'0'),(37,'仅本人数据','8','sys_data_scope','数据范围',90,0,1,NULL,1,NULL,NULL,'0'),(38,'按明细设置','9','sys_data_scope','数据范围',100,0,1,NULL,1,NULL,NULL,'0'),(39,'系统管理','1','sys_user_type','会员类型',10,0,1,NULL,1,NULL,NULL,'0'),(40,'部门经理','2','sys_user_type','会员类型',20,0,1,NULL,1,NULL,NULL,'0'),(41,'普通会员','3','sys_user_type','会员类型',30,0,1,NULL,1,NULL,NULL,'0'),(42,'基础主题','basic','cms_theme','站点主题',10,0,1,NULL,1,NULL,NULL,'0'),(43,'蓝色主题','blue','cms_theme','站点主题',20,0,1,NULL,1,NULL,NULL,'1'),(44,'红色主题','red','cms_theme','站点主题',30,0,1,NULL,1,NULL,NULL,'1'),(45,'文章模型','article','cms_module','栏目模型',10,0,1,NULL,1,NULL,NULL,'0'),(46,'图片模型','picture','cms_module','栏目模型',20,0,1,NULL,1,NULL,NULL,'1'),(47,'下载模型','download','cms_module','栏目模型',30,0,1,NULL,1,NULL,NULL,'1'),(48,'链接模型','link','cms_module','栏目模型',40,0,1,NULL,1,NULL,NULL,'0'),(49,'专题模型','special','cms_module','栏目模型',50,0,1,NULL,1,NULL,NULL,'1'),(50,'默认展现方式','0','cms_show_modes','展现方式',10,0,1,NULL,1,NULL,NULL,'0'),(51,'首栏目内容列表','1','cms_show_modes','展现方式',20,0,1,NULL,1,NULL,NULL,'0'),(52,'栏目第一条内容','2','cms_show_modes','展现方式',30,0,1,NULL,1,NULL,NULL,'0'),(53,'发布','0','cms_del_flag','内容状态',10,0,1,NULL,1,NULL,NULL,'0'),(54,'删除','1','cms_del_flag','内容状态',20,0,1,NULL,1,NULL,NULL,'0'),(55,'审核','2','cms_del_flag','内容状态',15,0,1,NULL,1,NULL,NULL,'0'),(56,'首页焦点图','1','cms_posid','推荐位',10,0,1,NULL,1,NULL,NULL,'0'),(57,'栏目页文章推荐','2','cms_posid','推荐位',20,0,1,NULL,1,NULL,NULL,'0'),(58,'咨询','1','cms_guestbook','留言板分类',10,0,1,NULL,1,NULL,NULL,'0'),(59,'建议','2','cms_guestbook','留言板分类',20,0,1,NULL,1,NULL,NULL,'0'),(60,'投诉','3','cms_guestbook','留言板分类',30,0,1,NULL,1,NULL,NULL,'0'),(61,'其它','4','cms_guestbook','留言板分类',40,0,1,NULL,1,NULL,NULL,'0'),(62,'公休','1','oa_leave_type','请假类型',10,0,1,NULL,1,NULL,NULL,'0'),(63,'病假','2','oa_leave_type','请假类型',20,0,1,NULL,1,NULL,NULL,'0'),(64,'事假','3','oa_leave_type','请假类型',30,0,1,NULL,1,NULL,NULL,'0'),(65,'调休','4','oa_leave_type','请假类型',40,0,1,NULL,1,NULL,NULL,'0'),(66,'婚假','5','oa_leave_type','请假类型',60,0,1,NULL,1,NULL,NULL,'0'),(67,'接入日志','1','sys_log_type','日志类型',30,0,1,NULL,1,NULL,NULL,'0'),(68,'异常日志','2','sys_log_type','日志类型',40,0,1,NULL,1,NULL,NULL,'0'),(69,'请假流程','leave','act_type','流程类型',10,0,1,NULL,1,NULL,NULL,'0'),(70,'审批测试流程','test_audit','act_type','流程类型',20,0,1,NULL,1,NULL,NULL,'0'),(71,'分类1','1','act_category','流程分类',10,0,1,NULL,1,NULL,NULL,'0'),(72,'分类2','2','act_category','流程分类',20,0,1,NULL,1,NULL,NULL,'0'),(73,'增删改查','crud','gen_category','代码生成分类',10,0,1,NULL,1,NULL,NULL,'1'),(74,'增删改查（包含从表）','crud_many','gen_category','代码生成分类',20,0,1,NULL,1,NULL,NULL,'1'),(75,'树结构','tree','gen_category','代码生成分类',30,0,1,NULL,1,NULL,NULL,'1'),(76,'=','=','gen_query_type','查询方式',10,0,1,NULL,1,NULL,NULL,'1'),(77,'!=','!=','gen_query_type','查询方式',20,0,1,NULL,1,NULL,NULL,'1'),(78,'&gt;','&gt;','gen_query_type','查询方式',30,0,1,NULL,1,NULL,NULL,'1'),(79,'&lt;','&lt;','gen_query_type','查询方式',40,0,1,NULL,1,NULL,NULL,'1'),(80,'Between','between','gen_query_type','查询方式',50,0,1,NULL,1,NULL,NULL,'1'),(81,'Like','like','gen_query_type','查询方式',60,0,1,NULL,1,NULL,NULL,'1'),(82,'Left Like','left_like','gen_query_type','查询方式',70,0,1,NULL,1,NULL,NULL,'1'),(83,'Right Like','right_like','gen_query_type','查询方式',80,0,1,NULL,1,NULL,NULL,'1'),(84,'文本框','input','gen_show_type','字段生成方案',10,0,1,NULL,1,NULL,NULL,'1'),(85,'文本域','textarea','gen_show_type','字段生成方案',20,0,1,NULL,1,NULL,NULL,'1'),(86,'下拉框','select','gen_show_type','字段生成方案',30,0,1,NULL,1,NULL,NULL,'1'),(87,'复选框','checkbox','gen_show_type','字段生成方案',40,0,1,NULL,1,NULL,NULL,'1'),(88,'单选框','radiobox','gen_show_type','字段生成方案',50,0,1,NULL,1,NULL,NULL,'1'),(89,'日期选择','dateselect','gen_show_type','字段生成方案',60,0,1,NULL,1,NULL,NULL,'1'),(90,'人员选择','userselect','gen_show_type','字段生成方案',70,0,1,NULL,1,NULL,NULL,'1'),(91,'部门选择','officeselect','gen_show_type','字段生成方案',80,0,1,NULL,1,NULL,NULL,'1'),(92,'区域选择','areaselect','gen_show_type','字段生成方案',90,0,1,NULL,1,NULL,NULL,'1'),(93,'String','String','gen_java_type','Java类型',10,0,1,NULL,1,NULL,NULL,'1'),(94,'Long','Long','gen_java_type','Java类型',20,0,1,NULL,1,NULL,NULL,'1'),(95,'仅持久层','dao','gen_category','代码生成分类',40,0,1,NULL,1,NULL,NULL,'1'),(96,'男','1','sex','性别',10,0,1,NULL,1,NULL,NULL,'0'),(97,'女','2','sex','性别',20,0,1,NULL,1,NULL,NULL,'0'),(98,'Integer','Integer','gen_java_type','Java类型',30,0,1,NULL,1,NULL,NULL,'1'),(99,'Double','Double','gen_java_type','Java类型',40,0,1,NULL,1,NULL,NULL,'1'),(100,'Date','java.util.Date','gen_java_type','Java类型',50,0,1,NULL,1,NULL,NULL,'1'),(104,'Custom','Custom','gen_java_type','Java类型',90,0,1,NULL,1,NULL,NULL,'1'),(105,'会议通告','1','oa_notify_type','通知通告类型',10,0,1,NULL,1,NULL,NULL,'0'),(106,'奖惩通告','2','oa_notify_type','通知通告类型',20,0,1,NULL,1,NULL,NULL,'0'),(107,'活动通告','3','oa_notify_type','通知通告类型',30,0,1,NULL,1,NULL,NULL,'0'),(108,'草稿','0','oa_notify_status','通知通告状态',10,0,1,NULL,1,NULL,NULL,'0'),(109,'发布','1','oa_notify_status','通知通告状态',20,0,1,NULL,1,NULL,NULL,'0'),(110,'未读','0','oa_notify_read','通知通告状态',10,0,1,NULL,1,NULL,NULL,'0'),(111,'已读','1','oa_notify_read','通知通告状态',20,0,1,NULL,1,NULL,NULL,'0'),(112,'草稿','0','oa_notify_status','通知通告状态',10,0,1,NULL,1,NULL,'','0'),(113,'删除','1','del_flag','删除标记',NULL,NULL,NULL,NULL,NULL,NULL,'',''),(121,'编码','code','hobby','爱好',NULL,NULL,NULL,NULL,NULL,NULL,'',''),(122,'绘画','painting','hobby','爱好',NULL,NULL,NULL,NULL,NULL,NULL,'',''),(123,'Integer','Integer','java_type','Java数据类型',1,NULL,NULL,NULL,NULL,NULL,'',NULL),(124,'Long','Long','java_type','Java数据类型',2,NULL,NULL,NULL,NULL,NULL,'',NULL),(125,'Float','Float','java_type','Java数据类型',3,NULL,NULL,NULL,NULL,NULL,'',NULL),(126,'Double','Double','java_type','Java数据类型',4,NULL,NULL,NULL,NULL,NULL,'',NULL),(127,'BigDecimal','BigDecimal','java_type','Java数据类型',5,NULL,NULL,NULL,NULL,NULL,'',NULL),(128,'Boolean','Boolean','java_type','Java数据类型',6,NULL,NULL,NULL,NULL,NULL,'',NULL),(129,'String','String','java_type','Java数据类型',7,NULL,NULL,NULL,NULL,NULL,'',NULL),(130,'Date','Date','java_type','Java数据类型',8,NULL,NULL,NULL,NULL,NULL,'',NULL),(131,'文本框','1','page_type','页面显示类型',1,NULL,NULL,NULL,NULL,NULL,'',NULL),(132,'下拉框','2','page_type','页面显示类型',2,NULL,NULL,NULL,NULL,NULL,'',NULL),(133,'数值','3','page_type','页面显示类型',3,NULL,NULL,NULL,NULL,NULL,'',NULL),(134,'日期','4','page_type','页面显示类型',4,NULL,NULL,NULL,NULL,NULL,'',NULL),(135,'文本域','5','page_type','页面显示类型',5,NULL,NULL,NULL,NULL,NULL,'',NULL),(136,'富文本','6','page_type','页面显示类型',6,NULL,NULL,NULL,NULL,NULL,'',NULL),(137,'上传图片【单文件】','7','page_type','页面显示类型',7,NULL,NULL,NULL,NULL,NULL,'',NULL),(138,'隐藏域','11','page_type','页面显示类型',11,NULL,NULL,NULL,NULL,NULL,'',NULL),(139,'不显示','12','page_type','页面显示类型',12,NULL,NULL,NULL,NULL,NULL,'',NULL),(140,'书籍','0','work_direction','作品方向',0,NULL,NULL,NULL,NULL,NULL,'',NULL),(141,'文件','1','work_direction','作品方向',1,NULL,NULL,NULL,NULL,NULL,'',NULL),(142,'轮播图','0','book_rec_type','书籍推荐类型',0,NULL,NULL,NULL,NULL,NULL,'',NULL),(143,'顶部书籍栏','1','book_rec_type','书籍推荐类型',1,NULL,NULL,NULL,NULL,NULL,'',NULL),(144,'本周强推','2','book_rec_type','书籍推荐类型',2,NULL,NULL,NULL,NULL,NULL,'',NULL),(145,'热门推荐','3','book_rec_type','书籍推荐类型',3,NULL,NULL,NULL,NULL,NULL,'',NULL),(146,'精品推荐','4','book_rec_type','书籍推荐类型',4,NULL,NULL,NULL,NULL,NULL,'',NULL);
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_file` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` int DEFAULT NULL COMMENT '文件类型',
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb3 COMMENT='文件上传';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file`
--

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
INSERT INTO `sys_file` VALUES (142,0,'/files/658554ff-cd62-4ca2-936d-62e35f8af5ef.png','2019-11-01 16:13:39'),(143,0,'/files/de40bb48-c278-4360-9ee6-80b464419255.png','2019-11-01 16:14:24'),(144,0,'/files/8b0737fb-e68d-4162-a066-05f1f3f66b0f.png','2019-11-02 19:42:03'),(145,0,'/files/1006a87c-ee4e-4e97-8bcd-2b5cf861b826.png','2019-11-02 19:42:28'),(146,0,'/files/d7834c20-0e29-4c92-8d0a-9b1297b6e5b8.png','2019-11-02 19:43:05'),(147,0,'/files/6e5d38de-4366-459a-a498-7e418e746f62.png','2019-11-02 19:45:59'),(148,0,'/files/e34d60a9-6bde-48c0-ac4c-64a5ddffcdd4.jpg','2019-11-02 19:54:49'),(149,0,'/files/545579fa-ab81-42e2-8bfa-13ebdc7a137d.png','2019-11-09 10:39:05'),(150,1,'/files/fe0fe8db-495f-4c23-8c74-744399f5c1af.txt','2019-11-09 17:28:31'),(151,99,'/files/1a710af4-a766-4ed8-b8e9-2ec5ef25df6b.sql','2019-11-09 17:42:59'),(152,99,'/files/3a984623-4d2c-4122-9b47-6054eb670dc9.sql','2019-11-09 17:43:04'),(153,0,'/files/2019/11/09/44eddafe-1c58-4710-a2ba-3f88d0e77958.png','2019-11-09 18:29:26'),(154,0,'/files/2019/11/23/f0dfac47-7fc4-43e3-aab9-f5f2276ac550.png','2019-11-23 11:29:03'),(155,0,'/files/2019/11/23/c7ed1b36-63dc-4259-bb31-e2f8d86234de.png','2019-11-23 11:29:06'),(156,0,'/files/2019/11/23/4c772801-5cce-40ce-bd3c-603bb30d5ff4.png','2019-11-23 13:18:11'),(157,0,'/files/2019/11/23/3878019f-6799-4ac4-9a6b-4c709cca5610.png','2019-11-23 13:18:50'),(158,0,'/files/2019/11/23/94bac082-7358-4d84-a3e2-ae8ce31cc427.png','2019-11-23 13:30:38'),(159,0,'/files/2019/11/23/d5ae3fa2-deae-4703-93b8-723d372895a6.png','2019-11-23 13:31:09'),(160,0,'/files/2019/11/23/7b7beb05-9c02-40a1-b25f-db2366d76c87.png','2019-11-23 13:33:04'),(161,0,'/files/2019/11/23/b9deb454-b243-4685-8c69-ae2f302a079f.png','2019-11-23 14:29:52'),(162,0,'/files/2019/11/23/b33b6601-7578-4c58-86bf-d4099d53e752.png','2019-11-23 14:30:32'),(163,0,'/files/2019/11/23/16ed3b6a-c5c8-442e-a166-3f43f45cfc0f.png','2019-11-23 14:33:53'),(164,0,'/files/2019/11/23/9b768a28-d720-4f00-a019-9f3136f61ac4.png','2019-11-23 14:34:22'),(165,0,'/files/2019/11/23/51efde05-3096-4eda-a07e-fc44a939e909.png','2019-11-23 15:15:13'),(166,0,'/files/2019/11/23/eb590e78-f1e3-4d6a-879c-02f9e5028519.png','2019-11-23 15:22:34'),(167,0,'/files/2019/11/23/2d974db3-1292-47e8-8d37-5696d63fd737.png','2019-11-23 15:23:11'),(168,0,'/files/2019/11/23/afbf87aa-1ee9-4244-8f3c-a06dc75b950a.png','2019-11-23 15:24:06'),(169,0,'/files/2019/11/23/e1d27b6b-9c45-4309-9861-9bdb77dbea4c.png','2019-11-23 15:34:14'),(170,0,'/files/2019/11/23/25f40d3b-965d-4564-b153-052139446149.png','2019-11-23 15:34:59'),(171,0,'/files/2019/11/23/01c6e8ea-e25c-4191-b12c-0884391157c5.png','2019-11-23 15:50:06'),(172,0,'/files/2019/11/23/3a230ea3-93dc-4bf7-9037-94a013b3408c.png','2019-11-23 15:51:04'),(173,0,'/files/2019/11/23/4b6994ad-7629-48dc-9c15-c2cf01900b96.png','2019-11-23 15:58:25'),(174,0,'/files/2019/11/23/298fb24b-3e1f-4e97-88d7-2df41acffb8d.png','2019-11-23 15:59:26'),(175,0,'/files/2019/11/23/8e314673-ed11-4b58-942c-68ac34ade62d.png','2019-11-23 16:10:07'),(176,0,'/files/2019/11/23/4497dc84-518e-4b4f-b5f1-a38922827c00.png','2019-11-23 16:11:19'),(177,0,'/files/2019/11/23/81215d73-5922-4d99-8134-710d8a1505f5.png','2019-11-23 16:59:39'),(178,0,'/files/2019/11/23/22be71d0-e2e4-4c80-9db3-0955acf3a3b4.png','2019-11-23 17:00:00'),(179,0,'/files/2019/11/23/c92a51b2-0ee1-4f9a-aa9f-18da61d07e8f.png','2019-11-23 17:13:28'),(180,0,'/files/2019/11/23/eb3f9286-a8b2-46a1-9d1d-54d1b2170b0d.png','2019-11-23 17:14:16'),(181,0,'/files/2019/11/23/912af35f-8514-408d-9b21-f226e52f8611.png','2019-11-23 17:33:16'),(182,0,'/files/2019/11/23/ff9e2850-6d60-4a6b-a93a-d0e58b5dc21c.png','2019-11-23 17:34:09');
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_gen_columns`
--

DROP TABLE IF EXISTS `sys_gen_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_gen_columns` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '表名',
  `column_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '列名',
  `column_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '映射java类型',
  `column_comment` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '列注释',
  `column_sort` tinyint DEFAULT NULL COMMENT '列排序（升序）',
  `column_label` varchar(64) DEFAULT NULL COMMENT '鍒楁爣绛惧悕',
  `page_type` tinyint DEFAULT '1' COMMENT '页面显示类型：1、文本框 2、下拉框 3、数值4、日期 5、文本域6、富文本 7、上传图片【单文件】 8、上传图片【多文件】9、上传文件【单文件】 10、上传文件【多文件】11、隐藏域 12、不显示',
  `is_required` tinyint(1) DEFAULT NULL COMMENT '是否必填',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '页面显示为下拉时使用，字典类型从字典表中取出',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=815 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_gen_columns`
--

LOCK TABLES `sys_gen_columns` WRITE;
/*!40000 ALTER TABLE `sys_gen_columns` DISABLE KEYS */;
INSERT INTO `sys_gen_columns` VALUES (452,'sys_user','username','varchar','String','会员名',2,'会员名',1,0,NULL),(453,'sys_user','name','varchar','String','',3,'真实姓名',6,0,NULL),(454,'sys_user','password','varchar','String','密码',4,'密码',3,0,NULL),(455,'sys_user','dept_id','bigint','Long','',5,'部门',1,0,NULL),(456,'sys_user','email','varchar','String','邮箱',6,'邮箱',1,0,NULL),(457,'sys_user','mobile','varchar','String','手机号',7,'手机号',1,0,NULL),(458,'sys_user','status','tinyint','Integer','状态 0:禁用，1:正常',8,'状态 0:禁用，1:正常',2,0,'yes_no'),(459,'sys_user','user_id_create','bigint','Long','创建会员id',9,'创建会员id',1,0,NULL),(460,'sys_user','gmt_create','datetime','Date','创建时间',10,'创建时间',4,0,NULL),(461,'sys_user','gmt_modified','datetime','Date','修改时间',11,'修改时间',4,0,NULL),(462,'sys_user','sex','bigint','Long','性别',12,'性别',1,0,NULL),(463,'sys_user','birth','datetime','Date','出身日期',13,'出身日期',4,0,NULL),(464,'sys_user','pic_id','bigint','Long','',14,'',1,0,NULL),(465,'sys_user','live_address','varchar','String','现居住地',50,'现居住地',6,0,NULL),(466,'sys_user','hobby','varchar','String','爱好',16,'爱好',7,0,NULL),(467,'sys_user','province','varchar','String','省份',17,'省份',2,0,'theme'),(468,'sys_user','city','varchar','String','所在城市',18,'所在城市',1,0,NULL),(469,'sys_user','district','varchar','String','所在地区',19,'所在地区',7,0,NULL),(730,'sys_role_data_perm','role_id','bigint','Long','角色ID',2,'角色ID',1,0,NULL),(731,'sys_role_data_perm','perm_id','bigint','Long','权限ID',3,'权限ID',1,0,NULL),(732,'sys_data_perm','name','varchar','String','权限名称',2,'权限名称',1,1,NULL),(733,'sys_data_perm','table_name','varchar','String','数据表名称',3,'数据表名称',1,1,NULL),(734,'sys_data_perm','module_name','varchar','String','所属模块',4,'所属模块',1,1,NULL),(735,'sys_data_perm','crl_attr_name','varchar','String','会员权限控制属性名',5,'会员权限控制属性名',1,1,NULL),(736,'sys_data_perm','crl_column_name','varchar','String','数据表权限控制列名',6,'数据表权限控制列名',1,1,NULL),(737,'sys_data_perm','perm_code','varchar','String','权限code，all_开头表示查看所有数据的权限，sup_开头表示查看下级数据的权限，own_开头表示查看本级数据的权限',7,'权限code',1,1,NULL),(738,'sys_data_perm','order_num','int','Integer','排序',8,'排序',3,0,NULL),(739,'sys_data_perm','gmt_create','datetime','Date','创建时间',9,'创建时间',12,0,NULL),(740,'sys_data_perm','gmt_modified','datetime','Date','修改时间',10,'修改时间',12,0,NULL),(771,'fb_order','fb_merchant_code','varchar','String','付呗商户号',4,'付呗商户号',1,0,'del_flag'),(772,'fb_order','merchant_order_sn','varchar','String','第三方商户的订单号',5,'第三方商户的订单号',1,0,'del_flag'),(773,'fb_order','order_sn','varchar','String','付呗订单号',6,'付呗订单号',2,0,'color'),(774,'fb_order','platform_order_no','varchar','String','平台方订单号',7,'平台方订单号',2,0,'oa_leave_type'),(775,'fb_order','trade_no','varchar','String','商户单号',8,'商户单号',6,0,'del_flag'),(776,'fb_order','order_state','tinyint','Integer','订单状态，1：未支付，2：支付成功，3：支付失败，4：支付取消',9,'订单状态，1：未支付，2：支付成功，3：支付失败，4：支付取消',2,0,'yes_no'),(777,'fb_order','fn_coupon','decimal','Double','蜂鸟优惠卷抵扣',10,'蜂鸟优惠卷抵扣',3,0,'del_flag'),(778,'fb_order','red_packet','decimal','BigDecimal','红包抵扣',11,'红包抵扣',3,0,'del_flag'),(779,'fb_order','total_fee','decimal','BigDecimal','实收金额(元)',12,'实收金额(元)',3,0,'del_flag'),(780,'fb_order','order_price','decimal','BigDecimal','订单金额',13,'订单金额',3,0,'del_flag'),(781,'fb_order','fee','decimal','BigDecimal','手续费(元)',14,'手续费(元)',3,0,'del_flag'),(782,'fb_order','body','varchar','String','对商品或交易的描述',15,'对商品或交易的描述',7,0,'del_flag'),(783,'fb_order','attach','varchar','String','附加数据',16,'附加数据',6,0,'del_flag'),(784,'fb_order','store_id','bigint','Long','付呗系统的门店id',17,'付呗系统的门店id',3,0,'del_flag'),(785,'fb_order','cashier_id','bigint','Long','付呗系统的收银员id',18,'付呗系统的收银员id',3,0,'del_flag'),(786,'fb_order','device_no','varchar','String','设备终端号',19,'设备终端号',1,0,'del_flag'),(787,'fb_order','user_id','varchar','String','微信顾客支付授权的“open_id”或者支付宝顾客的“buyer_user_id”',20,'微信顾客支付授权的“open_id”或者支付宝顾客的“buyer_user_id”',1,0,'del_flag'),(788,'fb_order','user_logon_id','varchar','String','支付宝顾客的账号',21,'支付宝顾客的账号',5,0,'del_flag'),(789,'fb_order','pay_time','datetime','Date','交易成功的时间',22,'交易成功的时间',4,0,'del_flag'),(790,'fb_order','pay_channel','tinyint','Integer','支付通道:1微信、2支付宝、3银联',23,'支付通道:1微信、2支付宝、3银联',2,0,'del_flag'),(791,'fb_order','no_cash_coupon_fee','decimal','BigDecimal','免充值代金券金额(元)',24,'免充值代金券金额(元)',3,0,'del_flag'),(792,'fb_order','cash_coupon_fee','decimal','BigDecimal','预充值代金券金额(元)',25,'预充值代金券金额(元)',3,0,'yes_no'),(793,'fb_order','cash_fee','decimal','BigDecimal','顾客实际支付金额(元)',26,'顾客实际支付金额(元)',3,0,'del_flag'),(794,'fb_order','sign','varchar','String','签名',27,'签名',2,0,'theme'),(795,'fb_order','options','varchar','String','其它选项',28,'其它选项',7,0,'del_flag'),(796,'fb_order','create_time','datetime','Date','创建时间',29,'创建时间',4,0,'del_flag'),(797,'fb_order','push_time','datetime','Date','推送时间',30,'推送时间',4,0,'del_flag'),(798,'fb_order','push_ip','varchar','String','推送IP',31,'推送IP',6,0,'del_flag'),(799,'fb_order','mcht_id','bigint','BigDecimal','商户id',90,'商户id',3,0,'theme'),(800,'fb_order','sn','char','String','QR编号',100,'QR编号',1,0,'del_flag'),(801,'author','user_id','bigint','Long','会员ID',2,'会员ID',1,0,NULL),(802,'author','invite_code','varchar','String','邀请码',3,'邀请码',1,0,NULL),(803,'author','pen_name','varchar','String','编撰',4,'编撰',1,0,NULL),(804,'author','tel_phone','varchar','String','手机号码',5,'手机号码',1,0,NULL),(805,'author','chat_account','varchar','String','QQ或微信账号',6,'QQ或微信账号',1,0,NULL),(806,'author','email','varchar','String','电子邮箱',7,'电子邮箱',1,0,NULL),(807,'author','work_direction','tinyint','Integer','作品方向，0：书籍，1：文件',8,'作品方向，0：书籍，1：文件',2,0,'work_direction'),(808,'author','status','tinyint','Integer','0：正常，1：封禁',10,'0：正常，1：封禁',1,0,NULL),(809,'author','create_time','datetime','Date','创建时间',9,'入驻时间',4,0,NULL),(810,'author_code','invite_code','varchar','String','邀请码',2,'邀请码',1,1,NULL),(811,'author_code','validity_time','datetime','Date','有效时间',3,'有效时间',4,1,NULL),(812,'author_code','is_use','tinyint','Integer','是否使用过，0：未使用，1:使用过',4,'是否使用过，0：未使用，1:使用过',1,0,NULL),(813,'author_code','create_time','datetime','Date','创建时间',5,'创建时间',4,0,NULL),(814,'author_code','create_user_id','bigint','Long','创建人ID',6,'创建人ID',1,0,NULL);
/*!40000 ALTER TABLE `sys_gen_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_gen_table`
--

DROP TABLE IF EXISTS `sys_gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_gen_table` (
  `id` bigint NOT NULL COMMENT '主键',
  `table_name` varchar(64) NOT NULL COMMENT '表名',
  `class_name` varchar(100) NOT NULL COMMENT '实体类名称',
  `comments` varchar(500) NOT NULL COMMENT '表说明',
  `category` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分类：0：数据表，1：树表',
  `package_name` varchar(500) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(200) DEFAULT NULL COMMENT '生成功能名，用于类描述',
  `function_name_simple` varchar(50) DEFAULT NULL COMMENT '生成功能名（简写），用于功能提示，如“保存xx成功”',
  `author` varchar(50) DEFAULT NULL COMMENT '生成功能编撰',
  `src_dir` varchar(1000) DEFAULT NULL COMMENT 'src目录',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` bigint NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='代码生成表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_gen_table`
--

LOCK TABLES `sys_gen_table` WRITE;
/*!40000 ALTER TABLE `sys_gen_table` DISABLE KEYS */;
INSERT INTO `sys_gen_table` VALUES (1,'表名','1','1',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2019-10-24 18:21:24',1,'2019-10-24 18:21:35',NULL);
/*!40000 ALTER TABLE `sys_gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_gen_table_column`
--

DROP TABLE IF EXISTS `sys_gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_gen_table_column` (
  `id` bigint NOT NULL COMMENT '主键',
  `table_id` bigint NOT NULL COMMENT '表id',
  `column_name` varchar(64) NOT NULL COMMENT '列名',
  `column_sort` decimal(10,0) DEFAULT NULL COMMENT '列排序（升序）',
  `column_type` varchar(100) NOT NULL COMMENT '类型',
  `column_label` varchar(50) DEFAULT NULL COMMENT '列标签名',
  `comments` varchar(500) NOT NULL COMMENT '列备注说明',
  `attr_name` varchar(200) NOT NULL COMMENT '类的属性名',
  `attr_type` varchar(200) NOT NULL COMMENT '类的属性类型',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否插入字段',
  `is_update` char(1) DEFAULT NULL COMMENT '是否更新字段',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) DEFAULT NULL COMMENT '查询方式',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段',
  `show_type` varchar(200) DEFAULT NULL COMMENT '表单类型',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  PRIMARY KEY (`id`),
  KEY `idx_gen_table_column_tn` (`table_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='代码生成表列';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_gen_table_column`
--

LOCK TABLES `sys_gen_table_column` WRITE;
/*!40000 ALTER TABLE `sys_gen_table_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL COMMENT '会员id',
  `username` varchar(50) DEFAULT NULL COMMENT '会员名',
  `operation` varchar(50) DEFAULT NULL COMMENT '会员操作',
  `time` int DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1412 DEFAULT CHARSET=utf8mb3 COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=618 DEFAULT CHARSET=utf8mb3 COMMENT='菜单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,0,'基础管理','','',0,'fa fa-bars',0,'2017-08-09 22:49:47',NULL),(2,3,'系统菜单','sys/menu/','sys:menu:menu',1,'fa fa-th-list',2,'2017-08-09 22:55:15',NULL),(3,0,'系统管理',NULL,NULL,0,'fa fa-desktop',1,'2017-08-09 23:06:55','2017-08-14 14:13:43'),(6,3,'会员管理','sys/user/','sys:user:user',1,'fa fa-user',0,'2017-08-10 14:12:11',NULL),(7,3,'角色管理','sys/role','sys:role:role',1,'fa fa-paw',1,'2017-08-10 14:13:19',NULL),(12,6,'新增','','sys:user:add',2,'',0,'2017-08-14 10:51:35',NULL),(13,6,'编辑','','sys:user:edit',2,'',0,'2017-08-14 10:52:06',NULL),(14,6,'删除',NULL,'sys:user:remove',2,NULL,0,'2017-08-14 10:52:24',NULL),(15,7,'新增','','sys:role:add',2,'',0,'2017-08-14 10:56:37',NULL),(20,2,'新增','','sys:menu:add',2,'',0,'2017-08-14 10:59:32',NULL),(21,2,'编辑','','sys:menu:edit',2,'',0,'2017-08-14 10:59:56',NULL),(22,2,'删除','','sys:menu:remove',2,'',0,'2017-08-14 11:00:26',NULL),(24,6,'批量删除','','sys:user:batchRemove',2,'',0,'2017-08-14 17:27:18',NULL),(25,6,'停用',NULL,'sys:user:disable',2,NULL,0,'2017-08-14 17:27:43',NULL),(26,6,'重置密码','','sys:user:resetPwd',2,'',0,'2017-08-14 17:28:34',NULL),(27,91,'系统日志','common/log','common:log',1,'fa fa-warning',0,'2017-08-14 22:11:53',NULL),(28,27,'刷新',NULL,'sys:log:list',2,NULL,0,'2017-08-14 22:30:22',NULL),(29,27,'删除',NULL,'sys:log:remove',2,NULL,0,'2017-08-14 22:30:43',NULL),(30,27,'清空',NULL,'sys:log:clear',2,NULL,0,'2017-08-14 22:31:02',NULL),(48,77,'代码生成','common/generator','common:generator',1,'fa fa-code',3,NULL,NULL),(55,7,'编辑','','sys:role:edit',2,'',NULL,NULL,NULL),(56,7,'删除','','sys:role:remove',2,NULL,NULL,NULL,NULL),(61,2,'批量删除','','sys:menu:batchRemove',2,NULL,NULL,NULL,NULL),(62,7,'批量删除','','sys:role:batchRemove',2,NULL,NULL,NULL,NULL),(71,1,'文件管理','/common/sysFile','common:sysFile:sysFile',1,'fa fa-folder-open',2,NULL,NULL),(73,3,'部门管理','/system/sysDept','system:sysDept:sysDept',1,'fa fa-users',3,NULL,NULL),(74,73,'增加','/system/sysDept/add','system:sysDept:add',2,NULL,1,NULL,NULL),(75,73,'刪除','system/sysDept/remove','system:sysDept:remove',2,NULL,2,NULL,NULL),(76,73,'编辑','/system/sysDept/edit','system:sysDept:edit',2,NULL,3,NULL,NULL),(77,0,'研发工具','','',0,'fa fa-gear',5,NULL,NULL),(78,1,'数据字典','/common/dict','common:dict:dict',1,'fa fa-book',1,NULL,NULL),(79,78,'增加','/common/dict/add','common:dict:add',2,NULL,2,NULL,NULL),(80,78,'编辑','/common/dict/edit','common:dict:edit',2,NULL,2,NULL,NULL),(81,78,'删除','/common/dict/remove','common:dict:remove',2,'',3,NULL,NULL),(83,78,'批量删除','/common/dict/batchRemove','common:dict:batchRemove',2,'',4,NULL,NULL),(91,0,'系统监控','','',0,'fa fa-video-camera',4,NULL,NULL),(92,91,'在线会员','sys/online','',1,'fa fa-user',NULL,NULL,NULL),(203,202,'订单管理','test/order','test:order:order',1,'',1,NULL,NULL),(204,203,'新增','','test:order:add',2,'',NULL,NULL,NULL),(205,203,'编辑','','test:order:edit',2,'',NULL,NULL,NULL),(206,203,'删除','','test:order:remove',2,'',NULL,NULL,NULL),(207,203,'批量删除','','test:order:batchRemove',2,'',NULL,NULL,NULL),(208,203,'详情','','test:order:detail',2,'',0,NULL,NULL),(209,3,'数据权限','system/dataPerm','system:dataPerm:dataPerm',1,'fa',6,NULL,NULL),(210,209,'查看',NULL,'system:dataPerm:detail',2,NULL,6,NULL,NULL),(211,209,'新增',NULL,'system:dataPerm:add',2,NULL,6,NULL,NULL),(212,209,'修改',NULL,'system:dataPerm:edit',2,NULL,6,NULL,NULL),(213,209,'删除',NULL,'system:dataPerm:remove',2,NULL,6,NULL,NULL),(214,209,'批量删除',NULL,'system:dataPerm:batchRemove',2,NULL,6,NULL,NULL),(221,0,'编撰者管理','','',0,'fa fa-user-o',10,NULL,NULL),(222,221,'编撰列表','novel/author','novel:author:author',1,'fa',6,NULL,NULL),(223,222,'查看',NULL,'novel:author:detail',2,NULL,6,NULL,NULL),(224,222,'新增',NULL,'novel:author:add',2,NULL,6,NULL,NULL),(225,222,'修改',NULL,'novel:author:edit',2,NULL,6,NULL,NULL),(226,222,'删除',NULL,'novel:author:remove',2,NULL,6,NULL,NULL),(227,222,'批量删除',NULL,'novel:author:batchRemove',2,NULL,6,NULL,NULL),(228,221,'邀请码管理','novel/authorCode','novel:authorCode:authorCode',1,'fa',3,NULL,NULL),(229,228,'查看',NULL,'novel:authorCode:detail',2,NULL,6,NULL,NULL),(230,228,'新增',NULL,'novel:authorCode:add',2,NULL,6,NULL,NULL),(231,228,'修改',NULL,'novel:authorCode:edit',2,NULL,6,NULL,NULL),(232,228,'删除',NULL,'novel:authorCode:remove',2,NULL,6,NULL,NULL),(233,228,'批量删除',NULL,'novel:authorCode:batchRemove',2,NULL,6,NULL,NULL),(234,0,'新闻管理','','',0,'fa fa-newspaper-o',8,NULL,NULL),(235,234,'类别管理','novel/category','novel:category:category',1,'fa',6,NULL,NULL),(236,235,'查看',NULL,'novel:category:detail',2,NULL,6,NULL,NULL),(237,235,'新增',NULL,'novel:category:add',2,NULL,6,NULL,NULL),(238,235,'修改',NULL,'novel:category:edit',2,NULL,6,NULL,NULL),(239,235,'删除',NULL,'novel:category:remove',2,NULL,6,NULL,NULL),(240,235,'批量删除',NULL,'novel:category:batchRemove',2,NULL,6,NULL,NULL),(241,234,'新闻列表','novel/news','novel:news:news',1,'fa',8,NULL,NULL),(242,241,'查看',NULL,'novel:news:detail',2,NULL,6,NULL,NULL),(243,241,'新增',NULL,'novel:news:add',2,NULL,6,NULL,NULL),(244,241,'修改',NULL,'novel:news:edit',2,NULL,6,NULL,NULL),(245,241,'删除',NULL,'novel:news:remove',2,NULL,6,NULL,NULL),(246,241,'批量删除',NULL,'novel:news:batchRemove',2,NULL,6,NULL,NULL),(300,0,'网站管理','','',0,'fa fa-television',6,NULL,NULL),(301,300,'网站信息','novel/websiteInfo','novel:websiteInfo:websiteInfo',1,'fa',6,NULL,NULL),(305,301,'修改',NULL,'novel:websiteInfo:edit',2,NULL,6,NULL,NULL),(310,300,'友情链接','novel/friendLink','novel:friendLink:friendLink',1,'fa',16,NULL,NULL),(311,310,'查看',NULL,'novel:friendLink:detail',2,NULL,6,NULL,NULL),(312,310,'新增',NULL,'novel:friendLink:add',2,NULL,6,NULL,NULL),(313,310,'修改',NULL,'novel:friendLink:edit',2,NULL,6,NULL,NULL),(314,310,'删除',NULL,'novel:friendLink:remove',2,NULL,6,NULL,NULL),(315,310,'批量删除',NULL,'novel:friendLink:batchRemove',2,NULL,6,NULL,NULL),(320,300,'书籍推荐','novel/bookSetting','novel:bookSetting:bookSetting',1,'fa',6,NULL,NULL),(321,320,'查看',NULL,'novel:bookSetting:detail',2,NULL,6,NULL,NULL),(322,320,'新增',NULL,'novel:bookSetting:add',2,NULL,6,NULL,NULL),(323,320,'修改',NULL,'novel:bookSetting:edit',2,NULL,6,NULL,NULL),(324,320,'删除',NULL,'novel:bookSetting:remove',2,NULL,6,NULL,NULL),(325,320,'批量删除',NULL,'novel:bookSetting:batchRemove',2,NULL,6,NULL,NULL),(400,0,'会员管理','','',0,'fa fa-vcard',9,NULL,NULL),(401,400,'会员列表','novel/user','novel:user:user',1,'fa',6,NULL,NULL),(410,400,'会员反馈','novel/userFeedback','novel:userFeedback:userFeedback',1,'fa',16,NULL,NULL),(500,0,'订单管理','','',0,'fa fa-money',19,NULL,NULL),(501,500,'订单列表','novel/pay','novel:pay:pay',1,'fa',6,NULL,NULL),(600,0,'书籍管理','','',0,'fa fa-book',15,NULL,NULL),(601,600,'书籍列表','novel/book','novel:book:book',1,'fa',6,NULL,NULL),(602,601,'删除',NULL,'novel:book:remove',2,NULL,6,NULL,NULL),(603,600,'评论管理','novel/bookComment','novel:bookComment:bookComment',1,'fa',10,NULL,NULL),(604,603,'删除',NULL,'novel:bookComment:remove',2,NULL,6,NULL,NULL),(605,600,'小说分类管理','novel/bookCategory','novel:bookCategory:list',1,'fa fa-book',8,NULL,NULL),(606,605,'新增','','novel:bookCategory:add',2,'',1,NULL,NULL),(607,605,'修改','','novel:bookCategory:edit',2,'',2,NULL,NULL),(608,605,'删除','','novel:bookCategory:remove',2,'',3,NULL,NULL),(609,605,'批量删除','','novel:bookCategory:batchRemove',2,'',4,NULL,NULL),(610,300,'作品方向管理','system/workDirection','system:workDirection:list',1,'fa fa-random',9,NULL,NULL),(611,610,'新增','','system:workDirection:add',2,'',1,NULL,NULL),(612,610,'修改','','system:workDirection:edit',2,'',2,NULL,NULL),(613,610,'删除','','system:workDirection:remove',2,'',3,NULL,NULL),(614,300,'模板配置','system/templateConfig','system:templateConfig:list',1,'fa fa-paint-brush',10,NULL,NULL),(615,614,'修改','','system:templateConfig:edit',2,'',1,NULL,NULL),(616,614,'设为默认','','system:templateConfig:setDefault',2,'',2,NULL,NULL),(617,300,'站点配置','system/siteConfig','system:siteConfig:edit',1,'fa fa-cog',11,NULL,NULL);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint DEFAULT NULL COMMENT '创建会员id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级会员角色','admin','拥有最高权限',2,'2017-08-12 00:43:52','2017-08-12 19:14:59');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_data_perm`
--

DROP TABLE IF EXISTS `sys_role_data_perm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_data_perm` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `perm_id` bigint DEFAULT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb3 COMMENT='角色与数据权限对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_data_perm`
--

LOCK TABLES `sys_role_data_perm` WRITE;
/*!40000 ALTER TABLE `sys_role_data_perm` DISABLE KEYS */;
INSERT INTO `sys_role_data_perm` VALUES (60,60,211),(61,60,-1),(62,60,1199170283966787584),(71,1,214),(72,1,213),(73,1,212),(74,1,211),(75,1,210),(76,1,1260412100929482752),(77,1,-1),(78,1,1260412099998347264);
/*!40000 ALTER TABLE `sys_role_data_perm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4926 DEFAULT CHARSET=utf8mb3 COMMENT='角色与菜单对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (367,44,1),(368,44,32),(369,44,33),(370,44,34),(371,44,35),(372,44,28),(373,44,29),(374,44,30),(375,44,38),(376,44,4),(377,44,27),(378,45,38),(379,46,3),(380,46,20),(381,46,21),(382,46,22),(383,46,23),(384,46,11),(385,46,12),(386,46,13),(387,46,14),(388,46,24),(389,46,25),(390,46,26),(391,46,15),(392,46,2),(393,46,6),(394,46,7),(598,50,38),(632,38,42),(737,51,38),(738,51,39),(739,51,40),(740,51,41),(741,51,4),(742,51,32),(743,51,33),(744,51,34),(745,51,35),(746,51,27),(747,51,28),(748,51,29),(749,51,30),(750,51,1),(1064,54,53),(1095,55,2),(1096,55,6),(1097,55,7),(1098,55,3),(1099,55,50),(1100,55,49),(1101,55,1),(1856,53,28),(1857,53,29),(1858,53,30),(1859,53,27),(1860,53,57),(1861,53,71),(1862,53,48),(1863,53,72),(1864,53,1),(1865,53,7),(1866,53,55),(1867,53,56),(1868,53,62),(1869,53,15),(1870,53,2),(1871,53,61),(1872,53,20),(1873,53,21),(1874,53,22),(2084,56,68),(2085,56,60),(2086,56,59),(2087,56,58),(2088,56,51),(2089,56,50),(2090,56,49),(2243,48,72),(2247,63,-1),(2248,63,84),(2249,63,85),(2250,63,88),(2251,63,87),(2252,64,84),(2253,64,89),(2254,64,88),(2255,64,87),(2256,64,86),(2257,64,85),(2258,65,89),(2259,65,88),(2260,65,86),(2262,67,48),(2263,68,88),(2264,68,87),(2265,69,89),(2266,69,88),(2267,69,86),(2268,69,87),(2269,69,85),(2270,69,84),(2271,70,85),(2272,70,89),(2273,70,88),(2274,70,87),(2275,70,86),(2276,70,84),(2277,71,87),(2278,72,59),(2279,73,48),(2280,74,88),(2281,74,87),(2282,75,88),(2283,75,87),(2284,76,85),(2285,76,89),(2286,76,88),(2287,76,87),(2288,76,86),(2289,76,84),(2292,78,88),(2293,78,87),(2294,78,NULL),(2295,78,NULL),(2296,78,NULL),(2308,80,87),(2309,80,86),(2310,80,-1),(2311,80,84),(2312,80,85),(2328,79,72),(2329,79,48),(2330,79,77),(2331,79,84),(2332,79,89),(2333,79,88),(2334,79,87),(2335,79,86),(2336,79,85),(2337,79,-1),(2338,77,89),(2339,77,88),(2340,77,87),(2341,77,86),(2342,77,85),(2343,77,84),(2344,77,72),(2345,77,-1),(2346,77,77),(2974,57,93),(2975,57,99),(2976,57,95),(2977,57,101),(2978,57,96),(2979,57,94),(2980,57,-1),(2981,58,93),(2982,58,99),(2983,58,95),(2984,58,101),(2985,58,96),(2986,58,94),(2987,58,-1),(3232,59,98),(3233,59,101),(3234,59,99),(3235,59,95),(3236,59,90),(3237,59,89),(3238,59,88),(3239,59,87),(3240,59,86),(3241,59,68),(3242,59,60),(3243,59,59),(3244,59,58),(3245,59,51),(3246,59,76),(3247,59,75),(3248,59,74),(3249,59,62),(3250,59,56),(3251,59,55),(3252,59,15),(3253,59,26),(3254,59,25),(3255,59,24),(3256,59,14),(3257,59,13),(3258,59,12),(3259,59,61),(3260,59,22),(3261,59,21),(3262,59,20),(3263,59,83),(3264,59,81),(3265,59,80),(3266,59,79),(3267,59,71),(3268,59,97),(3269,59,96),(3270,59,94),(3271,59,93),(3272,59,85),(3273,59,84),(3274,59,50),(3275,59,49),(3276,59,73),(3277,59,7),(3278,59,6),(3279,59,2),(3280,59,3),(3281,59,78),(3282,59,1),(3283,59,-1),(4611,61,208),(4612,61,207),(4613,61,206),(4614,61,205),(4615,61,204),(4616,61,92),(4617,61,57),(4618,61,30),(4619,61,29),(4620,61,28),(4621,61,104),(4622,61,48),(4623,61,214),(4624,61,213),(4625,61,212),(4626,61,211),(4627,61,210),(4628,61,76),(4629,61,75),(4630,61,74),(4631,61,62),(4632,61,56),(4633,61,55),(4634,61,15),(4635,61,26),(4636,61,25),(4637,61,24),(4638,61,14),(4639,61,13),(4640,61,12),(4641,61,61),(4642,61,22),(4643,61,21),(4644,61,20),(4645,61,83),(4646,61,81),(4647,61,80),(4648,61,79),(4649,61,71),(4650,61,203),(4651,61,202),(4652,61,27),(4653,61,91),(4654,61,77),(4655,61,209),(4656,61,73),(4657,61,7),(4658,61,6),(4659,61,2),(4660,61,3),(4661,61,78),(4662,61,1),(4663,61,-1),(4664,60,92),(4665,60,57),(4666,60,30),(4667,60,29),(4668,60,28),(4669,60,104),(4670,60,48),(4671,60,76),(4672,60,75),(4673,60,74),(4674,60,62),(4675,60,56),(4676,60,55),(4677,60,15),(4678,60,26),(4679,60,25),(4680,60,24),(4681,60,14),(4682,60,13),(4683,60,12),(4684,60,61),(4685,60,22),(4686,60,21),(4687,60,20),(4688,60,83),(4689,60,81),(4690,60,80),(4691,60,79),(4692,60,71),(4693,60,27),(4694,60,91),(4695,60,77),(4696,60,73),(4697,60,7),(4698,60,6),(4699,60,2),(4700,60,78),(4701,60,1),(4702,60,-1),(4703,60,3),(4764,1,227),(4765,1,226),(4766,1,225),(4767,1,224),(4768,1,223),(4769,1,208),(4770,1,207),(4771,1,206),(4772,1,205),(4773,1,204),(4774,1,92),(4775,1,57),(4776,1,30),(4777,1,29),(4778,1,28),(4779,1,104),(4780,1,48),(4781,1,214),(4782,1,213),(4783,1,212),(4784,1,211),(4785,1,210),(4786,1,76),(4787,1,75),(4788,1,74),(4789,1,62),(4790,1,56),(4791,1,55),(4792,1,15),(4793,1,26),(4794,1,25),(4795,1,24),(4796,1,14),(4797,1,13),(4798,1,12),(4799,1,61),(4800,1,22),(4801,1,21),(4802,1,20),(4803,1,83),(4804,1,81),(4805,1,80),(4806,1,79),(4807,1,71),(4808,1,222),(4809,1,203),(4810,1,202),(4811,1,27),(4812,1,91),(4813,1,77),(4814,1,209),(4815,1,73),(4816,1,7),(4817,1,6),(4818,1,2),(4819,1,3),(4820,1,78),(4821,1,1),(4822,1,228),(4823,1,233),(4824,1,232),(4825,1,231),(4826,1,230),(4827,1,229),(4828,1,221),(4829,1,-1),(4888,1,234),(4889,1,246),(4890,1,245),(4891,1,244),(4892,1,243),(4893,1,242),(4894,1,240),(4895,1,239),(4896,1,238),(4897,1,237),(4898,1,236),(4899,1,241),(4900,1,235),(4901,1,300),(4902,1,301),(4903,1,310),(4904,1,311),(4905,1,312),(4906,1,313),(4907,1,314),(4908,1,315),(4909,1,400),(4910,1,401),(4911,1,500),(4912,1,501),(4913,1,600),(4914,1,601),(4915,1,602),(4916,1,603),(4917,1,604),(4918,1,320),(4919,1,321),(4920,1,322),(4921,1,323),(4922,1,324),(4923,1,325),(4924,1,410),(4925,1,305);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '会员名',
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `dept_id` bigint DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `user_id_create` bigint DEFAULT NULL COMMENT '创建会员id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `sex` bigint DEFAULT NULL COMMENT '性别',
  `birth` datetime DEFAULT NULL COMMENT '出身日期',
  `pic_id` bigint DEFAULT NULL,
  `live_address` varchar(500) DEFAULT NULL COMMENT '现居住地',
  `hobby` varchar(255) DEFAULT NULL COMMENT '爱好',
  `province` varchar(255) DEFAULT NULL COMMENT '省份',
  `city` varchar(255) DEFAULT NULL COMMENT '所在城市',
  `district` varchar(255) DEFAULT NULL COMMENT '所在地区',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','超级管理员','d633268afedf209e1e4ea0f5f43228a8',14,'admin@example.com','17699999999',1,1,'2017-08-15 21:40:39','2017-08-15 21:41:00',96,'2017-12-14 00:00:00',148,'ccc','122;121;','北京市','北京市市辖区','东城区');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL COMMENT '会员ID',
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb3 COMMENT='会员与角色对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (73,30,48),(74,30,49),(75,30,50),(76,31,48),(77,31,49),(78,31,52),(79,32,48),(80,32,49),(81,32,50),(82,32,51),(83,32,52),(84,33,38),(85,33,49),(86,33,52),(87,34,50),(88,34,51),(89,34,52),(106,124,1),(110,1,1),(111,2,1),(113,131,48),(117,135,1),(120,134,1),(121,134,48),(123,130,1),(124,NULL,48),(125,132,52),(126,132,49),(127,123,48),(132,36,48),(133,137,61),(134,137,60),(135,138,61),(136,138,60);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_site_config`
--

DROP TABLE IF EXISTS `system_site_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_site_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `site_title` varchar(100) DEFAULT '小说精品屋' COMMENT '站点标题',
  `favicon_url` varchar(200) DEFAULT '/images/favicon.ico' COMMENT 'favicon地址',
  `logo_url` varchar(200) DEFAULT '/images/logo.png' COMMENT 'logo地址',
  `template_code` varchar(20) DEFAULT 'green' COMMENT '当前模板编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_single` (`id`) COMMENT '单条记录'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='站点配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_site_config`
--

LOCK TABLES `system_site_config` WRITE;
/*!40000 ALTER TABLE `system_site_config` DISABLE KEYS */;
INSERT INTO `system_site_config` VALUES (1,'小说精品屋','/images/favicon.ico','/images/logo.png','green');
/*!40000 ALTER TABLE `system_site_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_template`
--

DROP TABLE IF EXISTS `system_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_template` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) NOT NULL COMMENT '模板名称',
  `code` varchar(20) NOT NULL COMMENT '模板编码（green/blue/dark/orange）',
  `custom_css` varchar(5000) DEFAULT NULL COMMENT '全局自定义CSS',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '1默认',
  `status` tinyint(1) DEFAULT '0' COMMENT '0启用 1禁用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='模板配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_template`
--

LOCK TABLES `system_template` WRITE;
/*!40000 ALTER TABLE `system_template` DISABLE KEYS */;
INSERT INTO `system_template` VALUES (1,'绿色模板','green',NULL,1,0),(2,'蓝色模板','blue',NULL,0,0),(3,'深色模板','dark',NULL,0,0),(4,'橙色模板','orange',NULL,0,0);
/*!40000 ALTER TABLE `system_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(50) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '登录密码',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `user_photo` varchar(100) DEFAULT NULL COMMENT '会员头像',
  `user_sex` tinyint(1) DEFAULT NULL COMMENT '会员性别，0：男，1：女',
  `account_balance` bigint NOT NULL DEFAULT '0' COMMENT '账户余额',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员状态，0：正常',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1255664783722586113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1255060328322027520,'13560421324','e10adc3949ba59abbe56e057f20f883e','13560421324',NULL,NULL,0,0,'2025-04-28 17:04:35','2025-04-28 17:04:35'),(1255379610071322624,'15924184378','6a204bd89f3c8348afd5c77c717a097a','15924184378',NULL,NULL,0,0,'2025-04-29 14:13:18','2025-04-29 14:13:18'),(1255396367099031552,'13111111111','a4de053ee1e8ba473312b537bc360709','13111111111',NULL,NULL,0,0,'2025-04-29 15:19:53','2025-04-29 15:19:53'),(1255398795835895808,'13333333333','a4de053ee1e8ba473312b537bc360709','13333333333',NULL,NULL,0,0,'2025-04-29 15:29:32','2025-04-29 15:29:32'),(1255403074344747008,'13444444444','a4de053ee1e8ba473312b537bc360709','13444444444',NULL,NULL,0,0,'2025-04-29 15:46:32','2025-04-29 15:46:32'),(1255426058765852672,'13555555555','a4de053ee1e8ba473312b537bc360709','13555555555',NULL,NULL,0,0,'2025-04-29 17:17:52','2025-04-29 17:17:52'),(1255664783722586112,'13560421323','e10adc3949ba59abbe56e057f20f883e','13560421323',NULL,NULL,0,0,'2025-04-30 09:06:28','2025-04-30 09:06:28');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_bookshelf`
--

DROP TABLE IF EXISTS `user_bookshelf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_bookshelf` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '会员ID',
  `book_id` bigint NOT NULL COMMENT '书籍ID',
  `pre_content_id` bigint DEFAULT NULL COMMENT '上一次阅读的章节内容表ID',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_userid_bookid` (`user_id`,`book_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='会员书架表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_bookshelf`
--

LOCK TABLES `user_bookshelf` WRITE;
/*!40000 ALTER TABLE `user_bookshelf` DISABLE KEYS */;
INSERT INTO `user_bookshelf` VALUES (37,1255060328322027520,1254957312633352192,3335449,'2025-04-30 07:27:23','2025-04-30 19:37:36'),(38,1255664783722586112,1254674396451897344,1254674396690972672,'2025-04-30 09:06:53','2025-04-30 09:06:59'),(39,1255060328322027520,1254681071191785472,1254681071552495616,'2025-04-30 09:37:47',NULL),(40,1255060328322027520,1254676970567565312,3264258,'2025-04-30 09:57:18','2025-04-30 19:19:11'),(41,1255060328322027520,1254675594315759616,1254675594496114688,'2025-04-30 18:37:18',NULL);
/*!40000 ALTER TABLE `user_bookshelf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_buy_record`
--

DROP TABLE IF EXISTS `user_buy_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_buy_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '会员ID',
  `book_id` bigint DEFAULT NULL COMMENT '购买的书籍ID',
  `book_name` varchar(50) DEFAULT NULL COMMENT '购买的书籍名',
  `book_index_id` bigint DEFAULT NULL COMMENT '购买的章节ID',
  `book_index_name` varchar(100) DEFAULT NULL COMMENT '购买的章节名',
  `buy_amount` int DEFAULT NULL COMMENT '购买使用的屋币数量',
  `create_time` datetime DEFAULT NULL COMMENT '购买时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_userId_indexId` (`user_id`,`book_index_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='会员消费记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_buy_record`
--

LOCK TABLES `user_buy_record` WRITE;
/*!40000 ALTER TABLE `user_buy_record` DISABLE KEYS */;
INSERT INTO `user_buy_record` VALUES (1,1255060328322027520,1260400284744613890,'我是一只消消乐2',1260522024606953472,'第三章',10,'2025-05-13 21:29:09'),(2,1255060328322027520,1260400284744613890,'我是一只消消乐2',1260564410687107072,'第四章',10,'2025-05-13 21:40:38');
/*!40000 ALTER TABLE `user_buy_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_feedback`
--

DROP TABLE IF EXISTS `user_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint DEFAULT NULL COMMENT '会员id',
  `content` varchar(512) DEFAULT NULL COMMENT '反馈内容',
  `create_time` datetime DEFAULT NULL COMMENT '反馈时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_feedback`
--

LOCK TABLES `user_feedback` WRITE;
/*!40000 ALTER TABLE `user_feedback` DISABLE KEYS */;
INSERT INTO `user_feedback` VALUES (8,1255060328322027520,'好战，多点书','2025-04-30 08:58:49');
/*!40000 ALTER TABLE `user_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_read_history`
--

DROP TABLE IF EXISTS `user_read_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_read_history` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '会员ID',
  `book_id` bigint NOT NULL COMMENT '书籍ID',
  `pre_content_id` bigint DEFAULT NULL COMMENT '上一次阅读的章节内容表ID',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_userid_bookid` (`user_id`,`book_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='会员阅读记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_read_history`
--

LOCK TABLES `user_read_history` WRITE;
/*!40000 ALTER TABLE `user_read_history` DISABLE KEYS */;
INSERT INTO `user_read_history` VALUES (49,1255060328322027520,1254944717113274368,1254944717314600960,'2025-04-28 17:05:48','2025-04-28 17:05:48'),(52,1255060328322027520,1254944968184311808,1254944969023172608,'2025-04-28 17:12:31','2025-04-28 17:12:31'),(53,1255379610071322624,1254682148440047616,1254682148729454592,'2025-04-29 14:13:28','2025-04-29 14:13:28'),(54,1255379610071322624,1254676970567565312,1254676970794057728,'2025-04-29 14:17:36','2025-04-29 14:17:36'),(60,1255060328322027520,1254677251162308608,1254677251367829504,'2025-04-30 07:32:03','2025-04-30 07:32:03'),(61,1255060328322027520,1254677887534694400,1254677887790546944,'2025-04-30 07:36:03','2025-04-30 07:36:03'),(64,1255060328322027520,1254678892443795456,1254678893156827136,'2025-04-30 08:34:00','2025-04-30 08:34:00'),(65,1255664783722586112,1254674396451897344,1254674396690972672,'2025-04-30 09:06:59','2025-04-30 09:06:59'),(66,1255664783722586112,1254945413401292800,1254945551112876032,'2025-04-30 09:09:46','2025-04-30 09:09:46'),(68,1255664783722586112,1254681071191785472,1254681071552495616,'2025-04-30 09:14:31','2025-04-30 09:14:31'),(75,1255060328322027520,1254677745226153984,1254677746505416704,'2025-04-30 09:53:17','2025-04-30 09:53:17'),(90,1255060328322027520,1254681753466634240,1254681754687176704,'2025-04-30 10:47:47','2025-04-30 10:47:47'),(91,1255060328322027520,1254943211274252288,1254943211462995968,'2025-04-30 10:53:51','2025-04-30 10:53:51'),(104,1255060328322027520,1254675826696978432,3263201,'2025-04-30 18:53:02','2025-04-30 18:53:02'),(111,1255060328322027520,1254957626056912896,3336649,'2025-04-30 19:11:57','2025-04-30 19:11:57'),(113,1255060328322027520,1254676970567565312,3264258,'2025-04-30 19:19:11','2025-04-30 19:19:11'),(117,1255060328322027520,1254946661743603712,1254946914001629184,'2025-04-30 19:37:09','2025-04-30 19:37:09'),(118,1255060328322027520,1254957312633352192,3335449,'2025-04-30 19:37:36','2025-04-30 19:37:36');
/*!40000 ALTER TABLE `user_read_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_info`
--

DROP TABLE IF EXISTS `website_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '网站名',
  `domain` varchar(50) NOT NULL COMMENT '网站域名',
  `keyword` varchar(50) NOT NULL COMMENT 'SEO关键词',
  `description` varchar(512) NOT NULL COMMENT '网站描述',
  `qq` varchar(20) NOT NULL COMMENT '站长QQ',
  `logo` varchar(200) NOT NULL COMMENT '网站logo图片（默认）',
  `logo_dark` varchar(200) NOT NULL COMMENT '网站logo图片（深色）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user_id` bigint DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='网站信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_info`
--

LOCK TABLES `website_info` WRITE;
/*!40000 ALTER TABLE `website_info` DISABLE KEYS */;
INSERT INTO `website_info` VALUES (1,'三洞四辅会员版','vip.sdsf.org.cn','三洞四辅会员版','三洞四辅会员版','4387567','/images/logo.png','/images/logo.png',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `website_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_direction`
--

DROP TABLE IF EXISTS `work_direction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_direction` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) NOT NULL COMMENT '方向名称（小说/书籍/文件）',
  `code` varchar(20) NOT NULL COMMENT '方向编码',
  `sort` tinyint DEFAULT '10' COMMENT '排序',
  `status` tinyint(1) DEFAULT '0' COMMENT '0启用 1禁用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='作品方向表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_direction`
--

LOCK TABLES `work_direction` WRITE;
/*!40000 ALTER TABLE `work_direction` DISABLE KEYS */;
INSERT INTO `work_direction` VALUES (1,'小说','novel',1,0,'2026-02-11 13:12:43','2026-02-11 13:12:43'),(2,'书籍','book',2,0,'2026-02-11 13:12:43','2026-02-11 13:12:43'),(3,'文件','file',3,0,'2026-02-11 13:12:43','2026-02-11 13:12:43');
/*!40000 ALTER TABLE `work_direction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'novel_plus'
--

--
-- Dumping routines for database 'novel_plus'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-11 15:03:22
