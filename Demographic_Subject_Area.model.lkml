connection: "production_redshift_-_informatica_user"

include: "Views-Core/*.view.lkml"
include: "Views-Demo_Facts/*.view.lkml"

label: "Demographics"


explore: industry_demo_bridge {
  join: industry_demo_fact {
    type:left_outer
    fields: []
    sql_on: ${industry_demo_bridge.industry_demo_wid} = ${industry_demo_fact.row_wid};;
    relationship:one_to_many
  }

  join: industry_value_dim {
    type: left_outer
    fields: [industry_value_dim.standard_name, industry_value_dim.original_name]
    sql_on:  ${industry_demo_bridge.industry_value_wid} = ${industry_value_dim.row_wid} ;;
    relationship: one_to_many
  }

  join: person {
    type: left_outer
    fields: [person.count]
    sql_on: ${industry_demo_fact.person_wid} = ${person.person_ID} ;;
    relationship: many_to_one
  }

  join: industry_day_dim {
    from: day_dim
    type: left_outer
    sql_on:  ${industry_demo_fact.modified_date_wid} = ${industry_day_dim.row_wid} ;;
    relationship: one_to_one
  }
  #join: audience_group {
  #  from:  audience_group_dim
  #  type: left_outer
  #  sql_on: ${industry_measure.audience_group_wid} = ${audience_group.row_wid} ;;
  #  relationship: many_to_one
  #}
}

explore:: company_size_demo_bridge {
  join: company_size_demo_fact {
    type:left_outer
    fields: []
    sql_on: ${company_size_demo_bridge.company_size_demo_wid} = ${company_size_demo_fact.row_wid};;
    relationship:one_to_many
  }

  join: company_size_value_dim {
    type: left_outer
    fields: [company_size_value_dim.standard_name, company_size_value_dim.original_name]
    sql_on:  ${company_size_demo_bridge.company_size_value_wid} = ${company_size_value_dim.row_wid} ;;
    relationship: one_to_many
  }

  join: person {
    type: left_outer
    fields: [person.count]
    sql_on: ${company_size_demo_fact.person_wid} = ${person.person_ID} ;;
    relationship: many_to_one
  }

  join: company_size_day_dim {
    from: day_dim
    type: left_outer
    sql_on:  ${company_size_demo_fact.modified_date_wid} = ${company_size_day_dim.row_wid} ;;
    relationship: one_to_one
  }

  #join: audience_group {
  #  from:  audience_group_dim
  #  type: left_outer
  #  sql_on: ${company_size_measure.audience_group_wid} = ${audience_group.row_wid} ;;
  #  relationship: many_to_one
  #}
}
