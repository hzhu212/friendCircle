-- Host: 119.29.155.72	 Database: friendCircle
-- ------------------------------------------------------

drop table if exists `picture`;

create table `picture`(
	`statusID` bigint(20) UNSIGNED NOT NULL,
	`path` varchar(255) DEFAULT NULL,
	FOREIGN KEY (`statusID`) REFERENCES `status`(`statusID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into `picture` values(1, "/image/picture/test1.jpg");
insert into `picture` values(1, "/image/picture/test2.jpg");
insert into `picture` values(2, "/image/picture/test3.jpg");


