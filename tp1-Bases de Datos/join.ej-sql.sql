🔥 🔗 INNER JOIN (solo coincidencias)
-- 1
SELECT e.nombre, t.nombre AS tipo
FROM evento e
INNER JOIN tipo_evento t ON e.id_tipo = t.id_tipo;

-- 2
SELECT e.nombre, s.nombre AS sponsor
FROM evento e
INNER JOIN sponsor s ON e.id_sponsor = s.id_sponsor;
🔥 🔗 LEFT JOIN (todo lo de la izquierda)
-- 1
SELECT h.nombre, ha.tipo
FROM hotel h
LEFT JOIN habitacion ha ON h.id_hotel = ha.id_hotel;

-- 2
SELECT l.nombre, a.nombre AS actividad
FROM lugar_turistico l
LEFT JOIN lugar_actividad la ON l.id_lugar = la.id_lugar
LEFT JOIN actividad a ON la.id_actividad = a.id_actividad;
🔥 🔗 RIGHT JOIN (todo lo de la derecha)
-- 1
SELECT h.nombre, ha.tipo
FROM habitacion ha
RIGHT JOIN hotel h ON ha.id_hotel = h.id_hotel;

-- 2
SELECT e.nombre, s.nombre AS sponsor
FROM evento e
RIGHT JOIN sponsor s ON e.id_sponsor = s.id_sponsor;
🔥 🔗 CROSS JOIN (producto cartesiano)
-- 1
SELECT h.nombre, s.nombre
FROM hotel h
CROSS JOIN servicio s;

-- 2
SELECT t.nombre, s.nombre
FROM tipo_evento t
CROSS JOIN sponsor s;

👉 Esto combina TODO con TODO (ojo en parciales 👀)

🔥 🔗 FULL OUTER JOIN (simulado en MySQL)

❗ MySQL/MariaDB NO lo tiene directamente
👉 se hace así:

-- 1
SELECT e.nombre, s.nombre
FROM evento e
LEFT JOIN sponsor s ON e.id_sponsor = s.id_sponsor

UNION

SELECT e.nombre, s.nombre
FROM evento e
RIGHT JOIN sponsor s ON e.id_sponsor = s.id_sponsor;
-- 2
SELECT h.nombre, ha.tipo
FROM hotel h
LEFT JOIN habitacion ha ON h.id_hotel = ha.id_hotel

UNION

SELECT h.nombre, ha.tipo
FROM hotel h
RIGHT JOIN habitacion ha ON h.id_hotel = ha.id_hotel;
🧠 RESUMEN (para que lo digas en el examen)
INNER JOIN → solo coincidencias
LEFT JOIN → todo izquierda + coincidencias
RIGHT JOIN → todo derecha + coincidencias
CROSS JOIN → combina todo con todo
FULL OUTER JOIN → todo de ambas (se simula con UNION)