SELECT 
    COUNT(DISTINCT CASE WHEN fiscal_year = 2020 THEN product_code END) AS unique_products_2020,
    COUNT(DISTINCT CASE WHEN fiscal_year = 2021 THEN product_code END) AS unique_products_2021,
    (COUNT(DISTINCT CASE WHEN fiscal_year = 2021 THEN product_code END) -
     COUNT(DISTINCT CASE WHEN fiscal_year = 2020 THEN product_code END)) * 100.0 /
     NULLIF(COUNT(DISTINCT CASE WHEN fiscal_year = 2020 THEN product_code END), 0) AS percentage_chg
FROM 
    fact_sales_monthly
WHERE 
    fiscal_year IN (2020, 2021);
    
    