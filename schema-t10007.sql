-- MySQL dump 10.13  Distrib 8.0.33, for macos13.3 (arm64)
--
-- Host: localhost    Database: t10007
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `b_bankaccount`
--

DROP TABLE IF EXISTS `b_bankaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b_bankaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `paybillNumber` varchar(10) DEFAULT NULL,
  `paybillName` varchar(255) DEFAULT NULL,
  `accountName` varchar(255) DEFAULT NULL,
  `accountNumber` varchar(30) DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_b_bankaccount_userid_idx` (`userId`),
  KEY `idx_bankaccount_accountname` (`accountName`),
  KEY `idx_bankaccount_accountnumber` (`accountNumber`),
  KEY `idx_bankaccount_paybillnumber` (`paybillNumber`),
  KEY `idx_bankaccount_refId` (`refId`),
  CONSTRAINT `fk_b_bankaccount_userid_idx` FOREIGN KEY (`userId`) REFERENCES `b_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b_branch`
--

DROP TABLE IF EXISTS `b_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b_branch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` varchar(45) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isHQ` tinyint DEFAULT NULL,
  `regionId` int DEFAULT NULL,
  `branchCode` varchar(45) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `idx_branch_refid` (`refId`),
  KEY `fk_b_branch_1_idx` (`regionId`),
  CONSTRAINT `fk_b_branch_1` FOREIGN KEY (`regionId`) REFERENCES `b_region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b_customer_change_request`
--

DROP TABLE IF EXISTS `b_customer_change_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b_customer_change_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime NOT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `customerId` int NOT NULL,
  `changes` longtext,
  `appraisalType` varchar(45) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_customer_change_requests_customers_idx` (`customerId`),
  CONSTRAINT `fk_customer_change_requests_customers` FOREIGN KEY (`customerId`) REFERENCES `b_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b_leads`
--

DROP TABLE IF EXISTS `b_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b_leads` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `isActive` int DEFAULT '1',
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `rating` varchar(45) DEFAULT NULL,
  `website` varchar(45) DEFAULT NULL,
  `twitter` varchar(45) DEFAULT NULL,
  `salutation` varchar(45) DEFAULT NULL,
  `leadStatus` varchar(45) DEFAULT NULL,
  `industry` varchar(45) DEFAULT NULL,
  `skypeId` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `zipCode` varchar(45) DEFAULT NULL,
  `emailOptOut` int DEFAULT '1',
  `designation` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `noOfEmployees` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `leadSource` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `annualRevenue` varchar(45) DEFAULT NULL,
  `secondary_mail` varchar(45) DEFAULT NULL,
  `desiredAmount` varchar(45) DEFAULT NULL,
  `desiredPeriod` varchar(45) DEFAULT NULL,
  `desiredSecurity` varchar(45) DEFAULT NULL,
  `landLocation` varchar(45) DEFAULT NULL,
  `typeOfCar` varchar(45) DEFAULT NULL,
  `netSalary` varchar(45) DEFAULT NULL,
  `yearOfManufacture` varchar(45) DEFAULT NULL,
  `loanProductRefId` varchar(45) DEFAULT NULL,
  `leadId` varchar(45) DEFAULT NULL,
  `dealId` varchar(45) DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `insuranceType` varchar(45) DEFAULT NULL,
  `make` varchar(45) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `contactId` varchar(45) DEFAULT NULL,
  `contactPersonId` varchar(45) DEFAULT NULL,
  `feeMetadata` text,
  `salesPersonId` varchar(255) DEFAULT NULL,
  `quotationRefId` varchar(45) DEFAULT NULL,
  `interestRate` varchar(10) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b_org`
--

