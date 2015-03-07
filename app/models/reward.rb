class Reward < ActiveRecord::Base
  validates :title, presence: true
  validates :worth, presence: true
end
