USE labor_sql;

SELECT maker,
CASE WHEN
( SELECT COUNT(*) FROM product WHERE type='pc' GROUP BY maker HAVING maker=P.maker )IS NOT NULL THEN 
concat('yes(', (SELECT COUNT(*)
FROM Product WHERE type='pc' GROUP BY maker HAVING maker=P.maker ), ')') 
ELSE 'no'
END AS pc FROM product P GROUP BY maker;
