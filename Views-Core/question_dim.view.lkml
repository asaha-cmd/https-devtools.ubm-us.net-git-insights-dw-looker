view: question_dim {
  sql_table_name: cidw.question_dim ;;

  dimension: data_source_wid {
    hidden:  yes
    type: number
    value_format_name: id
    sql: ${TABLE}.data_source_wid ;;
  }

  dimension: question_category {
    type: string
    sql: ${TABLE}.question_category ;;
  }

  dimension: question_text {
    type: string
    sql: ${TABLE}.question_display_text ;;
  }

  dimension: row_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.row_wid ;;
  }

  dimension: std_question_id {
    type: string
    sql: ${TABLE}.std_question_id ;;
  }

  dimension: warehouse_date_wid {
    hidden:  yes
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
