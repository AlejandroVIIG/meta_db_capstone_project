DELIMITER //
CREATE PROCEDURE AddBooking
	(IN booking_date DATETIME,
    IN table_number INT,
    IN customer_id INT,
    IN staff_id INT,
    OUT check_booking_status VARCHAR(45))
BEGIN
	DECLARE booking_status VARCHAR(45);
    START TRANSACTION;
    CALL CheckBooking(booking_date_search, table_number_search, booking_status);
	INSERT INTO bookings (booking_date, table_number, customer_id, staff_id)
		VALUES (booking_date_search, table_name_search, customer_id, staff_id);
	SET check_booking_status = booking_status;
END //
DELIMITER ;