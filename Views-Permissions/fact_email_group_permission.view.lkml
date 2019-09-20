view: fact_permission_email_group {
  sql_table_name: cidw.fact_permission_email_group ;;

  dimension: row_wid {
    type: number
    value_format_name: id
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.row_wid ;;
  }

  dimension: email_group_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.email_group_wid ;;
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

  dimension: status {
    view_label: "Filters"
    description: "Is the permission Opt-in or Opt-out"
    type: string
    sql:  CASE WHEN ${TABLE}.status = 'O' THEN "Opt-Out" WHEN ${TABLE}.status = 'I' THEN "Opt-In" ELSE false END;;
    }

  dimension: opt_out {
    view_label: "Filters"
    description: "More obvious version of Status. Is this better?"
    type: yesno
    sql:  CASE WHEN ${TABLE}.status = 'O' THEN true WHEN ${TABLE}.status = 'I' THEN false ELSE false END;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}