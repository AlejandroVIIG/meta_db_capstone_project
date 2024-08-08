CREATE VIEW orders_view_customers
AS SELECT orders.id as orders_id,
orders.customer_id,
CONCAT(person.first_name, ' ' , person.last_name) AS customer_name,
cuisine.name as menu_name,
item.name as item_name,
order_item.subtotal
FROM orders
INNER JOIN person ON orders.customer_id = person.id
INNER JOIN order_item ON orders.id = order_item.order_id
INNER JOIN item ON order_item.item_id = item.id
INNER JOIN cuisine ON item.cuisine_id = cuisine.id
ORDER BY order_item.subtotal DESC;