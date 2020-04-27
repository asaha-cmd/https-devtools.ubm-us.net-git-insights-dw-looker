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
    drill_fields: [title]
  }

  dimension: discipline_2 {
    type: string
    sql: ${TABLE}.discipline_2 ;;
    drill_fields: [title]
  }

  dimension_group: session_end {
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
    drill_fields: [title]
  }

  dimension: session_code {
    hidden: yes
    type: string
    sql: ${TABLE}.session_code ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: session_date_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.session_date_wid ;;
  }

  dimension: session_length {
    hidden: no
    type: number
    sql: ${TABLE}.session_length ;;
  }

  dimension: session_track_1 {
    type: string
    sql: ${TABLE}.session_track_1 ;;
    drill_fields: [title, discipline_1]
  }

  dimension: session_track_2 {
    type: string
    sql: ${TABLE}.session_track_2 ;;
    drill_fields: [title, discipline_1, discipline_2]
  }

  dimension_group: session_start {
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
