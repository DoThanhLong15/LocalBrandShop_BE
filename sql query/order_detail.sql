use localbrandshop;

CREATE TABLE order_detail (	
    id INT AUTO_INCREMENT PRIMARY KEY,
    quantity INT NOT NULL,	
    price INT NOT NULL,
    
    sale_order_id INT NOT NULL,
    FOREIGN KEY (sale_order_id) REFERENCES sale_order(id) ON DELETE CASCADE,
    
    product_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE RESTRICT,
    
    product_size_id INT NOT NULL,
    FOREIGN KEY (product_size_id) REFERENCES product_size(id) ON DELETE RESTRICT,
    
    UNIQUE idx_user_product (sale_order_id, product_id)
);