DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS AddPermissionToUser$$

-- Create a new procedure to add a permission to a user
CREATE PROCEDURE AddPermissionToUser(
    IN p_user_id INT,
    IN p_permission_id INT
)
BEGIN
    DECLARE user_exists INT;
    DECLARE permission_exists INT;

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
        -- Insert the permission for the user into the permissions_by_user table
        INSERT INTO `permissions_by_user` (`user_id`, `permission_id`)
        VALUES (p_user_id, p_permission_id);
    END IF;
END$$

DELIMITER ;