
{{ config(materialized='table') }}

with ae_ad_network_1_country_report as ( 
select
    date,
    campaign_id,
    country_id, 
    spend, 
    impressions, 
    clicks
from ovecell.ae_ad_network_1_country_report
)

select * from ae_ad_network_1_country_report