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
    label: "{% assign words = _view._name | split: '_' %}{% for word in words %} {{ word | capitalize }}{% endfor %} Title"
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
    sql: CASE WHEN ${TABLE}.event_code is not null and ${TABLE}.event_code != '' THEN true ELSE false END;;
  }

  dimension: event_code {
    hidden:  yes
    description: "Event Code"
    sql: ${TABLE}.event_code ;;
  }

  dimension: currency_code {
    type: string
    sql: ${TABLE}.currency_code ;;
  }

  dimension: currency_multiplier {
    type: number
    sql: ${TABLE}.currency_multiplier ;;
  }

  dimension: venue_address_line_1 {
    type: string
    group_label: "Venue Address"
    sql: ${TABLE}.venue_address_line_1 ;;
  }

  dimension: venue_address_line_2 {
    type: string
    group_label: "Venue Address"
    sql: ${TABLE}.venue_address_line_2 ;;
  }

  dimension: venue_city {
    type: string
    group_label: "Venue Address"
    sql: ${TABLE}.venue_city ;;
  }

  dimension: venue_country {
    type: string
    group_label: "Venue Address"
    sql: ${TABLE}.venue_country ;;
  }

  dimension: venue_name {
    type: string
    group_label: "Venue Address"
    sql: ${TABLE}.venue_name ;;
  }

  dimension: venue_postal_code {
    type: string
    group_label: "Venue Address"
    sql: ${TABLE}.venue_postal_code ;;
  }

  dimension: venue_state {
    type: string
    group_label: "Venue Address"
    sql: ${TABLE}.venue_state ;;
  }

  dimension: end_date_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.end_date_wid ;;
    hidden:  yes
  }

  dimension: start_date_wid {
    type: number
    value_format_name: id
    sql: ${TABLE}.start_date_wid ;;
    hidden:  yes
  }

  dimension: brand_list_it {
    label: "Brand List (IT)"
    hidden: yes
    case: {
      when: {
        sql: ${product_brand} = 'Dark Reading' ;;
        label: "Dark Reading"
      }
      when: {
        sql: ${product_brand} = 'InformationWeek' ;;
        label: "InformationWeek"
      }
      when: {
        sql: ${product_brand} = 'Interop' ;;
        label: "InformationWeek"
      }
      when: {
        sql: ${product_brand} ILIKE 'Enterprise%' ;;
        label: "InformationWeek"
      }
      when: {
        sql: ${product_brand} = 'Network Computing' ;;
        label: "Network Computing"

      }
      when: {
        sql: ${product_brand} = 'GDC' ;;
        label: "Gamasutra"
      }
      when: {
        sql: ${product_brand} = 'Gamasutra' ;;
        label: "Gamasutra"
      }
      when: {
        sql: ${product_brand} = 'Game Career Guide' ;;
        label: "Game Career Guide"
      }
      when: {
        sql: ${product_brand} = 'No Jitter' ;;
        label: "No Jitter"
      }
    }
  }

  filter: it_media_brands {
    label: "Brands IT Media"
    type: string
    suggest_dimension: product.brand_list_it
    sql: {% condition it_media_brands %} ${product_brand} {% endcondition %} ;;
  }


}
