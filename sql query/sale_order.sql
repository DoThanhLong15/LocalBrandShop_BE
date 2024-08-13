use localbrandshop;

CREATE TABLE sale_order (
    id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(255) NOT NULL,	
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE RESTRICT,
    
    order_status_id INT NOT NULL,
    FOREIGN KEY (order_status_id) REFERENCES sale_order_status(id) ON DELETE RESTRICT
);