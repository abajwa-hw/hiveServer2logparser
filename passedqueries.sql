-- id: 124
use tpcds_bin_partitioned_orc_10000
;



-- id: 125
use default
;



-- id: 126
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 127
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 160
SELECT `C_637573746f6d6572`.`c_customer_id` AS `C_6e6f6e655f635f637573746f6d65725f69645f6e6b`, `C_637573746f6d6572`.`c_email_address` AS `C_6e6f6e655f635f656d61696c5f616464726573735f6e6b`, `C_637573746f6d65725f64656d6f6772617068696373`.`cd_gender` AS `C_6e6f6e655f63645f67656e6465725f6e6b`, SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) AS `C_73756d5f63645f70757263686173655f657374696d6174655f6f6b`  FROM `tpcds_bin_partitioned_orc_200`.`customer`  `C_637573746f6d6572` JOIN `tpcds_bin_partitioned_orc_200`.`customer_demographics`  `C_637573746f6d65725f64656d6f6772617068696373` ON (`C_637573746f6d6572`.`c_current_cdemo_sk` = `C_637573746f6d65725f64656d6f6772617068696373`.`cd_demo_sk`)  WHERE ((`C_637573746f6d65725f64656d6f6772617068696373`.`cd_marital_status` = 'M') AND ((`C_637573746f6d65725f64656d6f6772617068696373`.`cd_education_status` = 'Unknown') AND ((`C_637573746f6d6572`.`c_birth_country` = 'UNITED STATES') AND (`C_637573746f6d65725f64656d6f6772617068696373`.`cd_credit_rating` = 'High Risk'))))  GROUP BY `C_637573746f6d6572`.`c_customer_id`, `C_637573746f6d6572`.`c_email_address`, `C_637573746f6d65725f64656d6f6772617068696373`.`cd_gender`  HAVING ((SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) >= 5000) AND (SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) <= 10000))   
 
 

;



-- id: 161
use default
;



-- id: 162
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 163
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 196
SELECT `C_637573746f6d6572`.`c_customer_id` AS `C_6e6f6e655f635f637573746f6d65725f69645f6e6b`, `C_637573746f6d6572`.`c_email_address` AS `C_6e6f6e655f635f656d61696c5f616464726573735f6e6b`, `C_637573746f6d65725f64656d6f6772617068696373`.`cd_gender` AS `C_6e6f6e655f63645f67656e6465725f6e6b`, SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) AS `C_73756d5f63645f70757263686173655f657374696d6174655f6f6b`  FROM `tpcds_bin_partitioned_orc_200`.`customer`  `C_637573746f6d6572` JOIN `tpcds_bin_partitioned_orc_200`.`customer_demographics`  `C_637573746f6d65725f64656d6f6772617068696373` ON (`C_637573746f6d6572`.`c_current_cdemo_sk` = `C_637573746f6d65725f64656d6f6772617068696373`.`cd_demo_sk`)  WHERE ((`C_637573746f6d65725f64656d6f6772617068696373`.`cd_marital_status` = 'M') AND ((`C_637573746f6d65725f64656d6f6772617068696373`.`cd_education_status` = 'Unknown') AND ((`C_637573746f6d6572`.`c_birth_country` = 'UNITED STATES') AND (`C_637573746f6d65725f64656d6f6772617068696373`.`cd_credit_rating` = 'High Risk'))))  GROUP BY `C_637573746f6d6572`.`c_customer_id`, `C_637573746f6d6572`.`c_email_address`, `C_637573746f6d65725f64656d6f6772617068696373`.`cd_gender`  HAVING ((SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) >= 5000) AND (SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) <= 10000))   
 

;



-- id: 197
use default
;



-- id: 198
SHOW SCHEMAS
;



-- id: 199
use default
;



-- id: 200
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 201
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 208
SELECT `C_6974656d`.`i_manufact` AS `C_6e6f6e655f695f6d616e75666163745f6e6b`  FROM `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` WHERE (`C_6974656d`.`i_manufact` IS NULL )   LIMIT 1    expr = leaf-0
 expr = leaf-0, columns: ['null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'i_manufact', 'null', 'null', 'null', 'null', 'null', 'null', 'null']}

;



-- id: 209
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 302
SELECT `C_43` AS `none_i_manufact_nk_2`, COUNT(`C_53`.`C_3`) AS `C_636e745f696e765f7175616e746974795f6f6e5f68616e645f6f6b`  FROM  ( SELECT  `C_6974656d`.`i_manufact` AS `C_43`, `C_696e76656e746f7279`.`inv_quantity_on_hand` AS `C_3`, `C_6974656d`.`i_manufact` AS `C_4`, `C_6974656d`.`i_item_sk` AS `C_5`, `C_696e76656e746f7279`.`inv_item_sk` AS `C_6`  FROM `tpcds_bin_partitioned_orc_200`.`inventory`  `C_696e76656e746f7279` JOIN `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` ON (`C_696e76656e746f7279`.`inv_item_sk` = `C_6974656d`.`i_item_sk`)   )`C_53` JOIN (SELECT `item_1`.`i_manufact` AS `C_6e6f6e655f695f6d616e75666163745f6e6b`, COUNT(1) AS `C_787461626c6561755f6a6f696e5f666c6167`, COUNT(`inventory_0`.`inv_quantity_on_hand`) AS `C_785f5f616c6961735f5f30`  FROM `tpcds_bin_partitioned_orc_200`.`inventory`  `inventory_0` JOIN `tpcds_bin_partitioned_orc_200`.`item`  `item_1` ON (`inventory_0`.`inv_item_sk` = `item_1`.`i_item_sk`)  GROUP BY `item_1`.`i_manufact`   ORDER BY `C_785f5f616c6961735f5f30` DESC  LIMIT 10   )  `C_7430` ON (`C_53`.`C_4` = `C_6e6f6e655f695f6d616e75666163745f6e6b`)  GROUP BY `C_53`.`C_43`   
 

;



-- id: 303
use default
;



-- id: 304
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 305
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 312
SELECT `C_6974656d`.`i_manufact` AS `C_6e6f6e655f695f6d616e75666163745f6e6b`  FROM `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` WHERE (`C_6974656d`.`i_manufact` IS NULL )   LIMIT 1    expr = leaf-0
 expr = leaf-0, columns: ['null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'i_manufact', 'null', 'null', 'null', 'null', 'null', 'null', 'null']}

;



-- id: 313
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 406
SELECT `C_5` AS `none_i_manufact_nk_2`, COUNT(`C_53`.`C_6`) AS `C_636e745f696e765f7175616e746974795f6f6e5f68616e645f6f6b`  FROM  ( SELECT  `C_6974656d`.`i_item_sk` AS `C_43`, `C_696e76656e746f7279`.`inv_item_sk` AS `C_3`, `C_6974656d`.`i_manufact` AS `C_4`, `C_6974656d`.`i_manufact` AS `C_5`, `C_696e76656e746f7279`.`inv_quantity_on_hand` AS `C_6`  FROM `tpcds_bin_partitioned_orc_200`.`inventory`  `C_696e76656e746f7279` JOIN `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` ON (`C_696e76656e746f7279`.`inv_item_sk` = `C_6974656d`.`i_item_sk`)   )`C_53` JOIN (SELECT `item_1`.`i_manufact` AS `C_6e6f6e655f695f6d616e75666163745f6e6b`, COUNT(1) AS `C_787461626c6561755f6a6f696e5f666c6167`, COUNT(`inventory_0`.`inv_quantity_on_hand`) AS `C_785f5f616c6961735f5f30`  FROM `tpcds_bin_partitioned_orc_200`.`inventory`  `inventory_0` JOIN `tpcds_bin_partitioned_orc_200`.`item`  `item_1` ON (`inventory_0`.`inv_item_sk` = `item_1`.`i_item_sk`)  GROUP BY `item_1`.`i_manufact`   ORDER BY `C_785f5f616c6961735f5f30` DESC  LIMIT 10   )  `C_7430` ON (`C_53`.`C_4` = `C_6e6f6e655f695f6d616e75666163745f6e6b`)  GROUP BY `C_53`.`C_5`   
 

;



-- id: 409
show databases like '*'
;



-- id: 410
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 411
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 444
SELECT `C_637573746f6d6572`.`c_customer_id` AS `C_6e6f6e655f635f637573746f6d65725f69645f6e6b`, `C_637573746f6d6572`.`c_email_address` AS `C_6e6f6e655f635f656d61696c5f616464726573735f6e6b`, `C_637573746f6d65725f64656d6f6772617068696373`.`cd_gender` AS `C_6e6f6e655f63645f67656e6465725f6e6b`, SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) AS `C_73756d5f63645f70757263686173655f657374696d6174655f6f6b`  FROM `tpcds_bin_partitioned_orc_200`.`customer`  `C_637573746f6d6572` JOIN `tpcds_bin_partitioned_orc_200`.`customer_demographics`  `C_637573746f6d65725f64656d6f6772617068696373` ON (`C_637573746f6d6572`.`c_current_cdemo_sk` = `C_637573746f6d65725f64656d6f6772617068696373`.`cd_demo_sk`)  WHERE ((`C_637573746f6d65725f64656d6f6772617068696373`.`cd_marital_status` = 'M') AND ((`C_637573746f6d65725f64656d6f6772617068696373`.`cd_education_status` = 'Unknown') AND ((`C_637573746f6d6572`.`c_birth_country` = 'UNITED STATES') AND (`C_637573746f6d65725f64656d6f6772617068696373`.`cd_credit_rating` = 'High Risk'))))  GROUP BY `C_637573746f6d6572`.`c_customer_id`, `C_637573746f6d6572`.`c_email_address`, `C_637573746f6d65725f64656d6f6772617068696373`.`cd_gender`  HAVING ((SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) >= 5000) AND (SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) <= 10000))   
 

;



-- id: 445
use default
;



-- id: 446
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 447
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 480
SELECT `C_637573746f6d6572`.`c_customer_id` AS `C_6e6f6e655f635f637573746f6d65725f69645f6e6b`, `C_637573746f6d6572`.`c_email_address` AS `C_6e6f6e655f635f656d61696c5f616464726573735f6e6b`, `C_637573746f6d65725f64656d6f6772617068696373`.`cd_gender` AS `C_6e6f6e655f63645f67656e6465725f6e6b`, SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) AS `C_73756d5f63645f70757263686173655f657374696d6174655f6f6b`  FROM `tpcds_bin_partitioned_orc_200`.`customer`  `C_637573746f6d6572` JOIN `tpcds_bin_partitioned_orc_200`.`customer_demographics`  `C_637573746f6d65725f64656d6f6772617068696373` ON (`C_637573746f6d6572`.`c_current_cdemo_sk` = `C_637573746f6d65725f64656d6f6772617068696373`.`cd_demo_sk`)  WHERE ((`C_637573746f6d65725f64656d6f6772617068696373`.`cd_marital_status` = 'M') AND ((`C_637573746f6d65725f64656d6f6772617068696373`.`cd_education_status` = 'Unknown') AND ((`C_637573746f6d6572`.`c_birth_country` = 'UNITED STATES') AND (`C_637573746f6d65725f64656d6f6772617068696373`.`cd_credit_rating` = 'High Risk'))))  GROUP BY `C_637573746f6d6572`.`c_customer_id`, `C_637573746f6d6572`.`c_email_address`, `C_637573746f6d65725f64656d6f6772617068696373`.`cd_gender`  HAVING ((SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) >= 5000) AND (SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) <= 10000))   
 

;



-- id: 481
use default
;



