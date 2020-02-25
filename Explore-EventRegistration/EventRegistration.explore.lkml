include: "/Views-Core/*.view.lkml"
include: "/Views-EventRegistration/*.view.lkml"
include: "/Explore-People/Alumni.explore.lkml"

explore: event_registration {
  hidden: no
  view_name: event_registration
  group_label: "Event Registration"
  from:event_registration_fact
  label: "Event Registration Details"
  description: "Supports exploration and analysis of Event Registration"

  join: person {
    type: inner
    relationship: many_to_one
    sql_on: ${event_registration.person_wid} = ${person.person_wid} ;;
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

  join: create {
    view_label: "Person"
    from:day_dim
    relationship: one_to_one
    sql_on: ${create.row_wid} = ${person.created_date_wid} ;;
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

  join: event_registration_dim {
    view_label: "Event Registration"
    relationship: one_to_many
    sql_on: ${event_registration_dim.row_wid} = ${event_registration.event_registration_wid} ;;
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

  join: question_answers {
    from: event_qa_history_fact
    view_label: "Event Questions/Answers"
    relationship: one_to_many
    sql_on:  ${event_registration.product_wid} = ${question_answers.product_wid}
      and ${event_registration.person_wid} = ${question_answers.person_wid}
      and ${event_registration.event_reg_id} = ${question_answers.event_reg_id};;
  }

  join: question {
    from: question_dim
    view_label: "Event Questions/Answers"
    relationship: one_to_one
    sql_on: ${question.row_wid} = ${question_answers.question_wid} ;;
  }

  join: answer {
    from: answer_dim
    view_label: "Event Questions/Answers"
    relationship: one_to_one
    sql_on: ${answer.row_wid} = ${question_answers.answer_wid} ;;
  }

  join: warehouse {
    required_access_grants: [developer_access]
    from: day_dim
    view_label: "Developer"
    relationship: one_to_one
    sql_on: ${event_registration.warehouse_date_wid} = ${warehouse.row_wid} ;;
  }

  join: warehouse_update {
    required_access_grants: [developer_access]
    from: day_dim
    view_label: "Developer"
    relationship: one_to_one
    sql_on: ${event_registration.warehouse_update_date_wid} = ${warehouse_update.row_wid} ;;
  }

  join: data_source {
    required_access_grants: [developer_access]
    from: data_source
    view_label: "Developer"
    relationship: one_to_one
    sql_on: ${data_source.row_wid} = ${event_registration.data_source_wid} ;;
  }

  extends: [alumni_brand,alumni_event]


  join: alumni_event {
    required_access_grants: [developer_access]
    from: alumni_event
    view_label: "Alumni (Event)"
    #fields: [ALL_FIELDS*,-alumni.alumni_brand* ]
    relationship: many_to_many
    sql_on: ${alumni_event.alumni_level} = 'Event' and ${alumni_event.person_wid} = ${person.person_wid} and ${alumni_event.alumni_name} = ${product.product_subbrand} ;;
  }
  join: alumni_brand {
    required_access_grants: [developer_access]
    from: alumni_brand
    view_label: "Alumni (Brand)"
    #fields: [ALL_FIELDS*,-alumni.alumni_event* ]
    relationship: many_to_many
    #sql_on: ${alumni_brand.alumni_level} = cast('Brand' as varchar(5)) and ${alumni_brand.person_wid} = ${event_registration.person_wid} and ${alumni_brand.alumni_name} = ${product.product_brand} ;;
    sql_on: ${alumni_brand.alumni_level} = 'Brand' and ${alumni_brand.person_wid} = ${person.person_wid} and ${alumni_brand.alumni_name} = ${product.product_brand} ;;
  }

}
