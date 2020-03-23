view: event_reg_pass_fact {
  sql_table_name: cidw.event_reg_pass_fact ;;

  dimension: calculated_amount {
    value_format_name: usd
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
    value_format_name: usd
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

  measure: sum_before_discount_amount{
    type: sum_distinct
    sql_distinct_key: ${row_wid} ;;
    sql: ${total_before_discount} ;;
    value_format_name: usd
    }

  measure: sum_calculated_amount{
    type: sum_distinct
    sql_distinct_key: ${row_wid} ;;
    sql: ${calculated_amount} ;;
    value_format_name: usd
    }

  measure: sum_discount_amount{
    type: sum_distinct
    sql_distinct_key: ${row_wid} ;;
    sql: ${discount_amount} ;;
    value_format_name: usd
    }


  measure: count {
    type: count
  }
}
