BEGIN;
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

    UPDATE BankAccounts
    SET balance = balance + 100
    WHERE account_number = 789;

    INSERT INTO UserLogs (account_number, action)
    VALUES (789, 'Adding $100');
COMMIT;