include: "/Views-Core/*.view.lkml"

explore: person {
  group_label: "People"
  description: "Base details around a person in the DW"
  join: data_source {
    relationship: one_to_one
    sql_on: ${person.initial_data_source_wid} = ${data_source.row_wid} ;;
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
