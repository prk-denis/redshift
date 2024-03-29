view: order_items_with_details {
  sql_table_name: test.order_items_with_details ;;

#---------------------------------------------------------
# FILTERS AND PARAMETRS
#---------------------------------------------------------

  filter: date_time_filter {
    type: date_time
    datatype: datetime
  }
  parameter: timeframe_picker {
    label: "Date Granularity"
    type: unquoted
    allowed_value: { value: "Day" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
    allowed_value: { value: "Year" }
    default_value: "Day"
  }
  parameter: dimension_picker {
    label: "Dimension Selector"
    type: string
    allowed_value: { value: "Discount Bucket" }
    allowed_value: { value: "Discount Name" }
    allowed_value: { value: "Vendor" }
    allowed_value: { value: "Brand" }
    default_value: "Discount Bucket"
  }
  parameter: dimension2_picker {
    label: "Dimension Selector 2"
    type: string
    allowed_value: { value: "Vendor" }
    allowed_value: { value: "Brand" }
    allowed_value: { value: "Category" }
    default_value: "Vendor"
  }
  parameter: product_category_picker {
    label: "Selected Category"
    type: string
    suggest_dimension: product_parent_category
  }
  parameter: staff_picker {
    label: "Selected Employee"
    type: string
    suggest_dimension: cashier_name
  }

#---------------------------------------------------------
# ORIGINAL TABLE FEILDS AS DIMENSIONS
#---------------------------------------------------------

  dimension: account_name {
    type: string
    sql: ${TABLE}.domain_prefix ;;
  }
  dimension: office_name {
    type: string
    suggest_persist_for: "24 hours"
    sql: ${TABLE}.office_name ;;
  }
  dimension: office_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.office_id ;;
  }
  dimension: comp_id {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.comp_id ;;
  }
  dimension: id {
    type: number
    value_format_name: id
    sql: ${TABLE}.id ;;
  }
  dimension: order_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.order_id ;;
  }
  dimension: product_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.product_id ;;
  }
  dimension: product_name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: prod_sku {
    type: string
    sql: ${TABLE}.prod_sku ;;
  }
  dimension: descr {
    type: string
    sql: ${TABLE}.descr ;;
  }
  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }
  dimension: item_discount_name{
    type: string
    sql: ${TABLE}.item_discount_name ;;
  }
  dimension: cart_discount_name{
    type: string
    sql: ${TABLE}.cart_discount_name;;
  }
  dimension: price_type {
    type: string
    sql: ${TABLE}.price_type ;;
  }
  dimension: price_per {
    type: string
    value_format_name: usd
    sql: ${TABLE}.price_per ;;
  }
  dimension: charge_by {
    type: string
    sql: ${TABLE}.charge_by ;;
  }
  dimension: product_cost {
    type: number
    alias: [price]
    value_format_name: usd
    sql: ${TABLE}.price ;;
  }
  dimension: quantity {
    type: number
    value_format_name: decimal_2
    sql: ${TABLE}.qty ;;
  }
  dimension: quantity_free {
    type: number
    value_format_name: decimal_2
    sql: ${TABLE}.qty_free ;;
  }
  dimension: amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.amount ;;
  }
  dimension: tax {
    type: number
    value_format_name: usd
    sql: ${TABLE}.tax ;;
  }
  dimension: order_sum_tax {
    type: number
    value_format_name: usd
    sql: ${TABLE}.order_sum_tax ;;
  }
  dimension: discount_value {
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.discount_value ;;
  }
  dimension: discount_type_bak {
    type: string
    sql: ${TABLE}.discount_type_bak ;;
  }
  dimension: total_amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.total_amount ;;
  }
  dimension: order_total_amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.order_total_amount ;;
  }
  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }
  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }
  dimension: is_charge_by_order {
    type: yesno
    sql: ${TABLE}.is_charge_by_order ;;
  }
  dimension: is_free {
    type: yesno
    sql: ${TABLE}.is_free ;;
  }
  dimension: free_discount {
    type: number
    sql: ${TABLE}.free_discount ;;
  }
  dimension: income {
    type: number
    value_format_name: usd
    sql: ${TABLE}.income ;;
  }
  dimension: discount_amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.discount_amount ;;
  }
  dimension: total_discount_amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.total_discount_amount ;;
  }
  dimension: item_discount_amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.item_discount_amount ;;
  }
  dimension: cart_discount_amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.cart_discount_amount ;;
  }
  dimension: item_type {
    type: string
    sql: ${TABLE}.item_type ;;
  }
  dimension: count {
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.count ;;
  }
  dimension: special_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.special_id ;;
  }
  dimension: special_item_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.special_item_id ;;
  }
  dimension: is_half_eighth {
    type: yesno
    sql: ${TABLE}.is_half_eighth ;;
  }
  dimension: is_returned {
    type: yesno
    sql: ${TABLE}.is_returned ;;
  }
  dimension: returned_amount {
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.returned_amount ;;
  }
  dimension: discount_type {
    type: number
    value_format_name: id
    sql: ${TABLE}.discount_type ;;
  }
  dimension: free_amount {
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.free_amount ;;
  }
  dimension: paid_amount {
    type: number
    value_format_name:  usd
    sql: ${TABLE}.paid_amount ;;
  }
  dimension: wcii_cart_item {
    type: string
    value_format: ""
    sql: ${TABLE}.wcii_cart_item ;;
  }
  dimension_group: sync_created {
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
    sql: ${TABLE}.sync_created_at ;;
  }
  dimension_group: sync_updated {
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
    sql: ${TABLE}.sync_updated_at ;;
  }
  dimension: product_checkin_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.product_checkin_id ;;
  }
  dimension: is_excise {
    type: yesno
    sql: ${TABLE}.is_excise ;;
  }
  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }
  dimension: is_marijuana_product {
    type: yesno
    sql: ${TABLE}.is_marijuana_product ;;
  }
  dimension: product_is_tax_exempt {
    type: yesno
    sql: ${TABLE}.product_is_tax_exempt ;;
  }
  dimension: is_metrc {
    type: yesno
    sql: ${TABLE}.is_metrc ;;
  }
  dimension: is_under_package_control {
    type: yesno
    sql: ${TABLE}.is_under_package_control ;;
  }
  dimension: base_amount {
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.base_amount ;;
  }
  dimension: discount_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.discount_id ;;
  }
  dimension: delivery_tax {
    type: number
    value_format_name: usd
    sql: ${TABLE}.delivery_tax ;;
  }
  dimension: discount_count {
    type: number
    value_format_name: usd
    sql: ${TABLE}.discount_count ;;
  }
  dimension: is_exchanged {
    type: yesno
    sql: ${TABLE}.is_exchanged ;;
  }
  dimension_group: exchanged {
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
    sql: ${TABLE}.exchanged_at ;;
  }
  dimension: product_brutto_weight {
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.product_brutto_weight ;;
  }
  dimension: product_brutto_weight_validation {
    type: yesno
    sql: ${TABLE}.product_brutto_weight_validation ;;
  }
  dimension_group: confirmed {
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
    sql: ${TABLE}.confirmed_at ;;
  }
  dimension: brand_name {
    type: string
    value_format: ""
    sql: ${TABLE}.brand_name ;;
  }
  dimension: product_direct_category {
    type: string
    value_format: ""
    sql: ${TABLE}.product_direct_category ;;
  }
  dimension: product_parent_category {
    type: string
    value_format: ""
    sql: ${TABLE}.product_parent_category ;;
  }
  dimension: product_sub_category_1 {
    type: string
    sql: ${TABLE}.product_sub_category_1 ;;
  }
  dimension: product_sub_category_2 {
    type: string
    value_format: ""
    sql: ${TABLE}.product_sub_category_2 ;;
  }
  dimension: order_number {
    type: string
    sql: ${TABLE}.order_number ;;
  }
  dimension: cashier_name {
    type: string
    sql: ${TABLE}.cashier_name ;;

  }
  dimension: cashier_or_others {
    type: string
    sql:
      {% if staff_picker._in_query %}
        CASE ${TABLE}.cashier_name
          WHEN ${selected_staff}
          THEN ${TABLE}.cashier_name
          ELSE 'All Others'
        END
      {% else %}
        'All'
      {% endif %} ;;
  }
  dimension: patient_full_name {
    type: string
    value_format: ""
    sql: ${TABLE}.patient_full_name ;;
  }
  dimension: patient_groups {
    type: string
    value_format: ""
    sql: ${TABLE}.patient_groups ;;
  }
  dimension: patient_state_name {
    type: string
    value_format: ""
    sql: ${TABLE}.patient_state_name ;;
  }
  dimension: patient_city_name {
    type: string
    value_format: ""
    sql: ${TABLE}.patient_city_name ;;
  }
  dimension: patient_dmv {
    type: string
    value_format: ""
    sql: ${TABLE}.patient_dmv ;;
  }
  dimension: patient_zip_name {
    type: string
    value_format: ""
    sql: ${TABLE}.patient_zip_name ;;
  }




