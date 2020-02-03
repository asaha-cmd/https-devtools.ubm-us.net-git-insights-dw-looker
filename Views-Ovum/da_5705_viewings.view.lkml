view: da_5705_viewings {
  label: "Ovum Viewings"
  sql_table_name: ovum.da_5705_viewings ;;

  dimension: line_nbr_dd {
    type: number
    sql: ${TABLE}.line_nbr_dd ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: source_file_key {
    type: number
    sql: ${TABLE}.source_file_key ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension_group: viewing {
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
    sql: ${TABLE}.viewing_date ;;
  }

  measure: count_of_viewings {
    label: "Count of Viewings"
    type: count
    drill_fields: [product_name]
  }
}
