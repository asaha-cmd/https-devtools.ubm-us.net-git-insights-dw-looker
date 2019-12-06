include: "/Views-Core/*.view.lkml"
include: "/Views-OnlineActivity/*.view.lkml"

explore: Online_Activity {
  group_label: "Online Activity"
  label: "Transactions from Online Activity"
  from: Online_Activity
  description: "Online activity from NG, Eloqua CDO, historical data"

  join: person {
    type: inner
    relationship: many_to_one
    sql_on: ${Online_Activity.person_wid} = ${person.person_wid} ;;
  }
  join: person_permissions {
    view_label: "Person Permissions"
    from:  person_permissions
    type:  left_outer
    relationship: many_to_many
    sql_on: ${person.person_wid} = ${person_permissions.person_wid} ;;
  }

  join: permission {
    view_label: "Person Permissions"
    from: day_dim
    relationship: many_to_one
    type: left_outer
    sql_on: ${person_permissions.permission_date_wid} = ${permission.row_wid} ;;
  }

  join: asset_dim {
    type:  inner
    view_label: "Online Asset"
    relationship: many_to_one
    sql_on: ${Online_Activity.asset_wid} = ${asset_dim.row_wid} ;;
  }

  join: product {
    type: inner
    relationship: many_to_one
    sql_on: ${Online_Activity.product_wid} = ${product.row_wid} ;;
  }

  join: activity  {
    relationship: one_to_one
    from: day_dim
    view_label: "Online Activity"
    sql_on: ${Online_Activity.activity_date_wid} =${activity.row_wid} ;;
  }

  join: marketing_code {
    from: activity_code_dim
    view_label: "Marketing Code"
    relationship: many_to_one
    sql_on: ${Online_Activity.marketing_code_wid} = ${marketing_code.row_wid} ;;
  }

  join: site_dim {
    type: inner
    view_label: "Site"
    relationship: many_to_one
    sql_on: ${Online_Activity.site_wid} = ${site_dim.row_wid} ;;
  }

  join: question_answers {
    from: asset_qa_history_fact
    view_label: "Questions/Answers"
    relationship: one_to_many
    sql_on:  ${Online_Activity.product_wid} = ${question_answers.product_wid}
      and ${Online_Activity.person_wid} = ${question_answers.person_wid}
      and ${Online_Activity.online_activity_src_sys_id} = ${question_answers.transaction_id};;
  }

  join: question {
    from: question_dim
    view_label: "Questions/Answers"
    relationship: one_to_one
    sql_on: ${question.row_wid} = ${question_answers.question_wid} ;;
  }

  join: answer {
    from: answer_dim
    view_label: "Questions/Answers"
    relationship: one_to_one
    sql_on: ${answer.row_wid} = ${question_answers.answer_wid} ;;
  }

}
