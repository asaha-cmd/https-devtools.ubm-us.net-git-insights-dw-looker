include: "/Views-Core/*.view.lkml"
include: "/Views-Demographics/*.view.lkml"

explore: demographic_company_revenue {
  group_label: "Demographics"
  label: "Company Revenue"
  from: company_revenue_demo_bridge
  description: "Audience Group Based Industry Demographics"
  join: company_revenue_demo_fact {
    type:left_outer
    fields: []
    sql_on: ${demographic_company_revenue.company_revenue_demo_wid} = ${company_revenue_demo_fact.row_wid};;
    relationship:one_to_many
  }

  join: company_revenue_value_dim {
    view_label: "Company Revenue"
    type: left_outer
    sql_on:  ${demographic_company_revenue.company_revenue_value_wid} = ${company_revenue_value_dim.row_wid} ;;
    relationship: one_to_many
  }

  join: person {
    type: left_outer
    fields: [demographic_fields*]
    sql_on: ${company_revenue_demo_fact.person_wid} = ${person.person_wid} ;;
    relationship: many_to_one
  }

  join: activity {
    view_label: "Company Revenue"
    from: day_dim
    type: left_outer
    sql_on:  ${company_revenue_demo_fact.modified_date_wid} = ${activity.row_wid} ;;
    relationship: one_to_one
  }
  join: audience_group {
    view_label: "Company Revenue"
    type: left_outer
    sql_on: ${company_revenue_demo_fact.audience_group_wid} = ${audience_group.row_wid} ;;
    relationship: many_to_one
  }
}
