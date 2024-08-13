use localbrandshop;

CREATE TABLE product_quantity (
    id INT AUTO_INCREMENT PRIMARY KEY,
    quantity INT NOT NULL DEFAULT (0),	
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    product_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE,
    
    size_id INT NOT NULL,
    FOREIGN KEY (size_id) REFERENCES product_size(id) ON DELETE RESTRICT
);