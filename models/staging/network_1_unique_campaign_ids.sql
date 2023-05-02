SELECT distinct campaign_id
FROM 
(SELECT campaign_id FROM {{ ref('ae_ad_network_1_campaign_updates')}} 
UNION ALL
SELECT campaign_id FROM {{ ref('ae_ad_network_1_country_report')}}
UNION ALL
SELECT campaign_id FROM {{ ref('ae_ad_network_1_detailed_report')}}) campaigns