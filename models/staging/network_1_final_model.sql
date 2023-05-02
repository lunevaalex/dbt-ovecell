{{ config(materialized="table") }}

WITH unique_campaigns AS (
  SELECT campaign_id
  FROM {{ ref('network_1_unique_campaign_ids') }}
),
campaign_updates AS (
  SELECT
    campaign_id,
    update_date,
    name AS campaign_name
  FROM {{ ref('ae_ad_network_1_campaign_updates') }}
),
detailed_report AS (
  SELECT
    campaign_id,
    date AS detailed_report_date,
    country_id,
    state_id,
    state_name,
    spend AS detailed_report_spend,
    impressions AS detailed_report_impressions,
    clicks AS detailed_report_clicks
  FROM {{ ref('dim_geo_network_1_detailed_report') }}
),
country_report AS (
  SELECT
    campaign_id,
    date AS country_report_date,
    spend AS country_report_spend,
    impressions AS country_report_impressions,
    clicks AS country_report_clicks
  FROM {{ ref('dim_geo_network_1_country_report') }}
)
SELECT
  uc.campaign_id,
  cu.update_date,
  cu.campaign_name,
  dr.detailed_report_date,
  dr.country_id,
  dr.state_id,
  dr.state_name,
  cr.country_name,
  cr.country_code,
  dr.detailed_report_spend,
  dr.detailed_report_impressions,
  dr.detailed_report_clicks,
  cr.country_report_date,
  cr.country_report_spend,
  cr.country_report_impressions,
  cr.country_report_clicks
FROM unique_campaigns uc
LEFT JOIN campaign_updates cu ON uc.campaign_id = cu.campaign_id
LEFT JOIN detailed_report dr ON uc.campaign_id = dr.campaign_id
LEFT JOIN country_report cr ON uc.campaign_id = cr.campaign_id
