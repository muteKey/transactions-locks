USE accounts;

CREATE TABLE users (id INT AUTO_INCREMENT, name TEXT, email TEXT, gender ENUM('f','m','u'), age INT, PRIMARY KEY (id)) ENGINE=InnoDB;

SET GLOBAL innodb_status_output=ON;
SET GLOBAL innodb_status_output_locks=ON;
