DELIMITER //
CREATE PROCEDURE `proc_with_cursor`()
BEGIN
	DECLARE id INT;
	DECLARE result DECIMAL(10);
    DECLARE done INT DEFAULT 0;
	DECLARE increase_cursor CURSOR FOR
		SELECT id_travel, payment
		FROM travel;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
    
    OPEN increase_cursor;
    REPEAT
		FETCH increase_cursor INTO id, result;
        IF NOT done THEN
			UPDATE travel SET payment = result + 1234
			WHERE id_travel = id;
        END IF;
	UNTIL done END REPEAT;  
    CLOSE increase_cursor;
END //
DELIMITER ;
