connection: "tpchlooker"

# include all the views
include: "/views/**/*.view.lkml"

include: "/Summary.dashboard.lookml"

datagroup: looker_intensive15_tamas_siklosi_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_intensive15_tamas_siklosi_default_datagroup

explore: d_customer {}

explore: d_dates {}

explore: d_part {}

explore: d_supplier {}

### Orders ###
  explore: f_lineitems {
    label: "Orders Items"
    view_label: "Orders"

## Date ##
    # Ship Date #
    join: ship_date {
      from: d_dates
      view_label: "Ship Date"
      type: left_outer
      relationship: many_to_many
      sql_on: ${f_lineitems.l_shipdatekey} = ${ship_date.datekey} ;;
    }
    # Commit Date #
    join: commit_date {
      from: d_dates
      view_label: "Commit Date"
      type: left_outer
      relationship: many_to_many
      sql_on: ${f_lineitems.l_commitdatekey} = ${commit_date.datekey} ;;
    }
    # Receipt Date #
    join: receipt_date {
      from: d_dates
      view_label: "Receipt Date"
      type: left_outer
      relationship: many_to_many
      sql_on: ${f_lineitems.l_receiptdatekey} = ${receipt_date.datekey} ;;
    }
    # Order Date #
    join: order_date {
      from: d_dates
      view_label: "Order Date"
      type: left_outer
      relationship: many_to_many
      sql_on: ${f_lineitems.l_orderdatekey} = ${order_date.datekey} ;;
    }
## Supplier ##
    join: d_supplier {
      view_label: "Supplier"
      type: left_outer
      relationship: many_to_one
      sql_on: ${f_lineitems.l_suppkey} = ${d_supplier.s_suppkey} ;;
    }
## Part ##
    join: d_part {
      view_label: "Part"
      type: left_outer
      relationship: many_to_one
      sql_on: ${f_lineitems.l_partkey} = ${d_part.p_partkey} ;;
    }
## Customer ##
    join: d_customer {
      view_label: "Customer"
      type: left_outer
      relationship: many_to_one
      sql_on: ${f_lineitems.l_custkey} = ${d_customer.c_custkey} ;;
    }
  }
