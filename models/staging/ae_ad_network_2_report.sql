
{{ config(materialized='table') }}

with ae_ad_network_2_report as ( 
select
    id,
    campaign_name,
    date,
    spend,
    impressions, 
    clicks
from ovecell.ae_ad_network_2_report
)

select * from ae_ad_network_2_report