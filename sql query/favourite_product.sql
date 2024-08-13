use localbrandshop;

CREATE TABLE favourite_product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    product_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE,
    
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
    
    UNIQUE idx_user_product (product_id, user_id)
);