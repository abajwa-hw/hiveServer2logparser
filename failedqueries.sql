-- id: 18267
SELECT     `T5`.`expense_group_code` AS `column0`, 
     `T5`.`expense_type_code` AS `column1`, 
     `T01`.`organization_code1` AS `column2`, 
     `T01`.`organization_code2` AS `column3`, 
     `T01`.`organization_code` AS `column4`, 
     SUM(`EMP_EXPENSE_FACT`.`expense_total`) AS `column5`
 FROM
     `gosalesdw1021`.`emp_expense_fact` `EMP_EXPENSE_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_EXPENSE_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN 
         (
         SELECT
             `go_org_dim_2`.`organization_key`, 
             `go_org_dim_1`.`organization_parent` AS `organization_code1`, 
             `go_org_dim_2`.`organization_parent` AS `organization_code2`, 
             `go_org_dim_2`.`organization_code`
         FROM
             `gosalesdw1021`.`go_org_dim` `go_org_dim_2` JOIN `gosalesdw1021`.`go_org_dim` `go_org_dim_1` ON `go_org_dim_2`.`organization_parent` = `go_org_dim_1`.`organization_code` 
         WHERE 
             `go_org_dim_2`.`organization_code` BETWEEN '006' AND '8820'
         ) `T01` ON `T01`.`organization_key` = `EMP_EXPENSE_FACT`.`organization_key` JOIN `gosalesdw1021`.`emp_expense_type_dim` `T5` ON `EMP_EXPENSE_FACT`.`expense_type_key` = `T5`.`expense_type_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `T5`.`expense_group_code` = 400 AND
     `T5`.`expense_type_code` = 31 AND
     `T01`.`organization_code1` = 'GOCEU' AND
     `T01`.`organization_code2` = 'GOCEUOP' AND
     `T01`.`organization_code` IN ( 
         '013', 
         '006', 
         '014', 
         '023' ) 
 GROUP BY 
     `T5`.`expense_group_code`, 
     `T5`.`expense_type_code`, 
     `T01`.`organization_code1`, 
     `T01`.`organization_code2`, 
     `T01`.`organization_code`
 
 

;



-- id: 24089
SELECT     `SALES_REGION`.`sales_region_code`, 
     `SALES_REGION`.`sales_region_en`
 FROM
     `gosales1021`.`sales_region` `SALES_REGION` 
 ORDER BY 
     `SALES_REGION`.`sales_region_code` ASC

;



-- id: 24100
SELECT     `TIME_DIMENSION0`.`month_key`, 
     CAST(`TIME_DIMENSION0`.`current_year` AS CHAR(4))
 FROM
     (
     SELECT
         `TIME_DIMENSION`.`month_key` AS `month_key`, 
         `TIME_DIMENSION`.`current_year` AS `current_year`
     FROM
         `gosales1021`.`time_dimension` `TIME_DIMENSION` 
     GROUP BY 
         `TIME_DIMENSION`.`month_key`, 
         `TIME_DIMENSION`.`current_year`
     ) `TIME_DIMENSION0` 
 WHERE 
     CAST(`TIME_DIMENSION0`.`current_year` AS CHAR(4)) IN ( 
         '2011' )

;



-- id: 24130
SELECT     `TIME_DIMENSION`.`month_key`, 
     `TIME_DIMENSION`.`current_year`, 
     `Sales`.`Revenue`
 FROM
     (
     SELECT
         (year(`ORDER_HEADER`.`order_date`) * 10000 + month(`ORDER_HEADER`.`order_date`) * 100) + day(`ORDER_HEADER`.`order_date`) AS `Day_key__order_date_`, 
         `ORDER_HEADER`.`order_date` AS `Order_date`, 
         `ORDER_DETAILS`.`quantity` AS `Quantity`, 
         `ORDER_DETAILS`.`unit_sale_price` AS `Unit_sale_price`, 
         `ORDER_DETAILS`.`quantity` * `ORDER_DETAILS`.`unit_sale_price` AS `Revenue`
     FROM
         `gosales1021`.`order_header` `ORDER_HEADER` JOIN `gosales1021`.`order_details` `ORDER_DETAILS` ON `ORDER_HEADER`.`order_number` = `ORDER_DETAILS`.`order_number`
     ) `Sales` JOIN `gosales1021`.`time_dimension` `TIME_DIMENSION` ON `Sales`.`Day_key__order_date_` = `TIME_DIMENSION`.`day_key`

;



