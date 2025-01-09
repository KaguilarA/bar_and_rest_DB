DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetAllPermissions$$

-- Create a new procedure to get all permissions
CREATE PROCEDURE GetAllPermissions()
BEGIN
    -- Select all permissions from the permissions table
    SELECT 
        `id`, 
        `name`, 
        `description`
    FROM 
        `permissions`
    ORDER BY 
        `id` ASC; -- Order the results by the name of the permission in ascending order
END$$

DELIMITER ;