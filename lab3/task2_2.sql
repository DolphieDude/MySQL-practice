DELIMITER //
CREATE TRIGGER driver_BU0
BEFORE UPDATE
ON driver 
FOR EACH ROW
BEGIN
	IF NEW.experience IS NULL THEN
		SET NEW.experience = 0;
    ELSEIF NEW.experience > 8 THEN
		SET NEW.surname = CONCAT('Cpt. ', NEW.surname);
    END IF; 
END   