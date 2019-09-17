view: data_source {
  sql_table_name: cidw.data_source_dim ;;

  dimension: data_source_ID {
    primary_key: yes
    hidden:  yes
    description: "Unique ID for each data source"
    type: number
    sql: ${TABLE}.row_wid ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.data_source_name ;;
    description: "Name of the Data Source"
  }
}
