view: dim_email_group {
  sql_table_name: cidw.dim_email_group ;;

  dimension: active_flag {
    type: yesno
    sql:  CASE WHEN ${TABLE}.active_flag = 'A' THEN true ELSE false END;;
  }

  dimension: brand_wid {
    hidden:  yes
    type: number
    value_format_name: id
    sql: ${TABLE}.brand_wid ;;
  }

  dimension: data_source_wid {
    hidden:  yes
    type: number
    value_format_name: id
    sql: ${TABLE}.data_source_wid ;;
  }

  dimension: eloqua_email_group {
    hidden: yes
    type: string
    sql: ${TABLE}.eloqua_email_group ;;
  }

  dimension: promotion_type_wid {
    hidden:  yes
    type: number
    value_format_name: id
    sql: ${TABLE}.promotion_type_wid ;;
  }

  dimension: row_wid {
    hidden:  yes
    type: number
    value_format_name: id
    sql: ${TABLE}.row_wid ;;
  }

  dimension: email_group {
    type: string
    sql: ${TABLE}.standard_email_group ;;
  }

}
