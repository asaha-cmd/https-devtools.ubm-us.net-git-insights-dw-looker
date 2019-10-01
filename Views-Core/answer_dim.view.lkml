view: answer_dim {
  sql_table_name: cidw.answer_dim ;;

  dimension: answer_text {
    type: string
    sql: ${TABLE}.answer_text ;;
  }

  dimension: data_source_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.data_source_wid ;;
  }

  dimension: row_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.row_wid ;;
  }

  dimension: warehouse_date_wid {
    hidden: yes
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