-- id: 482
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 483
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 490
SELECT `C_6974656d`.`i_manufact` AS `C_6e6f6e655f695f6d616e75666163745f6e6b`  FROM `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` WHERE (`C_6974656d`.`i_manufact` IS NULL )   LIMIT 1    expr = leaf-0
 expr = leaf-0, columns: ['null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'i_manufact', 'null', 'null', 'null', 'null', 'null', 'null', 'null']}

;



-- id: 491
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 584
SELECT `C_5` AS `none_i_manufact_nk_2`, COUNT(`C_53`.`C_6`) AS `C_636e745f696e765f7175616e746974795f6f6e5f68616e645f6f6b`  FROM  ( SELECT  `C_6974656d`.`i_item_sk` AS `C_43`, `C_696e76656e746f7279`.`inv_item_sk` AS `C_3`, `C_6974656d`.`i_manufact` AS `C_4`, `C_6974656d`.`i_manufact` AS `C_5`, `C_696e76656e746f7279`.`inv_quantity_on_hand` AS `C_6`  FROM `tpcds_bin_partitioned_orc_200`.`inventory`  `C_696e76656e746f7279` JOIN `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` ON (`C_696e76656e746f7279`.`inv_item_sk` = `C_6974656d`.`i_item_sk`)   )`C_53` JOIN (SELECT `item_1`.`i_manufact` AS `C_6e6f6e655f695f6d616e75666163745f6e6b`, COUNT(1) AS `C_787461626c6561755f6a6f696e5f666c6167`, COUNT(`inventory_0`.`inv_quantity_on_hand`) AS `C_785f5f616c6961735f5f30`  FROM `tpcds_bin_partitioned_orc_200`.`inventory`  `inventory_0` JOIN `tpcds_bin_partitioned_orc_200`.`item`  `item_1` ON (`inventory_0`.`inv_item_sk` = `item_1`.`i_item_sk`)  GROUP BY `item_1`.`i_manufact`   ORDER BY `C_785f5f616c6961735f5f30` DESC  LIMIT 10   )  `C_7430` ON (`C_53`.`C_4` = `C_6e6f6e655f695f6d616e75666163745f6e6b`)  GROUP BY `C_53`.`C_5`   
 

;



-- id: 585
use default
;



-- id: 586
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 587
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 594
SELECT `C_6974656d`.`i_manufact` AS `C_6e6f6e655f695f6d616e75666163745f6e6b`  FROM `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` WHERE (`C_6974656d`.`i_manufact` IS NULL )   LIMIT 1    expr = leaf-0
 expr = leaf-0, columns: ['null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'i_manufact', 'null', 'null', 'null', 'null', 'null', 'null', 'null']}

;



-- id: 595
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 688
SELECT `C_4` AS `none_i_manufact_nk_2`, COUNT(`C_53`.`C_5`) AS `C_636e745f696e765f7175616e746974795f6f6e5f68616e645f6f6b`  FROM  ( SELECT  `C_696e76656e746f7279`.`inv_item_sk` AS `C_43`, `C_6974656d`.`i_manufact` AS `C_3`, `C_6974656d`.`i_manufact` AS `C_4`, `C_696e76656e746f7279`.`inv_quantity_on_hand` AS `C_5`, `C_6974656d`.`i_item_sk` AS `C_6`  FROM `tpcds_bin_partitioned_orc_200`.`inventory`  `C_696e76656e746f7279` JOIN `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` ON (`C_696e76656e746f7279`.`inv_item_sk` = `C_6974656d`.`i_item_sk`)   )`C_53` JOIN (SELECT `item_1`.`i_manufact` AS `C_6e6f6e655f695f6d616e75666163745f6e6b`, COUNT(1) AS `C_787461626c6561755f6a6f696e5f666c6167`, COUNT(`inventory_0`.`inv_quantity_on_hand`) AS `C_785f5f616c6961735f5f30`  FROM `tpcds_bin_partitioned_orc_200`.`inventory`  `inventory_0` JOIN `tpcds_bin_partitioned_orc_200`.`item`  `item_1` ON (`inventory_0`.`inv_item_sk` = `item_1`.`i_item_sk`)  GROUP BY `item_1`.`i_manufact`   ORDER BY `C_785f5f616c6961735f5f30` DESC  LIMIT 10   )  `C_7430` ON (`C_53`.`C_3` = `C_6e6f6e655f695f6d616e75666163745f6e6b`)  GROUP BY `C_53`.`C_4`   
 

;



-- id: 689
use default
;



-- id: 690
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 697
SELECT `C_6974656d`.`i_brand` AS `C_6e6f6e655f695f6272616e645f6e6b`  FROM `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` WHERE (`C_6974656d`.`i_brand` IS NULL )   LIMIT 1    expr = leaf-0
 expr = leaf-0, columns: ['null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'i_brand', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null']}

;



-- id: 698
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 736
SELECT `item_0`.`i_brand` AS `none_i_brand_nk_1`, AVG(`item_0`.`i_current_price`) AS `C_6176675f695f63757272656e745f70726963655f6f6b`  FROM `tpcds_bin_partitioned_orc_200`.`item`  `item_0` JOIN (SELECT `C_6974656d`.`i_brand` AS `C_6e6f6e655f695f6272616e645f6e6b`, COUNT(1) AS `C_787461626c6561755f6a6f696e5f666c6167`, AVG(`C_6974656d`.`i_current_price`) AS `C_785f5f616c6961735f5f30`  FROM `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` GROUP BY `C_6974656d`.`i_brand`   ORDER BY `C_785f5f616c6961735f5f30` DESC  LIMIT 10   )  `C_7430` ON (`item_0`.`i_brand` = `C_6e6f6e655f695f6272616e645f6e6b`)  GROUP BY `item_0`.`i_brand`   
 

;



-- id: 737
use default
;



-- id: 738
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 745
SELECT `C_6974656d`.`i_brand` AS `C_6e6f6e655f695f6272616e645f6e6b`  FROM `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` WHERE (`C_6974656d`.`i_brand` IS NULL )   LIMIT 1    expr = leaf-0
 expr = leaf-0, columns: ['null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'i_brand', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null']}

;



-- id: 746
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 784
SELECT `item_0`.`i_brand` AS `none_i_brand_nk_1`, AVG(`item_0`.`i_current_price`) AS `C_6176675f695f63757272656e745f70726963655f6f6b`  FROM `tpcds_bin_partitioned_orc_200`.`item`  `item_0` JOIN (SELECT `C_6974656d`.`i_brand` AS `C_6e6f6e655f695f6272616e645f6e6b`, COUNT(1) AS `C_787461626c6561755f6a6f696e5f666c6167`, AVG(`C_6974656d`.`i_current_price`) AS `C_785f5f616c6961735f5f30`  FROM `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` GROUP BY `C_6974656d`.`i_brand`   ORDER BY `C_785f5f616c6961735f5f30` DESC  LIMIT 10   )  `C_7430` ON (`item_0`.`i_brand` = `C_6e6f6e655f695f6272616e645f6e6b`)  GROUP BY `item_0`.`i_brand`   
 

;



-- id: 785
use default
;



-- id: 786
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 787
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 794
SELECT `C_6974656d`.`i_manufact` AS `C_6e6f6e655f695f6d616e75666163745f6e6b`  FROM `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` WHERE (`C_6974656d`.`i_manufact` IS NULL )   LIMIT 1    expr = leaf-0
 expr = leaf-0, columns: ['null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'i_manufact', 'null', 'null', 'null', 'null', 'null', 'null', 'null']}

;



-- id: 795
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 888
SELECT `C_5` AS `C_6e6f6e655f695f63617465676f72795f6e6b`, `C_6` AS `none_i_manufact_nk_2`, SUM(`C_53`.`C_7`) AS `C_73756d5f77735f6e65745f706169645f6f6b`  FROM  ( SELECT  `C_7765625f73616c6573`.`ws_item_sk` AS `C_43`, `C_6974656d`.`i_item_sk` AS `C_3`, `C_6974656d`.`i_manufact` AS `C_4`, `C_6974656d`.`i_category` AS `C_5`, `C_6974656d`.`i_manufact` AS `C_6`, `C_7765625f73616c6573`.`ws_net_paid` AS `C_7`  FROM `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` JOIN `tpcds_bin_partitioned_orc_200`.`web_sales`  `C_7765625f73616c6573` ON (`C_6974656d`.`i_item_sk` = `C_7765625f73616c6573`.`ws_item_sk`)   )`C_53` JOIN (SELECT `item_0`.`i_manufact` AS `C_6e6f6e655f695f6d616e75666163745f6e6b`, COUNT(1) AS `C_787461626c6561755f6a6f696e5f666c6167`, SUM(`web_sales_1`.`ws_net_paid`) AS `C_785f5f616c6961735f5f30`  FROM `tpcds_bin_partitioned_orc_200`.`item`  `item_0` JOIN `tpcds_bin_partitioned_orc_200`.`web_sales`  `web_sales_1` ON (`item_0`.`i_item_sk` = `web_sales_1`.`ws_item_sk`)  GROUP BY `item_0`.`i_manufact`   ORDER BY `C_785f5f616c6961735f5f30` DESC  LIMIT 10   )  `C_7430` ON (`C_53`.`C_4` = `C_6e6f6e655f695f6d616e75666163745f6e6b`)  GROUP BY `C_53`.`C_5`, `C_53`.`C_6`   
 

;



-- id: 889
use default
;



-- id: 890
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 891
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 924
SELECT `C_637573746f6d6572`.`c_customer_id` AS `C_6e6f6e655f635f637573746f6d65725f69645f6e6b`, `C_637573746f6d6572`.`c_email_address` AS `C_6e6f6e655f635f656d61696c5f616464726573735f6e6b`, `C_637573746f6d65725f64656d6f6772617068696373`.`cd_gender` AS `C_6e6f6e655f63645f67656e6465725f6e6b`, SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) AS `C_73756d5f63645f70757263686173655f657374696d6174655f6f6b`  FROM `tpcds_bin_partitioned_orc_200`.`customer`  `C_637573746f6d6572` JOIN `tpcds_bin_partitioned_orc_200`.`customer_demographics`  `C_637573746f6d65725f64656d6f6772617068696373` ON (`C_637573746f6d6572`.`c_current_cdemo_sk` = `C_637573746f6d65725f64656d6f6772617068696373`.`cd_demo_sk`)  WHERE ((`C_637573746f6d65725f64656d6f6772617068696373`.`cd_marital_status` = 'M') AND ((`C_637573746f6d65725f64656d6f6772617068696373`.`cd_education_status` = 'Unknown') AND ((`C_637573746f6d6572`.`c_birth_country` = 'UNITED STATES') AND (`C_637573746f6d65725f64656d6f6772617068696373`.`cd_credit_rating` = 'High Risk'))))  GROUP BY `C_637573746f6d6572`.`c_customer_id`, `C_637573746f6d6572`.`c_email_address`, `C_637573746f6d65725f64656d6f6772617068696373`.`cd_gender`  HAVING ((SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) >= 5000) AND (SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) <= 10000))   
 

;



-- id: 925
use default
;



-- id: 926
SHOW SCHEMAS LIKE '*'
;



-- id: 927
SHOW TABLES IN `tpcds_bin_partitioned_orc_200` LIKE '*'
;



-- id: 928
SHOW TABLES IN `tpcds_bin_partitioned_orc_200` LIKE '*'
;



-- id: 929
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 930
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 931
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 943
SELECT AVG(CAST(1 AS DOUBLE)) AS `avg_number_of_records_ok` FROM `tpcds_bin_partitioned_orc_200`.`inventory` `inventory`
 GROUP BY 1
 HAVING (COUNT(1) > 0)
 
 

;



-- id: 944
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 945
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 946
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 947
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 976
SELECT `C_6974656d`.`i_manufact_id` AS `C_6e6f6e655f695f6d616e75666163745f69645f6f6b`, SUM(`C_696e76656e746f7279`.`inv_quantity_on_hand`) AS `C_73756d5f696e765f7175616e746974795f6f6e5f68616e645f6f6b`  FROM `tpcds_bin_partitioned_orc_200`.`inventory`  `C_696e76656e746f7279` JOIN `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` ON (`C_696e76656e746f7279`.`inv_item_sk` = `C_6974656d`.`i_item_sk`)  GROUP BY `C_6974656d`.`i_manufact_id`   
 

;



-- id: 977
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 994
SELECT `C_6974656d`.`i_manufact` AS `C_6e6f6e655f695f6d616e75666163745f6e6b`  FROM `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` GROUP BY `C_6974656d`.`i_manufact`   ORDER BY `C_6e6f6e655f695f6d616e75666163745f6e6b` ASC  
 

;



-- id: 995
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1088
SELECT SUM(`inventory`.`inv_quantity_on_hand`) AS `sum_inv_quantity_on_hand_ok` FROM `tpcds_bin_partitioned_orc_200`.`inventory` `inventory`
   JOIN `tpcds_bin_partitioned_orc_200`.`item` `item` ON (`inventory`.`inv_item_sk` = `item`.`i_item_sk`)
   JOIN (
   SELECT `item`.`i_manufact` AS `none_i_manufact_nk`,
     COUNT(1) AS `xtableau_join_flag`,
     COUNT(`inventory`.`inv_quantity_on_hand`) AS `x__alias__0`
   FROM `tpcds_bin_partitioned_orc_200`.`inventory` `inventory`
     JOIN `tpcds_bin_partitioned_orc_200`.`item` `item` ON (`inventory`.`inv_item_sk` = `item`.`i_item_sk`)
   GROUP BY `item`.`i_manufact`
   ORDER BY `x__alias__0` DESC
   LIMIT 10
 ) `t0` ON (`item`.`i_manufact` = `t0`.`none_i_manufact_nk`)
 GROUP BY 1
 HAVING (COUNT(1) > 0)
 
 

;



-- id: 1089
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1182
SELECT `C_5` AS `none_i_manufact_nk_2`, SUM(`C_53`.`C_6`) AS `C_73756d5f696e765f7175616e746974795f6f6e5f68616e645f6f6b`  FROM  ( SELECT  `C_696e76656e746f7279`.`inv_item_sk` AS `C_43`, `C_6974656d`.`i_item_sk` AS `C_3`, `C_6974656d`.`i_manufact` AS `C_4`, `C_6974656d`.`i_manufact` AS `C_5`, `C_696e76656e746f7279`.`inv_quantity_on_hand` AS `C_6`  FROM `tpcds_bin_partitioned_orc_200`.`inventory`  `C_696e76656e746f7279` JOIN `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` ON (`C_696e76656e746f7279`.`inv_item_sk` = `C_6974656d`.`i_item_sk`)   )`C_53` JOIN (SELECT `item_1`.`i_manufact` AS `C_6e6f6e655f695f6d616e75666163745f6e6b`, COUNT(1) AS `C_787461626c6561755f6a6f696e5f666c6167`, COUNT(`inventory_0`.`inv_quantity_on_hand`) AS `C_785f5f616c6961735f5f30`  FROM `tpcds_bin_partitioned_orc_200`.`inventory`  `inventory_0` JOIN `tpcds_bin_partitioned_orc_200`.`item`  `item_1` ON (`inventory_0`.`inv_item_sk` = `item_1`.`i_item_sk`)  GROUP BY `item_1`.`i_manufact`   ORDER BY `C_785f5f616c6961735f5f30` DESC  LIMIT 10   )  `C_7430` ON (`C_53`.`C_4` = `C_6e6f6e655f695f6d616e75666163745f6e6b`)  GROUP BY `C_53`.`C_5`   
 

;



-- id: 1183
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1200
SELECT `C_6974656d`.`i_product_name` AS `C_6e6f6e655f695f70726f647563745f6e616d655f6e6b`  FROM `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` GROUP BY `C_6974656d`.`i_product_name`   ORDER BY `C_6e6f6e655f695f70726f647563745f6e616d655f6e6b` ASC  
 

;



-- id: 1201
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1294
SELECT `C_5` AS `none_i_product_name_nk_2`, SUM(`C_53`.`C_6`) AS `C_73756d5f696e765f7175616e746974795f6f6e5f68616e645f6f6b`  FROM  ( SELECT  `C_6974656d`.`i_item_sk` AS `C_43`, `C_696e76656e746f7279`.`inv_item_sk` AS `C_3`, `C_6974656d`.`i_product_name` AS `C_4`, `C_6974656d`.`i_product_name` AS `C_5`, `C_696e76656e746f7279`.`inv_quantity_on_hand` AS `C_6`  FROM `tpcds_bin_partitioned_orc_200`.`inventory`  `C_696e76656e746f7279` JOIN `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` ON (`C_696e76656e746f7279`.`inv_item_sk` = `C_6974656d`.`i_item_sk`)   )`C_53` JOIN (SELECT `item_1`.`i_product_name` AS `C_6e6f6e655f695f70726f647563745f6e616d655f6e6b`, COUNT(1) AS `C_787461626c6561755f6a6f696e5f666c6167`, COUNT(`inventory_0`.`inv_quantity_on_hand`) AS `C_785f5f616c6961735f5f30`  FROM `tpcds_bin_partitioned_orc_200`.`inventory`  `inventory_0` JOIN `tpcds_bin_partitioned_orc_200`.`item`  `item_1` ON (`inventory_0`.`inv_item_sk` = `item_1`.`i_item_sk`)  GROUP BY `item_1`.`i_product_name`   ORDER BY `C_785f5f616c6961735f5f30` DESC  LIMIT 10   )  `C_7430` ON (`C_53`.`C_4` = `C_6e6f6e655f695f70726f647563745f6e616d655f6e6b`)  GROUP BY `C_53`.`C_5`   
 

