CREATE TABLE cart_items (
    cart_id INT NOT NULL,                     -- foreign key: references carts.id
    product_id INT NOT NULL,                  -- foreign key: references products.id
    user_id INT NOT NULL,                     -- foreign key: references users.id
    quantity INT NOT NULL,                    -- quantity of the product in the cart
    total FLOAT NOT NULL,                     -- total price for the product
    discountPercentage FLOAT,                 -- discount percentage
    discountedPrice FLOAT,                              -- price after discount
    PRIMARY KEY (cart_id, product_id, user_id),         -- composite primary Key
    FOREIGN KEY (cart_id) REFERENCES carts(id),         -- foreign key to carts
    FOREIGN KEY (product_id) REFERENCES products(id),   -- foreign key to products
    FOREIGN KEY (user_id) REFERENCES users(id)          -- foreign key to users
);
