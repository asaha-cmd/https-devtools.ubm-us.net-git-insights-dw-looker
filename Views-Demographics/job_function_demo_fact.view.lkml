view: job_function_demo_fact {
  sql_table_name: cidw.job_function_demo_fact ;;

  dimension: audience_group_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.audience_group_wid ;;
  }

  dimension: created_date_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.created_date_wid ;;
  }

  dimension: data_source_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.data_source_wid ;;
  }

  dimension: modified_date_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.modified_date_wid ;;
  }

  dimension: person_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.person_wid ;;
  }

  dimension: row_wid {
    type: number
    value_format_name: id
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.row_wid ;;
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

  measure: number_of_people {
    description: "Count of People"
    type: count_distinct
    sql_distinct_key: ${person_wid} ;;}
}
