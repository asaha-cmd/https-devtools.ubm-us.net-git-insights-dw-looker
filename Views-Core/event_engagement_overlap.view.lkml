view: event_engagement_overlap {
  derived_table: {
    sql:select distinct f.person_wid, f.brand_name as main_brand, s.brand_name as second_brand, s.engagement_type, s.engagement_date_wid from cidw.fact_engagement f
left join
        (select person_wid, f.brand_name, engagement_type, engagement_date_wid, row_number() over (partition by person_wid, engagement_type, f.brand_name order by engagement_date_wid desc) as rnk from cidw.fact_engagement f
        where f.brand_name in ('Interop', 'Enterprise Connect', 'Black Hat', 'InformationWeek', 'Gamasutra', 'Dark Reading', 'Network Computing', 'Data Center', 'No Jitter')
 and f.engagement_type in ('Event Registration', 'Newsletter Subscription', 'PageView','Online','Webinar Registration') ) s on f.person_wid = s.person_wid
left join cidw.event_reg_pass_fact erpf on f.engagement_link = erpf.event_reg_wid
left join cidw.event_pass_dim epd on erpf.event_pass_wid  = epd.row_wid
where f.brand_name = 'GDC'
and epd.pass_type = 'Paid'
--and rnk <= 10
and s.person_wid is not null and f.engagement_type = 'Event Registration'
UNION
 select distinct f.person_wid, f.brand_name as main_brand, s.brand_name as second_brand, s.engagement_type, s.engagement_date_wid from cidw.fact_engagement f
left join
        (select person_wid, f.brand_name, engagement_type, engagement_date_wid, row_number() over (partition by person_wid, engagement_type, f.brand_name order by engagement_date_wid desc) as rnk from cidw.fact_engagement f
        where f.brand_name in ('GDC', 'Enterprise Connect', 'Black Hat', 'InformationWeek', 'Gamasutra', 'Dark Reading', 'Network Computing', 'Data Center', 'No Jitter')
and f.engagement_type in ('Event Registration', 'Newsletter Subscription', 'PageView','Online','Webinar Registration') ) s on f.person_wid = s.person_wid
left join cidw.event_reg_pass_fact erpf on f.engagement_link = erpf.event_reg_wid
left join cidw.event_pass_dim epd on erpf.event_pass_wid  = epd.row_wid
where f.brand_name = 'Interop'
and epd.pass_type = 'Paid'
--and rnk <= 10
and s.person_wid is not null and f.engagement_type = 'Event Registration'
UNION
 select distinct f.person_wid, f.brand_name as main_brand, s.brand_name as second_brand, s.engagement_type, s.engagement_date_wid from cidw.fact_engagement f
left join
        (select person_wid, f.brand_name, engagement_type, engagement_date_wid, row_number() over (partition by person_wid, engagement_type, f.brand_name order by engagement_date_wid desc) as rnk from cidw.fact_engagement f
        where f.brand_name in ('Interop', 'GDC', 'Black Hat', 'InformationWeek', 'Gamasutra', 'Dark Reading', 'Network Computing', 'Data Center', 'No Jitter')
and f.engagement_type in ('Event Registration', 'Newsletter Subscription', 'PageView','Online','Webinar Registration') ) s on f.person_wid = s.person_wid
left join cidw.event_reg_pass_fact erpf on f.engagement_link = erpf.event_reg_wid
left join cidw.event_pass_dim epd on erpf.event_pass_wid  = epd.row_wid
where f.brand_name = 'Enterprise Connect'
and epd.pass_type = 'Paid'
--and rnk <= 10
and s.person_wid is not null and f.engagement_type = 'Event Registration'
UNION
 select distinct f.person_wid, f.brand_name as main_brand, s.brand_name as second_brand, s.engagement_type, s.engagement_date_wid from cidw.fact_engagement f
left join
        (select person_wid, f.brand_name, engagement_type, engagement_date_wid, row_number() over (partition by person_wid, engagement_type, f.brand_name order by engagement_date_wid desc) as rnk from cidw.fact_engagement f
        where f.brand_name in ('Interop', 'GDC', 'Enterprise Connect', 'InformationWeek', 'Gamasutra', 'Dark Reading', 'Network Computing', 'Data Center', 'No Jitter')
and f.engagement_type in ('Event Registration', 'Newsletter Subscription', 'PageView','Online','Webinar Registration') ) s on f.person_wid = s.person_wid
left join cidw.event_reg_pass_fact erpf on f.engagement_link = erpf.event_reg_wid
left join cidw.event_pass_dim epd on erpf.event_pass_wid  = epd.row_wid
where f.brand_name = 'Black Hat'
and epd.pass_type = 'Paid'
--and rnk <= 10
and s.person_wid is not null and f.engagement_type = 'Event Registration'
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
  dimension: engagement_type {
    type: string
    sql: ${TABLE}.engagement_type ;;
  }
  dimension: engagement_date {
    type: number
    hidden: yes
    sql: ${TABLE}.engagement_date_wid ;;
  }
}
