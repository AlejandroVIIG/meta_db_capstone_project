DELIMITER //
CREATE PROCEDURE CheckBooking
	(IN booking_date_search DATETIME,
    IN table_number_search INT,
    OUT booking_status VARCHAR(15))
BEGIN
	DECLARE status_count INT;
    SELECT COUNT(*) INTO status_count
    FROM bookings
    WHERE booking_date = booking_date_search
    AND table_numbe = table_number_search;
    
    IF status_count > 0 THEN
		SET booking_status = 'Booked';
	ELSE
		SET booking_status = 'Available';
	END IF;
END //

DELIMITER ;