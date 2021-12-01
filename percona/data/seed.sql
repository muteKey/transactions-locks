USE accounts;

START TRANSACTION;

INSERT INTO users (name,email,gender,age) VALUES ('Nicole Burton', 'nicole.burton@example.com', 'f', 54);
INSERT INTO users (name,email,gender,age) VALUES ('Jen Cole', 'jen.cole@example.com', 'f', 23);
INSERT INTO users (name,email,gender,age) VALUES ('Brad Gibson', 'brad.gibson@example.com', 'm', 26);

COMMIT;