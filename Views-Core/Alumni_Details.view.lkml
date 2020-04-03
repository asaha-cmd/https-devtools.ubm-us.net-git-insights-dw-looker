include: "/Views-Core/*.view.lkml"
include: "/Explore-EventRegistration/*.explore.lkml"

explore: alumni_ex {
  hidden: yes
  view_name: alumni_details
  group_label: "Event Registration"
  #from:event_registration_fact
  label: "Event Alumni Details 2"
  description: "Supports exploration and analysis of Event Alumni"

  join:  event_alumni_years{
    required_access_grants: [developer_access]
    view_label: "Alumni (related to Event)"
    relationship: one_to_many
    sql_on: ${event_alumni_years.person_wid} = ${alumni_details.person_wid} and  ${event_alumni_years.alumni_product_wid} = ${alumni_details.product_wid};;
  }

}

view: event_alumni_years {
  derived_table: {
    explore_source: fact_alumni_event {
      column: person_wid {field: alumni_details.person_wid}
      column: alumni_years {field: alumni_details.alumni_year_count}
      column: product_event {field: alumni_details.product_event}
      column: alumni_product_wid {field: alumni_details.alumni_product_wid}
      #bind_all_filters: yes
      #bind_filters: {from_field:alumni_details.registration_flag to_field:alumni_details.registration_flag_f}
    }
  }
  # Define the view's fields as desired
  dimension: person_wid {hidden: yes}
  dimension: alumni_years {type: number}
  dimension: product_event {hidden: no}
  dimension: alumni_product_wid {hidden: no}
}

explore: fact_alumni_event {
  hidden: yes
  view_name: alumni_details
  group_label: "Event Registration"
  #from:event_registration_fact
  label: "Event Alumni"
  description: "Supports exploration and analysis of Event Alumni"


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
    #publish_as_db_view: yes
    #datagroup_trigger: basic_cache
    #distribution_style: all
    #indexes: ["product_wid", "person_wid", "product_event", "registration_date_wid", "alumni_product_wid" ]
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
