connection: "production_redshift_-_informatica_user"


access_grant: can_access_email_address {
  user_attribute: can_access_email_address
  allowed_values: [ "true" ]
}

include: "Views-Core/*.view.lkml"
include: "Views-EmailActivity/*.view.lkml"
include: "Views-Permissions/*.view.lkml"

label: "Email Permissions"

explore: global_permission {
  from: fact_global_permission
  join: product {
    view_label: "Business Level Group"
    type: left_outer
    fields: [product.product_title]
    sql_on: ${global_permission.brand_wid} = ${product.row_wid} ;;
    relationship: many_to_one
  }
  join: country {
    type: left_outer
    fields: [country_name]
    sql_on: ${global_permission.country_wid} = ${country.row_wid} ;;
    relationship: many_to_one
  }

  join: permission_date {
    view_label: "Permission Created Date"
    from:  day_dim
    type: left_outer
    sql_on: ${global_permission.permission_date_wid} = ${permission_date.row_wid} ;;
    relationship: many_to_one
  }

  join: person {
    type: left_outer
    sql_on: ${global_permission.person_wid} = ${person.person_wid} ;;
    relationship: many_to_one
  }
}

explore: email_group_permission {
  from: fact_email_group_permission
  join: email_group {
    view_label: "Filters"
    from: dim_email_group
    type: left_outer
    fields: [email_group.email_group]
    sql_on: ${email_group_permission.email_group_wid} = ${email_group.row_wid} and ${email_group.active_flag} = true;;
    relationship: many_to_one
  }

  join: permission_date {
    view_label: "Filters"
    from:  day_dim
    type: left_outer
    sql_on: ${email_group_permission.permission_date_wid} = ${permission_date.row_wid} ;;
    relationship: many_to_one
  }
  join: person {
    type: left_outer
    sql_on: ${email_group_permission.person_wid} = ${person.person_wid} ;;
    relationship: many_to_one
  }


}
