include: "/Views-Core/*.view.lkml"
include: "/Views-Demographics/*.view.lkml"

explore: fact_engagement_persona {
  group_label: "People"
  label: "Persona Engagement"
  view_label: "Persona Engagement"
  description: "Persona Filtered Engagement"

  join: engagement {
    view_label: "Persona Engagement"
    from: day_dim
    relationship: many_to_one
    type: inner
    sql_on: ${fact_engagement_persona.engagement_date_wid} = ${engagement.row_wid};;
  }

  join: create {
    view_label: "Person"
    from: day_dim
    relationship: many_to_one
    type: inner
    sql_on: ${person.created_date_wid} = ${create.row_wid};;
  }

  join: person {
    relationship: many_to_one
    type: inner
    sql_on: ${fact_engagement_persona.person_wid} = ${person.person_wid} ;;
  }

  join: product {
    relationship: many_to_one
    type: inner
    sql_on: ${fact_engagement_persona.brand_wid} = ${product.row_wid};;
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

  join: industry_demo_fact {
    view_label: "Industry"
    type: inner
    fields: []
    sql_on: ${person.person_wid} = ${industry_demo_fact.person_wid} ;;
    relationship:one_to_many
  }

  join: industry_demo_bridge {
    view_label: "Industry"
    type: inner
    fields: []
    sql_on: ${industry_demo_bridge.industry_demo_wid} = ${industry_demo_fact.row_wid} ;;
    relationship: one_to_many
  }

  join: industry_value_dim {
    view_label: "Industry"
    type: inner
    sql_on:  ${industry_demo_bridge.industry_value_wid} = ${industry_value_dim.row_wid} ;;
    relationship: one_to_many
  }

  join: job_function_demo_fact {
    view_label: "Job Function"
    type: inner
    fields: []
    sql_on: ${person.person_wid} = ${job_function_demo_fact.person_wid} ;;
    relationship:one_to_many
  }

  join: job_function_demo_bridge {
    view_label: "Job Function"
    type: inner
    fields: []
    sql_on: ${job_function_demo_bridge.job_function_demo_wid} = ${job_function_demo_fact.row_wid} ;;
    relationship: one_to_many
  }

  join: job_function_value_dim {
    view_label: "Job Function"
    type: inner
    sql_on:  ${job_function_demo_bridge.job_function_value_wid} = ${job_function_value_dim.row_wid} ;;
    relationship: one_to_many
  }

  join: job_level_demo_fact {
    view_label: "Job Level"
    type: inner
    fields: []
    sql_on: ${person.person_wid} = ${job_level_demo_fact.person_wid} ;;
    relationship:one_to_many
  }

  join: job_level_demo_bridge {
    view_label: "Job Level"
    type: inner
    fields: []
    sql_on: ${job_level_demo_bridge.job_level_demo_wid} = ${job_level_demo_fact.row_wid} ;;
    relationship: one_to_many
  }

  join: job_level_value_dim {
    view_label: "Job Level"
    type: inner
    sql_on:  ${job_level_demo_bridge.job_level_value_wid} = ${job_level_value_dim.row_wid} ;;
    relationship: one_to_many
  }

  join: annual_budget_demo_fact {
    view_label: "Annual Budget"
    type: inner
    fields: []
    sql_on: ${person.person_wid} = ${annual_budget_demo_fact.person_wid} ;;
    relationship:one_to_many
  }

  join: annual_budget_demo_bridge {
    view_label: "Annual Budget"
    type: inner
    fields: []
    sql_on: ${annual_budget_demo_bridge.annual_budget_demo_wid} = ${annual_budget_demo_fact.row_wid} ;;
    relationship: one_to_many
  }

  join: annual_budget_value_dim {
    view_label: "Annual Budget"
    type: inner
    fields: [annual_budget_value_dim.original_name]
    sql_on:  ${annual_budget_demo_bridge.annual_budget_value_wid} = ${annual_budget_value_dim.row_wid} ;;
    relationship: one_to_many
  }

  join: company_revenue_demo_fact {
    view_label: "Company Revenue"
    type: inner
    fields: []
    sql_on: ${person.person_wid} = ${company_revenue_demo_fact.person_wid} ;;
    relationship:one_to_many
  }

  join: company_revenue_demo_bridge {
    view_label: "Company Revenue"
    type: inner
    fields: []
    sql_on: ${company_revenue_demo_bridge.company_revenue_demo_wid} = ${company_revenue_demo_fact.row_wid} ;;
    relationship: one_to_many
  }

  join: company_revenue_value_dim {
    view_label: "Company Revenue"
    type: inner
    sql_on:  ${company_revenue_demo_bridge.company_revenue_value_wid} = ${company_revenue_value_dim.row_wid} ;;
    relationship: one_to_many
  }

  join: company_size_demo_fact {
    view_label: "Company Size"
    type: inner
    fields: []
    sql_on: ${person.person_wid} = ${company_size_demo_fact.person_wid} ;;
    relationship:one_to_many
  }

  join: company_size_demo_bridge {
    view_label: "Company Size"
    type: inner
    fields: []
    sql_on: ${company_size_demo_bridge.company_size_demo_wid} = ${company_size_demo_fact.row_wid} ;;
    relationship: one_to_many
  }

  join: company_size_value_dim {
    view_label: "Company Size"
    type: inner
    fields: [company_size_value_dim.original_name]
    sql_on:  ${company_size_demo_bridge.company_size_value_wid} = ${company_size_value_dim.row_wid} ;;
    relationship: one_to_many
  }

  join: product_interests_demo_fact {
    view_label: "Product Interests"
    type: inner
    fields: []
    sql_on: ${person.person_wid} = ${product_interests_demo_fact.person_wid} ;;
    relationship:one_to_many
  }

  join: product_interests_demo_bridge {
    view_label: "Product Interests"
    type: inner
    fields: []
    sql_on: ${product_interests_demo_bridge.product_interests_demo_wid} = ${product_interests_demo_fact.row_wid} ;;
    relationship: one_to_many
  }

  join: product_interests_value_dim {
    view_label: "Product Interests"
    type: inner
    fields: [product_interests_value_dim.original_name]
    sql_on:  ${product_interests_demo_bridge.product_interests_value_wid} = ${product_interests_value_dim.row_wid} ;;
    relationship: one_to_many
  }

  join: purchase_influence_demo_fact {
    view_label: "Purchase Influence"
    type: inner
    fields: []
    sql_on: ${person.person_wid} = ${purchase_influence_demo_fact.person_wid} ;;
    relationship:one_to_many
  }

  join: purchase_influence_demo_bridge {
    view_label: "Purchase Influence"
    type: inner
    fields: []
    sql_on: ${purchase_influence_demo_bridge.purchase_influence_demo_wid} = ${purchase_influence_demo_fact.row_wid} ;;
    relationship: one_to_many
  }

  join: purchase_influence_value_dim {
    view_label: "Purchase Influence"
    type: inner
    fields: [purchase_influence_value_dim.original_name]
    sql_on:  ${purchase_influence_demo_bridge.purchase_influence_value_wid} = ${purchase_influence_value_dim.row_wid} ;;
    relationship: one_to_many
  }

  join: purchase_role_demo_fact {
    view_label: "Purchase Role"
    type: inner
    fields: []
    sql_on: ${person.person_wid} = ${purchase_role_demo_fact.person_wid} ;;
    relationship:one_to_many
  }

  join: purchase_role_demo_bridge {
    view_label: "Purchase Role"
    type: inner
    fields: []
    sql_on: ${purchase_role_demo_bridge.purchase_role_demo_wid} = ${purchase_role_demo_fact.row_wid} ;;
    relationship: one_to_many
  }

  join: purchase_role_value_dim {
    view_label: "Purchase Role"
    type: inner
    sql_on:  ${purchase_role_demo_bridge.purchase_role_value_wid} = ${purchase_role_value_dim.row_wid} ;;
    relationship: one_to_many
  }
}
