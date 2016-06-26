-- Host: 119.29.155.72	 Database: friendCircle
-- ------------------------------------------------------

drop table if exists `group`;

create table `group`(
	`groupID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`groupName` varchar(50),
	`groupOwner` int(11) UNSIGNED NOT NULL,
	PRIMARY KEY (`groupID`),
	FOREIGN KEY (`groupOwner`) REFERENCES `user`(`userID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into `group`(`groupName`, `groupOwner`) values("北大地空",1);
insert into `group`(`groupName`, `groupOwner`) values("数据库概论",2);

