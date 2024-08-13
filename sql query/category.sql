use localbrandshop;

CREATE TABLE category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
	description TEXT
);

INSERT INTO category (name, description)
VALUES ('Áo thun', 'Những mẫu áo thun thiết yếu đa dạng với nhiều màu sắc, form dáng và họa tiết');

INSERT INTO category (name)
VALUES ('Áo polo');

INSERT INTO category (name, description)
VALUES ('Áo sơ mi casual', 'Chất vải dạ mềm mại với hoa văn đầy màu sắc');