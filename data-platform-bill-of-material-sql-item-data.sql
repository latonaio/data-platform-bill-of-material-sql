CREATE TABLE `data_platform_bill_of_material_item_data`
(
    `ProductionPlantBusinessPartner`  int(12) NOT NULL,
    `BillOfMaterial`                  int(16) NOT NULL,
    `BillOfMaterialItem`              int(6) NOT NULL,
    `ItemValidityStartDate`           date DEFAULT NULL,
    `ItemValidityEndDate`             date DEFAULT NULL,
    `BillOfMaterialComponentProduct`  varchar(40) DEFAULT NULL,
    `BillOfMaterialItemQuantity`      float(15) DEFAULT NULL,
    `ComponentScrapInPercent`         int(5) DEFAULT NULL,
    `ItemIsMarkedForDeletion`         tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`BusinessPartner`, `BillOfMaterial`, `BillOfMaterialItem`),
    
    CONSTRAINT `DataPlatformBillOfMaterialItemData_fk` FOREIGN KEY (`ProductionPlantBusinessPartner`, `BillOfMaterial`) REFERENCES `data_platform_bill_of_material_header_data` (`ProductionPlantBusinessPartner`, `BillOfMaterial`)
    
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
