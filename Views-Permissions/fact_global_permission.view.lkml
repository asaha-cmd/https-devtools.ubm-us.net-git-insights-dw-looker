view: fact_permission_global {
  sql_table_name: cidw.fact_permission_global ;;

  dimension: brand_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.brand_wid ;;
  }

  dimension: country_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.country_wid ;;
  }

  dimension: permission_date_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.permission_date_wid ;;
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

  dimension: warehouse_date_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.warehouse_date_wid ;;
  }

  dimension: warehouse_update_date_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.warehouse_update_date_wid ;;
  }

  dimension: permission {
    description: "Type of permission. Default for globals is to filter on Global"
    type: string
    sql: ${TABLE}.permission ;;
  }

  dimension: status {
    description: "Is the permission Opt-in or Opt-out"
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: opt_out {
    description: "More obvious version of Status. Is this better?"
    type: yesno
    sql:  CASE WHEN ${TABLE}.status = 'Opt-Out' THEN true WHEN ${TABLE}.status = 'O' THEN true ELSE false END;;
  }
  dimension: third_party_flag {
    description: "Is the user opted out of third party emails"
    type: yesno
    sql:  CASE WHEN ${TABLE}.third_party_flag = 'Y' THEN true ELSE false END;;
    }

  measure: global_count {
    type: count
    description: "Global Count"
  }
}