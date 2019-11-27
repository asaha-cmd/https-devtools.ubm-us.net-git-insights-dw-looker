include: "/Views-Core/*.view.lkml"

explore: fact_engagement_persona {
  group_label: "People"
  label: "Persona Engagement"
  view_label: "Persona Engagement"
  description: "Persona Filtered Engagement"

  join: engagement {
    view_label: "Persona Engagement"
    from: day_dim
    relationship: many_to_one
    type: inner
    sql_on: ${fact_engagement_persona.engagement_date_wid} = ${engagement.row_wid};;
  }

  join: create {
    view_label: "Person"
    from: day_dim
    relationship: many_to_one
    type: inner
    sql_on: ${person.created_date_wid} = ${create.row_wid};;
  }

  join: person {
    relationship: many_to_one
    type: inner
    sql_on: ${fact_engagement_persona.person_wid} = ${person.person_wid} ;;
  }

  join: product {
    relationship: many_to_one
    type: inner
    sql_on: ${fact_engagement_persona.brand_wid} = ${product.row_wid};;
  }

  join: person_permissions {
    view_label: "Person Permissions"
    from:  person_permissions
    type:  full_outer
    relationship: many_to_many
    sql_on: ${person.person_wid} = ${person_permissions.person_wid} ;;
  }

  join: permission {
    view_label: "Person Permissions"
    from: day_dim
    relationship: many_to_one
    type: full_outer
    sql_on: ${person_permissions.permission_date_wid} = ${permission.row_wid} ;;
  }
}
