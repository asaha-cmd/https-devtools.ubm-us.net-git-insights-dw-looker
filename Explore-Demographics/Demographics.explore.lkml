
include: "/Views-Core/*.view.lkml"
include: "/Views-Demographics/*.view.lkml"

explore: demographic_industry {
  group_label: "Demographics"
  label: "Industry"
  from: industry_demo_bridge
  description: "Audience Group Based Industry Demographics"
  join: industry_demo_fact {
    view_label: "Industry"
    type:left_outer
    fields: []
    sql_on: ${demographic_industry.industry_demo_wid} = ${industry_demo_fact.row_wid};;
    relationship:one_to_many
  }

  join: industry_value_dim {
    view_label: "Industry"
    type: left_outer
    sql_on:  ${demographic_industry.industry_value_wid} = ${industry_value_dim.row_wid} ;;
    relationship: one_to_many
  }

  join: person {
    type: left_outer
    fields: [demographic_fields*]
    sql_on: ${industry_demo_fact.person_wid} = ${person.person_wid} ;;
    relationship: many_to_one
  }
  join: person_permissions {
    view_label: "Person Permissions"
    from:  person_permissions
    type:  inner
    relationship: many_to_many
    sql_on: ${person.person_wid} = ${person_permissions.person_wid} ;;
  }

  join: permission {
    view_label: "Person Permissions"
    from: day_dim
    relationship: many_to_one
    type: inner
    sql_on: ${person_permissions.permission_date_wid} = ${permission.row_wid} ;;
  }

  join: activity {
    view_label: "Industry"
    from: day_dim
    type: left_outer
    sql_on:  ${industry_demo_fact.modified_date_wid} = ${activity.row_wid} ;;
    relationship: one_to_one
  }
  join: audience_group {
    view_label: "Industry"
    type: left_outer
    sql_on: ${industry_demo_fact.audience_group_wid} = ${audience_group.row_wid} ;;
    relationship: many_to_one
  }
}

explore:: demographic_company_size {
  group_label: "Demographics"
  label: "Company Size"
  from: company_size_demo_bridge
  description: "Audience Group Based Company Size Demographics"
  join: company_size_demo_fact {
    type:left_outer
    fields: []
    sql_on: ${demographic_company_size.company_size_demo_wid} = ${company_size_demo_fact.row_wid};;
    relationship:one_to_many
  }

  join: company_size_value_dim {
    view_label: "Company Size"
    type: left_outer
    sql_on:  ${demographic_company_size.company_size_value_wid} = ${company_size_value_dim.row_wid} ;;
    relationship: one_to_many
  }

  join: person {
    type: left_outer
    fields: [demographic_fields*]
    sql_on: ${company_size_demo_fact.person_wid} = ${person.person_wid} ;;
    relationship: many_to_one
  }

  join: activity {
    view_label: "Company Size"
    from: day_dim
    type: left_outer
    sql_on:  ${company_size_demo_fact.modified_date_wid} = ${activity.row_wid} ;;
    relationship: one_to_one
  }

  join: audience_group {
    view_label: "Company Size"
    type: left_outer
    sql_on: ${company_size_demo_fact.audience_group_wid} = ${audience_group.row_wid} ;;
    relationship: many_to_one
  }
}