-- id: 24266
SELECT     `ORDER_METHOD`.`order_method_en` AS `Order_method`, 
     `Products`.`Product_line` AS `Product_line`, 
     `Products`.`Product_type` AS `Product_type`, 
     SUM(`Sales`.`Quantity`) AS `Quantity`, 
     SUM(`Sales`.`Revenue`) AS `Revenue`
 FROM
     `gosales1021`.`order_method` `ORDER_METHOD` JOIN 
     (
     SELECT
         `ORDER_HEADER`.`order_method_code` AS `Order_method_code`, 
         `ORDER_DETAILS`.`product_number` AS `Product_number`, 
         `ORDER_DETAILS`.`quantity` AS `Quantity`, 
         `ORDER_DETAILS`.`unit_sale_price` AS `Unit_sale_price`, 
         `ORDER_DETAILS`.`quantity` * `ORDER_DETAILS`.`unit_sale_price` AS `Revenue`
     FROM
         `gosales1021`.`order_header` `ORDER_HEADER` JOIN `gosales1021`.`order_details` `ORDER_DETAILS` ON `ORDER_HEADER`.`order_number` = `ORDER_DETAILS`.`order_number`
     ) `Sales` ON `ORDER_METHOD`.`order_method_code` = `Sales`.`Order_method_code` JOIN 
         (
         SELECT
             `PRODUCT_LINE`.`product_line_en` AS `Product_line`, 
             `PRODUCT_TYPE`.`product_type_en` AS `Product_type`, 
             `PRODUCT`.`product_number` AS `Product_number`
         FROM
             `gosales1021`.`product` `PRODUCT` JOIN 
             (
             SELECT
                 `T41`.`product_number` AS `product_number`
             FROM
                 `gosales1021`.`product_name_lookup` `T41` 
             WHERE 
                 `T41`.`product_language` = 'EN'
             ) `T31` ON `PRODUCT`.`product_number` = `T31`.`product_number` JOIN `gosales1021`.`product_color_lookup` `T71` ON `T71`.`product_color_code` = `PRODUCT`.`product_color_code` JOIN `gosales1021`.`product_size_lookup` `T8` ON `T8`.`product_size_code` = `PRODUCT`.`product_size_code` JOIN `gosales1021`.`product_brand` `PRODUCT_BRAND` ON `PRODUCT_BRAND`.`product_brand_code` = `PRODUCT`.`product_brand_code` JOIN `gosales1021`.`product_type` `PRODUCT_TYPE` ON `PRODUCT_TYPE`.`product_type_code` = `PRODUCT`.`product_type_code` JOIN `gosales1021`.`product_line` `PRODUCT_LINE` ON `PRODUCT_LINE`.`product_line_code` = `PRODUCT_TYPE`.`product_line_code`
         ) `Products` ON `Products`.`Product_number` = `Sales`.`Product_number` 
 GROUP BY 
     `ORDER_METHOD`.`order_method_en`, 
     `Products`.`Product_line`, 
     `Products`.`Product_type`

;



-- id: 24392
SELECT     `Products`.`Product_line` AS `Product_line`, 
     SUM(`Sales`.`Revenue`) AS `Revenue`
 FROM
     (
     SELECT
         `PRODUCT_LINE`.`product_line_en` AS `Product_line`, 
         `PRODUCT`.`product_number` AS `Product_number`
     FROM
         `gosales1021`.`product` `PRODUCT` JOIN 
         (
         SELECT
             `T11`.`product_number` AS `product_number`
         FROM
             `gosales1021`.`product_name_lookup` `T11` 
         WHERE 
             `T11`.`product_language` = 'EN'
         ) `T01` ON `PRODUCT`.`product_number` = `T01`.`product_number` JOIN `gosales1021`.`product_color_lookup` `T41` ON `T41`.`product_color_code` = `PRODUCT`.`product_color_code` JOIN `gosales1021`.`product_size_lookup` `T5` ON `T5`.`product_size_code` = `PRODUCT`.`product_size_code` JOIN `gosales1021`.`product_brand` `PRODUCT_BRAND` ON `PRODUCT_BRAND`.`product_brand_code` = `PRODUCT`.`product_brand_code` JOIN `gosales1021`.`product_type` `PRODUCT_TYPE` ON `PRODUCT_TYPE`.`product_type_code` = `PRODUCT`.`product_type_code` JOIN `gosales1021`.`product_line` `PRODUCT_LINE` ON `PRODUCT_LINE`.`product_line_code` = `PRODUCT_TYPE`.`product_line_code`
     ) `Products` JOIN 
     (
     SELECT
         `ORDER_DETAILS`.`product_number` AS `Product_number`, 
         `ORDER_DETAILS`.`quantity` AS `Quantity`, 
         `ORDER_DETAILS`.`unit_sale_price` AS `Unit_sale_price`, 
         `ORDER_DETAILS`.`quantity` * `ORDER_DETAILS`.`unit_sale_price` AS `Revenue`
     FROM
         `gosales1021`.`order_header` `ORDER_HEADER` JOIN `gosales1021`.`order_details` `ORDER_DETAILS` ON `ORDER_HEADER`.`order_number` = `ORDER_DETAILS`.`order_number`
     ) `Sales` ON `Products`.`Product_number` = `Sales`.`Product_number` 
 WHERE 
     'True' = 'True' 
 GROUP BY 
     `Products`.`Product_line` 
 ORDER BY 
     `Product_line` ASC

