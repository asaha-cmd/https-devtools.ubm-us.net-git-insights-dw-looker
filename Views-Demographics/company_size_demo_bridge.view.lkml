view: company_size_demo_bridge {
  sql_table_name: cidw.company_size_demo_bridge ;;

  dimension: company_size_demo_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.company_size_demo_wid ;;
  }

  dimension: company_size_value_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.company_size_value_wid ;;
  }

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${TABLE}.company_size_demo_wid, ${TABLE}.company_size_value_wid) ;;
  }

}
