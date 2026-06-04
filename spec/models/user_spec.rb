# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe "associations" do
    it { is_expected.to have_many(:user_brands).dependent(:destroy) }
    it { is_expected.to have_many(:brands).through(:user_brands) }
    it { is_expected.to have_many(:settings).dependent(:destroy) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  describe "normalization" do
    it "downcases, removes spaces, and cuts 'test' from text fields" do
      user = User.new(first_name: " Test John ", last_name: "Do e", email: "Test.User@Example.COM ")

      expect(user.first_name).to eq("john")
      expect(user.last_name).to eq("doe")
      expect(user.email).to eq(".user@example.com")
    end
  end
end
