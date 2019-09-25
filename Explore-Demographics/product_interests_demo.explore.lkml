include: "/Views-Core/*.view.lkml"
include: "/Views-Demographics/*.view.lkml"

explore: demographic_product_interests {
  group_label: "Demographics"
  label: "Product Interests"
  from: product_interests_demo_bridge
  description: "Audience Group Based Industry Demographics"
  join: product_interests_demo_fact {
    type:left_outer
    fields: []
    sql_on: ${demographic_product_interests.product_interests_demo_wid} = ${product_interests_demo_fact.row_wid};;
    relationship:one_to_many
  }

  join: product_interests_value_dim {
    view_label: "Product Interests"
    type: left_outer
    #fields: [product_interests_value_dim.standard_name, product_interests_value_dim.original_name]
    sql_on:  ${demographic_product_interests.product_interests_value_wid} = ${product_interests_value_dim.row_wid} ;;
    relationship: one_to_many
  }

  join: person {
    type: left_outer
    fields: [demographic_fields*]
    sql_on: ${product_interests_demo_fact.person_wid} = ${person.person_wid} ;;
    relationship: many_to_one
  }

  join: activity {
    view_label: "Product Interests"
    from: day_dim
    type: left_outer
    sql_on:  ${product_interests_demo_fact.modified_date_wid} = ${activity.row_wid} ;;
    relationship: one_to_one
  }
  join: audience_group {
    view_label: "Product Interests"
    type: left_outer
    sql_on: ${product_interests_demo_fact.audience_group_wid} = ${audience_group.row_wid} ;;
    relationship: many_to_one
  }
}
