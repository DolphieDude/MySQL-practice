START TRANSACTION;
	UPDATE route SET default_payment = default_payment + 1000 WHERE id_route = 1;
	SAVEPOINT before_changing_destination;
	UPDATE route SET destination = 'Milan' WHERE id_route = 1;
    
	ROLLBACK TO before_changing_destination;

COMMIT;