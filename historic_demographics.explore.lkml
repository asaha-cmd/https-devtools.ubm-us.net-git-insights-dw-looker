include: "Views-Core/*.view.lkml"
include: "Views-Demo_Facts/*.view.lkml"

label: "Historic Demographics"

explore: historic_demographics_v2 {
  from: historic_demographic_bridge
  description: "Full Historic Demographics"
  join: fact_demographics_history {
    type: left_outer
    #fields: []
    sql_on: ${historic_demographics_v2.demographic_wid} = ${fact_demographics_history.row_wid} ;;
    relationship: one_to_many
  }
  join: annual_budget {
    from: annual_budget_value_dim
    type: left_outer
    sql_on: ${historic_demographics_v2.annual_budget_wid} = ${annual_budget.row_wid}  ;;
    relationship: many_to_many
  }
  join: company_revenue {
    from: company_revenue_value_dim
    type: left_outer
    sql_on: ${historic_demographics_v2.company_revenue_wid} = ${company_revenue.row_wid}  ;;
    relationship: many_to_many
  }

  join: job_function {
    from: job_function_value_dim
    type: left_outer
    sql_on: ${historic_demographics_v2.job_function_wid} = ${job_function.row_wid}  ;;
    relationship: many_to_many
  }

  join: job_level {
    from: job_level_value_dim
    type: left_outer
    sql_on: ${historic_demographics_v2.job_level_wid} = ${job_level.row_wid}  ;;
    relationship: many_to_many
  }

  join: person {
    type: left_outer
    fields: [person.number_of_people]
    sql_on: ${fact_demographics_history.person_wid} = ${person.person_wid} ;;
    relationship: many_to_one
  }
  join: audience_group {
    type: left_outer
    sql_on: ${fact_demographics_history.audience_group_wid} = ${audience_group.row_wid} ;;
    relationship: many_to_one
  }
}


explore: historic_demographic {
  from: historic_demographic
  description: "Full Historic Demographics"

  join: annual_budget {
    from: annual_budget_value_dim
    type: left_outer
    sql_on: ${historic_demographic.annual_budget_wid} = ${annual_budget.row_wid}  ;;
    relationship: many_to_many
  }
  join: company_revenue {
    from: company_revenue_value_dim
    type: left_outer
    sql_on: ${historic_demographic.company_revenue_wid} = ${company_revenue.row_wid}  ;;
    relationship: many_to_many
  }

  join: job_function {
    from: job_function_value_dim
    type: left_outer
    sql_on: ${historic_demographic.job_function_wid} = ${job_function.row_wid}  ;;
    relationship: many_to_many
  }

  join: job_level {
    from: job_level_value_dim
    type: left_outer
    sql_on: ${historic_demographic.job_level_wid} = ${job_level.row_wid}  ;;
    relationship: many_to_many
  }

  join: person {
    type: left_outer
    fields: [person.number_of_people]
    sql_on: ${historic_demographic.person_wid} = ${person.person_wid} ;;
    relationship: many_to_one
  }
  join: audience_group {
    type: left_outer
    sql_on: ${historic_demographic.audience_group_wid} = ${audience_group.row_wid} ;;
    relationship: many_to_one
  }
}
