DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetAllStates$$

-- Create a new procedure to get a user by ID
CREATE PROCEDURE GetAllStates()
BEGIN
    -- Select the user with the specified ID
    SELECT * FROM `states` ORDER BY `id` ASC;
END$$

DELIMITER ;