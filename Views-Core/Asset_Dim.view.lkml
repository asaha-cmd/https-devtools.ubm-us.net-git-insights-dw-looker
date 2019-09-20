view: asset_dim {
  sql_table_name: cidw.asset_dim ;;

  dimension: asset_src_sys_id {
    type: string
    sql: ${TABLE}.asset_src_sys_id ;;
    hidden: yes
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: data_source_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.data_source_wid ;;
    hidden: yes
  }

  dimension: etl_process_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.etl_process_wid ;;
    hidden: yes
  }

  dimension: row_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.row_wid ;;
    hidden: yes
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: warehouse_date_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.warehouse_date_wid ;;
    hidden:  yes
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
