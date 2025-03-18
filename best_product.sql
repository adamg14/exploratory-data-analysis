-- what is the best performing product

-- best product based on 'profit weighted AOV'
-- profit margin of each order
-- total revenue - total product_cost / total_orders
WITH flat_table AS (
  SELECT *
  FROM `prism_acquire.transactions` t
  JOIN `prism_acquire.transactionsanditems` ti
  ON t.transaction_id = ti.transaction_id
  LEFT JOIN `prism_acquire.sessions` s
  ON t.session_id = s.session_id
),

-- calculating the average cost of marketing (cost per clicks) on each day
-- this is to factor in the marketing cost of a transaction when calculating profit margin
cost_per_clicks_per_date AS (
  SELECT date,
  COALESCE(AVG(google_cost) / AVG(google_clicks), 0) AS Google,
  COALESCE(AVG(meta_cost) / AVG(meta_clicks), 0) AS Meta,
  COALESCE(AVG(rtbhouse_cost) / AVG(rtbhouse_clicks), 0) AS RTBHouse
  FROM `prism_acquire.adplatform_data`
  GROUP BY date
)
SELECT *
FROM flat_table
LIMIT 10;