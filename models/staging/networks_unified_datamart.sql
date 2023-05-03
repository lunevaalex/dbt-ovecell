SELECT
    campaign_id,
    update_date,
    campaign_name,
    detailed_report_date,
    country_id,
    state_id,
    detailed_report_spend,
    detailed_report_impressions,
    detailed_report_clicks,
    state_name,
    country_name,
    country_code,
    country_report_date,
    country_report_spend,
    country_report_impressions,
    country_report_clicks,
    1 AS network_type
FROM
    {{ ref('network_1_final_model')}}
UNION ALL
SELECT
    id AS campaign_id,
    NULL AS update_date,
    campaign_name,
    date,
    NULL AS country_id,
    NULL AS state_id,
    spend,
    impressions,
    clicks,
    NULL AS state_name,
    NULL AS country_name,
    NULL AS country_code,
    NULL AS country_report_date,
    NULL AS country_report_spend,
    NULL AS country_report_impressions,
    NULL AS country_report_clicks,
    2 AS network_type
FROM {{ ref('ae_ad_network_2_report') }}
    
