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
