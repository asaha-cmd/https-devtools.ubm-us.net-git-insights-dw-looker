include: "/Views-Core/*.view.lkml"

explore: fact_engagement {
  label: "Engagement"
  view_label: "Engagement"
  description: "Consildated positive engagement data"

  join: engagement_date {
    from: day_dim
    relationship: many_to_one
    type: inner
    sql_on: ${fact_engagement.engagement_date_wid} = ${engagement_date.row_wid};;
  }

  join: person {
    relationship: many_to_one
    type: inner
    sql_on: ${fact_engagement.person_wid} = ${person.person_wid} ;;
  }

  join: product {
    relationship: many_to_one
    type: inner
    sql_on: ${fact_engagement.brand_wid} = ${product.row_wid};;
  }

  join: person_initial_data_source {
    from:  data_source
    type: inner
    relationship: one_to_one
    sql_on: ${person.initial_data_source_wid} = ${person_initial_data_source.row_wid} ;;
  }
}