;



-- id: 24518
SELECT     `Products`.`Product_line` AS `Product_line`, 
     SUM(`Sales`.`Revenue`) AS `Revenue`
 FROM
     (
     SELECT
         `PRODUCT_LINE`.`product_line_en` AS `Product_line`, 
         `PRODUCT`.`product_number` AS `Product_number`
     FROM
         `gosales1021`.`product` `PRODUCT` JOIN 
         (
         SELECT
             `T11`.`product_number` AS `product_number`
         FROM
             `gosales1021`.`product_name_lookup` `T11` 
         WHERE 
             `T11`.`product_language` = 'EN'
         ) `T01` ON `PRODUCT`.`product_number` = `T01`.`product_number` JOIN `gosales1021`.`product_color_lookup` `T41` ON `T41`.`product_color_code` = `PRODUCT`.`product_color_code` JOIN `gosales1021`.`product_size_lookup` `T5` ON `T5`.`product_size_code` = `PRODUCT`.`product_size_code` JOIN `gosales1021`.`product_brand` `PRODUCT_BRAND` ON `PRODUCT_BRAND`.`product_brand_code` = `PRODUCT`.`product_brand_code` JOIN `gosales1021`.`product_type` `PRODUCT_TYPE` ON `PRODUCT_TYPE`.`product_type_code` = `PRODUCT`.`product_type_code` JOIN `gosales1021`.`product_line` `PRODUCT_LINE` ON `PRODUCT_LINE`.`product_line_code` = `PRODUCT_TYPE`.`product_line_code`
     ) `Products` JOIN 
     (
     SELECT
         `ORDER_DETAILS`.`product_number` AS `Product_number`, 
         `ORDER_DETAILS`.`quantity` AS `Quantity`, 
         `ORDER_DETAILS`.`unit_sale_price` AS `Unit_sale_price`, 
         `ORDER_DETAILS`.`quantity` * `ORDER_DETAILS`.`unit_sale_price` AS `Revenue`
     FROM
         `gosales1021`.`order_header` `ORDER_HEADER` JOIN `gosales1021`.`order_details` `ORDER_DETAILS` ON `ORDER_HEADER`.`order_number` = `ORDER_DETAILS`.`order_number`
     ) `Sales` ON `Products`.`Product_number` = `Sales`.`Product_number` 
 WHERE 
     'False' = 'True' 
 GROUP BY 
     `Products`.`Product_line` 
 ORDER BY 
     `Product_line` ASC

;



