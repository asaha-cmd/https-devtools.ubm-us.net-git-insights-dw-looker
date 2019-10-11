view: asset_dim {
  sql_table_name: cidw.asset_dim ;;

  dimension: asset_src_sys_id {
    type: string
    sql: ${TABLE}.asset_src_sys_id ;;
    hidden: yes
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: data_source_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.data_source_wid ;;
    hidden: yes
  }

  dimension: etl_process_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.etl_process_wid ;;
    hidden: yes
  }

  dimension: row_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.row_wid ;;
    hidden: yes
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
    case_sensitive: no
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: warehouse_date_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.warehouse_date_wid ;;
    hidden:  yes
  }

  dimension: keyword {
    type: string
    sql:
      CASE
        when upper(${title}) like upper('% AI %') then 'AI'
        when upper(${title}) like upper('% System %') then 'System'
        when upper(${title}) like upper('% CTO %') then 'CTO'
        when upper(${title}) like upper('% LAN %') then 'LAN'
        when upper(${title}) like upper('% Data %') then 'Data'
        when upper(${title}) like upper('% Cloud %') then 'Cloud'
        when upper(${title}) like upper('% Engineer %') then 'Engineer'
        when upper(${title}) like upper('% Manager %') then 'Manager'
        when upper(${title}) like upper('% CIO %') then 'CIO'
        when upper(${title}) like upper('% Director %') then 'Director'
        when upper(${title}) like upper('% Development %') then 'Development'
        when upper(${title}) like upper('% Network %') then 'Network'
        when upper(${title}) like upper('% Architect %') then 'Architect'
        when upper(${title}) like upper('% Applications %') then 'Applications'
        when upper(${title}) like upper('% Infrastructure %') then 'Infrastructure'
        when upper(${title}) like upper('% Lead %') then 'Lead'
        when upper(${title}) like upper('% VP %') then 'VP'
        when upper(${title}) like upper('% Linux %') then 'Linux'
        when upper(${title}) like upper('% API %') then 'API'
        when upper(${title}) like upper('% Security %') then 'Security'
      END;;
      drill_fields: [title]
  }
  measure: asset_count {
    type: count
    drill_fields: [title,type]
  }
  measure: asset_count_distinct {
    type: count_distinct
    sql: ${row_wid} ;;
    drill_fields: [title,type]
  }
}
