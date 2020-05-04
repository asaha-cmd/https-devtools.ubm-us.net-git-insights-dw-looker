include: "/Views-Core/*.view.lkml"
include: "/Views-EventRegistration/*.view.lkml"

explore: event_registration_passes {
  view_name: event_registration_passes
  group_label: "Event Registration"
  from:  event_reg_pass_fact
  label: "Event Registration Pass"
  description: "Pass details for Event Registrations"

  join: event_pass_dim {
    view_label: "Event Registration Passes"
    relationship: many_to_one
    sql_on: ${event_registration_passes.event_pass_wid} = ${event_pass_dim.row_wid} ;;
  }

  join: person {
    type: inner
    relationship: many_to_one
    sql_on: ${event_registration_passes.person_wid} = ${person.person_wid} ;;
  }
  join: person_permissions {
    view_label: "Person Permissions"
    from:  person_permissions
    type:  left_outer
    relationship: many_to_many
    sql_on: ${person.person_wid} = ${person_permissions.person_wid} ;;
  }

  join: permission {
    view_label: "Person Permissions"
    from: day_dim
    relationship: many_to_one
    type: left_outer
    sql_on: ${person_permissions.permission_date_wid} = ${permission.row_wid} ;;
  }

  join: product {
    type: inner
    relationship: many_to_one
    sql_on: ${event_registration_passes.product_wid} =${product.row_wid};;
  }

  join: product_start {
    view_label: "Product"
    from:day_dim
    relationship: one_to_one
    sql_on: ${product_start.row_wid} = ${product.start_date_wid} ;;
  }

  join: pass {
    view_label: "Event Registration Passes"
    from: day_dim
    type: inner
    relationship: many_to_one
    sql_on: ${event_registration_passes.registration_date_wid} = ${pass.row_wid} ;;
  }

  join: event_registration {
    from: event_registration_fact
    relationship: one_to_one
    type: inner
    sql_on: ${event_registration.row_wid} = ${event_registration_passes.event_reg_wid} ;;
  }

  join: event_registration_dim {
    view_label: "Event Registration"
    relationship: one_to_many
    sql_on: ${event_registration_dim.row_wid} = ${event_registration.event_registration_wid} ;;
  }

  join: registration {
    from: day_dim
    view_label: "Event Registration"
    relationship: one_to_one
    sql_on: ${event_registration.registration_date_wid} = ${registration.row_wid} ;;
  }

  join: checkin {
    from: day_dim
    view_label: "Event Registration"
    relationship: one_to_one
    sql_on: ${event_registration.checkedin_date_wid} = ${checkin.row_wid} ;;
  }

  join: cancellation {
    view_label: "Event Registration"
    from:  day_dim
    relationship: one_to_one
    sql_on: ${event_registration.cancellation_date_wid} = ${cancellation.row_wid} ;;
  }

  join: paid {
    from: day_dim
    view_label: "Event Registration"
    relationship: one_to_one
    sql_on: ${event_registration.registration_date_wid} = ${paid.row_wid} ;;
  }
}
