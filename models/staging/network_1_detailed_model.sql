SELECT
  updates.campaign_id,
  updates.update_date,
  updates.name,
  country_report.date,
  country_report.country_id,
  country_report.spend,
  country_report.impressions,
  country_report.clicks,
  detailed_geo.country_code,
  detailed_geo.state_id,
  detailed_geo.state_name
FROM
  {{ ref('ae_ad_network_1_campaign_updates') }} AS updates
LEFT JOIN
  {{ ref('ae_ad_network_1_country_report') }} AS country_report
ON
  updates.campaign_id = country_report.campaign_id
LEFT JOIN
  {{ ref('network_1_detailed_geo') }} AS detailed_geo
ON
  updates.campaign_id = detailed_geo.campaign_id
  AND country_report.country_id = detailed_geo.country_id
