- dashboard: reengagement
  title: Re-Engagement
  layout: newspaper
  elements:
  - title: Re-Engagement Pie
    name: Re-Engagement Pie
    model: Customer_Insights
    explore: fact_engagement_ext
    type: looker_pie
    fields: [person.number_of_distinct_people_by_email_address, fact_engagement_ext.re_engagement]
    fill_fields: [fact_engagement_ext.re_engagement]
    sorts: [person.number_of_distinct_people_by_email_address desc]
    limit: 740
    dynamic_fields: [{dimension: day_diff, label: Day Diff, expression: 'diff_days(${previous_engagement.calendar_date},
          ${engagement.calendar_date})', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: number}, {dimension: calculation_2, label: Calculation
          2, expression: 'diff_years(${previous_engagement.calendar_date}, ${engagement.calendar_date})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    query_timezone: America/New_York
    value_labels: legend
    label_type: labPer
    series_colors:
      Unengaged: "#FBB555"
      New Engagement: "#B1399E"
      Re-Engagement: "#3EB0D5"
      Active: "#C2DD67"
    series_types: {}
    listen:
      Brand: product.product_brand
      Quarter: engagement.calendar_quarter
      Hard Transactions: fact_engagement_ext.engagement_type
    row: 6
    col: 0
    width: 8
    height: 6
  - title: Re-Engagement Over Time
    name: Re-Engagement Over Time
    model: Customer_Insights
    explore: fact_engagement_ext
    type: table
    fields: [person.number_of_distinct_people_by_email_address, fact_engagement_ext.re_engagement,
      engagement.calendar_quarter]
    pivots: [fact_engagement_ext.re_engagement]
    fill_fields: [fact_engagement_ext.re_engagement, engagement.calendar_quarter]
    sorts: [fact_engagement_ext.re_engagement 0]
    limit: 740
    dynamic_fields: [{dimension: day_diff, label: Day Diff, expression: 'diff_days(${previous_engagement.calendar_date},
          ${engagement.calendar_date})', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: number}, {dimension: calculation_2, label: Calculation
          2, expression: 'diff_years(${previous_engagement.calendar_date}, ${engagement.calendar_date})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    query_timezone: America/New_York
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      Unengaged - 2 - person.number_of_distinct_people_by_email_address: "#FBB555"
      New Engagement - 0 - person.number_of_distinct_people_by_email_address: "#C2DD67"
      Re-Engagement - 1 - person.number_of_distinct_people_by_email_address: "#3EB0D5"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    listen:
      Brand: product.product_brand
      Quarter: engagement.calendar_quarter
      Hard Transactions: fact_engagement_ext.engagement_type
    row: 6
    col: 8
    width: 11
    height: 6
  - title: Brand Re Engagement
    name: Brand Re Engagement
    model: Customer_Insights
    explore: fact_engagement_ext
    type: looker_pie
    fields: [person.number_of_distinct_people_by_email_address, fact_engagement_ext.brand_re_engagement]
    fill_fields: [fact_engagement_ext.brand_re_engagement]
    sorts: [person.number_of_distinct_people_by_email_address desc]
    limit: 740
    column_limit: 50
    dynamic_fields: [{dimension: day_diff, label: Day Diff, expression: 'diff_days(${previous_engagement.calendar_date},
          ${engagement.calendar_date})', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: number}, {dimension: calculation_2, label: Calculation
          2, expression: 'diff_years(${previous_engagement.calendar_date}, ${engagement.calendar_date})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    query_timezone: America/New_York
    value_labels: legend
    label_type: labPer
    series_colors:
      Unengaged: "#FBB555"
      New Engagement: "#B1399E"
      Re-Engagement: "#3EB0D5"
      Active: "#C2DD67"
    series_types: {}
    listen:
      Brand: product.product_brand
      Quarter: engagement.calendar_quarter
      Hard Transactions: fact_engagement_ext.engagement_type
    row: 30
    col: 0
    width: 8
    height: 6
  - title: Brand Re-Engagement Over Time
    name: Brand Re-Engagement Over Time
    model: Customer_Insights
    explore: fact_engagement_ext
    type: table
    fields: [person.number_of_distinct_people_by_email_address, engagement.calendar_quarter,
      fact_engagement_ext.brand_re_engagement]
    pivots: [fact_engagement_ext.brand_re_engagement]
    fill_fields: [engagement.calendar_quarter, fact_engagement_ext.brand_re_engagement]
    sorts: [engagement.calendar_quarter desc, fact_engagement_ext.brand_re_engagement]
    limit: 740
    column_limit: 50
    dynamic_fields: [{dimension: day_diff, label: Day Diff, expression: 'diff_days(${previous_engagement.calendar_date},
          ${engagement.calendar_date})', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: number}, {dimension: calculation_2, label: Calculation
          2, expression: 'diff_years(${previous_engagement.calendar_date}, ${engagement.calendar_date})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    query_timezone: America/New_York
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      Unengaged - 2 - person.number_of_distinct_people_by_email_address: "#FBB555"
      New Engagement - 0 - person.number_of_distinct_people_by_email_address: "#C2DD67"
      Re-Engagement - 1 - person.number_of_distinct_people_by_email_address: "#3EB0D5"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    listen:
      Brand: product.product_brand
      Quarter: engagement.calendar_quarter
      Hard Transactions: fact_engagement_ext.engagement_type
    row: 30
    col: 8
    width: 11
    height: 6
  - title: Limited Re-Engagement Pie
    name: Limited Re-Engagement Pie
    model: Customer_Insights
    explore: fact_engagement_ext
    type: looker_pie
    fields: [person.number_of_distinct_people_by_email_address, fact_engagement_ext.limited_re_engagement]
    fill_fields: [fact_engagement_ext.limited_re_engagement]
    sorts: [person.number_of_distinct_people_by_email_address desc]
    limit: 740
    dynamic_fields: [{dimension: day_diff, label: Day Diff, expression: 'diff_days(${previous_engagement.calendar_date},
          ${engagement.calendar_date})', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: number}, {dimension: calculation_2, label: Calculation
          2, expression: 'diff_years(${previous_engagement.calendar_date}, ${engagement.calendar_date})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    query_timezone: America/New_York
    value_labels: legend
    label_type: labPer
    series_colors:
      Unengaged: "#FBB555"
      New Engagement: "#B1399E"
      Re-Engagement: "#3EB0D5"
      Active: "#C2DD67"
    series_types: {}
    listen:
      Brand: product.product_brand
      Quarter: engagement.calendar_quarter
      Hard Transactions: fact_engagement_ext.engagement_type
    row: 18
    col: 0
    width: 8
    height: 6
  - title: Limited Re-Engagement Over Time
    name: Limited Re-Engagement Over Time
    model: Customer_Insights
    explore: fact_engagement_ext
    type: table
    fields: [engagement.calendar_quarter, fact_engagement_ext.limited_re_engagement, person.number_of_distinct_people_by_email_address]
    pivots: [fact_engagement_ext.limited_re_engagement]
    fill_fields: [engagement.calendar_quarter, fact_engagement_ext.limited_re_engagement]
    limit: 740
    dynamic_fields: [{dimension: day_diff, label: Day Diff, expression: 'diff_days(${previous_engagement.calendar_date},
          ${engagement.calendar_date})', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: number}, {dimension: calculation_2, label: Calculation
          2, expression: 'diff_years(${previous_engagement.calendar_date}, ${engagement.calendar_date})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    query_timezone: America/New_York
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      Unengaged - 2 - person.number_of_distinct_people_by_email_address: "#FBB555"
      New Engagement - 0 - person.number_of_distinct_people_by_email_address: "#C2DD67"
      Re-Engagement - 1 - person.number_of_distinct_people_by_email_address: "#3EB0D5"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    listen:
      Brand: product.product_brand
      Quarter: engagement.calendar_quarter
      Hard Transactions: fact_engagement_ext.engagement_type
    row: 18
    col: 8
    width: 11
    height: 6
  - name: Re-Engagement
    type: text
    title_text: Re-Engagement
    subtitle_text: All Transactions (MEM Tech)
    body_text: |-
      For Re-engagement report, the previous engagement date is determined at the table level for each person. So any engagement by that person is then linked to their previous engagement.
      Re-define to: Engagements included in this reports are across all of MEM Tech and include the following transactions:
      (Copy and paste from here once definitions are final: https://devtools.ubm-us.net/confluence/display/IN/Transactions+Defined+for+Engagement+Table+Categories)
      Note: To limit to MEM Tech filter to only report on the following Audience Groups: IT, Security, Game, Enterprise Communications
    row: 6
    col: 19
    width: 5
    height: 6
  - name: Brand Level Re-Engagement
    type: text
    title_text: Brand Level Re-Engagement
    subtitle_text: All Transactions (for a specific brand/set of brands)
    body_text: |-
      For Brand Re-engagement report, this is based on the definition of engagement that includes e-mail opens (not Limited). The previous engagement date is determined at the brand level for each person. So any engagement by that person is then linked to their previous engagement for that brand/group of brands only.
      Re-define to: Engagements included in this reports are across all of a specific Brand or set of Brands and include the following transactions:
      (Copy and paste from here once definitions are final: https://devtools.ubm-us.net/confluence/display/IN/Transactions+Defined+for+Engagement+Table+Categories)
    row: 30
    col: 19
    width: 5
    height: 6
  - name: Re-Engagement (2)
    type: text
    title_text: Re-Engagement
    body_text: "All Re-Engagement reports are based on The period of time between\
      \ Engagement activity. The table creates three previous engagement date columns\
      \ depending on the logic per report below. The basis for creation of that column\
      \ determines the report. \nFor all three reports, Re-Engagement terms are defined\
      \ as follows:\n\n- Re-Engagement - The most recent previous engagement date\
      \ was more than a year ago.\n- New Engagement - There was no previous engagement\
      \ date.\n- Active - The previous engagement date was in the last year."
    row: 0
    col: 0
    width: 24
    height: 6
  - name: Limited Re-Engagement
    type: text
    title_text: Limited Re-Engagement
    subtitle_text: Hard Transactions (MEM Tech)
    body_text: |-
      For Limited Re-engagement report, the previous engagement date is determined at the table level for each person. But we filter the engagement types to exclude Email Open. Only non Email Open engagements are linked and then the column set. If a user had a single page view and hundreds of email open activity they would be counted as a new engagement.
      Re-define to: Engagements included in this reports are across all of MEM Tech and include the following hard transactions:
      (Copy and paste from here once definitions are final: https://devtools.ubm-us.net/confluence/display/IN/Transactions+Defined+for+Engagement+Table+Categories)
      Note: To limit to MEM Tech filter to only report on the following Audience Groups: IT, Security, Game, Enterprise Communications
    row: 18
    col: 19
    width: 5
    height: 6
  - name: Limited Brand Level Re-Engagement
    type: text
    title_text: Limited Brand Level Re-Engagement
    subtitle_text: Hard Transactions (for a specific brand/set of brands)
    body_text: |-
      For Brand Re-engagement report, this is based on the definition of engagement that includes e-mail opens (not Limited). The previous engagement date is determined at the brand level for each person. So any engagement by that person is then linked to their previous engagement for that brand/group of brands only.
      Re-define to: Engagements included in this reports are across all of a specific Brand or set of Brands and include the following hard transactions:
      (Copy and paste from here once definitions are final: https://devtools.ubm-us.net/confluence/display/IN/Transactions+Defined+for+Engagement+Table+Categories)
    row: 36
    col: 19
    width: 5
    height: 6
  - title: Limited Brand Re Engagement Pie
    name: Limited Brand Re Engagement Pie
    model: Customer_Insights
    explore: fact_engagement_ext
    type: looker_pie
    fields: [person.number_of_distinct_people_by_email_address, fact_engagement_ext.limited_brand_re_engagement]
    fill_fields: [fact_engagement_ext.limited_brand_re_engagement]
    filters: {}
    sorts: [person.number_of_distinct_people_by_email_address desc]
    limit: 740
    column_limit: 50
    dynamic_fields: [{dimension: day_diff, label: Day Diff, expression: 'diff_days(${previous_engagement.calendar_date},
          ${engagement.calendar_date})', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: number}, {dimension: calculation_2, label: Calculation
          2, expression: 'diff_years(${previous_engagement.calendar_date}, ${engagement.calendar_date})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    query_timezone: America/New_York
    value_labels: legend
    label_type: labPer
    series_colors:
      Unengaged: "#FBB555"
      New Engagement: "#B1399E"
      Re-Engagement: "#3EB0D5"
      Active: "#C2DD67"
    series_types: {}
    listen:
      Brand: product.product_brand
      Quarter: engagement.calendar_quarter
      Hard Transactions: fact_engagement_ext.engagement_type
    row: 36
    col: 0
    width: 8
    height: 6
  - title: Limited Brand Re Engagement Over Time
    name: Limited Brand Re Engagement Over Time
    model: Customer_Insights
    explore: fact_engagement_ext
    type: table
    fields: [person.number_of_distinct_people_by_email_address, engagement.calendar_quarter,
      fact_engagement_ext.limited_brand_re_engagement]
    pivots: [fact_engagement_ext.limited_brand_re_engagement]
    fill_fields: [engagement.calendar_quarter, fact_engagement_ext.limited_brand_re_engagement]
    filters: {}
    sorts: [engagement.calendar_quarter desc, fact_engagement_ext.limited_brand_re_engagement]
    limit: 740
    column_limit: 50
    dynamic_fields: [{dimension: day_diff, label: Day Diff, expression: 'diff_days(${previous_engagement.calendar_date},
          ${engagement.calendar_date})', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: number}, {dimension: calculation_2, label: Calculation
          2, expression: 'diff_years(${previous_engagement.calendar_date}, ${engagement.calendar_date})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    query_timezone: America/New_York
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      Unengaged - 2 - person.number_of_distinct_people_by_email_address: "#FBB555"
      New Engagement - 0 - person.number_of_distinct_people_by_email_address: "#C2DD67"
      Re-Engagement - 1 - person.number_of_distinct_people_by_email_address: "#3EB0D5"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    listen:
      Brand: product.product_brand
      Quarter: engagement.calendar_quarter
      Hard Transactions: fact_engagement_ext.engagement_type
    row: 36
    col: 8
    width: 11
    height: 6
  - title: New Engagement
    name: New Engagement
    model: Customer_Insights
    explore: fact_engagement_ext
    type: looker_pie
    fields: [fact_engagement_ext.engagement_type, person.number_of_distinct_people_by_email_address]
    filters:
      fact_engagement_ext.re_engagement: New Engagement
    sorts: [person.number_of_distinct_people_by_email_address desc]
    limit: 740
    column_limit: 50
    dynamic_fields: [{dimension: day_diff, label: Day Diff, expression: 'diff_days(${previous_engagement.calendar_date},
          ${engagement.calendar_date})', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: number}, {dimension: calculation_2, label: Calculation
          2, expression: 'diff_years(${previous_engagement.calendar_date}, ${engagement.calendar_date})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    query_timezone: America/New_York
    value_labels: legend
    label_type: labPer
    series_colors:
      Unengaged: "#FBB555"
      New Engagement: "#B1399E"
      Re-Engagement: "#3EB0D5"
      Active: "#C2DD67"
    series_types: {}
    defaults_version: 1
    listen:
      Brand: product.product_brand
      Quarter: engagement.calendar_quarter
      Hard Transactions: fact_engagement_ext.engagement_type
    row: 12
    col: 0
    width: 8
    height: 6
  - title: Re-Engagement
    name: Re-Engagement (3)
    model: Customer_Insights
    explore: fact_engagement_ext
    type: looker_pie
    fields: [person.number_of_distinct_people_by_email_address, fact_engagement_ext.engagement_type]
    filters:
      fact_engagement_ext.re_engagement: Re-Engagement
    sorts: [person.number_of_distinct_people_by_email_address desc]
    limit: 740
    column_limit: 50
    dynamic_fields: [{dimension: day_diff, label: Day Diff, expression: 'diff_days(${previous_engagement.calendar_date},
          ${engagement.calendar_date})', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: number}, {dimension: calculation_2, label: Calculation
          2, expression: 'diff_years(${previous_engagement.calendar_date}, ${engagement.calendar_date})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    query_timezone: America/New_York
    value_labels: legend
    label_type: labPer
    series_colors:
      Unengaged: "#FBB555"
      New Engagement: "#B1399E"
      Re-Engagement: "#3EB0D5"
      Active: "#C2DD67"
    series_types: {}
    defaults_version: 1
    listen:
      Brand: product.product_brand
      Quarter: engagement.calendar_quarter
      Hard Transactions: fact_engagement_ext.engagement_type
    row: 12
    col: 8
    width: 8
    height: 6
  - title: Active
    name: Active
    model: Customer_Insights
    explore: fact_engagement_ext
    type: looker_pie
    fields: [person.number_of_distinct_people_by_email_address, fact_engagement_ext.engagement_type]
    filters:
      fact_engagement_ext.re_engagement: Active
    sorts: [person.number_of_distinct_people_by_email_address desc]
    limit: 740
    column_limit: 50
    dynamic_fields: [{dimension: day_diff, label: Day Diff, expression: 'diff_days(${previous_engagement.calendar_date},
          ${engagement.calendar_date})', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: number}, {dimension: calculation_2, label: Calculation
          2, expression: 'diff_years(${previous_engagement.calendar_date}, ${engagement.calendar_date})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    query_timezone: America/New_York
    value_labels: legend
    label_type: labPer
    series_colors:
      Unengaged: "#FBB555"
      New Engagement: "#B1399E"
      Re-Engagement: "#3EB0D5"
      Active: "#C2DD67"
    series_types: {}
    defaults_version: 1
    listen:
      Brand: product.product_brand
      Quarter: engagement.calendar_quarter
      Hard Transactions: fact_engagement_ext.engagement_type
    row: 12
    col: 16
    width: 8
    height: 6
  - title: New Engagement
    name: New Engagement (2)
    model: Customer_Insights
    explore: fact_engagement_ext
    type: looker_pie
    fields: [person.number_of_distinct_people_by_email_address, fact_engagement_ext.engagement_type]
    filters:
      fact_engagement_ext.limited_re_engagement: New Engagement
    sorts: [person.number_of_distinct_people_by_email_address desc]
    limit: 740
    column_limit: 50
    dynamic_fields: [{dimension: day_diff, label: Day Diff, expression: 'diff_days(${previous_engagement.calendar_date},
          ${engagement.calendar_date})', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: number}, {dimension: calculation_2, label: Calculation
          2, expression: 'diff_years(${previous_engagement.calendar_date}, ${engagement.calendar_date})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    query_timezone: America/New_York
    value_labels: legend
    label_type: labPer
    series_colors:
      Unengaged: "#FBB555"
      New Engagement: "#B1399E"
      Re-Engagement: "#3EB0D5"
      Active: "#C2DD67"
    series_types: {}
    defaults_version: 1
    listen:
      Brand: product.product_brand
      Quarter: engagement.calendar_quarter
      Hard Transactions: fact_engagement_ext.engagement_type
    row: 24
    col: 0
    width: 8
    height: 6
  - title: Re-Engagement
    name: Re-Engagement (4)
    model: Customer_Insights
    explore: fact_engagement_ext
    type: looker_pie
    fields: [person.number_of_distinct_people_by_email_address, fact_engagement_ext.engagement_type]
    filters:
      fact_engagement_ext.limited_re_engagement: Re-Engagement
    sorts: [person.number_of_distinct_people_by_email_address desc]
    limit: 740
    column_limit: 50
    dynamic_fields: [{dimension: day_diff, label: Day Diff, expression: 'diff_days(${previous_engagement.calendar_date},
          ${engagement.calendar_date})', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: number}, {dimension: calculation_2, label: Calculation
          2, expression: 'diff_years(${previous_engagement.calendar_date}, ${engagement.calendar_date})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    query_timezone: America/New_York
    value_labels: legend
    label_type: labPer
    series_colors:
      Unengaged: "#FBB555"
      New Engagement: "#B1399E"
      Re-Engagement: "#3EB0D5"
      Active: "#C2DD67"
    series_types: {}
    defaults_version: 1
    listen:
      Brand: product.product_brand
      Quarter: engagement.calendar_quarter
      Hard Transactions: fact_engagement_ext.engagement_type
    row: 24
    col: 8
    width: 8
    height: 6
  - title: Active
    name: Active (2)
    model: Customer_Insights
    explore: fact_engagement_ext
    type: looker_pie
    fields: [person.number_of_distinct_people_by_email_address, fact_engagement_ext.engagement_type]
    filters:
      fact_engagement_ext.limited_re_engagement: Active
    sorts: [person.number_of_distinct_people_by_email_address desc]
    limit: 740
    column_limit: 50
    dynamic_fields: [{dimension: day_diff, label: Day Diff, expression: 'diff_days(${previous_engagement.calendar_date},
          ${engagement.calendar_date})', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: number}, {dimension: calculation_2, label: Calculation
          2, expression: 'diff_years(${previous_engagement.calendar_date}, ${engagement.calendar_date})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    query_timezone: America/New_York
    value_labels: legend
    label_type: labPer
    series_colors:
      Unengaged: "#FBB555"
      New Engagement: "#B1399E"
      Re-Engagement: "#3EB0D5"
      Active: "#C2DD67"
    series_types: {}
    defaults_version: 1
    listen:
      Brand: product.product_brand
      Quarter: engagement.calendar_quarter
      Hard Transactions: fact_engagement_ext.engagement_type
    row: 24
    col: 16
    width: 8
    height: 6
  filters:
  - name: Brand
    title: Brand
    type: field_filter
    default_value: Network Computing,Dark Reading,InformationWeek,Data Center
    allow_multiple_values: true
    required: false
    model: Customer_Insights
    explore: fact_engagement_ext
    listens_to_filters: []
    field: product.product_brand
  - name: Quarter
    title: Quarter
    type: field_filter
    default_value: 8 quarters
    allow_multiple_values: true
    required: false
    model: Customer_Insights
    explore: fact_engagement_ext
    listens_to_filters: []
    field: engagement.calendar_quarter
  - name: Hard Transactions
    title: Hard Transactions
    type: field_filter
    default_value: Event Registration,Media Registration,Event Attendance,Session
      Scan,Lead Scan,Online,Webinar Attended,Webinar Registration,Newsletter Subscription,Promotional
      Opt-In
    allow_multiple_values: true
    required: false
    model: Customer_Insights
    explore: fact_engagement_ext
    listens_to_filters: []
    field: fact_engagement_ext.engagement_type
