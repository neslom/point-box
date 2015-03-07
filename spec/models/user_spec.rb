require 'rails_helper'

RSpec.describe User, type: :model do
  describe ".create" do
    let(:user) { User.create(username: "molsen", password: "password", available_points: 10, redeemed_points: 0) }

    it "is valid with a username and password" do
      expect(user).to be_valid
    end

    it "is invalid with missing username" do
      user.username = nil
      expect(user).to_not be_valid
    end

    it "is invalid with missing password" do
      user.password = nil

      expect(user).to_not be_valid
    end
  end
end
