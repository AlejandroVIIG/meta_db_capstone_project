CREATE VIEW items_in_many_orders AS
SELECT item.name FROM item
INNER JOIN order_item ON item.id = order_item.item_id
WHERE item.id IN
(SELECT order_item.item_id
FROM order_item
GROUP BY order_item.item_id
HAVING COUNT(DISTINCT order_item.order_id) >= 2);