# frozen_string_literal: true

require "rails_helper"

RSpec.describe Brand, type: :model do
  subject(:brand) { build(:brand) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end
end
