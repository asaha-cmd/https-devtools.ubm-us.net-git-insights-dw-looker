include: "/Views-Core/*.view.lkml"

explore: person {
  description: "Base details around a person in the DW"
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
