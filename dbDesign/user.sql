-- Host: 119.29.155.72	 Database: friendCircle
-- ------------------------------------------------------

drop table if exists `user`;

CREATE TABLE `user` (
	`userID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`userName` varchar(255) NOT NULL,
	`password` char(33) NOT NULL,
	`email` varchar(255) NOT NULL,
	`signature` varchar(255) NOT NULL DEFAULT '',
	`displayPhoto` varchar(255) NOT NULL DEFAULT '/image/displayPhoto/sample.png',
	`sex` enum('男','女') NOT NULL DEFAULT '男',
	`birthday` date NOT NULL DEFAULT '1000-01-01',
	`city` varchar(255) NOT NULL DEFAULT '',
	PRIMARY KEY (`userID`),
	UNIQUE (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=4080 DEFAULT CHARSET=utf8;

insert into `user` values(1,'user1','123456','user1@163.com','哈哈哈hhh','image/displayPhoto/1.png','男','1998-03-03','北京');
insert into `user` values(2,'user2','123456','user2@163.com','哈哈哈hhh','image/displayPhoto/2.png','女','1999-03-03','上海');
insert into `user` values(3,'user3','123456','user3@163.com','哈哈哈hhh','image/displayPhoto/3.png','','1997-03-03','郑州');