CREATE DATABASE crm_project;
USE crm_project;
CREATE TABLE crm_data (
    customer_id VARCHAR(50),
    gender VARCHAR(10),
    senior_citizen INT,
    partner VARCHAR(10),
    dependents VARCHAR(10),
    tenure INT,
    phone_service VARCHAR(10),
    multiple_lines VARCHAR(20),
    internet_service VARCHAR(20),
    online_security VARCHAR(20),
    online_backup VARCHAR(20),
    device_protection VARCHAR(20),
    tech_support VARCHAR(20),
    streaming_tv VARCHAR(20),
    streaming_movies VARCHAR(20),
    contract VARCHAR(20),
    paperless_billing VARCHAR(10),
    payment_method VARCHAR(50),
    monthly_charges DECIMAL(10,2),
    total_charges DECIMAL(10,2),
    churn VARCHAR(10),
    TENURE_CUSTOMERS_LOYAL VARCHAR(10)
);
SELECT * FROM crm_data;

SELECT COUNT(*) AS TOTAL_CUSTOMERS FROM crm_data;       --  Total Customers

SELECT count(*) AS Total_customers FROM crm_data where churn = "yes";     --  TOTAL CUSTOMERS LEFT OR CHURN

SELECT count(*) AS Total_customers FROM crm_data where churn = "no";      -- TOTAL ACTIVE CUSTOMERS

SELECT 
    ROUND(
        SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),        -- CHURN RATE
    2) AS churn_rate
FROM crm_data;                                        

SELECT
      SUM(MonthlyCharges) AS Total_revenue,                                          -- REVENUE METRICS
      SUM(CASE WHEN Churn="yes" THEN MonthlyCharges ELSE 0 END) AS Revenue_Lost,
      SUM(CASE WHEN Churn="no" THEN MonthlyCharges ELSE 0 END) AS Revenue_retained
FROM crm_data;


SELECT 
     AVG(MonthlyCharges) as avg_charges,                 -- CUSTOMER BEHAVIOUR
     AVG(tenure) AS AVG_tenure 
from crm_data;

SELECT contract,churn, COUNT(*) AS total                  -- CHURN BY CONTRACT
from crm_data
GROUP BY contract,churn;

SELECT PaymentMethod,churn,COUNT(*) AS TOTAL                -- CHURN BY PAYMENT METHOD
FROM crm_data 
GROUP BY paymentMethod,churn;

SELECT 
CASE WHEN tenure<12 THEN "NEW"                     --  CHURN BY TENUREGROUP
     WHEN tenure<24 THEN "MID"
     ELSE "LOYAL"
     END AS TENURE_GROUP,
     churn,COUNT(*) AS TOTAL
FROM crm_data
GROUP BY TENURE_GROUP,churn;

SELeCT * FROM crm_data                                      -- HIGH RISK CUSTOMERS 
where churn="yes" AND  contract ="monthly";

SELeCT * FROM crm_data                                      -- low RISK CUSTOMERS 
where churn="NO" AND  contract ="one year";