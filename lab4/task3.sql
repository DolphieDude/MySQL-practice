START TRANSACTION READ WRITE;

UPDATE travel SET payment = payment + 1000 WHERE id_route = 1;

COMMIT;