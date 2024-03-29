CREATE TABLE `data_platform_bill_of_material_item_data`
(
    `BillOfMaterial`                                   int(16) NOT NULL,
    `BillOfMaterialItem`                               int(6) NOT NULL,
    `SupplyChainRelationshipID`                        int(16) NOT NULL,
    `SupplyChainRelationshipDeliveryID`                int(6) NOT NULL,
    `SupplyChainRelationshipDeliveryPlantID`           int(4) NOT NULL,
    `SupplyChainRelationshipStockConfPlantID`          int(4) NOT NULL,
    `Product`                                          varchar(40) NOT NULL,
    `ProductionPlantBusinessPartner`                   int(12) NOT NULL,
    `ProductionPlant`                                  varchar(4) NOT NULL,
    `ComponentProduct`                                 varchar(40) NOT NULL,
    `ComponentProductBuyer`                            int(12) NOT NULL,
    `ComponentProductSeller`                           int(12) NOT NULL,
    `ComponentProductDeliverToParty`                   int(12) NOT NULL,
    `ComponentProductDeliverToPlant`                   varchar(4) NOT NULL,
    `ComponentProductDeliverFromParty`                 int(12) NOT NULL,
    `ComponentProductDeliverFromPlant`                 varchar(4) NOT NULL,
    `StockConfirmationBusinessPartner`                 int(12) NOT NULL,
    `StockConfirmationPlant`                           varchar(4) NOT NULL,
    `ComponentProductStandardQuantityInBaseUnit`       float(15) NOT NULL,
    `ComponentProductStandardQuantityInDeliveryUnit`   float(15) NOT NULL,
    `ComponentProductBaseUnit`                         varchar(3) NOT NULL,
    `ComponentProductDeliveryUnit`                     varchar(3) NOT NULL,
    `ComponentProductStandardScrapInPercent`           float(7) DEFAULT NULL,
    `IsMarkedForBackflush`                             tinyint(1) DEFAULT NULL,
    `BillOfMaterialItemText`                           varchar(200) DEFAULT NULL,
    `ValidityStartDate`                                date DEFAULT NULL,
    `ValidityEndDate`                                  date DEFAULT NULL,
    `CreationDate`                                     date NOT NULL,
    `LastChangeDate`                                   date NOT NULL,
    `IsMarkedForDeletion`                              tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`BillOfMaterial`, `BillOfMaterialItem`),
    
    CONSTRAINT `DPFMBOMItemData_fk` FOREIGN KEY (`BillOfMaterial`) REFERENCES `data_platform_bill_of_material_header_data` (`BillOfMaterial`),
    CONSTRAINT `DPFMBOMItemDataSCRID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `ComponentProductBuyer`, `ComponentProductSeller`) REFERENCES `data_platform_scr_general_data` (`SupplyChainRelationshipID`, `Buyer`, `Seller`),
    CONSTRAINT `DPFMBOMItemDataSCRDeliveryID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `ComponentProductBuyer`, `ComponentProductSeller`, `ComponentProductDeliverToParty`, `ComponentProductDeliverFromParty`) REFERENCES `data_platform_scr_delivery_relation_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`),
    CONSTRAINT `DPFMBOMItemDataSCRDeliveryPlantIDProduct_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `SupplyChainRelationshipDeliveryPlantID`, `ComponentProductBuyer`, `ComponentProductSeller`, `ComponentProductDeliverToParty`, `ComponentProductDeliverFromParty`, `ComponentProductDeliverToPlant`, `ComponentProductDeliverFromPlant`, `ComponentProduct`) REFERENCES `data_platform_scr_delivery_plant_relation_product_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `SupplyChainRelationshipDeliveryPlantID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`, `DeliverToPlant`, `DeliverFromPlant`, `Product`),
    CONSTRAINT `DPFMBOMItemDataSCRStockConfPlantIDProduct_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipStockConfPlantID`, `ComponentProductBuyer`, `ComponentProductSeller`, `StockConfirmationBusinessPartner`, `StockConfirmationPlant`, `ComponentProduct`) REFERENCES `data_platform_scr_production_plant_relation_product_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipProductionPlantID`, `Buyer`, `Seller`, `ProductionPlantBusinessPartner`, `ProductionPlant`, `Product`),
    CONSTRAINT `DPFMBOMItemOperationComponentDataComponentProductBaseUnit_fk` FOREIGN KEY (`ComponentProductBaseUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DPFMBOMItemOperationComponentDataComponentProductDeliveryUnit_fk` FOREIGN KEY (`ComponentProductDeliveryUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
