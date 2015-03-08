class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.text :title
      t.integer :worth
    end
  end
end