;



-- id: 1587
show databases like '*' 
 SELECT `C_5` AS `none_i_product_name_nk_2`, SUM(`C_53`.`C_6`) AS `C_73756d5f696e765f7175616e746974795f6f6e5f68616e645f6f6b` FROM ( SELECT `C_6974656d`.`i_item_sk` AS `C_43`, `C_696e76656e746f7279`.`inv_item_sk` AS `C_3`, `C_6974656d`.`i_product_name` AS `C_4`, `C_6974656d`.`i_product_name` AS `C_5`, `C_696e76656e746f7279`.`inv_quantity_on_hand` AS `C_6` FROM `tpcds_bin_partitioned_orc_200`.`inventory` `C_696e76656e746f7279` JOIN `tpcds_bin_partitioned_orc_200`.`item` `C_6974656d` ON (`C_696e76656e746f7279`.`inv_item_sk` = `C_6974656d`.`i_item_sk`) )`C_53` JOIN (SELECT `item_1`.`i_product_name` AS `C_6e6f6e655f695f70726f647563745f6e616d655f6e6b`, COUNT(1) AS `C_787461626c6561755f6a6f696e5f666c6167`, COUNT(`inventory_0`.`inv_quantity_on_hand`) AS `C_785f5f616c6961735f5f30` FROM `tpcds_bin_partitioned_orc_200`.`inventory` `inventory_0` JOIN `tpcds_bin_partitioned_orc_200`.`item` `item_1` ON (`inventory_0`.`inv_item_sk` = `item_1`.`i_item_sk`) GROUP BY `item_1`.`i_product_name` ORDER BY `C_785f5f616c6961735f5f30` DESC LIMIT 10 ) `C_7430` ON (`C_53`.`C_4` = `C_6e6f6e655f695f70726f647563745f6e616d655f6e6b`) GROUP BY `C_53`.`C_5`
 
 SELECT `C_5` AS `none_i_product_name_nk_2`, SUM(`C_53`.`C_6`) AS `C_73756d5f696e765f7175616e746974795f6f6e5f68616e645f6f6b` FROM ( SELECT `C_6974656d`.`i_item_sk` AS `C_43`, `C_696e76656e746f7279`.`inv_item_sk` AS `C_3`, `C_6974656d`.`i_product_name` AS `C_4`, `C_6974656d`.`i_product_name` AS `C_5`, `C_696e76656e746f7279`.`inv_quantity_on_hand` AS `C_6` FROM `tpcds_bin_partitioned_orc_200`.`inventory` `C_696e76656e746f7279` JOIN `tpcds_bin_partitioned_orc_200`.`item` `C_6974656d` ON (`C_696e76656e746f7279`.`inv_item_sk` = `C_6974656d`.`i_item_sk`) )`C_53` JOIN (SELECT `item_1`.`i_product_name` AS `C_6e6f6e655f695f70726f647563745f6e616d655f6e6b`, COUNT(1) AS `C_787461626c6561755f6a6f696e5f666c6167`, COUNT(`inventory_0`.`inv_quantity_on_hand`) AS `C_785f5f616c6961735f5f30` FROM `tpcds_bin_partitioned_orc_200`.`inventory` `inventory_0` JOIN `tpcds_bin_partitioned_orc_200`.`item` `item_1` ON (`inventory_0`.`inv_item_sk` = `item_1`.`i_item_sk`) GROUP BY `item_1`.`i_product_name` ORDER BY `C_785f5f616c6961735f5f30` DESC LIMIT 10 ) `C_7430` ON (`C_53`.`C_4` = `C_6e6f6e655f695f70726f647563745f6e616d655f6e6b`) GROUP BY `C_53`.`C_5`
 
 	at org.apache.hadoop.mapred.split.TezMapredSplitsGrouper.getGroupedSplits(TezMapredSplitsGrouper.java:127)
 	at org.apache.hadoop.hive.ql.exec.tez.SplitGrouper.group(SplitGrouper.java:75)
 	at org.apache.hadoop.hive.ql.exec.tez.HiveSplitGenerator.generateGroupedSplits(HiveSplitGenerator.java:188)
 	at org.apache.hadoop.hive.ql.exec.tez.HiveSplitGenerator.generateGroupedSplits(HiveSplitGenerator.java:163)
 	at org.apache.hadoop.hive.ql.exec.tez.HiveSplitGenerator.initialize(HiveSplitGenerator.java:133)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable$1.run(RootInputInitializerManager.java:245)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable$1.run(RootInputInitializerManager.java:239)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable.call(RootInputInitializerManager.java:239)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable.call(RootInputInitializerManager.java:226)
 	at java.util.concurrent.FutureTask.run(FutureTask.java:262)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 ]
 	at org.apache.hadoop.mapred.split.TezMapredSplitsGrouper.getGroupedSplits(TezMapredSplitsGrouper.java:127)
 	at org.apache.hadoop.hive.ql.exec.tez.SplitGrouper.group(SplitGrouper.java:75)
 	at org.apache.hadoop.hive.ql.exec.tez.HiveSplitGenerator.generateGroupedSplits(HiveSplitGenerator.java:188)
 	at org.apache.hadoop.hive.ql.exec.tez.HiveSplitGenerator.generateGroupedSplits(HiveSplitGenerator.java:163)
 	at org.apache.hadoop.hive.ql.exec.tez.HiveSplitGenerator.initialize(HiveSplitGenerator.java:133)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable$1.run(RootInputInitializerManager.java:245)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable$1.run(RootInputInitializerManager.java:239)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable.call(RootInputInitializerManager.java:239)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable.call(RootInputInitializerManager.java:226)
 	at java.util.concurrent.FutureTask.run(FutureTask.java:262)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 ]
 org.apache.hive.service.cli.HiveSQLException: Error while processing statement: FAILED: Execution Error, return code 2 from org.apache.hadoop.hive.ql.exec.tez.TezTask
 	at org.apache.hive.service.cli.operation.Operation.toSQLException(Operation.java:314)
 	at org.apache.hive.service.cli.operation.SQLOperation.runQuery(SQLOperation.java:155)
 	at org.apache.hive.service.cli.operation.SQLOperation.access$100(SQLOperation.java:70)
 	at org.apache.hive.service.cli.operation.SQLOperation$1$1.run(SQLOperation.java:205)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.hadoop.hive.shims.HadoopShimsSecure.doAs(HadoopShimsSecure.java:536)
 	at org.apache.hive.service.cli.operation.SQLOperation$1.run(SQLOperation.java:217)
 	at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:471)
 	at java.util.concurrent.FutureTask.run(FutureTask.java:262)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 
 SELECT `C_5` AS `none_i_product_name_nk_2`, SUM(`C_53`.`C_6`) AS `C_73756d5f696e765f7175616e746974795f6f6e5f68616e645f6f6b` FROM ( SELECT `C_6974656d`.`i_item_sk` AS `C_43`, `C_696e76656e746f7279`.`inv_item_sk` AS `C_3`, `C_6974656d`.`i_product_name` AS `C_4`, `C_6974656d`.`i_product_name` AS `C_5`, `C_696e76656e746f7279`.`inv_quantity_on_hand` AS `C_6` FROM `tpcds_bin_partitioned_orc_200`.`inventory` `C_696e76656e746f7279` JOIN `tpcds_bin_partitioned_orc_200`.`item` `C_6974656d` ON (`C_696e76656e746f7279`.`inv_item_sk` = `C_6974656d`.`i_item_sk`) )`C_53` JOIN (SELECT `item_1`.`i_product_name` AS `C_6e6f6e655f695f70726f647563745f6e616d655f6e6b`, COUNT(1) AS `C_787461626c6561755f6a6f696e5f666c6167`, COUNT(`inventory_0`.`inv_quantity_on_hand`) AS `C_785f5f616c6961735f5f30` FROM `tpcds_bin_partitioned_orc_200`.`inventory` `inventory_0` JOIN `tpcds_bin_partitioned_orc_200`.`item` `item_1` ON (`inventory_0`.`inv_item_sk` = `item_1`.`i_item_sk`) GROUP BY `item_1`.`i_product_name` ORDER BY `C_785f5f616c6961735f5f30` DESC LIMIT 10 ) `C_7430` ON (`C_53`.`C_4` = `C_6e6f6e655f695f70726f647563745f6e616d655f6e6b`) GROUP BY `C_53`.`C_5`
 
 SELECT `C_5` AS `none_i_product_name_nk_2`, SUM(`C_53`.`C_6`) AS `C_73756d5f696e765f7175616e746974795f6f6e5f68616e645f6f6b` FROM ( SELECT `C_6974656d`.`i_item_sk` AS `C_43`, `C_696e76656e746f7279`.`inv_item_sk` AS `C_3`, `C_6974656d`.`i_product_name` AS `C_4`, `C_6974656d`.`i_product_name` AS `C_5`, `C_696e76656e746f7279`.`inv_quantity_on_hand` AS `C_6` FROM `tpcds_bin_partitioned_orc_200`.`inventory` `C_696e76656e746f7279` JOIN `tpcds_bin_partitioned_orc_200`.`item` `C_6974656d` ON (`C_696e76656e746f7279`.`inv_item_sk` = `C_6974656d`.`i_item_sk`) )`C_53` JOIN (SELECT `item_1`.`i_product_name` AS `C_6e6f6e655f695f70726f647563745f6e616d655f6e6b`, COUNT(1) AS `C_787461626c6561755f6a6f696e5f666c6167`, COUNT(`inventory_0`.`inv_quantity_on_hand`) AS `C_785f5f616c6961735f5f30` FROM `tpcds_bin_partitioned_orc_200`.`inventory` `inventory_0` JOIN `tpcds_bin_partitioned_orc_200`.`item` `item_1` ON (`inventory_0`.`inv_item_sk` = `item_1`.`i_item_sk`) GROUP BY `item_1`.`i_product_name` ORDER BY `C_785f5f616c6961735f5f30` DESC LIMIT 10 ) `C_7430` ON (`C_53`.`C_4` = `C_6e6f6e655f695f70726f647563745f6e616d655f6e6b`) GROUP BY `C_53`.`C_5`
 
 	at org.apache.hadoop.mapred.split.TezMapredSplitsGrouper.getGroupedSplits(TezMapredSplitsGrouper.java:127)
 	at org.apache.hadoop.hive.ql.exec.tez.SplitGrouper.group(SplitGrouper.java:75)
 	at org.apache.hadoop.hive.ql.exec.tez.HiveSplitGenerator.generateGroupedSplits(HiveSplitGenerator.java:188)
 	at org.apache.hadoop.hive.ql.exec.tez.HiveSplitGenerator.generateGroupedSplits(HiveSplitGenerator.java:163)
 	at org.apache.hadoop.hive.ql.exec.tez.HiveSplitGenerator.initialize(HiveSplitGenerator.java:133)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable$1.run(RootInputInitializerManager.java:245)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable$1.run(RootInputInitializerManager.java:239)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable.call(RootInputInitializerManager.java:239)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable.call(RootInputInitializerManager.java:226)
 	at java.util.concurrent.FutureTask.run(FutureTask.java:262)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 ]
 	at org.apache.hadoop.mapred.split.TezMapredSplitsGrouper.getGroupedSplits(TezMapredSplitsGrouper.java:127)
 	at org.apache.hadoop.hive.ql.exec.tez.SplitGrouper.group(SplitGrouper.java:75)
 	at org.apache.hadoop.hive.ql.exec.tez.HiveSplitGenerator.generateGroupedSplits(HiveSplitGenerator.java:188)
 	at org.apache.hadoop.hive.ql.exec.tez.HiveSplitGenerator.generateGroupedSplits(HiveSplitGenerator.java:163)
 	at org.apache.hadoop.hive.ql.exec.tez.HiveSplitGenerator.initialize(HiveSplitGenerator.java:133)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable$1.run(RootInputInitializerManager.java:245)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable$1.run(RootInputInitializerManager.java:239)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable.call(RootInputInitializerManager.java:239)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable.call(RootInputInitializerManager.java:226)
 	at java.util.concurrent.FutureTask.run(FutureTask.java:262)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 ]
 org.apache.hive.service.cli.HiveSQLException: Error while processing statement: FAILED: Execution Error, return code 2 from org.apache.hadoop.hive.ql.exec.tez.TezTask
 	at org.apache.hive.service.cli.operation.Operation.toSQLException(Operation.java:314)
 	at org.apache.hive.service.cli.operation.SQLOperation.runQuery(SQLOperation.java:155)
 	at org.apache.hive.service.cli.operation.SQLOperation.access$100(SQLOperation.java:70)
 	at org.apache.hive.service.cli.operation.SQLOperation$1$1.run(SQLOperation.java:205)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.hadoop.hive.shims.HadoopShimsSecure.doAs(HadoopShimsSecure.java:536)
 	at org.apache.hive.service.cli.operation.SQLOperation$1.run(SQLOperation.java:217)
 	at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:471)
 	at java.util.concurrent.FutureTask.run(FutureTask.java:262)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 
 SELECT `C_5` AS `none_i_product_name_nk_2`, SUM(`C_53`.`C_6`) AS `C_73756d5f696e765f7175616e746974795f6f6e5f68616e645f6f6b` FROM ( SELECT `C_6974656d`.`i_item_sk` AS `C_43`, `C_696e76656e746f7279`.`inv_item_sk` AS `C_3`, `C_6974656d`.`i_product_name` AS `C_4`, `C_6974656d`.`i_product_name` AS `C_5`, `C_696e76656e746f7279`.`inv_quantity_on_hand` AS `C_6` FROM `tpcds_bin_partitioned_orc_200`.`inventory` `C_696e76656e746f7279` JOIN `tpcds_bin_partitioned_orc_200`.`item` `C_6974656d` ON (`C_696e76656e746f7279`.`inv_item_sk` = `C_6974656d`.`i_item_sk`) )`C_53` JOIN (SELECT `item_1`.`i_product_name` AS `C_6e6f6e655f695f70726f647563745f6e616d655f6e6b`, COUNT(1) AS `C_787461626c6561755f6a6f696e5f666c6167`, COUNT(`inventory_0`.`inv_quantity_on_hand`) AS `C_785f5f616c6961735f5f30` FROM `tpcds_bin_partitioned_orc_200`.`inventory` `inventory_0` JOIN `tpcds_bin_partitioned_orc_200`.`item` `item_1` ON (`inventory_0`.`inv_item_sk` = `item_1`.`i_item_sk`) GROUP BY `item_1`.`i_product_name` ORDER BY `C_785f5f616c6961735f5f30` DESC LIMIT 10 ) `C_7430` ON (`C_53`.`C_4` = `C_6e6f6e655f695f70726f647563745f6e616d655f6e6b`) GROUP BY `C_53`.`C_5`
 
 SELECT `C_5` AS `none_i_product_name_nk_2`, SUM(`C_53`.`C_6`) AS `C_73756d5f696e765f7175616e746974795f6f6e5f68616e645f6f6b` FROM ( SELECT `C_6974656d`.`i_item_sk` AS `C_43`, `C_696e76656e746f7279`.`inv_item_sk` AS `C_3`, `C_6974656d`.`i_product_name` AS `C_4`, `C_6974656d`.`i_product_name` AS `C_5`, `C_696e76656e746f7279`.`inv_quantity_on_hand` AS `C_6` FROM `tpcds_bin_partitioned_orc_200`.`inventory` `C_696e76656e746f7279` JOIN `tpcds_bin_partitioned_orc_200`.`item` `C_6974656d` ON (`C_696e76656e746f7279`.`inv_item_sk` = `C_6974656d`.`i_item_sk`) )`C_53` JOIN (SELECT `item_1`.`i_product_name` AS `C_6e6f6e655f695f70726f647563745f6e616d655f6e6b`, COUNT(1) AS `C_787461626c6561755f6a6f696e5f666c6167`, COUNT(`inventory_0`.`inv_quantity_on_hand`) AS `C_785f5f616c6961735f5f30` FROM `tpcds_bin_partitioned_orc_200`.`inventory` `inventory_0` JOIN `tpcds_bin_partitioned_orc_200`.`item` `item_1` ON (`inventory_0`.`inv_item_sk` = `item_1`.`i_item_sk`) GROUP BY `item_1`.`i_product_name` ORDER BY `C_785f5f616c6961735f5f30` DESC LIMIT 10 ) `C_7430` ON (`C_53`.`C_4` = `C_6e6f6e655f695f70726f647563745f6e616d655f6e6b`) GROUP BY `C_53`.`C_5`
 
 	at org.apache.hadoop.mapred.split.TezMapredSplitsGrouper.getGroupedSplits(TezMapredSplitsGrouper.java:127)
 	at org.apache.hadoop.hive.ql.exec.tez.SplitGrouper.group(SplitGrouper.java:75)
 	at org.apache.hadoop.hive.ql.exec.tez.HiveSplitGenerator.generateGroupedSplits(HiveSplitGenerator.java:188)
 	at org.apache.hadoop.hive.ql.exec.tez.HiveSplitGenerator.generateGroupedSplits(HiveSplitGenerator.java:163)
 	at org.apache.hadoop.hive.ql.exec.tez.HiveSplitGenerator.initialize(HiveSplitGenerator.java:133)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable$1.run(RootInputInitializerManager.java:245)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable$1.run(RootInputInitializerManager.java:239)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable.call(RootInputInitializerManager.java:239)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable.call(RootInputInitializerManager.java:226)
 	at java.util.concurrent.FutureTask.run(FutureTask.java:262)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 ]
 	at org.apache.hadoop.mapred.split.TezMapredSplitsGrouper.getGroupedSplits(TezMapredSplitsGrouper.java:127)
 	at org.apache.hadoop.hive.ql.exec.tez.SplitGrouper.group(SplitGrouper.java:75)
 	at org.apache.hadoop.hive.ql.exec.tez.HiveSplitGenerator.generateGroupedSplits(HiveSplitGenerator.java:188)
 	at org.apache.hadoop.hive.ql.exec.tez.HiveSplitGenerator.generateGroupedSplits(HiveSplitGenerator.java:163)
 	at org.apache.hadoop.hive.ql.exec.tez.HiveSplitGenerator.initialize(HiveSplitGenerator.java:133)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable$1.run(RootInputInitializerManager.java:245)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable$1.run(RootInputInitializerManager.java:239)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable.call(RootInputInitializerManager.java:239)
 	at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable.call(RootInputInitializerManager.java:226)
 	at java.util.concurrent.FutureTask.run(FutureTask.java:262)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 ]
 org.apache.hive.service.cli.HiveSQLException: Error while processing statement: FAILED: Execution Error, return code 2 from org.apache.hadoop.hive.ql.exec.tez.TezTask
 	at org.apache.hive.service.cli.operation.Operation.toSQLException(Operation.java:314)
 	at org.apache.hive.service.cli.operation.SQLOperation.runQuery(SQLOperation.java:155)
 	at org.apache.hive.service.cli.operation.SQLOperation.access$100(SQLOperation.java:70)
 	at org.apache.hive.service.cli.operation.SQLOperation$1$1.run(SQLOperation.java:205)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.hadoop.hive.shims.HadoopShimsSecure.doAs(HadoopShimsSecure.java:536)
 	at org.apache.hive.service.cli.operation.SQLOperation$1.run(SQLOperation.java:217)
 	at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:471)
 	at java.util.concurrent.FutureTask.run(FutureTask.java:262)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 
 select count(*) from store_sales
 
 select count(*) from store_sales

