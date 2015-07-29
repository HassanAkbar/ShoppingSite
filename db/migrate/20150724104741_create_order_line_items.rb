class CreateOrderLineItems < ActiveRecord::Migration
  def change
    create_table :order_line_items do |t|
      t.belongs_to :order, index: true, foreign_key: true
      t.belongs_to :item, index: true, foreign_key: true
      t.integer :quantity
      t.decimal :price, :precision => 20, :scale => 2 #percision and scale

      t.timestamps null: false
    end
     add_index(:order_line_items, :quantity, name: 'order_line_items_by_quanitity')
     add_index(:order_line_items, :price, name: 'order_line_items_by_price')
  end
end

