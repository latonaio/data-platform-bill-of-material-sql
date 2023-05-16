CREATE TABLE `data_platform_bill_of_material_header_data`
(
  `BillOfMaterial`                            int(16) NOT NULL,
  `BillOfMaterialType`                        varchar(2) DEFAULT NULL,
  `Product`                                   varchar(40) DEFAULT NULL,
  `OwnerBusinessPartner`                      int(12) DEFAULT NULL,
  `OwnerPlant`                                varchar(4) DEFAULT NULL,
  `BOMAlternativeText`                        varchar(200) DEFAULT NULL,
  `BOMHeaderBaseUnit`                         varchar(3) DEFAULT NULL,
  `BOMHeaderQuantityInBaseUnit`               float(15) DEFAULT NULL,
  `ValidityStartDate`                         date DEFAULT NULL,
  `ValidityEndDate`                           date DEFAULT NULL,
  `CreationDate`                              date NOT NULL,
  `LastChangeDate`                            date NOT NULL,
  `BillOfMaterialHeaderText`                  varchar(200) DEFAULT NULL,
  `IsMarkedForDeletion`                       tinyint(1) DEFAULT NULL,
  
    PRIMARY KEY (`BillOfMaterial`),
    
    CONSTRAINT `DataPlatformBillOfMaterialHeaderDataProduct_fk` FOREIGN KEY (`Product`) REFERENCES `data_platform_product_master_general_data` (`Product`),
    CONSTRAINT `DataPlatformBillOfMaterialHeaderDataOwnerPlant_fk` FOREIGN KEY (`OwnerBusinessPartner`, `OwnerPlant`) REFERENCES `data_platform_plant_general_data` (`BusinessPartner`, `Plant`)
    
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;