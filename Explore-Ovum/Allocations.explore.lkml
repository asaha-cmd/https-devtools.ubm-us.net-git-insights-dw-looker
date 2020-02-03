include: "/Views-Core/*.view.lkml"
include: "/Views-Ovum/*.view.lkml"

explore: da_5705_allocations{
  label: "Allocations in Ovum"
  group_label: "Ovum"
  description: ""

  join: da_5705_accounts {
    relationship: many_to_one
    type: inner
    sql_on: ${da_5705_accounts.account_key} = ${da_5705_allocations.account_key} ;;
  }

  join: da_5705_users {
    relationship: many_to_one
    type: inner
    sql_on: ${da_5705_users.user_key} = ${da_5705_allocations.user_key} ;;
  }

  join: da_5705_contracts {
    relationship: many_to_one
    type: inner
    sql_on: ${da_5705_contracts.contract_key} = ${da_5705_allocations.contract_key} ;;
  }

  join: person {
    view_label: "Insights People"
    relationship: many_to_one
    type: inner
    sql_on: lower(${da_5705_users.email_address}) = lower(${person.email_address}) ;;
  }
  join: person_permissions {
    view_label: "Insights People"
    from:  person_permissions
    type:  left_outer
    relationship: many_to_many
    sql_on: ${person.person_wid} = ${person_permissions.person_wid} ;;
  }
}
