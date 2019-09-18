view: audience_group {
 sql_table_name: cidw.audience_group_dim ;;

  dimension: row_wid {
    hidden: yes
    primary_key: yes
  type: number
  sql: ${TABLE}.row_wid ;;
  }

  dimension: audience_group_name {
    type: string
    sql: ${TABLE}.audience_group ;;
    description: "Name of the Audience Group"
  }
}
