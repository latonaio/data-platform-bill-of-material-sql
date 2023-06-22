CREATE TABLE `data_platform_bill_of_material_header_data`
(
  `BillOfMaterial`                            int(16) NOT NULL,
  `BillOfMaterialType`                        varchar(2) NOT NULL,
  `SupplyChainRelationshipID`                 int(16) NOT NULL,
  `SupplyChainRelationshipDeliveryID`         int(6) NOT NULL,
  `SupplyChainRelationshipDeliveryPlantID`    int(4) NOT NULL,
  `SupplyChainRelationshipProductionPlantID`  int(4) NOT NULL,
  `Product`                                   varchar(40) NOT NULL,
  `Buyer`                                     int(12) NOT NULL,
  `Seller`                                    int(12) NOT NULL,
  `DepartureDeliverFromParty`                 int(12) NOT NULL,
  `DepartureDeliverFromPlant`                 varchar(4) NOT NULL,
  `DestinationDeliverToParty`                 int(12) NOT NULL,
  `DestinationDeliverToPlant`                 varchar(4) NOT NULL,
  `OwnerProductionPlantBusinessPartner`       int(12) NOT NULL,
  `OwnerProductionPlant`                      varchar(4) NOT NULL,
  `ProductBaseUnit`                           varchar(3) NOT NULL,
  `ProductDeliveryUnit`                       varchar(3) NOT NULL,
  `ProductProductionUnit`                     varchar(3) NOT NULL,
  `ProductStandardQuantityInBaseUnit`         float(15) NOT NULL,
  `ProductStandardQuantityInDeliveryUnit`     float(15) NOT NULL,
  `ProductStandardQuantityInProductionUnit`   float(15) NOT NULL,
  `BillOfMaterialHeaderText`                  varchar(200) DEFAULT NULL,
  `ValidityStartDate`                         date DEFAULT NULL,
  `ValidityEndDate`                           date DEFAULT NULL,
  `CreationDate`                              date NOT NULL,
  `LastChangeDate`                            date NOT NULL,
  `IsMarkedForDeletion`                       tinyint(1) DEFAULT NULL,
  
    PRIMARY KEY (`BillOfMaterial`),
    
    CONSTRAINT `DPFMBOMHeaderDataSCRID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `Buyer`, `Seller`) REFERENCES `data_platform_supply_chain_relationship_general_data` (`SupplyChainRelationshipID`, `Buyer`, `Seller`),
    CONSTRAINT `DPFMBOMHeaderDataSCRDeliveryID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `Buyer`, `Seller`, `DestinationDeliverToParty`, `DepartureDeliverFromParty`) REFERENCES `data_platform_supply_chain_relationship_delivery_relation_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`),
    CONSTRAINT `DPFMBOMHeaderDataSCRDeliveryPlantIDProduct_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `SupplyChainRelationshipDeliveryPlantID`, `Buyer`, `Seller`, `DestinationDeliverToParty`, `DepartureDeliverFromParty`, `DestinationDeliverToPlant`, `DepartureDeliverFromPlant`, `Product`) REFERENCES `data_platform_supply_chain_relationship_delivery_plant_relation_product_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `SupplyChainRelationshipDeliveryPlantID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`, `DeliverToPlant`, `DeliverFromPlant`, `Product`),
	CONSTRAINT `DPFMBOMHeaderDataSCRProductionPlantIDProduct_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipProductionPlantID`, `Buyer`, `Seller`, `OwnerProductionPlantBusinessPartner`, `OwnerProductionPlant`, `Product`) REFERENCES `data_platform_supply_chain_relationship_production_plant_relation_product_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipProductionPlantID`, `Buyer`, `Seller`, `ProductionPlantBusinessPartner`, `ProductionPlant`, `Product`),
	CONSTRAINT `DPFMBOMHeaderDataProductBaseUnit_fk` FOREIGN KEY (`ProductBaseUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
	CONSTRAINT `DPFMBOMHeaderDataProductDeliveryUnit_fk` FOREIGN KEY (`ProductDeliveryUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
	CONSTRAINT `DPFMBOMHeaderDataProductProductionUnit_fk` FOREIGN KEY (`ProductProductionUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;