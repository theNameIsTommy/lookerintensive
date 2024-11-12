view: d_supplier {
  sql_table_name: "DATA_MART"."D_SUPPLIER" ;;

  dimension: s_acctbal {
    type: number
    sql: ${TABLE}."S_ACCTBAL" ;;
  }
  dimension: s_address {
    type: string
    sql: ${TABLE}."S_ADDRESS" ;;
  }
  dimension: s_name {
    type: string
    sql: ${TABLE}."S_NAME" ;;
  }
  dimension: s_nation {
    type: string
    sql: ${TABLE}."S_NATION" ;;
  }
  dimension: s_phone {
    type: string
    sql: ${TABLE}."S_PHONE" ;;
  }
  dimension: s_region {
    type: string
    sql: ${TABLE}."S_REGION" ;;
  }
  dimension: s_suppkey {
    type: number
    primary_key: yes
    sql: ${TABLE}."S_SUPPKEY" ;;
  }
  dimension: suppliers_cohort_by_balance {
    label: "Cohort of suppliers according to Account Balance"
    description: "Cohort of suppliers according to Account Balance: <= 0,1—3000,3001—5000,5001—7000,7000 <"
    type: tier
    tiers: [1,3001,5001,7001]
    style: integer
    sql: ${s_acctbal} ;;
  }
  measure: count {
    type: count
    drill_fields: [s_name]
  }
}
