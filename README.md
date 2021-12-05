# Parallel transaction simulation notes
There are 2 files with "concurrent" transactions: transaction1.sql and transaction2.sql. Using this command
```
mysql -uroot -proot < transaction1.sql;
```

we execute transactions code. Using command

```
docker exec -it /bash/bin/
```

We connect to container (2 times for each transaction) and in this way we simulate parallel transaction execution.

# DIRTY READ

Transaction 1:
```
USE accounts;
SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

START TRANSACTION;
UPDATE users SET age=12 WHERE email='jen.cole@example.com';
ROLLBACK
```

Transaction 2:
```
USE accounts;
START TRANSACTION;
SELECT * from users;
COMMIT;
```
![Dirty read](https://github.com/muteKey/transactions-locks/blob/master/images/Dirty%20Read.png)

# LOST UPDATE

Transaction 1
```
USE accounts;

SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;

START TRANSACTION;
SELECT * FROM users;
SELECT SLEEP(10);
UPDATE users SET age=age + 3 where email='brad.gibson@example.com';
COMMIT;

START TRANSACTION;
SELECT * FROM users;
COMMIT;
```

Transaction 2
```
USE accounts;

START TRANSACTION;
SELECT SLEEP(5);
UPDATE users SET age=age - 20 where email='brad.gibson@example.com';
COMMIT;
```
![Lost update](https://github.com/muteKey/transactions-locks/blob/master/images/Lost%20Update%20(Serializable).png)

# PHANTOM READ

Transaction 1
```
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;
SELECT SUM(age) FROM users;
SELECT SLEEP(10);
SELECT SUM(age) FROM users;
COMMIT;
```

Transaction 2
```
USE accounts;

START TRANSACTION;
INSERT INTO users (name,email,gender,age) VALUES ('Jen Cole', 'jen.cole@example.com', 'f', 100);
COMMIT;
```
![Phantom Read](https://github.com/muteKey/transactions-locks/blob/master/images/Phantom%20Read%20-%20%5BREAD%20COMMITTED%5D.png)

# NON REPEATABLE READ

Transaction 1
```
USE accounts;
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

START TRANSACTION;
SELECT * FROM users;
SELECT SLEEP(15);
SELECT * FROM users;
COMMIT;
```

Transaction 2
```
USE accounts;

START TRANSACTION;
UPDATE users SET name='Tommy Vercetti' WHERE email='nicole.burton@example.com';
COMMIT;
```
![Non Repeatable Read](https://github.com/muteKey/transactions-locks/blob/master/images/Non%20Repeatable%20Read%20(read%20uncommitted).png)

