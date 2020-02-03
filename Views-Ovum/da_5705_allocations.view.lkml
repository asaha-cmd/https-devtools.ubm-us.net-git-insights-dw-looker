view: da_5705_allocations {
  label: "Ovum Allocations"
  sql_table_name: ovum.da_5705_allocations ;;

  dimension: account_key {
    type: number
    sql: ${TABLE}.account_key ;;
  }

  dimension: contract_key {
    type: number
    sql: ${TABLE}.contract_key ;;
  }

  dimension: line_nbr_dd {
    type: number
    sql: ${TABLE}.line_nbr_dd ;;
  }

  dimension: multiplier {
    type: number
    sql: ${TABLE}.multiplier ;;
  }

  dimension: source_file_key {
    type: number
    sql: ${TABLE}.source_file_key ;;
  }

  dimension: user_key {
    type: number
    sql: ${TABLE}.user_key ;;
  }

  measure: count_of_allocations {
    label: "Count of Allocations"
    type: count
    drill_fields: []
  }
}
