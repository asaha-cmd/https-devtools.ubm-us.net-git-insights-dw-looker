view: product_interests_demo_bridge {
  sql_table_name: cidw.product_interests_demo_bridge ;;

  dimension: product_interests_demo_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.product_interests_demo_wid ;;
  }

  dimension: product_interests_value_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.product_interests_value_wid ;;
  }

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${TABLE}.product_interests_demo_wid, ${TABLE}.product_interests_value_wid) ;;
  }

}
