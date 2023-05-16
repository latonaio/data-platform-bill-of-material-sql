CREATE TABLE `data_platform_bill_of_material_item_data`
(
    `BillOfMaterial`                  int(16) NOT NULL,
    `BillOfMaterialItem`              int(6) NOT NULL,
    `ComponentProduct`                varchar(40) NOT NULL,
    `ComponentProductBusinessPartner` int(12) DEFAULT NULL,
    `StockConfirmationPlant`          varchar(4) DEFAULT NULL,
    `BOMAlternativeText`              varchar(200) DEFAULT NULL,
    `BOMItemBaseUnit`                 varchar(3) DEFAULT NULL,
    `BOMItemQuantityInBaseUnit`       float(15) DEFAULT NULL,
    `ComponentScrapInPercent`         int(5) DEFAULT NULL,
    `ValidityStartDate`               date DEFAULT NULL,
    `ValidityEndDate`                 date DEFAULT NULL,
    `BillOfMaterialItemText`          varchar(200) DEFAULT NULL,
    `IsMarkedForDeletion`             tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`BillOfMaterial`, `BillOfMaterialItem`),
    
    CONSTRAINT `DataPlatformBillOfMaterialItemData_fk` FOREIGN KEY (`BillOfMaterial`) REFERENCES `data_platform_bill_of_material_header_data` (`BillOfMaterial`),
    CONSTRAINT `DataPlatformBillOfMaterialItemDataComponentProduct_fk` FOREIGN KEY (`ComponentProduct`) REFERENCES `data_platform_product_master_general_data` (`Product`),
    CONSTRAINT `DataPlatformBillOfMaterialItemDataComponentProductBusinessPartner_fk` FOREIGN KEY (`ComponentProductBusinessPartner`) REFERENCES `data_platform_business_partner_data` (`BusinessPartner`),
    CONSTRAINT `DataPlatformBillOfMaterialItemDataStockConfirmationPlant_fk` FOREIGN KEY (`StockConfirmationPlant`) REFERENCES `data_platform_plant_general_data` (`Plant`)
    
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
