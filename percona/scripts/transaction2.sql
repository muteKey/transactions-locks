USE accounts;

START TRANSACTION;
INSERT INTO users (name,email,gender,age) VALUES ('Jen Cole', 'jen.cole@example.com', 'f', 100);
COMMIT;
