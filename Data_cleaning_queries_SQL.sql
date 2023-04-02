
set odps.sql.type.system.odps2=true
;
DROP TABLE IF EXISTS hamza_case_users_new
;

CREATE TABLE hamza_case_users_new
(
    UNIQUE_CARRIER_NAME     STRING
    ,YEAR                   DATE
    ,QUARTER                TINYINT
    ,Overall_OP_EXPENSES    STRING
    ,Overall_OP_PROFIT_LOSS STRING
    ,Overall_OP_REVENUES    STRING
    ,Rev_CHARTER_PAX        STRING
    ,Rev_CHARTER_PROP       STRING
    ,Rev_MAIL               STRING
    ,Rev_MISC_OP_REV        STRING
    ,Rev_PROP_BAG           STRING
    ,Rev_PROP_FREIGHT       STRING
    ,Rev_PUB_SVC_REVENUE    STRING
    ,Rev_RES_CANCEL_FEES    STRING
    ,Rev_TOTAL_CHARTER      STRING
    ,Rev_TOTAL_MISC_REV     STRING
    ,Rev_TOTAL_PROPERTY     STRING
    ,Rev_TRANS_REVENUE      STRING
    ,Rev_TRANS_REV_PAX      STRING
    ,Exp_AIRCFT_SERVICES    STRING
    ,Exp_FLYING_OPS         STRING
    ,Exp_GENERAL_ADMIN      STRING
    ,Exp_GENERAL_SERVICES   STRING
    ,Exp_MAINTENANCE        STRING
    ,Exp_PAX_SERVICE        STRING
    ,Exp_PROMOTION_SALES    STRING
    ,Exp_TRANS_EXPENSES     STRING
)
TBLPROPERTIES ('transactional' = 'true')
LIFECYCLE 14
;

-- SELECT * FROM hamza_case_users_new;
-- Updating the NA Values with 0s

UPDATE  hamza_case_users_new SET Overall_OP_EXPENSES = CASE   WHEN Overall_OP_EXPENSES = 'NA' THEN '0'
        ELSE Overall_OP_EXPENSES
END,Overall_OP_REVENUES = CASE   WHEN Overall_OP_REVENUES = 'NA' THEN '0'
        ELSE Overall_OP_REVENUES
END,Overall_OP_PROFIT_LOSS = CASE   WHEN Overall_OP_PROFIT_LOSS = 'NA' THEN '0'
        ELSE Overall_OP_PROFIT_LOSS
END,Rev_CHARTER_PAX = CASE   WHEN Rev_CHARTER_PAX = 'NA' THEN '0'
        ELSE Rev_CHARTER_PAX
END,Rev_CHARTER_PROP = CASE   WHEN Rev_CHARTER_PROP = 'NA' THEN '0'
        ELSE Rev_CHARTER_PROP
END,Rev_MAIL = CASE   WHEN Rev_MAIL = 'NA' THEN '0'
        ELSE Rev_MAIL
END,Rev_MISC_OP_REV = CASE   WHEN Rev_MISC_OP_REV = 'NA' THEN '0'
        ELSE Rev_MISC_OP_REV
END,Rev_PROP_BAG = CASE   WHEN Rev_PROP_BAG = 'NA' THEN '0'
        ELSE Rev_PROP_BAG
END,Rev_PROP_FREIGHT = CASE   WHEN Rev_PROP_FREIGHT = 'NA' THEN '0'
        ELSE Rev_PROP_FREIGHT
END,Rev_PUB_SVC_REVENUE = CASE   WHEN Rev_PUB_SVC_REVENUE = 'NA' THEN '0'
        ELSE Rev_PUB_SVC_REVENUE
END,Rev_RES_CANCEL_FEES = CASE   WHEN Rev_RES_CANCEL_FEES = 'NA' THEN '0'
        ELSE Rev_RES_CANCEL_FEES
END,Rev_TOTAL_CHARTER = CASE   WHEN Rev_TOTAL_CHARTER = 'NA' THEN '0'
        ELSE Rev_TOTAL_CHARTER
END,Rev_TOTAL_MISC_REV = CASE   WHEN Rev_TOTAL_MISC_REV = 'NA' THEN '0'
        ELSE Rev_TOTAL_MISC_REV
