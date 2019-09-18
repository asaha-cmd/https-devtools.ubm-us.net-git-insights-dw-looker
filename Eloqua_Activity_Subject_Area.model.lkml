connection: "production_redshift_-_informatica_user"

include: "Views-Core/*.view.lkml"
include: "Views-EmailActivity/*.view.lkml"

label: "Email Activity"

explore: email_send {
  from: fact_email_send

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

explore: email_open {
  from: fact_email_open

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
}

explore: email_click {
  from: fact_email_click

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
