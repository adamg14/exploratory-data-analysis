SELECT
DATE_TRUNC(date, MONTH) AS month_year, 
SUM(transaction_revenue) AS total_transaction_revenue
FROM `prism_sync.transactions`
GROUP BY month_year
ORDER BY month_year