-- id: 24703
SELECT     `TIME_DIMENSION`.`month_key`, 
     `Sales`.`Sales_staff_code`, 
     `Order0`.`Order_number`, 
     `Products`.`Product`, 
     `Products`.`Product_number`, 
     `Products`.`Product_description`, 
     `Sales`.`Quantity`, 
     `Sales`.`Unit_price`, 
     `Sales`.`Quantity` * `Sales`.`Unit_price`, 
     `ORDER_METHOD`.`order_method_en`, 
     `TIME_DIMENSION`.`day_date`
 FROM
     (
     SELECT
         (year(`ORDER_DETAILS`.`ship_date`) * 10000 + month(`ORDER_DETAILS`.`ship_date`) * 100) + day(`ORDER_DETAILS`.`ship_date`) AS `Day_key__ship_date_`, 
         (year(`ORDER_HEADER`.`order_close_date`) * 10000 + month(`ORDER_HEADER`.`order_close_date`) * 100) + day(`ORDER_HEADER`.`order_close_date`) AS `Day_key__close_date_`, 
         (year(`ORDER_HEADER`.`order_date`) * 10000 + month(`ORDER_HEADER`.`order_date`) * 100) + day(`ORDER_HEADER`.`order_date`) AS `Day_key__order_date_`, 
         `ORDER_HEADER`.`order_number` AS `Order_number`, 
         `ORDER_HEADER`.`retailer_name` AS `Retailer_name`, 
         `ORDER_HEADER`.`retailer_name_mb` AS `Retailer_name__multiscript_`, 
         `ORDER_HEADER`.`retailer_site_code` AS `Retailer_site_code`, 
         `ORDER_HEADER`.`retailer_contact_code` AS `Retailer_contact_code`, 
         `ORDER_HEADER`.`sales_staff_code` AS `Sales_staff_code`, 
         `ORDER_HEADER`.`sales_branch_code` AS `Sales_branch_code`, 
         `ORDER_HEADER`.`order_date` AS `Order_date`, 
         `ORDER_HEADER`.`order_close_date` AS `Order_close_date`, 
         `ORDER_HEADER`.`order_method_code` AS `Order_method_code`, 
         `ORDER_DETAILS`.`order_detail_code` AS `Order_detail_code`, 
         `ORDER_DETAILS`.`ship_date` AS `Ship_date`, 
         `ORDER_DETAILS`.`product_number` AS `Product_number`, 
         `ORDER_DETAILS`.`promotion_code` AS `Promotion_code`, 
         `ORDER_DETAILS`.`quantity` AS `Quantity`, 
         `ORDER_DETAILS`.`unit_cost` AS `Unit_cost`, 
         `ORDER_DETAILS`.`unit_price` AS `Unit_price`, 
         `ORDER_DETAILS`.`unit_sale_price` AS `Unit_sale_price`, 
         `ORDER_DETAILS`.`quantity` * `ORDER_DETAILS`.`unit_sale_price` AS `Revenue`, 
         `ORDER_DETAILS`.`quantity` * `ORDER_DETAILS`.`unit_cost` AS `Product_cost`, 
         `ORDER_DETAILS`.`quantity` * `ORDER_DETAILS`.`unit_sale_price` - `ORDER_DETAILS`.`quantity` * `ORDER_DETAILS`.`unit_cost` AS `Gross_profit`, 
         `ORDER_DETAILS`.`unit_price` * `ORDER_DETAILS`.`quantity` AS `Planned_revenue`
     FROM
         `gosales1021`.`order_header` `ORDER_HEADER` JOIN `gosales1021`.`order_details` `ORDER_DETAILS` ON `ORDER_HEADER`.`order_number` = `ORDER_DETAILS`.`order_number`
     ) `Sales`, 
     `gosales1021`.`order_method` `ORDER_METHOD`, 
     `gosales1021`.`time_dimension` `TIME_DIMENSION`, 
     (
     SELECT
         `PRODUCT`.`product_number` AS `Product_number`, 
         `T161`.`product_name` AS `Product`, 
         `T161`.`product_description` AS `Product_description`
     FROM
         `gosales1021`.`product` `PRODUCT` JOIN 
         (
         SELECT
             `T171`.`product_number` AS `product_number`, 
             `T171`.`product_name` AS `product_name`, 
             `T171`.`product_description` AS `product_description`
         FROM
             `gosales1021`.`product_name_lookup` `T171` 
         WHERE 
             `T171`.`product_language` = 'EN'
         ) `T161` ON `PRODUCT`.`product_number` = `T161`.`product_number` JOIN `gosales1021`.`product_color_lookup` `T201` ON `T201`.`product_color_code` = `PRODUCT`.`product_color_code` JOIN `gosales1021`.`product_size_lookup` `T211` ON `T211`.`product_size_code` = `PRODUCT`.`product_size_code` JOIN `gosales1021`.`product_brand` `PRODUCT_BRAND` ON `PRODUCT_BRAND`.`product_brand_code` = `PRODUCT`.`product_brand_code` JOIN `gosales1021`.`product_type` `PRODUCT_TYPE` ON `PRODUCT_TYPE`.`product_type_code` = `PRODUCT`.`product_type_code` JOIN `gosales1021`.`product_line` `PRODUCT_LINE` ON `PRODUCT_LINE`.`product_line_code` = `PRODUCT_TYPE`.`product_line_code`
     ) `Products`, 
     (
     SELECT
         `Sales`.`Order_number` AS `Order_number`, 
         `Sales`.`Order_detail_code` AS `Order_detail_code`
     FROM
         (
         SELECT
             (year(`ORDER_DETAILS`.`ship_date`) * 10000 + month(`ORDER_DETAILS`.`ship_date`) * 100) + day(`ORDER_DETAILS`.`ship_date`) AS `Day_key__ship_date_`, 
             (year(`ORDER_HEADER`.`order_close_date`) * 10000 + month(`ORDER_HEADER`.`order_close_date`) * 100) + day(`ORDER_HEADER`.`order_close_date`) AS `Day_key__close_date_`, 
             (year(`ORDER_HEADER`.`order_date`) * 10000 + month(`ORDER_HEADER`.`order_date`) * 100) + day(`ORDER_HEADER`.`order_date`) AS `Day_key__order_date_`, 
             `ORDER_HEADER`.`order_number` AS `Order_number`, 
             `ORDER_HEADER`.`retailer_name` AS `Retailer_name`, 
             `ORDER_HEADER`.`retailer_name_mb` AS `Retailer_name__multiscript_`, 
             `ORDER_HEADER`.`retailer_site_code` AS `Retailer_site_code`, 
             `ORDER_HEADER`.`retailer_contact_code` AS `Retailer_contact_code`, 
             `ORDER_HEADER`.`sales_staff_code` AS `Sales_staff_code`, 
             `ORDER_HEADER`.`sales_branch_code` AS `Sales_branch_code`, 
             `ORDER_HEADER`.`order_date` AS `Order_date`, 
             `ORDER_HEADER`.`order_close_date` AS `Order_close_date`, 
             `ORDER_HEADER`.`order_method_code` AS `Order_method_code`, 
             `ORDER_DETAILS`.`order_detail_code` AS `Order_detail_code`, 
             `ORDER_DETAILS`.`ship_date` AS `Ship_date`, 
             `ORDER_DETAILS`.`product_number` AS `Product_number`, 
             `ORDER_DETAILS`.`promotion_code` AS `Promotion_code`, 
             `ORDER_DETAILS`.`quantity` AS `Quantity`, 
             `ORDER_DETAILS`.`unit_cost` AS `Unit_cost`, 
             `ORDER_DETAILS`.`unit_price` AS `Unit_price`, 
             `ORDER_DETAILS`.`unit_sale_price` AS `Unit_sale_price`, 
             `ORDER_DETAILS`.`quantity` * `ORDER_DETAILS`.`unit_sale_price` AS `Revenue`, 
             `ORDER_DETAILS`.`quantity` * `ORDER_DETAILS`.`unit_cost` AS `Product_cost`, 
             `ORDER_DETAILS`.`quantity` * `ORDER_DETAILS`.`unit_sale_price` - `ORDER_DETAILS`.`quantity` * `ORDER_DETAILS`.`unit_cost` AS `Gross_profit`, 
             `ORDER_DETAILS`.`unit_price` * `ORDER_DETAILS`.`quantity` AS `Planned_revenue`
         FROM
             `gosales1021`.`order_header` `ORDER_HEADER` JOIN `gosales1021`.`order_details` `ORDER_DETAILS` ON `ORDER_HEADER`.`order_number` = `ORDER_DETAILS`.`order_number`
         ) `Sales`
     ) `Order0` 
 WHERE 
     `ORDER_METHOD`.`order_method_code` = `Sales`.`Order_method_code` AND
     `Sales`.`Day_key__order_date_` = `TIME_DIMENSION`.`day_key` AND
     `Products`.`Product_number` = `Sales`.`Product_number` AND
     `Sales`.`Order_detail_code` = `Order0`.`Order_detail_code` 
 ORDER BY 
     `Sales`.`Sales_staff_code` ASC

