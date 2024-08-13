use localbrandshop;

CREATE TABLE cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    quantity INT NOT NULL,	
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    price INT NOT NULL,
    
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
    
    product_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE RESTRICT,
    
    product_size_id INT NOT NULL,
    FOREIGN KEY (product_size_id) REFERENCES product_size(id) ON DELETE RESTRICT,
    
    UNIQUE idx_user_product (user_id, product_id)
);