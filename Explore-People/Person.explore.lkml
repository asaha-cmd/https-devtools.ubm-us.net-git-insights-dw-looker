include: "/Views-Core/*.view.lkml"

explore: person {
  group_label: "People"
  description: "Base details around a person in the DW"
  join: data_source {
    relationship: one_to_one
    sql_on: ${person.initial_data_source_wid} = ${data_source.row_wid} ;;
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

  join: creation {
    view_label: "Person"
    from:  day_dim
    type: left_outer
    relationship: one_to_one
    sql_on: ${creation.row_wid} = ${person.created_date_wid} ;;
  }

  join: last_engagement {
    view_label: "Person"
    from:  day_dim
    type: left_outer
    relationship: one_to_one
    sql_on: ${last_engagement.row_wid} = ${person.created_date_wid} ;;
  }
}
