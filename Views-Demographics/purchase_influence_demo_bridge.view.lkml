view: purchase_influence_demo_bridge {
  sql_table_name: cidw.purchase_influence_demo_bridge ;;

  dimension: purchase_influence_demo_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.purchase_influence_demo_wid ;;
  }

  dimension: purchase_influence_value_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.purchase_influence_value_wid ;;
  }

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${TABLE}.purchase_influence_demo_wid, ${TABLE}.purchase_influence_value_wid) ;;
  }

}
