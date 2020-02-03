view: da_5705_accounts {
  label: "Ovum Accounts"
  sql_table_name: ovum.da_5705_accounts ;;

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_key {
    type: number
    primary_key: yes
    sql: ${TABLE}.account_key ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
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

  dimension: sub_industry {
    type: string
    sql: ${TABLE}.sub_industry ;;
  }

  measure: count_of_accounts {
    label: "Count of Accounts"
    type: count
    drill_fields: [account_name]
  }
}