END,Rev_TOTAL_PROPERTY = CASE   WHEN Rev_TOTAL_PROPERTY = 'NA' THEN '0'
        ELSE Rev_TOTAL_PROPERTY
END,Rev_TRANS_REVENUE = CASE   WHEN Rev_TRANS_REVENUE = 'NA' THEN '0'
        ELSE Rev_TRANS_REVENUE
END,Rev_TRANS_REV_PAX = CASE   WHEN Rev_TRANS_REV_PAX = 'NA' THEN '0'
        ELSE Rev_TRANS_REV_PAX
END,Exp_AIRCFT_SERVICES = CASE   WHEN Exp_AIRCFT_SERVICES = 'NA' THEN '0'
        ELSE Exp_AIRCFT_SERVICES
END,Exp_FLYING_OPS = CASE   WHEN Exp_FLYING_OPS = 'NA' THEN '0'
        ELSE Exp_FLYING_OPS
END,Exp_GENERAL_ADMIN = CASE   WHEN Exp_GENERAL_ADMIN = 'NA' THEN '0'
        ELSE Exp_GENERAL_ADMIN
END,Exp_GENERAL_SERVICES = CASE   WHEN Exp_GENERAL_SERVICES = 'NA' THEN '0'
        ELSE Exp_GENERAL_SERVICES
END,Exp_MAINTENANCE = CASE   WHEN Exp_MAINTENANCE = 'NA' THEN '0'
        ELSE Exp_MAINTENANCE
END,Exp_PAX_SERVICE = CASE   WHEN Exp_PAX_SERVICE = 'NA' THEN '0'
        ELSE Exp_PAX_SERVICE
END,Exp_PROMOTION_SALES = CASE   WHEN Exp_PROMOTION_SALES = 'NA' THEN '0'
        ELSE Exp_PROMOTION_SALES
END,Exp_TRANS_EXPENSES = CASE   WHEN Exp_TRANS_EXPENSES = 'NA' THEN '0'
        ELSE Exp_TRANS_EXPENSES
END
WHERE   Overall_OP_EXPENSES = 'NA'
OR      Overall_OP_PROFIT_LOSS = 'NA'
OR      Overall_OP_REVENUES = 'NA'
OR      Rev_CHARTER_PROP = 'NA'
OR      Rev_MAIL = 'NA'
OR      Rev_MISC_OP_REV = 'NA'
OR      Rev_PROP_BAG = 'NA'
OR      Rev_PROP_FREIGHT = 'NA'
OR      Rev_PUB_SVC_REVENUE = 'NA'
OR      Rev_RES_CANCEL_FEES = 'NA'
OR      Rev_TOTAL_CHARTER = 'NA'
OR      Rev_TOTAL_MISC_REV = 'NA'
OR      Rev_TOTAL_PROPERTY = 'NA'
OR      Rev_TRANS_REVENUE = 'NA'
OR      Rev_TRANS_REV_PAX = 'NA'
OR      Exp_AIRCFT_SERVICES = 'NA'
OR      Exp_FLYING_OPS = 'NA'
OR      Exp_GENERAL_ADMIN = 'NA'
OR      Exp_GENERAL_SERVICES = 'NA'
OR      Exp_MAINTENANCE = 'NA'
OR      Exp_PAX_SERVICE = 'NA'
OR      Exp_PROMOTION_SALES = 'NA'
OR      Exp_TRANS_EXPENSES = 'NA'
;

-- SELECT * FROM hamza_case_users_new
;
--Fixing Outliers
UPDATE  hamza_case_users_new SET rev_charter_prop = '0',rev_misc_op_rev = '136525',rev_trans_revenue = '4382'
WHERE   UNIQUE_CARRIER_NAME = '           Southwest Airlines Co.            '
AND     year = '2008-01-01'
AND     quarter = '2'
;

--Updating Rev, Exp & P/L Columns
UPDATE  hamza_case_users_new 
SET rev_total_misc_rev = rev_misc_op_rev + rev_res_cancel_fees
,rev_total_charter = rev_charter_pax + rev_charter_prop
,rev_total_property = rev_prop_bag + rev_prop_freight
,exp_general_services = overall_op_expenses - (
            exp_aircft_services + exp_flying_ops + exp_general_admin + exp_maintenance + exp_pax_service + exp_promotion_sales + exp_trans_expenses
)
,overall_op_profit_loss = overall_op_revenues - overall_op_expenses
;

