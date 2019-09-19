view: event_reg_discount_fact {
  sql_table_name: cidw.event_reg_discount_fact ;;

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: data_source_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.data_source_wid ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: discount_code {
    type: string
    sql: ${TABLE}.discount_code ;;
  }

  dimension: discount_date_wid {
    hidden:  yes
    type: number
    value_format_name: id
    sql: ${TABLE}.discount_date_wid ;;
  }

  dimension: event_reg_wid {
    hidden:  yes
    type: number
    value_format_name: id
    sql: ${TABLE}.event_reg_wid ;;
  }

  dimension: person_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.person_wid ;;
  }

  dimension: product_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.product_wid ;;
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
