# frozen_string_literal: true

require "rails_helper"

RSpec.describe UsersHelper, type: :helper do
  describe "#user_display_name" do
    it "combines the user's name and email" do
      user = build(:user, first_name: "john", last_name: "doe", email: "john@example.com")

      expect(helper.user_display_name(user)).to eq("john doe (john@example.com)")
    end
  end
end
