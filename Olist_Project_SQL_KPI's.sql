-----------------------------------------------------------------
## KPI - 1 (weekday vs Weekend)
select case when weekday(order_purchase_timestamp) <5 then 'weekday'else 'weekend'end as Weekday_Weekend, avg(payment_value) Average,sum(payment_value) Sum,max(payment_value) Max,min(payment_value) Min from olist_order_dataset_ join
olist_order_payments_dataset using(order_id) group by Weekday_Weekend;

------------------------------------------------------------------

##KPI - 2

SELECT COUNT(Order_id)FROM olist_order_reviews
inner JOIN
olist_order_payments_dataset
USING (Order_id)
where
review_score = 5 and
payment_type = "credit_card";
##SELECT review_id, COUNT(Order_id), PAYMENT_TYPE= 'CREDIT_CARD', review_score= 5 FROM olist_order_reviews
##olist_order_payments_dataset
##USING (Order_id);

---------------------------------------------------------------------

##KPI - 3

SELECT product_category_name = 'pet_shop', ORDER_PURCHASE_TIMESTAMP, ORDER_DELIVERED_CUSTOMER_DATE,
DATEDIFF(ORDER_DELIVERED_CUSTOMER_DATE, ORDER_PURCHASE_TIMESTAMP), AVG(DATEDIFF(ORDER_DELIVERED_CUSTOMER_DATE, ORDER_PURCHASE_TIMESTAMP)) FROM olist_order_items_dataset
INNER JOIN olist_products_dataset
ON olist_order_items_dataset.product_id = olist_products_dataset.product_id
INNER JOIN olist_order_dataset_
ON olist_order_items_dataset.Order_id = olist_order_dataset_.Order_id;


select avg(datediff(order_delivered_customer_date,order_purchase_timestamp))
Average_DDIEF,product_category_name = 'pet_shop' from olist_order_items_dataset
 INNER JOIN olist_products_dataset
ON olist_order_items_dataset.product_id = olist_products_dataset.product_id
INNER JOIN olist_order_dataset_
ON olist_order_items_dataset.Order_id = olist_order_dataset_.Order_id;


--------------------------------------------------------------------------

##KPI - 4

select customer_city = 'sao paulo',prices, avg(prices),payment_value,avg(payment_value) from olist_orders_dataset
inner join	olist_order_items_dataset
on olist_orders_dataset.order_id = olist_order_items_dataset.order_id
inner join olist_order_payments_dataset
on olist_orders_dataset.order_id = olist_order_payments_dataset.order_id
inner join olist_customers_dataset
on olist_orders_dataset.customer_id = olist_customers_dataset.customer_id;

-----------------------------------------------------------------------------

##KPI - 5

select avg(datediff(order_delivered_customer_date,order_purchase_timestamp))
Average_DDIEF,review_score from olist_order_dataset_
join
olist_order_reviews using(order_id)
group by review_score
order by review_score;













