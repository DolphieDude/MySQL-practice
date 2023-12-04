START TRANSACTION;
	UPDATE driver SET surname = "Ivaniv" WHERE id_driver = 2;
ROLLBACK;
COMMIT;

START TRANSACTION;
	UPDATE driver SET surname = "Smetana" WHERE id_driver = 2;
    SAVEPOINT sp1;
    UPDATE driver SET surname = "Smith" WHERE id_driver = 6;
    ROLLBACK TO sp1;
ROLLBACK;
COMMIT;

START TRANSACTION;
	LOCK TABLES driver READ;
	SELECT * FROM driver;
    UPDATE driver SET surname = "Someone" WHERE id_driver = 6;
	UNLOCK TABLES;
COMMIT;


SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

START TRANSACTION;
	UPDATE driver SET surname = "Shevchenko" WHERE id_driver = 10;
	SELECT * FROM driver;
ROLLBACK;    
    