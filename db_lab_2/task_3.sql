USE labor_sql;

SELECT maker FROM pc
INNER JOIN product ON (pc.model=product.model)
WHERE speed >= 600
