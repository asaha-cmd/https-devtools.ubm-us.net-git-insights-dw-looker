view: dim_session {
  sql_table_name: cidw.dim_session ;;

  dimension: row_wid {
    primary_key: yes
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.row_wid ;;
  }

  dimension: create_date_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.create_date_wid ;;
  }

  dimension: data_source_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.data_source_wid ;;
  }

  dimension: discipline_1 {
    type: string
    sql: ${TABLE}.discipline_1 ;;
  }

  dimension: discipline_2 {
    type: string
    sql: ${TABLE}.discipline_2 ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_time ;;
  }

  dimension: product_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.product_wid ;;
  }

  dimension: program {
    type: string
    sql: ${TABLE}.program ;;
  }

  dimension: session_code {
    hidden: yes
    type: string
    sql: ${TABLE}.session_code ;;
  }

  dimension: session_date_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.session_date_wid ;;
  }

  dimension: session_length {
    hidden: yes
    type: number
    sql: ${TABLE}.session_length ;;
  }

  dimension: session_track_1 {
    type: string
    sql: ${TABLE}.session_track_1 ;;
  }

  dimension: session_track_2 {
    type: string
    sql: ${TABLE}.session_track_2 ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_time ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: warehouse_date_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.warehouse_date_wid ;;
  }

  dimension: warehouse_update_date_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.warehouse_update_date_wid ;;
  }

}