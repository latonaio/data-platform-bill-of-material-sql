CREATE TABLE `data_platform_bill_of_material_item_pricing_element_data`
(
  `BillOfMaterial`              int(16) NOT NULL,
  `BillOfMaterialItem`          int(6) NOT NULL,
  `PricingProcedureCounter`     int(3) NOT NULL,
  `SupplyChainRelationshipID`   int(16) NOT NULL,
  `ComponentProductBuyer`       int(12) NOT NULL,
  `ComponentProductSeller`      int(12) NOT NULL,
  `ConditionRecord`             int(12) NOT NULL,
  `ConditionSequentialNumber`   int(2) NOT NULL,
  `ConditionType`               varchar(4) NOT NULL,
  `PricingDate`                 date NOT NULL,
  `ConditionRateValue`          float(13) NOT NULL,
  `ConditionRateValueUnit`      int(6) NOT NULL,
  `ConditionScaleQuantity`      int(13) NOT NULL,
  `ConditionCurrency`           varchar(5) NOT NULL,
  `ConditionQuantity`           float(15) NOT NULL,
  `TaxCode`                     varchar(1) DEFAULT NULL,
  `ConditionAmount`             float(13) NOT NULL,
  `TransactionCurrency`         varchar(5) NOT NULL,
  `ConditionIsManuallyChanged`  tinyint(1) DEFAULT NULL,
  `CreationDate`                date NOT NULL,
  `LastChangeDate`              date NOT NULL,
  `IsCancelled`                 tinyint(1) DEFAULT NULL,
  `IsMarkedForDeletion`         tinyint(1) DEFAULT NULL,
  
  PRIMARY KEY (`BillOfMaterial`, `BillOfMaterialItem`, `PricingProcedureCounter`),
    
  CONSTRAINT `DPFMBillOfMaterialItemPricingElementData_fk` FOREIGN KEY (`BillOfMaterial`, `BillOfMaterialItem`) REFERENCES `data_platform_bill_of_material_item_data` (`BillOfMaterial`, `BillOfMaterialItem`),
  CONSTRAINT `DPFMBillOfMaterialItemPricingElementDataSCRID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `ComponentProductBuyer`, `ComponentProductSeller`) REFERENCES `data_platform_scr_general_data` (`SupplyChainRelationshipID`, `Buyer`, `Seller`)
  
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
