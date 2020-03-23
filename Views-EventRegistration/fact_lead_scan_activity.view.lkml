view: fact_lead_scan_activity {
  sql_table_name: cidw.fact_lead_scan_activity ;;

  dimension: row_wid {
    primary_key: yes
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.row_wid ;;
  }

  dimension: data_source_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.data_source_wid ;;
  }

  dimension: exhibitor_name {
    type: string
    view_label: "Lead Scan"
    sql: ${TABLE}.exhibitor_name ;;
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

  dimension: scan_date_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.scan_date_wid ;;
  }

  dimension: source_scan_id {
    hidden: yes
    type: string
    sql: ${TABLE}.source_scan_id ;;
  }

  dimension: warehouse_date_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.warehouse_date_wid ;;
  }

  dimension: warehouse_update_date_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.warehouse_update_date_wid ;;
  }
}
