## client user
## ALLOW
UPDATE travel SET payment = 9999999 WHERE id_driver = 6;

## REJECT
UPDATE route SET default_payment = 0 WHERE id_route = 2;

## REJECT
INSERT INTO driver
VALUES ('A', 'A', 'A', 1);

## ALLOW
SELECT * FROM route;

## ALLOW
INSERT INTO travel (id_route, id_driver, id_second_driver, date_departure, date_arrival, payment)
VALUES (3, 1, 0, '2023-06-15 15:00:00', '2023-07-10 12:00:00', 333);