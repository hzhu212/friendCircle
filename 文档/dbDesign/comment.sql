-- Host: 119.29.155.72	 Database: friendCircle
-- ------------------------------------------------------

drop table if exists `comment`;

create table `comment`(
	`commentID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
	`userID` int(11) UNSIGNED NOT NULL,
	`targetUserID` int(11) UNSIGNED NOT NULL,
	`statusID` bigint(20) UNSIGNED NOT NULL,
	`date` date NOT NULL,
	`time` time NOT NULL,
	`content` text NOT NULL DEFAULT '',
	PRIMARY KEY (`commentID`),
	FOREIGN KEY (`userID`) REFERENCES `user`(`userID`),
	FOREIGN KEY (`targetUserID`) REFERENCES `user`(`userID`),
	FOREIGN KEY (`statusID`) REFERENCES `status`(`statusID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into `comment` values(1, 2, 1, 1, '2016-06-20', '14:05:20', '哈哈什么？');
insert into `comment` values(2, 1, 2, 1, '2016-06-20', '14:06:20', '我也不知道，就想哈哈');
insert into `comment`(userID,targetUserID,statusID,`date`,`time`,content) values(3, 2, 3,CURDATE(),CURTIME(),'学婊。。。');
insert into `comment`(userID,targetUserID,statusID,`date`,`time`,content) values(2, 3, 3,CURDATE(),CURTIME(),'你才学婊');
