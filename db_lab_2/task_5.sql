USE labor_sql;

SELECT maker FROM product
WHERE EXISTS
(SELECT model FROM PC)