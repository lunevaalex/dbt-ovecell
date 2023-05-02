select distinct campaign_id from {{ ref('ae_ad_network_1_country_report')}}
where campaign_id not in (select distinct campaign_id from {{ ref('ae_ad_network_1_detailed_report')}})


--test if there any campaign_id from country report miss in detailed_report
