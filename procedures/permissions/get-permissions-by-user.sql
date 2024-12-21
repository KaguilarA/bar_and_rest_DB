DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetPermissionsByUserId$$

-- Create a new procedure to get permissions by user ID
CREATE PROCEDURE GetPermissionsByUserId(
    IN p_user_id INT
)
BEGIN
    -- Select the permissions associated with the specified user ID
    SELECT 
        `permissions`.`id`, 
        `permissions`.`name`, 
        `permissions`.`description`
    FROM 
        `permissions`
    INNER JOIN 
        `permissions_by_user` ON `permissions`.`id` = `permissions_by_user`.`permission_id`
    WHERE 
        `permissions_by_user`.`user_id` = p_user_id;
END$$

DELIMITER ;