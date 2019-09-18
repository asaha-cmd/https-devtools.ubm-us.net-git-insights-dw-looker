connection: "production_redshift_-_informatica_user"

include: "Views-Core/*.view.lkml"

label: "People"

explore: person {
  join: data_source {
    relationship: one_to_one
    sql_on: ${person.initial_data_source_wid} = ${data_source.row_wid} ;;
  }

  join: creation_day_dim {
    view_label: "Person Create Date"
    from:  day_dim
    type: left_outer
    relationship: one_to_one
    sql_on: ${creation_day_dim.row_wid} = ${person.created_date_wid} ;;
  }

  join: last_engagement_day_dim {
    view_label: "Person Last Engagement Date"
    from:  day_dim
    type: left_outer
    relationship: one_to_one
    sql_on: ${last_engagement_day_dim.row_wid} = ${person.created_date_wid} ;;
  }
}

explore: person_audience_group_membership {
  from: audience_group_membership
  join: person {
    relationship: one_to_one
    sql_on: ${person_audience_group_membership.person_wid} = ${person.person_wid} ;;
  }
  join: audience_group {
    relationship: one_to_one
    sql_on: ${person_audience_group_membership.audience_group_wid} = ${audience_group.row_wid} ;;
  }
  join: membership_day_dim {
    view_label: "Audience Membership Date"
    from: day_dim
    type: left_outer
    relationship: one_to_one
    sql_on: ${person_audience_group_membership.membership_date_wid} = ${membership_day_dim.row_wid} ;;
  }
  join: creation_day_dim {
    view_label: "Person Create Date"
    from:  day_dim
    type: left_outer
    relationship: one_to_one
    sql_on: ${creation_day_dim.row_wid} = ${person.created_date_wid} ;;
  }
  join: last_engagement_day_dim {
    view_label: "Person Last Engagement Date"
    from:  day_dim
    type: left_outer
    relationship: one_to_one
    sql_on: ${last_engagement_day_dim.row_wid} = ${person.created_date_wid} ;;
  }
  join: product {
    view_label: "Product"
    type: left_outer
    relationship: one_to_one
    sql_on: ${person_audience_group_membership.product_wid} = ${product.row_wid} ;;
  }
  join: audience_membership_data_source {
    from: data_source
    type: left_outer
    relationship: one_to_one
    sql_on: ${person_audience_group_membership.data_source_wid} = ${audience_membership_data_source.row_wid} ;;
  }
}
