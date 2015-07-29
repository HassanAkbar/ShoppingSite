class ChangeDescriptionType < ActiveRecord::Migration
  def change
  	change_column :items, :description,  :text
  	change_column :reviews, :description,  :text
  end
end
