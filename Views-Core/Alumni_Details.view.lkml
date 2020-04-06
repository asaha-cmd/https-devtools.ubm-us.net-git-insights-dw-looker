include: "/Views-Core/*.view.lkml"
include: "/Explore-EventRegistration/*.explore.lkml"

view: alumni_event_years {
  derived_table: {
    sql: select person_wid, product_wid, alumni_product_wid ,primary_pass,
      count( product_wid) over (partition by person_wid, alumni_product_wid) as total_alumni_events
       from (select * from sandbox.lr$hb82j1586194886750_alumni_details  as alumni_details
        where {% condition primary_pass_name %} alumni_details.primary_pass {% endcondition %}) ;;
  }
  filter: primary_pass_name {
    type: string
  }
  dimension: pk {
    primary_key: yes
    sql: concat(${person_wid}, ${product_wid}) ;;
  }
  dimension: person_wid {}
  #dimension: secondary_brand {}
  dimension: product_wid {}
  dimension: alumni_product_wid {}
  dimension: primary_pass {}
  #dimension: registration_date { type: date }
  dimension: total_alumni_events {
    description: "Total number of events by the same product secondary brand that this person attended"
    type: number
  }
  measure: year_count {
    type: count_distinct
    value_format: "0 \"Years\""
    label: "Year Count"
    description: "Count of Prior Years the user registered for the event"
    hidden: no
    sql: ${TABLE}.product_wid;;
  }
}

view: alumni_details {
  derived_table: {
    sql:
      select a.*, e.product_wid as alumni_product_wid from (
select erf.person_wid, erf.product_wid, product_brand, secondary_brand as product_event, title as event_name
      ,registration_flag, erf.registration_date_wid, registration_type, ticket_type, total_collected, pass_name as primary_pass
      from cidw.event_registration_fact erf
      left join cidw.event_reg_pass_fact erpf on erf.row_wid = erpf.event_reg_wid and erpf.person_wid = erf.person_wid and erpf.product_wid = erf.product_wid
      left join cidw.event_pass_dim epd on erpf.event_pass_wid = epd.row_wid
      , cidw.product_dim p, cidw.event_registration_dim erd
        where erf.product_wid = p.row_wid and erf.event_registration_wid = erd.row_wid
        and (epd.primary_pass = 'Y' or epd.primary_pass is null)
        and p.secondary_brand = 'Black Hat USA'
        and {% condition primary_pass_name %} epd.pass_name {% endcondition %}
        ) a
        left join (select person_wid, secondary_brand as product_event, registration_date_wid, product_wid from cidw.event_registration_fact f, cidw.product_dim p where f.product_wid = p.row_wid) e
         on a.person_wid = e.person_wid and a.product_event = e.product_event and a.registration_date_wid < e.registration_date_wid and a.product_wid != e.product_wid
  ;;
    publish_as_db_view: yes
    datagroup_trigger: basic_cache
    distribution_style: all
    indexes: ["product_wid", "person_wid", "product_event", "registration_date_wid", "alumni_product_wid" ]
    }
    filter: primary_pass_name {
      type: string
    }

    dimension: fact_alumni_key {
      primary_key: yes
      type: string
      value_format_name: id
      hidden: yes
      sql:${TABLE}.person_wid || ${TABLE}.product_wid;;
    }
    dimension: registration_flag {
      description: "Value of Alumni event, not report event"
      type: string
    }
    dimension: registration_type {
      description: "Value of Alumni event, not report event"
      type: string
    }
    dimension: ticket_type {
      description: "Value of Alumni event, not report event"
      type: string
    }
    dimension: total_collected {
      description: "Value of Alumni event, not report event"
      value_format_name: usd
      type: number
    }
    dimension: primary_pass {
      description: "Value of Alumni event, not report event"
      type: string
    }
    dimension: event_name {
      hidden: no
      type: string
    }
    dimension: person_wid {
      type: number
      value_format_name: id
      hidden: yes
      sql: ${TABLE}.person_wid ;;
    }
    dimension: product_wid {
      type: number
      value_format_name: id
      hidden: yes
    }
    dimension: alumni_product_wid {
      type: number
      value_format_name: id
      hidden: yes
    }
    dimension: product_brand {
      type: string
      hidden: yes
    }
    dimension: product_event {
      hidden: yes
      type: string
    }
    dimension: registration_date_wid {
      type: number
      value_format_name: id
      hidden: yes
      sql: ${TABLE}.registration_date_wid ;;
    }

    measure: alumni_year_count{
      type: count_distinct
      value_format: "0 \"Years\""
      label: "Year Count"
      description: "Count of Prior Years the user registered for the event"
      hidden: no
      sql: ${TABLE}.event_name;;

    }
  }
