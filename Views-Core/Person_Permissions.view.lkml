view: person_permissions {
  derived_table: {
    sql: select person_wid, status, brand_wid, 'Global' as permission, permission_date_wid from cidw.fact_global_permission where permission = 'Global'
    ;;
    datagroup_trigger: basic_cache
    distribution_style: all
    indexes: ["status", "person_wid"]
  }

  dimension: person_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.person_wid ;;
  }

  dimension: brand_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.brand_wid ;;
  }

  dimension: permission_date_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.permission_date_wid ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: permission {
    type: string
    sql: ${TABLE}.permission ;;
  }

  measure: permission_count {
    view_label: "Person Permissions"
    type: count_distinct
    description: "Count of Distinct People"
    hidden:yes
    sql: ${person_wid} ;;
  }
}
