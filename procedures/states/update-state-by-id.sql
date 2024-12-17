DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdateStateById$$

-- Create a new procedure to get a state by ID
CREATE PROCEDURE UpdateStateById(
    IN p_id INT,
    IN p_name VARCHAR(100)
)
BEGIN
    -- Update the state with the specified ID
    UPDATE `states`
    SET `name` = p_name
    WHERE `id` = p_id;
END$$

DELIMITER ;