view: event_pass_dim {
  sql_table_name: cidw.event_pass_dim ;;

  dimension: data_source_wid {
    hidden:  yes
    type: number
    value_format_name: id
    sql: ${TABLE}.data_source_wid ;;
  }

  dimension: pass_name {
    type: string
    sql: ${TABLE}.pass_name ;;
    link: {
      label: "Demographics details"
      url: "https://looker-us.ubmits.com/dashboards/101?Pass={{ value }}&Brand={{ _filters['product.product_brand'] | url_encode }}&Event Start Year={{ _filters['product_start.calendar_year'] | url_encode }}&Payment Status={{ _filters['event_registration_dim.payment_status'] | url_encode }}&Registration Status={{ _filters['event_registration_dim.registration_status'] | url_encode }}"
    }
    link: {
      label: "Acquisition Channel"
      url: "https://looker-us.ubmits.com/looks/386?&f[event_pass_dim.pass_name]={{ value }}&f[product.product_brand]={{ _filters['product.product_brand'] | url_encode }}&f[product_start.calendar_year]={{ _filters['product_start.calendar_year'] | url_encode }}&Payment Status={{ _filters['event_registration_dim.payment_status'] | url_encode }}&Registration Status={{ _filters['event_registration_dim.registration_status'] | url_encode }}"
    }
    link: {
      label: "Company Yield and %Discount"
      url: "https://looker-us.ubmits.com/looks/383?&f[event_pass_dim.pass_name]={{ value }}&f[product.product_brand]={{ _filters['product.product_brand'] | url_encode }}&f[product_start.calendar_year]={{ _filters['product_start.calendar_year'] | url_encode }}&Payment Status={{ _filters['event_registration_dim.payment_status'] | url_encode }}&Registration Status={{ _filters['event_registration_dim.registration_status'] | url_encode }}"
    }

    link: {
      label: "Yield and %Discount - Correlation"
      url: "https://looker-us.ubmits.com/looks/384?&f[event_pass_dim.pass_name]={{ value }}&f[product.product_brand]={{ _filters['product.product_brand'] | url_encode }}&f[product_start.calendar_year]={{ _filters['product_start.calendar_year'] | url_encode }}&Payment Status={{ _filters['event_registration_dim.payment_status'] | url_encode }}&Registration Status={{ _filters['event_registration_dim.registration_status'] | url_encode }}"
    }
    link: {
      label: "Email clicks for Brand"
      url: "https://looker-us.ubmits.com/looks/356?&f[product.product_brand]={{ _filters['product.product_brand'] | url_encode }}"
    }
  }

  dimension: pass_type {
    type: string
    sql: ${TABLE}.pass_type ;;
  }

  dimension: primary_pass {
    type: yesno
    description: "Is this a Primary Pass"
    sql: CASE WHEN ${TABLE}.primary_pass = 'Y' THEN true ELSE false END ;;
  }

  dimension: primary_pass_name {
    type: string
    sql: CASE WHEN ${TABLE}.primary_pass = 'Y' THEN ${TABLE}.pass_name ELSE null END;;
  }

  dimension: product_wid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.product_wid ;;
  }

  dimension: row_wid {
    hidden:  yes
    primary_key: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.row_wid ;;
  }
}
