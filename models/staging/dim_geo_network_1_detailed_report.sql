{{ config(materialized='table') }}

WITH state_geo_ranked AS (
  SELECT *,
    ROW_NUMBER() OVER (PARTITION BY id, location_type ORDER BY id) AS state_rank
  FROM {{ ref('ae_ad_network_1_geo_dictionary')}}
  WHERE location_type = 'State'
),
country_geo_ranked AS (
  SELECT *,
    ROW_NUMBER() OVER (PARTITION BY id, location_type ORDER BY id) AS country_rank
  FROM {{ ref('ae_ad_network_1_geo_dictionary')}}
  WHERE location_type = 'Country'
)
SELECT
  detailed_report.*,
  state_geo.name AS state_name,
  country_geo.name AS country_name,
  country_geo.country_code AS country_code
FROM
  {{ref('ae_ad_network_1_detailed_report')}} AS detailed_report
LEFT JOIN state_geo_ranked AS state_geo
ON detailed_report.state_id = state_geo.id AND state_geo.state_rank = 1
LEFT JOIN country_geo_ranked AS country_geo
ON detailed_report.country_id = country_geo.id AND country_geo.country_rank = 1

-- This query uses common table expressions (CTEs) to rank the rows in the ae_ad_network_1_geo_dictionary table based on the id and location_type columns. 
-- The ROW_NUMBER() function is used to assign a unique row number to each record within the specified partition. 
-- Then, the CTEs are joined with the ae_ad_network_1_detailed_report table, using the row number conditions along with the required join conditions.
-- This approach ensures that only one matching row is selected from the ae_ad_network_1_geo_dictionary table for each record in the ae_ad_network_1_detailed_report table, even if there are multiple matches.



