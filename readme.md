# SQL Database and Stored Procedures

This repository contains the SQL scripts for creating and managing a database for a bar/restaurant. It includes the schema definitions, stored procedures, and sample data for handling products, invoices, promotions, and inventory management.

## Table of Contents

- [Database Schema](#database-schema)
- [Stored Procedures](#stored-procedures)
- [Setup Instructions](#setup-instructions)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Database Schema

The database schema includes the following tables:

- `users`: Stores user information.
- `products`: Stores product information.
- `invoices`: Stores invoice information.
- `items_by_invoice`: Stores the relationship between products and invoices.
- `promos`: Stores promotion information.
- `items_by_promos`: Stores the relationship between products and promotions.
- `states`: Stores state information for users, products, and invoices.
- `product_types`: Stores product type information.

## Stored Procedures

The repository includes the following stored procedures:

### Users

- `GetAllUsers`: Retrieves all users.
- `GetUserById`: Retrieves a user by ID.
- `CreateUser`: Creates a new user.
- `UpdateUser`: Updates user information.
- `UpdateUserState`: Updates the state of a user.
- `DeleteUser`: Sets the user's state to inactive.
- `ValidatePasswordHash`: Validates a user's password.
- `UpdateUserPassword`: Updates a user's password.

### Products

- `GetAllProducts`: Retrieves all products.
- `GetProductById`: Retrieves a product by ID.
- `GetProductsByType`: Retrieves products by type.
- `GetProductsByState`: Retrieves products by state.
- `CreateProduct`: Creates a new product.
- `UpdateProduct`: Updates product information.
- `UpdateProductStock`: Updates the stock of a product.
- `UpdateProductState`: Updates the state of a product.
- `DeleteProduct`: Deletes a product.

### Invoices

- `GetAllInvoices`: Retrieves all invoices.
- `GetInvoiceById`: Retrieves an invoice by ID.
- `GetInvoiceTotal`: Calculates the total amount of an invoice.
- `CreateInvoice`: Creates a new invoice.
- `UpdateInvoiceState`: Updates the state of an invoice.
- `UpdateProductQuantityInvoice`: Updates the quantity of a product in an invoice.

### Promotions

- `GetAllPromos`: Retrieves all promotions.
- `GetPromoById`: Retrieves a promotion by ID.
- `CreatePromo`: Creates a new promotion.
- `UpdatePromo`: Updates promotion information.
- `DeletePromo`: Deletes a promotion.

### Products by Invoices

- `AddProductToInvoice`: Adds a product to an invoice.
- `UpdateProductsByInvoiceQuantity`: Updates the quantity of a product in an invoice.

## Setup Instructions

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/sql-db-and-procedures.git
    cd sql-db-and-procedures
    ```

2. Import the database schema and stored procedures into your MySQL database:
    ```sh
    mysql -u yourusername -p yourdatabase < db.sql
    mysql -u yourusername -p yourdatabase < stored-procedures.sql
    ```

3. Configure your database connection settings as needed.

## Usage

To use the stored procedures, you can call them from your application code or directly from the MySQL command line. For example:

```sql
CALL GetAllProducts();
CALL AddProductToInvoice(1, 2, 10);
```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License

This project is licensed under the MIT License.