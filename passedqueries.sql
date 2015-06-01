-- id: 16
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 42
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
 
 

;



-- id: 100
     `SLS_PRODUCT_DIM`.`product_line_code`, 
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



-- id: 253
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column0`, 
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



-- id: 406
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column0`, 
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



-- id: 423
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 432
     `T0`.`REGION_CODE`, 
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



-- id: 458
     `T0`.`REGION_CODE`, 
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



-- id: 525
     `Retailer_site`.`Region_code` AS `column0`, 
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



-- id: 585
     `GO_REGION_DIM`.`region_code` AS `column0`, 
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



-- id: 645
     `GO_REGION_DIM`.`country_code` AS `column0`, 
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



-- id: 720
     `GO_REGION_DIM`.`region_code` AS `column0`, 
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



-- id: 750
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 797
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 862
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 874
     `T0`.`employee_topic_key` AS `column0`, 
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



-- id: 932
     `T3`.`employee_topic_key` AS `column0`, 
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



-- id: 974
     `T2`.`employee_topic_key` AS `column0`, 
     AVG(`EMP_SURVEY_FACT`.`employee_topic_score`) AS `column1`
 FROM
     `gosalesdw1021`.`emp_survey_fact` `EMP_SURVEY_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_SURVEY_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_survey_topic_dim` `T2` ON `T2`.`employee_topic_key` = `EMP_SURVEY_FACT`.`employee_topic_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36 
 GROUP BY 
     `T2`.`employee_topic_key`
 
 

;



-- id: 1019
     `T3`.`employee_topic_key` AS `column0`, 
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



-- id: 1050
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 1098
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 1164
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 1209
     `T01`.`position_code1`, 
     `T01`.`position_code2`, 
     `T01`.`position_code3`, 
     `T01`.`Sum1`, 
     `T01`.`column4`
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
         SUM(`T2`.`position_count`) AS `column4`, 
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



-- id: 1224
     `EMP_RANKING_DIM`.`employee_ranking_key` AS `column0`, 
     `EMP_RANKING_DIM`.`ranking_description_en` AS `column1`
 FROM
     `gosalesdw1021`.`emp_ranking_dim` `EMP_RANKING_DIM` 
 WHERE 
     `EMP_RANKING_DIM`.`employee_ranking_key` = 2393 OR
     `EMP_RANKING_DIM`.`employee_ranking_key` = 2392 OR
     `EMP_RANKING_DIM`.`employee_ranking_key` = 2391 OR
     `EMP_RANKING_DIM`.`employee_ranking_key` = 2395 OR
     `EMP_RANKING_DIM`.`employee_ranking_key` = 2394 
 GROUP BY 
     `EMP_RANKING_DIM`.`employee_ranking_key`, 
     `EMP_RANKING_DIM`.`ranking_description_en` 
 ORDER BY 
     `column1` ASC, 
     `column0` ASC
 
 

;



-- id: 1282
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 1340
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 1398
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 1456
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 1514
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 1526
     `T0`.`satisfaction_code` AS `column0`, 
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



-- id: 1552
     `T1`.`satisfaction_code` AS `column0`, 
     AVG(`EMP_SURVEY_FACT`.`employee_topic_score`) AS `column1`
 FROM
     `gosalesdw1021`.`emp_survey_fact` `EMP_SURVEY_FACT` JOIN `gosalesdw1021`.`go_satisfaction_dim` `T1` ON `EMP_SURVEY_FACT`.`satisfaction_key` = `T1`.`satisfaction_key` 
 GROUP BY 
     `T1`.`satisfaction_code`
 
 

;



-- id: 1602
     `T3`.`organization_code1` AS `column0`, 
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



-- id: 1614
     `T0`.`expense_group_code` AS `column0`, 
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



-- id: 1691
     `T01`.`organization_code1` AS `column0`, 
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



-- id: 1778
     `T21`.`organization_code1` AS `column0`, 
     SUM(`T61`.`expense_plan_total`) AS `column1`
 FROM
     `gosalesdw1021`.`emp_expense_plan_fact` `T61` JOIN 
     (
     SELECT
         `GO_TIME_DIM`.`month_key` AS `month_key`
     FROM
         `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` 
     WHERE 
         `GO_TIME_DIM`.`month_number` <= 36 AND
         `GO_TIME_DIM`.`month_number` >= 25 
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



-- id: 1855
     `T01`.`organization_code1` AS `column0`, 
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



-- id: 1870
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 1893
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     concat(`T1`.`quarter_en`, ' '), 
     `GO_TIME_DIM`.`current_year`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T1` ON `GO_TIME_DIM`.`quarter_key` = `T1`.`quarter_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36
 
 

;



-- id: 1899
     `GO_TIME_DIM`.`quarter_key`, 
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



-- id: 1911
     `T0`.`order_method_key` AS `column0`, 
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



-- id: 1953
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column0`, 
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



-- id: 2003
     `T3`.`organization_code1` AS `column0`, 
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



-- id: 2020
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 2104
     `T31`.`C`, 
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



-- id: 2113
     `T0`.`REGION_CODE`, 
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



-- id: 2174
     `Retailer_site`.`Region_code` AS `column0`, 
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



-- id: 2237
     `Retailer_site`.`Region_code` AS `column0`, 
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



-- id: 2300
     `Retailer_site`.`Region_code` AS `column0`, 
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



-- id: 2363
     `Retailer_site`.`Region_code` AS `column0`, 
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



-- id: 2426
     `Retailer_site`.`Region_code` AS `column0`, 
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



-- id: 2489
     `Retailer_site`.`Region_code` AS `column0`, 
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



-- id: 2497
     `SLS_RETAILER_DIM`.`retailer_type_code`, 
     `SLS_RETAILER_DIM`.`retailer_type_en`
 FROM
     `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` 
 ORDER BY 
     `SLS_RETAILER_DIM`.`retailer_type_code` ASC
 
 

;



-- id: 2580
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column0`, 
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



-- id: 2630
     `T3`.`organization_code1` AS `column0`, 
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



-- id: 2694
     `T0`.`organization_code1` AS `column0`, 
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



-- id: 2718
     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 2854
     `Product`.`Product_line_code` AS `column0`, 
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



-- id: 2893
     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T21`.`product_line_en`, 
     `SLS_PRODUCT_DIM`.`product_type_key`, 
     `T3`.`product_type_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T21` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T21`.`product_line_code` JOIN `gosalesdw1021`.`sls_product_type_lookup` `T3` ON `SLS_PRODUCT_DIM`.`product_type_code` = `T3`.`product_type_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC, 
     `SLS_PRODUCT_DIM`.`product_type_key` ASC
 
 

;



-- id: 2935
     `SLS_PRODUCT_DIM`.`product_type_key`, 
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



-- id: 3071
     `Product`.`Product_line_code` AS `column0`, 
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



-- id: 3207
     `Product`.`Product_line_code` AS `column0`, 
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



-- id: 3343
     `Product`.`Product_line_code` AS `column0`, 
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



-- id: 3479
     `Product`.`Product_line_code` AS `column0`, 
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



-- id: 3615
     `Product`.`Product_line_code` AS `column0`, 
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



-- id: 3665
     `T3`.`retailer_survey_key` AS `column0`, 
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



-- id: 3753
     `T21`.`organization_code1` AS `column0`, 
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



-- id: 3835
     `T6`.`retailer_survey_key` AS `column0`, 
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
         1224, 
         1226, 
         1222, 
         1223, 
         1229 ) AND
     `T21`.`organization_code1` = 'GOEAX' 
 GROUP BY 
     `T6`.`retailer_survey_key`, 
     `T21`.`organization_code1`
 
 

;



