class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :customer, index: true, foreign_key: true
      t.integer :rating
      t.string :description
      t.string :state
      t.belongs_to :item, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index(:reviews, :state, name: 'reviews_by_state')
    add_index(:reviews, :rating, name: 'reviews_by_rating')
  end
end
