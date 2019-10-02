- dashboard: test_person_changes
  title: Test Person Changes
  layout: newspaper
  elements:
  - title: Hard Bounce
    name: Hard Bounce
    model: Customer_Insights
    explore: person
    type: looker_pie
    fields: [person.hard_bounced, person.number_of_people]
    fill_fields: [person.hard_bounced]
    sorts: [person.number_of_people desc]
    limit: 500
    query_timezone: America/New_York
    series_types: {}
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Supressions
    name: Supressions
    model: Customer_Insights
    explore: person
    type: looker_pie
    fields: [person.not_supressed, person.number_of_people]
    fill_fields: [person.not_supressed]
    sorts: [person.number_of_people desc]
    limit: 500
    query_timezone: America/New_York
    series_types: {}
    row: 0
    col: 8
    width: 8
    height: 6
