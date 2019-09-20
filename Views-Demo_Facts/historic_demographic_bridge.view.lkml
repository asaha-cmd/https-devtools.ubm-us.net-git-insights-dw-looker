view: historic_demographic_bridge {
  derived_table: {
    sql: select row_wid as demographic_wid
      , case when demographic = 'ANNUAL_BUDGET' then  demographic_value_wid else '0'END as annual_budget_wid
      , case when demographic = 'COMPANY_REVENUE' then  demographic_value_wid else '0'END as company_revenue_wid
      , case when demographic = 'COMPANY_SIZE' then  demographic_value_wid else '0'END as company_size_wid
      , case when demographic = 'INDUSTRY' then  demographic_value_wid else '0'END as industry_wid
      , case when demographic = 'JOB_FUNCTION' then  demographic_value_wid else '0'END as job_function_wid
      , case when demographic = 'JOB_LEVEL' then  demographic_value_wid else '0'END as job_level_wid
      , case when demographic = 'PRODUCT_INTERESTS' then  demographic_value_wid else '0'END as product_interest_wid
      , case when demographic = 'PURCHASE_INFLUENCE' then  demographic_value_wid else '0'END as purchase_influence_wid
      , case when demographic = 'PURCHASE_ROLE' then  demographic_value_wid else '0'END as purchase_role_wid
       from cidw.fact_demographics_history f
      left outer join cidw.bridge_demographics_history b on f.row_wid = b. demographic_wid
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: demographic_wid {
    type: number
    primary_key: yes
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
}
