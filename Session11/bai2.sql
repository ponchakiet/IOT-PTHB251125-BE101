BEGIN;
UPDATE accounts SET balance = balance - 100.00 WHERE account_id = 'A001';
UPDATE accounts SET balance = balance + 100.00 WHERE account_id = 'B001';
COMMIT;

SELECT * FROM accounts;

BEGIN;
UPDATE accounts SET balance = balance - 100.00 WHERE account_id = 'A001';
UPDATE accounts SET balance = balance + 100.00 WHERE account_id = 'B999';
ROLLBACK;

SELECT * FROM accounts;
