view: engagement_overlap {
  derived_table: {
    sql:select distinct f.person_wid, p.product_brand as main_brand, s.product_brand as second_brand, s.engagement_type, s.engagement_date_wid from cidw.fact_engagement f
left join
        (select person_wid, product_brand, engagement_type, engagement_date_wid, row_number() over (partition by person_wid, product_brand order by engagement_date_wid desc) as rnk from cidw.fact_engagement f, cidw.product_dim p
        where f.brand_wid = p.row_wid and p.product_brand in ('Dark Reading', 'Network Computing', 'Interop', 'Data Center') and p.product_group = 'UBM Tech') s on f.person_wid = s.person_wid
left join cidw.product_dim p on f.brand_wid = p.row_wid
where p.product_brand = 'InformationWeek'
and rnk = 1 and s.person_wid is not null
UNION
select distinct f.person_wid, p.product_brand as main_brand, s.product_brand as second_brand, s.engagement_type, s.engagement_date_wid from cidw.fact_engagement f
left join
        (select person_wid, product_brand, engagement_type, engagement_date_wid, row_number() over (partition by person_wid, product_brand order by engagement_date_wid desc) as rnk from cidw.fact_engagement f, cidw.product_dim p
        where f.brand_wid = p.row_wid and p.product_brand in ('InformationWeek', 'Network Computing', 'Interop', 'Data Center') and p.product_group = 'UBM Tech') s on f.person_wid = s.person_wid
left join cidw.product_dim p on f.brand_wid = p.row_wid
where p.product_brand = 'Dark Reading'
and rnk = 1 and s.person_wid is not null
UNION
select distinct f.person_wid, p.product_brand as main_brand, s.product_brand as second_brand, s.engagement_type, s.engagement_date_wid from cidw.fact_engagement f
left join
        (select person_wid, product_brand, engagement_type, engagement_date_wid, row_number() over (partition by person_wid, product_brand order by engagement_date_wid desc) as rnk from cidw.fact_engagement f, cidw.product_dim p
        where f.brand_wid = p.row_wid and p.product_brand in ('InformationWeek', 'Dark Reading', 'Interop', 'Data Center') and p.product_group = 'UBM Tech') s on f.person_wid = s.person_wid
left join cidw.product_dim p on f.brand_wid = p.row_wid
where p.product_brand = 'Network Computing'
and rnk = 1 and s.person_wid is not null
UNION
select distinct f.person_wid, p.product_brand as main_brand, s.product_brand as second_brand, s.engagement_type, s.engagement_date_wid from cidw.fact_engagement f
left join
        (select person_wid, product_brand, engagement_type, engagement_date_wid, row_number() over (partition by person_wid, product_brand order by engagement_date_wid desc) as rnk from cidw.fact_engagement f, cidw.product_dim p
        where f.brand_wid = p.row_wid and p.product_brand in ('InformationWeek', 'Dark Reading', 'Network Computing', 'Data Center') and p.product_group = 'UBM Tech') s on f.person_wid = s.person_wid
left join cidw.product_dim p on f.brand_wid = p.row_wid
where p.product_brand = 'Interop'
and rnk = 1 and s.person_wid is not null
UNION
select distinct f.person_wid, p.product_brand as main_brand, s.product_brand as second_brand, s.engagement_type, s.engagement_date_wid from cidw.fact_engagement f
left join
        (select person_wid, product_brand, engagement_type, engagement_date_wid, row_number() over (partition by person_wid, product_brand order by engagement_date_wid desc) as rnk from cidw.fact_engagement f, cidw.product_dim p
        where f.brand_wid = p.row_wid and p.product_brand in ('InformationWeek', 'Dark Reading', 'Network Computing', 'Interop') and p.product_group = 'UBM Tech') s on f.person_wid = s.person_wid
left join cidw.product_dim p on f.brand_wid = p.row_wid
where p.product_brand = 'Data Center'
and rnk = 1 and s.person_wid is not null
       ;;
  }
  dimension: person_wid {
    type: number
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.person_wid ;;
  }
  dimension: product_brand {
    type: string
    sql: ${TABLE}.main_brand ;;
  }
  dimension: secondary_product_brand {
    type: string
    sql: ${TABLE}.second_brand ;;
  }
  dimension: most_recent_engagement_type {
    type: string
    sql: ${TABLE}.engagement_type ;;
  }
  dimension: most_recent_engagement_date {
    type: number
    hidden: yes
    sql: ${TABLE}.engagement_date_wid ;;
  }
}
