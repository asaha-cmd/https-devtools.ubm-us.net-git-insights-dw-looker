connection: "production_redshift_-_informatica_user"

include: "Views-Core/*.view.lkml"
include: "Views-OnlineActivity/*.view.lkml"

label: "Online Activity"

explore: Online_Activity {
  from: Online_Activity
  join: person {
    relationship: one_to_one
    sql_on: ${Online_Activity.person_wid} = ${person.person_wid} ;;
    }
    join: asset_dim {
      relationship: one_to_one
      sql_on: ${Online_Activity.asset_wid} = ${asset_dim.row_wid} ;;
    }

}
