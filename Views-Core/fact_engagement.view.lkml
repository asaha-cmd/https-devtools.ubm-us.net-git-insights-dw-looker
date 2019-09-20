view: fact_engagement {
  sql_table_name: cidw.fact_engagement ;;

  dimension: asset_name {
    type: string
    sql: ${TABLE}.asset_name ;;
  }

  dimension: asset_table_source {
    hidden:  yes
    type: string
    sql: ${TABLE}.asset_table_source ;;
  }

  dimension: asset_type {
    type: string
    sql: ${TABLE}.asset_type ;;
  }

  dimension: asset_wid {
    hidden:  yes
    type: number
    value_format_name: id
    sql: ${TABLE}.asset_wid ;;
  }

  dimension: audience_group {
    type: string
    sql: ${TABLE}.audience_group ;;
  }

  dimension: audience_group_wid {
    hidden:  yes
    type: number
    value_format_name: id
    sql: ${TABLE}.audience_group_wid ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name ;;
  }

  dimension: brand_wid {
    hidden:  yes
    type: number
    value_format_name: id
    sql: ${TABLE}.brand_wid ;;
  }

  dimension: data_source_name {
    hidden:  yes
    type: string
    sql: ${TABLE}.data_source_name ;;
  }

  dimension: data_source_wid {
    hidden:  yes
    type: number
    value_format_name: id
    sql: ${TABLE}.data_source_wid ;;
  }

  dimension: engagement_date_wid {
    hidden:  yes
    type: number
    value_format_name: id
    sql: ${TABLE}.engagement_date_wid ;;
  }

  dimension: engagement_link {
    hidden:  yes
    type: number
    sql: ${TABLE}.engagement_link ;;
  }

  dimension: engagement_status {
    hidden:  yes
    type: string
    sql: ${TABLE}.engagement_status ;;
  }

  dimension: engagement_table_source {
    hidden:  yes
    type: string
    sql: ${TABLE}.engagement_table_source ;;
  }

  dimension_group: engagement_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.engagement_timestamp ;;
  }

  dimension: engagement_type {
    type: string
    sql: ${TABLE}.engagement_type ;;
  }

  dimension: interaction_flag {
    type: number
    sql: ${TABLE}.interaction_flag ;;
  }

  dimension: permission_flag {
    type: number
    sql: ${TABLE}.permission_flag ;;
  }

  dimension: person_wid {
    hidden:  yes
    type: number
    value_format_name: id
    sql: ${TABLE}.person_wid ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: promotion_type {
    type: string
    sql: ${TABLE}.promotion_type ;;
  }

  dimension: registration_flag {
    type: number
    sql: ${TABLE}.registration_flag ;;
  }

  dimension: site_name {
    type: string
    sql: ${TABLE}.site_name ;;
  }

  dimension: site_wid {
    hidden:  yes
    type: number
    value_format_name: id
    sql: ${TABLE}.site_wid ;;
  }

  measure: count {
    type: count
    drill_fields: [site_name, asset_name, product_name, brand_name]
  }
}
