connection: "redshift"

# include all the views
include: "/views/**/*.view"

datagroup: redshift_looker_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: redshift_looker_default_datagroup

explore: category {}

explore: date {}

explore: event {
  join: venue {
    type: left_outer
    sql_on: ${event.venueid} = ${venue.venueid} ;;
    relationship: many_to_one
  }

  join: date {
    type: left_outer
    sql_on: ${event.dateid} = ${date.dateid} ;;
    relationship: many_to_one
  }
}

explore: listing {
  join: date {
    type: left_outer
    sql_on: ${listing.dateid} = ${date.dateid} ;;
    relationship: many_to_one
  }

  join: event {
    type: left_outer
    sql_on: ${listing.eventid} = ${event.eventid} ;;
    relationship: many_to_one
  }

  join: venue {
    type: left_outer
    sql_on: ${event.venueid} = ${venue.venueid} ;;
    relationship: many_to_one
  }
}

explore: sales {
  join: date {
    type: left_outer
    sql_on: ${sales.dateid} = ${date.dateid} ;;
    relationship: many_to_one
  }

  join: event {
    type: left_outer
    sql_on: ${sales.eventid} = ${event.eventid} ;;
    relationship: many_to_one
  }

  join: venue {
    type: left_outer
    sql_on: ${event.venueid} = ${venue.venueid} ;;
    relationship: many_to_one
  }
}

explore: users {}

explore: venue {}
