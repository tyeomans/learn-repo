with listings as (
  select * from {{ref('stg_models_listings')}}
)
,

pivoted as (

  select

    neighbourhood,

    {%- for property_type in [
    'Apartment',
    'House',
    'Camper/RV',
    'Boutique hotel',
    'Farm stay'
    ] -%}

        {%- set property_type_cleaned =
              property_type | lower | replace(' ', '_') | replace('/','_')
        %}
    sum(case when property_type = '{{property_type}}'
        then 1 else 0 end) as {{property_type_cleaned}}__count{{- ',' if not loop.last }}
    {% endfor -%}
  from listings
  group by 1

)

select * from pivoted
