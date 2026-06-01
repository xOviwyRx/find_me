# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Users", type: :request do
  let!(:brand) { create(:brand) }

  describe "POST /users" do
    it "creates a user for the brand and increments users_count" do
      expect {
        post users_path, params: { user: { first_name: "John", last_name: "Doe", email: "john@example.com" } }, as: :turbo_stream
      }.to change { brand.reload.users_count }.from(0).to(1)

      expect(brand.users.pluck(:email)).to eq([ "john@example.com" ])
    end

    it "does not create with wrong params" do
      expect {
        post users_path, params: { user: { first_name: "", last_name: "", email: "" } }, as: :turbo_stream
      }.not_to change { brand.reload.users_count }

      expect(response).to have_http_status(422)
    end
  end

  describe "DELETE /users/:id" do
    it "removes the user from the brand and decrements users_count" do
      user = brand.users.create!(first_name: "jane", last_name: "doe", email: "jane@example.com")

      expect {
        delete user_path(user), as: :turbo_stream
      }.to change { brand.reload.users_count }.from(1).to(0)

      expect(User.exists?(user.id)).to be(false)
    end
  end
end
