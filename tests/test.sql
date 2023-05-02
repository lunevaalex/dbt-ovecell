select distinct campaign_id from {{ ref('ae_ad_network_1_detailed_report')}}
where campaign_id not in (select distinct campaign_id from {{ ref('ae_ad_network_1_country_report')}})


--test if there any campaign_id from detailed report miss in country_report
