-- Insert default permissions for the users

CALL bar_rest.CreateProductType('get states', 'this permission allows the get the states in the system');
CALL bar_rest.CreateProductType('get product type', 'this permission allows the user to get the product types in the system');
CALL bar_rest.CreateProductType('get user', 'this permission allows the user to get the users in the system');
CALL bar_rest.CreateProductType('get product', 'this permission allows the user to get products in the system');
CALL bar_rest.CreateProductType('get promo', 'this permission allows the user to get promos in the system');
CALL bar_rest.CreateProductType('get invoice', 'this permission allows the user to get invoices in the system');

CALL bar_rest.CreateProductType('register states', 'this permission allows the user to register states in the system');
CALL bar_rest.CreateProductType('register product type', 'this permission allows the user to register product types in the system');
CALL bar_rest.CreateProductType('register user', 'this permission allows the user to register in the system');
CALL bar_rest.CreateProductType('register product', 'this permission allows the user to register products in the system');
CALL bar_rest.CreateProductType('register promo', 'this permission allows the user to register promos in the system');
CALL bar_rest.CreateProductType('register invoice', 'this permission allows the user to register invoices in the system');

CALL bar_rest.CreateProductType('update states', 'this permission allows the user to update states in the system');
CALL bar_rest.CreateProductType('update product type', 'this permission allows the user to update product types in the system');
CALL bar_rest.CreateProductType('update user', 'this permission allows the user to update users in the system');
CALL bar_rest.CreateProductType('update product', 'this permission allows the user to update products in the system');
CALL bar_rest.CreateProductType('update promo', 'this permission allows the user to update promos in the system');
CALL bar_rest.CreateProductType('update invoice', 'this permission allows the user to update invoices in the system');
