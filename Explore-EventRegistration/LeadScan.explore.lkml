include: "/Views-Core/*.view.lkml"
include: "/Views-EventRegistration/*.view.lkml"


explore: lead_scan {
  hidden: no
  view_name: fact_lead_scan_activity
  group_label: "Event Registration"
  label: "Lead Scan"
  description: "Supports exploration and analysis of Lead Scan"

  join: product {
    type: inner
    relationship: many_to_one
    sql_on: ${fact_lead_scan_activity.product_wid} = ${product.row_wid} ;;
  }

  join: person {
    type: inner
    relationship: many_to_one
    sql_on: ${fact_lead_scan_activity.person_wid} = ${person.person_wid} ;;
  }
  join: person_permissions {
    view_label: "Person Permissions"
    from:  person_permissions
    type:  left_outer
    relationship: many_to_many
    sql_on: ${person.person_wid} = ${person_permissions.person_wid} ;;
  }

  join: scan_date {
    view_label: "Lead Scan"
    from:day_dim
    relationship: one_to_one
    sql_on: ${fact_lead_scan_activity.scan_date_wid} = ${scan_date.row_wid} ;;
  }


}