;



-- id: 1588
SHOW TABLES IN `tpcds_bin_partitioned_orc_200` LIKE '*'
;



-- id: 1589
SHOW TABLES IN `tpcds_bin_partitioned_orc_200` LIKE '*'
;



-- id: 1590
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1591
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1607
SELECT SUM(1) AS `sum_number_of_records_ok` FROM `tpcds_bin_partitioned_orc_200`.`customer_demographics` `customer_demographics`
 GROUP BY 1
 HAVING (COUNT(1) > 0)
 
 

;



-- id: 1608
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1621
SELECT `C_637573746f6d65725f64656d6f6772617068696373`.`cd_gender` AS `C_6e6f6e655f63645f67656e6465725f6e6b`, SUM(1) AS `C_73756d5f6e756d6265725f6f665f7265636f7264735f6f6b`  FROM `tpcds_bin_partitioned_orc_200`.`customer_demographics`  `C_637573746f6d65725f64656d6f6772617068696373` GROUP BY `C_637573746f6d65725f64656d6f6772617068696373`.`cd_gender`   
 

;



-- id: 1622
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1635
SELECT `C_637573746f6d65725f64656d6f6772617068696373`.`cd_education_status` AS `C_6e6f6e655f63645f656475636174696f6e5f7374617475735f6e6b`, `C_637573746f6d65725f64656d6f6772617068696373`.`cd_gender` AS `C_6e6f6e655f63645f67656e6465725f6e6b`, SUM(1) AS `C_73756d5f6e756d6265725f6f665f7265636f7264735f6f6b`  FROM `tpcds_bin_partitioned_orc_200`.`customer_demographics`  `C_637573746f6d65725f64656d6f6772617068696373` GROUP BY `C_637573746f6d65725f64656d6f6772617068696373`.`cd_education_status`, `C_637573746f6d65725f64656d6f6772617068696373`.`cd_gender`   
 

;



-- id: 1636
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1637
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1653
SELECT SUM(1) AS `sum_number_of_records_ok` FROM `tpcds_bin_partitioned_orc_200`.`web_sales` `web_sales`
 GROUP BY 1
 HAVING (COUNT(1) > 0)
 
 

;



-- id: 1654
SHOW TABLES IN `tpcds_bin_partitioned_orc_200` LIKE '*'
;



-- id: 1655
SHOW TABLES IN `tpcds_bin_partitioned_orc_200` LIKE '*'
;



-- id: 1656
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1672
SELECT SUM(1) AS `sum_number_of_records_ok` FROM `tpcds_bin_partitioned_orc_200`.`inventory` `inventory`
 GROUP BY 1
 HAVING (COUNT(1) > 0)
 
 

;



-- id: 1673
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1705
SELECT SUM(1) AS `sum_number_of_records_ok` FROM `tpcds_bin_partitioned_orc_200`.`inventory` `inventory`
   JOIN `tpcds_bin_partitioned_orc_200`.`item` `item` ON (`inventory`.`inv_item_sk` = `item`.`i_item_sk`)
 GROUP BY 1
 HAVING (COUNT(1) > 0)
 
 

;



-- id: 1706
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1707
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1723
SELECT SUM(1) AS `sum_number_of_records_ok` FROM `tpcds_bin_partitioned_orc_200`.`customer_address` `customer_address`
 GROUP BY 1
 HAVING (COUNT(1) > 0)
 
 

;



-- id: 1724
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1725
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1741
SELECT SUM(1) AS `sum_number_of_records_ok` FROM `tpcds_bin_partitioned_orc_200`.`customer` `customer`
 GROUP BY 1
 HAVING (COUNT(1) > 0)
 
 

;



-- id: 1742
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1758
SELECT MIN(`customer`.`c_birth_year`) AS `temp_none_c_birth_year_qk_lower__290714814__0_`,   MAX(`customer`.`c_birth_year`) AS `temp_none_c_birth_year_qk_upper__290714814__0_`
 FROM `tpcds_bin_partitioned_orc_200`.`customer` `customer`
 GROUP BY 1
 HAVING (COUNT(1) > 0)
 
 

;



-- id: 1759
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1778
SELECT SUM(1) AS `sum_number_of_records_ok` FROM `tpcds_bin_partitioned_orc_200`.`customer` `customer`
 WHERE ((`customer`.`c_birth_year` >= 1980) AND (`customer`.`c_birth_year` <= 1992))
 GROUP BY 1
 HAVING (COUNT(1) > 0)
 
 

;



-- id: 1779
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1795
SELECT `C_637573746f6d6572`.`c_birth_country` AS `C_6e6f6e655f635f62697274685f636f756e7472795f6e6b`, SUM(1) AS `C_73756d5f6e756d6265725f6f665f7265636f7264735f6f6b`  FROM `tpcds_bin_partitioned_orc_200`.`customer`  `C_637573746f6d6572` WHERE ((`C_637573746f6d6572`.`c_birth_year` >= 1980) AND (`C_637573746f6d6572`.`c_birth_year` <= 1992))  GROUP BY `C_637573746f6d6572`.`c_birth_country`   
 

;



-- id: 1796
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1797
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1813
SELECT SUM(1) AS `sum_number_of_records_ok` FROM `tpcds_bin_partitioned_orc_200`.`warehouse` `warehouse`
 GROUP BY 1
 HAVING (COUNT(1) > 0)
 
 

;



-- id: 1814
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1830
SELECT SUM(1) AS `sum_number_of_records_ok` FROM `tpcds_bin_partitioned_orc_200`.`item` `item`
 GROUP BY 1
 HAVING (COUNT(1) > 0)
 
 

;



-- id: 1831
SHOW TABLES IN `tpcds_bin_partitioned_orc_200` LIKE '*'
;



-- id: 1832
SHOW TABLES IN `tpcds_bin_partitioned_orc_200` LIKE '*'
;



-- id: 1833
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1834
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1850
SELECT SUM(1) AS `sum_number_of_records_ok` FROM `tpcds_bin_partitioned_orc_200`.`catalog_returns` `catalog_returns`
 GROUP BY 1
 HAVING (COUNT(1) > 0)
 
 

;



-- id: 1851
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1863
SELECT AVG(`catalog_returns`.`cr_refunded_cash`) AS `avg_cr_refunded_cash_ok` FROM `tpcds_bin_partitioned_orc_200`.`catalog_returns` `catalog_returns`
 GROUP BY 1
 HAVING (COUNT(1) > 0)
 
 

;



-- id: 1864
use default
;



-- id: 1865
SHOW SCHEMAS
;



-- id: 1870
show databases like '*'
;



-- id: 1871
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1872
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1905
SELECT `C_637573746f6d6572`.`c_customer_id` AS `C_6e6f6e655f635f637573746f6d65725f69645f6e6b`, `C_637573746f6d6572`.`c_email_address` AS `C_6e6f6e655f635f656d61696c5f616464726573735f6e6b`, `C_637573746f6d65725f64656d6f6772617068696373`.`cd_gender` AS `C_6e6f6e655f63645f67656e6465725f6e6b`, SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) AS `C_73756d5f63645f70757263686173655f657374696d6174655f6f6b`  FROM `tpcds_bin_partitioned_orc_200`.`customer`  `C_637573746f6d6572` JOIN `tpcds_bin_partitioned_orc_200`.`customer_demographics`  `C_637573746f6d65725f64656d6f6772617068696373` ON (`C_637573746f6d6572`.`c_current_cdemo_sk` = `C_637573746f6d65725f64656d6f6772617068696373`.`cd_demo_sk`)  WHERE ((`C_637573746f6d65725f64656d6f6772617068696373`.`cd_marital_status` = 'M') AND ((`C_637573746f6d65725f64656d6f6772617068696373`.`cd_education_status` = 'Unknown') AND ((`C_637573746f6d6572`.`c_birth_country` = 'UNITED STATES') AND (`C_637573746f6d65725f64656d6f6772617068696373`.`cd_credit_rating` = 'High Risk'))))  GROUP BY `C_637573746f6d6572`.`c_customer_id`, `C_637573746f6d6572`.`c_email_address`, `C_637573746f6d65725f64656d6f6772617068696373`.`cd_gender`  HAVING ((SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) >= 5000) AND (SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) <= 10000))   
 
 

