view: da_5705_contracts {
  label: "Ovum Contracts"
  sql_table_name: ovum.da_5705_contracts ;;

  dimension_group: contract_end {
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
    sql: ${TABLE}.contract_end_date ;;
  }

  dimension: contract_key {
    type: number
    primary_key: yes
    sql: ${TABLE}.contract_key ;;
  }

  dimension_group: contract_start {
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
    sql: ${TABLE}.contract_start_date ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: purchaser_email_address {
    type: string
    sql: ${TABLE}.purchaser_email_address ;;
  }

  measure: count {
    label: "Count of Contracts"
    type: count
    drill_fields: [product_name]
  }
}
