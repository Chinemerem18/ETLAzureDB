CREATE TABLE products (
    id INT NOT NULL PRIMARY KEY,              -- product ID (primary key)
    title VARCHAR(255),                       -- product title
    description TEXT,                         -- product description
    category VARCHAR(100),                    -- product category
	price FLOAT,                              -- price of the product
    discountPercentage FLOAT,                 -- discount percentage
    rating FLOAT,                             -- product rating
    stock INT,                                -- available stock
    tags NVARCHAR(MAX),                       -- JSON string to store multiple tags
	brand VARCHAR(100),                       -- product brand
    sku VARCHAR(100),                         -- product SKU
	weight VARCHAR(100),                      -- product weight
    dimensions NVARCHAR(MAX),                 -- JSON string to store product dimensions
	warrantyInformation VARCHAR(500),         -- warranty information
    shippingInformation VARCHAR(500),         -- shipping information
    availabilityStatus VARCHAR(100),          -- availability status
	reviews NVARCHAR(MAX),                    -- JSON string to store reviews
	returnPolicy VARCHAR(500),                -- return policy
	minimumOrderQuantity INT,                 -- product MOQ
	meta NVARCHAR(MAX),                       -- JSON string to store product metadata
	images NVARCHAR(MAX),                     -- JSON string to store multiple image URLs
	thumbnail VARCHAR(500)                    -- thumbnail image URL
);
