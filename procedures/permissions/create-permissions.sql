DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS CreatePermission$$

-- Create a new procedure to register a new permission
CREATE PROCEDURE CreatePermission(
    IN p_name VARCHAR(50),
    IN p_description VARCHAR(255)
)
BEGIN
    -- Insert the new permission into the permissions table
    INSERT INTO `permissions` (`name`, `description`)
    VALUES (p_name, p_description);
END$$

DELIMITER ;