include: "/Views-Core/*.view.lkml"

  explore: engagement_overlap {
    group_label: "People"
    label: "Engagement Overlap"
    description: "View Engagements by Brand Overlap"

    join: person {
      view_label: "Person"
      type: left_outer
      sql_on: ${engagement_overlap.person_wid} = ${person.person_wid}  ;;
      relationship: many_to_many
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
}
