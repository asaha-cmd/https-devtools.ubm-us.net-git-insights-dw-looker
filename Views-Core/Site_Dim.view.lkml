view: site_dim {
  sql_table_name: cidw.site_dim ;;

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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: primary_domain {
    type: string
    sql: ${TABLE}.primary_domain ;;
  }

  dimension: product_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.product_wid ;;
    hidden: yes

  }

  dimension: row_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.row_wid ;;
    hidden: yes
  }

  dimension: site_src_sys_id {
    type: string
    sql: ${TABLE}.site_src_sys_id ;;
    hidden: yes
  }

  dimension: warehouse_date_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.warehouse_date_wid ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