#---------------------------------------------------------
# DERIVED DIMENSIONS
#---------------------------------------------------------
  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${comp_id}, CONCAT(000, ${id})) ;;
  }
  dimension: is_benchmark_month {
    type: yesno
    sql: ${confirmed_date} >= DATEADD(month,-1,DATE_TRUNC('month',current_date))
      or (${confirmed_date} >= DATEADD(month,-12,DATE_TRUNC('month',current_date))
        and ${confirmed_date} < DATEADD(month,-11,DATE_TRUNC('month',current_date)));;
  }
  dimension: unit_price {
    type: number
    sql: CASE ${count} WHEN 0 THEN 0 ELSE ${amount} / ${count} - ${item_discount_amount}/${count}  END ;;
    value_format_name: usd
  }
  dimension: order_item_quantity {
    type: number
    sql: (${quantity} + ${quantity_free}) * ${count};;
    value_format_name: decimal_2
  }
  dimension: gross_sale {
    type: number
    sql: ${paid_amount} - ${tax} ;;
    value_format_name: usd
  }
  dimension: refund_wo_tax {
    type: number
    sql: COALESCE(${returned_amount} - (${returned_amount} * ${tax} / NULLIF(${paid_amount}, 0)), 0) ;;
    value_format_name: usd
  }
  dimension: net_sale {
    type: number
    sql: ${gross_sale} -  ${refund_wo_tax};;
    value_format_name: usd
  }
  dimension: cogs {
    type: number
    sql: ${product_cost} * ${order_item_quantity} ;;
    value_format_name: usd
  }
  dimension: profit {
    type: number
    sql: ${net_sale} - ${cogs};;
    value_format_name: usd
  }
  dimension: is_discounted {
    type: yesno
    sql: ${cart_discount_amount}>0 OR ${item_discount_amount}>0;;
  }
  dimension: discount_amount_calculated {
    type: number
    sql: ${amount} - ${gross_sale} ;;
  }
  dimension: date_dynamic {
    type: string
    label_from_parameter: timeframe_picker
    description: "Use with timeframe picker to change date granularity"
    sql:
      {% if timeframe_picker._parameter_value == 'Day' %} ${confirmed_date}
      {% elsif timeframe_picker._parameter_value == 'Week' %} ${confirmed_week}
      {% elsif timeframe_picker._parameter_value == 'Month' %} ${confirmed_month}
      {% elsif timeframe_picker._parameter_value == 'Year' %} ${confirmed_year}
      {% else %} null {% endif %} ;;
  }
  dimension: discount_tier {
    type: tier
    tiers: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    style: integer
    value_format: "0"
    sql:
          CASE WHEN ${amount} IS NOT NULL AND ${amount} <> 0
          THEN (${discount_amount_calculated}) / coalesce(${amount}, NULL)
          ELSE Null END * 100
        ;;
  }
  dimension: discount_name_combined {
    type: string
    sql: CONCAT(NVL2(${item_discount_name},CONCAT(${item_discount_name}, ' '), ''), NVL(${cart_discount_name},''));;
  }
  dimension: has_discount_name {
    type: yesno
    sql: (${item_discount_name} is not null and ${item_discount_name} <> '')
          or (${cart_discount_name} is not null and ${cart_discount_name} <> '');;
  }
  dimension: dimension_by_selector {
    label_from_parameter: dimension_picker
    type: string
    description: "Use with dimension picker to change dimension"
    sql:
      {% if dimension_picker._parameter_value == "'Discount Bucket'" %} ${discount_tier}
      {% elsif dimension_picker._parameter_value == "'Discount Name'" %} ${discount_name_combined}
      {% elsif dimension_picker._parameter_value == "'Vendor'" %} ${vendor_name}
      {% elsif dimension_picker._parameter_value == "'Brand'" %} ${brand_name}
      {% else %} NULL {% endif %} ;;
  }
  dimension: dimension2_by_selector {
    label_from_parameter: dimension2_picker
    type: string
    description: "Use with dimension picker to change dimension 2"
    sql:
      {% if dimension2_picker._parameter_value == "'Vendor'" %} ${vendor_name}
      {% elsif dimension2_picker._parameter_value == "'Brand'" %} ${brand_name}
      {% elsif dimension2_picker._parameter_value == "'Category'" %} ${product_parent_category}
      {% else %} NULL {% endif %} ;;
  }
  dimension: selected_category {
    label_from_parameter: product_category_picker
    type: string
    description: "Use with dimension picker to change product category"
    sql:
      {% if product_category_picker._in_query %}
       {{ product_category_picker._parameter_value }}
      {% else %}
        'All'
      {% endif %} ;;
  }
  dimension: is_product_category_selected {
    type: yesno
    description: "Use with dimension picker to change dimension"
    sql: {{ product_category_picker._parameter_value }} = ${product_parent_category} ;;
  }
  dimension: selected_staff {
    label_from_parameter: staff_picker
    type: string
    description: "Use with dimension picker to change staff"
    sql:
      {% if staff_picker._in_query %}
       {{ staff_picker._parameter_value }}
      {% else %}
        'All'
      {% endif %} ;;
  }
  dimension: is_staff_selected {
    type: yesno
    description: "Use with dimension picker to change dimension"
    sql: {{ staff_picker._parameter_value }} = ${cashier_name} ;;
  }


