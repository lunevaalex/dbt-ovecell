{{ config(materialized='table') }}

with ae_ad_network_1_geo_dictionary as ( 
select
    id,
    country_code,
    name,
    location_type
from ovecell.ae_ad_network_1_geo_dictionary
)

select * from ae_ad_network_1_geo_dictionary