include: "/Views-Core/*.view.lkml"
include: "/Views-EmailActivity/*.view.lkml"

explore: email_send {
  from: fact_email_send
  group_label: "Email Activity"
  label: "Send Data"
  description: "Eloqua Email Send Data"

  join: email {
    view_label: "Email Send"
    from: dim_email
    relationship: one_to_one
    sql_on: ${email.row_wid} = ${email_send.email_wid} ;;
  }

  join: campaign {
    view_label: "Email Send"
    from:  dim_campaign
    relationship: one_to_one
    sql_on: ${campaign.row_wid} = ${email_send.campaign_wid} ;;
  }

  join: send {
    view_label: "Email Send"
    from: day_dim
    relationship: one_to_one
    sql_on: ${email_send.activity_date_wid} = ${send.row_wid} ;;
  }

  join: campaign_created {
    view_label: "Email Send"
    from: day_dim
    relationship: one_to_one
    sql_on: ${campaign.created_date_wid} = ${campaign_created.row_wid};;
  }

  join: person {
    relationship: one_to_one
    sql_on:  ${person.person_wid} = ${email_send.person_wid} ;;
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