#---------------------------------------------------------
# MEASURES BASIC
#---------------------------------------------------------
  measure: count_rows {
    label: "Order Items Count"
    type: count
  }
  measure: orders_count {
    type: count_distinct
    sql: ${order_id} ;;
  }
  measure: list_price {
    type: list
    list_field: amount
    value_format_name: usd
  }
  measure: sum_amount {
    type: sum
    sql: ${amount} ;;
    value_format_name: usd
  }
  measure: sum_tax {
    type: sum
    sql: ${tax} ;;
    value_format_name: usd
  }
  measure: sum_discount_amount_calculated {
    type: sum
    sql: ${discount_amount_calculated} ;;
    value_format_name: usd
  }
  measure: sum_quantity {
    type: sum
    sql: ${quantity} ;;
    value_format_name: decimal_0
  }
  measure: sum_cogs {
    type: sum
    sql: ${cogs} ;;
    value_format_name: usd
  }
  measure: sum_profit {
    type: sum
    sql: ${profit} ;;
    value_format_name: usd
  }
  measure: avg_ticket {
    type: number
    sql: ${sum_net_sales} / NULLIF(${orders_count}, 0) ;;
    value_format_name: usd
  }
  measure: avg_unit_price {
    type: number
    sql: ${sum_amount} / NULLIF(${sum_order_item_quantity}, 0) ;;
    value_format_name: usd
  }
  measure: avg_unit_disc_price {
    type: number
    sql: ${sum_gross_sale} / NULLIF(${sum_order_item_quantity}, 0) ;;
    value_format_name: usd
  }
  measure: avg_unit_cogs{
    type: number
    sql: ${sum_cogs} / NULLIF(${sum_order_item_quantity}, 0) ;;
    value_format_name: usd
  }
  measure: sum_total_amount {
    type: sum
    value_format_name: usd
    sql: ${total_amount} ;;
  }
  measure: number_of_rows {
    type: count
    value_format_name: decimal_0
  }
  measure: sum_gross_sale {
    type: sum
    sql: ${gross_sale} ;;
    value_format_name: usd
  }
  measure: sum_order_item_quantity {
    type: sum
    sql: ${order_item_quantity} ;;
    value_format_name: decimal_0
  }
  measure: sum_order_item_quantity_returned {
    type: sum
    sql: ${order_item_quantity} ;;
    filters: [is_returned: "yes"]
    value_format_name: decimal_0
  }
  measure: sum_order_item_quantity_discounted {
    type: sum
    sql: ${order_item_quantity} ;;
    filters: [is_discounted: "yes"]
    value_format_name: decimal_0
  }
  measure: sum_discount_amount {
    type: sum
    sql: ${discount_amount} ;;
    value_format_name: usd
  }
  measure: sum_refund_wo_tax {
    type: sum
    sql: ${refund_wo_tax} ;;
    value_format_name: usd
  }
  measure:  sum_net_sales {
    type: sum
    sql:  ${net_sale};;
    value_format_name: usd
  }
  measure: sum_income {
    type: sum
    sql: ${income} ;;
    value_format_name: usd
  }
  measure: sum_returned_amount {
    type: sum
    sql: ${returned_amount} ;;
    value_format_name: usd
  }
  measure: gross_margin_percent {
    type: number
    sql: ${sum_profit} / NULLIF(${sum_net_sales}, 0) ;;
    value_format_name: percent_1
  }
  measure: gross_discount_percent {
    type: number
    sql: ${sum_discount_amount_calculated} / NULLIF(${sum_amount}, 0) ;;
    value_format_name: percent_1
  }



