include: "/Views-Core/*.view.lkml"
include: "/Views-EventRegistration/*.view.lkml"

explore: session_schedule {
  hidden: no
  view_name: fact_scheduled_session
  group_label: "Event Registration"
  label: "Session Schedule"
  description: "Supports exploration and analysis of Session Builder Sessions"

  join: product {
    type: inner
    relationship: many_to_one
    sql_on: ${fact_scheduled_session.product_wid} = ${product.row_wid} ;;
  }

  join: person {
    type: inner
    relationship: many_to_one
    sql_on: ${fact_scheduled_session.person_wid} = ${person.person_wid} ;;
  }
  join: person_permissions {
    view_label: "Person Permissions"
    from:  person_permissions
    type:  left_outer
    relationship: many_to_many
    sql_on: ${person.person_wid} = ${person_permissions.person_wid} ;;
  }

  join: session {
    view_label: "Session Schedule"
    from: dim_session
    relationship: many_to_one
    sql_on: ${fact_scheduled_session.session_wid} = ${session.row_wid} ;;
  }

  join: schedule_date {
    view_label: "Session Schedule"
    from:day_dim
    relationship: one_to_one
    sql_on: ${fact_scheduled_session.schedule_date_wid} = ${schedule_date.row_wid} ;;
  }


}
