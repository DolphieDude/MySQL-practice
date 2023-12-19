## driver user
## REJECT
UPDATE travel SET payment = 9999999 WHERE id_driver = 6;

## ALLOW
SELECT * FROM travel;

## REJECT
INSERT INTO driver
VALUES ('A', 'A', 'A', 1);

## ALLOW
SELECT * FROM route;