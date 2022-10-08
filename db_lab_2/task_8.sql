USE labor_sql;

SELECT ship, country FROM outcomes
INNER JOIN classes ON (outcomes.ship = classes.class)
WHERE result = 'sunk'