-- id: 3883
     `T3`.`retailer_survey_key` AS `column0`, 
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
         1224, 
         1226, 
         1222, 
         1223, 
         1229 ) 
 GROUP BY 
     `T3`.`retailer_survey_key`
 
 

;



-- id: 3927
     `T2`.`return_reason_key` AS `column0`, 
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



-- id: 4020
     `T6`.`return_reason_key` AS `column0`, 
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



-- id: 4113
     `T6`.`return_reason_key` AS `column0`, 
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



-- id: 4121
     `SLS_RETAILER_DIM`.`retailer_type_code`, 
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



-- id: 4133
     `T0`.`return_reason_key` AS `column0`, 
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



-- id: 4216
     `Retailer`.`Retailer_type_code` AS `column0`, 
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



-- id: 4285
     `Retailer`.`Retailer_type_code` AS `column0`, 
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
         7115, 
         7068, 
         7319, 
         7111, 
         6831, 
         7358, 
         7199, 
         7147, 
         7066, 
         7084, 
         6832, 
         7357, 
         6856, 
         7056, 
         7077, 
         7282, 
         7200, 
         6857, 
         7085, 
         7293, 
         7279, 
         7082, 
         7292, 
         7057, 
         7050, 
         7059, 
         7152, 
         7275, 
         7202, 
         7197, 
         7075, 
         7113, 
         6873, 
         7061, 
         7201, 
         7067, 
         7052, 
         7286, 
         7320, 
         7116, 
         7283, 
         7151, 
         6833, 
         7069, 
         6870, 
         7076, 
         7114, 
         7295, 
         7051, 
         7110, 
         7195, 
         6877, 
         7267, 
         6874, 
         7326, 
         7297, 
         7294, 
         7288, 
         7280, 
         7148, 
         7078, 
         7153, 
         7291, 
         7325, 
         7117, 
         7323, 
         7149, 
         7062, 
         7281, 
         7071, 
         6835, 
         7315, 
         7324, 
         7298, 
         7081, 
         7276, 
         7080, 
         7058, 
         6829, 
         7086, 
         7150, 
         7198, 
         7268, 
         6875, 
         7072, 
         6836, 
         7285, 
         7289, 
         6855, 
         7112, 
         7053, 
         7277, 
         6876, 
         7290, 
         7154, 
         7083, 
         7287, 
         7070, 
         7278, 
         7322, 
         6834, 
         7296, 
         7079, 
         7156, 
         7196, 
         7065, 
         7155, 
         7284, 
         6872, 
         6830, 
         7318, 
         7316, 
         7317, 
         7060, 
         6871 ) 
 GROUP BY 
     `Retailer`.`Retailer_type_code`, 
     `Retailer`.`Retailer_key`
 
 

;



-- id: 4368
     `Retailer`.`Retailer_type_code` AS `column0`, 
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



-- id: 4453
     SUM(`T61`.`return_quantity`) AS `column0`
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
         6, 
         3, 
         1, 
         7, 
         2, 
         5, 
         8, 
         4 ) AND
     `Retailer`.`Retailer_key` IN ( 
         7115, 
         7068, 
         7319, 
         7111, 
         6831, 
         7358, 
         7147, 
         7199, 
         7066, 
         7084, 
         6832, 
         7357, 
         6856, 
         7056, 
         7077, 
         7282, 
         7200, 
         7085, 
         6857, 
         7293, 
         7279, 
         7082, 
         7057, 
         7292, 
         7050, 
         7059, 
         7152, 
         7275, 
         7197, 
         7202, 
         7075, 
         7113, 
         6873, 
         7061, 
         7067, 
         7201, 
         7052, 
         7286, 
         7320, 
         7116, 
         7151, 
         7283, 
         6833, 
         7069, 
         6870, 
         7076, 
         7114, 
         7295, 
         7051, 
         7110, 
         7195, 
         6877, 
         7267, 
         6874, 
         7326, 
         7297, 
         7294, 
         7288, 
         7280, 
         7148, 
         7078, 
         7153, 
         7291, 
         7325, 
         7117, 
         7323, 
         7149, 
         7062, 
         7281, 
         7071, 
         6835, 
         7315, 
         7324, 
         7298, 
         7081, 
         7276, 
         7080, 
         7058, 
         6829, 
         7086, 
         7150, 
         7198, 
         7268, 
         6875, 
         6836, 
         7072, 
         7285, 
         7289, 
         6855, 
         7112, 
         7053, 
         7277, 
         6876, 
         7290, 
         7154, 
         7083, 
         7287, 
         7070, 
         7278, 
         7322, 
         6834, 
         7296, 
         7079, 
         7156, 
         7196, 
         7065, 
         7155, 
         6872, 
         7284, 
         6830, 
         7318, 
         7316, 
         7317, 
         7060, 
         6871 ) AND
     `T7`.`return_reason_key` IN ( 
         9003, 
         9001, 
         9004, 
         9002, 
         9005 )
 
 

;



-- id: 4519
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 4561
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 4603
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 4645
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 4687
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 4729
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 4771
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 4813
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 4855
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 4897
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 4942
     `T3`.`employee_topic_key` AS `column0`, 
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
         `GO_TIME_DIM`.`month_number` <= 36 AND
         `GO_TIME_DIM`.`month_number` >= 25 
     GROUP BY 
         `GO_TIME_DIM`.`month_key`
     ) `GO_TIME_DIM0` ON `T21`.`month_key` = `GO_TIME_DIM0`.`month_key` JOIN `gosalesdw1021`.`emp_survey_topic_dim` `T3` ON `T3`.`employee_topic_key` = `T21`.`employee_topic_key` 
 GROUP BY 
     `T3`.`employee_topic_key`
 
 

;



-- id: 4959
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 4973
     CAST(`GO_TIME_DIM0`.`quarter_key` AS CHAR(5)), 
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



-- id: 5000
     CAST(`GO_TIME_DIM0`.`quarter_key` AS CHAR(5)), 
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



-- id: 5050
     `T3`.`organization_code1` AS `column0`, 
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



-- id: 5062
     `T0`.`expense_group_code` AS `column0`, 
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



-- id: 5139
     `T01`.`organization_code1` AS `column0`, 
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



