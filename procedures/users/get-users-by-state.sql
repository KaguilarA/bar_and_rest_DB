DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetUserByState$$

-- Create a new procedure to get users by state
CREATE PROCEDURE GetUserByState(IN p_state BOOLEAN)
BEGIN
    -- Select users with the specified state
    SELECT 
        `id`, 
        `name`, 
        `lastname`, 
        `username`, 
        `state`, 
        `date_created`
    FROM 
        `users`
    WHERE 
        `state` = p_state
    ORDER BY 
        `date_created` DESC; -- Order the results by the date of creation in descending order
END$$

DELIMITER ;