include: "/Views-Core/*.view.lkml"

explore: alumni_brand {
  view_name: alumni_brand
  view_label: "Alumni (Brand)"
  hidden: yes
  #join: person {
  #  required_access_grants: [developer_access]
  #  from: person
  #  #view_label: "Alumni (Brand)"
  #  #fields: [alumni_brand* ]
  #  relationship: many_to_many
  #  #sql_on: ${alumni_brand.alumni_level} = cast('Brand' as varchar(5)) and ${alumni_brand.person_wid} = ${event_registration.person_wid} and ${alumni_brand.alumni_name} = ${product.product_brand} ;;
  #  sql_on: ${alumni.alumni_level} = 'Brand' and ${person.person_wid} = ${alumni.person_wid} ;;
  #}

  #join: person_permissions {
  ##  view_label: "Person Permissions"
  #  from:  person_permissions
  #  type:  left_outer
  #  relationship: many_to_many
  #  sql_on: ${person.person_wid} = ${person_permissions.person_wid} ;;
  #}

  join: alumni_first_reg_brand {
    from: day_dim
    view_label: "Alumni (Total by Brand)"
    relationship: one_to_one
    sql_on: ${alumni_brand.first_reg_date_wid} = ${alumni_first_reg_brand.row_wid} ;;
  }

  join: alumni_last_reg_brand {
    from: day_dim
    view_label: "Alumni (Total by Brand)"
    relationship: one_to_one
    sql_on: ${alumni_brand.last_reg_date_wid} = ${alumni_last_reg_brand.row_wid} ;;
  }
}
explore: alumni_event {
  view_name: alumni_event
  view_label: "Alumni (Total by Event)"
  hidden: yes

  #join: person {
  #  required_access_grants: [developer_access]
  #  from: person
  #  view_label: "Alumni (Event)"
  #  relationship: many_to_many
  #  sql_on: ${alumni.alumni_level} = 'Event' and ${person.person_wid} = ${alumni.person_wid} ;;
  #}

  #join: person_permissions {
  #  view_label: "Person Permissions"
  #  from:  person_permissions
  #  type:  left_outer
  #  relationship: many_to_many
  #  sql_on: ${person.person_wid} = ${person_permissions.person_wid} ;;
  #}

  join: alumni_first_reg_event {
    required_access_grants: [insights_access]
    from: day_dim
    view_label: "Alumni (Total by Event)"
    relationship: one_to_one
    sql_on: ${alumni_event.first_reg_date_wid} = ${alumni_first_reg_event.row_wid} ;;
  }

  join: alumni_last_reg_event {
    required_access_grants: [insights_access]
    from: day_dim
    view_label: "Alumni (Total by Event)"
    relationship: one_to_one
    sql_on: ${alumni_event.last_reg_date_wid} = ${alumni_last_reg_event.row_wid} ;;
  }
}