-- id: 5159
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 5186
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
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_TIME_DIM0`.`quarter_key` IN ( 
         20121 )
 
 

;



-- id: 5272
     `T21`.`organization_code1` AS `column0`, 
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



-- id: 5349
     `T01`.`organization_code1` AS `column0`, 
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
         ) `T01` ON `T01`.`organization_key` = `EMP_TRAINING_FACT`.`organization_key` JOIN `gosalesdw1021`.`emp_expense_type_dim` `T5` ON `EMP_TRAINING_FACT`.`expense_type_key` = `T5`.`expense_type_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_TIME_DIM`.`quarter_key` IN ( 
         20121 ) AND
     `T5`.`expense_group_code` IN ( 
         404 ) 
 GROUP BY 
     `T01`.`organization_code1`
 
 

;



-- id: 5373
     `SLS_PRODUCT_DIM`.`product_brand_key`, 
     `T1`.`product_brand_en`
 FROM
     `gosalesdw1021`.`sls_product_brand_lookup` `T1` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T1`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_brand_key` ASC
 
 

;



-- id: 5783
     `Product__brand_`.`PRODUCT_BRAND_KEY` AS `column0`, 
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



-- id: 5807
     `SLS_PRODUCT_DIM`.`product_brand_key`, 
     `T1`.`product_brand_en`
 FROM
     `gosalesdw1021`.`sls_product_brand_lookup` `T1` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T1`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_brand_key` ASC
 
 

;



-- id: 6217
     `Product__brand_`.`PRODUCT_BRAND_KEY` AS `column0`, 
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



-- id: 6241
     `SLS_PRODUCT_DIM`.`product_brand_key`, 
     `T1`.`product_brand_en`
 FROM
     `gosalesdw1021`.`sls_product_brand_lookup` `T1` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T1`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_brand_key` ASC
 
 

;



-- id: 6651
     `Product__brand_`.`PRODUCT_BRAND_KEY` AS `column0`, 
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



-- id: 6671
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 6698
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
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) = '2011'
 
 

;



-- id: 6714
     `T2`.`quarter_key`, 
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



-- id: 6733
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     concat(`T1`.`quarter_en`, ' '), 
     `GO_TIME_DIM`.`current_year`, 
     `GO_TIME_DIM`.`month_key`, 
     concat(`GO_TIME_DIM`.`month_en`, ' '), 
     CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8))
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T1` ON `GO_TIME_DIM`.`quarter_key` = `T1`.`quarter_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2011'
 
 

;



-- id: 6742
     `T0`.`REGION_CODE`, 
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



-- id: 6750
     `SLS_RETAILER_DIM`.`retailer_type_code`, 
     `SLS_RETAILER_DIM`.`retailer_type_en`
 FROM
     `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` 
 ORDER BY 
     `SLS_RETAILER_DIM`.`retailer_type_code` ASC
 
 

;



-- id: 6774
     `SLS_PRODUCT_DIM`.`product_brand_key`, 
     `T1`.`product_brand_en`
 FROM
     `gosalesdw1021`.`sls_product_brand_lookup` `T1` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T1`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_brand_key` ASC
 
 

;



-- id: 7184
     `Product__brand_`.`PRODUCT_BRAND_KEY` AS `column0`, 
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



-- id: 7208
     `SLS_PRODUCT_DIM`.`product_brand_key`, 
     `T1`.`product_brand_en`
 FROM
     `gosalesdw1021`.`sls_product_brand_lookup` `T1` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T1`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_brand_key` ASC
 
 

;



-- id: 7618
     `Product__brand_`.`PRODUCT_BRAND_KEY` AS `column0`, 
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



-- id: 7642
     `SLS_PRODUCT_DIM`.`product_brand_key`, 
     `T1`.`product_brand_en`
 FROM
     `gosalesdw1021`.`sls_product_brand_lookup` `T1` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T1`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_brand_key` ASC
 
 

;



-- id: 8052
     `Product__brand_`.`PRODUCT_BRAND_KEY` AS `column0`, 
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



-- id: 8076
     `SLS_PRODUCT_DIM`.`product_brand_key`, 
     `T1`.`product_brand_en`
 FROM
     `gosalesdw1021`.`sls_product_brand_lookup` `T1` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T1`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_brand_key` ASC
 
 

;



-- id: 8486
     `Product__brand_`.`PRODUCT_BRAND_KEY` AS `column0`, 
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



-- id: 8510
     `SLS_PRODUCT_DIM`.`product_brand_key`, 
     `T1`.`product_brand_en`
 FROM
     `gosalesdw1021`.`sls_product_brand_lookup` `T1` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T1`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_brand_key` ASC
 
 

;



-- id: 8920
     `Product__brand_`.`PRODUCT_BRAND_KEY` AS `column0`, 
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



-- id: 8944
     `SLS_PRODUCT_DIM`.`product_brand_key`, 
     `T1`.`product_brand_en`
 FROM
     `gosalesdw1021`.`sls_product_brand_lookup` `T1` JOIN `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` ON `T1`.`product_brand_code` = `SLS_PRODUCT_DIM`.`product_brand_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_brand_key` ASC
 
 

;



-- id: 9354
     `Product__brand_`.`PRODUCT_BRAND_KEY` AS `column0`, 
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



-- id: 9371
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 9383
     `GO_REGION_DIM`.`region_code` AS `column0`, 
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



-- id: 9398
     `GO_REGION_DIM`.`region_code` AS `column0`, 
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



-- id: 9413
     `GO_REGION_DIM`.`region_code` AS `column0`, 
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



-- id: 9457
     `GO_REGION_DIM`.`country_code` AS `column0`, 
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



-- id: 9534
     `GO_REGION_DIM`.`region_code` AS `column0`, 
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



-- id: 9549
     `T0`.`submission_key` AS `column0`, 
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



-- id: 9565
     `T2`.`quarter_key`, 
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



-- id: 9650
     `FIN_ACCOUNT_DIM`.`account_code1` AS `column0`, 
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



-- id: 9715
     `FIN_ACCOUNT_DIM`.`account_code1` AS `column0`, 
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
         'TOT_LIAB', 
         '301000', 
         '303000', 
         'TOT_LTOTHLIAB', 
         'TOT_EQTY', 
         '300100', 
         'TOT_CURRLIAB', 
         '300150', 
         '302000' ) AND
     `T5`.`submission_key` IN ( 
         705, 
         708 ) AND
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) IN ( 
         '2012', 
         '2011' ) AND
     `GO_TIME_DIM0`.`quarter_key` IN ( 
         20124, 
         20114 ) AND
     `GO_TIME_DIM0`.`month_key` IN ( 
         201212, 
         201112 ) 
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



-- id: 9780
     `FIN_ACCOUNT_DIM`.`account_code1` AS `column0`, 
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
         'TOT_OPASSTS', 
         'TOT_CURASSTS', 
         'TOT_OTHASSTS' ) AND
     `T4`.`submission_key` IN ( 
         705, 
         708 ) AND
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) IN ( 
         '2012', 
         '2011' ) AND
     `GO_TIME_DIM0`.`quarter_key` IN ( 
         20124, 
         20114 ) AND
     `GO_TIME_DIM0`.`month_key` IN ( 
         201212, 
         201112 ) 
 GROUP BY 
     `FIN_ACCOUNT_DIM`.`account_code1`, 
     `FIN_ACCOUNT_DIM`.`account_code2`, 
     `FIN_ACCOUNT_DIM`.`account_code3`, 
     `T4`.`submission_key`, 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     `GO_TIME_DIM0`.`month_key`
 
 

;



-- id: 9846
     `FIN_ACCOUNT_DIM`.`account_code1` AS `column0`, 
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
         705, 
         708 ) AND
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) IN ( 
         '2012', 
         '2011' ) AND
     `GO_TIME_DIM0`.`quarter_key` IN ( 
         20124, 
         20114 ) AND
     `GO_TIME_DIM0`.`month_key` IN ( 
         201212, 
         201112 ) 
 GROUP BY 
     `FIN_ACCOUNT_DIM`.`account_code1`, 
     `FIN_ACCOUNT_DIM`.`account_code2`, 
     `T4`.`submission_key`, 
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM0`.`quarter_key`, 
     `GO_TIME_DIM0`.`month_key`
 
 

;



-- id: 9858
     `EMP_EMPLOYEE_DIM`.`manager_code1` AS `column0`, 
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



-- id: 9870
     `EMP_EMPLOYEE_DIM`.`manager_code1` AS `column0`, 
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



-- id: 9900
     `EMP_EMPLOYEE_DIM`.`manager_code1` AS `column0`, 
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



-- id: 9930
     `EMP_EMPLOYEE_DIM`.`manager_code1` AS `column0`, 
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



-- id: 9945
     `EMP_EMPLOYEE_DIM`.`manager_code1` AS `column0`, 
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



-- id: 9965
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 10007
     `EMP_EMPLOYEE_DIM`.`manager_code1` AS `column0`, 
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



-- id: 10019
     `T0`.`expense_group_code` AS `column0`, 
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