;



-- id: 1906
use default
;



-- id: 1907
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1908
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1941
SELECT `C_637573746f6d6572`.`c_customer_id` AS `C_6e6f6e655f635f637573746f6d65725f69645f6e6b`, `C_637573746f6d6572`.`c_email_address` AS `C_6e6f6e655f635f656d61696c5f616464726573735f6e6b`, `C_637573746f6d65725f64656d6f6772617068696373`.`cd_gender` AS `C_6e6f6e655f63645f67656e6465725f6e6b`, SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) AS `C_73756d5f63645f70757263686173655f657374696d6174655f6f6b`  FROM `tpcds_bin_partitioned_orc_200`.`customer`  `C_637573746f6d6572` JOIN `tpcds_bin_partitioned_orc_200`.`customer_demographics`  `C_637573746f6d65725f64656d6f6772617068696373` ON (`C_637573746f6d6572`.`c_current_cdemo_sk` = `C_637573746f6d65725f64656d6f6772617068696373`.`cd_demo_sk`)  WHERE ((`C_637573746f6d65725f64656d6f6772617068696373`.`cd_marital_status` = 'M') AND ((`C_637573746f6d65725f64656d6f6772617068696373`.`cd_education_status` = 'Unknown') AND ((`C_637573746f6d6572`.`c_birth_country` = 'UNITED STATES') AND (`C_637573746f6d65725f64656d6f6772617068696373`.`cd_credit_rating` = 'High Risk'))))  GROUP BY `C_637573746f6d6572`.`c_customer_id`, `C_637573746f6d6572`.`c_email_address`, `C_637573746f6d65725f64656d6f6772617068696373`.`cd_gender`  HAVING ((SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) >= 5000) AND (SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) <= 10000))   
 

;



-- id: 1942
use default
;



-- id: 1943
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1944
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 1951
SELECT `C_6974656d`.`i_manufact` AS `C_6e6f6e655f695f6d616e75666163745f6e6b`  FROM `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` WHERE (`C_6974656d`.`i_manufact` IS NULL )   LIMIT 1    expr = leaf-0
 expr = leaf-0, columns: ['null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'i_manufact', 'null', 'null', 'null', 'null', 'null', 'null', 'null']}

;



-- id: 1952
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 2045
SELECT `C_5` AS `none_i_manufact_nk_2`, COUNT(`C_53`.`C_6`) AS `C_636e745f696e765f7175616e746974795f6f6e5f68616e645f6f6b`  FROM  ( SELECT  `C_696e76656e746f7279`.`inv_item_sk` AS `C_43`, `C_6974656d`.`i_item_sk` AS `C_3`, `C_6974656d`.`i_manufact` AS `C_4`, `C_6974656d`.`i_manufact` AS `C_5`, `C_696e76656e746f7279`.`inv_quantity_on_hand` AS `C_6`  FROM `tpcds_bin_partitioned_orc_200`.`inventory`  `C_696e76656e746f7279` JOIN `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` ON (`C_696e76656e746f7279`.`inv_item_sk` = `C_6974656d`.`i_item_sk`)   )`C_53` JOIN (SELECT `item_1`.`i_manufact` AS `C_6e6f6e655f695f6d616e75666163745f6e6b`, COUNT(1) AS `C_787461626c6561755f6a6f696e5f666c6167`, COUNT(`inventory_0`.`inv_quantity_on_hand`) AS `C_785f5f616c6961735f5f30`  FROM `tpcds_bin_partitioned_orc_200`.`inventory`  `inventory_0` JOIN `tpcds_bin_partitioned_orc_200`.`item`  `item_1` ON (`inventory_0`.`inv_item_sk` = `item_1`.`i_item_sk`)  GROUP BY `item_1`.`i_manufact`   ORDER BY `C_785f5f616c6961735f5f30` DESC  LIMIT 10   )  `C_7430` ON (`C_53`.`C_4` = `C_6e6f6e655f695f6d616e75666163745f6e6b`)  GROUP BY `C_53`.`C_5`   
 

;



-- id: 2046
use default
;



-- id: 2047
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 2048
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 2055
SELECT `C_6974656d`.`i_manufact` AS `C_6e6f6e655f695f6d616e75666163745f6e6b`  FROM `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` WHERE (`C_6974656d`.`i_manufact` IS NULL )   LIMIT 1    expr = leaf-0
 expr = leaf-0, columns: ['null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'i_manufact', 'null', 'null', 'null', 'null', 'null', 'null', 'null']}

;



-- id: 2056
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 2149
SELECT `C_6` AS `none_i_manufact_nk_2`, COUNT(`C_53`.`C_5`) AS `C_636e745f696e765f7175616e746974795f6f6e5f68616e645f6f6b`  FROM  ( SELECT  `C_696e76656e746f7279`.`inv_item_sk` AS `C_43`, `C_6974656d`.`i_item_sk` AS `C_3`, `C_6974656d`.`i_manufact` AS `C_4`, `C_696e76656e746f7279`.`inv_quantity_on_hand` AS `C_5`, `C_6974656d`.`i_manufact` AS `C_6`  FROM `tpcds_bin_partitioned_orc_200`.`inventory`  `C_696e76656e746f7279` JOIN `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` ON (`C_696e76656e746f7279`.`inv_item_sk` = `C_6974656d`.`i_item_sk`)   )`C_53` JOIN (SELECT `item_1`.`i_manufact` AS `C_6e6f6e655f695f6d616e75666163745f6e6b`, COUNT(1) AS `C_787461626c6561755f6a6f696e5f666c6167`, COUNT(`inventory_0`.`inv_quantity_on_hand`) AS `C_785f5f616c6961735f5f30`  FROM `tpcds_bin_partitioned_orc_200`.`inventory`  `inventory_0` JOIN `tpcds_bin_partitioned_orc_200`.`item`  `item_1` ON (`inventory_0`.`inv_item_sk` = `item_1`.`i_item_sk`)  GROUP BY `item_1`.`i_manufact`   ORDER BY `C_785f5f616c6961735f5f30` DESC  LIMIT 10   )  `C_7430` ON (`C_53`.`C_4` = `C_6e6f6e655f695f6d616e75666163745f6e6b`)  GROUP BY `C_53`.`C_6`   
 

;



-- id: 2150
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 2166
SELECT MIN(`inventory`.`inv_quantity_on_hand`) AS `temp_inv_quantity_on_hand_lower__290714814__0_`,   MAX(`inventory`.`inv_quantity_on_hand`) AS `temp_inv_quantity_on_hand_upper__290714814__0_`
 FROM `tpcds_bin_partitioned_orc_200`.`inventory` `inventory`
 GROUP BY 1
 HAVING (COUNT(1) > 0)
 
 

;



-- id: 2167
SHOW TABLES IN `tpcds_bin_partitioned_orc_200` LIKE '*'
;



-- id: 2168
SHOW TABLES IN `tpcds_bin_partitioned_orc_200` LIKE '*'
;



-- id: 2169
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 2170
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 2186
SELECT SUM(1) AS `sum_number_of_records_ok` FROM `tpcds_bin_partitioned_orc_200`.`customer` `customer`
 GROUP BY 1
 HAVING (COUNT(1) > 0)
 
 

;



-- id: 2187
use default
;



-- id: 2188
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 2189
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 2222
SELECT `C_637573746f6d6572`.`c_customer_id` AS `C_6e6f6e655f635f637573746f6d65725f69645f6e6b`, `C_637573746f6d6572`.`c_email_address` AS `C_6e6f6e655f635f656d61696c5f616464726573735f6e6b`, `C_637573746f6d65725f64656d6f6772617068696373`.`cd_gender` AS `C_6e6f6e655f63645f67656e6465725f6e6b`, SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) AS `C_73756d5f63645f70757263686173655f657374696d6174655f6f6b`  FROM `tpcds_bin_partitioned_orc_200`.`customer`  `C_637573746f6d6572` JOIN `tpcds_bin_partitioned_orc_200`.`customer_demographics`  `C_637573746f6d65725f64656d6f6772617068696373` ON (`C_637573746f6d6572`.`c_current_cdemo_sk` = `C_637573746f6d65725f64656d6f6772617068696373`.`cd_demo_sk`)  WHERE ((`C_637573746f6d65725f64656d6f6772617068696373`.`cd_marital_status` = 'M') AND ((`C_637573746f6d65725f64656d6f6772617068696373`.`cd_education_status` = 'Unknown') AND ((`C_637573746f6d6572`.`c_birth_country` = 'UNITED STATES') AND (`C_637573746f6d65725f64656d6f6772617068696373`.`cd_credit_rating` = 'High Risk'))))  GROUP BY `C_637573746f6d6572`.`c_customer_id`, `C_637573746f6d6572`.`c_email_address`, `C_637573746f6d65725f64656d6f6772617068696373`.`cd_gender`  HAVING ((SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) >= 5000) AND (SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) <= 10000))   
 

;



-- id: 2223
SHOW TABLES IN `tpcds_bin_partitioned_orc_200` LIKE '*'
;



-- id: 2224
SHOW TABLES IN `tpcds_bin_partitioned_orc_200` LIKE '*'
;



-- id: 2225
SHOW TABLES IN `tpcds_bin_partitioned_orc_200` LIKE 'inventory'
;



-- id: 2226
SHOW TABLES IN `tpcds_bin_partitioned_orc_200` LIKE 'inventory'
;



-- id: 2227
SHOW TABLES IN `tpcds_bin_partitioned_orc_200` LIKE 'inventory'
;



-- id: 2228
SHOW TABLES IN `tpcds_bin_partitioned_orc_200` LIKE 'inventory'
;



-- id: 2229
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 2230
SHOW TABLES IN `tpcds_bin_partitioned_orc_200` LIKE 'item*'
;



-- id: 2231
SHOW TABLES IN `tpcds_bin_partitioned_orc_200` LIKE 'item*'
;



-- id: 2232
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 2233
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 2265
SELECT SUM(`inventory`.`inv_quantity_on_hand`) AS `sum_inv_quantity_on_hand_ok` FROM `tpcds_bin_partitioned_orc_200`.`inventory` `inventory`
   JOIN `tpcds_bin_partitioned_orc_200`.`item` `item` ON (`inventory`.`inv_item_sk` = `item`.`i_item_sk`)
 GROUP BY 1
 HAVING (COUNT(1) > 0)
 
 

;



-- id: 2266
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 2298
SELECT COUNT(`inventory`.`inv_quantity_on_hand`) AS `cnt_inv_quantity_on_hand_ok` FROM `tpcds_bin_partitioned_orc_200`.`inventory` `inventory`
   JOIN `tpcds_bin_partitioned_orc_200`.`item` `item` ON (`inventory`.`inv_item_sk` = `item`.`i_item_sk`)
 GROUP BY 1
 HAVING (COUNT(1) > 0)
 
 

;



-- id: 2299
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 2327
SELECT AVG(CAST(`inventory`.`inv_quantity_on_hand` AS DOUBLE)) AS `avg_inv_quantity_on_hand_ok` FROM `tpcds_bin_partitioned_orc_200`.`inventory` `inventory`
   JOIN `tpcds_bin_partitioned_orc_200`.`item` `item` ON (`inventory`.`inv_item_sk` = `item`.`i_item_sk`)
 GROUP BY 1
 HAVING (COUNT(1) > 0)
 
 

;



-- id: 2328
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 2345
SELECT `C_6974656d`.`i_manufact` AS `C_6e6f6e655f695f6d616e75666163745f6e6b`  FROM `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` GROUP BY `C_6974656d`.`i_manufact`   ORDER BY `C_6e6f6e655f695f6d616e75666163745f6e6b` ASC  
 

;



-- id: 2346
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 2432
SELECT AVG(CAST(`inventory`.`inv_quantity_on_hand` AS DOUBLE)) AS `avg_inv_quantity_on_hand_ok` FROM `tpcds_bin_partitioned_orc_200`.`inventory` `inventory`
   JOIN `tpcds_bin_partitioned_orc_200`.`item` `item` ON (`inventory`.`inv_item_sk` = `item`.`i_item_sk`)
   JOIN (
   SELECT `item`.`i_manufact` AS `none_i_manufact_nk`,
     COUNT(1) AS `xtableau_join_flag`,
     AVG(CAST(`inventory`.`inv_quantity_on_hand` AS DOUBLE)) AS `x__alias__0`
   FROM `tpcds_bin_partitioned_orc_200`.`inventory` `inventory`
     JOIN `tpcds_bin_partitioned_orc_200`.`item` `item` ON (`inventory`.`inv_item_sk` = `item`.`i_item_sk`)
   GROUP BY `item`.`i_manufact`
   ORDER BY `x__alias__0` DESC
   LIMIT 10
 ) `t0` ON (`item`.`i_manufact` = `t0`.`none_i_manufact_nk`)
 GROUP BY 1
 HAVING (COUNT(1) > 0)
 
 

;



-- id: 2433
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 2520
SELECT `C_5` AS `none_i_manufact_nk_2`, AVG(CAST(`C_53`.`C_6` AS DOUBLE)) AS `C_6176675f696e765f7175616e746974795f6f6e5f68616e645f6f6b`  FROM  ( SELECT  `C_696e76656e746f7279`.`inv_item_sk` AS `C_43`, `C_6974656d`.`i_manufact` AS `C_3`, `C_6974656d`.`i_item_sk` AS `C_4`, `C_6974656d`.`i_manufact` AS `C_5`, `C_696e76656e746f7279`.`inv_quantity_on_hand` AS `C_6`  FROM `tpcds_bin_partitioned_orc_200`.`inventory`  `C_696e76656e746f7279` JOIN `tpcds_bin_partitioned_orc_200`.`item`  `C_6974656d` ON (`C_696e76656e746f7279`.`inv_item_sk` = `C_6974656d`.`i_item_sk`)   )`C_53` JOIN (SELECT `item_1`.`i_manufact` AS `C_6e6f6e655f695f6d616e75666163745f6e6b`, COUNT(1) AS `C_787461626c6561755f6a6f696e5f666c6167`, AVG(CAST(`inventory_0`.`inv_quantity_on_hand` AS DOUBLE)) AS `C_785f5f616c6961735f5f30`  FROM `tpcds_bin_partitioned_orc_200`.`inventory`  `inventory_0` JOIN `tpcds_bin_partitioned_orc_200`.`item`  `item_1` ON (`inventory_0`.`inv_item_sk` = `item_1`.`i_item_sk`)  GROUP BY `item_1`.`i_manufact`   ORDER BY `C_785f5f616c6961735f5f30` DESC  LIMIT 10   )  `C_7430` ON (`C_53`.`C_3` = `C_6e6f6e655f695f6d616e75666163745f6e6b`)  GROUP BY `C_53`.`C_5`   
 

