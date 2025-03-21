-- % of transactions in 2022 and 2023 that received free shipping
SELECT 
  EXTRACT(year from date) as year,
  SUM(
    CASE WHEN transaction_shipping = 0 THEN 1 ELSE 0 END
  ) / COUNT(transaction_id) AS percent_free_shipping
FROM `prism_acquire.transactions`
GROUP BY year