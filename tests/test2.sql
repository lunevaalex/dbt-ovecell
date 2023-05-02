select distinct campaign_id from {{ ref('ae_ad_network_1_campaign_updates')}}
where campaign_id not in (select distinct campaign_id from {{ ref('ae_ad_network_1_country_report')}})


--test if there any campaign_id from updates report miss in country_report
