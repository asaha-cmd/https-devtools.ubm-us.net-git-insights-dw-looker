view: job_function_value_dim {
  sql_table_name: cidw.job_function_value_dim ;;

  dimension: code_data_source_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.code_data_source_wid ;;
  }

  dimension: original_code {
    type: string
    hidden: yes
    sql: ${TABLE}.original_code ;;
  }

  dimension: original_name {
    type: string
    sql: ${TABLE}.original_name ;;
  }

  dimension: product_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.product_wid ;;
  }

  dimension: row_wid {
    type: number
    value_format_name: id
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.row_wid ;;
  }

  dimension: standard_name {
    type: string
    sql: ${TABLE}.standard_name ;;
  }

  measure: count {
    type: count
    drill_fields: [standard_name, original_name]
  }
}
