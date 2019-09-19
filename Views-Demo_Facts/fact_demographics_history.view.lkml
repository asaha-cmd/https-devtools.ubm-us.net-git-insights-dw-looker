view: fact_demographics_history {
  sql_table_name: cidw.fact_demographics_history ;;

  dimension: audience_group_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.audience_group_wid ;;
  }

  dimension: created_date_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.created_date_wid ;;
  }

  dimension: data_source_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.data_source_wid ;;
  }

  dimension: person_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.person_wid ;;
  }

  dimension: row_wid {
    type: number
    value_format_name: id
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.row_wid ;;
  }

  dimension: src_sys_reg_record_id {
    type: string
    hidden: yes
    sql: ${TABLE}.src_sys_reg_record_id ;;
  }

  dimension: warehouse_date_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.warehouse_date_wid ;;
  }

    measure: demographic_count {
      type: count_distinct
      description: "Count of Distinct People"
      sql_distinct_key: ${TABLE}.person_wid ;;
    }
}
