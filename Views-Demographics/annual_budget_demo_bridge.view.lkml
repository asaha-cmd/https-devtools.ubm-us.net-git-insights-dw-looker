view: annual_budget_demo_bridge {
  sql_table_name: cidw.annual_budget_demo_bridge ;;

  dimension: annual_budget_demo_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.annual_budget_demo_wid ;;
  }

  dimension: annual_budget_value_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.annual_budget_value_wid ;;
  }

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${TABLE}.annual_budget_demo_wid, ${TABLE}.annual_budget_value_wid) ;;
  }

}
