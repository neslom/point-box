class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :username
      t.text :password_digest
      t.integer :available_points
      t.integer :redeemed_points
      t.integer :role, default: 0

      t.timestamps null: false
    end
  end
end
