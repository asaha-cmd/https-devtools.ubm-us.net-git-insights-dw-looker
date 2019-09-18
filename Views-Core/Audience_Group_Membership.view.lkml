view: audience_group_membership {
  sql_table_name: cidw.audience_group_membership_fact ;;
  dimension: audience_group_wid {
    hidden: yes
    type: number
    sql: ${TABLE}.audience_group_wid ;;
  }
  dimension: person_wid {
    hidden: yes
    type: number
    sql: ${TABLE}.person_wid ;;
  }
  dimension: data_source_wid {
    hidden: yes
    type: number
    sql: ${TABLE}.data_source_wid ;;
  }
  dimension: product_wid {
    hidden: yes
    type: number
    sql: ${TABLE}.product_wid ;;
  }
  dimension: membership_date_wid {
    hidden: yes
    type: number
    sql: ${TABLE}.membership_date_wid ;;
  }
  }
