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
      week_of_year,
      month_name,
      quarter_of_year,
      day_of_week,
      year
    ]
    sql: ${TABLE}.calendar_date ;;
  }

  dimension_group: activity {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      week_of_year,
      month_name,
      quarter_of_year,
      day_of_week,
      year
    ]
    hidden: yes
    sql: ${TABLE}.calendar_date ;;
  }
  set: activity_dates {
    fields: [
      activity_date,
      activity_week,
      activity_month,
      activity_quarter,
      activity_week_of_year,
      activity_month_name,
      activity_quarter_of_year,
      activity_day_of_week,
      activity_year
    ]

  }
  dimension: row_wid {
    type: number
    value_format_name: id
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.row_wid ;;
  }
}
