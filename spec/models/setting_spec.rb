# frozen_string_literal: true

require "rails_helper"

RSpec.describe Setting, type: :model do
  subject(:setting) { build(:setting) }

  describe "associations" do
    it { is_expected.to belong_to(:brand).counter_cache(:users_count) }
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    subject { create(:setting) }

    it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:brand_id) }
  end

  describe "users_count counter cache" do
    it "increments the brand's users_count when a setting is created" do
      brand = create(:brand)

      expect { create(:setting, brand: brand) }
        .to change { brand.reload.users_count }.from(0).to(1)
    end

    it "decrements the brand's users_count when a setting is destroyed" do
      brand = create(:brand)
      setting = create(:setting, brand: brand)

      expect { setting.destroy }
        .to change { brand.reload.users_count }.from(1).to(0)
    end
  end
end
