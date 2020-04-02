view: fact_net_new_person {
  sql_table_name: cidw.fact_net_new_person ;;

  dimension: data_source_wid {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.data_source_wid ;;
  }

  dimension: net_new_action {
    type: string
    sql: ${TABLE}.net_new_action ;;
  }

  dimension: net_new_date_wid {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.net_new_date_wid ;;
  }

  dimension: net_new_time_wid {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.net_new_time_wid ;;
  }

  dimension_group: net_new_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.net_new_timestamp ;;
  }

  dimension: person_wid {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.person_wid ;;
  }

  dimension: product_wid {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.product_wid ;;
  }

  dimension: row_wid {
    type: number
    primary_key: yes
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.row_wid ;;
  }

  dimension: warehouse_date_wid {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.warehouse_date_wid ;;
  }

  dimension: net_new_link_wid {
    type: number
    hidden: yes
  }

  dimension: net_new_table_source {
    type: string
    hidden: yes
  }
  measure: Count_Net_New {
    type: count_distinct
    sql: ${TABLE}.person_wid ;;
    drill_fields: []
  }
}
