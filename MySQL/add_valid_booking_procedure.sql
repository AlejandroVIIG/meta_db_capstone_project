CREATE DEFINER=`alejandro`@`localhost` PROCEDURE `AddValidBooking`(IN booking_date_search DATETIME,
    IN table_number_search INT,
    OUT validated_booking_status VARCHAR(45))
BEGIN
	DECLARE check_booking_status VARCHAR(15);
    -- AddBooking Procedure
    START TRANSACTION;
    CALL CheckBooking(booking_date_search, table_number_search, check_booking_status);
	INSERT INTO bookings (booking_date, table_number, customer_id, staff_id)
		VALUES (booking_date_search, table_name_search, 3, 2);
	-- Ends AddBooking Procedure
    IF check_booking_status = 'Available' THEN
		COMMIT;
        SET validated_booking_status = 'Valid booking';
	ELSE
		ROLLBACK;
        SET validated_booking_status = 'Invalid booking';
	END IF;
END