connection: "production_redshift_-_informatica_user"

week_start_day: sunday

access_grant: can_access_email_address {
  user_attribute: can_access_email_address
  allowed_values: [ "true" ]
}

access_grant: developer_access {
  user_attribute: developer_access
  allowed_values: ["true"]
}

datagroup: basic_cache {
  max_cache_age: "24 hours"
  sql_trigger: SELECT max(warehouse_update_date_wid) FROM cidw.person_dim ;;
}
persist_with: basic_cache
case_sensitive: no

include: "/Explore-People/*.explore.lkml"
include: "/Explore-EventRegistration/*.explore.lkml"
include: "/Explore-EmailActivity/*.explore.lkml"
include: "/Explore-OnlineActivity/*.explore.lkml"
include: "/Explore-Demographics/*.explore.lkml"
include: "*.dashboard.lookml"
