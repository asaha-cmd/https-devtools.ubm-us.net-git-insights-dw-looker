view: job_level_value_dim {
  sql_table_name: cidw.job_level_value_dim ;;

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

  dimension: original_name {
    label: "{%if _view._name contains 'value_dim' %} Value From Form {% else %} {% assign words = _view._name | split:'_' %}
    {% for word in words %} {{word | capitalize }} {% endfor %} from Form{% endif %}"
    description: "Value entered or selected by user"
    type: string
    sql: ${TABLE}.original_name ;;
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

  dimension: standard_name {
    label: "{%if _view._name contains 'value_dim' %} Standard Value {% else %} {% assign words = _view._name | split:'_' %}
    {% for word in words %} {{word | capitalize }} {% endfor %} Standard Value{% endif %}"
    description: "Mapped value of user entry"
    type: string
    sql: ${TABLE}.standard_name ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [standard_name, original_name]
  }
}