;



-- id: 2523
show databases like '*'
;



-- id: 2524
SHOW SCHEMAS
;



-- id: 2525
use default
;



-- id: 2526
SHOW SCHEMAS LIKE 'default*'
;



-- id: 2527
SHOW TABLES IN `default`
;



-- id: 2528
SHOW SCHEMAS
;



-- id: 2529
SHOW TABLES IN `tpcds_bin_partitioned_orc_10000`
;



-- id: 2533
SELECT * FROM `tpcds_bin_partitioned_orc_10000`.`call_center`

;



-- id: 2537
SELECT * FROM `tpcds_bin_partitioned_orc_10000`.`call_center`

;



-- id: 2542
SELECT 1 AS `number_of_records`,   `call_center`.`cc_call_center_id` AS `cc_call_center_id`,
   `call_center`.`cc_call_center_sk` AS `cc_call_center_sk`,
   `call_center`.`cc_city` AS `cc_city`,
   `call_center`.`cc_class` AS `cc_class`,
   `call_center`.`cc_closed_date_sk` AS `cc_closed_date_sk`,
   `call_center`.`cc_company` AS `cc_company`,
   `call_center`.`cc_company_name` AS `cc_company_name`,
   `call_center`.`cc_country` AS `cc_country`,
   `call_center`.`cc_county` AS `cc_county`,
   `call_center`.`cc_division` AS `cc_division`,
   `call_center`.`cc_division_name` AS `cc_division_name`,
   `call_center`.`cc_employees` AS `cc_employees`,
   `call_center`.`cc_gmt_offset` AS `cc_gmt_offset`,
   `call_center`.`cc_hours` AS `cc_hours`,
   `call_center`.`cc_manager` AS `cc_manager`,
   `call_center`.`cc_market_manager` AS `cc_market_manager`,
   `call_center`.`cc_mkt_class` AS `cc_mkt_class`,
   `call_center`.`cc_mkt_desc` AS `cc_mkt_desc`,
   `call_center`.`cc_mkt_id` AS `cc_mkt_id`,
   `call_center`.`cc_name` AS `cc_name`,
   `call_center`.`cc_open_date_sk` AS `cc_open_date_sk`,
   `call_center`.`cc_rec_end_date` AS `cc_rec_end_date`,
   `call_center`.`cc_rec_start_date` AS `cc_rec_start_date`,
   `call_center`.`cc_sq_ft` AS `cc_sq_ft`,
   `call_center`.`cc_state` AS `cc_state`,
   `call_center`.`cc_street_name` AS `cc_street_name`,
   `call_center`.`cc_street_number` AS `cc_street_number`,
   `call_center`.`cc_street_type` AS `cc_street_type`,
   `call_center`.`cc_suite_number` AS `cc_suite_number`,
   `call_center`.`cc_tax_percentage` AS `cc_tax_percentage`,
   `call_center`.`cc_zip` AS `cc_zip`
 FROM `tpcds_bin_partitioned_orc_10000`.`call_center` `call_center`
 LIMIT 10000

;



-- id: 2546
SELECT * FROM `tpcds_bin_partitioned_orc_10000`.`store`

;



-- id: 2550
SELECT * FROM `tpcds_bin_partitioned_orc_10000`.`store`

;



-- id: 2555
SELECT 1 AS `number_of_records`,   `store`.`s_city` AS `s_city`,
   `store`.`s_closed_date_sk` AS `s_closed_date_sk`,
   `store`.`s_company_id` AS `s_company_id`,
   `store`.`s_company_name` AS `s_company_name`,
   `store`.`s_country` AS `s_country`,
   `store`.`s_county` AS `s_county`,
   `store`.`s_division_id` AS `s_division_id`,
   `store`.`s_division_name` AS `s_division_name`,
   `store`.`s_floor_space` AS `s_floor_space`,
   `store`.`s_geography_class` AS `s_geography_class`,
   `store`.`s_gmt_offset` AS `s_gmt_offset`,
   `store`.`s_hours` AS `s_hours`,
   `store`.`s_manager` AS `s_manager`,
   `store`.`s_market_desc` AS `s_market_desc`,
   `store`.`s_market_id` AS `s_market_id`,
   `store`.`s_market_manager` AS `s_market_manager`,
   `store`.`s_number_employees` AS `s_number_employees`,
   `store`.`s_rec_end_date` AS `s_rec_end_date`,
   `store`.`s_rec_start_date` AS `s_rec_start_date`,
   `store`.`s_state` AS `s_state`,
   `store`.`s_store_id` AS `s_store_id`,
   `store`.`s_store_name` AS `s_store_name`,
   `store`.`s_store_sk` AS `s_store_sk`,
   `store`.`s_street_name` AS `s_street_name`,
   `store`.`s_street_number` AS `s_street_number`,
   `store`.`s_street_type` AS `s_street_type`,
   `store`.`s_suite_number` AS `s_suite_number`,
   `store`.`s_tax_precentage` AS `s_tax_precentage`,
   `store`.`s_zip` AS `s_zip`
 FROM `tpcds_bin_partitioned_orc_10000`.`store` `store`
 LIMIT 10000

;



-- id: 2561
SELECT * FROM `tpcds_bin_partitioned_orc_10000`.`customer`
 
 

;



-- id: 2565
SELECT * FROM `tpcds_bin_partitioned_orc_10000`.`store`

;



-- id: 2571
SELECT * FROM `tpcds_bin_partitioned_orc_10000`.`customer`
 
 

;



-- id: 2572
SHOW TABLES IN `tpcds_bin_partitioned_orc_10000`
;



-- id: 2578
SELECT * FROM `tpcds_bin_partitioned_orc_10000`.`customer`
 
 

;



-- id: 2582
SELECT * FROM `tpcds_bin_partitioned_orc_10000`.`customer_demographics`

;



-- id: 2588
SELECT * FROM `tpcds_bin_partitioned_orc_10000`.`customer`
 
 

;



-- id: 2592
SELECT * FROM `tpcds_bin_partitioned_orc_10000`.`customer_demographics`

;



-- id: 2593
SHOW TABLES IN `tpcds_bin_partitioned_orc_10000`
;



-- id: 2599
SELECT * FROM `tpcds_bin_partitioned_orc_10000`.`customer`
 
 

;



-- id: 2605
SELECT * FROM `tpcds_bin_partitioned_orc_10000`.`catalog_sales`
 
 
 org.apache.hive.service.cli.HiveSQLException: Error while processing statement: FAILED: Execution Error, return code 1 from org.apache.hadoop.hive.ql.exec.tez.TezTask
 	at org.apache.hive.service.cli.operation.Operation.toSQLException(Operation.java:314)
 	at org.apache.hive.service.cli.operation.SQLOperation.runQuery(SQLOperation.java:155)
 	at org.apache.hive.service.cli.operation.SQLOperation.access$100(SQLOperation.java:70)
 	at org.apache.hive.service.cli.operation.SQLOperation$1$1.run(SQLOperation.java:205)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.hadoop.hive.shims.HadoopShimsSecure.doAs(HadoopShimsSecure.java:536)
 	at org.apache.hive.service.cli.operation.SQLOperation$1.run(SQLOperation.java:217)
 	at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:471)
 	at java.util.concurrent.FutureTask.run(FutureTask.java:262)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)

;



-- id: 2615
use default FROM `tpcds_bin_partitioned_orc_10000`.`catalog_sales`
 FROM `tpcds_bin_partitioned_orc_10000`.`catalog_sales`
 
 
 FROM `tpcds_bin_partitioned_orc_200`.`customer`
 FROM `tpcds_bin_partitioned_orc_200`.`customer`

;



-- id: 2619
SELECT * FROM `tpcds_bin_partitioned_orc_200`.`customer_demographics`

;



-- id: 2653
SELECT `customer`.`c_customer_id` AS `c_customer_id`,   `customer`.`c_email_address` AS `c_email_address`,
   `customer_demographics`.`cd_gender` AS `cd_gender`,
   SUM(`customer_demographics`.`cd_purchase_estimate`) AS `sum_cd_purchase_estimate_ok`
 FROM `tpcds_bin_partitioned_orc_200`.`customer` `customer`
   JOIN `tpcds_bin_partitioned_orc_200`.`customer_demographics` `customer_demographics` ON (`customer`.`c_current_cdemo_sk` = `customer_demographics`.`cd_demo_sk`)
 WHERE (((`customer`.`c_birth_country` = 'UNITED STATES') AND (`customer_demographics`.`cd_credit_rating` = 'High Risk') AND (`customer_demographics`.`cd_education_status` = 'Unknown')) AND (`customer_demographics`.`cd_marital_status` = 'M'))
 GROUP BY `customer`.`c_customer_id`,
   `customer`.`c_email_address`,
   `customer_demographics`.`cd_gender`
 HAVING ((SUM(`customer_demographics`.`cd_purchase_estimate`) >= 5000) AND (SUM(`customer_demographics`.`cd_purchase_estimate`) <= 10000))

;



-- id: 2654
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 2655
SHOW TABLES IN `tpcds_bin_partitioned_orc_200`
;



-- id: 2693
SELECT `C_637573746f6d6572`.`c_customer_id` AS `C_6e6f6e655f635f637573746f6d65725f69645f6e6b`, `C_637573746f6d6572`.`c_email_address` AS `C_6e6f6e655f635f656d61696c5f616464726573735f6e6b`, `C_637573746f6d65725f64656d6f6772617068696373`.`cd_gender` AS `C_6e6f6e655f63645f67656e6465725f6e6b`, SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) AS `C_73756d5f63645f70757263686173655f657374696d6174655f6f6b`  FROM `tpcds_bin_partitioned_orc_200`.`customer`  `C_637573746f6d6572` JOIN `tpcds_bin_partitioned_orc_200`.`customer_demographics`  `C_637573746f6d65725f64656d6f6772617068696373` ON (`C_637573746f6d6572`.`c_current_cdemo_sk` = `C_637573746f6d65725f64656d6f6772617068696373`.`cd_demo_sk`)  WHERE ((`C_637573746f6d65725f64656d6f6772617068696373`.`cd_marital_status` = 'M') AND ((`C_637573746f6d65725f64656d6f6772617068696373`.`cd_education_status` = 'Unknown') AND ((`C_637573746f6d6572`.`c_birth_country` = 'UNITED STATES') AND (`C_637573746f6d65725f64656d6f6772617068696373`.`cd_credit_rating` = 'High Risk'))))  GROUP BY `C_637573746f6d6572`.`c_customer_id`, `C_637573746f6d6572`.`c_email_address`, `C_637573746f6d65725f64656d6f6772617068696373`.`cd_gender`  HAVING ((SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) >= 5000) AND (SUM(`C_637573746f6d65725f64656d6f6772617068696373`.`cd_purchase_estimate`) <= 10000))   org.apache.hive.service.cli.HiveSQLException: Error while processing statement: FAILED: Execution Error, return code 1 from org.apache.hadoop.hive.ql.exec.tez.TezTask
 	at org.apache.hive.service.cli.operation.Operation.toSQLException(Operation.java:314)
 	at org.apache.hive.service.cli.operation.SQLOperation.runQuery(SQLOperation.java:155)
 	at org.apache.hive.service.cli.operation.SQLOperation.access$100(SQLOperation.java:70)
 	at org.apache.hive.service.cli.operation.SQLOperation$1$1.run(SQLOperation.java:205)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.hadoop.hive.shims.HadoopShimsSecure.doAs(HadoopShimsSecure.java:536)
 	at org.apache.hive.service.cli.operation.SQLOperation$1.run(SQLOperation.java:217)
 	at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:471)
 	at java.util.concurrent.FutureTask.run(FutureTask.java:262)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 FROM `tpcds_bin_partitioned_orc_10000`.`catalog_sales`
 LIMIT 0
 FROM `tpcds_bin_partitioned_orc_10000`.`catalog_sales`
 LIMIT 0

;



-- id: 2697
use default FROM `tpcds_bin_partitioned_orc_200`.`inventory`
 FROM `tpcds_bin_partitioned_orc_200`.`inventory`

;



-- id: 2701
SELECT * FROM `tpcds_bin_partitioned_orc_200`.`item`

;



