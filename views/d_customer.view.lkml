view: d_customer {
  sql_table_name: "DATA_MART"."D_CUSTOMER" ;;

  dimension: c_address {
    type: string
    sql: ${TABLE}."C_ADDRESS" ;;
  }
  dimension: c_custkey {
    type: number
    primary_key: yes
    sql: ${TABLE}."C_CUSTKEY" ;;
  }
  dimension: c_mktsegment {
    type: number
    sql: ${TABLE}."C_MKTSEGMENT" ;;
  }
  dimension: c_name {
    type: string
    sql: ${TABLE}."C_NAME" ;;
  }
  dimension: c_nation {
    type: string
    sql: ${TABLE}."C_NATION" ;;
  }
  dimension: c_phone {
    type: string
    sql: ${TABLE}."C_PHONE" ;;
  }
  dimension: c_region {
    type: string
    sql: ${TABLE}."C_REGION" ;;
    link: {
      label: "Target"
      url: "https://epam.cloud.looker.com/dashboards/332?Customer+Region={{ value }}"
    }
  }
  measure: count {
    type: count
    drill_fields: [c_name]
  }
  measure: total_customers {
    type: count_distinct
    sql: ${TABLE}.C_CUSTKEY ;;
    drill_fields: [c_name]
  }
}
