# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Brands", type: :request do
  let!(:brand) { create(:brand, name: "oldname") }

  describe "PATCH /brand" do
    it "updates the brand name" do
      patch brand_path, params: { brand: { name: "newname" } }, as: :turbo_stream
      expect(brand.reload.name).to eq("newname")
    end

    it "does not update with wrong params" do
      patch brand_path, params: { brand: { name: "" } }, as: :turbo_stream
      expect(brand.reload.name).to eq("oldname")
      expect(response).to have_http_status(422)
    end
  end
end
