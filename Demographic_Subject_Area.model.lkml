connection: "production_redshift_-_informatica_user"

include: "Views-Core/*.view.lkml"
include: "Views-Demo_Facts/*.view.lkml"
include: "historic_demographics.explore.lkml"
label: "Demographics"

access_grant: can_access_email_address {
  user_attribute: can_access_email_address
  allowed_values: [ "true" ]
}

explore: industry_demographics {
  from: industry_demo_bridge
  description: "Audience Group Based Industry Demographics"
  join: industry_demo_fact {
    type:left_outer
    fields: []
    sql_on: ${industry_demographics.industry_demo_wid} = ${industry_demo_fact.row_wid};;
    relationship:one_to_many
  }

  join: industry_value_dim {
    type: left_outer
    fields: [industry_value_dim.standard_name, industry_value_dim.original_name]
    sql_on:  ${industry_demographics.industry_value_wid} = ${industry_value_dim.row_wid} ;;
    relationship: one_to_many
  }

  join: person {
    type: left_outer
    fields: [person.number_of_people]
    sql_on: ${industry_demo_fact.person_wid} = ${person.person_wid} ;;
    relationship: many_to_one
  }

  join: industry_day_dim {
    from: day_dim
    type: left_outer
    sql_on:  ${industry_demo_fact.modified_date_wid} = ${industry_day_dim.row_wid} ;;
    relationship: one_to_one
  }
  join: audience_group {
    type: left_outer
    sql_on: ${industry_demo_fact.audience_group_wid} = ${audience_group.row_wid} ;;
    relationship: many_to_one
  }
}

explore:: company_size_demographics {
  from: company_size_demo_bridge
  description: "Audience Group Based Company Size Demographics"
  join: company_size_demo_fact {
    type:left_outer
    fields: []
    sql_on: ${company_size_demographics.company_size_demo_wid} = ${company_size_demo_fact.row_wid};;
    relationship:one_to_many
  }

  join: company_size_value_dim {
    type: left_outer
    fields: [company_size_value_dim.standard_name, company_size_value_dim.original_name]
    sql_on:  ${company_size_demographics.company_size_value_wid} = ${company_size_value_dim.row_wid} ;;
    relationship: one_to_many
  }

  join: person {
    type: left_outer
    fields: [person.number_of_people]
    sql_on: ${company_size_demo_fact.person_wid} = ${person.person_wid} ;;
    relationship: many_to_one
  }

  join: company_size_day_dim {
    from: day_dim
    type: left_outer
    sql_on:  ${company_size_demo_fact.modified_date_wid} = ${company_size_day_dim.row_wid} ;;
    relationship: one_to_one
  }

  join: audience_group {
    type: left_outer
    sql_on: ${company_size_demo_fact.audience_group_wid} = ${audience_group.row_wid} ;;
    relationship: many_to_one
  }
}

explore: historic_demographics {
  from: fact_demographics_history
  description: "Full Historic Demographics"
  join: bridge_demographics_history {
    type: left_outer
    #fields: []
    sql_on: ${bridge_demographics_history.demographic_wid} = ${historic_demographics.row_wid} ;;
    relationship: one_to_many
  }
  join: annual_budget {
    from: annual_budget_value_dim
    type: left_outer
    sql_on: ${bridge_demographics_history.demographic_value_wid} = ${annual_budget.row_wid} and ${bridge_demographics_history.demographic} = 'ANNUAL_BUDGET'  ;;
    relationship: many_to_one
  }
  join: company_revenue {
    from: company_revenue_value_dim
    type: left_outer
    sql_on: ${bridge_demographics_history.demographic_value_wid} = ${company_revenue.row_wid} and ${bridge_demographics_history.demographic} = 'COMPANY_REVENUE'  ;;
    relationship: many_to_one
  }
  join: job_function {
    from: job_function_value_dim
    type: left_outer
    sql_on: ${bridge_demographics_history.demographic_value_wid} = ${job_function.row_wid} and ${bridge_demographics_history.demographic} = 'JOB_FUNCTION'  ;;
    relationship: many_to_one
  }
  join: job_level {
    from: job_level_value_dim
    type: left_outer
    sql_on: ${bridge_demographics_history.demographic_value_wid} = ${job_level.row_wid} and ${bridge_demographics_history.demographic} = 'JOB_LEVEL'  ;;
    relationship: many_to_one
  }
  join: person {
    type: left_outer
    fields: [person.number_of_people, person.person_wid]
    sql_on: ${historic_demographics.person_wid} = ${person.person_wid} ;;
    relationship: many_to_one
  }
  join: audience_group {
    type: left_outer
    sql_on: ${historic_demographics.audience_group_wid} = ${audience_group.row_wid} ;;
    relationship: many_to_one
  }
}
