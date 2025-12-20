BEGIN;
DO $$
DECLARE
    bal NUMERIC(12,2);
BEGIN
    SELECT balance INTO bal FROM accounts WHERE account_id = 'A001';
    IF bal >= 200 THEN
        UPDATE accounts SET balance = balance - 200 WHERE account_id = 'A001';
        INSERT INTO transactions(account_id, amount) VALUES('A001', -200);
    ELSE
        RAISE EXCEPTION 'Insufficient funds';
    END IF;
END
$$;
COMMIT;

SELECT * FROM accounts;
SELECT * FROM transactions;

BEGIN;
DO $$
DECLARE
    bal NUMERIC(12,2);
BEGIN
    SELECT balance INTO bal FROM accounts WHERE account_id = 'A001';
    IF bal >= 500 THEN
        UPDATE accounts SET balance = balance - 500 WHERE account_id = 'A001';
        INSERT INTO transactions(account_id, amount) VALUES('A999', -500);
    ELSE
        RAISE EXCEPTION 'Insufficient funds';
    END IF;
END
$$;
ROLLBACK;

SELECT * FROM accounts;
SELECT * FROM transactions;

BEGIN;
DO $$
DECLARE
    bal NUMERIC(12,2);
BEGIN
    SELECT balance INTO bal FROM accounts WHERE account_id = 'A001';
    IF bal >= 100 THEN
        UPDATE accounts SET balance = balance - 100 WHERE account_id = 'A001';
        INSERT INTO transactions(account_id, amount) VALUES('A001', -100);
    ELSE
        RAISE EXCEPTION 'Insufficient funds';
    END IF;
END
$$;
COMMIT;

SELECT * FROM accounts;
SELECT * FROM transactions;