INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id)
VALUES
-- User 1
('123 Đường Lê Lợi, Quận 1, Thành phố Hồ Chí Minh', '2016-01-01 14:19:10', '2016-01-05 16:22:30', 1, 3),
('456 Đường Nguyễn Huệ, Quận 1, Thành phố Hồ Chí Minh', '2017-02-15 09:45:20', '2017-02-19 11:50:45', 1, 3),
('789 Đường Trần Hưng Đạo, Quận 5, Thành phố Hồ Chí Minh', '2018-03-20 13:30:00', '2018-03-24 15:35:10', 1, 3),
('101 Đường Lý Thường Kiệt, Quận 10, Thành phố Hồ Chí Minh', '2019-04-25 08:10:05', '2019-04-29 10:15:25', 1, 3),
('202 Đường Phạm Ngũ Lão, Quận 1, Thành phố Hồ Chí Minh', '2020-05-30 17:25:40', '2020-06-03 19:30:55', 1, 3),
-- User 2
('303 Đường Hai Bà Trưng, Quận 3, Thành phố Hồ Chí Minh', '2016-06-05 12:00:00', '2016-06-09 14:05:15', 2, 3),
('404 Đường Điện Biên Phủ, Quận Bình Thạnh, Thành phố Hồ Chí Minh', '2017-07-10 10:15:30', '2017-07-14 12:20:45', 2, 3),
('505 Đường Võ Văn Tần, Quận 3, Thành phố Hồ Chí Minh', '2018-08-15 09:30:45', '2018-08-19 11:35:55', 2, 3),
('606 Đường Nguyễn Thị Minh Khai, Quận 1, Thành phố Hồ Chí Minh', '2019-09-20 14:45:50', '2019-09-24 16:50:05', 2, 3),
('707 Đường Cách Mạng Tháng 8, Quận 10, Thành phố Hồ Chí Minh', '2020-10-25 08:00:00', '2020-10-29 10:05:10', 2, 3),
-- User 3
('808 Đường Nguyễn Văn Cừ, Quận 5, Thành phố Hồ Chí Minh', '2016-11-30 11:15:20', '2016-12-04 13:20:35', 3, 3),
('909 Đường Lê Văn Sỹ, Quận 3, Thành phố Hồ Chí Minh', '2017-12-05 15:30:40', '2017-12-09 17:35:55', 3, 3),
('1010 Đường Trường Chinh, Quận Tân Bình, Thành phố Hồ Chí Minh', '2018-01-10 09:45:50', '2018-01-14 11:50:05', 3, 3),
('1111 Đường Hoàng Văn Thụ, Quận Phú Nhuận, Thành phố Hồ Chí Minh', '2019-02-15 14:00:00', '2019-02-19 16:05:15', 3, 3),
('1212 Đường Nguyễn Đình Chiểu, Quận 3, Thành phố Hồ Chí Minh', '2020-03-20 08:15:30', '2020-03-24 10:20:45', 3, 3),
-- User 4
('1313 Đường Lê Quang Định, Quận Bình Thạnh, Thành phố Hồ Chí Minh', '2016-04-25 12:30:45', '2016-04-29 14:35:55', 4, 3),
('1414 Đường Nguyễn Trãi, Quận 5, Thành phố Hồ Chí Minh', '2017-05-30 09:45:50', '2017-06-03 11:50:05', 4, 3),
('1515 Đường Lý Tự Trọng, Quận 1, Thành phố Hồ Chí Minh', '2018-07-05 14:00:00', '2018-07-09 16:05:15', 4, 3),
('1616 Đường Nguyễn Văn Trỗi, Quận Phú Nhuận, Thành phố Hồ Chí Minh', '2019-08-10 08:15:30', '2019-08-14 10:20:45', 4, 3),
('1717 Đường Phan Đăng Lưu, Quận Phú Nhuận, Thành phố Hồ Chí Minh', '2020-09-15 12:30:45', '2020-09-19 14:35:55', 4, 3),
-- User 5
('1818 Đường Nguyễn Thái Học, Quận 1, Thành phố Hồ Chí Minh', '2016-10-20 09:45:50', '2016-10-24 11:50:05', 5, 3),
('1919 Đường Nguyễn Văn Linh, Quận 7, Thành phố Hồ Chí Minh', '2017-11-25 14:00:00', '2017-11-29 16:05:15', 5, 3),
('2020 Đường Phạm Văn Đồng, Quận Thủ Đức, Thành phố Hồ Chí Minh', '2018-12-30 08:15:30', '2019-01-03 10:20:45', 5, 3),
('2121 Đường Võ Thị Sáu, Quận 3, Thành phố Hồ Chí Minh', '2019-01-04 12:30:45', '2019-01-08 14:35:55', 5, 3),
('2222 Đường Nguyễn Văn Linh, Quận 7, Thành phố Hồ Chí Minh', '2020-02-09 09:45:50', '2020-02-13 11:50:05', 5, 3);

