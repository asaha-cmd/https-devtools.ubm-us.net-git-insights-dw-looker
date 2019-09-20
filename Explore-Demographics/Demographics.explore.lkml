
include: "/Views-Core/*.view.lkml"
include: "/Views-Demographics/*.view.lkml"

explore: demographic_industry {
  from: industry_demo_bridge
  description: "Audience Group Based Industry Demographics"
  join: industry_demo_fact {
    type:left_outer
    fields: []
    sql_on: ${demographic_industry.industry_demo_wid} = ${industry_demo_fact.row_wid};;
    relationship:one_to_many
  }

  join: industry_value_dim {
    type: left_outer
    fields: [industry_value_dim.standard_name, industry_value_dim.original_name]
    sql_on:  ${demographic_industry.industry_value_wid} = ${industry_value_dim.row_wid} ;;
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

explore:: demographic_company_size {
  from: company_size_demo_bridge
  description: "Audience Group Based Company Size Demographics"
  join: company_size_demo_fact {
    type:left_outer
    fields: []
    sql_on: ${demographic_company_size.company_size_demo_wid} = ${company_size_demo_fact.row_wid};;
    relationship:one_to_many
  }

  join: company_size_value_dim {
    type: left_outer
    fields: [company_size_value_dim.standard_name, company_size_value_dim.original_name]
    sql_on:  ${demographic_company_size.company_size_value_wid} = ${company_size_value_dim.row_wid} ;;
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