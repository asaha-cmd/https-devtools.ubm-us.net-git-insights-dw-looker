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
        sql: ${code} ilike 'clnt%' ;;
        label: "Client"
      }
      when: {
        sql: ${code} ilike 'nl%' ;;
        label: "Newsletter"
      }
      when: {
        sql: ${code} ilike 'tydl%' ;;
        label: "Tech Library"
      }
      when: {
        sql: ${code} ilike 'dlrr%' ;;
        label: "Tech Library"
      }
      when: {
        sql: ${code} ilike 'mp_%' ;;
        label: "Media Placement"
      }
      # possibly more when statements
      else: "Other"
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