-- User 6
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('2323 Đường Lê Lợi, Quận 1, Thành phố Hồ Chí Minh', '2016-03-15 14:19:10', '2016-03-19 16:45:30', 6, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('2424 Đường Nguyễn Huệ, Quận 1, Thành phố Hồ Chí Minh', '2017-04-20 09:12:45', '2017-04-24 11:30:55', 6, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('2525 Đường Trần Hưng Đạo, Quận 5, Thành phố Hồ Chí Minh', '2018-05-25 08:05:20', '2018-05-29 10:15:40', 6, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('2626 Đường Lý Thường Kiệt, Quận 10, Thành phố Hồ Chí Minh', '2019-06-30 13:25:50', '2019-07-04 15:35:10', 6, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('2727 Đường Phạm Ngũ Lão, Quận 1, Thành phố Hồ Chí Minh', '2020-08-05 07:45:30', '2020-08-09 09:55:50', 6, 3);

-- User 7
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('2828 Đường Hai Bà Trưng, Quận 3, Thành phố Hồ Chí Minh', '2016-09-10 10:15:20', '2016-09-14 12:25:40', 7, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('2929 Đường Điện Biên Phủ, Quận Bình Thạnh, Thành phố Hồ Chí Minh', '2017-10-15 11:35:30', '2017-10-19 13:45:50', 7, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('3030 Đường Võ Văn Tần, Quận 3, Thành phố Hồ Chí Minh', '2018-11-20 14:55:40', '2018-11-24 17:05:00', 7, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('3131 Đường Nguyễn Thị Minh Khai, Quận 1, Thành phố Hồ Chí Minh', '2019-12-25 09:15:50', '2019-12-29 11:25:10', 7, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('3232 Đường Cách Mạng Tháng 8, Quận 10, Thành phố Hồ Chí Minh', '2020-01-30 08:35:00', '2020-02-03 10:45:20', 7, 3);

-- User 8
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('3333 Đường Nguyễn Văn Cừ, Quận 5, Thành phố Hồ Chí Minh', '2016-02-05 07:55:10', '2016-02-09 10:05:30', 8, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('3434 Đường Lê Văn Sỹ, Quận 3, Thành phố Hồ Chí Minh', '2017-03-10 09:15:20', '2017-03-14 11:25:40', 8, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('3535 Đường Trường Chinh, Quận Tân Bình, Thành phố Hồ Chí Minh', '2018-04-15 10:35:30', '2018-04-19 12:45:50', 8, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('3636 Đường Hoàng Văn Thụ, Quận Phú Nhuận, Thành phố Hồ Chí Minh', '2019-05-20 11:55:40', '2019-05-24 14:05:00', 8, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('3737 Đường Nguyễn Đình Chiểu, Quận 3, Thành phố Hồ Chí Minh', '2020-06-25 13:15:50', '2020-06-29 15:25:10', 8, 3);

-- User 9
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('3838 Đường Lê Quang Định, Quận Bình Thạnh, Thành phố Hồ Chí Minh', '2016-07-30 14:35:00', '2016-08-03 16:45:20', 9, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('3939 Đường Nguyễn Trãi, Quận 5, Thành phố Hồ Chí Minh', '2017-09-04 07:55:10', '2017-09-08 10:05:30', 9, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('4040 Đường Lý Tự Trọng, Quận 1, Thành phố Hồ Chí Minh', '2018-10-09 09:15:20', '2018-10-13 11:25:40', 9, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('4141 Đường Nguyễn Văn Trỗi, Quận Phú Nhuận, Thành phố Hồ Chí Minh', '2019-11-14 10:35:30', '2019-11-18 12:45:50', 9, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('4242 Đường Phan Đăng Lưu, Quận Phú Nhuận, Thành phố Hồ Chí Minh', '2020-12-19 11:55:40', '2020-12-23 14:05:00', 9, 3);

-- User 10
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('4343 Đường Nguyễn Thái Học, Quận 1, Thành phố Hồ Chí Minh', '2016-01-24 13:15:50', '2016-01-28 15:25:10', 10, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('4444 Đường Nguyễn Văn Linh, Quận 7, Thành phố Hồ Chí Minh', '2017-02-29 14:35:00', '2017-03-05 16:45:20', 10, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('4545 Đường Phạm Văn Đồng, Quận Thủ Đức, Thành phố Hồ Chí Minh', '2018-04-04 07:55:10', '2018-04-08 10:05:30', 10, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('4646 Đường Võ Thị Sáu, Quận 3, Thành phố Hồ Chí Minh', '2019-05-09 09:15:20', '2019-05-13 11:25:40', 10, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('4747 Đường Nguyễn Văn Linh, Quận 7, Thành phố Hồ Chí Minh', '2020-06-14 10:35:30', '2020-06-18 12:45:50', 10, 3);

-- User 11
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('4848 Đường Lê Lợi, Quận 1, Thành phố Hồ Chí Minh', '2016-07-19 14:19:10', '2016-07-23 16:45:30', 11, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('4949 Đường Nguyễn Huệ, Quận 1, Thành phố Hồ Chí Minh', '2017-08-24 09:12:45', '2017-08-28 11:30:55', 11, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('5050 Đường Trần Hưng Đạo, Quận 5, Thành phố Hồ Chí Minh', '2018-09-29 08:05:20', '2018-10-03 10:15:40', 11, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('5151 Đường Lý Thường Kiệt, Quận 10, Thành phố Hồ Chí Minh', '2019-11-04 13:25:50', '2019-11-08 15:35:10', 11, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('5252 Đường Phạm Ngũ Lão, Quận 1, Thành phố Hồ Chí Minh', '2020-12-09 07:45:30', '2020-12-13 09:55:50', 11, 3);

-- User 12
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('5353 Đường Hai Bà Trưng, Quận 3, Thành phố Hồ Chí Minh', '2016-01-14 10:15:20', '2016-01-18 12:25:40', 12, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('5454 Đường Điện Biên Phủ, Quận Bình Thạnh, Thành phố Hồ Chí Minh', '2017-02-19 11:35:30', '2017-02-23 13:45:50', 12, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('5555 Đường Võ Văn Tần, Quận 3, Thành phố Hồ Chí Minh', '2018-03-24 14:55:40', '2018-03-28 17:05:00', 12, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('5656 Đường Nguyễn Thị Minh Khai, Quận 1, Thành phố Hồ Chí Minh', '2019-04-29 09:15:50', '2019-05-03 11:25:10', 12, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('5757 Đường Cách Mạng Tháng 8, Quận 10, Thành phố Hồ Chí Minh', '2020-06-04 08:35:00', '2020-06-08 10:45:20', 12, 3);

-- User 13
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('5858 Đường Nguyễn Văn Cừ, Quận 5, Thành phố Hồ Chí Minh', '2016-07-09 07:55:10', '2016-07-13 10:05:30', 13, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('5959 Đường Lê Văn Sỹ, Quận 3, Thành phố Hồ Chí Minh', '2017-08-14 09:15:20', '2017-08-18 11:25:40', 13, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('6060 Đường Trường Chinh, Quận Tân Bình, Thành phố Hồ Chí Minh', '2018-09-19 10:35:30', '2018-09-23 12:45:50', 13, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('6161 Đường Hoàng Văn Thụ, Quận Phú Nhuận, Thành phố Hồ Chí Minh', '2019-10-24 11:55:40', '2019-10-28 14:05:00', 13, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('6262 Đường Nguyễn Đình Chiểu, Quận 3, Thành phố Hồ Chí Minh', '2020-11-29 13:15:50', '2020-12-03 15:25:10', 13, 3);

-- User 14
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('6363 Đường Lê Quang Định, Quận Bình Thạnh, Thành phố Hồ Chí Minh', '2016-01-04 14:35:00', '2016-01-08 16:45:20', 14, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('6464 Đường Nguyễn Trãi, Quận 5, Thành phố Hồ Chí Minh', '2017-02-09 07:55:10', '2017-02-13 10:05:30', 14, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('6565 Đường Lý Tự Trọng, Quận 1, Thành phố Hồ Chí Minh', '2018-03-14 09:15:20', '2018-03-18 11:25:40', 14, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('6666 Đường Nguyễn Văn Trỗi, Quận Phú Nhuận, Thành phố Hồ Chí Minh', '2019-04-19 10:35:30', '2019-04-23 12:45:50', 14, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('6767 Đường Phan Đăng Lưu, Quận Phú Nhuận, Thành phố Hồ Chí Minh', '2020-05-24 11:55:40', '2020-05-28 14:05:00', 14, 3);

-- User 15
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('6868 Đường Nguyễn Thái Học, Quận 1, Thành phố Hồ Chí Minh', '2016-06-29 13:15:50', '2016-07-03 15:25:10', 15, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('6969 Đường Nguyễn Văn Linh, Quận 7, Thành phố Hồ Chí Minh', '2017-08-04 14:35:00', '2017-08-08 16:45:20', 15, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('7070 Đường Phạm Văn Đồng, Quận Thủ Đức, Thành phố Hồ Chí Minh', '2018-09-09 07:55:10', '2018-09-13 10:05:30', 15, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('7171 Đường Võ Thị Sáu, Quận 3, Thành phố Hồ Chí Minh', '2019-10-14 09:15:20', '2019-10-18 11:25:40', 15, 3);
INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id) VALUES ('7272 Đường Nguyễn Văn Linh, Quận 7, Thành phố Hồ Chí Minh', '2020-11-19 10:35:30', '2020-11-23 12:45:50', 15, 3);

INSERT INTO sale_order (address, created_date, updated_date, user_id, order_status_id)
VALUES
-- User 16
('7373 Đường Lê Lợi, Quận 1, Thành phố Hồ Chí Minh', '2016-12-24 14:19:10', '2016-12-28 16:45:30', 16, 3),
('7474 Đường Nguyễn Huệ, Quận 1, Thành phố Hồ Chí Minh', '2017-01-29 09:12:45', '2017-02-02 11:30:55', 16, 3),
('7575 Đường Trần Hưng Đạo, Quận 5, Thành phố Hồ Chí Minh', '2018-03-06 08:05:20', '2018-03-10 10:15:40', 16, 3),
('7676 Đường Lý Thường Kiệt, Quận 10, Thành phố Hồ Chí Minh', '2019-04-11 13:25:50', '2019-04-15 15:35:10', 16, 3),
('7777 Đường Phạm Ngũ Lão, Quận 1, Thành phố Hồ Chí Minh', '2020-05-16 07:45:30', '2020-05-20 09:55:50', 16, 3),
-- User 17
('7878 Đường Hai Bà Trưng, Quận 3, Thành phố Hồ Chí Minh', '2016-06-21 10:15:20', '2016-06-25 12:25:40', 17, 3),
('7979 Đường Điện Biên Phủ, Quận Bình Thạnh, Thành phố Hồ Chí Minh', '2017-07-26 11:35:30', '2017-07-30 13:45:50', 17, 3),
('8080 Đường Võ Văn Tần, Quận 3, Thành phố Hồ Chí Minh', '2018-08-31 14:55:40', '2018-09-04 17:05:00', 17, 3),
('8181 Đường Nguyễn Thị Minh Khai, Quận 1, Thành phố Hồ Chí Minh', '2019-10-05 09:15:50', '2019-10-09 11:25:10', 17, 3),
('8282 Đường Cách Mạng Tháng 8, Quận 10, Thành phố Hồ Chí Minh', '2020-11-10 08:35:00', '2020-11-14 10:45:20', 17, 3),
-- User 18
('8383 Đường Nguyễn Văn Cừ, Quận 5, Thành phố Hồ Chí Minh', '2016-12-15 07:55:10', '2016-12-19 10:05:30', 18, 3),
('8484 Đường Lê Văn Sỹ, Quận 3, Thành phố Hồ Chí Minh', '2017-01-20 09:15:20', '2017-01-24 11:25:40', 18, 3),
('8585 Đường Trường Chinh, Quận Tân Bình, Thành phố Hồ Chí Minh', '2018-02-25 10:35:30', '2018-03-01 12:45:50', 18, 3),
('8686 Đường Hoàng Văn Thụ, Quận Phú Nhuận, Thành phố Hồ Chí Minh', '2019-04-02 11:55:40', '2019-04-06 14:05:00', 18, 3),
('8787 Đường Nguyễn Đình Chiểu, Quận 3, Thành phố Hồ Chí Minh', '2020-05-07 13:15:50', '2020-05-11 15:25:10', 18, 3),
-- User 19
('8888 Đường Lê Quang Định, Quận Bình Thạnh, Thành phố Hồ Chí Minh', '2016-06-12 14:35:00', '2016-06-16 16:45:20', 19, 3),
('8989 Đường Nguyễn Trãi, Quận 5, Thành phố Hồ Chí Minh', '2017-07-17 07:55:10', '2017-07-21 10:05:30', 19, 3),
('9090 Đường Lý Tự Trọng, Quận 1, Thành phố Hồ Chí Minh', '2018-08-22 09:15:20', '2018-08-26 11:25:40', 19, 3),
('9191 Đường Nguyễn Văn Trỗi, Quận Phú Nhuận, Thành phố Hồ Chí Minh', '2019-09-27 10:35:30', '2019-10-01 12:45:50', 19, 3),
('9292 Đường Phan Đăng Lưu, Quận Phú Nhuận, Thành phố Hồ Chí Minh', '2020-11-02 11:55:40', '2020-11-06 14:05:00', 19, 3),
-- User 20
('9393 Đường Nguyễn Thái Học, Quận 1, Thành phố Hồ Chí Minh', '2016-12-07 13:15:50', '2016-12-11 15:25:10', 20, 3),
('9494 Đường Nguyễn Văn Linh, Quận 7, Thành phố Hồ Chí Minh', '2017-01-12 14:35:00', '2017-01-16 16:45:20', 20, 3),
('9595 Đường Phạm Văn Đồng, Quận Thủ Đức, Thành phố Hồ Chí Minh', '2018-02-17 07:55:10', '2018-02-21 10:05:30', 20, 3),
('9696 Đường Võ Thị Sáu, Quận 3, Thành phố Hồ Chí Minh', '2019-03-24 09:15:20', '2019-03-28 11:25:40', 20, 3),
('9797 Đường Nguyễn Văn Linh, Quận 7, Thành phố Hồ Chí Minh', '2020-04-29 10:35:30', '2020-05-03 12:45:50', 20, 3);

SELECT * FROM localbrandshop.sale_order;