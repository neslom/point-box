class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :first_name
      t.text :last_name
      t.text :password_digest
      t.text :available_points
      t.text :redeemed_points
      t.integer :role, default: 0

      t.timestamps null: false
    end
  end
end