;



-- id: 24826
SELECT     `Products`.`Product_line` AS `Product_line`, 
     SUM(`Sales`.`Revenue`) AS `Revenue`
 FROM
     (
     SELECT
         `PRODUCT_LINE`.`product_line_en` AS `Product_line`, 
         `PRODUCT`.`product_number` AS `Product_number`
     FROM
         `gosales1021`.`product` `PRODUCT` JOIN 
         (
         SELECT
             `T11`.`product_number` AS `product_number`
         FROM
             `gosales1021`.`product_name_lookup` `T11` 
         WHERE 
             `T11`.`product_language` = 'EN'
         ) `T01` ON `PRODUCT`.`product_number` = `T01`.`product_number` JOIN `gosales1021`.`product_color_lookup` `T41` ON `T41`.`product_color_code` = `PRODUCT`.`product_color_code` JOIN `gosales1021`.`product_size_lookup` `T5` ON `T5`.`product_size_code` = `PRODUCT`.`product_size_code` JOIN `gosales1021`.`product_brand` `PRODUCT_BRAND` ON `PRODUCT_BRAND`.`product_brand_code` = `PRODUCT`.`product_brand_code` JOIN `gosales1021`.`product_type` `PRODUCT_TYPE` ON `PRODUCT_TYPE`.`product_type_code` = `PRODUCT`.`product_type_code` JOIN `gosales1021`.`product_line` `PRODUCT_LINE` ON `PRODUCT_LINE`.`product_line_code` = `PRODUCT_TYPE`.`product_line_code`
     ) `Products` JOIN 
     (
     SELECT
         `ORDER_DETAILS`.`product_number` AS `Product_number`, 
         `ORDER_DETAILS`.`quantity` AS `Quantity`, 
         `ORDER_DETAILS`.`unit_sale_price` AS `Unit_sale_price`, 
         `ORDER_DETAILS`.`quantity` * `ORDER_DETAILS`.`unit_sale_price` AS `Revenue`
     FROM
         `gosales1021`.`order_header` `ORDER_HEADER` JOIN `gosales1021`.`order_details` `ORDER_DETAILS` ON `ORDER_HEADER`.`order_number` = `ORDER_DETAILS`.`order_number`
     ) `Sales` ON `Products`.`Product_number` = `Sales`.`Product_number` 
 GROUP BY 
     `Products`.`Product_line`

;



