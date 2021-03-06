view: day_dim {
  sql_table_name: cidw.day_dim ;;

  dimension_group: calendar {
    label: "{% assign words = _view._name | split: '_' %}{% for word in words %} {{ word | capitalize }}{% endfor %}"
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
      calendar_date,
      calendar_week,
      calendar_month,
      calendar_quarter,
      calendar_week_of_year,
      calendar_month_name,
      calendar_quarter_of_year,
      calendar_day_of_week,
      calendar_year
    ]
  }

  dimension: per_name_half {
    type: string
    label: "{% assign words = _view._name | split: '_' %}{% for word in words %} {{ word | capitalize }}{% endfor %} Date Year Half"
    sql:  ${TABLE}.per_name_half ;;
    drill_fields: [calendar_quarter]
  }
  dimension: row_wid {
    type: number
    value_format_name: id
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.row_wid ;;
  }
}
