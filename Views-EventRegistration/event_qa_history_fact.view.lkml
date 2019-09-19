view: event_qa_history_fact {
  sql_table_name: cidw.event_qa_history_fact ;;

  dimension: answer_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.answer_wid ;;
  }

  dimension: created_date_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.created_date_wid ;;
  }

  dimension: data_source_wid {
    hidden: yes
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

  dimension: product_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.product_wid ;;
  }

  dimension: question_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.question_wid ;;
  }

  dimension: row_wid {
    hidden: yes
    primary_key: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.row_wid ;;
  }

  measure: count {
    type: count
  }
}
