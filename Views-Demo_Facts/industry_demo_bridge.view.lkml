view: industry_demo_bridge {
  sql_table_name: cidw.industry_demo_bridge ;;

  dimension: industry_demo_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.industry_demo_wid ;;
  }

  dimension: industry_value_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.industry_value_wid ;;
  }

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${TABLE}.industry_demo_wid, ${TABLE}.industry_value_wid) ;;
  }
}
