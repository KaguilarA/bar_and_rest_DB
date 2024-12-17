DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetUserByState$$

-- Create a new procedure to get users by state
CREATE PROCEDURE GetUserByState(IN p_state INT)
BEGIN
    DECLARE state_exists INT;

    -- Check if the state ID exists in the states table
    SELECT COUNT(*) INTO state_exists
    FROM `states`
    WHERE `id` = p_state;

    -- If the state ID does not exist, signal an error
    IF state_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid state ID';
    ELSE
        -- Select users with the specified state along with their state information
        SELECT 
            `users`.`id`, 
            `users`.`name`, 
            `users`.`lastname`, 
            `users`.`username`, 
            `states`.`name` AS `state`, 
            `users`.`date_created`
        FROM 
            `users`
        INNER JOIN 
            `states` ON `users`.`state_id` = `states`.`id`
        WHERE 
            `users`.`state_id` = p_state
        ORDER BY 
            `users`.`date_created` DESC; -- Order the results by the date of creation in descending order
    END IF;
END$$

DELIMITER ;