-- id: 10077
     `T3`.`expense_group_code` AS `column0`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column1`, 
     SUM(`EMP_EXPENSE_FACT`.`expense_total`) AS `column2`
 FROM
     `gosalesdw1021`.`emp_expense_fact` `EMP_EXPENSE_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `EMP_EXPENSE_FACT`.`day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` ON `EMP_EXPENSE_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`emp_expense_type_dim` `T3` ON `EMP_EXPENSE_FACT`.`expense_type_key` = `T3`.`expense_type_key` 
 WHERE 
     `EMP_EMPLOYEE_DIM`.`employee_code` = 10323 AND
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) <> '2013' AND
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) IN ( 
         '2010', 
         '2011', 
         '2012' ) 
 GROUP BY 
     `T3`.`expense_group_code`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4))
 
 

;



-- id: 10089
     `EMP_EMPLOYEE_DIM`.`manager_code1` AS `column0`, 
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



-- id: 10101
     `T0`.`expense_group_code` AS `column0`, 
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



-- id: 10121
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 10151
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 10198
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 10263
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 10345
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 10420
     `EMP_EMPLOYEE_DIM`.`manager_code1` AS `column0`, 
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



-- id: 10471
     `T3`.`organization_code1` AS `column0`, 
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



-- id: 10538
     `T31`.`organization_code1`, 
     `T31`.`Sum1`, 
     `T31`.`Sum11`, 
     `T31`.`column3`
 FROM
     (
     SELECT
         `T01`.`organization_code1` AS `organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `C`, 
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `C1`, 
         SUM(`T4`.`position_count`) AS `column3`, 
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



-- id: 10561
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
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



-- id: 10584
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     concat(`T1`.`quarter_en`, ' '), 
     `GO_TIME_DIM`.`current_year`, 
     `GO_TIME_DIM`.`month_key`, 
     concat(`GO_TIME_DIM`.`month_en`, ' '), 
     CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8))
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T1` ON `GO_TIME_DIM`.`quarter_key` = `T1`.`quarter_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 1 AND
     `GO_TIME_DIM`.`month_number` <= 12 AND
     `GO_TIME_DIM`.`month_key` = 201001
 
 

;



-- id: 10651
     `T31`.`organization_code1`, 
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



-- id: 10702
     `T3`.`organization_code1` AS `column0`, 
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



-- id: 10769
     `T31`.`organization_code1`, 
     `T31`.`Sum1`, 
     `T31`.`Sum11`, 
     `T31`.`column3`
 FROM
     (
     SELECT
         `T01`.`organization_code1` AS `organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `C`, 
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `C1`, 
         SUM(`T4`.`position_count`) AS `column3`, 
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



-- id: 10836
     `T31`.`organization_code1`, 
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



-- id: 10887
     `T3`.`organization_code1` AS `column0`, 
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



-- id: 10954
     `T31`.`organization_code1`, 
     `T31`.`Sum1`, 
     `T31`.`Sum11`, 
     `T31`.`column3`
 FROM
     (
     SELECT
         `T01`.`organization_code1` AS `organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `C`, 
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `C1`, 
         SUM(`T4`.`position_count`) AS `column3`, 
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



-- id: 11021
     `T31`.`organization_code1`, 
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



-- id: 11072
     `T3`.`organization_code1` AS `column0`, 
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



-- id: 11139
     `T31`.`organization_code1`, 
     `T31`.`Sum1`, 
     `T31`.`Sum11`, 
     `T31`.`column3`
 FROM
     (
     SELECT
         `T01`.`organization_code1` AS `organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `C`, 
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `C1`, 
         SUM(`T4`.`position_count`) AS `column3`, 
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



-- id: 11206
     `T31`.`organization_code1`, 
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



-- id: 11257
     `T3`.`organization_code1` AS `column0`, 
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



-- id: 11324
     `T31`.`organization_code1`, 
     `T31`.`Sum1`, 
     `T31`.`Sum11`, 
     `T31`.`column3`
 FROM
     (
     SELECT
         `T01`.`organization_code1` AS `organization_code1`, 
         CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8)) AS `C`, 
         `GO_TIME_DIM`.`month_key` AS `month_key`, 
         `GO_TIME_DIM`.`quarter_key` AS `quarter_key`, 
         CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `C1`, 
         SUM(`T4`.`position_count`) AS `column3`, 
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



-- id: 11391
     `T31`.`organization_code1`, 
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



-- id: 11418
     AVG(`T0`.`days_to_fill`) AS `column0`
 FROM
     `gosalesdw1021`.`emp_recruitment_fact` `T0` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T0`.`post_day_key` = `GO_TIME_DIM`.`day_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) IN ( 
         '2010' )
 
 

;



-- id: 11449
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 11497
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 11563
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 11646
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 11688
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 11719
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 11767
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 11833
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 11875
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 11887
     `T0`.`campaign_code` AS `column0`, 
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



-- id: 11902
     `T0`.`campaign_code` AS `column0`, 
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



-- id: 11931
     `T1`.`campaign_code` AS `column0`, 
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



-- id: 11973
     `T11`.`campaign_code` AS `column0`, 
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



-- id: 11993
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 12008
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 12027
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     concat(`T1`.`quarter_en`, ' '), 
     `GO_TIME_DIM`.`current_year`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T1` ON `GO_TIME_DIM`.`quarter_key` = `T1`.`quarter_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2012' AND
     `GO_TIME_DIM`.`month_number` < 37
 
 

;



-- id: 12039
     `T0`.`campaign_code` AS `column0`, 
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



-- id: 12059
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 12086
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



-- id: 12144
     `SLS_PRODUCT_DIM`.`product_line_code`, 
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



-- id: 12298
     `Product`.`Product_line_code` AS `column0`, 
     `Product`.`Product_type_key` AS `column1`, 
     `Product`.`Base_product_key` AS `column2`, 
     SUM(`T10`.`sale_total`) AS `column3`
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
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`, 
     `Product`.`Base_product_key` 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 12452
     `Product`.`Product_line_code` AS `column0`, 
     `Product`.`Product_type_key` AS `column1`, 
     `Product`.`Base_product_key` AS `column2`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column3`
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
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`, 
     `Product`.`Base_product_key` 
 ORDER BY 
     `column0` ASC
 
 

;



-- id: 12510
     `SLS_PRODUCT_DIM`.`product_line_code`, 
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



-- id: 12538
     `T1`.`campaign_code` AS `column0`, 
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



-- id: 12731
     `T13`.`campaign_code` AS `column0`, 
     `MRK_PROMOTION_DIM`.`promotion_key` AS `column1`, 
     `Product`.`Product_line_code` AS `column2`, 
     `Product`.`Product_type_key` AS `column3`, 
     `Product`.`Base_product_key` AS `column4`, 
     SUM(`T101`.`gross_profit`) AS `column5`, 
     SUM(`T101`.`sale_total`) AS `column6`
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
         58, 
         55, 
         51, 
         60, 
         56, 
         53, 
         61, 
         50, 
         57, 
         54, 
         52 ) 
 GROUP BY 
     `T13`.`campaign_code`, 
     `MRK_PROMOTION_DIM`.`promotion_key`, 
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`, 
     `Product`.`Base_product_key` 
 ORDER BY 
     `column0` ASC, 
     `column1` ASC, 
     `column2` ASC
 
 

;



-- id: 12929
     `T14`.`campaign_code` AS `column0`, 
     `MRK_PROMOTION_DIM`.`promotion_key` AS `column1`, 
     `Product`.`Product_line_code` AS `column2`, 
     `Product`.`Product_type_key` AS `column3`, 
     `Product`.`Base_product_key` AS `column4`, 
     SUM(`T121`.`promotion_plan_revenue`) AS `column5`
 FROM
     `gosalesdw1021`.`mrk_promotion_plan_fact` `T121` JOIN 
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
     `T14`.`campaign_code` IN ( 
         58, 
         55, 
         51, 
         60, 
         56, 
         53, 
         61, 
         50, 
         57, 
         54, 
         52 ) 
 GROUP BY 
     `T14`.`campaign_code`, 
     `MRK_PROMOTION_DIM`.`promotion_key`, 
     `Product`.`Product_line_code`, 
     `Product`.`Product_type_key`, 
     `Product`.`Base_product_key` 
 ORDER BY 
     `column0` ASC, 
     `column1` ASC, 
     `column2` ASC
 
 

;



-- id: 12949
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 12976
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
     NOT ( CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) IN ( 
         '2013' ) )
 
 

;



-- id: 13011
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`, 
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



-- id: 13038
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) AS `column0`, 
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



