use localbrandshop;

CREATE TABLE sale_order_status (
    id INT AUTO_INCREMENT PRIMARY KEY,
    status CHAR(10) NOT NULL UNIQUE
);

INSERT INTO sale_order_status (status)
VALUES ('NOT DO');

INSERT INTO sale_order_status (status)
VALUES ('DOING');

INSERT INTO sale_order_status (status)
VALUES ('DONE');