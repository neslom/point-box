class CreateRedeemedRewards < ActiveRecord::Migration
  def change
    create_table :redeemed_rewards do |t|
      t.belongs_to :user, index: true
      t.belongs_to :reward, index: true
    end
  end
end
