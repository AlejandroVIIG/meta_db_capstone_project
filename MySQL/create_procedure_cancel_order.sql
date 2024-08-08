DELIMITER //
CREATE PROCEDURE CancelOrder(order_id INT)
BEGIN
	DELETE FROM orders WHERE orders.id = order_id;
    
    IF ROW_COUNT() > 0 THEN
		SELECT CONCAT('Order ', order_id, ' is cancelled') as confirmation;
	ELSE
		SELECT CONCAT('No order with id: ', order_id, ' was found') as confirmation;
	END IF;
END // 
DELIMITER ;