USE accounts;

SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- START TRANSACTION;
-- SELECT SUM(age) FROM users;
-- SELECT SLEEP(10);
-- SELECT SUM(age) FROM users;
-- COMMIT;

-- START TRANSACTION;
-- SELECT * FROM users;
-- SELECT SLEEP(15);
-- SELECT * FROM users;
-- COMMIT;

START TRANSACTION;
SELECT * FROM users;
SELECT SLEEP(10);
UPDATE users SET age=age + 3 where email='brad.gibson@example.com';
COMMIT;

START TRANSACTION;
SELECT * FROM users;
COMMIT;