#---------------------------------------------------------
# MEASURES PREFILTERED
#---------------------------------------------------------
  measure:  sum_net_sales_in_range {
    type: sum
    sql: CASE WHEN ${confirmed_time} between {% date_start date_time_filter %} and {% date_end date_time_filter %}
      THEN ${net_sale} END;;
    value_format_name: usd
  }
  measure:  sum_gross_sales_in_range {
    type: sum
    sql: CASE WHEN ${confirmed_time} between {% date_start date_time_filter %} and {% date_end date_time_filter %}
      THEN ${gross_sale} END;;
    value_format_name: usd
  }
  measure:  sum_order_item_quantity_in_range {
    type: sum
    sql: CASE WHEN ${confirmed_time} between {% date_start date_time_filter %} and {% date_end date_time_filter %}
      THEN ${order_item_quantity} END;;
    value_format_name: decimal_0
  }
  measure:  sum_profit_in_range {
    type: sum
    sql: CASE WHEN ${confirmed_time} between {% date_start date_time_filter %} and {% date_end date_time_filter %}
      THEN ${profit} END;;
    value_format_name: usd
  }
  measure:  sum_cogs_in_range {
    type: sum
    sql: CASE WHEN ${confirmed_time} between {% date_start date_time_filter %} and {% date_end date_time_filter %}
      THEN ${cogs} END;;
    value_format_name: usd
  }
  measure:  sum_amount_in_range {
    type: sum
    sql: CASE WHEN ${confirmed_time} between {% date_start date_time_filter %} and {% date_end date_time_filter %}
      THEN ${amount} END;;
    value_format_name: usd
  }
  measure:  sum_discount_amount_in_range {
    type: sum
    sql: CASE WHEN ${confirmed_time} between {% date_start date_time_filter %} and {% date_end date_time_filter %}
      THEN ${discount_amount_calculated} END;;
    value_format_name: usd
  }
  measure:  avg_unit_price_in_range {
    type: number
    sql: ${sum_amount_in_range} / NULLIF(${sum_order_item_quantity_in_range}, 0) ;;
    value_format_name: usd
  }
  measure:  avg_unit_disc_price_in_range {
    type: number
    sql: ${sum_gross_sales_in_range} / NULLIF(${sum_order_item_quantity_in_range}, 0) ;;
    value_format_name: usd
  }
  measure: avg_cost_per_unit {
    type: average
    sql: ${product_cost} ;;
    value_format_name: usd
  }





#---------------------------------------------------------
# FIELDS FOR DRILLING
#---------------------------------------------------------
  drill_fields: [discount_name_combined, order_id, order_number, id, product_name, office_name, amount, paid_amount, tax, gross_sale, order_item_quantity]
}
