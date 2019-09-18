view: product {
  sql_table_name: cidw.product_dim ;;

  dimension: row_wid {
    primary_key: yes
    hidden:  yes
    description: "Unique ID for each product"
    type: number
    sql: ${TABLE}.row_wid ;;
  }

  dimension: product_title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: level {
    type: string
    sql: ${TABLE}.product_level ;;
  }
  dimension: product_group {
    type: string
    sql: ${TABLE}.product_group ;;
    drill_fields: [product_network,product_brand,product_title]
  }
  dimension: product_network {
    type: string
    sql: ${TABLE}.product_network ;;
    drill_fields: [product_brand,product_title]
    }
  dimension: product_brand {
    type: string
    sql: ${TABLE}.product_brand ;;
    drill_fields: [product_title]
    }

  dimension: is_event {
    type:  yesno
    sql: CASE WHEN ${TABLE}.event_code is not null THEN true ELSE false END;;
  }

  dimension: event_code {
    hidden:  yes
    description: "Event Code"
    sql: ${TABLE}.event_code ;;
  }
}
