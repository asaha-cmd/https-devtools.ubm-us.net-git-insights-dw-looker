include: "/Views-Core/*.view.lkml"
include: "/Views-Demographics/*.view.lkml"

explore: demographic_purchase_influence {
  from: purchase_influence_demo_bridge
  description: "Audience Group Based Industry Demographics"
  join: purchase_influence_demo_fact {
    type:left_outer
    fields: []
    sql_on: ${demographic_purchase_influence.purchase_influence_demo_wid} = ${purchase_influence_demo_fact.row_wid};;
    relationship:one_to_many
  }

  join: purchase_influence_value_dim {
    type: left_outer
    fields: [purchase_influence_value_dim.standard_name, purchase_influence_value_dim.original_name]
    sql_on:  ${demographic_purchase_influence.purchase_influence_value_wid} = ${purchase_influence_value_dim.row_wid} ;;
    relationship: one_to_many
  }

  join: person {
    type: left_outer
    fields: [person.number_of_people]
    sql_on: ${purchase_influence_demo_fact.person_wid} = ${person.person_wid} ;;
    relationship: many_to_one
  }

  join: purchase_influence_day_dim {
    from: day_dim
    type: left_outer
    sql_on:  ${purchase_influence_demo_fact.modified_date_wid} = ${purchase_influence_day_dim.row_wid} ;;
    relationship: one_to_one
  }
  join: audience_group {
    type: left_outer
    sql_on: ${purchase_influence_demo_fact.audience_group_wid} = ${audience_group.row_wid} ;;
    relationship: many_to_one
  }
}