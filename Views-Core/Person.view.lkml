view: person {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: cidw.person_dim ;;
  #
  # # Define your dimensions and measures here, like this:
  dimension: person_wid {
    label: "PersonID"
    primary_key: yes
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

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: email_address_domain {
    type: string
    sql: ${TABLE}.email_domain ;;
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
    map_layer_name: us_states
    sql: ${TABLE}.state ;;
    drill_fields: [city]
  }
  dimension: postal_code {
    group_label: "Address"
    type: string
    sql: ${TABLE}.postal_code ;;
  }
  dimension: country {
    group_label: "Address"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
    drill_fields: [state]
  }

  dimension: spam_trap {
    alias: [not_supressed]
    description: "Yes/No whether email address is in a spam list"
    label: "Spam Trap Suppression"
    type: yesno
    sql:  CASE WHEN ${TABLE}.spam_trap = 'Y' THEN true ELSE false END;;
  }

  dimension: hard_bounced {
    type: yesno
    description: "Yes/No whether email address has Hard Bounced in Eloqua"
    sql: CASE WHEN ${TABLE}.hard_bounce = 'Y' THEN true ELSE false END ;;
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
    sql: ${TABLE}.hard_bounce_modified_date ;;
  }

  dimension: pending_delete {
    type:  string
  }


  dimension: job_title {
    type:  string
  }


  dimension: job_function {
    type:  string
  }


  dimension: job_level {
    type:  string
  }


  dimension: industry {
    type:  string
  }

  dimension: emailable {
    type: yesno
    sql: ${person.hard_bounced} = 'Y'
      AND ${person.is_email_valid} = 'Y'
      AND (${person.pending_delete} = '' or ${person.pending_delete} is null)
      AND ${person.spam_trap} = 'N'
      AND NOT (${person_permissions.status} = 'Opt-Out'
      AND ${person_permissions.permission} = 'Global') ;;
  }

  measure: number_of_people {
    type: count
    description: "Count of People"
  }

  measure: number_of_distinct_people_by_email_address {
    label: "Count of Distinct Persons for {% assign words = _explore._name | split: '_' %}{% for word in words %} {{ word | capitalize }}{% endfor %}"
    type: count_distinct
    description: "Count of Distinct People by Email Address"
    sql: ${email_address} ;;
  }

  set: demographic_fields {
    fields: [is_email_valid,company, spam_trap, hard_bounced, pending_delete,number_of_people]
    }
}
