class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :customer, index: true, foreign_key: true
      t.datetime :checkout_date
      t.string :order_state
      t.datetime :order_delivered_date

      t.timestamps null: false
    end
    add_index(:orders, :order_state, name: 'orders_list_by_state')
    add_index(:orders, :customer_id, name: 'orders_list_by_id')
  end
end