DROP TABLE IF EXISTS `b_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b_org` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `name` varchar(100) DEFAULT NULL,
  `phoneNumber` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `postalCode` varchar(45) DEFAULT NULL,
  `poBox` varchar(200) DEFAULT NULL,
  `town` varchar(100) DEFAULT NULL,
  `street` varchar(200) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `idx_org_name` (`name`),
  KEY `idx_org_refid` (`refId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b_payment_beneficiary`
--

DROP TABLE IF EXISTS `b_payment_beneficiary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b_payment_beneficiary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refid` varchar(45) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedby` varchar(45) DEFAULT NULL,
  `isactive` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(45) NOT NULL,
  `phoneNumber` varchar(13) DEFAULT NULL,
  `accountNumber` varchar(15) DEFAULT NULL,
  `accountName` varchar(100) DEFAULT NULL,
  `paybillnumber` varchar(10) DEFAULT NULL,
  `paybillName` varchar(45) DEFAULT NULL,
  `tenantId` varchar(15) DEFAULT NULL,
  `tenantName` varchar(100) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `bankRefId` varchar(60) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `beneficiaryPhoneNumber` varchar(20) DEFAULT NULL,
  `contactName` varchar(100) DEFAULT NULL,
  `contactEmail` varchar(60) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refid_UNIQUE` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b_region`
--

DROP TABLE IF EXISTS `b_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b_region` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `idx_region_refId` (`refId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b_sales_representative`
--

DROP TABLE IF EXISTS `b_sales_representative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b_sales_representative` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) DEFAULT NULL,
  `uuid` varchar(45) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isactive` tinyint DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(125) DEFAULT NULL,
  `emailAddress` varchar(125) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `lastName` varchar(125) DEFAULT NULL,
  `keycloakId` varchar(125) DEFAULT NULL,
  `keycloakFullName` varchar(125) DEFAULT NULL,
  `keycloakPhoneNumber` varchar(45) DEFAULT NULL,
  `isLoginUser` int DEFAULT '0',
  `enableAccess` int DEFAULT '0',
  `branchId` int DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_b_sales_representative_id_idx` (`branchId`),
  CONSTRAINT `fk_b_sales_representative_id_map_branch` FOREIGN KEY (`branchId`) REFERENCES `b_branch` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b_user`
--

DROP TABLE IF EXISTS `b_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `username` varchar(125) DEFAULT NULL,
  `memberNo` varchar(45) DEFAULT NULL,
  `email` varchar(125) DEFAULT NULL,
  `firstname` varchar(125) DEFAULT NULL,
  `lastname` varchar(125) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `idnumber` varchar(20) DEFAULT NULL,
  `phonenumber` varchar(45) DEFAULT NULL,
  `contactimage` varchar(500) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `creditscore` double DEFAULT NULL,
  `dateactivated` datetime DEFAULT NULL,
  `currentbalance` double DEFAULT '0',
  `isautoapprovedforloan` tinyint NOT NULL DEFAULT '0',
  `approvallimit` decimal(10,2) DEFAULT NULL,
  `dateapproved` datetime DEFAULT NULL,
  `approvedBy` varchar(45) DEFAULT NULL,
  `usertype` varchar(70) NOT NULL DEFAULT 'CUSTOMER',
  `poBox` varchar(255) DEFAULT NULL,
  `postalcode` varchar(10) DEFAULT NULL,
  `street` varchar(200) DEFAULT NULL,
  `town` varchar(200) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `accountNo` varchar(20) DEFAULT NULL,
  `sharesAccountNo` varchar(20) DEFAULT NULL,
  `savingsAccountNo` varchar(20) DEFAULT NULL,
  `membershipAccountNo` varchar(20) DEFAULT NULL,
  `dividendsAccountNo` varchar(20) DEFAULT NULL,
  `creditorAccountNo` varchar(20) DEFAULT NULL,
  `overpaymentAccountNo` varchar(20) DEFAULT NULL,
  `googleContactId` varchar(255) DEFAULT NULL,
  `googleContactEditUrl` varchar(255) DEFAULT NULL,
  `customerStanding` varchar(45) DEFAULT 'NEW',
  `isInvitationSent` tinyint DEFAULT '0',
  `introducerRefId` varchar(45) DEFAULT NULL,
  `approvalStatus` varchar(70) DEFAULT NULL,
  `canIntroduceBeneficiary` tinyint DEFAULT '0',
  `sharesBalance` double(10,2) DEFAULT '0.00',
  `depositBalance` double(10,2) DEFAULT '0.00',
  `membershipBalance` double(10,2) DEFAULT '0.00',
  `dividendsBalance` double(10,2) DEFAULT '0.00',
  `salesPersonRefId` varchar(36) DEFAULT NULL,
  `branchId` int DEFAULT NULL,
  `isSalesPerson` tinyint NOT NULL DEFAULT '0',
  `isBranchManager` tinyint NOT NULL DEFAULT '0',
  `tocsAccepted` tinyint DEFAULT NULL,
  `tocsAcceptedDate` datetime DEFAULT NULL,
  `gender` enum('MALE','FEMALE') DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `isKycDocumentsCompleted` tinyint DEFAULT '0',
  `employeeNumber` varchar(100) DEFAULT NULL,
  `zohocontactid` varchar(45) DEFAULT NULL,
  `zohoContactPersonId` varchar(45) DEFAULT NULL,
  `keycloakPhoneNumber` varchar(15) DEFAULT NULL,
  `keycloakId` varchar(45) DEFAULT NULL,
  `keycloakFullName` varchar(100) DEFAULT NULL,
  `isLoginUser` tinyint DEFAULT '0',
  `salesRepresentativeId` int DEFAULT NULL,
  `appraisalStatus` varchar(45) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  UNIQUE KEY `idnumber_UNIQUE` (`idnumber`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  UNIQUE KEY `keycloakPhoneNumber_UNIQUE` (`keycloakPhoneNumber`),
  UNIQUE KEY `keycloakId_UNIQUE` (`keycloakId`),
  KEY `idx_user_email` (`email`),
  KEY `idx_user_firstname` (`firstname`),
  KEY `idx_user_lastname` (`lastname`),
  KEY `idx_user_fullname` (`fullname`),
  KEY `idx_user_idnumber` (`idnumber`),
  KEY `idx_user_phonenumber` (`phonenumber`),
  KEY `idx_user_username` (`username`),
  KEY `idx_user_refid` (`refId`),
  KEY `idx_b_user_usr_uuid` (`uuid`),
  KEY `fk_b_user_1_idx` (`branchId`),
  KEY `idx_user_keycloakid` (`keycloakId`),
  KEY `idx_user_keycloakphonenumber` (`keycloakPhoneNumber`),
  KEY `fk_customer_sales_representative` (`salesRepresentativeId`),
  CONSTRAINT `b_user_ibfk_1` FOREIGN KEY (`salesRepresentativeId`) REFERENCES `b_sales_representative` (`id`),
  CONSTRAINT `fk_b_user_1` FOREIGN KEY (`branchId`) REFERENCES `b_branch` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b_user_aud`
--

DROP TABLE IF EXISTS `b_user_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b_user_aud` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `data` longtext NOT NULL,
  `changeType` varchar(45) DEFAULT NULL,
  `customerRefId` varchar(45) NOT NULL,
  `createdByName` varchar(45) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b_user_category`
--

DROP TABLE IF EXISTS `b_user_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b_user_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint DEFAULT '1',
  `categorizationMethod` varchar(45) DEFAULT 'BYNAME',
  `name` varchar(60) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `introducerId` int DEFAULT NULL,
  `orgid` int DEFAULT NULL,
  `guarantorId` int DEFAULT NULL,
  `paymentAccount` varchar(20) DEFAULT NULL,
  `accountNo` varchar(45) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `idx_user_category_name` (`name`),
  KEY `idx_user_category_desc` (`description`),
  KEY `fk_b_user_category_introducerid_idx` (`introducerId`),
  KEY `fk_b_user_category_orgid_idx` (`orgid`),
  KEY `idx_b_user_category_refId` (`refId`),
  KEY `idx_b_user_category_catmethod` (`categorizationMethod`),
  CONSTRAINT `fk_b_user_category_introducerid` FOREIGN KEY (`introducerId`) REFERENCES `b_user` (`id`),
  CONSTRAINT `fk_b_user_category_orgid` FOREIGN KEY (`orgid`) REFERENCES `b_org` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b_user_category_assignment`
--

DROP TABLE IF EXISTS `b_user_category_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b_user_category_assignment` (
  `userid` int NOT NULL,
  `categoryid` int NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`userid`,`categoryid`),
  KEY `fk_b_user_category_assignment_categoryid_idx` (`categoryid`),
  CONSTRAINT `fk_b_user_category_assignment_categoryid` FOREIGN KEY (`categoryid`) REFERENCES `b_user_category` (`id`),
  CONSTRAINT `fk_b_user_category_assignment_userid` FOREIGN KEY (`userid`) REFERENCES `b_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b_user_change_requests`
--

DROP TABLE IF EXISTS `b_user_change_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b_user_change_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `approvalLimit` double NOT NULL DEFAULT '0',
  `userApprovalRequestRefId` varchar(45) DEFAULT NULL,
  `isAutoApprovedForLoans` tinyint NOT NULL DEFAULT '0',
  `canIntroduceBeneficiary` tinyint NOT NULL DEFAULT '0',
  `userid` int DEFAULT NULL,
  `status` varchar(70) NOT NULL DEFAULT 'NEW',
  `approvalStatus` varchar(70) NOT NULL DEFAULT 'PENDING',
  `gender` enum('MALE','FEMALE') DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_ucr_b_user_idx` (`userid`),
  KEY `fk_ucr_b_user` (`userid`),
  CONSTRAINT `fk_ucr_b_user` FOREIGN KEY (`userid`) REFERENCES `b_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b_userdatalog`
--

DROP TABLE IF EXISTS `b_userdatalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b_userdatalog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refid` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint DEFAULT NULL,
  `columnname` varchar(255) DEFAULT NULL,
  `newValue` varchar(255) DEFAULT NULL,
  `previousvalue` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `userRefId` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `b_userdatalogcol` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refid_UNIQUE` (`refid`),
  KEY `idx_buserdatalog_userrefid` (`userRefId`),
  KEY `idx_buserdatalog_userid` (`user_id`),
  KEY `idx_buserdatalog_columnname` (`columnname`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_accrual_schedule`
--

DROP TABLE IF EXISTS `c_accrual_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_accrual_schedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `loanid` int NOT NULL,
  `scheduledDate` datetime DEFAULT NULL,
  `installmentNo` tinyint DEFAULT NULL,
  `accountingstatus` varchar(20) NOT NULL DEFAULT 'NOTACCOUNTED',
  `dateaccounted` datetime DEFAULT NULL,
  `interestAmount` decimal(10,2) DEFAULT '0.00',
  `totalFees` decimal(10,2) DEFAULT '0.00',
  `totalAmount` decimal(10,2) DEFAULT '0.00',
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `idx_paymentsschedule_refid` (`refId`),
  KEY `fk_c_loanpaymentschedule_loanid_idx` (`loanid`),
  KEY `fk_c_loanpaymentschedule_loanid` (`loanid`),
  CONSTRAINT `fk_c_accrual_schedule_loanid` FOREIGN KEY (`loanid`) REFERENCES `c_loanapplication` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_accrued_loan_fee`
--

DROP TABLE IF EXISTS `c_accrued_loan_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_accrued_loan_fee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `accrual_schedule_id` int DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `name` varchar(100) DEFAULT NULL,
  `accountNumber` varchar(45) DEFAULT NULL,
  `deferredAccountNumber` varchar(20) NOT NULL DEFAULT 'NOTACCOUNTED',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `zohoLedgerId` varchar(45) DEFAULT NULL,
  `invoiceNo` varchar(45) DEFAULT NULL,
  `invoiceId` varchar(45) DEFAULT NULL,
  `accountingStatus` varchar(45) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `idx_paymentsschedule_refid` (`refId`),
  KEY `fk_c_accrued_loan_fee_accrualschedule_idx` (`accrual_schedule_id`),
  CONSTRAINT `fk_c_accrued_loan_fee_accrualschedule` FOREIGN KEY (`accrual_schedule_id`) REFERENCES `c_accrual_schedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_activitylog`
--

DROP TABLE IF EXISTS `c_activitylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_activitylog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `userid` int DEFAULT NULL,
  `activitydate` datetime DEFAULT NULL,
  `fullname` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `amount` double(10,0) DEFAULT '0',
  `userrefid` varchar(45) DEFAULT NULL,
  `docrefid` varchar(45) DEFAULT NULL,
  `transactionreference` varchar(65) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_advancerequest`
--

DROP TABLE IF EXISTS `c_advancerequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_advancerequest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint DEFAULT '1',
  `phonenumber` varchar(45) DEFAULT NULL,
  `approvalStatus` varchar(45) DEFAULT NULL,
  `approvalDate` datetime DEFAULT NULL,
  `disbursementStatus` varchar(45) DEFAULT NULL,
  `disbursementDate` datetime DEFAULT NULL,
  `disbursementMethod` varchar(45) DEFAULT NULL,
  `jmsCorrelationId` varchar(45) DEFAULT NULL,
  `correlationKey` varchar(45) DEFAULT NULL,
  `transactionId` varchar(45) DEFAULT NULL,
  `applicationStatus` varchar(45) DEFAULT NULL,
  `accountingStatus` varchar(45) DEFAULT NULL,
  `dateAccounted` datetime DEFAULT NULL,
  `withdrawalMethod` varchar(45) DEFAULT NULL,
  `firstname` varchar(125) DEFAULT NULL,
  `lastname` varchar(125) DEFAULT NULL,
  `fullname` varchar(125) DEFAULT NULL,
  `requestedAmount` double DEFAULT NULL,
  `processingfees` double(10,2) DEFAULT '0.00',
  `servicecharge` double DEFAULT NULL,
  `paymentproviderfees` double DEFAULT NULL,
  `totalamount` double DEFAULT NULL,
  `errorCode` varchar(45) DEFAULT NULL,
  `errorDescription` varchar(255) DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `appraisalRemarks` varchar(100) DEFAULT NULL,
  `appraisalReason` varchar(45) DEFAULT NULL,
  `payeePaybill` varchar(45) DEFAULT NULL,
  `payeeAccountNo` varchar(100) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  UNIQUE KEY `transactionId_UNIQUE` (`transactionId`),
  UNIQUE KEY `jmsCorrelationId_UNIQUE` (`jmsCorrelationId`),
  UNIQUE KEY `correlationKey_UNIQUE` (`correlationKey`),
  KEY `idx_advancerequest_transactionId` (`transactionId`),
  KEY `idx_advancerequest_correlationkey` (`correlationKey`),
  KEY `idx_advancerequest_phonenumber` (`phonenumber`),
  KEY `idx_advancerequest_fullname` (`fullname`),
  KEY `fk_c_advancerequest_userid_idx` (`userid`),
  KEY `idx_advancerequest_refId` (`refId`),
  KEY `fk_c_advancerequest_userid0` (`userid`),
  CONSTRAINT `fk_c_advancerequest_userid0` FOREIGN KEY (`userid`) REFERENCES `b_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_b2c_transaction`
--

DROP TABLE IF EXISTS `c_b2c_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_b2c_transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint DEFAULT '1',
  `initiatorName` varchar(125) DEFAULT NULL,
  `securityCredential` text,
  `commandID` varchar(45) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `partyA` varchar(45) DEFAULT NULL,
  `partyB` varchar(45) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `occasion` varchar(45) DEFAULT NULL,
  `jmsCorrelationId` varchar(45) DEFAULT NULL,
  `conversationID` varchar(255) DEFAULT NULL,
  `originatorConversationID` varchar(255) DEFAULT NULL,
  `responseCode` varchar(45) DEFAULT NULL,
  `responseDescription` varchar(255) DEFAULT NULL,
  `resultType` varchar(45) DEFAULT NULL,
  `resultCode` varchar(45) DEFAULT NULL,
  `resultDescription` varchar(255) DEFAULT NULL,
  `transactionId` varchar(45) DEFAULT NULL,
  `transactionReceipt` varchar(45) DEFAULT NULL,
  `B2CChargesPaidAccountAvailableFunds` double DEFAULT NULL,
  `B2CRecipientIsRegisteredCustomer` varchar(45) DEFAULT NULL,
  `transactionCompletedDateTime` datetime DEFAULT NULL,
  `ReceiverPartyPublicName` varchar(255) DEFAULT NULL,
  `B2CWorkingAccountAvailableFunds` double DEFAULT NULL,
  `B2CUtilityAccountAvailableFunds` double DEFAULT NULL,
  `errorCode` varchar(45) DEFAULT NULL,
  `errorDescription` varchar(255) DEFAULT NULL,
  `ipAddress` varchar(45) DEFAULT NULL,
  `tenantId` varchar(45) DEFAULT NULL,
  `disbursementMethod` varchar(45) DEFAULT 'MPESA',
  `debitAccountCurrentBalance` varchar(255) DEFAULT NULL,
  `initiatorAccountCurrentBalance` varchar(255) DEFAULT NULL,
  `debitAccountBalance` varchar(255) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `debitPartyPublicName` varchar(255) DEFAULT NULL,
  `creditPartyPublicName` varchar(255) DEFAULT NULL,
  `debitPartyCharges` varchar(255) DEFAULT NULL,
  `senderIdentifierType` varchar(45) DEFAULT NULL,
  `recieverIdentifierType` varchar(45) DEFAULT NULL,
  `accountReference` varchar(255) DEFAULT NULL,
  `creditAccountBalance` varchar(255) DEFAULT NULL,
  `sourceTransactionId` varchar(45) DEFAULT NULL,
  `debitAccountType` varchar(100) DEFAULT NULL,
  `billrefno` varchar(45) DEFAULT NULL,
  `initiatedTime` datetime DEFAULT NULL,
  `beneficiaryPhoneNumber` varchar(20) DEFAULT NULL,
  `channel` varchar(45) DEFAULT NULL,
  `paymentProvider` varchar(100) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  UNIQUE KEY `jmsCorrelationId_UNIQUE` (`jmsCorrelationId`),
  UNIQUE KEY `transactionId_UNIQUE` (`transactionId`),
  KEY `idx_b2c_conversationid` (`conversationID`),
  KEY `idx_b2c_refid` (`refId`),
  KEY `idx_b2c_ipAddress` (`ipAddress`),
  KEY `idx_b2c_jmscorrelationid` (`jmsCorrelationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_c2b_transaction`
--

DROP TABLE IF EXISTS `c_c2b_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_c2b_transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` varchar(45) DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` varchar(45) DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` varchar(45) DEFAULT NULL,
  `transactionType` varchar(100) DEFAULT NULL,
  `transactionId` varchar(45) DEFAULT NULL,
  `transactionTime` datetime DEFAULT NULL,
  `transactionAmount` double DEFAULT NULL,
  `businessShortCode` varchar(45) DEFAULT NULL,
  `billRefNo` varchar(200) DEFAULT NULL,
  `invoiceNo` varchar(200) DEFAULT NULL,
  `orgAccountBalance` double NOT NULL DEFAULT '0',
  `thirdPartyTransactionID` varchar(200) DEFAULT NULL,
  `msisdn` varchar(45) DEFAULT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `middleName` varchar(45) DEFAULT NULL,
  `status` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `tenantId` varchar(45) DEFAULT NULL,
  `ipAddress` varchar(45) DEFAULT NULL,
  `responseCode` varchar(45) DEFAULT NULL,
  `responseDescription` varchar(255) DEFAULT NULL,
  `beneficiaryPhoneNumber` varchar(20) DEFAULT NULL,
  `jmsCorrelationId` varchar(45) DEFAULT NULL,
  `originatorConversationID` varchar(45) DEFAULT NULL,
  `conversationID` varchar(45) DEFAULT NULL,
  `resultCode` varchar(45) DEFAULT '0',
  `resultDesc` varchar(255) DEFAULT NULL,
  `transactionCategory` varchar(45) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `channel` varchar(45) DEFAULT NULL,
  `paymentProvider` varchar(100) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  UNIQUE KEY `transactionId_UNIQUE` (`transactionId`),
  UNIQUE KEY `originatorConversationID_UNIQUE` (`originatorConversationID`),
  UNIQUE KEY `jmsCorrelationId_UNIQUE` (`jmsCorrelationId`),
  KEY `idx_transactions_businessShortCode` (`businessShortCode`),
  KEY `idx_transactions_transactionId` (`transactionId`),
  KEY `idx_transactions_billRefNo` (`billRefNo`),
  KEY `idx_transactions_invoiceNo` (`invoiceNo`),
  KEY `idx_transactions_msisdn` (`msisdn`),
  KEY `idx_transactions_firstName` (`firstName`),
  KEY `idx_transactions_lastName` (`lastName`),
  KEY `idx_transactions_middleName` (`middleName`),
  KEY `idx_transactions_thirdPartyTransactionID` (`thirdPartyTransactionID`),
  KEY `idx_transactions_refId` (`refId`),
  KEY `idx_transactions_tenantId` (`tenantId`),
  KEY `idx_transactions_ipAddress` (`ipAddress`),
  KEY `idx_transactions_conversationid` (`conversationID`),
  KEY `idx_transactions_originatorconversationid` (`originatorConversationID`),
  KEY `idx_transactions_jmsCorrelationId` (`jmsCorrelationId`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_checkoff`
--

DROP TABLE IF EXISTS `c_checkoff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_checkoff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime NOT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `checkoffName` varchar(125) DEFAULT NULL,
  `label` varchar(125) DEFAULT NULL,
  `totalAmount` decimal(10,2) DEFAULT NULL,
  `totalLoanCount` int DEFAULT NULL,
  `allocatedAmount` decimal(10,2) DEFAULT NULL,
  `transactionReference` varchar(45) DEFAULT NULL,
  `paymentDate` datetime DEFAULT NULL,
  `paymentDrAccount` varchar(45) DEFAULT NULL,
  `dueDate` datetime DEFAULT NULL,
  `paymentStatus` varchar(45) DEFAULT NULL,
  `documentDate` datetime DEFAULT NULL,
  `applicationStatus` varchar(25) NOT NULL,
  `accountingStatus` varchar(25) NOT NULL,
  `accountingDate` datetime DEFAULT NULL,
  `contactName` varchar(125) DEFAULT NULL,
  `email` varchar(125) DEFAULT NULL,
  `phoneNumber` varchar(125) DEFAULT NULL,
  `designation` varchar(25) DEFAULT NULL,
  `checkoffTemplateId` int DEFAULT NULL,
  `organizationId` int DEFAULT NULL,
  `userCategoryId` int DEFAULT NULL,
  `loanProductId` int DEFAULT NULL,
  `postingUserName` varchar(45) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `generatedByUserName` varchar(125) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_c_checkoff_template_templateId_idx` (`checkoffTemplateId`),
  KEY `fk_b_org_checkoffId_idx` (`organizationId`),
  KEY `fk_u_loan_product_checkoffId_idx` (`loanProductId`),
  KEY `fk_b_user_category_checkoffId_idx` (`userCategoryId`),
  CONSTRAINT `fk_b_org_checkoffId_id` FOREIGN KEY (`organizationId`) REFERENCES `b_org` (`id`),
  CONSTRAINT `fk_b_user_category_checkoffId_id` FOREIGN KEY (`userCategoryId`) REFERENCES `b_user_category` (`id`),
  CONSTRAINT `fk_c_checkoff_template_templateId_id` FOREIGN KEY (`checkoffTemplateId`) REFERENCES `c_checkoff_template` (`id`),
  CONSTRAINT `fk_u_loan_product_checkoffId_id` FOREIGN KEY (`loanProductId`) REFERENCES `u_loan_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_checkoff_migration_summary`
--

DROP TABLE IF EXISTS `c_checkoff_migration_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_checkoff_migration_summary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime NOT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `oldCheckoffRefId` varchar(45) DEFAULT NULL,
  `checkoffName` varchar(45) DEFAULT NULL,
  `migrationStatus` varchar(45) DEFAULT NULL,
  `statusMessage` varchar(255) DEFAULT NULL,
  `checkoffId` int DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_c_checkoff_c_checkoff_migration_summary_checkoffId_idx` (`checkoffId`),
  CONSTRAINT `fk_c_checkoff_c_checkoff_migration_summary_checkoffId_id` FOREIGN KEY (`checkoffId`) REFERENCES `c_checkoff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_checkoff_payee`
--

DROP TABLE IF EXISTS `c_checkoff_payee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_checkoff_payee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime NOT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `loanRefId` varchar(45) DEFAULT NULL,
  `checkoffAmount` decimal(10,2) DEFAULT NULL,
  `paymentStatus` varchar(45) DEFAULT NULL,
  `totalLoanBalance` decimal(10,2) DEFAULT NULL,
  `dueDate` datetime DEFAULT NULL,
  `checkoffId` int DEFAULT NULL,
  `loanId` int DEFAULT NULL,
  `transactionId` varchar(45) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_c_checkoff_checkoffId_idx` (`checkoffId`),
  KEY `fk_c_loanapplication_loanId_idx` (`loanId`),
  CONSTRAINT `fk_c_checkoff_checkoffId_id` FOREIGN KEY (`checkoffId`) REFERENCES `c_checkoff` (`id`),
  CONSTRAINT `fk_c_loanapplication_loanId_id` FOREIGN KEY (`loanId`) REFERENCES `c_loanapplication` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_checkoff_template`
--

DROP TABLE IF EXISTS `c_checkoff_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_checkoff_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime NOT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `templateName` varchar(45) DEFAULT NULL,
  `label` varchar(125) DEFAULT NULL,
  `organizationId` int DEFAULT NULL,
  `loanProductId` int DEFAULT NULL,
  `userCategoryId` int DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_b_org_templateId_idx` (`organizationId`),
  KEY `fk_u_loan_product_templateId_idx` (`loanProductId`),
  KEY `fk_b_user_category_templateId_idx` (`userCategoryId`),
  CONSTRAINT `fk_b_org_templateId_id` FOREIGN KEY (`organizationId`) REFERENCES `b_org` (`id`),
  CONSTRAINT `fk_b_user_category_templateId_id` FOREIGN KEY (`userCategoryId`) REFERENCES `b_user_category` (`id`),
  CONSTRAINT `fk_u_loan_product_templateId_id` FOREIGN KEY (`loanProductId`) REFERENCES `u_loan_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_checkoffallocatee`
--

DROP TABLE IF EXISTS `c_checkoffallocatee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_checkoffallocatee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint DEFAULT NULL,
  `memoId` int DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL,
  `idnumber` varchar(10) DEFAULT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `userRefId` varchar(45) DEFAULT NULL,
  `outstandingLoanRefId` varchar(45) DEFAULT NULL,
  `outstandingBalance` double(10,2) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_memo_id_idx` (`memoId`),
  KEY `fk_memo_refid` (`refId`),
  KEY `fk_memo_id` (`memoId`),
  CONSTRAINT `fk_memo_id` FOREIGN KEY (`memoId`) REFERENCES `c_memo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_contributions_seq`
--

DROP TABLE IF EXISTS `c_contributions_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_contributions_seq` (
  `id` int NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_customer_balances_import`
--

DROP TABLE IF EXISTS `c_customer_balances_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_customer_balances_import` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isactive` tinyint DEFAULT NULL,
  `idnumber` varchar(45) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `firstName` varchar(150) DEFAULT NULL,
  `lastName` varchar(150) DEFAULT NULL,
  `savings` decimal(10,2) DEFAULT NULL,
  `shares` decimal(10,2) DEFAULT NULL,
  `registration` decimal(10,2) DEFAULT NULL,
  `postingdate` datetime NOT NULL,
  `resultcode` varchar(45) DEFAULT NULL,
  `resultmessage` varchar(500) DEFAULT NULL,
  `accountingstatus` varchar(45) DEFAULT 'NOTACCOUNTED',
  `customerid` int DEFAULT NULL,
  `transactionreference` varchar(45) DEFAULT NULL,
  `transactionId` varchar(45) DEFAULT NULL,
  `memberNo` varchar(45) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_c_customer_balances_import_customer_idx` (`customerid`),
  CONSTRAINT `fk_c_customer_balances_import_customer` FOREIGN KEY (`customerid`) REFERENCES `b_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_fund_transfer`
--

DROP TABLE IF EXISTS `c_fund_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_fund_transfer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refid` varchar(45) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdby` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedby` varchar(45) DEFAULT NULL,
  `isactive` tinyint DEFAULT NULL,
  `beneficiaryId` int DEFAULT NULL,
  `transferDate` datetime DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paymentProviderFees` decimal(10,2) DEFAULT NULL,
  `sourceAccountNo` varchar(45) NOT NULL,
  `sourceAccountName` varchar(100) DEFAULT NULL,
  `resultCode` varchar(20) DEFAULT NULL,
  `resultMessage` varchar(255) DEFAULT NULL,
  `applicationStatus` varchar(45) DEFAULT NULL,
  `approvalStatus` varchar(45) DEFAULT NULL,
  `disbursementStatus` varchar(45) DEFAULT NULL,
  `disbursementDate` datetime DEFAULT NULL,
  `transactionId` varchar(45) DEFAULT NULL,
  `fundTransferType` varchar(45) NOT NULL,
  `initiatedby` varchar(100) NOT NULL,
  `accountingStatus` varchar(45) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_c_fund_transfer_beneficiaryid_idx` (`beneficiaryId`),
  CONSTRAINT `fk_c_fund_transfer_beneficiaryid` FOREIGN KEY (`beneficiaryId`) REFERENCES `b_payment_beneficiary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_graduated_fees`
--

DROP TABLE IF EXISTS `c_graduated_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_graduated_fees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `band` varchar(45) NOT NULL,
  `value` double NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `loanfeeId` int DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_c_fees_graduated` (`loanfeeId`),
  CONSTRAINT `fk_c_fees_graduated` FOREIGN KEY (`loanfeeId`) REFERENCES `u_fee_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_interacc_transfer`
--

DROP TABLE IF EXISTS `c_interacc_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_interacc_transfer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `companyName` varchar(255) DEFAULT NULL,
  `accountCode` varchar(45) DEFAULT NULL,
  `contactName` varchar(100) DEFAULT NULL,
  `contactEmail` varchar(45) DEFAULT NULL,
  `approvalstatus` varchar(45) DEFAULT NULL,
  `approvalDate` datetime DEFAULT NULL,
  `appraisalRemarks` varchar(100) DEFAULT NULL,
  `appraisalReason` varchar(45) DEFAULT NULL,
  `disbursementStatus` varchar(45) DEFAULT NULL,
  `disbursementdate` datetime DEFAULT NULL,
  `disbursementmethod` varchar(45) NOT NULL DEFAULT 'MPESA',
  `jmsCorrelationId` varchar(45) DEFAULT NULL,
  `correlationKey` varchar(45) DEFAULT NULL,
  `transactionId` varchar(45) DEFAULT NULL,
  `requestedAmount` double NOT NULL DEFAULT '0',
  `processingfees` double(10,2) DEFAULT '0.00',
  `serviceCharge` double DEFAULT '0',
  `paymentProviderFees` double DEFAULT '0',
  `totalAmount` double DEFAULT '0',
  `errorCode` varchar(45) DEFAULT NULL,
  `errorDescription` varchar(100) DEFAULT NULL,
  `applicationStatus` varchar(45) DEFAULT NULL,
  `accountingStatus` varchar(45) DEFAULT NULL,
  `dateAccounted` datetime DEFAULT NULL,
  `payeePaybill` varchar(45) DEFAULT NULL,
  `payeeAccountNo` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `initiatorid` int DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `channel` varchar(45) DEFAULT NULL,
  `paymentProvider` varchar(100) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  UNIQUE KEY `transactionId_UNIQUE` (`transactionId`),
  UNIQUE KEY `correlationKey_UNIQUE` (`correlationKey`),
  UNIQUE KEY `jmsCorrelationId_UNIQUE` (`jmsCorrelationId`),
  KEY `fk_c_interacc_transfer_initiatorid_idx` (`initiatorid`),
  KEY `c_interacc_transfer_refId` (`refId`),
  KEY `c_interacc_transfer_jmscorrelationid` (`jmsCorrelationId`),
  KEY `c_interacc_transfer_correlationid` (`correlationKey`),
  KEY `c_interacc_transfer_transactionid` (`transactionId`),
  KEY `fk_c_interacc_transfer_initiatorid` (`initiatorid`),
  CONSTRAINT `fk_c_interacc_transfer_initiatorid` FOREIGN KEY (`initiatorid`) REFERENCES `b_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_invitation`
--

DROP TABLE IF EXISTS `c_invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_invitation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` varchar(45) DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` varchar(45) DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `userRefId` varchar(45) NOT NULL,
  `tenantId` varchar(45) NOT NULL,
  `accountName` varchar(45) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `c_invitation_userRefId` (`userRefId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_journaltransaction`
--

DROP TABLE IF EXISTS `c_journaltransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_journaltransaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime NOT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isactive` tinyint NOT NULL DEFAULT '1',
  `templateRefId` varchar(45) NOT NULL,
  `postingDate` datetime DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `description` varchar(100) NOT NULL,
  `accountingStatus` varchar(45) NOT NULL DEFAULT 'NOTACCOUNTED',
  `postedBy` varchar(45) DEFAULT NULL,
  `transactionId` varchar(45) DEFAULT NULL,
  `loanid` int DEFAULT NULL,
  `reversalTransactionId` varchar(45) DEFAULT NULL,
  `reversedBy` varchar(255) DEFAULT NULL,
  `reversalPostingDate` datetime DEFAULT NULL,
  `reversalDescription` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_c_journaltransaction_loanid_idx` (`loanid`),
  CONSTRAINT `fk_c_journaltransaction_loanid` FOREIGN KEY (`loanid`) REFERENCES `c_loanapplication` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_journaltransaction_details`
--

DROP TABLE IF EXISTS `c_journaltransaction_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_journaltransaction_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isactive` tinyint NOT NULL DEFAULT '1',
  `accountno` varchar(45) NOT NULL,
  `accountname` varchar(100) NOT NULL,
  `postingType` enum('DR','CR') NOT NULL,
  `journaltransactionid` int DEFAULT NULL,
  `referencedJournalEntry` varchar(45) NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_c_ledgertransaction_details_transactionid_idx` (`journaltransactionid`),
  CONSTRAINT `fk_c_journaltransaction_details_transactionid` FOREIGN KEY (`journaltransactionid`) REFERENCES `c_journaltransaction` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_loan_disbursement`
--

DROP TABLE IF EXISTS `c_loan_disbursement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_loan_disbursement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime NOT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `disbursementAmount` varchar(45) DEFAULT NULL,
  `disbursementDate` datetime NOT NULL,
  `transactionId` varchar(45) NOT NULL,
  `transactionReference` varchar(45) NOT NULL,
  `accountName` varchar(45) NOT NULL,
  `accountNumber` varchar(45) NOT NULL,
  `loanId` int DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_c_loan_disbursement_loanid_idx` (`loanId`),
  CONSTRAINT `fk_c_loan_disbursement_loanid` FOREIGN KEY (`loanId`) REFERENCES `c_loanapplication` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_loan_fee_offset`
--

DROP TABLE IF EXISTS `c_loan_fee_offset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_loan_fee_offset` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `accountNumber` varchar(45) NOT NULL,
  `feeDeferredAccount` varchar(45) NOT NULL,
  `feeName` varchar(45) NOT NULL,
  `offsetAccount` varchar(45) NOT NULL,
  `offsetAccountName` varchar(45) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `loanid` int DEFAULT NULL,
  `offsetRequestId` int DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_c_loan_fee_offset_requestid_idx` (`offsetRequestId`),
  CONSTRAINT `fk_c_loan_fee_offset_requestid` FOREIGN KEY (`offsetRequestId`) REFERENCES `c_loan_offset_request` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_loan_migration_summary`
--

DROP TABLE IF EXISTS `c_loan_migration_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_loan_migration_summary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime NOT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `customerName` varchar(125) DEFAULT NULL,
  `migrationStatus` varchar(45) DEFAULT NULL,
  `statusMessage` varchar(255) DEFAULT NULL,
  `loanId` int DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_c_loanapplication_c_loan_migration_summary_loanId_idx` (`loanId`),
  CONSTRAINT `fk_c_loanapplication_c_loan_migration_summary_loanId_id` FOREIGN KEY (`loanId`) REFERENCES `c_loanapplication` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_loan_offset_request`
--

DROP TABLE IF EXISTS `c_loan_offset_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_loan_offset_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isactive` tinyint NOT NULL DEFAULT '1',
  `loanid` int NOT NULL,
  `offsettype` enum('WRITEOFF','RESTRUCTURE','REBATE') NOT NULL,
  `loanOffsetAmount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `principalOffsetAmount` decimal(10,2) DEFAULT '0.00',
  `interestOffsetAmount` decimal(10,2) DEFAULT '0.00',
  `feesOffsetAmount` decimal(10,2) DEFAULT '0.00',
  `penaltiesOffsetAmount` decimal(10,2) DEFAULT '0.00',
  `offsetAccountNo` varchar(45) DEFAULT NULL,
  `postingDate` varchar(45) DEFAULT NULL,
  `postedBy` varchar(45) DEFAULT NULL,
  `offsetReason` varchar(255) DEFAULT NULL,
  `nextLoanRefId` varchar(45) DEFAULT NULL,
  `childLoanNo` varchar(45) DEFAULT NULL,
  `transactionId` varchar(45) NOT NULL,
  `reversalTransactionId` varchar(45) DEFAULT NULL,
  `reversedBy` varchar(100) DEFAULT NULL,
  `reversalPostingDate` datetime DEFAULT NULL,
  `reversalDescription` varchar(100) DEFAULT NULL,
  `reversalReason` varchar(45) DEFAULT NULL,
  `writeOffAmount` decimal(10,2) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_c_loan_rebate_loanid_idx` (`loanid`),
  CONSTRAINT `fk_c_loan_offset_request_loanid` FOREIGN KEY (`loanid`) REFERENCES `c_loanapplication` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_loan_payment`
--

DROP TABLE IF EXISTS `c_loan_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_loan_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `transactionId` varchar(45) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `paymentDate` datetime NOT NULL,
  `accountingStatus` varchar(45) DEFAULT 'NOTACCOUNTED',
  `loanid` int NOT NULL,
  `transactionReference` varchar(45) NOT NULL,
  `principalAllocation` decimal(10,2) NOT NULL DEFAULT '0.00',
  `interestAllocation` decimal(10,2) NOT NULL DEFAULT '0.00',
  `feesAllocation` decimal(10,2) NOT NULL DEFAULT '0.00',
  `penaltiesAllocation` decimal(10,2) NOT NULL DEFAULT '0.00',
  `balanceAfterAllocations` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paymentMethod` varchar(45) DEFAULT NULL,
  `postingDate` datetime DEFAULT NULL,
  `paymentClass` varchar(45) NOT NULL DEFAULT 'LOAN_INSTALLMENT_PAYMENT',
  `description` varchar(255) DEFAULT NULL,
  `loanAmount` decimal(10,2) DEFAULT '0.00',
  `invoiceAmount` decimal(10,2) DEFAULT '0.00',
  `reversalReason` varchar(60) DEFAULT NULL,
  `paymentDrAccount` varchar(45) DEFAULT NULL,
  `journaltransactionid` int DEFAULT NULL,
  `reversalTransactionId` varchar(45) DEFAULT NULL,
  `reversedBy` varchar(125) DEFAULT NULL,
  `reversalPostingDate` datetime DEFAULT NULL,
  `reversalDescription` varchar(255) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_c_loan_payment_loanid_idx` (`loanid`),
  KEY `fk_c_loan_payment_journalid_idx` (`journaltransactionid`),
  CONSTRAINT `fk_c_loan_payment_journalid` FOREIGN KEY (`journaltransactionid`) REFERENCES `c_journaltransaction` (`id`),
  CONSTRAINT `fk_c_loan_payment_loanid` FOREIGN KEY (`loanid`) REFERENCES `c_loanapplication` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_loan_payment_details`
--

DROP TABLE IF EXISTS `c_loan_payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_loan_payment_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint DEFAULT '0',
  `loanpaymentid` int DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `item` varchar(45) DEFAULT NULL,
  `feeName` varchar(45) DEFAULT NULL,
  `accountNumber` varchar(45) DEFAULT NULL,
  `deferredAccountNumber` varchar(45) DEFAULT NULL,
  `reversalTransactionId` varchar(45) DEFAULT NULL,
  `reversedBy` varchar(125) DEFAULT NULL,
  `reversalPostingDate` datetime DEFAULT NULL,
  `reversalDescription` varchar(255) DEFAULT NULL,
  `isSystemFee` tinyint DEFAULT '0',
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_c_loan_payment_breakdown_paymentid_idx` (`loanpaymentid`),
  CONSTRAINT `fk_c_loan_payment_breakdown_paymentid` FOREIGN KEY (`loanpaymentid`) REFERENCES `c_loan_payment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_loan_payment_schedule_allocation`
--

DROP TABLE IF EXISTS `c_loan_payment_schedule_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_loan_payment_schedule_allocation` (
  `scheduleid` int NOT NULL,
  `paymentid` int NOT NULL,
  `totalAllocation` decimal(10,2) NOT NULL DEFAULT '0.00',
  `principalAllocation` decimal(10,2) DEFAULT '0.00',
  `interestAllocation` decimal(10,2) DEFAULT '0.00',
  `feesAllocation` decimal(10,2) DEFAULT '0.00',
  `penaltiesAllocation` decimal(10,2) DEFAULT '0.00',
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`scheduleid`,`paymentid`),
  KEY `fk_c_loan_payment_allocation_paymentid_idx` (`paymentid`),
  CONSTRAINT `fk_c_loan_payment_allocation_paymentid` FOREIGN KEY (`paymentid`) REFERENCES `c_loan_payment` (`id`),
  CONSTRAINT `fk_c_loan_payment_allocation_scheduleid` FOREIGN KEY (`scheduleid`) REFERENCES `c_loanpaymentschedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_loan_payment_schedule_allocations_fees`
--

DROP TABLE IF EXISTS `c_loan_payment_schedule_allocations_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_loan_payment_schedule_allocations_fees` (
  `id` varchar(20) NOT NULL,
  `detailid` int NOT NULL,
  `penaltyid` int DEFAULT NULL,
  `feeid` int DEFAULT NULL,
  `allocationAmount` decimal(10,2) NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_c_loan_payment_schedule_allocations_fees_paymentfeeid_idx` (`detailid`),
  KEY `fk_c_loan_payment_schedule_allocations_fees_penaltyid_idx` (`penaltyid`),
  KEY `fk_c_loan_payment_schedule_allocations_fees_feeid_idx` (`feeid`),
  CONSTRAINT `fk_c_loan_payment_schedule_allocations_fees_feeid` FOREIGN KEY (`feeid`) REFERENCES `c_loanpaymentschedule_fees` (`id`),
  CONSTRAINT `fk_c_loan_payment_schedule_allocations_fees_paymentfeeid` FOREIGN KEY (`detailid`) REFERENCES `c_loan_payment_details` (`id`),
  CONSTRAINT `fk_c_loan_payment_schedule_allocations_fees_penaltyid` FOREIGN KEY (`penaltyid`) REFERENCES `c_loanpaymentschedule_penalty_fees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_loanapplication`
--

DROP TABLE IF EXISTS `c_loanapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_loanapplication` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `userid` int DEFAULT NULL,
  `requestedAmount` double(10,2) NOT NULL,
  `disbursementAmount` double(10,2) DEFAULT NULL,
  `interestAmount` double(10,2) NOT NULL,
  `servicecharge` double(10,2) NOT NULL,
  `paymentproviderfees` double(10,2) NOT NULL,
  `totalAmount` double(10,2) DEFAULT NULL,
  `repaymentPeriod` tinyint DEFAULT NULL,
  `approvalstatus` varchar(45) DEFAULT NULL,
  `approvaldate` datetime DEFAULT NULL,
  `installments` tinyint DEFAULT NULL,
  `applicationStatus` varchar(45) DEFAULT NULL,
  `disbursementStatus` varchar(45) DEFAULT NULL,
  `disbursementdate` datetime DEFAULT NULL,
  `disbursementmethod` varchar(45) DEFAULT NULL,
  `duedate` datetime DEFAULT NULL,
  `repaymentStatus` varchar(45) DEFAULT 'NOTPAID',
  `lastRepaymentdate` datetime DEFAULT NULL,
  `jmsCorrelationId` varchar(45) DEFAULT NULL,
  `correlationkey` varchar(45) DEFAULT NULL,
  `transactionId` varchar(45) DEFAULT NULL,
  `accountingStatus` varchar(45) DEFAULT 'NOTACCOUNTED',
  `prestaTransactionCharge` double(10,2) DEFAULT '0.00',
  `servicechargerate` double(10,2) DEFAULT NULL,
  `interestrate` double(10,2) DEFAULT NULL,
  `processingfeerate` double(10,2) DEFAULT '0.00',
  `processingfees` double(10,2) DEFAULT '0.00',
  `balancebroughtforward` double(10,2) DEFAULT '0.00',
  `prepaidApplicationFeeAmount` decimal(10,2) DEFAULT '0.00',
  `overpaymentBalBroughtForward` decimal(10,2) DEFAULT '0.00',
  `loanBalance` double(10,2) DEFAULT NULL,
  `dateAccounted` datetime DEFAULT NULL,
  `totalrepayableamount` double(10,2) DEFAULT NULL,
  `errorCode` varchar(45) DEFAULT NULL,
  `errorDescription` varchar(255) DEFAULT NULL,
  `loanType` varchar(125) DEFAULT NULL,
  `loanTerm` varchar(20) DEFAULT NULL,
  `totalPenalties` double(10,2) DEFAULT '0.00',
  `loansource` varchar(45) DEFAULT 'USER',
  `loanclass` varchar(45) NOT NULL DEFAULT 'NORMAL',
  `payeePaybill` varchar(45) DEFAULT NULL,
  `payeeAccountNo` varchar(45) DEFAULT NULL,
  `appraisalRemarks` varchar(100) DEFAULT NULL,
  `appraisalReason` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `tarrifType` varchar(45) DEFAULT 'CUSTOMER',
  `interestFeeRule` varchar(45) DEFAULT 'DO_NOT_DEDUCT',
  `convenienceFeesRule` varchar(45) DEFAULT 'DO_NOT_DEDUCT',
  `processingFeesRule` varchar(45) DEFAULT 'DO_NOT_DEDUCT',
  `deductedInterest` double(10,2) DEFAULT '0.00',
  `deductedProcessingFees` double(10,2) DEFAULT '0.00',
  `deductedPaymentProvider` double(10,2) DEFAULT '0.00',
  `deductedServiceCharges` double(10,2) DEFAULT '0.00',
  `totalDeductions` double(10,2) DEFAULT '0.00',
  `lenderPaymentProvider` double(10,2) DEFAULT '0.00',
  `lenderServiceCharge` double(10,2) DEFAULT '0.00',
  `lenderTotalExpense` double(10,2) DEFAULT '0.00',
  `tenantConfig` varchar(45) DEFAULT NULL,
  `agencyStructure` varchar(45) DEFAULT NULL,
  `agentRevenueShareModel` varchar(65) DEFAULT NULL,
  `agentRevenueShareRate` double(4,2) DEFAULT '0.00',
  `agentRevenueShare` double(10,2) DEFAULT '0.00',
  `agentTransactionCharge` double(10,2) DEFAULT '0.00',
  `referencedLoanRefId` varchar(45) DEFAULT NULL,
  `referencedLoanPeriod` int DEFAULT NULL,
  `referencedLoanTerm` varchar(45) DEFAULT NULL,
  `referencedLoanRate` double(10,2) DEFAULT NULL,
  `referencedLoanType` varchar(45) DEFAULT NULL,
  `referencedLoanInstallments` tinyint DEFAULT NULL,
  `referencedLoanDaysExtended` int DEFAULT NULL,
  `referencedLoanEffectInterestRate` double DEFAULT NULL,
  `topUpSummary` varchar(255) DEFAULT NULL,
  `restructureSummary` varchar(255) DEFAULT NULL,
  `originalLoanId` int DEFAULT NULL,
  `loanProductId` int DEFAULT NULL,
  `repaymentPeriodUnit` enum('DAYS','WEEKS','MONTHS','YEARS') NOT NULL DEFAULT 'DAYS',
  `interestPeriod` enum('DAILY','WEEKLY','MONTHLY','YEARLY','FIXED') NOT NULL,
  `applicationFeeRate` double(10,2) DEFAULT NULL,
  `applicationFeeType` enum('RATE','FIXED_AMOUNT') DEFAULT NULL,
  `applicationFees` double(10,2) DEFAULT NULL,
  `processingFeeType` enum('RATE','FIXED_AMOUNT') DEFAULT NULL,
  `interestCalcMethod` enum('FLAT_RATE','REDUCING_BALANCE','COMPOUNDED') NOT NULL DEFAULT 'FLAT_RATE',
  `paymentCycle` enum('DAILY','WEEKLY','MONTHLY','WHEN_DUE','MONTHLY_MATCH_DAY','MONTHLY_ON_SPECIFIC_DAY') DEFAULT NULL,
  `sessionDetails` varchar(500) DEFAULT NULL,
  `crbCheckAccepted` tinyint DEFAULT NULL,
  `crbCheckAcceptedDate` datetime DEFAULT NULL,
  `isUseAdvancedAllocations` tinyint DEFAULT '0',
  `topupL1InterestWriteOffAmount` double(10,2) DEFAULT '0.00',
  `topupL1ProratedInterestAmount` double(10,2) DEFAULT '0.00',
  `topupL1InterestBroughtForward` decimal(10,2) DEFAULT NULL,
  `topupL2InterestAmount` double(10,2) DEFAULT '0.00',
  `principalBroughtForward` double(10,2) DEFAULT '0.00',
  `rolloverPenaltyStatus` varchar(45) DEFAULT NULL,
  `discountAmount` decimal(10,2) DEFAULT '0.00',
  `reversalAmount` decimal(10,2) DEFAULT NULL,
  `totalRepayableAmountBalance` decimal(10,2) DEFAULT '0.00',
  `currency` varchar(45) DEFAULT NULL,
  `channel` varchar(45) DEFAULT NULL,
  `paymentProvider` varchar(100) DEFAULT NULL,
  `termsAccepted` tinyint DEFAULT NULL,
  `dateTermsAccepted` datetime DEFAULT NULL,
  `dayOfMonth` int DEFAULT NULL,
  `minDays` int NOT NULL DEFAULT '5',
  `gracePeriod` int DEFAULT NULL,
  `gracePeriodUnit` enum('DAYS','WEEKS','MONTHS','YEARS') DEFAULT NULL,
  `loanaccountno` varchar(20) DEFAULT NULL,
  `zohodealid` varchar(45) DEFAULT NULL,
  `interestRecognitionMethod` varchar(45) DEFAULT 'NON_ACCRUAL',
  `interestPeriodCount` decimal(10,2) DEFAULT NULL,
  `totalFees` decimal(10,2) DEFAULT NULL,
  `penaltyCalcApproach` varchar(45) DEFAULT NULL,
  `disbursementAccount` varchar(45) DEFAULT NULL,
  `principalBalance` decimal(10,2) DEFAULT '0.00',
  `interestBalance` decimal(10,2) DEFAULT '0.00',
  `feesBalance` decimal(10,2) DEFAULT '0.00',
  `penaltiesBalance` decimal(10,2) DEFAULT '0.00',
  `upfrontInstallments` int NOT NULL DEFAULT '0',
  `principal` decimal(10,2) DEFAULT NULL,
  `upfrontPrincipalPayment` decimal(10,2) DEFAULT NULL,
  `workingPrincipal` decimal(10,2) DEFAULT NULL,
  `loanStatus` enum('OPEN','CLOSED') NOT NULL DEFAULT 'OPEN',
  `principalAddition` decimal(10,2) DEFAULT NULL,
  `childLoanNo` varchar(20) DEFAULT NULL,
  `nextLoanRefId` varchar(45) DEFAULT NULL,
  `loanVersion` enum('V1','V2') NOT NULL DEFAULT 'V2',
  `loanOffsetAmount` decimal(10,2) DEFAULT '0.00',
  `settlementDraft` int DEFAULT NULL,
  `paymentAccountNumber` varchar(25) DEFAULT NULL,
  `interestCollectionRule` varchar(45) DEFAULT NULL,
  `transactionReference` varchar(45) DEFAULT NULL,
  `datebridged` datetime DEFAULT NULL,
  `topupCalculationMethod` varchar(60) DEFAULT NULL,
  `topupRequestedAmount` decimal(10,2) DEFAULT NULL,
  `topupPrincipalBF` decimal(10,2) DEFAULT NULL,
  `topupInterestBF` decimal(10,2) DEFAULT NULL,
  `topupFeesBF` decimal(10,2) DEFAULT NULL,
  `topupComputedPrincipal` decimal(10,2) DEFAULT NULL,
  `isProrateTopupInterest` tinyint DEFAULT '1',
  `topupPenaltiesBF` decimal(10,2) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  UNIQUE KEY `correlationkey_UNIQUE` (`correlationkey`),
  UNIQUE KEY `transactionId_UNIQUE` (`transactionId`),
  UNIQUE KEY `jmsCorrelationId_UNIQUE` (`jmsCorrelationId`),
  KEY `fk_loanapplication_userid_idx` (`userid`),
  KEY `idx_c_loanapplication_refId` (`refId`),
  KEY `idx_loanapplication_approvalStatus` (`approvalstatus`),
  KEY `idx_loanapplication_disbursementStatus` (`disbursementStatus`),
  KEY `idx_loanapplication_disbursementMethod` (`disbursementmethod`),
  KEY `idx_loanapplication_correlationKey` (`correlationkey`),
  KEY `idx_loanapplication_transactionId` (`transactionId`),
  KEY `idx_loanapplication_applicationStatus` (`applicationStatus`),
  KEY `idx_loanapplication_repaymentStatus` (`repaymentStatus`),
  KEY `idx_loanapplication_jmsCorrelationId` (`jmsCorrelationId`),
  KEY `fk_c_loanapplication_originalLoan_idx` (`originalLoanId`),
  KEY `fk_loanapplication_userid` (`userid`),
  KEY `fk_c_loanapplication_originalLoan` (`originalLoanId`),
  KEY `idx_loanapplication_accountno` (`loanaccountno`),
  CONSTRAINT `fk_c_loanapplication_originalLoan` FOREIGN KEY (`originalLoanId`) REFERENCES `c_loanapplication` (`id`),
  CONSTRAINT `fk_loanapplication_userid` FOREIGN KEY (`userid`) REFERENCES `b_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_loanapplication_fees`
--

DROP TABLE IF EXISTS `c_loanapplication_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_loanapplication_fees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `accountNumber` varchar(45) DEFAULT NULL,
  `deferredAccountNumber` varchar(45) DEFAULT NULL,
  `feeType` varchar(45) DEFAULT NULL,
  `feeValue` decimal(13,5) DEFAULT '0.00000',
  `amount` decimal(10,2) DEFAULT NULL,
  `deductionRule` varchar(45) DEFAULT NULL,
  `allocationMethod` varchar(45) DEFAULT NULL,
  `loanId` int DEFAULT NULL,
  `invoiceNo` varchar(45) DEFAULT NULL,
  `invoiceId` varchar(45) DEFAULT NULL,
  `zohoLedgerId` varchar(45) DEFAULT NULL,
  `accountingStatus` varchar(25) DEFAULT 'NOTACCOUNTED',
  `paymentStatus` varchar(25) DEFAULT 'NOTPAID',
  `balance` decimal(10,2) DEFAULT '0.00',
  `quotationId` int DEFAULT NULL,
  `balancebroughtforward` decimal(10,2) DEFAULT '0.00',
  `isSystemFee` tinyint DEFAULT '0',
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_c_loanapplication_fees_loanid_accountno_unique` (`loanId`,`accountNumber`),
  KEY `fk_c_loanapplication_fees_loanid_idx` (`loanId`),
  KEY `fk_c_loanapplication_fees_quotationid_idx` (`quotationId`),
  CONSTRAINT `fk_c_loanapplication_fees_loanid` FOREIGN KEY (`loanId`) REFERENCES `c_loanapplication` (`id`),
  CONSTRAINT `fk_c_loanapplication_fees_quotationid` FOREIGN KEY (`quotationId`) REFERENCES `u_loan_quotation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=436 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_loanpaymentschedule`
--

DROP TABLE IF EXISTS `c_loanpaymentschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_loanpaymentschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `loanid` int NOT NULL,
  `userid` int NOT NULL,
  `amount` double(10,2) NOT NULL,
  `scheduleddate` datetime DEFAULT NULL,
  `expectedcustomerbalance` double(10,2) DEFAULT NULL,
  `actualcustomerbalance` double(10,2) DEFAULT NULL,
  `currentBalance` double(10,2) DEFAULT NULL,
  `cummulativeBalance` double(10,2) DEFAULT '0.00',
  `ispaidontime` tinyint DEFAULT '0',
  `scheduledstatus` varchar(20) NOT NULL DEFAULT 'ACTIVE',
  `paymentstatus` varchar(20) DEFAULT NULL,
  `paymentamount` double(10,2) NOT NULL DEFAULT '0.00',
  `paymentdate` datetime DEFAULT NULL,
  `c_transactionrefid` varchar(45) DEFAULT NULL,
  `reversalreason` varchar(500) DEFAULT NULL,
  `reversedby` varchar(255) DEFAULT NULL,
  `reversaldate` varchar(45) DEFAULT NULL,
  `qtrz_jobrefid` varchar(125) DEFAULT NULL,
  `installmentNo` tinyint DEFAULT NULL,
  `repeatinterval` tinyint DEFAULT '0',
  `applicationFeeBalance` double(10,2) NOT NULL DEFAULT '0.00',
  `interestBalance` double(10,2) NOT NULL DEFAULT '0.00',
  `processingFeeBalance` double(10,2) NOT NULL DEFAULT '0.00',
  `paymentProviderFeeBalance` double(10,2) NOT NULL DEFAULT '0.00',
  `serviceChargeBalance` double(10,2) NOT NULL DEFAULT '0.00',
  `principleBalance` double(10,2) NOT NULL DEFAULT '0.00',
  `penaltiesBalance` double(10,2) NOT NULL DEFAULT '0.00',
  `applicationFees` double(10,2) DEFAULT '0.00',
  `interestAmount` double(10,2) DEFAULT '0.00',
  `processingFees` double(10,2) DEFAULT '0.00',
  `paymentProviderFees` double(10,2) DEFAULT '0.00',
  `serviceCharge` double(10,2) DEFAULT '0.00',
  `principle` double(10,2) DEFAULT '0.00',
  `penalties` double(10,2) DEFAULT '0.00',
  `totalFees` decimal(10,2) DEFAULT '0.00',
  `totalFeesBalance` decimal(10,2) DEFAULT NULL,
  `scheduleType` enum('STANDARD','OPENING_BALANCE') NOT NULL DEFAULT 'STANDARD',
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `idx_paymentsschedule_refid` (`refId`),
  KEY `fk_c_loanpaymentschedule_userid_idx` (`userid`),
  KEY `fk_c_loanpaymentschedule_loanid_idx` (`loanid`),
  KEY `idx_paymentsschedule_transactionrefid` (`c_transactionrefid`),
  KEY `fk_c_loanpaymentschedule_userid` (`userid`),
  KEY `fk_c_loanpaymentschedule_loanid` (`loanid`),
  CONSTRAINT `fk_c_loanpaymentschedule_loanid` FOREIGN KEY (`loanid`) REFERENCES `c_loanapplication` (`id`),
  CONSTRAINT `fk_c_loanpaymentschedule_userid` FOREIGN KEY (`userid`) REFERENCES `b_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=429 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_loanpaymentschedule_fees`
--

DROP TABLE IF EXISTS `c_loanpaymentschedule_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_loanpaymentschedule_fees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `paymentStatus` varchar(25) DEFAULT 'NOTPAID',
  `scheduleId` int DEFAULT NULL,
  `accountNumber` varchar(45) DEFAULT NULL,
  `deferredAccountNumber` varchar(45) DEFAULT NULL,
  `isSystemFee` tinyint DEFAULT '0',
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_c_loanschedule_fees_schedule_idx` (`scheduleId`),
  CONSTRAINT `fk_c_loanschedule_fees_schedule` FOREIGN KEY (`scheduleId`) REFERENCES `c_loanpaymentschedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_loanpaymentschedule_penalty_fees`
--

DROP TABLE IF EXISTS `c_loanpaymentschedule_penalty_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_loanpaymentschedule_penalty_fees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `paymentStatus` varchar(25) DEFAULT 'NOTPAID',
  `scheduleId` int DEFAULT NULL,
  `accountNumber` varchar(45) DEFAULT NULL,
  `deferredAccountNumber` varchar(45) DEFAULT NULL,
  `balancebroughtforward` decimal(10,2) DEFAULT '0.00',
  `isSystemFee` tinyint DEFAULT '0',
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_c_loanschedule_fees_schedule_idx` (`scheduleId`),
  CONSTRAINT `fk_c_loanschedule_fees_schedule0` FOREIGN KEY (`scheduleId`) REFERENCES `c_loanpaymentschedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_loanpenaltycontract`
--

DROP TABLE IF EXISTS `c_loanpenaltycontract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_loanpenaltycontract` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `penaltyType` varchar(45) NOT NULL,
  `penaltyValue` double(10,2) DEFAULT NULL,
  `effectiveDay` int NOT NULL,
  `refreshDate` datetime DEFAULT NULL,
  `effectiveDate` datetime NOT NULL,
  `endDate` datetime DEFAULT NULL,
  `penaltystatus` varchar(45) DEFAULT NULL,
  `qtrz_jobrefid` varchar(45) DEFAULT NULL,
  `penaltyInterval` int DEFAULT '1',
  `loanscheduleid` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `penaltyFeeId` int DEFAULT NULL,
  `totalCharged` decimal(10,2) DEFAULT '0.00',
  `loanid` int DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_c_loanpenaltycontract_scheduleid_idx` (`loanscheduleid`),
  KEY `fk_c_loanpenaltycontract_penaltyfee_idx` (`penaltyFeeId`),
  KEY `fk_c_loanpenaltycontract_loanid` (`loanid`),
  CONSTRAINT `fk_c_loanpenaltycontract_loanid` FOREIGN KEY (`loanid`) REFERENCES `c_loanapplication` (`id`),
  CONSTRAINT `fk_c_loanpenaltycontract_penaltyfee` FOREIGN KEY (`penaltyFeeId`) REFERENCES `u_fee_config` (`id`),
  CONSTRAINT `fk_c_loanpenaltycontract_scheduleid` FOREIGN KEY (`loanscheduleid`) REFERENCES `c_loanpaymentschedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_lockcapital`
--

DROP TABLE IF EXISTS `c_lockcapital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_lockcapital` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refid` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `createdByName` varchar(45) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `dateActivated` datetime DEFAULT NULL,
  `dateDeactivated` datetime DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refid_UNIQUE` (`refid`),
  KEY `idx_c_lockcapital_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_membercontribution`
--

DROP TABLE IF EXISTS `c_membercontribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_membercontribution` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` varchar(45) DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` varchar(45) DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `fullname` varchar(255) NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT '0.00',
  `transactionId` varchar(45) NOT NULL,
  `transactionDate` datetime NOT NULL,
  `userid` int NOT NULL,
  `contributionMode` varchar(45) DEFAULT 'MPESA',
  `accountingStatus` varchar(45) NOT NULL DEFAULT 'NOTACCOUNTED',
  `dateAccounted` datetime DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `channel` varchar(45) DEFAULT NULL,
  `paymentProvider` varchar(100) DEFAULT NULL,
  `transactionReference` varchar(45) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_c_membercontribution_userid_idx` (`userid`),
  KEY `idx_c_membercontribution_refid` (`refId`),
  KEY `idx_c_membercontribution_fullname` (`fullname`),
  KEY `idx_c_membercontribution_trxid` (`transactionId`),
  KEY `fk_c_membercontribution_userid` (`userid`),
  CONSTRAINT `fk_c_membercontribution_userid` FOREIGN KEY (`userid`) REFERENCES `b_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_membercontribution_balances`
--

DROP TABLE IF EXISTS `c_membercontribution_balances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_membercontribution_balances` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` varchar(45) DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` varchar(45) DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `userid` int NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `totalcontribution` double(10,2) NOT NULL,
  `totaladjustment` double(10,2) NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_c_membercontribution_balances_userid_idx` (`userid`),
  KEY `fk_c_membercontribution_balances_userid` (`userid`),
  CONSTRAINT `fk_c_membercontribution_balances_userid` FOREIGN KEY (`userid`) REFERENCES `b_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_memo`
--

DROP TABLE IF EXISTS `c_memo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_memo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `sourceRefId` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `documentDate` datetime DEFAULT NULL,
  `userRefId` varchar(45) DEFAULT NULL,
  `submitterName` varchar(255) DEFAULT NULL,
  `submitterRefId` varchar(45) DEFAULT NULL,
  `amount` double(10,0) DEFAULT NULL,
  `transactionId` varchar(45) DEFAULT NULL,
  `memoType` varchar(45) DEFAULT NULL,
  `documentSubType` varchar(45) DEFAULT NULL,
  `applicationStatus` varchar(45) DEFAULT NULL,
  `approvalStatus` varchar(45) DEFAULT NULL,
  `approvalDate` datetime DEFAULT NULL,
  `accountingStatus` varchar(45) DEFAULT NULL,
  `dateAccounted` datetime DEFAULT NULL,
  `entityName` varchar(255) DEFAULT NULL,
  `paymentMethod` varchar(45) DEFAULT NULL,
  `appraisalRemarks` varchar(100) DEFAULT NULL,
  `appraisalReason` varchar(45) DEFAULT NULL,
  `disbursementStatus` varchar(45) DEFAULT NULL,
  `disbursementDate` datetime DEFAULT NULL,
  `disbursementMethod` varchar(45) DEFAULT NULL,
  `jmsCorrelationId` varchar(45) DEFAULT NULL,
  `correlationKey` varchar(45) DEFAULT NULL,
  `requestedAmount` double(10,2) DEFAULT '0.00',
  `serviceCharge` double(10,2) DEFAULT '0.00',
  `processingFees` double(10,2) DEFAULT '0.00',
  `paymentProviderFees` double(10,2) DEFAULT '0.00',
  `totalAmount` double(10,2) DEFAULT '0.00',
  `errorCode` varchar(45) DEFAULT NULL,
  `errorDescription` varchar(255) DEFAULT NULL,
  `withdrawalMethod` varchar(45) DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `payeePaybill` varchar(10) DEFAULT NULL,
  `payeeAccountNo` varchar(45) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `channel` varchar(45) DEFAULT NULL,
  `paymentProvider` varchar(100) DEFAULT NULL,
  `reverseAllNotWithinPolicy` tinyint DEFAULT '0',
  `reverseAllNotWithinPolicyIncludePaid` tinyint DEFAULT '0',
  `totalPenaltiesNotWithinPolicy` double DEFAULT '0',
  `penaltiesCountNotWithinPolicy` int DEFAULT '0',
  `loansCountNotWithinPolicy` int DEFAULT '0',
  `penaltyPolicyDays` int DEFAULT '0',
  `paymentAccount` varchar(10) DEFAULT NULL,
  `accountNo` varchar(45) DEFAULT NULL,
  `customercategoryid` int DEFAULT NULL,
  `checkoffType` varchar(45) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `idx_c_memo_refId` (`refId`),
  KEY `fk_c_memo_user_categoryid_idx` (`customercategoryid`),
  CONSTRAINT `fk_c_memo_user_categoryid` FOREIGN KEY (`customercategoryid`) REFERENCES `b_user_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_payment`
--

DROP TABLE IF EXISTS `c_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `userid` int DEFAULT NULL,
  `transactionId` varchar(60) NOT NULL,
  `transactionReference` varchar(45) DEFAULT NULL,
  `paymentMethod` varchar(45) DEFAULT NULL,
  `transactionDate` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `accountNo` varchar(45) NOT NULL,
  `channel` varchar(45) NOT NULL,
  `paymentProvider` varchar(45) NOT NULL,
  `purpose` varchar(45) NOT NULL,
  `documentType` varchar(45) DEFAULT NULL,
  `documentRefId` varchar(45) DEFAULT NULL,
  `subDocumentRefId` varchar(45) DEFAULT NULL,
  `documentSubType` varchar(45) DEFAULT NULL,
  `branchRefId` varchar(45) DEFAULT NULL,
  `regionRefId` varchar(45) DEFAULT NULL,
  `salesPersonRefId` varchar(45) DEFAULT NULL,
  `paidInBy` varchar(255) NOT NULL,
  `transactionType` varchar(125) DEFAULT NULL,
  `currency` varchar(5) DEFAULT NULL,
  `groupRefId` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_c_payment_userid_idx` (`userid`),
  KEY `idx_c_payment_transactionId_idx` (`transactionId`),
  KEY `idx_c_payment_docrefid` (`documentRefId`),
  KEY `idx_c_payment_refId` (`refId`),
  KEY `idx_c_payment_branchref` (`branchRefId`),
  KEY `idx_c_payment_regionref` (`regionRefId`),
  KEY `idx_c_payment_transactiondate` (`transactionDate`),
  KEY `idx_c_payment_transactionref` (`transactionReference`),
  KEY `idx_c_payment_method` (`paymentMethod`),
  CONSTRAINT `fk_c_payment_userid` FOREIGN KEY (`userid`) REFERENCES `b_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_penaltycontract_fees`
--

DROP TABLE IF EXISTS `c_penaltycontract_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_penaltycontract_fees` (
  `penaltyid` int NOT NULL,
  `feeid` int NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `refid` varchar(45) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isactive` tinyint NOT NULL DEFAULT '1',
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`penaltyid`,`feeid`),
  KEY `fk_c_penaltycontract_fees_feeid_idx` (`feeid`),
  CONSTRAINT `fk_c_penaltycontract_fees_feeid` FOREIGN KEY (`feeid`) REFERENCES `u_fee_config` (`id`),
  CONSTRAINT `fk_c_penaltycontract_fees_penaltyid` FOREIGN KEY (`penaltyid`) REFERENCES `c_loanpenaltycontract` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_penaltyexecution`
--

DROP TABLE IF EXISTS `c_penaltyexecution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_penaltyexecution` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint DEFAULT NULL,
  `penaltytype` varchar(45) DEFAULT NULL,
  `scheduledDate` datetime DEFAULT NULL,
  `dateexecuted` datetime DEFAULT NULL,
  `dateaccounted` datetime DEFAULT NULL,
  `accountingstatus` varchar(45) DEFAULT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `loanpenaltyid` int DEFAULT NULL,
  `penaltyStatus` varchar(45) DEFAULT NULL,
  `transactionId` varchar(45) DEFAULT NULL,
  `reversalTransactionId` varchar(45) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT '0.00',
  `feeId` int DEFAULT NULL,
  `transactionReference` varchar(45) DEFAULT NULL,
  `comment` longtext,
  `loanid` int DEFAULT NULL,
  `loanscheduleId` int DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_c_penaltyexecution_contractid_idx` (`loanpenaltyid`),
  KEY `fk_c_penaltyexecution_contractid` (`loanpenaltyid`),
  KEY `fk_c_penaltyexecution_feeid_idx` (`feeId`),
  KEY `fk_c_penaltyexecution_loanid` (`loanid`),
  KEY `idx_penaltyexecution_refid` (`refId`),
  CONSTRAINT `fk_c_penaltyexecution_contractid` FOREIGN KEY (`loanpenaltyid`) REFERENCES `c_loanpenaltycontract` (`id`),
  CONSTRAINT `fk_c_penaltyexecution_feeid` FOREIGN KEY (`feeId`) REFERENCES `c_loanpaymentschedule_penalty_fees` (`id`),
  CONSTRAINT `fk_c_penaltyexecution_loanid` FOREIGN KEY (`loanid`) REFERENCES `c_loanapplication` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2483 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_reinvestmentrequest`
--

DROP TABLE IF EXISTS `c_reinvestmentrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_reinvestmentrequest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `accountingStatus` varchar(45) DEFAULT NULL,
  `reinvestmentStatus` varchar(45) DEFAULT NULL,
  `reinvestedBy` varchar(255) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `channel` varchar(45) DEFAULT NULL,
  `paymentProvider` varchar(100) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_reinvestment_refid` (`refId`),
  KEY `idx_reinvestment_accountingstatus` (`accountingStatus`),
  KEY `idx_reinvestment_reinvestmentStatus` (`reinvestmentStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_settlement_draft`
--

DROP TABLE IF EXISTS `c_settlement_draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_settlement_draft` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `refId` varchar(255) DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `interestCharge` decimal(10,2) DEFAULT NULL,
  `totalAmount` decimal(10,2) DEFAULT NULL,
  `loanApplication` bigint DEFAULT NULL,
  `principal` decimal(10,2) DEFAULT NULL,
  `loanTerm` double DEFAULT NULL,
  `interestRate` double DEFAULT NULL,
  `termServiced` bigint DEFAULT NULL,
  `accruedPrincipal` double DEFAULT NULL,
  `accruedInterest` double DEFAULT NULL,
  `accruedFees` double DEFAULT NULL,
  `accruedPenalties` double DEFAULT NULL,
  `loanBalance` double DEFAULT NULL,
  `totalAccrued` double DEFAULT NULL,
  `paidAmount` double DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_subscription_payment`
--

DROP TABLE IF EXISTS `c_subscription_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_subscription_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `companyName` varchar(255) DEFAULT NULL,
  `accountCode` varchar(45) DEFAULT NULL,
  `contactName` varchar(100) DEFAULT NULL,
  `contactEmail` varchar(45) DEFAULT NULL,
  `approvalstatus` varchar(45) DEFAULT NULL,
  `approvalDate` datetime DEFAULT NULL,
  `appraisalRemarks` varchar(100) DEFAULT NULL,
  `appraisalReason` varchar(45) DEFAULT NULL,
  `disbursementStatus` varchar(45) DEFAULT NULL,
  `disbursementdate` datetime DEFAULT NULL,
  `disbursementmethod` varchar(45) NOT NULL DEFAULT 'MPESA',
  `jmsCorrelationId` varchar(45) DEFAULT NULL,
  `correlationKey` varchar(45) DEFAULT NULL,
  `transactionId` varchar(45) DEFAULT NULL,
  `requestedAmount` double NOT NULL DEFAULT '0',
  `processingfees` double(10,2) DEFAULT '0.00',
  `serviceCharge` double DEFAULT '0',
  `paymentProviderFees` double DEFAULT '0',
  `totalAmount` double DEFAULT '0',
  `errorCode` varchar(45) DEFAULT NULL,
  `errorDescription` varchar(255) DEFAULT NULL,
  `applicationStatus` varchar(45) DEFAULT NULL,
  `accountingStatus` varchar(45) DEFAULT NULL,
  `dateAccounted` datetime DEFAULT NULL,
  `payeePaybill` varchar(45) DEFAULT NULL,
  `payeeAccountNo` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `initiatorid` int DEFAULT NULL,
  `invoiceNo` varchar(45) DEFAULT NULL,
  `ZohoinvoiceId` varchar(50) DEFAULT NULL,
  `invoiceRefId` varchar(45) DEFAULT NULL,
  `contactPhoneNumber` varchar(45) DEFAULT NULL,
  `tenantId` varchar(45) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `channel` varchar(45) DEFAULT NULL,
  `paymentProvider` varchar(100) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  UNIQUE KEY `correlationKey_UNIQUE` (`correlationKey`),
  UNIQUE KEY `transactionId_UNIQUE` (`transactionId`),
  UNIQUE KEY `jmsCorrelationId_UNIQUE` (`jmsCorrelationId`),
  KEY `fk_c_interacc_transfer_initiatorid_idx` (`initiatorid`),
  KEY `fk_c_interacc_transfer_correlationkey` (`correlationKey`),
  KEY `fk_c_interacc_transfer_jmcorrelationkey` (`jmsCorrelationId`),
  KEY `fk_c_interacc_transfer_transactionid` (`transactionId`),
  KEY `fk_c_interacc_transfer_initiatorid0` (`initiatorid`),
  CONSTRAINT `fk_c_interacc_transfer_initiatorid0` FOREIGN KEY (`initiatorid`) REFERENCES `b_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_suspenseacc_memo`
--

DROP TABLE IF EXISTS `c_suspenseacc_memo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_suspenseacc_memo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) DEFAULT NULL,
  `created` varchar(45) DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` varchar(45) DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint DEFAULT '1',
  `transactionId` varchar(45) NOT NULL,
  `c2bid` int DEFAULT NULL,
  `depositId` int DEFAULT NULL,
  `status` enum('ALLOCATED','UNALLOCATED') NOT NULL DEFAULT 'UNALLOCATED',
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transactionId_UNIQUE` (`transactionId`),
  KEY `idx_suspense_refId` (`refId`),
  KEY `idx_suspense_transactionId` (`transactionId`),
  KEY `fk_c_suspenseacc_c2bid_idx` (`c2bid`),
  KEY `fk_c_suspenseacc_depositid_idx` (`depositId`),
  CONSTRAINT `fk_c_suspenseacc_c2bid` FOREIGN KEY (`c2bid`) REFERENCES `c_c2b_transaction` (`id`),
  CONSTRAINT `fk_c_suspenseacc_depositid` FOREIGN KEY (`depositId`) REFERENCES `c_b2c_transaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_suspensetransaction`
--

DROP TABLE IF EXISTS `c_suspensetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_suspensetransaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refid` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isactive` tinyint NOT NULL DEFAULT '1',
  `transactionId` varchar(45) NOT NULL,
  `transactionReference` varchar(45) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `documentType` varchar(45) NOT NULL DEFAULT '0.0',
  `documentRefId` varchar(45) NOT NULL,
  `transactionDate` datetime NOT NULL,
  `paymentDrAccount` varchar(45) NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refid_UNIQUE` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_transaction_reversal`
--

DROP TABLE IF EXISTS `c_transaction_reversal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_transaction_reversal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `phonenumber` varchar(45) DEFAULT NULL,
  `approvalStatus` varchar(45) DEFAULT NULL,
  `approvalDate` datetime DEFAULT NULL,
  `disbursementStatus` varchar(45) DEFAULT NULL,
  `disbursementDate` datetime DEFAULT NULL,
  `disbursementMethod` varchar(45) DEFAULT NULL,
  `jmsCorrelationId` varchar(45) NOT NULL,
  `correlationKey` varchar(45) DEFAULT NULL,
  `transactionId` varchar(45) DEFAULT NULL,
  `applicationStatus` varchar(45) DEFAULT NULL,
  `accountingStatus` varchar(45) DEFAULT NULL,
  `dateAccounted` datetime DEFAULT NULL,
  `fullname` varchar(45) DEFAULT NULL,
  `initiatorName` varchar(45) DEFAULT NULL,
  `requestedAmount` double(10,2) DEFAULT NULL,
  `processingfees` double(10,2) DEFAULT '0.00',
  `serviceCharge` double(10,2) DEFAULT NULL,
  `paymentProviderFees` double(10,2) DEFAULT NULL,
  `totalAmount` double(10,2) DEFAULT NULL,
  `errorCode` varchar(45) DEFAULT NULL,
  `errorDescription` varchar(45) DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `appraisalRemarks` varchar(100) DEFAULT NULL,
  `appraisalReason` varchar(45) DEFAULT NULL,
  `initiatorid` int DEFAULT NULL,
  `originalTransactionId` varchar(45) DEFAULT NULL,
  `paymentProvider` varchar(100) DEFAULT NULL,
  `channel` varchar(45) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  UNIQUE KEY `jmsCorrelationId_UNIQUE` (`jmsCorrelationId`),
  UNIQUE KEY `correlationKey_UNIQUE` (`correlationKey`),
  UNIQUE KEY `transactionId_UNIQUE` (`transactionId`),
  KEY `idx_transaction_reversal_refId` (`refId`),
  KEY `idx_transaction_reversal_phonenumber` (`phonenumber`),
  KEY `idx_transaction_reversal_jmsCorrelationId` (`jmsCorrelationId`),
  KEY `idx_transaction_reversal_correlationKey` (`correlationKey`),
  KEY `idx_transaction_reversal_transactionid` (`transactionId`),
  KEY `idx_transaction_reversal_fullName` (`fullname`),
  KEY `idx_transaction_reversal_initiatorName` (`initiatorName`),
  KEY `fk_c_transaction_reversal_userid_idx` (`userid`),
  KEY `idx_transaction_reversal_originaltransactionid` (`originalTransactionId`),
  KEY `fk_c_transaction_reversal_userid` (`userid`),
  CONSTRAINT `fk_c_transaction_reversal_userid` FOREIGN KEY (`userid`) REFERENCES `b_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_usererror`
--

DROP TABLE IF EXISTS `c_usererror`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_usererror` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` varchar(45) DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` varchar(45) DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `usererror` text,
  `fileName` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(45) DEFAULT NULL,
  `idnumber` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `c_withdrawalrequest`
--

DROP TABLE IF EXISTS `c_withdrawalrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_withdrawalrequest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint DEFAULT '1',
  `phonenumber` varchar(45) DEFAULT NULL,
  `withdrawalType` varchar(45) DEFAULT NULL,
  `approvalStatus` varchar(45) DEFAULT NULL,
  `approvalDate` datetime DEFAULT NULL,
  `disbursementStatus` varchar(45) DEFAULT NULL,
  `disbursementDate` datetime DEFAULT NULL,
  `disbursementMethod` varchar(45) DEFAULT NULL,
  `jmsCorrelationId` varchar(45) DEFAULT NULL,
  `correlationKey` varchar(45) DEFAULT NULL,
  `transactionId` varchar(45) DEFAULT NULL,
  `applicationStatus` varchar(45) DEFAULT NULL,
  `accountingStatus` varchar(45) DEFAULT NULL,
  `dateAccounted` datetime DEFAULT NULL,
  `firstname` varchar(125) DEFAULT NULL,
  `lastname` varchar(125) DEFAULT NULL,
  `fullname` varchar(125) DEFAULT NULL,
  `requestedAmount` double DEFAULT NULL,
  `processingfees` double(10,2) DEFAULT '0.00',
  `servicecharge` double DEFAULT NULL,
  `paymentproviderfees` double DEFAULT NULL,
  `totalamount` double DEFAULT NULL,
  `errorCode` varchar(45) DEFAULT NULL,
  `errorDescription` varchar(255) DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `appraisalRemarks` varchar(100) DEFAULT NULL,
  `appraisalReason` varchar(45) DEFAULT NULL,
  `payeePaybill` varchar(45) DEFAULT NULL,
  `payeeAccountNo` varchar(100) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `withdrawalMethod` varchar(45) NOT NULL DEFAULT 'MPESA',
  `currency` varchar(45) DEFAULT NULL,
  `channel` varchar(45) DEFAULT NULL,
  `paymentProvider` varchar(100) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  UNIQUE KEY `transactionId_UNIQUE` (`transactionId`),
  UNIQUE KEY `jmsCorrelationId_UNIQUE` (`jmsCorrelationId`),
  UNIQUE KEY `correlationKey_UNIQUE` (`correlationKey`),
  KEY `idx_withdrawal_transactionId` (`transactionId`),
  KEY `idx_withdrawal_correlationkey` (`correlationKey`),
  KEY `idx_withdrawal_phonenumber` (`phonenumber`),
  KEY `idx_withdrawal_fullname` (`fullname`),
  KEY `idx_withdrawal_disbursementmethod` (`disbursementMethod`),
  KEY `idx_withdrawal_approvalStatus` (`approvalStatus`),
  KEY `fk_c_withdrawalrequest_userid_idx` (`userid`),
  KEY `fk_c_withdrawalrequest_userid` (`userid`),
  CONSTRAINT `fk_c_withdrawalrequest_userid` FOREIGN KEY (`userid`) REFERENCES `b_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_sent`
--

DROP TABLE IF EXISTS `email_sent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_sent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `message` text,
  `status` int DEFAULT NULL,
  `failureReason` text,
  `isActive` tinyint DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_refid_unique` (`refId`)
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gl_account`
--

DROP TABLE IF EXISTS `gl_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gl_account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `accountno` varchar(45) DEFAULT NULL,
  `accountname` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `accounttype` varchar(45) DEFAULT NULL,
  `accountclass` varchar(45) DEFAULT NULL,
  `tenantid` varchar(45) DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `parentAccountId` int DEFAULT NULL,
  `isprimary` tinyint NOT NULL DEFAULT '0',
  `naturalPosting` enum('CR','DR') DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  UNIQUE KEY `accountno_UNIQUE` (`accountno`),
  KEY `gl_account_accountno` (`accountno`),
  KEY `gl_account_accountname` (`accountname`),
  KEY `gl_account_accounttype` (`accounttype`),
  KEY `gl_account_accountclass` (`accountclass`),
  KEY `gl_account_refId` (`refId`),
  KEY `fk_gl_account_userid` (`userid`),
  KEY `fk_gl_account_parentid_idx` (`parentAccountId`),
  CONSTRAINT `fk_gl_account_parentid` FOREIGN KEY (`parentAccountId`) REFERENCES `gl_account` (`id`),
  CONSTRAINT `fk_gl_account_userid` FOREIGN KEY (`userid`) REFERENCES `b_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gl_account_category_map`
--

DROP TABLE IF EXISTS `gl_account_category_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gl_account_category_map` (
  `gl_account_id` int NOT NULL,
  `categoryid` int NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`gl_account_id`,`categoryid`),
  KEY `fk_gl_account_category_map_category_idx` (`categoryid`),
  CONSTRAINT `fk_gl_account_category_map_category` FOREIGN KEY (`categoryid`) REFERENCES `gl_category` (`id`),
  CONSTRAINT `fk_gl_account_category_map_gl` FOREIGN KEY (`gl_account_id`) REFERENCES `gl_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gl_category`
--

DROP TABLE IF EXISTS `gl_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gl_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refid` varchar(45) DEFAULT NULL,
  `created` varchar(45) DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` varchar(45) DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` varchar(45) DEFAULT NULL,
  `name` varchar(40) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gl_factacc`
--

DROP TABLE IF EXISTS `gl_factacc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gl_factacc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedby` varchar(45) DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `tenantid` varchar(45) NOT NULL,
  `accountNo` varchar(45) NOT NULL,
  `accountName` varchar(100) DEFAULT NULL,
  `accounttype` varchar(45) DEFAULT NULL,
  `accountclass` varchar(45) DEFAULT NULL,
  `postingdate` datetime NOT NULL,
  `description` varchar(125) NOT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `postingtype` varchar(45) NOT NULL,
  `event` varchar(45) DEFAULT 'ACCPOST',
  `referenced_factacc_id` varchar(45) NOT NULL,
  `transactionreferencecode` varchar(45) NOT NULL,
  `transactionId` varchar(45) NOT NULL,
  `channel` varchar(45) DEFAULT NULL,
  `paymentProvider` varchar(100) DEFAULT NULL,
  `documentType` varchar(45) NOT NULL DEFAULT 'LOAN',
  `documentSubType` varchar(45) DEFAULT NULL,
  `documentRefId` varchar(45) DEFAULT NULL,
  `userRefId` varchar(45) DEFAULT NULL,
  `branchRefId` varchar(45) DEFAULT NULL,
  `regionRefId` varchar(45) DEFAULT NULL,
  `salesPersonRefId` varchar(45) DEFAULT NULL,
  `subDocumentRefId` varchar(45) DEFAULT NULL,
  `totalRepayableAmountBalance` decimal(10,2) DEFAULT '0.00',
  `userid` int DEFAULT NULL,
  `loanid` int DEFAULT NULL,
  `branchid` int DEFAULT NULL,
  `regionid` int DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `gl_factacc_accountno` (`accountNo`),
  KEY `gl_factacc_postingdate` (`postingdate`),
  KEY `gl_factacc_userRefId` (`userRefId`),
  KEY `gl_factacc_docRefId` (`documentRefId`),
  KEY `gl_factacc_branchRefId` (`branchRefId`),
  KEY `gl_factacc_regionRefId` (`regionRefId`),
  KEY `gl_factacc_salesPersonRefId` (`salesPersonRefId`),
  KEY `gl_factacc_channel` (`channel`),
  KEY `gl_factacc_provider` (`paymentProvider`),
  KEY `idx_gl_factacc_transactionid_sys` (`transactionId`),
  KEY `idx_gl_factacc_transactionid` (`transactionreferencecode`),
  FULLTEXT KEY `gl_factacc_description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=2386 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `gl_types`
--

DROP TABLE IF EXISTS `gl_types`;
/*!50001 DROP VIEW IF EXISTS `gl_types`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `gl_types` AS SELECT 
 1 AS `loanId`,
 1 AS `postingdate`,
 1 AS `accountNo`,
 1 AS `accountName`,
 1 AS `description`,
 1 AS `type`,
 1 AS `drAmount`,
 1 AS `crAmount`,
 1 AS `documentType`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `r_account_balance`
--

DROP TABLE IF EXISTS `r_account_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_account_balance` (
  `month` int NOT NULL,
  `year` int NOT NULL,
  `accountNo` varchar(45) NOT NULL,
  `accountName` varchar(255) DEFAULT NULL,
  `openingBalance` decimal(10,2) DEFAULT '0.00',
  `closingBalance` decimal(10,2) DEFAULT '0.00',
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`month`,`year`,`accountNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `r_accounts`
--

DROP TABLE IF EXISTS `r_accounts`;
/*!50001 DROP VIEW IF EXISTS `r_accounts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `r_accounts` AS SELECT 
 1 AS `accountNumber`,
 1 AS `accountName`,
 1 AS `accountType`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `r_factacc_summary`
--

DROP TABLE IF EXISTS `r_factacc_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_factacc_summary` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updatedby` varchar(45) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `tenantid` varchar(6) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `transactionId` varchar(36) NOT NULL,
  `transactionreference` varchar(45) DEFAULT NULL,
  `accountNo` varchar(45) NOT NULL,
  `accountName` varchar(125) NOT NULL,
  `postingDate` date NOT NULL,
  `transactionCreatedDate` date NOT NULL,
  `totalDR` decimal(10,2) NOT NULL,
  `totalCR` decimal(10,2) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `postingType` char(2) NOT NULL,
  `zohoPostingStatus` varchar(20) NOT NULL DEFAULT 'AWAITING',
  `referencedFactRefId` varchar(45) NOT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `description` varchar(120) DEFAULT NULL,
  `zohoId` varchar(45) DEFAULT NULL,
  `zohoRecordType` varchar(45) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=541 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `r_synced_zoho_records`
--

DROP TABLE IF EXISTS `r_synced_zoho_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_synced_zoho_records` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updatedby` varchar(45) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `tenantid` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `factRefId` varchar(45) NOT NULL,
  `accountNo` varchar(45) NOT NULL,
  `accountName` varchar(70) NOT NULL,
  `journalDate` date DEFAULT NULL,
  `transactionDate` date DEFAULT NULL,
  `totalCR` decimal(8,2) DEFAULT NULL,
  `totalDR` decimal(8,2) DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL,
  `postingType` varchar(255) NOT NULL,
  `zohoPostingStatus` varchar(50) NOT NULL DEFAULT 'AWAITING',
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_sms`
--

DROP TABLE IF EXISTS `t_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `tstamp` datetime DEFAULT NULL,
  `smsId` varchar(45) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `smsFrom` varchar(45) DEFAULT NULL,
  `smsTo` varchar(45) DEFAULT NULL,
  `cost` double DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `failureReason` varchar(255) DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `correlationId` varchar(45) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `idx_sms_refId` (`refId`),
  KEY `idx_sms_smsFrom` (`smsFrom`),
  KEY `idx_sms_correlationId` (`correlationId`)
) ENGINE=InnoDB AUTO_INCREMENT=975 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `types`
--

DROP TABLE IF EXISTS `types`;
/*!50001 DROP VIEW IF EXISTS `types`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `types` AS SELECT 
 1 AS `loanId`,
 1 AS `disbursementDate`,
 1 AS `dueDate`,
 1 AS `refId`,
 1 AS `totalBalance`,
 1 AS `fullName`,
 1 AS `phoneNumber`,
 1 AS `postingdate`,
 1 AS `accountNo`,
 1 AS `accountName`,
 1 AS `description`,
 1 AS `type`,
 1 AS `drAmount`,
 1 AS `crAmount`,
 1 AS `principalPaid`,
 1 AS `interestPaid`,
 1 AS `feesPaid`,
 1 AS `penaltiesPaid`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `u_allocation`
--

DROP TABLE IF EXISTS `u_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_allocation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `allocationFeeType` enum('APPLICATION_FEES','PROCESSING_FEES','PRESTA_SERVICE_CHARGE','PAYMENT_PROVIDER_FEES','INTEREST_CHARGE','PRINCIPLE','PENALTIES') DEFAULT NULL,
  `allocationType` enum('SPREAD','CLEAR') DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `loanProductId` int DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_allocation_loan_product_idx` (`loanProductId`),
  CONSTRAINT `fk_allocation_loan_product` FOREIGN KEY (`loanProductId`) REFERENCES `u_loan_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_b2b_account`
--

DROP TABLE IF EXISTS `u_b2b_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_b2b_account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdby` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `paybillid` int DEFAULT NULL,
  `accountname` varchar(255) DEFAULT NULL,
  `accountnumber` varchar(255) DEFAULT NULL,
  `contactemail` varchar(255) DEFAULT NULL,
  `contactphonenumber` varchar(255) DEFAULT NULL,
  `contactname` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `idx_account_refId` (`refId`),
  KEY `idx_account_accountname` (`contactname`),
  KEY `idx_account_accountnumber` (`accountnumber`),
  KEY `idx_account_email` (`contactemail`),
  KEY `idx_account_phonenumber` (`contactphonenumber`),
  KEY `idx_account_contactname` (`contactname`),
  KEY `fk_u_b2b_account_paybillid_idx` (`paybillid`),
  KEY `fk_u_b2b_account_paybillid` (`paybillid`),
  CONSTRAINT `fk_u_b2b_account_paybillid` FOREIGN KEY (`paybillid`) REFERENCES `u_b2b_paybill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_b2b_account_category`
--

DROP TABLE IF EXISTS `u_b2b_account_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_b2b_account_category` (
  `categoryid` int NOT NULL,
  `accountid` int NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`categoryid`,`accountid`),
  KEY `fk_u_b2b_account_category_accountid_idx` (`accountid`),
  CONSTRAINT `fk_u_b2b_account_category_accountid` FOREIGN KEY (`accountid`) REFERENCES `u_b2b_account` (`id`),
  CONSTRAINT `fk_u_b2b_account_category_categoryid` FOREIGN KEY (`categoryid`) REFERENCES `u_b2baccount_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_b2b_paybill`
--

DROP TABLE IF EXISTS `u_b2b_paybill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_b2b_paybill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `paybillName` varchar(255) DEFAULT NULL,
  `paybillNumber` varchar(6) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `idx_b2b_paybill_refid` (`refId`),
  KEY `idx_b2b_paybillname` (`paybillName`),
  KEY `idx_b2b_paybillnumber` (`paybillNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_b2baccount_category`
--

DROP TABLE IF EXISTS `u_b2baccount_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_b2baccount_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint DEFAULT '1',
  `name` varchar(45) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_fee_config`
--

DROP TABLE IF EXISTS `u_fee_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_fee_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isactive` tinyint DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `deferredAccountNumber` varchar(45) DEFAULT NULL,
  `accountNumber` varchar(45) NOT NULL,
  `feeType` varchar(45) DEFAULT NULL,
  `feeValue` decimal(13,5) DEFAULT '0.00000',
  `deductionRule` varchar(45) DEFAULT NULL,
  `active` varchar(45) DEFAULT NULL,
  `allocationMethod` varchar(45) NOT NULL DEFAULT 'CLEAR',
  `zohoId` varchar(45) DEFAULT NULL,
  `feeclass` varchar(45) DEFAULT 'LOAN_FEE',
  `controlAccDR` varchar(45) DEFAULT NULL,
  `controlAccCR` varchar(45) DEFAULT NULL,
  `chargesTo` varchar(45) DEFAULT NULL,
  `isSystemFee` int DEFAULT NULL,
  `isGraduated` tinyint NOT NULL DEFAULT '0',
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_u_fee_config_refId_UNIQUE` (`refId`),
  UNIQUE KEY `idx_u_fee_config_accountNumber_UNIQUE` (`accountNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_file`
--

DROP TABLE IF EXISTS `u_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) DEFAULT NULL,
  `contentType` varchar(45) DEFAULT NULL,
  `creatorFullName` varchar(255) DEFAULT NULL,
  `path` varchar(300) DEFAULT NULL,
  `url` varchar(300) DEFAULT NULL,
  `thumbnail` varchar(300) DEFAULT NULL,
  `fileAbstract` varchar(500) DEFAULT NULL,
  `module` varchar(45) DEFAULT NULL,
  `formField` varchar(45) DEFAULT NULL,
  `fileDate` datetime DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `size` int DEFAULT NULL,
  `userRefId` varchar(45) DEFAULT NULL,
  `thumbnailPath` varchar(300) DEFAULT NULL,
  `thumbnailsize` int DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `idx_file_name` (`name`),
  KEY `idx_file_userRefId` (`userRefId`),
  KEY `idx_file_refId` (`refId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_gl_account_id`
--

DROP TABLE IF EXISTS `u_gl_account_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_gl_account_id` (
  `accountType` varchar(20) NOT NULL,
  `currentid` int NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`accountType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_gl_summary`
--

DROP TABLE IF EXISTS `u_gl_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_gl_summary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `transactionId` varchar(45) DEFAULT NULL,
  `glPostingDate` datetime DEFAULT NULL,
  `glPostingType` varchar(45) DEFAULT NULL,
  `glamount` double(10,2) DEFAULT NULL,
  `trxamount` double(10,2) DEFAULT NULL,
  `trxtype` varchar(45) DEFAULT NULL,
  `tenantId` varchar(45) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `idx_u_gl_summary_refId` (`refId`),
  KEY `idx_u_gl_summary_transactionid` (`transactionId`),
  KEY `idx_u_gl_summary_trxtype` (`trxtype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_graduated_interest`
--

DROP TABLE IF EXISTS `u_graduated_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_graduated_interest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint DEFAULT NULL,
  `min` int NOT NULL DEFAULT '0',
  `max` int NOT NULL DEFAULT '0',
  `rate` decimal(6,2) NOT NULL DEFAULT '0.00',
  `loan_product_id` int NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_u_graduated_interest_loanproduct_idx` (`loan_product_id`),
  CONSTRAINT `fk_u_graduated_interest_loanproduct` FOREIGN KEY (`loan_product_id`) REFERENCES `u_loan_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_invoice_sequence`
--

DROP TABLE IF EXISTS `u_invoice_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_invoice_sequence` (
  `id` int NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_journaltransaction_seq`
--

DROP TABLE IF EXISTS `u_journaltransaction_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_journaltransaction_seq` (
  `id` int NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_ledgertransaction_template`
--

DROP TABLE IF EXISTS `u_ledgertransaction_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_ledgertransaction_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime NOT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `name` varchar(60) NOT NULL,
  `categories` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_ledgertransaction_template_details`
--

DROP TABLE IF EXISTS `u_ledgertransaction_template_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_ledgertransaction_template_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isactive` tinyint NOT NULL DEFAULT '1',
  `accountno` varchar(45) NOT NULL,
  `accountname` varchar(100) NOT NULL,
  `postingType` enum('DR','CR') NOT NULL,
  `ledgertransactiontemplateid` int DEFAULT NULL,
  `referencedDetailRefId` varchar(45) NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_u_ledgertransaction_template_details_ledgertrxid_idx` (`ledgertransactiontemplateid`),
  CONSTRAINT `fk_c_ledgertransaction_details_ledgertrxid` FOREIGN KEY (`ledgertransactiontemplateid`) REFERENCES `u_ledgertransaction_template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_ledgertransactiontemplate_categories`
--

DROP TABLE IF EXISTS `u_ledgertransactiontemplate_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_ledgertransactiontemplate_categories` (
  `category` varchar(60) NOT NULL,
  `templateId` int NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`category`,`templateId`),
  KEY `fk_ledgertransactiontemplate_categories_templateid_idx` (`templateId`),
  CONSTRAINT `fk_ledgertransactiontemplate_categories_templateid` FOREIGN KEY (`templateId`) REFERENCES `u_ledgertransaction_template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_loan_allocation`
--

DROP TABLE IF EXISTS `u_loan_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_loan_allocation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint(1) unsigned zerofill DEFAULT NULL,
  `allocationFeeType` enum('APPLICATION_FEES','PROCESSING_FEES','PRESTA_SERVICE_CHARGE','PAYMENT_PROVIDER_FEES','INTEREST_CHARGE','PRINCIPLE','PENALTIES') DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `loanApplicationId` int DEFAULT NULL,
  `allocationType` enum('SPREAD','CLEAR') DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_alloc_loan_application_idx` (`loanApplicationId`),
  CONSTRAINT `fk_alloc_loan_application` FOREIGN KEY (`loanApplicationId`) REFERENCES `c_loanapplication` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_loan_fee_accounts_seq`
--

DROP TABLE IF EXISTS `u_loan_fee_accounts_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_loan_fee_accounts_seq` (
  `id` int NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_loan_product`
--

DROP TABLE IF EXISTS `u_loan_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_loan_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `interestRate` decimal(10,2) DEFAULT NULL,
  `interestPeriod` enum('DAILY','WEEKLY','MONTHLY','FIXED','YEARLY') DEFAULT NULL,
  `interestRule` enum('DEDUCT_FROM_DISBURSEMENT','DO_NOT_DEDUCT') DEFAULT NULL,
  `processingFeeValue` decimal(10,2) DEFAULT NULL,
  `processingFeeRule` enum('DEDUCT_FROM_DISBURSEMENT','DO_NOT_DEDUCT') DEFAULT NULL,
  `processingFeeType` enum('RATE','FIXED_AMOUNT') DEFAULT NULL,
  `transactionalFeeRule` enum('DEDUCT_FROM_DISBURSEMENT','DO_NOT_DEDUCT') DEFAULT NULL,
  `paymentProviderFeesRule` enum('DEDUCT_FROM_DISBURSEMENT','DO_NOT_DEDUCT') DEFAULT NULL,
  `minTerm` int DEFAULT NULL,
  `termPeriod` enum('DAYS','WEEKS','MONTHS','YEARS') DEFAULT NULL,
  `maxTerm` int DEFAULT NULL,
  `minAmount` double(10,2) DEFAULT NULL,
  `maxAmount` double(10,2) DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') DEFAULT NULL,
  `dateActivated` datetime DEFAULT NULL,
  `depositType` enum('RATE','FIXED_AMOUNT') DEFAULT NULL,
  `financingMethod` enum('CASH','HIRE_PURCHASE','LIPALATER') DEFAULT NULL,
  `depositValue` double(10,2) DEFAULT NULL,
  `interestCalcMethod` enum('FLAT_RATE','REDUCING_BALANCE','COMPOUNDED') DEFAULT NULL,
  `paymentCycle` enum('DAILY','WEEKLY','MONTHLY','WHEN_DUE','MONTHLY_MATCH_DAY','MONTHLY_ON_SPECIFIC_DAY') DEFAULT NULL,
  `applicationFeeValue` double(10,2) DEFAULT NULL,
  `applicationFeeType` enum('RATE','FIXED_AMOUNT') DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `providerFeesTarrif` enum('LENDER','CUSTOMER') DEFAULT NULL,
  `providerFeesRule` enum('DEDUCT_FROM_DISBURSEMENT','DO_NOT_DEDUCT') DEFAULT NULL,
  `serviceChargeTarrif` enum('LENDER','CUSTOMER') DEFAULT NULL,
  `serviceChargeRule` enum('DEDUCT_FROM_DISBURSEMENT','DO_NOT_DEDUCT') DEFAULT NULL,
  `isUseAdvancedAllocations` tinyint DEFAULT '1',
  `dayOfMonth` int DEFAULT NULL,
  `loanProductType` varchar(45) NOT NULL DEFAULT 'USER_DEFINED',
  `minDays` int NOT NULL DEFAULT '5',
  `gracePeriod` int DEFAULT NULL,
  `gracePeriodUnit` enum('DAYS','WEEKS','MONTHS','YEARS') DEFAULT NULL,
  `availability` varchar(45) DEFAULT NULL,
  `interestRecognitionMethod` varchar(45) DEFAULT 'NON_ACCRUAL',
  `useGraduatedInterest` tinyint DEFAULT '0',
  `disbursementAccount` varchar(45) DEFAULT NULL,
  `upfrontInstallments` int DEFAULT '0',
  `upfrontInstallmentsActive` int DEFAULT '0',
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_loan_product_fee`
--

DROP TABLE IF EXISTS `u_loan_product_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_loan_product_fee` (
  `productId` int NOT NULL,
  `feeId` int NOT NULL,
  `metadata_id` int NOT NULL,
  `refId` varchar(45) NOT NULL,
  `feeValue` decimal(13,5) DEFAULT '0.00000',
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `deductionRule` varchar(45) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`productId`,`feeId`,`metadata_id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_u_loan_product_fee_config_idx` (`feeId`),
  KEY `fk_u_loan_product_fee_metaid_idx` (`metadata_id`),
  CONSTRAINT `fk_u_loan_product_fee_feeId` FOREIGN KEY (`feeId`) REFERENCES `u_fee_config` (`id`),
  CONSTRAINT `fk_u_loan_product_fee_metaid` FOREIGN KEY (`metadata_id`) REFERENCES `u_metadata` (`id`),
  CONSTRAINT `fk_u_loan_product_fee_productid` FOREIGN KEY (`productId`) REFERENCES `u_loan_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_loan_quotation`
--

DROP TABLE IF EXISTS `u_loan_quotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_loan_quotation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` decimal(10,2) DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `quotationDate` datetime DEFAULT NULL,
  `expiredQuotationDate` datetime DEFAULT NULL,
  `productName` varchar(125) DEFAULT NULL,
  `loanPeriod` decimal(6,2) DEFAULT NULL,
  `principal` decimal(10,2) DEFAULT NULL,
  `interestRate` decimal(10,2) DEFAULT NULL,
  `interestAmount` decimal(10,2) DEFAULT NULL,
  `loanFeeRefIds` text,
  `firstInstallment` datetime DEFAULT NULL,
  `lastInstallment` datetime DEFAULT NULL,
  `monthlyInstallment` decimal(10,2) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(25) DEFAULT NULL,
  `customerRefId` varchar(45) DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `quotationNumber` varchar(45) DEFAULT NULL,
  `upfrontFees` decimal(10,2) DEFAULT '0.00',
  `deductedFees` decimal(10,2) DEFAULT '0.00',
  `installmentFees` decimal(10,2) DEFAULT '0.00',
  `totalFees` decimal(10,2) DEFAULT '0.00',
  `totalAmount` decimal(10,2) DEFAULT '0.00',
  `disbursementAmount` decimal(10,2) DEFAULT '0.00',
  `maturityDate` date DEFAULT NULL,
  `installmentCount` int DEFAULT NULL,
  `repaymentPeriod` int DEFAULT NULL,
  `repaymentPeriodUnits` varchar(45) DEFAULT NULL,
  `deductedInterest` decimal(10,2) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_u_loan_quotation_productid_idx` (`productId`),
  CONSTRAINT `fk_u_loan_quotation_productid` FOREIGN KEY (`productId`) REFERENCES `u_loan_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_loanproduct_accountcategory`
--

DROP TABLE IF EXISTS `u_loanproduct_accountcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_loanproduct_accountcategory` (
  `productid` int NOT NULL,
  `b2bcategoryid` int NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`productid`,`b2bcategoryid`),
  KEY `fk_u_loanproduct_accountcategory_b2bcategoryid_idx` (`b2bcategoryid`),
  CONSTRAINT `fk_u_loanproduct_accountcategory_b2bcategoryid` FOREIGN KEY (`b2bcategoryid`) REFERENCES `u_b2baccount_category` (`id`),
  CONSTRAINT `fk_u_loanproduct_accountcategory_productid` FOREIGN KEY (`productid`) REFERENCES `u_loan_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_metadata`
--

DROP TABLE IF EXISTS `u_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_metadata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `m_key` varchar(45) NOT NULL,
  `m_value` varchar(100) DEFAULT NULL,
  `refid` varchar(45) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT NULL,
  `metadata_category` int DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_u_metadata_category_idx` (`metadata_category`),
  CONSTRAINT `fk_u_metadata_category` FOREIGN KEY (`metadata_category`) REFERENCES `u_metadata_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_metadata_category`
--

DROP TABLE IF EXISTS `u_metadata_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_metadata_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` varchar(45) DEFAULT NULL,
  `name` varchar(125) NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_penalties_seq`
--

DROP TABLE IF EXISTS `u_penalties_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_penalties_seq` (
  `id` int NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_penalty_fee_accounts_seq`
--

DROP TABLE IF EXISTS `u_penalty_fee_accounts_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_penalty_fee_accounts_seq` (
  `id` int NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_quotation_seq`
--

DROP TABLE IF EXISTS `u_quotation_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_quotation_seq` (
  `id` int NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_setting`
--

DROP TABLE IF EXISTS `u_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint NOT NULL DEFAULT '1',
  `settingname` varchar(100) NOT NULL,
  `settingvalue` text,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settingname_UNIQUE` (`settingname`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `idx_u_setting_refId` (`refId`),
  KEY `idx_u_setting_name` (`settingname`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_sqlscript`
--

DROP TABLE IF EXISTS `u_sqlscript`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_sqlscript` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` int DEFAULT NULL,
  `scriptno` int NOT NULL,
  `scriptname` varchar(125) NOT NULL,
  `scriptpath` varchar(500) NOT NULL,
  `executionstatus` varchar(20) NOT NULL,
  `message` text,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scriptname_UNIQUE` (`scriptname`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `idx_scriptname` (`scriptname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_transactionid_seq`
--

DROP TABLE IF EXISTS `u_transactionid_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_transactionid_seq` (
  `id` int NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_unreconcilled_balance`
--

DROP TABLE IF EXISTS `u_unreconcilled_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_unreconcilled_balance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `transactionId` varchar(45) DEFAULT NULL,
  `details` varchar(45) DEFAULT NULL,
  `transactiontime` datetime DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `trxyear` int DEFAULT NULL,
  `trxmonth` tinyint DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `idx_unreconciled_transaction_refid` (`refId`),
  KEY `idx_unreconciled_transaction_transactionid` (`transactionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_user_category_loanproduct`
--

DROP TABLE IF EXISTS `u_user_category_loanproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_user_category_loanproduct` (
  `categoryid` int NOT NULL,
  `productid` int NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`categoryid`,`productid`),
  KEY `fk_u_user_category_loanproduct_productid_idx` (`productid`),
  CONSTRAINT `fk_u_user_category_loanproduct_categoryid` FOREIGN KEY (`categoryid`) REFERENCES `b_user_category` (`id`),
  CONSTRAINT `fk_u_user_category_loanproduct_productid` FOREIGN KEY (`productid`) REFERENCES `u_loan_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_user_product`
--

DROP TABLE IF EXISTS `u_user_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_user_product` (
  `userid` int NOT NULL,
  `productId` int NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `t10007_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`userid`,`productId`),
  KEY `fk_u_user_product_productid_idx` (`productId`),
  CONSTRAINT `fk_u_user_product_productid` FOREIGN KEY (`productId`) REFERENCES `u_loan_product` (`id`),
  CONSTRAINT `fk_u_user_product_userid` FOREIGN KEY (`userid`) REFERENCES `b_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `v_bridged_loans`
--

DROP TABLE IF EXISTS `v_bridged_loans`;
/*!50001 DROP VIEW IF EXISTS `v_bridged_loans`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_bridged_loans` AS SELECT 
 1 AS `userid`,
 1 AS `bridgedLoanNo`,
 1 AS `newLoanNo`,
 1 AS `originalLoanId`,
 1 AS `referencedLoanRefId`,
 1 AS `newLoanRefId`,
 1 AS `nextLoanRefId`,
 1 AS `bridgedOn`,
 1 AS `loantype`,
 1 AS `loanclass`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_equity_accounts`
--

DROP TABLE IF EXISTS `v_equity_accounts`;
/*!50001 DROP VIEW IF EXISTS `v_equity_accounts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_equity_accounts` AS SELECT 
 1 AS `accountNo`,
 1 AS `accountName`,
 1 AS `description`,
 1 AS `accountclass`,
 1 AS `accountType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_income_accounts`
--

DROP TABLE IF EXISTS `v_income_accounts`;
/*!50001 DROP VIEW IF EXISTS `v_income_accounts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_income_accounts` AS SELECT 
 1 AS `accountNo`,
 1 AS `accountName`,
 1 AS `description`,
 1 AS `accountclass`,
 1 AS `accountType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_payment_accounts`
--

DROP TABLE IF EXISTS `v_payment_accounts`;
/*!50001 DROP VIEW IF EXISTS `v_payment_accounts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_payment_accounts` AS SELECT 
 1 AS `accountno`,
 1 AS `accountname`,
 1 AS `accounttype`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_customer_loan_sequence`
--

DROP TABLE IF EXISTS `view_customer_loan_sequence`;
/*!50001 DROP VIEW IF EXISTS `view_customer_loan_sequence`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_customer_loan_sequence` AS SELECT 
 1 AS `id`,
 1 AS `refid`,
 1 AS `customerRefId`,
 1 AS `created`,
 1 AS `disbursementDate`,
 1 AS `loantype`,
 1 AS `loanclass`,
 1 AS `requestedamount`,
 1 AS `totalamount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_gl_summary`
--

DROP TABLE IF EXISTS `view_gl_summary`;
/*!50001 DROP VIEW IF EXISTS `view_gl_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_gl_summary` AS SELECT 
 1 AS `accountno`,
 1 AS `refId`,
 1 AS `postingdate`,
 1 AS `postingtype`,
 1 AS `amount`,
 1 AS `transactionreferencecode`,
 1 AS `trxtype`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_loan_balances`
--

DROP TABLE IF EXISTS `view_loan_balances`;
/*!50001 DROP VIEW IF EXISTS `view_loan_balances`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_loan_balances` AS SELECT 
 1 AS `refId`,
 1 AS `loan`,
 1 AS `disbursementdate`,
 1 AS `duedate`,
 1 AS `customerName`,
 1 AS `loanStatus`,
 1 AS `paymentStatus`,
 1 AS `Principal`,
 1 AS `Interest`,
 1 AS `Fees`,
 1 AS `Penalties`,
 1 AS `Balance`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_member_contribution`
--

DROP TABLE IF EXISTS `view_member_contribution`;
/*!50001 DROP VIEW IF EXISTS `view_member_contribution`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_member_contribution` AS SELECT 
 1 AS `transactiondate`,
 1 AS `amount`,
 1 AS `userid`,
 1 AS `fullname`,
 1 AS `transactionid`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `gl_types`
--

/*!50001 DROP VIEW IF EXISTS `gl_types`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `gl_types` AS select `l`.`id` AS `loanId`,`gl`.`postingdate` AS `postingdate`,`gl`.`accountNo` AS `accountNo`,`gl`.`accountName` AS `accountName`,`gl`.`description` AS `description`,(case when (`gl`.`description` like 'Loan Issuance%') then 'Principal' when (`gl`.`description` like '%Interest%') then 'Interest' when (`gl`.`description` like 'Loan payment%') then 'Payments' when ((`gl`.`description` like 'Reversed Loan payment%') or (`gl`.`description` like 'Reversal Loan payment%')) then 'Reversed Payments' when (`gl`.`description` like 'LATE PAYMENT') then 'Penalties' when (`gl`.`description` like '%offset%') then 'Offset' when ((`gl`.`description` like '%Fee%') or (`gl`.`description` like 'SERVICE CHARGE%')) then 'Fees' end) AS `type`,coalesce((case when (`gl`.`postingtype` = 'DR') then `gl`.`amount` end),0) AS `drAmount`,coalesce((case when (`gl`.`postingtype` = 'CR') then `gl`.`amount` end),0) AS `crAmount`,`gl`.`documentType` AS `documentType` from (`gl_factacc` `gl` join `c_loanapplication` `l` on((`gl`.`documentRefId` = `l`.`refId`))) where (`gl`.`accountNo` like convert(concat('2020',substr(database(),2),'%') using latin1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `r_accounts`
--

/*!50001 DROP VIEW IF EXISTS `r_accounts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `r_accounts` AS select distinct `u_fee_config`.`accountNumber` AS `accountNumber`,`u_fee_config`.`name` AS `accountName`,`u_fee_config`.`feeclass` AS `accountType` from `u_fee_config` union select distinct `u_fee_config`.`deferredAccountNumber` AS `accountNumber`,concat('deferred',' ',`u_fee_config`.`name`) AS `accountName`,concat('DEFERRED','_',`u_fee_config`.`feeclass`) AS `accountType` from `u_fee_config` union select distinct `gl_account`.`accountno` AS `accountNumber`,`gl_account`.`accountname` AS `accountName`,`gl_account`.`accounttype` AS `accountType` from `gl_account` where ((`gl_account`.`accounttype` = 'INCOME') and `gl_account`.`accountno` in (select `u_fee_config`.`accountNumber` from `u_fee_config`) is false) union select distinct `gl_account`.`accountno` AS `accountNumber`,`gl_account`.`accountname` AS `accountName`,`gl_account`.`accounttype` AS `accountType` from `gl_account` where (`gl_account`.`accountname` in ('DEFERRED INCOME A/C','DEFERRED PENALTIES A/C','DEBTORS WRITE OFF A/C','DEBTORS A/C')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `types`
--

/*!50001 DROP VIEW IF EXISTS `types`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `types` AS select coalesce(`l`.`id`,0) AS `loanId`,`l`.`disbursementdate` AS `disbursementDate`,`l`.`duedate` AS `dueDate`,`l`.`refId` AS `refId`,`l`.`loanBalance` AS `totalBalance`,`users`.`fullName` AS `fullName`,`users`.`phoneNumber` AS `phoneNumber`,`gl`.`postingdate` AS `postingdate`,`gl2`.`accountNo` AS `accountNo`,`gl2`.`accountName` AS `accountName`,`gl2`.`description` AS `description`,(case when ((`gl2`.`accountNo` like '4030%') or (`gl2`.`accountNo` like '4020%') or (`gl2`.`accountNo` like '3070%')) then 'Fees' when (`gl2`.`accountNo` = convert(concat('5011',substr(database(),2)) using latin1)) then 'Penalties' when (((`gl2`.`accountNo` like '2010%') and (`gl`.`postingtype` = 'DR')) or ((`gl2`.`accountNo` like '2030%') and (`gl`.`postingtype` = 'DR')) or (`gl2`.`description` like 'Loan Issuance%')) then 'Principal' when (`gl2`.`accountNo` like '5010%') then 'Interest' when (((`gl2`.`accountNo` like '2010%') and (`gl`.`postingtype` = 'CR')) or (`gl2`.`accountNo` like '5221%') or ((`gl2`.`accountNo` like '2030%') and (`gl`.`postingtype` = 'CR'))) then 'Payments' when (`gl2`.`accountNo` like '4040%') then 'writeOff' else 'unknown' end) AS `type`,if((`gl`.`postingtype` = 'DR'),`gl`.`amount`,0) AS `drAmount`,if((`gl`.`postingtype` = 'CR'),`gl`.`amount`,0) AS `crAmount`,coalesce(`loanpayment`.`principalAllocation`,0) AS `principalPaid`,coalesce(`loanpayment`.`interestAllocation`,0) AS `interestPaid`,coalesce(`loanpayment`.`feesAllocation`,0) AS `feesPaid`,coalesce(`loanpayment`.`penaltiesAllocation`,0) AS `penaltiesPaid` from ((((`gl_factacc` `gl` left join `c_loanapplication` `l` on((`l`.`refId` = `gl`.`documentRefId`))) left join (select `u`.`id` AS `id`,upper(`u`.`fullname`) AS `fullName`,`u`.`phonenumber` AS `phoneNumber` from `b_user` `u`) `users` on((`users`.`id` = `l`.`userid`))) join `gl_factacc` `gl2` on((`gl`.`refId` = `gl2`.`referenced_factacc_id`))) left join (select `p`.`loanid` AS `loanId`,`p`.`principalAllocation` AS `principalAllocation`,`p`.`interestAllocation` AS `interestAllocation`,`p`.`feesAllocation` AS `feesAllocation`,`p`.`penaltiesAllocation` AS `penaltiesAllocation`,`p`.`postingDate` AS `postingDate`,`p`.`reversalTransactionId` AS `reversalTransactionId` from `c_loan_payment` `p`) `loanpayment` on(((`l`.`id` = `loanpayment`.`loanId`) and (`loanpayment`.`postingDate` = `gl`.`postingdate`) and (`loanpayment`.`reversalTransactionId` is null)))) where (`gl`.`accountNo` like convert(concat('2020',substr(database(),2),'%') using latin1)) order by `l`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_bridged_loans`
--

/*!50001 DROP VIEW IF EXISTS `v_bridged_loans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_bridged_loans` AS select `l`.`userid` AS `userid`,(select max(`br`.`id`) from `c_loanapplication` `br` where ((`br`.`isActive` = 1) and (`br`.`applicationStatus` = 'COMPLETED') and (`br`.`userid` = `l`.`userid`) and (`br`.`id` < `l`.`id`))) AS `bridgedLoanNo`,`l`.`id` AS `newLoanNo`,`l`.`originalLoanId` AS `originalLoanId`,`l`.`referencedLoanRefId` AS `referencedLoanRefId`,`l`.`refId` AS `newLoanRefId`,`l`.`nextLoanRefId` AS `nextLoanRefId`,`l`.`disbursementdate` AS `bridgedOn`,`l`.`loanType` AS `loantype`,`l`.`loanclass` AS `loanclass` from `c_loanapplication` `l` where ((`l`.`isActive` = 1) and (`l`.`applicationStatus` = 'COMPLETED') and ((`l`.`loanType` = '_TOP_UP') or (`l`.`loanclass` = 'ROLLOVER') or (`l`.`loanType` = '_RESTRUCTURE') or (`l`.`loanclass` = 'RESTRUCTURE'))) order by `l`.`userid`,(select max(`br`.`id`) from `c_loanapplication` `br` where ((`br`.`isActive` = 1) and (`br`.`applicationStatus` = 'COMPLETED') and (`br`.`userid` = `l`.`userid`) and (`br`.`id` < `l`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_equity_accounts`
--

/*!50001 DROP VIEW IF EXISTS `v_equity_accounts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_equity_accounts` AS select `gl`.`accountno` AS `accountNo`,`gl`.`accountname` AS `accountName`,`gl`.`description` AS `description`,`gl`.`accountclass` AS `accountclass`,'INTEREST' AS `accountType` from `gl_account` `gl` where (`gl`.`accountno` in (convert(concat('1010',substr(database(),2)) using latin1),convert(concat('1020',substr(database(),2)) using latin1))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_income_accounts`
--

/*!50001 DROP VIEW IF EXISTS `v_income_accounts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_income_accounts` AS select `gl`.`accountno` AS `accountNo`,`gl`.`accountname` AS `accountName`,`gl`.`description` AS `description`,`gl`.`accountclass` AS `accountclass`,'INTEREST' AS `accountType` from `gl_account` `gl` where (`gl`.`accountno` = convert(concat('3010',substr(database(),2)) using latin1)) union select `f`.`accountNumber` AS `accountNo`,`f`.`name` AS `name`,`f`.`name` AS `name`,'INCOME' AS `INCOME`,'FEE' AS `accountType` from `u_fee_config` `f` where (`f`.`isSystemFee` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_payment_accounts`
--

/*!50001 DROP VIEW IF EXISTS `v_payment_accounts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_payment_accounts` AS select distinct `gl`.`accountno` AS `accountno`,`gl`.`accountname` AS `accountname`,`gl`.`accounttype` AS `accounttype` from ((`gl_account` `gl` join `gl_account_category_map` `gacm` on((`gl`.`id` = `gacm`.`gl_account_id`))) join `gl_category` `gc` on((`gacm`.`categoryid` = `gc`.`id`))) where (`gc`.`name` in ('DISBURSEMENT','COLLECTIONS')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_customer_loan_sequence`
--

/*!50001 DROP VIEW IF EXISTS `view_customer_loan_sequence`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_customer_loan_sequence` AS select `l`.`id` AS `id`,`l`.`refId` AS `refid`,`u`.`refId` AS `customerRefId`,`l`.`created` AS `created`,`l`.`disbursementdate` AS `disbursementDate`,`l`.`loanType` AS `loantype`,`l`.`loanclass` AS `loanclass`,`l`.`requestedAmount` AS `requestedamount`,`l`.`totalAmount` AS `totalamount` from (`c_loanapplication` `l` join `b_user` `u` on(((`l`.`userid` = `u`.`id`) and (`l`.`loanaccountno` = `u`.`accountNo`)))) where ((`l`.`isActive` = 1) and (`l`.`applicationStatus` = 'COMPLETED')) order by `l`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_gl_summary`
--

/*!50001 DROP VIEW IF EXISTS `view_gl_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_gl_summary` AS select `c`.`accountNo` AS `accountno`,`c`.`refId` AS `refId`,`c`.`postingdate` AS `postingdate`,`c`.`postingtype` AS `postingtype`,`c`.`amount` AS `amount`,`c`.`transactionreferencecode` AS `transactionreferencecode`,(case when regexp_like(`c1`.`accountNo`,'1010[0-9]*') then 'INVESTMENT' when (regexp_like(`c1`.`accountNo`,'2020[0-9]*') and (`c`.`postingtype` = 'CR')) then 'LOAN' when (regexp_like(`c1`.`accountNo`,'2020[0-9]*') and (`c`.`postingtype` = 'DR')) then 'LOAN_PAYMENT' when (regexp_like(`c1`.`accountNo`,'4020[0-9]*') and (`c`.`postingtype` = 'CR') and ((`c`.`amount` = 23) or (`c`.`amount` = 22) or (`c`.`amount` = 15) or (`c`.`amount` = 16))) then 'MpesaFees' when (regexp_like(`c1`.`accountNo`,'3010[0-9]*') and (`c`.`postingtype` = 'CR')) then 'WITHDRAWAL' when (regexp_like(`c1`.`accountNo`,'1010[0-9]*') and (`c`.`postingtype` = 'CR')) then 'WITHDRAWAL' when (regexp_like(`c1`.`accountNo`,'5080[0-9]*') and (`c`.`postingtype` = 'DR')) then 'SUBS' else `c1`.`accountNo` end) AS `trxtype` from (`gl_factacc` `c` join `gl_factacc` `c1` on((`c`.`referenced_factacc_id` = `c1`.`refId`))) where (`c`.`accountNo` like '2010%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_loan_balances`
--

/*!50001 DROP VIEW IF EXISTS `view_loan_balances`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_loan_balances` AS select 1 AS `refId`,1 AS `loan`,1 AS `disbursementdate`,1 AS `duedate`,1 AS `customerName`,1 AS `loanStatus`,1 AS `paymentStatus`,1 AS `Principal`,1 AS `Interest`,1 AS `Fees`,1 AS `Penalties`,1 AS `Balance` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_member_contribution`
--

/*!50001 DROP VIEW IF EXISTS `view_member_contribution`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_member_contribution` AS select 1 AS `transactiondate`,1 AS `amount`,1 AS `userid`,1 AS `fullname`,1 AS `transactionid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-06 21:04:53
