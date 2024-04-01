DROP PROCEDURE IF EXISTS even_numbers;
DELIMITER $$
CREATE PROCEDURE even_numbers (number INT)
BEGIN
	DECLARE result VARCHAR(250) DEFAULT '';
    DECLARE counter INT DEFAULT 1;
    WHILE (counter <= number) DO
		SET result = IF (counter % 2 = 0, CONCAT(result, ' ', counter), result);
        SET counter = counter + 1;
    END WHILE;
    SELECT result even_numbers;
END$$
DELIMITER ;

CALL even_numbers(100);