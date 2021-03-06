view: Online_Activity {
  sql_table_name: cidw.online_activity_fact ;;

  dimension: activity_date_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.activity_date_wid ;;
    hidden: yes
  }

  dimension: asset_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.asset_wid ;;
    hidden:  yes
  }

  dimension: code_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.code_wid ;;
    hidden:  yes
  }

  dimension: data_source_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.data_source_wid ;;
    hidden:  yes
  }

  dimension: etl_process_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.etl_process_wid ;;
    hidden:  yes
  }

  dimension: itc_code_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.itc_code_wid ;;
    required_access_grants: [developer_access]
    }

  dimension: marketing_code_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.marketing_code_wid ;;
    hidden:  yes
  }

  dimension: online_activity_src_sys_id {
    type: string
    sql: ${TABLE}.online_activity_src_sys_id ;;
    hidden:  yes
  }

  dimension: online_activity_type {
    type: string
    sql: ${TABLE}.online_activity_type ;;
  }

  dimension: person_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.person_wid ;;
    hidden:  yes
  }

  dimension: product_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.product_wid ;;
    hidden: yes
  }

  dimension: row_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.row_wid ;;
    hidden: yes
  }

  dimension: site_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.site_wid ;;
    hidden:  yes
  }

  dimension: warehouse_date_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.warehouse_date_wid ;;
    hidden: yes
  }

  dimension: warehouse_update_date_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.warehouse_update_date_wid ;;
    hidden: yes
  }

  dimension: is_net_new {
    view_label: "Person"
    label: "Net New"
    description: "Activity resulted in new user"
    type:  yesno
    sql: CASE WHEN ${TABLE}.row_wid = ${person.initial_fact_wid} and ${person.initial_table_source} = 'online_activity_fact' THEN true ELSE false END;;
  }

  dimension: possibly_net_new {
    view_label: "Person"
    label: "Net New [Possibly]"
    description: "User created on same day as activity"
    type:  yesno
    sql: CASE WHEN ${TABLE}.activity_date_wid = ${person.created_date_wid} THEN true ELSE false END;;
  }

  measure: activity_count {
    alias: [count]
    type: count
    drill_fields: [asset_dim.title, asset_dim.type,site_dim.name]
  }
}
