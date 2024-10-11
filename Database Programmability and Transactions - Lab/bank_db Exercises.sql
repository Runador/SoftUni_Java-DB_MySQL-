SELECT * FROM soft_uni.account_holders;

DELIMITER $$
DROP PROCEDURE IF EXISTS usp_get_holders_full_name;

CREATE PROCEDURE usp_get_holders_full_name()
BEGIN
	SELECT CONCAT_WS(' ', first_name, last_name) AS full_name
    FROM account_holders
    ORDER BY full_name, id;
END $$

DELIMITER ;

CALL usp_get_holders_full_name();



DROP FUNCTION IF EXISTS ufn_calculate_future_value;

DELIMITER $$

CREATE FUNCTION ufn_calculate_future_value(sum DECIMAL(10, 4), yearly_interest_rate DOUBLE, number_of_years INT)
RETURNS DECIMAL(10, 4)											
DETERMINISTIC
BEGIN
    RETURN (SELECT sum * POW(1 + yearly_interest_rate, number_of_years));
END $$

DELIMITER ;

SELECT ufn_calculate_future_value(1000, 0.5, 5);


DELIMITER $$
DROP PROCEDURE IF EXISTS usp_calculate_future_value_for_account;

CREATE PROCEDURE usp_calculate_future_value_for_account(ass_id INT, interest_rate DECIMAL(12, 4))
BEGIN
	SELECT a.id AS account_id, first_name, last_name, balance AS current_balance,
    ufn_calculate_future_value(balance, interest_rate, 5) AS balance_in_5_years
    FROM accounts a
    JOIN account_holders ac ON a.account_holder_id = ac.id
    WHERE a.id = ass_id;
END $$

DELIMITER ;

CALL usp_calculate_future_value_for_account(1, 0.1);
SELECT ufn_calculate_future_value(1000, 0.5, 5);



DELIMITER $$
DROP PROCEDURE IF EXISTS usp_deposit_money;

CREATE PROCEDURE usp_deposit_money(acc_id INT, money_amount DECIMAL(12, 4))
BEGIN
	START TRANSACTION;
    IF (money_amount <= 0 OR (SELECT COUNT(*) FROM accounts WHERE id = acc_id) = 0) THEN
		ROLLBACK;
	ELSE
		UPDATE accounts SET balance = balance + money_amount
        WHERE id = acc_id;
        COMMIT;
	END IF;
END $$

DELIMITER ;

CALL usp_deposit_money(1, 10);

DELIMITER $$
DROP PROCEDURE IF EXISTS usp_withdraw_money;

CREATE PROCEDURE usp_withdraw_money(account_id INT, money_amount DECIMAL(12, 4))
BEGIN
	START TRANSACTION;
    IF (money_amount <= 0 OR (SELECT COUNT(*) FROM accounts WHERE id = account_id) = 0 OR
        (SELECT balance FROM accounts WHERE id = account_id) < money_amount) THEN
		ROLLBACK;
	ELSE
		UPDATE accounts SET balance = balance - money_amount
        WHERE id = account_id;
        COMMIT;
	END IF;
END $$

DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS usp_withdraw_money;

CREATE PROCEDURE usp_transfer_money(from_account_id INT, to_account_id INT, money_amount DECIMAL(12, 4))
BEGIN
	START TRANSACTION;
    IF (money_amount <= 0 OR 
		(SELECT COUNT(*) FROM accounts WHERE id = from_account_id) = 0 OR
		(SELECT COUNT(*) FROM accounts WHERE id = to_account_id) = 0 OR
		(SELECT balance FROM accounts WHERE id = from_account_id) < money_amount) THEN
    ROLLBACK;
	ELSE
		UPDATE accounts SET balance = balance - money_amount
        WHERE id = from_account_id;
        
        UPDATE accounts SET balance = balance + money_amount
        WHERE id = to_account_id;
        COMMIT;
	END IF;
END $$

DELIMITER ;