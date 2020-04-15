view: fact_scheduled_session {
  sql_table_name: cidw.fact_scheduled_session ;;

  dimension: row_wid {
    primary_key: yes
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.row_wid ;;
  }
  dimension: data_source_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.data_source_wid ;;
  }

  dimension: person_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.person_wid ;;
  }

  dimension: product_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.product_wid ;;
  }

  dimension: schedule_date_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.schedule_date_wid ;;
  }

  dimension: schedule_time_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.schedule_time_wid ;;
  }

  dimension_group: schedule_timestamp {
    hidden: yes
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
    sql: ${TABLE}.schedule_timestamp ;;
  }

  dimension: session_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.session_wid ;;
  }

  dimension: warehouse_date_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.warehouse_date_wid ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
