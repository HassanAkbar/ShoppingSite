class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :email
      t.string :phone
      t.string :password
      t.string :type

      t.timestamps null: false
    end
    add_index(:users, :email, unique: true, name: 'users_by_email')
  end
end
