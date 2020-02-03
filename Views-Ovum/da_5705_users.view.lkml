view: da_5705_users {
  label: "Ovum Users"
  sql_table_name: ovum.da_5705_users ;;

  dimension: contact_address_1 {
    type: string
    sql: ${TABLE}.contact_address_1 ;;
  }

  dimension: contact_address_2 {
    type: string
    sql: ${TABLE}.contact_address_2 ;;
  }

  dimension: contact_city {
    type: string
    sql: ${TABLE}.contact_city ;;
  }

  dimension: contact_country_id {
    type: string
    sql: ${TABLE}.contact_country_id ;;
  }

  dimension: contact_county {
    type: string
    sql: ${TABLE}.contact_county ;;
  }

  dimension: contact_family_name {
    type: string
    sql: ${TABLE}.contact_family_name ;;
  }

  dimension: contact_given_name {
    type: string
    sql: ${TABLE}.contact_given_name ;;
  }

  dimension: contact_postcode {
    type: string
    sql: ${TABLE}.contact_postcode ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: job_title {
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension_group: record_valid_from {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.record_valid_from ;;
  }

  dimension_group: record_valid_to {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.record_valid_to ;;
  }

  dimension_group: user_creation {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.user_creation_date ;;
  }

  dimension: user_key {
    type: number
    primary_key: yes
    sql: ${TABLE}.user_key ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.user_name ;;
  }

  measure: count_of_users {
    label: "Count of Users"
    type: count
    drill_fields: [contact_family_name, contact_given_name, user_name]
  }
}
