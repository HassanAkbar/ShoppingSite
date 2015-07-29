class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :category, index: true, foreign_key: true

      
      t.integer :available_quantity
      t.float :price_unit, :precision => 20, :scale => 2 #percision and scale
      t.string :description
      t.string :state

      t.timestamps null: false
    end
     add_index(:items, :available_quantity, name: 'items_by_available_quantity')
     add_index(:items, :state, name: 'items_by_state')
     add_index(:items, :price_unit, name: 'items_by_price_unit')
  end
end
