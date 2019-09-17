view: person {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: cidw.person_dim ;;
  #
  # # Define your dimensions and measures here, like this:
  dimension: person_ID {
    primary_key: yes
    hidden:  yes
    description: "Unique ID for each person"
    type: number
    sql: ${TABLE}.person_wid ;;
  }

  dimension: first_name {
    description: "First Name"
    type: string
    sql:  ${TABLE}.first_name ;;
  }

  dimension: last_name {
    description: "Last Name"
    type: string
    sql:  ${TABLE}.last_name ;;
  }

  dimension: email_address {
    hidden: yes
    description: "Email Address"
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: is_email_valid {
    description: "Yes/No whether email address is considered valid"
    type: yesno
    sql:  CASE WHEN ${TABLE}.valid_email = 'Y' THEN true ELSE false END;;
  }

  dimension: initial_data_source_id {
    hidden:  yes
    description: "Initial Data Source ID for each person"
    type: number
    sql: ${TABLE}.initial_data_source_wid ;;
  }

  measure: count {
    type: count
    description: "Count of People"
  }
}
