view: event_reg_pass_fact {
  sql_table_name: cidw.event_reg_pass_fact ;;

  dimension: calculated_amount {
    type: number
    sql: ${TABLE}.calculated_amount ;;
  }

  dimension: data_source_wid {
    hidden:  yes
    type: number
    value_format_name: id
    sql: ${TABLE}.data_source_wid ;;
  }

  dimension: discount_amount {
    type: number
    sql: ${TABLE}.discount_amount ;;
  }

  dimension: event_pass_wid {
    hidden:  yes
    type: number
    value_format_name: id
    sql: ${TABLE}.event_pass_wid ;;
  }

  dimension: event_reg_wid {
    hidden:  yes
    type: number
    value_format_name: id
    sql: ${TABLE}.event_reg_wid ;;
  }

  dimension: person_wid {
    hidden:  yes
    type: number
    value_format_name: id
    sql: ${TABLE}.person_wid ;;
  }

  dimension: product_wid {
    hidden:  yes
    type: number
    value_format_name: id
    sql: ${TABLE}.product_wid ;;
  }

  dimension: registration_date_wid {
    hidden:  yes
    type: number
    value_format_name: id
    sql: ${TABLE}.registration_date_wid ;;
  }

  dimension: row_wid {
    hidden:  yes
    primary_key: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.row_wid ;;
  }

  dimension: total_before_discount {
    type: number
    sql: ${TABLE}.total_before_discount ;;
  }

  measure: count {
    type: count
  }
}
