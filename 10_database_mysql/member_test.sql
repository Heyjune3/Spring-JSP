USE develop;
SHOW TABLES;
-- member_test.sql
CREATE TABLE IF NOT EXISTS member(
	num INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    addr VARCHAR(300)
);