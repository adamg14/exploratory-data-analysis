-- Average Order Value for 2022 and 2023
SELECT 
  EXTRACT(YEAR FROM date) as year,
  ROUND(AVG(transaction_total), 2) AS average_order_value
FROM `prism_acquire.transactions`
GROUP BY year;