-- id: 13046
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



-- id: 13054
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



-- id: 13062
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



-- id: 13070
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



-- id: 13078
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



-- id: 13086
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



-- id: 13094
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



-- id: 13102
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



-- id: 13110
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



-- id: 13118
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



-- id: 13126
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



-- id: 13134
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



-- id: 13142
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



-- id: 13150
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



-- id: 13158
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



-- id: 13166
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



-- id: 13174
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



-- id: 13182
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



-- id: 13190
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



-- id: 13198
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



-- id: 13232
     `T21`.`C`, 
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
         `GO_TIME_DIM0`.`month_key` = 201210 OR
         `GO_TIME_DIM0`.`month_key` IS NULL OR
         `GO_TIME_DIM0`.`month_key` IS NULL OR
         `GO_TIME_DIM0`.`month_key` IS NULL OR
         `GO_TIME_DIM0`.`month_key` IS NULL OR
         `GO_TIME_DIM0`.`month_key` IS NULL) 
     GROUP BY 
         `GO_TIME_DIM0`.`quarter_key`, 
         CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
         `GO_TIME_DIM0`.`month_key`
     ) `T21`
 
 

;



-- id: 13266
     `T21`.`C`, 
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
         `GO_TIME_DIM0`.`month_key` = 201212 OR
         `GO_TIME_DIM0`.`month_key` IS NULL OR
         `GO_TIME_DIM0`.`month_key` IS NULL OR
         `GO_TIME_DIM0`.`month_key` IS NULL OR
         `GO_TIME_DIM0`.`month_key` IS NULL OR
         `GO_TIME_DIM0`.`month_key` IS NULL) 
     GROUP BY 
         `GO_TIME_DIM0`.`quarter_key`, 
         CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)), 
         `GO_TIME_DIM0`.`month_key`
     ) `T21`
 
 

;



-- id: 13283
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 13349
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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
     `EMP_POSITION_DIM`.`position_code3` = 340 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) 
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



-- id: 13364
     `T0`.`recruitment_type_code` AS `column0`, 
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



-- id: 13422
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 13488
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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
     `EMP_POSITION_DIM`.`position_code3` = 320 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) 
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



-- id: 13546
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 13612
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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
     `EMP_POSITION_DIM`.`position_code3` = 380 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) 
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



-- id: 13670
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 13736
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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
     `EMP_POSITION_DIM`.`position_code3` = 300 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) 
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



-- id: 13794
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 13860
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) 
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



-- id: 13918
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 13984
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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
     `EMP_POSITION_DIM`.`position_code3` = 350 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) 
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



-- id: 14042
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 14108
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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
     `EMP_POSITION_DIM`.`position_code3` = 330 AND
     `EMP_POSITION_DIM`.`position_code2` = 200 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) 
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



-- id: 14166
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 14232
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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
     `EMP_POSITION_DIM`.`position_code3` = 360 AND
     `EMP_POSITION_DIM`.`position_code2` = 220 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) 
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



-- id: 14290
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 14348
     `T2`.`recruitment_type_code` AS `column0`, 
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



