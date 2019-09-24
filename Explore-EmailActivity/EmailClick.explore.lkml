include: "/Views-Core/*.view.lkml"
include: "/Views-EmailActivity/*.view.lkml"

explore: email_click {
  group_label: "Email Activity"
  from: fact_email_click
  label: "Click Data"
  description: "Eloqua Email Click Data"

  join: email {
    from: dim_email
    relationship: one_to_one
    sql_on: ${email.row_wid} = ${email_click.email_wid} ;;
  }

  join: campaign {
    from:  dim_campaign
    relationship: one_to_one
    sql_on: ${campaign.row_wid} = ${email_click.campaign_wid} ;;
  }

  join: click_date {
    from: day_dim
    relationship: one_to_one
    sql_on: ${email_click.activity_date_wid} = ${click_date.row_wid} ;;
  }

  join: person {
    relationship: one_to_one
    sql_on:  ${person.person_wid} = ${email_click.person_wid} ;;
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
