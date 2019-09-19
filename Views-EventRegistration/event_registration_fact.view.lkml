view: event_registration_fact {
  sql_table_name: cidw.event_registration_fact ;;

  dimension: cancellation_date_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.cancellation_date_wid ;;
  }

  dimension: checkedin_date_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.checkedin_date_wid ;;
  }

  dimension: confirmation_number {
    type: string
    sql: ${TABLE}.confirmation_number ;;
  }

  dimension: data_source_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.data_source_wid ;;
  }

  dimension: event_reg_id {
    hidden:  yes
    type: string
    sql: ${TABLE}.event_reg_id ;;
  }

  dimension: event_registration_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.event_registration_wid ;;
  }

  dimension: last_updated_date_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.last_updated_date_wid ;;
  }

  dimension: marketing_code_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.marketing_code_wid ;;
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

  dimension: promo_code_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.promo_code_wid ;;
  }

  dimension: registration_date_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.registration_date_wid ;;
  }

  dimension: registration_flag {
    type: string
    sql: ${TABLE}.registration_flag ;;
  }

  dimension: row_wid {
    hidden:  yes
    primary_key: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.row_wid ;;
  }

  dimension: total_collected {
    type: number
    sql: ${TABLE}.total_collected ;;
  }

  measure: count {
    type: count
  }
}
