
{{ config(materialized='table') }}

with ae_ad_network_1_detailed_report as ( 
select
    date, 
    campaign_id,
    country_id, 
    state_id, 
    spend,
    impressions, 
    clicks
from ovecell.ae_ad_network_1_detailed_report
)

select * from ae_ad_network_1_detailed_report