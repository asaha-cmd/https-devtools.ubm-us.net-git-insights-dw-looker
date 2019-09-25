

include: "/Views-Core/*.view.lkml"
include: "/Views-EmailActivity/*.view.lkml"
include: "/Views-Permissions/*.view.lkml"

explore: permission_global {
  group_label: "Permissions"
  label: "Global"
  view_label: "Permission"
  from: fact_global_permission

  join: business_level {
    view_label: "Permission"
    type: left_outer
    from: product
    fields: [business_level.product_title]
    sql_on: ${permission_global.brand_wid} = ${business_level.row_wid} ;;
    relationship: many_to_one
  }
  join: country {
    view_label: "Permission"
    type: left_outer
    fields: [country_name]
    sql_on: ${permission_global.country_wid} = ${country.row_wid} ;;
    relationship: many_to_one
  }

  join: permission {
    view_label: "Permission"
    from:  day_dim
    type: left_outer
    sql_on: ${permission_global.permission_date_wid} = ${permission.row_wid} ;;
    relationship: many_to_one
  }

  join: person {
    type: left_outer
    sql_on: ${permission_global.person_wid} = ${person.person_wid} ;;
    relationship: many_to_one
  }
}

explore: permission_email_group {
  group_label: "Permissions"
  label: "Email Group Based"
  from: fact_email_group_permission
  join: email_group {
    view_label: "Filters"
    from: dim_email_group
    type: left_outer
    fields: [email_group.email_group]
    sql_on: ${permission_email_group.email_group_wid} = ${email_group.row_wid} and ${email_group.active_flag} = true;;
    relationship: many_to_one
  }

  join: permission_date {
    view_label: "Filters"
    from:  day_dim
    type: left_outer
    sql_on: ${permission_email_group.permission_date_wid} = ${permission_date.row_wid} ;;
    relationship: many_to_one
  }
  join: person {
    type: left_outer
    sql_on: ${permission_email_group.person_wid} = ${person.person_wid} ;;
    relationship: many_to_one
  }

  join: product {
    relationship: one_to_many
    sql_on:  ${product.row_wid} = ${email_group.brand_wid} ;;
  }

  join: promotion {
    view_label: "Filters"
    type: left_outer
    from: promotion_type_dim
    relationship: one_to_many
    sql_on:  ${promotion.row_wid} = ${email_group.promotion_type_wid} ;;
  }
}
