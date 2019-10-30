view: person_permissions {
  derived_table: {
    sql: select person_wid, status, brand_wid, 'Global' as permission, permission_date_wid from cidw.fact_global_permission where permission = 'Global'
    UNION
    select p.person_wid, status, brand_wid, 'CASL' as permission, permission_date_wid from cidw.fact_global_permission f, cidw.person_dim p where f.person_wid = p.row_wid and f.country_wid = p.country_wid and permission = 'CASL'
    UNION
    select person_wid, case when status = 'O' then 'Opt-Out' else 'Opt-In' end as status, brand_wid, standard_email_group as permission, permission_date_wid from cidw.fact_email_group_permission f, cidw.dim_email_group d where f.email_group_wid = d.row_wid
    ;;
    datagroup_trigger: basic_cache
    distribution_style: all
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
