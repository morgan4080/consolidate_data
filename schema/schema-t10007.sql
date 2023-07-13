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
  `tenant_pid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `idx_region_refId` (`refId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
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
  `tenant_pid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `idx_branch_refid` (`refId`),
  KEY `fk_b_branch_1_idx` (`regionId`),
  CONSTRAINT `fk_b_branch_1` FOREIGN KEY (`regionId`) REFERENCES `b_region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
  `tenant_pid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_customer_change_requests_customers_idx` (`customerId`),
  CONSTRAINT `fk_customer_change_requests_customers` FOREIGN KEY (`customerId`) REFERENCES `b_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
  `tenant_pid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_ucr_b_user_idx` (`userid`),
  KEY `fk_ucr_b_user` (`userid`),
  CONSTRAINT `fk_ucr_b_user` FOREIGN KEY (`userid`) REFERENCES `b_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
  `tenant_pid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_c_customer_balances_import_customer_idx` (`customerid`),
  CONSTRAINT `fk_c_customer_balances_import_customer` FOREIGN KEY (`customerid`) REFERENCES `b_user` (`id`)
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
  `tenant_pid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_c_membercontribution_balances_userid_idx` (`userid`),
  KEY `fk_c_membercontribution_balances_userid` (`userid`),
  CONSTRAINT `fk_c_membercontribution_balances_userid` FOREIGN KEY (`userid`) REFERENCES `b_user` (`id`)
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
-- Table structure for table `u_user_product`
--

DROP TABLE IF EXISTS `u_user_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_user_product` (
  `userid` int NOT NULL,
  `productId` int NOT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `tenant_pid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`userid`,`productId`),
  KEY `fk_u_user_product_productid_idx` (`productId`),
  CONSTRAINT `fk_u_user_product_productid` FOREIGN KEY (`productId`) REFERENCES `u_loan_product` (`id`),
  CONSTRAINT `fk_u_user_product_userid` FOREIGN KEY (`userid`) REFERENCES `b_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
  `tenant_pid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `idx_c_memo_refId` (`refId`),
  KEY `fk_c_memo_user_categoryid_idx` (`customercategoryid`),
  CONSTRAINT `fk_c_memo_user_categoryid` FOREIGN KEY (`customercategoryid`) REFERENCES `b_user_category` (`id`)
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
  `tenant_pid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`categoryid`,`productid`),
  KEY `fk_u_user_category_loanproduct_productid_idx` (`productid`),
  CONSTRAINT `fk_u_user_category_loanproduct_categoryid` FOREIGN KEY (`categoryid`) REFERENCES `b_user_category` (`id`),
  CONSTRAINT `fk_u_user_category_loanproduct_productid` FOREIGN KEY (`productid`) REFERENCES `u_loan_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
  `tenant_pid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_c_checkoff_checkoffId_idx` (`checkoffId`),
  KEY `fk_c_loanapplication_loanId_idx` (`loanId`),
  CONSTRAINT `fk_c_checkoff_checkoffId_id` FOREIGN KEY (`checkoffId`) REFERENCES `c_checkoff` (`id`),
  CONSTRAINT `fk_c_loanapplication_loanId_id` FOREIGN KEY (`loanId`) REFERENCES `c_loanapplication` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
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
  `tenant_pid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `idx_paymentsschedule_refid` (`refId`),
  KEY `fk_c_loanpaymentschedule_loanid_idx` (`loanid`),
  KEY `fk_c_loanpaymentschedule_loanid` (`loanid`),
  CONSTRAINT `fk_c_accrual_schedule_loanid` FOREIGN KEY (`loanid`) REFERENCES `c_loanapplication` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
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
  `tenant_pid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_c_journaltransaction_loanid_idx` (`loanid`),
  CONSTRAINT `fk_c_journaltransaction_loanid` FOREIGN KEY (`loanid`) REFERENCES `c_loanapplication` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
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
  `tenant_pid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_c_loan_disbursement_loanid_idx` (`loanId`),
  CONSTRAINT `fk_c_loan_disbursement_loanid` FOREIGN KEY (`loanId`) REFERENCES `c_loanapplication` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
  `tenant_pid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_c_loan_payment_loanid_idx` (`loanid`),
  KEY `fk_c_loan_payment_journalid_idx` (`journaltransactionid`),
  CONSTRAINT `fk_c_loan_payment_journalid` FOREIGN KEY (`journaltransactionid`) REFERENCES `c_journaltransaction` (`id`),
  CONSTRAINT `fk_c_loan_payment_loanid` FOREIGN KEY (`loanid`) REFERENCES `c_loanapplication` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;
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
  `tenant_pid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_c_loanapplication_fees_loanid_accountno_unique` (`loanId`,`accountNumber`),
  KEY `fk_c_loanapplication_fees_loanid_idx` (`loanId`),
  KEY `fk_c_loanapplication_fees_quotationid_idx` (`quotationId`),
  CONSTRAINT `fk_c_loanapplication_fees_loanid` FOREIGN KEY (`loanId`) REFERENCES `c_loanapplication` (`id`),
  CONSTRAINT `fk_c_loanapplication_fees_quotationid` FOREIGN KEY (`quotationId`) REFERENCES `u_loan_quotation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=436 DEFAULT CHARSET=latin1;
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
  `tenant_pid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_alloc_loan_application_idx` (`loanApplicationId`),
  CONSTRAINT `fk_alloc_loan_application` FOREIGN KEY (`loanApplicationId`) REFERENCES `c_loanapplication` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `tenant_pid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`scheduleid`,`paymentid`),
  KEY `fk_c_loan_payment_allocation_paymentid_idx` (`paymentid`),
  CONSTRAINT `fk_c_loan_payment_allocation_paymentid` FOREIGN KEY (`paymentid`) REFERENCES `c_loan_payment` (`id`),
  CONSTRAINT `fk_c_loan_payment_allocation_scheduleid` FOREIGN KEY (`scheduleid`) REFERENCES `c_loanpaymentschedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
  `tenant_pid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_c_loanschedule_fees_schedule_idx` (`scheduleId`),
  CONSTRAINT `fk_c_loanschedule_fees_schedule0` FOREIGN KEY (`scheduleId`) REFERENCES `c_loanpaymentschedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
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
  `tenant_pid` varchar(15) DEFAULT NULL,
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
  `tenant_pid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`penaltyid`,`feeid`),
  KEY `fk_c_penaltycontract_fees_feeid_idx` (`feeid`),
  CONSTRAINT `fk_c_penaltycontract_fees_feeid` FOREIGN KEY (`feeid`) REFERENCES `u_fee_config` (`id`),
  CONSTRAINT `fk_c_penaltycontract_fees_penaltyid` FOREIGN KEY (`penaltyid`) REFERENCES `c_loanpenaltycontract` (`id`)
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
  `tenant_pid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `fk_memo_id_idx` (`memoId`),
  KEY `fk_memo_refid` (`refId`),
  KEY `fk_memo_id` (`memoId`),
  CONSTRAINT `fk_memo_id` FOREIGN KEY (`memoId`) REFERENCES `c_memo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `tenant_pid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`gl_account_id`,`categoryid`),
  KEY `fk_gl_account_category_map_category_idx` (`categoryid`),
  CONSTRAINT `fk_gl_account_category_map_category` FOREIGN KEY (`categoryid`) REFERENCES `gl_category` (`id`),
  CONSTRAINT `fk_gl_account_category_map_gl` FOREIGN KEY (`gl_account_id`) REFERENCES `gl_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-13 12:53:43
