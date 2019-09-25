include: "/Views-Core/*.view.lkml"
include: "/Views-Demographics/*.view.lkml"

explore: demographic_job_level {
  group_label: "Demographics"
  label: "Job Level"
  from: job_level_demo_bridge
  description: "Audience Group Based Industry Demographics"
  join: job_level_demo_fact {
    type:left_outer
    fields: []
    sql_on: ${demographic_job_level.job_level_demo_wid} = ${job_level_demo_fact.row_wid};;
    relationship:one_to_many
  }

  join: job_level_value_dim {
    view_label: "Job Level"
    type: left_outer
    #fields: [job_level_value_dim.standard_name, job_level_value_dim.original_name]
    sql_on:  ${demographic_job_level.job_level_value_wid} = ${job_level_value_dim.row_wid} ;;
    relationship: one_to_many
  }

  join: person {
    type: left_outer
    fields: [demographic_fields*]
    sql_on: ${job_level_demo_fact.person_wid} = ${person.person_wid} ;;
    relationship: many_to_one
  }

  join: activity {
    view_label: "Job Level"
    from: day_dim
    type: left_outer
    sql_on:  ${job_level_demo_fact.modified_date_wid} = ${activity.row_wid} ;;
    relationship: one_to_one
  }
  join: audience_group {
    view_label: "Job Level"
    type: left_outer
    sql_on: ${job_level_demo_fact.audience_group_wid} = ${audience_group.row_wid} ;;
    relationship: many_to_one
  }
}
