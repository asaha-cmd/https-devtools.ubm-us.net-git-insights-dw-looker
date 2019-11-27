view: data_source {
  sql_table_name: cidw.data_source_dim ;;

  dimension: row_wid {
    primary_key: yes
    hidden:  yes
    description: "Unique ID for each data source"
    type: number
    sql: ${TABLE}.row_wid ;;
  }

  dimension: data_source_name {
    type: string
    sql: ${TABLE}.data_source_name ;;
    description: "Name of the Data Source"
  }

  dimension: data_source_code {
    type: string
    sql:  ${TABLE}.data_source_code ;;
    description: "Code value for matching the data source"
  }
}
