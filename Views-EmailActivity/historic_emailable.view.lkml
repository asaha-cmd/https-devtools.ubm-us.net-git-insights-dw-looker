view: historic_emailable {
derived_table: {
    sql: --SELECT
--  1 as rank,
--  'Before 3 years ago' AS period,
--  product.product_brand  AS "product_brand",
--  COUNT(DISTINCT person.email_address ) AS "total_persons"
--FROM cidw.fact_engagement  AS fact_engagement
--INNER JOIN cidw.person_dim  AS person ON fact_engagement.person_wid = person.person_wid
--INNER JOIN cidw.day_dim  AS "create" ON person.created_date_wid = ("create".row_wid)
--INNER JOIN cidw.product_dim  AS product ON fact_engagement.brand_wid = product.row_wid
--INNER JOIN sandbox.LR$XB1XE5KA9TY2BN7DI5G5C_person_permissions AS person_permissions ON person.person_wid = person_permissions.person_wid
--INNER JOIN cidw.day_dim  AS permission ON person_permissions.permission_date_wid = permission.row_wid
--
--WHERE ("create".calendar_date  < (DATEADD(month,-36, DATE_TRUNC('month', DATE_TRUNC('day',GETDATE())) )))
--    AND ((CASE WHEN person.hard_bounce = 'N' THEN true ELSE false END) = 'N'
--    AND (CASE WHEN person.valid_email = 'Y' THEN true ELSE false END) = 'Y'
--    AND (CASE WHEN person.spam_trap = 'Y' THEN true ELSE false END) = 'N'
--    AND NOT (person_permissions.status = 'Opt-Out'
--    AND person_permissions.permission = 'Global'))
--    AND (permission.calendar_date  < (DATEADD(month,-36, DATE_TRUNC('month', DATE_TRUNC('day',GETDATE())) )))
--    AND (product.product_brand in ('InformationWeek','Dark Reading', 'Network Computing', 'Gamasutra', 'Game Career Guide', 'No Jitter'))
--GROUP BY 1,2,3
--union
--SELECT
--  2 as rank,
--        'Before 2.5 years ago' AS period,
--        product.product_brand  AS "product_brand",
--        COUNT(DISTINCT person.email_address ) AS "total_persons"
--FROM cidw.fact_engagement  AS fact_engagement
--INNER JOIN cidw.person_dim  AS person ON fact_engagement.person_wid = person.person_wid
--INNER JOIN cidw.day_dim  AS "create" ON person.created_date_wid = ("create".row_wid)
--INNER JOIN cidw.product_dim  AS product ON fact_engagement.brand_wid = product.row_wid
--INNER JOIN sandbox.LR$XB1XE5KA9TY2BN7DI5G5C_person_permissions AS person_permissions ON person.person_wid = person_permissions.person_wid
--INNER JOIN cidw.day_dim  AS permission ON person_permissions.permission_date_wid = permission.row_wid
--
--WHERE ("create".calendar_date  < (DATEADD(month,-30, DATE_TRUNC('month', DATE_TRUNC('day',GETDATE())) )))
--    AND ((CASE WHEN person.hard_bounce = 'N' THEN true ELSE false END) = 'N'
--    AND (CASE WHEN person.valid_email = 'Y' THEN true ELSE false END) = 'Y'
--    AND (CASE WHEN person.spam_trap = 'Y' THEN true ELSE false END) = 'N'
--    AND NOT (person_permissions.status = 'Opt-Out'
--    AND person_permissions.permission = 'Global'))
--    AND (permission.calendar_date  < (DATEADD(month,-30, DATE_TRUNC('month', DATE_TRUNC('day',GETDATE())) )))
--    AND (product.product_brand in ('InformationWeek','Dark Reading', 'Network Computing', 'Gamasutra', 'Game Career Guide', 'No Jitter'))
--GROUP BY 1,2,3
--UNION
SELECT
  3 as rank,
        'Before 2 years ago' AS period,
        product.product_brand  AS "product_brand",
        COUNT(DISTINCT person.email_address ) AS "total_persons"
FROM cidw.fact_engagement  AS fact_engagement
INNER JOIN cidw.person_dim  AS person ON fact_engagement.person_wid = person.person_wid
INNER JOIN cidw.day_dim  AS "create" ON person.created_date_wid = ("create".row_wid)
INNER JOIN cidw.product_dim  AS product ON fact_engagement.brand_wid = product.row_wid
INNER JOIN sandbox.LR$XB1XE5KA9TY2BN7DI5G5C_person_permissions AS person_permissions ON person.person_wid = person_permissions.person_wid
INNER JOIN cidw.day_dim  AS permission ON person_permissions.permission_date_wid = permission.row_wid

WHERE ("create".calendar_date  < (DATEADD(month,-24, DATE_TRUNC('month', DATE_TRUNC('day',GETDATE())) )))
    AND ((CASE WHEN person.hard_bounce = 'N' THEN true ELSE false END) = 'N'
    AND (CASE WHEN person.valid_email = 'Y' THEN true ELSE false END) = 'Y'
    AND (CASE WHEN person.spam_trap = 'Y' THEN true ELSE false END) = 'N'
    AND NOT (person_permissions.status = 'Opt-Out'
    AND person_permissions.permission = 'Global'))
    AND (permission.calendar_date  < (DATEADD(month,-24, DATE_TRUNC('month', DATE_TRUNC('day',GETDATE())) )))
    AND (product.product_brand in ('InformationWeek','Dark Reading', 'Network Computing', 'Gamasutra', 'Game Career Guide', 'No Jitter'))
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
INNER JOIN sandbox.LR$XB1XE5KA9TY2BN7DI5G5C_person_permissions AS person_permissions ON person.person_wid = person_permissions.person_wid
INNER JOIN cidw.day_dim  AS permission ON person_permissions.permission_date_wid = permission.row_wid

WHERE ("create".calendar_date  < (DATEADD(month,-18, DATE_TRUNC('month', DATE_TRUNC('day',GETDATE())) )))
    AND ((CASE WHEN person.hard_bounce = 'N' THEN true ELSE false END) = 'N'
    AND (CASE WHEN person.valid_email = 'Y' THEN true ELSE false END) = 'Y'
    AND (CASE WHEN person.spam_trap = 'Y' THEN true ELSE false END) = 'N'
    AND NOT (person_permissions.status = 'Opt-Out'
    AND person_permissions.permission = 'Global'))
    AND (permission.calendar_date  < (DATEADD(month,-18, DATE_TRUNC('month', DATE_TRUNC('day',GETDATE())) )))
    AND (product.product_brand in ('InformationWeek','Dark Reading', 'Network Computing', 'Gamasutra', 'Game Career Guide', 'No Jitter'))
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
INNER JOIN sandbox.LR$XB1XE5KA9TY2BN7DI5G5C_person_permissions AS person_permissions ON person.person_wid = person_permissions.person_wid
INNER JOIN cidw.day_dim  AS permission ON person_permissions.permission_date_wid = permission.row_wid

WHERE ("create".calendar_date  < (DATEADD(month,-12, DATE_TRUNC('month', DATE_TRUNC('day',GETDATE())) )))
    AND ((CASE WHEN person.hard_bounce = 'N' THEN true ELSE false END) = 'N'
    AND (CASE WHEN person.valid_email = 'Y' THEN true ELSE false END) = 'Y'
    AND (CASE WHEN person.spam_trap = 'Y' THEN true ELSE false END) = 'N'
    AND NOT (person_permissions.status = 'Opt-Out'
    AND person_permissions.permission = 'Global'))
    AND (permission.calendar_date  < (DATEADD(month,-12, DATE_TRUNC('month', DATE_TRUNC('day',GETDATE())) )))
    AND (product.product_brand in ('InformationWeek','Dark Reading', 'Network Computing', 'Gamasutra', 'Game Career Guide', 'No Jitter'))
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
INNER JOIN sandbox.LR$XB1XE5KA9TY2BN7DI5G5C_person_permissions AS person_permissions ON person.person_wid = person_permissions.person_wid
INNER JOIN cidw.day_dim  AS permission ON person_permissions.permission_date_wid = permission.row_wid

WHERE ("create".calendar_date  < (DATEADD(month,-6, DATE_TRUNC('month', DATE_TRUNC('day',GETDATE())) )))
    AND ((CASE WHEN person.hard_bounce = 'N' THEN true ELSE false END) = 'N'
    AND (CASE WHEN person.valid_email = 'Y' THEN true ELSE false END) = 'Y'
    AND (CASE WHEN person.spam_trap = 'Y' THEN true ELSE false END) = 'N'
    AND NOT (person_permissions.status = 'Opt-Out'
    AND person_permissions.permission = 'Global'))
    AND (permission.calendar_date  < (DATEADD(month,-6, DATE_TRUNC('month', DATE_TRUNC('day',GETDATE())) )))
    AND (product.product_brand in ('InformationWeek','Dark Reading', 'Network Computing', 'Gamasutra', 'Game Career Guide', 'No Jitter'))
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
INNER JOIN sandbox.LR$XB1XE5KA9TY2BN7DI5G5C_person_permissions AS person_permissions ON person.person_wid = person_permissions.person_wid
WHERE ((CASE WHEN person.hard_bounce = 'N' THEN true ELSE false END) = 'N'
    AND (CASE WHEN person.valid_email = 'Y' THEN true ELSE false END) = 'Y'
    AND (CASE WHEN person.spam_trap = 'Y' THEN true ELSE false END) = 'N'
    AND NOT (person_permissions.status = 'Opt-Out'
    AND person_permissions.permission = 'Global'))
    AND (product.product_brand in ('InformationWeek','Dark Reading', 'Network Computing', 'Gamasutra', 'Game Career Guide', 'No Jitter'))
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
