view: dim_email {
  sql_table_name: cidw.dim_email ;;

  dimension: data_source_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.data_source_wid ;;
  }

  dimension: email_group_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.email_group_wid ;;
  }

  dimension: email_name {
    type: string
    sql: ${TABLE}.email_name ;;
  }

  dimension: row_wid {
    hidden: yes
    type: number
    primary_key: yes
    value_format_name: id
    sql: ${TABLE}.row_wid ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  measure: count {
    type: count_distinct
    sql: ${row_wid} ;;
    label: "Email Count"
    drill_fields: [email_name]
  }
}
