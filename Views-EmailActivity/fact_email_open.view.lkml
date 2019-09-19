view: fact_email_open {
  sql_table_name: cidw.fact_email_open ;;

  dimension: activity_date_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.activity_date_wid ;;
  }

  dimension: activity_type {
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

  dimension: ipaddress {
    type: string
    sql: ${TABLE}.ipaddress ;;
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

  measure: open_count {
    type: count
    description: "Open Email Count"
  }
}