-- id: 14414
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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
     `EMP_POSITION_DIM`.`position_code3` = 390 AND
     `EMP_POSITION_DIM`.`position_code2` = 220 AND
     `EMP_POSITION_DIM`.`position_code1` = 100 AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1100 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) AND
     (`EMP_POSITION_DIM`.`position_code3` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code2` <> 1000 OR
     `EMP_POSITION_DIM`.`position_code1` <> 100) 
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



-- id: 14472
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 14523
     `T3`.`organization_code1` AS `column0`, 
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



-- id: 14554
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 14602
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 14668
     `EMP_POSITION_DIM`.`position_code1` AS `column0`, 
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



-- id: 14747
     `D1`.`C0`, 
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
             'GOSEU', 
             'GOEAX', 
             'GOCEU', 
             'GONEU', 
             'GOAMX' ) AND
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



-- id: 14842
     `T01`.`organization_code1` AS `column0`, 
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
         'GOSEU', 
         'GOEAX', 
         'GOCEU', 
         'GONEU', 
         'GOAMX' ) AND
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



-- id: 14954
     `Product`.`Product_line_code`, 
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



-- id: 14966
     `T0`.`order_method_key` AS `column0`, 
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



-- id: 15140
     `Product`.`Product_line_code` AS `column0`, 
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



-- id: 15308
     `Product`.`Product_line_code` AS `column0`, 
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



-- id: 15312
     `GO_TIME_DIM`.`day_date`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4))
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM`

;



-- id: 15334
     `GO_TIME_DIM`.`day_date`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     concat(`T1`.`quarter_en`, ' '), 
     `GO_TIME_DIM`.`current_year`
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` JOIN `gosalesdw1021`.`go_time_quarter_lookup` `T1` ON `GO_TIME_DIM`.`quarter_key` = `T1`.`quarter_key`
 
 

;



-- id: 15338
     `GO_TIME_DIM`.`day_date`, 
     `GO_TIME_DIM`.`quarter_key`, 
     `GO_TIME_DIM`.`month_key`, 
     concat(`GO_TIME_DIM`.`month_en`, ' '), 
     `GO_TIME_DIM`.`current_year`, 
     CAST(`GO_TIME_DIM`.`day_key` AS CHAR(8))
 FROM
     `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM`

;



-- id: 15346
     `SLS_RETAILER_DIM`.`retailer_type_code`, 
     `SLS_RETAILER_DIM`.`retailer_type_en`
 FROM
     `gosalesdw1021`.`sls_rtl_dim` `SLS_RETAILER_DIM` 
 ORDER BY 
     `SLS_RETAILER_DIM`.`retailer_type_code` ASC
 
 

;



-- id: 15358
     `T0`.`return_reason_key` AS `column0`, 
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



-- id: 15453
     `GO_TIME_DIM`.`day_date`, 
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



-- id: 15462
     `T0`.`REGION_CODE`, 
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



-- id: 15486
     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 15669
     `GO_TIME_DIM`.`day_date`, 
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



-- id: 15684
     `T0`.`return_reason_key` AS `column0`, 
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



-- id: 15726
     `T2`.`return_reason_key` AS `column0`, 
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



-- id: 15768
     `T2`.`return_reason_key` AS `column0`, 
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



-- id: 15810
     `T2`.`return_reason_key` AS `column0`, 
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



-- id: 15852
     `T2`.`return_reason_key` AS `column0`, 
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



-- id: 15894
     `T2`.`return_reason_key` AS `column0`, 
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



-- id: 15921
     SUM(`T0`.`return_quantity`) AS `column0`
 FROM
     `gosalesdw1021`.`dist_returned_items_fact` `T0` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T0`.`day_key` = `GO_TIME_DIM`.`day_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36
 
 

;



-- id: 15948
     SUM(`SLS_SALES_FACT`.`quantity`) AS `column0`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` 
 WHERE 
     `GO_TIME_DIM`.`month_number` >= 25 AND
     `GO_TIME_DIM`.`month_number` <= 36
 
 

;



-- id: 15963
     `T0`.`return_reason_key` AS `column0`, 
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



-- id: 15980
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 16004
     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 16158
     `T101`.`return_reason_key` AS `column0`, 
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



-- id: 16328
     `Product`.`Product_line_code` AS `column0`, 
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



-- id: 16340
     `T0`.`order_method_key` AS `column0`, 
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



-- id: 16508
     `Product`.`Product_line_code` AS `column0`, 
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



-- id: 16520
     `T0`.`order_method_key` AS `column0`, 
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



-- id: 16535
     `T0`.`return_reason_key` AS `column0`, 
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



-- id: 16552
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 16576
     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 16746
     `T12`.`return_reason_key` AS `column0`, 
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



-- id: 16933
     `Product`.`Product_line_code` AS `column0`, 
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
 
 

;



-- id: 16957
     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 16974
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 17000
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
 
 

;



-- id: 17182
     `T01`.`organization_code1`, 
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



-- id: 17364
     `T01`.`organization_code1`, 
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



-- id: 17409
     `T3`.`organization_code1`, 
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



-- id: 17433
     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 17450
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 17476
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
 
 

;



-- id: 17658
     `T01`.`organization_code1`, 
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



-- id: 17840
     `T01`.`organization_code1`, 
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



-- id: 17885
     `T3`.`organization_code1`, 
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



-- id: 17909
     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 17926
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 17952
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
 
 

;



-- id: 18134
     `T01`.`organization_code1`, 
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



-- id: 18316
     `T01`.`organization_code1`, 
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



-- id: 18361
     `T3`.`organization_code1`, 
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



-- id: 18385
     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 18402
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 18428
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
 
 

;



-- id: 18610
     `T01`.`organization_code1`, 
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



-- id: 18792
     `T01`.`organization_code1`, 
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



-- id: 18837
     `T3`.`organization_code1`, 
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



-- id: 18861
     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 18878
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 18904
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
 
 

;



-- id: 19086
     `T01`.`organization_code1`, 
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



-- id: 19268
     `T01`.`organization_code1`, 
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



-- id: 19313
     `T3`.`organization_code1`, 
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



-- id: 19325
     `T0`.`order_method_key` AS `column0`, 
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



-- id: 19367
     `T2`.`order_method_key` AS `column0`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column1`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`sls_order_method_dim` `T2` ON `SLS_SALES_FACT`.`order_method_key` = `T2`.`order_method_key` 
 WHERE 
     `GO_TIME_DIM`.`quarter_key` = 20111 
 GROUP BY 
     `T2`.`order_method_key`
 
 

;



-- id: 19409
     `T2`.`order_method_key` AS `column0`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `column1`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`sls_order_method_dim` `T2` ON `SLS_SALES_FACT`.`order_method_key` = `T2`.`order_method_key` 
 WHERE 
     `GO_TIME_DIM`.`quarter_key` = 20111 
 GROUP BY 
     `T2`.`order_method_key`
 
 

;



-- id: 19426
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 19518
     `T31`.`organization_code1` AS `column0`, 
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



-- id: 19533
     `T0`.`expense_group_code` AS `column0`, 
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



-- id: 19665
     `T3`.`organization_code1` AS `column0`, 
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



-- id: 19677
     `EMP_EMPLOYEE_DIM`.`manager_code1` AS `column0`, 
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
     `EMP_EMPLOYEE_DIM`.`position_start_date` AS `column21`, 
     `EMP_EMPLOYEE_DIM`.`employee_code` AS `column22`
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
     `EMP_EMPLOYEE_DIM`.`position_start_date`, 
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



-- id: 19706
     `Successor__model_`.`SUCCESSOR_EMPLOYEE_KEY` AS `column0`, 
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



-- id: 19718
     `T0`.`successor_status_code` AS `column0`, 
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



-- id: 19830
     `EMP_EMPLOYEE_DIM`.`manager_code1` AS `column0`, 
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



-- id: 19941
     `GO_REGION_DIM`.`region_en` AS `Branch_region`, 
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



-- id: 20092
     `Product`.`Product_line` AS `Product_line`, 
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



-- id: 20249
     `Product`.`Product_line` AS `Product_line`, 
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



-- id: 20381
     `Product`.`Product_line` AS `Product_line`, 
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



-- id: 20422
     `Retailer_site`.`Region` AS `Region`, 
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



-- id: 20598
     `Product`.`Product_line` AS `Product_line`, 
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



-- id: 20651
     `T4`.`product_line_en`, 
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



-- id: 20808
     `Product`.`Product_line` AS `Product_line`, 
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



-- id: 20861
     `T41`.`product_line_en`, 
     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `SLS_PRODUCT_DIM`.`base_product_key`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T41` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T41`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC, 
     `SLS_PRODUCT_DIM`.`base_product_key` ASC
 
 
     `MRK_ADV_FACT`.`base_product_key`, 
     `GO_TIME_DIM0`.`current_year`, 
     `MRK_ADV_FACT`.`adv_radio`, 
     `MRK_ADV_FACT`.`adv_television`, 
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
     `MRK_ADV_FACT`.`adv_radio`, 
     `MRK_ADV_FACT`.`adv_television`, 
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



-- id: 20997
     `Product`.`Product_line` AS `Product_line`, 
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



-- id: 21148
     `Product`.`Product_line` AS `Product_line`, 
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



-- id: 21184
     `GO_TIME_DIM`.`month_key` AS `Month_key`, 
     `T3`.`order_method_en` AS `Order_method_type`, 
     AVG((`SLS_SALES_FACT`.`sale_total` - `SLS_SALES_FACT`.`unit_cost` * `SLS_SALES_FACT`.`quantity`) / CASE WHEN `SLS_SALES_FACT`.`sale_total` = 0 THEN NULL ELSE `SLS_SALES_FACT`.`sale_total` END) AS `Gross_margin____`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`sls_order_method_dim` `T3` ON `SLS_SALES_FACT`.`order_method_key` = `T3`.`order_method_key` 
 GROUP BY 
     `GO_TIME_DIM`.`month_key`, 
     `T3`.`order_method_en`
 
 

;



-- id: 21225
     `T21`.`campaign_name_en` AS `Campaign_name`, 
     SUM(`T3`.`sale_total`) AS `Revenue`, 
     SUM(`T3`.`gross_profit`) AS `Gross_profit`
 FROM
     `gosalesdw1021`.`mrk_promotion_dim` `MRK_PROMOTION_DIM` JOIN `gosalesdw1021`.`mrk_campaign_lookup` `T21` ON `MRK_PROMOTION_DIM`.`campaign_code` = `T21`.`campaign_code` JOIN `gosalesdw1021`.`mrk_promotion_fact` `T3` ON `MRK_PROMOTION_DIM`.`promotion_key` = `T3`.`promotion_key` 
 GROUP BY 
     `T21`.`campaign_name_en`
 
 

;



-- id: 21307
     `T21`.`campaign_name_en` AS `Campaign_name`, 
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



-- id: 21317
     `T1`.`campaign_name_en` AS `Campaign_name`
 FROM
     `gosalesdw1021`.`mrk_campaign_lookup` `T1` 
 GROUP BY 
     `T1`.`campaign_name_en`
 
 

;



-- id: 21343
     `GO_BRANCH_DIM`.`city` AS `City`, 
     AVG(`T1`.`days_to_fill`) AS `Days_to_fill`
 FROM
     `gosalesdw1021`.`emp_recruitment_fact` `T1` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `T1`.`branch_key` = `GO_BRANCH_DIM`.`branch_key` 
 GROUP BY 
     `GO_BRANCH_DIM`.`city`
 
 

;



-- id: 21384
     `GO_TIME_DIM`.`current_year` AS `Year0`, 
     `T3`.`recruitment_type_en` AS `Recruitment_type`, 
     AVG(`T11`.`days_to_fill`) AS `Days_to_fill`
 FROM
     `gosalesdw1021`.`emp_recruitment_fact` `T11` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T11`.`post_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`emp_recruitment_dim` `T3` ON `T3`.`recruitment_medium_key` = `T11`.`recruitment_medium_key` 
 GROUP BY 
     `GO_TIME_DIM`.`current_year`, 
     `T3`.`recruitment_type_en`
 
 

;



-- id: 21593
     `T51`.`Organization_name__level_1_` AS `Organization_name__level_1_`, 
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



-- id: 21653
     `T21`.`Position_name__level_3_` AS `Position_department__level_3_`, 
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



-- id: 21710
     `GO_REGION_DIM`.`region_en` AS `Region`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue`, 
     SUM(`SLS_SALES_FACT`.`unit_price` * `SLS_SALES_FACT`.`quantity`) AS `Planned_revenue`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `SLS_SALES_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` 
 GROUP BY 
     `GO_REGION_DIM`.`region_en`
 
 

;



-- id: 21720
     `GO_REGION_DIM`.`region_en` AS `Region`
 FROM
     `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` 
 GROUP BY 
     `GO_REGION_DIM`.`region_en`
 
 

;



-- id: 21777
     `GO_REGION_DIM`.`region_en` AS `Branch_region`, 
     SUM(`T5`.`sales_target`) AS `Sales_target`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`sls_sales_targ_fact` `T5` ON `T5`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` 
 GROUP BY 
     `GO_REGION_DIM`.`region_en`
 
 

;



-- id: 21891
     `GO_REGION_DIM`.`region_en` AS `Branch_region`, 
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



-- id: 21948
     `GO_REGION_DIM`.`country_en` AS `Country`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue`
 FROM
     `gosalesdw1021`.`emp_employee_dim` `EMP_EMPLOYEE_DIM` JOIN `gosalesdw1021`.`go_branch_dim` `GO_BRANCH_DIM` ON `EMP_EMPLOYEE_DIM`.`branch_code` = `GO_BRANCH_DIM`.`branch_code` JOIN `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` ON `SLS_SALES_FACT`.`employee_key` = `EMP_EMPLOYEE_DIM`.`employee_key` JOIN `gosalesdw1021`.`go_region_dim` `GO_REGION_DIM` ON `GO_REGION_DIM`.`country_code` = `GO_BRANCH_DIM`.`country_code` 
 GROUP BY 
     `GO_REGION_DIM`.`country_en`
 
 

;



-- id: 22084
     `Product`.`Product_type` AS `Product_type`, 
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



-- id: 22110
     `T2`.`order_method_en` AS `Order_method_type`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`sls_order_method_dim` `T2` ON `SLS_SALES_FACT`.`order_method_key` = `T2`.`order_method_key` 
 GROUP BY 
     `T2`.`order_method_en`
 
 

;



-- id: 22246
     `Product`.`Product_line` AS `Product_line`, 
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



-- id: 22543
     `T41`.`product_line_en`, 
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



-- id: 22680
     `GO_TIME_DIM`.`day_key` AS `Day_key`, 
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
 
 
 org.apache.tez.dag.api.SessionNotRunning: Application not running, applicationId=application_1432579242504_0001, yarnApplicationState=FINISHED, finalApplicationStatus=SUCCEEDED, trackingUrl=http://drv-hdpc3.ottawa.ibm.com:8088/proxy/application_1432579242504_0001/, diagnostics=Session stats:submittedDAGs=349, successfulDAGs=348, failedDAGs=1, killedDAGs=0
 
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



-- id: 22797
     `GO_TIME_DIM`.`day_key` AS `Day_key`, 
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



-- id: 22914
     `GO_TIME_DIM`.`day_key` AS `Day_key`, 
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



-- id: 22938
     `T2`.`product_line_en`, 
     `SLS_PRODUCT_DIM`.`product_line_code`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 23141
     `T71`.`base_product_key`, 
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
 
 
 org.apache.tez.dag.api.SessionNotRunning: Application not running, applicationId=application_1432579242504_0003, yarnApplicationState=FINISHED, finalApplicationStatus=SUCCEEDED, trackingUrl=http://drv-hdpc3.ottawa.ibm.com:8088/proxy/application_1432579242504_0003/, diagnostics=Session stats:submittedDAGs=6, successfulDAGs=6, failedDAGs=0, killedDAGs=0
 
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



-- id: 23286
     `T71`.`base_product_key`, 
     `T71`.`expected_volume`
 FROM
     `gosalesdw1021`.`dist_product_forecast_fact` `T71` 
 ORDER BY 
     `T71`.`base_product_key` ASC
 
 
 org.apache.tez.dag.api.SessionNotRunning: Application not running, applicationId=application_1432579242504_0005, yarnApplicationState=FINISHED, finalApplicationStatus=SUCCEEDED, trackingUrl=http://drv-hdpc3.ottawa.ibm.com:8088/proxy/application_1432579242504_0005/, diagnostics=Session stats:submittedDAGs=5, successfulDAGs=5, failedDAGs=0, killedDAGs=0
 
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
 
 
 org.apache.tez.dag.api.SessionNotRunning: Application not running, applicationId=application_1432579242504_0006, yarnApplicationState=FINISHED, finalApplicationStatus=SUCCEEDED, trackingUrl=http://drv-hdpc3.ottawa.ibm.com:8088/proxy/application_1432579242504_0006/, diagnostics=Session stats:submittedDAGs=1, successfulDAGs=1, failedDAGs=0, killedDAGs=0
 
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



-- id: 23431
     `T71`.`base_product_key`, 
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



-- id: 23576
     `T71`.`base_product_key`, 
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



-- id: 23721
     `T71`.`base_product_key`, 
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



-- id: 23897
     `Product`.`Product_line` AS `Product_line`, 
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



-- id: 24073
     `Product`.`Product_line` AS `Product_line`, 
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



-- id: 24256
     `T12`.`order_number` AS `Order_number`, 
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



-- id: 24443
     `T12`.`order_number` AS `Order_number`, 
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



-- id: 24484
     `T3`.`order_number` AS `Order_number`, 
     `GO_TIME_DIM`.`day_date` AS `Date0`, 
     SUM(`SLS_SALES_FACT`.`quantity`) AS `Quantity1`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`sls_sales_order_dim` `T3` ON `SLS_SALES_FACT`.`sales_order_key` = `T3`.`sales_order_key` 
 GROUP BY 
     `T3`.`order_number`, 
     `GO_TIME_DIM`.`day_date`
 
 

;



-- id: 24510
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue`, 
     `T2`.`order_number` AS `Order_number`, 
     `T2`.`order_number` AS `Order_number1`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`sls_sales_order_dim` `T2` ON `SLS_SALES_FACT`.`sales_order_key` = `T2`.`sales_order_key` 
 GROUP BY 
     `T2`.`order_number`
 
 

;



-- id: 24554
     `T2`.`order_number` AS `Order_number`, 
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



-- id: 24598
     `T2`.`order_number` AS `Order_number`, 
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



-- id: 24642
     `T2`.`order_number` AS `Order_number`, 
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



-- id: 24668
     `T2`.`order_method_en` AS `Order_method_type`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue1`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`sls_order_method_dim` `T2` ON `SLS_SALES_FACT`.`order_method_key` = `T2`.`order_method_key` 
 GROUP BY 
     `T2`.`order_method_en`
 
 

;



-- id: 24825
     `T11`.`order_number` AS `Order_number`, 
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



-- id: 24995
     `T11`.`order_number` AS `Order_number`, 
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



-- id: 25036
     `T3`.`order_number` AS `Order_number`, 
     `GO_TIME_DIM`.`day_date` AS `Date0`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`sls_sales_order_dim` `T3` ON `SLS_SALES_FACT`.`sales_order_key` = `T3`.`sales_order_key` 
 GROUP BY 
     `T3`.`order_number`, 
     `GO_TIME_DIM`.`day_date`
 
 

;



-- id: 25172
     `Product`.`Product_name` AS `Product`, 
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



-- id: 25287
     `Product`.`Product_name` AS `Product_name`, 
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



-- id: 25402
     `Product`.`Product_name` AS `Product_name`, 
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



-- id: 25538
     `Product`.`Product_name` AS `Product`, 
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



-- id: 25548
     `T1`.`order_method_en` AS `useValue`, 
     `T1`.`order_method_en` AS `displayValue`
 FROM
     `gosalesdw1021`.`sls_order_method_dim` `T1` 
 GROUP BY 
     `T1`.`order_method_en`
 
 

;



-- id: 25724
     `Product`.`Product_name` AS `Product_name`, 
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



-- id: 25884
     `Product`.`Product_name` AS `Product_name`, 
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



-- id: 26020
     `Product`.`Product_type` AS `Product_type`, 
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



-- id: 26156
     `Product`.`Product_line_code` AS `column0`, 
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



-- id: 26292
     `Product`.`Product_line_code` AS `column0`, 
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



-- id: 26428
     `Product`.`Product_line_code` AS `column0`, 
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



-- id: 26579
     `Product`.`Product_name` AS `Product_name`, 
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



-- id: 26605
     `SLS_RETAILER_DIM`.`retailer_name`, 
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



-- id: 26637
     `Retailer_site`.`Retailer_name` AS `Retailer_name`, 
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



-- id: 26755
     `Product`.`Product_line` AS `Product_line`, 
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



-- id: 26796
     `T3`.`order_number` AS `Order_number`, 
     `T21`.`order_method_en` AS `Order_method`, 
     SUM(`SLS_SALES_FACT`.`sale_total`) AS `Revenue`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`sls_order_method_dim` `T21` ON `SLS_SALES_FACT`.`order_method_key` = `T21`.`order_method_key` JOIN `gosalesdw1021`.`sls_sales_order_dim` `T3` ON `SLS_SALES_FACT`.`sales_order_key` = `T3`.`sales_order_key` 
 GROUP BY 
     `T3`.`order_number`, 
     `T21`.`order_method_en`
 
 

;



-- id: 26838
     `T01`.`product_name`, 
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



-- id: 28145
     `T41`.`product_line_en`, 
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



-- id: 28297
     `Product`.`Product_line_code` AS `column0`, 
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
 
 
 org.apache.tez.dag.api.SessionNotRunning: Application not running, applicationId=application_1432579242504_0010, yarnApplicationState=FINISHED, finalApplicationStatus=SUCCEEDED, trackingUrl=http://drv-hdpc3.ottawa.ibm.com:8088/proxy/application_1432579242504_0010/, diagnostics=Session stats:submittedDAGs=20, successfulDAGs=20, failedDAGs=0, killedDAGs=0
 
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



-- id: 28433
     `Product`.`Product_line_code` AS `column0`, 
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



-- id: 28585
     `Product`.`Product_line_code` AS `column0`, 
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



-- id: 28721
     `Product`.`Product_line_code` AS `column0`, 
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



-- id: 28738
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 28764
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
 
 

;



-- id: 28802
     `T1`.`organization_code3`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_org_dim` `T1` ON `SLS_SALES_FACT`.`organization_key` = `T1`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2011' AND
     `GO_TIME_DIM`.`quarter_key` = 20111
 
 

;



-- id: 28840
     `T1`.`organization_code3`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_org_dim` `T1` ON `SLS_SALES_FACT`.`organization_key` = `T1`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` 
 WHERE 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)) = '2010' AND
     `GO_TIME_DIM`.`quarter_key` = 20101
 
 

;



-- id: 28864
     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 28881
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 28907
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
 
 

;



-- id: 29070
     `T10`.`organization_code3`, 
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



-- id: 29233
     `T10`.`organization_code3`, 
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



-- id: 29257
     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 29274
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 29300
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
 
 

;



-- id: 29463
     `T10`.`organization_code3`, 
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



-- id: 29626
     `T10`.`organization_code3`, 
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



-- id: 29650
     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 29667
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 29693
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
 
 

;



-- id: 29856
     `T10`.`organization_code3`, 
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



-- id: 30019
     `T10`.`organization_code3`, 
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



-- id: 30043
     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 30060
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 30086
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
 
 

;



-- id: 30249
     `T10`.`organization_code3`, 
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



-- id: 30412
     `T10`.`organization_code3`, 
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



-- id: 30436
     `SLS_PRODUCT_DIM`.`product_line_code`, 
     `T2`.`product_line_en`
 FROM
     `gosalesdw1021`.`sls_product_dim` `SLS_PRODUCT_DIM` JOIN `gosalesdw1021`.`sls_product_line_lookup` `T2` ON `SLS_PRODUCT_DIM`.`product_line_code` = `T2`.`product_line_code` 
 ORDER BY 
     `SLS_PRODUCT_DIM`.`product_line_code` ASC
 
 

;



-- id: 30453
     CAST(`GO_TIME_DIM0`.`current_year` AS CHAR(4)) AS `column0`
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



-- id: 30479
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
 
 

;



-- id: 30642
     `T10`.`organization_code3`, 
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



-- id: 30805
     `T10`.`organization_code3`, 
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



-- id: 30817
     `T0`.`order_method_key` AS `column0`, 
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



-- id: 30876
     `T11`.`organization_code3`, 
     `T3`.`order_method_key`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_org_dim` `T11` ON `SLS_SALES_FACT`.`organization_key` = `T11`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`sls_order_method_dim` `T3` ON `SLS_SALES_FACT`.`order_method_key` = `T3`.`order_method_key` 
 WHERE 
     `GO_TIME_DIM`.`quarter_key` = 20111
 
 

;



-- id: 30935
     `T11`.`organization_code3`, 
     `T3`.`order_method_key`, 
     `SLS_SALES_FACT`.`sale_total`
 FROM
     `gosalesdw1021`.`sls_sales_fact` `SLS_SALES_FACT` JOIN `gosalesdw1021`.`go_org_dim` `T11` ON `SLS_SALES_FACT`.`organization_key` = `T11`.`organization_key` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `SLS_SALES_FACT`.`order_day_key` = `GO_TIME_DIM`.`day_key` JOIN `gosalesdw1021`.`sls_order_method_dim` `T3` ON `SLS_SALES_FACT`.`order_method_key` = `T3`.`order_method_key` 
 WHERE 
     `GO_TIME_DIM`.`quarter_key` = 20111
 
 

;



-- id: 30946
     `GO_TIME_DIM0`.`month_key`, 
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



-- id: 30972
     `GO_TIME_DIM0`.`month_key`, 
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



-- id: 30980
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



-- id: 31002
     `GO_TIME_DIM`.`month_key`, 
     CAST(`GO_TIME_DIM`.`current_year` AS CHAR(4)), 
     `GO_TIME_DIM`.`quarter_key`, 
     `T0`.`return_quantity`
 FROM
     `gosalesdw1021`.`dist_returned_items_fact` `T0` JOIN `gosalesdw1021`.`go_time_dim` `GO_TIME_DIM` ON `T0`.`day_key` = `GO_TIME_DIM`.`day_key`
 
 

;



