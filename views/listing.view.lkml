view: listing {
  sql_table_name: public.listing ;;

  dimension: dateid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.dateid ;;
  }

  dimension: eventid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.eventid ;;
  }

  dimension: listid {
    type: number
    value_format_name: id
    sql: ${TABLE}.listid ;;
  }

  dimension_group: listtime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.listtime ;;
  }

  dimension: numtickets {
    type: number
    sql: ${TABLE}.numtickets ;;
  }

  dimension: priceperticket {
    type: number
    sql: ${TABLE}.priceperticket ;;
  }

  dimension: sellerid {
    type: number
    value_format_name: id
    sql: ${TABLE}.sellerid ;;
  }

  dimension: totalprice {
    type: number
    sql: ${TABLE}.totalprice ;;
  }

  measure: count {
    type: count
    drill_fields: [date.dateid, event.eventid, event.eventname]
  }
}
