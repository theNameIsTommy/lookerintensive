view: f_lineitems {
  dimension: lineitem_id {
    primary_key: yes
    sql: ${TABLE}.lineitem_id ;;
  }

  measure: total_sale_price  {
    label: "Total Sale Price"
    description: "Total sales of items sold"
    type: sum
    sql: ${l_extendedprice} ;;
    value_format_name: usd
  }

  measure: average_sale_price {
    type: average
    sql: ${l_extendedprice} ;;
    value_format_name: usd
    description: "Average sale price of items sold"
  }

  measure: cumulative_total_sales {
    type: running_total
    sql: ${total_sale_price} ;;
    label: "Cumulative Total Sales"
  }

  measure: total_russia_sales {
    type: sum
    sql: ${l_extendedprice} ;;
    filters: [d_customer.c_nation: "RUSSIA"]
    value_format_name: usd
    description: "Total sales by customers from Russia"
  }

  measure: total_gross_revenue {
    type: sum
    sql: ${l_extendedprice} ;;
    filters: [l_orderstatus: "F"]
    value_format_name: usd
    description: "Total price of completed sales"
  }

  measure: total_cost {
    label: "Total_Cost"
    description: "Total Cost"
    type: sum
    sql: ${l_supplycost};;
    value_format_name: usd
  }

  measure: total_gross_margin_amount {
    label: "Total Gross Margin Amount"
    description: "Total Gross Revenue – Total Cost"
    type: number
    sql: ${total_gross_revenue}-${total_cost} ;;
    value_format_name: usd
  }

  measure: gross_margin_percentage {
    type: number
    sql: CASE
          WHEN ${total_gross_revenue} = 0 THEN 0
          ELSE ${total_gross_margin_amount} / ${total_gross_revenue}
         END ;;
    value_format_name: percent_2
    description: "Total Gross Margin Amount / Total Gross Revenue"
  }

  measure: number_of_items_returned {
    type: count
    filters: [l_returnflag: "Y"]  # Adjust filter based on your status field name
    description: "Number of items that were returned by dissatisfied customers"
  }

  measure: total_items_sold {
    type: count
    description: "Number of items that were sold"
  }

  measure: item_return_rate {
    type: number
    sql: CASE
          WHEN ${total_items_sold} = 0 THEN 0
          ELSE ${number_of_items_returned}::float / ${total_items_sold}
         END ;;
    value_format_name: percent_2
    description: "Number Of Items Returned / Total Number Of Items Sold"
  }

  measure: average_spend_per_customer {
    type: number
    sql: CASE
          WHEN ${d_customer.total_customers} = 0 THEN 0
          ELSE ${total_sale_price} / ${d_customer.total_customers}
         END ;;
    value_format_name: usd
    description: "Total Sale Price / Total Number of Customers"
  }


  # dimension: l_extendedprice {
  #   type: number
  #   sql: ${TABLE}.l_extendedprice ;;
  # }

  dimension: l_availqty {
    type: number
    sql: ${TABLE}."L_AVAILQTY" ;;
  }
  dimension: l_clerk {
    type: string
    sql: ${TABLE}."L_CLERK" ;;
  }
  dimension: l_commitdatekey {
    type: number
    sql: ${TABLE}."L_COMMITDATEKEY" ;;
  }
  dimension: l_custkey {
    type: number
    sql: ${TABLE}."L_CUSTKEY" ;;
  }
  dimension: l_discount {
    type: number
    sql: ${TABLE}."L_DISCOUNT" ;;
  }
  dimension: l_extendedprice {
    type: number
    sql: ${TABLE}."L_EXTENDEDPRICE" ;;
  }
  dimension: l_linenumber {
    type: number
    sql: ${TABLE}."L_LINENUMBER" ;;
  }
  dimension: l_orderdatekey {
    type: number
    sql: ${TABLE}."L_ORDERDATEKEY" ;;
  }
  dimension: l_orderkey {
    type: number
    sql: ${TABLE}."L_ORDERKEY" ;;
  }
  dimension: l_orderpriority {
    type: string
    sql: ${TABLE}."L_ORDERPRIORITY" ;;
  }
  dimension: l_orderstatus {
    type: string
    sql: ${TABLE}."L_ORDERSTATUS" ;;
  }
  dimension: l_partkey {
    type: number
    sql: ${TABLE}."L_PARTKEY" ;;
  }
  dimension: l_quantity {
    type: number
    sql: ${TABLE}."L_QUANTITY" ;;
  }
  dimension: l_receiptdatekey {
    type: number
    sql: ${TABLE}."L_RECEIPTDATEKEY" ;;
  }
  dimension: l_returnflag {
    type: string
    sql: ${TABLE}."L_RETURNFLAG" ;;
  }
  dimension: l_shipdatekey {
    type: number
    sql: ${TABLE}."L_SHIPDATEKEY" ;;
  }
  dimension: l_shipinstruct {
    type: string
    sql: ${TABLE}."L_SHIPINSTRUCT" ;;
  }
  dimension: l_shipmode {
    type: string
    sql: ${TABLE}."L_SHIPMODE" ;;
  }
  dimension: l_shippriority {
    type: number
    sql: ${TABLE}."L_SHIPPRIORITY" ;;
  }
  dimension: l_suppkey {
    type: number
    sql: ${TABLE}."L_SUPPKEY" ;;
  }
  dimension: l_supplycost {
    type: number
    sql: ${TABLE}."L_SUPPLYCOST" ;;
  }
  dimension: l_tax {
    type: number
    sql: ${TABLE}."L_TAX" ;;
  }
  dimension: l_totalprice {
    type: number
    sql: ${TABLE}."L_TOTALPRICE" ;;
  }
  measure: count {
    type: count
  }
}
