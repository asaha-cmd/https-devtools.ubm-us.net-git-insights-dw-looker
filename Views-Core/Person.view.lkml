view: person {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: cidw.person_dim ;;
  #
  # # Define your dimensions and measures here, like this:
  dimension: person_wid {
    primary_key: yes
    hidden:  yes
    description: "Unique ID for each person"
    type: number
    sql: ${TABLE}.person_wid ;;
  }

  dimension: first_name {
    hidden: yes
    description: "First Name"
    type: string
    sql:  ${TABLE}.first_name ;;
  }

  dimension: last_name {
    hidden:  yes
    description: "Last Name"
    type: string
    sql:  ${TABLE}.last_name ;;
  }

  dimension: email_address {
    description: "Email Address"
    type: string
    sql: ${TABLE}.email_address ;;
    required_access_grants: [can_access_email_address]
  }

  dimension: is_email_valid {
    description: "Yes/No whether email address is considered valid"
    type: yesno
    sql:  CASE WHEN ${TABLE}.valid_email = 'Y' THEN true ELSE false END;;
  }

  dimension: initial_data_source_wid {
    hidden:  yes
    description: "Initial Data Source ID for each person"
    type: number
    sql: ${TABLE}.initial_data_source_wid ;;
  }

  dimension: created_date_wid {
    hidden:  yes
    description: "Create data for the Person"
    type: number
    sql: ${TABLE}.created_date_wid ;;

  }

  dimension: last_engagement_date_wid {
    hidden:  yes
    description: "Last Engagement Date for a Person"
    type: number
    sql: ${TABLE}.last_engagement_date_wid ;;
  }

  dimension: last_engagement_type {
    description: "Type of Last Engagement"
    type:  string
    sql: ${TABLE}.last_engagement_type ;;
  }

dimension: city {
  group_label: "Address"
  type: string
  sql: ${TABLE}.city ;;
}
  dimension: state {
    group_label: "Address"
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: postal_code {
    group_label: "Address"
    type: string
    sql: ${TABLE}.postal_code ;;
  }
  dimension: country {
    group_label: "Address"
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: hard_bounced {
    type: yesno
    description: "Hard Bounce of Person's Email Address"
    sql: CASE WHEN ${TABLE}.email_status = 'N' THEN true ELSE false END ;;
  }

  dimension_group: hard_bounced_modified {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    description: "Hard Bounce Flag Modification"
    sql: ${TABLE}.email_status_modified_date ;;
  }

  measure: number_of_people {
    type: count
    description: "Count of People"
  }

  measure: number_of_distinct_people_by_email_address {
    type: count_distinct
    description: "Count of Distinct People by Email Address"
    sql_distinct_key: ${email_address} ;;
  }
}
