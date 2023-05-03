SELECT
    1 AS network_type,
    campaign_id,
    NULL AS n2_date,
    update_date AS n1_update_date,
    campaign_name,
    NULL AS n2_spend,
    NULL AS n2_impressions,
    NULL AS n2_clicks,
    country_id AS n1_country_id,
    state_id AS n1_state_id,
    state_name AS n1_state_name,
    country_name AS n1_country_name,
    country_code AS n1_country_code,
    detailed_report_date AS n1_detailed_report_date,
    detailed_report_spend AS n1_detailed_report_spend,
    detailed_report_impressions AS n1_detailed_report_impressions,
    detailed_report_clicks AS n1_detailed_report_clicks,
    country_report_date AS n1_country_report_date,
    country_report_spend AS n1_country_report_spend,
    country_report_impressions AS n1_country_report_impressions,
    country_report_clicks AS n1_country_report_clicks
FROM {{ ref('network_1_final_model') }}

UNION ALL

SELECT
    2 AS network_type,
    id AS campaign_id,
    date as n2_date,
    NULL AS n1_update_date, 
    campaign_name,
    spend AS n2_spend,
    impressions AS n2_impressions,
    clicks AS n2_clicks,
    NULL AS n1_country_id,
    NULL AS n1_state_id,
    NULL AS n1_state_name,
    NULL AS n1_country_name,
    NULL AS n1_country_code,
    NULL AS n1_detailed_report_date,
    NULL AS n1_detailed_report_spend,
    NULL AS n1_detailed_report_impressions,
    NULL AS n1_detailed_report_clicks,
    NULL AS n1_country_report_date,
    NULL AS n1_country_report_spend,
    NULL AS n1_country_report_impressions,
    NULL AS n1_country_report_clicks
FROM {{ ref('ae_ad_network_2_report') }}
