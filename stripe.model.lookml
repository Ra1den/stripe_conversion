- connection: demo

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: calendar
  label: 'Charges'
  joins:
    - join: charges
      type: left_outer
      relationship: one_to_many
      sql_on:  ${calendar.cal_date_date} = ${charges.created_date} 
      
    - join: customers
      type: left_outer 
      sql_on: ${charges.customer_id} = ${customers.id}
      relationship: many_to_one

    - join: invoices
      type: left_outer 
      sql_on: ${charges.invoice_id} = ${invoices.id}
      relationship: many_to_one
      
    - join: invoice_items
      type: left_outer
      sql_on: ${invoices.id} = ${invoice_items.invoice_id}
      relationship: one_to_many

    - join: discounts
      type: left_outer 
      sql_on: ${customers.discount_id} = ${discounts.id}
      relationship: many_to_one

    - join: subscriptions
      type: left_outer 
      sql_on: ${invoices.subscription_id} = ${subscriptions.id}
      relationship: many_to_one

    - join: plans
      type: left_outer 
      sql_on: ${subscriptions.plan_id} = ${plans.id}
      relationship: many_to_one
      


- explore: customer
  from: calendar
  label: 'Customers'
  joins:
    - join: customers
      type: left_outer
      sql_on: ${customer.cal_date_date} = ${customers.created_date}
      relationship: one_to_many
    - join: discounts
      type: left_outer 
      sql_on: ${customers.discount_id} = ${discounts.id}
      relationship: many_to_one



