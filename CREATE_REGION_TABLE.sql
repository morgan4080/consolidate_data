DROP TABLE IF EXISTS `b_region`;

CREATE TABLE `b_region` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `refId` varchar(45) NOT NULL,
    `created` datetime DEFAULT NULL,
    `createdBy` varchar(45) DEFAULT NULL,
    `updated` datetime DEFAULT NULL,
    `updatedBy` varchar(45) DEFAULT NULL,
    `isActive` tinyint(4) DEFAULT NULL,
    `name` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `refId_UNIQUE` (`refId`),
    KEY `idx_region_refId` (`refId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

alter table b_region
    add tenant_id VARCHAR(200) not null;