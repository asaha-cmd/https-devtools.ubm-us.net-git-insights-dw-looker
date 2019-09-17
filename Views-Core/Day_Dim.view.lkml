view: day_dim {
  sql_table_name: cidw.day_dim ;;



  dimension_group: calendar {
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
    sql: ${TABLE}.calendar_date ;;
  }

  dimension: row_wid {
    type: number
    value_format_name: id
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.row_wid ;;
  }
}
