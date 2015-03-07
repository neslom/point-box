require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(username: "molsen", password: "password") }

  describe ".create" do
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
      expect(user.available_points).to eq(0)
    end

    it "starts with zero redeemed points" do
      expect(user.redeemed_points).to eq(0)
    end

    it "has default role by default" do
      expect(user.role).to eq("default")
    end
  end

  context "#available_points" do
    it "can be added" do
      expect(user.available_points).to eq(0)

      user.increment(:available_points)

      expect(user.available_points).to eq(1)

      user.increment(:available_points, 10)

      expect(user.available_points).to eq(11)
    end

    it "can be subtracted" do
      user.increment(:available_points, 10)

      expect(user.available_points).to eq(10)

      user.decrement(:available_points, 5)

      expect(user.available_points).to eq(5)
    end

    context "#redeemed_points" do
      it "can be added" do
        expect(user.redeemed_points).to eq(0)

        user.increment(:redeemed_points)

        expect(user.redeemed_points).to eq(1)

        user.increment(:redeemed_points, 10)

        expect(user.redeemed_points).to eq(11)
      end

      it "can be subtracted" do
        user.increment(:redeemed_points, 10)

        expect(user.redeemed_points).to eq(10)

        user.decrement(:redeemed_points, 5)

        expect(user.redeemed_points).to eq(5)
      end

      context "#convert_points" do
        it "converts available points to redeemed points" do
          user.increment(:available_points, 10)

          expect(user.available_points).to eq(10)
          expect(user.redeemed_points).to eq(0)

          user.convert_points(5)

          expect(user.available_points).to eq(5)
          expect(user.redeemed_points).to eq(5)
        end
      end
    end

  end
end
