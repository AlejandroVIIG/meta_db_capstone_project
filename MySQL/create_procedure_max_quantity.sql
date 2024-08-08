CREATE PROCEDURE GetMaxQuantity()
SELECT max(quantity) FROM order_item;