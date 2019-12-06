include: "/Views-Core/*.view.lkml"
include: "/Views-EmailActivity/*.view.lkml"

explore: email_open {
  group_label: "Email Activity"
  from: fact_email_open
  label: "Open Data"
  description: "Eloqua Email Open Data"

  join: email {
    from: dim_email
    relationship: one_to_one
    sql_on: ${email.row_wid} = ${email_open.email_wid} ;;
  }

  join: campaign {
    from:  dim_campaign
    relationship: one_to_one
    sql_on: ${campaign.row_wid} = ${email_open.campaign_wid} ;;
  }

  join: campaign_created {
    view_label: "Email Send"
    from: day_dim
    relationship: one_to_one
    sql_on: ${campaign.created_date_wid} = ${campaign_created.row_wid};;
  }

  join: open_date {
    from: day_dim
    relationship: one_to_one
    sql_on: ${email_open.activity_date_wid} = ${open_date.row_wid} ;;
  }

  join: person {
    relationship: one_to_one
    sql_on:  ${person.person_wid} = ${email_open.person_wid} ;;
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
