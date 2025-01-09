DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS AddPermissionToUser$$

-- Create a new procedure to add a permission to a user
CREATE PROCEDURE AddPermissionToUser(
    IN p_user_id INT,
    IN p_permission_id INT
)
BEGIN
    -- Insert the permission for the user into the permissions_by_user table
    INSERT INTO `permissions_by_user` (`user_id`, `permission_id`)
    VALUES (p_user_id, p_permission_id);
END$$

DELIMITER ;