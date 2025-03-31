-- The 10 most profitable ecommerce items in each year
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

SELECT EXTRACT(YEAR FROM date) AS year,
transaction_products.item_id AS item_id,
MIN(item_name) AS name,
MIN(item_brand) AS brand,
MIN(item_sub_category) AS category,
ROUND(SUM(transaction_revenue - cost_of_item), 2) AS total_item_profit
FROM transaction_products
LEFT JOIN `prism_sync.product_costs` product_costs
ON transaction_products.item_id = product_costs.item_id
GROUP BY year, item_id
ORDER BY year ASC, total_item_profit DESC