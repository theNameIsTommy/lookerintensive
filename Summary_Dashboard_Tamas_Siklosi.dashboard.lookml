---
  - dashboard: summary_dashboard
    title: Summary Dashboard Tamas Siklosi
    layout: newspaper
    preferred_viewer: dashboards-next
    crossfilter_enabled: true
    description: 'Business Performance Overview Dashboard'
    preferred_slug: o3x2un1RNUY5pdHDcXvT48
    elements:

    - title: Total Orders
      name: New Tile
      model: looker_intensive15_tamas_siklosi
      explore: f_lineitems
      type: single_value
      fields: [f_lineitems.count]
      filters:
        order_date.date_val_date: 1995/01/01
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      custom_color: "#2E7CE2"
      single_value_title: Total Number of Orders for 1 Jan 1995
      value_format: "#,##0"
      defaults_version: 1
      hidden_pivots: {}
      listen:
        C Region: d_customer.c_region
      row: 0
      col: 0
      width: 6
      height: 4

    - title: Revenue
      name: New Tile (2)
      model: looker_intensive15_tamas_siklosi
      explore: f_lineitems
      type: single_value
      fields: [f_lineitems.total_gross_revenue]
      filters:
        order_date.date_val_date: 1995/01/01
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      custom_color: "#1EA8A8"
      single_value_title: Total Revenue for 1 Jan 1995
      value_format: "$#,##0"
      defaults_version: 1
      listen:
        C Region: d_customer.c_region
      row: 0
      col: 6
      width: 6
      height: 4

    - title: Returns
      name: New Tile (3)
      model: looker_intensive15_tamas_siklosi
      explore: f_lineitems
      type: single_value
      fields: [f_lineitems.number_of_items_returned]
      filters:
        order_date.year: '1995'
        order_date.month_num: '1'
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      custom_color: "#E57947"
      single_value_title: Total Number of Returns over Jan 1995
      value_format: "#,##0"
      defaults_version: 1
      hidden_pivots: {}
      listen:
        C Region: d_customer.c_region
      row: 0
      col: 12
      width: 6
      height: 4

    - title: Margin
      name: New Tile (4)
      model: looker_intensive15_tamas_siklosi
      explore: f_lineitems
      type: single_value
      fields: [f_lineitems.gross_margin_percentage]
      filters:
        order_date.year: '1995'
        order_date.month_num: '1'
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      custom_color: "#34A853"
      single_value_title: Gross Margin % over Jan 1995
      value_format: "0.00%"
      defaults_version: 1
      hidden_pivots: {}
      listen:
        C Region: d_customer.c_region
      row: 0
      col: 18
      width: 6
      height: 4

    - title: Revenue and Profit in 1995
      name: Revenue and Profit in 1995
      model: looker_intensive15_tamas_siklosi
      explore: f_lineitems
      type: looker_column
      fields: [f_lineitems.total_gross_margin_amount, order_date.month_name, f_lineitems.total_gross_revenue,
        order_date.date_val_month]
      filters:
        order_date.year: '1995'
      sorts: [order_date.date_val_month]
      limit: 500
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: ''
      limit_displayed_rows: false
      legend_position: center
      point_style: circle
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      color_application:
        collection_id: ed5756e2-1ba8-4233-97d2-d565e309c03b
        palette_id: ff31218a-4f9d-493c-ade2-22266f5934b8
        options:
          steps: 5
      series_types:
        f_lineitems.total_gross_margin_amount: line
      series_colors:
        f_lineitems.total_gross_revenue: "#1EA8A8"
        f_lineitems.total_gross_margin_amount: "#34A853"
      defaults_version: 1
      hidden_pivots: {}
      show_null_points: true
      interpolation: linear
      hidden_fields: [order_date.date_val_month]
      listen:
        C Region: d_customer.c_region
      row: 4
      col: 0
      width: 12
      height: 8

    - title: Yearly Trends
      name: Yearly Trends
      model: looker_intensive15_tamas_siklosi
      explore: f_lineitems
      type: looker_column
      fields: [f_lineitems.total_gross_margin_amount, order_date.date_val_year]
      fill_fields: [order_date.date_val_year]
      sorts: [order_date.date_val_year]
      limit: 500
      dynamic_fields:
      - category: table_calculation
        expression: "${f_lineitems.total_gross_margin_amount} - offset(${f_lineitems.total_gross_margin_amount},-1)"
        label: YoY Gross Margin Amount
        value_format:
        value_format_name: usd
        _kind_hint: measure
        table_calculation: yoy_gross_margin_amount
        _type_hint: number
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: ''
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      series_colors:
        f_lineitems.total_gross_margin_amount: "#2E7CE2"
        yoy_gross_margin_amount: "#34A853"
      defaults_version: 1
      hidden_pivots: {}
      listen:
        C Region: d_customer.c_region
      row: 4
      col: 12
      width: 12
      height: 8

    - title: Account Balance Analysis
      name: Account Balance Analysis
      model: looker_intensive15_tamas_siklosi
      explore: f_lineitems
      type: looker_pie
      fields: [f_lineitems.total_gross_revenue, d_supplier.suppliers_cohort_by_balance]
      fill_fields: [d_supplier.suppliers_cohort_by_balance]
      limit: 500
      value_labels: labels
      label_type: labPer
      inner_radius: 45
      start_angle: -90
      end_angle: 90
      color_application:
        collection_id: ed5756e2-1ba8-4233-97d2-d565e309c03b
        palette_id: ff31218a-4f9d-493c-ade2-22266f5934b8
        options:
          steps: 5
          reverse: true
      series_colors: {}
      defaults_version: 1
      hidden_pivots: {}
      listen:
        C Region: d_customer.c_region
      row: 12
      col: 12
      width: 12
      height: 8

    - title: Revenue Source Comparison in 1995
      name: Revenue Source Comparison in 1995
      model: looker_intensive15_tamas_siklosi
      explore: f_lineitems
      type: looker_pie
      fields: [f_lineitems.total_gross_margin_amount, f_lineitems.l_shipmode]
      filters:
        order_date.year: '1995'
        f_lineitems.l_orderstatus: F
      sorts: [f_lineitems.total_gross_margin_amount desc 0]
      limit: 500
      value_labels: labels
      label_type: labPer
      inner_radius: 45
      start_angle: -90
      end_angle: 90
      color_application:
        collection_id: ed5756e2-1ba8-4233-97d2-d565e309c03b
        palette_id: ff31218a-4f9d-493c-ade2-22266f5934b8
        options:
          steps: 5
      series_colors: {}
      defaults_version: 1
      hidden_pivots: {}
      listen:
        C Region: d_customer.c_region
      row: 12
      col: 0
      width: 12
      height: 8

    - title: Top Suppliers in 1995
      name: Top Suppliers in 1995
      model: looker_intensive15_tamas_siklosi
      explore: f_lineitems
      type: looker_column
      fields: [d_supplier.s_name, f_lineitems.total_gross_revenue, f_lineitems.gross_margin_percentage]
      sorts: [f_lineitems.total_gross_revenue desc 0]
      limit: 10
      dynamic_fields:
      - category: table_calculation
        label: Gross Revenue Percentage
        value_format:
        value_format_name: percent_2
        calculation_type: percent_of_column_sum
        table_calculation: gross_revenue_percentage
        args:
        - f_lineitems.total_gross_revenue
        _kind_hint: measure
        _type_hint: number
      x_axis_gridlines: true
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: ''
      limit_displayed_rows: false
      legend_position: center
      series_types:
        gross_revenue_percentage: line
      series_colors:
        f_lineitems.total_gross_revenue: "#1EA8A8"
        gross_revenue_percentage: "#34A853"
      defaults_version: 1
      hidden_pivots: {}
      hidden_fields: [f_lineitems.gross_margin_percentage]
      listen:
        C Region: d_customer.c_region
      row: 20
      col: 0
      width: 12
      height: 8

    - title: Region Sales Comparison in 1995
      name: Region Sales Comparison in 1995
      model: looker_intensive15_tamas_siklosi
      explore: f_lineitems
      type: looker_column
      fields: [f_lineitems.total_items_sold, d_customer.c_region, f_lineitems.l_orderstatus]
      pivots: [f_lineitems.l_orderstatus]
      filters:
        order_date.year: '1995'
      sorts: [f_lineitems.l_orderstatus, f_lineitems.total_items_sold desc 0]
      limit: 500
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: true
      y_axis_reversed: true
      plot_size_by_field: false
      trellis: ''
      stacking: percent
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      show_value_labels: true
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      color_application:
        collection_id: ed5756e2-1ba8-4233-97d2-d565e309c03b
        palette_id: ff31218a-4f9d-493c-ade2-22266f5934b8
        options:
          steps: 5
      series_colors: {}
      defaults_version: 1
      hidden_pivots: {}
      listen:
        C Region: d_customer.c_region
      row: 20
      col: 12
      width: 12
      height: 8

    - title: Month-to-Date comparison between Dec 1994 and Jan 1995
      name: Month-to-Date comparison between Dec 1994 and Jan 1995
      model: looker_intensive15_tamas_siklosi
      explore: f_lineitems
      type: looker_column
      fields: [order_date.month_name, f_lineitems.count, order_date.date_val_day_of_month]
      pivots: [order_date.month_name]
      fill_fields: [order_date.date_val_day_of_month]
      filters:
        order_date.date_val_date: 1994/12/01 to 1995/02/01
      sorts: [order_date.month_name, order_date.date_val_day_of_month]
      limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: "${f_lineitems.count}/pivot_offset(${f_lineitems.count},-1)"
        label: MTD Number of Sales
        value_format:
        value_format_name: percent_0
        _kind_hint: measure
        table_calculation: mtd_number_of_sales
        _type_hint: number
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: ''
      limit_displayed_rows: false
      legend_position: center
      series_colors:
        Dec - mtd_number_of_sales: "#2E7CE2"
        Jan - mtd_number_of_sales: "#1EA8A8"
      defaults_version: 1
      hidden_pivots: {}
      hidden_fields: [f_lineitems.count]
      listen:
        C Region: d_customer.c_region
      row: 28
      col: 0
      width: 12
      height: 9


    - title: test_view
      name: test_view
      model: looker_intensive15_tamas_siklosi
      explore: f_lineitems
      type: looker_funnel
      fields: [f_lineitems.l_shipmode, f_lineitems.count]
      filters:
      d_supplier.region: ''
      d_dates.current_date_year: ''
      d_supplier.nation: ''
      sorts: [f_lineitems.count desc 0]
      limit: 500
      column_limit: 50
      leftAxisLabelVisible: false
      leftAxisLabel: ''
      rightAxisLabelVisible: false
      rightAxisLabel: ''
      smoothedBars: false
      orientation: automatic
      labelPosition: inline
      percentType: total
      percentPosition: hidden
      valuePosition: left
      labelColorEnabled: false
      labelColor: "#FFF"
      show_view_names: false
      show_row_numbers: true
      transpose: false
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: true
      table_theme: editable
      limit_displayed_rows: false
      enable_conditional_formatting: false
      header_text_alignment: left
      header_font_size: 12
      rows_font_size: 12
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      value_labels: legend
      label_type: labPer
      start_angle:
      color_application:
        collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
        palette_id: f0077e50-e03c-4a7e-930c-7321b2267283
        options:
          steps: 5
          reverse: true
      series_colors:
        SHIP: "#12B5CB"
        FOB: "#76e85e"
        AIR: "#FF8168"
        RAIL: "#fffc5f"
        REG AIR: "#8c95f5"
      series_labels: {}
      up_color: "#7CB342"
      down_color: "#EA4335"
      total_color: "#FF8168"
      show_value_labels: false
      show_x_axis_ticks: true
      show_x_axis_label: true
      x_axis_scale: auto
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_gridlines: true
      isStepped: false
      labelOverlap: false
      x_axis_gridlines: false
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: ''
      legend_position: center
      point_style: none
      label_density: 25
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      truncate_column_names: false
      font_size: 14
      charts_across:
      hide_legend: false
      arm_length: 25
      arm_weight: 50
      spinner_length: 100
      spinner_weight: 50
      angle: 90
      cutout: 50
      range_x: 1
      range_y: 1
      defaults_version: 1
      show_null_points: true
      interpolation: linear
      hidden_fields: []
      hidden_points_if_no: []
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      groupBars: true
      labelSize: 10pt
      showLegend: true
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: light
      map_position: fit_data
      map_scale_indicator: 'off'
      map_pannable: true
      map_zoomable: true
      map_marker_type: circle
      map_marker_icon_name: default
      map_marker_radius_mode: proportional_value
      map_marker_units: meters
      map_marker_proportional_scale_type: linear
      map_marker_color_mode: fixed
      show_legend: true
      quantize_map_value_colors: false
      reverse_map_value_colors: false

    # - title: Region Detailed Stats
    #   name: Region Detailed Stats
    #   model: looker_intensive15_tamas_siklosi
    #   explore: f_lineitems
    #   type: table
    #   fields: [f_lineitems.total_items_sold, d_customer.c_region, order_status]
    #   pivots: [order_status]
    #   sorts: [order_status, f_lineitems.total_items_sold asc 0]
    #   limit: 10
    #   total: true
    #   row_total: right
    #   dynamic_fields:
    #   - category: table_calculation
    #     expression: "${f_lineitems.total_gross_margin_amount} - offset(${f_lineitems.total_gross_margin_amount},-1)"
    #     label: YoY Gross Margin Amount
    #     value_format:
    #     value_format_name: usd
    #     _kind_hint: measure
    #     table_calculation: yoy_gross_margin_amount
    #     _type_hint: number
    #     is_disabled: true
    #   - category: table_calculation
    #     label: Gross Revenue Percentage
    #     value_format:
    #     value_format_name: percent_2
    #     calculation_type: percent_of_column_sum
    #     table_calculation: gross_revenue_percentage
    #     args:
    #     - f_lineitems.total_gross_revenue
    #     _kind_hint: measure
    #     _type_hint: number
    #     is_disabled: true
    #   - category: table_calculation
    #     label: "% of Total per Region"
    #     value_format:
    #     value_format_name: percent_2
    #     calculation_type: percent_of_row
    #     table_calculation: of_total_per_region
    #     args:
    #     - f_lineitems.total_items_sold
    #     _kind_hint: measure
    #     _type_hint: number
    #   - category: dimension
    #     expression: |-
    #       if(${f_lineitems.l_orderstatus} = "P", "Pending ",
    #         if(${f_lineitems.l_orderstatus} = "O", "Opened ", "Finished "))
    #     label: Order Status
    #     value_format:
    #     value_format_name:
    #     dimension: order_status
    #     _kind_hint: measure
    #     _type_hint: string
    #   show_view_names: false
    #   show_row_numbers: false
    #   truncate_column_names: false
    #   hide_totals: false
    #   hide_row_totals: false
    #   table_theme: gray
    #   limit_displayed_rows: false
    #   enable_conditional_formatting: false
    #   conditional_formatting_include_totals: false
    #   conditional_formatting_include_nulls: false
    #   series_labels: {}
    #   limit_displayed_rows_values:
    #     show_hide: hide
    #     first_last: first
    #     num_rows: 0
    #   conditional_formatting: [{type: equal to, value: null, background_color: "#3EB0D5",
    #       font_color: null, color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
    #         palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
    #       strikethrough: false, fields: null}]
    #   transpose: false
    #   truncate_text: true
    #   size_to_fit: true
    #   header_text_alignment: left
    #   header_font_size: 12
    #   rows_font_size: 12
    #   x_axis_gridlines: false
    #   y_axis_gridlines: true
    #   show_y_axis_labels: true
    #   show_y_axis_ticks: true
    #   y_axis_tick_density: default
    #   y_axis_tick_density_custom: 5
    #   show_x_axis_label: true
    #   show_x_axis_ticks: true
    #   y_axis_scale_mode: linear
    #   x_axis_reversed: false
    #   y_axis_reversed: false
    #   plot_size_by_field: false
    #   x_axis_zoom: true
    #   y_axis_zoom: true
    #   trellis: ''
    #   stacking: ''
    #   hide_legend: false
    #   legend_position: center
    #   font_size: 12
    #   point_style: none
    #   show_value_labels: false
    #   label_density: 25
    #   x_axis_scale: auto
    #   y_axis_combined: true
    #   ordering: none
    #   show_null_labels: false
    #   show_totals_labels: false
    #   show_silhouette: false
    #   totals_color: "#808080"
    #   custom_color_enabled: true
    #   show_single_value_title: true
    #   show_comparison: false
    #   comparison_type: value
    #   comparison_reverse_colors: false
    #   show_comparison_label: true
    #   defaults_version: 1
    #   hidden_pivots: {}
    #   show_null_points: true
    #   interpolation: linear
    #   hidden_fields: []
    #   value_labels: legend
    #   label_type: labPer
    #   hidden_points_if_no: []
    #   listen:
    #     C Region: d_customer.c_region
    #   row: 28
    #   col: 12
    #   width: 12
    #   height: 9

    filters:
    - name: C Region
      title: C Region
      type: field_filter
      default_value: ''
      allow_multiple_values: true
      required: false
      ui_config:
        type: checkboxes
        display: popover
      model: looker_intensive15_tamas_siklosi
      explore: f_lineitems
      listens_to_filters: []
      field: d_customer.c_region
