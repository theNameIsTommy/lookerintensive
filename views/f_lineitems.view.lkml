view: f_lineitems {

  sql_table_name: "DATA_MART"."F_LINEITEMS"
  ;;

  dimension: prim_key {
    primary_key: yes
    hidden: yes
    label: "Primary Key"
    description: "Combination of l_orderkey and l_linenumber"
    sql: CONCAT(${l_orderkey},${l_linenumber})  ;;
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
    label: "Number of Items Returned"
    description: "Number of items that were returned by dissatisfied customers"
    type: sum
    sql: ${l_quantity} ;;
    filters: [is_returned: "yes"]
    value_format: "#,##0"
  }

  measure: total_items_sold {
    label: "Total Number of Items Sold"
    description: "Number of items that were sold"
    type: sum
    sql: ${l_quantity} ;;
    value_format: "#,##0"
  }

  measure: item_return_rate {
    label: "Item Return Rate"
    description: "Number Of Items Returned / Total Number Of Items Sold"
    type: number
    sql: ${number_of_items_returned}/NULLIF(${total_items_sold},0) ;;
    value_format: "0.00%"
    html: {% if value >= 0.5 %}
          <font color="red">{{rendered_value}}</font>
          {% elsif value >= 0.3 and value < 0.5 %}
          <font color="orange">{{rendered_value}}</font>
          {% else %}
          <font color="green">{{rendered_value}}</font>
          {% endif %}
          ;;
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


  parameter: timeframe_selector {
    type: unquoted
    default_value: "month"

    allowed_value: {
      label: "Month"
      value: "month"
    }
    allowed_value: {
      label: "Quarter"
      value: "quarter"
    }
    allowed_value: {
      label: "Year"
      value: "year"
    }
  }

  dimension: timeframe_date {
    type: date
    sql:
      {% if timeframe_selector._parameter_value == 'month' %}
        ${TABLE}.date_column
      {% elsif timeframe_selector._parameter_value == 'quarter' %}
        DATE_TRUNC('quarter', ${TABLE}.date_column)
      {% elsif timeframe_selector._parameter_value == 'year' %}
        DATE_TRUNC('year', ${TABLE}.date_column)
      {% else %}
        ${TABLE}.date_column  -- Default case if something goes wrong
      {% endif %} ;;
  }

  dimension: dynamic_timeframe {
    label_from_parameter: timeframe_selector

    sql:
      {% if timeframe_selector._parameter_value == "quarter" %} ${order_date.quarter}
      {% elsif timeframe_selector._parameter_value == "year" %} ${order_date.year}
      {% elsif timeframe_selector._parameter_value == "month" %} ${order_date.month_num}
      {% else %}
        ${TABLE}.date_column
      {% endif %}
      ;;
  }


  dimension:dynamic_timeframe_title {
    label: "Chart Title"
    type: string
    sql:
     {% if timeframe_selector._parameter_value == "quarter" %} 'Quarterly'
      {% elsif timeframe_selector._parameter_value == "year" %} 'Yearly'
      {% elsif timeframe_selector._parameter_value == "month" %} 'Monthly'
      {% endif %}
      ;;
  }



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
  dimension: is_returned {
    type: yesno
    sql: ${l_returnflag} = 'R' ;;
  }
  measure: count {
    type: count
  }
}
