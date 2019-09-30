view: email_send_by_person {
  derived_table: {
    sql: SELECT
        email_send.person_wid  AS "person_wid",
        email_send.email_wid AS "email_wid",
        COUNT(*) AS "send_count"
      FROM cidw.fact_email_send  AS email_send
      WHERE (email_send.person_wid IS NOT NULL AND email_send.person_wid <> 0)
      GROUP BY 1, 2 ;;
  }

  dimension: person_wid {
    primary_key: yes
    hidden: yes
    type:  number
    sql: ${TABLE}.person_wid ;;
  }

  dimension: email_wid {
    hidden:  yes
    type: number
    sql: ${TABLE}.email_wid ;;
  }

  dimension: send_count {
    type: number
    sql: COALESCE(${TABLE}.send_count,0) ;;
  }

  parameter: send_count_bucket_size {
    type: number
  }

  dimension: send_count_tiered {
    type: tier
    style: integer
    tiers: [0,10,50,100,500]
    sql: ${send_count} ;;
  }

  dimension: dynamic_send_count {
    type: number
    sql: TRUNC(${TABLE}.send_count / {% parameter send_count_bucket_size %}, 0)
      * {% parameter send_count_bucket_size %} ;;
  }
}
