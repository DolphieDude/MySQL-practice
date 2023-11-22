DELIMITER //
CREATE TRIGGER travel_BI0
BEFORE INSERT
ON travel 
FOR EACH ROW
BEGIN
	if NEW.id_second_driver is NULL THEN
		SET NEW.id_second_driver = 0;
    END IF;
END   