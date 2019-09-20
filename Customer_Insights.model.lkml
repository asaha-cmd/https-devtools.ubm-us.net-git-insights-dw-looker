connection: "production_redshift_-_informatica_user"

access_grant: can_access_email_address {
  user_attribute: can_access_email_address
  allowed_values: [ "true" ]
}

include: "/Explore-People/*.explore.lkml"
include: "/Explore-EventRegistration/*.explore.lkml"
include: "/Explore-EmailActivity/*.explore.lkml"
include: "/Explore-OnlineActivity/*.explore.lkml"
include: "/Explore-Demographics/*.explore.lkml"
