view: purchase_role_demo_bridge {
  sql_table_name: cidw.purchase_role_demo_bridge ;;

  dimension: purchase_role_demo_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.purchase_role_demo_wid ;;
  }

  dimension: purchase_role_value_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.purchase_role_value_wid ;;
  }

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${TABLE}.purchase_role_demo_wid, ${TABLE}.purchase_role_value_wid) ;;
  }

}
