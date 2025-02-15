CREATE TABLE users (
    id INT NOT NULL PRIMARY KEY,              -- user ID (primary key)
    firstName VARCHAR(100),                   -- first name
    lastName VARCHAR(100),                    -- last name
    maidenName VARCHAR(100),                  -- maiden name
    age INT,                                  -- age of the user
    gender VARCHAR(50),                       -- gender (e.g., male, female)
    email VARCHAR(255),                       -- email address
    phone VARCHAR(50),                        -- phone number
    username VARCHAR(100),                    -- username
    password VARCHAR(255),                    -- password
    birthDate DATE,                           -- date of birth
    image VARCHAR(500),                       -- profile picture URL
    bloodGroup VARCHAR(10),                   -- blood group
    height FLOAT,                             -- height in centimeters
    weight FLOAT,                             -- weight in kilograms
    eyeColor VARCHAR(50),                     -- eye color
    hair NVARCHAR(MAX),                       -- hair details stored as JSON
    domain VARCHAR(255),                      -- website domain
    ip VARCHAR(50),                           -- iP address
    address NVARCHAR(MAX),                    -- original address column stored as JSON
    macAddress VARCHAR(50),                   -- MAC address
    university VARCHAR(255),                  -- university attended
    bank NVARCHAR(MAX),                       -- bank details stored as JSON
    company NVARCHAR(MAX),                    -- company details stored as JSON
    ein VARCHAR(50),                          -- Employer Identification Number
    ssn VARCHAR(50),                          -- Social Security Number
	crypto NVARCHAR(MAX),                     -- original crypto column stored as JSON
    role VARCHAR(100),                          -- user role
	userAgent VARCHAR(500)                    -- user's browser user agent
);

