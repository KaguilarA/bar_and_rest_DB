DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS CreateState$$

-- Create a new procedure to create a new state
CREATE PROCEDURE CreateState(
    IN p_name VARCHAR(100)
)
BEGIN
    INSERT INTO `states` (`name`)
    VALUES (p_name);
END$$

DELIMITER ;