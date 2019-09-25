view: promotion_type_dim {
  sql_table_name: cidw.promotion_type_dim ;;

  dimension: row_wid {
    type: number
    value_format_name: id
    primary_key:yes
    hidden:yes
    sql: ${TABLE}.row_wid ;;
  }
  dimension: data_source_wid {
    type: number
    value_format_name: id
    hidden:yes
    sql: ${TABLE}.data_source_wid ;;
  }

  dimension: description {
    label: "Promotion Description"
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: displaytext {
    label: "Promotion Type"
    type: string
    sql: ${TABLE}.displaytext ;;
  }

  dimension: etl_process_wid {
    type: number
    value_format_name: id
    hidden:yes
    sql: ${TABLE}.etl_process_wid ;;
  }

  dimension: promo_type_src_sys_id {
    type: number
    hidden:yes
    sql: ${TABLE}.promo_type_src_sys_id ;;
  }

}
