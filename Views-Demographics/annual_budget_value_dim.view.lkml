view: annual_budget_value_dim {
  sql_table_name: cidw.annual_budget_value_dim ;;

  dimension: code_data_source_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.code_data_source_wid ;;
  }

  dimension: original_code {
    type: string
    hidden: yes
    sql: ${TABLE}.original_code ;;
  }

  dimension: product_wid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.product_wid ;;
  }

  dimension: row_wid {
    type: number
    value_format_name: id
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.row_wid ;;
  }

  dimension: original_name {
    label: "Original Value"
    description: "Value entered or selected by user"
    type: string
    sql: ${TABLE}.original_name ;;
  }

  dimension: standard_name {
    label: "Standardize Value"
    description: "Mapped value of user entry"
    type: string
    sql: ${TABLE}.standard_name ;;
  }

  dimension: original_annual_budget{
    label: "Annual Budget Name from Form"
    description: "Value entered or selected by user"
    type: string
    sql: ${TABLE}.original_name ;;
  }

  dimension: standard_annual_budget {
    label: "Annual Budget Standardize Value"
    description: "Mapped value of user entry"
    type: string
    sql: ${TABLE}.standard_name ;;
  }

  measure: term_count {
    description: "Count of Demographic values."
    type: count
    drill_fields: [standard_name, original_name]
  }
}
