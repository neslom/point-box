class ChangePointsColumnsOnUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :available_points, 0
    change_column_default :users, :redeemed_points, 0
  end
end