-- id: 24856
SELECT     `TIME_DIMENSION`.`month_key`, 
     `TIME_DIMENSION`.`current_year`, 
     `Sales`.`Revenue`
 FROM
     (
     SELECT
         (year(`ORDER_HEADER`.`order_date`) * 10000 + month(`ORDER_HEADER`.`order_date`) * 100) + day(`ORDER_HEADER`.`order_date`) AS `Day_key__order_date_`, 
         `ORDER_HEADER`.`order_date` AS `Order_date`, 
         `ORDER_DETAILS`.`quantity` AS `Quantity`, 
         `ORDER_DETAILS`.`unit_sale_price` AS `Unit_sale_price`, 
         `ORDER_DETAILS`.`quantity` * `ORDER_DETAILS`.`unit_sale_price` AS `Revenue`
     FROM
         `gosales1021`.`order_header` `ORDER_HEADER` JOIN `gosales1021`.`order_details` `ORDER_DETAILS` ON `ORDER_HEADER`.`order_number` = `ORDER_DETAILS`.`order_number`
     ) `Sales` JOIN `gosales1021`.`time_dimension` `TIME_DIMENSION` ON `Sales`.`Day_key__order_date_` = `TIME_DIMENSION`.`day_key`

;



-- id: 24899
SELECT     `TIME_DIMENSION`.`month_key`, 
     `TIME_DIMENSION`.`current_year`, 
     `ORDER_METHOD`.`order_method_en`, 
     `Sales`.`Quantity`, 
     `Sales`.`Revenue`
 FROM
     `gosales1021`.`order_method` `ORDER_METHOD` JOIN 
     (
     SELECT
         (year(`ORDER_HEADER`.`order_date`) * 10000 + month(`ORDER_HEADER`.`order_date`) * 100) + day(`ORDER_HEADER`.`order_date`) AS `Day_key__order_date_`, 
         `ORDER_HEADER`.`order_date` AS `Order_date`, 
         `ORDER_HEADER`.`order_method_code` AS `Order_method_code`, 
         `ORDER_DETAILS`.`quantity` AS `Quantity`, 
         `ORDER_DETAILS`.`unit_sale_price` AS `Unit_sale_price`, 
         `ORDER_DETAILS`.`quantity` * `ORDER_DETAILS`.`unit_sale_price` AS `Revenue`
     FROM
         `gosales1021`.`order_header` `ORDER_HEADER` JOIN `gosales1021`.`order_details` `ORDER_DETAILS` ON `ORDER_HEADER`.`order_number` = `ORDER_DETAILS`.`order_number`
     ) `Sales` ON `ORDER_METHOD`.`order_method_code` = `Sales`.`Order_method_code` JOIN `gosales1021`.`time_dimension` `TIME_DIMENSION` ON `Sales`.`Day_key__order_date_` = `TIME_DIMENSION`.`day_key`

;



