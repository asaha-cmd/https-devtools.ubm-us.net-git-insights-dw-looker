view: asset_qa_history_fact {
  sql_table_name: cidw.asset_qa_history_fact ;;

  dimension: answer_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.answer_wid ;;
    hidden: yes
  }

  dimension: asset_qa_id {
    type: string
    sql: ${TABLE}.asset_qa_id ;;
    hidden: yes
    }

  dimension: asset_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.asset_wid ;;
    hidden: yes
    }

  dimension: created_date_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.created_date_wid ;;
    hidden: yes
    }

  dimension: data_source_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.data_source_wid ;;
    hidden: yes
    }

  dimension: modified_date_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.modified_date_wid ;;
    hidden: yes
    }

  dimension: person_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.person_wid ;;
    hidden: yes
    }

  dimension: product_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.product_wid ;;
    hidden: yes
    }

  dimension: question_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.question_wid ;;
    hidden: yes
    }

  dimension: row_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.row_wid ;;
    hidden: yes
    }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.transaction_id ;;
    hidden: yes
  }

  dimension: warehouse_date_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.warehouse_date_wid ;;
    hidden: yes
    }

  dimension: warehouse_update_date_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.warehouse_update_date_wid ;;
    hidden: yes
    }

  measure: count {
    type: count
    drill_fields: []
  }
}
