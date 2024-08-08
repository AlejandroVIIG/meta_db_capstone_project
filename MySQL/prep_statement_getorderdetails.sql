PREPARE GetOrderDetail
FROM 'SELECT
orders.id,
item.name,
order_item.quantity,
order_item.subtotal as item_subtotal,
orders.total_cost as order_total
FROM orders
INNER JOIN order_item ON orders.id = order_item.order_id
INNER JOIN item ON order_item.item_id = item.id
WHERE orders.id = ?';

SET @order_id = 1;

EXECUTE GetOrderDetail USING @order_id;