connection: "tpchlooker"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: looker_intensive15_tamas_siklosi_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_intensive15_tamas_siklosi_default_datagroup

explore: d_customer {}

explore: d_dates {}

explore: d_part {}

explore: f_lineitems {

  join: d_customer {
    sql_on: ${f_lineitems.l_custkey} = ${d_customer.c_custkey} ;;
    relationship: one_to_many
  }

  join: d_supplier {
    sql_on: ${f_lineitems.l_suppkey} = ${d_supplier.s_suppkey} ;;
    relationship: one_to_many
  }

  join: d_dates {
    sql_on: ${f_lineitems.l_orderdatekey} = ${d_dates.datekey} ;;
    relationship: one_to_many
  }

  join: d_part {
    sql_on: ${f_lineitems.l_partkey} = ${d_part.p_partkey} ;;
    relationship: one_to_many
  }
}
