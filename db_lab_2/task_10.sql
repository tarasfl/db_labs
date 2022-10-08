USE labor_sql;

SELECT 'laptop' as type, model, max(price)  FROM laptop
UNION
SELECT 'pc' as type, model, max(price)  FROM pc
UNION
SELECT 'printer' as type,model, max(price)  FROM printer