-- id: 718
SELECT `T5`.`expense_group_code` AS `column0`, `T5`.`expense_type_code` AS `column1`, `T01`.`organization_code1` AS `column2`, `T01`.`organization_code2` AS `column3`, `T01`.`organization_code` AS `column4`, SUM(`EMP_EXPENSE_FACT`.`expense_total`) AS `column5` FROM `gosalesdw1021`.`emp_expense_fact` `EMP_EXPENSE_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_EXPENSE_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN ( SELECT `go_org_dim_2`.`organization_key`, `go_org_dim_1`.`organization_parent` AS `organization_code1`, `go_org_dim_2`.`organization_parent` AS `organization_code2`, `go_org_dim_2`.`organization_code` FROM `gosalesdw1021`.`go_org_dim` `go_org_dim_2` JOIN `gosalesdw1021`.`go_org_dim` `go_org_dim_1` ON `go_org_dim_2`.`organization_parent` = `go_org_dim_1`.`organization_code` WHERE `go_org_dim_2`.`organization_code` BETWEEN '006' AND '8820' ) `T01` ON `T01`.`organization_key` = `EMP_EXPENSE_FACT`.`organization_key` JOIN `gosalesdw1021`.`emp_expense_type_dim` `T5` ON `EMP_EXPENSE_FACT`.`expense_type_key` = `T5`.`expense_type_key` WHERE CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND `T5`.`expense_group_code` = 400 AND `T5`.`expense_type_code` = 31 AND `T01`.`organization_code1` = 'GOCEU' AND `T01`.`organization_code2` = 'GOCEUOP' AND `T01`.`organization_code` IN ( '023', '006', '014', '013' ) GROUP BY `T5`.`expense_group_code`, `T5`.`expense_type_code`, `T01`.`organization_code1`, `T01`.`organization_code2`, `T01`.`organization_code` 
 

;



-- id: 799
SELECT `T5`.`expense_group_code` AS `column0`,
 `T5`.`expense_type_code` AS `column1`,
 `T01`.`organization_code1` AS `column2`,
 `T01`.`organization_code2` AS `column3`,
 `T01`.`organization_code` AS `column4`,
 SUM(`EMP_EXPENSE_FACT`.`expense_total`) AS `column5`
 FROM `gosalesdw1021`.`emp_expense_fact` `EMP_EXPENSE_FACT`
 JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_EXPENSE_FACT`.`day_key` = `GO_TIME_DIM`.`day_key`
 JOIN
 (
    SELECT
    `go_org_dim_2`.`organization_key`,
    `go_org_dim_1`.`organization_parent` AS `organization_code1`,
    `go_org_dim_2`.`organization_parent` AS `organization_code2`,
    `go_org_dim_2`.`organization_code`
    FROM `gosalesdw1021`.`go_org_dim` `go_org_dim_2`
    JOIN `gosalesdw1021`.`go_org_dim` `go_org_dim_1` ON `go_org_dim_2`.`organization_parent` = `go_org_dim_1`.`organization_code`
    WHERE `go_org_dim_2`.`organization_code` BETWEEN '006'
    AND '8820'
 )
 `T01` ON `T01`.`organization_key` = `EMP_EXPENSE_FACT`.`organization_key`
 JOIN `gosalesdw1021`.`emp_expense_type_dim` `T5` ON `EMP_EXPENSE_FACT`.`expense_type_key` = `T5`.`expense_type_key`
 WHERE 
  `T5`.`expense_group_code` = 400
 AND `T5`.`expense_type_code` = 31
 AND `T01`.`organization_code1` = 'GOCEU'
 AND `T01`.`organization_code2` = 'GOCEUOP'
 AND `T01`.`organization_code` IN ( '023', '006', '014', '013' )
 GROUP BY `T5`.`expense_group_code`,
 `T5`.`expense_type_code`,
 `T01`.`organization_code1`,
 `T01`.`organization_code2`,
 `T01`.`organization_code`
 
 

;



-- id: 859
SELECT `T5`.`expense_group_code` AS `column0`,
 `T5`.`expense_type_code` AS `column1`,
 `T01`.`organization_code1` AS `column2`,
 `T01`.`organization_code2` AS `column3`,
 `T01`.`organization_code` AS `column4`
 FROM `gosalesdw1021`.`emp_expense_fact` `EMP_EXPENSE_FACT`
 JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_EXPENSE_FACT`.`day_key` = `GO_TIME_DIM`.`day_key`
 JOIN
 (
    SELECT
    `go_org_dim_2`.`organization_key`,
    `go_org_dim_1`.`organization_parent` AS `organization_code1`,
    `go_org_dim_2`.`organization_parent` AS `organization_code2`,
    `go_org_dim_2`.`organization_code`
    FROM `gosalesdw1021`.`go_org_dim` `go_org_dim_2`
    JOIN `gosalesdw1021`.`go_org_dim` `go_org_dim_1` ON `go_org_dim_2`.`organization_parent` = `go_org_dim_1`.`organization_code`
    WHERE `go_org_dim_2`.`organization_code` BETWEEN '006'
    AND '8820'
 )
 `T01` ON `T01`.`organization_key` = `EMP_EXPENSE_FACT`.`organization_key`
 JOIN `gosalesdw1021`.`emp_expense_type_dim` `T5` ON `EMP_EXPENSE_FACT`.`expense_type_key` = `T5`.`expense_type_key`
 WHERE 
  `T5`.`expense_group_code` = 400
 AND `T5`.`expense_type_code` = 31
 AND `T01`.`organization_code1` = 'GOCEU'
 AND `T01`.`organization_code2` = 'GOCEUOP'
 AND `T01`.`organization_code` IN ( '023', '006', '014', '013' )
 
 

;



-- id: 927
SELECT `T5`.`expense_group_code` AS `column0`,
 `T5`.`expense_type_code` AS `column1`,
 `T01`.`organization_code1` AS `column2`,
 `T01`.`organization_code2` AS `column3`,
 `T01`.`organization_code` AS `column4`
 FROM `gosalesdw1021`.`emp_expense_fact` `EMP_EXPENSE_FACT`
 JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_EXPENSE_FACT`.`day_key` = `GO_TIME_DIM`.`day_key`
 JOIN
 (
    SELECT
    `go_org_dim_2`.`organization_key`,
    `go_org_dim_1`.`organization_parent` AS `organization_code1`,
    `go_org_dim_2`.`organization_parent` AS `organization_code2`,
    `go_org_dim_2`.`organization_code`
    FROM `gosalesdw1021`.`go_org_dim` `go_org_dim_2`
    JOIN `gosalesdw1021`.`go_org_dim` `go_org_dim_1` ON `go_org_dim_2`.`organization_parent` = `go_org_dim_1`.`organization_code`
    WHERE `go_org_dim_2`.`organization_code` BETWEEN '006'
    AND '8820'
 )
 `T01` ON `T01`.`organization_key` = `EMP_EXPENSE_FACT`.`organization_key`
 JOIN `gosalesdw1021`.`emp_expense_type_dim` `T5` ON `EMP_EXPENSE_FACT`.`expense_type_key` = `T5`.`expense_type_key`
 WHERE  `T5`.`expense_group_code` = 400
 AND `T5`.`expense_type_code` = 31
 AND `T01`.`organization_code1` = 'GOCEU'
 AND `T01`.`organization_code2` = 'GOCEUOP'
 AND `T01`.`organization_code` IN ( '023', '006', '014', '013' )
 
 

