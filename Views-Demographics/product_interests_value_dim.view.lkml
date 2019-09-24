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
    label: "{% assign words = _view._name | split:'_' %}
    {% for word in words %} {{word | capitalize }} {% endfor %} from Form"
    description: "Value entered or selected by user"
    type: string
    sql: ${TABLE}.original_name ;;
  }

  dimension: standard_name {
    label: "{% assign words = _view._name | split:'_' %}
    {% for word in words %} {{word | capitalize }} {% endfor %} Standardized Value"
    type: string
    sql: ${TABLE}.standard_name ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [standard_name, original_name]
  }
}
