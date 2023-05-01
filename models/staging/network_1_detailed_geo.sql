SELECT
  a.*,
  b.country_code,
  b.name AS state_name
FROM
  {{ ref('ae_ad_network_1_detailed_report') }} AS a
LEFT JOIN
  {{ ref('ae_ad_network_1_geo_dictionary') }} AS b
  ON a.state_id = b.id AND b.location_type = 'State'

