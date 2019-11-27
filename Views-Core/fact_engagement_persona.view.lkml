include: "/Views-Core/fact_engagement.view"

view: fact_engagement_persona {
  extends: [fact_engagement]
  sql_table_name: cidw.fact_engagement ;;

  dimension: engagement_type {
    type: string
    sql: ${TABLE}.engagement_type ;;
    link: {
      label: "Engagement Details View"
      url: "https://looker-us.ubmits.com:9999/dashboards/35?Engagement Type={{ value | url_encode }}&Le Company={{_filters['person.company'] | url_encode }}&Industry={{_filters['person.industry'] | url_encode }}&Job Function={{_filters['person.job_function'] | url_encode }}&Job Level={{_filters['person.job_level'] | url_encode }}"
    }
  }
}
