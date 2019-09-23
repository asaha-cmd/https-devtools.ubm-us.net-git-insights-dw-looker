view: job_function_demo_bridge {
  sql_table_name: cidw.job_function_demo_bridge ;;

  dimension: job_function_demo_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.job_function_demo_wid ;;
  }

  dimension: job_function_value_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.job_function_value_wid ;;
  }

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${TABLE}.job_function_demo_wid, ${TABLE}.job_function_value_wid) ;;
  }

}
