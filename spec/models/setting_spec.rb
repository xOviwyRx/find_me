# frozen_string_literal: true

require "rails_helper"

RSpec.describe Setting, type: :model do
  subject(:setting) { build(:setting) }

  describe "associations" do
    it { is_expected.to belong_to(:settable) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:key) }
    it { is_expected.to validate_presence_of(:value) }
  end
end