-- id: 2708
SELECT `item`.`i_manufact` AS `i_manufact` FROM `tpcds_bin_partitioned_orc_200`.`item` `item`
 WHERE (`item`.`i_manufact` IS NULL)
 LIMIT 1
 expr = leaf-0
 expr = leaf-0, columns: ['null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'i_manufact', 'null', 'null', 'null', 'null', 'null', 'null', 'null']}

;



-- id: 2798
SELECT `item`.`i_manufact` AS `i_manufact`,   COUNT(`inventory`.`inv_quantity_on_hand`) AS `cnt_inv_quantity_on_hand_ok`
 FROM `tpcds_bin_partitioned_orc_200`.`inventory` `inventory`
   JOIN `tpcds_bin_partitioned_orc_200`.`item` `item` ON (`inventory`.`inv_item_sk` = `item`.`i_item_sk`)
   JOIN (
   SELECT `item`.`i_manufact` AS `none_i_manufact_nk`,
     COUNT(1) AS `xtableau_join_flag`,
     COUNT(`inventory`.`inv_quantity_on_hand`) AS `x__alias__0`
   FROM `tpcds_bin_partitioned_orc_200`.`inventory` `inventory`
     JOIN `tpcds_bin_partitioned_orc_200`.`item` `item` ON (`inventory`.`inv_item_sk` = `item`.`i_item_sk`)
   GROUP BY `item`.`i_manufact`
   ORDER BY `x__alias__0` DESC
   LIMIT 10
 ) `t0` ON (`item`.`i_manufact` = `t0`.`none_i_manufact_nk`)
 GROUP BY `item`.`i_manufact`
 
 

;



-- id: 2830
SELECT COUNT(`inventory`.`inv_quantity_on_hand`) AS `cnt_inv_quantity_on_hand_ok` FROM `tpcds_bin_partitioned_orc_200`.`inventory` `inventory`
   JOIN `tpcds_bin_partitioned_orc_200`.`item` `item` ON (`inventory`.`inv_item_sk` = `item`.`i_item_sk`)
 GROUP BY 1
 HAVING (COUNT(1) > 0)
 
 

;



-- id: 2831
use default
;



-- id: 2832
SHOW TABLES IN `tpcds_text_10000`
;



-- id: 2837
SELECT * FROM `tpcds_text_10000`.`catalog_sales`
 
 
 org.apache.hive.service.cli.HiveSQLException: Error while processing statement: FAILED: Execution Error, return code 1 from org.apache.hadoop.hive.ql.exec.tez.TezTask
 	at org.apache.hive.service.cli.operation.Operation.toSQLException(Operation.java:314)
 	at org.apache.hive.service.cli.operation.SQLOperation.runQuery(SQLOperation.java:155)
 	at org.apache.hive.service.cli.operation.SQLOperation.access$100(SQLOperation.java:70)
 	at org.apache.hive.service.cli.operation.SQLOperation$1$1.run(SQLOperation.java:205)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.hadoop.hive.shims.HadoopShimsSecure.doAs(HadoopShimsSecure.java:536)
 	at org.apache.hive.service.cli.operation.SQLOperation$1.run(SQLOperation.java:217)
 	at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:471)
 	at java.util.concurrent.FutureTask.run(FutureTask.java:262)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:57)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:57)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:57)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:57)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:57)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:57)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:57)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:57)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:57)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:57)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:57)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:57)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:57)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:57)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:57)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
 	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:57)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.nio.BufferUnderflowException
 	at java.nio.Buffer.nextGetIndex(Buffer.java:498)
 	at java.nio.HeapByteBuffer.getLong(HeapByteBuffer.java:406)
 	at org.apache.hive.service.cli.HandleIdentifier.<init>(HandleIdentifier.java:46)
 	at org.apache.hive.service.cli.Handle.<init>(Handle.java:38)
 	at org.apache.hive.service.cli.SessionHandle.<init>(SessionHandle.java:45)
 	at org.apache.hive.service.cli.SessionHandle.<init>(SessionHandle.java:41)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.CloseSession(ThriftCLIService.java:367)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$CloseSession.getResult(TCLIService.java:1273)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$CloseSession.getResult(TCLIService.java:1258)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.nio.BufferUnderflowException
 	at java.nio.Buffer.nextGetIndex(Buffer.java:498)
 	at java.nio.HeapByteBuffer.getLong(HeapByteBuffer.java:406)
 	at org.apache.hive.service.cli.HandleIdentifier.<init>(HandleIdentifier.java:46)
 	at org.apache.hive.service.cli.Handle.<init>(Handle.java:38)
 	at org.apache.hive.service.cli.SessionHandle.<init>(SessionHandle.java:45)
 	at org.apache.hive.service.cli.SessionHandle.<init>(SessionHandle.java:41)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.CloseSession(ThriftCLIService.java:367)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$CloseSession.getResult(TCLIService.java:1273)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$CloseSession.getResult(TCLIService.java:1258)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.nio.BufferUnderflowException
 	at java.nio.Buffer.nextGetIndex(Buffer.java:498)
 	at java.nio.HeapByteBuffer.getLong(HeapByteBuffer.java:406)
 	at org.apache.hive.service.cli.HandleIdentifier.<init>(HandleIdentifier.java:46)
 	at org.apache.hive.service.cli.Handle.<init>(Handle.java:38)
 	at org.apache.hive.service.cli.SessionHandle.<init>(SessionHandle.java:45)
 	at org.apache.hive.service.cli.SessionHandle.<init>(SessionHandle.java:41)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.CloseSession(ThriftCLIService.java:367)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$CloseSession.getResult(TCLIService.java:1273)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$CloseSession.getResult(TCLIService.java:1258)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.nio.BufferUnderflowException
 	at java.nio.Buffer.nextGetIndex(Buffer.java:498)
 	at java.nio.HeapByteBuffer.getLong(HeapByteBuffer.java:406)
 	at org.apache.hive.service.cli.HandleIdentifier.<init>(HandleIdentifier.java:46)
 	at org.apache.hive.service.cli.Handle.<init>(Handle.java:38)
 	at org.apache.hive.service.cli.SessionHandle.<init>(SessionHandle.java:45)
 	at org.apache.hive.service.cli.SessionHandle.<init>(SessionHandle.java:41)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.CloseSession(ThriftCLIService.java:367)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$CloseSession.getResult(TCLIService.java:1273)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$CloseSession.getResult(TCLIService.java:1258)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: java.net.ConnectException: Call From ip-10-0-0-109.us-west-2.compute.internal/10.0.0.109 to ip-10-0-0-109.us-west-2.compute.internal:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
 	at sun.reflect.GeneratedConstructorAccessor335.newInstance(Unknown Source)
 	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
 	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:791)
 	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:731)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1473)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getFileInfo(ClientNamenodeProtocolTranslatorPB.java:768)
 	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.getFileInfo(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.getFileInfo(DFSClient.java:2007)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1136)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$19.doCall(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:1132)
 	at org.apache.hadoop.fs.FileSystem.exists(FileSystem.java:1423)
 	at org.apache.hadoop.hive.ql.session.SessionState.createRootHDFSDir(SessionState.java:520)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:478)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 Caused by: java.net.ConnectException: Connection refused
 	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
 	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
 	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
 	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
 	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:608)
 	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:706)
 	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:369)
 	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1522)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1439)
 	... 33 more
 java.lang.RuntimeException: org.apache.hadoop.ipc.RemoteException(org.apache.hadoop.hdfs.server.namenode.SafeModeException): Cannot create directory /tmp/hive/hive/dce37388-fcac-4fd8-983d-1e482fdd3f60. Name node is in safe mode.
 The reported blocks 0 needs additional 195335 blocks to reach the threshold 1.0000 of total blocks 195334.
 The number of live datanodes 0 has reached the minimum number 0. Safe mode will be turned off automatically once the thresholds have been reached.
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.checkNameNodeSafeMode(FSNamesystem.java:1376)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirsInt(FSNamesystem.java:4463)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirs(FSNamesystem.java:4438)
 	at org.apache.hadoop.hdfs.server.namenode.NameNodeRpcServer.mkdirs(NameNodeRpcServer.java:830)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolServerSideTranslatorPB.mkdirs(ClientNamenodeProtocolServerSideTranslatorPB.java:614)
 	at org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$ClientNamenodeProtocol$2.callBlockingMethod(ClientNamenodeProtocolProtos.java)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Server$ProtoBufRpcInvoker.call(ProtobufRpcEngine.java:619)
 	at org.apache.hadoop.ipc.RPC$Server.call(RPC.java:962)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2039)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2035)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.hadoop.ipc.Server$Handler.run(Server.java:2033)
 
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: org.apache.hadoop.ipc.RemoteException(org.apache.hadoop.hdfs.server.namenode.SafeModeException): Cannot create directory /tmp/hive/hive/dce37388-fcac-4fd8-983d-1e482fdd3f60. Name node is in safe mode.
 The reported blocks 0 needs additional 195335 blocks to reach the threshold 1.0000 of total blocks 195334.
 The number of live datanodes 0 has reached the minimum number 0. Safe mode will be turned off automatically once the thresholds have been reached.
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.checkNameNodeSafeMode(FSNamesystem.java:1376)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirsInt(FSNamesystem.java:4463)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirs(FSNamesystem.java:4438)
 	at org.apache.hadoop.hdfs.server.namenode.NameNodeRpcServer.mkdirs(NameNodeRpcServer.java:830)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolServerSideTranslatorPB.mkdirs(ClientNamenodeProtocolServerSideTranslatorPB.java:614)
 	at org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$ClientNamenodeProtocol$2.callBlockingMethod(ClientNamenodeProtocolProtos.java)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Server$ProtoBufRpcInvoker.call(ProtobufRpcEngine.java:619)
 	at org.apache.hadoop.ipc.RPC$Server.call(RPC.java:962)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2039)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2035)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.hadoop.ipc.Server$Handler.run(Server.java:2033)
 
 	at org.apache.hadoop.ipc.Client.call(Client.java:1469)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.mkdirs(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.mkdirs(ClientNamenodeProtocolTranslatorPB.java:555)
 	at sun.reflect.GeneratedMethodAccessor9.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.mkdirs(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.primitiveMkdir(DFSClient.java:2772)
 	at org.apache.hadoop.hdfs.DFSClient.mkdirs(DFSClient.java:2743)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$18.doCall(DistributedFileSystem.java:888)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$18.doCall(DistributedFileSystem.java:884)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.mkdirsInternal(DistributedFileSystem.java:884)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.mkdirs(DistributedFileSystem.java:877)
 	at org.apache.hadoop.hive.ql.session.SessionState.createPath(SessionState.java:556)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:498)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 java.lang.RuntimeException: org.apache.hadoop.ipc.RemoteException(org.apache.hadoop.hdfs.server.namenode.SafeModeException): Cannot create directory /tmp/hive/hive/80df742c-36c1-4aa0-87dc-8a6ca4e7d90c. Name node is in safe mode.
 The reported blocks 0 needs additional 195335 blocks to reach the threshold 1.0000 of total blocks 195334.
 The number of live datanodes 0 has reached the minimum number 0. Safe mode will be turned off automatically once the thresholds have been reached.
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.checkNameNodeSafeMode(FSNamesystem.java:1376)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirsInt(FSNamesystem.java:4463)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirs(FSNamesystem.java:4438)
 	at org.apache.hadoop.hdfs.server.namenode.NameNodeRpcServer.mkdirs(NameNodeRpcServer.java:830)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolServerSideTranslatorPB.mkdirs(ClientNamenodeProtocolServerSideTranslatorPB.java:614)
 	at org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$ClientNamenodeProtocol$2.callBlockingMethod(ClientNamenodeProtocolProtos.java)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Server$ProtoBufRpcInvoker.call(ProtobufRpcEngine.java:619)
 	at org.apache.hadoop.ipc.RPC$Server.call(RPC.java:962)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2039)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2035)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.hadoop.ipc.Server$Handler.run(Server.java:2033)
 
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: org.apache.hadoop.ipc.RemoteException(org.apache.hadoop.hdfs.server.namenode.SafeModeException): Cannot create directory /tmp/hive/hive/80df742c-36c1-4aa0-87dc-8a6ca4e7d90c. Name node is in safe mode.
 The reported blocks 0 needs additional 195335 blocks to reach the threshold 1.0000 of total blocks 195334.
 The number of live datanodes 0 has reached the minimum number 0. Safe mode will be turned off automatically once the thresholds have been reached.
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.checkNameNodeSafeMode(FSNamesystem.java:1376)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirsInt(FSNamesystem.java:4463)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirs(FSNamesystem.java:4438)
 	at org.apache.hadoop.hdfs.server.namenode.NameNodeRpcServer.mkdirs(NameNodeRpcServer.java:830)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolServerSideTranslatorPB.mkdirs(ClientNamenodeProtocolServerSideTranslatorPB.java:614)
 	at org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$ClientNamenodeProtocol$2.callBlockingMethod(ClientNamenodeProtocolProtos.java)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Server$ProtoBufRpcInvoker.call(ProtobufRpcEngine.java:619)
 	at org.apache.hadoop.ipc.RPC$Server.call(RPC.java:962)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2039)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2035)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.hadoop.ipc.Server$Handler.run(Server.java:2033)
 
 	at org.apache.hadoop.ipc.Client.call(Client.java:1469)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.mkdirs(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.mkdirs(ClientNamenodeProtocolTranslatorPB.java:555)
 	at sun.reflect.GeneratedMethodAccessor9.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.mkdirs(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.primitiveMkdir(DFSClient.java:2772)
 	at org.apache.hadoop.hdfs.DFSClient.mkdirs(DFSClient.java:2743)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$18.doCall(DistributedFileSystem.java:888)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$18.doCall(DistributedFileSystem.java:884)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.mkdirsInternal(DistributedFileSystem.java:884)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.mkdirs(DistributedFileSystem.java:877)
 	at org.apache.hadoop.hive.ql.session.SessionState.createPath(SessionState.java:556)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:498)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 java.lang.RuntimeException: org.apache.hadoop.ipc.RemoteException(org.apache.hadoop.hdfs.server.namenode.SafeModeException): Cannot create directory /tmp/hive/hive/b3813938-da7e-4e7c-aa2e-3c2d91476e63. Name node is in safe mode.
 The reported blocks 117044 needs additional 78291 blocks to reach the threshold 1.0000 of total blocks 195334.
 The number of live datanodes 5 has reached the minimum number 0. Safe mode will be turned off automatically once the thresholds have been reached.
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.checkNameNodeSafeMode(FSNamesystem.java:1376)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirsInt(FSNamesystem.java:4463)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirs(FSNamesystem.java:4438)
 	at org.apache.hadoop.hdfs.server.namenode.NameNodeRpcServer.mkdirs(NameNodeRpcServer.java:830)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolServerSideTranslatorPB.mkdirs(ClientNamenodeProtocolServerSideTranslatorPB.java:614)
 	at org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$ClientNamenodeProtocol$2.callBlockingMethod(ClientNamenodeProtocolProtos.java)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Server$ProtoBufRpcInvoker.call(ProtobufRpcEngine.java:619)
 	at org.apache.hadoop.ipc.RPC$Server.call(RPC.java:962)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2039)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2035)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.hadoop.ipc.Server$Handler.run(Server.java:2033)
 
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: org.apache.hadoop.ipc.RemoteException(org.apache.hadoop.hdfs.server.namenode.SafeModeException): Cannot create directory /tmp/hive/hive/b3813938-da7e-4e7c-aa2e-3c2d91476e63. Name node is in safe mode.
 The reported blocks 117044 needs additional 78291 blocks to reach the threshold 1.0000 of total blocks 195334.
 The number of live datanodes 5 has reached the minimum number 0. Safe mode will be turned off automatically once the thresholds have been reached.
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.checkNameNodeSafeMode(FSNamesystem.java:1376)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirsInt(FSNamesystem.java:4463)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirs(FSNamesystem.java:4438)
 	at org.apache.hadoop.hdfs.server.namenode.NameNodeRpcServer.mkdirs(NameNodeRpcServer.java:830)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolServerSideTranslatorPB.mkdirs(ClientNamenodeProtocolServerSideTranslatorPB.java:614)
 	at org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$ClientNamenodeProtocol$2.callBlockingMethod(ClientNamenodeProtocolProtos.java)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Server$ProtoBufRpcInvoker.call(ProtobufRpcEngine.java:619)
 	at org.apache.hadoop.ipc.RPC$Server.call(RPC.java:962)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2039)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2035)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.hadoop.ipc.Server$Handler.run(Server.java:2033)
 
 	at org.apache.hadoop.ipc.Client.call(Client.java:1469)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.mkdirs(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.mkdirs(ClientNamenodeProtocolTranslatorPB.java:555)
 	at sun.reflect.GeneratedMethodAccessor9.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.mkdirs(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.primitiveMkdir(DFSClient.java:2772)
 	at org.apache.hadoop.hdfs.DFSClient.mkdirs(DFSClient.java:2743)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$18.doCall(DistributedFileSystem.java:888)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$18.doCall(DistributedFileSystem.java:884)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.mkdirsInternal(DistributedFileSystem.java:884)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.mkdirs(DistributedFileSystem.java:877)
 	at org.apache.hadoop.hive.ql.session.SessionState.createPath(SessionState.java:556)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:498)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 java.lang.RuntimeException: org.apache.hadoop.ipc.RemoteException(org.apache.hadoop.hdfs.server.namenode.SafeModeException): Cannot create directory /tmp/hive/hive/07823e48-5fff-424d-a738-af67b8ba14ad. Name node is in safe mode.
 The reported blocks 117044 needs additional 78291 blocks to reach the threshold 1.0000 of total blocks 195334.
 The number of live datanodes 5 has reached the minimum number 0. Safe mode will be turned off automatically once the thresholds have been reached.
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.checkNameNodeSafeMode(FSNamesystem.java:1376)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirsInt(FSNamesystem.java:4463)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirs(FSNamesystem.java:4438)
 	at org.apache.hadoop.hdfs.server.namenode.NameNodeRpcServer.mkdirs(NameNodeRpcServer.java:830)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolServerSideTranslatorPB.mkdirs(ClientNamenodeProtocolServerSideTranslatorPB.java:614)
 	at org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$ClientNamenodeProtocol$2.callBlockingMethod(ClientNamenodeProtocolProtos.java)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Server$ProtoBufRpcInvoker.call(ProtobufRpcEngine.java:619)
 	at org.apache.hadoop.ipc.RPC$Server.call(RPC.java:962)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2039)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2035)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.hadoop.ipc.Server$Handler.run(Server.java:2033)
 
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: org.apache.hadoop.ipc.RemoteException(org.apache.hadoop.hdfs.server.namenode.SafeModeException): Cannot create directory /tmp/hive/hive/07823e48-5fff-424d-a738-af67b8ba14ad. Name node is in safe mode.
 The reported blocks 117044 needs additional 78291 blocks to reach the threshold 1.0000 of total blocks 195334.
 The number of live datanodes 5 has reached the minimum number 0. Safe mode will be turned off automatically once the thresholds have been reached.
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.checkNameNodeSafeMode(FSNamesystem.java:1376)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirsInt(FSNamesystem.java:4463)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirs(FSNamesystem.java:4438)
 	at org.apache.hadoop.hdfs.server.namenode.NameNodeRpcServer.mkdirs(NameNodeRpcServer.java:830)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolServerSideTranslatorPB.mkdirs(ClientNamenodeProtocolServerSideTranslatorPB.java:614)
 	at org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$ClientNamenodeProtocol$2.callBlockingMethod(ClientNamenodeProtocolProtos.java)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Server$ProtoBufRpcInvoker.call(ProtobufRpcEngine.java:619)
 	at org.apache.hadoop.ipc.RPC$Server.call(RPC.java:962)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2039)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2035)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.hadoop.ipc.Server$Handler.run(Server.java:2033)
 
 	at org.apache.hadoop.ipc.Client.call(Client.java:1469)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.mkdirs(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.mkdirs(ClientNamenodeProtocolTranslatorPB.java:555)
 	at sun.reflect.GeneratedMethodAccessor9.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.mkdirs(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.primitiveMkdir(DFSClient.java:2772)
 	at org.apache.hadoop.hdfs.DFSClient.mkdirs(DFSClient.java:2743)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$18.doCall(DistributedFileSystem.java:888)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$18.doCall(DistributedFileSystem.java:884)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.mkdirsInternal(DistributedFileSystem.java:884)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.mkdirs(DistributedFileSystem.java:877)
 	at org.apache.hadoop.hive.ql.session.SessionState.createPath(SessionState.java:556)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:498)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 java.lang.RuntimeException: org.apache.hadoop.ipc.RemoteException(org.apache.hadoop.hdfs.server.namenode.SafeModeException): Cannot create directory /tmp/hive/hive/051b69bc-6bd0-4752-9e9b-a29f4a277e86. Name node is in safe mode.
 The reported blocks 195334 has reached the threshold 1.0000 of total blocks 195334. The number of live datanodes 5 has reached the minimum number 0. In safe mode extension. Safe mode will be turned off automatically in 12 seconds.
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.checkNameNodeSafeMode(FSNamesystem.java:1376)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirsInt(FSNamesystem.java:4463)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirs(FSNamesystem.java:4438)
 	at org.apache.hadoop.hdfs.server.namenode.NameNodeRpcServer.mkdirs(NameNodeRpcServer.java:830)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolServerSideTranslatorPB.mkdirs(ClientNamenodeProtocolServerSideTranslatorPB.java:614)
 	at org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$ClientNamenodeProtocol$2.callBlockingMethod(ClientNamenodeProtocolProtos.java)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Server$ProtoBufRpcInvoker.call(ProtobufRpcEngine.java:619)
 	at org.apache.hadoop.ipc.RPC$Server.call(RPC.java:962)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2039)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2035)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.hadoop.ipc.Server$Handler.run(Server.java:2033)
 
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: org.apache.hadoop.ipc.RemoteException(org.apache.hadoop.hdfs.server.namenode.SafeModeException): Cannot create directory /tmp/hive/hive/051b69bc-6bd0-4752-9e9b-a29f4a277e86. Name node is in safe mode.
 The reported blocks 195334 has reached the threshold 1.0000 of total blocks 195334. The number of live datanodes 5 has reached the minimum number 0. In safe mode extension. Safe mode will be turned off automatically in 12 seconds.
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.checkNameNodeSafeMode(FSNamesystem.java:1376)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirsInt(FSNamesystem.java:4463)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirs(FSNamesystem.java:4438)
 	at org.apache.hadoop.hdfs.server.namenode.NameNodeRpcServer.mkdirs(NameNodeRpcServer.java:830)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolServerSideTranslatorPB.mkdirs(ClientNamenodeProtocolServerSideTranslatorPB.java:614)
 	at org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$ClientNamenodeProtocol$2.callBlockingMethod(ClientNamenodeProtocolProtos.java)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Server$ProtoBufRpcInvoker.call(ProtobufRpcEngine.java:619)
 	at org.apache.hadoop.ipc.RPC$Server.call(RPC.java:962)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2039)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2035)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.hadoop.ipc.Server$Handler.run(Server.java:2033)
 
 	at org.apache.hadoop.ipc.Client.call(Client.java:1469)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.mkdirs(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.mkdirs(ClientNamenodeProtocolTranslatorPB.java:555)
 	at sun.reflect.GeneratedMethodAccessor9.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.mkdirs(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.primitiveMkdir(DFSClient.java:2772)
 	at org.apache.hadoop.hdfs.DFSClient.mkdirs(DFSClient.java:2743)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$18.doCall(DistributedFileSystem.java:888)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$18.doCall(DistributedFileSystem.java:884)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.mkdirsInternal(DistributedFileSystem.java:884)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.mkdirs(DistributedFileSystem.java:877)
 	at org.apache.hadoop.hive.ql.session.SessionState.createPath(SessionState.java:556)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:498)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more
 java.lang.RuntimeException: org.apache.hadoop.ipc.RemoteException(org.apache.hadoop.hdfs.server.namenode.SafeModeException): Cannot create directory /tmp/hive/hive/a64cb84f-ce23-4051-9eab-92d35f964dae. Name node is in safe mode.
 The reported blocks 195334 has reached the threshold 1.0000 of total blocks 195334. The number of live datanodes 5 has reached the minimum number 0. In safe mode extension. Safe mode will be turned off automatically in 12 seconds.
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.checkNameNodeSafeMode(FSNamesystem.java:1376)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirsInt(FSNamesystem.java:4463)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirs(FSNamesystem.java:4438)
 	at org.apache.hadoop.hdfs.server.namenode.NameNodeRpcServer.mkdirs(NameNodeRpcServer.java:830)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolServerSideTranslatorPB.mkdirs(ClientNamenodeProtocolServerSideTranslatorPB.java:614)
 	at org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$ClientNamenodeProtocol$2.callBlockingMethod(ClientNamenodeProtocolProtos.java)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Server$ProtoBufRpcInvoker.call(ProtobufRpcEngine.java:619)
 	at org.apache.hadoop.ipc.RPC$Server.call(RPC.java:962)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2039)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2035)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.hadoop.ipc.Server$Handler.run(Server.java:2033)
 
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:444)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.<init>(HiveSessionImpl.java:116)
 	at org.apache.hive.service.cli.session.SessionManager.openSession(SessionManager.java:249)
 	at org.apache.hive.service.cli.CLIService.openSession(CLIService.java:190)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.getSessionHandle(ThriftCLIService.java:325)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.OpenSession(ThriftCLIService.java:235)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1253)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$OpenSession.getResult(TCLIService.java:1238)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 Caused by: org.apache.hadoop.ipc.RemoteException(org.apache.hadoop.hdfs.server.namenode.SafeModeException): Cannot create directory /tmp/hive/hive/a64cb84f-ce23-4051-9eab-92d35f964dae. Name node is in safe mode.
 The reported blocks 195334 has reached the threshold 1.0000 of total blocks 195334. The number of live datanodes 5 has reached the minimum number 0. In safe mode extension. Safe mode will be turned off automatically in 12 seconds.
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.checkNameNodeSafeMode(FSNamesystem.java:1376)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirsInt(FSNamesystem.java:4463)
 	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirs(FSNamesystem.java:4438)
 	at org.apache.hadoop.hdfs.server.namenode.NameNodeRpcServer.mkdirs(NameNodeRpcServer.java:830)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolServerSideTranslatorPB.mkdirs(ClientNamenodeProtocolServerSideTranslatorPB.java:614)
 	at org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$ClientNamenodeProtocol$2.callBlockingMethod(ClientNamenodeProtocolProtos.java)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Server$ProtoBufRpcInvoker.call(ProtobufRpcEngine.java:619)
 	at org.apache.hadoop.ipc.RPC$Server.call(RPC.java:962)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2039)
 	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2035)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.hadoop.ipc.Server$Handler.run(Server.java:2033)
 
 	at org.apache.hadoop.ipc.Client.call(Client.java:1469)
 	at org.apache.hadoop.ipc.Client.call(Client.java:1400)
 	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:232)
 	at com.sun.proxy.$Proxy19.mkdirs(Unknown Source)
 	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.mkdirs(ClientNamenodeProtocolTranslatorPB.java:555)
 	at sun.reflect.GeneratedMethodAccessor9.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
 	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
 	at com.sun.proxy.$Proxy20.mkdirs(Unknown Source)
 	at org.apache.hadoop.hdfs.DFSClient.primitiveMkdir(DFSClient.java:2772)
 	at org.apache.hadoop.hdfs.DFSClient.mkdirs(DFSClient.java:2743)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$18.doCall(DistributedFileSystem.java:888)
 	at org.apache.hadoop.hdfs.DistributedFileSystem$18.doCall(DistributedFileSystem.java:884)
 	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.mkdirsInternal(DistributedFileSystem.java:884)
 	at org.apache.hadoop.hdfs.DistributedFileSystem.mkdirs(DistributedFileSystem.java:877)
 	at org.apache.hadoop.hive.ql.session.SessionState.createPath(SessionState.java:556)
 	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:498)
 	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:430)
 	... 14 more

