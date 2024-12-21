DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS ValidateUserPermission$$

-- Create a new procedure to validate if a user has a specific permission
CREATE PROCEDURE ValidateUserPermission(
    IN p_user_id INT,
    IN p_permission_id INT,
    OUT is_allowed BOOLEAN
)
BEGIN
    DECLARE user_exists INT;
    DECLARE permission_exists INT;
    DECLARE permission_count INT;

    -- Check if the user ID exists in the users table
    SELECT COUNT(*) INTO user_exists
    FROM `users`
    WHERE `id` = p_user_id;

    -- Check if the permission ID exists in the permissions table
    SELECT COUNT(*) INTO permission_exists
    FROM `permissions`
    WHERE `id` = p_permission_id;

    -- If either the user ID or the permission ID does not exist, signal an error
    IF user_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid user ID';
    ELSEIF permission_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid permission ID';
    ELSE
        -- Count the number of permissions for the user
        SELECT COUNT(*) INTO permission_count
        FROM `permissions_by_user`
        WHERE `user_id` = p_user_id AND `permission_id` = p_permission_id;

        -- Set the output parameter based on the count
        SET is_allowed = (permission_count > 0);
    END IF;
END$$

DELIMITER ;