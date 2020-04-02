view: demographics_historic {
  derived_table: {
    sql: select fact_demographics_history.*, annual_budget_wid, company_revenue_wid, company_size_wid, industry_wid, job_function_wid,
              job_level_wid, product_interest_wid, purchase_influence_wid, purchase_role_wid from cidw.fact_demographics_history
left join (select demographic_wid, demographic_value_wid as annual_budget_wid from cidw.bridge_demographics_history where demographic = 'ANNUAL_BUDGET') annual_budget on row_wid = annual_budget.demographic_wid
left join (select demographic_wid, demographic_value_wid as company_revenue_wid from cidw.bridge_demographics_history where demographic = 'COMPANY_REVENUE') company_revenue on row_wid = company_revenue.demographic_wid
left join (select demographic_wid, demographic_value_wid as company_size_wid from cidw.bridge_demographics_history where demographic = 'COMPANY_SIZE') company_size on row_wid = company_size.demographic_wid
left join (select demographic_wid, demographic_value_wid as industry_wid from cidw.bridge_demographics_history where demographic = 'INDUSTRY') industry on row_wid = industry.demographic_wid
left join (select demographic_wid, demographic_value_wid as job_function_wid from cidw.bridge_demographics_history where demographic = 'JOB_FUNCTION') job_function on row_wid = job_function.demographic_wid
left join (select demographic_wid, demographic_value_wid as job_level_wid from cidw.bridge_demographics_history where demographic = 'JOB_LEVEL') job_level on row_wid = job_level.demographic_wid
left join (select demographic_wid, demographic_value_wid as product_interest_wid from cidw.bridge_demographics_history where demographic = 'PRODUCT_INTERESTS') product_interest on row_wid = product_interest.demographic_wid
left join (select demographic_wid, demographic_value_wid as purchase_influence_wid from cidw.bridge_demographics_history where demographic = 'PURCHASE_INFLUENCE') purchase_influence on row_wid = purchase_influence.demographic_wid
left join (select demographic_wid, demographic_value_wid as purchase_role_wid from cidw.bridge_demographics_history where demographic = 'PURCHASE_ROLE') purchase_role on row_wid = purchase_role.demographic_wid
       ;;
    datagroup_trigger: basic_cache
    distribution_style: all
    indexes: ["product_wid", "person_wid" ]
  }

  dimension: product_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.product_wid ;;
  }

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

  dimension: demographic_wid {
    type: number
    hidden: yes
    sql: ${TABLE}.demographic_wid ;;
  }

  dimension: annual_budget_wid {
    type: number
    hidden: yes
    sql: ${TABLE}.annual_budget_wid ;;
  }

  dimension: company_revenue_wid {
    type: number
    hidden: yes
    sql: ${TABLE}.company_revenue_wid ;;
  }

  dimension: company_size_wid {
    type: number
    hidden: yes
    sql: ${TABLE}.company_size_wid ;;
  }

  dimension: industry_wid {
    type: number
    hidden: yes
    sql: ${TABLE}.industry_wid ;;
  }

  dimension: job_function_wid {
    type: number
    hidden: yes
    sql: ${TABLE}.job_function_wid ;;
  }

  dimension: job_level_wid {
    type: number
    hidden: yes
    sql: ${TABLE}.job_level_wid ;;
  }

  dimension: product_interest_wid {
    type: number
    hidden: yes
    sql: ${TABLE}.product_interest_wid ;;
  }

  dimension: purchase_influence_wid {
    type: number
    hidden: yes
    sql: ${TABLE}.purchase_influence_wid ;;
  }

  dimension: purchase_role_wid {
    type: number
    hidden: yes
    sql: ${TABLE}.purchase_role_wid ;;
  }

  set: detail {
    fields: [
      demographic_wid,
      annual_budget_wid,
      company_revenue_wid,
      company_size_wid,
      industry_wid,
      job_function_wid,
      job_level_wid,
      product_interest_wid,
      purchase_influence_wid,
      purchase_role_wid
    ]
  }

   measure: demographic_count {
    view_label: "Historic Demographics"
    type: count_distinct
    description: "Count of Distinct People"
    hidden:yes
    sql: ${person_wid} ;;
  }
}
