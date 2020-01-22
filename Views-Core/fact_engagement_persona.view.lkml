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
      url: "/dashboards/35?Engagement%20Type={{ value | url_encode }}&Company={{_filters['person.company'] | url_encode }}&Industry={{_filters['person.industry'] | url_encode }}&Job%20Function={{_filters['person.job_function'] | url_encode }}&Job%20Level={{_filters['person.job_level'] | url_encode }}&Engagement%20Year={{_filters['engagement.calendar_year'] | url_encode }}&Audience%20Group={{_filters['fact_engagement_persona.audience_group'] | url_encode }}"
    }
  }
}
