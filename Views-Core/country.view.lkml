view: country {
  sql_table_name: cidw.country ;;

  dimension: continent_iso {
    type: string
    hidden: yes
    sql: ${TABLE}.continent_iso ;;
  }

  dimension: continent_name {
    type: string
    sql: ${TABLE}.continent_name ;;
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}.country_name ;;
  }

  dimension: iso_alpha2 {
    type: string
    hidden: yes
    sql: ${TABLE}.iso_alpha2 ;;
  }

  dimension: iso_alpha3 {
    type: string
    hidden: yes
    sql: ${TABLE}.iso_alpha3 ;;
  }

  dimension: iso_code {
    type: number
    hidden: yes
    sql: ${TABLE}.iso_code ;;
  }

  dimension: row_wid {
    type: number
    value_format_name: id
    primary_key:yes
    hidden: yes
    sql: ${TABLE}.row_wid ;;
  }

  measure: count {
    type: count
  }
}
