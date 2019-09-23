view: product_interests_value_dim {
  sql_table_name: cidw.product_interests_value_dim ;;

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
    label: "Value from Form"
    description: "Value entered or selected by user"
    type: string
    sql: ${TABLE}.original_name ;;
  }

  dimension: standard_name {
    type: string
    sql: ${TABLE}.standard_name ;;
  }

  dimension: original_product_interests {
    label: "Product Interests Value from Form"
    description: "Value entered or selected by user"
    type: string
    sql: ${TABLE}.original_name ;;
  }

  dimension: standard_product_interests {
    label: "Product Interests Standardize Value"
    description: "Mapped value of user entry"
    type: string
    sql: ${TABLE}.standard_name ;;
  }
  measure: count {
    type: count
    drill_fields: [standard_name, original_name]
  }
}