set odps.sql.type.system.odps2=true
;

DROP TABLE IF EXISTS hamza_users_clean;
CREATE TABLE hamza_users_clean 
TBLPROPERTIES ('transactional' = 'true')
LIFECYCLE 14 AS
SELECT TRIM(unique_carrier_name) AS Carrier
,year
,quarter
,CONCAT(SUBSTR(year,1,4),quarter) as Year_Quarter
,ROUND(CAST(SUM(overall_op_revenues) AS float), 0) AS TOTAL_REVENUE
,ROUND(CAST(SUM(overall_op_expenses) AS float),0) AS TOTAL_EXPENSES
,ROUND(CAST(SUM(overall_op_profit_loss) AS float),0) AS TOTAL_PROFIT_LOSS
,ROUND(CAST(SUM(Rev_CHARTER_PAX) AS float),0) AS Rev_CHARTER_PAX
,ROUND(CAST(SUM(Rev_CHARTER_PROP) AS float),0) AS Rev_CHARTER_PROP
,ROUND(CAST(SUM(Rev_MAIL) AS float),0) AS Rev_MAIL
,ROUND(CAST(SUM(Rev_MISC_OP_REV) AS float),0) AS Rev_MISC_OP_REV
,ROUND(CAST(SUM(Rev_PROP_BAG) AS float),0) AS Rev_PROP_BAG
,ROUND(CAST(SUM(Rev_PROP_FREIGHT) AS float),0) AS Rev_PROP_FREIGHT
,ROUND(CAST(SUM(Rev_PUB_SVC_REVENUE) AS float),0) AS Rev_PUB_SVC_REVENUE
,ROUND(CAST(SUM(Rev_RES_CANCEL_FEES) AS float),0) AS Rev_RES_CANCEL_FEES
,ROUND(CAST(SUM(Rev_TOTAL_CHARTER) AS float),0) AS Rev_TOTAL_CHARTER
,ROUND(CAST(SUM(Rev_TOTAL_MISC_REV) AS float),0) AS Rev_TOTAL_MISC_REV
,ROUND(CAST(SUM(Rev_TOTAL_PROPERTY) AS float),0) AS Rev_TOTAL_PROPERTY
,ROUND(CAST(SUM(Rev_TRANS_REVENUE) AS float),0) AS Rev_TRANS_REVENUE
,ROUND(CAST(SUM(Rev_TRANS_REV_PAX) AS float),0) AS Rev_TRANS_REV_PAX
,ROUND(CAST(SUM(Exp_AIRCFT_SERVICES) AS float),0) AS Exp_AIRCFT_SERVICES
,ROUND(CAST(SUM(Exp_FLYING_OPS) AS float),0) AS Exp_FLYING_OPS
,ROUND(CAST(SUM(Exp_GENERAL_ADMIN) AS float),0) AS Exp_GENERAL_ADMIN
,ROUND(CAST(SUM(Exp_GENERAL_SERVICES) AS float),0) AS Exp_GENERAL_SERVICES
,ROUND(CAST(SUM(Exp_MAINTENANCE) AS float),0) AS Exp_MAINTENANCE
,ROUND(CAST(SUM(Exp_PAX_SERVICE) AS float),0) AS Exp_PAX_SERVICE
-- ,ROUND(CAST(SUM(Exp_PROMOTION_SALES) AS float),0) AS Exp_PROMOTION_SALES
,ROUND(CAST(SUM(Exp_TRANS_EXPENSES) AS float),0) AS Exp_TRANS_EXPENSES
,ROUND(CAST(SUM(Exp_PROMOTION_SALES) AS float),0) AS Exp_PROMOTION_SALES
-- ,ROUND(CAST(SUM(Exp_TRANS_EXPENSES) AS float),0) AS Exp_TRANS_EXPENSES
FROM hamza_case_users_new
GROUP BY 
unique_carrier_name
,year
,quarter
,CONCAT(SUBSTR(year,1,4),quarter)
;

SELECT * FROM hamza_users_clean
;