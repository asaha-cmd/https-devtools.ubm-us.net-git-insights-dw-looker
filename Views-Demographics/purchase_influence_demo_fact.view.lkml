view: purchase_influence_demo_fact {
  sql_table_name: cidw.purchase_influence_demo_fact ;;

  dimension: audience_group_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.audience_group_wid ;;
  }

  dimension: created_date_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.created_date_wid ;;
  }

  dimension: data_source_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.data_source_wid ;;
  }

  dimension: modified_date_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.modified_date_wid ;;
  }

  dimension: person_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.person_wid ;;
  }

  dimension: row_wid {
    type: number
    value_format_name: id
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.row_wid ;;
  }

  dimension: warehouse_date_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.warehouse_date_wid ;;
  }

  dimension: warehouse_update_date_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.warehouse_update_date_wid ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
