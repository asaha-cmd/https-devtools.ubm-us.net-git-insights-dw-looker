connection: "production_redshift_-_informatica_user"

include: "Views-Core/*.view.lkml"

label: "People"

explore: person {
  join: data_source {
    relationship: one_to_one
    sql_on: ${person.initial_data_source_id} = ${data_source.row_wid} ;;
  }

  join: creation_day_dim {
    view_label: "Person Create Date"
    from:  day_dim
    type: left_outer
    relationship: one_to_one
    sql_on: ${creation_day_dim.row_wid} = ${person.created_date_wid} ;;
  }

  join: last_engagement_day_dim {
    view_label: "Person Last Engagement Date"
    from:  day_dim
    type: left_outer
    relationship: one_to_one
    sql_on: ${last_engagement_day_dim.row_wid} = ${person.created_date_wid} ;;
  }
}

explore: person_audience_group_membership {
  from: audience_group_membership
  join: person {
    relationship: one_to_one
    sql_on: ${person_audience_group_membership.person_id} = ${person.person_wid} ;;
  }
  join: audience_group {
    relationship: one_to_one
    sql_on: ${person_audience_group_membership.audience_group_id} = ${audience_group.row_wid} ;;
  }
  join: membership_day_dim {
    view_label: "Audience Membership Date"
    from: day_dim
    type: left_outer
    relationship: one_to_one
    sql_on: ${person_audience_group_membership.membership_date_id} = ${membership_day_dim.row_wid}day_dim.row_wid} ;;
  }
  join: creation_day_dim {
    view_label: "Person Create Date"
    from:  day_dim
    type: left_outer
    relationship: one_to_one
    sql_on: ${creation_day_dim.row_wid} = ${person.created_date_wid} ;;
  }
join: last_engagement_day_dim {
  view_label: "Person Last Engagement Date"
  from:  day_dim
  type: left_outer
  relationship: one_to_one
  sql_on: ${last_engagement_day_dim.row_wid} = ${person.created_date_wid} ;;
}
}

view: audience_group_membership {
  sql_table_name: cidw.audience_group_membership_fact ;;
  dimension: audience_group_id {
    hidden: yes
    type: number
    sql: ${TABLE}.audience_group_wid ;;
  }
  dimension: person_id {
    hidden: yes
    type: number
    sql: ${TABLE}.person_wid ;;
  }
  dimension: data_source_id {
    hidden: yes
    type: number
    sql: ${TABLE}.data_source_wid ;;
  }
  dimension: product_id {
    hidden: yes
    type: number
    sql: ${TABLE}.product_wid ;;
  }
  dimension: membership_date_id {
    hidden: yes
    type: number
    sql: ${TABLE}.membership_date_wid ;;
  }
}
