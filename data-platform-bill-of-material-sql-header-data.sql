CREATE TABLE `data_platform_bill_of_material_header_data`
(
  `ProductionPlantBusinessPartner`            int(12) NOT NULL,
  `BillOfMaterial`                            int(16) NOT NULL,
  `Product`                                   varchar(40) DEFAULT NULL,
  `ProductionPlant`                           varchar(4) DEFAULT NULL,
  `IsConfiguredComponentProduct`              tinyint(1) DEFAULT NULL,
  `BOMAlternativeText`                        varchar(200) DEFAULT NULL,
  `HeaderValidityStartDate`                   date DEFAULT NULL,
  `HeaderValidityEndDate`                     date DEFAULT NULL,
  `MinimumDeliveryQuantityInBaseUnit`         float(15) DEFAULT NULL,
  `MaximumDeliveryLotSizeQuantityInBaseUnit`  float(15) DEFAULT NULL,
  `BOMHeaderBaseUnit`                         varchar(3) DEFAULT NULL,
  `BOMHeaderQuantityInBaseUnit`               float(15) DEFAULT NULL,
  `CreationDate`                              date NOT NULL,
  `LastChangeDate`                            date NOT NULL,
  `BillOfMaterialHeaderText`                  varchar(200) DEFAULT NULL,
  `HeaderIsMarkedForDeletion`                 tinyint(1) DEFAULT NULL,
  
    PRIMARY KEY (`ProductionPlantBusinessPartner`, `BillOfMaterial`),
    
    CONSTRAINT `DataPlatformBillOfMaterialHeaderDataProductionPlantBP_fk` FOREIGN KEY (`ProductionPlantBusinessPartner`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`),
    CONSTRAINT `DataPlatformBillOfMaterialHeaderDataBusinessProduct_fk` FOREIGN KEY (`Product`) REFERENCES `data_platform_product_master_general_data` (`Product`),
    CONSTRAINT `DataPlatformBillOfMaterialHeaderDataPlant_fk` FOREIGN KEY (`ProductionPlantBusinessPartner`, `ProductionPlant`) REFERENCES `data_platform_plant_general_data` (`BusinessPartner`, `Plant`)
    
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;