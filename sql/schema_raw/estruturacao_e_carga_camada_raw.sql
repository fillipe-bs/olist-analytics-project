----- - Criação das camadas (schemas) raw e analytics
----- - Validação da estrutura via information_schema
----- - Definição das tabelas conforme os CSVs originais
----- - Ingestão completa dos dados utilizando COPY

-- camadas
CREATE SCHEMA raw;
CREATE SCHEMA analytics;

-- validacao
SELECT schema_name 
FROM information_schema.schemata;

---- criacao_tabelas_e_copy_csv ---

-- olist_customers_dataset
CREATE TABLE raw.olist_customers_dataset (
	customer_id TEXT,
	customer_unique_id TEXT,
	customer_zip_code_prefix INTEGER,
	customer_city TEXT,
	customer_state TEXT
);
COPY raw.olist_customers_dataset
FROM 'C:/temp/archive/olist_customers_dataset.csv'
DELIMITER ','
CSV HEADER;
-- SELECT * FROM raw.olist_customers_dataset

-- olist_sellers_dataset
CREATE TABLE raw.olist_sellers_dataset (
	seller_id TEXT,
	seller_zip_code_prefix INTEGER,
	seller_city TEXT,
	seller_state TEXT
);
COPY raw.olist_sellers_dataset
FROM 'C:/temp/archive/olist_sellers_dataset.csv'
DELIMITER ','
CSV HEADER;
-- SELECT * FROM raw.olist_sellers_dataset

-- olist_products_dataset
CREATE TABLE raw.olist_products_dataset (
	product_id TEXT,
	product_category_name TEXT,
	product_name_lenght INTEGER,
	product_description_lenght INTEGER,
	product_photos_qty INTEGER,
	product_weight_g INTEGER,
	product_length_cm INTEGER,
	product_height_cm INTEGER,
	product_width_cm INTEGER
);
COPY raw.olist_products_dataset
FROM 'C:/temp/archive/olist_products_dataset.csv'
DELIMITER ','
CSV HEADER;
-- SELECT * FROM raw.olist_products_dataset

-- product_category_name_translation
CREATE TABLE raw.product_category_name_translation (
product_category_name  TEXT,
product_category_name_english TEXT
);
COPY raw.product_category_name_translation
FROM 'C:/temp/archive/product_category_name_translation.csv'
DELIMITER ','
CSV HEADER;
-- SELECT * FROM raw.product_category_name_translation

-- olist_orders_dataset
CREATE TABLE raw.olist_orders_dataset (
	order_id TEXT,
	customer_id TEXT,
	order_status TEXT, 
	order_purchase_timestamp DATE,
	order_approved_at DATE,
	order_delivered_carrier_date DATE,
	order_delivered_customer_date DATE,
	order_estimated_delivery_date DATE
);
COPY raw.olist_orders_dataset
FROM 'C:/temp/archive/olist_orders_dataset.csv'
DELIMITER ','
CSV HEADER;
-- SELECT * FROM raw.olist_orders_dataset

-- olist_order_items_dataset
CREATE TABLE raw.olist_order_items_dataset (
	order_id TEXT,
	order_item_id TEXT,
	product_id TEXT,
	seller_id TEXT,
	shipping_limit_date DATE,
	price DECIMAL,
	freight_value DECIMAL
);
COPY raw.olist_order_items_dataset
FROM 'C:/temp/archive/olist_order_items_dataset.csv'
DELIMITER ','
CSV HEADER;
-- SELECT * FROM raw.olist_order_items_dataset

-- olist_order_payments_dataset
CREATE TABLE raw.olist_order_payments_dataset (
	order_id TEXT,
	payment_sequential INTEGER,
	payment_type TEXT,
	payment_installments INTEGER,
	payment_value DECIMAL
);
COPY raw.olist_order_payments_dataset
FROM 'C:/temp/archive/olist_order_payments_dataset.csv'
DELIMITER ','
CSV HEADER;
-- SELECT * FROM raw.olist_order_payments_dataset

-- olist_order_reviews_dataset
CREATE TABLE raw.olist_order_reviews_dataset (
	review_id TEXT,
	order_id TEXT,
	review_score INTEGER,
	review_comment_title TEXT,
	review_comment_message TEXT,
	review_creation_date DATE,
	review_answer_timestamp DATE
);
COPY raw.olist_order_reviews_dataset
FROM 'C:/temp/archive/olist_order_reviews_dataset.csv'
DELIMITER ','
CSV HEADER;
-- SELECT * FROM raw.olist_order_reviews_dataset

-- olist_geolocation_dataset
CREATE TABLE raw.olist_geolocation_dataset (
	customer_id TEXT,
	customer_unique_id TEXT,
	customer_zip_code_prefix DECIMAL,
	customer_city TEXT,
	customer_state TEXT
);
COPY raw.olist_geolocation_dataset
FROM 'C:/temp/archive/olist_geolocation_dataset.csv'
DELIMITER ','
CSV HEADER;
-- SELECT * FROM raw.olist_geolocation_dataset