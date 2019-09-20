include: "/Views-Core/*.view.lkml"
include: "/Views-EmailActivity/*.view.lkml"

explore: email_send {
  from: fact_email_send
  label: "Email Activity - Send"
  description: "Eloqua Email Send Data"

  join: email {
    from: dim_email
    relationship: one_to_one
    sql_on: ${email.row_wid} = ${email_send.email_wid} ;;
  }

  join: campaign {
    from:  dim_campaign
    relationship: one_to_one
    sql_on: ${campaign.row_wid} = ${email_send.campaign_wid} ;;
  }

  join: send_date {
    from: day_dim
    relationship: one_to_one
    sql_on: ${email_send.activity_date_wid} = ${send_date.row_wid} ;;
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