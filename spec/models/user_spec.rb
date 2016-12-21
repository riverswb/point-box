require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid whithout a name" do
        user = User.new(email: "test@test.com", password: "abc")

        expect(user).to be_invalid
      end

      it "is invalid without an email" do
        user = User.new(name: "John", password: "abc")

        expect(user).to be_invalid
      end

      it "is invalid without a password" do
        user = User.new(name: "John", email: "test@test.com")

        expect(user).to be_invalid
      end

      it "is invalid if email is not unique" do
        User.create(name: "John", email: "test@test.com", password: "abd")
        user = User.new(name: "Jack", email: "test@test.com", password: "123")

        expect(user).to be_invalid
      end
    end
  end
end
