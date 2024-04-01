DROP FUNCTION IF EXISTS time_converter;
-- 60 sec = 1 min 3600 sec = 1 hour 86 400 sec = 1 day 
DELIMITER $$
CREATE FUNCTION time_converter (seconds INT)
RETURNS VARCHAR(100) READS SQL DATA
BEGIN
	DECLARE result VARCHAR(100);
    DECLARE seconds_of_day INT DEFAULT 86400;
    DECLARE seconds_of_hour INT DEFAULT 3600;
    DECLARE seconds_of_minute INT DEFAULT 60;
    DECLARE days INT DEFAULT ROUND(seconds / seconds_of_day);
    DECLARE hours INT DEFAULT ROUND((seconds - seconds_of_day * days) / seconds_of_hour);
    DECLARE minutes INT DEFAULT TRUNCATE((seconds - seconds_of_day * days - seconds_of_hour * hours) / seconds_of_minute, 0);
	SET result = CONCAT(days , ' days', ' ', 
		hours, ' hours', ' ',
        minutes, ' minutes', ' ',
        seconds - seconds_of_day * days - seconds_of_hour * hours - seconds_of_minute * minutes, ' seconds');
    RETURN result;
END$$
DELIMITER ;

SELECT time_converter(123456);