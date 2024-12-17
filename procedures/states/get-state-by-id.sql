DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetStateById$$

-- Create a new procedure to get a state by ID
CREATE PROCEDURE GetStateById(IN p_id INT)
BEGIN
    -- Select the state with the specified ID
    SELECT * FROM `states` WHERE `id` = p_id;
END$$

DELIMITER ;