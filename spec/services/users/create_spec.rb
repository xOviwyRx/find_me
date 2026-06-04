# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::Create, type: :service do
  let(:brand) { create(:brand) }

  it "creates a user and a brand membership" do
    result = described_class.result(
      brand: brand,
      attributes: { first_name: "john", last_name: "doe", email: "john@example.com" }
    )

    expect(result).to be_success
    expect(result.user).to be_persisted
    expect(brand.reload.users).to include(result.user)
    expect(brand.users_count).to eq(1)
  end

  it "does not create anything with invalid attributes" do
    result = described_class.result(
      brand: brand,
      attributes: { first_name: "", last_name: "", email: "" }
    )

    expect(result).to be_failure
    expect(result.user).not_to be_persisted
    expect(brand.reload.users_count).to eq(0)
  end
end
