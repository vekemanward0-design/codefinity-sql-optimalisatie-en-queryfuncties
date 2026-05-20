BEGIN;
-- Deduct the amount from the source account if sufficient balance is available
UPDATE BankAccounts
SET balance = CASE WHEN balance >= 500 THEN balance - 500 ELSE balance END
WHERE account_number = 101;

-- Add the amount to the destination account if deduction was successful
UPDATE BankAccounts
SET balance = CASE WHEN (SELECT balance FROM BankAccounts WHERE account_number = 101) >= 0 THEN balance + 500 ELSE balance END
WHERE account_number = 789;

COMMIT;

-- Retrieve updated account balances
SELECT account_number, balance
FROM BankAccounts
WHERE account_number IN (101, 789);