-- which traffic source brings the most vistors?
SELECT traffic_source,
COUNT(session_id) AS session_count
FROM `prism-acquire.prism_acquire.sessions`
GROUP BY traffic_source
ORDER BY session_count DESC