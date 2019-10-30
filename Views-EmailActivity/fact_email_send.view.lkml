view: fact_email_send {
  sql_table_name: cidw.fact_email_send ;;

  dimension: activity_date_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.activity_date_wid ;;
  }

  dimension: activity_type {
    hidden: yes
    type: string
    sql: ${TABLE}.activity_type ;;
  }

  dimension: campaign_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.campaign_wid ;;
  }

  dimension: data_source_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.data_source_wid ;;
  }

  dimension: email_address {
    hidden: yes
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: email_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.email_wid ;;
  }

  dimension: person_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.person_wid ;;
  }

  dimension: row_wid {
    hidden: yes
    type: number
    primary_key: yes
    value_format_name: id
    sql: ${TABLE}.row_wid ;;
  }

  measure: send_count {
    label: "Total Mails Sent"
    type: count
    description: "Count of All Mails sent"
  }

  measure: user_count {
    label: "Total Users Sent Mail"
    type: count_distinct
    description: "Distinct Count of Users Sent Email"
    sql: ${TABLE}.email_address;;
  }
}
