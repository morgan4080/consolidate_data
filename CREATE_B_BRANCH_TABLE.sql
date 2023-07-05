DROP TABLE IF EXISTS `b_branch`;

CREATE TABLE `b_branch` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `refId` varchar(45) NOT NULL,
    `created` datetime DEFAULT NULL,
    `createdBy` varchar(45) DEFAULT NULL,
    `updated` datetime DEFAULT NULL,
    `updatedBy` varchar(45) DEFAULT NULL,
    `isActive` varchar(45) DEFAULT NULL,
    `name` varchar(255) DEFAULT NULL,
    `isHQ` tinyint(4) DEFAULT NULL,
    `regionId` int(11) DEFAULT NULL,
    `branchCode` varchar(45) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `refId_UNIQUE` (`refId`),
    KEY `idx_branch_refid` (`refId`),
    KEY `fk_b_branch_1_idx` (`regionId`),
    CONSTRAINT `fk_b_branch_1` FOREIGN KEY (`regionId`) REFERENCES `b_region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

alter table b_region
    add tenant_id VARCHAR(200) not null;