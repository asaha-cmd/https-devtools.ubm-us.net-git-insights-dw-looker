connection: "production_redshift_-_informatica_user"

include: "Views-Core/*.view.lkml"
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

label: "Person"


# # Select the views that should be a part of this model,
# # and define the joins that connect them together.

explore: person {
  join: data_source {
    relationship: one_to_one
    sql_on: ${person.initial_data_source_id} = ${data_source.data_source_ID} ;;
  }
}

# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
