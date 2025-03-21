-- Most returned item, including brand, item name and category? 2022 /2023
SELECT
  year,
  pa.item_id AS item_id,
  amount_returned,
  item_brand,
  item_name,
  item_main_category AS item_category
FROM (
  SELECT
    EXTRACT(year FROM return_date) AS year,
    item_id,
    ROUND(SUM(return_quantity)) AS amount_returned
  FROM `prism_acquire.product_returns`
  GROUP BY item_id, year
  ORDER BY amount_returned DESC
  LIMIT 1
) AS most_returned
JOIN `prism_acquire.productattributes` pa
ON most_returned.item_id = pa.item_id
