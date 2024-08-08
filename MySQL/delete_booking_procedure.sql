DELIMITER //
CREATE PROCEDURE DeleteBooking(
	IN booking_id INT,
    OUT booking_status VARCHAR(45))
BEGIN
	DECLARE check_booking_status VARCHAR(15);
    START TRANSACTION;
    CALL CheckBooking(booking_date_update, table_number_update, check_booking_status);
	
    IF check_booking_status = 'Available' THEN
		ROLLBACK;
        SET booking_status = 'Unable to delete booking';
	ELSE
		DELETE FROM bookings WHERE id = booking_id;
		COMMIT;
        SET booking_status = 'Cancelled booking';
	END IF;
END // 
DELIMITER ;