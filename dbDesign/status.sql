-- Host: 119.29.155.72	 Database: friendCircle
-- ------------------------------------------------------

drop table if exists `status`;

create table `status`(
	`statusID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
	`userID` int(11) UNSIGNED NOT NULL,
	`date` date NOT NULL,
	`time` time NOT NULL,
	`content` text NOT NULL DEFAULT '',
	PRIMARY KEY (`statusID`),
	FOREIGN KEY (`userID`) REFERENCES `user`(`userID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into `status` values(1, 1, '2016-06-20', '14:02:35', '哈哈哈hhh');
insert into `status`(userID,`date`,`time`,content) values(3,CURDATE(),CURTIME(),'今天天气不错');
insert into `status`(userID,`date`,`time`,content) values(2,CURDATE(),CURTIME(),'考试求不挂');
insert into `status`(userID,`date`,`time`,content) values(1,CURDATE(),CURTIME(),'O(∩_∩)O哈哈~');