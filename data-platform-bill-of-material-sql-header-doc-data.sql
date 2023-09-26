CREATE TABLE `data_platform_bill_of_material_header_doc_data`
(
  `BillOfMaterial`                 int(16) NOT NULL,
  `DocType`                        varchar(100) NOT NULL,
  `DocVersionID`                   int(4) NOT NULL,
  `DocID`                          varchar(100) NOT NULL,
  `FileExtension`                  varchar(20) NOT NULL,
  `FileName`                       varchar(200) DEFAULT NULL,
  `FilePath`                       varchar(1000) DEFAULT NULL,
  `DocIssuerBusinessPartner`       int(12) DEFAULT NULL,
  
  PRIMARY KEY (`BillOfMaterial`, `DocType`, `DocVersionID`, `DocID`),
  
  CONSTRAINT `DataPlatformBillOfMaterialHeaderDocData_fk` FOREIGN KEY (`BillOfMaterial`) REFERENCES `data_platform_bill_of_material_header_data` (`BillOfMaterial`),
  CONSTRAINT `DataPlatformBillOfMaterialHeaderDocDataDocType_fk` FOREIGN KEY (`DocType`) REFERENCES `data_platform_doc_type_doc_type_data` (`DocType`),
  -- CONSTRAINT `DataPlatformBillOfMaterialHeaderDocDataDocIssuerBusinessPartner_fk` FOREIGN KEY (`DocIssuerBusinessPartner`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`) too long

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
