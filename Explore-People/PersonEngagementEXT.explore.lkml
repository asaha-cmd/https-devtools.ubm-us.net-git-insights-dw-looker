include: "/Views-Core/*.view.lkml"

explore: fact_engagement_ext {
  group_label: "People"
  label: "Engagement Extended"
  view_label: "Engagement Extended"
  description: "Consildated positive engagement data"

  join: engagement {
    view_label: "Engagement"
    from: day_dim
    relationship: many_to_one
    type: inner
    sql_on: ${fact_engagement_ext.engagement_date_wid} = ${engagement.row_wid};;
  }

  join: previous_engagement {
    view_label: "Engagement"
    from: day_dim
    relationship: many_to_one
    type: inner
    sql_on: ${fact_engagement_ext.previous_engagement_date_wid} = ${previous_engagement.row_wid};;
  }

  join: previous_brand_engagement {
    view_label: "Engagement"
    from: day_dim
    relationship: many_to_one
    type: inner
    sql_on: ${fact_engagement_ext.previous_brand_engagement_date_wid} = ${previous_engagement.row_wid};;
  }

  join: create {
    view_label: "Person"
    from: day_dim
    relationship: many_to_one
    type: inner
    sql_on: ${person.created_date_wid} = ${create.row_wid}
          --AND  ${person.created_date_wid} = ${fact_engagement_ext.engagement_date_wid}
          ;;
  }

  join: person {
    relationship: many_to_one
    type: inner
    sql_on: ${fact_engagement_ext.person_wid} = ${person.person_wid} ;;
  }

  join: product {
    relationship: many_to_one
    type: inner
    sql_on: ${fact_engagement_ext.brand_wid} = ${product.row_wid};;
  }

  join: person_initial_data_source {
    from:  data_source
    type: inner
    relationship: one_to_one
    sql_on: ${person.initial_data_source_wid} = ${person_initial_data_source.row_wid} ;;
  }

  join: person_permissions {
    view_label: "Person Permissions"
    from:  person_permissions
    type:  left_outer
    relationship: many_to_one
    sql_on: ${person.person_wid} = ${person_permissions.person_wid} ;;
  }

  join: permission {
    view_label: "Person Permissions"
    from: day_dim
    relationship: many_to_one
    type: inner
    sql_on: ${person_permissions.permission_date_wid} = ${permission.row_wid} ;;
  }


}