SELECT * FROM `product` WHERE `reference`='CB001'
SELECT * FROM `product_attribute` WHERE `id_product`=65
SELECT * FROM `stock_available` WHERE `id_product`=65 AND `id_shop`=2

#LISTADO DE PEDIDOS CON
SELECT o.id_order,o.reference,
s.id_state,s.name as 'state_name',
o.total_paid,cr.id_cart_rule,cr.minimum_amount,
cr.code,free_shipping,reduction_percent,reduction_amount,
DATE_FORMAT(o.date_add,'%d-%m-%Y') as 'date_add',
DATE_FORMAT(cr.date_from,'%d-%m-%Y') as 'date_from',
DATE_FORMAT(cr.date_to,'%d-%m-%Y') as 'date_to'
FROM `ps_orders` as o
LEFT JOIN ps_cart_cart_rule as ccr on ccr.id_cart=o.id_cart
LEFT JOIN ps_cart_rule as cr on cr.id_cart_rule=ccr.id_cart_rule
INNER JOIN ps_address as a on a.id_address=o.id_address_delivery
INNER JOIN ps_state as s on s.id_state=a.id_state
ORDER BY o.id_order DESC
LIMIT 0, 10



SELECT rw.id_range_weight,rw.id_carrier,delimiter1,delimiter2,z.id_zone,z.name 
FROM `ps_range_weight` AS rw
INNER JOIN ps_carrier_zone AS cz ON rw.id_carrier=cz.id_carrier
INNER JOIN ps_zone AS z ON z.id_zone=cz.id_zone
WHERE rw.id_carrier=61 AND z.id_zone=7

