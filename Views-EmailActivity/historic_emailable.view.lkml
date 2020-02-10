view: historic_emailable {
derived_table: {
    sql:SELECT
  3 as rank,
        'Before 2 years ago' AS period,
        product.product_brand  AS "product_brand",
        COUNT(DISTINCT person.email_address ) AS "total_persons"
FROM cidw.fact_engagement  AS fact_engagement
INNER JOIN cidw.person_dim  AS person ON fact_engagement.person_wid = person.person_wid
INNER JOIN cidw.product_dim  AS product ON fact_engagement.brand_wid = product.row_wid
LEFT JOIN sandbox.hb_customer_insights_person_permissions AS person_permissions ON person.person_wid = person_permissions.person_wid
WHERE person.created_date_wid < to_number(to_char(DATEADD(month,-24,GETDATE()), 'YYYYMMDD'), '99999999')
    AND (person.hard_bounce = 'N'
    AND person.valid_email = 'Y'
    AND person.spam_trap = 'N'
    AND (NOT (person_permissions.status = 'Opt-Out' AND person_permissions.permission = 'Global'AND permission_date_wid < to_number(to_char(DATEADD(month,-24,GETDATE()), 'YYYYMMDD'), '99999999')))
    OR   person_permissions.status is null)
    AND product.product_brand in ('InformationWeek','Dark Reading', 'Network Computing', 'Gamasutra', 'Game Career Guide', 'No Jitter')
GROUP BY 1,2,3
UNION
SELECT
  4 as rank,
        'Before 1.5 years ago' AS period,
        product.product_brand  AS "product_brand",
        COUNT(DISTINCT person.email_address ) AS "total_persons"
FROM cidw.fact_engagement  AS fact_engagement
INNER JOIN cidw.person_dim  AS person ON fact_engagement.person_wid = person.person_wid
INNER JOIN cidw.day_dim  AS "create" ON person.created_date_wid = ("create".row_wid)
INNER JOIN cidw.product_dim  AS product ON fact_engagement.brand_wid = product.row_wid
LEFT JOIN sandbox.hb_customer_insights_person_permissions AS person_permissions ON person.person_wid = person_permissions.person_wid
WHERE person.created_date_wid < to_number(to_char(DATEADD(month,-18,GETDATE()), 'YYYYMMDD'), '99999999')
    AND (person.hard_bounce = 'N'
    AND person.valid_email = 'Y'
    AND person.spam_trap = 'N'
    AND (NOT (person_permissions.status = 'Opt-Out' AND person_permissions.permission = 'Global'AND permission_date_wid < to_number(to_char(DATEADD(month,-18,GETDATE()), 'YYYYMMDD'), '99999999')))
    OR   person_permissions.status is null)
    AND product.product_brand in ('InformationWeek','Dark Reading', 'Network Computing', 'Gamasutra', 'Game Career Guide', 'No Jitter')
GROUP BY 1,2,3
UNION
SELECT
  5 as rank,
        'Before 1 years ago' AS period,
        product.product_brand  AS "product_brand",
        COUNT(DISTINCT person.email_address ) AS "total_persons"
FROM cidw.fact_engagement  AS fact_engagement
INNER JOIN cidw.person_dim  AS person ON fact_engagement.person_wid = person.person_wid
INNER JOIN cidw.day_dim  AS "create" ON person.created_date_wid = ("create".row_wid)
INNER JOIN cidw.product_dim  AS product ON fact_engagement.brand_wid = product.row_wid
LEFT JOIN sandbox.hb_customer_insights_person_permissions AS person_permissions ON person.person_wid = person_permissions.person_wid
WHERE person.created_date_wid < to_number(to_char(DATEADD(month,-12,GETDATE()), 'YYYYMMDD'), '99999999')
    AND (person.hard_bounce = 'N'
    AND person.valid_email = 'Y'
    AND person.spam_trap = 'N'
    AND (NOT (person_permissions.status = 'Opt-Out' AND person_permissions.permission = 'Global'AND permission_date_wid < to_number(to_char(DATEADD(month,-12,GETDATE()), 'YYYYMMDD'), '99999999')))
    OR   person_permissions.status is null)
    AND product.product_brand in ('InformationWeek','Dark Reading', 'Network Computing', 'Gamasutra', 'Game Career Guide', 'No Jitter')
GROUP BY 1,2,3
UNION
SELECT
  6 as rank,
        'Before 1/2 years ago' AS period,
        product.product_brand  AS "product_brand",
        COUNT(DISTINCT person.email_address ) AS "total_persons"
FROM cidw.fact_engagement  AS fact_engagement
INNER JOIN cidw.person_dim  AS person ON fact_engagement.person_wid = person.person_wid
INNER JOIN cidw.day_dim  AS "create" ON person.created_date_wid = ("create".row_wid)
INNER JOIN cidw.product_dim  AS product ON fact_engagement.brand_wid = product.row_wid
LEFT JOIN sandbox.hb_customer_insights_person_permissions AS person_permissions ON person.person_wid = person_permissions.person_wid
WHERE person.created_date_wid < to_number(to_char(DATEADD(month,-6,GETDATE()), 'YYYYMMDD'), '99999999')
    AND (person.hard_bounce = 'N'
    AND person.valid_email = 'Y'
    AND person.spam_trap = 'N'
    AND (NOT (person_permissions.status = 'Opt-Out' AND person_permissions.permission = 'Global'AND permission_date_wid < to_number(to_char(DATEADD(month,-6,GETDATE()), 'YYYYMMDD'), '99999999')))
    OR   person_permissions.status is null)
    AND product.product_brand in ('InformationWeek','Dark Reading', 'Network Computing', 'Gamasutra', 'Game Career Guide', 'No Jitter')
GROUP BY 1,2,3
UNION
SELECT
  7 as rank,
        'Today' AS period,
        product.product_brand  AS "product_brand",
        COUNT(DISTINCT person.email_address ) AS "total_persons"
FROM cidw.fact_engagement  AS fact_engagement
INNER JOIN cidw.person_dim  AS person ON fact_engagement.person_wid = person.person_wid
INNER JOIN cidw.product_dim  AS product ON fact_engagement.brand_wid = product.row_wid
LEFT JOIN sandbox.hb_customer_insights_person_permissions AS person_permissions ON person.person_wid = person_permissions.person_wid
WHERE (person.hard_bounce = 'N'
    AND person.valid_email = 'Y'
    AND person.spam_trap = 'N'
    AND (NOT person_permissions.status = 'Opt-Out'
    AND person_permissions.permission = 'Global') or person_permissions.status is null)
    AND product.product_brand in ('InformationWeek','Dark Reading', 'Network Computing', 'Gamasutra', 'Game Career Guide', 'No Jitter')
GROUP BY 1,2,3
       ;;
      }
     dimension: Period {
       type: string
     }
    dimension: product_brand {
      type: string
    }
    dimension: total_persons {
      type: number
    }
  dimension: rank {
    type: number
  }
}
