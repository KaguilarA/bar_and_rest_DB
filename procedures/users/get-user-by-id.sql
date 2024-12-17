DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetUserById$$

-- Create a new procedure to get an user by ID
CREATE PROCEDURE GetUserById(IN p_id INT)
BEGIN
    -- Select the user with the specified ID and their state information
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
        `users`.`id` = p_id
END$$

DELIMITER ;