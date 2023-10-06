CREATE VIEW Kyiv_routes AS
SELECT id_route, departure, destination
FROM route
WHERE departure = 'Kyiv' OR destination = 'Kyiv';