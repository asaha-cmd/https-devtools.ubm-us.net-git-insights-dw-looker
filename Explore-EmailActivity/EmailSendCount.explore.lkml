include: "/Views-Core/*.view.lkml"
include: "/Views-EmailActivity/*.view.lkml"

explore: email_send_count {
  from: email_send_by_person
  group_label: "Email Activity"
  label: "Send Data Counts by Person"
  description: "Eloqua Email Send Data Counts by Person"

  join: person {
    relationship: one_to_one
    sql_on:  ${person.person_wid} = ${email_send_count.person_wid} ;;
  }

  join: email {
    view_label: "Email Send"
    from: dim_email
    relationship: one_to_one
    sql_on: ${email.row_wid} = ${email_send_count.email_wid} ;;
  }

  join: email_group {
    from: dim_email_group
    relationship: one_to_one
    sql_on: ${email_group.row_wid} = ${email.email_group_wid} ;;
  }

  join: product {
    relationship: one_to_one
    sql_on:  ${product.row_wid} = ${email_group.brand_wid} ;;
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

}
