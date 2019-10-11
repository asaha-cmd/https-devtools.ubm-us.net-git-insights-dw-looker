view: activity_code_dim {
  sql_table_name: cidw.activity_code_dim ;;

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: pick_list_code_a {
    type: string
    case: {
      when: {
        sql: ${code} ilike 'nl_%' ;;
        label: "NL"
      }
      when: {
        sql: ${code} ilike 'we_%' ;;
        label: "WE"
      }
      when: {
        sql: ${code} ilike 'em_%' ;;
        label: "EM"
      }
      # possibly more when statements
      else: "No matching code"
    }
  }

  dimension: code_source {
    type: string
    sql: ${TABLE}.code_source ;;
  }

  dimension: code_type {
    type: string
    sql: ${TABLE}.code_type ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: row_wid {
    hidden:  yes
    primary_key: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.row_wid ;;
  }

  measure: count {
    type: count
    drill_fields: [asset_dim.title, code, code_type, code_source, pick_list_code_a]
  }
}
