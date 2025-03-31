-- incomplete query

-- calculation of monthly active users
WITH active_users AS (
  SELECT DATE_TRUNC(latest_login_date, month) AS month,
  COUNT(DISTINCT user_crm_id) AS active_users
  FROM `prism_sync.users`
  GROUP BY month
),

-- calculation of the previous monthly active users
lagged_active_users AS (
  SELECT active_users.month,
  active_users.active_users,
  LAG(active_users) OVER(ORDER BY active_users.month) AS previous_active_users
  FROM active_users
)