include: "/Views-Core/*.view.lkml"
include: "/Views-Demographics/*.view.lkml"

explore: demographic_annual_budget {
  group_label: "Demographics"
  label: "Annual Budget"
  from: annual_budget_demo_bridge
  description: "Audience Group Based Industry Demographics"
  join: annual_budget_demo_fact {
    type:left_outer
    fields: []
    sql_on: ${demographic_annual_budget.annual_budget_demo_wid} = ${annual_budget_demo_fact.row_wid};;
    relationship:one_to_many
  }

  join: annual_budget_value_dim {
    view_label: "Annual Budget"
    type: left_outer
    sql_on:  ${demographic_annual_budget.annual_budget_value_wid} = ${annual_budget_value_dim.row_wid} ;;
    relationship: one_to_many
  }

  join: person {
    type: left_outer
    fields: [demographic_fields*]
    sql_on: ${annual_budget_demo_fact.person_wid} = ${person.person_wid} ;;
    relationship: many_to_one
  }

  join: activity {
    view_label: "Annual Budget"
    from: day_dim
    type: left_outer
    sql_on:  ${annual_budget_demo_fact.modified_date_wid} = ${activity.row_wid} ;;
    relationship: one_to_one
  }
  join: audience_group {
    view_label: "Annual Budget"
    type: left_outer
    sql_on: ${annual_budget_demo_fact.audience_group_wid} = ${audience_group.row_wid} ;;
    relationship: many_to_one
  }
}
