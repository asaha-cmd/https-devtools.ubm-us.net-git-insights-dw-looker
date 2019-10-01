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
}
