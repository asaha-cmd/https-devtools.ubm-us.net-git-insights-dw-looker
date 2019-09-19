connection: "production_redshift_-_informatica_user"

include: "Views-Core/*.view.lkml"
include: "Views-EventRegistration/*.view.lkml"

label: "Event Registration"

access_grant: can_access_email_address {
  user_attribute: can_access_email_address
  allowed_values: [ "true" ]
}

explore: event_registration {
  from:event_registration_fact
  label: "Event Registration Details"

  join: person {
    type: inner
    relationship: many_to_one
    sql_on: ${event_registration.person_wid} = ${person.person_wid} ;;
  }

  join: product {
    type: inner
    relationship: many_to_one
    sql_on: ${event_registration.product_wid} = ${product.row_wid} ;;
  }

  join: registration_date {
    from: day_dim
    view_label: "Event Registration Date"
    relationship: one_to_one
    sql_on: ${event_registration.registration_date_wid} = ${registration_date.row_wid} ;;
  }

  join: checkin_date {
    from: day_dim
    view_label: "Event Checked In Date"
    relationship: one_to_one
    sql_on: ${event_registration.checkedin_date_wid} = ${checkin_date.row_wid} ;;
  }

  join: cancellation_date {
    from:  day_dim
    view_label: "Event Cancellation Date"
    relationship: one_to_one
    sql_on: ${event_registration.cancellation_date_wid} = ${cancellation_date.row_wid} ;;
  }

  join: promotion_code {
    from:  activity_code_dim
    relationship: many_to_one
    sql_on: ${event_registration.promo_code_wid} = ${promotion_code.row_wid} ;;
  }

  join: marketing_code {
    from: activity_code_dim
    relationship: many_to_one
    sql_on: ${event_registration.marketing_code_wid} = ${marketing_code.row_wid} ;;
  }

  join: event_reg_pass_fact {
    view_label: "Event Registration Passes"
    relationship: one_to_many
    sql_on: ${event_registration.row_wid} = ${event_reg_pass_fact.event_reg_wid}
    and ${event_registration.person_wid} = ${event_reg_pass_fact.person_wid}
    and ${event_registration.product_wid} = ${event_reg_pass_fact.product_wid};;
  }

  join: event_pass_dim {
    view_label: "Event Registration Passes Detail"
    relationship: many_to_one
    sql_on: ${event_reg_pass_fact.event_pass_wid} = ${event_pass_dim.row_wid} ;;
  }

join: event_reg_discount_fact {
  view_label: "Event Registration Discounts"
  relationship: one_to_many
  sql_on: ${event_registration.row_wid} = ${event_reg_discount_fact.event_reg_wid}
    and ${event_registration.person_wid} = ${event_reg_discount_fact.person_wid}
    and ${event_registration.product_wid} = ${event_reg_discount_fact.product_wid};;
}
}

explore: event_registration_passes {
  from:  event_reg_pass_fact

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
