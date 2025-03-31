-- top 10 items by revenue by year
WITH transaction_products AS (
  SELECT transactions.*,
  transactions_items.transaction_id AS transaction_item_id,
  product_attributes.*
  FROM `prism_sync.transactions` transactions
  LEFT JOIN `prism_sync.transactionsanditems` transactions_items
  ON transactions.transaction_id = transactions_items.transaction_id
  LEFT JOIN `prism_sync.productattributes` product_attributes
  ON transactions_items.item_id = product_attributes.item_id
)


SELECT 
    EXTRACT(YEAR FROM date) AS year,
    item_id,
    MIN(item_name) AS name,
    MIN(item_brand) AS brand,
    MIN(item_sub_category) AS category,
    ROUND(SUM(transaction_revenue), 2) AS total_item_revenue
    FROM transaction_products
    GROUP BY year, item_id
    ORDER BY year ASC, total_item_revenue DESC
LIMIT 10