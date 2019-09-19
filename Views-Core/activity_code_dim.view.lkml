view: activity_code_dim {
  sql_table_name: cidw.activity_code_dim ;;

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: code_source {
    type: string
    sql: ${TABLE}.code_source ;;
  }

  dimension: code_type {
    type: string
    sql: ${TABLE}.code_type ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: row_wid {
    hidden:  yes
    primary_key: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.row_wid ;;
  }

  measure: count {
    type: count
  }
}
