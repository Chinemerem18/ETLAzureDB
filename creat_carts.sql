CREATE TABLE carts (
    id INT NOT NULL PRIMARY KEY,              -- cart ID (primary key)
    products NVARCHAR(MAX),                   -- JSON string to store products in the carts                     
    total FLOAT,                              -- total price of the cart
    discountedTotal FLOAT,                    -- total discounted price
    userId INT NOT NULL,                      --userId (foreign key)
	totalProducts INT,                        -- total number of unique products in the cart
    totalQuantity INT,                        -- total quantity of all products,
    FOREIGN KEY (userId) REFERENCES users(id) -- foreign Key to users table
);
