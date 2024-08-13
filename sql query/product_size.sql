use localbrandshop;

CREATE TABLE product_size (
    id INT AUTO_INCREMENT PRIMARY KEY,
    size CHAR(10) NOT NULL UNIQUE
);

INSERT INTO product_size (size)
VALUES ('S');

INSERT INTO product_size (size)	
VALUES ('M');

INSERT INTO product_size (size)
VALUES ('L');

INSERT INTO product_size (size)
VALUES ('XL');