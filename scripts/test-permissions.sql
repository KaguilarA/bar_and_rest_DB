-- Insert default permissions for the users

CALL bar_rest.CreatePermission('get states', 'this permission allows the get the states in the system');
CALL bar_rest.CreatePermission('get product type', 'this permission allows the user to get the product types in the system');
CALL bar_rest.CreatePermission('get user', 'this permission allows the user to get the users in the system');
CALL bar_rest.CreatePermission('get product', 'this permission allows the user to get products in the system');
CALL bar_rest.CreatePermission('get promo', 'this permission allows the user to get promos in the system');
CALL bar_rest.CreatePermission('get invoice', 'this permission allows the user to get invoices in the system');

CALL bar_rest.CreatePermission('register states', 'this permission allows the user to register states in the system');
CALL bar_rest.CreatePermission('register product type', 'this permission allows the user to register product types in the system');
CALL bar_rest.CreatePermission('register user', 'this permission allows the user to register in the system');
CALL bar_rest.CreatePermission('register product', 'this permission allows the user to register products in the system');
CALL bar_rest.CreatePermission('register promo', 'this permission allows the user to register promos in the system');
CALL bar_rest.CreatePermission('register invoice', 'this permission allows the user to register invoices in the system');

CALL bar_rest.CreatePermission('update states', 'this permission allows the user to update states in the system');
CALL bar_rest.CreatePermission('update product type', 'this permission allows the user to update product types in the system');
CALL bar_rest.CreatePermission('update user', 'this permission allows the user to update users in the system');
CALL bar_rest.CreatePermission('update product', 'this permission allows the user to update products in the system');
CALL bar_rest.CreatePermission('update promo', 'this permission allows the user to update promos in the system');
CALL bar_rest.CreatePermission('update invoice', 'this permission allows the user to update invoices in the system');

CALL bar_rest.AddPermissionToUser(1, 1);
CALL bar_rest.AddPermissionToUser(1, 2);
CALL bar_rest.AddPermissionToUser(1, 3);
CALL bar_rest.AddPermissionToUser(1, 4);
CALL bar_rest.AddPermissionToUser(1, 5);
CALL bar_rest.AddPermissionToUser(1, 6);
CALL bar_rest.AddPermissionToUser(1, 7);
CALL bar_rest.AddPermissionToUser(1, 8);
CALL bar_rest.AddPermissionToUser(1, 9);
CALL bar_rest.AddPermissionToUser(1, 10);
CALL bar_rest.AddPermissionToUser(1, 11);
CALL bar_rest.AddPermissionToUser(1, 12);
CALL bar_rest.AddPermissionToUser(1, 13);
CALL bar_rest.AddPermissionToUser(1, 14);
CALL bar_rest.AddPermissionToUser(1, 15);
CALL bar_rest.AddPermissionToUser(1, 16);
CALL bar_rest.AddPermissionToUser(1, 17);
CALL bar_rest.AddPermissionToUser(1, 18);

CALL bar_rest.AddPermissionToUser(2, 1);
CALL bar_rest.AddPermissionToUser(2, 2);
CALL bar_rest.AddPermissionToUser(2, 3);
CALL bar_rest.AddPermissionToUser(2, 4);
CALL bar_rest.AddPermissionToUser(2, 5);
CALL bar_rest.AddPermissionToUser(2, 6);
CALL bar_rest.AddPermissionToUser(2, 10);
CALL bar_rest.AddPermissionToUser(2, 11);
CALL bar_rest.AddPermissionToUser(2, 12);
CALL bar_rest.AddPermissionToUser(2, 18);

CALL bar_rest.AddPermissionToUser(3, 1);
CALL bar_rest.AddPermissionToUser(3, 2);
CALL bar_rest.AddPermissionToUser(3, 3);
CALL bar_rest.AddPermissionToUser(3, 4);
CALL bar_rest.AddPermissionToUser(3, 5);
CALL bar_rest.AddPermissionToUser(3, 12);