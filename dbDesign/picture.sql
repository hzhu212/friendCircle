-- Host: 119.29.155.72	 Database: friendCircle
-- ------------------------------------------------------

drop table if exists `picture`;

create table `picture`(
	`pictureID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
	`path` varchar(255) DEFAULT NULL,
	`commentID` bigint(20) UNSIGNED NOT NULL,
	PRIMARY KEY (`pictureID`),
	FOREIGN KEY (`commentID`) REFERENCES `comment`(`commentID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into `picture`(`path`,`commentID`) values("/image/picture/test1.jpg", 1);
insert into `picture`(`path`,`commentID`) values("/image/picture/test2.jpg", 1);
insert into `picture`(`path`,`commentID`) values("/image/picture/test3.jpg", 2);

