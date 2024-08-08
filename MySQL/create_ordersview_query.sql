CREATE VIEW orders_view
AS SELECT orders.id as orders_id,
order_item.item_id as item_id,
order_item.quantity as quantity,
order_item.subtotal as subtotal
FROM orders
INNER JOIN order_item ON orders.id = order_item.order_id
WHERE order_item.quantity > 2;