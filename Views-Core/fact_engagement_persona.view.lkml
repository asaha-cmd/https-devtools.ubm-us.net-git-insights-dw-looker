include: "/Views-Core/fact_engagement.view"

view: fact_engagement_persona {
  extends: [fact_engagement]
  sql_table_name: cidw.fact_engagement ;;

  dimension: engyear {
    type: number
    sql: ${engagement_timestamp_year} ;;
  }

  dimension: engagement_type {
    type: string
    sql: ${TABLE}.engagement_type ;;
    link: {
      label: "Engagement Details View"
      url: "/dashboards/35?Engagement%20Type={{ value | url_encode }}&Company={{_filters['person.company'] | url_encode }}&Industry={{_filters['industry_value_dim.standard_name'] | url_encode }}&Job%20Function={{_filters['job_function_value_dim.standard_name'] | url_encode }}&Job%20Level={{_filters['job_level_value_dim.standard_name'] | url_encode }}&Engagement%20Year={{_filters['engagement.calendar_year'] | url_encode }}&Audience%20Group={{_filters['fact_engagement_persona.audience_group'] | url_encode }}"
    }
  }
}
