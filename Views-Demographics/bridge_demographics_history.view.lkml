view: bridge_demographics_history {
  sql_table_name: cidw.bridge_demographics_history ;;

  dimension: demographic {
    type: string
    sql: ${TABLE}.demographic ;;
  }

  dimension: demographic_value_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.demographic_value_wid ;;
  }

  dimension: demographic_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.demographic_wid ;;
  }

    dimension: primary_key {
      primary_key: yes
      hidden: yes
      sql: CONCAT(${TABLE}.company_size_demo_wid, ${TABLE}.company_size_value_wid) ;;
    }
}
