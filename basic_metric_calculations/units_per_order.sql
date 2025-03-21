-- 5. Number of units per order (UPT) for 2022 and 2023
SELECT 
  EXTRACT(YEAR FROM date) AS year,
  SUM(item_quantity) / COUNT(DISTINCT transaction_id) AS units_per_order
FROM `prism_acquire.transactionsanditems`
GROUP BY year;