

include: "/Views-Core/*.view.lkml"
include: "/Views-EmailActivity/*.view.lkml"
include: "/Views-Permissions/*.view.lkml"

explore: permission_global {
  group_label: "Permissions"
  label: "Global"
  from: fact_global_permission
  join: product {
    view_label: "Business Level Group"
    type: left_outer
    fields: [product.product_title]
    sql_on: ${permission_global.brand_wid} = ${product.row_wid} ;;
    relationship: many_to_one
  }
  join: country {
    type: left_outer
    fields: [country_name]
    sql_on: ${permission_global.country_wid} = ${country.row_wid} ;;
    relationship: many_to_one
  }

  join: permission_date {
    view_label: "Permission Created Date"
    from:  day_dim
    type: left_outer
    sql_on: ${permission_global.permission_date_wid} = ${permission_date.row_wid} ;;
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


}
