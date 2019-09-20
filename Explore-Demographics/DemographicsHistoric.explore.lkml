include: "/Views-Core/*.view.lkml"
include: "/Views-Demographics/*.view.lkml"

explore: demographics_historic {
  description: "Full Historic Demographics"

  join: annual_budget {
    from: annual_budget_value_dim
    type: left_outer
    sql_on: ${demographics_historic.annual_budget_wid} = ${annual_budget.row_wid}  ;;
    relationship: many_to_many
  }
  join: company_revenue {
    from: company_revenue_value_dim
    type: left_outer
    sql_on: ${demographics_historic.company_revenue_wid} = ${company_revenue.row_wid}  ;;
    relationship: many_to_many
  }

  join: job_function {
    from: job_function_value_dim
    type: left_outer
    sql_on: ${demographics_historic.job_function_wid} = ${job_function.row_wid}  ;;
    relationship: many_to_many
  }

  join: job_level {
    from: job_level_value_dim
    type: left_outer
    sql_on: ${demographics_historic.job_level_wid} = ${job_level.row_wid}  ;;
    relationship: many_to_many
  }

  join: person {
    type: left_outer
    fields: [person.number_of_people]
    sql_on: ${demographics_historic.person_wid} = ${person.person_wid} ;;
    relationship: many_to_one
  }
  join: audience_group {
    type: left_outer
    sql_on: ${demographics_historic.audience_group_wid} = ${audience_group.row_wid} ;;
    relationship: many_to_one
  }
}
