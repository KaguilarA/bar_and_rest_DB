DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetPermissionById$$

-- Create a new procedure to get a permission by ID
CREATE PROCEDURE GetPermissionById(
    IN p_id INT
)
BEGIN
    -- Select the permission with the specified ID from the permissions table
    SELECT 
        `id`, 
        `name`, 
        `description`
    FROM 
        `permissions` p
    WHERE 
        p.`id` = p_id;
END$$

DELIMITER ;