include: "/Views-Core/*.view.lkml"
include: "/Views-EventRegistration/*.view.lkml"

explore: event_registration {
  group_label: "Event Registration"
  from:event_registration_fact
  label: "Event Registration Details"
  description: "Supports exploration and analysis of Event Registration"

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

  join: product_start {
    view_label: "Product"
    from:day_dim
    relationship: one_to_one
    sql_on: ${product_start.row_wid} = ${product.start_date_wid} ;;
  }

  join: product_end {
    view_label: "Product"
    from:day_dim
    relationship: one_to_one
    sql_on: ${product_end.row_wid} = ${product.end_date_wid} ;;
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
    view_label: "Event Registration Passes"
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
