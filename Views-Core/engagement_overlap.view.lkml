view: engagement_overlap {
  derived_table: {
    sql: select distinct f.person_wid, p.product_brand as main_brand, s.product_brand as second_brand from cidw.fact_engagement f
left join
        (select distinct person_wid, product_brand from cidw.fact_engagement f, cidw.product_dim p
        where f.brand_wid = p.row_wid and p.product_brand in ('Dark Reading', 'Network Computing', 'Interop', 'No Jitter') and p.product_group = 'UBM Tech') s on f.person_wid = s.person_wid
left join cidw.product_dim p on f.brand_wid = p.row_wid
where p.product_brand = 'InformationWeek'
and s.person_wid is not null
UNION
select distinct f.person_wid, p.product_brand as main_brand, s.product_brand as second_brand from cidw.fact_engagement f
left join
        (select distinct person_wid, product_brand from cidw.fact_engagement f, cidw.product_dim p
        where f.brand_wid = p.row_wid and p.product_brand in ('InformationWeek', 'Network Computing', 'Interop', 'No Jitter') and p.product_group = 'UBM Tech') s on f.person_wid = s.person_wid
left join cidw.product_dim p on f.brand_wid = p.row_wid
where p.product_brand = 'Dark Reading'
and s.person_wid is not null
UNION
select distinct f.person_wid, p.product_brand as main_brand, s.product_brand as second_brand from cidw.fact_engagement f
left join
        (select distinct person_wid, product_brand from cidw.fact_engagement f, cidw.product_dim p
        where f.brand_wid = p.row_wid and p.product_brand in ('InformationWeek', 'Dark Reading', 'Interop', 'No Jitter') and p.product_group = 'UBM Tech') s on f.person_wid = s.person_wid
left join cidw.product_dim p on f.brand_wid = p.row_wid
where p.product_brand = 'Network Computing'
and s.person_wid is not null
UNION
select distinct f.person_wid, p.product_brand as main_brand, s.product_brand as second_brand from cidw.fact_engagement f
left join
        (select distinct person_wid, product_brand from cidw.fact_engagement f, cidw.product_dim p
        where f.brand_wid = p.row_wid and p.product_brand in ('InformationWeek', 'Dark Reading', 'Network Computing', 'No Jitter') and p.product_group = 'UBM Tech') s on f.person_wid = s.person_wid
left join cidw.product_dim p on f.brand_wid = p.row_wid
where p.product_brand = 'Interop'
and s.person_wid is not null
UNION
select distinct f.person_wid, p.product_brand as main_brand, s.product_brand as second_brand from cidw.fact_engagement f
left join
        (select distinct person_wid, product_brand from cidw.fact_engagement f, cidw.product_dim p
        where f.brand_wid = p.row_wid and p.product_brand in ('InformationWeek', 'Dark Reading', 'Network Computing', 'Interop') and p.product_group = 'UBM Tech') s on f.person_wid = s.person_wid
left join cidw.product_dim p on f.brand_wid = p.row_wid
where p.product_brand = 'No Jitter'
and s.person_wid is not null
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
}

