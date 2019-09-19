view: event_registration_dim {
  sql_table_name: cidw.event_registration_dim ;;

  dimension: classification1_desc {
    type: string
    sql: ${TABLE}.classification1_desc ;;
  }

  dimension: classification1_type {
    type: string
    sql: ${TABLE}.classification1_type ;;
  }

  dimension: data_source_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.data_source_wid ;;
  }

  dimension: payment_status {
    type: string
    sql: ${TABLE}.payment_status ;;
  }

  dimension: registration_status {
    type: string
    sql: ${TABLE}.registration_status ;;
  }

  dimension: registration_type {
    type: string
    sql: ${TABLE}.registration_type ;;
  }

  dimension: row_wid {
    hidden: yes
    primary_key: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.row_wid ;;
  }

  dimension: ticket_type {
    type: string
    sql: ${TABLE}.ticket_type ;;
  }

  measure: count {
    type: count
  }
}
