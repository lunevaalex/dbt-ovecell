SELECT
    unique_campaigns.campaign_id,
    campaign_updates.update_date,
    campaign_updates.name AS campaign_name,
    detailed_report.date AS detailed_report_date,
    detailed_report.country_id,
    detailed_report.state_id,
    detailed_report.spend AS detailed_report_spend,
    detailed_report.impressions AS detailed_report_impressions,
    detailed_report.clicks AS detailed_report_clicks,
    detailed_report.state_name,
    country_report.country_name,
    country_report.country_code,
    country_report.date AS country_report_date,
    country_report.spend AS country_report_spend,
    country_report.impressions AS country_report_impressions,
    country_report.clicks AS country_report_clicks
FROM
    {{ ref('network_1_unique_campaign_ids')}} AS unique_campaigns
LEFT JOIN
    {{ ref('ae_ad_network_1_campaign_updates')}} AS campaign_updates ON unique_campaigns.campaign_id = campaign_updates.campaign_id
LEFT JOIN
    {{ ref('dim_geo_network_1_detailed_report')}} AS detailed_report ON unique_campaigns.campaign_id = detailed_report.campaign_id
LEFT JOIN
    {{ ref('dim_geo_network_1_country_report')}} AS country_report ON unique_campaigns.campaign_id = country_report.campaign_id