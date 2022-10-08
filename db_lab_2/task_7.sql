USE labor_sql;

SELECT maker, COUNT(maker) quantity
FROM   product
WHERE  model NOT IN (SELECT model FROM pc) AND type = 'PC'
GROUP BY maker