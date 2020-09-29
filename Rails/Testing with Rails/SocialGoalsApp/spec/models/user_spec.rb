require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) { User.new(email: "test@test.com", password: "testing") }

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:password).is_at_least(6) }
  end


  describe "associations" do
    #it { should have_many(:goals) }
    #it { should have_many(:comments) }
  end

  describe "class methods" do
    describe "::find_by_credentials" do
      it "should return false if the user pass is wrong" do
        user.save
        user_check = User.find_by_credentials("test@test.com", "nottesting")
        expect(user_check).to be false
      end

      it "should return nil if the user is not found" do
        user.save
        user_check = User.find_by_credentials("nottest@test.com", "nottesting")
        expect(user_check).to be_nil
      end

      it "should return the user if it is found" do
        user.save!
        user_check = User.find_by_credentials("test@test.com", "testing")
        expect(user_check).to eq(user)
      end
    end

    describe "#reset_session_token!" do
      it "should reset the session token" do
        session_token_now = user.session_token
        user.reset_session_token!
        expect(user.session_token).not_to eq(session_token_now)
      end
    end

    describe "#ensure_session_token" do
      it "should ensure the session token exists" do
        expect(user.session_token).not_to be_nil
      end
    end

    describe "#ensure_activation_token" do
      it "should ensure the activation token exists" do
        expect(user.activation_token).not_to be_nil
      end
    end

    describe "#set_activated!" do
      it "should set the activated boolean to true" do
        user.set_activated!
        expect(user.activated).to be true
      end
    end

    describe "#is_password?" do
      it "should return false if pass is wrong" do
        expect(user.is_password?("nottesting")).to be false
      end
      it "should return true if pass is correct" do
        expect(user.is_password?("testing")).to be true
      end
    end
  end
end