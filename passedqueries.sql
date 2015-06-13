-- id: 1380
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 1401
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     concat(`T2`.`quarter_en`, ' '), 
     `GO_TIME_DIM0`.`current_year`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T2` ON `GO_TIME_DIM0`.`quarter_key` = `T2`.`quarter_key`
 
 

;



-- id: 1446
SELECT     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T41`.`product_line_en`, 
     `SLS_PRODUCT_DIM`.`product_type_key`, 
     `T5`.`product_type_en`, 
     `SLS_PRODUCT_DIM`.`base_product_key`, 
     `T01`.`product_name`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T41` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T41`.`product_line_code` JOIN 
         (
         SELECT
             `T11`.`product_number` AS `product_number`, 
             `T11`.`product_name` AS `product_name`
         FROM
             `gosalesdw1021`.`sls_product_lookup` `T11` 
         WHERE 
             `T11`.`product_language` = 'EN'
         ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T5` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T5`.`product_type_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC, 
     `SLS_PRODUCT_DIM`.`product_type_key` ASC, 
     `SLS_PRODUCT_DIM`.`base_product_key` ASC
 
 

;



-- id: 1570
SELECT     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column0`, 
     `GO_TIME_DIM`.`quarter_key` AS `column1`, 
     `Product`.`Product_line_code` AS `column2`, 
     `Product`.`Product_type_key` AS `column3`, 
     `Product`.`Base_product_key` AS `column4`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column5`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
         (
         SELECT
             `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
             `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
             `SLS_PRODUCT_DIM`.`base_product_key` AS `Base_product_key`, 
             `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
         FROM
             `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                         (
                         SELECT
                             `T11`.`product_number` AS `product_number`
                         FROM
                             `gosalesdw1021`.`sls_product_lookup` `T11` 
                         WHERE 
                             `T11`.`product_language` = 'EN'
                         ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
         ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 GROUP BY 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`, 
     `Product`.`Base_product_key` 
 ORDER BY 
     `column2` ASC, 
     `column3` ASC, 
     `column4` ASC
 
 

;



-- id: 1694
SELECT     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column0`, 
     `GO_TIME_DIM`.`quarter_key` AS `column1`, 
     `Product`.`Product_line_code` AS `column2`, 
     `Product`.`Product_type_key` AS `column3`, 
     `Product`.`Base_product_key` AS `column4`, 
     SUM(`T10`.`sale_total`) AS `column5`
 FROM
     `gosalesdw1021`.`mrk_promotion_fact` `T10` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T10`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
         (
         SELECT
             `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
             `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
             `SLS_PRODUCT_DIM`.`base_product_key` AS `Base_product_key`, 
             `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
         FROM
             `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                         (
                         SELECT
                             `T11`.`product_number` AS `product_number`
                         FROM
                             `gosalesdw1021`.`sls_product_lookup` `T11` 
                         WHERE 
                             `T11`.`product_language` = 'EN'
                         ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
         ) `Product` ON `T10`.`product_key` = `Product`.`Product_key` 
 GROUP BY 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`, 
     `Product`.`Base_product_key` 
 ORDER BY 
     `column2` ASC, 
     `column3` ASC, 
     `column4` ASC
 
 

;



-- id: 1709
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 1716
SELECT     `T0`.`REGION_CODE`, 
     `T0`.`Region`, 
     `T0`.`COUNTRY_KEY`, 
     `T0`.`Country`
 FROM
     (
     SELECT
         `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
         `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
         `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
         `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
         `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
         `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
         `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
         `GO_REGION_DIM`.`region_en` AS `Region`, 
         `GO_REGION_DIM`.`country_en` AS `Country`, 
         concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
     FROM
         `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
     ) `T0` 
 ORDER BY 
     `T0`.`REGION_CODE` ASC, 
     `T0`.`COUNTRY_KEY` ASC
 
 

;



-- id: 1735
SELECT     `T0`.`REGION_CODE`, 
     `T0`.`Region`, 
     `T0`.`COUNTRY_KEY`, 
     `T0`.`Country`, 
     `SLS_RETAILER_DIM`.`retailer_key`, 
     `SLS_RETAILER_DIM`.`retailer_name`, 
     `SLS_RETAILER_DIM`.`retailer_name_mb`
 FROM
     (
     SELECT
         `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
         `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
         `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
         `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
         `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
         `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
         `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
         `GO_REGION_DIM`.`region_en` AS `Region`, 
         `GO_REGION_DIM`.`country_en` AS `Country`, 
         concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
     FROM
         `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
     ) `T0` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T0`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code` 
 ORDER BY 
     `T0`.`REGION_CODE` ASC, 
     `T0`.`COUNTRY_KEY` ASC, 
     `SLS_RETAILER_DIM`.`retailer_key` ASC
 
 

;



-- id: 1790
SELECT     `Retailer_site`.`Region_code` AS `column0`, 
     `Retailer_site`.`Retailer_country_key` AS `column1`, 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column2`, 
     `Retailer_site`.`Region_code` AS `column3`, 
     `Retailer_site`.`Retailer_country_key` AS `column4`, 
     `Retailer_site`.`Retailer_key` AS `column5`, 
     SUM(`T6`.`sales_target`) AS `column6`
 FROM
     `gosalesdw1021`.`sls_sales_targ_fact` `T6` JOIN 
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` ON `T6`.`month_key` = `GO_TIME_DIM0`.`month_key` JOIN 
         (
         SELECT
             `T21`.`REGION_CODE` AS `Region_code`, 
             `T21`.`COUNTRY_KEY` AS `Retailer_country_key`, 
             `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`
         FROM
             (
             SELECT
                 `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
                 `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
                 `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
                 `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
                 `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
                 `GO_REGION_DIM`.`region_en` AS `Region`, 
                 `GO_REGION_DIM`.`country_en` AS `Country`, 
                 concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
             FROM
                 `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
             ) `T21` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T21`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code` 
         GROUP BY 
             `T21`.`REGION_CODE`, 
             `T21`.`COUNTRY_KEY`, 
             `SLS_RETAILER_DIM`.`retailer_key`
         ) `Retailer_site` ON 
             `T6`.`retailer_key` = `Retailer_site`.`Retailer_key` AND
             `T6`.`rtl_country_key` = `Retailer_site`.`Retailer_country_key` 
 GROUP BY 
     `Retailer_site`.`Region_code`, 
     `Retailer_site`.`Retailer_country_key`, 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `Retailer_site`.`Retailer_key`
 
 

;



-- id: 1838
SELECT     `GO_REGION_DIM`.`region_code` AS `column0`, 
     `GO_REGION_DIM`.`region_en` AS `column1`, 
     `GO_REGION_DIM`.`country_code` AS `column2`, 
     `GO_REGION_DIM`.`country_en` AS `column3`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`emp_summary_fact` `EMP_SUMMARY_FACT` ON `EMP_SUMMARY_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` 
 WHERE 
     `EMP_SUMMARY_FACT`.`bonus` > 0 
 GROUP BY 
     `GO_REGION_DIM`.`region_code`, 
     `GO_REGION_DIM`.`region_en`, 
     `GO_REGION_DIM`.`country_code`, 
     `GO_REGION_DIM`.`country_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC, 
     `column3` ASC, 
     `column2` ASC
 
 

;



-- id: 1886
SELECT     `GO_REGION_DIM`.`country_code` AS `column0`, 
     `EMP_EMPLOYEE_DIM`.`employee_key` AS `column1`, 
     `EMP_EMPLOYEE_DIM`.`employee_name` AS `column2`, 
     `EMP_EMPLOYEE_DIM`.`employee_name_mb` AS `column3`, 
     `GO_REGION_DIM`.`country_en` AS `C_sortColumn0`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`emp_summary_fact` `EMP_SUMMARY_FACT` ON `EMP_SUMMARY_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` 
 WHERE 
     `EMP_SUMMARY_FACT`.`bonus` > 0 
 GROUP BY 
     `GO_REGION_DIM`.`country_code`, 
     `EMP_EMPLOYEE_DIM`.`employee_key`, 
     `EMP_EMPLOYEE_DIM`.`employee_name`, 
     `EMP_EMPLOYEE_DIM`.`employee_name_mb`, 
     `GO_REGION_DIM`.`country_en` 
 ORDER BY 
     `C_sortColumn0` ASC, 
     `column0` ASC, 
     `column2` ASC, 
     `column3` ASC, 
     `column1` ASC
 
 

;



-- id: 1946
SELECT     `GO_REGION_DIM`.`region_code` AS `column0`, 
     `GO_REGION_DIM`.`country_code` AS `column1`, 
     `EMP_EMPLOYEE_DIM`.`employee_key` AS `column2`, 
     AVG(`EMP_SUMMARY_FACT`.`bonus`) AS `column3`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`emp_summary_fact` `EMP_SUMMARY_FACT` ON `EMP_SUMMARY_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_SUMMARY_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` 
 WHERE 
     `EMP_SUMMARY_FACT`.`bonus` > 0 AND
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 
 GROUP BY 
     `GO_REGION_DIM`.`region_code`, 
     `GO_REGION_DIM`.`country_code`, 
     `EMP_EMPLOYEE_DIM`.`employee_key`
 
 

;



-- id: 1969
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `T2`.`Position_name__level_1_` AS `column1`
 FROM
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_1_`, 
         `T11`.`position_code` AS `Position_code__level_1_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T2` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T2`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `T2`.`Position_name__level_1_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 2005
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `T3`.`Position_name__level_2_` AS `column2`, 
     `T21`.`Position_name__level_1_` AS `C_sortColumn0`
 FROM
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_1_`, 
         `T11`.`position_code` AS `Position_code__level_1_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T21`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
         (
         SELECT
             `T11`.`position_en` AS `Position_name__level_2_`, 
             `T11`.`position_code` AS `Position_code__level_2_`
         FROM
             `gosalesdw1021`.`emp_position_lookup` `T11`
         ) `T3` ON `T3`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `T3`.`Position_name__level_2_`, 
     `T21`.`Position_name__level_1_` 
 ORDER BY 
     `C_sortColumn0` ASC, 
     `column0` ASC, 
     `column2` ASC, 
     `column1` ASC
 
 

;



-- id: 2055
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     `T21`.`Position_name__level_3_` AS `column3`, 
     `T31`.`Position_name__level_1_` AS `C_sortColumn0`, 
     `T4`.`Position_name__level_2_` AS `C_sortColumn1`
 FROM
     `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` JOIN 
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_3_`, 
         `T11`.`position_code` AS `Position_code__level_3_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` ON `EMP_POSITION_DIM`.`position_code3` = `T21`.`Position_code__level_3_` JOIN 
         (
         SELECT
             `T11`.`position_en` AS `Position_name__level_1_`, 
             `T11`.`position_code` AS `Position_code__level_1_`
         FROM
             `gosalesdw1021`.`emp_position_lookup` `T11`
         ) `T31` ON `T31`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
             (
             SELECT
                 `T11`.`position_en` AS `Position_name__level_2_`, 
                 `T11`.`position_code` AS `Position_code__level_2_`
             FROM
                 `gosalesdw1021`.`emp_position_lookup` `T11`
             ) `T4` ON `T4`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T21`.`Position_name__level_3_`, 
     `T31`.`Position_name__level_1_`, 
     `T4`.`Position_name__level_2_` 
 ORDER BY 
     `C_sortColumn0` ASC, 
     `column0` ASC, 
     `C_sortColumn1` ASC, 
     `column1` ASC, 
     `column3` ASC, 
     `column2` ASC
 
 

;



-- id: 2065
SELECT     `T0`.`employee_topic_key` AS `column0`, 
     `T0`.`employee_topic_en` AS `column1`
 FROM
     `gosalesdw1021`.`emp_survey_topic_dim` `T0` 
 GROUP BY 
     `T0`.`employee_topic_key`, 
     `T0`.`employee_topic_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 2111
SELECT     `T3`.`employee_topic_key` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code1` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column2`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column3`, 
     AVG(`EMP_SURVEY_FACT`.`employee_topic_score`) AS `column4`
 FROM
     `gosalesdw1021`.`emp_survey_fact` `EMP_SURVEY_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_SURVEY_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `EMP_SURVEY_FACT`.`position_key` = `EMP_POSITION_DIM`.`position_key` JOIN `gosalesdw1021`.`emp_survey_topic_dim` `T3` ON `T3`.`employee_topic_key` = `EMP_SURVEY_FACT`.`employee_topic_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 
 GROUP BY 
     `T3`.`employee_topic_key`, 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`
 
 

;



-- id: 2144
SELECT     `T2`.`employee_topic_key` AS `column0`, 
     AVG(`EMP_SURVEY_FACT`.`employee_topic_score`) AS `column1`
 FROM
     `gosalesdw1021`.`emp_survey_fact` `EMP_SURVEY_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_SURVEY_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_survey_topic_dim` `T2` ON `T2`.`employee_topic_key` = `EMP_SURVEY_FACT`.`employee_topic_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 
 GROUP BY 
     `T2`.`employee_topic_key`
 
 

;



-- id: 2182
SELECT     `T3`.`employee_topic_key` AS `column0`, 
     AVG(`T21`.`employee_topic_target`) AS `column1`
 FROM
     `gosalesdw1021`.`emp_survey_targ_fact` `T21` JOIN 
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     WHERE 
         `GO_TIME_DIM`.`month_number` >= 25 AND
         `GO_TIME_DIM`.`month_number` <= 36 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`
     ) `GO_TIME_DIM0` ON `T21`.`month_key` = `GO_TIME_DIM0`.`month_key` JOIN `gosalesdw1021`.`emp_survey_topic_dim` `T3` ON `T3`.`employee_topic_key` = `T21`.`employee_topic_key` 
 GROUP BY 
     `T3`.`employee_topic_key`
 
 

;



-- id: 2206
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `T2`.`Position_name__level_1_` AS `column1`
 FROM
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_1_`, 
         `T11`.`position_code` AS `Position_code__level_1_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T2` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T2`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` 
 WHERE 
     `EMP_POSITION_DIM`.`position_code3` < 1000 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `T2`.`Position_name__level_1_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 2243
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `T3`.`Position_name__level_2_` AS `column2`, 
     `T21`.`Position_name__level_1_` AS `C_sortColumn0`
 FROM
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_1_`, 
         `T11`.`position_code` AS `Position_code__level_1_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T21`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
         (
         SELECT
             `T11`.`position_en` AS `Position_name__level_2_`, 
             `T11`.`position_code` AS `Position_code__level_2_`
         FROM
             `gosalesdw1021`.`emp_position_lookup` `T11`
         ) `T3` ON `T3`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 WHERE 
     `EMP_POSITION_DIM`.`position_code3` < 1000 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `T3`.`Position_name__level_2_`, 
     `T21`.`Position_name__level_1_` 
 ORDER BY 
     `C_sortColumn0` ASC, 
     `column0` ASC, 
     `column2` ASC, 
     `column1` ASC
 
 

;



-- id: 2294
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     `T21`.`Position_name__level_3_` AS `column3`, 
     `T31`.`Position_name__level_1_` AS `C_sortColumn0`, 
     `T4`.`Position_name__level_2_` AS `C_sortColumn1`
 FROM
     `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` JOIN 
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_3_`, 
         `T11`.`position_code` AS `Position_code__level_3_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` ON `EMP_POSITION_DIM`.`position_code3` = `T21`.`Position_code__level_3_` JOIN 
         (
         SELECT
             `T11`.`position_en` AS `Position_name__level_1_`, 
             `T11`.`position_code` AS `Position_code__level_1_`
         FROM
             `gosalesdw1021`.`emp_position_lookup` `T11`
         ) `T31` ON `T31`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
             (
             SELECT
                 `T11`.`position_en` AS `Position_name__level_2_`, 
                 `T11`.`position_code` AS `Position_code__level_2_`
             FROM
                 `gosalesdw1021`.`emp_position_lookup` `T11`
             ) `T4` ON `T4`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 WHERE 
     `EMP_POSITION_DIM`.`position_code3` < 1000 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T21`.`Position_name__level_3_`, 
     `T31`.`Position_name__level_1_`, 
     `T4`.`Position_name__level_2_` 
 ORDER BY 
     `C_sortColumn0` ASC, 
     `column0` ASC, 
     `C_sortColumn1` ASC, 
     `column1` ASC, 
     `column3` ASC, 
     `column2` ASC
 
 

;



-- id: 2306
SELECT     `EMP_RANKING_DIM`.`employee_ranking_key` AS `column0`, 
     `EMP_RANKING_DIM`.`ranking_description_en` AS `column1`
 FROM
     `gosalesdw1021`.`emp_ranking_dim` `EMP_RANKING_DIM` 
 WHERE 
     `EMP_RANKING_DIM`.`employee_ranking_key` = 2391 OR
     `EMP_RANKING_DIM`.`employee_ranking_key` = 2392 OR
     `EMP_RANKING_DIM`.`employee_ranking_key` = 2394 OR
     `EMP_RANKING_DIM`.`employee_ranking_key` = 2393 OR
     `EMP_RANKING_DIM`.`employee_ranking_key` = 2395 
 GROUP BY 
     `EMP_RANKING_DIM`.`employee_ranking_key`, 
     `EMP_RANKING_DIM`.`ranking_description_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 2352
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     `EMP_RANKING_DIM`.`employee_ranking_key` AS `column3`, 
     COUNT(`EMP_RANKING_FACT`.`ranking_code`) AS `column4`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` JOIN `gosalesdw1021`.`emp_ranking_fact` `EMP_RANKING_FACT` ON `GO_TIME_DIM`.`day_key` = `EMP_RANKING_FACT`.`day_key` JOIN `gosalesdw1021`.`emp_ranking_dim` `EMP_RANKING_DIM` ON `EMP_RANKING_DIM`.`employee_ranking_key` = `EMP_RANKING_FACT`.`employee_ranking_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `EMP_RANKING_FACT`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     `EMP_POSITION_DIM`.`position_code3` < 1000 AND
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `EMP_RANKING_DIM`.`employee_ranking_key` = 2391 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `EMP_RANKING_DIM`.`employee_ranking_key`
 
 

;



-- id: 2388
SELECT     `T01`.`position_code1`, 
     `T01`.`position_code2`, 
     `T01`.`position_code3`, 
     `T01`.`column3`, 
     `T01`.`Sum1`
 FROM
     (
     SELECT
         `EMP_POSITION_DIM`.`position_code3` AS `position_code3`, 
         `EMP_POSITION_DIM`.`position_code2` AS `position_code2`, 
         `EMP_POSITION_DIM`.`position_code1` AS `position_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `C`, 
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `C1`, 
         SUM(`T2`.`position_count`) AS `column3`, 
         SUM(`T2`.`terminations`) AS `Sum1`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` JOIN `gosalesdw1021`.`emp_position_summary_fact` `T2` ON `GO_TIME_DIM`.`day_key` = `T2`.`day_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T2`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
     WHERE 
         `EMP_POSITION_DIM`.`position_code3` < 1000 AND
         `GO_TIME_DIM`.`month_number` >= 25 AND
         `GO_TIME_DIM`.`month_number` <= 36 
     GROUP BY 
         `EMP_POSITION_DIM`.`position_code3`, 
         `EMP_POSITION_DIM`.`position_code2`, 
         `EMP_POSITION_DIM`.`position_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)), 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4))
     ) `T01` 
 ORDER BY 
     `T01`.`position_code1` ASC, 
     `T01`.`position_code2` ASC, 
     `T01`.`position_code3` ASC
 
 

;



-- id: 2434
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     `EMP_RANKING_DIM`.`employee_ranking_key` AS `column3`, 
     COUNT(`EMP_RANKING_FACT`.`ranking_code`) AS `column4`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` JOIN `gosalesdw1021`.`emp_ranking_fact` `EMP_RANKING_FACT` ON `GO_TIME_DIM`.`day_key` = `EMP_RANKING_FACT`.`day_key` JOIN `gosalesdw1021`.`emp_ranking_dim` `EMP_RANKING_DIM` ON `EMP_RANKING_DIM`.`employee_ranking_key` = `EMP_RANKING_FACT`.`employee_ranking_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `EMP_RANKING_FACT`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     `EMP_POSITION_DIM`.`position_code3` < 1000 AND
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `EMP_RANKING_DIM`.`employee_ranking_key` = 2392 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `EMP_RANKING_DIM`.`employee_ranking_key`
 
 

;



-- id: 2480
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     `EMP_RANKING_DIM`.`employee_ranking_key` AS `column3`, 
     COUNT(`EMP_RANKING_FACT`.`ranking_code`) AS `column4`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` JOIN `gosalesdw1021`.`emp_ranking_fact` `EMP_RANKING_FACT` ON `GO_TIME_DIM`.`day_key` = `EMP_RANKING_FACT`.`day_key` JOIN `gosalesdw1021`.`emp_ranking_dim` `EMP_RANKING_DIM` ON `EMP_RANKING_DIM`.`employee_ranking_key` = `EMP_RANKING_FACT`.`employee_ranking_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `EMP_RANKING_FACT`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     `EMP_POSITION_DIM`.`position_code3` < 1000 AND
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `EMP_RANKING_DIM`.`employee_ranking_key` = 2395 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `EMP_RANKING_DIM`.`employee_ranking_key`
 
 

;



-- id: 2526
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     `EMP_RANKING_DIM`.`employee_ranking_key` AS `column3`, 
     COUNT(`EMP_RANKING_FACT`.`ranking_code`) AS `column4`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` JOIN `gosalesdw1021`.`emp_ranking_fact` `EMP_RANKING_FACT` ON `GO_TIME_DIM`.`day_key` = `EMP_RANKING_FACT`.`day_key` JOIN `gosalesdw1021`.`emp_ranking_dim` `EMP_RANKING_DIM` ON `EMP_RANKING_DIM`.`employee_ranking_key` = `EMP_RANKING_FACT`.`employee_ranking_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `EMP_RANKING_FACT`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     `EMP_POSITION_DIM`.`position_code3` < 1000 AND
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `EMP_RANKING_DIM`.`employee_ranking_key` = 2393 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `EMP_RANKING_DIM`.`employee_ranking_key`
 
 

;



-- id: 2572
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     `EMP_RANKING_DIM`.`employee_ranking_key` AS `column3`, 
     COUNT(`EMP_RANKING_FACT`.`ranking_code`) AS `column4`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` JOIN `gosalesdw1021`.`emp_ranking_fact` `EMP_RANKING_FACT` ON `GO_TIME_DIM`.`day_key` = `EMP_RANKING_FACT`.`day_key` JOIN `gosalesdw1021`.`emp_ranking_dim` `EMP_RANKING_DIM` ON `EMP_RANKING_DIM`.`employee_ranking_key` = `EMP_RANKING_FACT`.`employee_ranking_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `EMP_RANKING_FACT`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     `EMP_POSITION_DIM`.`position_code3` < 1000 AND
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `EMP_RANKING_DIM`.`employee_ranking_key` = 2394 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `EMP_RANKING_DIM`.`employee_ranking_key`
 
 

;



-- id: 2582
SELECT     `T0`.`satisfaction_code` AS `column0`, 
     `T0`.`satisfaction_description_en` AS `column1`
 FROM
     `gosalesdw1021`.`go_satisfaction_dim` `T0` 
 GROUP BY 
     `T0`.`satisfaction_code`, 
     `T0`.`satisfaction_description_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 2602
SELECT     `T1`.`satisfaction_code` AS `column0`, 
     AVG(`EMP_SURVEY_FACT`.`employee_topic_score`) AS `column1`
 FROM
     `gosalesdw1021`.`emp_survey_fact` `EMP_SURVEY_FACT` JOIN `gosalesdw1021`.`go_satisfaction_dim` `T1` ON `EMP_SURVEY_FACT`.`satisfaction_key` = `T1`.`satisfaction_key` 
 GROUP BY 
     `T1`.`satisfaction_code`
 
 

;



-- id: 2641
SELECT     `T3`.`organization_code1` AS `column0`, 
     `T21`.`Organization_name__level_1_` AS `column1`
 FROM
     (
     SELECT
         `T01`.`Organization_name__level_5_` AS `Organization_name__level_1_`, 
         `T01`.`Organization_code__level_5_` AS `Organization_code__level_1_`
     FROM
         (
         SELECT
             `T11`.`organization_name_en` AS `Organization_name__level_5_`, 
             `T11`.`organization_code` AS `Organization_code__level_5_`
         FROM
             `gosalesdw1021`.`go_org_name_lookup` `T11`
         ) `T01` 
     WHERE 
         `T01`.`Organization_code__level_5_` IN ( 
             'GOAMX', 
             'GOCEU', 
             'GOEAX', 
             'GOEUX', 
             'GONEU', 
             'GOSEU' )
     ) `T21` JOIN 
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
     ) `T3` ON `T21`.`Organization_code__level_1_` = `T3`.`organization_code1` 
 GROUP BY 
     `T3`.`organization_code1`, 
     `T21`.`Organization_name__level_1_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 2651
SELECT     `T0`.`expense_group_code` AS `column0`, 
     `T0`.`expense_group_en` AS `column1`, 
     `T0`.`expense_type_code` AS `column2`, 
     `T0`.`expense_type_en` AS `column3`
 FROM
     `gosalesdw1021`.`emp_expense_type_dim` `T0` 
 GROUP BY 
     `T0`.`expense_group_code`, 
     `T0`.`expense_group_en`, 
     `T0`.`expense_type_code`, 
     `T0`.`expense_type_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC, 
     `column3` ASC, 
     `column2` ASC
 
 

;



-- id: 2712
SELECT     `T01`.`organization_code1` AS `column0`, 
     `T5`.`expense_group_code` AS `column1`, 
     `T5`.`expense_type_code` AS `column2`, 
     SUM(`EMP_TRAINING_FACT`.`course_cost`) AS `column3`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` JOIN `gosalesdw1021`.`emp_training_fact` `EMP_TRAINING_FACT` ON `GO_TIME_DIM`.`day_key` = `EMP_TRAINING_FACT`.`day_key` JOIN 
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
         ) `T01` ON `T01`.`organization_key` = `EMP_TRAINING_FACT`.`organization_key` JOIN `gosalesdw1021`.`emp_expense_type_dim` `T5` ON `EMP_TRAINING_FACT`.`expense_type_key` = `T5`.`expense_type_key` 
 WHERE 
     `T5`.`expense_group_code` IN ( 
         404 ) AND
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 
 GROUP BY 
     `T01`.`organization_code1`, 
     `T5`.`expense_group_code`, 
     `T5`.`expense_type_code`
 
 

;



-- id: 2782
SELECT     `T21`.`organization_code1` AS `column0`, 
     SUM(`T61`.`expense_plan_total`) AS `column1`
 FROM
     `gosalesdw1021`.`emp_expense_plan_fact` `T61` JOIN 
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     WHERE 
         `GO_TIME_DIM`.`month_number` >= 25 AND
         `GO_TIME_DIM`.`month_number` <= 36 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`
     ) `GO_TIME_DIM0` ON `T61`.`month_key` = `GO_TIME_DIM0`.`month_key` JOIN 
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
         ) `T21` ON `T21`.`organization_key` = `T61`.`organization_key` JOIN `gosalesdw1021`.`emp_expense_type_dim` `T7` ON `T61`.`expense_type_key` = `T7`.`expense_type_key` 
 WHERE 
     `T7`.`expense_group_code` IN ( 
         404 ) 
 GROUP BY 
     `T21`.`organization_code1`
 
 

;



-- id: 2843
SELECT     `T01`.`organization_code1` AS `column0`, 
     SUM(`EMP_TRAINING_FACT`.`course_cost`) AS `column1`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` JOIN `gosalesdw1021`.`emp_training_fact` `EMP_TRAINING_FACT` ON `GO_TIME_DIM`.`day_key` = `EMP_TRAINING_FACT`.`day_key` JOIN 
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
         ) `T01` ON `T01`.`organization_key` = `EMP_TRAINING_FACT`.`organization_key` JOIN `gosalesdw1021`.`emp_expense_type_dim` `T6` ON `EMP_TRAINING_FACT`.`expense_type_key` = `T6`.`expense_type_key` 
 WHERE 
     `T6`.`expense_group_code` IN ( 
         404 ) AND
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 
 GROUP BY 
     `T01`.`organization_code1`
 
 

;



-- id: 2855
SELECT     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 
 GROUP BY 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 2872
SELECT     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     concat(`T1`.`quarter_en`, ' '), 
     `GO_TIME_DIM`.`current_year`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T1` ON `GO_TIME_DIM`.`quarter_key` = `T1`.`quarter_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36
 
 

;



-- id: 2878
SELECT     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`month_key`, 
     concat(`GO_TIME_DIM`.`month_en`, ' '), 
     `GO_TIME_DIM`.`current_year`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36
 leaf-1 = (LESS_THAN_EQUALS month_number 36)
 expr = (and (not leaf-0) leaf-1)
 leaf-1 = (LESS_THAN_EQUALS month_number 36)
 expr = (and (not leaf-0) leaf-1), columns: ['null', 'null', 'null', 'month_key', 'null', 'month_number', 'quarter_key', 'null', 'current_year', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'month_en', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null']}

;



-- id: 2888
SELECT     `T0`.`order_method_key` AS `column0`, 
     `T0`.`order_method_en` AS `column1`
 FROM
     `gosalesdw1021`.`sls_order_method_dim` `T0` 
 GROUP BY 
     `T0`.`order_method_key`, 
     `T0`.`order_method_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 2921
SELECT     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column0`, 
     `GO_TIME_DIM`.`quarter_key` AS `column1`, 
     `GO_TIME_DIM`.`month_key` AS `column2`, 
     `T2`.`order_method_key` AS `column3`, 
     SUM(`SLS_SALES_FACT`.`gross_profit`) AS `column4`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`sls_order_method_dim` `T2` ON `SLS_SALES_FACT`.`order_method_key` = `T2`.`order_method_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 
 GROUP BY 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`month_key`, 
     `T2`.`order_method_key`
 
 

;



-- id: 2960
SELECT     `T3`.`organization_code1` AS `column0`, 
     `T21`.`Organization_name__level_1_` AS `column1`
 FROM
     (
     SELECT
         `T01`.`Organization_name__level_5_` AS `Organization_name__level_1_`, 
         `T01`.`Organization_code__level_5_` AS `Organization_code__level_1_`
     FROM
         (
         SELECT
             `T11`.`organization_name_en` AS `Organization_name__level_5_`, 
             `T11`.`organization_code` AS `Organization_code__level_5_`
         FROM
             `gosalesdw1021`.`go_org_name_lookup` `T11`
         ) `T01` 
     WHERE 
         `T01`.`Organization_code__level_5_` IN ( 
             'GOAMX', 
             'GOCEU', 
             'GOEAX', 
             'GOEUX', 
             'GONEU', 
             'GOSEU' )
     ) `T21` JOIN 
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
     ) `T3` ON `T21`.`Organization_code__level_1_` = `T3`.`organization_code1` 
 GROUP BY 
     `T3`.`organization_code1`, 
     `T21`.`Organization_name__level_1_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 2975
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 3041
SELECT     `T31`.`C`, 
     `T31`.`organization_code1`, 
     `T31`.`column2`
 FROM
     (
     SELECT
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `C`, 
         `T01`.`organization_code1` AS `organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `C1`, 
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         SUM(`T4`.`position_count`) AS `column2`
     FROM
         `gosalesdw1021`.`emp_position_summary_fact` `T4` JOIN 
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
         ) `T01` ON `T4`.`organization_key` = `T01`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `GO_TIME_DIM`.`day_key` = `T4`.`day_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T4`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
     WHERE 
         `EMP_POSITION_DIM`.`position_code` IN ( 
             5500, 
             5600, 
             5700 ) 
     GROUP BY 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
         `T01`.`organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)), 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`
     ) `T31`
 
 

;



-- id: 3048
SELECT     `T0`.`REGION_CODE`, 
     `T0`.`Region`
 FROM
     (
     SELECT
         `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
         `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
         `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
         `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
         `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
         `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
         `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
         `GO_REGION_DIM`.`region_en` AS `Region`, 
         `GO_REGION_DIM`.`country_en` AS `Country`, 
         concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
     FROM
         `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
     ) `T0` 
 ORDER BY 
     `T0`.`REGION_CODE` ASC
 
 

;



-- id: 3095
SELECT     `Retailer_site`.`Region_code` AS `column0`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column1`, 
     SUM(`SLS_SALES_FACT`.`unit_price` * `SLS_SALES_FACT`.`quantity`) AS `column2`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
         (
         SELECT
             `T01`.`REGION_CODE` AS `Region_code`, 
             `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
         FROM
             (
             SELECT
                 `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
                 `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
                 `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
                 `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
                 `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
                 `GO_REGION_DIM`.`region_en` AS `Region`, 
                 `GO_REGION_DIM`.`country_en` AS `Country`, 
                 concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
             FROM
                 `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
             ) `T01` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T01`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
         ) `Retailer_site` ON `Retailer_site`.`Retailer_site_key` = `SLS_SALES_FACT`.`retailer_site_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 
 GROUP BY 
     `Retailer_site`.`Region_code`
 
 

;



-- id: 3144
SELECT     `Retailer_site`.`Region_code` AS `column0`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column1`, 
     `GO_TIME_DIM`.`quarter_key` AS `column2`, 
     `GO_TIME_DIM`.`month_key` AS `column3`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column4`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
         (
         SELECT
             `T01`.`REGION_CODE` AS `Region_code`, 
             `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
         FROM
             (
             SELECT
                 `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
                 `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
                 `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
                 `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
                 `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
                 `GO_REGION_DIM`.`region_en` AS `Region`, 
                 `GO_REGION_DIM`.`country_en` AS `Country`, 
                 concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
             FROM
                 `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
             ) `T01` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T01`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
         ) `Retailer_site` ON `Retailer_site`.`Retailer_site_key` = `SLS_SALES_FACT`.`retailer_site_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `Retailer_site`.`Region_code` = 710 
 GROUP BY 
     `Retailer_site`.`Region_code`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`month_key` 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 3193
SELECT     `Retailer_site`.`Region_code` AS `column0`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column1`, 
     `GO_TIME_DIM`.`quarter_key` AS `column2`, 
     `GO_TIME_DIM`.`month_key` AS `column3`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column4`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
         (
         SELECT
             `T01`.`REGION_CODE` AS `Region_code`, 
             `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
         FROM
             (
             SELECT
                 `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
                 `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
                 `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
                 `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
                 `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
                 `GO_REGION_DIM`.`region_en` AS `Region`, 
                 `GO_REGION_DIM`.`country_en` AS `Country`, 
                 concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
             FROM
                 `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
             ) `T01` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T01`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
         ) `Retailer_site` ON `Retailer_site`.`Retailer_site_key` = `SLS_SALES_FACT`.`retailer_site_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `Retailer_site`.`Region_code` = 740 
 GROUP BY 
     `Retailer_site`.`Region_code`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`month_key` 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 3242
SELECT     `Retailer_site`.`Region_code` AS `column0`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column1`, 
     `GO_TIME_DIM`.`quarter_key` AS `column2`, 
     `GO_TIME_DIM`.`month_key` AS `column3`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column4`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
         (
         SELECT
             `T01`.`REGION_CODE` AS `Region_code`, 
             `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
         FROM
             (
             SELECT
                 `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
                 `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
                 `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
                 `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
                 `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
                 `GO_REGION_DIM`.`region_en` AS `Region`, 
                 `GO_REGION_DIM`.`country_en` AS `Country`, 
                 concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
             FROM
                 `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
             ) `T01` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T01`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
         ) `Retailer_site` ON `Retailer_site`.`Retailer_site_key` = `SLS_SALES_FACT`.`retailer_site_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `Retailer_site`.`Region_code` = 760 
 GROUP BY 
     `Retailer_site`.`Region_code`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`month_key` 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 3291
SELECT     `Retailer_site`.`Region_code` AS `column0`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column1`, 
     `GO_TIME_DIM`.`quarter_key` AS `column2`, 
     `GO_TIME_DIM`.`month_key` AS `column3`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column4`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
         (
         SELECT
             `T01`.`REGION_CODE` AS `Region_code`, 
             `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
         FROM
             (
             SELECT
                 `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
                 `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
                 `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
                 `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
                 `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
                 `GO_REGION_DIM`.`region_en` AS `Region`, 
                 `GO_REGION_DIM`.`country_en` AS `Country`, 
                 concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
             FROM
                 `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
             ) `T01` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T01`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
         ) `Retailer_site` ON `Retailer_site`.`Retailer_site_key` = `SLS_SALES_FACT`.`retailer_site_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `Retailer_site`.`Region_code` = 750 
 GROUP BY 
     `Retailer_site`.`Region_code`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`month_key` 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 3340
SELECT     `Retailer_site`.`Region_code` AS `column0`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column1`, 
     `GO_TIME_DIM`.`quarter_key` AS `column2`, 
     `GO_TIME_DIM`.`month_key` AS `column3`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column4`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
         (
         SELECT
             `T01`.`REGION_CODE` AS `Region_code`, 
             `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
         FROM
             (
             SELECT
                 `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
                 `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
                 `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
                 `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
                 `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
                 `GO_REGION_DIM`.`region_en` AS `Region`, 
                 `GO_REGION_DIM`.`country_en` AS `Country`, 
                 concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
             FROM
                 `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
             ) `T01` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T01`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
         ) `Retailer_site` ON `Retailer_site`.`Retailer_site_key` = `SLS_SALES_FACT`.`retailer_site_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `Retailer_site`.`Region_code` = 770 
 GROUP BY 
     `Retailer_site`.`Region_code`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`month_key` 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 3346
SELECT     `SLS_RETAILER_DIM`.`retailer_type_code`, 
     `SLS_RETAILER_DIM`.`retailer_type_en`
 FROM
     `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` 
 ORDER BY 
     `SLS_RETAILER_DIM`.`retailer_type_code` ASC
 
 

;



-- id: 3411
SELECT     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column0`, 
     `Retailer`.`Retailer_type_code` AS `column1`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column2`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
         (
         SELECT
             `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`, 
             `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
         FROM
             (
             SELECT
                 `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
                 `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
                 `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
                 `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
                 `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
                 `GO_REGION_DIM`.`region_en` AS `Region`, 
                 `GO_REGION_DIM`.`country_en` AS `Country`, 
                 concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
             FROM
                 `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
             ) `T0` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T0`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
         ) `Retailer_site` ON `Retailer_site`.`Retailer_site_key` = `SLS_SALES_FACT`.`retailer_site_key` JOIN 
             (
             SELECT
                 `SLS_RETAILER_DIM`.`retailer_type_code` AS `Retailer_type_code`, 
                 `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`
             FROM
                 `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` 
             GROUP BY 
                 `SLS_RETAILER_DIM`.`retailer_type_code`, 
                 `SLS_RETAILER_DIM`.`retailer_key`
             ) `Retailer` ON `Retailer`.`Retailer_key` = `Retailer_site`.`Retailer_key` 
 GROUP BY 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `Retailer`.`Retailer_type_code`
 
 

;



-- id: 3450
SELECT     `T3`.`organization_code1` AS `column0`, 
     `T21`.`Organization_name__level_1_` AS `column1`
 FROM
     (
     SELECT
         `T01`.`Organization_name__level_5_` AS `Organization_name__level_1_`, 
         `T01`.`Organization_code__level_5_` AS `Organization_code__level_1_`
     FROM
         (
         SELECT
             `T11`.`organization_name_en` AS `Organization_name__level_5_`, 
             `T11`.`organization_code` AS `Organization_code__level_5_`
         FROM
             `gosalesdw1021`.`go_org_name_lookup` `T11`
         ) `T01` 
     WHERE 
         `T01`.`Organization_code__level_5_` IN ( 
             'GOAMX', 
             'GOCEU', 
             'GOEAX', 
             'GOEUX', 
             'GONEU', 
             'GOSEU' )
     ) `T21` JOIN 
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
     ) `T3` ON `T21`.`Organization_code__level_1_` = `T3`.`organization_code1` 
 GROUP BY 
     `T3`.`organization_code1`, 
     `T21`.`Organization_name__level_1_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 3499
SELECT     `T0`.`organization_code1` AS `column0`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column1`, 
     SUM(`SLS_SALES_FACT`.`gross_profit`) AS `column2`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
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
         ) `T0` ON `T0`.`organization_key` = `SLS_SALES_FACT`.`organization_key` 
 GROUP BY 
     `T0`.`organization_code1`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4))
 
 

;



-- id: 3517
SELECT     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 3627
SELECT     `Product`.`Product_line_code` AS `column0`, 
     SUM(`T10`.`return_quantity`) AS `column1`
 FROM
     (
     SELECT
         `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`dist_returned_items_fact` `T10` ON `Product`.`Product_key` = `T10`.`product_key` 
 GROUP BY 
     `Product`.`Product_line_code`
 
 

;



-- id: 3657
SELECT     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T21`.`product_line_en`, 
     `SLS_PRODUCT_DIM`.`product_type_key`, 
     `T3`.`product_type_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T21` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T21`.`product_line_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T3` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T3`.`product_type_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC, 
     `SLS_PRODUCT_DIM`.`product_type_key` ASC
 
 

;



-- id: 3689
SELECT     `SLS_PRODUCT_DIM`.`product_type_key`, 
     `T4`.`product_type_en`, 
     `SLS_PRODUCT_DIM`.`base_product_key`, 
     `T01`.`product_name`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN 
     (
     SELECT
         `T11`.`product_number` AS `product_number`, 
         `T11`.`product_name` AS `product_name`
     FROM
         `gosalesdw1021`.`sls_product_lookup` `T11` 
     WHERE 
         `T11`.`product_language` = 'EN'
     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T4` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T4`.`product_type_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_type_key` ASC, 
     `SLS_PRODUCT_DIM`.`base_product_key` ASC
 
 

;



-- id: 3799
SELECT     `Product`.`Product_line_code` AS `column0`, 
     `Product`.`Product_type_key` AS `column1`, 
     `Product`.`Base_product_key` AS `column2`, 
     SUM(`T10`.`return_quantity`) AS `column3`
 FROM
     (
     SELECT
         `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
         `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
         `SLS_PRODUCT_DIM`.`base_product_key` AS `Base_product_key`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`dist_returned_items_fact` `T10` ON `Product`.`Product_key` = `T10`.`product_key` 
 GROUP BY 
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`, 
     `Product`.`Base_product_key`
 
 

;



-- id: 3909
SELECT     `Product`.`Product_line_code` AS `column0`, 
     `Product`.`Product_type_key` AS `column1`, 
     `Product`.`Base_product_key` AS `column2`, 
     SUM(`SLS_SALES_FACT`.`quantity`) AS `column3`
 FROM
     (
     SELECT
         `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
         `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
         `SLS_PRODUCT_DIM`.`base_product_key` AS `Base_product_key`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 GROUP BY 
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`, 
     `Product`.`Base_product_key`
 
 

;



-- id: 4019
SELECT     `Product`.`Product_line_code` AS `column0`, 
     `Product`.`Product_type_key` AS `column1`, 
     `Product`.`Base_product_key` AS `column2`, 
     SUM(`SLS_SALES_FACT`.`quantity`) AS `column3`
 FROM
     (
     SELECT
         `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
         `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
         `SLS_PRODUCT_DIM`.`base_product_key` AS `Base_product_key`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 GROUP BY 
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`, 
     `Product`.`Base_product_key`
 
 

;



-- id: 4129
SELECT     `Product`.`Product_line_code` AS `column0`, 
     `Product`.`Product_type_key` AS `column1`, 
     `Product`.`Base_product_key` AS `column2`, 
     SUM(`T10`.`return_quantity`) AS `column3`
 FROM
     (
     SELECT
         `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
         `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
         `SLS_PRODUCT_DIM`.`base_product_key` AS `Base_product_key`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`dist_returned_items_fact` `T10` ON `Product`.`Product_key` = `T10`.`product_key` 
 GROUP BY 
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`, 
     `Product`.`Base_product_key`
 
 

;



-- id: 4239
SELECT     `Product`.`Product_line_code` AS `column0`, 
     `Product`.`Product_type_key` AS `column1`, 
     `Product`.`Base_product_key` AS `column2`, 
     AVG(`SLS_SALES_FACT`.`unit_cost`) AS `column3`, 
     SUM(`SLS_SALES_FACT`.`unit_cost`) AS `Sum1`, 
     COUNT(`SLS_SALES_FACT`.`unit_cost`) AS `Count1`
 FROM
     (
     SELECT
         `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
         `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
         `SLS_PRODUCT_DIM`.`base_product_key` AS `Base_product_key`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 GROUP BY 
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`, 
     `Product`.`Base_product_key`
 
 

;



-- id: 4282
SELECT     `T3`.`retailer_survey_key` AS `column0`, 
     `T3`.`retailer_topic_en` AS `column1`
 FROM
     `gosalesdw1021`.`mrk_rtl_survey_fact` `T21` JOIN 
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` ON `T21`.`month_key` = `GO_TIME_DIM0`.`month_key` JOIN `gosalesdw1021`.`mrk_rtl_survey_dim` `T3` ON `T3`.`retailer_survey_key` = `T21`.`retailer_survey_key` 
 WHERE 
     `GO_TIME_DIM0`.`current_year` IN ( 
         2013 ) AND
     (`T3`.`retailer_survey_key` = 1222 OR
     `T3`.`retailer_survey_key` = 1223 OR
     `T3`.`retailer_survey_key` = 1224 OR
     `T3`.`retailer_survey_key` = 1226 OR
     `T3`.`retailer_survey_key` = 1229) 
 GROUP BY 
     `T3`.`retailer_survey_key`, 
     `T3`.`retailer_topic_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 4356
SELECT     `T21`.`organization_code1` AS `column0`, 
     `T71`.`Organization_name__level_1_` AS `column1`
 FROM
     `gosalesdw1021`.`mrk_rtl_survey_fact` `T8` JOIN 
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` ON `T8`.`month_key` = `GO_TIME_DIM0`.`month_key` JOIN 
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
         ) `T21` ON `T21`.`organization_key` = `T8`.`organization_key` JOIN 
             (
             SELECT
                 `T51`.`Organization_name__level_5_` AS `Organization_name__level_1_`, 
                 `T51`.`Organization_code__level_5_` AS `Organization_code__level_1_`
             FROM
                 (
                 SELECT
                     `T61`.`organization_name_en` AS `Organization_name__level_5_`, 
                     `T61`.`organization_code` AS `Organization_code__level_5_`
                 FROM
                     `gosalesdw1021`.`go_org_name_lookup` `T61`
                 ) `T51` 
             WHERE 
                 `T51`.`Organization_code__level_5_` IN ( 
                     'GOAMX', 
                     'GOCEU', 
                     'GOEAX', 
                     'GOEUX', 
                     'GONEU', 
                     'GOSEU' )
             ) `T71` ON `T71`.`Organization_code__level_1_` = `T21`.`organization_code1` 
 WHERE 
     `GO_TIME_DIM0`.`current_year` IN ( 
         2013 ) AND
     `T21`.`organization_code1` = 'GOEAX' 
 GROUP BY 
     `T21`.`organization_code1`, 
     `T71`.`Organization_name__level_1_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 4425
SELECT     `T6`.`retailer_survey_key` AS `column0`, 
     `T21`.`organization_code1` AS `column1`, 
     AVG(`T51`.`retailer_topic_score`) AS `column2`
 FROM
     `gosalesdw1021`.`mrk_rtl_survey_fact` `T51` JOIN 
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` ON `T51`.`month_key` = `GO_TIME_DIM0`.`month_key` JOIN 
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
         ) `T21` ON `T21`.`organization_key` = `T51`.`organization_key` JOIN `gosalesdw1021`.`mrk_rtl_survey_dim` `T6` ON `T6`.`retailer_survey_key` = `T51`.`retailer_survey_key` 
 WHERE 
     `GO_TIME_DIM0`.`current_year` IN ( 
         2013 ) AND
     `T6`.`retailer_survey_key` IN ( 
         1229, 
         1226, 
         1224, 
         1223, 
         1222 ) AND
     `T21`.`organization_code1` = 'GOEAX' 
 GROUP BY 
     `T6`.`retailer_survey_key`, 
     `T21`.`organization_code1`
 
 

;



-- id: 4466
SELECT     `T3`.`retailer_survey_key` AS `column0`, 
     AVG(`T21`.`retailer_topic_score`) AS `column1`
 FROM
     `gosalesdw1021`.`mrk_rtl_survey_fact` `T21` JOIN 
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` ON `T21`.`month_key` = `GO_TIME_DIM0`.`month_key` JOIN `gosalesdw1021`.`mrk_rtl_survey_dim` `T3` ON `T3`.`retailer_survey_key` = `T21`.`retailer_survey_key` 
 WHERE 
     `GO_TIME_DIM0`.`current_year` IN ( 
         2013 ) AND
     `T3`.`retailer_survey_key` IN ( 
         1229, 
         1226, 
         1224, 
         1223, 
         1222 ) 
 GROUP BY 
     `T3`.`retailer_survey_key`
 
 

;



-- id: 4501
SELECT     `T2`.`return_reason_key` AS `column0`, 
     `T2`.`reason_description_en` AS `column1`
 FROM
     `gosalesdw1021`.`dist_returned_items_fact` `T01` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T01`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`dist_return_reason_dim` `T2` ON `T2`.`return_reason_key` = `T01`.`return_reason_key` 
 WHERE 
     `GO_TIME_DIM`.`current_year` IN ( 
         2013 ) 
 GROUP BY 
     `T2`.`return_reason_key`, 
     `T2`.`reason_description_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 4576
SELECT     `T6`.`return_reason_key` AS `column0`, 
     SUM(`T11`.`return_quantity`) AS `column1`
 FROM
     `gosalesdw1021`.`dist_returned_items_fact` `T11` JOIN `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` ON `T11`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T11`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` JOIN `gosalesdw1021`.`dist_return_reason_dim` `T6` ON `T6`.`return_reason_key` = `T11`.`return_reason_key` 
 WHERE 
     `GO_REGION_DIM`.`region_code` = 740 AND
     `GO_TIME_DIM`.`current_year` IN ( 
         2013 ) 
 GROUP BY 
     `T6`.`return_reason_key`
 
 

;



-- id: 4651
SELECT     `T6`.`return_reason_key` AS `column0`, 
     SUM(`T11`.`return_quantity`) AS `column1`
 FROM
     `gosalesdw1021`.`dist_returned_items_fact` `T11` JOIN `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` ON `T11`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T11`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` JOIN `gosalesdw1021`.`dist_return_reason_dim` `T6` ON `T6`.`return_reason_key` = `T11`.`return_reason_key` 
 WHERE 
     `GO_REGION_DIM`.`region_code` = 740 AND
     `GO_TIME_DIM`.`current_year` IN ( 
         2013 ) 
 GROUP BY 
     `T6`.`return_reason_key`
 
 

;



-- id: 4657
SELECT     `SLS_RETAILER_DIM`.`retailer_type_code`, 
     `SLS_RETAILER_DIM`.`retailer_type_en`, 
     `SLS_RETAILER_DIM`.`retailer_key`, 
     `SLS_RETAILER_DIM`.`retailer_name`, 
     `SLS_RETAILER_DIM`.`retailer_name_mb`
 FROM
     `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` 
 ORDER BY 
     `SLS_RETAILER_DIM`.`retailer_type_code` ASC, 
     `SLS_RETAILER_DIM`.`retailer_key` ASC
 
 

;



-- id: 4667
SELECT     `T0`.`return_reason_key` AS `column0`, 
     `T0`.`reason_description_en` AS `column1`
 FROM
     `gosalesdw1021`.`dist_return_reason_dim` `T0` 
 GROUP BY 
     `T0`.`return_reason_key`, 
     `T0`.`reason_description_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 4736
SELECT     `Retailer`.`Retailer_type_code` AS `column0`, 
     `Retailer`.`Retailer_key` AS `column1`, 
     `T8`.`return_reason_key` AS `column2`, 
     SUM(`T71`.`return_quantity`) AS `column3`
 FROM
     (
     SELECT
         `SLS_RETAILER_DIM`.`retailer_type_code` AS `Retailer_type_code`, 
         `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`
     FROM
         `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` 
     GROUP BY 
         `SLS_RETAILER_DIM`.`retailer_type_code`, 
         `SLS_RETAILER_DIM`.`retailer_key`
     ) `Retailer` JOIN 
     (
     SELECT
         `T21`.`REGION_CODE` AS `Region_code`, 
         `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`, 
         `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
     FROM
         (
         SELECT
             `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
             `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
             `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
             `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
             `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
             `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
             `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
             `GO_REGION_DIM`.`region_en` AS `Region`, 
             `GO_REGION_DIM`.`country_en` AS `Country`, 
             concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
         FROM
             `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
         ) `T21` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T21`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
     ) `Retailer_site` ON `Retailer`.`Retailer_key` = `Retailer_site`.`Retailer_key` JOIN `gosalesdw1021`.`dist_returned_items_fact` `T71` ON `T71`.`retailer_site_key` = `Retailer_site`.`Retailer_site_key` JOIN `gosalesdw1021`.`dist_return_reason_dim` `T8` ON `T8`.`return_reason_key` = `T71`.`return_reason_key` 
 WHERE 
     `Retailer_site`.`Region_code` = 740 
 GROUP BY 
     `Retailer`.`Retailer_type_code`, 
     `Retailer`.`Retailer_key`, 
     `T8`.`return_reason_key` 
 ORDER BY 
     `column0` ASC, 
     `column1` ASC
 
 

;



-- id: 4793
SELECT     `Retailer`.`Retailer_type_code` AS `column0`, 
     `Retailer`.`Retailer_key` AS `column1`, 
     AVG(`T6`.`retailer_topic_score`) AS `column2`, 
     AVG(`T6`.`retailer_topic_score`) AS `column3`
 FROM
     (
     SELECT
         `SLS_RETAILER_DIM`.`retailer_type_code` AS `Retailer_type_code`, 
         `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`
     FROM
         `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` 
     GROUP BY 
         `SLS_RETAILER_DIM`.`retailer_type_code`, 
         `SLS_RETAILER_DIM`.`retailer_key`
     ) `Retailer` JOIN 
     (
     SELECT
         `T21`.`REGION_CODE` AS `Region_code`, 
         `T21`.`COUNTRY_KEY` AS `Retailer_country_key`, 
         `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`
     FROM
         (
         SELECT
             `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
             `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
             `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
             `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
             `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
             `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
             `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
             `GO_REGION_DIM`.`region_en` AS `Region`, 
             `GO_REGION_DIM`.`country_en` AS `Country`, 
             concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
         FROM
             `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
         ) `T21` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T21`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code` 
     GROUP BY 
         `T21`.`REGION_CODE`, 
         `T21`.`COUNTRY_KEY`, 
         `SLS_RETAILER_DIM`.`retailer_key`
     ) `Retailer_site` ON `Retailer`.`Retailer_key` = `Retailer_site`.`Retailer_key` JOIN `gosalesdw1021`.`mrk_rtl_survey_fact` `T6` ON 
             `T6`.`retailer_key` = `Retailer_site`.`Retailer_key` AND
             `T6`.`rtl_country_key` = `Retailer_site`.`Retailer_country_key` 
 WHERE 
     `Retailer_site`.`Region_code` = 740 AND
     `Retailer`.`Retailer_key` IN ( 
         7051, 
         7289, 
         7075, 
         7325, 
         6874, 
         7198, 
         7294, 
         7292, 
         7110, 
         7297, 
         7202, 
         7081, 
         7150, 
         7069, 
         7195, 
         7068, 
         7077, 
         7114, 
         6832, 
         7280, 
         7324, 
         7278, 
         7062, 
         6835, 
         7293, 
         7295, 
         7317, 
         6855, 
         7323, 
         7115, 
         7279, 
         6834, 
         7281, 
         7268, 
         7080, 
         7067, 
         7358, 
         7285, 
         7154, 
         7113, 
         7298, 
         7316, 
         7066, 
         6836, 
         7111, 
         7267, 
         7296, 
         7152, 
         7282, 
         7201, 
         6872, 
         7065, 
         7288, 
         7151, 
         7056, 
         7290, 
         7276, 
         7083, 
         7050, 
         7070, 
         7112, 
         7284, 
         7084, 
         7287, 
         7117, 
         7275, 
         7052, 
         6871, 
         7076, 
         6857, 
         6830, 
         7200, 
         7322, 
         6831, 
         7196, 
         6875, 
         6856, 
         7277, 
         7072, 
         7079, 
         7283, 
         7199, 
         7071, 
         7318, 
         7315, 
         7319, 
         7197, 
         7082, 
         7153, 
         7156, 
         7357, 
         7053, 
         7061, 
         6873, 
         7320, 
         6870, 
         6829, 
         6877, 
         7326, 
         7058, 
         7057, 
         7147, 
         7155, 
         7149, 
         6876, 
         7116, 
         7286, 
         7291, 
         7148, 
         7078, 
         7060, 
         6833, 
         7085, 
         7086, 
         7059 ) 
 GROUP BY 
     `Retailer`.`Retailer_type_code`, 
     `Retailer`.`Retailer_key`
 
 

;



-- id: 4862
SELECT     `Retailer`.`Retailer_type_code` AS `column0`, 
     `Retailer`.`Retailer_key` AS `column1`, 
     `T8`.`return_reason_key` AS `column2`, 
     SUM(`T71`.`return_quantity`) AS `column3`
 FROM
     (
     SELECT
         `SLS_RETAILER_DIM`.`retailer_type_code` AS `Retailer_type_code`, 
         `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`
     FROM
         `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` 
     GROUP BY 
         `SLS_RETAILER_DIM`.`retailer_type_code`, 
         `SLS_RETAILER_DIM`.`retailer_key`
     ) `Retailer` JOIN 
     (
     SELECT
         `T21`.`REGION_CODE` AS `Region_code`, 
         `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`, 
         `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
     FROM
         (
         SELECT
             `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
             `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
             `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
             `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
             `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
             `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
             `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
             `GO_REGION_DIM`.`region_en` AS `Region`, 
             `GO_REGION_DIM`.`country_en` AS `Country`, 
             concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
         FROM
             `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
         ) `T21` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T21`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
     ) `Retailer_site` ON `Retailer`.`Retailer_key` = `Retailer_site`.`Retailer_key` JOIN `gosalesdw1021`.`dist_returned_items_fact` `T71` ON `T71`.`retailer_site_key` = `Retailer_site`.`Retailer_site_key` JOIN `gosalesdw1021`.`dist_return_reason_dim` `T8` ON `T8`.`return_reason_key` = `T71`.`return_reason_key` 
 WHERE 
     `Retailer_site`.`Region_code` = 740 
 GROUP BY 
     `Retailer`.`Retailer_type_code`, 
     `Retailer`.`Retailer_key`, 
     `T8`.`return_reason_key` 
 ORDER BY 
     `column0` ASC, 
     `column1` ASC
 
 

;



-- id: 4929
SELECT     SUM(`T61`.`return_quantity`) AS `column0`
 FROM
     (
     SELECT
         `SLS_RETAILER_DIM`.`retailer_type_code` AS `Retailer_type_code`, 
         `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`
     FROM
         `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` 
     GROUP BY 
         `SLS_RETAILER_DIM`.`retailer_type_code`, 
         `SLS_RETAILER_DIM`.`retailer_key`
     ) `Retailer` JOIN 
     (
     SELECT
         `T21`.`REGION_CODE` AS `Region_code`, 
         `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`, 
         `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
     FROM
         (
         SELECT
             `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
             `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
             `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
             `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
             `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
             `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
             `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
             `GO_REGION_DIM`.`region_en` AS `Region`, 
             `GO_REGION_DIM`.`country_en` AS `Country`, 
             concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
         FROM
             `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
         ) `T21` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T21`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
     ) `Retailer_site` ON `Retailer`.`Retailer_key` = `Retailer_site`.`Retailer_key` JOIN `gosalesdw1021`.`dist_returned_items_fact` `T61` ON `T61`.`retailer_site_key` = `Retailer_site`.`Retailer_site_key` JOIN `gosalesdw1021`.`dist_return_reason_dim` `T7` ON `T7`.`return_reason_key` = `T61`.`return_reason_key` 
 WHERE 
     `Retailer_site`.`Region_code` = 740 AND
     `Retailer`.`Retailer_type_code` IN ( 
         8, 
         6, 
         2, 
         7, 
         4, 
         3, 
         1, 
         5 ) AND
     `Retailer`.`Retailer_key` IN ( 
         7051, 
         7289, 
         7075, 
         7325, 
         6874, 
         7198, 
         7294, 
         7292, 
         7297, 
         7110, 
         7202, 
         7150, 
         7081, 
         7069, 
         7068, 
         7195, 
         7077, 
         7114, 
         6832, 
         7280, 
         7324, 
         7278, 
         7062, 
         6835, 
         7293, 
         7295, 
         7317, 
         6855, 
         7323, 
         7115, 
         6834, 
         7279, 
         7268, 
         7281, 
         7080, 
         7067, 
         7358, 
         7285, 
         7154, 
         7113, 
         7298, 
         7316, 
         7066, 
         6836, 
         7111, 
         7267, 
         7152, 
         7296, 
         7282, 
         7201, 
         6872, 
         7065, 
         7288, 
         7151, 
         7056, 
         7290, 
         7276, 
         7083, 
         7050, 
         7070, 
         7112, 
         7284, 
         7287, 
         7084, 
         7117, 
         7275, 
         7052, 
         6871, 
         7076, 
         6857, 
         7200, 
         6830, 
         7322, 
         6831, 
         6875, 
         7196, 
         7277, 
         6856, 
         7079, 
         7072, 
         7199, 
         7283, 
         7071, 
         7318, 
         7315, 
         7319, 
         7197, 
         7082, 
         7153, 
         7156, 
         7357, 
         7061, 
         7053, 
         6873, 
         7320, 
         6870, 
         6829, 
         6877, 
         7326, 
         7058, 
         7057, 
         7147, 
         7155, 
         7149, 
         6876, 
         7286, 
         7116, 
         7291, 
         7148, 
         7078, 
         7060, 
         6833, 
         7085, 
         7086, 
         7059 ) AND
     `T7`.`return_reason_key` IN ( 
         9002, 
         9003, 
         9005, 
         9004, 
         9001 )
 
 

;



-- id: 4980
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `T31`.`Position_name__level_1_` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column2`, 
     `T4`.`Position_name__level_2_` AS `column3`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column4`, 
     `T21`.`Position_name__level_3_` AS `column5`
 FROM
     `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` JOIN 
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_3_`, 
         `T11`.`position_code` AS `Position_code__level_3_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` ON `EMP_POSITION_DIM`.`position_code3` = `T21`.`Position_code__level_3_` JOIN 
         (
         SELECT
             `T11`.`position_en` AS `Position_name__level_1_`, 
             `T11`.`position_code` AS `Position_code__level_1_`
         FROM
             `gosalesdw1021`.`emp_position_lookup` `T11`
         ) `T31` ON `T31`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
             (
             SELECT
                 `T11`.`position_en` AS `Position_name__level_2_`, 
                 `T11`.`position_code` AS `Position_code__level_2_`
             FROM
                 `gosalesdw1021`.`emp_position_lookup` `T11`
             ) `T4` ON `T4`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 WHERE 
     `EMP_POSITION_DIM`.`position_code3` = 370 AND
     `EMP_POSITION_DIM`.`position_code2` = 220 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 OR
     `EMP_POSITION_DIM`.`position_code3` = 320 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 OR
     `EMP_POSITION_DIM`.`position_code3` = 300 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 OR
     `EMP_POSITION_DIM`.`position_code3` = 380 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 OR
     `EMP_POSITION_DIM`.`position_code3` = 330 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 OR
     `EMP_POSITION_DIM`.`position_code3` = 350 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 OR
     `EMP_POSITION_DIM`.`position_code3` = 360 AND
     `EMP_POSITION_DIM`.`position_code2` = 220 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 OR
     `EMP_POSITION_DIM`.`position_code3` = 390 AND
     `EMP_POSITION_DIM`.`position_code2` = 220 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 OR
     `EMP_POSITION_DIM`.`position_code3` = 340 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `T31`.`Position_name__level_1_`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `T4`.`Position_name__level_2_`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T21`.`Position_name__level_3_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC, 
     `column3` ASC, 
     `column2` ASC, 
     `column5` ASC, 
     `column4` ASC
 
 

;



-- id: 5013
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     AVG(`EMP_SURVEY_FACT`.`employee_topic_score`) AS `column3`
 FROM
     `gosalesdw1021`.`emp_survey_fact` `EMP_SURVEY_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_SURVEY_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `EMP_SURVEY_FACT`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code3` = 320 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`
 
 

;



-- id: 5046
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     AVG(`EMP_SURVEY_FACT`.`employee_topic_score`) AS `column3`
 FROM
     `gosalesdw1021`.`emp_survey_fact` `EMP_SURVEY_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_SURVEY_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `EMP_SURVEY_FACT`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code3` = 300 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`
 
 

;



-- id: 5079
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     AVG(`EMP_SURVEY_FACT`.`employee_topic_score`) AS `column3`
 FROM
     `gosalesdw1021`.`emp_survey_fact` `EMP_SURVEY_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_SURVEY_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `EMP_SURVEY_FACT`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code3` = 380 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`
 
 

;



-- id: 5112
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     AVG(`EMP_SURVEY_FACT`.`employee_topic_score`) AS `column3`
 FROM
     `gosalesdw1021`.`emp_survey_fact` `EMP_SURVEY_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_SURVEY_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `EMP_SURVEY_FACT`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code3` = 330 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`
 
 

;



-- id: 5145
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     AVG(`EMP_SURVEY_FACT`.`employee_topic_score`) AS `column3`
 FROM
     `gosalesdw1021`.`emp_survey_fact` `EMP_SURVEY_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_SURVEY_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `EMP_SURVEY_FACT`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code3` = 350 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`
 
 

;



-- id: 5178
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     AVG(`EMP_SURVEY_FACT`.`employee_topic_score`) AS `column3`
 FROM
     `gosalesdw1021`.`emp_survey_fact` `EMP_SURVEY_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_SURVEY_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `EMP_SURVEY_FACT`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     `EMP_POSITION_DIM`.`position_code2` = 220 AND
     `EMP_POSITION_DIM`.`position_code3` = 360 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`
 
 

;



-- id: 5211
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     AVG(`EMP_SURVEY_FACT`.`employee_topic_score`) AS `column3`
 FROM
     `gosalesdw1021`.`emp_survey_fact` `EMP_SURVEY_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_SURVEY_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `EMP_SURVEY_FACT`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     `EMP_POSITION_DIM`.`position_code2` = 220 AND
     `EMP_POSITION_DIM`.`position_code3` = 390 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`
 
 

;



-- id: 5244
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     AVG(`EMP_SURVEY_FACT`.`employee_topic_score`) AS `column3`
 FROM
     `gosalesdw1021`.`emp_survey_fact` `EMP_SURVEY_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_SURVEY_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `EMP_SURVEY_FACT`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code3` = 340 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`
 
 

;



-- id: 5277
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     AVG(`EMP_SURVEY_FACT`.`employee_topic_score`) AS `column3`
 FROM
     `gosalesdw1021`.`emp_survey_fact` `EMP_SURVEY_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_SURVEY_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `EMP_SURVEY_FACT`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     `EMP_POSITION_DIM`.`position_code2` = 220 AND
     `EMP_POSITION_DIM`.`position_code3` = 370 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`
 
 

;



-- id: 5315
SELECT     `T3`.`employee_topic_key` AS `column0`, 
     AVG(`T21`.`employee_topic_target`) AS `column1`, 
     AVG(`T21`.`employee_survey_benchmark`) AS `column2`
 FROM
     `gosalesdw1021`.`emp_survey_targ_fact` `T21` JOIN 
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     WHERE 
         `GO_TIME_DIM`.`month_number` >= 25 AND
         `GO_TIME_DIM`.`month_number` <= 36 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`
     ) `GO_TIME_DIM0` ON `T21`.`month_key` = `GO_TIME_DIM0`.`month_key` JOIN `gosalesdw1021`.`emp_survey_topic_dim` `T3` ON `T3`.`employee_topic_key` = `T21`.`employee_topic_key` 
 GROUP BY 
     `T3`.`employee_topic_key`
 
 

;



-- id: 5330
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 5341
SELECT     CAST(`GO_TIME_DIM0`.`quarter_key` AS CHAR(5)), 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4))
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 WHERE 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) = '2012'
 
 

;



-- id: 5363
SELECT     CAST(`GO_TIME_DIM0`.`quarter_key` AS CHAR(5)), 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     concat(`T2`.`quarter_en`, ' '), 
     `GO_TIME_DIM0`.`current_year`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T2` ON `GO_TIME_DIM0`.`quarter_key` = `T2`.`quarter_key` 
 WHERE 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) = '2012'
 
 

;



-- id: 5402
SELECT     `T3`.`organization_code1` AS `column0`, 
     `T21`.`Organization_name__level_1_` AS `column1`
 FROM
     (
     SELECT
         `T01`.`Organization_name__level_5_` AS `Organization_name__level_1_`, 
         `T01`.`Organization_code__level_5_` AS `Organization_code__level_1_`
     FROM
         (
         SELECT
             `T11`.`organization_name_en` AS `Organization_name__level_5_`, 
             `T11`.`organization_code` AS `Organization_code__level_5_`
         FROM
             `gosalesdw1021`.`go_org_name_lookup` `T11`
         ) `T01` 
     WHERE 
         `T01`.`Organization_code__level_5_` IN ( 
             'GOAMX', 
             'GOCEU', 
             'GOEAX', 
             'GOEUX', 
             'GONEU', 
             'GOSEU' )
     ) `T21` JOIN 
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
     ) `T3` ON `T21`.`Organization_code__level_1_` = `T3`.`organization_code1` 
 GROUP BY 
     `T3`.`organization_code1`, 
     `T21`.`Organization_name__level_1_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 5412
SELECT     `T0`.`expense_group_code` AS `column0`, 
     `T0`.`expense_group_en` AS `column1`, 
     `T0`.`expense_type_code` AS `column2`, 
     `T0`.`expense_type_en` AS `column3`
 FROM
     `gosalesdw1021`.`emp_expense_type_dim` `T0` 
 GROUP BY 
     `T0`.`expense_group_code`, 
     `T0`.`expense_group_en`, 
     `T0`.`expense_type_code`, 
     `T0`.`expense_type_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC, 
     `column3` ASC, 
     `column2` ASC
 
 

;



-- id: 5473
SELECT     `T01`.`organization_code1` AS `column0`, 
     `T5`.`expense_group_code` AS `column1`, 
     `T5`.`expense_type_code` AS `column2`, 
     SUM(`EMP_TRAINING_FACT`.`course_cost`) AS `column3`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` JOIN `gosalesdw1021`.`emp_training_fact` `EMP_TRAINING_FACT` ON `GO_TIME_DIM`.`day_key` = `EMP_TRAINING_FACT`.`day_key` JOIN 
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
         ) `T01` ON `T01`.`organization_key` = `EMP_TRAINING_FACT`.`organization_key` JOIN `gosalesdw1021`.`emp_expense_type_dim` `T5` ON `EMP_TRAINING_FACT`.`expense_type_key` = `T5`.`expense_type_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_TIME_DIM`.`quarter_key` IN ( 
         20121 ) AND
     `T5`.`expense_group_code` IN ( 
         404 ) 
 GROUP BY 
     `T01`.`organization_code1`, 
     `T5`.`expense_group_code`, 
     `T5`.`expense_type_code`
 
 

;



-- id: 5490
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 WHERE 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_TIME_DIM0`.`quarter_key` IN ( 
         20121 ) 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 5512
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     concat(`T2`.`quarter_en`, ' '), 
     `GO_TIME_DIM0`.`current_year`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T2` ON `GO_TIME_DIM0`.`quarter_key` = `T2`.`quarter_key` 
 WHERE 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_TIME_DIM0`.`quarter_key` IN ( 
         20121 )
 
 

;



-- id: 5573
SELECT     `T01`.`organization_code1` AS `column0`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column1`, 
     `GO_TIME_DIM`.`quarter_key` AS `column2`, 
     SUM(`EMP_TRAINING_FACT`.`course_cost`) AS `column3`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` JOIN `gosalesdw1021`.`emp_training_fact` `EMP_TRAINING_FACT` ON `GO_TIME_DIM`.`day_key` = `EMP_TRAINING_FACT`.`day_key` JOIN 
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
         ) `T01` ON `T01`.`organization_key` = `EMP_TRAINING_FACT`.`organization_key` JOIN `gosalesdw1021`.`emp_expense_type_dim` `T6` ON `EMP_TRAINING_FACT`.`expense_type_key` = `T6`.`expense_type_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_TIME_DIM`.`quarter_key` IN ( 
         20121 ) AND
     `T6`.`expense_group_code` IN ( 
         404 ) 
 GROUP BY 
     `T01`.`organization_code1`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`
 
 

;



-- id: 5642
SELECT     `T21`.`organization_code1` AS `column0`, 
     SUM(`T51`.`expense_plan_total`) AS `column1`
 FROM
     `gosalesdw1021`.`emp_expense_plan_fact` `T51` JOIN 
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` ON `T51`.`month_key` = `GO_TIME_DIM0`.`month_key` JOIN 
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
         ) `T21` ON `T21`.`organization_key` = `T51`.`organization_key` JOIN `gosalesdw1021`.`emp_expense_type_dim` `T6` ON `T51`.`expense_type_key` = `T6`.`expense_type_key` 
 WHERE 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_TIME_DIM0`.`quarter_key` IN ( 
         20121 ) AND
     `T6`.`expense_group_code` IN ( 
         404 ) 
 GROUP BY 
     `T21`.`organization_code1`
 
 

;



-- id: 5660
SELECT     `SLS_PRODUCT_DIM`.`product_brand_key`, 
     `T1`.`product_brand_en`
 FROM
     `gosalesdw1021`.`sls_product_brand_lookup` `T1` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T1`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_brand_key` ASC
 
 

;



-- id: 6001
SELECT     `Product__brand_`.`PRODUCT_BRAND_KEY` AS `column0`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column1`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `SLS_SALES_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
                 (
                 SELECT
                     `SLS_PRODUCT_DIM`.`product_brand_key` AS `PRODUCT_BRAND_KEY`, 
                     `SLS_PRODUCT_DIM`.`product_key` AS `PRODUCT_KEY`
                 FROM
                     `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                                 (
                                 SELECT
                                     `T11`.`product_number` AS `product_number`
                                 FROM
                                     `gosalesdw1021`.`sls_product_lookup` `T11` 
                                 WHERE 
                                     `T11`.`product_language` = 'EN'
                                 ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
                 ) `Product__brand_` ON `Product__brand_`.`PRODUCT_KEY` = `SLS_SALES_FACT`.`product_key` JOIN 
                     (
                     SELECT
                         `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
                         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
                     FROM
                         `gosalesdw1021`.`sls_product_brand_lookup` `T101` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T101`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T121` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T121`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T131` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T131`.`product_line_code` JOIN 
                                     (
                                     SELECT
                                         `T11`.`product_number` AS `product_number`
                                     FROM
                                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                                     WHERE 
                                         `T11`.`product_language` = 'EN'
                                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T141` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T141`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T151` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T151`.`product_type_code`
                     ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` JOIN 
                         (
                         SELECT
                             `T161`.`REGION_CODE` AS `Region_code`, 
                             `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`, 
                             `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
                         FROM
                             (
                             SELECT
                                 `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
                                 `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
                                 `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
                                 `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
                                 `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
                                 `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
                                 `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
                                 `GO_REGION_DIM`.`region_en` AS `Region`, 
                                 `GO_REGION_DIM`.`country_en` AS `Country`, 
                                 concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
                             FROM
                                 `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
                             ) `T161` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T161`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
                         ) `Retailer_site` ON `Retailer_site`.`Retailer_site_key` = `SLS_SALES_FACT`.`retailer_site_key` JOIN 
                             (
                             SELECT
                                 `SLS_RETAILER_DIM`.`retailer_type_code` AS `Retailer_type_code`, 
                                 `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`
                             FROM
                                 `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` 
                             GROUP BY 
                                 `SLS_RETAILER_DIM`.`retailer_type_code`, 
                                 `SLS_RETAILER_DIM`.`retailer_key`
                             ) `Retailer` ON `Retailer`.`Retailer_key` = `Retailer_site`.`Retailer_key` 
 WHERE 
     `GO_BRANCH_DIM`.`branch_key` IN ( 
         9929 ) AND
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2011' AND
     `Product`.`Product_type_key` IN ( 
         961 ) AND
     `Retailer_site`.`Region_code` = 740 AND
     `Retailer`.`Retailer_type_code` = 7 
 GROUP BY 
     `Product__brand_`.`PRODUCT_BRAND_KEY`
 
 

;



-- id: 6019
SELECT     `SLS_PRODUCT_DIM`.`product_brand_key`, 
     `T1`.`product_brand_en`
 FROM
     `gosalesdw1021`.`sls_product_brand_lookup` `T1` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T1`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_brand_key` ASC
 
 

;



-- id: 6360
SELECT     `Product__brand_`.`PRODUCT_BRAND_KEY` AS `column0`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column1`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `SLS_SALES_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
                 (
                 SELECT
                     `SLS_PRODUCT_DIM`.`product_brand_key` AS `PRODUCT_BRAND_KEY`, 
                     `SLS_PRODUCT_DIM`.`product_key` AS `PRODUCT_KEY`
                 FROM
                     `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                                 (
                                 SELECT
                                     `T11`.`product_number` AS `product_number`
                                 FROM
                                     `gosalesdw1021`.`sls_product_lookup` `T11` 
                                 WHERE 
                                     `T11`.`product_language` = 'EN'
                                 ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
                 ) `Product__brand_` ON `Product__brand_`.`PRODUCT_KEY` = `SLS_SALES_FACT`.`product_key` JOIN 
                     (
                     SELECT
                         `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
                         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`, 
                         `SLS_PRODUCT_DIM`.`product_size_code` AS `Product_size_code`
                     FROM
                         `gosalesdw1021`.`sls_product_brand_lookup` `T101` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T101`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T121` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T121`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T131` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T131`.`product_line_code` JOIN 
                                     (
                                     SELECT
                                         `T11`.`product_number` AS `product_number`
                                     FROM
                                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                                     WHERE 
                                         `T11`.`product_language` = 'EN'
                                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T141` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T141`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T151` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T151`.`product_type_code`
                     ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` JOIN 
                         (
                         SELECT
                             `T16`.`REGION_CODE` AS `Region_code`, 
                             `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`, 
                             `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
                         FROM
                             (
                             SELECT
                                 `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
                                 `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
                                 `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
                                 `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
                                 `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
                                 `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
                                 `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
                                 `GO_REGION_DIM`.`region_en` AS `Region`, 
                                 `GO_REGION_DIM`.`country_en` AS `Country`, 
                                 concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
                             FROM
                                 `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
                             ) `T16` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T16`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
                         ) `Retailer_site` ON `Retailer_site`.`Retailer_site_key` = `SLS_SALES_FACT`.`retailer_site_key` JOIN 
                             (
                             SELECT
                                 `SLS_RETAILER_DIM`.`retailer_type_code` AS `Retailer_type_code`, 
                                 `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`
                             FROM
                                 `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` 
                             GROUP BY 
                                 `SLS_RETAILER_DIM`.`retailer_type_code`, 
                                 `SLS_RETAILER_DIM`.`retailer_key`
                             ) `Retailer` ON `Retailer`.`Retailer_key` = `Retailer_site`.`Retailer_key` 
 WHERE 
     `GO_BRANCH_DIM`.`branch_key` IN ( 
         9929 ) AND
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2011' AND
     `Product`.`Product_type_key` IN ( 
         961 ) AND
     `Product`.`Product_size_code` = 852 AND
     `Retailer_site`.`Region_code` = 740 AND
     `Retailer`.`Retailer_type_code` = 7 
 GROUP BY 
     `Product__brand_`.`PRODUCT_BRAND_KEY`
 
 

;



-- id: 6378
SELECT     `SLS_PRODUCT_DIM`.`product_brand_key`, 
     `T1`.`product_brand_en`
 FROM
     `gosalesdw1021`.`sls_product_brand_lookup` `T1` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T1`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_brand_key` ASC
 
 

;



-- id: 6719
SELECT     `Product__brand_`.`PRODUCT_BRAND_KEY` AS `column0`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column1`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `SLS_SALES_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
                 (
                 SELECT
                     `SLS_PRODUCT_DIM`.`product_brand_key` AS `PRODUCT_BRAND_KEY`, 
                     `SLS_PRODUCT_DIM`.`product_key` AS `PRODUCT_KEY`
                 FROM
                     `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                                 (
                                 SELECT
                                     `T11`.`product_number` AS `product_number`
                                 FROM
                                     `gosalesdw1021`.`sls_product_lookup` `T11` 
                                 WHERE 
                                     `T11`.`product_language` = 'EN'
                                 ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
                 ) `Product__brand_` ON `Product__brand_`.`PRODUCT_KEY` = `SLS_SALES_FACT`.`product_key` JOIN 
                     (
                     SELECT
                         `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
                         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`, 
                         `SLS_PRODUCT_DIM`.`product_size_code` AS `Product_size_code`
                     FROM
                         `gosalesdw1021`.`sls_product_brand_lookup` `T101` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T101`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T121` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T121`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T131` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T131`.`product_line_code` JOIN 
                                     (
                                     SELECT
                                         `T11`.`product_number` AS `product_number`
                                     FROM
                                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                                     WHERE 
                                         `T11`.`product_language` = 'EN'
                                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T141` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T141`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T151` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T151`.`product_type_code`
                     ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` JOIN 
                         (
                         SELECT
                             `T16`.`REGION_CODE` AS `Region_code`, 
                             `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`, 
                             `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
                         FROM
                             (
                             SELECT
                                 `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
                                 `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
                                 `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
                                 `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
                                 `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
                                 `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
                                 `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
                                 `GO_REGION_DIM`.`region_en` AS `Region`, 
                                 `GO_REGION_DIM`.`country_en` AS `Country`, 
                                 concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
                             FROM
                                 `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
                             ) `T16` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T16`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
                         ) `Retailer_site` ON `Retailer_site`.`Retailer_site_key` = `SLS_SALES_FACT`.`retailer_site_key` JOIN 
                             (
                             SELECT
                                 `SLS_RETAILER_DIM`.`retailer_type_code` AS `Retailer_type_code`, 
                                 `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`
                             FROM
                                 `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` 
                             GROUP BY 
                                 `SLS_RETAILER_DIM`.`retailer_type_code`, 
                                 `SLS_RETAILER_DIM`.`retailer_key`
                             ) `Retailer` ON `Retailer`.`Retailer_key` = `Retailer_site`.`Retailer_key` 
 WHERE 
     `GO_BRANCH_DIM`.`branch_key` IN ( 
         9929 ) AND
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2011' AND
     `Product`.`Product_type_key` IN ( 
         961 ) AND
     `Product`.`Product_size_code` = 851 AND
     `Retailer_site`.`Region_code` = 740 AND
     `Retailer`.`Retailer_type_code` = 7 
 GROUP BY 
     `Product__brand_`.`PRODUCT_BRAND_KEY`
 
 

;



-- id: 6736
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 WHERE 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) = '2011' 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 6743
SELECT     `T0`.`REGION_CODE`, 
     `T0`.`Region`
 FROM
     (
     SELECT
         `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
         `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
         `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
         `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
         `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
         `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
         `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
         `GO_REGION_DIM`.`region_en` AS `Region`, 
         `GO_REGION_DIM`.`country_en` AS `Country`, 
         concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
     FROM
         `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
     ) `T0` 
 ORDER BY 
     `T0`.`REGION_CODE` ASC
 
 

;



-- id: 6749
SELECT     `SLS_RETAILER_DIM`.`retailer_type_code`, 
     `SLS_RETAILER_DIM`.`retailer_type_en`
 FROM
     `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` 
 ORDER BY 
     `SLS_RETAILER_DIM`.`retailer_type_code` ASC
 
 

;



-- id: 6767
SELECT     `SLS_PRODUCT_DIM`.`product_brand_key`, 
     `T1`.`product_brand_en`
 FROM
     `gosalesdw1021`.`sls_product_brand_lookup` `T1` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T1`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_brand_key` ASC
 
 

;



-- id: 7108
SELECT     `Product__brand_`.`PRODUCT_BRAND_KEY` AS `column0`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column1`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `SLS_SALES_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
                 (
                 SELECT
                     `SLS_PRODUCT_DIM`.`product_brand_key` AS `PRODUCT_BRAND_KEY`, 
                     `SLS_PRODUCT_DIM`.`product_key` AS `PRODUCT_KEY`
                 FROM
                     `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                                 (
                                 SELECT
                                     `T11`.`product_number` AS `product_number`
                                 FROM
                                     `gosalesdw1021`.`sls_product_lookup` `T11` 
                                 WHERE 
                                     `T11`.`product_language` = 'EN'
                                 ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
                 ) `Product__brand_` ON `Product__brand_`.`PRODUCT_KEY` = `SLS_SALES_FACT`.`product_key` JOIN 
                     (
                     SELECT
                         `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
                         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
                     FROM
                         `gosalesdw1021`.`sls_product_brand_lookup` `T101` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T101`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T121` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T121`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T131` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T131`.`product_line_code` JOIN 
                                     (
                                     SELECT
                                         `T11`.`product_number` AS `product_number`
                                     FROM
                                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                                     WHERE 
                                         `T11`.`product_language` = 'EN'
                                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T141` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T141`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T151` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T151`.`product_type_code`
                     ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` JOIN 
                         (
                         SELECT
                             `T161`.`REGION_CODE` AS `Region_code`, 
                             `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`, 
                             `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
                         FROM
                             (
                             SELECT
                                 `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
                                 `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
                                 `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
                                 `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
                                 `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
                                 `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
                                 `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
                                 `GO_REGION_DIM`.`region_en` AS `Region`, 
                                 `GO_REGION_DIM`.`country_en` AS `Country`, 
                                 concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
                             FROM
                                 `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
                             ) `T161` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T161`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
                         ) `Retailer_site` ON `Retailer_site`.`Retailer_site_key` = `SLS_SALES_FACT`.`retailer_site_key` JOIN 
                             (
                             SELECT
                                 `SLS_RETAILER_DIM`.`retailer_type_code` AS `Retailer_type_code`, 
                                 `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`
                             FROM
                                 `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` 
                             GROUP BY 
                                 `SLS_RETAILER_DIM`.`retailer_type_code`, 
                                 `SLS_RETAILER_DIM`.`retailer_key`
                             ) `Retailer` ON `Retailer`.`Retailer_key` = `Retailer_site`.`Retailer_key` 
 WHERE 
     `GO_BRANCH_DIM`.`branch_key` IN ( 
         9929 ) AND
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2011' AND
     `Product`.`Product_type_key` IN ( 
         961 ) AND
     `Retailer`.`Retailer_key` = 7110 AND
     `Retailer_site`.`Region_code` = 740 AND
     `Retailer`.`Retailer_type_code` = 7 
 GROUP BY 
     `Product__brand_`.`PRODUCT_BRAND_KEY`
 
 

;



-- id: 7126
SELECT     `SLS_PRODUCT_DIM`.`product_brand_key`, 
     `T1`.`product_brand_en`
 FROM
     `gosalesdw1021`.`sls_product_brand_lookup` `T1` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T1`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_brand_key` ASC
 
 

;



-- id: 7467
SELECT     `Product__brand_`.`PRODUCT_BRAND_KEY` AS `column0`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column1`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `SLS_SALES_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
                 (
                 SELECT
                     `SLS_PRODUCT_DIM`.`product_brand_key` AS `PRODUCT_BRAND_KEY`, 
                     `SLS_PRODUCT_DIM`.`product_key` AS `PRODUCT_KEY`
                 FROM
                     `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                                 (
                                 SELECT
                                     `T11`.`product_number` AS `product_number`
                                 FROM
                                     `gosalesdw1021`.`sls_product_lookup` `T11` 
                                 WHERE 
                                     `T11`.`product_language` = 'EN'
                                 ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
                 ) `Product__brand_` ON `Product__brand_`.`PRODUCT_KEY` = `SLS_SALES_FACT`.`product_key` JOIN 
                     (
                     SELECT
                         `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
                         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`, 
                         `SLS_PRODUCT_DIM`.`product_size_code` AS `Product_size_code`
                     FROM
                         `gosalesdw1021`.`sls_product_brand_lookup` `T101` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T101`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T121` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T121`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T131` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T131`.`product_line_code` JOIN 
                                     (
                                     SELECT
                                         `T11`.`product_number` AS `product_number`
                                     FROM
                                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                                     WHERE 
                                         `T11`.`product_language` = 'EN'
                                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T141` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T141`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T151` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T151`.`product_type_code`
                     ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` JOIN 
                         (
                         SELECT
                             `T16`.`REGION_CODE` AS `Region_code`, 
                             `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`, 
                             `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
                         FROM
                             (
                             SELECT
                                 `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
                                 `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
                                 `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
                                 `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
                                 `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
                                 `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
                                 `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
                                 `GO_REGION_DIM`.`region_en` AS `Region`, 
                                 `GO_REGION_DIM`.`country_en` AS `Country`, 
                                 concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
                             FROM
                                 `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
                             ) `T16` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T16`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
                         ) `Retailer_site` ON `Retailer_site`.`Retailer_site_key` = `SLS_SALES_FACT`.`retailer_site_key` JOIN 
                             (
                             SELECT
                                 `SLS_RETAILER_DIM`.`retailer_type_code` AS `Retailer_type_code`, 
                                 `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`
                             FROM
                                 `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` 
                             GROUP BY 
                                 `SLS_RETAILER_DIM`.`retailer_type_code`, 
                                 `SLS_RETAILER_DIM`.`retailer_key`
                             ) `Retailer` ON `Retailer`.`Retailer_key` = `Retailer_site`.`Retailer_key` 
 WHERE 
     `GO_BRANCH_DIM`.`branch_key` IN ( 
         9929 ) AND
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2011' AND
     `Product`.`Product_type_key` IN ( 
         961 ) AND
     `Product`.`Product_size_code` = 852 AND
     `Retailer`.`Retailer_key` = 7110 AND
     `Retailer_site`.`Region_code` = 740 AND
     `Retailer`.`Retailer_type_code` = 7 
 GROUP BY 
     `Product__brand_`.`PRODUCT_BRAND_KEY`
 
 

;



-- id: 7485
SELECT     `SLS_PRODUCT_DIM`.`product_brand_key`, 
     `T1`.`product_brand_en`
 FROM
     `gosalesdw1021`.`sls_product_brand_lookup` `T1` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T1`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_brand_key` ASC
 
 

;



-- id: 7826
SELECT     `Product__brand_`.`PRODUCT_BRAND_KEY` AS `column0`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column1`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `SLS_SALES_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
                 (
                 SELECT
                     `SLS_PRODUCT_DIM`.`product_brand_key` AS `PRODUCT_BRAND_KEY`, 
                     `SLS_PRODUCT_DIM`.`product_key` AS `PRODUCT_KEY`
                 FROM
                     `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                                 (
                                 SELECT
                                     `T11`.`product_number` AS `product_number`
                                 FROM
                                     `gosalesdw1021`.`sls_product_lookup` `T11` 
                                 WHERE 
                                     `T11`.`product_language` = 'EN'
                                 ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
                 ) `Product__brand_` ON `Product__brand_`.`PRODUCT_KEY` = `SLS_SALES_FACT`.`product_key` JOIN 
                     (
                     SELECT
                         `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
                         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`, 
                         `SLS_PRODUCT_DIM`.`product_size_code` AS `Product_size_code`
                     FROM
                         `gosalesdw1021`.`sls_product_brand_lookup` `T101` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T101`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T121` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T121`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T131` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T131`.`product_line_code` JOIN 
                                     (
                                     SELECT
                                         `T11`.`product_number` AS `product_number`
                                     FROM
                                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                                     WHERE 
                                         `T11`.`product_language` = 'EN'
                                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T141` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T141`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T151` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T151`.`product_type_code`
                     ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` JOIN 
                         (
                         SELECT
                             `T16`.`REGION_CODE` AS `Region_code`, 
                             `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`, 
                             `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
                         FROM
                             (
                             SELECT
                                 `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
                                 `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
                                 `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
                                 `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
                                 `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
                                 `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
                                 `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
                                 `GO_REGION_DIM`.`region_en` AS `Region`, 
                                 `GO_REGION_DIM`.`country_en` AS `Country`, 
                                 concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
                             FROM
                                 `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
                             ) `T16` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T16`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
                         ) `Retailer_site` ON `Retailer_site`.`Retailer_site_key` = `SLS_SALES_FACT`.`retailer_site_key` JOIN 
                             (
                             SELECT
                                 `SLS_RETAILER_DIM`.`retailer_type_code` AS `Retailer_type_code`, 
                                 `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`
                             FROM
                                 `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` 
                             GROUP BY 
                                 `SLS_RETAILER_DIM`.`retailer_type_code`, 
                                 `SLS_RETAILER_DIM`.`retailer_key`
                             ) `Retailer` ON `Retailer`.`Retailer_key` = `Retailer_site`.`Retailer_key` 
 WHERE 
     `GO_BRANCH_DIM`.`branch_key` IN ( 
         9929 ) AND
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2011' AND
     `Product`.`Product_type_key` IN ( 
         961 ) AND
     `Product`.`Product_size_code` = 851 AND
     `Retailer`.`Retailer_key` = 7110 AND
     `Retailer_site`.`Region_code` = 740 AND
     `Retailer`.`Retailer_type_code` = 7 
 GROUP BY 
     `Product__brand_`.`PRODUCT_BRAND_KEY`
 
 

;



-- id: 7844
SELECT     `SLS_PRODUCT_DIM`.`product_brand_key`, 
     `T1`.`product_brand_en`
 FROM
     `gosalesdw1021`.`sls_product_brand_lookup` `T1` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T1`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_brand_key` ASC
 
 

;



-- id: 8185
SELECT     `Product__brand_`.`PRODUCT_BRAND_KEY` AS `column0`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column1`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `SLS_SALES_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
                 (
                 SELECT
                     `SLS_PRODUCT_DIM`.`product_brand_key` AS `PRODUCT_BRAND_KEY`, 
                     `SLS_PRODUCT_DIM`.`product_key` AS `PRODUCT_KEY`
                 FROM
                     `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                                 (
                                 SELECT
                                     `T11`.`product_number` AS `product_number`
                                 FROM
                                     `gosalesdw1021`.`sls_product_lookup` `T11` 
                                 WHERE 
                                     `T11`.`product_language` = 'EN'
                                 ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
                 ) `Product__brand_` ON `Product__brand_`.`PRODUCT_KEY` = `SLS_SALES_FACT`.`product_key` JOIN 
                     (
                     SELECT
                         `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
                         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
                     FROM
                         `gosalesdw1021`.`sls_product_brand_lookup` `T101` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T101`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T121` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T121`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T131` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T131`.`product_line_code` JOIN 
                                     (
                                     SELECT
                                         `T11`.`product_number` AS `product_number`
                                     FROM
                                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                                     WHERE 
                                         `T11`.`product_language` = 'EN'
                                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T141` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T141`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T151` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T151`.`product_type_code`
                     ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` JOIN 
                         (
                         SELECT
                             `T161`.`REGION_CODE` AS `Region_code`, 
                             `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`, 
                             `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
                         FROM
                             (
                             SELECT
                                 `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
                                 `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
                                 `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
                                 `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
                                 `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
                                 `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
                                 `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
                                 `GO_REGION_DIM`.`region_en` AS `Region`, 
                                 `GO_REGION_DIM`.`country_en` AS `Country`, 
                                 concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
                             FROM
                                 `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
                             ) `T161` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T161`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
                         ) `Retailer_site` ON `Retailer_site`.`Retailer_site_key` = `SLS_SALES_FACT`.`retailer_site_key` JOIN 
                             (
                             SELECT
                                 `SLS_RETAILER_DIM`.`retailer_type_code` AS `Retailer_type_code`, 
                                 `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`
                             FROM
                                 `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` 
                             GROUP BY 
                                 `SLS_RETAILER_DIM`.`retailer_type_code`, 
                                 `SLS_RETAILER_DIM`.`retailer_key`
                             ) `Retailer` ON `Retailer`.`Retailer_key` = `Retailer_site`.`Retailer_key` 
 WHERE 
     `GO_BRANCH_DIM`.`branch_key` IN ( 
         9929 ) AND
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2011' AND
     `Product`.`Product_type_key` IN ( 
         961 ) AND
     `Retailer_site`.`Region_code` = 740 AND
     `Retailer`.`Retailer_key` = 7084 AND
     `Retailer`.`Retailer_type_code` = 7 
 GROUP BY 
     `Product__brand_`.`PRODUCT_BRAND_KEY`
 
 

;



-- id: 8203
SELECT     `SLS_PRODUCT_DIM`.`product_brand_key`, 
     `T1`.`product_brand_en`
 FROM
     `gosalesdw1021`.`sls_product_brand_lookup` `T1` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T1`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_brand_key` ASC
 
 

;



-- id: 8544
SELECT     `Product__brand_`.`PRODUCT_BRAND_KEY` AS `column0`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column1`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `SLS_SALES_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
                 (
                 SELECT
                     `SLS_PRODUCT_DIM`.`product_brand_key` AS `PRODUCT_BRAND_KEY`, 
                     `SLS_PRODUCT_DIM`.`product_key` AS `PRODUCT_KEY`
                 FROM
                     `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                                 (
                                 SELECT
                                     `T11`.`product_number` AS `product_number`
                                 FROM
                                     `gosalesdw1021`.`sls_product_lookup` `T11` 
                                 WHERE 
                                     `T11`.`product_language` = 'EN'
                                 ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
                 ) `Product__brand_` ON `Product__brand_`.`PRODUCT_KEY` = `SLS_SALES_FACT`.`product_key` JOIN 
                     (
                     SELECT
                         `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
                         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`, 
                         `SLS_PRODUCT_DIM`.`product_size_code` AS `Product_size_code`
                     FROM
                         `gosalesdw1021`.`sls_product_brand_lookup` `T101` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T101`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T121` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T121`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T131` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T131`.`product_line_code` JOIN 
                                     (
                                     SELECT
                                         `T11`.`product_number` AS `product_number`
                                     FROM
                                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                                     WHERE 
                                         `T11`.`product_language` = 'EN'
                                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T141` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T141`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T151` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T151`.`product_type_code`
                     ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` JOIN 
                         (
                         SELECT
                             `T16`.`REGION_CODE` AS `Region_code`, 
                             `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`, 
                             `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
                         FROM
                             (
                             SELECT
                                 `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
                                 `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
                                 `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
                                 `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
                                 `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
                                 `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
                                 `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
                                 `GO_REGION_DIM`.`region_en` AS `Region`, 
                                 `GO_REGION_DIM`.`country_en` AS `Country`, 
                                 concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
                             FROM
                                 `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
                             ) `T16` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T16`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
                         ) `Retailer_site` ON `Retailer_site`.`Retailer_site_key` = `SLS_SALES_FACT`.`retailer_site_key` JOIN 
                             (
                             SELECT
                                 `SLS_RETAILER_DIM`.`retailer_type_code` AS `Retailer_type_code`, 
                                 `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`
                             FROM
                                 `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` 
                             GROUP BY 
                                 `SLS_RETAILER_DIM`.`retailer_type_code`, 
                                 `SLS_RETAILER_DIM`.`retailer_key`
                             ) `Retailer` ON `Retailer`.`Retailer_key` = `Retailer_site`.`Retailer_key` 
 WHERE 
     `GO_BRANCH_DIM`.`branch_key` IN ( 
         9929 ) AND
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2011' AND
     `Product`.`Product_type_key` IN ( 
         961 ) AND
     `Product`.`Product_size_code` = 852 AND
     `Retailer_site`.`Region_code` = 740 AND
     `Retailer`.`Retailer_key` = 7084 AND
     `Retailer`.`Retailer_type_code` = 7 
 GROUP BY 
     `Product__brand_`.`PRODUCT_BRAND_KEY`
 
 

;



-- id: 8562
SELECT     `SLS_PRODUCT_DIM`.`product_brand_key`, 
     `T1`.`product_brand_en`
 FROM
     `gosalesdw1021`.`sls_product_brand_lookup` `T1` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T1`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_brand_key` ASC
 
 

;



-- id: 8903
SELECT     `Product__brand_`.`PRODUCT_BRAND_KEY` AS `column0`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column1`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `SLS_SALES_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
                 (
                 SELECT
                     `SLS_PRODUCT_DIM`.`product_brand_key` AS `PRODUCT_BRAND_KEY`, 
                     `SLS_PRODUCT_DIM`.`product_key` AS `PRODUCT_KEY`
                 FROM
                     `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                                 (
                                 SELECT
                                     `T11`.`product_number` AS `product_number`
                                 FROM
                                     `gosalesdw1021`.`sls_product_lookup` `T11` 
                                 WHERE 
                                     `T11`.`product_language` = 'EN'
                                 ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
                 ) `Product__brand_` ON `Product__brand_`.`PRODUCT_KEY` = `SLS_SALES_FACT`.`product_key` JOIN 
                     (
                     SELECT
                         `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
                         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`, 
                         `SLS_PRODUCT_DIM`.`product_size_code` AS `Product_size_code`
                     FROM
                         `gosalesdw1021`.`sls_product_brand_lookup` `T101` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T101`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T121` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T121`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T131` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T131`.`product_line_code` JOIN 
                                     (
                                     SELECT
                                         `T11`.`product_number` AS `product_number`
                                     FROM
                                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                                     WHERE 
                                         `T11`.`product_language` = 'EN'
                                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T141` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T141`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T151` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T151`.`product_type_code`
                     ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` JOIN 
                         (
                         SELECT
                             `T16`.`REGION_CODE` AS `Region_code`, 
                             `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`, 
                             `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
                         FROM
                             (
                             SELECT
                                 `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
                                 `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
                                 `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
                                 `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
                                 `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
                                 `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
                                 `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
                                 `GO_REGION_DIM`.`region_en` AS `Region`, 
                                 `GO_REGION_DIM`.`country_en` AS `Country`, 
                                 concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
                             FROM
                                 `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
                             ) `T16` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T16`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
                         ) `Retailer_site` ON `Retailer_site`.`Retailer_site_key` = `SLS_SALES_FACT`.`retailer_site_key` JOIN 
                             (
                             SELECT
                                 `SLS_RETAILER_DIM`.`retailer_type_code` AS `Retailer_type_code`, 
                                 `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`
                             FROM
                                 `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` 
                             GROUP BY 
                                 `SLS_RETAILER_DIM`.`retailer_type_code`, 
                                 `SLS_RETAILER_DIM`.`retailer_key`
                             ) `Retailer` ON `Retailer`.`Retailer_key` = `Retailer_site`.`Retailer_key` 
 WHERE 
     `GO_BRANCH_DIM`.`branch_key` IN ( 
         9929 ) AND
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2011' AND
     `Product`.`Product_type_key` IN ( 
         961 ) AND
     `Product`.`Product_size_code` = 851 AND
     `Retailer_site`.`Region_code` = 740 AND
     `Retailer`.`Retailer_key` = 7084 AND
     `Retailer`.`Retailer_type_code` = 7 
 GROUP BY 
     `Product__brand_`.`PRODUCT_BRAND_KEY`
 
 

;



-- id: 8918
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 8928
SELECT     `GO_REGION_DIM`.`region_code` AS `column0`, 
     `GO_REGION_DIM`.`region_en` AS `column1`
 FROM
     `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` 
 GROUP BY 
     `GO_REGION_DIM`.`region_code`, 
     `GO_REGION_DIM`.`region_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 8940
SELECT     `GO_REGION_DIM`.`region_code` AS `column0`, 
     `GO_REGION_DIM`.`region_en` AS `column1`
 FROM
     `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` 
 WHERE 
     `GO_REGION_DIM`.`region_code` = 710 
 GROUP BY 
     `GO_REGION_DIM`.`region_code`, 
     `GO_REGION_DIM`.`region_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 8952
SELECT     `GO_REGION_DIM`.`region_code` AS `column0`, 
     `GO_REGION_DIM`.`region_en` AS `column1`, 
     `GO_REGION_DIM`.`country_code` AS `column2`, 
     `GO_REGION_DIM`.`country_en` AS `column3`
 FROM
     `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` 
 WHERE 
     `GO_REGION_DIM`.`region_code` = 710 
 GROUP BY 
     `GO_REGION_DIM`.`region_code`, 
     `GO_REGION_DIM`.`region_en`, 
     `GO_REGION_DIM`.`country_code`, 
     `GO_REGION_DIM`.`country_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC, 
     `column3` ASC, 
     `column2` ASC
 
 

;



-- id: 8987
SELECT     `GO_REGION_DIM`.`country_code` AS `column0`, 
     `EMP_EMPLOYEE_DIM`.`employee_key` AS `column1`, 
     `EMP_EMPLOYEE_DIM`.`employee_name` AS `column2`, 
     `EMP_EMPLOYEE_DIM`.`employee_name_mb` AS `column3`, 
     `GO_REGION_DIM`.`country_en` AS `C_sortColumn0`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` 
 WHERE 
     `GO_REGION_DIM`.`region_code` = 710 
 GROUP BY 
     `GO_REGION_DIM`.`country_code`, 
     `EMP_EMPLOYEE_DIM`.`employee_key`, 
     `EMP_EMPLOYEE_DIM`.`employee_name`, 
     `EMP_EMPLOYEE_DIM`.`employee_name_mb`, 
     `GO_REGION_DIM`.`country_en` 
 ORDER BY 
     `C_sortColumn0` ASC, 
     `column0` ASC, 
     `column2` ASC, 
     `column3` ASC, 
     `column1` ASC
 
 

;



-- id: 9049
SELECT     `GO_REGION_DIM`.`region_code` AS `column0`, 
     `GO_REGION_DIM`.`country_code` AS `column1`, 
     `EMP_EMPLOYEE_DIM`.`employee_key` AS `column2`, 
     AVG(`EMP_SUMMARY_FACT`.`bonus`) AS `column4`, 
     SUM(`EMP_SUMMARY_FACT`.`salary` * `EMP_SUMMARY_FACT`.`bonus`) AS `column5`, 
     SUM(`EMP_SUMMARY_FACT`.`bonus`) AS `Sum1`, 
     COUNT(`EMP_SUMMARY_FACT`.`bonus`) AS `Count1`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`emp_summary_fact` `EMP_SUMMARY_FACT` ON `EMP_SUMMARY_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_SUMMARY_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_REGION_DIM`.`region_code` = 710 
 GROUP BY 
     `GO_REGION_DIM`.`region_code`, 
     `GO_REGION_DIM`.`country_code`, 
     `EMP_EMPLOYEE_DIM`.`employee_key` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 9111
SELECT     `GO_REGION_DIM`.`region_code` AS `column0`, 
     `GO_REGION_DIM`.`country_code` AS `column1`, 
     SUM(`EMP_SUMMARY_FACT`.`bonus`) AS `Sum1`, 
     COUNT(`EMP_SUMMARY_FACT`.`bonus`) AS `Count1`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`emp_summary_fact` `EMP_SUMMARY_FACT` ON `EMP_SUMMARY_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_SUMMARY_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_REGION_DIM`.`region_code` = 710 AND
     `GO_REGION_DIM`.`region_code` = 710 AND
     `GO_REGION_DIM`.`country_code` = 1004 AND
     `EMP_EMPLOYEE_DIM`.`employee_key` IN ( 
         4770, 
         4643, 
         4641, 
         4172, 
         4650, 
         4866, 
         4840, 
         4450, 
         4437, 
         4625, 
         4628, 
         4769, 
         4867, 
         4318, 
         4872, 
         4171, 
         4317, 
         4637, 
         4630, 
         4436, 
         4368, 
         4860, 
         4636, 
         4439, 
         4632, 
         4640, 
         4629, 
         4623, 
         4422, 
         4170, 
         4871, 
         4627, 
         4315, 
         4774, 
         4366 ) AND
     `GO_REGION_DIM`.`region_code` = 710 
 GROUP BY 
     `GO_REGION_DIM`.`region_code`, 
     `GO_REGION_DIM`.`country_code` 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 9173
SELECT     `GO_REGION_DIM`.`region_code` AS `column0`, 
     `GO_REGION_DIM`.`country_code` AS `column1`, 
     SUM(`EMP_SUMMARY_FACT`.`bonus`) AS `Sum1`, 
     COUNT(`EMP_SUMMARY_FACT`.`bonus`) AS `Count1`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`emp_summary_fact` `EMP_SUMMARY_FACT` ON `EMP_SUMMARY_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_SUMMARY_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_REGION_DIM`.`region_code` = 710 AND
     `GO_REGION_DIM`.`region_code` = 710 AND
     `GO_REGION_DIM`.`country_code` = 1020 AND
     `EMP_EMPLOYEE_DIM`.`employee_key` IN ( 
         4646, 
         4868, 
         4531, 
         4205, 
         4535, 
         4534, 
         4370, 
         4532, 
         4837, 
         4423, 
         4771, 
         4648, 
         4262, 
         4622, 
         4529 ) AND
     `GO_REGION_DIM`.`region_code` = 710 
 GROUP BY 
     `GO_REGION_DIM`.`region_code`, 
     `GO_REGION_DIM`.`country_code` 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 9235
SELECT     `GO_REGION_DIM`.`region_code` AS `column0`, 
     `GO_REGION_DIM`.`country_code` AS `column1`, 
     SUM(`EMP_SUMMARY_FACT`.`bonus`) AS `Sum1`, 
     COUNT(`EMP_SUMMARY_FACT`.`bonus`) AS `Count1`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`emp_summary_fact` `EMP_SUMMARY_FACT` ON `EMP_SUMMARY_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_SUMMARY_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_REGION_DIM`.`region_code` = 710 AND
     `GO_REGION_DIM`.`region_code` = 710 AND
     `GO_REGION_DIM`.`country_code` = 1003 AND
     `EMP_EMPLOYEE_DIM`.`employee_key` IN ( 
         4359, 
         4441, 
         4842, 
         4440, 
         4180, 
         4420, 
         4361, 
         4869, 
         4176, 
         4438, 
         4177, 
         4421, 
         4174, 
         4364, 
         4173, 
         4179, 
         4633, 
         4362, 
         4445, 
         4635 ) AND
     `GO_REGION_DIM`.`region_code` = 710 
 GROUP BY 
     `GO_REGION_DIM`.`region_code`, 
     `GO_REGION_DIM`.`country_code` 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 9297
SELECT     `GO_REGION_DIM`.`region_code` AS `column0`, 
     `GO_REGION_DIM`.`country_code` AS `column1`, 
     SUM(`EMP_SUMMARY_FACT`.`bonus`) AS `Sum1`, 
     COUNT(`EMP_SUMMARY_FACT`.`bonus`) AS `Count1`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`emp_summary_fact` `EMP_SUMMARY_FACT` ON `EMP_SUMMARY_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_SUMMARY_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_REGION_DIM`.`region_code` = 710 AND
     `GO_REGION_DIM`.`region_code` = 710 AND
     `GO_REGION_DIM`.`country_code` = 1021 AND
     `EMP_EMPLOYEE_DIM`.`employee_key` IN ( 
         4651, 
         4870, 
         4192, 
         4631, 
         4638, 
         4813, 
         4373, 
         4528, 
         4649, 
         4316, 
         4314 ) AND
     `GO_REGION_DIM`.`region_code` = 710 
 GROUP BY 
     `GO_REGION_DIM`.`region_code`, 
     `GO_REGION_DIM`.`country_code` 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 9314
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 WHERE 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) = '2012' 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 9374
SELECT     `GO_REGION_DIM`.`region_code` AS `column0`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column1`, 
     AVG(`EMP_SUMMARY_FACT`.`bonus`) AS `column2`, 
     SUM(`EMP_SUMMARY_FACT`.`bonus`) AS `Sum1`, 
     COUNT(`EMP_SUMMARY_FACT`.`bonus`) AS `Count1`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`emp_summary_fact` `EMP_SUMMARY_FACT` ON `EMP_SUMMARY_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_SUMMARY_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_REGION_DIM`.`region_code` = 710 
 GROUP BY 
     `GO_REGION_DIM`.`region_code`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4))
 
 

;



-- id: 9439
SELECT     `GO_REGION_DIM`.`region_code` AS `column0`, 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column1`, 
     SUM(`T5`.`sales_target`) AS `column2`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`sls_sales_targ_fact` `T5` ON `T5`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN 
             (
             SELECT
                 `GO_TIME_DIM`.`month_key` AS `month_key`, 
                 `GO_TIME_DIM`.`current_year` AS `current_year`
             FROM
                 `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
             GROUP BY 
                 `GO_TIME_DIM`.`month_key`, 
                 `GO_TIME_DIM`.`current_year`
             ) `GO_TIME_DIM0` ON `T5`.`month_key` = `GO_TIME_DIM0`.`month_key` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` 
 WHERE 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_REGION_DIM`.`region_code` = 710 
 GROUP BY 
     `GO_REGION_DIM`.`region_code`, 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4))
 
 

;



-- id: 9499
SELECT     `GO_REGION_DIM`.`region_code` AS `column0`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column1`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column2`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `SLS_SALES_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_REGION_DIM`.`region_code` = 710 
 GROUP BY 
     `GO_REGION_DIM`.`region_code`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4))
 
 

;



-- id: 9511
SELECT     `T0`.`submission_key` AS `column0`, 
     `T0`.`submission_name_en` AS `column1`
 FROM
     `gosalesdw1021`.`fin_subm_dim` `T0` 
 WHERE 
     `T0`.`submission_key` = 708 OR
     `T0`.`submission_key` = 705 
 GROUP BY 
     `T0`.`submission_key`, 
     `T0`.`submission_name_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 9523
SELECT     `T2`.`quarter_key`, 
     concat(`T2`.`quarter_en`, ' ')
 FROM
     `gosalesdw1021`.`go_time_quarter_lookup` `T2` 
 ORDER BY 
     `T2`.`quarter_key` ASC
 
 
     `GO_TIME_DIM`.`month_key`, 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`current_year`, 
     `GO_TIME_DIM`.`month_en`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 ORDER BY 
     `GO_TIME_DIM`.`month_key` ASC, 
     `GO_TIME_DIM`.`quarter_key` ASC, 
     `GO_TIME_DIM`.`current_year` ASC
     `GO_TIME_DIM`.`month_key`, 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`current_year`, 
     `GO_TIME_DIM`.`month_en`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 ORDER BY 
     `GO_TIME_DIM`.`month_key` ASC, 
     `GO_TIME_DIM`.`quarter_key` ASC, 
     `GO_TIME_DIM`.`current_year` ASC
 
 

;



-- id: 9589
SELECT     `FIN_ACCOUNT_DIM`.`account_code1` AS `column0`, 
     `T21`.`Account_name__level_1_` AS `column1`, 
     `FIN_ACCOUNT_DIM`.`account_code2` AS `column2`, 
     `T31`.`Account_name__level_2_` AS `column3`, 
     `FIN_ACCOUNT_DIM`.`account_code3` AS `column4`, 
     `T41`.`Account_name__level_3_` AS `column5`, 
     `FIN_ACCOUNT_DIM`.`account_code4` AS `column6`, 
     `T5`.`Account_name__level_4_` AS `column7`
 FROM
     (
     SELECT
         `T11`.`account_name_en` AS `Account_name__level_1_`, 
         `T11`.`account_code` AS `Account_code__level_1_`
     FROM
         `gosalesdw1021`.`fin_account_name_lookup` `T11`
     ) `T21` JOIN `gosalesdw1021`.`fin_account_dim` `FIN_ACCOUNT_DIM` ON `T21`.`Account_code__level_1_` = `FIN_ACCOUNT_DIM`.`account_code1` JOIN 
         (
         SELECT
             `T11`.`account_name_en` AS `Account_name__level_2_`, 
             `T11`.`account_code` AS `Account_code__level_2_`
         FROM
             `gosalesdw1021`.`fin_account_name_lookup` `T11`
         ) `T31` ON `T31`.`Account_code__level_2_` = `FIN_ACCOUNT_DIM`.`account_code2` JOIN 
             (
             SELECT
                 `T11`.`account_name_en` AS `Account_name__level_3_`, 
                 `T11`.`account_code` AS `Account_code__level_3_`
             FROM
                 `gosalesdw1021`.`fin_account_name_lookup` `T11`
             ) `T41` ON `T41`.`Account_code__level_3_` = `FIN_ACCOUNT_DIM`.`account_code3` JOIN 
                 (
                 SELECT
                     `T11`.`account_name_en` AS `Account_name__level_4_`, 
                     `T11`.`account_code` AS `Account_code__level_4_`
                 FROM
                     `gosalesdw1021`.`fin_account_name_lookup` `T11`
                 ) `T5` ON `T5`.`Account_code__level_4_` = `FIN_ACCOUNT_DIM`.`account_code4` 
 WHERE 
     `FIN_ACCOUNT_DIM`.`account_code2` = 'TOT_ASSTS' OR
     `FIN_ACCOUNT_DIM`.`account_code3` = 'TOT_ASSTS' OR
     `FIN_ACCOUNT_DIM`.`account_code3` = 'TOT_CURASSTS' OR
     `FIN_ACCOUNT_DIM`.`account_code3` = 'TOT_OPASSTS' OR
     `FIN_ACCOUNT_DIM`.`account_code3` = 'TOT_OTHASSTS' OR
     `FIN_ACCOUNT_DIM`.`account_code3` = 'TOT_LIAB' OR
     `FIN_ACCOUNT_DIM`.`account_code4` = 'TOT_CURRLIAB' OR
     `FIN_ACCOUNT_DIM`.`account_code4` = 'TOT_LIAB' OR
     `FIN_ACCOUNT_DIM`.`account_code4` = 'TOT_LTOTHLIAB' OR
     `FIN_ACCOUNT_DIM`.`account_code3` = 'TOT_EQTY' OR
     `FIN_ACCOUNT_DIM`.`account_code4` = '300100' OR
     `FIN_ACCOUNT_DIM`.`account_code4` = '300150' OR
     `FIN_ACCOUNT_DIM`.`account_code4` = '301000' OR
     `FIN_ACCOUNT_DIM`.`account_code4` = '302000' OR
     `FIN_ACCOUNT_DIM`.`account_code4` = '303000' OR
     `FIN_ACCOUNT_DIM`.`account_code4` = 'TOT_EQTY' 
 GROUP BY 
     `FIN_ACCOUNT_DIM`.`account_code1`, 
     `T21`.`Account_name__level_1_`, 
     `FIN_ACCOUNT_DIM`.`account_code2`, 
     `T31`.`Account_name__level_2_`, 
     `FIN_ACCOUNT_DIM`.`account_code3`, 
     `T41`.`Account_name__level_3_`, 
     `FIN_ACCOUNT_DIM`.`account_code4`, 
     `T5`.`Account_name__level_4_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC, 
     `column3` ASC, 
     `column2` ASC, 
     `column5` ASC, 
     `column4` ASC, 
     `column7` ASC, 
     `column6` ASC
 
 

;



-- id: 9643
SELECT     `FIN_ACCOUNT_DIM`.`account_code1` AS `column0`, 
     `FIN_ACCOUNT_DIM`.`account_code2` AS `column1`, 
     `FIN_ACCOUNT_DIM`.`account_code3` AS `column2`, 
     `FIN_ACCOUNT_DIM`.`account_code4` AS `column3`, 
     `T5`.`submission_key` AS `column4`, 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column5`, 
     `GO_TIME_DIM0`.`quarter_key` AS `column6`, 
     `GO_TIME_DIM0`.`month_key` AS `column7`, 
     SUM(`FIN_FINANCE_FACT`.`amount_year_to_date`) AS `column8`
 FROM
     `gosalesdw1021`.`fin_finance_fact` `FIN_FINANCE_FACT` JOIN 
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` ON `FIN_FINANCE_FACT`.`month_key` = `GO_TIME_DIM0`.`month_key` JOIN `gosalesdw1021`.`fin_account_dim` `FIN_ACCOUNT_DIM` ON `FIN_ACCOUNT_DIM`.`account_key` = `FIN_FINANCE_FACT`.`account_key` JOIN `gosalesdw1021`.`fin_subm_dim` `T5` ON `T5`.`submission_key` = `FIN_FINANCE_FACT`.`submission_key` 
 WHERE 
     `FIN_ACCOUNT_DIM`.`account_code1` = 'TOT_BALSHT' AND
     `FIN_ACCOUNT_DIM`.`account_code2` = 'TOT_LIAB&EQTY' AND
     `FIN_ACCOUNT_DIM`.`account_code3` IN ( 
         'TOT_EQTY', 
         'TOT_LIAB' ) AND
     `FIN_ACCOUNT_DIM`.`account_code4` IN ( 
         '301000', 
         '300100', 
         'TOT_LTOTHLIAB', 
         '302000', 
         'TOT_CURRLIAB', 
         'TOT_EQTY', 
         'TOT_LIAB', 
         '300150', 
         '303000' ) AND
     `T5`.`submission_key` IN ( 
         708, 
         705 ) AND
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) IN ( 
         '2012', 
         '2011' ) AND
     `GO_TIME_DIM0`.`quarter_key` IN ( 
         20124, 
         20114 ) AND
     `GO_TIME_DIM0`.`month_key` IN ( 
         201112, 
         201212 ) 
 GROUP BY 
     `FIN_ACCOUNT_DIM`.`account_code1`, 
     `FIN_ACCOUNT_DIM`.`account_code2`, 
     `FIN_ACCOUNT_DIM`.`account_code3`, 
     `FIN_ACCOUNT_DIM`.`account_code4`, 
     `T5`.`submission_key`, 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     `GO_TIME_DIM0`.`month_key`
 
 

;



-- id: 9697
SELECT     `FIN_ACCOUNT_DIM`.`account_code1` AS `column0`, 
     `FIN_ACCOUNT_DIM`.`account_code2` AS `column1`, 
     `FIN_ACCOUNT_DIM`.`account_code3` AS `column2`, 
     `T4`.`submission_key` AS `column3`, 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column4`, 
     `GO_TIME_DIM0`.`quarter_key` AS `column5`, 
     `GO_TIME_DIM0`.`month_key` AS `column6`, 
     SUM(`FIN_FINANCE_FACT`.`amount_year_to_date`) AS `column7`
 FROM
     `gosalesdw1021`.`fin_finance_fact` `FIN_FINANCE_FACT` JOIN 
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` ON `FIN_FINANCE_FACT`.`month_key` = `GO_TIME_DIM0`.`month_key` JOIN `gosalesdw1021`.`fin_account_dim` `FIN_ACCOUNT_DIM` ON `FIN_ACCOUNT_DIM`.`account_key` = `FIN_FINANCE_FACT`.`account_key` JOIN `gosalesdw1021`.`fin_subm_dim` `T4` ON `T4`.`submission_key` = `FIN_FINANCE_FACT`.`submission_key` 
 WHERE 
     `FIN_ACCOUNT_DIM`.`account_code1` = 'TOT_BALSHT' AND
     `FIN_ACCOUNT_DIM`.`account_code2` IN ( 
         'TOT_LIAB&EQTY', 
         'TOT_ASSTS' ) AND
     `FIN_ACCOUNT_DIM`.`account_code3` IN ( 
         'TOT_ASSTS', 
         'TOT_EQTY', 
         'TOT_LIAB', 
         'TOT_CURASSTS', 
         'TOT_OPASSTS', 
         'TOT_OTHASSTS' ) AND
     `T4`.`submission_key` IN ( 
         708, 
         705 ) AND
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) IN ( 
         '2012', 
         '2011' ) AND
     `GO_TIME_DIM0`.`quarter_key` IN ( 
         20124, 
         20114 ) AND
     `GO_TIME_DIM0`.`month_key` IN ( 
         201112, 
         201212 ) 
 GROUP BY 
     `FIN_ACCOUNT_DIM`.`account_code1`, 
     `FIN_ACCOUNT_DIM`.`account_code2`, 
     `FIN_ACCOUNT_DIM`.`account_code3`, 
     `T4`.`submission_key`, 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     `GO_TIME_DIM0`.`month_key`
 
 

;



-- id: 9751
SELECT     `FIN_ACCOUNT_DIM`.`account_code1` AS `column0`, 
     `FIN_ACCOUNT_DIM`.`account_code2` AS `column1`, 
     `T4`.`submission_key` AS `column2`, 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column3`, 
     `GO_TIME_DIM0`.`quarter_key` AS `column4`, 
     `GO_TIME_DIM0`.`month_key` AS `column5`, 
     SUM(`FIN_FINANCE_FACT`.`amount_year_to_date`) AS `column6`
 FROM
     `gosalesdw1021`.`fin_finance_fact` `FIN_FINANCE_FACT` JOIN 
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` ON `FIN_FINANCE_FACT`.`month_key` = `GO_TIME_DIM0`.`month_key` JOIN `gosalesdw1021`.`fin_account_dim` `FIN_ACCOUNT_DIM` ON `FIN_ACCOUNT_DIM`.`account_key` = `FIN_FINANCE_FACT`.`account_key` JOIN `gosalesdw1021`.`fin_subm_dim` `T4` ON `T4`.`submission_key` = `FIN_FINANCE_FACT`.`submission_key` 
 WHERE 
     `FIN_ACCOUNT_DIM`.`account_code1` = 'TOT_BALSHT' AND
     `FIN_ACCOUNT_DIM`.`account_code2` = 'TOT_ASSTS' AND
     `T4`.`submission_key` IN ( 
         708, 
         705 ) AND
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) IN ( 
         '2012', 
         '2011' ) AND
     `GO_TIME_DIM0`.`quarter_key` IN ( 
         20124, 
         20114 ) AND
     `GO_TIME_DIM0`.`month_key` IN ( 
         201112, 
         201212 ) 
 GROUP BY 
     `FIN_ACCOUNT_DIM`.`account_code1`, 
     `FIN_ACCOUNT_DIM`.`account_code2`, 
     `T4`.`submission_key`, 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     `GO_TIME_DIM0`.`month_key`
 
 

;



-- id: 9761
SELECT     `EMP_EMPLOYEE_DIM`.`manager_code1` AS `column0`, 
     `EMP_EMPLOYEE_DIM`.`manager1` AS `column1`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb1` AS `column2`, 
     `EMP_EMPLOYEE_DIM`.`manager_code2` AS `column3`, 
     `EMP_EMPLOYEE_DIM`.`manager2` AS `column4`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb2` AS `column5`, 
     `EMP_EMPLOYEE_DIM`.`manager_code3` AS `column6`, 
     `EMP_EMPLOYEE_DIM`.`manager3` AS `column7`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb3` AS `column8`, 
     `EMP_EMPLOYEE_DIM`.`manager_code4` AS `column9`, 
     `EMP_EMPLOYEE_DIM`.`manager4` AS `column10`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb4` AS `column11`, 
     `EMP_EMPLOYEE_DIM`.`manager_code5` AS `column12`, 
     `EMP_EMPLOYEE_DIM`.`manager5` AS `column13`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb5` AS `column14`, 
     `EMP_EMPLOYEE_DIM`.`manager_code6` AS `column15`, 
     `EMP_EMPLOYEE_DIM`.`manager6` AS `column16`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb6` AS `column17`, 
     `EMP_EMPLOYEE_DIM`.`employee_key` AS `column18`, 
     `EMP_EMPLOYEE_DIM`.`employee_name` AS `column19`, 
     `EMP_EMPLOYEE_DIM`.`employee_name_mb` AS `column20`, 
     `EMP_EMPLOYEE_DIM`.`manager_code` AS `column21`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` 
 GROUP BY 
     `EMP_EMPLOYEE_DIM`.`manager_code1`, 
     `EMP_EMPLOYEE_DIM`.`manager1`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb1`, 
     `EMP_EMPLOYEE_DIM`.`manager_code2`, 
     `EMP_EMPLOYEE_DIM`.`manager2`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb2`, 
     `EMP_EMPLOYEE_DIM`.`manager_code3`, 
     `EMP_EMPLOYEE_DIM`.`manager3`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb3`, 
     `EMP_EMPLOYEE_DIM`.`manager_code4`, 
     `EMP_EMPLOYEE_DIM`.`manager4`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb4`, 
     `EMP_EMPLOYEE_DIM`.`manager_code5`, 
     `EMP_EMPLOYEE_DIM`.`manager5`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb5`, 
     `EMP_EMPLOYEE_DIM`.`manager_code6`, 
     `EMP_EMPLOYEE_DIM`.`manager6`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb6`, 
     `EMP_EMPLOYEE_DIM`.`employee_key`, 
     `EMP_EMPLOYEE_DIM`.`employee_name`, 
     `EMP_EMPLOYEE_DIM`.`employee_name_mb`, 
     `EMP_EMPLOYEE_DIM`.`manager_code` 
 ORDER BY 
     `column1` ASC, 
     `column2` ASC, 
     `column0` ASC, 
     `column4` ASC, 
     `column5` ASC, 
     `column3` ASC, 
     `column7` ASC, 
     `column8` ASC, 
     `column6` ASC, 
     `column10` ASC, 
     `column11` ASC, 
     `column9` ASC, 
     `column13` ASC, 
     `column14` ASC, 
     `column12` ASC, 
     `column16` ASC, 
     `column17` ASC, 
     `column15` ASC, 
     `column19` ASC, 
     `column20` ASC, 
     `column18` ASC, 
     `column21` ASC
 
 

;



-- id: 9771
SELECT     `EMP_EMPLOYEE_DIM`.`manager_code1` AS `column0`, 
     `EMP_EMPLOYEE_DIM`.`manager_code2` AS `column1`, 
     `EMP_EMPLOYEE_DIM`.`manager_code3` AS `column2`, 
     `EMP_EMPLOYEE_DIM`.`manager_code4` AS `column3`, 
     `EMP_EMPLOYEE_DIM`.`manager_code5` AS `column4`, 
     `EMP_EMPLOYEE_DIM`.`manager_code6` AS `column5`, 
     `EMP_EMPLOYEE_DIM`.`employee_key` AS `column6`, 
     `EMP_EMPLOYEE_DIM`.`manager_code` AS `column7`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` 
 GROUP BY 
     `EMP_EMPLOYEE_DIM`.`manager_code1`, 
     `EMP_EMPLOYEE_DIM`.`manager_code2`, 
     `EMP_EMPLOYEE_DIM`.`manager_code3`, 
     `EMP_EMPLOYEE_DIM`.`manager_code4`, 
     `EMP_EMPLOYEE_DIM`.`manager_code5`, 
     `EMP_EMPLOYEE_DIM`.`manager_code6`, 
     `EMP_EMPLOYEE_DIM`.`employee_key`, 
     `EMP_EMPLOYEE_DIM`.`manager_code` 
 ORDER BY 
     `column0` ASC, 
     `column1` ASC, 
     `column2` ASC, 
     `column3` ASC, 
     `column4` ASC, 
     `column5` ASC, 
     `column6` ASC, 
     `column7` ASC
 
 

;



-- id: 9794
SELECT     `EMP_EMPLOYEE_DIM`.`manager_code1` AS `column0`, 
     `EMP_EMPLOYEE_DIM`.`manager_code2` AS `column1`, 
     `EMP_EMPLOYEE_DIM`.`manager_code3` AS `column2`, 
     `EMP_EMPLOYEE_DIM`.`manager_code4` AS `column3`, 
     `EMP_EMPLOYEE_DIM`.`manager_code5` AS `column4`, 
     `EMP_EMPLOYEE_DIM`.`manager_code6` AS `column5`, 
     `EMP_EMPLOYEE_DIM`.`employee_key` AS `column6`, 
     `T0`.`Current_manager` AS `column7`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN 
     (
     SELECT
         `EMP_EMPLOYEE_DIM`.`employee_name` AS `Current_manager`, 
         `EMP_EMPLOYEE_DIM`.`employee_code` AS `Manager_code`
     FROM
         `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM`
     ) `T0` ON `EMP_EMPLOYEE_DIM`.`manager_code` = `T0`.`Manager_code` 
 GROUP BY 
     `EMP_EMPLOYEE_DIM`.`manager_code1`, 
     `EMP_EMPLOYEE_DIM`.`manager_code2`, 
     `EMP_EMPLOYEE_DIM`.`manager_code3`, 
     `EMP_EMPLOYEE_DIM`.`manager_code4`, 
     `EMP_EMPLOYEE_DIM`.`manager_code5`, 
     `EMP_EMPLOYEE_DIM`.`manager_code6`, 
     `EMP_EMPLOYEE_DIM`.`employee_key`, 
     `T0`.`Current_manager` 
 ORDER BY 
     `column0` ASC, 
     `column1` ASC, 
     `column2` ASC, 
     `column3` ASC, 
     `column4` ASC, 
     `column5` ASC, 
     `column6` ASC, 
     `column7` ASC
 
 

;



-- id: 9817
SELECT     `EMP_EMPLOYEE_DIM`.`manager_code1` AS `column0`, 
     `EMP_EMPLOYEE_DIM`.`manager_code2` AS `column1`, 
     `EMP_EMPLOYEE_DIM`.`manager_code3` AS `column2`, 
     `EMP_EMPLOYEE_DIM`.`manager_code4` AS `column3`, 
     `EMP_EMPLOYEE_DIM`.`manager_code5` AS `column4`, 
     `EMP_EMPLOYEE_DIM`.`manager_code6` AS `column5`, 
     `EMP_EMPLOYEE_DIM`.`employee_key` AS `column6`, 
     `T0`.`Current_manager` AS `column7`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN 
     (
     SELECT
         `EMP_EMPLOYEE_DIM`.`employee_name` AS `Current_manager`, 
         `EMP_EMPLOYEE_DIM`.`employee_code` AS `Manager_code`
     FROM
         `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM`
     ) `T0` ON `EMP_EMPLOYEE_DIM`.`manager_code` = `T0`.`Manager_code` 
 GROUP BY 
     `EMP_EMPLOYEE_DIM`.`manager_code1`, 
     `EMP_EMPLOYEE_DIM`.`manager_code2`, 
     `EMP_EMPLOYEE_DIM`.`manager_code3`, 
     `EMP_EMPLOYEE_DIM`.`manager_code4`, 
     `EMP_EMPLOYEE_DIM`.`manager_code5`, 
     `EMP_EMPLOYEE_DIM`.`manager_code6`, 
     `EMP_EMPLOYEE_DIM`.`employee_key`, 
     `T0`.`Current_manager` 
 ORDER BY 
     `column0` ASC, 
     `column1` ASC, 
     `column2` ASC, 
     `column3` ASC, 
     `column4` ASC, 
     `column5` ASC, 
     `column6` ASC, 
     `column7` ASC
 
 

;



-- id: 9829
SELECT     `EMP_EMPLOYEE_DIM`.`manager_code1` AS `column0`, 
     `EMP_EMPLOYEE_DIM`.`manager1` AS `column1`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb1` AS `column2`, 
     `EMP_EMPLOYEE_DIM`.`manager_code2` AS `column3`, 
     `EMP_EMPLOYEE_DIM`.`manager2` AS `column4`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb2` AS `column5`, 
     `EMP_EMPLOYEE_DIM`.`manager_code3` AS `column6`, 
     `EMP_EMPLOYEE_DIM`.`manager3` AS `column7`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb3` AS `column8`, 
     `EMP_EMPLOYEE_DIM`.`manager_code4` AS `column9`, 
     `EMP_EMPLOYEE_DIM`.`manager4` AS `column10`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb4` AS `column11`, 
     `EMP_EMPLOYEE_DIM`.`manager_code5` AS `column12`, 
     `EMP_EMPLOYEE_DIM`.`manager5` AS `column13`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb5` AS `column14`, 
     `EMP_EMPLOYEE_DIM`.`manager_code6` AS `column15`, 
     `EMP_EMPLOYEE_DIM`.`manager6` AS `column16`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb6` AS `column17`, 
     `EMP_EMPLOYEE_DIM`.`employee_key` AS `column18`, 
     `EMP_EMPLOYEE_DIM`.`employee_name` AS `column19`, 
     `EMP_EMPLOYEE_DIM`.`employee_name_mb` AS `column20`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` 
 WHERE 
     `EMP_EMPLOYEE_DIM`.`employee_code` = 10323 
 GROUP BY 
     `EMP_EMPLOYEE_DIM`.`manager_code1`, 
     `EMP_EMPLOYEE_DIM`.`manager1`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb1`, 
     `EMP_EMPLOYEE_DIM`.`manager_code2`, 
     `EMP_EMPLOYEE_DIM`.`manager2`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb2`, 
     `EMP_EMPLOYEE_DIM`.`manager_code3`, 
     `EMP_EMPLOYEE_DIM`.`manager3`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb3`, 
     `EMP_EMPLOYEE_DIM`.`manager_code4`, 
     `EMP_EMPLOYEE_DIM`.`manager4`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb4`, 
     `EMP_EMPLOYEE_DIM`.`manager_code5`, 
     `EMP_EMPLOYEE_DIM`.`manager5`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb5`, 
     `EMP_EMPLOYEE_DIM`.`manager_code6`, 
     `EMP_EMPLOYEE_DIM`.`manager6`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb6`, 
     `EMP_EMPLOYEE_DIM`.`employee_key`, 
     `EMP_EMPLOYEE_DIM`.`employee_name`, 
     `EMP_EMPLOYEE_DIM`.`employee_name_mb` 
 ORDER BY 
     `column1` ASC, 
     `column2` ASC, 
     `column0` ASC, 
     `column4` ASC, 
     `column5` ASC, 
     `column3` ASC, 
     `column7` ASC, 
     `column8` ASC, 
     `column6` ASC, 
     `column10` ASC, 
     `column11` ASC, 
     `column9` ASC, 
     `column13` ASC, 
     `column14` ASC, 
     `column12` ASC, 
     `column16` ASC, 
     `column17` ASC, 
     `column15` ASC, 
     `column19` ASC, 
     `column20` ASC, 
     `column18` ASC
 
 

;



-- id: 9846
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 WHERE 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) <> '2013' 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 9879
SELECT     `EMP_EMPLOYEE_DIM`.`manager_code1` AS `column0`, 
     `EMP_EMPLOYEE_DIM`.`manager_code2` AS `column1`, 
     `EMP_EMPLOYEE_DIM`.`manager_code3` AS `column2`, 
     `EMP_EMPLOYEE_DIM`.`manager_code4` AS `column3`, 
     `EMP_EMPLOYEE_DIM`.`manager_code5` AS `column4`, 
     `EMP_EMPLOYEE_DIM`.`manager_code6` AS `column5`, 
     `EMP_EMPLOYEE_DIM`.`employee_key` AS `column6`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column7`, 
     SUM(`EMP_EXPENSE_FACT`.`expense_total`) AS `column8`
 FROM
     `gosalesdw1021`.`emp_expense_fact` `EMP_EXPENSE_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_EXPENSE_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` ON `EMP_EXPENSE_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` 
 WHERE 
     `EMP_EMPLOYEE_DIM`.`employee_code` = 10323 AND
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) <> '2013' 
 GROUP BY 
     `EMP_EMPLOYEE_DIM`.`manager_code1`, 
     `EMP_EMPLOYEE_DIM`.`manager_code2`, 
     `EMP_EMPLOYEE_DIM`.`manager_code3`, 
     `EMP_EMPLOYEE_DIM`.`manager_code4`, 
     `EMP_EMPLOYEE_DIM`.`manager_code5`, 
     `EMP_EMPLOYEE_DIM`.`manager_code6`, 
     `EMP_EMPLOYEE_DIM`.`employee_key`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4))
 
 

;



-- id: 9910
SELECT     `EMP_EMPLOYEE_DIM`.`manager_code1` AS `column0`, 
     `EMP_EMPLOYEE_DIM`.`manager_code2` AS `column1`, 
     `EMP_EMPLOYEE_DIM`.`manager_code3` AS `column2`, 
     `EMP_EMPLOYEE_DIM`.`manager_code4` AS `column3`, 
     `EMP_EMPLOYEE_DIM`.`manager_code5` AS `column4`, 
     `EMP_EMPLOYEE_DIM`.`manager_code6` AS `column5`, 
     `EMP_EMPLOYEE_DIM`.`employee_key` AS `column6`, 
     `T2`.`Position_name__level_4a_` AS `column7`
 FROM
     `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` JOIN `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` ON `EMP_POSITION_DIM`.`position_code` = `EMP_EMPLOYEE_DIM`.`position_code` JOIN 
         (
         SELECT
             `T11`.`position_en` AS `Position_name__level_4a_`, 
             `T11`.`position_code` AS `Position_code__level_4a_`
         FROM
             `gosalesdw1021`.`emp_position_lookup` `T11`
         ) `T2` ON `T2`.`Position_code__level_4a_` = `EMP_POSITION_DIM`.`position_code` 
 WHERE 
     `EMP_EMPLOYEE_DIM`.`employee_code` = 10323 
 GROUP BY 
     `EMP_EMPLOYEE_DIM`.`manager_code1`, 
     `EMP_EMPLOYEE_DIM`.`manager_code2`, 
     `EMP_EMPLOYEE_DIM`.`manager_code3`, 
     `EMP_EMPLOYEE_DIM`.`manager_code4`, 
     `EMP_EMPLOYEE_DIM`.`manager_code5`, 
     `EMP_EMPLOYEE_DIM`.`manager_code6`, 
     `EMP_EMPLOYEE_DIM`.`employee_key`, 
     `T2`.`Position_name__level_4a_`
 
 

;



-- id: 9920
SELECT     `T0`.`expense_group_code` AS `column0`, 
     `T0`.`expense_group_en` AS `column1`
 FROM
     `gosalesdw1021`.`emp_expense_type_dim` `T0` 
 GROUP BY 
     `T0`.`expense_group_code`, 
     `T0`.`expense_group_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 9966
SELECT     `T3`.`expense_group_code` AS `column0`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column1`, 
     SUM(`EMP_EXPENSE_FACT`.`expense_total`) AS `column2`
 FROM
     `gosalesdw1021`.`emp_expense_fact` `EMP_EXPENSE_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_EXPENSE_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` ON `EMP_EXPENSE_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`emp_expense_type_dim` `T3` ON `EMP_EXPENSE_FACT`.`expense_type_key` = `T3`.`expense_type_key` 
 WHERE 
     `EMP_EMPLOYEE_DIM`.`employee_code` = 10323 AND
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) <> '2013' 
 GROUP BY 
     `T3`.`expense_group_code`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4))
 
 

;



-- id: 9976
SELECT     `EMP_EMPLOYEE_DIM`.`manager_code1` AS `column0`, 
     `EMP_EMPLOYEE_DIM`.`manager1` AS `column1`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb1` AS `column2`, 
     `EMP_EMPLOYEE_DIM`.`manager_code2` AS `column3`, 
     `EMP_EMPLOYEE_DIM`.`manager2` AS `column4`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb2` AS `column5`, 
     `EMP_EMPLOYEE_DIM`.`manager_code3` AS `column6`, 
     `EMP_EMPLOYEE_DIM`.`manager3` AS `column7`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb3` AS `column8`, 
     `EMP_EMPLOYEE_DIM`.`manager_code4` AS `column9`, 
     `EMP_EMPLOYEE_DIM`.`manager4` AS `column10`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb4` AS `column11`, 
     `EMP_EMPLOYEE_DIM`.`manager_code5` AS `column12`, 
     `EMP_EMPLOYEE_DIM`.`manager5` AS `column13`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb5` AS `column14`, 
     `EMP_EMPLOYEE_DIM`.`manager_code6` AS `column15`, 
     `EMP_EMPLOYEE_DIM`.`manager6` AS `column16`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb6` AS `column17`, 
     `EMP_EMPLOYEE_DIM`.`employee_key` AS `column18`, 
     `EMP_EMPLOYEE_DIM`.`employee_name` AS `column19`, 
     `EMP_EMPLOYEE_DIM`.`employee_name_mb` AS `column20`, 
     `EMP_EMPLOYEE_DIM`.`employee_code` AS `column21`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` 
 GROUP BY 
     `EMP_EMPLOYEE_DIM`.`manager_code1`, 
     `EMP_EMPLOYEE_DIM`.`manager1`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb1`, 
     `EMP_EMPLOYEE_DIM`.`manager_code2`, 
     `EMP_EMPLOYEE_DIM`.`manager2`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb2`, 
     `EMP_EMPLOYEE_DIM`.`manager_code3`, 
     `EMP_EMPLOYEE_DIM`.`manager3`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb3`, 
     `EMP_EMPLOYEE_DIM`.`manager_code4`, 
     `EMP_EMPLOYEE_DIM`.`manager4`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb4`, 
     `EMP_EMPLOYEE_DIM`.`manager_code5`, 
     `EMP_EMPLOYEE_DIM`.`manager5`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb5`, 
     `EMP_EMPLOYEE_DIM`.`manager_code6`, 
     `EMP_EMPLOYEE_DIM`.`manager6`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb6`, 
     `EMP_EMPLOYEE_DIM`.`employee_key`, 
     `EMP_EMPLOYEE_DIM`.`employee_name`, 
     `EMP_EMPLOYEE_DIM`.`employee_name_mb`, 
     `EMP_EMPLOYEE_DIM`.`employee_code` 
 ORDER BY 
     `column1` ASC, 
     `column2` ASC, 
     `column0` ASC, 
     `column4` ASC, 
     `column5` ASC, 
     `column3` ASC, 
     `column7` ASC, 
     `column8` ASC, 
     `column6` ASC, 
     `column10` ASC, 
     `column11` ASC, 
     `column9` ASC, 
     `column13` ASC, 
     `column14` ASC, 
     `column12` ASC, 
     `column16` ASC, 
     `column17` ASC, 
     `column15` ASC, 
     `column19` ASC, 
     `column20` ASC, 
     `column18` ASC
 
 

;



-- id: 9986
SELECT     `T0`.`expense_group_code` AS `column0`, 
     `T0`.`expense_group_en` AS `column1`
 FROM
     `gosalesdw1021`.`emp_expense_type_dim` `T0` 
 GROUP BY 
     `T0`.`expense_group_code`, 
     `T0`.`expense_group_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 10003
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 WHERE 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) <> '2013' 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 10026
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `T2`.`Position_name__level_1_` AS `column1`
 FROM
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_1_`, 
         `T11`.`position_code` AS `Position_code__level_1_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T2` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T2`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `T2`.`Position_name__level_1_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 10062
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `T3`.`Position_name__level_2_` AS `column2`, 
     `T21`.`Position_name__level_1_` AS `C_sortColumn0`
 FROM
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_1_`, 
         `T11`.`position_code` AS `Position_code__level_1_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T21`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
         (
         SELECT
             `T11`.`position_en` AS `Position_name__level_2_`, 
             `T11`.`position_code` AS `Position_code__level_2_`
         FROM
             `gosalesdw1021`.`emp_position_lookup` `T11`
         ) `T3` ON `T3`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `T3`.`Position_name__level_2_`, 
     `T21`.`Position_name__level_1_` 
 ORDER BY 
     `C_sortColumn0` ASC, 
     `column0` ASC, 
     `column2` ASC, 
     `column1` ASC
 
 

;



-- id: 10112
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     `T21`.`Position_name__level_3_` AS `column3`, 
     `T31`.`Position_name__level_1_` AS `C_sortColumn0`, 
     `T4`.`Position_name__level_2_` AS `C_sortColumn1`
 FROM
     `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` JOIN 
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_3_`, 
         `T11`.`position_code` AS `Position_code__level_3_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` ON `EMP_POSITION_DIM`.`position_code3` = `T21`.`Position_code__level_3_` JOIN 
         (
         SELECT
             `T11`.`position_en` AS `Position_name__level_1_`, 
             `T11`.`position_code` AS `Position_code__level_1_`
         FROM
             `gosalesdw1021`.`emp_position_lookup` `T11`
         ) `T31` ON `T31`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
             (
             SELECT
                 `T11`.`position_en` AS `Position_name__level_2_`, 
                 `T11`.`position_code` AS `Position_code__level_2_`
             FROM
                 `gosalesdw1021`.`emp_position_lookup` `T11`
             ) `T4` ON `T4`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T21`.`Position_name__level_3_`, 
     `T31`.`Position_name__level_1_`, 
     `T4`.`Position_name__level_2_` 
 ORDER BY 
     `C_sortColumn0` ASC, 
     `column0` ASC, 
     `C_sortColumn1` ASC, 
     `column1` ASC, 
     `column3` ASC, 
     `column2` ASC
 
 

;



-- id: 10176
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     `EMP_POSITION_DIM`.`position_code` AS `column3`, 
     `T6`.`position_en` AS `column4`, 
     `EMP_POSITION_DIM`.`max_salary` AS `column5`, 
     `T31`.`Position_name__level_1_` AS `C_sortColumn0`, 
     `T41`.`Position_name__level_2_` AS `C_sortColumn1`, 
     `T21`.`Position_name__level_3_` AS `C_sortColumn2`
 FROM
     `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` JOIN 
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_3_`, 
         `T11`.`position_code` AS `Position_code__level_3_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` ON `EMP_POSITION_DIM`.`position_code3` = `T21`.`Position_code__level_3_` JOIN `gosalesdw1021`.`emp_position_lookup` `T6` ON `EMP_POSITION_DIM`.`position_code` = `T6`.`position_code` JOIN 
             (
             SELECT
                 `T11`.`position_en` AS `Position_name__level_1_`, 
                 `T11`.`position_code` AS `Position_code__level_1_`
             FROM
                 `gosalesdw1021`.`emp_position_lookup` `T11`
             ) `T31` ON `T31`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
                 (
                 SELECT
                     `T11`.`position_en` AS `Position_name__level_2_`, 
                     `T11`.`position_code` AS `Position_code__level_2_`
                 FROM
                     `gosalesdw1021`.`emp_position_lookup` `T11`
                 ) `T41` ON `T41`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `EMP_POSITION_DIM`.`position_code`, 
     `T6`.`position_en`, 
     `EMP_POSITION_DIM`.`max_salary`, 
     `T31`.`Position_name__level_1_`, 
     `T41`.`Position_name__level_2_`, 
     `T21`.`Position_name__level_3_` 
 ORDER BY 
     `C_sortColumn0` ASC, 
     `column0` ASC, 
     `C_sortColumn1` ASC, 
     `column1` ASC, 
     `C_sortColumn2` ASC, 
     `column2` ASC, 
     `column4` ASC, 
     `column3` ASC
 
 

;



-- id: 10236
SELECT     `EMP_EMPLOYEE_DIM`.`manager_code1` AS `column0`, 
     `EMP_EMPLOYEE_DIM`.`manager_code2` AS `column1`, 
     `EMP_EMPLOYEE_DIM`.`manager_code3` AS `column2`, 
     `EMP_EMPLOYEE_DIM`.`manager_code4` AS `column3`, 
     `EMP_EMPLOYEE_DIM`.`manager_code5` AS `column4`, 
     `EMP_EMPLOYEE_DIM`.`manager_code6` AS `column5`, 
     `EMP_EMPLOYEE_DIM`.`employee_key` AS `column6`, 
     `T3`.`expense_group_code` AS `column7`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column8`, 
     `EMP_POSITION_DIM`.`position_code1` AS `column9`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column10`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column11`, 
     `EMP_POSITION_DIM`.`position_code` AS `column12`, 
     SUM(`EMP_EXPENSE_FACT`.`expense_total`) AS `column13`
 FROM
     `gosalesdw1021`.`emp_expense_fact` `EMP_EXPENSE_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_EXPENSE_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` ON `EMP_EXPENSE_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`emp_expense_type_dim` `T3` ON `EMP_EXPENSE_FACT`.`expense_type_key` = `T3`.`expense_type_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `EMP_EXPENSE_FACT`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) <> '2013' 
 GROUP BY 
     `EMP_EMPLOYEE_DIM`.`manager_code1`, 
     `EMP_EMPLOYEE_DIM`.`manager_code2`, 
     `EMP_EMPLOYEE_DIM`.`manager_code3`, 
     `EMP_EMPLOYEE_DIM`.`manager_code4`, 
     `EMP_EMPLOYEE_DIM`.`manager_code5`, 
     `EMP_EMPLOYEE_DIM`.`manager_code6`, 
     `EMP_EMPLOYEE_DIM`.`employee_key`, 
     `T3`.`expense_group_code`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `EMP_POSITION_DIM`.`position_code`
 
 

;



-- id: 10276
SELECT     `T3`.`organization_code1` AS `column0`, 
     `T21`.`Organization_name__level_1_` AS `column1`
 FROM
     (
     SELECT
         `T01`.`Organization_name__level_5_` AS `Organization_name__level_1_`, 
         `T01`.`Organization_code__level_5_` AS `Organization_code__level_1_`
     FROM
         (
         SELECT
             `T11`.`organization_name_en` AS `Organization_name__level_5_`, 
             `T11`.`organization_code` AS `Organization_code__level_5_`
         FROM
             `gosalesdw1021`.`go_org_name_lookup` `T11`
         ) `T01` 
     WHERE 
         `T01`.`Organization_code__level_5_` IN ( 
             'GOAMX', 
             'GOCEU', 
             'GOEAX', 
             'GOEUX', 
             'GONEU', 
             'GOSEU' )
     ) `T21` JOIN 
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
     ) `T3` ON `T21`.`Organization_code__level_1_` = `T3`.`organization_code1` 
 WHERE 
     `T3`.`organization_code1` = 'GOAMX' 
 GROUP BY 
     `T3`.`organization_code1`, 
     `T21`.`Organization_name__level_1_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 10328
SELECT     `T31`.`organization_code1`, 
     `T31`.`Sum1`, 
     `T31`.`column2`, 
     `T31`.`Sum11`
 FROM
     (
     SELECT
         `T01`.`organization_code1` AS `organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `C`, 
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `C1`, 
         SUM(`T4`.`position_count`) AS `column2`, 
         SUM(`T4`.`external_hires`) AS `Sum1`, 
         SUM(`T4`.`terminations`) AS `Sum11`
     FROM
         `gosalesdw1021`.`emp_position_summary_fact` `T4` JOIN 
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
         ) `T01` ON `T4`.`organization_key` = `T01`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `GO_TIME_DIM`.`day_key` = `T4`.`day_key` 
     WHERE 
         `GO_TIME_DIM`.`month_number` >= 1 AND
         `GO_TIME_DIM`.`month_number` <= 12 AND
         `T01`.`organization_code1` = 'GOAMX' 
     GROUP BY 
         `T01`.`organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)), 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4))
     ) `T31`
 
 

;



-- id: 10345
SELECT     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     concat(`T1`.`quarter_en`, ' '), 
     `GO_TIME_DIM`.`current_year`, 
     `GO_TIME_DIM`.`month_key`, 
     concat(`GO_TIME_DIM`.`month_en`, ' ')
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T1` ON `GO_TIME_DIM`.`quarter_key` = `T1`.`quarter_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 1 AND
     `GO_TIME_DIM`.`month_number` <= 12 AND
     `GO_TIME_DIM`.`month_key` = 201001
 
 

;



-- id: 10397
SELECT     `T31`.`organization_code1`, 
     `T31`.`C`, 
     `T31`.`quarter_key`, 
     `T31`.`month_key`, 
     `T31`.`column4`, 
     `T31`.`Sum1`, 
     `T31`.`Sum11`
 FROM
     (
     SELECT
         `T01`.`organization_code1` AS `organization_code1`, 
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `C`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `C1`, 
         SUM(`T4`.`position_count`) AS `column4`, 
         SUM(`T4`.`external_hires`) AS `Sum1`, 
         SUM(`T4`.`terminations`) AS `Sum11`
     FROM
         `gosalesdw1021`.`emp_position_summary_fact` `T4` JOIN 
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
         ) `T01` ON `T4`.`organization_key` = `T01`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `GO_TIME_DIM`.`day_key` = `T4`.`day_key` 
     WHERE 
         `GO_TIME_DIM`.`month_number` >= 1 AND
         `GO_TIME_DIM`.`month_number` <= 12 AND
         `T01`.`organization_code1` = 'GOAMX' AND
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2010' AND
         `GO_TIME_DIM`.`quarter_key` = 20101 AND
         `GO_TIME_DIM`.`month_key` = 201001 
     GROUP BY 
         `T01`.`organization_code1`, 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8))
     ) `T31`
 
 

;



-- id: 10449
SELECT     `T31`.`organization_code1`, 
     `T31`.`column1`
 FROM
     (
     SELECT
         `T01`.`organization_code1` AS `organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `C`, 
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `C1`, 
         SUM(`T4`.`planned_position_count`) AS `column1`
     FROM
         `gosalesdw1021`.`emp_position_summary_fact` `T4` JOIN 
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
         ) `T01` ON `T4`.`organization_key` = `T01`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `GO_TIME_DIM`.`day_key` = `T4`.`day_key` 
     WHERE 
         `GO_TIME_DIM`.`month_number` >= 1 AND
         `GO_TIME_DIM`.`month_number` <= 12 AND
         `T01`.`organization_code1` = 'GOAMX' 
     GROUP BY 
         `T01`.`organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)), 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4))
     ) `T31`
 
 

;



-- id: 10489
SELECT     `T3`.`organization_code1` AS `column0`, 
     `T21`.`Organization_name__level_1_` AS `column1`
 FROM
     (
     SELECT
         `T01`.`Organization_name__level_5_` AS `Organization_name__level_1_`, 
         `T01`.`Organization_code__level_5_` AS `Organization_code__level_1_`
     FROM
         (
         SELECT
             `T11`.`organization_name_en` AS `Organization_name__level_5_`, 
             `T11`.`organization_code` AS `Organization_code__level_5_`
         FROM
             `gosalesdw1021`.`go_org_name_lookup` `T11`
         ) `T01` 
     WHERE 
         `T01`.`Organization_code__level_5_` IN ( 
             'GOAMX', 
             'GOCEU', 
             'GOEAX', 
             'GOEUX', 
             'GONEU', 
             'GOSEU' )
     ) `T21` JOIN 
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
     ) `T3` ON `T21`.`Organization_code__level_1_` = `T3`.`organization_code1` 
 WHERE 
     `T3`.`organization_code1` = 'GOEAX' 
 GROUP BY 
     `T3`.`organization_code1`, 
     `T21`.`Organization_name__level_1_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 10541
SELECT     `T31`.`organization_code1`, 
     `T31`.`Sum1`, 
     `T31`.`column2`, 
     `T31`.`Sum11`
 FROM
     (
     SELECT
         `T01`.`organization_code1` AS `organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `C`, 
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `C1`, 
         SUM(`T4`.`position_count`) AS `column2`, 
         SUM(`T4`.`external_hires`) AS `Sum1`, 
         SUM(`T4`.`terminations`) AS `Sum11`
     FROM
         `gosalesdw1021`.`emp_position_summary_fact` `T4` JOIN 
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
         ) `T01` ON `T4`.`organization_key` = `T01`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `GO_TIME_DIM`.`day_key` = `T4`.`day_key` 
     WHERE 
         `GO_TIME_DIM`.`month_number` >= 1 AND
         `GO_TIME_DIM`.`month_number` <= 12 AND
         `T01`.`organization_code1` = 'GOEAX' 
     GROUP BY 
         `T01`.`organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)), 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4))
     ) `T31`
 
 

;



-- id: 10593
SELECT     `T31`.`organization_code1`, 
     `T31`.`C`, 
     `T31`.`quarter_key`, 
     `T31`.`month_key`, 
     `T31`.`column4`, 
     `T31`.`Sum1`, 
     `T31`.`Sum11`
 FROM
     (
     SELECT
         `T01`.`organization_code1` AS `organization_code1`, 
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `C`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `C1`, 
         SUM(`T4`.`position_count`) AS `column4`, 
         SUM(`T4`.`external_hires`) AS `Sum1`, 
         SUM(`T4`.`terminations`) AS `Sum11`
     FROM
         `gosalesdw1021`.`emp_position_summary_fact` `T4` JOIN 
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
         ) `T01` ON `T4`.`organization_key` = `T01`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `GO_TIME_DIM`.`day_key` = `T4`.`day_key` 
     WHERE 
         `GO_TIME_DIM`.`month_number` >= 1 AND
         `GO_TIME_DIM`.`month_number` <= 12 AND
         `T01`.`organization_code1` = 'GOEAX' AND
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2010' AND
         `GO_TIME_DIM`.`quarter_key` = 20101 AND
         `GO_TIME_DIM`.`month_key` = 201001 
     GROUP BY 
         `T01`.`organization_code1`, 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8))
     ) `T31`
 
 

;



-- id: 10645
SELECT     `T31`.`organization_code1`, 
     `T31`.`column1`
 FROM
     (
     SELECT
         `T01`.`organization_code1` AS `organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `C`, 
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `C1`, 
         SUM(`T4`.`planned_position_count`) AS `column1`
     FROM
         `gosalesdw1021`.`emp_position_summary_fact` `T4` JOIN 
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
         ) `T01` ON `T4`.`organization_key` = `T01`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `GO_TIME_DIM`.`day_key` = `T4`.`day_key` 
     WHERE 
         `GO_TIME_DIM`.`month_number` >= 1 AND
         `GO_TIME_DIM`.`month_number` <= 12 AND
         `T01`.`organization_code1` = 'GOEAX' 
     GROUP BY 
         `T01`.`organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)), 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4))
     ) `T31`
 
 

;



-- id: 10685
SELECT     `T3`.`organization_code1` AS `column0`, 
     `T21`.`Organization_name__level_1_` AS `column1`
 FROM
     (
     SELECT
         `T01`.`Organization_name__level_5_` AS `Organization_name__level_1_`, 
         `T01`.`Organization_code__level_5_` AS `Organization_code__level_1_`
     FROM
         (
         SELECT
             `T11`.`organization_name_en` AS `Organization_name__level_5_`, 
             `T11`.`organization_code` AS `Organization_code__level_5_`
         FROM
             `gosalesdw1021`.`go_org_name_lookup` `T11`
         ) `T01` 
     WHERE 
         `T01`.`Organization_code__level_5_` IN ( 
             'GOAMX', 
             'GOCEU', 
             'GOEAX', 
             'GOEUX', 
             'GONEU', 
             'GOSEU' )
     ) `T21` JOIN 
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
     ) `T3` ON `T21`.`Organization_code__level_1_` = `T3`.`organization_code1` 
 WHERE 
     `T3`.`organization_code1` = 'GONEU' 
 GROUP BY 
     `T3`.`organization_code1`, 
     `T21`.`Organization_name__level_1_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 10737
SELECT     `T31`.`organization_code1`, 
     `T31`.`Sum1`, 
     `T31`.`column2`, 
     `T31`.`Sum11`
 FROM
     (
     SELECT
         `T01`.`organization_code1` AS `organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `C`, 
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `C1`, 
         SUM(`T4`.`position_count`) AS `column2`, 
         SUM(`T4`.`external_hires`) AS `Sum1`, 
         SUM(`T4`.`terminations`) AS `Sum11`
     FROM
         `gosalesdw1021`.`emp_position_summary_fact` `T4` JOIN 
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
         ) `T01` ON `T4`.`organization_key` = `T01`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `GO_TIME_DIM`.`day_key` = `T4`.`day_key` 
     WHERE 
         `GO_TIME_DIM`.`month_number` >= 1 AND
         `GO_TIME_DIM`.`month_number` <= 12 AND
         `T01`.`organization_code1` = 'GONEU' 
     GROUP BY 
         `T01`.`organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)), 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4))
     ) `T31`
 
 

;



-- id: 10789
SELECT     `T31`.`organization_code1`, 
     `T31`.`C`, 
     `T31`.`quarter_key`, 
     `T31`.`month_key`, 
     `T31`.`column4`, 
     `T31`.`Sum1`, 
     `T31`.`Sum11`
 FROM
     (
     SELECT
         `T01`.`organization_code1` AS `organization_code1`, 
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `C`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `C1`, 
         SUM(`T4`.`position_count`) AS `column4`, 
         SUM(`T4`.`external_hires`) AS `Sum1`, 
         SUM(`T4`.`terminations`) AS `Sum11`
     FROM
         `gosalesdw1021`.`emp_position_summary_fact` `T4` JOIN 
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
         ) `T01` ON `T4`.`organization_key` = `T01`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `GO_TIME_DIM`.`day_key` = `T4`.`day_key` 
     WHERE 
         `GO_TIME_DIM`.`month_number` >= 1 AND
         `GO_TIME_DIM`.`month_number` <= 12 AND
         `T01`.`organization_code1` = 'GONEU' AND
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2010' AND
         `GO_TIME_DIM`.`quarter_key` = 20101 AND
         `GO_TIME_DIM`.`month_key` = 201001 
     GROUP BY 
         `T01`.`organization_code1`, 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8))
     ) `T31`
 
 

;



-- id: 10841
SELECT     `T31`.`organization_code1`, 
     `T31`.`column1`
 FROM
     (
     SELECT
         `T01`.`organization_code1` AS `organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `C`, 
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `C1`, 
         SUM(`T4`.`planned_position_count`) AS `column1`
     FROM
         `gosalesdw1021`.`emp_position_summary_fact` `T4` JOIN 
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
         ) `T01` ON `T4`.`organization_key` = `T01`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `GO_TIME_DIM`.`day_key` = `T4`.`day_key` 
     WHERE 
         `GO_TIME_DIM`.`month_number` >= 1 AND
         `GO_TIME_DIM`.`month_number` <= 12 AND
         `T01`.`organization_code1` = 'GONEU' 
     GROUP BY 
         `T01`.`organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)), 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4))
     ) `T31`
 
 

;



-- id: 10881
SELECT     `T3`.`organization_code1` AS `column0`, 
     `T21`.`Organization_name__level_1_` AS `column1`
 FROM
     (
     SELECT
         `T01`.`Organization_name__level_5_` AS `Organization_name__level_1_`, 
         `T01`.`Organization_code__level_5_` AS `Organization_code__level_1_`
     FROM
         (
         SELECT
             `T11`.`organization_name_en` AS `Organization_name__level_5_`, 
             `T11`.`organization_code` AS `Organization_code__level_5_`
         FROM
             `gosalesdw1021`.`go_org_name_lookup` `T11`
         ) `T01` 
     WHERE 
         `T01`.`Organization_code__level_5_` IN ( 
             'GOAMX', 
             'GOCEU', 
             'GOEAX', 
             'GOEUX', 
             'GONEU', 
             'GOSEU' )
     ) `T21` JOIN 
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
     ) `T3` ON `T21`.`Organization_code__level_1_` = `T3`.`organization_code1` 
 WHERE 
     `T3`.`organization_code1` = 'GOSEU' 
 GROUP BY 
     `T3`.`organization_code1`, 
     `T21`.`Organization_name__level_1_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 10933
SELECT     `T31`.`organization_code1`, 
     `T31`.`Sum1`, 
     `T31`.`column2`, 
     `T31`.`Sum11`
 FROM
     (
     SELECT
         `T01`.`organization_code1` AS `organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `C`, 
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `C1`, 
         SUM(`T4`.`position_count`) AS `column2`, 
         SUM(`T4`.`external_hires`) AS `Sum1`, 
         SUM(`T4`.`terminations`) AS `Sum11`
     FROM
         `gosalesdw1021`.`emp_position_summary_fact` `T4` JOIN 
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
         ) `T01` ON `T4`.`organization_key` = `T01`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `GO_TIME_DIM`.`day_key` = `T4`.`day_key` 
     WHERE 
         `GO_TIME_DIM`.`month_number` >= 1 AND
         `GO_TIME_DIM`.`month_number` <= 12 AND
         `T01`.`organization_code1` = 'GOSEU' 
     GROUP BY 
         `T01`.`organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)), 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4))
     ) `T31`
 
 

;



-- id: 10985
SELECT     `T31`.`organization_code1`, 
     `T31`.`C`, 
     `T31`.`quarter_key`, 
     `T31`.`month_key`, 
     `T31`.`column4`, 
     `T31`.`Sum1`, 
     `T31`.`Sum11`
 FROM
     (
     SELECT
         `T01`.`organization_code1` AS `organization_code1`, 
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `C`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `C1`, 
         SUM(`T4`.`position_count`) AS `column4`, 
         SUM(`T4`.`external_hires`) AS `Sum1`, 
         SUM(`T4`.`terminations`) AS `Sum11`
     FROM
         `gosalesdw1021`.`emp_position_summary_fact` `T4` JOIN 
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
         ) `T01` ON `T4`.`organization_key` = `T01`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `GO_TIME_DIM`.`day_key` = `T4`.`day_key` 
     WHERE 
         `GO_TIME_DIM`.`month_number` >= 1 AND
         `GO_TIME_DIM`.`month_number` <= 12 AND
         `T01`.`organization_code1` = 'GOSEU' AND
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2010' AND
         `GO_TIME_DIM`.`quarter_key` = 20101 AND
         `GO_TIME_DIM`.`month_key` = 201001 
     GROUP BY 
         `T01`.`organization_code1`, 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8))
     ) `T31`
 
 

;



-- id: 11037
SELECT     `T31`.`organization_code1`, 
     `T31`.`column1`
 FROM
     (
     SELECT
         `T01`.`organization_code1` AS `organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `C`, 
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `C1`, 
         SUM(`T4`.`planned_position_count`) AS `column1`
     FROM
         `gosalesdw1021`.`emp_position_summary_fact` `T4` JOIN 
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
         ) `T01` ON `T4`.`organization_key` = `T01`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `GO_TIME_DIM`.`day_key` = `T4`.`day_key` 
     WHERE 
         `GO_TIME_DIM`.`month_number` >= 1 AND
         `GO_TIME_DIM`.`month_number` <= 12 AND
         `T01`.`organization_code1` = 'GOSEU' 
     GROUP BY 
         `T01`.`organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)), 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4))
     ) `T31`
 
 

;



-- id: 11077
SELECT     `T3`.`organization_code1` AS `column0`, 
     `T21`.`Organization_name__level_1_` AS `column1`
 FROM
     (
     SELECT
         `T01`.`Organization_name__level_5_` AS `Organization_name__level_1_`, 
         `T01`.`Organization_code__level_5_` AS `Organization_code__level_1_`
     FROM
         (
         SELECT
             `T11`.`organization_name_en` AS `Organization_name__level_5_`, 
             `T11`.`organization_code` AS `Organization_code__level_5_`
         FROM
             `gosalesdw1021`.`go_org_name_lookup` `T11`
         ) `T01` 
     WHERE 
         `T01`.`Organization_code__level_5_` IN ( 
             'GOAMX', 
             'GOCEU', 
             'GOEAX', 
             'GOEUX', 
             'GONEU', 
             'GOSEU' )
     ) `T21` JOIN 
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
     ) `T3` ON `T21`.`Organization_code__level_1_` = `T3`.`organization_code1` 
 WHERE 
     `T3`.`organization_code1` = 'GOCEU' 
 GROUP BY 
     `T3`.`organization_code1`, 
     `T21`.`Organization_name__level_1_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 11129
SELECT     `T31`.`organization_code1`, 
     `T31`.`Sum1`, 
     `T31`.`column2`, 
     `T31`.`Sum11`
 FROM
     (
     SELECT
         `T01`.`organization_code1` AS `organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `C`, 
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `C1`, 
         SUM(`T4`.`position_count`) AS `column2`, 
         SUM(`T4`.`external_hires`) AS `Sum1`, 
         SUM(`T4`.`terminations`) AS `Sum11`
     FROM
         `gosalesdw1021`.`emp_position_summary_fact` `T4` JOIN 
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
         ) `T01` ON `T4`.`organization_key` = `T01`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `GO_TIME_DIM`.`day_key` = `T4`.`day_key` 
     WHERE 
         `GO_TIME_DIM`.`month_number` >= 1 AND
         `GO_TIME_DIM`.`month_number` <= 12 AND
         `T01`.`organization_code1` = 'GOCEU' 
     GROUP BY 
         `T01`.`organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)), 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4))
     ) `T31`
 
 

;



-- id: 11181
SELECT     `T31`.`organization_code1`, 
     `T31`.`C`, 
     `T31`.`quarter_key`, 
     `T31`.`month_key`, 
     `T31`.`column4`, 
     `T31`.`Sum1`, 
     `T31`.`Sum11`
 FROM
     (
     SELECT
         `T01`.`organization_code1` AS `organization_code1`, 
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `C`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `C1`, 
         SUM(`T4`.`position_count`) AS `column4`, 
         SUM(`T4`.`external_hires`) AS `Sum1`, 
         SUM(`T4`.`terminations`) AS `Sum11`
     FROM
         `gosalesdw1021`.`emp_position_summary_fact` `T4` JOIN 
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
         ) `T01` ON `T4`.`organization_key` = `T01`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `GO_TIME_DIM`.`day_key` = `T4`.`day_key` 
     WHERE 
         `GO_TIME_DIM`.`month_number` >= 1 AND
         `GO_TIME_DIM`.`month_number` <= 12 AND
         `T01`.`organization_code1` = 'GOCEU' AND
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2010' AND
         `GO_TIME_DIM`.`quarter_key` = 20101 AND
         `GO_TIME_DIM`.`month_key` = 201001 
     GROUP BY 
         `T01`.`organization_code1`, 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8))
     ) `T31`
 
 

;



-- id: 11233
SELECT     `T31`.`organization_code1`, 
     `T31`.`column1`
 FROM
     (
     SELECT
         `T01`.`organization_code1` AS `organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `C`, 
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `C1`, 
         SUM(`T4`.`planned_position_count`) AS `column1`
     FROM
         `gosalesdw1021`.`emp_position_summary_fact` `T4` JOIN 
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
         ) `T01` ON `T4`.`organization_key` = `T01`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `GO_TIME_DIM`.`day_key` = `T4`.`day_key` 
     WHERE 
         `GO_TIME_DIM`.`month_number` >= 1 AND
         `GO_TIME_DIM`.`month_number` <= 12 AND
         `T01`.`organization_code1` = 'GOCEU' 
     GROUP BY 
         `T01`.`organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)), 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4))
     ) `T31`
 
 

;



-- id: 11254
SELECT     AVG(`T0`.`days_to_fill`) AS `column0`
 FROM
     `gosalesdw1021`.`emp_recruitment_fact` `T0` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T0`.`post_day_key` = `GO_TIME_DIM`.`day_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) IN ( 
         '2010' )
 
 

;



-- id: 11271
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 WHERE 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) IN ( 
         '2010' ) 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 11293
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     concat(`T2`.`quarter_en`, ' '), 
     `GO_TIME_DIM0`.`current_year`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T2` ON `GO_TIME_DIM0`.`quarter_key` = `T2`.`quarter_key` 
 WHERE 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) IN ( 
         '2010' )
 
 

;



-- id: 11299
SELECT     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`month_key`, 
     concat(`GO_TIME_DIM`.`month_en`, ' '), 
     `GO_TIME_DIM`.`current_year`, 
     CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8))
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) IN ( 
         '2010' )

;



-- id: 11320
SELECT     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column0`, 
     `GO_TIME_DIM`.`quarter_key` AS `column1`, 
     `GO_TIME_DIM`.`month_key` AS `column2`, 
     CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `column3`, 
     AVG(`T0`.`days_to_fill`) AS `column4`
 FROM
     `gosalesdw1021`.`emp_recruitment_fact` `T0` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T0`.`post_day_key` = `GO_TIME_DIM`.`day_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) IN ( 
         '2010' ) 
 GROUP BY 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`month_key`, 
     CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8))
 
 

;



-- id: 11344
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `T2`.`Position_name__level_1_` AS `column1`
 FROM
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_1_`, 
         `T11`.`position_code` AS `Position_code__level_1_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T2` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T2`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` 
 WHERE 
     `EMP_POSITION_DIM`.`position_code3` < 1000 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `T2`.`Position_name__level_1_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 11381
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `T3`.`Position_name__level_2_` AS `column2`, 
     `T21`.`Position_name__level_1_` AS `C_sortColumn0`
 FROM
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_1_`, 
         `T11`.`position_code` AS `Position_code__level_1_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T21`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
         (
         SELECT
             `T11`.`position_en` AS `Position_name__level_2_`, 
             `T11`.`position_code` AS `Position_code__level_2_`
         FROM
             `gosalesdw1021`.`emp_position_lookup` `T11`
         ) `T3` ON `T3`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 WHERE 
     `EMP_POSITION_DIM`.`position_code3` < 1000 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `T3`.`Position_name__level_2_`, 
     `T21`.`Position_name__level_1_` 
 ORDER BY 
     `C_sortColumn0` ASC, 
     `column0` ASC, 
     `column2` ASC, 
     `column1` ASC
 
 

;



-- id: 11432
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     `T21`.`Position_name__level_3_` AS `column3`, 
     `T31`.`Position_name__level_1_` AS `C_sortColumn0`, 
     `T4`.`Position_name__level_2_` AS `C_sortColumn1`
 FROM
     `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` JOIN 
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_3_`, 
         `T11`.`position_code` AS `Position_code__level_3_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` ON `EMP_POSITION_DIM`.`position_code3` = `T21`.`Position_code__level_3_` JOIN 
         (
         SELECT
             `T11`.`position_en` AS `Position_name__level_1_`, 
             `T11`.`position_code` AS `Position_code__level_1_`
         FROM
             `gosalesdw1021`.`emp_position_lookup` `T11`
         ) `T31` ON `T31`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
             (
             SELECT
                 `T11`.`position_en` AS `Position_name__level_2_`, 
                 `T11`.`position_code` AS `Position_code__level_2_`
             FROM
                 `gosalesdw1021`.`emp_position_lookup` `T11`
             ) `T4` ON `T4`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 WHERE 
     `EMP_POSITION_DIM`.`position_code3` < 1000 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T21`.`Position_name__level_3_`, 
     `T31`.`Position_name__level_1_`, 
     `T4`.`Position_name__level_2_` 
 ORDER BY 
     `C_sortColumn0` ASC, 
     `column0` ASC, 
     `C_sortColumn1` ASC, 
     `column1` ASC, 
     `column3` ASC, 
     `column2` ASC
 
 

;



-- id: 11497
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     `EMP_POSITION_DIM`.`position_code` AS `column3`, 
     `T6`.`position_en` AS `column4`, 
     `T31`.`Position_name__level_1_` AS `C_sortColumn0`, 
     `T41`.`Position_name__level_2_` AS `C_sortColumn1`, 
     `T21`.`Position_name__level_3_` AS `C_sortColumn2`
 FROM
     `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` JOIN 
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_3_`, 
         `T11`.`position_code` AS `Position_code__level_3_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` ON `EMP_POSITION_DIM`.`position_code3` = `T21`.`Position_code__level_3_` JOIN `gosalesdw1021`.`emp_position_lookup` `T6` ON `EMP_POSITION_DIM`.`position_code` = `T6`.`position_code` JOIN 
             (
             SELECT
                 `T11`.`position_en` AS `Position_name__level_1_`, 
                 `T11`.`position_code` AS `Position_code__level_1_`
             FROM
                 `gosalesdw1021`.`emp_position_lookup` `T11`
             ) `T31` ON `T31`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
                 (
                 SELECT
                     `T11`.`position_en` AS `Position_name__level_2_`, 
                     `T11`.`position_code` AS `Position_code__level_2_`
                 FROM
                     `gosalesdw1021`.`emp_position_lookup` `T11`
                 ) `T41` ON `T41`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 WHERE 
     `EMP_POSITION_DIM`.`position_code3` < 1000 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `EMP_POSITION_DIM`.`position_code`, 
     `T6`.`position_en`, 
     `T31`.`Position_name__level_1_`, 
     `T41`.`Position_name__level_2_`, 
     `T21`.`Position_name__level_3_` 
 ORDER BY 
     `C_sortColumn0` ASC, 
     `column0` ASC, 
     `C_sortColumn1` ASC, 
     `column1` ASC, 
     `C_sortColumn2` ASC, 
     `column2` ASC, 
     `column4` ASC, 
     `column3` ASC
 
 

;



-- id: 11530
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     `EMP_POSITION_DIM`.`position_code` AS `column3`, 
     AVG(`T0`.`days_to_fill`) AS `column4`
 FROM
     `gosalesdw1021`.`emp_recruitment_fact` `T0` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T0`.`post_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T0`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     `EMP_POSITION_DIM`.`position_code3` < 1000 AND
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2010' 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `EMP_POSITION_DIM`.`position_code`
 
 

;



-- id: 11554
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `T2`.`Position_name__level_1_` AS `column1`
 FROM
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_1_`, 
         `T11`.`position_code` AS `Position_code__level_1_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T2` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T2`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` 
 WHERE 
     `EMP_POSITION_DIM`.`position_code3` < 1000 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `T2`.`Position_name__level_1_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 11591
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `T3`.`Position_name__level_2_` AS `column2`, 
     `T21`.`Position_name__level_1_` AS `C_sortColumn0`
 FROM
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_1_`, 
         `T11`.`position_code` AS `Position_code__level_1_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T21`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
         (
         SELECT
             `T11`.`position_en` AS `Position_name__level_2_`, 
             `T11`.`position_code` AS `Position_code__level_2_`
         FROM
             `gosalesdw1021`.`emp_position_lookup` `T11`
         ) `T3` ON `T3`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 WHERE 
     `EMP_POSITION_DIM`.`position_code3` < 1000 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `T3`.`Position_name__level_2_`, 
     `T21`.`Position_name__level_1_` 
 ORDER BY 
     `C_sortColumn0` ASC, 
     `column0` ASC, 
     `column2` ASC, 
     `column1` ASC
 
 

;



-- id: 11642
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     `T21`.`Position_name__level_3_` AS `column3`, 
     `T31`.`Position_name__level_1_` AS `C_sortColumn0`, 
     `T4`.`Position_name__level_2_` AS `C_sortColumn1`
 FROM
     `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` JOIN 
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_3_`, 
         `T11`.`position_code` AS `Position_code__level_3_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` ON `EMP_POSITION_DIM`.`position_code3` = `T21`.`Position_code__level_3_` JOIN 
         (
         SELECT
             `T11`.`position_en` AS `Position_name__level_1_`, 
             `T11`.`position_code` AS `Position_code__level_1_`
         FROM
             `gosalesdw1021`.`emp_position_lookup` `T11`
         ) `T31` ON `T31`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
             (
             SELECT
                 `T11`.`position_en` AS `Position_name__level_2_`, 
                 `T11`.`position_code` AS `Position_code__level_2_`
             FROM
                 `gosalesdw1021`.`emp_position_lookup` `T11`
             ) `T4` ON `T4`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 WHERE 
     `EMP_POSITION_DIM`.`position_code3` < 1000 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T21`.`Position_name__level_3_`, 
     `T31`.`Position_name__level_1_`, 
     `T4`.`Position_name__level_2_` 
 ORDER BY 
     `C_sortColumn0` ASC, 
     `column0` ASC, 
     `C_sortColumn1` ASC, 
     `column1` ASC, 
     `column3` ASC, 
     `column2` ASC
 
 

;



-- id: 11675
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     AVG(`T0`.`days_to_fill`) AS `column3`
 FROM
     `gosalesdw1021`.`emp_recruitment_fact` `T0` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T0`.`post_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T0`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2010' AND
     `EMP_POSITION_DIM`.`position_code3` < 1000 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`
 
 

;



-- id: 11685
SELECT     `T0`.`campaign_code` AS `column0`, 
     `T0`.`campaign_name_en` AS `column1`
 FROM
     `gosalesdw1021`.`mrk_campaign_lookup` `T0` 
 GROUP BY 
     `T0`.`campaign_code`, 
     `T0`.`campaign_name_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 11697
SELECT     `T0`.`campaign_code` AS `column0`, 
     `T0`.`campaign_name_en` AS `column1`
 FROM
     `gosalesdw1021`.`mrk_campaign_lookup` `T0` 
 WHERE 
     NOT ( `T0`.`campaign_code` IN ( 
         59 ) ) AND
     NOT ( `T0`.`campaign_code` IN ( 
         50 ) ) AND
     `T0`.`campaign_code` = 51 
 GROUP BY 
     `T0`.`campaign_code`, 
     `T0`.`campaign_name_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 11720
SELECT     `T1`.`campaign_code` AS `column0`, 
     `T1`.`campaign_name_en` AS `column1`, 
     `MRK_PROMOTION_DIM`.`promotion_key` AS `column2`, 
     `MRK_PROMOTION_DIM`.`promotion_name_en` AS `column3`
 FROM
     `gosalesdw1021`.`mrk_promotion_dim` `MRK_PROMOTION_DIM` JOIN `gosalesdw1021`.`mrk_campaign_lookup` `T1` ON `MRK_PROMOTION_DIM`.`campaign_code` = `T1`.`campaign_code` 
 WHERE 
     NOT ( `T1`.`campaign_code` IN ( 
         59 ) ) AND
     NOT ( `T1`.`campaign_code` IN ( 
         50 ) ) AND
     `T1`.`campaign_code` = 51 
 GROUP BY 
     `T1`.`campaign_code`, 
     `T1`.`campaign_name_en`, 
     `MRK_PROMOTION_DIM`.`promotion_key`, 
     `MRK_PROMOTION_DIM`.`promotion_name_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC, 
     `column3` ASC, 
     `column2` ASC
 
 

;



-- id: 11753
SELECT     `T11`.`campaign_code` AS `column0`, 
     `MRK_PROMOTION_DIM`.`promotion_key` AS `column1`, 
     SUM(`T2`.`promotion_plan_revenue`) AS `column2`
 FROM
     `gosalesdw1021`.`mrk_promotion_dim` `MRK_PROMOTION_DIM` JOIN `gosalesdw1021`.`mrk_campaign_lookup` `T11` ON `MRK_PROMOTION_DIM`.`campaign_code` = `T11`.`campaign_code` JOIN `gosalesdw1021`.`mrk_promotion_plan_fact` `T2` ON `MRK_PROMOTION_DIM`.`promotion_key` = `T2`.`promotion_key` 
 WHERE 
     NOT ( `T11`.`campaign_code` IN ( 
         59 ) ) AND
     NOT ( `T11`.`campaign_code` IN ( 
         50 ) ) AND
     `T11`.`campaign_code` = 51 
 GROUP BY 
     `T11`.`campaign_code`, 
     `MRK_PROMOTION_DIM`.`promotion_key`
 
 

;



-- id: 11770
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 WHERE 
     NOT ( CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) IN ( 
         '2013' ) ) 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 11782
SELECT     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_TIME_DIM`.`month_number` < 37 
 GROUP BY 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 11799
SELECT     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     concat(`T1`.`quarter_en`, ' '), 
     `GO_TIME_DIM`.`current_year`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T1` ON `GO_TIME_DIM`.`quarter_key` = `T1`.`quarter_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_TIME_DIM`.`month_number` < 37
 
 

;



-- id: 11809
SELECT     `T0`.`campaign_code` AS `column0`, 
     `T0`.`campaign_name_en` AS `column1`
 FROM
     `gosalesdw1021`.`mrk_campaign_lookup` `T0` 
 GROUP BY 
     `T0`.`campaign_code`, 
     `T0`.`campaign_name_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 11855
SELECT     `T3`.`campaign_code` AS `column0`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column1`, 
     `GO_TIME_DIM`.`quarter_key` AS `column2`, 
     SUM(`T01`.`gross_profit`) AS `column3`
 FROM
     `gosalesdw1021`.`mrk_promotion_fact` `T01` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T01`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`mrk_promotion_dim` `MRK_PROMOTION_DIM` ON `MRK_PROMOTION_DIM`.`promotion_key` = `T01`.`promotion_key` JOIN `gosalesdw1021`.`mrk_campaign_lookup` `T3` ON `MRK_PROMOTION_DIM`.`campaign_code` = `T3`.`campaign_code` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_TIME_DIM`.`month_number` < 37 
 GROUP BY 
     `T3`.`campaign_code`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`
 
 

;



-- id: 11872
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 WHERE 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) = '2012' 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 11894
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     concat(`T2`.`quarter_en`, ' '), 
     `GO_TIME_DIM0`.`current_year`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T2` ON `GO_TIME_DIM0`.`quarter_key` = `T2`.`quarter_key` 
 WHERE 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) = '2012'
 
 

;



-- id: 11939
SELECT     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T41`.`product_line_en`, 
     `SLS_PRODUCT_DIM`.`product_type_key`, 
     `T5`.`product_type_en`, 
     `SLS_PRODUCT_DIM`.`base_product_key`, 
     `T01`.`product_name`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T41` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T41`.`product_line_code` JOIN 
         (
         SELECT
             `T11`.`product_number` AS `product_number`, 
             `T11`.`product_name` AS `product_name`
         FROM
             `gosalesdw1021`.`sls_product_lookup` `T11` 
         WHERE 
             `T11`.`product_language` = 'EN'
         ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T5` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T5`.`product_type_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC, 
     `SLS_PRODUCT_DIM`.`product_type_key` ASC, 
     `SLS_PRODUCT_DIM`.`base_product_key` ASC
 
 

;



-- id: 12062
SELECT     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column0`, 
     `GO_TIME_DIM`.`quarter_key` AS `column1`, 
     `Product`.`Product_line_code` AS `column2`, 
     `Product`.`Product_type_key` AS `column3`, 
     `Product`.`Base_product_key` AS `column4`, 
     SUM(`T10`.`sale_total`) AS `column5`
 FROM
     `gosalesdw1021`.`mrk_promotion_fact` `T10` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T10`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
         (
         SELECT
             `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
             `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
             `SLS_PRODUCT_DIM`.`base_product_key` AS `Base_product_key`, 
             `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
         FROM
             `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                         (
                         SELECT
                             `T11`.`product_number` AS `product_number`
                         FROM
                             `gosalesdw1021`.`sls_product_lookup` `T11` 
                         WHERE 
                             `T11`.`product_language` = 'EN'
                         ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
         ) `Product` ON `T10`.`product_key` = `Product`.`Product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' 
 GROUP BY 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`, 
     `Product`.`Base_product_key`
 
 

;



-- id: 12185
SELECT     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column0`, 
     `GO_TIME_DIM`.`quarter_key` AS `column1`, 
     `Product`.`Product_line_code` AS `column2`, 
     `Product`.`Product_type_key` AS `column3`, 
     `Product`.`Base_product_key` AS `column4`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column5`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
         (
         SELECT
             `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
             `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
             `SLS_PRODUCT_DIM`.`base_product_key` AS `Base_product_key`, 
             `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
         FROM
             `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                         (
                         SELECT
                             `T11`.`product_number` AS `product_number`
                         FROM
                             `gosalesdw1021`.`sls_product_lookup` `T11` 
                         WHERE 
                             `T11`.`product_language` = 'EN'
                         ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
         ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' 
 GROUP BY 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`, 
     `Product`.`Base_product_key`
 
 

;



-- id: 12230
SELECT     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T41`.`product_line_en`, 
     `SLS_PRODUCT_DIM`.`product_type_key`, 
     `T5`.`product_type_en`, 
     `SLS_PRODUCT_DIM`.`base_product_key`, 
     `T01`.`product_name`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T41` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T41`.`product_line_code` JOIN 
         (
         SELECT
             `T11`.`product_number` AS `product_number`, 
             `T11`.`product_name` AS `product_name`
         FROM
             `gosalesdw1021`.`sls_product_lookup` `T11` 
         WHERE 
             `T11`.`product_language` = 'EN'
         ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T5` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T5`.`product_type_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC, 
     `SLS_PRODUCT_DIM`.`product_type_key` ASC, 
     `SLS_PRODUCT_DIM`.`base_product_key` ASC
 
 

;



-- id: 12252
SELECT     `T1`.`campaign_code` AS `column0`, 
     `T1`.`campaign_name_en` AS `column1`, 
     `MRK_PROMOTION_DIM`.`promotion_key` AS `column2`, 
     `MRK_PROMOTION_DIM`.`promotion_name_en` AS `column3`
 FROM
     `gosalesdw1021`.`mrk_promotion_dim` `MRK_PROMOTION_DIM` JOIN `gosalesdw1021`.`mrk_campaign_lookup` `T1` ON `MRK_PROMOTION_DIM`.`campaign_code` = `T1`.`campaign_code` 
 GROUP BY 
     `T1`.`campaign_code`, 
     `T1`.`campaign_name_en`, 
     `MRK_PROMOTION_DIM`.`promotion_key`, 
     `MRK_PROMOTION_DIM`.`promotion_name_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC, 
     `column3` ASC, 
     `column2` ASC
 
 

;



-- id: 12410
SELECT     `T13`.`campaign_code` AS `column0`, 
     `MRK_PROMOTION_DIM`.`promotion_key` AS `column1`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column2`, 
     `GO_TIME_DIM`.`quarter_key` AS `column3`, 
     `Product`.`Product_line_code` AS `column4`, 
     `Product`.`Product_type_key` AS `column5`, 
     `Product`.`Base_product_key` AS `column6`, 
     SUM(`T101`.`gross_profit`) AS `column7`, 
     SUM(`T101`.`sale_total`) AS `column8`
 FROM
     `gosalesdw1021`.`mrk_promotion_fact` `T101` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T101`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`mrk_promotion_dim` `MRK_PROMOTION_DIM` ON `MRK_PROMOTION_DIM`.`promotion_key` = `T101`.`promotion_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
                 `SLS_PRODUCT_DIM`.`base_product_key` AS `Base_product_key`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T11`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T11` 
                             WHERE 
                                 `T11`.`product_language` = 'EN'
                             ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
             ) `Product` ON `T101`.`product_key` = `Product`.`Product_key` JOIN `gosalesdw1021`.`mrk_campaign_lookup` `T13` ON `MRK_PROMOTION_DIM`.`campaign_code` = `T13`.`campaign_code` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_TIME_DIM`.`month_number` < 37 AND
     `T13`.`campaign_code` IN ( 
         54, 
         56, 
         60, 
         55, 
         50, 
         58, 
         57, 
         53, 
         52, 
         51, 
         61 ) 
 GROUP BY 
     `T13`.`campaign_code`, 
     `MRK_PROMOTION_DIM`.`promotion_key`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`, 
     `Product`.`Base_product_key` 
 ORDER BY 
     `column0` ASC, 
     `column1` ASC, 
     `column4` ASC, 
     `column5` ASC, 
     `column6` ASC
 
 

;



-- id: 12584
SELECT     `T14`.`campaign_code` AS `column0`, 
     `MRK_PROMOTION_DIM`.`promotion_key` AS `column1`, 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column2`, 
     `GO_TIME_DIM0`.`quarter_key` AS `column3`, 
     `Product`.`Product_line_code` AS `column4`, 
     `Product`.`Product_type_key` AS `column5`, 
     `Product`.`Base_product_key` AS `column6`, 
     SUM(`T121`.`promotion_plan_revenue`) AS `column7`
 FROM
     `gosalesdw1021`.`mrk_promotion_plan_fact` `T121` JOIN 
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     WHERE 
         `GO_TIME_DIM`.`month_number` < 37 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` ON `T121`.`month_key` = `GO_TIME_DIM0`.`month_key` JOIN `gosalesdw1021`.`mrk_promotion_dim` `MRK_PROMOTION_DIM` ON `MRK_PROMOTION_DIM`.`promotion_key` = `T121`.`promotion_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
                 `SLS_PRODUCT_DIM`.`base_product_key` AS `Base_product_key`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T51` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T51`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T71`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T81`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T31`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T31` 
                             WHERE 
                                 `T31`.`product_language` = 'EN'
                             ) `T21` ON `SLS_PRODUCT_DIM`.`product_number` = `T21`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T91` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T91`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T101` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T101`.`product_type_code`
             ) `Product` ON `T121`.`product_key` = `Product`.`Product_key` JOIN `gosalesdw1021`.`mrk_campaign_lookup` `T14` ON `MRK_PROMOTION_DIM`.`campaign_code` = `T14`.`campaign_code` 
 WHERE 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) = '2012' AND
     `T14`.`campaign_code` IN ( 
         54, 
         56, 
         60, 
         55, 
         50, 
         58, 
         57, 
         53, 
         52, 
         51, 
         61 ) 
 GROUP BY 
     `T14`.`campaign_code`, 
     `MRK_PROMOTION_DIM`.`promotion_key`, 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`, 
     `Product`.`Base_product_key` 
 ORDER BY 
     `column0` ASC, 
     `column1` ASC, 
     `column4` ASC, 
     `column5` ASC, 
     `column6` ASC
 
 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column2`, 
     `GO_TIME_DIM`.`quarter_key` AS `column3`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_TIME_DIM`.`month_number` < 37 
 GROUP BY 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column2`, 
     `GO_TIME_DIM`.`quarter_key` AS `column3`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_TIME_DIM`.`month_number` < 37 
 GROUP BY 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`
 
 

;



-- id: 12707
SELECT     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column0`, 
     `GO_TIME_DIM`.`quarter_key` AS `column1`, 
     `Product`.`Product_line_code` AS `column2`, 
     `Product`.`Product_type_key` AS `column3`, 
     `Product`.`Base_product_key` AS `column4`, 
     SUM(`T10`.`gross_profit`) AS `column9`, 
     SUM(`T10`.`sale_total`) AS `column10`
 FROM
     `gosalesdw1021`.`mrk_promotion_fact` `T10` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T10`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
         (
         SELECT
             `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
             `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
             `SLS_PRODUCT_DIM`.`base_product_key` AS `Base_product_key`, 
             `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
         FROM
             `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                         (
                         SELECT
                             `T11`.`product_number` AS `product_number`
                         FROM
                             `gosalesdw1021`.`sls_product_lookup` `T11` 
                         WHERE 
                             `T11`.`product_language` = 'EN'
                         ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
         ) `Product` ON `T10`.`product_key` = `Product`.`Product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_TIME_DIM`.`month_number` < 37 AND
     `GO_TIME_DIM`.`quarter_key` IN ( 
         20123, 
         20124, 
         20122, 
         20121 ) 
 GROUP BY 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`, 
     `Product`.`Base_product_key`
 
 

;



-- id: 12846
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`, 
     `GO_TIME_DIM0`.`quarter_key` AS `column1`, 
     `Product`.`Product_line_code` AS `column2`, 
     `Product`.`Product_type_key` AS `column3`, 
     `Product`.`Base_product_key` AS `column4`, 
     SUM(`T12`.`promotion_plan_revenue`) AS `column7`
 FROM
     `gosalesdw1021`.`mrk_promotion_plan_fact` `T12` JOIN 
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     WHERE 
         `GO_TIME_DIM`.`month_number` < 37 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` ON `T12`.`month_key` = `GO_TIME_DIM0`.`month_key` JOIN 
         (
         SELECT
             `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
             `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
             `SLS_PRODUCT_DIM`.`base_product_key` AS `Base_product_key`, 
             `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
         FROM
             `gosalesdw1021`.`sls_product_brand_lookup` `T51` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T51`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T71`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T81`.`product_line_code` JOIN 
                         (
                         SELECT
                             `T31`.`product_number` AS `product_number`
                         FROM
                             `gosalesdw1021`.`sls_product_lookup` `T31` 
                         WHERE 
                             `T31`.`product_language` = 'EN'
                         ) `T21` ON `SLS_PRODUCT_DIM`.`product_number` = `T21`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T91` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T91`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T101` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T101`.`product_type_code`
         ) `Product` ON `T12`.`product_key` = `Product`.`Product_key` 
 WHERE 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_TIME_DIM0`.`quarter_key` IN ( 
         20123, 
         20124, 
         20122, 
         20121 ) 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`, 
     `Product`.`Base_product_key`
 
 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column0`, 
     `GO_TIME_DIM`.`quarter_key` AS `column1`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_TIME_DIM`.`month_number` < 37 AND
     `GO_TIME_DIM`.`quarter_key` IN ( 
         20123, 
         20124, 
         20122, 
         20121 ) 
 GROUP BY 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column0`, 
     `GO_TIME_DIM`.`quarter_key` AS `column1`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_TIME_DIM`.`month_number` < 37 AND
     `GO_TIME_DIM`.`quarter_key` IN ( 
         20123, 
         20124, 
         20122, 
         20121 ) 
 GROUP BY 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`
 
 

;



-- id: 12867
SELECT     SUM(`T0`.`gross_profit`) AS `column0`, 
     SUM(`T0`.`sale_total`) AS `column1`
 FROM
     `gosalesdw1021`.`mrk_promotion_fact` `T0` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T0`.`order_day_key` = `GO_TIME_DIM`.`day_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_TIME_DIM`.`month_number` < 37
 
 

;



-- id: 12893
SELECT     SUM(`T2`.`promotion_plan_revenue`) AS `column0`
 FROM
     `gosalesdw1021`.`mrk_promotion_plan_fact` `T2` JOIN 
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     WHERE 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
         `GO_TIME_DIM`.`month_number` < 37 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`
     ) `GO_TIME_DIM0` ON `T2`.`month_key` = `GO_TIME_DIM0`.`month_key`
 
 

;



-- id: 12910
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 WHERE 
     NOT ( CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) IN ( 
         '2013' ) ) 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 12932
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     concat(`T2`.`quarter_en`, ' '), 
     `GO_TIME_DIM0`.`current_year`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T2` ON `GO_TIME_DIM0`.`quarter_key` = `T2`.`quarter_key` 
 WHERE 
     NOT ( CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) IN ( 
         '2013' ) )
 
 

;



-- id: 12961
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`, 
     `GO_TIME_DIM0`.`quarter_key` AS `column1`, 
     SUM(`T2`.`quantity_shipped`) AS `column2`
 FROM
     `gosalesdw1021`.`dist_inventory_fact` `T2` JOIN 
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` ON `T2`.`month_key` = `GO_TIME_DIM0`.`month_key` 
 WHERE 
     NOT ( CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) IN ( 
         '2013' ) ) 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`
 
 

;



-- id: 12982
SELECT     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column0`, 
     `GO_TIME_DIM`.`quarter_key` AS `column1`, 
     SUM(`SLS_SALES_FACT`.`quantity`) AS `column2`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` 
 WHERE 
     NOT ( CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) IN ( 
         '2013' ) ) 
 GROUP BY 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`
 
 

;



-- id: 12988
SELECT     `GO_TIME_DIM`.`month_key`, 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`current_year`, 
     `GO_TIME_DIM`.`month_en`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 ORDER BY 
     `GO_TIME_DIM`.`month_key` ASC, 
     `GO_TIME_DIM`.`quarter_key` ASC, 
     `GO_TIME_DIM`.`current_year` ASC
 
 

;



-- id: 12994
SELECT     `GO_TIME_DIM`.`month_key`, 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`current_year`, 
     `GO_TIME_DIM`.`month_en`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 ORDER BY 
     `GO_TIME_DIM`.`month_key` ASC, 
     `GO_TIME_DIM`.`quarter_key` ASC, 
     `GO_TIME_DIM`.`current_year` ASC
 
 

;



-- id: 13000
SELECT     `GO_TIME_DIM`.`month_key`, 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`current_year`, 
     `GO_TIME_DIM`.`month_en`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 ORDER BY 
     `GO_TIME_DIM`.`month_key` ASC, 
     `GO_TIME_DIM`.`quarter_key` ASC, 
     `GO_TIME_DIM`.`current_year` ASC
 
 

;



-- id: 13006
SELECT     `GO_TIME_DIM`.`month_key`, 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`current_year`, 
     `GO_TIME_DIM`.`month_en`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 ORDER BY 
     `GO_TIME_DIM`.`month_key` ASC, 
     `GO_TIME_DIM`.`quarter_key` ASC, 
     `GO_TIME_DIM`.`current_year` ASC
 
 

;



-- id: 13012
SELECT     `GO_TIME_DIM`.`month_key`, 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`current_year`, 
     `GO_TIME_DIM`.`month_en`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 ORDER BY 
     `GO_TIME_DIM`.`month_key` ASC, 
     `GO_TIME_DIM`.`quarter_key` ASC, 
     `GO_TIME_DIM`.`current_year` ASC
 
 

;



-- id: 13018
SELECT     `GO_TIME_DIM`.`month_key`, 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`current_year`, 
     `GO_TIME_DIM`.`month_en`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 ORDER BY 
     `GO_TIME_DIM`.`month_key` ASC, 
     `GO_TIME_DIM`.`quarter_key` ASC, 
     `GO_TIME_DIM`.`current_year` ASC
 
 

;



-- id: 13024
SELECT     `GO_TIME_DIM`.`month_key`, 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`current_year`, 
     `GO_TIME_DIM`.`month_en`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 ORDER BY 
     `GO_TIME_DIM`.`month_key` ASC, 
     `GO_TIME_DIM`.`quarter_key` ASC, 
     `GO_TIME_DIM`.`current_year` ASC
 
 

;



-- id: 13030
SELECT     `GO_TIME_DIM`.`month_key`, 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`current_year`, 
     `GO_TIME_DIM`.`month_en`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 ORDER BY 
     `GO_TIME_DIM`.`month_key` ASC, 
     `GO_TIME_DIM`.`quarter_key` ASC, 
     `GO_TIME_DIM`.`current_year` ASC
 
 

;



-- id: 13036
SELECT     `GO_TIME_DIM`.`month_key`, 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`current_year`, 
     `GO_TIME_DIM`.`month_en`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 ORDER BY 
     `GO_TIME_DIM`.`month_key` ASC, 
     `GO_TIME_DIM`.`quarter_key` ASC, 
     `GO_TIME_DIM`.`current_year` ASC
 
 

;



-- id: 13042
SELECT     `GO_TIME_DIM`.`month_key`, 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`current_year`, 
     `GO_TIME_DIM`.`month_en`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 ORDER BY 
     `GO_TIME_DIM`.`month_key` ASC, 
     `GO_TIME_DIM`.`quarter_key` ASC, 
     `GO_TIME_DIM`.`current_year` ASC
 
 

;



-- id: 13048
SELECT     `GO_TIME_DIM`.`month_key`, 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`current_year`, 
     `GO_TIME_DIM`.`month_en`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 ORDER BY 
     `GO_TIME_DIM`.`month_key` ASC, 
     `GO_TIME_DIM`.`quarter_key` ASC, 
     `GO_TIME_DIM`.`current_year` ASC
 
 

;



-- id: 13054
SELECT     `GO_TIME_DIM`.`month_key`, 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`current_year`, 
     `GO_TIME_DIM`.`month_en`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 ORDER BY 
     `GO_TIME_DIM`.`month_key` ASC, 
     `GO_TIME_DIM`.`quarter_key` ASC, 
     `GO_TIME_DIM`.`current_year` ASC
 
 

;



-- id: 13060
SELECT     `GO_TIME_DIM`.`month_key`, 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`current_year`, 
     `GO_TIME_DIM`.`month_en`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 ORDER BY 
     `GO_TIME_DIM`.`month_key` ASC, 
     `GO_TIME_DIM`.`quarter_key` ASC, 
     `GO_TIME_DIM`.`current_year` ASC
 
 

;



-- id: 13066
SELECT     `GO_TIME_DIM`.`month_key`, 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`current_year`, 
     `GO_TIME_DIM`.`month_en`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 ORDER BY 
     `GO_TIME_DIM`.`month_key` ASC, 
     `GO_TIME_DIM`.`quarter_key` ASC, 
     `GO_TIME_DIM`.`current_year` ASC
 
 

;



-- id: 13072
SELECT     `GO_TIME_DIM`.`month_key`, 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`current_year`, 
     `GO_TIME_DIM`.`month_en`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 ORDER BY 
     `GO_TIME_DIM`.`month_key` ASC, 
     `GO_TIME_DIM`.`quarter_key` ASC, 
     `GO_TIME_DIM`.`current_year` ASC
 
 

;



-- id: 13102
SELECT     `T21`.`C`, 
     `T21`.`quarter_key`, 
     `T21`.`column2`
 FROM
     (
     SELECT
         `GO_TIME_DIM0`.`quarter_key` AS `quarter_key`, 
         CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `C`, 
         `GO_TIME_DIM0`.`month_key` AS `month_key`, 
         SUM(`T3`.`opening_inventory`) AS `column2`
     FROM
         `gosalesdw1021`.`dist_inventory_fact` `T3` JOIN 
         (
         SELECT
             `GO_TIME_DIM`.`month_key` AS `month_key`, 
             `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
             `GO_TIME_DIM`.`current_year` AS `current_year`
         FROM
             `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
         GROUP BY 
             `GO_TIME_DIM`.`month_key`, 
             `GO_TIME_DIM`.`quarter_key`, 
             `GO_TIME_DIM`.`current_year`
         ) `GO_TIME_DIM0` ON `T3`.`month_key` = `GO_TIME_DIM0`.`month_key` 
     WHERE 
         NOT ( CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) IN ( 
             '2013' ) ) AND
         (`GO_TIME_DIM0`.`month_key` = 201000 OR
         `GO_TIME_DIM0`.`month_key` = 201001 OR
         `GO_TIME_DIM0`.`month_key` = 201004 OR
         `GO_TIME_DIM0`.`month_key` = 201007 OR
         `GO_TIME_DIM0`.`month_key` = 201010 OR
         `GO_TIME_DIM0`.`month_key` = 201100 OR
         `GO_TIME_DIM0`.`month_key` = 201101 OR
         `GO_TIME_DIM0`.`month_key` = 201104 OR
         `GO_TIME_DIM0`.`month_key` = 201107 OR
         `GO_TIME_DIM0`.`month_key` = 201110 OR
         `GO_TIME_DIM0`.`month_key` = 201200 OR
         `GO_TIME_DIM0`.`month_key` = 201201 OR
         `GO_TIME_DIM0`.`month_key` = 201204 OR
         `GO_TIME_DIM0`.`month_key` = 201207 OR
         `GO_TIME_DIM0`.`month_key` = 201210) 
     GROUP BY 
         `GO_TIME_DIM0`.`quarter_key`, 
         CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
         `GO_TIME_DIM0`.`month_key`
     ) `T21`
 
 

;



-- id: 13132
SELECT     `T21`.`C`, 
     `T21`.`quarter_key`, 
     `T21`.`column2`
 FROM
     (
     SELECT
         `GO_TIME_DIM0`.`quarter_key` AS `quarter_key`, 
         CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `C`, 
         `GO_TIME_DIM0`.`month_key` AS `month_key`, 
         SUM(`T3`.`closing_inventory`) AS `column2`
     FROM
         `gosalesdw1021`.`dist_inventory_fact` `T3` JOIN 
         (
         SELECT
             `GO_TIME_DIM`.`month_key` AS `month_key`, 
             `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
             `GO_TIME_DIM`.`current_year` AS `current_year`
         FROM
             `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
         GROUP BY 
             `GO_TIME_DIM`.`month_key`, 
             `GO_TIME_DIM`.`quarter_key`, 
             `GO_TIME_DIM`.`current_year`
         ) `GO_TIME_DIM0` ON `T3`.`month_key` = `GO_TIME_DIM0`.`month_key` 
     WHERE 
         NOT ( CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) IN ( 
             '2013' ) ) AND
         (`GO_TIME_DIM0`.`month_key` = 201000 OR
         `GO_TIME_DIM0`.`month_key` = 201003 OR
         `GO_TIME_DIM0`.`month_key` = 201006 OR
         `GO_TIME_DIM0`.`month_key` = 201009 OR
         `GO_TIME_DIM0`.`month_key` = 201012 OR
         `GO_TIME_DIM0`.`month_key` = 201100 OR
         `GO_TIME_DIM0`.`month_key` = 201103 OR
         `GO_TIME_DIM0`.`month_key` = 201106 OR
         `GO_TIME_DIM0`.`month_key` = 201109 OR
         `GO_TIME_DIM0`.`month_key` = 201112 OR
         `GO_TIME_DIM0`.`month_key` = 201200 OR
         `GO_TIME_DIM0`.`month_key` = 201203 OR
         `GO_TIME_DIM0`.`month_key` = 201206 OR
         `GO_TIME_DIM0`.`month_key` = 201209 OR
         `GO_TIME_DIM0`.`month_key` = 201212) 
     GROUP BY 
         `GO_TIME_DIM0`.`quarter_key`, 
         CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
         `GO_TIME_DIM0`.`month_key`
     ) `T21`
 
 

;



-- id: 13147
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 13198
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `T31`.`Position_name__level_1_` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column2`, 
     `T4`.`Position_name__level_2_` AS `column3`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column4`, 
     `T21`.`Position_name__level_3_` AS `column5`
 FROM
     `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` JOIN 
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_3_`, 
         `T11`.`position_code` AS `Position_code__level_3_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` ON `EMP_POSITION_DIM`.`position_code3` = `T21`.`Position_code__level_3_` JOIN 
         (
         SELECT
             `T11`.`position_en` AS `Position_name__level_1_`, 
             `T11`.`position_code` AS `Position_code__level_1_`
         FROM
             `gosalesdw1021`.`emp_position_lookup` `T11`
         ) `T31` ON `T31`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
             (
             SELECT
                 `T11`.`position_en` AS `Position_name__level_2_`, 
                 `T11`.`position_code` AS `Position_code__level_2_`
             FROM
                 `gosalesdw1021`.`emp_position_lookup` `T11`
             ) `T4` ON `T4`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 WHERE 
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     `EMP_POSITION_DIM`.`position_code3` = 340 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `T31`.`Position_name__level_1_`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `T4`.`Position_name__level_2_`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T21`.`Position_name__level_3_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC, 
     `column3` ASC, 
     `column2` ASC, 
     `column5` ASC, 
     `column4` ASC
 
 

;



-- id: 13210
SELECT     `T0`.`recruitment_type_code` AS `column0`, 
     `T0`.`recruitment_type_en` AS `column1`
 FROM
     `gosalesdw1021`.`emp_recruitment_dim` `T0` 
 WHERE 
     `T0`.`recruitment_type_code` <> 19 
 GROUP BY 
     `T0`.`recruitment_type_code`, 
     `T0`.`recruitment_type_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 13256
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     `T2`.`recruitment_type_code` AS `column3`, 
     AVG(`T01`.`days_to_fill`) AS `column4`
 FROM
     `gosalesdw1021`.`emp_recruitment_fact` `T01` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T01`.`post_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_recruitment_dim` `T2` ON `T2`.`recruitment_medium_key` = `T01`.`recruitment_medium_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T01`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `T2`.`recruitment_type_code` <> 19 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code3` = 340 AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T2`.`recruitment_type_code`
 
 

;



-- id: 13307
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `T31`.`Position_name__level_1_` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column2`, 
     `T4`.`Position_name__level_2_` AS `column3`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column4`, 
     `T21`.`Position_name__level_3_` AS `column5`
 FROM
     `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` JOIN 
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_3_`, 
         `T11`.`position_code` AS `Position_code__level_3_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` ON `EMP_POSITION_DIM`.`position_code3` = `T21`.`Position_code__level_3_` JOIN 
         (
         SELECT
             `T11`.`position_en` AS `Position_name__level_1_`, 
             `T11`.`position_code` AS `Position_code__level_1_`
         FROM
             `gosalesdw1021`.`emp_position_lookup` `T11`
         ) `T31` ON `T31`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
             (
             SELECT
                 `T11`.`position_en` AS `Position_name__level_2_`, 
                 `T11`.`position_code` AS `Position_code__level_2_`
             FROM
                 `gosalesdw1021`.`emp_position_lookup` `T11`
             ) `T4` ON `T4`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 WHERE 
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     `EMP_POSITION_DIM`.`position_code3` = 320 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `T31`.`Position_name__level_1_`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `T4`.`Position_name__level_2_`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T21`.`Position_name__level_3_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC, 
     `column3` ASC, 
     `column2` ASC, 
     `column5` ASC, 
     `column4` ASC
 
 

;



-- id: 13353
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     `T2`.`recruitment_type_code` AS `column3`, 
     AVG(`T01`.`days_to_fill`) AS `column4`
 FROM
     `gosalesdw1021`.`emp_recruitment_fact` `T01` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T01`.`post_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_recruitment_dim` `T2` ON `T2`.`recruitment_medium_key` = `T01`.`recruitment_medium_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T01`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `T2`.`recruitment_type_code` <> 19 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code3` = 320 AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T2`.`recruitment_type_code`
 
 

;



-- id: 13404
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `T31`.`Position_name__level_1_` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column2`, 
     `T4`.`Position_name__level_2_` AS `column3`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column4`, 
     `T21`.`Position_name__level_3_` AS `column5`
 FROM
     `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` JOIN 
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_3_`, 
         `T11`.`position_code` AS `Position_code__level_3_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` ON `EMP_POSITION_DIM`.`position_code3` = `T21`.`Position_code__level_3_` JOIN 
         (
         SELECT
             `T11`.`position_en` AS `Position_name__level_1_`, 
             `T11`.`position_code` AS `Position_code__level_1_`
         FROM
             `gosalesdw1021`.`emp_position_lookup` `T11`
         ) `T31` ON `T31`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
             (
             SELECT
                 `T11`.`position_en` AS `Position_name__level_2_`, 
                 `T11`.`position_code` AS `Position_code__level_2_`
             FROM
                 `gosalesdw1021`.`emp_position_lookup` `T11`
             ) `T4` ON `T4`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 WHERE 
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     `EMP_POSITION_DIM`.`position_code3` = 380 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `T31`.`Position_name__level_1_`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `T4`.`Position_name__level_2_`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T21`.`Position_name__level_3_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC, 
     `column3` ASC, 
     `column2` ASC, 
     `column5` ASC, 
     `column4` ASC
 
 

;



-- id: 13450
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     `T2`.`recruitment_type_code` AS `column3`, 
     AVG(`T01`.`days_to_fill`) AS `column4`
 FROM
     `gosalesdw1021`.`emp_recruitment_fact` `T01` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T01`.`post_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_recruitment_dim` `T2` ON `T2`.`recruitment_medium_key` = `T01`.`recruitment_medium_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T01`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `T2`.`recruitment_type_code` <> 19 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code3` = 380 AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T2`.`recruitment_type_code`
 
 

;



-- id: 13501
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `T31`.`Position_name__level_1_` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column2`, 
     `T4`.`Position_name__level_2_` AS `column3`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column4`, 
     `T21`.`Position_name__level_3_` AS `column5`
 FROM
     `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` JOIN 
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_3_`, 
         `T11`.`position_code` AS `Position_code__level_3_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` ON `EMP_POSITION_DIM`.`position_code3` = `T21`.`Position_code__level_3_` JOIN 
         (
         SELECT
             `T11`.`position_en` AS `Position_name__level_1_`, 
             `T11`.`position_code` AS `Position_code__level_1_`
         FROM
             `gosalesdw1021`.`emp_position_lookup` `T11`
         ) `T31` ON `T31`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
             (
             SELECT
                 `T11`.`position_en` AS `Position_name__level_2_`, 
                 `T11`.`position_code` AS `Position_code__level_2_`
             FROM
                 `gosalesdw1021`.`emp_position_lookup` `T11`
             ) `T4` ON `T4`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 WHERE 
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     `EMP_POSITION_DIM`.`position_code3` = 300 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `T31`.`Position_name__level_1_`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `T4`.`Position_name__level_2_`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T21`.`Position_name__level_3_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC, 
     `column3` ASC, 
     `column2` ASC, 
     `column5` ASC, 
     `column4` ASC
 
 

;



-- id: 13547
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     `T2`.`recruitment_type_code` AS `column3`, 
     AVG(`T01`.`days_to_fill`) AS `column4`
 FROM
     `gosalesdw1021`.`emp_recruitment_fact` `T01` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T01`.`post_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_recruitment_dim` `T2` ON `T2`.`recruitment_medium_key` = `T01`.`recruitment_medium_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T01`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `T2`.`recruitment_type_code` <> 19 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code3` = 300 AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T2`.`recruitment_type_code`
 
 

;



-- id: 13598
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `T31`.`Position_name__level_1_` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column2`, 
     `T4`.`Position_name__level_2_` AS `column3`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column4`, 
     `T21`.`Position_name__level_3_` AS `column5`
 FROM
     `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` JOIN 
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_3_`, 
         `T11`.`position_code` AS `Position_code__level_3_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` ON `EMP_POSITION_DIM`.`position_code3` = `T21`.`Position_code__level_3_` JOIN 
         (
         SELECT
             `T11`.`position_en` AS `Position_name__level_1_`, 
             `T11`.`position_code` AS `Position_code__level_1_`
         FROM
             `gosalesdw1021`.`emp_position_lookup` `T11`
         ) `T31` ON `T31`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
             (
             SELECT
                 `T11`.`position_en` AS `Position_name__level_2_`, 
                 `T11`.`position_code` AS `Position_code__level_2_`
             FROM
                 `gosalesdw1021`.`emp_position_lookup` `T11`
             ) `T4` ON `T4`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 WHERE 
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     `EMP_POSITION_DIM`.`position_code3` = 370 AND
     `EMP_POSITION_DIM`.`position_code2` = 220 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `T31`.`Position_name__level_1_`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `T4`.`Position_name__level_2_`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T21`.`Position_name__level_3_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC, 
     `column3` ASC, 
     `column2` ASC, 
     `column5` ASC, 
     `column4` ASC
 
 

;



-- id: 13644
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     `T2`.`recruitment_type_code` AS `column3`, 
     AVG(`T01`.`days_to_fill`) AS `column4`
 FROM
     `gosalesdw1021`.`emp_recruitment_fact` `T01` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T01`.`post_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_recruitment_dim` `T2` ON `T2`.`recruitment_medium_key` = `T01`.`recruitment_medium_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T01`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `T2`.`recruitment_type_code` <> 19 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     `EMP_POSITION_DIM`.`position_code2` = 220 AND
     `EMP_POSITION_DIM`.`position_code3` = 370 AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T2`.`recruitment_type_code`
 
 

;



-- id: 13695
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `T31`.`Position_name__level_1_` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column2`, 
     `T4`.`Position_name__level_2_` AS `column3`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column4`, 
     `T21`.`Position_name__level_3_` AS `column5`
 FROM
     `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` JOIN 
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_3_`, 
         `T11`.`position_code` AS `Position_code__level_3_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` ON `EMP_POSITION_DIM`.`position_code3` = `T21`.`Position_code__level_3_` JOIN 
         (
         SELECT
             `T11`.`position_en` AS `Position_name__level_1_`, 
             `T11`.`position_code` AS `Position_code__level_1_`
         FROM
             `gosalesdw1021`.`emp_position_lookup` `T11`
         ) `T31` ON `T31`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
             (
             SELECT
                 `T11`.`position_en` AS `Position_name__level_2_`, 
                 `T11`.`position_code` AS `Position_code__level_2_`
             FROM
                 `gosalesdw1021`.`emp_position_lookup` `T11`
             ) `T4` ON `T4`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 WHERE 
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     `EMP_POSITION_DIM`.`position_code3` = 350 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `T31`.`Position_name__level_1_`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `T4`.`Position_name__level_2_`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T21`.`Position_name__level_3_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC, 
     `column3` ASC, 
     `column2` ASC, 
     `column5` ASC, 
     `column4` ASC
 
 

;



-- id: 13741
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     `T2`.`recruitment_type_code` AS `column3`, 
     AVG(`T01`.`days_to_fill`) AS `column4`
 FROM
     `gosalesdw1021`.`emp_recruitment_fact` `T01` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T01`.`post_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_recruitment_dim` `T2` ON `T2`.`recruitment_medium_key` = `T01`.`recruitment_medium_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T01`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `T2`.`recruitment_type_code` <> 19 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code3` = 350 AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T2`.`recruitment_type_code`
 
 

;



-- id: 13792
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `T31`.`Position_name__level_1_` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column2`, 
     `T4`.`Position_name__level_2_` AS `column3`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column4`, 
     `T21`.`Position_name__level_3_` AS `column5`
 FROM
     `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` JOIN 
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_3_`, 
         `T11`.`position_code` AS `Position_code__level_3_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` ON `EMP_POSITION_DIM`.`position_code3` = `T21`.`Position_code__level_3_` JOIN 
         (
         SELECT
             `T11`.`position_en` AS `Position_name__level_1_`, 
             `T11`.`position_code` AS `Position_code__level_1_`
         FROM
             `gosalesdw1021`.`emp_position_lookup` `T11`
         ) `T31` ON `T31`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
             (
             SELECT
                 `T11`.`position_en` AS `Position_name__level_2_`, 
                 `T11`.`position_code` AS `Position_code__level_2_`
             FROM
                 `gosalesdw1021`.`emp_position_lookup` `T11`
             ) `T4` ON `T4`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 WHERE 
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     `EMP_POSITION_DIM`.`position_code3` = 330 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `T31`.`Position_name__level_1_`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `T4`.`Position_name__level_2_`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T21`.`Position_name__level_3_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC, 
     `column3` ASC, 
     `column2` ASC, 
     `column5` ASC, 
     `column4` ASC
 
 

;



-- id: 13838
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     `T2`.`recruitment_type_code` AS `column3`, 
     AVG(`T01`.`days_to_fill`) AS `column4`
 FROM
     `gosalesdw1021`.`emp_recruitment_fact` `T01` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T01`.`post_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_recruitment_dim` `T2` ON `T2`.`recruitment_medium_key` = `T01`.`recruitment_medium_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T01`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `T2`.`recruitment_type_code` <> 19 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code3` = 330 AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T2`.`recruitment_type_code`
 
 

;



-- id: 13889
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `T31`.`Position_name__level_1_` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column2`, 
     `T4`.`Position_name__level_2_` AS `column3`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column4`, 
     `T21`.`Position_name__level_3_` AS `column5`
 FROM
     `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` JOIN 
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_3_`, 
         `T11`.`position_code` AS `Position_code__level_3_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` ON `EMP_POSITION_DIM`.`position_code3` = `T21`.`Position_code__level_3_` JOIN 
         (
         SELECT
             `T11`.`position_en` AS `Position_name__level_1_`, 
             `T11`.`position_code` AS `Position_code__level_1_`
         FROM
             `gosalesdw1021`.`emp_position_lookup` `T11`
         ) `T31` ON `T31`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
             (
             SELECT
                 `T11`.`position_en` AS `Position_name__level_2_`, 
                 `T11`.`position_code` AS `Position_code__level_2_`
             FROM
                 `gosalesdw1021`.`emp_position_lookup` `T11`
             ) `T4` ON `T4`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 WHERE 
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     `EMP_POSITION_DIM`.`position_code3` = 360 AND
     `EMP_POSITION_DIM`.`position_code2` = 220 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `T31`.`Position_name__level_1_`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `T4`.`Position_name__level_2_`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T21`.`Position_name__level_3_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC, 
     `column3` ASC, 
     `column2` ASC, 
     `column5` ASC, 
     `column4` ASC
 
 

;



-- id: 13935
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     `T2`.`recruitment_type_code` AS `column3`, 
     AVG(`T01`.`days_to_fill`) AS `column4`
 FROM
     `gosalesdw1021`.`emp_recruitment_fact` `T01` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T01`.`post_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_recruitment_dim` `T2` ON `T2`.`recruitment_medium_key` = `T01`.`recruitment_medium_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T01`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `T2`.`recruitment_type_code` <> 19 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     `EMP_POSITION_DIM`.`position_code2` = 220 AND
     `EMP_POSITION_DIM`.`position_code3` = 360 AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T2`.`recruitment_type_code`
 
 

;



-- id: 13981
SELECT     `T2`.`recruitment_type_code` AS `column0`, 
     AVG(`T01`.`days_to_fill`) AS `column1`
 FROM
     `gosalesdw1021`.`emp_recruitment_fact` `T01` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T01`.`post_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_recruitment_dim` `T2` ON `T2`.`recruitment_medium_key` = `T01`.`recruitment_medium_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T01`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `T2`.`recruitment_type_code` <> 19 AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) 
 GROUP BY 
     `T2`.`recruitment_type_code`
 
 

;



-- id: 14032
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `T31`.`Position_name__level_1_` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column2`, 
     `T4`.`Position_name__level_2_` AS `column3`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column4`, 
     `T21`.`Position_name__level_3_` AS `column5`
 FROM
     `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` JOIN 
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_3_`, 
         `T11`.`position_code` AS `Position_code__level_3_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` ON `EMP_POSITION_DIM`.`position_code3` = `T21`.`Position_code__level_3_` JOIN 
         (
         SELECT
             `T11`.`position_en` AS `Position_name__level_1_`, 
             `T11`.`position_code` AS `Position_code__level_1_`
         FROM
             `gosalesdw1021`.`emp_position_lookup` `T11`
         ) `T31` ON `T31`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
             (
             SELECT
                 `T11`.`position_en` AS `Position_name__level_2_`, 
                 `T11`.`position_code` AS `Position_code__level_2_`
             FROM
                 `gosalesdw1021`.`emp_position_lookup` `T11`
             ) `T4` ON `T4`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 WHERE 
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     `EMP_POSITION_DIM`.`position_code3` = 390 AND
     `EMP_POSITION_DIM`.`position_code2` = 220 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `T31`.`Position_name__level_1_`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `T4`.`Position_name__level_2_`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T21`.`Position_name__level_3_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC, 
     `column3` ASC, 
     `column2` ASC, 
     `column5` ASC, 
     `column4` ASC
 
 

;



-- id: 14078
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     `T2`.`recruitment_type_code` AS `column3`, 
     AVG(`T01`.`days_to_fill`) AS `column4`
 FROM
     `gosalesdw1021`.`emp_recruitment_fact` `T01` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T01`.`post_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_recruitment_dim` `T2` ON `T2`.`recruitment_medium_key` = `T01`.`recruitment_medium_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T01`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `T2`.`recruitment_type_code` <> 19 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     `EMP_POSITION_DIM`.`position_code2` = 220 AND
     `EMP_POSITION_DIM`.`position_code3` = 390 AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T2`.`recruitment_type_code`
 
 

;



-- id: 14118
SELECT     `T3`.`organization_code1` AS `column0`, 
     `T21`.`Organization_name__level_1_` AS `column1`
 FROM
     (
     SELECT
         `T01`.`Organization_name__level_5_` AS `Organization_name__level_1_`, 
         `T01`.`Organization_code__level_5_` AS `Organization_code__level_1_`
     FROM
         (
         SELECT
             `T11`.`organization_name_en` AS `Organization_name__level_5_`, 
             `T11`.`organization_code` AS `Organization_code__level_5_`
         FROM
             `gosalesdw1021`.`go_org_name_lookup` `T11`
         ) `T01` 
     WHERE 
         `T01`.`Organization_code__level_5_` IN ( 
             'GOAMX', 
             'GOCEU', 
             'GOEAX', 
             'GOEUX', 
             'GONEU', 
             'GOSEU' )
     ) `T21` JOIN 
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
     ) `T3` ON `T21`.`Organization_code__level_1_` = `T3`.`organization_code1` 
 WHERE 
     `T3`.`organization_code1` = 'GOAMX' OR
     `T3`.`organization_code1` = 'GOEAX' OR
     `T3`.`organization_code1` = 'GOCEU' OR
     `T3`.`organization_code1` = 'GONEU' OR
     `T3`.`organization_code1` = 'GOSEU' 
 GROUP BY 
     `T3`.`organization_code1`, 
     `T21`.`Organization_name__level_1_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 14142
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `T2`.`Position_name__level_1_` AS `column1`
 FROM
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_1_`, 
         `T11`.`position_code` AS `Position_code__level_1_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T2` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T2`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` 
 WHERE 
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `T2`.`Position_name__level_1_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 14179
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `T3`.`Position_name__level_2_` AS `column2`, 
     `T21`.`Position_name__level_1_` AS `C_sortColumn0`
 FROM
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_1_`, 
         `T11`.`position_code` AS `Position_code__level_1_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T21`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
         (
         SELECT
             `T11`.`position_en` AS `Position_name__level_2_`, 
             `T11`.`position_code` AS `Position_code__level_2_`
         FROM
             `gosalesdw1021`.`emp_position_lookup` `T11`
         ) `T3` ON `T3`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 WHERE 
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `T3`.`Position_name__level_2_`, 
     `T21`.`Position_name__level_1_` 
 ORDER BY 
     `C_sortColumn0` ASC, 
     `column0` ASC, 
     `column2` ASC, 
     `column1` ASC
 
 

;



-- id: 14230
SELECT     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column2`, 
     `T21`.`Position_name__level_3_` AS `column3`, 
     `T31`.`Position_name__level_1_` AS `C_sortColumn0`, 
     `T4`.`Position_name__level_2_` AS `C_sortColumn1`
 FROM
     `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` JOIN 
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_3_`, 
         `T11`.`position_code` AS `Position_code__level_3_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` ON `EMP_POSITION_DIM`.`position_code3` = `T21`.`Position_code__level_3_` JOIN 
         (
         SELECT
             `T11`.`position_en` AS `Position_name__level_1_`, 
             `T11`.`position_code` AS `Position_code__level_1_`
         FROM
             `gosalesdw1021`.`emp_position_lookup` `T11`
         ) `T31` ON `T31`.`Position_code__level_1_` = `EMP_POSITION_DIM`.`position_code1` JOIN 
             (
             SELECT
                 `T11`.`position_en` AS `Position_name__level_2_`, 
                 `T11`.`position_code` AS `Position_code__level_2_`
             FROM
                 `gosalesdw1021`.`emp_position_lookup` `T11`
             ) `T4` ON `T4`.`Position_code__level_2_` = `EMP_POSITION_DIM`.`position_code2` 
 WHERE 
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) 
 GROUP BY 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`, 
     `T21`.`Position_name__level_3_`, 
     `T31`.`Position_name__level_1_`, 
     `T4`.`Position_name__level_2_` 
 ORDER BY 
     `C_sortColumn0` ASC, 
     `column0` ASC, 
     `C_sortColumn1` ASC, 
     `column1` ASC, 
     `column3` ASC, 
     `column2` ASC
 
 

;



-- id: 14296
SELECT     `D1`.`C0`, 
     `D1`.`C1`, 
     `D1`.`C2`, 
     `D1`.`C3`, 
     `D1`.`C4`, 
     `D1`.`C5`, 
     `D1`.`C6`, 
     `D1`.`C7`, 
     SUM(`D1`.`C8`), 
     SUM(`D1`.`C9`)
 FROM
     (
     SELECT
         `T01`.`organization_code1` AS `C0`, 
         `EMP_POSITION_DIM`.`position_code3` AS `C1`, 
         `EMP_POSITION_DIM`.`position_code2` AS `C2`, 
         `EMP_POSITION_DIM`.`position_code1` AS `C3`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `C4`, 
         `GO_TIME_DIM`.`month_key` AS `C5`, 
         `GO_TIME_DIM`.`quarter_key` AS `C6`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `C7`, 
         `T4`.`position_count` AS `C8`, 
         `T4`.`planned_position_count` AS `C9`
     FROM
         `gosalesdw1021`.`emp_position_summary_fact` `T4` JOIN 
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
         ) `T01` ON `T4`.`organization_key` = `T01`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `GO_TIME_DIM`.`day_key` = `T4`.`day_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T4`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
     WHERE 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
         `T01`.`organization_code1` IN ( 
             'GOCEU', 
             'GOEAX', 
             'GOSEU', 
             'GOAMX', 
             'GONEU' ) AND
         (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
         `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
         `EMP_POSITION_DIM`.`position_code1` <> 100) AND
         (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
         `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
         `EMP_POSITION_DIM`.`position_code1` <> 100)
     ) `D1` 
 GROUP BY 
     `D1`.`C0`, 
     `D1`.`C1`, 
     `D1`.`C2`, 
     `D1`.`C3`, 
     `D1`.`C4`, 
     `D1`.`C5`, 
     `D1`.`C6`, 
     `D1`.`C7`
 
 

;



-- id: 14372
SELECT     `T01`.`organization_code1` AS `column0`, 
     `EMP_POSITION_DIM`.`position_code1` AS `column1`, 
     `EMP_POSITION_DIM`.`position_code2` AS `column2`, 
     `EMP_POSITION_DIM`.`position_code3` AS `column3`, 
     AVG(`T41`.`days_to_fill`) AS `column4`, 
     SUM(`T41`.`days_to_fill`) AS `Sum1`, 
     COUNT(`T41`.`days_to_fill`) AS `Count1`
 FROM
     `gosalesdw1021`.`emp_recruitment_fact` `T41` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T41`.`post_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
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
         ) `T01` ON `T01`.`organization_key` = `T41`.`organization_key` JOIN `gosalesdw1021`.`emp_recruitment_dim` `T6` ON `T6`.`recruitment_medium_key` = `T41`.`recruitment_medium_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T41`.`position_key` = `EMP_POSITION_DIM`.`position_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `T6`.`recruitment_type_code` <> 19 AND
     `T01`.`organization_code1` IN ( 
         'GOCEU', 
         'GOEAX', 
         'GOSEU', 
         'GOAMX', 
         'GONEU' ) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) 
 GROUP BY 
     `T01`.`organization_code1`, 
     `EMP_POSITION_DIM`.`position_code1`, 
     `EMP_POSITION_DIM`.`position_code2`, 
     `EMP_POSITION_DIM`.`position_code3`
 
 

;



-- id: 14462
SELECT     `Product`.`Product_line_code`, 
     `Product`.`Product_line`, 
     `Product`.`Product_type_key`, 
     `Product`.`Product_type`, 
     `Product`.`Base_product_key`, 
     `Product`.`Product_name`, 
     `Product`.`Product_key`, 
     concat(`Product`.`Product_name`, ' '), 
     `Product`.`Product_number`, 
     `Product`.`Introduction_date`
 FROM
     (
     SELECT
         `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
         `T61`.`product_line_en` AS `Product_line`, 
         `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
         `T8`.`product_type_en` AS `Product_type`, 
         `SLS_PRODUCT_DIM`.`base_product_key` AS `Base_product_key`, 
         `T01`.`product_name` AS `Product_name`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`, 
         `SLS_PRODUCT_DIM`.`introduction_date` AS `Introduction_date`, 
         `SLS_PRODUCT_DIM`.`product_number` AS `Product_number`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`, 
                         `T11`.`product_name` AS `product_name`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T8` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T8`.`product_type_code`
     ) `Product` 
 WHERE 
     `Product`.`Product_line_code` IN ( 
         994 )
 
 

;



-- id: 14472
SELECT     `T0`.`order_method_key` AS `column0`, 
     `T0`.`order_method_en` AS `column1`
 FROM
     `gosalesdw1021`.`sls_order_method_dim` `T0` 
 GROUP BY 
     `T0`.`order_method_key`, 
     `T0`.`order_method_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 14614
SELECT     `Product`.`Product_line_code` AS `column0`, 
     `Product`.`Product_type_key` AS `column1`, 
     `Product`.`Base_product_key` AS `column2`, 
     `Product`.`Product_key` AS `column3`, 
     `T11`.`order_method_key` AS `column4`, 
     SUM(`SLS_SALES_FACT`.`quantity`) AS `column5`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
         (
         SELECT
             `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
             `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
             `SLS_PRODUCT_DIM`.`base_product_key` AS `Base_product_key`, 
             `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
         FROM
             `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                         (
                         SELECT
                             `T112`.`product_number` AS `product_number`
                         FROM
                             `gosalesdw1021`.`sls_product_lookup` `T112` 
                         WHERE 
                             `T112`.`product_language` = 'EN'
                         ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
         ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` JOIN `gosalesdw1021`.`sls_order_method_dim` `T11` ON `SLS_SALES_FACT`.`order_method_key` = `T11`.`order_method_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` < 37 AND
     `Product`.`Product_line_code` IN ( 
         994 ) 
 GROUP BY 
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`, 
     `Product`.`Base_product_key`, 
     `Product`.`Product_key`, 
     `T11`.`order_method_key`
 
 

;



-- id: 14750
SELECT     `Product`.`Product_line_code` AS `column0`, 
     `Product`.`Product_type_key` AS `column1`, 
     `Product`.`Base_product_key` AS `column2`, 
     `Product`.`Product_key` AS `column3`, 
     `T11`.`order_method_key` AS `column4`, 
     SUM(`T91`.`return_quantity`) AS `column5`
 FROM
     `gosalesdw1021`.`dist_returned_items_fact` `T91` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T91`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`sls_order_method_dim` `T11` ON `T91`.`order_method_key` = `T11`.`order_method_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
                 `SLS_PRODUCT_DIM`.`base_product_key` AS `Base_product_key`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T112`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T112` 
                             WHERE 
                                 `T112`.`product_language` = 'EN'
                             ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `T91`.`product_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` < 37 AND
     `Product`.`Product_line_code` IN ( 
         994 ) 
 GROUP BY 
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`, 
     `Product`.`Base_product_key`, 
     `Product`.`Product_key`, 
     `T11`.`order_method_key`
 
 

;



-- id: 14754
SELECT     `GO_TIME_DIM`.`day_date`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4))
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM`

;



-- id: 14770
SELECT     `GO_TIME_DIM`.`day_date`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     concat(`T1`.`quarter_en`, ' '), 
     `GO_TIME_DIM`.`current_year`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T1` ON `GO_TIME_DIM`.`quarter_key` = `T1`.`quarter_key`
 
 

;



-- id: 14774
SELECT     `GO_TIME_DIM`.`day_date`, 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`month_key`, 
     concat(`GO_TIME_DIM`.`month_en`, ' '), 
     `GO_TIME_DIM`.`current_year`, 
     CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8))
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM`

;



-- id: 14790
SELECT     `GO_TIME_DIM`.`day_date`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`month_key`, 
     CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)), 
     `SLS_SALES_FACT`.`quantity`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key`
 
 

;



-- id: 14806
SELECT     `GO_TIME_DIM`.`day_date`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`month_key`, 
     CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)), 
     `T1`.`return_quantity`
 FROM
     `gosalesdw1021`.`dist_returned_items_fact` `T1` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T1`.`day_key` = `GO_TIME_DIM`.`day_key`
 
 

;



-- id: 14812
SELECT     `SLS_RETAILER_DIM`.`retailer_type_code`, 
     `SLS_RETAILER_DIM`.`retailer_type_en`
 FROM
     `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` 
 ORDER BY 
     `SLS_RETAILER_DIM`.`retailer_type_code` ASC
 
 

;



-- id: 14822
SELECT     `T0`.`return_reason_key` AS `column0`, 
     `T0`.`reason_description_en` AS `column1`
 FROM
     `gosalesdw1021`.`dist_return_reason_dim` `T0` 
 GROUP BY 
     `T0`.`return_reason_key`, 
     `T0`.`reason_description_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 14898
SELECT     `GO_TIME_DIM`.`day_date`, 
     `Retailer`.`Retailer_type_code`, 
     `T8`.`return_reason_key`, 
     `T61`.`return_quantity`
 FROM
     `gosalesdw1021`.`dist_returned_items_fact` `T61` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T61`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN 
         (
         SELECT
             `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`, 
             `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
         FROM
             (
             SELECT
                 `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
                 `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
                 `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
                 `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
                 `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
                 `GO_REGION_DIM`.`region_en` AS `Region`, 
                 `GO_REGION_DIM`.`country_en` AS `Country`, 
                 concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
             FROM
                 `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
             ) `T01` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T01`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
         ) `Retailer_site` ON `T61`.`retailer_site_key` = `Retailer_site`.`Retailer_site_key` JOIN `gosalesdw1021`.`dist_return_reason_dim` `T8` ON `T8`.`return_reason_key` = `T61`.`return_reason_key` JOIN 
                 (
                 SELECT
                     `SLS_RETAILER_DIM`.`retailer_type_code` AS `Retailer_type_code`, 
                     `SLS_RETAILER_DIM`.`retailer_key` AS `Retailer_key`
                 FROM
                     `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` 
                 GROUP BY 
                     `SLS_RETAILER_DIM`.`retailer_type_code`, 
                     `SLS_RETAILER_DIM`.`retailer_key`
                 ) `Retailer` ON `Retailer`.`Retailer_key` = `Retailer_site`.`Retailer_key`
 
 

;



-- id: 14905
SELECT     `T0`.`REGION_CODE`, 
     `T0`.`Region`
 FROM
     (
     SELECT
         `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
         `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
         `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
         `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
         `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
         `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
         `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
         `GO_REGION_DIM`.`region_en` AS `Region`, 
         `GO_REGION_DIM`.`country_en` AS `Country`, 
         concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
     FROM
         `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
     ) `T0` 
 ORDER BY 
     `T0`.`REGION_CODE` ASC
 
 

;



-- id: 14923
SELECT     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 15069
SELECT     `GO_TIME_DIM`.`day_date`, 
     `Product`.`Product_line_code`, 
     `Retailer_site`.`Region_code`, 
     `T13`.`return_quantity`
 FROM
     `gosalesdw1021`.`dist_returned_items_fact` `T13` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T13`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN 
         (
         SELECT
             `T01`.`REGION_CODE` AS `Region_code`, 
             `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
         FROM
             (
             SELECT
                 `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
                 `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
                 `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
                 `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
                 `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
                 `GO_REGION_DIM`.`region_en` AS `Region`, 
                 `GO_REGION_DIM`.`country_en` AS `Country`, 
                 concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
             FROM
                 `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
             ) `T01` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T01`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
         ) `Retailer_site` ON `T13`.`retailer_site_key` = `Retailer_site`.`Retailer_site_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T71` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T71`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T91` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T91`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T101` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T101`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T51`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T51` 
                             WHERE 
                                 `T51`.`product_language` = 'EN'
                             ) `T41` ON `SLS_PRODUCT_DIM`.`product_number` = `T41`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T111` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T111`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T121` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T121`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `T13`.`product_key`
 
 

;



-- id: 15081
SELECT     `T0`.`return_reason_key` AS `column0`, 
     `T0`.`reason_description_en` AS `column1`
 FROM
     `gosalesdw1021`.`dist_return_reason_dim` `T0` 
 WHERE 
     `T0`.`return_reason_key` = 9002 OR
     `T0`.`return_reason_key` = 9003 OR
     `T0`.`return_reason_key` = 9004 OR
     `T0`.`return_reason_key` = 9005 OR
     `T0`.`return_reason_key` = 9001 
 GROUP BY 
     `T0`.`return_reason_key`, 
     `T0`.`reason_description_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 15114
SELECT     `T2`.`return_reason_key` AS `column0`, 
     SUM(`T01`.`return_quantity`) AS `column1`
 FROM
     `gosalesdw1021`.`dist_returned_items_fact` `T01` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T01`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`dist_return_reason_dim` `T2` ON `T2`.`return_reason_key` = `T01`.`return_reason_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `T2`.`return_reason_key` = 9005 
 GROUP BY 
     `T2`.`return_reason_key`
 
 

;



-- id: 15147
SELECT     `T2`.`return_reason_key` AS `column0`, 
     SUM(`T01`.`return_quantity`) AS `column1`
 FROM
     `gosalesdw1021`.`dist_returned_items_fact` `T01` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T01`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`dist_return_reason_dim` `T2` ON `T2`.`return_reason_key` = `T01`.`return_reason_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `T2`.`return_reason_key` = 9001 
 GROUP BY 
     `T2`.`return_reason_key`
 
 

;



-- id: 15180
SELECT     `T2`.`return_reason_key` AS `column0`, 
     SUM(`T01`.`return_quantity`) AS `column1`
 FROM
     `gosalesdw1021`.`dist_returned_items_fact` `T01` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T01`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`dist_return_reason_dim` `T2` ON `T2`.`return_reason_key` = `T01`.`return_reason_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `T2`.`return_reason_key` = 9002 
 GROUP BY 
     `T2`.`return_reason_key`
 
 

;



-- id: 15213
SELECT     `T2`.`return_reason_key` AS `column0`, 
     SUM(`T01`.`return_quantity`) AS `column1`
 FROM
     `gosalesdw1021`.`dist_returned_items_fact` `T01` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T01`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`dist_return_reason_dim` `T2` ON `T2`.`return_reason_key` = `T01`.`return_reason_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `T2`.`return_reason_key` = 9003 
 GROUP BY 
     `T2`.`return_reason_key`
 
 

;



-- id: 15246
SELECT     `T2`.`return_reason_key` AS `column0`, 
     SUM(`T01`.`return_quantity`) AS `column1`
 FROM
     `gosalesdw1021`.`dist_returned_items_fact` `T01` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T01`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`dist_return_reason_dim` `T2` ON `T2`.`return_reason_key` = `T01`.`return_reason_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 AND
     `T2`.`return_reason_key` = 9004 
 GROUP BY 
     `T2`.`return_reason_key`
 
 

;



-- id: 15267
SELECT     SUM(`T0`.`return_quantity`) AS `column0`
 FROM
     `gosalesdw1021`.`dist_returned_items_fact` `T0` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T0`.`day_key` = `GO_TIME_DIM`.`day_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36
 
 

;



-- id: 15288
SELECT     SUM(`SLS_SALES_FACT`.`quantity`) AS `column0`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36
 
 

;



-- id: 15300
SELECT     `T0`.`return_reason_key` AS `column0`, 
     `T0`.`reason_description_en` AS `column1`
 FROM
     `gosalesdw1021`.`dist_return_reason_dim` `T0` 
 WHERE 
     NOT ( `T0`.`return_reason_key` IN ( 
         9003 ) ) 
 GROUP BY 
     `T0`.`return_reason_key`, 
     `T0`.`reason_description_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 15315
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 15333
SELECT     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 15458
SELECT     `T101`.`return_reason_key` AS `column0`, 
     `Product`.`Product_line_code` AS `column1`, 
     SUM(`T11`.`return_quantity`) AS `column2`
 FROM
     `gosalesdw1021`.`dist_return_reason_dim` `T101` JOIN `gosalesdw1021`.`dist_returned_items_fact` `T11` ON `T101`.`return_reason_key` = `T11`.`return_reason_key` JOIN 
         (
         SELECT
             `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
             `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
         FROM
             `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                         (
                         SELECT
                             `T112`.`product_number` AS `product_number`
                         FROM
                             `gosalesdw1021`.`sls_product_lookup` `T112` 
                         WHERE 
                             `T112`.`product_language` = 'EN'
                         ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
         ) `Product` ON `Product`.`Product_key` = `T11`.`product_key` 
 WHERE 
     NOT ( `T101`.`return_reason_key` IN ( 
         9003 ) ) 
 GROUP BY 
     `T101`.`return_reason_key`, 
     `Product`.`Product_line_code` 
 ORDER BY 
     `column1` ASC
 
 

;



-- id: 15596
SELECT     `Product`.`Product_line_code` AS `column0`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column1`, 
     SUM(`T101`.`return_quantity`) AS `column2`
 FROM
     `gosalesdw1021`.`dist_returned_items_fact` `T101` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T101`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`dist_return_reason_dim` `T12` ON `T12`.`return_reason_key` = `T101`.`return_reason_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T11`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T11` 
                             WHERE 
                                 `T11`.`product_language` = 'EN'
                             ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `T101`.`product_key` 
 WHERE 
     NOT ( `T12`.`return_reason_key` IN ( 
         9003 ) ) 
 GROUP BY 
     `Product`.`Product_line_code`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 15606
SELECT     `T0`.`order_method_key` AS `column0`, 
     `T0`.`order_method_en` AS `column1`
 FROM
     `gosalesdw1021`.`sls_order_method_dim` `T0` 
 GROUP BY 
     `T0`.`order_method_key`, 
     `T0`.`order_method_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 15742
SELECT     `Product`.`Product_line_code` AS `column0`, 
     `T101`.`order_method_key` AS `column1`, 
     SUM(`T91`.`return_quantity`) AS `column2`
 FROM
     `gosalesdw1021`.`dist_returned_items_fact` `T91` JOIN `gosalesdw1021`.`sls_order_method_dim` `T101` ON `T91`.`order_method_key` = `T101`.`order_method_key` JOIN `gosalesdw1021`.`dist_return_reason_dim` `T11` ON `T11`.`return_reason_key` = `T91`.`return_reason_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T112`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T112` 
                             WHERE 
                                 `T112`.`product_language` = 'EN'
                             ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `T91`.`product_key` 
 WHERE 
     NOT ( `T11`.`return_reason_key` IN ( 
         9003 ) ) 
 GROUP BY 
     `Product`.`Product_line_code`, 
     `T101`.`order_method_key`
 
 

;



-- id: 15752
SELECT     `T0`.`order_method_key` AS `column0`, 
     `T0`.`order_method_en` AS `column1`
 FROM
     `gosalesdw1021`.`sls_order_method_dim` `T0` 
 GROUP BY 
     `T0`.`order_method_key`, 
     `T0`.`order_method_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 15764
SELECT     `T0`.`return_reason_key` AS `column0`, 
     `T0`.`reason_description_en` AS `column1`
 FROM
     `gosalesdw1021`.`dist_return_reason_dim` `T0` 
 WHERE 
     NOT ( `T0`.`return_reason_key` IN ( 
         9003 ) ) 
 GROUP BY 
     `T0`.`return_reason_key`, 
     `T0`.`reason_description_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 15779
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 15797
SELECT     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 15935
SELECT     `T12`.`return_reason_key` AS `column0`, 
     `Product`.`Product_line_code` AS `column1`, 
     SUM(`T101`.`return_quantity`) AS `column2`
 FROM
     `gosalesdw1021`.`dist_returned_items_fact` `T101` JOIN `gosalesdw1021`.`sls_order_method_dim` `T111` ON `T101`.`order_method_key` = `T111`.`order_method_key` JOIN `gosalesdw1021`.`dist_return_reason_dim` `T12` ON `T12`.`return_reason_key` = `T101`.`return_reason_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T112`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T112` 
                             WHERE 
                                 `T112`.`product_language` = 'EN'
                             ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `T101`.`product_key` 
 WHERE 
     NOT ( `T12`.`return_reason_key` IN ( 
         9003 ) ) AND
     `T111`.`order_method_key` = 604 
 GROUP BY 
     `T12`.`return_reason_key`, 
     `Product`.`Product_line_code` 
 ORDER BY 
     `column1` ASC
 
 

;



-- id: 16087
SELECT     `Product`.`Product_line_code` AS `column0`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column1`, 
     SUM(`T101`.`return_quantity`) AS `column2`
 FROM
     `gosalesdw1021`.`dist_returned_items_fact` `T101` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T101`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`sls_order_method_dim` `T121` ON `T101`.`order_method_key` = `T121`.`order_method_key` JOIN `gosalesdw1021`.`dist_return_reason_dim` `T13` ON `T13`.`return_reason_key` = `T101`.`return_reason_key` JOIN 
                 (
                 SELECT
                     `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                     `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
                 FROM
                     `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                                 (
                                 SELECT
                                     `T11`.`product_number` AS `product_number`
                                 FROM
                                     `gosalesdw1021`.`sls_product_lookup` `T11` 
                                 WHERE 
                                     `T11`.`product_language` = 'EN'
                                 ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
                 ) `Product` ON `Product`.`Product_key` = `T101`.`product_key` 
 WHERE 
     NOT ( `T13`.`return_reason_key` IN ( 
         9003 ) ) AND
     `T121`.`order_method_key` = 604 
 GROUP BY 
     `Product`.`Product_line_code`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 
 
 org.apache.tez.dag.api.SessionNotRunning: Application not running, applicationId=application_1433434842480_0012, yarnApplicationState=FINISHED, finalApplicationStatus=SUCCEEDED, trackingUrl=http://drv-hdpc3.ottawa.ibm.com:8088/proxy/application_1433434842480_0012/, diagnostics=Session stats:submittedDAGs=3, successfulDAGs=3, failedDAGs=0, killedDAGs=0
 
 	at org.apache.tez.client.TezClientUtils.getSessionAMProxy(TezClientUtils.java:798)
 	at org.apache.tez.client.TezClient.getSessionAMProxy(TezClient.java:633)
 	at org.apache.tez.client.TezClient.stop(TezClient.java:440)
 	at org.apache.hadoop.hive.ql.exec.tez.TezSessionState.close(TezSessionState.java:265)
 	at org.apache.hadoop.hive.ql.exec.tez.TezSessionPoolManager.close(TezSessionPoolManager.java:176)
 	at org.apache.hadoop.hive.ql.session.SessionState.close(SessionState.java:1256)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.close(HiveSessionImpl.java:552)
 	at org.apache.hive.service.cli.session.HiveSessionImplwithUGI.close(HiveSessionImplwithUGI.java:104)
 	at sun.reflect.GeneratedMethodAccessor18.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hive.service.cli.session.HiveSessionProxy.invoke(HiveSessionProxy.java:79)
 	at org.apache.hive.service.cli.session.HiveSessionProxy.access$000(HiveSessionProxy.java:37)
 	at org.apache.hive.service.cli.session.HiveSessionProxy$1.run(HiveSessionProxy.java:64)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.hadoop.hive.shims.HadoopShimsSecure.doAs(HadoopShimsSecure.java:536)
 	at org.apache.hive.service.cli.session.HiveSessionProxy.invoke(HiveSessionProxy.java:60)
 	at com.sun.proxy.$Proxy25.close(Unknown Source)
 	at org.apache.hive.service.cli.session.SessionManager.closeSession(SessionManager.java:278)
 	at org.apache.hive.service.cli.CLIService.closeSession(CLIService.java:233)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.CloseSession(ThriftCLIService.java:368)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$CloseSession.getResult(TCLIService.java:1273)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$CloseSession.getResult(TCLIService.java:1258)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)

;



-- id: 16105
SELECT     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 16120
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 16141
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     concat(`T2`.`quarter_en`, ' '), 
     `GO_TIME_DIM0`.`current_year`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T2` ON `GO_TIME_DIM0`.`quarter_key` = `T2`.`quarter_key`
 
 

;



-- id: 16291
SELECT     `T01`.`organization_code1`, 
     `Product`.`Product_line_code`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
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
         ) `T01` ON `T01`.`organization_key` = `SLS_SALES_FACT`.`organization_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T61` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T61`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T81`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T91` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T91`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T41`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T41` 
                             WHERE 
                                 `T41`.`product_language` = 'EN'
                             ) `T31` ON `SLS_PRODUCT_DIM`.`product_number` = `T31`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T101` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T101`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T11` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T11`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2010' AND
     `GO_TIME_DIM`.`quarter_key` = 20101
 
 

;



-- id: 16441
SELECT     `T01`.`organization_code1`, 
     `Product`.`Product_line_code`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
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
         ) `T01` ON `T01`.`organization_key` = `SLS_SALES_FACT`.`organization_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T61` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T61`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T81`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T91` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T91`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T41`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T41` 
                             WHERE 
                                 `T41`.`product_language` = 'EN'
                             ) `T31` ON `SLS_PRODUCT_DIM`.`product_number` = `T31`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T101` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T101`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T11` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T11`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2011' AND
     `GO_TIME_DIM`.`quarter_key` = 20111
 
 

;



-- id: 16475
SELECT     `T3`.`organization_code1`, 
     `T21`.`Organization_name__level_1_`
 FROM
     (
     SELECT
         `T01`.`Organization_name__level_5_` AS `Organization_name__level_1_`, 
         `T01`.`Organization_code__level_5_` AS `Organization_code__level_1_`
     FROM
         (
         SELECT
             `T11`.`organization_name_en` AS `Organization_name__level_5_`, 
             `T11`.`organization_code` AS `Organization_code__level_5_`
         FROM
             `gosalesdw1021`.`go_org_name_lookup` `T11`
         ) `T01` 
     WHERE 
         `T01`.`Organization_code__level_5_` IN ( 
             'GOAMX', 
             'GOCEU', 
             'GOEAX', 
             'GOEUX', 
             'GONEU', 
             'GOSEU' )
     ) `T21` JOIN 
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
     ) `T3` ON `T21`.`Organization_code__level_1_` = `T3`.`organization_code1` 
 WHERE 
     `T3`.`organization_code1` = 'GONEU'
 
 

;



-- id: 16493
SELECT     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 16508
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 16529
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     concat(`T2`.`quarter_en`, ' '), 
     `GO_TIME_DIM0`.`current_year`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T2` ON `GO_TIME_DIM0`.`quarter_key` = `T2`.`quarter_key`
 
 

;



-- id: 16679
SELECT     `T01`.`organization_code1`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
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
         ) `T01` ON `T01`.`organization_key` = `SLS_SALES_FACT`.`organization_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T61` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T61`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T81`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T91` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T91`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T41`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T41` 
                             WHERE 
                                 `T41`.`product_language` = 'EN'
                             ) `T31` ON `SLS_PRODUCT_DIM`.`product_number` = `T31`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T101` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T101`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T11` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T11`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2010' AND
     `GO_TIME_DIM`.`quarter_key` = 20101
 
 

;



-- id: 16829
SELECT     `T01`.`organization_code1`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
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
         ) `T01` ON `T01`.`organization_key` = `SLS_SALES_FACT`.`organization_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T61` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T61`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T81`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T91` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T91`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T41`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T41` 
                             WHERE 
                                 `T41`.`product_language` = 'EN'
                             ) `T31` ON `SLS_PRODUCT_DIM`.`product_number` = `T31`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T101` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T101`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T11` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T11`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2011' AND
     `GO_TIME_DIM`.`quarter_key` = 20111
 
 

;



-- id: 16863
SELECT     `T3`.`organization_code1`, 
     `T21`.`Organization_name__level_1_`
 FROM
     (
     SELECT
         `T01`.`Organization_name__level_5_` AS `Organization_name__level_1_`, 
         `T01`.`Organization_code__level_5_` AS `Organization_code__level_1_`
     FROM
         (
         SELECT
             `T11`.`organization_name_en` AS `Organization_name__level_5_`, 
             `T11`.`organization_code` AS `Organization_code__level_5_`
         FROM
             `gosalesdw1021`.`go_org_name_lookup` `T11`
         ) `T01` 
     WHERE 
         `T01`.`Organization_code__level_5_` IN ( 
             'GOAMX', 
             'GOCEU', 
             'GOEAX', 
             'GOEUX', 
             'GONEU', 
             'GOSEU' )
     ) `T21` JOIN 
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
     ) `T3` ON `T21`.`Organization_code__level_1_` = `T3`.`organization_code1` 
 WHERE 
     `T3`.`organization_code1` = 'GOCEU'
 
 

;



-- id: 16881
SELECT     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 16896
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 16917
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     concat(`T2`.`quarter_en`, ' '), 
     `GO_TIME_DIM0`.`current_year`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T2` ON `GO_TIME_DIM0`.`quarter_key` = `T2`.`quarter_key`
 
 

;



-- id: 17067
SELECT     `T01`.`organization_code1`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
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
         ) `T01` ON `T01`.`organization_key` = `SLS_SALES_FACT`.`organization_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T61` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T61`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T81`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T91` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T91`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T41`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T41` 
                             WHERE 
                                 `T41`.`product_language` = 'EN'
                             ) `T31` ON `SLS_PRODUCT_DIM`.`product_number` = `T31`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T101` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T101`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T11` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T11`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2010' AND
     `GO_TIME_DIM`.`quarter_key` = 20101
 
 

;



-- id: 17217
SELECT     `T01`.`organization_code1`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
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
         ) `T01` ON `T01`.`organization_key` = `SLS_SALES_FACT`.`organization_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T61` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T61`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T81`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T91` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T91`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T41`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T41` 
                             WHERE 
                                 `T41`.`product_language` = 'EN'
                             ) `T31` ON `SLS_PRODUCT_DIM`.`product_number` = `T31`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T101` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T101`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T11` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T11`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2011' AND
     `GO_TIME_DIM`.`quarter_key` = 20111
 
 

;



-- id: 17251
SELECT     `T3`.`organization_code1`, 
     `T21`.`Organization_name__level_1_`
 FROM
     (
     SELECT
         `T01`.`Organization_name__level_5_` AS `Organization_name__level_1_`, 
         `T01`.`Organization_code__level_5_` AS `Organization_code__level_1_`
     FROM
         (
         SELECT
             `T11`.`organization_name_en` AS `Organization_name__level_5_`, 
             `T11`.`organization_code` AS `Organization_code__level_5_`
         FROM
             `gosalesdw1021`.`go_org_name_lookup` `T11`
         ) `T01` 
     WHERE 
         `T01`.`Organization_code__level_5_` IN ( 
             'GOAMX', 
             'GOCEU', 
             'GOEAX', 
             'GOEUX', 
             'GONEU', 
             'GOSEU' )
     ) `T21` JOIN 
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
     ) `T3` ON `T21`.`Organization_code__level_1_` = `T3`.`organization_code1` 
 WHERE 
     `T3`.`organization_code1` = 'GOSEU'
 
 

;



-- id: 17269
SELECT     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 17284
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 17305
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     concat(`T2`.`quarter_en`, ' '), 
     `GO_TIME_DIM0`.`current_year`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T2` ON `GO_TIME_DIM0`.`quarter_key` = `T2`.`quarter_key`
 
 

;



-- id: 17455
SELECT     `T01`.`organization_code1`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
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
         ) `T01` ON `T01`.`organization_key` = `SLS_SALES_FACT`.`organization_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T61` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T61`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T81`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T91` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T91`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T41`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T41` 
                             WHERE 
                                 `T41`.`product_language` = 'EN'
                             ) `T31` ON `SLS_PRODUCT_DIM`.`product_number` = `T31`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T101` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T101`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T11` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T11`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2010' AND
     `GO_TIME_DIM`.`quarter_key` = 20101
 
 

;



-- id: 17605
SELECT     `T01`.`organization_code1`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
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
         ) `T01` ON `T01`.`organization_key` = `SLS_SALES_FACT`.`organization_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T61` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T61`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T81`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T91` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T91`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T41`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T41` 
                             WHERE 
                                 `T41`.`product_language` = 'EN'
                             ) `T31` ON `SLS_PRODUCT_DIM`.`product_number` = `T31`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T101` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T101`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T11` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T11`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2011' AND
     `GO_TIME_DIM`.`quarter_key` = 20111
 
 

;



-- id: 17639
SELECT     `T3`.`organization_code1`, 
     `T21`.`Organization_name__level_1_`
 FROM
     (
     SELECT
         `T01`.`Organization_name__level_5_` AS `Organization_name__level_1_`, 
         `T01`.`Organization_code__level_5_` AS `Organization_code__level_1_`
     FROM
         (
         SELECT
             `T11`.`organization_name_en` AS `Organization_name__level_5_`, 
             `T11`.`organization_code` AS `Organization_code__level_5_`
         FROM
             `gosalesdw1021`.`go_org_name_lookup` `T11`
         ) `T01` 
     WHERE 
         `T01`.`Organization_code__level_5_` IN ( 
             'GOAMX', 
             'GOCEU', 
             'GOEAX', 
             'GOEUX', 
             'GONEU', 
             'GOSEU' )
     ) `T21` JOIN 
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
     ) `T3` ON `T21`.`Organization_code__level_1_` = `T3`.`organization_code1` 
 WHERE 
     `T3`.`organization_code1` = 'GOAMX'
 
 

;



-- id: 17657
SELECT     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 17672
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 17693
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     concat(`T2`.`quarter_en`, ' '), 
     `GO_TIME_DIM0`.`current_year`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T2` ON `GO_TIME_DIM0`.`quarter_key` = `T2`.`quarter_key`
 
 

;



-- id: 17843
SELECT     `T01`.`organization_code1`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
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
         ) `T01` ON `T01`.`organization_key` = `SLS_SALES_FACT`.`organization_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T61` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T61`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T81`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T91` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T91`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T41`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T41` 
                             WHERE 
                                 `T41`.`product_language` = 'EN'
                             ) `T31` ON `SLS_PRODUCT_DIM`.`product_number` = `T31`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T101` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T101`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T11` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T11`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2010' AND
     `GO_TIME_DIM`.`quarter_key` = 20101
 
 

;



-- id: 17993
SELECT     `T01`.`organization_code1`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
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
         ) `T01` ON `T01`.`organization_key` = `SLS_SALES_FACT`.`organization_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T61` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T61`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T81`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T91` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T91`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T41`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T41` 
                             WHERE 
                                 `T41`.`product_language` = 'EN'
                             ) `T31` ON `SLS_PRODUCT_DIM`.`product_number` = `T31`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T101` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T101`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T11` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T11`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2011' AND
     `GO_TIME_DIM`.`quarter_key` = 20111
 
 

;



-- id: 18027
SELECT     `T3`.`organization_code1`, 
     `T21`.`Organization_name__level_1_`
 FROM
     (
     SELECT
         `T01`.`Organization_name__level_5_` AS `Organization_name__level_1_`, 
         `T01`.`Organization_code__level_5_` AS `Organization_code__level_1_`
     FROM
         (
         SELECT
             `T11`.`organization_name_en` AS `Organization_name__level_5_`, 
             `T11`.`organization_code` AS `Organization_code__level_5_`
         FROM
             `gosalesdw1021`.`go_org_name_lookup` `T11`
         ) `T01` 
     WHERE 
         `T01`.`Organization_code__level_5_` IN ( 
             'GOAMX', 
             'GOCEU', 
             'GOEAX', 
             'GOEUX', 
             'GONEU', 
             'GOSEU' )
     ) `T21` JOIN 
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
     ) `T3` ON `T21`.`Organization_code__level_1_` = `T3`.`organization_code1` 
 WHERE 
     `T3`.`organization_code1` = 'GOEAX'
 
 

;



-- id: 18037
SELECT     `T0`.`order_method_key` AS `column0`, 
     `T0`.`order_method_en` AS `column1`
 FROM
     `gosalesdw1021`.`sls_order_method_dim` `T0` 
 GROUP BY 
     `T0`.`order_method_key`, 
     `T0`.`order_method_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 18070
SELECT     `T2`.`order_method_key` AS `column0`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column1`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`sls_order_method_dim` `T2` ON `SLS_SALES_FACT`.`order_method_key` = `T2`.`order_method_key` 
 WHERE 
     `GO_TIME_DIM`.`quarter_key` = 20111 
 GROUP BY 
     `T2`.`order_method_key`
 
 

;



-- id: 18103
SELECT     `T2`.`order_method_key` AS `column0`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column1`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`sls_order_method_dim` `T2` ON `SLS_SALES_FACT`.`order_method_key` = `T2`.`order_method_key` 
 WHERE 
     `GO_TIME_DIM`.`quarter_key` = 20111 
 GROUP BY 
     `T2`.`order_method_key`
 
 

;



-- id: 18118
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 18191
SELECT     `T31`.`organization_code1` AS `column0`, 
     `T21`.`Organization_name__level_1_` AS `column1`, 
     `T31`.`organization_code2` AS `column2`, 
     `T61`.`Organization_name__level_2_` AS `column3`, 
     `T31`.`organization_code` AS `column4`, 
     `T7`.`Organization_name__level_3_` AS `column5`
 FROM
     (
     SELECT
         `T01`.`Organization_name__level_5_` AS `Organization_name__level_1_`, 
         `T01`.`Organization_code__level_5_` AS `Organization_code__level_1_`
     FROM
         (
         SELECT
             `T11`.`organization_name_en` AS `Organization_name__level_5_`, 
             `T11`.`organization_code` AS `Organization_code__level_5_`
         FROM
             `gosalesdw1021`.`go_org_name_lookup` `T11`
         ) `T01` 
     WHERE 
         `T01`.`Organization_code__level_5_` IN ( 
             'GOAMX', 
             'GOCEU', 
             'GOEAX', 
             'GOEUX', 
             'GONEU', 
             'GOSEU' )
     ) `T21` JOIN 
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
     ) `T31` ON `T21`.`Organization_code__level_1_` = `T31`.`organization_code1` JOIN 
         (
         SELECT
             `T01`.`Organization_name__level_5_` AS `Organization_name__level_2_`, 
             `T01`.`Organization_code__level_5_` AS `Organization_code__level_2_`
         FROM
             (
             SELECT
                 `T11`.`organization_name_en` AS `Organization_name__level_5_`, 
                 `T11`.`organization_code` AS `Organization_code__level_5_`
             FROM
                 `gosalesdw1021`.`go_org_name_lookup` `T11`
             ) `T01` 
         WHERE 
             `T01`.`Organization_code__level_5_` IN ( 
                 'GOAMXCP', 
                 'GOAMXOP', 
                 'GOCEUCP', 
                 'GOCEUOP', 
                 'GOEAXCP', 
                 'GOEAXOP', 
                 'GOEUXCP', 
                 'GOEUXOP', 
                 'GONEUCP', 
                 'GONEUOP', 
                 'GOSEUCP', 
                 'GOSEUOP' )
         ) `T61` ON `T61`.`Organization_code__level_2_` = `T31`.`organization_code2` JOIN 
             (
             SELECT
                 `T01`.`Organization_name__level_5_` AS `Organization_name__level_3_`, 
                 `T01`.`Organization_code__level_5_` AS `Organization_code__level_3_`
             FROM
                 (
                 SELECT
                     `T11`.`organization_name_en` AS `Organization_name__level_5_`, 
                     `T11`.`organization_code` AS `Organization_code__level_5_`
                 FROM
                     `gosalesdw1021`.`go_org_name_lookup` `T11`
                 ) `T01` 
             WHERE 
                 `T01`.`Organization_code__level_5_` IN ( 
                     '006', 
                     '007', 
                     '009', 
                     '013', 
                     '014', 
                     '015', 
                     '017', 
                     '018', 
                     '019', 
                     '020', 
                     '021', 
                     '022', 
                     '023', 
                     '024', 
                     '025' )
             ) `T7` ON `T7`.`Organization_code__level_3_` = `T31`.`organization_code` 
 WHERE 
     `T31`.`organization_code1` = 'GOCEU' 
 GROUP BY 
     `T31`.`organization_code1`, 
     `T21`.`Organization_name__level_1_`, 
     `T31`.`organization_code2`, 
     `T61`.`Organization_name__level_2_`, 
     `T31`.`organization_code`, 
     `T7`.`Organization_name__level_3_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC, 
     `column3` ASC, 
     `column2` ASC, 
     `column5` ASC, 
     `column4` ASC
 
 

;



-- id: 18203
SELECT     `T0`.`expense_group_code` AS `column0`, 
     `T0`.`expense_group_en` AS `column1`, 
     `T0`.`expense_type_code` AS `column2`, 
     `T0`.`expense_type_en` AS `column3`
 FROM
     `gosalesdw1021`.`emp_expense_type_dim` `T0` 
 WHERE 
     `T0`.`expense_type_code` = 31 
 GROUP BY 
     `T0`.`expense_group_code`, 
     `T0`.`expense_group_en`, 
     `T0`.`expense_type_code`, 
     `T0`.`expense_type_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC, 
     `column3` ASC, 
     `column2` ASC
 
 

;



-- id: 18306
SELECT     `T3`.`organization_code1` AS `column0`, 
     `T21`.`Organization_name__level_1_` AS `column1`
 FROM
     (
     SELECT
         `T01`.`Organization_name__level_5_` AS `Organization_name__level_1_`, 
         `T01`.`Organization_code__level_5_` AS `Organization_code__level_1_`
     FROM
         (
         SELECT
             `T11`.`organization_name_en` AS `Organization_name__level_5_`, 
             `T11`.`organization_code` AS `Organization_code__level_5_`
         FROM
             `gosalesdw1021`.`go_org_name_lookup` `T11`
         ) `T01` 
     WHERE 
         `T01`.`Organization_code__level_5_` IN ( 
             'GOAMX', 
             'GOCEU', 
             'GOEAX', 
             'GOEUX', 
             'GONEU', 
             'GOSEU' )
     ) `T21` JOIN 
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
     ) `T3` ON `T21`.`Organization_code__level_1_` = `T3`.`organization_code1` 
 GROUP BY 
     `T3`.`organization_code1`, 
     `T21`.`Organization_name__level_1_` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 18316
SELECT     `EMP_EMPLOYEE_DIM`.`manager_code1` AS `column0`, 
     `EMP_EMPLOYEE_DIM`.`manager1` AS `column1`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb1` AS `column2`, 
     `EMP_EMPLOYEE_DIM`.`manager_code2` AS `column3`, 
     `EMP_EMPLOYEE_DIM`.`manager2` AS `column4`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb2` AS `column5`, 
     `EMP_EMPLOYEE_DIM`.`manager_code3` AS `column6`, 
     `EMP_EMPLOYEE_DIM`.`manager3` AS `column7`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb3` AS `column8`, 
     `EMP_EMPLOYEE_DIM`.`manager_code4` AS `column9`, 
     `EMP_EMPLOYEE_DIM`.`manager4` AS `column10`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb4` AS `column11`, 
     `EMP_EMPLOYEE_DIM`.`manager_code5` AS `column12`, 
     `EMP_EMPLOYEE_DIM`.`manager5` AS `column13`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb5` AS `column14`, 
     `EMP_EMPLOYEE_DIM`.`manager_code6` AS `column15`, 
     `EMP_EMPLOYEE_DIM`.`manager6` AS `column16`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb6` AS `column17`, 
     `EMP_EMPLOYEE_DIM`.`employee_key` AS `column18`, 
     `EMP_EMPLOYEE_DIM`.`employee_name` AS `column19`, 
     `EMP_EMPLOYEE_DIM`.`employee_name_mb` AS `column20`, 
     `EMP_EMPLOYEE_DIM`.`employee_code` AS `column21`, 
     `EMP_EMPLOYEE_DIM`.`position_start_date` AS `column22`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` 
 GROUP BY 
     `EMP_EMPLOYEE_DIM`.`manager_code1`, 
     `EMP_EMPLOYEE_DIM`.`manager1`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb1`, 
     `EMP_EMPLOYEE_DIM`.`manager_code2`, 
     `EMP_EMPLOYEE_DIM`.`manager2`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb2`, 
     `EMP_EMPLOYEE_DIM`.`manager_code3`, 
     `EMP_EMPLOYEE_DIM`.`manager3`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb3`, 
     `EMP_EMPLOYEE_DIM`.`manager_code4`, 
     `EMP_EMPLOYEE_DIM`.`manager4`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb4`, 
     `EMP_EMPLOYEE_DIM`.`manager_code5`, 
     `EMP_EMPLOYEE_DIM`.`manager5`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb5`, 
     `EMP_EMPLOYEE_DIM`.`manager_code6`, 
     `EMP_EMPLOYEE_DIM`.`manager6`, 
     `EMP_EMPLOYEE_DIM`.`manager_mb6`, 
     `EMP_EMPLOYEE_DIM`.`employee_key`, 
     `EMP_EMPLOYEE_DIM`.`employee_name`, 
     `EMP_EMPLOYEE_DIM`.`employee_name_mb`, 
     `EMP_EMPLOYEE_DIM`.`employee_code`, 
     `EMP_EMPLOYEE_DIM`.`position_start_date` 
 ORDER BY 
     `column1` ASC, 
     `column2` ASC, 
     `column0` ASC, 
     `column4` ASC, 
     `column5` ASC, 
     `column3` ASC, 
     `column7` ASC, 
     `column8` ASC, 
     `column6` ASC, 
     `column10` ASC, 
     `column11` ASC, 
     `column9` ASC, 
     `column13` ASC, 
     `column14` ASC, 
     `column12` ASC, 
     `column16` ASC, 
     `column17` ASC, 
     `column15` ASC, 
     `column19` ASC, 
     `column20` ASC, 
     `column18` ASC
 
 

;



-- id: 18339
SELECT     `Successor__model_`.`SUCCESSOR_EMPLOYEE_KEY` AS `column0`, 
     `Successor__model_`.`SUCCESSOR_EMPLOYEE_NAME` AS `column1`
 FROM
     (
     SELECT
         `EMP_EMPLOYEE_DIM`.`employee_key` AS `SUCCESSOR_EMPLOYEE_KEY`, 
         `EMP_EMPLOYEE_DIM`.`employee_name` AS `SUCCESSOR_EMPLOYEE_NAME`
     FROM
         `gosalesdw1021`.`emp_succession_fact` `T1` JOIN `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` ON `T1`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key`
     ) `Successor__model_` 
 GROUP BY 
     `Successor__model_`.`SUCCESSOR_EMPLOYEE_KEY`, 
     `Successor__model_`.`SUCCESSOR_EMPLOYEE_NAME` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 18349
SELECT     `T0`.`successor_status_code` AS `column0`, 
     `T0`.`successor_status_en` AS `column1`
 FROM
     `gosalesdw1021`.`emp_succession_status_dim` `T0` 
 GROUP BY 
     `T0`.`successor_status_code`, 
     `T0`.`successor_status_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 18438
SELECT     `EMP_EMPLOYEE_DIM`.`manager_code1` AS `column0`, 
     `EMP_EMPLOYEE_DIM`.`manager_code2` AS `column1`, 
     `EMP_EMPLOYEE_DIM`.`manager_code3` AS `column2`, 
     `EMP_EMPLOYEE_DIM`.`manager_code4` AS `column3`, 
     `EMP_EMPLOYEE_DIM`.`manager_code5` AS `column4`, 
     `EMP_EMPLOYEE_DIM`.`manager_code6` AS `column5`, 
     `EMP_EMPLOYEE_DIM`.`employee_key` AS `column6`, 
     `Successor__model_`.`SUCCESSOR_EMPLOYEE_KEY` AS `column7`, 
     `T01`.`organization_code1` AS `column8`, 
     `T8`.`successor_status_code` AS `column9`, 
     AVG(`T61`.`percent_ready`) AS `column10`, 
     AVG(`T61`.`target_percent_ready`) AS `column11`
 FROM
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
     ) `T01` JOIN `gosalesdw1021`.`emp_succession_fact` `T61` ON `T01`.`organization_key` = `T61`.`organization_key` JOIN `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` ON `T61`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`emp_succession_status_dim` `T8` ON `T8`.`successor_status_key` = `T61`.`successor_status_key` JOIN 
                 (
                 SELECT
                     `EMP_EMPLOYEE_DIM`.`employee_key` AS `SUCCESSOR_EMPLOYEE_KEY`
                 FROM
                     `gosalesdw1021`.`emp_succession_fact` `T41` JOIN `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` ON `T41`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key`
                 ) `Successor__model_` ON `Successor__model_`.`SUCCESSOR_EMPLOYEE_KEY` = `T61`.`successor_employee_key` 
 GROUP BY 
     `EMP_EMPLOYEE_DIM`.`manager_code1`, 
     `EMP_EMPLOYEE_DIM`.`manager_code2`, 
     `EMP_EMPLOYEE_DIM`.`manager_code3`, 
     `EMP_EMPLOYEE_DIM`.`manager_code4`, 
     `EMP_EMPLOYEE_DIM`.`manager_code5`, 
     `EMP_EMPLOYEE_DIM`.`manager_code6`, 
     `EMP_EMPLOYEE_DIM`.`employee_key`, 
     `Successor__model_`.`SUCCESSOR_EMPLOYEE_KEY`, 
     `T01`.`organization_code1`, 
     `T8`.`successor_status_code`
 
 

;



-- id: 18528
SELECT     `GO_REGION_DIM`.`region_en` AS `Branch_region`, 
     `GO_TIME_DIM`.`current_year` AS `Year0`, 
     `EMP_EMPLOYEE_DIM`.`employee_key` AS `Employee_key`, 
     `T5`.`position_en` AS `Position_name`, 
     `EMP_POSITION_DIM`.`min_salary` AS `Minimum_salary`, 
     `EMP_POSITION_DIM`.`max_salary` AS `Maximum_salary`, 
     SUM(`EMP_EXPENSE_FACT`.`expense_total`) AS `Expense_total`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`emp_expense_fact` `EMP_EXPENSE_FACT` ON `EMP_EXPENSE_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `EMP_EXPENSE_FACT`.`position_key` = `EMP_POSITION_DIM`.`position_key` JOIN `gosalesdw1021`.`emp_position_lookup` `T5` ON `EMP_POSITION_DIM`.`position_code` = `T5`.`position_code` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_EXPENSE_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` 
 GROUP BY 
     `GO_REGION_DIM`.`region_en`, 
     `GO_TIME_DIM`.`current_year`, 
     `EMP_EMPLOYEE_DIM`.`employee_key`, 
     `T5`.`position_en`, 
     `EMP_POSITION_DIM`.`min_salary`, 
     `EMP_POSITION_DIM`.`max_salary`
 
 

;



-- id: 18650
SELECT     `Product`.`Product_line` AS `Product_line`, 
     `Product`.`Product_brand` AS `Product_brand`, 
     SUM(`T11`.`return_quantity`) AS `Return_quantity`, 
     `T101`.`reason_description_en` AS `Reason_description`
 FROM
     `gosalesdw1021`.`dist_return_reason_dim` `T101` JOIN `gosalesdw1021`.`dist_returned_items_fact` `T11` ON `T101`.`return_reason_key` = `T11`.`return_reason_key` JOIN 
         (
         SELECT
             `T61`.`product_line_en` AS `Product_line`, 
             `T31`.`product_brand_en` AS `Product_brand`, 
             `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
         FROM
             `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                         (
                         SELECT
                             `T112`.`product_number` AS `product_number`
                         FROM
                             `gosalesdw1021`.`sls_product_lookup` `T112` 
                         WHERE 
                             `T112`.`product_language` = 'EN'
                         ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
         ) `Product` ON `Product`.`Product_key` = `T11`.`product_key` 
 GROUP BY 
     `Product`.`Product_line`, 
     `Product`.`Product_brand`, 
     `T101`.`reason_description_en`
 
 

;



-- id: 18778
SELECT     `Product`.`Product_line` AS `Product_line`, 
     `T11`.`order_method_en` AS `Order_method_type`, 
     SUM(`SLS_SALES_FACT`.`quantity`) AS `Quantity`
 FROM
     (
     SELECT
         `T61`.`product_line_en` AS `Product_line`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T112`.`product_number` AS `product_number`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T112` 
                     WHERE 
                         `T112`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` JOIN `gosalesdw1021`.`sls_order_method_dim` `T11` ON `SLS_SALES_FACT`.`order_method_key` = `T11`.`order_method_key` 
 GROUP BY 
     `Product`.`Product_line`, 
     `T11`.`order_method_en`
 
 

;



-- id: 18888
SELECT     `Product`.`Product_line` AS `Product_line`, 
     AVG((`SLS_SALES_FACT`.`sale_total` - `SLS_SALES_FACT`.`unit_cost` * `SLS_SALES_FACT`.`quantity`) / CASE WHEN `SLS_SALES_FACT`.`sale_total` = 0 THEN NULL ELSE `SLS_SALES_FACT`.`sale_total` END) AS `Gross_margin`
 FROM
     (
     SELECT
         `T61`.`product_line_en` AS `Product_line`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T8` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T8`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 GROUP BY 
     `Product`.`Product_line`
 
 

;



-- id: 18922
SELECT     `Retailer_site`.`Region` AS `Region`, 
     AVG((`SLS_SALES_FACT`.`sale_total` - `SLS_SALES_FACT`.`unit_cost` * `SLS_SALES_FACT`.`quantity`) / CASE WHEN `SLS_SALES_FACT`.`sale_total` = 0 THEN NULL ELSE `SLS_SALES_FACT`.`sale_total` END) AS `Gross_margin`
 FROM
     (
     SELECT
         `T0`.`Region` AS `Region`, 
         `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
     FROM
         (
         SELECT
             `GO_REGION_DIM`.`region_en` AS `Region`, 
             `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
             `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
             `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
             `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
             `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
             `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
             `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
             `GO_REGION_DIM`.`country_en` AS `Country`, 
             concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
         FROM
             `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
         ) `T0` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T0`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
     ) `Retailer_site` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Retailer_site`.`Retailer_site_key` = `SLS_SALES_FACT`.`retailer_site_key` 
 GROUP BY 
     `Retailer_site`.`Region`
 
 

;



-- id: 19064
SELECT     `Product`.`Product_line` AS `Product_line`, 
     `Retailer_site`.`Region` AS `Region`, 
     SUM(`SLS_SALES_FACT`.`gross_profit`) AS `Gross_profit`
 FROM
     (
     SELECT
         `T61`.`product_line_en` AS `Product_line`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` JOIN 
         (
         SELECT
             `T9`.`Region` AS `Region`, 
             `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
         FROM
             (
             SELECT
                 `GO_REGION_DIM`.`region_en` AS `Region`, 
                 `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
                 `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
                 `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
                 `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
                 `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
                 `GO_REGION_DIM`.`country_en` AS `Country`, 
                 concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
             FROM
                 `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
             ) `T9` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T9`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
         ) `Retailer_site` ON `Retailer_site`.`Retailer_site_key` = `SLS_SALES_FACT`.`retailer_site_key` 
 GROUP BY 
     `Product`.`Product_line`, 
     `Retailer_site`.`Region`
 
 

;



-- id: 19106
SELECT     `T4`.`product_line_en`, 
     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `SLS_PRODUCT_DIM`.`base_product_key`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T4` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T4`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC, 
     `SLS_PRODUCT_DIM`.`base_product_key` ASC
 
 
     `MRK_ADV_FACT`.`base_product_key`, 
     `MRK_ADV_FACT`.`adv_direct_mail`, 
     `MRK_ADV_FACT`.`adv_email`, 
     `MRK_ADV_FACT`.`adv_magazine`, 
     `MRK_ADV_FACT`.`adv_other`, 
     `MRK_ADV_FACT`.`adv_radio`, 
     `MRK_ADV_FACT`.`adv_sponsorships`, 
     `MRK_ADV_FACT`.`adv_television`, 
     `GO_TIME_DIM0`.`current_year`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0`, 
     `gosalesdw1021`.`mrk_adv_fact` `MRK_ADV_FACT` 
 WHERE 
     `GO_TIME_DIM0`.`current_year` = `MRK_ADV_FACT`.`current_year` 
 ORDER BY 
     `MRK_ADV_FACT`.`base_product_key` ASC
     `MRK_ADV_FACT`.`base_product_key`, 
     `MRK_ADV_FACT`.`adv_direct_mail`, 
     `MRK_ADV_FACT`.`adv_email`, 
     `MRK_ADV_FACT`.`adv_magazine`, 
     `MRK_ADV_FACT`.`adv_other`, 
     `MRK_ADV_FACT`.`adv_radio`, 
     `MRK_ADV_FACT`.`adv_sponsorships`, 
     `MRK_ADV_FACT`.`adv_television`, 
     `GO_TIME_DIM0`.`current_year`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0`, 
     `gosalesdw1021`.`mrk_adv_fact` `MRK_ADV_FACT` 
 WHERE 
     `GO_TIME_DIM0`.`current_year` = `MRK_ADV_FACT`.`current_year` 
 ORDER BY 
     `MRK_ADV_FACT`.`base_product_key` ASC
 
 

;



-- id: 19236
SELECT     `Product`.`Product_line` AS `Product_line`, 
     MIN(`GO_TIME_DIM0`.`current_year`) AS `Year0`
 FROM
     `gosalesdw1021`.`dist_inventory_fact` `T12` JOIN 
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` ON `T12`.`month_key` = `GO_TIME_DIM0`.`month_key` JOIN 
         (
         SELECT
             `T81`.`product_line_en` AS `Product_line`, 
             `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
         FROM
             `gosalesdw1021`.`sls_product_brand_lookup` `T51` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T51`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T71`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T81`.`product_line_code` JOIN 
                         (
                         SELECT
                             `T31`.`product_number` AS `product_number`
                         FROM
                             `gosalesdw1021`.`sls_product_lookup` `T31` 
                         WHERE 
                             `T31`.`product_language` = 'EN'
                         ) `T21` ON `SLS_PRODUCT_DIM`.`product_number` = `T21`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T91` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T91`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T101` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T101`.`product_type_code`
         ) `Product` ON `T12`.`product_key` = `Product`.`Product_key` 
 GROUP BY 
     `Product`.`Product_line`
 
 

;



-- id: 19278
SELECT     `T41`.`product_line_en`, 
     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `SLS_PRODUCT_DIM`.`base_product_key`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T41` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T41`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC, 
     `SLS_PRODUCT_DIM`.`base_product_key` ASC
 
 
     `MRK_ADV_FACT`.`base_product_key`, 
     `GO_TIME_DIM0`.`current_year`, 
     `MRK_ADV_FACT`.`adv_television`, 
     `MRK_ADV_FACT`.`adv_radio`, 
     `MRK_ADV_FACT`.`adv_sponsorships`, 
     `MRK_ADV_FACT`.`adv_direct_mail`, 
     `MRK_ADV_FACT`.`adv_email`, 
     `MRK_ADV_FACT`.`adv_magazine`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0`, 
     `gosalesdw1021`.`mrk_adv_fact` `MRK_ADV_FACT` 
 WHERE 
     `GO_TIME_DIM0`.`current_year` = `MRK_ADV_FACT`.`current_year` 
 ORDER BY 
     `MRK_ADV_FACT`.`base_product_key` ASC
     `MRK_ADV_FACT`.`base_product_key`, 
     `GO_TIME_DIM0`.`current_year`, 
     `MRK_ADV_FACT`.`adv_television`, 
     `MRK_ADV_FACT`.`adv_radio`, 
     `MRK_ADV_FACT`.`adv_sponsorships`, 
     `MRK_ADV_FACT`.`adv_direct_mail`, 
     `MRK_ADV_FACT`.`adv_email`, 
     `MRK_ADV_FACT`.`adv_magazine`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0`, 
     `gosalesdw1021`.`mrk_adv_fact` `MRK_ADV_FACT` 
 WHERE 
     `GO_TIME_DIM0`.`current_year` = `MRK_ADV_FACT`.`current_year` 
 ORDER BY 
     `MRK_ADV_FACT`.`base_product_key` ASC
 
 

;



-- id: 19388
SELECT     `Product`.`Product_line` AS `Product_line`, 
     SUM(`SLS_SALES_FACT`.`unit_cost` * `SLS_SALES_FACT`.`quantity`) AS `Product_cost`
 FROM
     (
     SELECT
         `T61`.`product_line_en` AS `Product_line`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T8` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T8`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 GROUP BY 
     `Product`.`Product_line`
 
 

;



-- id: 19510
SELECT     `Product`.`Product_line` AS `Product_line`, 
     `GO_TIME_DIM`.`month_en` AS `Month0`, 
     SUM(`SLS_SALES_FACT`.`unit_cost` * `SLS_SALES_FACT`.`quantity`) AS `Product_cost`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
         (
         SELECT
             `T61`.`product_line_en` AS `Product_line`, 
             `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
         FROM
             `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                         (
                         SELECT
                             `T11`.`product_number` AS `product_number`
                         FROM
                             `gosalesdw1021`.`sls_product_lookup` `T11` 
                         WHERE 
                             `T11`.`product_language` = 'EN'
                         ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T8` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T8`.`product_type_code`
         ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 GROUP BY 
     `Product`.`Product_line`, 
     `GO_TIME_DIM`.`month_en`
 
 

;



-- id: 19542
SELECT     `GO_TIME_DIM`.`month_key` AS `Month_key`, 
     `T3`.`order_method_en` AS `Order_method_type`, 
     AVG((`SLS_SALES_FACT`.`sale_total` - `SLS_SALES_FACT`.`unit_cost` * `SLS_SALES_FACT`.`quantity`) / CASE WHEN `SLS_SALES_FACT`.`sale_total` = 0 THEN NULL ELSE `SLS_SALES_FACT`.`sale_total` END) AS `Gross_margin____`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`sls_order_method_dim` `T3` ON `SLS_SALES_FACT`.`order_method_key` = `T3`.`order_method_key` 
 GROUP BY 
     `GO_TIME_DIM`.`month_key`, 
     `T3`.`order_method_en`
 
 

;



-- id: 19574
SELECT     `T21`.`campaign_name_en` AS `Campaign_name`, 
     SUM(`T3`.`sale_total`) AS `Revenue`, 
     SUM(`T3`.`gross_profit`) AS `Gross_profit`
 FROM
     `gosalesdw1021`.`mrk_promotion_dim` `MRK_PROMOTION_DIM` JOIN `gosalesdw1021`.`mrk_campaign_lookup` `T21` ON `MRK_PROMOTION_DIM`.`campaign_code` = `T21`.`campaign_code` JOIN `gosalesdw1021`.`mrk_promotion_fact` `T3` ON `MRK_PROMOTION_DIM`.`promotion_key` = `T3`.`promotion_key` 
 GROUP BY 
     `T21`.`campaign_name_en`
 
 

;



-- id: 19638
SELECT     `T21`.`campaign_name_en` AS `Campaign_name`, 
     SUM(`T31`.`sale_total`) AS `Promotion_revenue`
 FROM
     `gosalesdw1021`.`mrk_promotion_dim` `MRK_PROMOTION_DIM` JOIN `gosalesdw1021`.`mrk_campaign_lookup` `T21` ON `MRK_PROMOTION_DIM`.`campaign_code` = `T21`.`campaign_code` JOIN `gosalesdw1021`.`mrk_promotion_fact` `T31` ON `MRK_PROMOTION_DIM`.`promotion_key` = `T31`.`promotion_key` 
 GROUP BY 
     `T21`.`campaign_name_en`
 
 
     `T71`.`campaign_name_en` AS `Campaign_name`, 
     SUM(`T8`.`promotion_plan_revenue`) AS `Promotion_plan_revenue`
 FROM
     `gosalesdw1021`.`mrk_promotion_dim` `MRK_PROMOTION_DIM` JOIN `gosalesdw1021`.`mrk_campaign_lookup` `T71` ON `MRK_PROMOTION_DIM`.`campaign_code` = `T71`.`campaign_code` JOIN `gosalesdw1021`.`mrk_promotion_plan_fact` `T8` ON `MRK_PROMOTION_DIM`.`promotion_key` = `T8`.`promotion_key` 
 GROUP BY 
     `T71`.`campaign_name_en`
     `T71`.`campaign_name_en` AS `Campaign_name`, 
     SUM(`T8`.`promotion_plan_revenue`) AS `Promotion_plan_revenue`
 FROM
     `gosalesdw1021`.`mrk_promotion_dim` `MRK_PROMOTION_DIM` JOIN `gosalesdw1021`.`mrk_campaign_lookup` `T71` ON `MRK_PROMOTION_DIM`.`campaign_code` = `T71`.`campaign_code` JOIN `gosalesdw1021`.`mrk_promotion_plan_fact` `T8` ON `MRK_PROMOTION_DIM`.`promotion_key` = `T8`.`promotion_key` 
 GROUP BY 
     `T71`.`campaign_name_en`
 
 

;



-- id: 19646
SELECT     `T1`.`campaign_name_en` AS `Campaign_name`
 FROM
     `gosalesdw1021`.`mrk_campaign_lookup` `T1` 
 GROUP BY 
     `T1`.`campaign_name_en`
 
 

;



-- id: 19666
SELECT     `GO_BRANCH_DIM`.`city` AS `City`, 
     AVG(`T1`.`days_to_fill`) AS `Days_to_fill`
 FROM
     `gosalesdw1021`.`emp_recruitment_fact` `T1` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `T1`.`branch_key` = `GO_BRANCH_DIM`.`branch_key` 
 GROUP BY 
     `GO_BRANCH_DIM`.`city`
 
 

;



-- id: 19698
SELECT     `GO_TIME_DIM`.`current_year` AS `Year0`, 
     `T3`.`recruitment_type_en` AS `Recruitment_type`, 
     AVG(`T11`.`days_to_fill`) AS `Days_to_fill`
 FROM
     `gosalesdw1021`.`emp_recruitment_fact` `T11` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T11`.`post_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_recruitment_dim` `T3` ON `T3`.`recruitment_medium_key` = `T11`.`recruitment_medium_key` 
 GROUP BY 
     `GO_TIME_DIM`.`current_year`, 
     `T3`.`recruitment_type_en`
 
 

;



-- id: 19863
SELECT     `T51`.`Organization_name__level_1_` AS `Organization_name__level_1_`, 
     `T81`.`Position_name__level_3_` AS `Position_department__level_3_`, 
     SUM(`T101`.`position_count`) AS `Position_count`, 
     SUM(`T101`.`planned_position_count`) AS `Planned_position_count`
 FROM
     `gosalesdw1021`.`emp_position_summary_fact` `T101` JOIN 
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
     ) `T01` ON `T101`.`organization_key` = `T01`.`organization_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T101`.`position_key` = `EMP_POSITION_DIM`.`position_key` JOIN 
             (
             SELECT
                 `T31`.`Organization_name__level_5_` AS `Organization_name__level_1_`, 
                 `T31`.`Organization_code__level_5_` AS `Organization_code__level_1_`
             FROM
                 (
                 SELECT
                     `T41`.`organization_name_en` AS `Organization_name__level_5_`, 
                     `T41`.`organization_code` AS `Organization_code__level_5_`
                 FROM
                     `gosalesdw1021`.`go_org_name_lookup` `T41`
                 ) `T31` 
             WHERE 
                 `T31`.`Organization_code__level_5_` IN ( 
                     'GOAMX', 
                     'GOCEU', 
                     'GOEAX', 
                     'GOEUX', 
                     'GONEU', 
                     'GOSEU' )
             ) `T51` ON `T51`.`Organization_code__level_1_` = `T01`.`organization_code1` JOIN 
                 (
                 SELECT
                     `T71`.`position_en` AS `Position_name__level_3_`, 
                     `T71`.`position_code` AS `Position_code__level_3_`
                 FROM
                     `gosalesdw1021`.`emp_position_lookup` `T71`
                 ) `T81` ON `EMP_POSITION_DIM`.`position_code3` = `T81`.`Position_code__level_3_` 
 WHERE 
     `EMP_POSITION_DIM`.`position_code3` < 1000 AND
     NOT ( `T01`.`organization_code1` IN ( 
         'GOEUX' ) ) 
 GROUP BY 
     `T51`.`Organization_name__level_1_`, 
     `T81`.`Position_name__level_3_`
 
 
     `T51`.`Organization_name__level_1_` AS `Organization_name__level_1_`, 
     `T81`.`Position_name__level_3_` AS `Position_department__level_3_`, 
     AVG(`T14`.`days_to_fill`) AS `Days_to_fill`
 FROM
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
     ) `T01` JOIN `gosalesdw1021`.`emp_recruitment_fact` `T14` ON `T01`.`organization_key` = `T14`.`organization_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T14`.`position_key` = `EMP_POSITION_DIM`.`position_key` JOIN 
             (
             SELECT
                 `T31`.`Organization_name__level_5_` AS `Organization_name__level_1_`, 
                 `T31`.`Organization_code__level_5_` AS `Organization_code__level_1_`
             FROM
                 (
                 SELECT
                     `T41`.`organization_name_en` AS `Organization_name__level_5_`, 
                     `T41`.`organization_code` AS `Organization_code__level_5_`
                 FROM
                     `gosalesdw1021`.`go_org_name_lookup` `T41`
                 ) `T31` 
             WHERE 
                 `T31`.`Organization_code__level_5_` IN ( 
                     'GOAMX', 
                     'GOCEU', 
                     'GOEAX', 
                     'GOEUX', 
                     'GONEU', 
                     'GOSEU' )
             ) `T51` ON `T51`.`Organization_code__level_1_` = `T01`.`organization_code1` JOIN 
                 (
                 SELECT
                     `T71`.`position_en` AS `Position_name__level_3_`, 
                     `T71`.`position_code` AS `Position_code__level_3_`
                 FROM
                     `gosalesdw1021`.`emp_position_lookup` `T71`
                 ) `T81` ON `EMP_POSITION_DIM`.`position_code3` = `T81`.`Position_code__level_3_` 
 WHERE 
     `EMP_POSITION_DIM`.`position_code3` < 1000 AND
     NOT ( `T01`.`organization_code1` IN ( 
         'GOEUX' ) ) 
 GROUP BY 
     `T51`.`Organization_name__level_1_`, 
     `T81`.`Position_name__level_3_`
     `T51`.`Organization_name__level_1_` AS `Organization_name__level_1_`, 
     `T81`.`Position_name__level_3_` AS `Position_department__level_3_`, 
     AVG(`T14`.`days_to_fill`) AS `Days_to_fill`
 FROM
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
     ) `T01` JOIN `gosalesdw1021`.`emp_recruitment_fact` `T14` ON `T01`.`organization_key` = `T14`.`organization_key` JOIN `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` ON `T14`.`position_key` = `EMP_POSITION_DIM`.`position_key` JOIN 
             (
             SELECT
                 `T31`.`Organization_name__level_5_` AS `Organization_name__level_1_`, 
                 `T31`.`Organization_code__level_5_` AS `Organization_code__level_1_`
             FROM
                 (
                 SELECT
                     `T41`.`organization_name_en` AS `Organization_name__level_5_`, 
                     `T41`.`organization_code` AS `Organization_code__level_5_`
                 FROM
                     `gosalesdw1021`.`go_org_name_lookup` `T41`
                 ) `T31` 
             WHERE 
                 `T31`.`Organization_code__level_5_` IN ( 
                     'GOAMX', 
                     'GOCEU', 
                     'GOEAX', 
                     'GOEUX', 
                     'GONEU', 
                     'GOSEU' )
             ) `T51` ON `T51`.`Organization_code__level_1_` = `T01`.`organization_code1` JOIN 
                 (
                 SELECT
                     `T71`.`position_en` AS `Position_name__level_3_`, 
                     `T71`.`position_code` AS `Position_code__level_3_`
                 FROM
                     `gosalesdw1021`.`emp_position_lookup` `T71`
                 ) `T81` ON `EMP_POSITION_DIM`.`position_code3` = `T81`.`Position_code__level_3_` 
 WHERE 
     `EMP_POSITION_DIM`.`position_code3` < 1000 AND
     NOT ( `T01`.`organization_code1` IN ( 
         'GOEUX' ) ) 
 GROUP BY 
     `T51`.`Organization_name__level_1_`, 
     `T81`.`Position_name__level_3_`
 
 

;



-- id: 19910
SELECT     `T21`.`Position_name__level_3_` AS `Position_department__level_3_`, 
     `T6`.`recruitment_type_en` AS `Recruitment_type`, 
     AVG(`T51`.`days_to_fill`) AS `Days_to_fill`
 FROM
     `gosalesdw1021`.`emp_position_dim` `EMP_POSITION_DIM` JOIN 
     (
     SELECT
         `T11`.`position_en` AS `Position_name__level_3_`, 
         `T11`.`position_code` AS `Position_code__level_3_`
     FROM
         `gosalesdw1021`.`emp_position_lookup` `T11`
     ) `T21` ON `EMP_POSITION_DIM`.`position_code3` = `T21`.`Position_code__level_3_` JOIN `gosalesdw1021`.`emp_recruitment_fact` `T51` ON `T51`.`position_key` = `EMP_POSITION_DIM`.`position_key` JOIN `gosalesdw1021`.`emp_recruitment_dim` `T6` ON `T6`.`recruitment_medium_key` = `T51`.`recruitment_medium_key` 
 WHERE 
     `EMP_POSITION_DIM`.`position_code3` < 1000 
 GROUP BY 
     `T21`.`Position_name__level_3_`, 
     `T6`.`recruitment_type_en`
 
 

;



-- id: 19955
SELECT     `GO_REGION_DIM`.`region_en` AS `Region`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue`, 
     SUM(`SLS_SALES_FACT`.`unit_price` * `SLS_SALES_FACT`.`quantity`) AS `Planned_revenue`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `SLS_SALES_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` 
 GROUP BY 
     `GO_REGION_DIM`.`region_en`
 
 

;



-- id: 19963
SELECT     `GO_REGION_DIM`.`region_en` AS `Region`
 FROM
     `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` 
 GROUP BY 
     `GO_REGION_DIM`.`region_en`
 
 

;



-- id: 20008
SELECT     `GO_REGION_DIM`.`region_en` AS `Branch_region`, 
     SUM(`T5`.`sales_target`) AS `Sales_target`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`sls_sales_targ_fact` `T5` ON `T5`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` 
 GROUP BY 
     `GO_REGION_DIM`.`region_en`
 
 

;



-- id: 20098
SELECT     `GO_REGION_DIM`.`region_en` AS `Branch_region`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `SLS_SALES_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` 
 GROUP BY 
     `GO_REGION_DIM`.`region_en`
 
 
     `GO_REGION_DIM`.`region_en` AS `Branch_region`, 
     SUM(`T9`.`sales_target`) AS `Sales_target`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`sls_sales_targ_fact` `T9` ON `T9`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` 
 GROUP BY 
     `GO_REGION_DIM`.`region_en`
     `GO_REGION_DIM`.`region_en` AS `Branch_region`, 
     SUM(`T9`.`sales_target`) AS `Sales_target`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`sls_sales_targ_fact` `T9` ON `T9`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` 
 GROUP BY 
     `GO_REGION_DIM`.`region_en`
 
 

;



-- id: 20143
SELECT     `GO_REGION_DIM`.`country_en` AS `Country`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `SLS_SALES_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` 
 GROUP BY 
     `GO_REGION_DIM`.`country_en`
 
 

;



-- id: 20253
SELECT     `Product`.`Product_type` AS `Product_type`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue`
 FROM
     (
     SELECT
         `T8`.`product_type_en` AS `Product_type`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T8` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T8`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 GROUP BY 
     `Product`.`Product_type`
 
 

;



-- id: 20273
SELECT     `T2`.`order_method_en` AS `Order_method_type`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`sls_order_method_dim` `T2` ON `SLS_SALES_FACT`.`order_method_key` = `T2`.`order_method_key` 
 GROUP BY 
     `T2`.`order_method_en`
 
 

;



-- id: 20383
SELECT     `Product`.`Product_line` AS `Product_line`, 
     SUM(`SLS_SALES_FACT`.`unit_price` * `SLS_SALES_FACT`.`quantity`) AS `Planned_revenue`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue`
 FROM
     (
     SELECT
         `T61`.`product_line_en` AS `Product_line`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T8` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T8`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 GROUP BY 
     `Product`.`Product_line`
 
 

;



-- id: 20618
SELECT     `T41`.`product_line_en`, 
     `T51`.`product_type_en`, 
     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `SLS_PRODUCT_DIM`.`product_type_key`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T41` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T41`.`product_line_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T51`.`product_type_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC, 
     `SLS_PRODUCT_DIM`.`product_type_key` ASC
 
 
     `T81`.`product_type_key`, 
     `EMP_EMPLOYEE_DIM`.`employee_name`, 
     `T81`.`sales_target`
 FROM
     `gosalesdw1021`.`go_org_dim` `T71`, 
     `gosalesdw1021`.`sls_sales_targ_fact` `T81`, 
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM`, 
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 WHERE 
     `GO_TIME_DIM0`.`current_year` IN ( 
         2013 ) AND
     `T71`.`organization_code4` IN ( 
         'GONEUOP', 
         'GONEUCP' ) AND
     `GO_TIME_DIM0`.`quarter_key` = 20131 AND
     `T71`.`organization_key` = `T81`.`organization_key` AND
     `T81`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` AND
     `T81`.`month_key` = `GO_TIME_DIM0`.`month_key` 
 ORDER BY 
     `T81`.`product_type_key` ASC
     `T81`.`product_type_key`, 
     `EMP_EMPLOYEE_DIM`.`employee_name`, 
     `T81`.`sales_target`
 FROM
     `gosalesdw1021`.`go_org_dim` `T71`, 
     `gosalesdw1021`.`sls_sales_targ_fact` `T81`, 
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM`, 
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 WHERE 
     `GO_TIME_DIM0`.`current_year` IN ( 
         2013 ) AND
     `T71`.`organization_code4` IN ( 
         'GONEUOP', 
         'GONEUCP' ) AND
     `GO_TIME_DIM0`.`quarter_key` = 20131 AND
     `T71`.`organization_key` = `T81`.`organization_key` AND
     `T81`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` AND
     `T81`.`month_key` = `GO_TIME_DIM0`.`month_key` 
 ORDER BY 
     `T81`.`product_type_key` ASC
 
 
     `EMP_EMPLOYEE_DIM`.`employee_name` AS `Employee_name`, 
     `Product2`.`Product_line` AS `Product_line`, 
     `Product2`.`Product_type` AS `Product_type`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Total_Variance_`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` ON `SLS_SALES_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_org_dim` `T24` ON `SLS_SALES_FACT`.`organization_key` = `T24`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
                 (
                 SELECT
                     `T181`.`product_line_en` AS `Product_line`, 
                     `T201`.`product_type_en` AS `Product_type`, 
                     `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
                 FROM
                     `gosalesdw1021`.`sls_product_brand_lookup` `T151` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T151`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T171` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T171`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T181` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T181`.`product_line_code` JOIN 
                                 (
                                 SELECT
                                     `T131`.`product_number` AS `product_number`
                                 FROM
                                     `gosalesdw1021`.`sls_product_lookup` `T131` 
                                 WHERE 
                                     `T131`.`product_language` = 'EN'
                                 ) `T121` ON `SLS_PRODUCT_DIM`.`product_number` = `T121`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T191` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T191`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T201` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T201`.`product_type_code`
                 ) `Product2` ON `Product2`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     `GO_TIME_DIM`.`quarter_key` = 20131 AND
     `T24`.`organization_code4` IN ( 
         'GONEUOP', 
         'GONEUCP' ) AND
     `GO_TIME_DIM`.`current_year` IN ( 
         2013 ) 
 GROUP BY 
     `EMP_EMPLOYEE_DIM`.`employee_name`, 
     `Product2`.`Product_line`, 
     `Product2`.`Product_type`
     `EMP_EMPLOYEE_DIM`.`employee_name` AS `Employee_name`, 
     `Product2`.`Product_line` AS `Product_line`, 
     `Product2`.`Product_type` AS `Product_type`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Total_Variance_`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` ON `SLS_SALES_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_org_dim` `T24` ON `SLS_SALES_FACT`.`organization_key` = `T24`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
                 (
                 SELECT
                     `T181`.`product_line_en` AS `Product_line`, 
                     `T201`.`product_type_en` AS `Product_type`, 
                     `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
                 FROM
                     `gosalesdw1021`.`sls_product_brand_lookup` `T151` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T151`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T171` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T171`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T181` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T181`.`product_line_code` JOIN 
                                 (
                                 SELECT
                                     `T131`.`product_number` AS `product_number`
                                 FROM
                                     `gosalesdw1021`.`sls_product_lookup` `T131` 
                                 WHERE 
                                     `T131`.`product_language` = 'EN'
                                 ) `T121` ON `SLS_PRODUCT_DIM`.`product_number` = `T121`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T191` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T191`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T201` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T201`.`product_type_code`
                 ) `Product2` ON `Product2`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     `GO_TIME_DIM`.`quarter_key` = 20131 AND
     `T24`.`organization_code4` IN ( 
         'GONEUOP', 
         'GONEUCP' ) AND
     `GO_TIME_DIM`.`current_year` IN ( 
         2013 ) 
 GROUP BY 
     `EMP_EMPLOYEE_DIM`.`employee_name`, 
     `Product2`.`Product_line`, 
     `Product2`.`Product_type`
 
 

;



-- id: 20729
SELECT     `GO_TIME_DIM`.`day_key` AS `Day_key`, 
     `T61`.`organization_code1` AS `Organization_code__level_1_`, 
     `T61`.`organization_code2` AS `Organization_code__level_2_`, 
     `T61`.`organization_code3` AS `Organization_code__level_3_`, 
     `T61`.`organization_code4` AS `Organization_code__level_4_`, 
     `T61`.`organization_key` AS `Organization_key`, 
     `T8`.`organization_name_en` AS `Organization_name`, 
     `EMP_EMPLOYEE_DIM`.`employee_key` AS `Employee_key`, 
     `GO_REGION_DIM`.`region_code` AS `Region_code`, 
     `GO_REGION_DIM`.`country_code` AS `Country_code`, 
     `T41`.`expense_group_code` AS `Expense_group_code`, 
     `T41`.`expense_type_code` AS `Expenses_type_code`, 
     SUM(`EMP_EXPENSE_FACT`.`expense_total`) AS `Health_Insurance`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`emp_expense_fact` `EMP_EXPENSE_FACT` ON `EMP_EXPENSE_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`emp_expense_type_dim` `T41` ON `EMP_EXPENSE_FACT`.`expense_type_key` = `T41`.`expense_type_key` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` JOIN `gosalesdw1021`.`go_org_dim` `T61` ON `EMP_EXPENSE_FACT`.`organization_key` = `T61`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_EXPENSE_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`go_org_name_lookup` `T8` ON `T61`.`organization_code` = `T8`.`organization_code` 
 WHERE 
     `T41`.`expense_type_code` = 23 
 GROUP BY 
     `GO_TIME_DIM`.`day_key`, 
     `T61`.`organization_code1`, 
     `T61`.`organization_code2`, 
     `T61`.`organization_code3`, 
     `T61`.`organization_code4`, 
     `T61`.`organization_key`, 
     `T8`.`organization_name_en`, 
     `EMP_EMPLOYEE_DIM`.`employee_key`, 
     `GO_REGION_DIM`.`region_code`, 
     `GO_REGION_DIM`.`country_code`, 
     `T41`.`expense_group_code`, 
     `T41`.`expense_type_code`
 
 
 org.apache.tez.dag.api.SessionNotRunning: Application not running, applicationId=application_1433434842480_0011, yarnApplicationState=FINISHED, finalApplicationStatus=SUCCEEDED, trackingUrl=http://drv-hdpc3.ottawa.ibm.com:8088/proxy/application_1433434842480_0011/, diagnostics=Session stats:submittedDAGs=364, successfulDAGs=363, failedDAGs=1, killedDAGs=0
 
 	at org.apache.tez.client.TezClientUtils.getSessionAMProxy(TezClientUtils.java:798)
 	at org.apache.tez.client.TezClient.getSessionAMProxy(TezClient.java:633)
 	at org.apache.tez.client.TezClient.stop(TezClient.java:440)
 	at org.apache.hadoop.hive.ql.exec.tez.TezSessionState.close(TezSessionState.java:265)
 	at org.apache.hadoop.hive.ql.exec.tez.TezSessionPoolManager.close(TezSessionPoolManager.java:176)
 	at org.apache.hadoop.hive.ql.exec.tez.TezSessionPoolManager.closeAndOpen(TezSessionPoolManager.java:282)
 	at org.apache.hadoop.hive.ql.exec.tez.TezTask.submit(TezTask.java:381)
 	at org.apache.hadoop.hive.ql.exec.tez.TezTask.execute(TezTask.java:162)
 	at org.apache.hadoop.hive.ql.exec.Task.executeTask(Task.java:160)
 	at org.apache.hadoop.hive.ql.exec.TaskRunner.runSequential(TaskRunner.java:85)
 	at org.apache.hadoop.hive.ql.Driver.launchTask(Driver.java:1606)
 	at org.apache.hadoop.hive.ql.Driver.execute(Driver.java:1367)
 	at org.apache.hadoop.hive.ql.Driver.runInternal(Driver.java:1179)
 	at org.apache.hadoop.hive.ql.Driver.run(Driver.java:1006)
 	at org.apache.hadoop.hive.ql.Driver.run(Driver.java:1001)
 	at org.apache.hive.service.cli.operation.SQLOperation.runQuery(SQLOperation.java:153)
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



-- id: 20823
SELECT     `GO_TIME_DIM`.`day_key` AS `Day_key`, 
     `T6`.`organization_code1` AS `Organization_code__level_1_`, 
     `T6`.`organization_code2` AS `Organization_code__level_2_`, 
     `T6`.`organization_code3` AS `Organization_code__level_3_`, 
     `T6`.`organization_code4` AS `Organization_code__level_4_`, 
     `T6`.`organization_key` AS `Organization_key`, 
     `EMP_EMPLOYEE_DIM`.`employee_key` AS `Employee_key`, 
     `GO_REGION_DIM`.`region_code` AS `Region_code`, 
     `GO_REGION_DIM`.`country_code` AS `Country_code`, 
     `T41`.`expense_group_code` AS `Expense_group_code`, 
     `T41`.`expense_type_code` AS `Expense_type_code`, 
     SUM(`EMP_EXPENSE_FACT`.`expense_total`) AS `Pension_Plan`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`emp_expense_fact` `EMP_EXPENSE_FACT` ON `EMP_EXPENSE_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`emp_expense_type_dim` `T41` ON `EMP_EXPENSE_FACT`.`expense_type_key` = `T41`.`expense_type_key` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` JOIN `gosalesdw1021`.`go_org_dim` `T6` ON `EMP_EXPENSE_FACT`.`organization_key` = `T6`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_EXPENSE_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` 
 WHERE 
     `T41`.`expense_type_code` = 21 
 GROUP BY 
     `GO_TIME_DIM`.`day_key`, 
     `T6`.`organization_code1`, 
     `T6`.`organization_code2`, 
     `T6`.`organization_code3`, 
     `T6`.`organization_code4`, 
     `T6`.`organization_key`, 
     `EMP_EMPLOYEE_DIM`.`employee_key`, 
     `GO_REGION_DIM`.`region_code`, 
     `GO_REGION_DIM`.`country_code`, 
     `T41`.`expense_group_code`, 
     `T41`.`expense_type_code`
 
 

;



-- id: 20917
SELECT     `GO_TIME_DIM`.`day_key` AS `Day_key`, 
     `T6`.`organization_code1` AS `Organization_code__level_1_`, 
     `T6`.`organization_code2` AS `Organization_code__level_2_`, 
     `T6`.`organization_code3` AS `Organization_code__level_3_`, 
     `T6`.`organization_code4` AS `Organization_code__level_4_`, 
     `T6`.`organization_key` AS `Organization_key`, 
     `EMP_EMPLOYEE_DIM`.`employee_key` AS `Employee_key`, 
     `GO_REGION_DIM`.`region_code` AS `Region_code`, 
     `GO_REGION_DIM`.`country_code` AS `Country_code`, 
     `T41`.`expense_group_code` AS `Expense_group_code`, 
     `T41`.`expense_type_key` AS `Expense_type_key`, 
     `T41`.`expense_type_code` AS `Expense_type_code`, 
     SUM(`EMP_EXPENSE_FACT`.`expense_total`) AS `Regular_Salary`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`emp_expense_fact` `EMP_EXPENSE_FACT` ON `EMP_EXPENSE_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`emp_expense_type_dim` `T41` ON `EMP_EXPENSE_FACT`.`expense_type_key` = `T41`.`expense_type_key` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` JOIN `gosalesdw1021`.`go_org_dim` `T6` ON `EMP_EXPENSE_FACT`.`organization_key` = `T6`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_EXPENSE_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` 
 WHERE 
     `T41`.`expense_type_code` = 32 
 GROUP BY 
     `GO_TIME_DIM`.`day_key`, 
     `T6`.`organization_code1`, 
     `T6`.`organization_code2`, 
     `T6`.`organization_code3`, 
     `T6`.`organization_code4`, 
     `T6`.`organization_key`, 
     `EMP_EMPLOYEE_DIM`.`employee_key`, 
     `GO_REGION_DIM`.`region_code`, 
     `GO_REGION_DIM`.`country_code`, 
     `T41`.`expense_group_code`, 
     `T41`.`expense_type_key`, 
     `T41`.`expense_type_code`
 
 

;



-- id: 20935
SELECT     `T2`.`product_line_en`, 
     `SLS_PRODUCT_DIM`.`product_line_code`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 21097
SELECT     `T71`.`base_product_key`, 
     `T71`.`expected_volume`
 FROM
     `gosalesdw1021`.`dist_product_forecast_fact` `T71` 
 ORDER BY 
     `T71`.`base_product_key` ASC
 
 
     `T51`.`product_type_en`, 
     `T01`.`product_name`, 
     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T41`.`product_line_en`, 
     `SLS_PRODUCT_DIM`.`product_type_key`, 
     `SLS_PRODUCT_DIM`.`base_product_key`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T41` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T41`.`product_line_code` JOIN 
         (
         SELECT
             `T112`.`product_number` AS `product_number`, 
             `T112`.`product_name` AS `product_name`
         FROM
             `gosalesdw1021`.`sls_product_lookup` `T112` 
         WHERE 
             `T112`.`product_language` = 'EN'
         ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T51`.`product_type_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC, 
     `SLS_PRODUCT_DIM`.`product_type_key` ASC, 
     `SLS_PRODUCT_DIM`.`base_product_key` ASC
     `T51`.`product_type_en`, 
     `T01`.`product_name`, 
     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T41`.`product_line_en`, 
     `SLS_PRODUCT_DIM`.`product_type_key`, 
     `SLS_PRODUCT_DIM`.`base_product_key`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T41` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T41`.`product_line_code` JOIN 
         (
         SELECT
             `T112`.`product_number` AS `product_number`, 
             `T112`.`product_name` AS `product_name`
         FROM
             `gosalesdw1021`.`sls_product_lookup` `T112` 
         WHERE 
             `T112`.`product_language` = 'EN'
         ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T51`.`product_type_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC, 
     `SLS_PRODUCT_DIM`.`product_type_key` ASC, 
     `SLS_PRODUCT_DIM`.`base_product_key` ASC
 
 
     `Product2`.`Product_type` AS `Product_type`, 
     `Product2`.`Product_name` AS `Product_Name`, 
     `Product2`.`Product_size` AS `Product_size`, 
     `Product2`.`Product_color` AS `Product_color`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Actual_Revenue`, 
     SUM(`SLS_SALES_FACT`.`quantity`) AS `Quantity`
 FROM
     (
     SELECT
         `T14`.`product_type_en` AS `Product_type`, 
         `T01`.`product_name` AS `Product_name`, 
         `T131`.`product_size_en` AS `Product_size`, 
         `T111`.`product_color_en` AS `Product_color`, 
         `T121`.`product_line_en` AS `Product_line`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T91` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T91`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T111` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T111`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T121` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T121`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T112`.`product_number` AS `product_number`, 
                         `T112`.`product_name` AS `product_name`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T112` 
                     WHERE 
                         `T112`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T131` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T131`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T14` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T14`.`product_type_code`
     ) `Product2` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product2`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     `Product2`.`Product_line` = 'Camping Equipment' 
 GROUP BY 
     `Product2`.`Product_type`, 
     `Product2`.`Product_name`, 
     `Product2`.`Product_size`, 
     `Product2`.`Product_color`
     `Product2`.`Product_type` AS `Product_type`, 
     `Product2`.`Product_name` AS `Product_Name`, 
     `Product2`.`Product_size` AS `Product_size`, 
     `Product2`.`Product_color` AS `Product_color`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Actual_Revenue`, 
     SUM(`SLS_SALES_FACT`.`quantity`) AS `Quantity`
 FROM
     (
     SELECT
         `T14`.`product_type_en` AS `Product_type`, 
         `T01`.`product_name` AS `Product_name`, 
         `T131`.`product_size_en` AS `Product_size`, 
         `T111`.`product_color_en` AS `Product_color`, 
         `T121`.`product_line_en` AS `Product_line`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T91` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T91`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T111` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T111`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T121` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T121`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T112`.`product_number` AS `product_number`, 
                         `T112`.`product_name` AS `product_name`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T112` 
                     WHERE 
                         `T112`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T131` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T131`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T14` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T14`.`product_type_code`
     ) `Product2` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product2`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     `Product2`.`Product_line` = 'Camping Equipment' 
 GROUP BY 
     `Product2`.`Product_type`, 
     `Product2`.`Product_name`, 
     `Product2`.`Product_size`, 
     `Product2`.`Product_color`
 
 

;



-- id: 21214
SELECT     `T71`.`base_product_key`, 
     `T71`.`expected_volume`
 FROM
     `gosalesdw1021`.`dist_product_forecast_fact` `T71` 
 ORDER BY 
     `T71`.`base_product_key` ASC
 
 
 org.apache.tez.dag.api.SessionNotRunning: Application not running, applicationId=application_1433434842480_0015, yarnApplicationState=FINISHED, finalApplicationStatus=SUCCEEDED, trackingUrl=http://drv-hdpc3.ottawa.ibm.com:8088/proxy/application_1433434842480_0015/, diagnostics=Session stats:submittedDAGs=5, successfulDAGs=5, failedDAGs=0, killedDAGs=0
 
 	at org.apache.tez.client.TezClientUtils.getSessionAMProxy(TezClientUtils.java:798)
 	at org.apache.tez.client.TezClient.getSessionAMProxy(TezClient.java:633)
 	at org.apache.tez.client.TezClient.stop(TezClient.java:440)
 	at org.apache.hadoop.hive.ql.exec.tez.TezSessionState.close(TezSessionState.java:265)
 	at org.apache.hadoop.hive.ql.exec.tez.TezSessionPoolManager.close(TezSessionPoolManager.java:176)
 	at org.apache.hadoop.hive.ql.exec.tez.TezSessionPoolManager.closeAndOpen(TezSessionPoolManager.java:282)
 	at org.apache.hadoop.hive.ql.exec.tez.TezTask.submit(TezTask.java:381)
 	at org.apache.hadoop.hive.ql.exec.tez.TezTask.execute(TezTask.java:162)
 	at org.apache.hadoop.hive.ql.exec.Task.executeTask(Task.java:160)
 	at org.apache.hadoop.hive.ql.exec.TaskRunner.runSequential(TaskRunner.java:85)
 	at org.apache.hadoop.hive.ql.Driver.launchTask(Driver.java:1606)
 	at org.apache.hadoop.hive.ql.Driver.execute(Driver.java:1367)
 	at org.apache.hadoop.hive.ql.Driver.runInternal(Driver.java:1179)
 	at org.apache.hadoop.hive.ql.Driver.run(Driver.java:1006)
 	at org.apache.hadoop.hive.ql.Driver.run(Driver.java:1001)
 	at org.apache.hive.service.cli.operation.SQLOperation.runQuery(SQLOperation.java:153)
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
 
 
     `Product2`.`Product_type` AS `Product_type`, 
     `Product2`.`Product_name` AS `Product_Name`, 
     `Product2`.`Product_size` AS `Product_size`, 
     `Product2`.`Product_color` AS `Product_color`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Actual_Revenue`, 
     SUM(`SLS_SALES_FACT`.`quantity`) AS `Quantity`
 FROM
     (
     SELECT
         `T14`.`product_type_en` AS `Product_type`, 
         `T01`.`product_name` AS `Product_name`, 
         `T131`.`product_size_en` AS `Product_size`, 
         `T111`.`product_color_en` AS `Product_color`, 
         `T121`.`product_line_en` AS `Product_line`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T91` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T91`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T111` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T111`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T121` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T121`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T112`.`product_number` AS `product_number`, 
                         `T112`.`product_name` AS `product_name`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T112` 
                     WHERE 
                         `T112`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T131` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T131`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T14` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T14`.`product_type_code`
     ) `Product2` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product2`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     `Product2`.`Product_line` = 'Golf Equipment' 
 GROUP BY 
     `Product2`.`Product_type`, 
     `Product2`.`Product_name`, 
     `Product2`.`Product_size`, 
     `Product2`.`Product_color`
     `Product2`.`Product_type` AS `Product_type`, 
     `Product2`.`Product_name` AS `Product_Name`, 
     `Product2`.`Product_size` AS `Product_size`, 
     `Product2`.`Product_color` AS `Product_color`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Actual_Revenue`, 
     SUM(`SLS_SALES_FACT`.`quantity`) AS `Quantity`
 FROM
     (
     SELECT
         `T14`.`product_type_en` AS `Product_type`, 
         `T01`.`product_name` AS `Product_name`, 
         `T131`.`product_size_en` AS `Product_size`, 
         `T111`.`product_color_en` AS `Product_color`, 
         `T121`.`product_line_en` AS `Product_line`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T91` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T91`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T111` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T111`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T121` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T121`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T112`.`product_number` AS `product_number`, 
                         `T112`.`product_name` AS `product_name`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T112` 
                     WHERE 
                         `T112`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T131` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T131`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T14` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T14`.`product_type_code`
     ) `Product2` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product2`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     `Product2`.`Product_line` = 'Golf Equipment' 
 GROUP BY 
     `Product2`.`Product_type`, 
     `Product2`.`Product_name`, 
     `Product2`.`Product_size`, 
     `Product2`.`Product_color`
 
 
 org.apache.tez.dag.api.SessionNotRunning: Application not running, applicationId=application_1433434842480_0016, yarnApplicationState=FINISHED, finalApplicationStatus=SUCCEEDED, trackingUrl=http://drv-hdpc3.ottawa.ibm.com:8088/proxy/application_1433434842480_0016/, diagnostics=Session stats:submittedDAGs=1, successfulDAGs=1, failedDAGs=0, killedDAGs=0
 
 	at org.apache.tez.client.TezClientUtils.getSessionAMProxy(TezClientUtils.java:798)
 	at org.apache.tez.client.TezClient.getSessionAMProxy(TezClient.java:633)
 	at org.apache.tez.client.TezClient.stop(TezClient.java:440)
 	at org.apache.hadoop.hive.ql.exec.tez.TezSessionState.close(TezSessionState.java:265)
 	at org.apache.hadoop.hive.ql.exec.tez.TezSessionPoolManager.close(TezSessionPoolManager.java:176)
 	at org.apache.hadoop.hive.ql.exec.tez.TezSessionPoolManager.closeAndOpen(TezSessionPoolManager.java:282)
 	at org.apache.hadoop.hive.ql.exec.tez.TezTask.submit(TezTask.java:381)
 	at org.apache.hadoop.hive.ql.exec.tez.TezTask.execute(TezTask.java:162)
 	at org.apache.hadoop.hive.ql.exec.Task.executeTask(Task.java:160)
 	at org.apache.hadoop.hive.ql.exec.TaskRunner.runSequential(TaskRunner.java:85)
 	at org.apache.hadoop.hive.ql.Driver.launchTask(Driver.java:1606)
 	at org.apache.hadoop.hive.ql.Driver.execute(Driver.java:1367)
 	at org.apache.hadoop.hive.ql.Driver.runInternal(Driver.java:1179)
 	at org.apache.hadoop.hive.ql.Driver.run(Driver.java:1006)
 	at org.apache.hadoop.hive.ql.Driver.run(Driver.java:1001)
 	at org.apache.hive.service.cli.operation.SQLOperation.runQuery(SQLOperation.java:153)
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
 
 org.apache.tez.dag.api.SessionNotRunning: Application not running, applicationId=application_1433434842480_0017, yarnApplicationState=FINISHED, finalApplicationStatus=SUCCEEDED, trackingUrl=http://drv-hdpc3.ottawa.ibm.com:8088/proxy/application_1433434842480_0017/, diagnostics=Session stats:submittedDAGs=1, successfulDAGs=1, failedDAGs=0, killedDAGs=0
 
 	at org.apache.tez.client.TezClientUtils.getSessionAMProxy(TezClientUtils.java:798)
 	at org.apache.tez.client.TezClient.getSessionAMProxy(TezClient.java:633)
 	at org.apache.tez.client.TezClient.stop(TezClient.java:440)
 	at org.apache.hadoop.hive.ql.exec.tez.TezSessionState.close(TezSessionState.java:265)
 	at org.apache.hadoop.hive.ql.exec.tez.TezSessionPoolManager.close(TezSessionPoolManager.java:176)
 	at org.apache.hadoop.hive.ql.session.SessionState.close(SessionState.java:1256)
 	at org.apache.hive.service.cli.session.HiveSessionImpl.close(HiveSessionImpl.java:552)
 	at org.apache.hive.service.cli.session.HiveSessionImplwithUGI.close(HiveSessionImplwithUGI.java:104)
 	at sun.reflect.GeneratedMethodAccessor18.invoke(Unknown Source)
 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 	at java.lang.reflect.Method.invoke(Method.java:606)
 	at org.apache.hive.service.cli.session.HiveSessionProxy.invoke(HiveSessionProxy.java:79)
 	at org.apache.hive.service.cli.session.HiveSessionProxy.access$000(HiveSessionProxy.java:37)
 	at org.apache.hive.service.cli.session.HiveSessionProxy$1.run(HiveSessionProxy.java:64)
 	at java.security.AccessController.doPrivileged(Native Method)
 	at javax.security.auth.Subject.doAs(Subject.java:415)
 	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
 	at org.apache.hadoop.hive.shims.HadoopShimsSecure.doAs(HadoopShimsSecure.java:536)
 	at org.apache.hive.service.cli.session.HiveSessionProxy.invoke(HiveSessionProxy.java:60)
 	at com.sun.proxy.$Proxy25.close(Unknown Source)
 	at org.apache.hive.service.cli.session.SessionManager.closeSession(SessionManager.java:278)
 	at org.apache.hive.service.cli.CLIService.closeSession(CLIService.java:233)
 	at org.apache.hive.service.cli.thrift.ThriftCLIService.CloseSession(ThriftCLIService.java:368)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$CloseSession.getResult(TCLIService.java:1273)
 	at org.apache.hive.service.cli.thrift.TCLIService$Processor$CloseSession.getResult(TCLIService.java:1258)
 	at org.apache.thrift.ProcessFunction.process(ProcessFunction.java:39)
 	at org.apache.thrift.TBaseProcessor.process(TBaseProcessor.java:39)
 	at org.apache.hive.service.auth.TSetIpAddressProcessor.process(TSetIpAddressProcessor.java:56)
 	at org.apache.thrift.server.TThreadPoolServer$WorkerProcess.run(TThreadPoolServer.java:206)
 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
 	at java.lang.Thread.run(Thread.java:745)
 
 

;



-- id: 21331
SELECT     `T71`.`base_product_key`, 
     `T71`.`expected_volume`
 FROM
     `gosalesdw1021`.`dist_product_forecast_fact` `T71` 
 ORDER BY 
     `T71`.`base_product_key` ASC
 
 
     `Product2`.`Product_type` AS `Product_type`, 
     `Product2`.`Product_name` AS `Product_Name`, 
     `Product2`.`Product_size` AS `Product_size`, 
     `Product2`.`Product_color` AS `Product_color`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Actual_Revenue`, 
     SUM(`SLS_SALES_FACT`.`quantity`) AS `Quantity`
 FROM
     (
     SELECT
         `T14`.`product_type_en` AS `Product_type`, 
         `T01`.`product_name` AS `Product_name`, 
         `T131`.`product_size_en` AS `Product_size`, 
         `T111`.`product_color_en` AS `Product_color`, 
         `T121`.`product_line_en` AS `Product_line`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T91` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T91`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T111` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T111`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T121` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T121`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T112`.`product_number` AS `product_number`, 
                         `T112`.`product_name` AS `product_name`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T112` 
                     WHERE 
                         `T112`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T131` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T131`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T14` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T14`.`product_type_code`
     ) `Product2` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product2`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     `Product2`.`Product_line` = 'Mountaineering Equipment' 
 GROUP BY 
     `Product2`.`Product_type`, 
     `Product2`.`Product_name`, 
     `Product2`.`Product_size`, 
     `Product2`.`Product_color`
     `Product2`.`Product_type` AS `Product_type`, 
     `Product2`.`Product_name` AS `Product_Name`, 
     `Product2`.`Product_size` AS `Product_size`, 
     `Product2`.`Product_color` AS `Product_color`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Actual_Revenue`, 
     SUM(`SLS_SALES_FACT`.`quantity`) AS `Quantity`
 FROM
     (
     SELECT
         `T14`.`product_type_en` AS `Product_type`, 
         `T01`.`product_name` AS `Product_name`, 
         `T131`.`product_size_en` AS `Product_size`, 
         `T111`.`product_color_en` AS `Product_color`, 
         `T121`.`product_line_en` AS `Product_line`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T91` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T91`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T111` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T111`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T121` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T121`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T112`.`product_number` AS `product_number`, 
                         `T112`.`product_name` AS `product_name`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T112` 
                     WHERE 
                         `T112`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T131` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T131`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T14` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T14`.`product_type_code`
     ) `Product2` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product2`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     `Product2`.`Product_line` = 'Mountaineering Equipment' 
 GROUP BY 
     `Product2`.`Product_type`, 
     `Product2`.`Product_name`, 
     `Product2`.`Product_size`, 
     `Product2`.`Product_color`
 
 

;



-- id: 21448
SELECT     `T71`.`base_product_key`, 
     `T71`.`expected_volume`
 FROM
     `gosalesdw1021`.`dist_product_forecast_fact` `T71` 
 ORDER BY 
     `T71`.`base_product_key` ASC
 
 
     `Product2`.`Product_type` AS `Product_type`, 
     `Product2`.`Product_name` AS `Product_Name`, 
     `Product2`.`Product_size` AS `Product_size`, 
     `Product2`.`Product_color` AS `Product_color`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Actual_Revenue`, 
     SUM(`SLS_SALES_FACT`.`quantity`) AS `Quantity`
 FROM
     (
     SELECT
         `T14`.`product_type_en` AS `Product_type`, 
         `T01`.`product_name` AS `Product_name`, 
         `T131`.`product_size_en` AS `Product_size`, 
         `T111`.`product_color_en` AS `Product_color`, 
         `T121`.`product_line_en` AS `Product_line`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T91` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T91`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T111` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T111`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T121` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T121`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T112`.`product_number` AS `product_number`, 
                         `T112`.`product_name` AS `product_name`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T112` 
                     WHERE 
                         `T112`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T131` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T131`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T14` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T14`.`product_type_code`
     ) `Product2` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product2`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     `Product2`.`Product_line` = 'Outdoor Protection' 
 GROUP BY 
     `Product2`.`Product_type`, 
     `Product2`.`Product_name`, 
     `Product2`.`Product_size`, 
     `Product2`.`Product_color`
     `Product2`.`Product_type` AS `Product_type`, 
     `Product2`.`Product_name` AS `Product_Name`, 
     `Product2`.`Product_size` AS `Product_size`, 
     `Product2`.`Product_color` AS `Product_color`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Actual_Revenue`, 
     SUM(`SLS_SALES_FACT`.`quantity`) AS `Quantity`
 FROM
     (
     SELECT
         `T14`.`product_type_en` AS `Product_type`, 
         `T01`.`product_name` AS `Product_name`, 
         `T131`.`product_size_en` AS `Product_size`, 
         `T111`.`product_color_en` AS `Product_color`, 
         `T121`.`product_line_en` AS `Product_line`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T91` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T91`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T111` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T111`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T121` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T121`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T112`.`product_number` AS `product_number`, 
                         `T112`.`product_name` AS `product_name`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T112` 
                     WHERE 
                         `T112`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T131` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T131`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T14` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T14`.`product_type_code`
     ) `Product2` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product2`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     `Product2`.`Product_line` = 'Outdoor Protection' 
 GROUP BY 
     `Product2`.`Product_type`, 
     `Product2`.`Product_name`, 
     `Product2`.`Product_size`, 
     `Product2`.`Product_color`
 
 

;



-- id: 21565
SELECT     `T71`.`base_product_key`, 
     `T71`.`expected_volume`
 FROM
     `gosalesdw1021`.`dist_product_forecast_fact` `T71` 
 ORDER BY 
     `T71`.`base_product_key` ASC
 
 
     `Product2`.`Product_type` AS `Product_type`, 
     `Product2`.`Product_name` AS `Product_Name`, 
     `Product2`.`Product_size` AS `Product_size`, 
     `Product2`.`Product_color` AS `Product_color`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Actual_Revenue`, 
     SUM(`SLS_SALES_FACT`.`quantity`) AS `Quantity`
 FROM
     (
     SELECT
         `T14`.`product_type_en` AS `Product_type`, 
         `T01`.`product_name` AS `Product_name`, 
         `T131`.`product_size_en` AS `Product_size`, 
         `T111`.`product_color_en` AS `Product_color`, 
         `T121`.`product_line_en` AS `Product_line`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T91` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T91`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T111` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T111`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T121` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T121`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T112`.`product_number` AS `product_number`, 
                         `T112`.`product_name` AS `product_name`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T112` 
                     WHERE 
                         `T112`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T131` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T131`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T14` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T14`.`product_type_code`
     ) `Product2` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product2`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     `Product2`.`Product_line` = 'Personal Accessories' 
 GROUP BY 
     `Product2`.`Product_type`, 
     `Product2`.`Product_name`, 
     `Product2`.`Product_size`, 
     `Product2`.`Product_color`
     `Product2`.`Product_type` AS `Product_type`, 
     `Product2`.`Product_name` AS `Product_Name`, 
     `Product2`.`Product_size` AS `Product_size`, 
     `Product2`.`Product_color` AS `Product_color`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Actual_Revenue`, 
     SUM(`SLS_SALES_FACT`.`quantity`) AS `Quantity`
 FROM
     (
     SELECT
         `T14`.`product_type_en` AS `Product_type`, 
         `T01`.`product_name` AS `Product_name`, 
         `T131`.`product_size_en` AS `Product_size`, 
         `T111`.`product_color_en` AS `Product_color`, 
         `T121`.`product_line_en` AS `Product_line`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T91` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T91`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T111` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T111`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T121` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T121`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T112`.`product_number` AS `product_number`, 
                         `T112`.`product_name` AS `product_name`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T112` 
                     WHERE 
                         `T112`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T131` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T131`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T14` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T14`.`product_type_code`
     ) `Product2` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product2`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     `Product2`.`Product_line` = 'Personal Accessories' 
 GROUP BY 
     `Product2`.`Product_type`, 
     `Product2`.`Product_name`, 
     `Product2`.`Product_size`, 
     `Product2`.`Product_color`
 
 

;



-- id: 21707
SELECT     `Product`.`Product_line` AS `Product_line`, 
     `Retailer_site`.`Region` AS `Region`, 
     `Retailer_site`.`Retailer_country` AS `Retailer_country`, 
     `Retailer_site`.`Retailer_name__multiscript_` AS `Retailer_name__multiscript_`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue`
 FROM
     (
     SELECT
         `T61`.`product_line_en` AS `Product_line`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` JOIN 
         (
         SELECT
             `T9`.`Region` AS `Region`, 
             `T9`.`Country` AS `Retailer_country`, 
             `SLS_RETAILER_DIM`.`retailer_name_mb` AS `Retailer_name__multiscript_`, 
             `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
         FROM
             (
             SELECT
                 `GO_REGION_DIM`.`region_en` AS `Region`, 
                 `GO_REGION_DIM`.`country_en` AS `Country`, 
                 `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
                 `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
                 `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
                 `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
                 `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
                 concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
             FROM
                 `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
             ) `T9` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T9`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
         ) `Retailer_site` ON `Retailer_site`.`Retailer_site_key` = `SLS_SALES_FACT`.`retailer_site_key` 
 GROUP BY 
     `Product`.`Product_line`, 
     `Retailer_site`.`Region`, 
     `Retailer_site`.`Retailer_country`, 
     `Retailer_site`.`Retailer_name__multiscript_`
 
 

;



-- id: 21849
SELECT     `Product`.`Product_line` AS `Product_line`, 
     `Retailer_site`.`Region` AS `Region`, 
     `Retailer_site`.`Retailer_country` AS `Retailer_country`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Sum1`
 FROM
     (
     SELECT
         `T61`.`product_line_en` AS `Product_line`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` JOIN 
         (
         SELECT
             `T91`.`Region` AS `Region`, 
             `T91`.`Country` AS `Retailer_country`, 
             `SLS_RETAILER_DIM`.`retailer_site_key` AS `Retailer_site_key`
         FROM
             (
             SELECT
                 `GO_REGION_DIM`.`region_en` AS `Region`, 
                 `GO_REGION_DIM`.`country_en` AS `Country`, 
                 `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
                 `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
                 `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
                 `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
                 `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
                 `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
                 concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
             FROM
                 `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
             ) `T91` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T91`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
         ) `Retailer_site` ON `Retailer_site`.`Retailer_site_key` = `SLS_SALES_FACT`.`retailer_site_key` 
 GROUP BY 
     `Product`.`Product_line`, 
     `Retailer_site`.`Region`, 
     `Retailer_site`.`Retailer_country`
 
 

;



-- id: 22001
SELECT     `T12`.`order_number` AS `Order_number`, 
     `GO_TIME_DIM`.`day_date` AS `Date0`, 
     `T111`.`order_method_en` AS `Order_method`, 
     `Product`.`Product_name` AS `Product_name`, 
     SUM(`T91`.`return_quantity`) AS `Return_quantity`
 FROM
     `gosalesdw1021`.`dist_returned_items_fact` `T91` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T91`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`sls_order_method_dim` `T111` ON `T91`.`order_method_key` = `T111`.`order_method_key` JOIN `gosalesdw1021`.`sls_sales_order_dim` `T12` ON `T91`.`sales_order_key` = `T12`.`sales_order_key` JOIN 
                 (
                 SELECT
                     `T01`.`product_name` AS `Product_name`, 
                     `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
                 FROM
                     `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                                 (
                                 SELECT
                                     `T112`.`product_number` AS `product_number`, 
                                     `T112`.`product_name` AS `product_name`
                                 FROM
                                     `gosalesdw1021`.`sls_product_lookup` `T112` 
                                 WHERE 
                                     `T112`.`product_language` = 'EN'
                                 ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
                 ) `Product` ON `Product`.`Product_key` = `T91`.`product_key` 
 WHERE 
     `GO_TIME_DIM`.`day_date` BETWEEN cast( '2012-01-01 00:00:00' as timestamp ) AND cast( '2012-03-31 00:00:00' as timestamp ) 
 GROUP BY 
     `T12`.`order_number`, 
     `GO_TIME_DIM`.`day_date`, 
     `T111`.`order_method_en`, 
     `Product`.`Product_name` 
 ORDER BY 
     `Order_number` ASC, 
     `Date0` ASC, 
     `Order_method` ASC, 
     `Product_name` ASC
 
 

;



-- id: 22153
SELECT     `T12`.`order_number` AS `Order_number`, 
     `GO_TIME_DIM`.`day_date` AS `Date0`, 
     `T111`.`order_method_en` AS `Order_method`, 
     `Product`.`Product_name` AS `Product_name`, 
     SUM(`T91`.`return_quantity`) AS `Return_quantity`
 FROM
     `gosalesdw1021`.`dist_returned_items_fact` `T91` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T91`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`sls_order_method_dim` `T111` ON `T91`.`order_method_key` = `T111`.`order_method_key` JOIN `gosalesdw1021`.`sls_sales_order_dim` `T12` ON `T91`.`sales_order_key` = `T12`.`sales_order_key` JOIN 
                 (
                 SELECT
                     `T01`.`product_name` AS `Product_name`, 
                     `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
                 FROM
                     `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                                 (
                                 SELECT
                                     `T112`.`product_number` AS `product_number`, 
                                     `T112`.`product_name` AS `product_name`
                                 FROM
                                     `gosalesdw1021`.`sls_product_lookup` `T112` 
                                 WHERE 
                                     `T112`.`product_language` = 'EN'
                                 ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
                 ) `Product` ON `Product`.`Product_key` = `T91`.`product_key` 
 WHERE 
     `GO_TIME_DIM`.`day_date` >= cast( '2012-01-01 00:00:00' as timestamp ) AND
     `GO_TIME_DIM`.`day_date` <= cast( '2012-03-31 00:00:00' as timestamp ) 
 GROUP BY 
     `T12`.`order_number`, 
     `GO_TIME_DIM`.`day_date`, 
     `T111`.`order_method_en`, 
     `Product`.`Product_name` 
 ORDER BY 
     `Order_number` ASC, 
     `Date0` ASC, 
     `Order_method` ASC, 
     `Product_name` ASC
 
 

;



-- id: 22185
SELECT     `T3`.`order_number` AS `Order_number`, 
     `GO_TIME_DIM`.`day_date` AS `Date0`, 
     SUM(`SLS_SALES_FACT`.`quantity`) AS `Quantity1`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`sls_sales_order_dim` `T3` ON `SLS_SALES_FACT`.`sales_order_key` = `T3`.`sales_order_key` 
 GROUP BY 
     `T3`.`order_number`, 
     `GO_TIME_DIM`.`day_date`
 
 

;



-- id: 22205
SELECT     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue`, 
     `T2`.`order_number` AS `Order_number`, 
     `T2`.`order_number` AS `Order_number1`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`sls_sales_order_dim` `T2` ON `SLS_SALES_FACT`.`sales_order_key` = `T2`.`sales_order_key` 
 GROUP BY 
     `T2`.`order_number`
 
 

;



-- id: 22240
SELECT     `T2`.`order_number` AS `Order_number`, 
     `T11`.`order_method_en` AS `Order_method`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`sls_order_method_dim` `T11` ON `SLS_SALES_FACT`.`order_method_key` = `T11`.`order_method_key` JOIN `gosalesdw1021`.`sls_sales_order_dim` `T2` ON `SLS_SALES_FACT`.`sales_order_key` = `T2`.`sales_order_key` 
 WHERE 
     `T2`.`order_number` BETWEEN 100001 AND 100099 
 GROUP BY 
     `T2`.`order_number`, 
     `T11`.`order_method_en` 
 ORDER BY 
     `Order_number` ASC
 
 

;



-- id: 22275
SELECT     `T2`.`order_number` AS `Order_number`, 
     `T11`.`order_method_en` AS `Order_method`, 
     `T11`.`order_method_code` AS `Order_method_code`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`sls_order_method_dim` `T11` ON `SLS_SALES_FACT`.`order_method_key` = `T11`.`order_method_key` JOIN `gosalesdw1021`.`sls_sales_order_dim` `T2` ON `SLS_SALES_FACT`.`sales_order_key` = `T2`.`sales_order_key` 
 WHERE 
     `T2`.`order_number` IN ( 
         100001, 100004, 100009 ) 
 GROUP BY 
     `T2`.`order_number`, 
     `T11`.`order_method_en`, 
     `T11`.`order_method_code` 
 ORDER BY 
     `Order_number` ASC
 
 

;



-- id: 22310
SELECT     `T2`.`order_number` AS `Order_number`, 
     `T11`.`order_method_en` AS `Order_method`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`sls_order_method_dim` `T11` ON `SLS_SALES_FACT`.`order_method_key` = `T11`.`order_method_key` JOIN `gosalesdw1021`.`sls_sales_order_dim` `T2` ON `SLS_SALES_FACT`.`sales_order_key` = `T2`.`sales_order_key` 
 WHERE 
     `T2`.`order_number` >= 100001 AND
     `T2`.`order_number` <= 100099 
 GROUP BY 
     `T2`.`order_number`, 
     `T11`.`order_method_en` 
 ORDER BY 
     `Order_number` ASC
 
 

;



-- id: 22330
SELECT     `T2`.`order_method_en` AS `Order_method_type`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue1`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`sls_order_method_dim` `T2` ON `SLS_SALES_FACT`.`order_method_key` = `T2`.`order_method_key` 
 GROUP BY 
     `T2`.`order_method_en`
 
 

;



-- id: 22458
SELECT     `T11`.`order_number` AS `Order_number`, 
     `Product`.`Product_name` AS `Product_name`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue`
 FROM
     (
     SELECT
         `T01`.`product_name` AS `Product_name`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T112`.`product_number` AS `product_number`, 
                         `T112`.`product_name` AS `product_name`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T112` 
                     WHERE 
                         `T112`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` JOIN `gosalesdw1021`.`sls_sales_order_dim` `T11` ON `SLS_SALES_FACT`.`sales_order_key` = `T11`.`sales_order_key` 
 GROUP BY 
     `T11`.`order_number`, 
     `Product`.`Product_name`
 
 

;



-- id: 22596
SELECT     `T11`.`order_number` AS `Order_number`, 
     `Product`.`Product_name` AS `Product_name`, 
     `GO_TIME_DIM`.`day_date` AS `Date0`
 FROM
     `gosalesdw1021`.`dist_returned_items_fact` `T91` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T91`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`sls_sales_order_dim` `T11` ON `T91`.`sales_order_key` = `T11`.`sales_order_key` JOIN 
             (
             SELECT
                 `T01`.`product_name` AS `Product_name`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T112`.`product_number` AS `product_number`, 
                                 `T112`.`product_name` AS `product_name`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T112` 
                             WHERE 
                                 `T112`.`product_language` = 'EN'
                             ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `T91`.`product_key` 
 WHERE 
     `T11`.`order_number` >= 100009 
 GROUP BY 
     `T11`.`order_number`, 
     `Product`.`Product_name`, 
     `GO_TIME_DIM`.`day_date` 
 ORDER BY 
     `Order_number` ASC, 
     `Product_name` ASC, 
     `Date0` ASC
 
 

;



-- id: 22628
SELECT     `T3`.`order_number` AS `Order_number`, 
     `GO_TIME_DIM`.`day_date` AS `Date0`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`sls_sales_order_dim` `T3` ON `SLS_SALES_FACT`.`sales_order_key` = `T3`.`sales_order_key` 
 GROUP BY 
     `T3`.`order_number`, 
     `GO_TIME_DIM`.`day_date`
 
 

;



-- id: 22738
SELECT     `Product`.`Product_name` AS `Product`, 
     SUM(`SLS_SALES_FACT`.`unit_cost` * `SLS_SALES_FACT`.`quantity`) AS `Product_cost1`
 FROM
     (
     SELECT
         `T01`.`product_name` AS `Product_name`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`, 
                         `T11`.`product_name` AS `product_name`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T8` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T8`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 GROUP BY 
     `Product`.`Product_name`
 
 

;



-- id: 22831
SELECT     `Product`.`Product_name` AS `Product_name`, 
     `Product`.`Product_description` AS `Product_description`
 FROM
     (
     SELECT
         `T01`.`product_name` AS `Product_name`, 
         `T01`.`product_description` AS `Product_description`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`, 
                         `T11`.`product_name` AS `product_name`, 
                         `T11`.`product_description` AS `product_description`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T8` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T8`.`product_type_code`
     ) `Product` 
 GROUP BY 
     `Product`.`Product_name`, 
     `Product`.`Product_description`
 
 

;



-- id: 22924
SELECT     `Product`.`Product_name` AS `Product_name`, 
     `Product`.`Introduction_date` AS `Introduction_date`
 FROM
     (
     SELECT
         `T01`.`product_name` AS `Product_name`, 
         `SLS_PRODUCT_DIM`.`introduction_date` AS `Introduction_date`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`, 
                         `T11`.`product_name` AS `product_name`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T8` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T8`.`product_type_code`
     ) `Product` 
 GROUP BY 
     `Product`.`Product_name`, 
     `Product`.`Introduction_date`
 
 

;



-- id: 23034
SELECT     `Product`.`Product_name` AS `Product`, 
     `Product`.`Product_line` AS `Product_line`, 
     SUM(`SLS_SALES_FACT`.`quantity`) AS `Quantity1`
 FROM
     (
     SELECT
         `T01`.`product_name` AS `Product_name`, 
         `T61`.`product_line_en` AS `Product_line`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`, 
                         `T11`.`product_name` AS `product_name`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T8` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T8`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 GROUP BY 
     `Product`.`Product_name`, 
     `Product`.`Product_line`
 
 

;



-- id: 23042
SELECT     `T1`.`order_method_en` AS `useValue`, 
     `T1`.`order_method_en` AS `displayValue`
 FROM
     `gosalesdw1021`.`sls_order_method_dim` `T1` 
 GROUP BY 
     `T1`.`order_method_en`
 
 

;



-- id: 23186
SELECT     `Product`.`Product_name` AS `Product_name`, 
     `T11`.`order_method_en` AS `Order_method`, 
     `GO_TIME_DIM`.`day_date` AS `Date0`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
         (
         SELECT
             `T01`.`product_name` AS `Product_name`, 
             `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
         FROM
             `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                         (
                         SELECT
                             `T112`.`product_number` AS `product_number`, 
                             `T112`.`product_name` AS `product_name`
                         FROM
                             `gosalesdw1021`.`sls_product_lookup` `T112` 
                         WHERE 
                             `T112`.`product_language` = 'EN'
                         ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
         ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` JOIN `gosalesdw1021`.`sls_order_method_dim` `T11` ON `SLS_SALES_FACT`.`order_method_key` = `T11`.`order_method_key` 
 WHERE 
     `T11`.`order_method_en` = 'E-mail' 
 GROUP BY 
     `Product`.`Product_name`, 
     `T11`.`order_method_en`, 
     `GO_TIME_DIM`.`day_date` 
 ORDER BY 
     `Product_name` ASC, 
     `Order_method` ASC, 
     `Date0` ASC
 
 

;



-- id: 23317
SELECT     `Product`.`Product_name` AS `Product_name`, 
     `T10`.`order_method_en` AS `Order_method`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue`
 FROM
     (
     SELECT
         `T01`.`product_name` AS `Product_name`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`, 
                         `T11`.`product_name` AS `product_name`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` JOIN `gosalesdw1021`.`sls_order_method_dim` `T10` ON `SLS_SALES_FACT`.`order_method_key` = `T10`.`order_method_key` 
 WHERE 
     `T10`.`order_method_en` = 'E-mail' OR
     `T10`.`order_method_en` = 'Web' 
 GROUP BY 
     `Product`.`Product_name`, 
     `T10`.`order_method_en` 
 ORDER BY 
     `Product_name` ASC, 
     `Order_method` ASC
 
 

;



-- id: 23427
SELECT     `Product`.`Product_type` AS `Product_type`, 
     `Product`.`Product_name` AS `Product_name`, 
     SUM(`SLS_SALES_FACT`.`quantity`) AS `Quantity`, 
     AVG(`SLS_SALES_FACT`.`unit_sale_price`) AS `Unit_sale_price`
 FROM
     (
     SELECT
         `T8`.`product_type_en` AS `Product_type`, 
         `T01`.`product_name` AS `Product_name`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`, 
                         `T11`.`product_name` AS `product_name`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T8` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T8`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 GROUP BY 
     `Product`.`Product_type`, 
     `Product`.`Product_name`
 
 

;



-- id: 23537
SELECT     `Product`.`Product_line_code` AS `column0`, 
     `Product`.`Product_type_key` AS `column1`, 
     `Product`.`Base_product_key` AS `column2`, 
     SUM(`T10`.`return_quantity`) AS `column3`
 FROM
     (
     SELECT
         `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
         `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
         `SLS_PRODUCT_DIM`.`base_product_key` AS `Base_product_key`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`dist_returned_items_fact` `T10` ON `Product`.`Product_key` = `T10`.`product_key` 
 GROUP BY 
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`, 
     `Product`.`Base_product_key`
 
 

;



-- id: 23647
SELECT     `Product`.`Product_line_code` AS `column0`, 
     `Product`.`Product_type_key` AS `column1`, 
     `Product`.`Base_product_key` AS `column2`, 
     SUM(`SLS_SALES_FACT`.`quantity`) AS `column3`
 FROM
     (
     SELECT
         `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
         `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
         `SLS_PRODUCT_DIM`.`base_product_key` AS `Base_product_key`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 GROUP BY 
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`, 
     `Product`.`Base_product_key`
 
 

;



-- id: 23757
SELECT     `Product`.`Product_line_code` AS `column0`, 
     `Product`.`Product_type_key` AS `column1`, 
     `Product`.`Base_product_key` AS `column2`, 
     AVG(`SLS_SALES_FACT`.`unit_cost`) AS `column3`, 
     SUM(`SLS_SALES_FACT`.`unit_cost`) AS `Sum1`, 
     COUNT(`SLS_SALES_FACT`.`unit_cost`) AS `Count1`
 FROM
     (
     SELECT
         `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
         `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
         `SLS_PRODUCT_DIM`.`base_product_key` AS `Base_product_key`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 GROUP BY 
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`, 
     `Product`.`Base_product_key`
 
 

;



-- id: 23879
SELECT     `Product`.`Product_name` AS `Product_name`, 
     `GO_TIME_DIM`.`day_date` AS `Date0`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
         (
         SELECT
             `T01`.`product_name` AS `Product_name`, 
             `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
         FROM
             `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                         (
                         SELECT
                             `T11`.`product_number` AS `product_number`, 
                             `T11`.`product_name` AS `product_name`
                         FROM
                             `gosalesdw1021`.`sls_product_lookup` `T11` 
                         WHERE 
                             `T11`.`product_language` = 'EN'
                         ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T8` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T8`.`product_type_code`
         ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 GROUP BY 
     `Product`.`Product_name`, 
     `GO_TIME_DIM`.`day_date`
 
 

;



-- id: 23898
SELECT     `SLS_RETAILER_DIM`.`retailer_name`, 
     `T0`.`COUNTRY_KEY`, 
     `SLS_RETAILER_DIM`.`retailer_key`
 FROM
     (
     SELECT
         `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
         `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
         `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
         `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
         `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
         `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
         `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
         `GO_REGION_DIM`.`region_en` AS `Region`, 
         `GO_REGION_DIM`.`country_en` AS `Country`, 
         concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
     FROM
         `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
     ) `T0` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T0`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code` 
 ORDER BY 
     `T0`.`COUNTRY_KEY` ASC, 
     `SLS_RETAILER_DIM`.`retailer_key` ASC
 
 

;



-- id: 23923
SELECT     `Retailer_site`.`Retailer_name` AS `Retailer_name`, 
     `Retailer_site`.`Contact_last_name` AS `Contact_last_name`, 
     `Retailer_site`.`Contact_first_name` AS `Contact_first_name`, 
     `Retailer_site`.`Contact_phone_number` AS `Contact_phone_number`, 
     `Retailer_site`.`Contact_email` AS `Contact_email`
 FROM
     (
     SELECT
         `SLS_RETAILER_DIM`.`retailer_name` AS `Retailer_name`, 
         `SLS_RETAILER_DIM`.`contact_last_name` AS `Contact_last_name`, 
         `SLS_RETAILER_DIM`.`contact_first_name` AS `Contact_first_name`, 
         `SLS_RETAILER_DIM`.`contact_phone_number` AS `Contact_phone_number`, 
         `SLS_RETAILER_DIM`.`contact_email` AS `Contact_email`
     FROM
         (
         SELECT
             `GO_REGION_DIM`.`country_key` AS `COUNTRY_KEY`, 
             `GO_REGION_DIM`.`country_code` AS `COUNTRY_CODE`, 
             `GO_REGION_DIM`.`iso_three_letter_code` AS `ISO_THREE_LETTER_CODE`, 
             `GO_REGION_DIM`.`iso_two_letter_code` AS `ISO_TWO_LETTER_CODE`, 
             `GO_REGION_DIM`.`iso_three_digit_code` AS `ISO_THREE_DIGIT_CODE`, 
             `GO_REGION_DIM`.`region_key` AS `REGION_KEY`, 
             `GO_REGION_DIM`.`region_code` AS `REGION_CODE`, 
             `GO_REGION_DIM`.`region_en` AS `Region`, 
             `GO_REGION_DIM`.`country_en` AS `Country`, 
             concat('../samples/images/', `GO_REGION_DIM`.`flag_image`) AS `FLAG_IMAGE`
         FROM
             `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM`
         ) `T0` JOIN `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` ON `T0`.`COUNTRY_CODE` = `SLS_RETAILER_DIM`.`rtl_country_code`
     ) `Retailer_site` 
 WHERE 
     `Retailer_site`.`Retailer_name` IN ( 
         '1 for 1 Sports shop', 'Action Factory', 'Bellini', 'By A Thread' ) 
 GROUP BY 
     `Retailer_site`.`Retailer_name`, 
     `Retailer_site`.`Contact_last_name`, 
     `Retailer_site`.`Contact_first_name`, 
     `Retailer_site`.`Contact_phone_number`, 
     `Retailer_site`.`Contact_email` 
 ORDER BY 
     `Retailer_name` ASC, 
     `Contact_last_name` ASC
 
 

;



-- id: 24019
SELECT     `Product`.`Product_line` AS `Product_line`, 
     `Product`.`Product_name` AS `Product_name`, 
     `Product`.`Product_color` AS `Product_color`, 
     `Product`.`Product_size` AS `Product_size`, 
     `Product`.`Product_image` AS `Product_image`, 
     `Product`.`Product_description` AS `Product_description`
 FROM
     (
     SELECT
         `T61`.`product_line_en` AS `Product_line`, 
         `T01`.`product_name` AS `Product_name`, 
         `T51`.`product_color_en` AS `Product_color`, 
         `T71`.`product_size_en` AS `Product_size`, 
         concat('../samples/images/', `SLS_PRODUCT_DIM`.`product_image`) AS `Product_image`, 
         `T01`.`product_description` AS `Product_description`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`, 
                         `T11`.`product_name` AS `product_name`, 
                         `T11`.`product_description` AS `product_description`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T8` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T8`.`product_type_code`
     ) `Product` 
 WHERE 
     `Product`.`Product_name` = 'BugShield Lotion' 
 GROUP BY 
     `Product`.`Product_line`, 
     `Product`.`Product_name`, 
     `Product`.`Product_color`, 
     `Product`.`Product_size`, 
     `Product`.`Product_image`, 
     `Product`.`Product_description` 
 ORDER BY 
     `Product_line` ASC, 
     `Product_name` ASC, 
     `Product_color` ASC, 
     `Product_size` ASC
 
 

;



-- id: 24051
SELECT     `T3`.`order_number` AS `Order_number`, 
     `T21`.`order_method_en` AS `Order_method`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`sls_order_method_dim` `T21` ON `SLS_SALES_FACT`.`order_method_key` = `T21`.`order_method_key` JOIN `gosalesdw1021`.`sls_sales_order_dim` `T3` ON `SLS_SALES_FACT`.`sales_order_key` = `T3`.`sales_order_key` 
 GROUP BY 
     `T3`.`order_number`, 
     `T21`.`order_method_en`
 
 

;



-- id: 24083
SELECT     `T01`.`product_name`, 
     `T4`.`product_type_en`, 
     `SLS_PRODUCT_DIM`.`product_type_key`, 
     `SLS_PRODUCT_DIM`.`base_product_key`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN 
     (
     SELECT
         `T11`.`product_number` AS `product_number`, 
         `T11`.`product_name` AS `product_name`
     FROM
         `gosalesdw1021`.`sls_product_lookup` `T11` 
     WHERE 
         `T11`.`product_language` = 'EN'
     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T4` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T4`.`product_type_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_type_key` ASC, 
     `SLS_PRODUCT_DIM`.`base_product_key` ASC
 
 

;



-- id: 25134
SELECT     `T41`.`product_line_en`, 
     `T51`.`product_type_en`, 
     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `SLS_PRODUCT_DIM`.`product_type_key`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T41` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T41`.`product_line_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T51`.`product_type_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC, 
     `SLS_PRODUCT_DIM`.`product_type_key` ASC
 
 
     `T81`.`product_type_key`, 
     `EMP_EMPLOYEE_DIM`.`employee_name`, 
     `T81`.`sales_target`
 FROM
     `gosalesdw1021`.`go_org_dim` `T71`, 
     `gosalesdw1021`.`sls_sales_targ_fact` `T81`, 
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM`, 
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 WHERE 
     `T71`.`organization_code4` IN ( 
         'GONEUOP', 
         'GONEUCP' ) AND
     `GO_TIME_DIM0`.`current_year` IN ( 
         2013 ) AND
     `GO_TIME_DIM0`.`quarter_key` = 20131 AND
     `T71`.`organization_key` = `T81`.`organization_key` AND
     `T81`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` AND
     `T81`.`month_key` = `GO_TIME_DIM0`.`month_key` 
 ORDER BY 
     `T81`.`product_type_key` ASC
     `T81`.`product_type_key`, 
     `EMP_EMPLOYEE_DIM`.`employee_name`, 
     `T81`.`sales_target`
 FROM
     `gosalesdw1021`.`go_org_dim` `T71`, 
     `gosalesdw1021`.`sls_sales_targ_fact` `T81`, 
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM`, 
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 WHERE 
     `T71`.`organization_code4` IN ( 
         'GONEUOP', 
         'GONEUCP' ) AND
     `GO_TIME_DIM0`.`current_year` IN ( 
         2013 ) AND
     `GO_TIME_DIM0`.`quarter_key` = 20131 AND
     `T71`.`organization_key` = `T81`.`organization_key` AND
     `T81`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` AND
     `T81`.`month_key` = `GO_TIME_DIM0`.`month_key` 
 ORDER BY 
     `T81`.`product_type_key` ASC
 
 
     `EMP_EMPLOYEE_DIM`.`employee_name` AS `Employee_name`, 
     `Product2`.`Product_line` AS `Product_line`, 
     `Product2`.`Product_type` AS `Product_type`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Total_Variance_`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` ON `SLS_SALES_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_org_dim` `T24` ON `SLS_SALES_FACT`.`organization_key` = `T24`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
                 (
                 SELECT
                     `T181`.`product_line_en` AS `Product_line`, 
                     `T201`.`product_type_en` AS `Product_type`, 
                     `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
                 FROM
                     `gosalesdw1021`.`sls_product_brand_lookup` `T151` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T151`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T171` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T171`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T181` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T181`.`product_line_code` JOIN 
                                 (
                                 SELECT
                                     `T131`.`product_number` AS `product_number`
                                 FROM
                                     `gosalesdw1021`.`sls_product_lookup` `T131` 
                                 WHERE 
                                     `T131`.`product_language` = 'EN'
                                 ) `T121` ON `SLS_PRODUCT_DIM`.`product_number` = `T121`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T191` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T191`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T201` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T201`.`product_type_code`
                 ) `Product2` ON `Product2`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     `GO_TIME_DIM`.`quarter_key` = 20131 AND
     `GO_TIME_DIM`.`current_year` IN ( 
         2013 ) AND
     `T24`.`organization_code4` IN ( 
         'GONEUOP', 
         'GONEUCP' ) 
 GROUP BY 
     `EMP_EMPLOYEE_DIM`.`employee_name`, 
     `Product2`.`Product_line`, 
     `Product2`.`Product_type`
     `EMP_EMPLOYEE_DIM`.`employee_name` AS `Employee_name`, 
     `Product2`.`Product_line` AS `Product_line`, 
     `Product2`.`Product_type` AS `Product_type`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Total_Variance_`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` ON `SLS_SALES_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_org_dim` `T24` ON `SLS_SALES_FACT`.`organization_key` = `T24`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
                 (
                 SELECT
                     `T181`.`product_line_en` AS `Product_line`, 
                     `T201`.`product_type_en` AS `Product_type`, 
                     `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
                 FROM
                     `gosalesdw1021`.`sls_product_brand_lookup` `T151` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T151`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T171` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T171`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T181` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T181`.`product_line_code` JOIN 
                                 (
                                 SELECT
                                     `T131`.`product_number` AS `product_number`
                                 FROM
                                     `gosalesdw1021`.`sls_product_lookup` `T131` 
                                 WHERE 
                                     `T131`.`product_language` = 'EN'
                                 ) `T121` ON `SLS_PRODUCT_DIM`.`product_number` = `T121`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T191` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T191`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T201` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T201`.`product_type_code`
                 ) `Product2` ON `Product2`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     `GO_TIME_DIM`.`quarter_key` = 20131 AND
     `GO_TIME_DIM`.`current_year` IN ( 
         2013 ) AND
     `T24`.`organization_code4` IN ( 
         'GONEUOP', 
         'GONEUCP' ) 
 GROUP BY 
     `EMP_EMPLOYEE_DIM`.`employee_name`, 
     `Product2`.`Product_line`, 
     `Product2`.`Product_type`
 
 

;



-- id: 25257
SELECT     `Product`.`Product_line_code` AS `column0`, 
     `Product`.`Product_type_key` AS `column1`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column2`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column3`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
         (
         SELECT
             `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
             `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
             `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
         FROM
             `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                         (
                         SELECT
                             `T11`.`product_number` AS `product_number`
                         FROM
                             `gosalesdw1021`.`sls_product_lookup` `T11` 
                         WHERE 
                             `T11`.`product_language` = 'EN'
                         ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
         ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' 
 GROUP BY 
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4))
 
 
 org.apache.tez.dag.api.SessionNotRunning: Application not running, applicationId=application_1433434842480_0020, yarnApplicationState=FINISHED, finalApplicationStatus=SUCCEEDED, trackingUrl=http://drv-hdpc3.ottawa.ibm.com:8088/proxy/application_1433434842480_0020/, diagnostics=Session stats:submittedDAGs=20, successfulDAGs=20, failedDAGs=0, killedDAGs=0
 
 	at org.apache.tez.client.TezClientUtils.getSessionAMProxy(TezClientUtils.java:798)
 	at org.apache.tez.client.TezClient.getSessionAMProxy(TezClient.java:633)
 	at org.apache.tez.client.TezClient.stop(TezClient.java:440)
 	at org.apache.hadoop.hive.ql.exec.tez.TezSessionState.close(TezSessionState.java:265)
 	at org.apache.hadoop.hive.ql.exec.tez.TezSessionPoolManager.close(TezSessionPoolManager.java:176)
 	at org.apache.hadoop.hive.ql.exec.tez.TezSessionPoolManager.closeAndOpen(TezSessionPoolManager.java:282)
 	at org.apache.hadoop.hive.ql.exec.tez.TezTask.submit(TezTask.java:381)
 	at org.apache.hadoop.hive.ql.exec.tez.TezTask.execute(TezTask.java:162)
 	at org.apache.hadoop.hive.ql.exec.Task.executeTask(Task.java:160)
 	at org.apache.hadoop.hive.ql.exec.TaskRunner.runSequential(TaskRunner.java:85)
 	at org.apache.hadoop.hive.ql.Driver.launchTask(Driver.java:1606)
 	at org.apache.hadoop.hive.ql.Driver.execute(Driver.java:1367)
 	at org.apache.hadoop.hive.ql.Driver.runInternal(Driver.java:1179)
 	at org.apache.hadoop.hive.ql.Driver.run(Driver.java:1006)
 	at org.apache.hadoop.hive.ql.Driver.run(Driver.java:1001)
 	at org.apache.hive.service.cli.operation.SQLOperation.runQuery(SQLOperation.java:153)
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



-- id: 25367
SELECT     `Product`.`Product_line_code` AS `column0`, 
     `Product`.`Product_type_key` AS `column1`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column2`
 FROM
     (
     SELECT
         `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
         `SLS_PRODUCT_DIM`.`product_type_key` AS `Product_type_key`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 GROUP BY 
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`
 
 

;



-- id: 25490
SELECT     `Product`.`Product_line_code` AS `column0`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column1`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column2`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
         (
         SELECT
             `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
             `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
         FROM
             `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                         (
                         SELECT
                             `T11`.`product_number` AS `product_number`
                         FROM
                             `gosalesdw1021`.`sls_product_lookup` `T11` 
                         WHERE 
                             `T11`.`product_language` = 'EN'
                         ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T8` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T8`.`product_type_code`
         ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' 
 GROUP BY 
     `Product`.`Product_line_code`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4))
 
 

;



-- id: 25600
SELECT     `Product`.`Product_line_code` AS `column0`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column1`
 FROM
     (
     SELECT
         `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
         `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
     FROM
         `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                     (
                     SELECT
                         `T11`.`product_number` AS `product_number`
                     FROM
                         `gosalesdw1021`.`sls_product_lookup` `T11` 
                     WHERE 
                         `T11`.`product_language` = 'EN'
                     ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T8` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T8`.`product_type_code`
     ) `Product` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 GROUP BY 
     `Product`.`Product_line_code`
 
 

;



-- id: 25615
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 25636
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     concat(`T2`.`quarter_en`, ' '), 
     `GO_TIME_DIM0`.`current_year`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T2` ON `GO_TIME_DIM0`.`quarter_key` = `T2`.`quarter_key`
 
 

;



-- id: 25668
SELECT     `T1`.`organization_code3`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_org_dim` `T1` ON `SLS_SALES_FACT`.`organization_key` = `T1`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2011' AND
     `GO_TIME_DIM`.`quarter_key` = 20111
 
 

;



-- id: 25700
SELECT     `T1`.`organization_code3`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_org_dim` `T1` ON `SLS_SALES_FACT`.`organization_key` = `T1`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2010' AND
     `GO_TIME_DIM`.`quarter_key` = 20101
 
 

;



-- id: 25718
SELECT     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 25733
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 25754
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     concat(`T2`.`quarter_en`, ' '), 
     `GO_TIME_DIM0`.`current_year`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T2` ON `GO_TIME_DIM0`.`quarter_key` = `T2`.`quarter_key`
 
 

;



-- id: 25889
SELECT     `T10`.`organization_code3`, 
     `Product`.`Product_line_code`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_org_dim` `T10` ON `SLS_SALES_FACT`.`organization_key` = `T10`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T11`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T11` 
                             WHERE 
                                 `T11`.`product_language` = 'EN'
                             ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2011' AND
     `GO_TIME_DIM`.`quarter_key` = 20111
 
 

;



-- id: 26024
SELECT     `T10`.`organization_code3`, 
     `Product`.`Product_line_code`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_org_dim` `T10` ON `SLS_SALES_FACT`.`organization_key` = `T10`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T11`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T11` 
                             WHERE 
                                 `T11`.`product_language` = 'EN'
                             ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2010' AND
     `GO_TIME_DIM`.`quarter_key` = 20101
 
 

;



-- id: 26042
SELECT     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 26057
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 26078
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     concat(`T2`.`quarter_en`, ' '), 
     `GO_TIME_DIM0`.`current_year`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T2` ON `GO_TIME_DIM0`.`quarter_key` = `T2`.`quarter_key`
 
 

;



-- id: 26213
SELECT     `T10`.`organization_code3`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_org_dim` `T10` ON `SLS_SALES_FACT`.`organization_key` = `T10`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T11`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T11` 
                             WHERE 
                                 `T11`.`product_language` = 'EN'
                             ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2011' AND
     `GO_TIME_DIM`.`quarter_key` = 20111
 
 

;



-- id: 26348
SELECT     `T10`.`organization_code3`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_org_dim` `T10` ON `SLS_SALES_FACT`.`organization_key` = `T10`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T11`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T11` 
                             WHERE 
                                 `T11`.`product_language` = 'EN'
                             ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2010' AND
     `GO_TIME_DIM`.`quarter_key` = 20101
 
 

;



-- id: 26366
SELECT     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 26381
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 26402
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     concat(`T2`.`quarter_en`, ' '), 
     `GO_TIME_DIM0`.`current_year`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T2` ON `GO_TIME_DIM0`.`quarter_key` = `T2`.`quarter_key`
 
 

;



-- id: 26537
SELECT     `T10`.`organization_code3`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_org_dim` `T10` ON `SLS_SALES_FACT`.`organization_key` = `T10`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T11`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T11` 
                             WHERE 
                                 `T11`.`product_language` = 'EN'
                             ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2011' AND
     `GO_TIME_DIM`.`quarter_key` = 20111
 
 

;



-- id: 26672
SELECT     `T10`.`organization_code3`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_org_dim` `T10` ON `SLS_SALES_FACT`.`organization_key` = `T10`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T11`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T11` 
                             WHERE 
                                 `T11`.`product_language` = 'EN'
                             ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2010' AND
     `GO_TIME_DIM`.`quarter_key` = 20101
 
 

;



-- id: 26690
SELECT     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 26705
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 26726
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     concat(`T2`.`quarter_en`, ' '), 
     `GO_TIME_DIM0`.`current_year`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T2` ON `GO_TIME_DIM0`.`quarter_key` = `T2`.`quarter_key`
 
 

;



-- id: 26861
SELECT     `T10`.`organization_code3`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_org_dim` `T10` ON `SLS_SALES_FACT`.`organization_key` = `T10`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T11`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T11` 
                             WHERE 
                                 `T11`.`product_language` = 'EN'
                             ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2011' AND
     `GO_TIME_DIM`.`quarter_key` = 20111
 
 

;



-- id: 26996
SELECT     `T10`.`organization_code3`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_org_dim` `T10` ON `SLS_SALES_FACT`.`organization_key` = `T10`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T11`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T11` 
                             WHERE 
                                 `T11`.`product_language` = 'EN'
                             ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2010' AND
     `GO_TIME_DIM`.`quarter_key` = 20101
 
 

;



-- id: 27014
SELECT     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 27029
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 27050
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     concat(`T2`.`quarter_en`, ' '), 
     `GO_TIME_DIM0`.`current_year`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T2` ON `GO_TIME_DIM0`.`quarter_key` = `T2`.`quarter_key`
 
 

;



-- id: 27185
SELECT     `T10`.`organization_code3`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_org_dim` `T10` ON `SLS_SALES_FACT`.`organization_key` = `T10`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T11`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T11` 
                             WHERE 
                                 `T11`.`product_language` = 'EN'
                             ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2011' AND
     `GO_TIME_DIM`.`quarter_key` = 20111
 
 

;



-- id: 27320
SELECT     `T10`.`organization_code3`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `Product`.`Product_line_code`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_org_dim` `T10` ON `SLS_SALES_FACT`.`organization_key` = `T10`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN 
             (
             SELECT
                 `SLS_PRODUCT_DIM`.`product_line_code` AS `Product_line_code`, 
                 `SLS_PRODUCT_DIM`.`product_key` AS `Product_key`
             FROM
                 `gosalesdw1021`.`sls_product_brand_lookup` `T31` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T31`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` JOIN `gosalesdw1021`.`sls_product_color_lookup` `T51` ON `SLS_PRODUCT_DIM`.`product_color_code` = `T51`.`product_color_code` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T61` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T61`.`product_line_code` JOIN 
                             (
                             SELECT
                                 `T11`.`product_number` AS `product_number`
                             FROM
                                 `gosalesdw1021`.`sls_product_lookup` `T11` 
                             WHERE 
                                 `T11`.`product_language` = 'EN'
                             ) `T01` ON `SLS_PRODUCT_DIM`.`product_number` = `T01`.`product_number` JOIN `gosalesdw1021`.`sls_product_size_lookup` `T71` ON `SLS_PRODUCT_DIM`.`product_size_code` = `T71`.`product_size_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T81` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T81`.`product_type_code`
             ) `Product` ON `Product`.`Product_key` = `SLS_SALES_FACT`.`product_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2010' AND
     `GO_TIME_DIM`.`quarter_key` = 20101
 
 

;



-- id: 27330
SELECT     `T0`.`order_method_key` AS `column0`, 
     `T0`.`order_method_en` AS `column1`
 FROM
     `gosalesdw1021`.`sls_order_method_dim` `T0` 
 GROUP BY 
     `T0`.`order_method_key`, 
     `T0`.`order_method_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 27375
SELECT     `T11`.`organization_code3`, 
     `T3`.`order_method_key`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_org_dim` `T11` ON `SLS_SALES_FACT`.`organization_key` = `T11`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`sls_order_method_dim` `T3` ON `SLS_SALES_FACT`.`order_method_key` = `T3`.`order_method_key` 
 WHERE 
     `GO_TIME_DIM`.`quarter_key` = 20111
 
 

;



-- id: 27420
SELECT     `T11`.`organization_code3`, 
     `T3`.`order_method_key`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_org_dim` `T11` ON `SLS_SALES_FACT`.`organization_key` = `T11`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`sls_order_method_dim` `T3` ON `SLS_SALES_FACT`.`order_method_key` = `T3`.`order_method_key` 
 WHERE 
     `GO_TIME_DIM`.`quarter_key` = 20111
 
 

;



-- id: 27429
SELECT     `GO_TIME_DIM0`.`month_key`, 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4))
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0`
 
 

;



-- id: 27450
SELECT     `GO_TIME_DIM0`.`month_key`, 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     concat(`T2`.`quarter_en`, ' '), 
     `GO_TIME_DIM0`.`current_year`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`, 
         `GO_TIME_DIM`.`quarter_key`, 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T2` ON `GO_TIME_DIM0`.`quarter_key` = `T2`.`quarter_key`
 
 

;



-- id: 27456
SELECT     `GO_TIME_DIM`.`month_key`, 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`current_year`, 
     `GO_TIME_DIM`.`month_en`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
 ORDER BY 
     `GO_TIME_DIM`.`month_key` ASC, 
     `GO_TIME_DIM`.`quarter_key` ASC, 
     `GO_TIME_DIM`.`current_year` ASC
 
 

;



-- id: 27472
SELECT     `GO_TIME_DIM`.`month_key`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `T0`.`return_quantity`
 FROM
     `gosalesdw1021`.`dist_returned_items_fact` `T0` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T0`.`day_key` = `GO_TIME_DIM`.`day_key`
 
 

;



-- id: 735
SELECT    `go_org_dim_2`.`organization_key`,
    `go_org_dim_1`.`organization_parent` AS `organization_code1`,
    `go_org_dim_2`.`organization_parent` AS `organization_code2`,
    `go_org_dim_2`.`organization_code`
    FROM `gosalesdw1021`.`go_org_dim` `go_org_dim_2`
    JOIN `gosalesdw1021`.`go_org_dim` `go_org_dim_1` ON `go_org_dim_2`.`organization_parent` = `go_org_dim_1`.`organization_code`
    WHERE `go_org_dim_2`.`organization_code` BETWEEN '006'
    AND '8820'
 
 

;



-- id: 867
select count(*) from `gosalesdw1021`.`go_time_dim`
;



-- id: 987
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



-- id: 1051
SELECT `T5`.`expense_group_code` AS `column0`, `T5`.`expense_type_code` AS `column1`, `T01`.`organization_code1` AS `column2`, `T01`.`organization_code2` AS `column3`, `T01`.`organization_code` AS `column4`, SUM(`EMP_EXPENSE_FACT`.`expense_total`) AS `column5` FROM `gosalesdw1021`.`emp_expense_fact` `EMP_EXPENSE_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_EXPENSE_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN ( SELECT `go_org_dim_2`.`organization_key`, `go_org_dim_1`.`organization_parent` AS `organization_code1`, `go_org_dim_2`.`organization_parent` AS `organization_code2`, `go_org_dim_2`.`organization_code` FROM `gosalesdw1021`.`go_org_dim` `go_org_dim_2` JOIN `gosalesdw1021`.`go_org_dim` `go_org_dim_1` ON `go_org_dim_2`.`organization_parent` = `go_org_dim_1`.`organization_code` WHERE `go_org_dim_2`.`organization_code` BETWEEN '006' AND '8820' ) `T01` ON `T01`.`organization_key` = `EMP_EXPENSE_FACT`.`organization_key` JOIN `gosalesdw1021`.`emp_expense_type_dim` `T5` ON `EMP_EXPENSE_FACT`.`expense_type_key` = `T5`.`expense_type_key` WHERE CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND `T5`.`expense_group_code` = 400 AND `T5`.`expense_type_code` = 31 AND `T01`.`organization_code1` = 'GOCEU' AND `T01`.`organization_code2` = 'GOCEUOP' AND `T01`.`organization_code` IN ( '023', '006', '014', '013' ) GROUP BY `T5`.`expense_group_code`, `T5`.`expense_type_code`, `T01`.`organization_code1`, `T01`.`organization_code2`, `T01`.`organization_code` 
 

;



-- id: 1121
SELECT `SALES_REGION`.`sales_region_code`, `SALES_REGION`.`sales_region_en` FROM `gosales1021`.`sales_region` `SALES_REGION` ORDER BY `SALES_REGION`.`sales_region_code` ASC 
 

;



-- id: 1249
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



-- id: 1264
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 
 org.apache.tez.dag.api.SessionNotRunning: Application not running, applicationId=application_1433434842480_0008, yarnApplicationState=FINISHED, finalApplicationStatus=SUCCEEDED, trackingUrl=http://drv-hdpc3.ottawa.ibm.com:8088/proxy/application_1433434842480_0008/, diagnostics=Session stats:submittedDAGs=11, successfulDAGs=5, failedDAGs=6, killedDAGs=0
 
 	at org.apache.tez.client.TezClientUtils.getSessionAMProxy(TezClientUtils.java:798)
 	at org.apache.tez.client.TezClient.getSessionAMProxy(TezClient.java:633)
 	at org.apache.tez.client.TezClient.stop(TezClient.java:440)
 	at org.apache.hadoop.hive.ql.exec.tez.TezSessionState.close(TezSessionState.java:265)
 	at org.apache.hadoop.hive.ql.exec.tez.TezSessionPoolManager.close(TezSessionPoolManager.java:176)
 	at org.apache.hadoop.hive.ql.exec.tez.TezSessionPoolManager.closeAndOpen(TezSessionPoolManager.java:282)
 	at org.apache.hadoop.hive.ql.exec.tez.TezTask.submit(TezTask.java:381)
 	at org.apache.hadoop.hive.ql.exec.tez.TezTask.execute(TezTask.java:162)
 	at org.apache.hadoop.hive.ql.exec.Task.executeTask(Task.java:160)
 	at org.apache.hadoop.hive.ql.exec.TaskRunner.runSequential(TaskRunner.java:85)
 	at org.apache.hadoop.hive.ql.Driver.launchTask(Driver.java:1606)
 	at org.apache.hadoop.hive.ql.Driver.execute(Driver.java:1367)
 	at org.apache.hadoop.hive.ql.Driver.runInternal(Driver.java:1179)
 	at org.apache.hadoop.hive.ql.Driver.run(Driver.java:1006)
 	at org.apache.hadoop.hive.ql.Driver.run(Driver.java:1001)
 	at org.apache.hive.service.cli.operation.SQLOperation.runQuery(SQLOperation.java:153)
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



-- id: 1281
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 1298
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 1315
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 1332
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 1347
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 1364
SELECT     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
 FROM
     (
     SELECT
         `GO_TIME_DIM`.`current_year` AS `current_year`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     GROUP BY 
         `GO_TIME_DIM`.`current_year`
     ) `GO_TIME_DIM0` 
 GROUP BY 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 1365
show databases
;



