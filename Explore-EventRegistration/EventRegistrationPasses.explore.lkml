include: "/Views-Core/*.view.lkml"
include: "/Views-EventRegistration/*.view.lkml"

explore: event_registration_passes {
  from:  event_reg_pass_fact
  description: "Pass details for Event Registrations"

  join: event_pass_dim {
    view_label: "Event Registration Passes Detail"
    relationship: many_to_one
    sql_on: ${event_registration_passes.event_pass_wid} = ${event_pass_dim.row_wid} ;;
  }

  join: person {
    type: inner
    relationship: many_to_one
    sql_on: ${event_registration_passes.person_wid} = ${person.person_wid} ;;
  }

  join: product {
    type: inner
    relationship: many_to_one
    sql_on: ${event_registration_passes.product_wid} =${product.row_wid};;
  }

  join: event_registration_pass_date {
    from: day_dim
    type: inner
    relationship: many_to_one
    sql_on: ${event_registration_passes.registration_date_wid} = ${event_registration_pass_date.row_wid} ;;
  }

  join: event_registration {
    from: event_registration_fact
    relationship: one_to_one
    type: inner
    sql_on: ${event_registration.row_wid} = ${event_registration_passes.event_reg_wid} ;;
  }
}