;



-- id: 2841
use default FROM `tpcds_bin_partitioned_orc_200`.`item`
 FROM `tpcds_bin_partitioned_orc_200`.`item`

;



-- id: 2848
SELECT `item`.`i_brand` AS `i_brand` FROM `tpcds_bin_partitioned_orc_200`.`item` `item`
 WHERE (`item`.`i_brand` IS NULL)
 LIMIT 1
 expr = leaf-0
 expr = leaf-0, columns: ['null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'i_brand', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null']}

;



-- id: 2886
SELECT `item`.`i_brand` AS `i_brand`,   AVG(`item`.`i_current_price`) AS `avg_i_current_price_ok`
 FROM `tpcds_bin_partitioned_orc_200`.`item` `item`
   JOIN (
   SELECT `item`.`i_brand` AS `none_i_brand_nk`,
     COUNT(1) AS `xtableau_join_flag`,
     AVG(`item`.`i_current_price`) AS `x__alias__0`
   FROM `tpcds_bin_partitioned_orc_200`.`item` `item`
   GROUP BY `item`.`i_brand`
   ORDER BY `x__alias__0` DESC
   LIMIT 10
 ) `t0` ON (`item`.`i_brand` = `t0`.`none_i_brand_nk`)
 GROUP BY `item`.`i_brand`
 
 

;



