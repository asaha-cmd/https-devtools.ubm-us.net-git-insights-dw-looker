include: "/Views-Core/*.view.lkml"
include: "/Views-OnlineActivity/*.view.lkml"

explore: Online_Activity {
  from: Online_Activity
  label: "Online Activity"
  description: "Online activity from NG, Eloqua CDO, historical data"

  join: person {
    type: inner
    relationship: many_to_one
    sql_on: ${Online_Activity.person_wid} = ${person.person_wid} ;;
  }
  join: asset_dim {
    type:  inner
    view_label: "Online Asset"
    relationship: many_to_one
    sql_on: ${Online_Activity.asset_wid} = ${asset_dim.row_wid} ;;
  }

  join: product {
    type: inner
    relationship: many_to_one
    sql_on: ${Online_Activity.product_wid} = ${product.row_wid} ;;
  }

  join: day_dim  {
    relationship: one_to_one
    view_label: "Online Activity Date"
    sql_on: ${Online_Activity.activity_date_wid} =${day_dim.row_wid} ;;
  }

  join: marketing_code {
    from: activity_code_dim
    view_label: "Marketing Code"
    relationship: many_to_one
    sql_on: ${Online_Activity.marketing_code_wid} = ${marketing_code.row_wid} ;;
  }

  join: site_dim {
    type: inner
    view_label: "Site"
    relationship: many_to_one
    sql_on: ${Online_Activity.site_wid} = ${site_dim.row_wid} ;;
  }


}