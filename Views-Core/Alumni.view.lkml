include: "/Views-Core/*.view.lkml"


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
