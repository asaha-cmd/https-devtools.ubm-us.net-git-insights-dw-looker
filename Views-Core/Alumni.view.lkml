include: "/Views-Core/*.view.lkml"

explore: alumni_ex {
  hidden: yes
  view_name: event_alumni_years
  group_label: "Event Registration"
  #from:event_registration_fact
  label: "Event Alumni Details 2"
  description: "Supports exploration and analysis of Event Alumni"

  join: person {
    type: inner
    relationship: many_to_one
    sql_on: ${event_alumni_years.person_wid} = ${person.person_wid} ;;
  }
  join: person_permissions {
    view_label: "Person Permissions"
    from:  person_permissions
    type:  left_outer
    relationship: many_to_many
    sql_on: ${person.person_wid} = ${person_permissions.person_wid} ;;
  }


}

view: event_alumni_years {
  derived_table: {
    explore_source: fact_alumni_event {
      column: person_wid {field: fact_alumni_event.person_wid}
      column: alumni_years {field: fact_alumni_event.alumni_year_count}
      column: product_event {field: fact_alumni_event.product_event}


    }
  }
  # Define the view's fields as desired
  dimension: person_wid {hidden: yes}
  dimension: alumni_years {type: number}
  dimension: product_event {hidden: no}
}

explore: fact_alumni_event {
  hidden: yes
  view_name: fact_alumni_event
  group_label: "Event Registration"
  #from:event_registration_fact
  label: "Event Alumni"
  description: "Supports exploration and analysis of Event Alumni"

  join: person {
    type: inner
    relationship: many_to_one
    sql_on: ${fact_alumni_event.person_wid} = ${person.person_wid} ;;
  }
  join: person_permissions {
    view_label: "Person Permissions"
    from:  person_permissions
    type:  left_outer
    relationship: many_to_many
    sql_on: ${person.person_wid} = ${person_permissions.person_wid} ;;
  }
  join: product {
    type: inner
    relationship: many_to_one
    sql_on: ${fact_alumni_event.product_wid} != ${product.row_wid} and  ${fact_alumni_event.registration_date_wid} < ${product.start_date_wid} ;;
  }

}
view: fact_alumni_event {
  derived_table: {
    sql:
      select distinct erf.person_wid, erf.product_wid, product_brand, secondary_brand as product_event, title as event_name
      ,registration_flag, erf.registration_date_wid, registration_type, ticket_type, total_collected, pass_name as primary_pass
      from cidw.event_registration_fact erf
      left join cidw.event_reg_pass_fact erpf on erf.row_wid = erpf.event_reg_wid and erpf.person_wid = erf.person_wid and erpf.product_wid = erf.product_wid
      left join cidw.event_pass_dim epd on erpf.event_pass_wid = epd.row_wid
      , cidw.product_dim p, cidw.event_registration_dim erd
        where erf.product_wid = p.row_wid and erf.event_registration_wid = erd.row_wid
        and (epd.primary_pass = 'Y' or epd.primary_pass is null)
        and p.secondary_brand = 'Black Hat USA';
  ;;
    publish_as_db_view: yes
    datagroup_trigger: basic_cache
    distribution_style: all
    indexes: ["product_wid", "person_wid", "product_event", "registration_date_wid" ]
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
    label: "Year Count"
    description: "Count of Prior Years the user registered for the event"
    hidden: yes
    sql: ${TABLE}.event_name ;;
  }
}

view: alumni {
  derived_table: {
    sql:
      select count(distinct product_wid) as alumni_count, person_wid, product_brand as alumni_name, 'Brand' as alumni_level
      ,min(registration_date_wid) as first_reg_date_wid, max(registration_date_wid) as last_reg_date_wid
      from cidw.event_registration_fact erf, cidw.product_dim p
        where erf.product_wid = p.row_wid
        group by 2, 3
      UNION
      select count(distinct product_wid) as alumni_count, person_wid, secondary_brand as alumni_name, 'Event' as alumni_level
      ,min(registration_date_wid) as first_reg_date_wid, max(registration_date_wid) as last_reg_date_wid
      from cidw.event_registration_fact erf, cidw.product_dim p
        where erf.product_wid = p.row_wid
        group by 2, 3
;;
    publish_as_db_view: yes
    datagroup_trigger: basic_cache
    distribution_style: all
    indexes: ["alumni_name", "alumni_level", "person_wid"]
  }
  dimension: alumni_key {
    primary_key: yes
    type: string
    value_format_name: id
    hidden: yes
    sql:${TABLE}.person_wid || ${TABLE}.alumni_name || ${TABLE}.alumni_level;;
  }

  dimension: person_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.person_wid ;;
  }

  dimension: first_reg_date_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.first_reg_date_wid ;;
  }

  dimension: last_reg_date_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.last_reg_date_wid ;;
  }

  dimension: alumni_name {
    type: string
    hidden: yes
    sql: ${TABLE}.alumni_name ;;
  }
  dimension: alumni_level {
    type: string
    hidden: yes
    sql: ${TABLE}.alumni_level ;;
  }
  dimension: alumni_count {
    type: number
    hidden: yes
    sql: ${TABLE}.alumni_count ;;
  }
}

view: alumni_brand {
  extends: [alumni]
  dimension: brand_name {
    type: string
    description: "Brand Level Name of Alumni for events"
    sql: case when ${TABLE}.alumni_level = 'Brand' then ${TABLE}.alumni_name else null END;;
  }
  dimension: brand_count {
    type: number
    description: "Number of events registered under this brand"
    sql: case when ${TABLE}.alumni_level = 'Brand' then ${TABLE}.alumni_count else null END;;
  }
  measure: total_brand_count {
    type: sum
    label: "Total Count"
    description: "Count of Users Per Number of Events under this brand"
    sql: case when ${TABLE}.alumni_level = 'Brand' then ${TABLE}.alumni_count else null END ;;
  }
  set:  alumni_brand {
    fields: [brand_count, brand_name, total_brand_count]
  }
}

view: alumni_event {
  extends: [alumni]
  dimension: event_name {
    type: string
    description: "Event Level Name of Alumni for the events sub brand"
    sql: case when ${TABLE}.alumni_level = 'Event' then ${TABLE}.alumni_name else null END;;
  }

  dimension: event_count {
    type: number
    description: "Number of events registered under this events sub brand"
    sql: case when ${TABLE}.alumni_level = 'Event' then ${TABLE}.alumni_count else null END;;
  }

  measure: total_event_count {
    type: sum
    label: "Total Count"
    description: "Count of Users Per Number of Events under this sub brand"
    sql: case when ${TABLE}.alumni_level = 'Event' then ${TABLE}.alumni_count else null END ;;
  }
  set:  alumni_event {
    fields: [event_count, event_name, total_event_count]
  }
  }
