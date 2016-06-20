-- Host: 119.29.155.72	 Database: friendCircle
-- ------------------------------------------------------

drop table if exists `reply`;

create table `reply`(
	`commentID` bigint(20) UNSIGNED NOT NULL,
	`targetID` bigint(20) UNSIGNED NOT NULL,
	PRIMARY KEY (`commentID`,`targetID`),
	FOREIGN KEY (`commentID`) REFERENCES `comment`(`commentID`),
	FOREIGN KEY (`targetID`) REFERENCES `comment`(`commentID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into `reply` values(2, 1);
insert into `reply` values(4, 3);