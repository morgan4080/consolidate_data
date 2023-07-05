CREATE DATABASE IF NOT EXISTS test_db;

USE test_db;

SET FOREIGN_KEY_CHECKS=0;

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

ALTER TABLE b_region AUTO_INCREMENT=100;

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

alter table b_branch
    add tenant_id VARCHAR(200) not null;






INSERT INTO `b_region` (refId, created, createdBy, updated, updatedBy, isActive, name, tenant_id) VALUES ('OpHHRyAXH4RfBJEH','2022-04-28 15:48:12','6f8b6bab-137b-4e3a-a848-94de29079c00',NULL,NULL,1,'HQ','t10007');

INSERT INTO `b_branch` (refId, created, createdBy, updated, updatedBy, isActive, name, isHQ, regionId, branchCode, tenant_id) VALUES ('RMj1rIjtbEGslk6B','2022-04-28 15:49:23','6f8b6bab-137b-4e3a-a848-94de29079c00',NULL,NULL,'1','HQ',0,1,'001','t10007'),('DuVHQCh1ICqVIxCG','2022-12-13 18:14:35','ab819aed-5a40-4337-8b55-21b93b78b7ae',NULL,NULL,'1','KISUMU',0,1,'002','t10007'),('oISfhIUVvfubvudV','2022-12-14 14:40:08','ab819aed-5a40-4337-8b55-21b93b78b7ae','2022-12-14 14:40:30','ab819aed-5a40-4337-8b55-21b93b78b7ae','1','MATHARE',0,1,'003','t10007');

INSERT INTO `b_region` (refId, created, createdBy, updated, updatedBy, isActive, name, tenant_id) VALUES ('Hbj9oc2APEKZqumy','2021-05-26 14:47:24',NULL,NULL,NULL,1,'HQRegion','t73583');

INSERT INTO `b_branch` (refId, created, createdBy, updated, updatedBy, isActive, name, isHQ, regionId, branchCode, tenant_id) VALUES ('hLxddrFd0sJW1ifH','2021-05-26 14:47:24',NULL,NULL,NULL,'1','HQ',NULL,1,NULL,'t73583');

