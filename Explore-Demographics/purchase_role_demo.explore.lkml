include: "/Views-Core/*.view.lkml"
include: "/Views-Demographics/*.view.lkml"

explore: demographic_purchase_role {
  group_label: "Demographics"
  label: "Purchase Role"
  from: purchase_role_demo_bridge
  description: "Audience Group Based Industry Demographics"
  join: purchase_role_demo_fact {
    type:left_outer
    fields: []
    sql_on: ${demographic_purchase_role.purchase_role_demo_wid} = ${purchase_role_demo_fact.row_wid};;
    relationship:one_to_many
  }

  join: purchase_role_value_dim {
    view_label: "Purchase Role"
    type: left_outer
    #fields: [purchase_role_value_dim.standard_name, purchase_role_value_dim.original_name]
    sql_on:  ${demographic_purchase_role.purchase_role_value_wid} = ${purchase_role_value_dim.row_wid} ;;
    relationship: one_to_many
  }

  join: person {
    type: left_outer
    fields: [demographic_fields*]
    sql_on: ${purchase_role_demo_fact.person_wid} = ${person.person_wid} ;;
    relationship: many_to_one
  }

  join: activity {
    view_label: "Purchase Role"
    from: day_dim
    type: left_outer
    sql_on:  ${purchase_role_demo_fact.modified_date_wid} = ${activity.row_wid} ;;
    relationship: one_to_one
  }
  join: audience_group {
    view_label: "Purchase Role"
    type: left_outer
    sql_on: ${purchase_role_demo_fact.audience_group_wid} = ${audience_group.row_wid} ;;
    relationship: many_to_one
  }
}
