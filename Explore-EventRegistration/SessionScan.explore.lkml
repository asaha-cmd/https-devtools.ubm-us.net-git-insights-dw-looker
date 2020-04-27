include: "/Views-Core/*.view.lkml"
include: "/Views-EventRegistration/*.view.lkml"
include: "/Explore-EventRegistration/SessionSchedule.explore.lkml"


explore: session_scan {
  hidden: no
  view_name: fact_session_scan_activity
  group_label: "Event Registration"
  label: "Session Scan"
  description: "Supports exploration and analysis of Session Scan"

  join: product {
    type: inner
    relationship: many_to_one
    sql_on: ${fact_session_scan_activity.product_wid} = ${product.row_wid} ;;
  }

  join: person {
    type: inner
    relationship: many_to_one
    sql_on: ${fact_session_scan_activity.person_wid} = ${person.person_wid} ;;
  }
  join: person_permissions {
    view_label: "Person Permissions"
    from:  person_permissions
    type:  left_outer
    relationship: many_to_many
    sql_on: ${person.person_wid} = ${person_permissions.person_wid} ;;
  }

  join: session {
    view_label: "Session Data"
    from: dim_session
    relationship: many_to_one
    sql_on: ${fact_session_scan_activity.session_wid} = ${session.row_wid} ;;
  }

  join: scan_date {
    view_label: "Session Data"
    from:day_dim
    relationship: one_to_one
    sql_on: ${fact_session_scan_activity.scan_date_wid} = ${scan_date.row_wid} ;;
  }
  extends: [ session_schedule]

  join: fact_scheduled_session {
    relationship: one_to_many
    sql_on:  ${fact_scheduled_session.person_wid} = ${person.person_wid} and ${fact_scheduled_session.product_wid} = ${product.row_wid} ;;
  }
}
