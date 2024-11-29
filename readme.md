# SQL Database and Stored Procedures

This repository contains the SQL scripts for creating and managing a database for a bar/restaurant. It includes the schema definitions, stored procedures, and sample data for handling products, invoices, and inventory management.

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
- `products_by_invoice`: Stores the relationship between products and invoices.

## Stored Procedures

The repository includes the following stored procedures:

### Users

- `GetAllUsers`: Retrieves all users.
- `GetUserById`: Retrieves a user by ID.
- `CreateUser`: Creates a new user.
- `UpdateUser`: Updates user information.
- `DeleteUser`: Sets the user's state to inactive.

### Products

- `GetAllProducts`: Retrieves all products.
- `GetProductById`: Retrieves a product by ID.
- `GetProductsByType`: Retrieves products by type.
- `CreateProduct`: Creates a new product.
- `UpdateProduct`: Updates product information.
- `UpdateProductStock`: Updates the stock of a product.
- `DeleteProduct`: Deletes a product.

### Invoices

- `GetAllInvoices`: Retrieves all invoices.
- `GetInvoiceById`: Retrieves an invoice by ID.
- `CalculateInvoiceTotal`: Calculates the total amount of an invoice.
- `CreateInvoice`: Creates a new invoice.

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