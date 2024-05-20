-- # Turnock

-- A

SELECT c.cat_name, p.plant_name
FROM category c LEFT OUTER JOIN plant_type p 
ON p.category = c.cat_id;

-- B

SELECT plant_name, cat_name, qty_in_stock
FROM category c INNER JOIN plant_type p
ON p.category = c.cat_id
WHERE c.cat_name LIKE '%Tree%'
ORDER BY p.qty_in_stock;

-- C

SELECT e.l_name,e.date_hired, e.date_hired, e.service_length, p.plant_name
FROM employee e JOIN sale s 
ON e.emp_id = s.employee
JOIN plant_type p ON s.plant = p.plant_id
WHERE e.date_hired >= TO_DATE('2015-01-01', 'YYYY-MM-DD')
OR e.l_name LIKE 'M%'
ORDER BY e.date_hired DESC;

-- D

SELECT DISTINCT e.l_name, s.sale_date,s.sale_date + 30 AS Due_Date
FROM employee e 
JOIN sale s ON e.emp_id = s.employee
ORDER BY s.sale_date;

-- E

SELECT service_name,
    AVG(labor_cost) AS "Average Cost"
FROM service
GROUP BY service_name
HAVING 
	AVG(labor_cost) < 20;
	
-- F

SELECT e.l_name AS last_name, s.labor_cost,
    ROUND(s.labor_cost * 5/3, 3) AS "New Costs"
FROM service s
JOIN employee e ON s.service_id = e.service;

-- G

SELECT p.plant_name, s.sale_date, s.sale_qty, c.type 
FROM sale s
JOIN 
    (SELECT p.plant_id, p.plant_name, p.category
     FROM plant_type p
     JOIN category c ON p.category = c.cat_id
     WHERE c.type = 'T') p ON s.plant = p.plant_id
JOIN category c ON p.category = c.cat_id;

-- H

SELECT COUNT(*)
FROM sale;

-- I

SELECT service_name AS "Name of Service",
    MIN(labor_cost),
    AVG(labor_cost),
    MAX(labor_cost)
FROM service
GROUP BY service_name;

-- J

SELECT *
FROM
    (SELECT service_name, labor_cost
    FROM service
    WHERE service_name = 'Tree Planting' OR service_name = 'Hedge Planting')
PIVOT
    (AVG (labor_cost)
    FOR service_name IN ('Tree Planting' AS "Tree Planting", 'Hedge Planting' AS "Hedge Planting"));
