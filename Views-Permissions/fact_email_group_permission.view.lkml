view: fact_email_group_permission {
  sql_table_name: cidw.fact_email_group_permission ;;

  dimension: email_group_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.email_group_wid ;;
  }

  dimension: permission_date_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.permission_date_wid ;;
  }

  dimension: person_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.person_wid ;;
  }

  dimension: row_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.row_wid ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: warehouse_date_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.warehouse_date_wid ;;
  }

  dimension: warehouse_update_date_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.warehouse_update_date_wid ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
