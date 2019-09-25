view: dim_campaign {
  sql_table_name: cidw.dim_campaign ;;

  dimension: campaign_type {
    type: string
    sql: ${TABLE}.campaign_type ;;
  }

  dimension: created_date_wid {
    type: number
    sql: {TABLE}.created_date_wid ;;
  }

  dimension: data_source_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.data_source_wid ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: row_wid {
    hidden: yes
    type: number
    primary_key: yes
    value_format_name: id
    sql: ${TABLE}.row_wid ;;
  }

  measure: count {
    type: count
    label: "Campaign Count"
    drill_fields: [campaign_name]
  }
}
