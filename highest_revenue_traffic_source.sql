-- Which traffic source brings the most revenue?
SELECT sessions.traffic_source AS traffic_source,
ROUND(sum(transactions.transaction_revenue), 2) AS total_revenue
FROM `prism-acquire.prism_acquire.transactions` transactions
LEFT JOIN `prism-acquire.prism_acquire.sessions` sessions
ON transactions.session_id = sessions.session_id
GROUP BY sessions.traffic_source
ORDER BY total_revenue DESC