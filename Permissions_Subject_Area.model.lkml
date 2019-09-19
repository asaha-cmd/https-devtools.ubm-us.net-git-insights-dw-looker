connection: "production_redshift_-_informatica_user"


access_grant: can_access_email_address {
  user_attribute: can_access_email_address
  allowed_values: [ "true" ]
}

include: "Views-Core/*.view.lkml"
include: "Views-EmailActivity/*.view.lkml"
include: "Views-Permissions/*.view.lkml"

label: "Email Permissions"

explore: global_permissions {
  from: fact_global_permission
  join: product {
    view_label: "Business Level Group"
    type: left_outer
    fields: [product.product_title]
    sql_on: ${global_permissions.brand_wid} = ${product.row_wid} ;;
    relationship: many_to_one
  }
  #join: country {
  #  type: left_outer
  #  fields: [country_name]
  #  sql_on: ${global_permissions.country_wid} = ${country.row_wid} ;;
  #  relationship: many_to_one
  #}

  join: permission_date {
    view_label: "Permission Created Date"
    from:  day_dim
    type: left_outer
    sql_on: ${global_permissions.permission_date_wid} = ${permission_date.row_wid} ;;
    relationship: many_to_one
  }

  join: person {
    type: left_outer
    sql_on: ${global_permissions.person_wid} = ${person.person_wid} ;;
    relationship: many_to_one
  }

#  join: email_group {
#    type:left_outer
#    from: dim_email_group
#    sql_on: ${global_permissions.} = ${industry_demo_fact.row_wid};;
#    relationship:many_to_one
#  }


}
