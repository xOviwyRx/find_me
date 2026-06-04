# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserBrand, type: :model do
  subject(:user_brand) { build(:user_brand) }

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:brand).counter_cache(:users_count) }
    it { is_expected.to have_one(:setting).dependent(:destroy) }
  end

  describe "validations" do
    subject { create(:user_brand) }

    it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:brand_id) }
  end

  describe "users_count counter cache" do
    it "increments the brand's users_count when created" do
      brand = create(:brand)

      expect { create(:user_brand, brand: brand) }
        .to change { brand.reload.users_count }.from(0).to(1)
    end

    it "decrements the brand's users_count when destroyed" do
      brand = create(:brand)
      user_brand = create(:user_brand, brand: brand)

      expect { user_brand.destroy }
        .to change { brand.reload.users_count }.from(1).to(0)
    end
  end
end
