USE labor_sql;

SELECT * FROM pc
INNER JOIN product ON (pc.model=product.model)
WHERE product.maker = "A" AND hd BETWEEN 10 and 20
ORDER BY speed