-- 1. Clientes que compraron entre enero y marzo 2025
SELECT c.name, c.email, o.order_id, o.order_date, o.total_amount
FROM "proyecto_final_2".orders o
JOIN "proyecto_final_2".customers c ON o.customer_id = c.customer_id
WHERE o.order_date BETWEEN '2025-01-01' AND '2025-03-31'
ORDER BY o.order_date;

-- 2. Libros más vendidos
SELECT b.title, a.name AS autor, SUM(od.quantity) AS cantidad_vendida
FROM "proyecto_final_2".order_details od
JOIN "proyecto_final_2".books b ON od.book_id = b.book_id
JOIN "proyecto_final_2".authors a ON b.author_id = a.author_id
GROUP BY b.title, a.name
ORDER BY cantidad_vendida DESC
LIMIT 10;

-- 3. Ingresos por categoría
SELECT cat.name AS categoria, SUM(od.quantity * od.unit_price) AS total_ingresos
FROM "proyecto_final_2".order_details od
JOIN "proyecto_final_2".books b ON od.book_id = b.book_id
JOIN "proyecto_final_2".categories cat ON b.category_id = cat.category_id
GROUP BY cat.name;

-- 4. Clientes con más órdenes
SELECT c.name, c.email, COUNT(o.order_id) AS numero_ordenes
FROM "proyecto_final_2".customers c
JOIN "proyecto_final_2".orders o ON c.customer_id = o.customer_id
GROUP BY c.name, c.email
HAVING COUNT(o.order_id) > 1;
