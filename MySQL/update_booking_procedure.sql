DELIMITER //
CREATE PROCEDURE `UpdateBooking`(IN booking_id INT,
    IN booking_date_update DATETIME,
    IN table_number_update INT,
    OUT validated_booking_status VARCHAR(45))
BEGIN
	DECLARE check_booking_status VARCHAR(15);
    START TRANSACTION;
    CALL CheckBooking(booking_date_update, table_number_update, check_booking_status);
	
    IF check_booking_status = 'Available' THEN
		ROLLBACK;
        SET validated_booking_status = 'Invalid booking';
	ELSE
		UPDATE bookings 
		SET
			booking_date = booking_date_update,
			table_number = table_number_update
		WHERE id = booking_id;
		COMMIT;
        SET validated_booking_status = 'Valid booking';
	END IF;
END //
DELIMITER ;