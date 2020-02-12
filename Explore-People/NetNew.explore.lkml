include: "/Views-Core/*.view.lkml"

explore: fact_net_new_person {
  group_label: "People"
  label: "Net New"
  view_label: "Net New"
  description: "Net New People to Data Warehouse"


  join: net_new {
    view_label: "Net New"
    from: day_dim
    relationship: many_to_one
    type: inner
    sql_on: ${fact_net_new_person.net_new_date_wid} = ${net_new.row_wid};;
  }
  join: person {
    relationship: many_to_one
    type: inner
    sql_on: ${fact_net_new_person.person_wid} = ${person.person_wid} ;;
  }

  join: person_permissions {
    view_label: "Person Permissions"
    from:  person_permissions
    type:  left_outer
    relationship: many_to_one
    sql_on: ${person.person_wid} = ${person_permissions.person_wid} ;;
  }

  join: permission {
    view_label: "Person Permissions"
    from: day_dim
    relationship: many_to_one
    type: inner
    sql_on: ${person_permissions.permission_date_wid} = ${permission.row_wid} ;;
  }
  join: product {
    relationship: many_to_one
    type: inner
    sql_on: ${fact_net_new_person.product_wid} = ${product.row_wid};;
  }
  join: data_source {
    from:  data_source
    type: inner
    relationship: one_to_one
    sql_on: ${fact_net_new_person.data_source_wid} = ${data_source.row_wid} ;;
  }
}