;



-- id: 1115
SELECT `T5`.`expense_group_code` AS `column0`, `T5`.`expense_type_code` AS `column1`, `T01`.`organization_code1` AS `column2`, `T01`.`organization_code2` AS `column3`, `T01`.`organization_code` AS `column4`, SUM(`EMP_EXPENSE_FACT`.`expense_total`) AS `column5` FROM `gosalesdw1021`.`emp_expense_fact` `EMP_EXPENSE_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_EXPENSE_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN ( SELECT `go_org_dim_2`.`organization_key`, `go_org_dim_1`.`organization_parent` AS `organization_code1`, `go_org_dim_2`.`organization_parent` AS `organization_code2`, `go_org_dim_2`.`organization_code` FROM `gosalesdw1021`.`go_org_dim` `go_org_dim_2` JOIN `gosalesdw1021`.`go_org_dim` `go_org_dim_1` ON `go_org_dim_2`.`organization_parent` = `go_org_dim_1`.`organization_code` WHERE `go_org_dim_2`.`organization_code` BETWEEN '006' AND '8820' ) `T01` ON `T01`.`organization_key` = `EMP_EXPENSE_FACT`.`organization_key` JOIN `gosalesdw1021`.`emp_expense_type_dim` `T5` ON `EMP_EXPENSE_FACT`.`expense_type_key` = `T5`.`expense_type_key` WHERE CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND `T5`.`expense_group_code` = 400 AND `T5`.`expense_type_code` = 31 AND `T01`.`organization_code1` = 'GOCEU' AND `T01`.`organization_code2` = 'GOCEUOP' AND `T01`.`organization_code` IN ( '023', '006', '014', '013' ) GROUP BY `T5`.`expense_group_code`, `T5`.`expense_type_code`, `T01`.`organization_code1`, `T01`.`organization_code2`, `T01`.`organization_code` 
 

;



-- id: 1185
SELECT `T5`.`expense_group_code` AS `column0`,
 `T5`.`expense_type_code` AS `column1`,
 `T01`.`organization_code1` AS `column2`,
 `T01`.`organization_code2` AS `column3`,
 `T01`.`organization_code` AS `column4`,
 SUM(`EMP_EXPENSE_FACT`.`expense_total`) AS `column5`
 FROM `gosalesdw1021`.`emp_expense_fact` `EMP_EXPENSE_FACT`
 JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_EXPENSE_FACT`.`day_key` = `GO_TIME_DIM`.`day_key`
 JOIN
 (
    SELECT
    `go_org_dim_2`.`organization_key`,
    `go_org_dim_1`.`organization_parent` AS `organization_code1`,
    `go_org_dim_2`.`organization_parent` AS `organization_code2`,
    `go_org_dim_2`.`organization_code`
    FROM `gosalesdw1021`.`go_org_dim` `go_org_dim_2`
    JOIN `gosalesdw1021`.`go_org_dim` `go_org_dim_1` ON `go_org_dim_2`.`organization_parent` = `go_org_dim_1`.`organization_code`
    WHERE `go_org_dim_2`.`organization_code` BETWEEN '006'
    AND '8820'
 )
 `T01` ON `T01`.`organization_key` = `EMP_EXPENSE_FACT`.`organization_key`
 JOIN `gosalesdw1021`.`emp_expense_type_dim` `T5` ON `EMP_EXPENSE_FACT`.`expense_type_key` = `T5`.`expense_type_key`
 WHERE CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012'
 AND `T5`.`expense_group_code` = 400
 AND `T5`.`expense_type_code` = 31
 AND `T01`.`organization_code1` = 'GOCEU'
 AND `T01`.`organization_code2` = 'GOCEUOP'
 AND `T01`.`organization_code` IN ( '023', '006', '014', '013' )
 GROUP BY `T5`.`expense_group_code`,
 `T5`.`expense_type_code`,
 `T01`.`organization_code1`,
 `T01`.`organization_code2`,
 `T01`.`organization_code`
 
 

;



