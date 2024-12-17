DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetAllUsers$$

-- Create a new procedure to get all users
CREATE PROCEDURE GetAllUsers()
BEGIN
    -- Select all users with their state information
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
    ORDER BY 
        `users`.`date_created` DESC; -- Order the results by the date of creation in descending order
END$$

DELIMITER ;