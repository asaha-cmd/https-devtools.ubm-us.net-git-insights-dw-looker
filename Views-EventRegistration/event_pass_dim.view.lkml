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
