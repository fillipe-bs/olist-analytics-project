----- - Consulta de controle para comparar a quantidade de registros carregados no banco com a volumetria original dos arquivos CSV
----- - Garantia de integridade e completude da ingestão

-- validacao_volumetria_linhas_database_vs_csv

SELECT 
    volumetria_linhas_db,
    volumetria_linhas_csv,
    volumetria_linhas_db - volumetria_linhas_csv AS var
FROM (
    SELECT 
    COUNT(*) AS volumetria_linhas_db,
	
  	99441 AS volumetria_linhas_csv
    FROM raw.olist_customers_dataset
		
	-- 3095 AS volumetria_linhas_csv
	-- FROM raw.olist_sellers_dataset
		
	-- 32951 AS volumetria_linhas_csv
	-- FROM raw.olist_products_dataset
		
	-- 71 AS volumetria_linhas_csv
	-- FROM raw.product_category_name_translation
		
	-- 99441 AS volumetria_linhas_csv
	-- FROM raw.olist_orders_dataset
		
	-- 112650 AS volumetria_linhas_csv
	-- FROM raw.olist_order_items_dataset
		
	-- 103886 AS volumetria_linhas_csv
	-- FROM raw.olist_order_payments_dataset
		
	-- 99224 AS volumetria_linhas_csv
	-- FROM raw.olist_order_reviews_dataset
		
	-- 1000163 AS volumetria_linhas_csv
	-- FROM raw.olist_geolocation_dataset
) t;