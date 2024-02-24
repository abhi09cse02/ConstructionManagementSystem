drop database proconstruct;

create database proconstruct;

use proconstruct;

CREATE TABLE `contractor_reg` (
	`conid` INT(4) NOT NULL AUTO_INCREMENT,
	`fullname` varchar(50) NOT NULL,
	`email` varchar(50) NOT NULL UNIQUE,
	`username` varchar(50) NOT NULL,
	`mobile` varchar(10) NOT NULL UNIQUE,
	`password` varchar(50) NOT NULL,
	PRIMARY KEY (`conid`)
);

CREATE TABLE `project` (
	`pid` INT(4) NOT NULL AUTO_INCREMENT,
	`conid` INT(4) NOT NULL,
	`pname` varchar(50) NOT NULL UNIQUE,
	`customer_name` varchar(50) NOT NULL,
	`cust_mob` varchar(10) NOT NULL UNIQUE,
	`cust_addr` varchar(50) NOT NULL,
	`budget` INT(11) NOT NULL,
	`sdate` varchar(50) NOT NULL,
	`edate` varchar(50) NOT NULL,
	`balance` INT(11),
	PRIMARY KEY (`pid`)
);

CREATE TABLE `employee` (
	`empid` INT(50) NOT NULL AUTO_INCREMENT,
	`emp_name` varchar(50) NOT NULL,
	`dob` varchar(50) NOT NULL,
	`phone` varchar(10) NOT NULL UNIQUE,
	`address` varchar(50) NOT NULL,
	`photo` varchar(5000) NOT NULL,
	`accno` INT(16) NOT NULL UNIQUE,
	PRIMARY KEY (`empid`)
);

CREATE TABLE `materials` (
	`mid` INT(4) NOT NULL AUTO_INCREMENT,
	`mname` varchar(50) NOT NULL,
	`mdesc` varchar(50) NOT NULL,
	`unit` varchar(50),
	`rate` INT(50) NOT NULL,
	`pid` INT(4) NOT NULL,
	`dop` varchar(50) NOT NULL,
	`total` INT(50) NOT NULL,
	PRIMARY KEY (`mid`)
);

CREATE TABLE `employee_set` (
	`empid` INT(4) NOT NULL,
	`pid` INT(4) NOT NULL,
	`wage` INT(11) NOT NULL
);

CREATE TABLE `task` (
	`tid` INT(4) NOT NULL AUTO_INCREMENT,
	`tname` varchar(50) NOT NULL,
	`progress` varchar(1) NOT NULL,
	`pid` INT(4) NOT NULL,
	PRIMARY KEY (`tid`)
);

CREATE TABLE `payment` (
	`empid` INT(4) NOT NULL,
	`amount` INT(11) NOT NULL,
	`date` varchar(100) NOT NULL,
	`pid` INT(4) NOT NULL
);

ALTER TABLE `project` ADD CONSTRAINT `project_fk0` FOREIGN KEY (`conid`) REFERENCES `contractor_reg`(`conid`);

ALTER TABLE `materials` ADD CONSTRAINT `materials_fk0` FOREIGN KEY (`pid`) REFERENCES `project`(`pid`);

ALTER TABLE `employee_set` ADD CONSTRAINT `employee_set_fk0` FOREIGN KEY (`empid`) REFERENCES `employee`(`empid`);

ALTER TABLE `employee_set` ADD CONSTRAINT `employee_set_fk1` FOREIGN KEY (`pid`) REFERENCES `project`(`pid`);

ALTER TABLE `task` ADD CONSTRAINT `task_fk0` FOREIGN KEY (`pid`) REFERENCES `project`(`pid`);

ALTER TABLE `payment` ADD CONSTRAINT `payment_fk0` FOREIGN KEY (`empid`) REFERENCES `employee`(`empid`);

ALTER TABLE `payment` ADD CONSTRAINT `payment_fk1` FOREIGN KEY (`pid`) REFERENCES `project`(`pid`);