require 'rails_helper'

RSpec.describe User, type: :model do
  describe ".create" do
    let(:user) { User.create(username: "molsen", password: "password") }

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

    it "starts with zero available points" do
      binding.pry
      expect(user.available_points).to eq(0)
    end

    it "starts with zero redeemed points" do
      expect(user.redeemed_points).to eq(0)
    end

    it "has default role by default" do
      expect(user.role).to eq("default")
    end

  end
end
