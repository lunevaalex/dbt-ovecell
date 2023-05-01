
{{ config(materialized='table') }}

with ae_ad_network_1_campaign_updates as ( 
select
    campaign_id,
    update_date,
    name
from ovecell.ae_ad_network_1_campaign_updates
)

select * from ae_ad_network_1_campaign_updates
