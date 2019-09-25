include: "/Views-Core/*.view.lkml"
include: "/Views-Demographics/*.view.lkml"

explore: demographics_historic {
  group_label: "Demographics"
  label: " Historic"
  description: "Full Historic Demographics"

  join: annual_budget {
    view_label: "Demographic"
    from: annual_budget_value_dim
    type: left_outer
    sql_on: ${demographics_historic.annual_budget_wid} = ${annual_budget.row_wid}  ;;
    relationship: many_to_many
  }
  join: company_revenue {
    view_label: "Demographic"
    from: company_revenue_value_dim
    type: left_outer
    sql_on: ${demographics_historic.company_revenue_wid} = ${company_revenue.row_wid}  ;;
    relationship: many_to_many
  }

  join: company_size {
    view_label: "Demographic"
    from: company_size_value_dim
    type: left_outer
    sql_on: ${demographics_historic.company_size_wid} = ${company_size.row_wid}  ;;
    relationship: many_to_many
  }

  join: industry {
    view_label: "Demographic"
    from: industry_value_dim
    type: left_outer
    sql_on: ${demographics_historic.industry_wid} = ${industry.row_wid}  ;;
    relationship: many_to_many
  }

  join: job_function {
    view_label: "Demographic"
    from: job_function_value_dim
    type: left_outer
    sql_on: ${demographics_historic.job_function_wid} = ${job_function.row_wid}  ;;
    relationship: many_to_many
  }

  join: job_level {
    view_label: "Demographic"
    from: job_level_value_dim
    type: left_outer
    sql_on: ${demographics_historic.job_level_wid} = ${job_level.row_wid}  ;;
    relationship: many_to_many
  }

  join: product_interests {
    view_label: "Demographic"
    from: product_interests_value_dim
    type: left_outer
    sql_on: ${demographics_historic.product_interest_wid} = ${product_interests.row_wid}  ;;
    relationship: many_to_many
  }

  join: purchase_influence {
    view_label: "Demographic"
    from: purchase_influence_value_dim
    type: left_outer
    sql_on: ${demographics_historic.purchase_influence_wid} = ${purchase_influence.row_wid}  ;;
    relationship: many_to_many
  }

  join: purchase_role {
    view_label: "Demographic"
    from: purchase_role_value_dim
    type: left_outer
    sql_on: ${demographics_historic.purchase_role_wid} = ${purchase_role.row_wid}  ;;
    relationship: many_to_many
  }

  join: historic {
    view_label: "Historic Demographics"
    from: day_dim
    type: left_outer
    sql_on:  ${demographics_historic.created_date_wid} = ${historic.row_wid} ;;
    relationship: one_to_one
  }
  join: person {
    type: left_outer
    fields: [demographic_fields*]
    sql_on: ${demographics_historic.person_wid} = ${person.person_wid} ;;
    relationship: many_to_one
  }
  join: audience_group {
    view_label: "Historic Demographics"
    type: left_outer
    sql_on: ${demographics_historic.audience_group_wid} = ${audience_group.row_wid} ;;
    relationship: many_to_one
  }
}
