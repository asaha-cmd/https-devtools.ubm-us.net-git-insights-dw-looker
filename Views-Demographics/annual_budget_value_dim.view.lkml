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
    label: "{%if _view._name contains 'value_dim' %} Value From Form {% else %} {% assign words = _view._name | split:'_' %}
    {% for word in words %} {{word | capitalize }} {% endfor %} from Form{% endif %}"
    #label: "Original Value"
    description: "Value entered or selected by user"
    type: string
    sql: ${TABLE}.original_name ;;
  }

  dimension: standard_name {
    label: "{%if _view._name contains 'value_dim' %} Standard Value {% else %} {% assign words = _view._name | split:'_' %}
    {% for word in words %} {{word | capitalize }} {% endfor %} Standard Value{% endif %}"
    description: "Mapped value of user entry"
    type: string
    sql: ${TABLE}.standard_name ;;
    drill_fields: [original_name]
  }

  measure: standard_count {
    description: "Count of Standard Demographic values."
    label: "{% assign words = _field._name | replace: '.', '_' | split: '_' %}{% for word in words %} {{ word | capitalize }}{% endfor %} "
    type: count_distinct
    sql: ${TABLE}.standard_name ;;
    drill_fields: [standard_count, original_name]
  }
  measure: original_count {
    description: "Count of Original Demographic values."
    label: "{% assign words = _field._name | replace: '.', '_' | split: '_' %}{% for word in words %} {{ word | capitalize }}{% endfor %} "
    type: count_distinct
    sql: ${TABLE}.original_name ;;
    drill_fields: [original_name]
  }
}
