-- Host: 119.29.155.72	 Database: friendCircle
-- ------------------------------------------------------

drop table if exists `friend`;

create table `friend`(
	`userID1` int(11) UNSIGNED NOT NULL,
	`userID2` int(11) UNSIGNED NOT NULL,
	PRIMARY KEY (`userID1`,`userID2`),
	-- CONSTRAINT `pk_friend` PRIMARY KEY (`userID1`,`userID2`),
	FOREIGN KEY (`userID1`) REFERENCES `user`(`userID`),
	FOREIGN KEY (`userID2`) REFERENCES `user`(`userID`)
	-- KEY `fk_user_1` (`userID1`),
	-- CONSTRAINT `fk_user_1` FOREIGN KEY (`userID1`) REFERENCES `user`(`userID`),
	-- KEY `fk_user_2` (`userID2`),
	-- CONSTRAINT `fk_user_2` FOREIGN KEY (`userID2`) REFERENCES `user`(`userID`),
	-- CHECK (userID1 != userID2)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into `friend` values(1, 2);
insert into `friend` values(1, 3);
insert into `friend` values(2, 1);
insert into `friend` values(3, 1);