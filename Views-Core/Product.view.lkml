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
  }
  dimension: product_network {
    type: string
    sql: ${TABLE}.product_network ;;
  }
  dimension: product_brand {
    type: string
    sql: ${TABLE}.product_brand ;;
  }

  dimension: is_event {
    type:  yesno
    sql: CASE WHEN ${TABLE}.event_code is not null THEN true ELSE false END;;
  }

  dimension: event_code {
    description: "Event Code"
    sql: ${TABLE}.event_code ;;
  }
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}
